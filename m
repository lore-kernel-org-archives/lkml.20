Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54006524B0E
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791985233; cv=none; b=fOGjbpWZJJbM+fGU3YH9RorrJAYdb4QZdOpVQig8ne77oTxG9Y6e/74N1BRQZCMo3eaTYdcpHYByxXzqHZ4SX7qfHH6EqBfJ+1YeWAfBTGW/5HmUcBFEJh58B+lC60n7PzNgxw70n8fxFivhKu2209LXRzFWmhjr6wk7N1YzBNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791985233; c=relaxed/simple;
	bh=z/ulAL51S2rVPzb+EIdpqFoXPgx8r0TtTeiya1+QWDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BJtNONW2Lr5r1YGIbEmMntcHMu6a3JvW4zMXhVlsx9kYuKwHCtTO2FY9ifC+s9fVApDFZ/46UYmENu1P5t8/ho/9mRoPS83XBF4oJZJM42A4iCbJku+7Ita1NkcBPT1V1qNKwFiUbxrYs4KZJw4i1Iz733NW8dpkyPO+1pRTAxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LO3wKxQg; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LO3wKxQg"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c4be28b82so564767f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791985226; x=1792590026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=43/+VYPxT3qvoHDdmMi/DHEQAKGmcNvSSRySkv7cBT8=;
        b=LO3wKxQgrayCOc3XjqG6g/kL+PHVy8W8REUFXygTIlCKoXfKlKoqiO7m0tlYE84L/U
         HpcpZFRGO2JoUX+gSDkWWHSRZ0ilDJOUHlT8bgovrxVml7ZtTomSvIEgGR/5S3e90wjD
         xrAer2MpcBkqLFnD8j+FMytslO64O2elUyejiaGBt99qwGpMEE3SQLqwhl/fvFrko6Wc
         qtMp8k8fNX0xueWjaLgsKyEUoZYqRMIUxiKOh3Mt7m4T+QQT6TI2I502oAXgHaYfwKNX
         D02hvTAbKSi+GitByKLJ/rro8ryZfXnaiAWtRwT/+IeCz2v8pMUq64aFu0ucaoSKw/kq
         3YYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791985226; x=1792590026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=43/+VYPxT3qvoHDdmMi/DHEQAKGmcNvSSRySkv7cBT8=;
        b=z9DM1Buepn4cfBmJxzU2i7lwYbdsqNng7ecB8hts56jP/fiwvuW3ycLCcE8H3mAMcW
         QeDplk4LcoumcjTEOgEcBh6EZRCf6+Ip/Ll5c0Y3IYPBq8yx3bv7qi/vbDw0kuP6YYlx
         S/09L/NC/haEhYPeafrwp+1aCQqRI/oobEd2Z6r0p0WC2MUffrLVmPpHsftKazvIjnVF
         MhKBrW9JptGQscTcPkB2SVBP6/6Ckj5RC64nHBukj16Inbmdxvvtbl25noith3nYLws8
         4jRu20Y8SFzuZphTU5AIQ21twVQdzL5d+9IeW8Db3C8da0Ds9Ijk98PSxcQfwa5CqP5C
         OUPQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2232fgjBzm6F7JoeCdXetJgQ5EVq63p/t5r9wX6v6uGwapDzLVi97bO6lSJY5OWNiqnSyItk9Z8pgZuA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmSEocOiI3jIYsG9dvxSvLerAkaLslUbmldhzK7SxxGSruabX7
	B/JUNcU9l9JpxR8pLo3LPxRjM+mpsyH1/1U7Nh9notJilopxQGdhdyZUWXzHbEOxt/Ahlw==
X-Gm-Gg: AYBFou0Nk1DPUwfiWeGtSqY04d3n8+5CTEkY/XOc/ffKwekhS6Dzpt08y51SJ0S6nZd
	rbaR7HQOKk6XxCDpe2U3kmF5uNe5k0hXrthhBYv5Gv0JQzvxe4C9rIpOUiMQRGXcxA+D3jIm553
	4fO8Md6+kBd/FqNd27nAKSDHM+gtlwc+ZznNxq95Yi1qTgoWfmYvr7pkV9SwR+p/DhjdtyeLz6k
	VLsDPH463RqjntIgq6Zn+HUhf55dcAN+Z0Yut3AyQVrGv7Ywz1yENsmFQ1m4/wKNeGBtUWK8ToA
	A40fO5ojIziOxgiSMY6TeN8LQlgOPx81gRA55riD19oIvQpeqmquT4/LCGIFtxfi5uTCjL1+r7w
	VQj+K6qGbDSOc8VJTBPJtSBn9WLe7kImPiyyURcWr3jVbIX3OH7enIh5xJ06cxJJ0U7XtzPKOjU
	jmQXbUZNLcxZO1wm7MbCTvP0fT014v/uKQq/RlPBYNNlEbWUaket7V21FMXp43YNNuY2GyVe8QS
	Kg3PD7ikv8aLsEdXv/TsgxsoUWdWJv/RCGVXjLiqWGIUcO2hjt4DySyXFrIEQIb
X-Received: by 2002:a05:6000:40ce:b0:48d:bb54:77e7 with SMTP id ffacd0b85a97d-48dbb547b24mr30817382f8f.29.1791985224426;
        Wed, 14 Oct 2026 06:40:24 -0700 (PDT)
Received: from nixos-office (29.pool92-59-2.dynamic.orange.es. [92.59.2.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac52d3sm12036009f8f.43.2026.10.14.06.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:40:24 -0700 (PDT)
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
Subject: [PATCH v2 2/2] kconfig: error on reverse range
Date: Wed, 14 Oct 2026 14:40:17 +0100
Message-ID: <20261014134017.2310819-3-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014134017.2310819-1-julianbraha@gmail.com>
References: <20261014134017.2310819-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As discussed on kconfirm v4 [1], it was decided to move checks directly
into the kconfig interpreter once there are no findings from kconfirm.
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

In the future, the code should be refactored to store range values as
numerics so we can avoid calling strtoll() and strtoull() multiple times. 

Link: https://lore.kernel.org/all/20260904220559.GB2787252@ax162/ [1]
Assisted-by: LLM
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
Changes since v1:
- fix typo in commit message: where -> there (Nicolas)
- handle case with multiple (conditional) ranges (sashiko)

Link to v1:
https://lore.kernel.org/linux-kbuild/20260922163749.2031594-1-julianbraha@gmail.com/
---
 scripts/kconfig/menu.c                        |  22 +++-
 .../tests/err_num_reverse_range/Kconfig       | 111 ++++++++++++++++++
 .../tests/err_num_reverse_range/__init__.py   |   8 ++
 .../err_num_reverse_range/expected_stderr     |  11 ++
 4 files changed, 148 insertions(+), 4 deletions(-)
 create mode 100644 scripts/kconfig/tests/err_num_reverse_range/Kconfig
 create mode 100644 scripts/kconfig/tests/err_num_reverse_range/__init__.py
 create mode 100644 scripts/kconfig/tests/err_num_reverse_range/expected_stderr

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index db5ba57125c5..1a3ad09a92d2 100644
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
+	int errors = 0, numeric_errors;
 
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
+			numeric_errors = menu_validate_number(sym, lower, prop);
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
index 000000000000..c55091aca274
--- /dev/null
+++ b/scripts/kconfig/tests/err_num_reverse_range/Kconfig
@@ -0,0 +1,111 @@
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
+
+# Check each conditional range independently.
+
+config RANGE_CONDITION
+	bool
+
+config INT_REVERSED_FIRST
+	int
+	range 10 2 if RANGE_CONDITION
+	range -10 10 if !RANGE_CONDITION
+
+config INT_REVERSED_SECOND
+	int
+	range -10 10 if RANGE_CONDITION
+	range 10 2 if !RANGE_CONDITION
+
+config HEX_REVERSED_FIRST
+	hex
+	range 0x10 0xf if RANGE_CONDITION
+	range 0x0 0x10 if !RANGE_CONDITION
+
+config HEX_REVERSED_SECOND
+	hex
+	range 0x0 0x10 if RANGE_CONDITION
+	range 0x10 0xf if !RANGE_CONDITION
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
index 000000000000..8742f3f46469
--- /dev/null
+++ b/scripts/kconfig/tests/err_num_reverse_range/expected_stderr
@@ -0,0 +1,11 @@
+Kconfig:62: error: range lower limit '10' is greater than upper limit '2'
+Kconfig:66: error: range lower limit '-1' is greater than upper limit '-10'
+Kconfig:70: error: range lower limit '1' is greater than upper limit '-1'
+Kconfig:74: error: range lower limit '8' is greater than upper limit '2'
+Kconfig:78: error: range lower limit '0x10' is greater than upper limit '0xf'
+Kconfig:82: error: range lower limit '0xffffffffffffffff' is greater than upper limit '0x8000000000000000'
+Kconfig:86: error: range lower limit 'f' is greater than upper limit 'a'
+Kconfig:95: error: range lower limit '10' is greater than upper limit '2'
+Kconfig:101: error: range lower limit '10' is greater than upper limit '2'
+Kconfig:105: error: range lower limit '0x10' is greater than upper limit '0xf'
+Kconfig:111: error: range lower limit '0x10' is greater than upper limit '0xf'
-- 
2.55.0

