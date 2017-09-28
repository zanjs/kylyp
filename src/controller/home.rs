use std::collections::HashMap;
use std::path::{Path, PathBuf};
use rocket::request::Request;
use rocket::response::NamedFile;
use rocket_contrib::Template;
use controller::user::{UserId,UserOr};
use handler::content::{Uarticle,article_count,article_count_tag,article_count_no_comment,article_list_no_comment,article_list,article_list_tag,get_unread_message_count};
use model::pg::ConnPg;
use form_checker::{Validator, Checker, Rule, I64, CheckerOption};


pub const PAGE_SIZE: i32 = 15;

#[derive(Serialize)]
struct TemplateContext {
    datas: Vec<Uarticle>,
    username: String,
    user_id: i32,
    count: i32,
    pages: Vec<i32>,
    previous_page: i32,
    next_page: i32,
    tag: String,
}
#[derive(Serialize)]
struct TemplateDoc {
    username: String,
    user_id: i32,
}
#[derive(FromForm,Debug)]
pub struct DataPage {
    pub page: i32,
}
#[derive(FromForm,Debug)]
pub struct DataTag {
    pub tag: String,
}

#[get("/<tag>",rank = 7)]
pub fn index_tag(conn_pg: ConnPg, tag: String) -> Template {
    let page: i32 =  1;
    let article_count: i32;
    if tag == "NoComment" {
        article_count = article_count_no_comment(&conn_pg);
    }else {
        article_count = article_count_tag(&conn_pg, &tag);
    }
    let mut pcount = (article_count + PAGE_SIZE - 1) / PAGE_SIZE;
    let mut pages: Vec<i32> = vec![];
    while pcount > 0 {
        pages.push(pcount);
        pcount -= 1;
    }
    pages.sort();
    let page_count = pages.len() as i32;
    let datas: Vec<Uarticle>;
    if tag == "NoComment" {
        datas = article_list_no_comment(&conn_pg, page);
    }else {
        datas = article_list_tag(&conn_pg, page, &tag);
    }
    let previous_page = if page - 1 < 1 {1} else {page - 1};
    let next_page = if page + 1 > page_count {page_count} else {page + 1};
    let context = TemplateContext {
        datas: datas,
        username: "".to_string(),
        user_id: 0,
        count: 0,
        pages: pages,
        previous_page: previous_page,
        next_page: next_page,
        tag: tag,
    };
    Template::render("index", &context)
}

#[get("/<tag>?<data_page>",rank = 6)]
pub fn index_page_tag(conn_pg: ConnPg, tag: String, data_page: DataPage) -> Template {
    let page: i32 =  data_page.page;
    let article_count: i32;
    if tag == "NoComment" {
        article_count = article_count_no_comment(&conn_pg);
    }else {
        article_count = article_count_tag(&conn_pg, &tag);
    }
    let mut pcount = (article_count + PAGE_SIZE - 1) / PAGE_SIZE;
    let mut pages: Vec<i32> = vec![];
    while pcount > 0 {
        pages.push(pcount);
        pcount -= 1;
    }
    pages.sort();
    let page_count = pages.len() as i32;
    let previous_page = if page - 1 < 1 {1} else {page - 1};
    let next_page = if page + 1 > page_count {page_count} else {page + 1};
    let datas: Vec<Uarticle>;
    if tag == "NoComment" {
        datas = article_list_no_comment(&conn_pg, page);
    }else {
        datas = article_list_tag(&conn_pg, page, &tag);
    }
    let context = TemplateContext {
        datas: datas,
        username: "".to_string(),
        user_id: 0,
        count: 0,
        pages: pages,
        previous_page: previous_page,
        next_page: next_page,
        tag: tag,
    };
    Template::render("index", &context)
}

#[get("/<tag>",rank = 5)]
pub fn index_user_tag(conn_pg: ConnPg, tag: String, user: UserOr, user_id: UserId) -> Template {
    let count = get_unread_message_count(&conn_pg, user_id.0);
    let page: i32 =  1;
    let article_count: i32;
    if tag == "NoComment" {
        article_count = article_count_no_comment(&conn_pg);
    }else {
        article_count = article_count_tag(&conn_pg, &tag);
    }
    let mut pcount = (article_count + PAGE_SIZE - 1) / PAGE_SIZE;
    let mut pages: Vec<i32> = vec![];
    while pcount > 0 {
        pages.push(pcount);
        pcount -= 1;
    }
    pages.sort();
    let page_count = pages.len() as i32;
    let datas: Vec<Uarticle>;
    if tag == "NoComment" {
        datas = article_list_no_comment(&conn_pg, page);
    }else {
        datas = article_list_tag(&conn_pg, page, &tag);
    }
    let previous_page = if page - 1 < 1 {1} else {page - 1};
    let next_page = if page + 1 > page_count {page_count} else {page + 1};
    let context = TemplateContext {
        datas: datas,
        username: user.0,
        user_id: user_id.0,
        count: count,
        pages: pages,
        previous_page: previous_page,
        next_page: next_page,
        tag: tag,
    };
    Template::render("index", &context)
}

#[get("/<tag>?<data_page>")]
pub fn index_user_page_tag(conn_pg: ConnPg, tag: String, data_page: DataPage, user: UserOr, user_id: UserId) -> Template {
    let count = get_unread_message_count(&conn_pg, user_id.0);
    let page: i32 =  data_page.page;
    let article_count: i32;
    if tag == "NoComment" {
        article_count = article_count_no_comment(&conn_pg);
    }else {
        article_count = article_count_tag(&conn_pg, &tag);
    }
    let mut pcount = (article_count + PAGE_SIZE - 1) / PAGE_SIZE;
    let mut pages: Vec<i32> = vec![];
    while pcount > 0 {
        pages.push(pcount);
        pcount -= 1;
    }
    pages.sort();
    let page_count = pages.len() as i32;
    let previous_page = if page - 1 < 1 {1} else {page - 1};
    let next_page = if page + 1 > page_count {page_count} else {page + 1};
    let datas: Vec<Uarticle>;
    if tag == "NoComment" {
        datas = article_list_no_comment(&conn_pg, page);
    }else {
        datas = article_list_tag(&conn_pg, page, &tag);
    }
    let context = TemplateContext {
        datas: datas,
        username: user.0,
        user_id: user_id.0,
        count: count,
        pages: pages,
        previous_page: previous_page,
        next_page: next_page,
        tag: tag,
    };
    Template::render("index", &context)
}

#[get("/",rank = 4)]
pub fn index(conn_pg: ConnPg) -> Template {
    let page: i32 =  1;
    let article_count = article_count(&conn_pg);
    let mut pcount = (article_count + PAGE_SIZE - 1) / PAGE_SIZE;
    let mut pages: Vec<i32> = vec![];
    while pcount > 0 {
        pages.push(pcount);
        pcount -= 1;
    }
    pages.sort();
    let page_count = pages.len() as i32;
    let datas = article_list(&conn_pg, page);
    let previous_page = if page - 1 < 1 {1} else {page - 1};
    let next_page = if page + 1 > page_count {page_count} else {page + 1};
    let context = TemplateContext {
        datas: datas,
        username: "".to_string(),
        user_id: 0,
        count: 0,
        pages: pages,
        previous_page: previous_page,
        next_page: next_page,
        tag: "".to_string(),
    };
    Template::render("index", &context)
}

#[get("/?<data_page>",rank = 3)]
pub fn index_page(conn_pg: ConnPg, data_page: DataPage) -> Template {
    let page: i32 =  data_page.page;
    let article_count = article_count(&conn_pg);
    let mut pcount = (article_count + PAGE_SIZE - 1) / PAGE_SIZE;
    let mut pages: Vec<i32> = vec![];
    while pcount > 0 {
        pages.push(pcount);
        pcount -= 1;
    }
    pages.sort();
    let page_count = pages.len() as i32;
    let datas = article_list(&conn_pg, page);
    let previous_page = if page - 1 < 1 {1} else {page - 1};
    let next_page = if page + 1 > page_count {page_count} else {page + 1};
    let context = TemplateContext {
        datas: datas,
        username: "".to_string(),
        user_id: 0,
        count: 0,
        pages: pages,
        previous_page: previous_page,
        next_page: next_page,
        tag: "".to_string(),
    };
    Template::render("index", &context)
}

#[get("/",rank = 2)]
pub fn index_user(conn_pg: ConnPg, user: UserOr, user_id: UserId) -> Template {
    let count = get_unread_message_count(&conn_pg, user_id.0);
    let page: i32 =  1;
    let article_count = article_count(&conn_pg);
    let mut pcount = (article_count + PAGE_SIZE - 1) / PAGE_SIZE;
    let mut pages: Vec<i32> = vec![];
    while pcount > 0 {
        pages.push(pcount);
        pcount -= 1;
    }
    pages.sort();
    let page_count = pages.len() as i32;
    let datas = article_list(&conn_pg,page);
    let previous_page = if page - 1 < 1 {1} else {page - 1};
    let next_page = if page + 1 > page_count {page_count} else {page + 1};
    let context = TemplateContext {
        datas: datas,
        username: user.0,
        user_id: user_id.0,
        count:count,
        pages: pages,
        previous_page: previous_page,
        next_page: next_page,
        tag: "".to_string(),
    };
     
    Template::render("index", &context)
}
#[get("/?<data_page>")]
pub fn index_user_page(conn_pg: ConnPg, user: UserOr, user_id: UserId, data_page: DataPage) -> Template {
    let count = get_unread_message_count(&conn_pg, user_id.0);
    let page: i32 =  data_page.page;
    let article_count = article_count(&conn_pg);
    let mut pcount = (article_count + PAGE_SIZE - 1) / PAGE_SIZE;
    let mut pages: Vec<i32> = vec![];
    while pcount > 0 {
        pages.push(pcount);
        pcount -= 1;
    }
    pages.sort();
    let page_count = pages.len() as i32;
    let datas = article_list(&conn_pg,page);
    let previous_page = if page - 1 < 1 {1} else {page - 1};
    let next_page = if page + 1 > page_count {page_count} else {page + 1};
    let context = TemplateContext {
        datas: datas,
        username: user.0,
        user_id: user_id.0,
        count:count,
        pages: pages,
        previous_page: previous_page,
        next_page: next_page,
        tag: "".to_string(),
    };
     
    Template::render("index", &context)
}
#[get("/wiki",rank = 2)]
pub fn wiki() -> Template {
    let mut context = HashMap::new();
    context.insert("No login user", "".to_string());
    Template::render("wiki", &context)
}

#[get("/wiki")]
pub fn wiki_user(user: UserOr, user_id: UserId) -> Template {
    let context = TemplateDoc {
        username: user.0,
        user_id: user_id.0,
    };
    Template::render("wiki", &context)
}

#[get("/more",rank = 2)]
pub fn more() -> Template {
    let mut context = HashMap::new();
    context.insert("No login user", "".to_string());
    Template::render("more", &context)
}

#[get("/more")]
pub fn more_user(user: UserOr, user_id: UserId) -> Template {
    let context = TemplateDoc {
        username: user.0,
        user_id: user_id.0,
    };
    Template::render("more", &context)
}


#[get("/<file..>",rank = 9)]
pub fn public(file: PathBuf) -> Option<NamedFile> {
    NamedFile::open(Path::new("public/").join(file)).ok()
}

#[catch(404)]
pub fn not_found(req: &Request) -> Template {
    let mut map = HashMap::new();
    map.insert("path", req.uri().as_str());
    Template::render("error/404", &map)
}
