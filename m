Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794243061;
	b=LdRBIrAOm+P++GdKP9mdECR8ni3GZ+8HpZqqjCYM8hjG8iuSy4tNStEHXbLUstJZpgiB
	 ugxqIm3koh6T4VZvPDWhJuungaEATvbqeQjUlX9VS2c0RpWGeO++l7ycywJwOugBLYriL
	 YqVpH0aOpdK0V6xPjycgyo+MFbVMD9hhsOe7ANvYuSJvSlwIxcYk61ts1haMWJhyWED0k
	 yja5qLyXL8RND+qqZgJlXePDr0us20MjeDvjArIvm/mfi60J2QsfhUUktr6DJEeHESO9L
	 vlLCFzzjz8CNdBCNp35BYiLckaipfRe1slmREZ83XBVUn89mDZrrothHM08deSq5AEA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243061;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=AsfDc2lIVdUkIBHGZ7oR8C/AevU19hN37f5vWQO7kw8=;
	b=or+lxi54QN/mZ7Zgcwqzz8pd8wMyBm4SSaAmUX4W7BBDDiY2kjkDINlt49Df0DKyL4dr
	 wD9OI72Yg50amS5C5Wb/zdaCTuegaaJdePtRcLXxR8//joLULLnRSEOa9OOOXVrxvyzpp
	 GZUlYzTSovOdOYmwUmAG2gJ27xh7bWxZBFgfx39scyQJ+2gpAD9uyzd5bOvFloE96fbyj
	 2LU1kLQGYzm1Bcb3tHdF9iodtQ/+lUGPeaOx7PCpaK9s0uOpu/e7MnWO/sBOXdKASFshs
	 5bI0w+At3OSfvje9t2fhbbN9rTmpxlT8TawpKUO9KG9RrXsDmGE9FyIzVdcuJKB9VCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=GIYunKHL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838B5606A339;
	Mon,  9 Nov 2026 16:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 838B5606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=GIYunKHL
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 33AEC202335;
	Mon, 09 Nov 2026 17:50:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794243053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AsfDc2lIVdUkIBHGZ7oR8C/AevU19hN37f5vWQO7kw8=;
	b=GIYunKHLulVCrJisIbDAi4EgnTHvYtWLlHkPX2wGeadI1QOaJvT/WagUANwGzuq2YMjhCP
	EiEI+/Jf1gyKI9fz09oTyd2yeSGhDuOD89RwH9ViJOCK1ArPxbB2FOJzKrebxgN/aukBHm
	PxvPpvMWO6zQZ1oQI9+2ka7Wg3ufy2CfIKiDVEWQy/5KND5TRCMRObsFjYPHfhgV8fg3p6
	zJv3wVahDI8f57I9IYQf/bM/098/P5QJ4ZklhnbctmYsY7ZwNYEEBadKJyITpMWllKCT4v
	iKgvutno78KDi/aMc2PwvhDolDIjiv/xxUtx7HlqGywzM45L1a14hhX85OlVjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794243053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AsfDc2lIVdUkIBHGZ7oR8C/AevU19hN37f5vWQO7kw8=;
	b=MquShGxLVih1AfaCMaju54rdbb7kB7zD8V4hg5AfaMzmkgw572GKerfQwOvA9POY9Wd/h6
	E4tikOyFcPIF9DcRj4vxOJLYsuEjVILEiwfBrz+0cfgo1zRuOv9pM4RrQ7hbfxsZzHRpSq
	pb5GuasGLYLaskIKC3MK4OWYSgoWrM1YSz7nA1nMIU3zJPEiGPh4VZwIZgIwx6qKOgVOPH
	sNG7IcXNIuLlQSoUrnGXZYNPbISfa1nzz7J2Z06DK50oC5S0qhmJRObFmTofRGTm6gxYyO
	84cESm0sTQn4lxYW7qGYJoGrWKsneRTaiRoZO2J6WR0bwUuNMwrx5KFAiyCBUQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794243053; a=rsa-sha256;
	cv=none;
	b=bq8lj9uwqm/3Kn5NSmR43owmMSIWt9kl7pg1+j2sjaWz1FvoS2sewBtWhNVvAjOnBAJkZh
	bIevPRYvLEWF7+P8jw/jwgW3gk79e/xmfjWEMWENew1PdpbnUN/hsShTgpceCtujd6ZxaZ
	RqoiRp+PYI8csQQJC5M+P3Bp0ndGX76fMEXjqyxrQnIGdyNN/ljKvn6Rd9p10YMDlTvBNi
	mcCHTBR8SOlqikglX66RPfl7Yen/WoMNJpAB9B3g7k3teO0ziPpEg75xoKbugd/y1nN64O
	T5/b7e1yBOuBW6eOaNOz+YptTH02j0A6rPfzhipDXgYjGDSbqGOX2dBoXycXKQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xQSa5-003N3i-0P;
	Mon, 09 Nov 2026 17:50:53 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Mon, 09 Nov 2026 17:50:43 +0100
Subject: [PATCH v2 1/8] reset: a10sr: Use regmap_test_bits in
 a10sr_reset_status
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
Message-Id: <20261109-reset-regmap-test-bits-v2-1-c886689bb85e@pengutronix.de>
References: <20261109-reset-regmap-test-bits-v2-0-c886689bb85e@pengutronix.de>
In-Reply-To: <20261109-reset-regmap-test-bits-v2-0-c886689bb85e@pengutronix.de>
To: Damien Le Moal <dlemoal@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.15.2

Simplify a10sr_reset_status() by using regmap_test_bits().
ALTR_A10SR_REG_BIT_MASK() is a single-bit mask, so no functional change.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/reset/reset-a10sr.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/reset/reset-a10sr.c b/drivers/reset/reset-a10sr.c
index 99b3bc8382f3..3285f68a72fe 100644
--- a/drivers/reset/reset-a10sr.c
+++ b/drivers/reset/reset-a10sr.c
@@ -67,18 +67,12 @@ static int a10sr_reset_deassert(struct reset_controller_dev *rcdev,
 static int a10sr_reset_status(struct reset_controller_dev *rcdev,
 			      unsigned long id)
 {
-	int ret;
 	struct a10sr_reset *a10r = to_a10sr_rst(rcdev);
 	int offset = a10sr_reset_shift(id);
 	u8 mask = ALTR_A10SR_REG_BIT_MASK(offset);
 	int index = ALTR_A10SR_HPS_RST_REG + ALTR_A10SR_REG_OFFSET(offset);
-	unsigned int value;
 
-	ret = regmap_read(a10r->regmap, index, &value);
-	if (ret < 0)
-		return ret;
-
-	return !!(value & mask);
+	return regmap_test_bits(a10r->regmap, index, mask);
 }
 
 static const struct reset_control_ops a10sr_reset_ops = {

-- 
2.47.3

