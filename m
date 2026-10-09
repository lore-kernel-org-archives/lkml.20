Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E927E38836C
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531994; cv=none; b=SJ/ZgyYrHvcMbjhTJLkhfsWevJ2VsdehM2/JHZKEIOB83LLz+GidkZ8W6/qaue/1ajsuWH0rtIaLobLELnKTQWPGtyfzzRR4WJO5BIi1pB7GEmDztD3WPd8+NEUsHnQTlSrQtRIbAaoxZ3g87r40Q/CgBuy8gx25L3TLFfX6EX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531994; c=relaxed/simple;
	bh=KACgpR/FqACTUYHJ+rkYS/khbrSHMrz626wNgCNHipk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=c6LhE4KbjziqKtKUTALodpTSMaU9SsxIafLHvWV7GK3Ui5vXG9aN+n3TlhWSqyMMt+3Le++JoGrR6ddf8AZLnDWgiPveQ9+1lDT7J/PRKdGy46uznpNJOB3DhPN9ajbLDlud25ciSvz82Ztw1F/QjXna8qSUwtvNEU7gQp0PsJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WTPX5hqy; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WTPX5hqy"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2e8e738ae0so600411866b.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791531991; x=1792136791; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LJB4gHetmgai9sBWQz12amW8KiAk5/wAWWWhXni4Uu4=;
        b=WTPX5hqyWm0QnAMpBtvw7ieLsaM4k/HYYEKuXzdZHPetik2eabeK/e6YXI4hTXTPj6
         X7XSAQPLOh09N9L9kmfo/Gk1XfJn2jftNV14gKkK5JroMmw5FdBWJWkksyPUg82piMcD
         Q3C2gvrVCVirKvtaqGFEt4DGrwYc9uuGZA5sEU4FNtMVAgOLB8n/n0InGasE8fwMT8dJ
         gO6DPGI797SgLjtsAwpw0sWiQWt0k2Ok0CSaxn6/M3I2xeP6Rvo8c/2BRcqK6LmqJQnM
         IbFEjUmxkLBIcoGAczPxfhIW+BzZAeQIDXXyBG6fIwv0WGEv0+NOb4DZaJaBOt9fPrGu
         /YmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791531991; x=1792136791;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LJB4gHetmgai9sBWQz12amW8KiAk5/wAWWWhXni4Uu4=;
        b=sNBOG0ha0en8J0TXmzg4p3Ovx+dWAaJnmcwwD/Gvf1qaLKiEpB6t0ZXHoNfP8ArdEZ
         Hh575AA5FMBh42eiP3CJd2qpG6CRXxPDyDSocYK/cjucrPnDSqfc69f0ovzWUWYiggGI
         /T0zUbssiyK1sYEWZ54f/WZNDUu74CgFQepznxl6upgg6GYjAaf5XfCV6EwlFjU46G/t
         9TLmw5/mRP+Ja7sHuiEymJPoOl79sXwsyDCkd0IC+zSsybNPHy7M3nH6iFTvDorXW7Nj
         ItWOdnWXx1gc52tOmtU0nfklGsNUcFJWBZI7QtQg+RBg0JP9zW0LmpNpbiXpr1IDtEkm
         lg2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxGNaiBC2CzAXj/ngKYiVzPW17I94GYHU9otvftmOa+lyeR+YS+STERlxdfwi9x0vb9GDuf0mTdJYRDneo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLisNCXfg0LNRkYVKfIUKGQibQHLjBdcGnsxnMt1EeRSpwVXgtu
	SpedYcdq4Zg696U8T1xNKq+X0Qk5IzCrX4YW3s7I5k2Oxk1NyojOFV/g7nu3P7AU
X-Gm-Gg: AYBFou2C6w41ZyDmueCSlafXejBWf4SdZH5W0Q+TOjDlZAefbbYDsukyF/WTPnnzrYo
	KOXI4pPQ5wIaPTDxVKTGh1W5/JwSEXIiaBcdCi5T2yuIKVw05v0aappgzDQO8Yxog8rLqsZP83+
	0b8TImSiUgyDvIViQ30FPSQvtsgTPDeGbkgO/7GsAbNwzUS11awMReOsjBuYo1cknSGNaJsN/AP
	Jd4vPmONAVf13HUE3NiC8jee0ihqi5OTlbIrnDEUt8WR/HUWQUugWiU0zkW8Re2VlqA2C99laln
	O6yTOfsg5rQdPXqjv+WL+Q6ldMSJpQF5e0JrEvalEjXKzAhe6uJBhu42CzsHx/fY5gYA4kOiFDK
	pl37xFNeEUMeG+6oxtgiFxvERoJNhWcOjZ8MfgsSMDKQ5QOjpy7n6FW94UkoCV0IRUEnIVWS4mw
	WsHeSjSfzARGkzzf465DyvKua6MHR+r675r/r7AX1LX/VNgIjSixODqcY+330jgpAJQvPQC6Zbf
	Ur19iBWFL5pUlcyfP3xgDaQVUXHkJTA+xZu
X-Received: by 2002:a17:907:7b86:b0:c2e:3e3f:e201 with SMTP id a640c23a62f3a-c31a9afa57fmr104906466b.11.1791531991096;
        Fri, 09 Oct 2026 00:46:31 -0700 (PDT)
Received: from localhost (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a3ae42sm56032966b.15.2026.10.09.00.46.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Oct 2026 00:46:30 -0700 (PDT)
From: Eli Billauer <eli.billauer@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH v6 5/7] char: xillybus: Integer arithmetic improvements
Date: Fri,  9 Oct 2026 09:45:55 +0200
Message-Id: <20261009074557.19996-6-eli.billauer@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261009074557.19996-1-eli.billauer@gmail.com>
References: <20261009074557.19996-1-eli.billauer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Choose unsigned integers instead of signed where natural and required to
ensure defined overflow behavoir.

Simplify an arithmetic expression too.

No functional change is expected, as the relevant variables normally never
reach values where this transition matters.

Assisted-by: Deepseek:v4-pro Kimi:K2.6 ChatGPT:GPT-5.5 Claude:Sonnet-4.6
Assisted-by: Sashiko-0.2.5:gemini-3.1-pro-preview
Signed-off-by: Eli Billauer <eli.billauer@gmail.com>
---

Notes:
    Changelog:
    =========
    Change v5->v6: Rebase to current tree
    
    Changes v4->v5:
     -- Use unsigned literal ("1U") instead of signed to ensure defined
        behavior when left-shifted (in response to Sashiko's remark)
    
    No change on v3->v4.
    
    Changes v2->v3:
     -- Add Assisted-by tag to description
    
    No change on v1->v2.

 drivers/char/xillybus/xillybus_core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/char/xillybus/xillybus_core.c b/drivers/char/xillybus/xillybus_core.c
index 7acebc1e6050..3ae95e6b17e9 100644
--- a/drivers/char/xillybus/xillybus_core.c
+++ b/drivers/char/xillybus/xillybus_core.c
@@ -343,7 +343,8 @@ static int xilly_map_single(struct xilly_endpoint *ep,
 static int xilly_get_dma_buffers(struct xilly_endpoint *ep,
 				 struct xilly_alloc_state *s,
 				 struct xilly_buffer **buffers,
-				 int bufnum, int bytebufsize)
+				 unsigned int bufnum,
+				 unsigned int bytebufsize)
 {
 	int i, rc;
 	dma_addr_t dma_addr;
@@ -431,8 +432,8 @@ static int xilly_setupchannels(struct xilly_endpoint *ep,
 	struct device *dev = ep->dev;
 	int i, entry, rc;
 	struct xilly_channel *channel;
-	int channelnum, bufnum, bufsize, format, is_writebuf;
-	int bytebufsize;
+	unsigned int channelnum, bufnum, bufsize, format, is_writebuf;
+	unsigned int bytebufsize;
 	int synchronous, allowpartial, exclusive_open, seekable;
 	int supports_nonempty;
 	int msg_buf_done = 0;
@@ -512,7 +513,7 @@ static int xilly_setupchannels(struct xilly_endpoint *ep,
 		format = (chandesc[1] >> 4) & 0x03;
 		allowpartial = (chandesc[1] >> 6) & 0x01;
 		synchronous = (chandesc[1] >> 7) & 0x01;
-		bufsize = 1 << (chandesc[2] & 0x1f);
+		bufsize = 1U << (chandesc[2] & 0x1f);
 		bufnum = 1 << (chandesc[3] & 0x0f);
 		exclusive_open = (chandesc[2] >> 7) & 0x01;
 		seekable = (chandesc[2] >> 6) & 0x01;
@@ -531,8 +532,7 @@ static int xilly_setupchannels(struct xilly_endpoint *ep,
 			channel->log2_element_size = ((format > 2) ?
 						      2 : format);
 
-			bytebufsize = bufsize *
-				(1 << channel->log2_element_size);
+			bytebufsize = bufsize << channel->log2_element_size;
 
 			buffers = devm_kcalloc(dev, bufnum,
 					       sizeof(struct xilly_buffer *),
@@ -589,7 +589,7 @@ static int xilly_setupchannels(struct xilly_endpoint *ep,
 static int xilly_scan_idt(struct xilly_endpoint *endpoint,
 			  struct xilly_idt_handle *idt_handle)
 {
-	int count = 0;
+	unsigned int count = 0;
 	unsigned char *idt = endpoint->channels[1]->wr_buffers[0]->addr;
 	unsigned char *end_of_idt = idt + endpoint->idtlen - 4;
 	unsigned char *scan;
-- 
2.34.1

