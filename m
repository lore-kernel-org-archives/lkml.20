Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E88A4A4419
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 21:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789506927; cv=none; b=kvoWqWpa8+8kGcLfPLaDjKmZgyC3L6F9kWtWc91MIlF5zyPLk+ka4oRTD5MBKY/IbeP3GPz18RBxrw83GWMIBAGwfIDqnp3wA2LDeBjc9trxlGMIOF8ZjFT5TJN7i2/xBLkVdJX+CK9hDYabR8TTWBFeeZxDe24Om9wDq/PiexI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789506927; c=relaxed/simple;
	bh=yJr6rXzrWgdSiYWalW3xVY4HPBFxC9aoiQ7hQDmwGGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FaxUF8/L1mnmjZfiFQ1YJd2z+0wOhkN1vjPP6+uIJQaQN0AsFEGk2FlYghRnzQZPnsnD6lK4Izv4f4hDQEi/66gn4Aong7AuH5WBsvM9Jha7gHGqWqufWiagWqurqUOjFAP72BmgaXYl+M1cwQ5+MTPLs1CdZZVTR+EW7OsdRdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fThmJ3XR; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fThmJ3XR"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4ad9so1390225e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789506922; x=1790111722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8SM88gO19ll3/p4P6X9MOc91tQeF0muhXwwBAXrS5wc=;
        b=fThmJ3XRQgm8DaSOEBKTLm9yH0r5DDg5vFCge2EBTQqoHoXrKQruVs/WPGEvVbNLgh
         86QpmEK58nbnxn2kQCrKj6KTTCADUBcHFlYJ9uC2N8GnS/CoCEv6pSt1qLk4LhGLXOBL
         sDN9pBWb9aS0lg9AmyLAFbzl23oa9j333fj2xQjlivqOjEw8TChnrQ9GdT5G4Xr0n6PG
         LqTVoLPjSrg9Jvj5lcuXzFyJegzfntUO2lN1n9NjUQ/wLttvlQ83r8sIKR2Fc8pEsAvs
         Ye/rQGf06NEY5Nj7PqMZACthSpwwdqqHNyh/V31+DRe8APINVxOzpJyFr1WfTivywsiK
         O1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789506922; x=1790111722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8SM88gO19ll3/p4P6X9MOc91tQeF0muhXwwBAXrS5wc=;
        b=bzEp6THfmFC5D54x3Di28+qVv9TaW5bo9znj+++iEj6uF6QE9dn2EMxPc+l1ekMoET
         jNU8hNbBg9Y6rT2O/sEWV7h8qFpD7GEamQXy6SA5vhnzkP7OF6aFoA5ZOBfR5H4WZVch
         Tujx8PqR5/faUgfhfQmegJ1DSfpmOT7TXl4+5RYThE00sH3bz+jkTkmcPU4DK/vzYVyj
         P6QbHwjQgcUtU1bXgz8A0jxQGSLnk4X37wyIA/ILAb2dmHhr/yWg9aBSpW+UJBUlK66E
         Q2KFtC0snGS9K/Ee0+Uj1j7uV/chjuok9PSDfm7UmwUWlQsLt7jJhsuv4OJ54NSGXA9+
         i1hw==
X-Forwarded-Encrypted: i=1; AKwUvBzJg34XFmog4bGa3defe3nCGGzgHqu0w88TFmql6MQHUL9IpQl3P8oeo/k0UreR6QmDTW1pqcGw/oVbtBU=@vger.kernel.org
X-Gm-Message-State: AFuF++nWEa+ZIochKPa8ebTcG/MHPsKtBrzPm5rACTokojRu7MSxXybu
	ExlrkbAO5xJxRKwPCREZ8u8QzLXnUv2dNBGYE81Aw21IoOysbN1OR2ym
X-Gm-Gg: AYBFou1X22MAGgSFVRc6AR4yNW/r8LyXy3RWGEMVPJLi+1WG4CjVxxBaavo+yhLibis
	1lQNyr0opoSKSi5JjQwJhGT7OQFWXoOO2sMA2X/YCJBJ8q5Y37xkhzsPMPZyFC0rmKiK2j9XUTr
	/U/F2G+RAM+n+ZwiN2hHDoh8XGpCKwFRnrpKnHbt14np+L8E8wrphJsYeed7CVlkhEyHInH0fkN
	HgOOB1dtv65cGBoybdOzi0m2pTXfIZvzUJYjQOxlVuRHKhrgycxCGaRPaPJjhSdevN8b0xuE4JW
	jaDz++6N879HrHN8SGU+KC9J266tEqrhjDQ44EXe5Y+1AAzb8uUEUSVVqP8+eS1tlPhMjxjmTrd
	XbmL6i/H/zRKTKaIB1ez59PnxYZEX1qMvevgf+4TdKEIz7SxtQjGcUy9XJwGDylO0a7fmB8xTxd
	yo8MwtEl0AwL9K/boosAzEm25nclpRXmF93FihVMahGlVs9yBY/eQ+QSlIzQyNnzu4hFDhkRbEO
	+H7qS6Mqt5BBg6deXVH4dqlWXHmBYvOa7QI
X-Received: by 2002:a05:600c:6298:b0:49e:660a:935e with SMTP id 5b1f17b1804b1-49e822b5626mr32541615e9.29.1789506922003;
        Tue, 15 Sep 2026 14:15:22 -0700 (PDT)
Received: from nixos-office ([2001:8a0:e962:d100:b3c:e4b2:2d5f:e949])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83b1ba9bsm24804695e9.15.2026.09.15.14.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 14:15:21 -0700 (PDT)
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
Subject: [PATCH v2 5/5] kconfig: use unsigned integers for hex range checks
Date: Tue, 15 Sep 2026 22:15:08 +0100
Message-ID: <20260915211508.291790-6-julianbraha@gmail.com>
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

While 'hex' values should use the bounds of 64-bit unsigned integers, the
range values are treated as signed (checks use strtoll).

For example:

  config HEX_RANGE
    hex
    range 0 0xfffffffffffffffe
    default 0xffffffffffffffff

the default value should adjust down to the upper bound of
0xfffffffffffffffe, but since the check incorrectly parses both as
LLONG_MAX, the value stays at the out-of-range default of
0xffffffffffffffff.

To fix this, let's use a union of signed and unsigned integers to
represent both 'int' and 'hex' range values, then use both strtoll and
strtoull where appropriate.

Assisted-by: LLM
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 scripts/kconfig/symbol.c                      | 41 ++++++++++++++-----
 .../kconfig/tests/warn_changed_input/Kconfig  |  5 +++
 .../tests/warn_changed_input/expected_config  |  1 +
 3 files changed, 36 insertions(+), 11 deletions(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 0b3d19af269f..14b029f9d6df 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -142,8 +142,15 @@ struct property *sym_get_range_prop(struct symbol *sym)
 	return NULL;
 }
 
-static long long sym_get_range_val(struct symbol *sym, int base)
+union range_value {
+	long long s;
+	unsigned long long u;
+};
+
+static union range_value sym_get_range_val(struct symbol *sym, int base)
 {
+	union range_value val;
+
 	sym_calc_value(sym);
 	switch (sym->type) {
 	case S_INT:
@@ -155,7 +162,12 @@ static long long sym_get_range_val(struct symbol *sym, int base)
 	default:
 		break;
 	}
-	return strtoll(sym->curr.val, NULL, base);
+	if (base == 10)
+		val.s = strtoll(sym->curr.val, NULL, base);
+	else
+		/* HEX */
+		val.u = strtoull(sym->curr.val, NULL, base);
+	return val;
 }
 
 static void sym_validate_range(struct symbol *sym)
@@ -163,7 +175,7 @@ static void sym_validate_range(struct symbol *sym)
 	struct property *prop;
 	struct symbol *range_sym;
 	int base;
-	long long val, val2;
+	union range_value val, val2;
 
 	switch (sym->type) {
 	case S_INT:
@@ -178,13 +190,19 @@ static void sym_validate_range(struct symbol *sym)
 	prop = sym_get_range_prop(sym);
 	if (!prop)
 		return;
-	val = strtoll(sym->curr.val, NULL, base);
+	val = sym_get_range_val(sym, base);
 	range_sym = prop->expr->left.sym;
 	val2 = sym_get_range_val(range_sym, base);
-	if (val >= val2) {
+
+	if (base == 10 && val.s >= val2.s) {
+		range_sym = prop->expr->right.sym;
+		val2 = sym_get_range_val(range_sym, base);
+		if (val.s <= val2.s)
+			return;
+	} else if (base == 16 && val.u >= val2.u) {
 		range_sym = prop->expr->right.sym;
 		val2 = sym_get_range_val(range_sym, base);
-		if (val <= val2)
+		if (val.u <= val2.u)
 			return;
 	}
 	sym->curr.val = range_sym->curr.val;
@@ -731,6 +749,7 @@ bool sym_string_within_range(struct symbol *sym, const char *str)
 {
 	struct property *prop;
 	long long val;
+	unsigned long long uval;
 
 	switch (sym->type) {
 	case S_STRING:
@@ -744,8 +763,8 @@ bool sym_string_within_range(struct symbol *sym, const char *str)
 		if (!prop)
 			return true;
 		val = strtoll(str, NULL, 10);
-		return val >= sym_get_range_val(prop->expr->left.sym, 10) &&
-		       val <= sym_get_range_val(prop->expr->right.sym, 10);
+		return val >= sym_get_range_val(prop->expr->left.sym, 10).s &&
+		       val <= sym_get_range_val(prop->expr->right.sym, 10).s;
 	case S_HEX:
 		if (!sym_string_valid(sym, str))
 			return false;
@@ -754,9 +773,9 @@ bool sym_string_within_range(struct symbol *sym, const char *str)
 		prop = sym_get_range_prop(sym);
 		if (!prop)
 			return true;
-		val = strtoll(str, NULL, 16);
-		return val >= sym_get_range_val(prop->expr->left.sym, 16) &&
-		       val <= sym_get_range_val(prop->expr->right.sym, 16);
+		uval = strtoull(str, NULL, 16);
+		return uval >= sym_get_range_val(prop->expr->left.sym, 16).u &&
+		       uval <= sym_get_range_val(prop->expr->right.sym, 16).u;
 	case S_BOOLEAN:
 	case S_TRISTATE:
 		switch (str[0]) {
diff --git a/scripts/kconfig/tests/warn_changed_input/Kconfig b/scripts/kconfig/tests/warn_changed_input/Kconfig
index 69845e2f3fb3..df4183a08420 100644
--- a/scripts/kconfig/tests/warn_changed_input/Kconfig
+++ b/scripts/kconfig/tests/warn_changed_input/Kconfig
@@ -26,6 +26,11 @@ config NUM
 	  Kconfig resolves it to the constrained in-range value.
 	  The warning should report that adjustment.
 
+config HEX_RANGE
+	hex
+	range 0 0xfffffffffffffffe
+	default 0xffffffffffffffff
+
 config DUP
 	bool "DUP"
 	depends on DEP
diff --git a/scripts/kconfig/tests/warn_changed_input/expected_config b/scripts/kconfig/tests/warn_changed_input/expected_config
index fe8bbec66c53..6a8d98a69b7e 100644
--- a/scripts/kconfig/tests/warn_changed_input/expected_config
+++ b/scripts/kconfig/tests/warn_changed_input/expected_config
@@ -4,3 +4,4 @@
 #
 # CONFIG_DEP is not set
 CONFIG_NUM=20
+CONFIG_HEX_RANGE=0xfffffffffffffffe
-- 
2.55.0

