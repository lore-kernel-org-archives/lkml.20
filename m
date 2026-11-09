Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794243061;
	b=PUedrz7TJgUnb26ToW2ly3ah0BiHjqrRTMrJJFyosRVUPlsL+YVmC58BV2oiZmwjbNjp
	 C9btfERZpYHniw0ampVOHM/gQZ56pV0lrtPDhb3Ab/bbkmXJIl3D+9SFCRHZAvrQH0Uoc
	 8V5P0xs8sf0AJ4EF5vWmvQw9JB8OMNX6YbRVxjzqWDG0YEoon4TBc5netbwksYL7Zphvi
	 9csePUseoKStgcYIr2EneC+01DuxmSOfaCP1D6ZZrqQwES8Ux9NXLk81pqpbawCDQ2Gfw
	 tzJy7Yf+t9ZMk/8EaJFnnLGlJ1p1ghQSCc1ii5xYef9bNEzxNV9AfXmCgnVSKvuglLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243061;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=lVgMJDLJX58FGOIw6UkQAA3RMYGX2BCLpb7/jWTZW50=;
	b=o087NYRWisfVFvcnL5U/+xeSfa0uIBWSsYu7XYcoVB/+qAXpUOUKYpX5iRPcVyQVYoDh
	 Qymck3mAAfysNLyF5wmK4vaWx7koft9XvU+Xx1UPuY9Hx44oPb+wQ4+ecLPtbzEBQJ5O3
	 ksh+1vMSx6UikHctnDdIEoeOHWOlV52I41B89wVJGB9WSkpMI40em0OXr59S+7IC0EFAa
	 WUbXmgJ21WkHMqKoKryNCFghS5N9+xdEz9xw82wfdpa8CDZFzu0j0aZTwqH+PO2FTi5x4
	 /L/RBkjACcghWN2WTpN0vQpDKdnnlEIZ5Tm1xEw/qxnAxY9FXxcGm2fy27PXOM9upcA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b="CS/ORvyn";
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A6B606A33C;
	Mon,  9 Nov 2026 16:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85A6B606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=CS/ORvyn
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 4D90120282D;
	Mon, 09 Nov 2026 17:50:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794243053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lVgMJDLJX58FGOIw6UkQAA3RMYGX2BCLpb7/jWTZW50=;
	b=CS/ORvyn+5/F6dPFXZ9GqC8y4Z8+YhX8ksBoz6n8aaNft8rKXntmvoFPlf3iT48NtoM1W9
	P1Wce06BMa2B/1wToWihGslgbk15/cAruIQ9RuMzHSegGQAuBWRyZheD5aJsn5wfe25Gm+
	5a9S0UhRLFWbFzD9nbEVKyc3e0XN62etEt200qSNyEyWQBkfVcnLVagU6vN53DR+jKS2kA
	29mbgur4/JpeGv+67O4DHmm7gRcXbCSvTnOd+vPVlAJ7sXbbl90Xxeilga7rr2QEnL9hui
	GCD6DNki7F5Vx7OwhsATaUJ6jSpWKO4isx4i6wHFwNrB/mAQRz6IOcUvWGQBcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794243053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lVgMJDLJX58FGOIw6UkQAA3RMYGX2BCLpb7/jWTZW50=;
	b=PXgRLUKCuvfrQDA8vc2I42oOvG4L/zNBtfmD/avdDlj+A1qzqp9UhuAHJhaupB2TFt9u87
	wTQrOgAxK9xvLPFPUndnsEhXmQ8bGaULbegkB3D2DrR/FcMcRTNjvMBnPIoEJ8XIMYwBcG
	6a9WSrvwL9iYGmWFphjDGxJxz9eLa6pDYLBNXfPlR4PZKfgsvwIIB1rRfc9EdOyhfu4Z2O
	GDZesRnVi8nrE8D7gVTjRJ8cnRuFXnbqd5I7XF2ENOqVL9Xm+ixpzYcX3JmCumey3CyRbY
	Y/bknPpgyveUUkfvT67H/JTMNeinyPRJLKtvzbQoGYB78PaMLj2+ka5sIAqveg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794243053; a=rsa-sha256;
	cv=none;
	b=Ikl+eSriyuigOLb4tCvWi4ImZKaK1Fu92onltxBUFxSgbtLbMU9BwDYc46OF/+6WGhUMT6
	Z+GSA1P8GJymfVKs3aQ+7cO8aJp0Gn+/ucEq3xbWwVGFoB9jpp8nBNmChATXcR1GtLvQGc
	P3gNbgos3c6QS4sKvGdnYLART3z4tQP2CvAOYWbfqBowOr0gIi/5WOpx6VsrQJKifAmCMq
	DppcTb10xvF2m6pKmfQVVqzMNY35LP397siZTj7ruKRXvPwt7BzzR23J8sRlp88DGODGGA
	1OQdf1mYeexn7SBZEbd1/yl3QkN9Ab8w6mN8+uWDJXPyIb9rb58ocf8kP2QbYw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xQSa5-003N3i-0l;
	Mon, 09 Nov 2026 17:50:53 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Mon, 09 Nov 2026 17:50:45 +0100
Subject: [PATCH v2 3/8] reset: k210: Use regmap_test_bits in
 k210_rst_status
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
Message-Id: <20261109-reset-regmap-test-bits-v2-3-c886689bb85e@pengutronix.de>
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

Simplify k210_rst_status() by using regmap_test_bits().
Now returns 1 if asserted for all bits.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
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

