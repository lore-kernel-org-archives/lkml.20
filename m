Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794243061;
	b=s3ajZC2audGkeb6UF2BMn7N2HkUnWw4WTdyIYpKUOy7y6ru1paKAiu81bfROpp9jxkfV
	 M4fx4kzilvE53AB6qgpfVtzW3np1b0A8+LE98IsUAwYdZgL5v2sCiAm6stCVd7h1pIc/J
	 DrgrpLkc/UJsQOQxU5TsWvCGhcbz8bbaKtWVaPSnUFQF+AjgxXlkhw+154m6emSAh1VOy
	 RTgrvG/wqNpZCWE/GK8rpPRRTPJudcosgK6a/woP2SuWC6GkOIuDjz3hJbI0GXNgHxEbm
	 XEDRUDUzepR9LKJpEey47zEfoLUDhX2I++ts6arYy8W2DaCgS1vGTKDnR0ZHJ0XJ5AQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243061;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=LeYzTo+5wlknwYT2A1AiMm8a2kxcJTAnRlx8DbSHsAY=;
	b=mHHMwxeqBrLjvFmMU69+Cdw+JWUzKumE8CHOXqL08H0Q6iB+1ZDufwRKraCL3zLbQc8g
	 WMvpwcCUACjdcIjfjXoJ73VfydPQAiowBuaJZfAPF42gT0epDDMYbFesnwarsynzVZN5N
	 AwaYDEFMjOGCh28TBM676gC9D3+OKHW+646QUMf52Ebzus4/kYBvwBwLWYSVtgBkCRGK/
	 WoAagi5oswLlCyF2FE9+kniYLHER9uvxWLpEJPxxKUGUeQdrts4RZi1QR3XFG3DgnyCUw
	 X10aQXheBCeysiuNXAQWht/P4yUydvarn0CRKCHoZMoQXRFtAZMAMhU8YToRMyBtiMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=OUEDMP3X;
	arc=fail smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83842606A337;
	Mon,  9 Nov 2026 16:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83842606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=OUEDMP3X
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 5910720282F;
	Mon, 09 Nov 2026 17:50:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794243053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LeYzTo+5wlknwYT2A1AiMm8a2kxcJTAnRlx8DbSHsAY=;
	b=OUEDMP3X+H7nBdctbWihUwJMWZ/UimvsNEVpxN+C5u7LLlC0barKq3fhLCTcuCZFPxG8+I
	ytl3yv3eD9jLUFWIdUrdz6nW2jc+Ayy/SDNp3AiM31287+jSvHdDUCcjkZjhg1g33WkOX4
	jU5YOzX12NHA6Sry7VRDIoxnooP3TQB7+QGbNWw2hME7uT5BH9JMTjhAWyAGbMbip1uDOY
	1aKE8EzO7JpNj3tJeSe0bpPfIR2+Hyp+yuLSaHD8uDIFxZDiTvaRh7tjz8bpwYajsjnGiR
	/AYdarse5u/kG2VGCp/AYh8pDMjPqYB7p4K6H3eQzvFGlECh8nfiO6gP3gzHvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794243053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LeYzTo+5wlknwYT2A1AiMm8a2kxcJTAnRlx8DbSHsAY=;
	b=fQl7v0NGFM7wgh4mXnglAEngFo6hANYgPniCBk8DGElGIsz5gWs7HHBGi1eCNDoVdIZq6S
	qVZMWX1pigcl8qQqw1LBoaGxHZe7JKsz1mxMwdZcmpbdT7ksBnFTxJxiM8fIDMG9peguvG
	QOtZPEqIrEeFYlna8mhqw+I76EW2RVrMxmVcKHe2201+nCzKgHb4IWv9wbg0ePU1L1gTJX
	T4vmiA3/i+InxJjftzRLnX8mAsCBbdw6pJfqyCkwaPqHqvO2y5YplMJmKupsP83QDkPTlo
	GLOySyxVkB7Pp2THtjY2xZnXl61h9/rsHiF35uNOywSZk/luKlkG3mz05gT6jA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794243053; a=rsa-sha256;
	cv=none;
	b=eEFP4y6BrgcSQazXwCx20JCFkXxSgI8dXu8Xl9GZUa4uB+6J38Fr1tWmm5uV963dnpuFOw
	FKP389PJsas9i+9SaLEwRFJSW0CI8MHubwk/TRpsOIMPmuJzewO5DhdhHd9QTRKmmCZPRl
	/C+mExfjC6yr7SW6cyMPy8zxqYv48Lar88uKMhi2Tcd2ltul7q57oNs/DNZ1o68kJZ3vz7
	1XptTuP8LOEuvuMkyqnfyE9DDlVbGMgU6k7mkCRZCnoM5PtP6dkLnIeY8l2ANxoBaPN62n
	J/0hoEWtbaYTYzlTRXSLyNqcbFntxECW7cRzYQIvgO6CHeJOWkgS8Ha67x756w==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xQSa5-003N3i-0v;
	Mon, 09 Nov 2026 17:50:53 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Mon, 09 Nov 2026 17:50:46 +0100
Subject: [PATCH v2 4/8] reset: lantiq: Use regmap_test_bits in
 lantiq_rcu_reset_status
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
Message-Id: <20261109-reset-regmap-test-bits-v2-4-c886689bb85e@pengutronix.de>
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

Simplify lantiq_rcu_reset_status() by using regmap_test_bits().
No functional change.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/reset/reset-lantiq.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/reset/reset-lantiq.c b/drivers/reset/reset-lantiq.c
index 652a45890cb2..6d7200b17790 100644
--- a/drivers/reset/reset-lantiq.c
+++ b/drivers/reset/reset-lantiq.c
@@ -37,14 +37,8 @@ static int lantiq_rcu_reset_status(struct reset_controller_dev *rcdev,
 {
 	struct lantiq_rcu_reset_priv *priv = to_lantiq_rcu_reset_priv(rcdev);
 	unsigned int status = (id >> 8) & 0x1f;
-	u32 val;
-	int ret;
 
-	ret = regmap_read(priv->regmap, priv->status_offset, &val);
-	if (ret)
-		return ret;
-
-	return !!(val & BIT(status));
+	return regmap_test_bits(priv->regmap, priv->status_offset, BIT(status));
 }
 
 static int lantiq_rcu_reset_status_timeout(struct reset_controller_dev *rcdev,

-- 
2.47.3

