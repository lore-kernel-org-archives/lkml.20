Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843165;
	b=S6UEM1JVm4aTTXj7XdupOz8ppidu0vR4iltP2ABl8DfZJzmwpU30fPmxYVmeFm+H1/JN
	 IIINFsH57Y1TRY7wkKpaNYYKtprxIBWAow3sQWE1r69cRhZpSfTTm5ZsM59XPbIQGRzWm
	 0wWpbDoJp3Sh+7oiPU2uthMa6PTzuLhDSwLrhi+L3MERQPeFu+kQk/0OZUHYEfESS0srK
	 2CgdQM71LHAh7QV2UXaBNVsYMz3uMq4w41ruD+6CXVveh4KYDUmxd05ReXbs3FIMWDJgG
	 Q+xbJJ3x6/pTjZeSBNcU5PMKFD+zxRD0Dd31bgVLDWOqpCNo+157H1JOA3PB0CI3+6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=37g0U2XiZsITbmJfFYH1a6i8Mla0nRkTmn1Jvrq3M5s=;
	b=oMirsgdxMWIHg8NgW+6KvJ4r+pk/CX1l47SMQq4JGdIRyHeT6m1lMt8REjnGKWydd15n
	 Zo3G73Ofvn6akQieaTWkwaqaZp06tZFZfsAz7Vj8AurQy3+wDsBCGjfwAt15veUhF/cMq
	 BpMDmwId+iJ8sKvOLAFH4mFrXEmAsEJZ17po9VIYtOgfa+7FBtPMTIm/zlgy0gfzOS+PE
	 yRIEKU5AzOJuPeKj8C4JvtM1A8KPHYE+g9PCil/W2q6JNCoDPyOT2gryJok/4fxfogZtj
	 JaLpHn9ipCWnHhph42M1nQ9s2x/hoKw92H1peoP+MwnWOtrQsdyIchVStaJdxwKYBXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IAeO2O2T;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA460606A336
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA460606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IAeO2O2T
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso16523085e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794843163; x=1795447963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=37g0U2XiZsITbmJfFYH1a6i8Mla0nRkTmn1Jvrq3M5s=;
        b=IAeO2O2TG781SC/hYQN+3hJFIpF1jiLVsyJuYtkJ/v+Cvbot7ille800Zg5I6C91YA
         LnTF18QSSzXHKJz35CKQJvxcXYE5xHYqiZrzkWRmv7NI0fwyThqKCGloocbN777nyBwh
         K8RMKBGMFAxgrOrqxjMr5wPYB40iW5EAsymqUHR0wcKZDWzMMSw+Jn7Ng4Qn1NkobOk1
         iwaibMIRyurDqUBdGjy23zsgh+lNfLlj1XuaSv8a/Um3hy1H/wh0N3YQyBdoRjIEJIr6
         AquTxxbDyV5GwhHN1m/VeaIaEsijSKYDhWWyh2ia9pI28Ci0iLrfFz4wMttRvlJupPaO
         Eu0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794843163; x=1795447963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=37g0U2XiZsITbmJfFYH1a6i8Mla0nRkTmn1Jvrq3M5s=;
        b=V8Hf0tnoTXQvA3VrCHI1U8u14jiS1WZDIthnXz8lb6p7LzPOPUqx8KPN8asH7tgxnH
         Kcc1somAdO+k5RORllSHiOqnpqvgFgi4lBCwhLmCuNC2tHpQ2QDbcz2OODjFlkcDBz3o
         msqgZoAiUXGKYdyhyDmuRicVDfFdHb7erhSNt6HjEt84MEztIx8xJ0MymR0UUfrjefNj
         ppbJ6633LuYtczh0uv3TjwYVloP4zfciCI9n71PN9HFLRJ5yJHLTGzT2i41esFP6uQsF
         BPhqMUpgsYAgvItV7UdsUcklu1NZQgko7NRyODIqtQrULHgO8XdcKaN8e95HfB+dwO15
         ZsJA==
X-Forwarded-Encrypted: i=1; AL+hErEJsrIHXb4eCpTLqjddOizrMGOVGT62+Cu4dcMb2APx53vXY2pbPf2a8zwO3Zr/So2Thw9WM4FqUyKORc4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9obgIaO4HI8qB1QoK1OT1iRQZagfxgJwOAllK5SSR5Ztrd5IzO
	vksUfUw/z6M2j4yHPY/2S619dP2IX5rD9f+F4pK3Nzk7TbHeTctn/kCic9+LWw==
X-Gm-Gg: AYBFou39j3o903QurV+Tnxh+CutqKxLacXMplaNGaby8XjDAYZ1hmkyyLB74JNsapQW
	L+tSddnMBkImzZzRqm/lxjchL6cb3NIVd0D6k3a8Sv2ohk5AvwkAu65hx6Lc4VES1kXcboHpc21
	Sh5pusgdBBhvQx20OSzOqPaFx5hWh/oX6/MorBY7NIc4XgE2bIcoT+E7x5MQ7iEJR1TLaAE2LFt
	YNWaIhA77wsGcFqzMK8S5hHpk8hu7NmBWCNXOKxYHrzq7xBZSRUM/9MGCG9IT2s2XX4YRi1l9Jb
	XNowQwe2Hn8dm0PopD8xjY6hCz+KMx3S4lUjnjntE6rkqm4Mo5HgEoBpTiHqn7Dkcc71ZLbOZ1B
	gG8+VBOA56gYGZNfI5hm0RQwP4+r2DL21Ee+hWFov3RGH+M5Idjbi4cbNZ/vLiXq6kQ+lufI8wh
	yIMKfkd5G0QFtZJ3nlIiOvwWkbxP3z9uznCnKoMwoR5GvYFj7fGhGwYdvVRf5Ax34ECGsDwd3o7
	nj+dQfyO2BUzvOyJAYh128UdQCTViFpna+KcbOwVpILtxMzxb9r8PCokct+Ii7pTH07QXfsizgi
	siB/20xfWBKGmiYd3NPLZeLai3D0P6ZpPRjExmDCivq9HuuXh/3z
X-Received: by 2002:a05:600c:468d:b0:4bb:741d:ea0 with SMTP id 5b1f17b1804b1-4bb741d103amr51216505e9.17.1794843162939;
        Mon, 16 Nov 2026 07:32:42 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb62d0d430sm86798195e9.3.2026.11.16.07.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:32:42 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Angelo Compagnucci <angelo.compagnucci@gmail.com>
Subject: [PATCH 1/2] mtd: spinand: gigadevice: add support for GD5F4GM7UExxG
Date: Mon, 16 Nov 2026 16:28:46 +0100
Message-ID: <20261116152847.3658486-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116152847.3658486-1-angelo.compagnucci@gmail.com>
References: <20261116152847.3658486-1-angelo.compagnucci@gmail.com>
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

Add the GigaDevice GD5F4GM7UExxG. It is a 4Gbit 3.3V SPI NAND with
4096 byte pages and 256 byte OOB.

The ECC status works like on the GD5F4GM8. With ECC enabled, only the
first 128 OOB bytes are free. The other 128 hold the ECC parity, like
on the GD5F4GQ4xC. The Quad IO read needs two dummy bytes, like on the
GD5F1GQ5.

The values come from the GigaDevice datasheet DS-01326, Rev 1.0.

Tested on an STM32MP133 board with UBI and UBIFS.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 drivers/mtd/nand/spi/gigadevice.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/nand/spi/gigadevice.c b/drivers/mtd/nand/spi/gigadevice.c
index a6d6d6e0c..990f2d271 100644
--- a/drivers/mtd/nand/spi/gigadevice.c
+++ b/drivers/mtd/nand/spi/gigadevice.c
@@ -564,6 +564,16 @@ static const struct spinand_info gigadevice_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&gd5fxgqx_variant2_ooblayout,
 				     gd5fxgq4uexxg_ecc_get_status)),
+	SPINAND_INFO("GD5F4GM7UExxG",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x94),
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants_1gq5,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&gd5fxgq4xc_oob_256_ops,
+				     gd5fxgq4uexxg_ecc_get_status)),
 	SPINAND_INFO("GD5F4GM8UExxG",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x95),
 		     NAND_MEMORG(1, 2048, 128, 64, 4096, 80, 1, 1, 1),
-- 
2.53.0

