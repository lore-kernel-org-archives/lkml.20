Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336FA346ACE
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790557953; cv=none; b=L1RxjCUO+6wg+0lGr96PA6Jp1xiMQkX1Ht3bcgfjfvP5eWaGLelqYNzTXXzT4Y0O3q/BnmXBYwDCNfT00ZEKN/z/y4WgVrrkaTU1nD1S4y8MLUHEhjT4R/kSNuvt4NmV3CrWdcyxU8N2EWA2aDB1nfXUTpDw6hBt6DX9+D8mdpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790557953; c=relaxed/simple;
	bh=7H9GI30AsWmAlTdg30uohie4gLRcANCA6UmHmEupp3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cO1MRhgG1adDbACaY6Tof7Tbq6kLS19SfHQwUdSttCKV1EA9agTBvf2kqulEloiO83LhkwDx/Hx+4iOY+yd4CL4ahBxHfXSdVNvc7HGlyz8aOcIoxK49VFtxH+zteXduvjTmseoL3R8Yt+HD9qT2Ye4Pq970AZPybYPHfKHR+3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H5+l+qYo; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H5+l+qYo"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8692a8568e9so1044045b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790557951; x=1791162751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jWbFM6ywa1yjj692OE0MrLQnEnm7JyCgqunSYul2orw=;
        b=H5+l+qYos+zmT6KE8uplrh8S155yY15lByYW0kkZcZYgRqPz7z+r7QD8+mkh/gSBQa
         riyTtQNBiCV0oPPqW8du0Xq3Bja7ChLyfT1vqAHuaNi0Ls5Amq7XHl5T73QZjdaXXmRw
         cdssomUZFMpui0wtviLJK87a6SaNIoK8x6YR/1PA9FByjtv7x0MlFW8yrcmihKzr675A
         8/wtREQkdLLoPffPgcsS8SwqFC3OFhkDunkFrDrKBkcjPQE35y0Gd/pJIcSO9S213i1V
         QYmB1lNO0h5Cy2+kFgVmaoO/JI1vFfyU1sPg7jKVZEHc5vt1QH2hfFgFJvrhtruOhSs0
         Hr8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790557951; x=1791162751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jWbFM6ywa1yjj692OE0MrLQnEnm7JyCgqunSYul2orw=;
        b=D6Lm0QzjZlRgcwT9xZmuJ18g9EW1pCNZQlFuevwl6Fs6RF+BLSaZ+j9gXiEettHlDJ
         QGsuHR/Wbvzj/R5yBzHwaRevElKkH44uWmsRTKC7P/kQPInMZiglMhvOZgIs95fjOWx8
         5vr7WqWyM8XVNcPGltVNkjO0WvYEENfyl4vaBEQfhRxDN3scCAAz/tal+DbMTIr7os7q
         4o35f06glzXp1ITViDeSxAKR3UgkWc0xn0wCslGGDOL5L2AJqLi2zK1RnpUHozwGL+TB
         4GBC1kd2SYL1GeEr3DJa7eQR05NiLOed9r+hM1kCP/fCsuwvi9TClUJoEl8QO198UL0K
         uNkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzz0/WDy5/D+8TmP2Gq+h6Zyu5JBZXwMoebphmiWbY0PWMB3+lmiyfdhkW4TNE0ks3vix7g3BLxKNEfBXE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLU0/TeSHU3OXHFJ6WCCck0a/2Zu6pqzj7Dph9L6FXPA2VjPIDt
	8cQeMCfmcy2Wk6GAXX++ZwVWD7x5O6tD0Z66Jw3ajVnKL0DEG1I7BByQ
X-Gm-Gg: AYBFou3EUhtchVGmOeqomLk62/UXXoqfjNOZView7YyY7l1ZMGylb+YPlgegMHgp7CY
	vIBKCEDA1A13xczGJa+RqjPa4AmTU3Z9sTJM4nVgH9QGR9Ph83tkLUSWooAMDvoGj0xhb5Tj2eW
	4G8seGV+nwJhEvcu8l6VJQ42pz5Ql02W5RdDOg3+m6KeKPGi5rXIyDml4OXdlgTZ47/rELK3PO3
	gEI/GzSKU9NrQ5LLMNLyq1sZhjqlWUNQCFRbbiz/wCvRS3Aj/hpHMUzC+bCfEzXp3IeMT4XxFrM
	zC0tR3Dj+rtJ2ghDWmRUqmLipkZ5CaxFkuBlfJ8rsV9RFIoIM/N5I/9YvYnJDfy7zhHvjaEKTj9
	XRMta10NCNi4xWK96G31pnslr3OouiTypVnz28EwUw/KtHQVOcSjZDAteTDO2seDLssHokMR3d+
	Gv/oOsIt5yOv48WqjgoVTsWudsGACDyEfauOJGfP6wmwb6GR1KfqkrNEjLs1Nz1OwxyJV4AwcBb
	lZdOzuuPdcXk1YI
X-Received: by 2002:a17:90b:55d0:b0:398:9bd5:490b with SMTP id 98e67ed59e1d1-3a098cdbb1fmr9655552a91.18.1790557951540;
        Sun, 27 Sep 2026 18:12:31 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0e7036e3bsm10425773a91.13.2026.09.27.18.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 18:12:31 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: lukas@wunner.de,
	linux-cxl@vger.kernel.org,
	akpm@linux-foundation.org,
	Jonathan.Cameron@huawei.com,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jic23@kernel.org,
	bhelgaas@google.com,
	alistair@alistair23.me,
	djbw@kernel.org,
	linux-pci@vger.kernel.org
Cc: wilfred.mallawa@wdc.com,
	a.hindborg@kernel.org,
	gregkh@linuxfoundation.org,
	alex.gaynor@gmail.com,
	alistair23@gmail.com,
	aliceryhl@google.com,
	benno.lossin@proton.me,
	boqun.feng@gmail.com,
	bjorn3_gh@protonmail.com,
	tmgross@umich.edu,
	gary@garyguo.net,
	ojeda@kernel.org,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 08/22] rust: add bindings for hash.h
Date: Mon, 28 Sep 2026 11:11:09 +1000
Message-ID: <20260928011123.450800-9-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928011123.450800-1-alistair.francis@wdc.com>
References: <20260928011123.450800-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

Make the functions crypto_shash_descsize(), crypto_shash_digestsize()
and crypto_free_shash() available to Rust.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/helpers/hash.c             | 18 ++++++++++++++++++
 rust/helpers/helpers.c          |  1 +
 3 files changed, 20 insertions(+)
 create mode 100644 rust/helpers/hash.c

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 4b31aa7f432f..fd223b6c5aaf 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -30,6 +30,7 @@
 
 #include <linux/acpi.h>
 #include <linux/gpu_buddy.h>
+#include <crypto/hash.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
diff --git a/rust/helpers/hash.c b/rust/helpers/hash.c
new file mode 100644
index 000000000000..23a63618a370
--- /dev/null
+++ b/rust/helpers/hash.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <crypto/hash.h>
+
+__rust_helper unsigned int rust_helper_crypto_shash_descsize(struct crypto_shash *tfm)
+{
+	return crypto_shash_descsize(tfm);
+}
+
+__rust_helper unsigned int rust_helper_crypto_shash_digestsize(struct crypto_shash *tfm)
+{
+	return crypto_shash_digestsize(tfm);
+}
+
+__rust_helper void rust_helper_crypto_free_shash(struct crypto_shash *tfm)
+{
+	crypto_free_shash(tfm);
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 440fb7638e3c..09ec69f736b1 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -66,6 +66,7 @@
 #include "fs.c"
 #include "fwctl.c"
 #include "gpu.c"
+#include "hash.c"
 #include "interrupt.c"
 #include "io.c"
 #include "irq.c"
-- 
2.55.0

