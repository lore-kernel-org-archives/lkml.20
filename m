Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794243064;
	b=egZlXmBnz8wRg9ef7JeiWESMHeJdxwMmLGnDZJXum2fyDvjjR9ZhLiHe5WisJuZQh4mW
	 SJnj7V9WUYNAU3guZcn1p04W1Pau1OAIQaW+b65uPMyArGRpbitrh/U/I/p89J1ASpECZ
	 2KrlccB/SzrVmNyy8EWGR1ObPNPdzq7b/EDc2sIhVF+Cf/thGB/rV6BNHj+/GcWYR+Hkg
	 TGn3fyExMO+Sauu1oC5E9CquCliENuAjfLXhraFMySD+b/TCZkAJr5Z2qZ7/umH9ZaBk9
	 xmqVkuBT7QQgntVu/eW3E+y8vouPegYemncv2LK2DhKs/McNappR/fbeh3bK3n6fogw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243064;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=DP6mwMrATChRECS6iH+LkcBySCfvUn9RliJv7XX0ATM=;
	b=WXBE4eWPCZ3bVAMPlcdyn+d44L9PylCrlIlX4xrlGDnY/6uDNLxJRKIcP+4Sue0c3TVb
	 SKkVyTqdz5g/56hkO0VqzG5MqR2S6pyCeMHx2b7cxl5GjcRK1ibzlfI3XLR4Dq9Bj5gaz
	 yeTnJXukFXf7MgwHj7FnvjpIfKfnDaEVntIQp2vQhd4qTn+gFD6D30qBTtBw/NhGqpxpx
	 9fzlE217wot6YhThA/cyGfigu/XdKMzSvYpAiLXXMVbB5H484XN/rpLjF4PGNLQmN+AQ6
	 8bZ09VD+pPa+PMgbcevqMMT1Fq8TSfJmoJCSKi9mpXiBYVdebV1+4qzupSxQEqxTiJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=avtI7dnB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD6F606A33D;
	Mon,  9 Nov 2026 16:51:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AD6F606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=avtI7dnB
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 90D2020296B;
	Mon, 09 Nov 2026 17:50:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794243053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DP6mwMrATChRECS6iH+LkcBySCfvUn9RliJv7XX0ATM=;
	b=avtI7dnBGB4Y7zQO3RLiAmO5cl9lbzxJFHx2rGto+3debRU7huFDnNhyaZc36uS/6bsMcV
	jl7q9IPLr9gVWBSqcfD3ZVbX33TgMOjLyNX5KixeUrPL4PLZd6Mp7wp/5Ma81khEWOGdQJ
	vIaGP+nynECz7cacS1ctwuyTKcItWRWQQqJ8cLZba2BXiyz7tAtXoTBgkVrOf15B3mTDlN
	KCtud1tcWfYJpRvW89p0w8+5IAU5GF1ynCTBgyvU/5t+jrl5lyKRC96OqmZuh2XUuUtD2K
	H9W8owVtnKTcKEUInA2FhqE3FejXvJLDBKvqxnjqL2dHwRz+hXIT0Gge9b1Z+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794243053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DP6mwMrATChRECS6iH+LkcBySCfvUn9RliJv7XX0ATM=;
	b=WDFGjWR3F3x5oShxY+2qh/Pvw0RW0U9M2oRDjlqF+9MNfVCYJEgs8oJQbEb0IzaySD0UvF
	a6Oxndrr60OMVxRENwmw5A0nckHEojWG43s5H0ImHvE15ha8BteCjLGzXG+es4KEEkKDG6
	NFB4ZbGlbdiJwKs9VZk2zQtgqDUhHIRfVmOVsuyyuwpAQy1VmblGg9PXF6w9P8bgtTndag
	CDLHJ70sszo3BHN3CGzVsNe9YpwAEALoaC7qJR5UJnyZlkVGwD1+SO+OKJyh+JgvHWg9yN
	ncUYuCmQFWD8/N8VffeyhJ/EsVn1WNGT54CsrPvJNiNURgWyZa0REtFXcsmqHA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794243053; a=rsa-sha256;
	cv=none;
	b=Xj5zCAS6O9olEyUjjoyZNuSmSxQ1bPZsLTRCKttho0NSkioWv+WxDuBV1XFJ4WySQqJp/E
	mwgERsgUYH+PM6ddhdVtRn5tdxOuHupW369rcaeJPRsJqDjPea9ppDAjATVMVEhRHeiw2c
	L4zXDuARmlUrA3TCgXVb4KvNQmUACopIIM69eH220QAd9lJgujrnGHi54LKa7eRFK/xjyH
	j+8uciF/yJbFeEf19S5Nom5pl229nv21aDCIG/8iMxtuS8mI5CUA1527bf2tj696RqHNwR
	g09RTCGEYoQLaeQI4CBlyNJt0I7pRV/rj2r/kc06scizIJi15AIuHaZn0nP11Q==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xQSa5-003N3i-1Y;
	Mon, 09 Nov 2026 17:50:53 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Mon, 09 Nov 2026 17:50:50 +0100
Subject: [PATCH v2 8/8] reset: tn48m: Use regmap_test_bits in
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
Message-Id: <20261109-reset-regmap-test-bits-v2-8-c886689bb85e@pengutronix.de>
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

