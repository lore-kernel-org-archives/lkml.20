Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793717491;
	b=ZXXdR8z17xL5NzjTv+DpdjtRe6K/I8WxKqF5nJ5VyJRlCemWTTMAQ9OhtHRfFan261Lu
	 WbZ21tlI0IutSWjCtKHIVVwPujrnfd8Z9eFcNsF8eFKRKOy2GmD2/+6NpIDg6lmNgnude
	 +RQohSMl804tuAGahzpmeQlSuHV8C0gV7LqOvlawLlCygoaErYZ9IIOyIDRDuUgNBf55V
	 4qRheWUizn1eaVagRhx89u/WZ6WTEHp6O37UfK3B1uUy32tyD+kIp2kG9gwXFG4JBQMFb
	 zPRCrjvEi6Nm7R/4gbc4uF2o0nwvMHkskRHdkjotuwZ8Kh7ebH7f/gNWIorwOGsUe0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717491;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=LeYzTo+5wlknwYT2A1AiMm8a2kxcJTAnRlx8DbSHsAY=;
	b=izLbGOk6vIL1yUs7dJ/wBCKQCTJroC0YNmOgStArKn60JqQqZuln513KfgDD/SGIBdsB
	 eVQylQ3mTXY6ZiPPzs8CktsJNYNS4RQOh1swP4Ulv5xXmlQgY0HAZHqp00LmDC9UECwpk
	 l2iK74XQRsWYEFCTLnNQ60UJPHbTM2Gvq6N1sIQ2+jlp/jHdq5T42jYI4hPisozxlC91F
	 8Gch6ZEbDLtF4U8qKKevFCj+ZTVwQp6d91vBAA1pEf6C+i+gpjXM7LkI1IPsXKxKitRr6
	 XYI5siaZBM6BIOkFfqyuuhLWuA6nSMSORZIRAtKUwLA0WQl1Cn10x5u6477kqb2RfvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=KAa78Ztw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD935606D807;
	Tue,  3 Nov 2026 14:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD935606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=KAa78Ztw
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id D6627202BA4;
	Tue, 03 Nov 2026 15:51:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793717482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LeYzTo+5wlknwYT2A1AiMm8a2kxcJTAnRlx8DbSHsAY=;
	b=KAa78Ztwi0im+S5+ku7sHnCT0teUm559ffH1TwzYqRswkYglTZDVdkhF/pYcm67wmtGdUe
	/8PqZnVq2z6xunpYaIAuTIS/F9eiyEw+uNrnMHSQR+O//yFWcGhgIEnfunm26SG0l0++9w
	6chHVTehTP2XirbOG1izC6MvJzgLtENKdKT0fqw5cQoEtqnFJ1Eu6+CDsev/Wk+kx2hkZh
	sp/CCT+WPydnHY3Dzj/OQQ+1Q/FSJuJdg+XwnDnA04I8bPKyS64J1VGU3vHMlmO7a8lZiE
	qAeKBnLglNX0o96eD/cpuMBX1BhKNO/DxzbaboBdHugdHz5hJ3wK6LKf6QDOFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793717482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LeYzTo+5wlknwYT2A1AiMm8a2kxcJTAnRlx8DbSHsAY=;
	b=HhQpgYVKPvLKL+BGAbeWi7PBsmc6xQTQ4JSh9vYIC1fm7auTiW1Zr7SPljqXWw5jS9P6QV
	TlXGTOjzUiPxQ1+VBmWG24whUAhY8kkw70MsDg++IcITQxaJaf0yEwppNdx8USs6dSQKQL
	FYqrGUH4RhPd3X4q/BNNLkNNz8J6V0UNSEGYQw/eH0TAAUCs0qCgqVnR+Pit4KQ4duHEBx
	VFg4wtmzYEYE9Lw+AY99Rgm9rIBLh+67G5rBZSs/+mrRRJP4tANYRqfvVaqnrWAJw3//nf
	a4DUwvhsaOawPy3KTpj5gh4QsNxjILwZT6fq/iXWSKsJ6vv5f8KnPK6HXtoqkA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793717482; a=rsa-sha256;
	cv=none;
	b=CCNU3gCm459w6r6CYS+Nj/sDbZx+txvufYGgfmbDHq0+EHW8fUGguN5S99pQqOytXRQuDV
	QRRuCBf8ePCkQuzkNqRiXRp6V700tz/qmo2UVjIacEJqvIIEZhh/wZbPrcmOXwdG1pWKdu
	B5COkelZ8rwnyCZvb3n769ABsbGGc6jDkFBLsC5CM8ugDSS4MtIY0zmPtlQ9/HRRsiqaqD
	zaoJqaRKYZKoBiYafMbOP3f7Ogy65CvGqteN/cUO8h9OGW9cKdA/XQY2hjaJgsCMpXXQ8k
	4X4gGv21sbuOUZs+1U93DOZOMSVBJwi/1qwSFUF6cpb6FSpTy+GZCXzPflRNIg==
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xOFr8-002SzQ-2V;
	Tue, 03 Nov 2026 15:51:22 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Tue, 03 Nov 2026 15:51:24 +0100
Subject: [PATCH 4/8] reset: lantiq: Use regmap_test_bits in
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
Message-Id: <20261103-reset-regmap-test-bits-v1-4-1b33607a76b0@pengutronix.de>
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

