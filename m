Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304AC314D13
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 09:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791625820; cv=none; b=Roa2H5TEkBgv0pihiyYkNhu/HppemKOlKKekjttSWrhMYniiKcKkkyRzso2yH/iN5/k1svlROTWgtH9NY2T303AzS/If8xyzTBc68HxP7KPDqaZfVoQ2WrOB9017D2vHNU+0qnMb31uGo2rC9Zi1EsYVPQdkhEneW/5BfVzzyTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791625820; c=relaxed/simple;
	bh=Pz9mjQaWBvzyAjmLpF1JmG7U6qn2e1XO0gz8PWDrPd4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Me6qCYZ0cXqfFEdRnGmiA82RpBk0X81m9yx8nvFFWmJvzdDHUgW4rOmCeuuL6skr2Bplid5uwsNAmOP+h1hVbwG7lwcMoKpyHc9wsh9mL22O8PBRLSW3HZlpJ6VV/lxbo2amkwbDhrdlFmWZmsvMdzRFfihZj7z/wYsb0V1oGbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZ0YiM91; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZ0YiM91"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a061a13884so4362095e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 02:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791625817; x=1792230617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jYxpsTzHFlYPOtsBqibfHOX9Q66IxX+cTOR1n+n+0sY=;
        b=ZZ0YiM91iI/JIGvhtoj998S+7gYK+f2OM2180bFhffJKwiOg2VG9atNbJb0g3GJsX9
         2ltaJm6EChNfC2vBbBhVVlpDTTbOjR823KiSzqokYK26VbSp9pHpGy7U9/Q9bGpqzjaZ
         zILS8nEORU0sOgE8JOK4IHdnm9te6O93rf8weptyn2Xq8VU/0Rbn8U/2ZntQ23thgq1p
         w6mxjrH+goqU2UldWL+ftWKFsZP1+pSlAnLKgwHet81LAEXs5O1iN4UQL3r9bQApgblw
         zhReVIImwTNez0AxuwIuyMoV2KpI3PktXk3NAVdQEORCkVAB++FEBbbeuGEQfx4/5CJe
         HNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791625817; x=1792230617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jYxpsTzHFlYPOtsBqibfHOX9Q66IxX+cTOR1n+n+0sY=;
        b=uBwjpX2tVabvQmA6KYi1xUwyRJrVjBcCf6MWbR1czF8+qQ3T4MyCJLT/kJ1ggcctJ0
         PMgI0dFWHoWx648Qnb4gY3iJwfssQOeq5BahTjaNP/qMZttP/+xNP9BNBZoW0j3HMgDN
         vL6RECqNJYDNUEPfoCV8vhc2YV/JChM3Dg3FAg1NOWkMxvPe3bshvpnBtmG58KZek7mk
         3PUy9PHXOVhgpqvwc/hyAajVsTjiHOsdnNJPYv52thB6LprvhRIw4y0CHeQHDTWv5wbe
         ybXb+hkAsZyKDfQMqHghEyv0nkyhLEJpFe/ArJffSCOuAjFSdIZmrpmnja5W7EfBuBD+
         XvLw==
X-Forwarded-Encrypted: i=1; AKwUvBxc6BJ4Ubrsi0JWlP4XxN07Lhg1PESTuyblz2pQqWAwaie+LYGwOTGo0ULyxhGX27isxVvxCyRS/hQtH0w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKNOIfPxSRwkGpROZp8XKGrP6gRIIUUKCrvNe94xxpurgrYObU
	Qcvo6Mx9WcJl4NFtXmPSar3w8Uk8dTT7gIWDg7hHEuJlLtYn9lgLYkS+
X-Gm-Gg: AYBFou0D4XHs2H9xaRPduwbfa14fKZpAb5zgDR6r5EI6g6hnd/8eLYK4YN+EHpi1gn1
	RinrkFl+7POVlUmZfwGnJAFtDI96opzj/hTqeOY29MVXKdCJaMXb5kky7A8j6jVk5EgTWzuNFgw
	VUngzJHVpWTDIrkfKjvI+s8WcZeFbK8dV+27TTaS1MlDsej451d/blXbK2MbXBZEwwPd3/1QH2t
	gRt3tVGy7NFmfIkUxrBtgaZVlr7NN91963qxRSePTX9zUnT10utuYcgDgE97dMnxOyaysmQG6SR
	rJAHH0HnD3WR7mLKvGHn8E5TIhImAyQz8c1ufK2WcwnH7FnQEIPNra8gI+de++Ky//rdgP4nq6q
	1fKvHyQiemETP2D96NsdXlIbHvtZxEv41+v7SsD4z/6OiDfHH1QUhDMlVEcmUnVHXPeT3e/uvxQ
	Vn2q9XxGj//cgg3898Epma4uOQf/Nq2fuiB5o2/Js1ekX2yemFacSB+0ujoe5QyfzmOmRev9jQt
	7F/YNKVda8aq1jISFgd8MNpoL2Zmiw=
X-Received: by 2002:a05:600c:8b82:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4a18e4b887amr84139465e9.27.1791625817058;
        Sat, 10 Oct 2026 02:50:17 -0700 (PDT)
Received: from nixos-office ([81.0.251.149])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf15691sm119149615e9.6.2026.10.10.02.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 02:50:16 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: ojeda@kernel.org,
	a.hindborg@kernel.org,
	nico@fluxnic.net,
	rdunlap@infradead.org,
	grahamr@qti.qualcomm.com,
	jakub.git@horky.net,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] kconfig: wrap long expressions in menuconfig
Date: Sat, 10 Oct 2026 10:50:01 +0100
Message-ID: <20261010095001.265759-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In an offline conversation, Miguel Ojeda reported that scrolling
horizontally in menuconfig's search to read RUST's dependencies has been
slowing down debugging.

Let's wrap expressions (like in the 'Depends on', 'Selected by', or
'Range' sections) between tokens at the end of the window, such that each
line begins with the same indentation. Ensure the '!' negation stays
attached to the left side of the option symbol, and keep the value
annotation attached to the right side when wrapping.

Note that the 'help' textbox uses the same expression printer as search,
so this has the side effect of improving the formatting in 'help', too.

In the future, we should consider a larger revamp that would wrap all text
in the search window, allowing us to safely disable horizontal scrolling.

Assisted-by: LLM
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 scripts/kconfig/expr.c  | 24 ++++++++++++++++--------
 scripts/kconfig/lkc.h   |  5 ++++-
 scripts/kconfig/mconf.c |  2 +-
 scripts/kconfig/menu.c  |  7 ++++++-
 scripts/kconfig/nconf.c |  2 +-
 scripts/kconfig/util.c  |  1 +
 6 files changed, 29 insertions(+), 12 deletions(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 2b91d16bf14f..f1e100c3c755 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -1155,21 +1155,28 @@ static void expr_print_gstr_helper(void *data, struct symbol *sym, const char *s
 	if (sym)
 		sym_str = sym_get_string_value(sym);
 
-	if (gs->max_width) {
+	if (gs->max_width && !strchr(str, '\n')) {
 		unsigned extra_length = strlen(str);
 		const char *last_cr = strrchr(gs->s, '\n');
 		unsigned last_line_length;
-
-		if (sym_str)
+		/* Ensure the value annotation stays attached to the symbol on wrap */
+		if (sym_str && sym->type != S_UNKNOWN)
 			extra_length += 4 + strlen(sym_str);
 
-		if (!last_cr)
-			last_cr = gs->s;
+		last_line_length = strlen(last_cr ? last_cr + 1 : gs->s);
 
-		last_line_length = strlen(gs->s) - (last_cr - gs->s);
+		if (last_line_length > gs->indent &&
+		    last_line_length + extra_length > gs->max_width) {
+			/* Ensure '!' stays attached to the symbol on wrap */
+			char *last = gs->s + strlen(gs->s) - 1;
+			bool negated = *last == '!';
 
-		if ((last_line_length + extra_length) > gs->max_width)
-			str_append(gs, "\\\n");
+			if (negated)
+				*last = '\0';
+			str_printf(gs, "\n%*s%s", gs->indent, "",
+					   negated ? "!" : "");
+			str += strspn(str, " ");
+		}
 	}
 
 	str_append(gs, str);
@@ -1209,5 +1216,6 @@ static void expr_print_revdep(struct expr *e,
 void expr_gstr_print_revdep(struct expr *e, struct gstr *gs,
 			    tristate pr_type, const char *title)
 {
+	gs->indent = strlen("  - ");
 	expr_print_revdep(e, expr_print_gstr_helper, gs, pr_type, &title);
 }
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index bbc99f75b416..f5fe3731db0c 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -65,6 +65,8 @@ struct gstr {
 	* wrapped not to exceed the max_width value
 	*/
 	int max_width;
+	/* Indentation of wrapped expression lines. */
+	int indent;
 };
 struct gstr str_new(void);
 void str_free(struct gstr *gs);
@@ -101,7 +103,8 @@ const char *menu_get_prompt(const struct menu *menu);
 struct menu *menu_get_parent_menu(struct menu *menu);
 struct menu *menu_get_menu_or_parent_menu(struct menu *menu);
 int get_jump_key_char(void);
-struct gstr get_relations_str(struct symbol **sym_arr, struct list_head *head);
+struct gstr get_relations_str(struct symbol **sym_arr, struct list_head *head,
+				int max_width);
 void menu_get_ext_help(struct menu *menu, struct gstr *help);
 void menu_dump(void);
 
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index b8b7bba84a65..fb87f944d3f9 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -431,7 +431,7 @@ static void search_conf(void)
 		struct jump_key *pos, *tmp;
 
 		jump_key_char = 0;
-		res = get_relations_str(sym_arr, &head);
+		res = get_relations_str(sym_arr, &head, getmaxx(stdscr) - 10);
 		set_subtitle();
 		dres = show_textbox_ext("Search Results", str_get(&res), 0, 0,
 					&vscroll, &hscroll,
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index bda3e2650216..31f12cfe981b 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -668,6 +668,7 @@ static void get_dep_str(struct gstr *r, const struct expr *expr,
 {
 	if (!expr_is_yes(expr)) {
 		str_append(r, prefix);
+		r->indent = strlen(prefix);
 		expr_gstr_print(expr, r);
 		str_append(r, "\n");
 	}
@@ -743,6 +744,7 @@ static void get_symbol_props_str(struct gstr *r, struct symbol *sym,
 	bool hit = false;
 	struct property *prop;
 
+	r->indent = strlen(prefix);
 	for_all_properties(sym, prop, tok) {
 		if (!hit) {
 			str_append(r, prefix);
@@ -772,6 +774,7 @@ static void get_symbol_str(struct gstr *r, struct symbol *sym,
 			prop = sym_get_range_prop(sym);
 			if (prop) {
 				str_printf(r, "Range : ");
+				r->indent = strlen("Range : ");
 				expr_gstr_print(prop->expr, r);
 				str_append(r, "\n");
 			}
@@ -810,12 +813,14 @@ static void get_symbol_str(struct gstr *r, struct symbol *sym,
 	str_append(r, "\n\n");
 }
 
-struct gstr get_relations_str(struct symbol **sym_arr, struct list_head *head)
+struct gstr get_relations_str(struct symbol **sym_arr, struct list_head *head,
+			int max_width)
 {
 	struct symbol *sym;
 	struct gstr res = str_new();
 	int i;
 
+	res.max_width = max_width;
 	for (i = 0; sym_arr && (sym = sym_arr[i]); i++)
 		get_symbol_str(&res, sym, head);
 	if (!i)
diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 521700ed7152..fc39830a850b 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -741,7 +741,7 @@ static void search_conf(void)
 			.target = NULL,
 		};
 		jump_key_char = 0;
-		res = get_relations_str(sym_arr, &head);
+		res = get_relations_str(sym_arr, &head, 0);
 		dres = show_scroll_win_ext(main_window,
 				"Search Results", str_get(&res),
 				&vscroll, &hscroll,
diff --git a/scripts/kconfig/util.c b/scripts/kconfig/util.c
index 0809aa061b6a..1de072e45ca3 100644
--- a/scripts/kconfig/util.c
+++ b/scripts/kconfig/util.c
@@ -77,6 +77,7 @@ struct gstr str_new(void)
 	gs.s = xmalloc(sizeof(char) * 64);
 	gs.len = 64;
 	gs.max_width = 0;
+	gs.indent = 0;
 	strcpy(gs.s, "\0");
 	return gs;
 }
-- 
2.55.0

