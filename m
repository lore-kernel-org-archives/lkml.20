Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE82B569F0D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790095093; cv=none; b=TY4MIk28eEELIFmaVk5+vIOsb3cRa69qGRXZj+Jvk9rMdC9vGGKpm5zr/kiOQeBM35hqsDJeU3yPt9HeJRcXZVr2JhKCo/US77zIloSQdU4BzeBiqeoK49Z+Jbcnn4wm7ISQn0HCzp2hjjH6TlnL32Y7XtdX1FyzLVv7aZGnSro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790095093; c=relaxed/simple;
	bh=+vdQOYNoT2/4AybnkPVeBNE954BroQC709/zWsUcbhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XZ4/2b3S3hGk/134t0Gtxbg2ntO+IK/6ueh12A5arRB0vfG2LvDv5rQLikrd3+zokh7NNajTP9BNmRoN7Q86J9JTBWarQlzSwOOvQmXbw+jb5Na5A+qHz5c7LbWSnCva7jvGB8TBKJWkeA4BNCX6KtCpd+Wvd29v7OpWqfae+GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ODOySnok; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ODOySnok"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so22892575e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790095080; x=1790699880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9hUAfprr9v8IFH2x2CAQd6Eglv3s0TfIGiBIbKZDYSs=;
        b=ODOySnokcg7GJx8GXSViqwspSW9WzERKxzb9UG2BHz2LXoh6FUESgaBBUghoFJtbfN
         Z/hYlHl47aPcGkcwxUkpmOGn9/jYJxNB6oUVAoaxDbtnrQEnX7K9Imx2fI2suaxltou7
         IKR8pWlAviiACk18mlYePkhgjhTdPkn0j7VEuYOf29vdhdzQp+vL0T3ZKV0xjasfeH5V
         Ijeca9+aX1JV3sQP/mCofZPL6H23W44y/Wxc/je4aeGLH3kqKeZihRNfE4UYKYTKQmHs
         py/JQRJzA3YTjJ9rF2rPbm0AddqmzJWobEj7xTl4d5ubmSnOcdeDJsQrGazYR9OAVDDR
         0Mqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790095080; x=1790699880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9hUAfprr9v8IFH2x2CAQd6Eglv3s0TfIGiBIbKZDYSs=;
        b=M6W/JKHywbmoAFBk6vDfyx532EgUeMvXaU2nA8jjTIr6IydAQUQhUPu8KFjtlOppiv
         SpIe6TxftVpnLH1mZeDQjq56TJ7a8VgGkAZVUXI/x43oEHhkTxplN0srydIvgFdRTRxl
         BXr3/VWSYw49NVyn+bGr1WT/yyXYMkuHxy94/AwHoKHNlc6nxwdbQbpvmAAkBNEjuwAE
         DF8eb4p5lKp24z32CV8PtJsGexgKrW77NDJLSsDfyVsVCGVJAtiXEYjwmQ8u4tdbiNEi
         NUQZI31sbYmSL7lYpXdqA/X2YmvSuuWo0dxBW9VjipPykhmlas1f7Pe/4eSQmdH6bx9y
         X5Ww==
X-Forwarded-Encrypted: i=1; AKwUvBwemEIz7mvcPyKTMt0GPo/zmpjxPwZhOLJTibFP2JqTB5X5ohdaKf4m3engDUDbrutKG7r6RZE3dD8SoIk=@vger.kernel.org
X-Gm-Message-State: AFuF++liskLz5xQ0m8fT3yZ+/Xo/98q6Wq5VCHEqhW7EeYfp1KYuL/jS
	adTlJAcSvMECOao8SJIAjjpZbooVOmBwiycktUfhkbeeCGJ8TuWfpuzE
X-Gm-Gg: AYBFou1QJ2bJR4JcVxnY9rfiviGqcW4zboCOp54zfgBwbSLzztHZG/Os655iVpBJuut
	8zVAVxb1YyZxUa0SAUm/5u83MvU3W0wtlFF320pMVUHfOxvProWP+R8dOlhFiNHOKFk50OwhH62
	2+/4YLuE03OS30jW1+ttAeShI5LOfOIK+NeJjq+kjlkDPb1c07ukm+4o8dZE3cqVyAGERSYeYlh
	/TUvebAGgapxreyl/TWs2BEt9zD+I7sCQn6UsxA0oZ6D7aM/AHepy/5cxPKUqC7WcahQX6rmktQ
	2TM4IK4wIdzIUln5axfQVW4wdNLc5eLXj18PPIngc/EvC3atbxZjIscLGtis5Ib20fMU7kRqvil
	hLXqd+NH1Hlvnz5DmVHGE006c6OZSubLSFahhZtuT5/sMy33SYtES67UpcQ3EJCSg6cXHIZvV6l
	Gmz0JjLa5+MCK6gnMtyvtLvFT28S8zYgabJLC6xZ+XcgNE8ga+etu7L5sYDnkPZmMDwxCV08m7X
	Af0TBrGCfflP3z8mj5QFD6t/Xdwb412BPygiBfqg19D7Pft9MwyEhkUO1E9FQl2oQcTPZNLfg==
X-Received: by 2002:a05:600c:34c1:b0:49f:ddbd:1f51 with SMTP id 5b1f17b1804b1-49fde4a12dcmr404345e9.15.1790095080158;
        Tue, 22 Sep 2026 09:38:00 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862773ee0sm6162192f8f.6.2026.09.22.09.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:37:59 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: n.schier@fritz.com,
	grahamr@qti.qualcomm.com,
	rdunlap@infradead.org,
	nico@fluxnic.net,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH 2/2] kconfig: error on reverse range
Date: Tue, 22 Sep 2026 17:37:49 +0100
Message-ID: <20260922163749.2031594-3-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922163749.2031594-1-julianbraha@gmail.com>
References: <20260922163749.2031594-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As discussed on kconfirm v4 [1], it was decided to move checks directly
into the kconfig interpreter once where are no findings from kconfirm.
This "reverse range" currently has no findings across the tree, so let's
add the check.

Currently, if a reverse range is attempted, such as:

    config EXAMPLE
        int "Reverse range example"
        range 2 1

then the value of the option defaults to its "lower" limit of 2. If the
option is visible in the frontend, then the user gets trapped in the value
selection interface, since there is no value that is actually valid for
the user to set.

Note that this only checks ranges that use constant values. Statically
checking ranges using symbols would require SAT solving, or similar.

Link: https://lore.kernel.org/all/20260904220559.GB2787252@ax162/ [1]
Assisted-by: LLM
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 scripts/kconfig/menu.c                        | 22 ++++-
 .../tests/err_num_reverse_range/Kconfig       | 86 +++++++++++++++++++
 .../tests/err_num_reverse_range/__init__.py   |  8 ++
 .../err_num_reverse_range/expected_stderr     |  7 ++
 4 files changed, 119 insertions(+), 4 deletions(-)
 create mode 100644 scripts/kconfig/tests/err_num_reverse_range/Kconfig
 create mode 100644 scripts/kconfig/tests/err_num_reverse_range/__init__.py
 create mode 100644 scripts/kconfig/tests/err_num_reverse_range/expected_stderr

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 118af2dde722..cc335f6db257 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -274,9 +274,9 @@ static int menu_validate_number(struct symbol *sym, struct symbol *sym2,
 static int sym_check_prop(struct symbol *sym)
 {
 	struct property *prop;
-	struct symbol *sym2;
+	struct symbol *sym2, *lower, *upper;
 	char *use;
-	int errors = 0;
+	int errors = 0, numeric_errors = 0;
 
 	for (prop = sym->prop; prop; prop = prop->next) {
 		switch (prop->type) {
@@ -325,8 +325,22 @@ static int sym_check_prop(struct symbol *sym)
 			if (sym->type != S_INT && sym->type != S_HEX)
 				prop_warn(prop, "range is only allowed "
 						"for int or hex symbols");
-			errors += menu_validate_number(sym, prop->expr->left.sym, prop);
-			errors += menu_validate_number(sym, prop->expr->right.sym, prop);
+			lower = prop->expr->left.sym;
+			upper = prop->expr->right.sym;
+			numeric_errors += menu_validate_number(sym, lower, prop);
+			numeric_errors += menu_validate_number(sym, upper, prop);
+			errors += numeric_errors;
+			if (numeric_errors || lower->type != S_UNKNOWN || upper->type != S_UNKNOWN)
+				break;
+
+			if ((sym->type == S_INT &&
+				strtoll(lower->name, NULL, 10) > strtoll(upper->name, NULL, 10)) ||
+				(sym->type == S_HEX &&
+				strtoull(lower->name, NULL, 16) > strtoull(upper->name, NULL, 16))) {
+				prop_err(prop, "range lower limit '%s' is greater than upper limit '%s'",
+					lower->name, upper->name);
+				errors++;
+			}
 			break;
 		default:
 			;
diff --git a/scripts/kconfig/tests/err_num_reverse_range/Kconfig b/scripts/kconfig/tests/err_num_reverse_range/Kconfig
new file mode 100644
index 000000000000..064586597e50
--- /dev/null
+++ b/scripts/kconfig/tests/err_num_reverse_range/Kconfig
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: GPL-2.0
+# Check constant range bounds.
+
+config INT_ORDERED
+	int
+	range -10 10
+
+config INT_EQUAL
+	int
+	range 5 5
+
+config HEX_ORDERED
+	hex
+	range 0x7fffffffffffffff 0xffffffffffffffff
+
+config HEX_EQUAL
+	hex
+	range 0xffffffffffffffff 0xffffffffffffffff
+
+# Skip ranges with symbolic bounds.
+
+config INT_LOWER
+	int
+
+config INT_UPPER
+	int
+
+config INT_SYMBOL_LOWER
+	int
+	range INT_LOWER 0
+
+config INT_SYMBOL_UPPER
+	int
+	range 0 INT_UPPER
+
+config INT_SYMBOL_BOTH
+	int
+	range INT_LOWER INT_UPPER
+
+config HEX_LOWER
+	hex
+
+config HEX_UPPER
+	hex
+
+config HEX_SYMBOL_LOWER
+	hex
+	range HEX_LOWER 0x0
+
+config HEX_SYMBOL_UPPER
+	hex
+	range 0x0 HEX_UPPER
+
+config HEX_SYMBOL_BOTH
+	hex
+	range HEX_LOWER HEX_UPPER
+
+# Reject reversed constant bounds.
+
+config INT_REVERSED
+	int
+	range 10 2
+
+config INT_REVERSED_NEGATIVE
+	int
+	range -1 -10
+
+config INT_REVERSED_SIGNED
+	int
+	range 1 -1
+
+config INT_REVERSED_QUOTED
+	int
+	range "8" "2"
+
+config HEX_REVERSED
+	hex
+	range 0x10 0xf
+
+config HEX_REVERSED_HIGH
+	hex
+	range 0xffffffffffffffff 0x8000000000000000
+
+config HEX_REVERSED_UNPREFIXED
+	hex
+	range f a
diff --git a/scripts/kconfig/tests/err_num_reverse_range/__init__.py b/scripts/kconfig/tests/err_num_reverse_range/__init__.py
new file mode 100644
index 000000000000..4a7219bbe49e
--- /dev/null
+++ b/scripts/kconfig/tests/err_num_reverse_range/__init__.py
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0
+"""
+Reject constant range bounds when the lower bound is greater than the upper.
+"""
+
+def test(conf):
+    assert conf.olddefconfig() == 1
+    assert conf.stderr_matches('expected_stderr')
diff --git a/scripts/kconfig/tests/err_num_reverse_range/expected_stderr b/scripts/kconfig/tests/err_num_reverse_range/expected_stderr
new file mode 100644
index 000000000000..c06edc48547d
--- /dev/null
+++ b/scripts/kconfig/tests/err_num_reverse_range/expected_stderr
@@ -0,0 +1,7 @@
+Kconfig:62:error: range lower limit '10' is greater than upper limit '2'
+Kconfig:66:error: range lower limit '-1' is greater than upper limit '-10'
+Kconfig:70:error: range lower limit '1' is greater than upper limit '-1'
+Kconfig:74:error: range lower limit '8' is greater than upper limit '2'
+Kconfig:78:error: range lower limit '0x10' is greater than upper limit '0xf'
+Kconfig:82:error: range lower limit '0xffffffffffffffff' is greater than upper limit '0x8000000000000000'
+Kconfig:86:error: range lower limit 'f' is greater than upper limit 'a'
-- 
2.55.0

