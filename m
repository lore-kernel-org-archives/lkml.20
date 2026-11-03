Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793717490;
	b=JSxgGtdvpGkAf/PeiMfDfGq+R10Q4OEQyuAwoF57n3vMUWJlwz/HKhiPbWxcLyyw7cTJ
	 cNbQ3NdTOJiyW0KhCsktZP66p9iGUY7uIkIgxhRJEnGPMPgfR1sHATnG2ETXFPWUbD7S3
	 eXP3uUyZM1EZCDMyVKFbDyLzHLDbEIS7B2fZKTwB0u6nn02jtOL3pjIXwaHDPxyVNEnmP
	 vyOXhIkt+UI4M4USAPE7tjlc9locAO12Mjbkv8Qdk6diiXuIHxCUMgd1t77DI0f0BQ9v0
	 nKwryELXK3vMAna69y27lR0BW0eyx2RMqF0kJKqge+5sYYQsRq7GG65LPfxYeSDIfMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717490;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=X265BLa7eap+hC6jsG4UHQiCMMg6MiP11gMxTREeoPs=;
	b=t3Q50wJrbCizlufiyHOa7vvXtiPYXnyNEbx6JzMgqca9Oc39LpXQ3jGna04hPokCA3f7
	 i91BhjB1XL3IyZcE/uURuF2a0pcQ4rME6wU2YeLzJWc7Fizo1Vm5jbp7HHyVZspjZxRWf
	 7dQcZEMGy/iDMVAJKxL6N2Ll7ZiG9JAEezTRAGHSU75f8OeA5nFJ0e5luG79ZWt06Zw36
	 nTQ1SH1q7kNKuBNSMsszzaNsLVyKeVP8CwnGbfoYASmo9sHxiqzQMGOKbcfITcx6mwBGx
	 T5ZgDFmFaY2wOtuRBUHh8mvo/lO8ljI9THMJnFyTyJ+WOkj81hR1RhfOu0gbVLSxlIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=KTQ8EfaO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8E9606A328;
	Tue,  3 Nov 2026 14:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD8E9606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=KTQ8EfaO
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id CC94C2006C0;
	Tue, 03 Nov 2026 15:51:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793717482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X265BLa7eap+hC6jsG4UHQiCMMg6MiP11gMxTREeoPs=;
	b=KTQ8EfaO3t7b2IgeSfu5l3QnKcGQy4ryDP5+ng+pa2rWScrDG6/6MBLrlnWEYfK+7tuX15
	hInYzlXAP+MMzkqCAWDc65fYwqiiQTz/pHRh790R3wjhS9Jrv8lBLsc9Pfk69GYTWV9B3b
	pAUeHIiZnIMKqCabTFkH9v/P9WrFCWbu4czjJFB+cfcqI0CTGJ+18oO3J82+b0jlaViCtM
	laLYNJUSh8ZKaFJm86nracSclUnNnQiHVUA3l2qkYn8vbr10YGuFs374RVrHgFCxhj+CBa
	rvYEyJJRXwk9CS0+8HtfUXPJ/4mFk69E21U7wpkHRZ3YB5DtAVfc36u5u5I+hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793717482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X265BLa7eap+hC6jsG4UHQiCMMg6MiP11gMxTREeoPs=;
	b=Tgd5xSbvuorrusawlOCVf2vWZhJO+EKNfDFPkYXFOOHmXzHIGRcA45Fmhk+ThNIbNksNjA
	A91DKpluqC9SnCkxmccRNAKD+/5DdNWICvVnH0fyuYH+A8QkrdD2CcaRCKgkQ/XQMJBgVJ
	FpN0CKPDMIysededJzCiJTrbzPJ1KRN/K6rGq3qcnERtPA1WOcjbQTi7MiYPYTOIfDZlrG
	1P3URSCDOpbzmz8HxWlOivZZZsy1a6mNXuxIefJfYe8U9I6OeaTYbaa8dbqShyh4qwddlR
	26EWxffH39r0vaE/RznclXqjMkqJoVvhpn6UgJYOIOJZCeaatZu9oLUOm+dT4g==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793717482; a=rsa-sha256;
	cv=none;
	b=Qb/VfYJCjyGdaSPc095QlqNrSm852yMQ5xYaQEJwSpP3vDGxqq/qr9gtYIVENa4jUiZJa4
	glXbtJ/zD2WNC0HL08qar+we/sRm4GpEj0zJBMdnW77thsTsxr+bZKqOG1tTZZGuWK1KYD
	25O9RaX4EcfXGpo9ROT7PjtAsdA0Ao5sx6BZUF1eYS2Qzb76eQglTaLQbFE3M4KgDPWT1G
	BaEyXy1cyAvW3HJPm627bDbxh/6LYkxbShDiF4rOk1lLUFWpUHkV7V3w74z4tz+qQHzuAm
	b9HUljpA5IlQXJYKWixPG1bu+QnVJaflBiZ4EDEoq4F/uMA7rCFQJEhN3eHwEA==
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xOFr8-002SzQ-2I;
	Tue, 03 Nov 2026 15:51:22 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Tue, 03 Nov 2026 15:51:23 +0100
Subject: [PATCH 3/8] reset: k210: Use regmap_test_bits in k210_rst_status
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
Message-Id: <20261103-reset-regmap-test-bits-v1-3-1b33607a76b0@pengutronix.de>
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

Simplify k210_rst_status() by using regmap_test_bits().
Now returns 1 if asserted for all bits.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/reset/reset-k210.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/reset/reset-k210.c b/drivers/reset/reset-k210.c
index e77e4cca377d..58ad8be18741 100644
--- a/drivers/reset/reset-k210.c
+++ b/drivers/reset/reset-k210.c
@@ -59,14 +59,8 @@ static int k210_rst_status(struct reset_controller_dev *rcdev,
 			   unsigned long id)
 {
 	struct k210_rst *ksr = to_k210_rst(rcdev);
-	u32 reg, bit = BIT(id);
-	int ret;
 
-	ret = regmap_read(ksr->map, K210_SYSCTL_PERI_RESET, &reg);
-	if (ret)
-		return ret;
-
-	return reg & bit;
+	return regmap_test_bits(ksr->map, K210_SYSCTL_PERI_RESET, BIT(id));
 }
 
 static int k210_rst_xlate(struct reset_controller_dev *rcdev,

-- 
2.47.3

