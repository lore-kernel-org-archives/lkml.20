Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794028845;
	b=qEfwSb8hCN2vKnCwDx/qH8Kzo6K511vv0WZUsAPPtDVE67vg+HlMfEs4YDoKkaT+kscy
	 lY3dmwERHU1ESXJhS+nRkDPDfpUmzuHXiIuhoAzxwIxtvifT4VB+Po6GZ7Cdp+MbnwQro
	 1zd7Td3FvamcKYjDE4l8ykebxqisXdFeI3POHxnPGFJ0tTvNuBaRRi+nS9RLAzvUI8qSc
	 WZV8gjLlF8WBO6iYSPBh6BxFYAyP9dVfm6OZw8P4cvTI8PBITUZhLV/4JCU91qSnYkQkO
	 alfeRw2U9uiVk9BuXpb2+xDsGZLl3/fGgktr2oEmwqELGGp1kP4ZomlBqSXVZTfYQAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794028845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=3LwMhLl+xu0B7C01c0BCieuyM+EtzW58W4xVt/k6oVs=;
	b=An4rpKf+5U5nPhiFu1n3tgm2xE5HW4qbC27ZlF9bIerltMmFVLlMgHRPOZt1n0Z/E08K
	 4epoJaVFvR6EfqVtB/zWYkNtqNXhagQNH2JmOkMUsGClpqO8KX5kdwz6IAw9oJCpmJC2q
	 gMgsDRLcYryFr7ZX1+kn/sHcHdCNjAJQFrY01fEUVUyDpF0tm6+rm8H1V+kp/J05JrQRM
	 ETIUz7TaMJYAdMioTZptcWomGtWSlOVq+1Rs2mtKFqxRYIUMMF123AdqgDgEhjMxTvnUW
	 8lQwqn0wrpdyxlmLsP+60Li4nW3SB5ldcFWm4Z8GnWCr7UYynyBOCdOf30UCTlUyTpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kK3T+VZK;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C749F606A32F
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 05:20:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C749F606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kK3T+VZK
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6b19e291cc6so1266214eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 21:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794028843; x=1794633643; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3LwMhLl+xu0B7C01c0BCieuyM+EtzW58W4xVt/k6oVs=;
        b=kK3T+VZK4hhwfoywzNbt1iPxDngXNQf6oFjWoUS8SjFW/YhOkz6g6Ku/q2uW4jFq0M
         BX+TZrVSgaQl6InwkdvzSA8O+AGNl3HuLBkD6H1vyqM6hkM0hP4Ci+8MAbeSybuYfYm0
         VAXzu5CGAFlm6XaIeXKpuNKpyepqPRkUt4vLlmJuSwAMsG4JvvNFYz+WMZOppzSSyyOv
         dU6hScQGQsCv10Lrj0KIOjjARhcF2sFhD83diy1QdsgLCh2Yz5Cghfo8AbBPtfjSQBqG
         SvxIRKlgRJwaqi939fyOQUvENqqAjoDBzXtU7N0u31Euq6hVJA2M6cnVr65Jojs0s3qL
         XuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794028843; x=1794633643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3LwMhLl+xu0B7C01c0BCieuyM+EtzW58W4xVt/k6oVs=;
        b=IV9lmqMSa/1Y2J6A09J89+TY1ehCfUUmXcloSZXQJmb65zYqwbo1LHdxNV2M/iXThQ
         V4WBZBlYAeAnLRLnAOZO3u8kXhBkkGIfpEEVIEGywgu60CMBkviQ4pNCpkLETWXYa06i
         9ldNTauP0m9j6SYxlKKmqmLtgsjyXMLORqGV1HAS26caLNad3C2GdxLIzq9fKdtKDHtf
         eHQoR2YCbh8yDDv9BcnHYGFaerqbCnDVMsDli5OSYWYbzMNXqHtPtlm1gCCrv2wNYh39
         hpDmrFly6XKMvkfCM3m/3tmBPdXLk6z5tdCKKqT//DOuxggm7KhfFYqTVfxrkBs5R9fd
         wWlg==
X-Forwarded-Encrypted: i=1; AKwUvBwSRclHsHRPVp0/YbEUgt1s/APgxy2Jqper7Zb9Fi6FhWpdTTDu8oo5CGnM0sHXfZq5q+y6Uf0ghFZrJMg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MdCF1DbL4v3ATjZ3UzVUYkJpqbnKTN2Z+wg3Y1iUxUFpGcv2P
	pVRMbSR7dFf6kJxD6hJX3Q0r6BsuJMgfQeB1xx/hk7TUHr64z4ofuCpZ
X-Gm-Gg: AYBFou26RQ+g5M+yJTjUWLxf3KR7VQxUIoqM1NiqqkVtGC8wraKfXqsJKbAXgq9d20E
	ahiSSKlVxGuGEBH6J9tF0va+esmTp5DHM6Wt/cFO/BQ6Me5u0w2Jn5ts1wx/nCHM85gwB3oEwWh
	huxzOvQv2KHV8Zd/jnAwyX4bS9X9E459f8W+QmlIoYK6KXT5HgMz622WAEd6PfyyvJ0/SQE6y/v
	L8BT4YeuunlTcS6w3nYlgZJLgLNN939Dp4EzQzDAzHBwacdpqRSjKafwM7jiyQ2M+ucaB5F1AVz
	q6LhntLQRAPNkZWN/GZIxFgaWpW8CQ8XAl+U9MYM6D1qZNzU0vnQ3zL/d1X0/G0U/XS36EiBMsy
	uVc2saw3wzwUtwgfl0uPfeGFfIKtZrOCwi2Qt2i+y27o+SEWwNSkGDLhXyJSPt05lS3QphbtviR
	p66IIfvE2Vc9FUfloPjIuRI1NN0E/YjiRV2P22Z1EIu3c0L8YR4U2bTVzC6bPEqR1kSB2Tk1i6B
	YiwWspjo3CWDFTlKsbGlPHYXsq3qToPeN5RPEw86tMYM2KXLTONxBiaM3BrtPlYT8PTiFeNU+x4
	hoy/VGwRRBiASQVA119/MJCu6W+Z6InpU7VZ65YcFObU60JWcX3y4J9NirDB0BimQvWhGI3UoSh
	pXpjG/kWQLxIFpnJP6VY8PJeQ7FASupT7ZBbU84j0woYEShpH5ZbUBDeKGUGGk9OqxxJjSNFU/y
	Gtg6Wa41yMAoWYVOy4CwRsXMeTW17zC8fOFYsLMYhKnsEsZWiozM7ZwJ0BEYj0PI49ub7yOGc4j
	A==
X-Received: by 2002:a05:6808:4497:b0:50a:6fcf:d287 with SMTP id 5614622812f47-567e152f7d4mr3697226b6e.37.1794028843358;
        Fri, 06 Nov 2026 21:20:43 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567e7ebf4edsm3059846b6e.13.2026.11.06.21.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 21:20:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 06 Nov 2026 22:20:39 -0700
Subject: [PATCH 1/3] mtdchar: calculate OOB capacity from the starting
 column
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-submit-mtdchar-page-chunking-v1-v1-1-2973a03531bc@gmail.com>
References: <20261106-submit-mtdchar-page-chunking-v1-v1-0-2973a03531bc@gmail.com>
In-Reply-To: <20261106-submit-mtdchar-page-chunking-v1-v1-0-2973a03531bc@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

adjust_oob_length() needs the number of pages covered by an operation,
not their absolute indices. Calculate that count from the initial page
column and the data length instead of subtracting absolute page numbers.

Use a u64 product for the resulting OOB capacity before limiting the
requested OOB length. This keeps the calculation independent of the
absolute flash offset and avoids narrowing the capacity before the
comparison.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/mtdchar.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index bf01e6ac7293..19d33dacb62d 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -576,18 +576,17 @@ static int mtdchar_blkpg_ioctl(struct mtd_info *mtd,
 static void adjust_oob_length(struct mtd_info *mtd, uint64_t start,
 			      struct mtd_oob_ops *ops)
 {
-	uint32_t start_page, end_page;
+	u64 pages;
 	u32 oob_per_page;
 
 	if (ops->len == 0 || ops->ooblen == 0)
 		return;
 
-	start_page = mtd_div_by_ws(start, mtd);
-	end_page = mtd_div_by_ws(start + ops->len - 1, mtd);
+	pages = mtd_div_by_ws(mtd_mod_by_ws(start, mtd) + (u64)ops->len - 1,
+			      mtd) + 1;
 	oob_per_page = mtd_oobavail(mtd, ops);
 
-	ops->ooblen = min_t(size_t, ops->ooblen,
-			    (end_page - start_page + 1) * oob_per_page);
+	ops->ooblen = min_t(u64, ops->ooblen, pages * oob_per_page);
 }
 
 static noinline_for_stack int

-- 
2.53.0

