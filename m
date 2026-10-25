Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792894733;
	b=netKYpfN/ci+zRDQNE3Cs6ANayAxklJKl8b5XKl22MWcDYecomnxG7xTfsgXelyVyX1A
	 ExtuoY+HV0/pfaXyKvKhZFYANwWuZkJHVjWQQWgwWx1kfFf9gAmdaVGkogm8LsBmSqOwW
	 rMZIYijRbmMHs0z/HEElQU5IJAxDCAjiXv3LXCXR0gxQuEoQqw8ntwiTd/nQ78P/4U9lz
	 VH/bZeLLzikIJUKQZbBvwuY9NE4PvZk3Asyc+RauCHRIie/M1KcpXDa/phCfZIo9VKZDk
	 sPh3YL9KyVr8E/rRZzRAteKqv8b73ZKhQalF1EhSYhTGXNvNvmvyqzYR3QOkjF7aajw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792894733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NnTIHT+TXV1eKkVYDiQUUSu10XDJ/e0uYyNb5Fs1tYM=;
	b=u3DxtTgSNilxNj+NMO8WuJa1Y449kKmooXRGy2BSRqyRWAe3c7Lonz9e5lkPIfEML1li
	 ghNvBue2Fju4+neQmucd4ezT1P9c2Ojd5vwMiPwtzxPG2RLkCV0tUh3yqACZ4blcyjFVo
	 zezJ898iI32UIXwfK7j25LAR+LvdYohodrSUK6DcMyhjNgjiU8IAWyNAsP+YvsriszVKO
	 mbbOO7gMr+9YCxLq8b3UJicUisGX8TvODtjqzbGu6ceC2LOXeHu5Oq6Tqu7ZMtxt9elxi
	 /RG1WjghNDvrfnn3yDhYC84wGojvqmfWKYoZB4dXEvkAPPLMunC/ak7G+DRlDtC7VHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DzC6fXyh;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E505606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E505606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DzC6fXyh
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-14394530ec6so2650675c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792894732; x=1793499532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NnTIHT+TXV1eKkVYDiQUUSu10XDJ/e0uYyNb5Fs1tYM=;
        b=DzC6fXyhaOySYAvED9PkWySLle2vpEEhY7yVDpuTzevNQKn2qqaEfj5kA6aU3VtLs6
         LK0RpRV3SzvxKD+HeaTHkJZE5R/544dmXn4MMbUMS5FOrdxGxkfdZSD6+uukYrFN6dq+
         Fa+oVFPFcpEjmVgOBZ0PFvFLp3+BXOhApfZws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792894732; x=1793499532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NnTIHT+TXV1eKkVYDiQUUSu10XDJ/e0uYyNb5Fs1tYM=;
        b=Prkte+tClJeojw2UxNyJCiZXaWnNNDtv1GuhTxI8ld+k0Cxe8vOq9PrcNcweXThYAV
         O26vuMGmPasISFL7IG3rBpO2HGLDMOkEgG8Mq1t7FrWFouoL9HchusquUSVUnWyfyAql
         Mj9gD24qrDRec3T6K1KdBjlSBzB7TX0tbbrZxA4RroSEFNt4Of/Jva6plNjQfQjCiY1a
         YEpMdkY/TMpiy9xCBr1evr7OxDc4uazdqfkukKiXQpKNwEqvj7qip5t//IQDdIGk+WOs
         cpJMP610dZf1ftnkCCyKmRJb3S2yWpJKR8HOqtMG8qtDMACmc1LyjRD3ZGcSXvOLgtaF
         F8sA==
X-Forwarded-Encrypted: i=1; AKwUvBwXbGBxMyHCzioWMOtqlHVTn8Mg70LVhCXvScWtFzHH9MtzGsocx9u0uD+DR7bM60U/mx4PccGQ+SPrPgM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXQYy9N7chbuKng3CVI6k9i9w0vOSSp3kzxHo2yNiiuwURwSd+
	vj05lOVY2RshMFGz2OdIjJuUrPKSfadwRWqNGy/mcqZI+oufaCtwX62sB0ZeHv96Hw==
X-Gm-Gg: AYBFou2RYL0kc3nOjch8ne4zKKKXXA3oSpXkRIxpmw4PRryR56tXzu3m0lYj40DZfw/
	JXe0oSYWHCB9k9W+xWMSLdhVquySHOtFP9HiA7sFFtM+nzfQV/gREz7O18UVp6nflTtPFPYL1Xf
	EbHxrU+vu5GrbpKvFFqCKzKgnGfcqxfOmsDSWGIg8CCZFI51jTgY4IKckuqLrZjuzKjtEIgl16b
	lxEUi81Nw1Tmi8BgUaA1uCy60yUCbPkDkBB10ZWn+5VXCY3DvImYv7nQxO3epAzBoI0P9sEDdDU
	hr9XUOZoGlRpZAGV+JNUlHWLvN+2gGFymzy9mgACeS0j89j231Gx+w77cazxSTinN5jEx4hyGuJ
	T4OagD5ZxqvL6vULlyKSnEM9D+Zo8ixzkxxJsXrtMnkFr9Q3qhfKxDabbcGOQ2+2zpkIvktyRrB
	SSGmSQrpJJERQtDVx0GbLkPVe1kaPJqaLk8eb8aWIWKP6jPVyM0bOYNcHDHW1/XSRqSDIWzDT1b
	rBf0l8cF92AnMrTAZiWBdAbquvU73IP9/7YlN41CMyyCzuh7nwXTABXDfwhJ5b3w+jzTz4s1JfW
	s9FqMV8eGTKz+awivtUXtwE7UFKhzAaK+Hyo4wbyFBql
X-Received: by 2002:a05:701b:4306:20b0:184:1898:add2 with SMTP id a92af1059eb24-19935625958mr3965718c88.26.1792894732162;
        Sat, 24 Oct 2026 19:18:52 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:9f87:66fc:8c85:11bb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee5asm10387242c88.8.2026.10.24.19.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:18:51 -0700 (PDT)
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
Subject: [PATCH v7 03/15] zram: reset writeback state in zram_reset_device()
Date: Sun, 25 Oct 2026 11:18:19 +0900
Message-ID: <20261025021839.1542805-4-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
In-Reply-To: <20261025021839.1542805-1-senozhatsky@chromium.org>
References: <20261025021839.1542805-1-senozhatsky@chromium.org>
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

Reset all writeback state to its initial defaults on device reset.
We used to keep writeback related data in zram->stats, which
zram_reset_device() clears, but commit 1d69a3f8ae77 ("zram: idle
writeback fixes and cleanup") moved it (along with the newly added
wb_limit_enable) to struct zram, after which neither of them was
reset anymore.  wb_batch_size and compressed_wb, which were added
later, are not reset either.

The patch is more about just being pedantic.

Acked-by: Brian Geffon <bgeffon@google.com>
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zram_drv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 593fa4ae47c4..0e1aa0da11aa 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -694,6 +694,7 @@ static void reset_bdev(struct zram *zram)
 	zram->disk->fops = &zram_devops;
 	kvfree(zram->bitmap);
 	zram->bitmap = NULL;
+	zram->nr_pages = 0;
 }
 
 static ssize_t backing_dev_show(struct device *dev,
@@ -2881,6 +2882,12 @@ static void zram_reset_device(struct zram *zram)
 	zram_destroy_comps(zram);
 	memset(&zram->stats, 0, sizeof(zram->stats));
 	reset_bdev(zram);
+#ifdef CONFIG_ZRAM_WRITEBACK
+	zram->wb_limit_enable = false;
+	zram->bd_wb_limit = 0;
+	zram->wb_batch_size = 32;
+	zram->compressed_wb = false;
+#endif
 }
 
 static ssize_t disksize_store(struct device *dev, struct device_attribute *attr,
-- 
2.56.0.257.gf7497c7d27-goog

