Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792894739;
	b=1K24P3xbvFg6+gqriQVv68yrbPG2i83bg9o4fOW8ePgkorKGnI8EQsXWiRSBWRyP5QyH
	 XKWDz/76ikukp5RmP0+ygTMcz1DBAOs8IshqbYDgP7y8YPn/DMpPxBnKhohgC96t9229X
	 oXvZUnvhAM/ryJvPdh0MMVTpquuEHBXAmt/X+inMos67Aqq3buPsScCzI9ZSl3HmpekGu
	 KxVIRATdIsEbcI7pv0Pzc7PzvFpJ62QsSqO8dRnevvFJu0VEdjLrYxlDg7jUBeM79sPsW
	 4AMYHP9axvP34kE9C071MKRzYnxs+wIVsvVJK7HHJb4hcqnA2sPfOrBIbM8l3zIBVbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792894739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=l+1W8fCH2YVVqsp80PGoTHVKE1lHVqXbpp8Ot3nWXz4=;
	b=s74tFeguHgr6HgzfKHeMlAH/WDshji8GufiG3SktT9fidVg0o4LAVahvLAjJl9yw4fqm
	 9ChR7Xt2t80G05oueVR7AbjzqQzAp6S+FZew0m5fjx4i0AW29+Pl49fdnlqiCohaYsbTD
	 DsvGZPB1dMIgnrFxDZs+AyIpUDjBDRzzFNRha2f+a+siAoq8nwC3IVbAczW9vy9a2nkbD
	 RNvrzmiWtiOYxRJQhG4oyB0wAKxIvQNYztmAF+pGc4l/snNE8TUA4L4X9jDsG5iQ3stw5
	 OQQrqGq+Fi5BXodWJJY5WRXh2i22K+m0FG5foZWRovRntdPnpVv+uNrc7Kadd8L2cDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=dKuzwXoM;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA1A606A324
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EA1A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=dKuzwXoM
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-353804b591eso3569635eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792894737; x=1793499537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l+1W8fCH2YVVqsp80PGoTHVKE1lHVqXbpp8Ot3nWXz4=;
        b=dKuzwXoMRhNTEPPA+DYqc/ej4+W59qzyYx6sCUclzvqZgeB66RYor4i/D94aeKEqzH
         4IoO0wWaPdG/H4Mf4fyWOQlFaVVdtbPFYrB3V4vj9VPbZ37MZu4X3HaBELqaT08oMbkY
         drddQU9yy++6qH+dp5MZXklSkL+kdlD8YdeN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792894737; x=1793499537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l+1W8fCH2YVVqsp80PGoTHVKE1lHVqXbpp8Ot3nWXz4=;
        b=Htu/lz5eN4txkBVsAdlu7ihQ1BKjkmOnDGxJ0LRhL6WDtMt/rv4ovCy3wwgOsw5Wbx
         XmQ5mi0S1LmhJJKlXMLNBD0nNwGut4jzYaCyEGSUsimNXJgb2CTn2Zfq641ACiHy0FgA
         t9KYFefIgC7KP2o8Tqf47EzB1N8+gyr2KZBlPCnQgzp2lkBWXUj5gVpmhxBqEL8dHT0M
         M2lMkvNn7g7qHCR4d9m+i+VRcyQ4S8iReXbNSLIYaFkadILWK+T6W/UT8KUfohp0FArx
         zX6qMwySTUYN4VdQ48hnos0PkDkFJVn6LlYz9Of1BLCpIxffYiSkDKCtUKlBcUEiuD0C
         x7zg==
X-Forwarded-Encrypted: i=1; AKwUvBzGDV5aUJqlg9PSy2HtvQZuXGZGBogBbEVsdgpyj4Wo0XBgQgRevy7UP8xaMjKDiSIfCjMyiAyvHqDW1Ws=@vger.kernel.org
X-Gm-Message-State: AFq9FYJB8pBQKFIrU7xijWcwtNXtm/8HPiuceHa00751fUfAO8UPCamN
	Pw0pmzvMba6Kt4EvJgPilzLWIxbff9aDy1CQLVRpZiDjYBRHjYboUmKA1UVBoGzsfuk6du2X0DG
	XFn0=
X-Gm-Gg: AYBFou2SEa5WCrdlIayzsycV3MJDDZU6qvOn08u1pr81AjSecshYJXmPOA3WHuDd6wc
	vWpvCa9ucKrsz+OnCS9tvFnGKpBlnLld1IYECqyyKkkiTj7l04KpihT7dh3FEgIVVMUQeK8/LT8
	PBCMyrbriBbDEPW48xkj7+bUhwQGkSkIf5R/YDo+1xfequqrF1c6bf2jtbgbADmjQ+PTUKSzFWE
	l92Y2U3spCPvc7haDgKGmnQ9K08RuS5jEr6iLbtWUcOTRE0leoGTPLpgOpy2OZRELhjTxaa/lwh
	10D4VGqmTBBm/fG3yZc0DO2Hwxm0iycikuLw4/Esa/rwpto9sU/saQ2StLCbeO9XNFbGZwq0Jin
	j0XpJ/vZkUsGoe9XA4hE4N/COCDoPz2qNrl7P9HadCpIwLJPd94iqglLE2wiq2RP1Rlr6IVSlJl
	O4frTvBWnmzG1Z7z1vFBbgoRTcZWLEaw6muX7gTYBiWqOx3s2uRxXiQ4KuqkD/DdVRw+Zg/FtdE
	jM5+aeuXiPtTw5lKLyP3bGAiWrmYGMNeU8xszuGW2hyuHkFtv58iBWeHImrokD0Gi0vPWgTGO63
	STosoqy0PnAUBQqYoXNwDY7NYn/6IrPzuWm8ly0LZCOQzQ==
X-Received: by 2002:a05:701b:204a:20b0:14d:c7ae:85df with SMTP id a92af1059eb24-1993505df63mr4347970c88.12.1792894736742;
        Sat, 24 Oct 2026 19:18:56 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:9f87:66fc:8c85:11bb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee5asm10387242c88.8.2026.10.24.19.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:18:56 -0700 (PDT)
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
Subject: [PATCH v7 05/15] zram: remove stale WARN_ON() from zram_read_page()
Date: Sun, 25 Oct 2026 11:18:21 +0900
Message-ID: <20261025021839.1542805-6-senozhatsky@chromium.org>
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

The zram_read_page() WARN_ON() is not accurate anymore, because, in
theory, async read from bdev can return -EIO or -ENOMEM.  We report
errors to upper layers via bi_status, so upper layers printk errors.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zram_drv.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 2affac25db5d..beae16f22777 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -2204,10 +2204,6 @@ static int zram_read_page(struct zram *zram, struct page *page,
 		ret = read_from_bdev(zram, page, index, blk_idx, parent);
 	}
 
-	/* Should NEVER happen. Return bio error if it does. */
-	if (WARN_ON(ret < 0))
-		pr_err("Decompression failed! err=%d, page=%lu\n", ret, index);
-
 	return ret;
 }
 
-- 
2.56.0.257.gf7497c7d27-goog

