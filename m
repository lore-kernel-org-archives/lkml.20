Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793717490;
	b=XQHmUW9seoN1OpTNuz4HzNEpWtjeyPQqba0m2MAqC0i3GuXmMeMx5uMwIc/YEr6ocrsz
	 lumis5ir4hHHLSTOUt3b/eFsMTktyigPvqdBJtWprAtDzSEOEmhGgPr4xgewgqOjx90iu
	 k1GgvsU71Weiamq1helmnQs2cnLDmpA66lD2XOMORJST2hmBZLspvKbs3CebB/hpUaNQ7
	 CNlmkOUir1hzFEW9BFzF6fiq7vfkoW7QsBEBKjx4vMRsHWinIRdQPbZHnOszMOnSKORx+
	 jLEWq/e2bKWGxWbz6+mGbGuyMHZl3xZxbedrBLDY2Msd0BtzLUoduLZkiRMGMKbmi7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717490;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=AsfDc2lIVdUkIBHGZ7oR8C/AevU19hN37f5vWQO7kw8=;
	b=OCad4F0dlyoxnkJsYt1ZYYTpW9F6PJSLjgO/pmiydo+zuOYp5BYOUNjeuR/EHQ3kkLm0
	 9ccaSh45lM3XO2FjphoYE0aaRKiy9SI3K728wP9Y8q9ZtB1zhjCjT0QST5mNuFzzN1Aix
	 Wj8zx9/WOKQ5+kE3XwM0lUapLeVPT3UQGsoCThuNHEVuE1yhLHPibV+I4zgEgtLhdmS6V
	 xJs7Ow8EGICyI6nJZ8MkgwtBZiX7teyPmiivXnAyOc2B47aIxt62kVWz8kbavRSP/SZRI
	 GZWvZ6iHqecwIzYV2oa4rWGETdDjt1f+c4tdaZIzAsEF8GfZIpFSo4Cllm7jNHBeiug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=L1Z6w3oW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963C9606A335;
	Tue,  3 Nov 2026 14:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 963C9606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=L1Z6w3oW
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id AB3D7202BA2;
	Tue, 03 Nov 2026 15:51:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793717482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AsfDc2lIVdUkIBHGZ7oR8C/AevU19hN37f5vWQO7kw8=;
	b=L1Z6w3oWkDzOf8lIRaYEbemBCSRt9CXO4b08GZWltOfPvN1pWKH2csHAAra+Ac/B565s8k
	1D6Mi4JLr5P7jmiPRplXUdDOZAk4VAwaEUIIk7m9VO8cbK2bQvDpVpt+c4d6bLwEWRG4Lk
	w0SLSEoBx/rAec84QSC1GVoofrZ1BQ6C3GXRb51yNkE83gDscVdyQVgceTHWk9Grz5Pn1z
	cOA4nihlNN9Tz3fNhuQzECgMF3nYNspnewuT1cFlGzLjvnu7kF4qQe4WuvtKYscui201u1
	tSscqVgzH7ayLr+NIFQ+Qb1as8fFHHJz10MH4O91o62bv10Ri+OS0KFj884hnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793717482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AsfDc2lIVdUkIBHGZ7oR8C/AevU19hN37f5vWQO7kw8=;
	b=I7ta2EL7OaPSkZiL8pKhQvUioz5W7qWIWrNDxcQ+3dmYTk1/TEk3fXK0Rs2B8libFwxmNj
	zRukQrtSG3pWuTuniJj5y6DatOdgIQa7lG8LK8nyMWejZ6MZkCWcI6BJqbOirKGXu42vKm
	iA1S9hyTHDI/mmvcKYNk8DIfmJn2NNWy+jna00Z2V7Y3S2jNABa3iIdNzLL1Tln/aHpiVM
	Em/gmAY+cWP/U5+x3VFWR68vZkPaDcHc6tKkl7M5oHyY8RO/FbdQ3OSgqpiTGZ9WkD6ZK3
	a4EnqiFSHWYUB7VbGikLzHnIvjcx7ys0GIhavBlIqFRLxPg66D0mzfd9QC4uog==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793717482; a=rsa-sha256;
	cv=none;
	b=c1mLQUJ5miibh/bw59bHEKZA8jr59e8+osaqD3PDeMtsRFrCcrB6jJcKCTyabOj2+H6OJs
	D4DC16e9FRXAcrJ0UJovaO9mdqQfYvWcDlsT3HjuaR16Tr57uT1QAT1rZFa2li0xSqBEOT
	tmYh3NIhmSegxpm46O0+D5pLjykzohNurQubsOTWABksh1lOjoxhGRsOIn/fs+CHBHpwft
	B6zORPC9Pl+ur0jP5AFQKQ6UF9SG0oX1iXYGPqHJLd/rJABNOkvAUtUJUFA65zq3danDfD
	PcQ9ZCv3Pw2ixcDXUdlWkKyJEe6B25uMTybQ5NM/1oRR3UIlpkl7cVNibOupyg==
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xOFr8-002SzQ-1u;
	Tue, 03 Nov 2026 15:51:22 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Tue, 03 Nov 2026 15:51:21 +0100
Subject: [PATCH 1/8] reset: a10sr: Use regmap_test_bits in
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
Message-Id: <20261103-reset-regmap-test-bits-v1-1-1b33607a76b0@pengutronix.de>
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

