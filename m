Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794243063;
	b=BcjVesdsGJ8PyRRAf4VdVlkVZ5Xbl0/wC64B7jb46KPKka/5yWz+AHn1/DerqePB+YdD
	 p3y/1cyCqH1DOkucpIYObuIczmmHS4ySwnq3PamuhQxtm6Ifjrjr1SLc5fw7bASdkCm/i
	 LmVSs2VCfozFIJAOVzq5bJJ20h0B+umrTDr9fedZY6jdHw8bFqKOOO4H6KG4t9bs8WfVP
	 R9+V1Q8r2iLRo+uRaio4ImARL9h4K+zLrlH5lKX7m202WR073O3p+7k3gbizjB4vYjjGN
	 JaB+lDU9M+L+jGM83EUpwjQkYC5lgw9rnsFv00sRRRYnxpW9tod1fxu6/D1qWwbxdAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243063;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=gSi9vg+Zm+TI4RLv53YhiJ1p0uh4O4FGeOvQj7BhF60=;
	b=rFaAXnavEiGLcBjwDSx8DpbYjGBiZ/JFHZJMg0ABrR4OVgUpiy3o1pA/CHkNd8yitJj6
	 54ZzRL9rYzazdsZFsGHib+b5R4aFw6K1p5Ea4lBestl5f41hErmvbjKr17TeBzy2YC1ti
	 nV+suC0CpbgZP1/90NrSb+8J1R2oWkG5vDxHK+PdwLDCKGgMaj5WXExaoqXPdaOREZDLS
	 0SbsXuIHdzmWLLopTrxsBvW5B8ARzLswxGTHMqjcEtv5W44wbocZ8kZvpP5nOsOMZZEXD
	 igHjyRKfOLOwzcK/h+Hhc976UfbADHgpwNJKyaGbgAXWcst7RNMW6gfXxlHxJMyRr7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Wj7XabG9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD69606EE96;
	Mon,  9 Nov 2026 16:51:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BD69606EE96
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Wj7XabG9
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 7FF5A202963;
	Mon, 09 Nov 2026 17:50:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794243053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gSi9vg+Zm+TI4RLv53YhiJ1p0uh4O4FGeOvQj7BhF60=;
	b=Wj7XabG9itETPv1P9Cz7rDJLEPUor24FxBiE9GXM2RV+mIjQTfr9hcwQxFvu2ahWQvvo2b
	qOnKczooutbFr9u8l5akinEbfQE8xwJAyxx5DPZ6cJLgGtG5jkyMpdm3Hk/vo/7aApq59T
	66wl94joHYTFAOrNjg+VVq51cTEVv8ehcgaCiEVn3lud+mf5L0QyJdn35WDWv2lWqazMgq
	tJfTgkvBcHPnGYZRjqzmwOecsrtJay8ysawNUu4rxEF4CO67AoiFmzX1av+bwl632dfe6P
	eqO7zxVWgkqDbdH31PEoI59LROyAsnRvKx0/C3zTUttubbiAtnclsolqDyFeKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794243053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gSi9vg+Zm+TI4RLv53YhiJ1p0uh4O4FGeOvQj7BhF60=;
	b=d185OKM4sc/+dSIS/GzHYabIcB4QofV6lw7Qlqbx4X5i+xf8zLynmGLZO9aWWoCELcWw1M
	jhzXdNKyzoQic2Xf8VVve0KnzuTQ/ze6/4FdKCRn4wMXbT3A/9i0E0AbDpkFADIeyjHv6n
	kZnYWpDwTEqvRXFnAwzkFdO90rrAbSAuLBxpXBNiCH10qIPWimak28nKtrw49ohzAri4Ly
	MypG67NJNM4dmce9n5QGopXKp6woZ5Q5tYVrCzm6pV15jzS9cvw2UnxX5dh6kviKFzGJe+
	zdfsOfwt3ZbrGTqG4jgIFrjWkmRafUaaPPru4UCz3hZhl01FwX9cVNfeg24C0Q==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794243053; a=rsa-sha256;
	cv=none;
	b=LbucVMWAk32V6XDlyjSE3L0pH7uXqjjfTxOJhnSr/yUe0c3BctaunQYXL0w1S5HYuCeHLt
	zDOIYZX6CS/PnnbB1F+hBfO3vYWjbQGNTnqhXBXw43lAsPo8QgAwgts+E6fx6cDOK8NrhV
	M+rGXUP5iwp1axlFnxzGnXIxDmli3acVwKXOb/ZfMBLfQfvpKAm2XB09tC8GNCugMox2rJ
	ouhrGB3dyZt13h6H7aZI90aMzCcyitUofEkDQ3bsqtoYGyZfkATsyX3X17B21Cbp4cMt2r
	S6ImFd1jmWV8MrylPzKrHgYQ0FfRlLmBZxBV8DbVO3mj9wQNn7w4CjlVn+0tdg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xQSa5-003N3i-1P;
	Mon, 09 Nov 2026 17:50:53 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Mon, 09 Nov 2026 17:50:49 +0100
Subject: [PATCH v2 7/8] reset: zynq: Use regmap_test_bits in
 zynq_reset_status
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
Message-Id: <20261109-reset-regmap-test-bits-v2-7-c886689bb85e@pengutronix.de>
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

