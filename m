Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9784A3F25
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 21:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789506921; cv=none; b=ba0yb2qZvY+UQGpiT7mrcAEIzRgpEsohvIhiBZomqXm5h1qd6Qel5j/4vqxZxcH4A3UOOnodmdIMBJmMKRb41yGMpWvn9vkBKtDHYJaLmyQZHspj2R9azkTZWc2TDV+A2n1tjXVugYewJQmZXs6Ki3EVFBp2oM0INNI5Z6zxQjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789506921; c=relaxed/simple;
	bh=R9MpoArkbHIg3SaeDJtk9ZD6FPf22CQrSgvl16eoetE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sK2R7d99BhmcP+d12rOOwZaobwc8C7Lghb9euJexa+tFdnldY40cWFlG9U+MoEwZNza7nlT6LJJnOGfDm4uWqy3abLSVCtdekUbwT2jg6qxbSzmamG++46uj0rg5ARFVBQtf7ccKE3DWBdZj3RXc3M3Ij5CuXDd2I45IhbkenAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJJG6y4f; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJJG6y4f"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so1011675e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789506918; x=1790111718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7p1LDWrlveId4m1yDuiZZyPI5rbWZo/B9PJF7MZPH1U=;
        b=PJJG6y4fB8XLSEZtepYT+qMXiC+5qehbjZskCsb/DaNZVGbSlXBN4rT6AoZ39Fyy+F
         ro1vw9vDw/iHWcIt8FEF3qYAwP/lEPGxfUQjVkC8Cx7PKVqDx/jKpJkzwW3pl6CgPkBZ
         ZO/smA/DH39qJRpxeDWCdnd6jMeSPeYuafXCi8fj2mNXdufcOj4cM3llgDm82XoXjM39
         KhDx7gF+dPXsJUd/8XOWsAQjK7UIMmOnZbX5EABKKUPYppOSK6Pr5D1itXU/lD0T1wU0
         /iGfFZRP+PYElhU+u/zd4QW+E8L3tW1PABiK+/GVqFlnkosaDO4nutn+FdnzKsUpzHwC
         TIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789506918; x=1790111718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7p1LDWrlveId4m1yDuiZZyPI5rbWZo/B9PJF7MZPH1U=;
        b=sVNSi5cBYzNbHseAv+WP5JzYdp2eX7Oal3fVdAp+xJsrcJhkovbbBqK2+d/LgH9KRC
         yS3mrBm06TezE+8aOg5CUI5pjlgimjjVBaNlulAo+oy8OwLZ4d7rPZ+nbuEu1/SJL/Lp
         85OMdXjT/yDapPqwCKMzCFv6AIbICVKBBnmhQ/NNFfrQx6eLJxY+JDGjuS9ezqJX9Itk
         pwCaORMfd3rY+GlOGItuJpWxLsq+bTj2FGD8MT5Rhq8Z3lyYcsWwOBLohb6Up8zbnZ1Y
         h3HhFz5UlRgFxj9rojL+ijfuLj5IiyNL/3fFd+MCU+oG4UZe8RyN7KHEe91fPvon/2b9
         1ULA==
X-Forwarded-Encrypted: i=1; AKwUvBzYvX9snn9iGakD2zYzH5UVwpLUXDALy6HjJ94VNE70tRL1csvJqTUEcXhiQHRGq+32Wz/1C5J46VpiCRo=@vger.kernel.org
X-Gm-Message-State: AFuF++nCOaCO1NT3+gJN+rLUzsy6rzBa18hJUDoh1a0JZ7KTQXytfbOW
	m462oJhf3s68hlUb5oyM9Ew46oN1QLezbmrckUdi59xeG0hpLKhGpL92
X-Gm-Gg: AYBFou3WmwvT1Vefs6HTXROnwCC42VPxzI0nD0FdEY0t1oovl2r9tdaVCY55SDyReGJ
	hNZrRsYvpQ/IUQ9IxpStI4jQjpI26kRIoVvFBXaQUQJK4X7nbRzayeHy9NeZjNbQsnGZBz3A3vc
	HJAb5XhwH/FZbJkOc2+Sv01rT9YOHHBGhq5/tmd/DwilgmBke41lHxIOtRkCIgJ3aRLaM2PWJzV
	VIVqu959R7L2Zz8C62Z/ukWFWo0mmhSVD6A5NpR3PR08E2PIoIfSyRoDcJapDAsfukZOWHJKzaH
	VcjuKKFpobfyJhLNulMIYsJWseo6fKZsCQOL+nxuh3euwSlh1GJIdyKPUm1HsmNimqv05OiYpWe
	AGd95CGMy1JWvVpAKYoH+Ucgg7pFJqoPJUwv/zCbPgZ4dAFf2osapn8KmecRT77j43toAzkMVTa
	ySqrahfAhgnBeIZD82RdFsXX+np1LPTTI8xhp0HNiypN3xNNmmeL0kfRmN2tX8ZH8jGez5REwtF
	9YRQ6x9La3Fx7UUXEuaPumyIsn2ft9qVhYg
X-Received: by 2002:a05:600c:4f08:b0:49e:63cc:6324 with SMTP id 5b1f17b1804b1-49e9666ba5emr59375e9.6.1789506917972;
        Tue, 15 Sep 2026 14:15:17 -0700 (PDT)
Received: from nixos-office ([2001:8a0:e962:d100:b3c:e4b2:2d5f:e949])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83b1ba9bsm24804695e9.15.2026.09.15.14.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 14:15:17 -0700 (PDT)
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
Subject: [PATCH v2 3/5] kconfig: check for hex and int mismatches
Date: Tue, 15 Sep 2026 22:15:06 +0100
Message-ID: <20260915211508.291790-4-julianbraha@gmail.com>
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

Assisted-by: LLM
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

