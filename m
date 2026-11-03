Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793717490;
	b=oAQjwCiakK3Y5GOAhdxI8BnXAgD002bnrZBKwidZSpOSaBhAVBT+y6I8grxD9u8rGWzC
	 RhOMWEnb3JHgUhJh/JxGninOtbHC7pWMhllsGrIS+hVG1vL4O9EW48H+wQRGUQiSsWN54
	 6/218PGL6m1krBuMltqVfVUWA0XMvF9RL4B6ImCPmkG+B0TY8QnQZnq6V6NrpZMX4qswj
	 PLv9ggmgXnZCfacvf7p57bRtrJNWdaMAHbsTNuBXOnOYdhZdg3WB+S0yc583sbY4Dyie4
	 VQTe3UyTbzT0Z3EnewBWIxMqSdaNTKyRPrKbneG0IMMX1lc1szbH1WMCYOrbpTxh8Tg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717490;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=9UCRkbWywFXal792BpnI8niySpwaDg5ce3RMCLxfdO0=;
	b=ahU24Z3h0lGQXRvdA+UhHaX4mhCoktIis9jlCuePcJTrMo40W8omsEjysQXHCpMtt9TU
	 plFY+TtPNAX5hfBml5J21Jta02dpXmMDwutGgDWNeOk3DVqJ/0UsY1xJ5aHkbyJuRZ9Ie
	 jW4dVFxLTE4lRiWq5rv4DUPeLVIVPfgh7i8hqdnkjpnmm9WbMsMZcVBFlimKOg0vmvzmv
	 OhukB3OHkYdJQvVBaQa96K/eLGSLduu5DzVhM3yfWhUc0HCYr/Cfu9Vz9W4BFwWJjwwzK
	 PbjLjnUgloiWNj4mDADWb3AORSoxaGXFPF3VFgFJUSTkxuPRR8pZQR6BQkDgcJ3/QKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=WKTMj+Km;
	arc=fail smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961D0606A32F;
	Tue,  3 Nov 2026 14:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 961D0606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=WKTMj+Km
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id B7A12202BA3;
	Tue, 03 Nov 2026 15:51:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793717482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9UCRkbWywFXal792BpnI8niySpwaDg5ce3RMCLxfdO0=;
	b=WKTMj+KmDTHBPX8XUQzi97LuwpRIDtdiY+gjp20NiCnwAM7dWV66VeEjPc6iQ1jyMklCvz
	k5yZ8J+I51aXRtkc0dNrFnywmJ6Fu1V0rkMx/aEyGonMI7B0EgYvc0ylmiElEUpPxodBv4
	HIXkBaLmOEnmnN1lbBJtujA7CaMbJo8fSesSdyM34G6v7mm6ItURTJub/M6KnLAUiw2BXN
	spaalgDYgMHLrl5Ndyfhjajr/uvGk1tNkIOqjuSPmp6Ut9zO5HUvtEwq3Y4qm96VfLVV38
	hK+lXP/hu1RYt+/IJinh9GXQQPuA31tDoWSgJEse0sA6xCXrtbfIa0caTU05WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793717482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9UCRkbWywFXal792BpnI8niySpwaDg5ce3RMCLxfdO0=;
	b=Pydoe9+YuAun8je+1LN7fMftjjtqC9lVrA6PsVtOUsvUnBTEj9B5Ngjm9c8nEMTs4A4TAI
	mMFMB2xNb9WIfEGzGpVCD65tOeLt0jPoz8KUDGNQfZgvnE2zcxrdsCiJ77XZlB06cE/TeO
	N/qtCtotol3dsv/H7kBFvkbapqUvti0QhAZ2eDZsXrIScQ+C5NQAH8slBtxwaVHikMPetF
	6uuNg7I9IDgK6DC1xLIeeOAKK3+w5lBQ3yvg+drcamGf20bV1BoL0b7G5AsYmGOFzKuz/K
	s8IHrKnOqhMB/8szBz0fRW5IQriNyWDNiyipkvw0DeNLrV0940l4ZJf5oldjZw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793717482; a=rsa-sha256;
	cv=none;
	b=da3AGn1qEjrKNrQJAvz+pFtvP7xbugrgt8VN+Meeq3pJ7wwFjo3Uk215rqUzqdVk3Fa3iR
	Jz/9TrlEIJsIihi+BRilr07fA3uHLFQ94uulr5eHpSpEGdqaxOukbx/Iev1EThPOAAmSjh
	jA8uigv0F2I12hfZsqt52vXUhph9dxDAXa/shPwIg9ntsLhminAvTSo/T0YD4iNJdCAyOa
	P12ZrATHvgAiQK2p71swrZBurJnIt9NlLL9eCwLRMviPRNFfTW0tQud0wyObsSElB1jB1k
	o9MBgzvEsAsI6CwA5lW8aj7rTwERlnmu8poyXRQ0HoUgfl3gqUknDOmUsVwn1w==
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xOFr8-002SzQ-25;
	Tue, 03 Nov 2026 15:51:22 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Tue, 03 Nov 2026 15:51:22 +0100
Subject: [PATCH 2/8] reset: reset-intel-gw: Use regmap_reset_bits in
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
Message-Id: <20261103-reset-regmap-test-bits-v1-2-1b33607a76b0@pengutronix.de>
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

