Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792550568;
	b=pxcZKTMFAcTOBzyu6Vb5EIv3BHS0npfmvvof8K3JIh6vI96XXhBIkb7lbyf/GY1xKpyM
	 vvgCb2vYt13p0/lnLwxTj09MfyrECuOzJEr/rQZbk1RYOlBJjMx/RRI8xXQ51aC+nSYjP
	 Ofi8TogMuvcYXjjZTapldPtjt5wRa/VHTARZcfVzgBorbOetK5sexKq9YOJXKL/GiXf3D
	 F+MOelZep3jnDzWxYNpp16s8NNDTEYrxNR8LLODoBWtV0qwYlyotW0YPZGzdq2HX3uI2a
	 rlZ2sLIoo2buYQAf70Pl331L18EeMm1KaHStZTaTVEc/onyMTpstpYFx/y+F1V+F+7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792550568;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mz2Ta6sSCS/adIOr1Yl6IEh9cTq0/Y7T2NePoCn0BS4=;
	b=uGGnAc0q62oEYghKgaHD3XQAOsnybmq94sOAB36hhUU03uixdTne77kKuPFkhikeaZtI
	 meSMQyIUdLYS59iZtTjlPlEPh+hGvkjmSXbDx6fNJ3veicOsN7axql1lamU7PMc2iJkBs
	 e9K6Tw3dq7gxLjbEd6JOWLLGJhEraviymR1pqewopD7zK9RhOASN8jvrB8tA/s8uALnZI
	 L0ERPt7WbZn05X418nc6VP2TciecJp/2Vx25TxqvY09yuJlV26WlB4Zhky13lmbLH8B+q
	 eobRCUON7aMzXAjHdoG4QFXXCGc9WjJJXMHK1SM2fc3LTbNXKNCwoE/N0n0jO+SizSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oVnOeSmp;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F74606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0F74606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oVnOeSmp
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35943f55c06so423693eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792550567; x=1793155367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mz2Ta6sSCS/adIOr1Yl6IEh9cTq0/Y7T2NePoCn0BS4=;
        b=oVnOeSmp399DWRRdWjIHbKji6b+aCPST/ztu3v98ifV82bIebM78ZUmqlMuSs7H2Ve
         uPmZS8YU124ys9y2+HwW5I3f5h5byWNxnPBYUB35eQWRYsGoT67CPbR1W66xe99Q/1Fi
         bCvOcsk9V1n+wJkbJcXJrt7iSOkbVY7bhx9ik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792550567; x=1793155367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mz2Ta6sSCS/adIOr1Yl6IEh9cTq0/Y7T2NePoCn0BS4=;
        b=MwGS/s8DFyXOmRkERJsl6ydZYMXwMMmx7e7bXCfhKSzRpxR7JfAY4Lciw832Dfw9a2
         mvqfRGf0Sij57G0tP7cGq943rhS/tDojLdoMelDAUi5xU0DVXem2IoMo75g+wUDRi00w
         39AMPYltNKWRbdCRQMKHQdSU6cDQ7Ciq6wo2Ne69mKPyAOgiJiXsv8OxDK5YZaR4GXho
         QpzXsxgGPamo/eyhACj4g6CciH2FcP4kgKvP71y9KThPzGrT/44Rx2QtAM+oEGgT249X
         TJ6orBRzDYtowjNrU+NxhjyF2+F9vt2fWgXDZgjn5BxRvI8g62VQCPViCxVwSHjbxJjx
         kMbA==
X-Forwarded-Encrypted: i=1; AKwUvBzd40XzKIU+LEIQv1Wf8IVD7Orc24ozhvKm86N88v3QFfG0hZzMlogTqlgUJfPWx8clNB0IoUGMeuJDYdI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLM0aB+BFpYzncXhr98pcLyKzgGxSgTChzi48yVbLU5S0FZLG5t
	D8lXZzOg6yLh/XNb5kNpqCxQ7uwPMgLwMvmtUGrXacMkxHLACO/NOxYT/9sQMk2oTGYIOiWVq3h
	hk3o=
X-Gm-Gg: AYBFou3CUTEjwIjUc4UAGMpNhaa/SyrZDt1L6ie21pSGefTwvMkh8O3IGoeczyb+LLp
	IVWvW/Scy6D8e2zlIAlWj6n2061Y3VhB8FIT1d/IatQ/PhKDHMCHIhactIUQBPpwDfKrUwasEnU
	zu/nfPk41Vub0MoGU+MPzFeXGX8IJrkDNhEFrGirZPrM9D6PAcUIjLa2qKITGQXNMcmOCvdoSRe
	+pemNDAk1Fo+/DhPZrck5bqZKgAHuUbMUZpd5x8+m9lKO/V0gEWTllkCcaGL4FgCGOtdlhCqpa6
	N0iMxwQg+I4BgQ8UADdSI3MhZEHuvnzdVRo56hLwHU6RJtteaanpdkvRAc60qS4qb5VUidsE3/N
	7fsy8TS3U+EtAdr70AeFMgVr3VdVq+OEDSe9DqQ1p3CK+2ubqIzkGXfMm1Rm62HGrvm9ZmBVkOG
	7Wqy7e3lSr+UR5d2qXvM5Ixvs+ZFd5GBc3Q4pwRu3RC0fP7VF4h5iGg/tO0YUqq9jbmm9gaeuHU
	L/wuo/iM057wo48siTyBy7RuxJ4YbNod8kH2L/l9DWaD2GYzKQtPoopiYGeEL+1FHj00NewuqVs
	6cy+LXh51o/YxT92kvhRgoxwb7/rygopa49d8I9g8ALV
X-Received: by 2002:a05:7022:3c0c:b0:184:ae11:51c8 with SMTP id a92af1059eb24-18dc094b1ffmr3601255c88.23.1792550566648;
        Tue, 20 Oct 2026 19:42:46 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:97d1:a8be:236d:bf79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm2392047c88.3.2026.10.20.19.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:42:46 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Barry Song <baohua@kernel.org>,
	Bo Zhang <zhangbo0325@gmail.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v6 01/13] zram: prefix backends printk-s
Date: Wed, 21 Oct 2026 11:42:11 +0900
Message-ID: <20261021024236.1787884-2-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261021024236.1787884-1-senozhatsky@chromium.org>
References: <20261021024236.1787884-1-senozhatsky@chromium.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, zram backends prefix printk-s with their
names, which may look a little confusing, e.g.
"zstd: alloc size 408128".  In addition, prefix
backend names with "zram:" so it's clear that the
message is coming from a zram backend.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/backend_842.c     | 2 +-
 drivers/block/zram/backend_deflate.c | 2 +-
 drivers/block/zram/backend_lz4.c     | 2 +-
 drivers/block/zram/backend_lz4hc.c   | 2 +-
 drivers/block/zram/backend_lzo.c     | 2 +-
 drivers/block/zram/backend_lzorle.c  | 2 +-
 drivers/block/zram/backend_zstd.c    | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/block/zram/backend_842.c b/drivers/block/zram/backend_842.c
index 3846a04c69d7..56ffda201727 100644
--- a/drivers/block/zram/backend_842.c
+++ b/drivers/block/zram/backend_842.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
-#define pr_fmt(fmt) "842: " fmt
+#define pr_fmt(fmt) "zram: 842: " fmt
 
 #include <linux/kernel.h>
 #include <linux/slab.h>
diff --git a/drivers/block/zram/backend_deflate.c b/drivers/block/zram/backend_deflate.c
index f71b11bcac78..20685aca9bdc 100644
--- a/drivers/block/zram/backend_deflate.c
+++ b/drivers/block/zram/backend_deflate.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
-#define pr_fmt(fmt) "deflate: " fmt
+#define pr_fmt(fmt) "zram: deflate: " fmt
 
 #include <linux/kernel.h>
 #include <linux/slab.h>
diff --git a/drivers/block/zram/backend_lz4.c b/drivers/block/zram/backend_lz4.c
index 1e4ad31d39a6..158fd8b5e8a9 100644
--- a/drivers/block/zram/backend_lz4.c
+++ b/drivers/block/zram/backend_lz4.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
-#define pr_fmt(fmt) "lz4: " fmt
+#define pr_fmt(fmt) "zram: lz4: " fmt
 
 #include <linux/kernel.h>
 #include <linux/lz4.h>
diff --git a/drivers/block/zram/backend_lz4hc.c b/drivers/block/zram/backend_lz4hc.c
index d8aa01bb258f..5c009835a684 100644
--- a/drivers/block/zram/backend_lz4hc.c
+++ b/drivers/block/zram/backend_lz4hc.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
-#define pr_fmt(fmt) "lz4hc: " fmt
+#define pr_fmt(fmt) "zram: lz4hc: " fmt
 
 #include <linux/kernel.h>
 #include <linux/lz4.h>
diff --git a/drivers/block/zram/backend_lzo.c b/drivers/block/zram/backend_lzo.c
index d83f92cf757c..78538479c511 100644
--- a/drivers/block/zram/backend_lzo.c
+++ b/drivers/block/zram/backend_lzo.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
-#define pr_fmt(fmt) "lzo: " fmt
+#define pr_fmt(fmt) "zram: lzo: " fmt
 
 #include <linux/kernel.h>
 #include <linux/slab.h>
diff --git a/drivers/block/zram/backend_lzorle.c b/drivers/block/zram/backend_lzorle.c
index 1b120d062c92..011787f1430b 100644
--- a/drivers/block/zram/backend_lzorle.c
+++ b/drivers/block/zram/backend_lzorle.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
-#define pr_fmt(fmt) "lzo-rle: " fmt
+#define pr_fmt(fmt) "zram: lzo-rle: " fmt
 
 #include <linux/kernel.h>
 #include <linux/slab.h>
diff --git a/drivers/block/zram/backend_zstd.c b/drivers/block/zram/backend_zstd.c
index 08da3810cffd..127976b5455b 100644
--- a/drivers/block/zram/backend_zstd.c
+++ b/drivers/block/zram/backend_zstd.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
-#define pr_fmt(fmt) "zstd: " fmt
+#define pr_fmt(fmt) "zram: zstd: " fmt
 
 #include <linux/kernel.h>
 #include <linux/slab.h>
-- 
2.56.0.212.g129ede20d9-goog

