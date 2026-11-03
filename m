Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793717492;
	b=gSXHtMKIaWvDI8cH/Ss90LJyN8d+Jvt57cxvXee5J6SbTETS/4b+T1D4sm7pxFs//Qy9
	 nOkuF6eD4B6cvnn53vmgy1FjILrL0rFLzHKtGOm6nEqiBdRgiWdzu1WpgDfbbz7FBE738
	 EgUs6N0zSXlgsHf594q855cc9eX5c5YDoHjLKfn/YOqp61hOVwOc64W4oWJfgRcRxPK/P
	 f2vbruM489f7uZAlBdAHqycHpAEr0nm1UZMdiliFZ8Hpc+nixR/SJ4ec09HuFIYLWmR+u
	 yOVbvsj9Uk5XD7cyGtXIV0Ex8aBVzagOFKZ8hlpJOFrue6sTrg/t/FDK2u+n9yTbT9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717492;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=VI0iedr3l6UnJVhvQ9nem8eALFnLeOipkazoUwv0yeA=;
	b=kQpsZwp9zrq49ASmU3RSMJbwW7OxdckG+fvt6JuBsb2euxNSEZz4t2lzgf//0rdf6Hwx
	 Grgg2Wc7E9my++C0TnVfV0m1IKMNO5opJ8m+XibzNmYtaAhWlezfYxqok64hQ4mridm98
	 VmKrJoQ7NAalqD+/H/eRqtmIXLWJ0ZesmHPcd+ztUyF82gqjGPNB0SMnLScd6GmJmq5rS
	 Y7vOpV78mnOQG7j4M/giXOUHbmJBdlbk4uls6j/BoR0m/6rSpm6zwsv8maXBSmX9itILQ
	 PMb2PqgJRwXKCBikbH+LIJH02IfMu3LFcutI9+n619gDmxoz/0SEyMSsGSvlzapNnJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=ICvj5WE+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9167F606EE88;
	Tue,  3 Nov 2026 14:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9167F606EE88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=ICvj5WE+
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id E4187202BA5;
	Tue, 03 Nov 2026 15:51:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793717482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VI0iedr3l6UnJVhvQ9nem8eALFnLeOipkazoUwv0yeA=;
	b=ICvj5WE+/qMkpksveE1cuUdf8x62cyKCNRavmANEo6QpF26Q1n9U7prkdYvQ8p6aKlmxHT
	WxXMnwIzGBp0vTVLPiQIlzDh5SnJEoSIwpdO3WVPstLXliT7MDeulahR+QRTRD9HlyeU+t
	PrgBNL6/ww+oII5JXrzRoip3M6yEP5ETo/L4qtP6gDNtAvNrUoLSY4HP7HNdDR886PqtMJ
	eloY2mmlyT9lgOk0+8q8RFZ/TU6AIKSh7MSCl6/G2Cg1sr311OjTsbkUar+yg+Xg4Nj86O
	bMZRmQ2MDFR1ciRU+rqGr2ZXtYtNji5iUbRNK0HDCuuY9HTtB28UZbjmdTt6DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793717482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VI0iedr3l6UnJVhvQ9nem8eALFnLeOipkazoUwv0yeA=;
	b=J6Svhfg4f47IA3gpokoOvkGdpVlJiYbImQsmVWJWekBiliqoHSizbON+x6tBje77cpw+Vl
	pO7T0rp6qI+Zjxrvdf4Qt7mw4uSCHSHEQ1eqpKQyo+tnuR4JM3erEWwbJXQGOsISfEzi8C
	CGYqkA5CR9z1wnQSv8q2PzN4wK7U5svIXzeMTkSQ6b1cVJKpVqidMcUBtN2Mjlp9BSeYpF
	si1+2dVVTQLiOplpYqDH6dM+aCdLFEKxQ0I2r91mn+8Ftb9Svh9eapEWyfGXBHSTPga35T
	/vjgrsW4+jL6ozXkFXkJCleBnBAPGJ2/E1PFfTNYDuIcvTqmJVdN0aXGln+C1g==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793717482; a=rsa-sha256;
	cv=none;
	b=CamiGPHrqXx6rLoBJojRsvaJVAtjQq/DmT/0WlQowAxv7wXui+Fn/VWWuYAsf55K4m7Xgm
	lQo3eCZ8ROkyiZtR2/SkwK+aartL+iqv/Iivheyu/jDWOqGObhePx5vQO8rL920Rb/GzM+
	ejk1BYyHcmgC2uXnCC+n4Wth14TQa/TsTI9r2lCy0nRnxNbm8l/qRTwksE+u62gwxV6KVE
	lRKHw9T96l8iNj7p18A92rXEmB/vGtbpmTU1HhvycKCUL6pdu4kScHpWhtmeNNpvR1ptYz
	reLOYFKYO3MkIZqkpcWbTeqDJq5O1OezGk2nze4IkVhXft6F7zJDOgJ24u4r6Q==
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xOFr8-002SzQ-2g;
	Tue, 03 Nov 2026 15:51:22 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Tue, 03 Nov 2026 15:51:25 +0100
Subject: [PATCH 5/8] reset: mpfs: Use regmap_test_bits in mpfs_status
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
Message-Id: <20261103-reset-regmap-test-bits-v1-5-1b33607a76b0@pengutronix.de>
References: <20261103-reset-regmap-test-bits-v1-0-1b33607a76b0@pengutronix.de>
In-Reply-To: <20261103-reset-regmap-test-bits-v1-0-1b33607a76b0@pengutronix.de>
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

Simplify mpfs_status() by using regmap_test_bits().
Now returns 1 if asserted for all bits.

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

