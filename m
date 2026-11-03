Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793717492;
	b=e+tEQXt1DNir/2KXWLJBIyXnEp27Dcf+FpEHAV2XfHD98jqh+YGxJeZHX3dlYOWobIuG
	 UMXSHj4LmnKg/O0ubRP4w4yohnn2DmVi80CYSmoLJWNfNxKY1vd65VuZ4tqFHgVzBKPq1
	 76EkaWO7H+eeftxMFsp8MFR2f/ZPZCX0Jpc0TE74La6M1fWq7GgiCech4WhYx9evSTbIJ
	 LlSfkC4HZq5CGrrMWH6J7tr4izwCLdur35fswXGtnKkkefmNd4WATSs4ASpo/fJd/7wbV
	 GUxsYPneBxLCe2GSO8GdMzyNbQq+TMyQppuJ5u56HT4BmUQXVTSfZ2MnpL44iFjPxXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717492;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=gSi9vg+Zm+TI4RLv53YhiJ1p0uh4O4FGeOvQj7BhF60=;
	b=oAfyzhx+JNOQu99NH4EvQxp5MSKMM3T1dnOwvQDvsRNhExnMXBjquXOrJY2NYiR5AFDk
	 Za2crVdIG1q5iQOCU+MfqXnSj2QyTk2gFno187S92xwN6/5zHe92gp20MkM0CvuY7AwIa
	 5//L9XlHkiDVNngoBsj9hKwHOmUJPPf5j4DoFaSBSkGK/FekVabtd8URaU8injbPr/h6Y
	 +bZ6owAs4nhOkPnkge1Ttn+OVTvbpiPoHVsBTmmvZ/A9Ptkv2Hful7AIf0ccdVui7U5zW
	 CRx/bFall0a5dH1z89JHO0gcvDLCfB0dao/5YGflMn44xzQWqADoQ1KlK+owpMBM2rQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=gXUw3ken;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91671606A784;
	Tue,  3 Nov 2026 14:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91671606A784
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=gXUw3ken
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 09B5E202BA7;
	Tue, 03 Nov 2026 15:51:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793717483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gSi9vg+Zm+TI4RLv53YhiJ1p0uh4O4FGeOvQj7BhF60=;
	b=gXUw3kenAOHy81kL+vv2K7IOPs6aw8p2bD1xmRe4QGQMJAncxohyX8lL2+/4NmLcxw5zF7
	mFFzdX2RSThlC4DlHfeMt8KOQmlgd95GgKtQtliYHcrQ8t5p4TDpnXD9ruSHOdMz6H6Mds
	CyRvPYvBI8RQz9JZQ9JGudWlywpHOh4eDhKnBrsyputLkjFOk9ldiUtalmIKWJTIuCKY4K
	KaBWul4pJjP1tPAdUPwS5qEhpblNtuwIO9VJwzRVCuLrpo+fPp4ldwsRyOpENMsLL3bRfd
	Y49EcXPmpJC2KfUb/o5XkbneZ7MxBEgzLDCOBtRcMziPnXjXMRGhxEOlC4fkcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793717483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gSi9vg+Zm+TI4RLv53YhiJ1p0uh4O4FGeOvQj7BhF60=;
	b=XUIvd0+sx0cGLLTaqXUXMoEx3vqGA0RLnrU26DNwH9apY4p9PWGJQm7Ara2huWUUWcrd+z
	v+ODrQnrMUtB3JHzk2XWJ7gusalIDxGWmwQPOFF9fQx4bR3umGEs8yemhKqcCVVIwC3gkd
	LsTpdxB2qjrqBA6RSXTd8p5/R27C87ta8v7FjWnSGoTEzqyKKxCJePnClVg7rUlK7qVopy
	Gg+bgrCtryDPsoxNXSGxCBx//el8L70t/T6c8pkCOdX5LbqG5NM5NwpD4UYIrWvryVUDBo
	BBQLJC0pbU30PIMN312DCGPNYqT8FgrDhmgcXXaPhudhD0gSgFbW8HKij+G+CQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793717483; a=rsa-sha256;
	cv=none;
	b=N7PFxaRjSKcGd+szhY3KkNR9tHNn1YxRFcAPe6LO9O62nKqFLoeQe7tvhZOYmnLm3HnguL
	DzWIujL3PgrJeISJrDrr+00NjZ1U2h4/hjYfvBmuo0XxsAcyyNDi8rzHIxNu+tCeCwb9Bj
	rgHhM1IQaLZudtIZ2rHw7teelMlQji3U6pqfer4RxhSDJZcNF1bERQgx2HO/p5h8w10MOg
	Legj8m4LyQlJm3MQiZG/20E8REVAR5TQJq0lqOoF2TQGGb5X2Qv2LKLRsqkkHiSPmSwTpB
	x6to1oIi2tkcXwfxH3jB4Av1IjXVxDrpris1/BHVEbOri5yjjrrJH1T+NCrpXQ==
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xOFr8-002SzQ-2z;
	Tue, 03 Nov 2026 15:51:22 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Tue, 03 Nov 2026 15:51:27 +0100
Subject: [PATCH 7/8] reset: zynq: Use regmap_test_bits in zynq_reset_status
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
Message-Id: <20261103-reset-regmap-test-bits-v1-7-1b33607a76b0@pengutronix.de>
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

Simplify zynq_reset_status() by using regmap_test_bits().
No functional change.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/reset/reset-zynq.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/reset/reset-zynq.c b/drivers/reset/reset-zynq.c
index 688b512882ec..b7a0445aafcf 100644
--- a/drivers/reset/reset-zynq.c
+++ b/drivers/reset/reset-zynq.c
@@ -67,17 +67,11 @@ static int zynq_reset_status(struct reset_controller_dev *rcdev,
 
 	int bank = id / BITS_PER_LONG;
 	int offset = id % BITS_PER_LONG;
-	int ret;
-	u32 reg;
 
 	pr_debug("%s: %s reset bank %u offset %u\n", KBUILD_MODNAME, __func__,
 		 bank, offset);
 
-	ret = regmap_read(priv->slcr, priv->offset + (bank * 4), &reg);
-	if (ret)
-		return ret;
-
-	return !!(reg & BIT(offset));
+	return regmap_test_bits(priv->slcr, priv->offset + (bank * 4), BIT(offset));
 }
 
 static const struct reset_control_ops zynq_reset_ops = {

-- 
2.47.3

