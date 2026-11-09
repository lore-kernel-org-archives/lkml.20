Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794243064;
	b=Vz5gli8WYe3xvDT3D3SbT4iyyG2dm1zc2gdvkRBfNmcJ7EP3nx+FWYsW0Cx41OCPUrSj
	 bS2VfCAaklsV+QUzrtzG75o7+O7BEP0h/kMYMYv8u+0HZE3WdggKR8QQMDab4P9CQxgK/
	 zrU5tgW5UIhA6hNxiyjUI77h1QWMIE0lHDnSL5wFe8n+XQLyUA8DKD9GYoDP9g9dS/Hif
	 5gBh4fGA8uLOYe3gbqjWg8uxHR3WoQVe/GP1EWEKC+A7FtH1r+hNa/HhDkR5bZgz8M/5B
	 VRu/AVQjceuY5xIemiy2xUQ9AxEdiIGmKwmve0cdXO+d7GwFk5idCsuMNgRvFaifaUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243064;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=KHZPpXsmlkXJQiyTnz6djJiKsSdReXhtcFHMd210oqM=;
	b=3KVROQfcFNizq0E8+n29GzGWYmnyNVlznMX2wf5tvojgmsRQXZs/MMfmjeF7I3vqdoso
	 J97CQNADzucy9epjJHqf6DYrthzrPq5hKD5iJgrtQLDDv1dyA4N8sF1z6eds/Y3il4+ku
	 dQhL0OazaHOIS1qygG754EeYOUAmOItz6ceHr5zk5VL7amdMGy1Ixzf8dayN+NdGiS/qb
	 OL8ZW1kfKsNGTJSe5YRgUK3RRIJ4P5FpFIM6phTQ/p/SR7aEXkqUm+iawR1z9AIZ8s1d3
	 JilNeW9+lcojQZR/Vc/yoITJHZZQeiX7wkh6hxDRYrAXqC8fhkgjvLdQgHbe38VQaHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Ob1h9qiU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B48606EE93;
	Mon,  9 Nov 2026 16:51:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4B48606EE93
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Ob1h9qiU
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 65749202831;
	Mon, 09 Nov 2026 17:50:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794243053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KHZPpXsmlkXJQiyTnz6djJiKsSdReXhtcFHMd210oqM=;
	b=Ob1h9qiUtTmmSMZofNte3UUeYz6H6zzUJBzoQTiReeZlEB37IB/cKscqJ2imEhzaFsXHyD
	Vs79SZjjxTnZdWgzAnhxlDbpDoOyWhjDcAJTQjLi6pA4tlZEUs+2mSTh1X4wD3kL19qamV
	FNj0HFqlkXJyik12z5gGwFv1rk9x2WAX5+7rTdusqtNhFGcQWmCr0UNU8XUOKEqSI18wvv
	fM5+0am6tlOJwqkkKtYj7Xr8tnFEci7DZyA774m4aZ++E3LnwUfYACBQYWE7T+rNMltFpf
	5EmsSfJZ7cTMto1o3GpC+MOkSdlLaOguMQ1P1isyPadY2O56EiixexfosqMUNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794243053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KHZPpXsmlkXJQiyTnz6djJiKsSdReXhtcFHMd210oqM=;
	b=N9gDQB498FJn8vKu3eB8dlUHD66HAZxz57f+96QH/Ey67PxAN1K7fxMnbprTyFuPrIIskh
	6jxkriMW7BjS534Xf3EaJ7kaB4+EqHhjXhWbo6tEhYetL1yu7voXx0g/kEyyzgmlDkhCAd
	pHbFjm1fq5E5rvJkA0VYr0BfxxVK7OA3GExIeLuOdjJfXWLw//RG6E9mHb4hQcfQr/lxmO
	4giwcnTYU/OD35Icg/3Fh28KJv0SyERd6jMf7d+41YiFpdmIdQunT6NBdLB2s0HD15hk/O
	yZt8UPFXm3c5sM+hPDLx5AMmeLVOU9mAof+3EBMlbrmVFPUJe2M8sSj+IXMTRA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794243053; a=rsa-sha256;
	cv=none;
	b=L0qLM8QLV2UYduBZeq88qnviowN1FESdDq5veCmIvlETdYXhxiAaA7PN3jmanjbZRQEdn/
	4Lm5Q2m+uuq7xHbvl5OdcclNE+XETmuwsqvxp3/S72+ZzN/hSodCaL9i+OIyvJfr4FWxVk
	9oqWEvh4KeoYg+chKnvbmVQLv8uyOgAtPU0+awqbDBKAII568tBRAf9ZsNkl964T014fcf
	G98MVEpSK0mBo4ZytZ3NjtaSV9x5gZhU45L8Z1tNp/LkzSwsYFDL4AfXMX6JG3w8PM94xf
	RMeQmcvFKhXyi6Zk6ohLg4vY5lPShy3aAPd0EdW281Hr5DufM4th9BUeL3ucVw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xQSa5-003N3i-15;
	Mon, 09 Nov 2026 17:50:53 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Mon, 09 Nov 2026 17:50:47 +0100
Subject: [PATCH v2 5/8] reset: mpfs: Use regmap_test_bits in mpfs_status
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
Message-Id: <20261109-reset-regmap-test-bits-v2-5-c886689bb85e@pengutronix.de>
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
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
X-Mailer: b4 0.15.2

Simplify mpfs_status() by using regmap_test_bits().
Now returns 1 if asserted for all bits and propagates errors.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/reset/reset-mpfs.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
index 8ffcc54ee6f6..ec61b4a1d753 100644
--- a/drivers/reset/reset-mpfs.c
+++ b/drivers/reset/reset-mpfs.c
@@ -63,15 +63,8 @@ static int mpfs_deassert(struct reset_controller_dev *rcdev, unsigned long id)
 static int mpfs_status(struct reset_controller_dev *rcdev, unsigned long id)
 {
 	struct mpfs_reset *rst = to_mpfs_reset(rcdev);
-	u32 reg;
 
-	regmap_read(rst->regmap, REG_SUBBLK_RESET_CR, &reg);
-
-	/*
-	 * It is safe to return here as MPFS_NUM_RESETS makes sure the sign bit
-	 * is never hit.
-	 */
-	return (reg & BIT(id));
+	return regmap_test_bits(rst->regmap, REG_SUBBLK_RESET_CR, BIT(id));
 }
 
 static int mpfs_reset(struct reset_controller_dev *rcdev, unsigned long id)

-- 
2.47.3

