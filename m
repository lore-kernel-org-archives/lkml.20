Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810656;
	b=K+0fA9YGSJQ8cccVjsCXTr3laX1ve5ZP6ntdtFcwIMUr/cygMkNJQ17pJ3ZBFC0giimt
	 zAzkCG2Bz/Ro2zfXLdAoFNq53Du96HOH3JvwqE6VYJ8BNwLS+GVU2KGQ3S4Ci2RpM0C2g
	 hzgz1JkrZToGZYpJW/9I1/tyiMEGTwyjIcbGA4a0B7cVPHQSvFDRYZS5wMmZ9fv+7lj5b
	 CdsFqsDP8ljh/1jAyImrnPxZv6tra2j1xzuwRx/beM6o7E1sMYlRETLkORMsDV3PW5+TU
	 hD4aR4uZlMQ2I+H44EwkGYFC/F0re3egnc/4nFVipRLdJS6rg/Qs/ecrDYHcHUJpwxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=TgpmpZ4pfdhPSQN8Lt2sCe99k1YkMabGCeM8pnp6dxQ=;
	b=ov33ye3mwBFNNc2NXP8cOHoasxA/bqiaycHw5+wrWYHyhXrZfyO0xjzMbWZbkO7sgOy5
	 21FlPZo/7oN5AZc+vVkkpAK6CAahhwlgXiws51p9gAutpFqGRtRgbLeu5xwSmRQJWDsIk
	 FNMRZ9GsD/fX1tGxVS/w2bqr1IjWXnUzZvK42vIkFsemGwg9peR/57XcoK4fcPc+9hp39
	 3/vyTkcZ2NNK4hP/6FvrSPtvwuzXecOiviu3wdkfe4W9u+onWe1PtuP++zndxCt2+uZXe
	 jvs5SzkpVrkSY78nWAqAO5tNbmMkj+JwAopcpGFWD1dNCGm+uCmv+JmV1aXKE1rXqOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ytfJudch;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E818606F150
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E818606F150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ytfJudch
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-71aed54d4c5so464848eaf.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810655; x=1795415455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TgpmpZ4pfdhPSQN8Lt2sCe99k1YkMabGCeM8pnp6dxQ=;
        b=ytfJudchtMinFe27LA3/RK/7mz11WnG7hLeO9EIF/BQ2faI1s+j8X0WzFXGsIQXJul
         Wl7rLYSsDsoDOZAj6FkduozqzXVvaH9sSPicVRqt1SUEBX+WD2yK6WRbdIcJQEOH7ING
         er1xucw3bTKS8mvoXHELebgygzKdVkpvUKWCzN8VlBHTKFDklCw3JkE8fbVzv1wJGl+d
         t+AxaAc4z9jGFr++1aob/k8wgI+H2WwikhQ2nfVedAX3aRuQ1FyebzHvnW5rKogq1DVu
         gws2dqspn1YI/M8AClhqByFZ1qRbBXNVWk6v6TmiCFuZUX7hxArQlaSRbFhnAoQB3Zdx
         jw/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810655; x=1795415455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TgpmpZ4pfdhPSQN8Lt2sCe99k1YkMabGCeM8pnp6dxQ=;
        b=lj/1GIZPRCVSwzo82QZJz0mIq9wyjxRUGEgAFDSbO1u0+Sd1xbsCuYNb7w/dsUBsAC
         Ds4p+uZIugOTZ/eEEka+TnIGU4XjXrUE2zAW1LnyrJpHQE6D8jfYxG7ZTqDh07fDTH/Q
         bc1FqUaTA2Va3yh7DaXcUtMDROD+yhPuvw2l/NLkFQkOWeb+01yqYyhRBiBCXiK7gu+W
         0JjESCwcU7w79OHqGjDxCuusbIoyy3GfsBnii617qymxJYHQ9o3ocAe987Do7HnSbFeT
         5tuhsZXU1xxfC5VX+Gk5dHBOrFeSLMQpvyC60rDPB96O4WVMfEMoxCeePHvCv4ChW4nI
         7ELg==
X-Forwarded-Encrypted: i=1; AL+hErGhau4fILDrMBt/dsmVsYDgU9Au1JVIDV6/v/Sb5JWbC2moZlEic5dItNO1zWski7wZgyZlNlZ4GH2Sewk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VBNjfuh45VqA98calOqo/5P1uAVC7M1aodkQYHDUHac4/6nc+
	nYGI6QJ31XJlQq83G32JTpJrUaHGUVkk+4E5WK1zNsN/2VPLLLSCHVLT
X-Gm-Gg: AYBFou2iWQQwYZej9eR50F/lYV5ZOAFgB1zKqEvYb1tSH3ZMNKaqfFzQn8ATHNH7SqA
	v902+oPIwqIUOtYx47KlER5ubqmCY9uTwcGgQnmpkOJNEAxwkGxOBQIHXsz6V0YJyFTSLN0JNLw
	i6zZXLg1CflgdeFcFrgYSf1U6LwcV9/ikADHmtO8RY/zrs/IP5lXYn0D738APdu7LWEG2ziFify
	ZCZFD6OXMPXKzVB3ukK764qdVbqZumCp/0uBrEXgQNgEnepLsM1Drq9ZJz5cyKi5MP65t2XazWq
	hwTZ/Lp/yfLJNhHFQnwl38LOJ/yBA8qX4O8Ra0vWMBtx8wWknK+K1RaD3WZ6qVRyxhROCwvL5V2
	crjMpoRhn5u75J8eUK5bYxTFdzKAZdP0qfvxOEHVXcDtinC8BXxYd3vfpsRztJQGIfXi5AZmAGr
	R+pJxe3Uab0MA6kbUPDlDEShiOd7DcMcH3RibuosPlV+Q64B0ev/trknByhGq+gDhfxdqx7oET8
	2bc3j5NBSZdn7oA/c8Go/W1DqpMqKKjI9GZWtJHsAxZQq2YE6PjblCDf3uv/HWyfLQ4ud96Y1Ph
	MpIqkvjyn4nN4FRfd4J+l9rllfp9S3vtSIhgSUHiWBRF0VfHFbDs6OL4kCVz7JatyCwZi4UXhB3
	d30lfWfda8DZXY2EtXS/4QyBejL4KKw3y+s5cfB9o80oG0sUqo30uuFeUkZ99jp5/5rOkB8XXbl
	qV2SdxRH0AHbRPm8ar6aMWyePz6wM6159tfMz+tQKyvw+9Bf9UAWE=
X-Received: by 2002:a05:6820:3383:20b0:703:8835:5fd5 with SMTP id 006d021491bc7-71ab4f55eb4mr3885591eaf.25.1794810655100;
        Sun, 15 Nov 2026 22:30:55 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:54 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:30:13 -0700
Subject: [PATCH v5 58/58] mtd: rawnand: diskonchip: retain chip state
 across removal
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-58-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

MTD references may outlive a partially published registration failure.
Disconnect before unmapping the device and freeing the hardware ECC
codec, while retaining chip metadata until the final MTD reference is
released. Install lifetime ownership before the late initializer
publishes partitions.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/diskonchip.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/diskonchip.c b/drivers/mtd/nand/raw/diskonchip.c
index 540b6baf8bb1..2c6d0c0fdb2d 100644
--- a/drivers/mtd/nand/raw/diskonchip.c
+++ b/drivers/mtd/nand/raw/diskonchip.c
@@ -1466,7 +1466,6 @@ static int __init doc_probe(unsigned long physadr)
 	nand->bbt_td		= (struct nand_bbt_descr *) (doc + 1);
 	nand->bbt_md		= nand->bbt_td + 1;
 
-	mtd->owner		= THIS_MODULE;
 	mtd_set_ooblayout(mtd, &doc200x_ooblayout_ops);
 
 	nand->controller	= &doc->base;
@@ -1494,13 +1493,21 @@ static int __init doc_probe(unsigned long physadr)
 	ret = nand_scan(nand, numchips);
 	if (ret)
 		goto fail;
-
-	ret = doc->late_init(mtd);
+	ret = nand_set_lifetime(nand, nand);
 	if (ret) {
 		nand_cleanup(nand);
 		goto fail;
 	}
 
+	ret = doc->late_init(mtd);
+	if (ret) {
+		nand_disconnect(nand);
+		free_rs(doc->rs_decoder);
+		iounmap(virtadr);
+		mtd_put_master(mtd);
+		goto error_ioremap;
+	}
+
 	/* Success! */
 	doclist = mtd;
 	return 0;
@@ -1535,11 +1542,11 @@ static void release_nanddoc(void)
 		nextmtd = doc->nextdoc;
 		ret = mtd_device_unregister(mtd);
 		WARN_ON(ret);
-		nand_cleanup(nand);
+		nand_disconnect(nand);
 		iounmap(doc->virtadr);
 		release_mem_region(doc->physadr, DOC_IOREMAP_LEN);
 		free_rs(doc->rs_decoder);
-		kfree(nand);
+		mtd_put_master(mtd);
 	}
 }
 

-- 
2.53.0

