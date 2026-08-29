Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1031D21A434
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 17:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788024005; cv=none; b=Jsk6By/q6gkMF7A3T6I8tss1rdkW5vYnSWMR6gklK8WJoR9zC9532yqtQ6gmggIiOvl6/6yEgXpddL4bCcOli/uLaDZ+2h/SbawSzVICkiQqymwSVcpZ1VYO6/1XD6CCfyo7V7KlQC7Gs94e6vh8k37U5pUnxn2t7tfpBCyqUDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788024005; c=relaxed/simple;
	bh=BuzFjPMPe9DInfvWCxswmUwGrUF1mPEkZyDE860m63U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D0+7cvw9ogkH9hUHFIfCJcqc7kF9kGXl8c117Ut7tGvNH1b1OXVeKH9vt3aB+Vw4/Ag1VbKV6LG+oZGrKZTqpXa5Fm4jI+UUPJ8/qu6AcdXv9ZrVMGt3dOCZVYKv64JGEM9hnSj1n60zLpbl875rC6JNW3+Tdzwpxne9wSxbzt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gjFxoqQU; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gjFxoqQU"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-499840a2575so12817265e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 10:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788024000; x=1788628800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jjTXfOK7+hgUM/P5aU+YlX2xWoEWFIOO5Q6W5cINQc8=;
        b=gjFxoqQUkCROPjDTVPquFtTBnpSnVPwHoI9JYHZXsVD8if+wnmcvWIpM23v0y8XBpC
         6IMmJCpORX/Ef65bS/dakLKHUOH8ZbXP0eWol6rMfQUXA93RA/y4LraHc3VWZTrkyhfN
         xOHqny1y45aRQeQS3ACTouSBaz5da/p0SUYLAnzrnegl0SaYFNxrmCBR1i6Pde900ILB
         Zlz9kujs/Ug9NFvVe72L/x59UP8nTRpntif9YQ8vH0CKNY1Vu8JdJqh0OJG1xeIQcadE
         zOhN6lRvjMZkkGe0QGRQuJfalL3hiRyKvWy0YTIijVgkL/D80Y9Ufk0gU0TJBHX5IR8g
         ZQcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788024000; x=1788628800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jjTXfOK7+hgUM/P5aU+YlX2xWoEWFIOO5Q6W5cINQc8=;
        b=Sqr/o+k7OD5LBCXZgQOT3ra0otz8LzBPpIYKwmlKPuSmPCwvjDWuf9QiIwm2Kp97Ov
         +3BK8yQRkf0ZwUCOH5Tr9Kd8Kt8tG69zp3ualwxqwdNWJ9ogZdF2Nx1bR3DgCyFQ+FXM
         c+Fmq26/7O5FFGd27ga8MHXnJcu5gYHfHKTighJFb/bxUy3OEQ4Sgcw2D+hFLGl4w53j
         Pk8e3YV0a3m7WE2UtuWl9Ith8TBPUtoMPer/a29aRDAOD/159VynWQUp0DCSas4EOCvu
         EptBgkpZeJeBAOVoCy1mqQprUrxgeSYQDt9SUCVfdZ17hWE5HhmYphR+/hYihKbvTaw5
         oMBA==
X-Forwarded-Encrypted: i=1; AHgh+RoNDCdWSnRV9ZX67W5CgcE6PKCFOW/DzbKY9EKoJAm/Enta+UJaZXCKhS3Y+IljiZPHTltY8aAkdd1OPo4=@vger.kernel.org
X-Gm-Message-State: AFuF++n/e9EdUw5ND+QW1qfV5Idh8DsAcRoyETrsjEDV5i7522tOTjHe
	NicAdeVhcoplx4vZUVnybF2kxlROaGFAb6qdbAyb6Tgah7QZdncxp7V+
X-Gm-Gg: AR+sD10JLa/LOaYgcOCQ/aZgVxSdpUrUEVmLjR+SWQT76MF9yGkLEU0XIZsZcp27RnT
	HtccwZTxtxRi/AE5ANrXDiQdYXR2enYsAZdEuBOafkeH/tVPrj/rTThAluwA8pVZMjrH2T7b6mq
	Gg/6+dmjrr8fBpe1pbNjmXel+cZo1ctwuwaLS8VP5nV0vG87tQnVnGFOds5ZhC03uwRiqxXKIGl
	sluIJ2XxlkwMj/rTtBRjFCQbOF2MBt3NzrnukHB0nOm6PXog+G66+TndFSJooPBYnQKsKDPSEm2
	vAyGzMEOcR1QLBbal7O4RPUnSaqjwESC0FxGjP3Nw3wfeGLBgm1jHH9ZGyON/VyBftLEoQKmdvP
	nxCpwCnAXZIPKKUDQD381SXT99ewQNidfbmYEai2baOPMSFGOLOsntEnIOqUjidwspPfMTXjihA
	46yqrkiMEupLUT0yruSwM8y3FTAQ0p0F0gn+lyISRKVZdtpTutAI9go6uruNnZyXKRrqkVWl+DV
	G3VN1OHi4sGBc4Va1kDC/OnLD4MwHPhZTpQjQNGFK8Cpv5+amP8
X-Received: by 2002:a05:600c:3511:b0:499:adb4:a922 with SMTP id 5b1f17b1804b1-49b91c4bab5mr165768515e9.12.1788023999568;
        Sat, 29 Aug 2026 10:19:59 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b955e7906sm121080285e9.1.2026.08.29.10.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 10:19:59 -0700 (PDT)
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
Subject: [PATCH 1/4] kconfig: promote invalid numeric reference from warning to error
Date: Sat, 29 Aug 2026 18:18:59 +0100
Message-ID: <20260829171902.1510587-2-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829171902.1510587-1-julianbraha@gmail.com>
References: <20260829171902.1510587-1-julianbraha@gmail.com>
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

Assisted-by: Codex:gpt-5.6-sol
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

