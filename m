Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A87443E3B
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 12:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791202890; cv=none; b=XCvbUYCtb0pcSC9/zSE9/jbnC0gryjDlX6P2szMZwCs7BoP8DzNrD6sBIFVSAonwHqq6YwZgLw1eHK0JMjdmlTiQWAaIqdM76pssJLyHBXzKSMjyfFxs91e4aud1p811bju8zWStRfnBCHTbQKfsPZNtu9+F7g45zlu0uCaoQFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791202890; c=relaxed/simple;
	bh=TsYDKEkC7DrnJjoJ3bjAVeXMyRvjIspkjmI/66uJvgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rEsDzavjEGhT4u0zKZZWmjzUzQW7aOLi7b0UQNuEii8MuQ+016/IBrDVCB2f3Uxp7TOOpnPCxImqBqwSDJ3KZIydLtA7MhLTz5NfAF7XHorlQW39l4oFWHESV+Z+gb5fWHM2aZfa6xaIrneCnMGD4pIYvgG93Vw/8qkv+sc4/Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lq1LDvU1; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lq1LDvU1"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc4dbcf2b85so683613a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 05:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791202882; x=1791807682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JEfqKq8AUXff9rV1VBfaaWIWwsRhsIZ+aEa8DBn6+DQ=;
        b=lq1LDvU1MSLUbGEFw8gTcDcoyGTw4rtn7sOPFDbOu6JJZHhVeHGu5Eilpp/fmmKRvc
         XroKCuAwln6Awl3fJdhVRik+kKPtZjuNEQYSvtz3fFpNk0KbjCDvsvcKKxbyvszHI3wH
         v6Pv2FYGWC+hEVnTUCBZPSpRZdaa9fDPN14uk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791202882; x=1791807682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JEfqKq8AUXff9rV1VBfaaWIWwsRhsIZ+aEa8DBn6+DQ=;
        b=PodVS1k2+ACiM0JnyxD9EjF7TqaIlioq4jJ3uC1u6McbD6kNDv1qns3VMGEZk6oA4n
         seq2g4LJu8tEy0LWL3ibDaL7Wc5lLqYwAnSbHpSc/oMeClTcozaRPotmuIQWSr6KmUQP
         /pb4NqNYTLbu5CsUnPMKT7IlscKdGfQp0rI65T38H0nehADMfxbgw9w+kR/aoHvXVEOq
         01pJY0NNCVy1doG2dABfa1vtLJbtMtChd+ERDE9VjRum5/CDAOEqSLBuEl37s+Gy7QJ9
         f0AsvtOmMdwtkco3j9IoYZnW2MHDXWcHeFAtXyzeueqiECTiyZEEmAy2Iek84vzJH+dL
         1nVA==
X-Forwarded-Encrypted: i=1; AKwUvBxI2vhY1pxZPpQfwi6eSGTIisWi5tE9c98V4j3vmJU50gDAIgROhrEH+igwCyrVTYtnBh+LGHEr1UX2XLk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4l9pkwVtWWz5wc/L/uHlqJ4naPYQfBIbPjOyvql+t1hikF3g8
	PAcEiSm3K3M73xsxUHtlY742LRmmznW8u0oA8LGf39NNSTOqXcb+682w5iJKJwfzLw==
X-Gm-Gg: AYBFou12jfslEqnaOGsiwg8YxmTZUvitmZRBM6GClw/cxgBIfKe8P/kTNGddk3+/PsC
	jMgmikoretDJ/U80hdt06Pv5wjBRGDhzDMBuMsxp9WMs9oMmAjYa/1hB9GR3nLsf+8KfvFGaFop
	OcVFPVtuJukfiVto8g4hDfHZKknneIdImbVQ3ngj0ScVonYfLaWF5+dEHaUqD+6lKSmTPQA6qpn
	orRStv61ORub7OjNBq53znqszLOI78aNK259kdtaeuGTfcucErjETrbZAZglC/4ba3aingt6eub
	SlyOzjnuj1ql1s++2txmEP9RcY7L+J0FRy5hdRplc04AdRyEbydlqzO+8vZE6Uigw6/PvNWCUfx
	tuR4eDDbFRC3eBm1hXnn/sc3ck6vI6EFgn3Z3mpdoy8soqkBKuL4RMDytzvN3Lm6qePConi/fCU
	TLL1tpPvwd3zrZ/DMLEZ2vYzKZxRx7IK7gOECIvQ5099DqGN02ujZ5cvp6Tq+p1ix5EmhSAPwdi
	7hMn4oJ6cTt39KYDpiGGJUpTV3AQhElLOddP3GRFtI72fsaILgkHViWY0rbdMI=
X-Received: by 2002:a17:90b:380f:b0:3a4:eebd:2410 with SMTP id 98e67ed59e1d1-3a7873df65amr5816685a91.37.1791202882532;
        Mon, 05 Oct 2026 05:21:22 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:9211:ddf0:3c6a:bf9e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7e4b00de6sm3342997a91.1.2026.10.05.05.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:21:21 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH 08/10] zram: reset writeback state in zram_reset_device()
Date: Mon,  5 Oct 2026 21:20:23 +0900
Message-ID: <20261005122036.718976-9-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20261005122036.718976-1-senozhatsky@chromium.org>
References: <20261005122036.718976-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reset all writeback state to its initial defaults on device reset.
We used to keep writeback related data in zram->stats, which
zram_reset_device() clears, but commit 1d69a3f8ae77 ("zram: idle
writeback fixes and cleanup") moved it (along with the newly added
wb_limit_enable) to struct zram, after which neither of them was
reset anymore.  wb_batch_size and compressed_wb, which were added
later, are not reset either.

Fixes: 1d69a3f8ae77 ("zram: idle writeback fixes and cleanup")
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
2.56.0.rc1.315.gc6ed9934b7-goog

