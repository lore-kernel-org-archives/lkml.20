Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA4A43DED4
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 15:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791645091; cv=none; b=moaHPs2+NCUgjFXkff6OZKgI8Sgl5K356JtUtPGOHMs+OnWdUi3QdxDvUFNc3fDvPBr5/7DHD+/sHCZ8A5usJSOXnTw6EGzx0gHyO7dEHClHtdhGkp3L4iqg73anDKGuoSIqpcidcTc2+dYo91dWe6WQJhC8RiFJmoIQExROqQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791645091; c=relaxed/simple;
	bh=ySFMmnG03VyCVo++5cjAql0XF8iCPLMUx2K9YgY79NU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N3OV7MHu+Z1lHo9LGoXd4uqCw7JzTXlfd+N6DUijdLgOPBrbxPqo7JapRXWgehYefLJ1ywuZvuzAraKsfA5YrvDY2rUQ2P8cLY8i7LhWYyvhK6Mk4Qad2zCUHNflG8Tz2e6OF7DFHPYwFQuPFEYxB2F5jxWlhQMpqc5J2bimYXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jKvUJhTG; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jKvUJhTG"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e81738d24eso5293545ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791645088; x=1792249888; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9X+Q9LbgNCTDZTRZJ4kWRD2cLuOCk5g/aCYKk+DvIeA=;
        b=jKvUJhTGOLbJEYN+x1680kwoKvwO7EYhQ3UkbcI3stii8ZdTcOzYfd7C8bPatkqX1q
         CPTvZTh4G9K2Di0RnMhdGmV1U2VH2bvPdTawde6PYvF4bzV7ad9qmVw5TZI6j/NT12Mq
         tT7+cdy1YKJ1ZVbTnPJc3Wwk7VMN1yEF/4dWlJnWxgCQvElFRAOKSOensPGpkSWkm3tJ
         356Z3Ys3aZMybSAcXD3J/3wf1dylg6Vdjg2D0vHzIUsOY1apBNDb1m8RPFRviD83wT+7
         rrBBgp7rRLMZiDi1SZeLA9NkBvkwmPKm+PV35x3GSTp9R/lRmCdIlwSQ7uL40USOLO/f
         g07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791645088; x=1792249888;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9X+Q9LbgNCTDZTRZJ4kWRD2cLuOCk5g/aCYKk+DvIeA=;
        b=Kkrxp2nZzyoB6bOphleuWDVdwzi2qG39OlXcINGykLoHeBmVoxG8pzoUrxbu3Qtv9H
         2lhGtxClBlPZAhlvTdLKastav1IHktY3qiNXvjTxhbbZoKBYSPoJsZZTiY34mgHM2B09
         vdEINhT3jClga+oarmXNIkwZiNFwDnqCdEsUA6DfVFTxwCc0O5AmJHdcc+wuy1OOkWRq
         wNNp2JEGA5lfz1JfI28l5sy3d+78uhwXmE82WGsHs1J4S9JAa43/haF+HTZGQEdowIJO
         IPbS6aFStikBpLyKykzTZObda3VywSkLQFpuxdugQV4lwpPw29yNg8/NtCU2R6PZD6kt
         4lZg==
X-Gm-Message-State: AFq9FYJfu+VsSMA196yXmsynGbedGvtAsGJ5HxhOxpACBBQ5zte9uPbA
	5LRuy3+vCavBPvr5SlcvzeIXIoQcdLY8j+QlmkEx0PMEUB0DXzc3ivQb1XAyt+P8
X-Gm-Gg: AYBFou3H8aDOzsKLIPoGTnuceuZGFTB1+KXWgM1LswO/qQc+uaFmKpsyX+EM40x50zp
	ZmkdX1kav5uTfwMnVlyqeEvKPg7B7amUWc2CtMVrILudk7WqV8slUm7vYwrpLKihbd8tsi9oDZO
	qPPq0Fw9GIdrzPImgxq8sjV+kte47J0AbRoj2KgC4ajGEtMIUuZUXIZUsxj0sEdjs1gNXFyfvYC
	OcIN2KqBUKRJm3twT0onphjyVNEcF3ksVwSuChMGqAueQoxJZsMeIPMO1vadn+JJjxYnx+sQV6l
	He9GubFPP6Q5eG4q7TVORZyA8nsNbMC0jS63UBz8lLmiTqc60NlOdipKK9glvks4r1fMk4hWjDv
	ud9THvFkR23naoP2woRuEsQVvaaGqC4Z2rkZuQFYIdhZnv4/MOyCaxn2a+Es2mDNPQpWaMB9xMJ
	Wpy305FbAyefjejcRK4DZFJx8wS8i/DOQxSBuVckEi0xEZV0711pICJ9WWX7c0Xl4O12oF
X-Received: by 2002:a17:902:f789:b0:2e2:e61d:85ec with SMTP id d9443c01a7336-2e842f34e0cmr40929785ad.54.1791645088257;
        Sat, 10 Oct 2026 08:11:28 -0700 (PDT)
Received: from gmail.com ([154.91.42.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e4eb2sm24087245ad.74.2026.10.10.08.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 08:11:27 -0700 (PDT)
Date: Sat, 10 Oct 2026 15:11:22 +0000
From: Zuo An <zuoan.penguin@gmail.com>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: show number of search results in search UI
Message-ID: <aspVmnam3QL_DRYV@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

When searching for symbols in nconfig/menuconfig, the search
results popup will now display a count of the results
in the title bar, e.g. "Search Results (42)".

This helps the user to gauge the number of matches quickly and
refine their search if needed, rather than having to scroll down
by an indefinite amount (especially for nconfig's UI which lacks
a display of the scrolling progress).

Signed-off-by: Zuo An <zuoan.penguin@gmail.com>
---
 scripts/kconfig/lkc_proto.h |  2 +-
 scripts/kconfig/mconf.c     | 10 ++++++++--
 scripts/kconfig/nconf.c     | 10 ++++++++--
 scripts/kconfig/qconf.cc    |  2 +-
 scripts/kconfig/symbol.c    |  4 +++-
 5 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
index 8914b4e8f2a8..224acc142769 100644
--- a/scripts/kconfig/lkc_proto.h
+++ b/scripts/kconfig/lkc_proto.h
@@ -21,7 +21,7 @@ bool conf_errors(void);
 struct symbol * sym_lookup(const char *name, int flags);
 struct symbol * sym_find(const char *name);
 void print_symbol_for_listconfig(struct symbol *sym);
-struct symbol ** sym_re_search(const char *pattern);
+struct symbol ** sym_re_search(const char *pattern, int *sym_cnt);
 const char * sym_type_name(enum symbol_type type);
 void sym_calc_value(struct symbol *sym);
 bool sym_dep_errors(void);
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index b8b7bba84a65..f37c3f8e1f4d 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -384,8 +384,10 @@ static void show_help(struct menu *menu)
 static void search_conf(void)
 {
 	struct symbol **sym_arr;
+	int sym_cnt;
 	struct gstr res;
 	struct gstr title;
+	struct gstr res_title;
 	char *dialog_input;
 	int dres, vscroll = 0, hscroll = 0;
 	bool again;
@@ -422,7 +424,7 @@ static void search_conf(void)
 	stpart.text = str_get(&sttext);
 	list_add_tail(&stpart.entries, &trail);
 
-	sym_arr = sym_re_search(dialog_input);
+	sym_arr = sym_re_search(dialog_input, &sym_cnt);
 	do {
 		LIST_HEAD(head);
 		struct search_data data = {
@@ -433,9 +435,13 @@ static void search_conf(void)
 		jump_key_char = 0;
 		res = get_relations_str(sym_arr, &head);
 		set_subtitle();
-		dres = show_textbox_ext("Search Results", str_get(&res), 0, 0,
+
+		res_title = str_new();
+		str_printf(&res_title, "Search Results (%d)", sym_cnt);
+		dres = show_textbox_ext(str_get(&res_title), str_get(&res), 0, 0,
 					&vscroll, &hscroll,
 					handle_search_keys, &data);
+
 		again = false;
 		if (dres >= '1' && dres <= '9') {
 			assert(data.target != NULL);
diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 521700ed7152..e3b25940b931 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -700,8 +700,10 @@ static int do_exit(void)
 static void search_conf(void)
 {
 	struct symbol **sym_arr;
+	int sym_cnt;
 	struct gstr res;
 	struct gstr title;
+	struct gstr res_title;
 	char *dialog_input;
 	int dres, vscroll = 0, hscroll = 0;
 	bool again;
@@ -732,7 +734,7 @@ static void search_conf(void)
 	if (strncasecmp(dialog_input_result, CONFIG_, strlen(CONFIG_)) == 0)
 		dialog_input += strlen(CONFIG_);
 
-	sym_arr = sym_re_search(dialog_input);
+	sym_arr = sym_re_search(dialog_input, &sym_cnt);
 
 	do {
 		LIST_HEAD(head);
@@ -742,10 +744,14 @@ static void search_conf(void)
 		};
 		jump_key_char = 0;
 		res = get_relations_str(sym_arr, &head);
+
+		res_title = str_new();
+		str_printf(&res_title, "Search Results (%d)", sym_cnt);
 		dres = show_scroll_win_ext(main_window,
-				"Search Results", str_get(&res),
+				str_get(&res_title), str_get(&res),
 				&vscroll, &hscroll,
 				handle_search_keys, &data);
+
 		again = false;
 		if (dres >= '1' && dres <= '9') {
 			assert(data.target != NULL);
diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index b02ead7a3f98..8f51dc55226d 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1245,7 +1245,7 @@ void ConfigSearchWindow::search(void)
 	list->clear();
 	info->clear();
 
-	result = sym_re_search(editField->text().toLatin1());
+	result = sym_re_search(editField->text().toLatin1(), nullptr);
 	if (!result)
 		return;
 	for (p = result; *p; p++) {
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 7e81b3676ee9..31f927bd563a 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -1020,7 +1020,7 @@ static int sym_rel_comp(const void *sym1, const void *sym2)
 	return strcmp(s1->sym->name, s2->sym->name);
 }
 
-struct symbol **sym_re_search(const char *pattern)
+struct symbol **sym_re_search(const char *pattern, int *sym_cnt)
 {
 	struct symbol *sym, **sym_arr = NULL;
 	struct sym_match *sym_match_arr = NULL;
@@ -1065,6 +1065,8 @@ struct symbol **sym_re_search(const char *pattern)
 			sym_arr[i] = sym_match_arr[i].sym;
 		sym_arr[cnt] = NULL;
 	}
+	if (sym_cnt)
+		*sym_cnt = cnt;
 sym_re_search_free:
 	/* sym_match_arr can be NULL if no match, but free(NULL) is OK */
 	free(sym_match_arr);
-- 
2.56.0

