Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70602DECA8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 05:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788239622; cv=none; b=MLtd4y30jCfI1eeTVdc4niZqYvP3dwqS/Sq/EPnLY5HxBxlXuJSdYwaT8WqaiFFjw43u2hrpvyzHuVhNUR0J8rDj76P/8ZuihI1GzEOvHm6amQB6foxTgtozMvPWAi5BvNAHRPuyfEIn+HlRUzSySGGpmIXJKwlAGGRVshCS/tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788239622; c=relaxed/simple;
	bh=GsTVhOz/EH9XvSo04qOi4UiTRKix8aJWoG/y+4/1MIY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AzvvuIBjZdpP2xcd0jXYYrwTx8OgEng6Y/me0V9McC38wPq6GnisqzeGtOuNbLSaYTNDA19BNNusrahx4ppeNnyo9R3HC6EZcWlodtOkuA3PMLxacvP+iO1TCk0J3YgtG0Ll2r/t1P6h+XjOosov8ZMivm2M1/xyTD3/AzMF0CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FLbWW6Ns; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FLbWW6Ns"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso2955428a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 22:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788239620; x=1788844420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pQmLtKtTCCJ1n+EpRRZhmb6WY92FSv1MiM8tmrPyJrA=;
        b=FLbWW6Nsw/xClX3lo40Sw0e0/Qh34I//uM8LY6WtLE0UV8MVmhQIf+LgAdknLevhJ/
         EulvpcEm6z9gT/nGvdth14k+JrQzPmLAh9b1oScl05W7eYU1KHUfG/X1EY/9+Rtvk9NX
         rMFE9Z6HpSbdPJRXIcxZjmXpEsBDvfORIRGzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788239620; x=1788844420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pQmLtKtTCCJ1n+EpRRZhmb6WY92FSv1MiM8tmrPyJrA=;
        b=P/zq0sUL2XD2SRYbNnHP4jDR07wUlskbFjjwxSwXssYdpdUBJOKP/HJpfvNFQE1Gt+
         E1FKj9hrIRkLrDaLRpqGveuXaIL9hDYC/ZLCse888/BrCmrNSzXh6p/zEx0RqJuHwN7L
         gGslWTMtsG39eEcQ1bTXODvjBXgZoCJWIBiWBf/ju8uyuoVxCcp/Jm+WWSojhG10v5fa
         5P9lJVlWjIi+0Y7+Bp1lxnzqi4xAJrPRGYgn4dotFATVJiHHCc8g4adqeIlayXvl/ywx
         bN835ZA0N27smKQepSQaxhI+x3UkhRzO5gmJ8smHRXUhvzTc0wsZEQbvRcLAgjHysz5N
         Xtbw==
X-Forwarded-Encrypted: i=1; AKwUvByVanJam7lrRWF10Su/I8VkvvJYrGo1uAoyjqBoHv29KE/2JbF+wyBwTwiKheGiTENEWZldBysIY8OW+pg=@vger.kernel.org
X-Gm-Message-State: AFuF++ldNb81cImhM6oPs66vtVf7QNd8DD/f4TJx33mpIkUbI/X+75bw
	1SZu9xHCrIM7zQamjoTWcicOmjeQW50AA+ixxCXY1l+qKdscqEppuSdNlOvdpbPENg==
X-Gm-Gg: AYBFou2rvOVWta/DVEPPTTt8MDE71V3QsrjwXNworVx8eanoDg7C3lv2prpvNSRDgCw
	q6UZXxabI/414Pt378I6WDKUw2vVJRWFgbFwSqrIPff4svD50udMl4aIJxiLTPOp0ixZ7mOm3jw
	LNyWDetYVhy8wdwTzwOM32i0wA4bM8VN/pDc2Q85gWH38CGIRpcfAA82qr/rnAIqINPnUyF79v2
	jvFVF/T/jKif8RwLDSCFjPM6PnZabJjL7RB4wQISDdY6aquQHrmy8Z+32H9ANuYosLtOU08yR5v
	U/6qpjLarIhoytoXDtn0J5EjcN5i3yGSewZBGWTZ+/01+HnRPfq0h9TA+kZ+vjBaGa0sylqOO/H
	wbYrnv286EfrPwe2w9fRwwLV3Es/pr8sEwfq5ONFS0QfY2rWWfJqdvRKbeRjhP+jINJZzrPcob/
	d+vcv9ZcnH9Ovrq5XorwA4ahb5Ro9bVoI5xxgsKKniBd1oH0aKusj56EgQLyOShSCd9htP19qo+
	ZIhw8A9m9Vhtq2ezfjDj71cbmDQ8BE24aYklYvqUaB+IPonRmA=
X-Received: by 2002:a17:90b:2783:b0:398:9beb:5c19 with SMTP id 98e67ed59e1d1-3989beb6352mr33920292a91.20.1788239620229;
        Mon, 31 Aug 2026 22:13:40 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:ee2f:5af8:b50:f96b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d4637a3sm3427083a91.5.2026.08.31.22.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 22:13:39 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Haoqin Huang <haoqinhuang7@gmail.com>,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH] zram: remove unreachable kernel_read_file_from_path() return check
Date: Tue,  1 Sep 2026 14:13:05 +0900
Message-ID: <20260901051335.2202390-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sashiko reported that:
kernel_read_file_from_path() returns negative error for zero-sized
files, so we cannot have "sz == 0" return, remove it and use a
generic error message instead.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zram_drv.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index a9b3bb1d3bef..809284aee124 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1717,11 +1717,6 @@ static int comp_params_store(struct zram *zram, u32 prio, s32 level,
 			       dict_path, sz);
 			return sz;
 		}
-		if (sz == 0) {
-			pr_err("failed to load dictionary %s (empty file)\n",
-			       dict_path);
-			return -EINVAL;
-		}
 	}
 
 	zram->params[prio].dict_sz = sz;
-- 
2.55.0.897.gb25b4bd76c-goog

