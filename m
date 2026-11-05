Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904967;
	b=SfcMgdDDCVAmjdQCsxUq76LTszY13Xx1Fk4buh+eE4wLUCDthCbdJzyKOdrQLBtIc1zF
	 VUHuMuwYH+ZpoQ5vl6efaFwPEGGLHfL+tFaKfsdpqCDmVKbNU7ec3OSXwptSOFlK8kEil
	 H/LsS8oHxoI3SK8bVWG2sK/+fBpkDBrx2Voz3yNI72dKA463GVwMbBiuCY0h5qvpXUj1b
	 gd3bSR4qRr9rGsHxFYpCi+DFMuQnUHO3NlyNp9Jk8Knwin5KMBv2qxJypZtQ5KPvCA4Kr
	 Vn5doo5mg1nm7TjmkhaMnrF8R+W49HqKsBejYqpKbDf0lJLfyqmv5tl4zA6o5BkE6yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=F8PJ7Wj/MurY/COKSMskXdHgUwbyiv0TEDO/uX+R0bU=;
	b=DQZpgvilrDmInyN4P5Pk8SLPInNiDpn/s7jNSmAhrPvUSaHvUXTdbQ7aXN5ihTHTHEeJ
	 lUTKwT24lIus3Ri/VTQZIVOxQcTWa5sbCJrlOuvinUxZBPFa8BMA4bBQXlzK2P2UP8ToO
	 yoi84YF/+6igGXn2TMI/HcHZmfeCmBgRKn8ePWaDgAcf4EYGc7BQFw8AITTlfDvyeswg0
	 PkC8o1PyyvokDEBeDHCBYFXdpTpDe7NCvv4I+/ktEWGhOB/jykGBX12JhOZNJlBnyZhJv
	 wJ4Z3JTkaTNzkNgi1+OcT9LuYODkYoSsrpDsHRPFaTtYZ0lztJh7ODt6a8v0egx+1Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PyLqRTd8;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B6F608362B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3B6F608362B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PyLqRTd8
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6f8a519e215so1084569eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904966; x=1794509766; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F8PJ7Wj/MurY/COKSMskXdHgUwbyiv0TEDO/uX+R0bU=;
        b=PyLqRTd8O3Wg28izDJsUxpwuE/XGlYjDIvGKMAQXSERTjL1ehnq7df/k7oltg3PlA5
         IUscCHvYFXDRskkM3hDAsni/yCGfPlD+w5iXw+QwfIC+okc2q/Wi+SzboG8ut8cemQfG
         VRoR6FpGB7NTSnc+DJWwfth8be3W9droFoZc5Ip7JZtoGQK7VW8z1uCohZPfYx5bMp+k
         xcx9nD3tjpp0wVOB+f9shdNnZzViB5ZqHo6msIzW23kq3BH3oXKnjM2ZoKNHBLxrv9yv
         TUxSAWmusWYRNVpZfzblGOZPrUwokWIjjPGp5RmfFjVEsLovhz7/xRqvCUvNcpkHyS3b
         WfDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904966; x=1794509766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F8PJ7Wj/MurY/COKSMskXdHgUwbyiv0TEDO/uX+R0bU=;
        b=xh+LUYEeBcxc/YUTK8WbY5WNz0nXbClzQPVEStA6OLyMaTIyTppyAmmZs3MVhlka2b
         +9UZz90RRM3dSeBPX6Na3dxBFP7bjUhLPAvjLXAr+ckUEEIw6TksnvClAQr0kprJhBDP
         ZQnILOcpv5m9QmmDpdZa0LODHjt5iZTDC9lu2gCzcEDqb71yD/gy1Jj2la/yw42Jn2sy
         QJsCer7Zy08CQV1Q8CeIicQYRhcHwKNekm3UmLd5r5f4U4x72h034ekBotg6po+cK8u/
         g8Qk8c5OOwOLpFrFvbEPwpv3S4J+aQaoAMOj+NLxerp+1IJv3QKoDmXx8YRfptYnVjeb
         6LVA==
X-Forwarded-Encrypted: i=1; AKwUvBxtSDGPbVDm28S20Z/8/CX2TFVJbThCpok21hCGiTFy0wE/El7EYA94ORfPOCByVIQUEWuP2Dzk+KaqPZQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zkIoxWwWREElB5QwtPuSIQUB7OK+rUfkfzjLe33HRHi2OMDkz
	u0dmc9MQUJGHAxJOw4BlbfSp5wK/pXSkmjmsrgi0lD5JMaTzFrbolWR/
X-Gm-Gg: AYBFou0grEa6c5L1bTUrDyM3+/Fmm/IhxwHRz8zoJ7xgdAJGuEhbwyBvuki8/JYOyc6
	7TZ8uR32/ol2XFWKrAavbTqx24RC2oF8D2yaEXZOGi9bMaDDKbLRRuYmVX82rImwTrpB5NE5MwJ
	B918sm1VAiuYEkCsEHSU+SNI5dVBRqCSEVO53t9+G6niM07NB1/N4bbkq1FhaXjQ2Zb+1xB2H8L
	nHrM+/LDo8SFhS3IQ+lIrpf2BU6xqRf8uLx86NnMiGFqCjMz0XVAWxDlVk4P4Y0af9wP/zstdb2
	KZcD8w5d1PMRcccGv03bhgL/t8/X9ggp99N3DDGHqX8sxHdZRyGWz4XuQUF/K5Ad6WrmAAvT9wX
	CTLiPcCKQ0O0c4kVgPUfiG+fKZDJF88D+ZzQl27wqr9LvUldCkaiMk2RQHrWKyoggABL8BJJr5G
	WZXiQQypryfheZhQp7Ot/pa48RbOVfWsxLCZiC3NdLa8kPyAuIQTwex6teAFPGQADQHUmljCRcz
	VFNFbtBygD0ISP02H87g0/h82H9uDaQDj9xz6OHz7CbZzEisc8/OZnMLwuv9luxgs3OaHVowDxC
	oJTrzFM9SUx0B516dUeMC15o5VAS6jP0NXuiigNLJU+gs0OLvAYgVt9+3p8kUBz9uDgech9p+RA
	81ejgEC63D12XAHMRR3lSMBybDNHsttR6qBj3I9VerhJK9vXMZdgbv0J8Vq9mA8Wy0Qs6XPeP3V
	14W6QzmUtZOy8zW/YTkIeSRGb76ue4lpmtx6iJToL8zrLwCdbS23nP4XAQCvVAPlAmGbcZIRPAR
	Q==
X-Received: by 2002:a05:6820:151b:b0:716:e9e0:543f with SMTP id 006d021491bc7-716e9e05899mr67251eaf.11.1793904965992;
        Thu, 05 Nov 2026 10:56:05 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:56:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:39 -0700
Subject: [PATCH v10 23/26] mtd: rawnand: sunxi: avoid redundant column
 changes for extra OOB
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-23-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2

Extra OOB is the spare-area tail after the last ECC step's protected
user data and parity. The PIO write loop tracks cur_off as an absolute
NAND column, starting at zero in the main-data area. The extra-OOB
helper instead compares it with an offset relative to the OOB start. It
therefore requests a column change even when the last step has already
reached the tail.

Add mtd->writesize to the comparison, as the read helper already does.
The comparison and the column-change command then refer to the same
byte. Keep the command when the cursor differs or is unknown, including
the DMA path, which passes no cursor. No transferred data or OOB layout
changes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 11fdc10c7f14..c9135c8abf54 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1718,7 +1718,7 @@ static int sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
 	if (len <= 0)
 		return 0;
 
-	if (!cur_off || *cur_off != offset) {
+	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
 		ret = nand_change_write_column_op(nand, offset + mtd->writesize,
 						  NULL, 0, false);
 		if (ret)

-- 
2.53.0

