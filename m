Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3CA483815
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525350; cv=none; b=ITxVqKTHzlvzA5HUsY/hzjsp0HcY+lMRc0G5OFlJf47p03yxj8OsW4Jx/AFPqzTmRVyBkd15v7HmNPHV7XQ9iwgJr0osgC3WJ1DOHQqCdj58tfERwwEUvCK2Kmz/WuOXlAPzbbFtu4BhQ0ZHdXuU3shXQnhQcBBfej0Lfa/l2OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525350; c=relaxed/simple;
	bh=7qSKx8qU0dtDIv0Cc2K+MeprhaQJagiMo7bfMBBJGWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NFz+5KovzqNg1ipqtMcNoAZv6ODSZ4D9NxxR87JzIEOp2t2AKZh0x7gnnMqiNrsHZ1e63yQmek+RS1P6lHpXBrTnwLREM0BuFZ01Wy5/vd8WZaTYWbh7UH6HQYiezznRu8ql6EO90t9X8oZwaD7BT9s37gSywcV9+ALtGOf/DGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wjk1W2oR; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wjk1W2oR"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc1b838f9b6so1156968a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525348; x=1789130148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z8im8PClxGl7lgHdzbONpMSKT2jRICkKmM0EvGV5X+0=;
        b=Wjk1W2oRI7iRPokcVKMBiislolfVyW03O2VIi549/j6ap8XXuFtCeJaqRhT5l0tvhv
         INCCFomq61kh2k8uoKIyE2mDP03yZ2bssksMOKc7o/bqU2BsnNpa81cGf9IVmlqcQQ4/
         wojawpP2d+sEAzkybEt8V7Wrg6q9veqwl4uQphc1LT4+jPp2IK+K3XhOl/rjUrXHQDfA
         XXBxEzK7xEu2TYzDF7mfhmjBt0FwGPqBe+4NvX9wisJM7ZFKBlNC89HGnG872tKg6M6E
         Dx7JG2Dehh2iLOhBgVI6ev2Y/CwNUXlrjq5cHzRUJT3wQKfqYqGIrl6bMjn962KDywlG
         tayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525348; x=1789130148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z8im8PClxGl7lgHdzbONpMSKT2jRICkKmM0EvGV5X+0=;
        b=E2Sg4G+/cWb5DE87/OApmc6Cc047WE/FWQuhvE4DdDrsCFBwPTWNCieb3Q1JZ8rfNp
         9sbDM8HGL/4JPdK3iI9XEuJwg4ZDBja37t5e3a0ZrvTsDmq+5+CTOtfTC49Vb+K/0PvC
         KnJlknddPcYNV7Os7E2iQHIJokpzV7Wr6ckR4jBADXV1jw7DSE5lqE+aSkU/UF9kvYBs
         Mpp4Fj13yLa/+a5tx2yUfHC5YCcSBrz4qLb+1YELAP3nl+FhCNLP4TSFyj4dnqsxqR8x
         VHeNsM5TJo0jeW12zRbjgyDt8/jdizPTlRVupNOXsGqmVUa2laIB6zlnWBJrbu7hQnpP
         bqJA==
X-Gm-Message-State: AFuF++m+CeUb6mL3Ai24DEczi94UlGw4hK+EbcqEuUXyhkSLakImbOMs
	ZjfqXnRxDN8Frk+UOR58tRjF5/M0SqY0Hry++uGKyh+HQEDDrYwdncKl
X-Gm-Gg: AYBFou13LfKcPco91kGgxlN4c0SJIT73WJuvneCbFqNiQUYdYtzDH/WovNGnRwtozPp
	GmvFYuxMEsgqzJUsAuVMNkQWQuYVuLGPsh/qwVhXaAxlrI9NMcCXOw2hP7q0xgNggVAjfH8H8F3
	b88S8ozPBADQ2QZQehkunCURCWtMIhlcF7LKDPL2YN38XK5h7z4Y0r83MHdmYn6aKi0Q4fAfUlw
	MGFCFbLwA+Zq8plUCGoIDbvTTlOUf/0l/+POdN0KxpXcKarkG5v5Qr+ZylDXJvkEop23EtPMe9j
	h80PdxsuEMjEyfnicCgRyJLgEKrAdoQjRFh+PlIBWbt+cJRvV18TWf6+UnKjByb+pGaJ3VdUnNt
	s82vN78huvUl1beJL8JzYnipoKv2Sq8zeCmaeG3nzTlgQ1+OeKADyKpsJAe5TsfAmXVvibSZiSS
	+5PD0sBgo9Y1BzbN0T2hdgqFwRsj7mSePaJNIz8ybSjGHdUj3W3HFuD5IMKBOO/t7VT41MXVY5p
	EKop7P8Fbh+YIU=
X-Received: by 2002:a17:90b:2687:b0:395:4290:46e0 with SMTP id 98e67ed59e1d1-39b2609f768mr9755672a91.5.1788525348223;
        Fri, 04 Sep 2026 05:35:48 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432423f99fsm6229374c88.1.2026.09.04.05.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:35:47 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] firmware: fix typo "upto" in comments
Date: Fri,  4 Sep 2026 18:05:38 +0530
Message-ID: <20260904123541.38602-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904123541.38602-1-hemanth.selam@gmail.com>
References: <20260904123541.38602-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "upto" to "up to", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/firmware/ti_sci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index cc747ab0237f..94104edba9a0 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -4050,7 +4050,7 @@ static const struct ti_sci_desc ti_sci_pmmc_k2g_desc = {
 	.default_host_id = 2,
 	/* Conservative duration */
 	.max_rx_timeout_ms = 1000,
-	/* Limited by MBOX_TX_QUEUE_LEN. K2G can handle upto 128 messages! */
+	/* Limited by MBOX_TX_QUEUE_LEN. K2G can handle up to 128 messages! */
 	.max_msgs = 20,
 	.max_msg_size = 64,
 };
@@ -4060,7 +4060,7 @@ static const struct ti_sci_desc ti_sci_pmmc_am654_desc = {
 	.default_host_id = 12,
 	/* Conservative duration */
 	.max_rx_timeout_ms = 10000,
-	/* Limited by MBOX_TX_QUEUE_LEN. K2G can handle upto 128 messages! */
+	/* Limited by MBOX_TX_QUEUE_LEN. K2G can handle up to 128 messages! */
 	.max_msgs = 20,
 	.max_msg_size = 60,
 };
-- 
2.48.1

