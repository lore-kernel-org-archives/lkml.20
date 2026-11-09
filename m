Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794243061;
	b=20tkQEzUo/Qj67BusCA1BPzGjenBD3fiMSklE0QWuJSCHOJpuwAyuhz7gCsHOvIWPU/B
	 wU19OzMFnFjOY7AGxCAUXaW+wEgGplVSQ50woxj4ijFIsE2jrZUownc271cImyhSBhPLx
	 F8iZtZWbXHzuVBsF5UP34ibqraqUywvnmSS0aTqjoVjN0mKUJM126UlxmukW7MA+fEj33
	 LyjTO4+xCQYAAqVzwyhmCQXEG6PLtpzLKXIBkiK/BnucSVfaummWuk730a65zxaWn1/G6
	 barA1PWr8cKNyShVEs4ZFoKjE7F3TGSu5SyXD8+tPqsCRuC8+ML8G5m1Ew1jK6Hoh/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243061;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=9UCRkbWywFXal792BpnI8niySpwaDg5ce3RMCLxfdO0=;
	b=z15550MoIbp+MzdXMD4dH1KV69htodifoH0N5CYrLnZShMbXEn2yIMbjQA2XJs70SHx8
	 ZQdVqLnyZ+aYYfY5+gfAZUotEEPFjdQa0HcI4k1fq56jsBpT92eyNKjMUtEwBffTTO3ex
	 UHeXwa/YE0eo7SojIxhQ95eouXX0tuw6ZhjJ4egr+WnPz18tiQ4bxUuR8Wl758U/aaHxu
	 G8wJfKmD04BXILsZbwv5YSlTRfwi53GgDIas5emUBHr2fkMZLg0QziFtt1Uly9nWv3BQV
	 jpiLhAepmo5jnLQUkv7I0splqqR7SaCx42LwzVmLJMAEiFCKFIOqv34e2RM90I+LnBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=aFBKmAyM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B69606A33B;
	Mon,  9 Nov 2026 16:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84B69606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=aFBKmAyM
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 40CAA202824;
	Mon, 09 Nov 2026 17:50:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794243053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9UCRkbWywFXal792BpnI8niySpwaDg5ce3RMCLxfdO0=;
	b=aFBKmAyMyqu4P5imJ12ehJWd/c0iiSfSlKEcCWlx+f/vaAmv65yJFSF13B1ifA2IT/aXxX
	EK/NxshP2cjPl8JhvsvWiRrVOmRnM1sAzv/nskG/4cGeekwj61fxp0yqCQ0sl6a/6rbnG8
	TzZVtLz8N1uuR2v+bvy/blw4Yb4TILPNpouxX/cw9r2Uo8xEC61Yc5kXaVStC0LPERdC2y
	baNw4c8VWszTso7RN3pCWamk6sgujdvysO2N3VHcs/j/IS27JOftyuHgC/dhUI6PbdlNn2
	FE8lQQVsuNambBYsssiZ7bg1CoBLidOnGYkwEHQjjYaBDhagUbgJWeCM1OBAIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794243053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9UCRkbWywFXal792BpnI8niySpwaDg5ce3RMCLxfdO0=;
	b=LzFIhhYpkKLd/pTfTzsTzZCV2Lm42HnELvjy+rhEuAdS7YaLmkvUzDNm7LgidWy5iDpcVP
	jcGiF4dh5HD1RhIu6k5/modtY11eD5TBD2RCZJkryba0HzrcOtRYyRxTStyU49dZhx3KFx
	Rfi8pnIQS3kHgQn4s2OAo1PyCQaQLIB8oo3V/KRAYbVN0RuuPfrczBZKX280KTw1jeL4cP
	0Sh0Fd8soSN9IKJTyx06SAGA5G4jWr9tLlDe7/UtLhr+VC6LtOdFyAT+GpQtIYLyjHKA8z
	ytpGtvvzo2UUveSw7wRn4+lmmVgPgdge6l7gocQqxIfxZIJReEMIpMsEnSJb6Q==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794243053; a=rsa-sha256;
	cv=none;
	b=Eie2k+eIbPW5skyQ6S29wYUND5YsF9kPP1hTS1cPr2Dyqjf8BJ/aB0bDOlr1qtpHAYa50s
	Mbt6l9PE2lKPv+ckH1EM3mUFg0hXUIlIZgc3/Po+B3/HyTVhgXPzpb/Wzm1ix0VooxAhgI
	ARLJjLVptlHrdHVJyyzZDyWKSwvXpG3Mkr72+9UZP9KSLtL3RaH0/PHD39GLggVmZ4JGci
	tzRmXtyRH/ccn3HLWWdcgncDuSYxlfbilA/RKOc676/UwjkfRPzCqq22rHtjOb2HXQY8Jz
	HBxcQVYq+2T5HcC5KdCQYGzpX/RazZzEgBABze4XBMksidhgEeGV/Gqex1oKqg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xQSa5-003N3i-0Y;
	Mon, 09 Nov 2026 17:50:53 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Mon, 09 Nov 2026 17:50:44 +0100
Subject: [PATCH v2 2/8] reset: reset-intel-gw: Use regmap_reset_bits in
 intel_reset_status
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
Message-Id: <20261109-reset-regmap-test-bits-v2-2-c886689bb85e@pengutronix.de>
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

Simplify intel_reset_status() by using regmap_test_bits().
No functional change.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/reset/reset-intel-gw.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/reset/reset-intel-gw.c b/drivers/reset/reset-intel-gw.c
index 0db64cc8a282..4cac2a8b0108 100644
--- a/drivers/reset/reset-intel-gw.c
+++ b/drivers/reset/reset-intel-gw.c
@@ -112,16 +112,11 @@ static int intel_reset_status(struct reset_controller_dev *rcdev,
 			      unsigned long id)
 {
 	struct intel_reset_data *data = to_reset_data(rcdev);
-	u32 rst_req, req_bit, rst_stat, stat_bit, val;
-	int ret;
+	u32 rst_req, req_bit, rst_stat, stat_bit;
 
 	rst_stat = id_to_reg_and_bit_offsets(data, id, &rst_req,
 					     &req_bit, &stat_bit);
-	ret = regmap_read(data->regmap, rst_stat, &val);
-	if (ret)
-		return ret;
-
-	return !!(val & BIT(stat_bit));
+	return regmap_test_bits(data->regmap, rst_stat, BIT(stat_bit));
 }
 
 static const struct reset_control_ops intel_reset_ops = {

-- 
2.47.3

