Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1E53BE650
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 17:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788024009; cv=none; b=s3Mj1EP/DHQbcSiuxgX7opaGihDVhsu2Fw1moCs2lguCnb05VjA2iWCm8eqYARCqpHAzM2aYI1hZ9YRy2s6odnVojk7EJy2/fzql8gGqVl3qq4ODcQDdU0vu0Mfl4g3Z464Yifr0g301qNxRJY48MvYEvq0aBXIan50IyLc2Gag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788024009; c=relaxed/simple;
	bh=DxUJS7jSQAlFYNKeitIsZIFaYwViq6avj3T/IxWEq/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BA3eiKfZZr2a9jVIuQbpE04o1R4uLMWveXdySQum9aEkhfUk/FY8OXrWLSMGKQjzvJWm3vxjQ9x7ekCNirrKB1knNAJvV1erjAByKOFlYM/PBnmvI49wSxPE8xvKlGhcjg2JR+FgTk6AmeH46tYz84YWCXQWl84FYEl97hGNfNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1knrsJp; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1knrsJp"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso18861945e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 10:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788024003; x=1788628803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g5fXPAX37bH6U7qQdnDH78A8mrdS8QESqXRlgI2+UvM=;
        b=F1knrsJpkH5bJx7LsQdkbQE63Cz5oleBIKM7rEeFdAZm+dhWwrvy8scr0ukQ1L4JAh
         64RzKgL676eGqC/UrG3DeEWmCzA6xjooulidgDR1QPL2Wa5m8gHpkvJSIINLFJzA0+6U
         LvJNvMSHvjVS8sAuh8HDlHENWWCO9oAt/yFLkNKh21jMrAxipwQNNCWeOrPRqL7vbHQT
         8hUwoZXKbj1pAt0dG4eLEYeIk3ahZajPCaxTxuWq/li8eC4CS07awVbJZJXaUbw9VlgC
         YiY2y7ictVNqVI/G3AVYVCRvnvkDDitQ/gba+RivnRbnZk9Jgc1GXZ9m2QsS3xeDm/4J
         VjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788024003; x=1788628803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g5fXPAX37bH6U7qQdnDH78A8mrdS8QESqXRlgI2+UvM=;
        b=ViAoVso9iaMezdzsNpUrQ5PbBSdOmnX9aC+daf/vKEatQ518UyfQtV4qvxSLvMklDr
         sB4zCkNkamz+0MjpjsHj5MAI7aNcHUD6eYVO5sxfO1YQ9GXbQu9LLu6NDDUG/zwifCdS
         u2xM8MhzyV9iENhUUDCBx/y5qxi5qhshliwQWn5n1mjQ3c0ErwGpeDxqOM+Pm487vIxa
         IFFHEmSB7k26W/g9265SIiswf94QXFbz0iJZHtLxPdExDuRpPubu3/RoxMKXjRljwMvU
         jB0Ee7hfoKeO4FdmyCKHe/cxX80vAvWc9EK6DB9pGE5c4qfxDvGb17s1ikddDQzdKjb4
         yTJA==
X-Forwarded-Encrypted: i=1; AHgh+Rr28aQBf1QEUo8e4QaOMX7Tb6vEqUqP1UaEoO84mvew8HNosPoZk1VIsC8Ow/gnOHR1QxmxleV/wAwCSIg=@vger.kernel.org
X-Gm-Message-State: AFuF++k50w4X4GXgRmy7bzbTD/umPad21QeOHKOQN6pGPa82Psm5/Axm
	WeUk5YEjKz9Al3ZszMBS5WmncpAz9va3aYELPGXyE2sIUqxzU81JdIRIsO7imxyGNmg=
X-Gm-Gg: AR+sD113ejcKJzeSgDn3PI02dx6ZTrhqIlvLUfgo5PF855EW4j5ZDOUrMbrGTBx5tSR
	QbIk0h+xeJfqZnoJMxlTvI7hwbeG/s5lZisON4ux0qyXQQsrudsjzzBdBuP0peOQ6DRZ2/7PFwP
	vIEE+p69oeNhJhIIzFz8+N9tdaEKU54lM6h7N3I64WA5P7DfaQhJnRF/iy7RD6EDXGJndc8WFvV
	yONNleKM3g1qKoKAnpK3l6nHCeMMDyR2QzIvmxow5uyvKZ1XvkbqM9qsQmoWbtfmiPg6l9oH0ff
	z6iE/ehK1heruAL/nGAjb1Bo8T4KxN5w97n/4CVYaqFUmlHLtH0iq4EI/J8fLRyc7TXFr48+eTp
	nMbYFpvBDPXRARYMggtDpUgGJsV5vxM8/30DVHDhkQWeX2JccVIyeXEBB4+nhWEK7mQrKX9IkEB
	vncGjGqpydL+nesvBJlsUKK+F/4Aq31WG7nlJEXt7o64XjMJ2018uY2nl8XL14U/qa5zNowNRUL
	Uz1EZhAxvBsSPzALxHHhI3EH2uQw7hDW+RMJkpPJdBjsGVrnNwZ
X-Received: by 2002:a05:600c:1d8c:b0:49b:916f:1471 with SMTP id 5b1f17b1804b1-49b91c1df21mr247713825e9.3.1788024003384;
        Sat, 29 Aug 2026 10:20:03 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b955e7906sm121080285e9.1.2026.08.29.10.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 10:20:02 -0700 (PDT)
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
Subject: [PATCH 3/4] kconfig: check for hex and int mismatches
Date: Sat, 29 Aug 2026 18:19:01 +0100
Message-ID: <20260829171902.1510587-4-julianbraha@gmail.com>
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

Using a numeric option of one type (e.g. 'int') to determine the value of
a different numeric type (e.g. 'hex') currently fails silently in various
ways if attempted, because the underlying string representation is naively
reused.

Example 1:

  config I
    int
    default -1

  config HEX_DEFAULT_INT
    hex
    default I

Here, HEX_DEFAULT_INT actually gets set to '0x-1', which is of course not
a valid hex value.

Example 2:

  config H
    hex
    default A

  config INT_DEFAULT_HEX
    int
    default H

Here, INT_DEFAULT_HEX actually gets set to 'A', without even converting
into the base-10 equivalent of 10. This value, 'A', is otherwise a
rejected int value if entered in the frontend, or read in from an existing
.config file.

These int-hex mismatches currently do not appear anywhere in the tree, so
it is already safe to make these error out.

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 scripts/kconfig/menu.c                        |  2 +-
 .../kconfig/tests/err_num_mismatch/Kconfig    | 38 +++++++++++++++++++
 .../tests/err_num_mismatch/__init__.py        |  9 +++++
 .../tests/err_num_mismatch/expected_stderr    |  4 ++
 4 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 scripts/kconfig/tests/err_num_mismatch/Kconfig
 create mode 100644 scripts/kconfig/tests/err_num_mismatch/__init__.py
 create mode 100644 scripts/kconfig/tests/err_num_mismatch/expected_stderr

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index ede791a2fe1b..2d8b0c65ce1e 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -244,7 +244,7 @@ static int menu_validate_number(struct symbol *sym, struct symbol *sym2,
 	if (sym->type != S_INT && sym->type != S_HEX)
 		return 0;
 
-	if (sym2->type == S_INT || sym2->type == S_HEX)
+	if (sym2->type == sym->type)
 		return 0;
 
 	if (sym2->type != S_UNKNOWN ||
diff --git a/scripts/kconfig/tests/err_num_mismatch/Kconfig b/scripts/kconfig/tests/err_num_mismatch/Kconfig
new file mode 100644
index 000000000000..8406f3bb6419
--- /dev/null
+++ b/scripts/kconfig/tests/err_num_mismatch/Kconfig
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: GPL-2.0
+# Test 'int' and 'hex' symbols that reference each other
+
+config INT_SOURCE
+	int
+
+config HEX_SOURCE
+	hex
+
+# 'hex' reference from 'int'
+
+config INT_DEFAULT_HEX
+	int
+	default HEX_SOURCE
+
+config INT_RANGE_HEX
+	int
+	range HEX_SOURCE 1
+
+# A hex symbol must not reference an int symbol
+
+config HEX_DEFAULT_INT
+	hex
+	default INT_SOURCE
+
+config HEX_RANGE_INT
+	hex
+	range INT_SOURCE 0x1
+
+# Referencing the same type is valid
+
+config INT_FROM_INT
+	int
+	default INT_SOURCE
+
+config HEX_FROM_HEX
+	hex
+	range 0 HEX_SOURCE
diff --git a/scripts/kconfig/tests/err_num_mismatch/__init__.py b/scripts/kconfig/tests/err_num_mismatch/__init__.py
new file mode 100644
index 000000000000..275f2a6e9a5b
--- /dev/null
+++ b/scripts/kconfig/tests/err_num_mismatch/__init__.py
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0
+"""
+Reject direct references ('default' or 'range') between int and hex options.
+"""
+
+
+def test(conf):
+    assert conf.olddefconfig() == 1
+    assert conf.stderr_matches('expected_stderr')
diff --git a/scripts/kconfig/tests/err_num_mismatch/expected_stderr b/scripts/kconfig/tests/err_num_mismatch/expected_stderr
new file mode 100644
index 000000000000..587c34467ae6
--- /dev/null
+++ b/scripts/kconfig/tests/err_num_mismatch/expected_stderr
@@ -0,0 +1,4 @@
+Kconfig:14: error: 'HEX_SOURCE' is an invalid value for 'integer'
+Kconfig:18: error: 'HEX_SOURCE' is an invalid value for 'integer'
+Kconfig:24: error: 'INT_SOURCE' is an invalid value for 'hex'
+Kconfig:28: error: 'INT_SOURCE' is an invalid value for 'hex'
-- 
2.55.0

