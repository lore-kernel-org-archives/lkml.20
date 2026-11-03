Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793717492;
	b=a7KZUGHho5pwJhqzG8CKXx5NZ/IJepcsnTmGE1MC4OUGs0Jrt1hOl5B27l67R2MBAec/
	 WgWpj743aBKjrXZNgYrgNvGRG/ZEfdqHzJt2FK2+F+zWWAIC8nrnCVAlJnbmddeDml/fV
	 ocbHHxxfEj5hJBGbR73ORYIY9NmW/PAZfekDhAxeF1kc+EX1h/ntpVuxC1DINzfbrf4bw
	 kZwOU9x2BWPrNXiB6CBLWYFjkQ5bdUhM88VAWCTKIo0aZrVDteoEKZoBkvcOYrt2TBL5e
	 h3ZHLF1Fdif4kt/qxs/hn5YNjx9dVY/fUQZyiQpyW8ZI3jRTaQY8L8MjbWj5fV0tBMQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717492;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=DP6mwMrATChRECS6iH+LkcBySCfvUn9RliJv7XX0ATM=;
	b=nv5+e8fRj8vMB7KMF8XhcfaFOWZwgnu6tLLDmyFkeO5pqnaMoDxL8z3FNv0P7+NaWIGT
	 14eDVyW8B4kF1aJFwANbAdDaBUdosVASMTV9WqXB8xDer4T+srQTv1DfBnHLQ5lQT7kIv
	 PioGdgiNL3i02BpPa7PX2/ie7Ta3CDyb4z6pRniVYMSM8ZewO9fe+Xmw2K8lCdg/nf3pH
	 Vf3vIELjoxxfGMB+u5Ko6LvWLTK9FWA0DG0PIq2zgPA9FrmoWImuT5B0F3Gp1/RkQdMxC
	 8SV3s1S2F/C288nsHlEmaIaS8VLeuuFYGNM92AfT0Wjvcbc5Qw7jMWFhMsGMDnnwfTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=g+DyEpQ7;
	arc=fail smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C2C606EE90;
	Tue,  3 Nov 2026 14:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0C2C606EE90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=g+DyEpQ7
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 11B44202BA8;
	Tue, 03 Nov 2026 15:51:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793717483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DP6mwMrATChRECS6iH+LkcBySCfvUn9RliJv7XX0ATM=;
	b=g+DyEpQ7o7JHNM2a+ma/vTx96oAKmFoFYxUIVm4AsFQUH8O/q72HusDv5Hf4vglITeZ6R6
	il9HKK6z3MheHC87Z8Y933CzgpemWeWaV8OLAcQZWOfAOE5kl2NbIK2oZDSQlKpfYFtI3d
	94sPh+KWjAiYOJDQn0/p9NLHt9awxMQZZVbvQSIi8i4p8mNRGsb+AdRIro6X2RdPeHLujO
	cKk6kpPtvpFH6kF+cFxHz49ydCfD9RP5NiB+jweqZi/QA7zDPR2xmMtQA/UrBg4eCoi9PR
	3tiecrBnwQT9r+GS1jMuOgaBgGkfwHAhUrPMWEoflJAa21E6UpPb3fXt0r9XHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793717483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DP6mwMrATChRECS6iH+LkcBySCfvUn9RliJv7XX0ATM=;
	b=TfG9uqD1mbRrSVdlLGSX6ihDYFexs3BpnQ4u1EMWZcwvsy1aitQVZhj+GUbvJv+GLAGL4y
	w2VvuVoOWGBpJBSRdNsOzA7DAzfZV6+qYDnhzjFmUFqClKVSoqNpogSlq8JkjwxTbJ32eL
	uRNl56BpV5574hO5pfjs7rCPovrp4MWjuJxHmPFPm7075JWdHf+OzqXX4ClfK+lY9kqg8M
	YNo2C3aPWjQP1UL0kfT+wQznbRWREAlsJxDM0au/lE9jasbyZOv3QA5zwb2TV9xboS12yi
	Ok8GGLLEX/BBve9qDHbtk0+sG0jCesltaCyuHP89mCn66YLPvY+qng6gpPWOJA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793717483; a=rsa-sha256;
	cv=none;
	b=XakO3n4r/H5x+BNOeVPN2Bab8azFGLFjyeNUTnpXb4lMukEW1qrk2sy5VrzCgB1wRQsRCq
	q+55d6BOPErAhqiUuqDLgYzlo+mcDE8aiqWG4fJgCysLTgVgdp9uzCE/RVzowROCjzxom4
	MTem8SmqvuwvMo/lyn3gjrpYgxJXK3Rdy9WE3zaaiU7eH7gQ/voAzxtmfjvl2KoeansGSH
	ZaXRu3WNBWqa5I3fju81FdOPkco+GlD4820syrE5+sW4bedAGMVYUe9dh7e+A8nBHXlbFN
	p+cCKlEXYgPp7HE0Cw0rmnyOaipv6TgN7jU2TZCOfUawg2Otwlgzl+EHJ3hBjA==
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xOFr8-002SzQ-39;
	Tue, 03 Nov 2026 15:51:22 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Tue, 03 Nov 2026 15:51:28 +0100
Subject: [PATCH 8/8] reset: tn48m: Use regmap_test_bits in
 tn48m_control_status
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
Message-Id: <20261103-reset-regmap-test-bits-v1-8-1b33607a76b0@pengutronix.de>
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

Simplify tn48m_control_status() by using regmap_test_bits().
No functional change.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/reset/reset-tn48m.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/reset/reset-tn48m.c b/drivers/reset/reset-tn48m.c
index 177ee5127a1e..4c7d7ef7c7a9 100644
--- a/drivers/reset/reset-tn48m.c
+++ b/drivers/reset/reset-tn48m.c
@@ -66,17 +66,13 @@ static int tn48m_control_status(struct reset_controller_dev *rcdev,
 				unsigned long id)
 {
 	struct tn48_reset_data *data = to_tn48_reset_data(rcdev);
-	unsigned int regval;
 	int ret;
 
-	ret = regmap_read(data->regmap, TN48M_RESET_REG, &regval);
+	ret = regmap_test_bits(data->regmap, TN48M_RESET_REG, BIT(tn48m_resets[id].bit));
 	if (ret < 0)
 		return ret;
 
-	if (BIT(tn48m_resets[id].bit) & regval)
-		return 0;
-	else
-		return 1;
+	return !ret;
 }
 
 static const struct reset_control_ops tn48_reset_ops = {

-- 
2.47.3

