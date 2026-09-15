Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A994A3F20
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 21:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789506917; cv=none; b=kxyrSSIz9R7DIkuRxafp+oUzExjSj6vjWFHlwdM8PFMRgEyHw1YQAfRB5APlSNYiib6KJuwtVqeguAnEqynUUlb47vzx/TjF+DpXK/cslOaqmTaCjxLbheri374+CqPZ0mIcKWSts++wFbW+04ZysxwvPVSnDCX7G1P7kfVhPhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789506917; c=relaxed/simple;
	bh=P4GnjYvjDdXvVLPEMZ2Mvy6/y1ufQV2xiluJDL+kMZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a8c+Z+1VO31j5xF5v+pVTL3DyLcXhNmchVWAslHizwJmA6LS/e1DjYAxGYfMOY2oKGg6RoDZxdIWmuzJ/ICIljzbRx4S+5DHzxPLpamzGzUL5bgPZFFne8F3AKRwqkw4nxdhehBp0cfqej2SHcIA/1NStNu14SXqBm42fWr6vCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OLFnO8DN; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OLFnO8DN"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so1752445e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789506914; x=1790111714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pp18lNSpLvIszH6E7VlmBrpqKQlpHF+L0iP+RB9/Ozo=;
        b=OLFnO8DN88YVgI/pcWelaTakmEZ7LvizgCHvnEZ7wx3Pju5TQW6f5zSP3+/iVlm65F
         1Udplu4vA9UkhaUG2Q8Bm6Km8ecanss3I5PKAGZKBlxeFl1az3b22Qw+o+PYzeiRsZK3
         5kDQSGB2bbKPri2S0TiNRMgIJMkzSVgEjinnQNP7mF2xKLu9f1C3ZhdIEIyYCbNDD9qc
         sYgYs4C7S+quced2SdX3ErW7uZNz19UAZO739ne0bNL3EHlipjzMSQ5idW2iKIrXUsQ+
         1r9PjE9vsTiZ9TM9aevkR1ghOPmpjnWhZchEMJjndzd04Z2BxUSZWEQ5waD6o5dQ5wdr
         jSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789506914; x=1790111714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pp18lNSpLvIszH6E7VlmBrpqKQlpHF+L0iP+RB9/Ozo=;
        b=JAOHAQjN7RndqX16SMuq0yhUNdp1VQklt1MeQrHjeiaGGKbTp3ZvCm8bJReYFe2f7L
         4ognGbzI+u0ISIahme7YCB0rmM4wRuf9SR1nYyHO5kdwdbybMEUsvrrh+7XdnIZMmcdG
         GtLt+mSjNLqxlgEGtXk2UO0ydc4nvBhMF7zc0bj3i75D8QXUuK6xb72yHeXfw/2RQCtN
         no8I3J1RMcRvlggCvCzyrYgpOrl7RxhxflYblFJtMPSm0IEiN6iS/OYMZgozjzC03i2/
         XbXuFVrys3Nh6zQPs0XujJrXOHYOLTgl7qbqU5FbnKFGjMXXvk/+1GM8hAF9s32sor2y
         wiUQ==
X-Forwarded-Encrypted: i=1; AKwUvBysXlJzW/sO6Pckz4gErPK2hgQSmq+gfyrbelsegghVyMRL2i3s+3ZGlQrxT9Qr6nmg3JAbOIiq2ygMTjk=@vger.kernel.org
X-Gm-Message-State: AFuF++lvtdjLufb4benoCzBPPrIhR02siglMVFOHakBXMcEBsuE6AGv+
	PC/zs+0Lp5K3ruVewKMoxvXrDmIXSFOYlc0c8bUoDU4U9/qyVLwyuEJma4IEXAHE
X-Gm-Gg: AYBFou1ovqCqN3qXg/swlpDTYpy9a8hk3wPrDFhpKrhbUAxz0rd2KfSdeQDyxVmQlDT
	7tPWl9SKnf5hsxxlpYrR6Ub7k4EmbMi5GOrbgYttpv7G4dwOhDjTn3FNpx1wdy+lnpjOTawJ2As
	Ib1IHlhdUmJVgUExKPdNXWs4cQol5Lggv596sfIh7I+MoZgfyPnO6ROni6o7ONgBuUdVCiXWx12
	jteclAsODigPF4zbO+LqgFEqWhphK7CslfY+W9r9+Sxw3TC4dGbFP5MCXWGBV1ZZqxmmEGcxYzK
	39Ib1koFDg1TQrzl1gJuw+vbtrGs7HaT7yncpi2gamlIL/8wJLmUzkXgCz3j59KlHGWpx50XLWj
	dz5zt/+F/nD7wtcZti4wNChiI4gLW4Lt2lFxvQZL2usvImuGb9H/DwJEuHCuMW82ftYnzcuy0hq
	w2YoOXLPRdq3aiuNnnVXpC+WY0kQK25AqHxWBAkA1iCVzlcezyIQU8rcr6RJ5IpFemvQVdfSdER
	LIdi1btQE1Q6ZGqAtfHkziXzAqq6qg06sTy
X-Received: by 2002:a05:600c:34c1:b0:49c:e3c3:5efd with SMTP id 5b1f17b1804b1-49e7a67e4d5mr228611075e9.9.1789506914033;
        Tue, 15 Sep 2026 14:15:14 -0700 (PDT)
Received: from nixos-office ([2001:8a0:e962:d100:b3c:e4b2:2d5f:e949])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83b1ba9bsm24804695e9.15.2026.09.15.14.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 14:15:13 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: nico@fluxnic.net,
	rdunlap@infradead.org,
	grahamr@qti.qualcomm.com,
	kees@kernel.org,
	pengpeng@iscas.ac.cn,
	vegard.nossum@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v2 1/5] kconfig: promote invalid numeric reference from warning to error
Date: Tue, 15 Sep 2026 22:15:04 +0100
Message-ID: <20260915211508.291790-2-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915211508.291790-1-julianbraha@gmail.com>
References: <20260915211508.291790-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Kconfig interpreter already warns if a numeric option attempts to use
a non-numeric option (bool, tristate, or string) to set its value (for
example, with a 'default' or 'range').

Since there is nowhere in the tree that attempts this, we can safely
promote this check from warning to error.

Assisted-by: LLM
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 scripts/kconfig/lkc.h                         |  2 +-
 scripts/kconfig/menu.c                        | 39 ++++++----
 scripts/kconfig/parser.y                      |  2 +-
 .../tests/err_num_non_numeric_ref/Kconfig     | 75 +++++++++++++++++++
 .../tests/err_num_non_numeric_ref/__init__.py |  9 +++
 .../err_num_non_numeric_ref/expected_stderr   | 14 ++++
 6 files changed, 126 insertions(+), 15 deletions(-)
 create mode 100644 scripts/kconfig/tests/err_num_non_numeric_ref/Kconfig
 create mode 100644 scripts/kconfig/tests/err_num_non_numeric_ref/__init__.py
 create mode 100644 scripts/kconfig/tests/err_num_non_numeric_ref/expected_stderr

diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index 7e6f6ca299cf..bbc99f75b416 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -89,7 +89,7 @@ struct property *menu_add_prompt(enum prop_type type, const char *prompt,
 				 struct expr *dep);
 void menu_add_expr(enum prop_type type, struct expr *expr, struct expr *dep);
 void menu_add_symbol(enum prop_type type, struct symbol *sym, struct expr *dep);
-void menu_finalize(void);
+int menu_finalize(void);
 void menu_set_type(int type);
 
 extern struct menu rootmenu;
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 9c079e92a9ed..99a57ce0fdc9 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -240,11 +240,12 @@ static int menu_validate_number(struct symbol *sym, struct symbol *sym2)
 	       (sym2->type == S_UNKNOWN && sym_string_valid(sym, sym2->name));
 }
 
-static void sym_check_prop(struct symbol *sym)
+static int sym_check_prop(struct symbol *sym)
 {
 	struct property *prop;
 	struct symbol *sym2;
 	char *use;
+	int errors = 0;
 
 	for (prop = sym->prop; prop; prop = prop->next) {
 		switch (prop->type) {
@@ -258,10 +259,13 @@ static void sym_check_prop(struct symbol *sym)
 				break;
 			sym2 = prop_get_symbol(prop);
 			if (sym->type == S_HEX || sym->type == S_INT) {
-				if (!menu_validate_number(sym, sym2))
-					prop_warn(prop,
-					    "'%s': number is invalid",
-					    sym->name);
+				if (!menu_validate_number(sym, sym2)) {
+					fprintf(stderr,
+						"%s:%d: error: '%s': number is invalid\n",
+						prop->filename, prop->lineno,
+						sym->name);
+					errors++;
+				}
 			}
 			if (sym_is_choice(sym)) {
 				struct menu *choice = sym_get_choice_menu(sym2);
@@ -293,21 +297,28 @@ static void sym_check_prop(struct symbol *sym)
 				prop_warn(prop, "range is only allowed "
 						"for int or hex symbols");
 			if (!menu_validate_number(sym, prop->expr->left.sym) ||
-			    !menu_validate_number(sym, prop->expr->right.sym))
-				prop_warn(prop, "range is invalid");
+			    !menu_validate_number(sym, prop->expr->right.sym)) {
+				fprintf(stderr,
+					"%s:%d: error: range is invalid\n",
+					prop->filename, prop->lineno);
+				errors++;
+			}
 			break;
 		default:
 			;
 		}
 	}
+
+	return errors;
 }
 
-static void _menu_finalize(struct menu *parent, bool inside_choice)
+static int _menu_finalize(struct menu *parent, bool inside_choice)
 {
 	struct menu *menu, *last_menu;
 	struct symbol *sym;
 	struct property *prop;
 	struct expr *basedep, *dep, *dep2;
+	int errors = 0;
 
 	sym = parent->sym;
 	if (parent->list) {
@@ -393,7 +404,7 @@ static void _menu_finalize(struct menu *parent, bool inside_choice)
 		 * moving on
 		 */
 		for (menu = parent->list; menu; menu = menu->next)
-			_menu_finalize(menu, sym && sym_is_choice(sym));
+			errors += _menu_finalize(menu, sym && sym_is_choice(sym));
 	} else if (!inside_choice && sym) {
 		/*
 		 * Automatic submenu creation. If sym is a symbol and A, B, C,
@@ -461,7 +472,7 @@ static void _menu_finalize(struct menu *parent, bool inside_choice)
 			}
 			/* Superset, put in submenu */
 		next:
-			_menu_finalize(menu, false);
+			errors += _menu_finalize(menu, false);
 			menu->parent = parent;
 			last_menu = menu;
 		}
@@ -519,14 +530,16 @@ static void _menu_finalize(struct menu *parent, bool inside_choice)
 			menu_warn(parent, "config symbol defined without type");
 
 		/* Check properties connected to this symbol */
-		sym_check_prop(sym);
+		errors += sym_check_prop(sym);
 		sym->flags |= SYMBOL_WARNED;
 	}
+
+	return errors;
 }
 
-void menu_finalize(void)
+int menu_finalize(void)
 {
-	_menu_finalize(&rootmenu, false);
+	return _menu_finalize(&rootmenu, false);
 }
 
 bool menu_has_prompt(const struct menu *menu)
diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
index 5fb6f07b6ad2..40ceb9908c6f 100644
--- a/scripts/kconfig/parser.y
+++ b/scripts/kconfig/parser.y
@@ -587,7 +587,7 @@ void conf_parse(const char *name)
 		menu_add_prompt(P_MENU, "Main menu", NULL);
 	}
 
-	menu_finalize();
+	yynerrs += menu_finalize();
 
 	menu_for_each_entry(menu) {
 		struct menu *child;
diff --git a/scripts/kconfig/tests/err_num_non_numeric_ref/Kconfig b/scripts/kconfig/tests/err_num_non_numeric_ref/Kconfig
new file mode 100644
index 000000000000..0ca7a4a460f6
--- /dev/null
+++ b/scripts/kconfig/tests/err_num_non_numeric_ref/Kconfig
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: GPL-2.0
+# Test non-numeric symbol references from numeric symbols
+
+config BOOL_SOURCE
+	bool
+
+config TRISTATE_SOURCE
+	tristate
+
+config STRING_SOURCE
+	string
+
+# Invalid int defaults
+
+config INT_DEFAULT_BOOL
+	int
+	default BOOL_SOURCE
+
+config INT_DEFAULT_TRISTATE
+	int
+	default TRISTATE_SOURCE
+
+config INT_DEFAULT_STRING
+	int
+	default STRING_SOURCE
+
+# Invalid hex defaults
+
+config HEX_DEFAULT_BOOL
+	hex
+	default BOOL_SOURCE
+
+config HEX_DEFAULT_TRISTATE
+	hex
+	default TRISTATE_SOURCE
+
+config HEX_DEFAULT_STRING
+	hex
+	default STRING_SOURCE
+
+# Invalid int ranges
+
+config INT_RANGE_BOOL
+	int
+	range BOOL_SOURCE 1
+
+config INT_RANGE_TRISTATE
+	int
+	range TRISTATE_SOURCE 1
+
+config INT_RANGE_STRING
+	int
+	range STRING_SOURCE 1
+
+config INT_RANGE_MULTIPLE
+	int
+	range BOOL_SOURCE TRISTATE_SOURCE
+
+# Invalid hex ranges
+
+config HEX_RANGE_BOOL
+	hex
+	range BOOL_SOURCE 0x1
+
+config HEX_RANGE_TRISTATE
+	hex
+	range TRISTATE_SOURCE 0x1
+
+config HEX_RANGE_STRING
+	hex
+	range STRING_SOURCE 0x1
+
+config HEX_RANGE_MULTIPLE
+	hex
+	range BOOL_SOURCE TRISTATE_SOURCE
diff --git a/scripts/kconfig/tests/err_num_non_numeric_ref/__init__.py b/scripts/kconfig/tests/err_num_non_numeric_ref/__init__.py
new file mode 100644
index 000000000000..9632907abead
--- /dev/null
+++ b/scripts/kconfig/tests/err_num_non_numeric_ref/__init__.py
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0
+"""
+Reject nonnumeric symbol references from int and hex properties.
+"""
+
+
+def test(conf):
+    assert conf.olddefconfig() == 1
+    assert conf.stderr_matches('expected_stderr')
diff --git a/scripts/kconfig/tests/err_num_non_numeric_ref/expected_stderr b/scripts/kconfig/tests/err_num_non_numeric_ref/expected_stderr
new file mode 100644
index 000000000000..4974ba2fcd9c
--- /dev/null
+++ b/scripts/kconfig/tests/err_num_non_numeric_ref/expected_stderr
@@ -0,0 +1,14 @@
+Kconfig:17: error: 'INT_DEFAULT_BOOL': number is invalid
+Kconfig:21: error: 'INT_DEFAULT_TRISTATE': number is invalid
+Kconfig:25: error: 'INT_DEFAULT_STRING': number is invalid
+Kconfig:31: error: 'HEX_DEFAULT_BOOL': number is invalid
+Kconfig:35: error: 'HEX_DEFAULT_TRISTATE': number is invalid
+Kconfig:39: error: 'HEX_DEFAULT_STRING': number is invalid
+Kconfig:45: error: range is invalid
+Kconfig:49: error: range is invalid
+Kconfig:53: error: range is invalid
+Kconfig:57: error: range is invalid
+Kconfig:63: error: range is invalid
+Kconfig:67: error: range is invalid
+Kconfig:71: error: range is invalid
+Kconfig:75: error: range is invalid
-- 
2.55.0

