Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793977278;
	b=4olITf707qkz3cxjVBfw1gwYDq9JysiYm73SNMHJLOwutDPfEcIi8QiB1TSpXk1QlAEI
	 n0mqgmWrExFddbX1/ad3XbU3FarQR8Bb5vwtFLHuEDiaCuvdP7U8Rrgmqeci+CXG6uwbl
	 CvPX4G/PTC0BQID+N/tIHROLyOaRoQrjDb/vbAtLPTo6dfn8z3raRkZN5wSfkO1C4UNxL
	 F+qjxCASMH65uWLOILe4yjbkeIMP+q26+CsstgUxJ8zY/ABqjJDGmik8aAD3DAjfZE9rd
	 RF8BJdJW82yYQI26hFeKlqNQiNQuZjhq5NP+JfHCeT1DG+bpzzawIMyvuPpd/NBhzNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977278;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=ztv+TKVPP1AgDahvYqKVGMZreynpb/PIkYakl383jiM=;
	b=rB0WtkkWRoEvGB8ONqwerPren0i7aMfIB6zENAJRt4VItlM3TCnZOxU68/BHpI1Ve8Sk
	 FTcRGzGD4u62za/gYkpWUl70FczyJ/lXrEBesPC9JmfFqgQI2kyONti4zI2mHUXE9C7W/
	 SobMX8ajvCR/pxS8kagBYAiysYGj2zOd2qsVlgkB1QStzj+jjojwQyAlWHeEv3O+Smfyd
	 x7QvbRxh/oevsOFRvJl8QPj25ekQfQbuaogG39q3kHlVEIqmOQ0fTe5c/Sotb7ywROtFV
	 GdAfqx5gOquBo+CBuwSB6g6BfbM5ADJkBRTBxjj0jFWDFYZFR3Sg6ry5nUweFY1DuGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=V1hwmRD2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA97606A32E;
	Fri,  6 Nov 2026 15:01:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FA97606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=V1hwmRD2
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 6D44C200B4C;
	Fri, 06 Nov 2026 16:01:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793977274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ztv+TKVPP1AgDahvYqKVGMZreynpb/PIkYakl383jiM=;
	b=V1hwmRD2bpMXgXGcYJChwK62b64YPq7WekgSgeH9kZCrBKjQAVBTKNIPzMqOk0LBiUKES6
	hEz1g5/9w43x/kS9mVYBGGSZQAZ7trU1DXLwPM1UejkXqkRKJ8+/lhv/Vkq/VUKijzfOJB
	HXSQwiSmSk3ExZEQzW8RXTcQ3WVdyt0PCneE6nmrSQpInF/7PejKfnBrtNpfVBLeKy8pTM
	w6hhSZsKQtwM2S5aDoRK6pdPCeUrghslq5U5ou2nH1hhEaDxJKyahxWLmDf0PWaeuj52bW
	GDrSwSTA4A8QNgHFjanourHQs5Ka3xjd/ILA+F+iEg4JhkCnXnn288dV3gQ5rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793977274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ztv+TKVPP1AgDahvYqKVGMZreynpb/PIkYakl383jiM=;
	b=MtIucEbQPejsMZXF/v015EWeXX/L0ToZQxb9Z+gY8PWoggx7zJPhAk9C8ooAyBLVc9u43K
	AgtrWtULFFTO2SZaYFPxmSqXG4FgpmthCqisfscDoX5QENCE0EMs1dBg2Ex4mg6UgMxobr
	sKUjFeu7/hheSJNvJES1A5tqld+YZEDwk+VGVWLmQ/IyxRr1scjwZVeSg6+HK76n4cqHED
	zQr0f/Tx6EIwZ50iGyE5LctUo1tbhn4zuCTihP0ixfS4oARopRZDv2aWJ0RJASvByih5iE
	k8k+RGUjoR62rzk5lqi8BZTVFibbinD523uXCY48vsw9ZzbP8zQWvdm460Y5BA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793977274; a=rsa-sha256;
	cv=none;
	b=Pb+Zv7jAHhcVSXeRBG8kXvmj2rs2iuYQHOLdSKdPAuMSk91GIHpAJRZqQRKjQUxoKyDsTg
	WTaO7LNfyHHi7B9lMmouWe42VuX8Cs75ryhqO4nDOpY3/QjdovXaZtLR11yKlp2RVfXYPT
	6epX5PgkSe5Ta3NPg8nOaC0Wx0TTfPtcy6mE9pzffOkRoU8zR/DNf7kIjy1Yf1452ZkIyU
	KpBVpJxB6/iCCL0MYNHe04HTuvdK2FQyMuOD666QjTka9M4GZO2cXLR0Eeata4K9w8zshZ
	fM6C4r2k+pA9tspSsH+qVAVUOTMiIQq/s859VuTH0CJoFdrFrHPGAtFfaPLBMA==
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xPLRK-002v0X-15;
	Fri, 06 Nov 2026 16:01:14 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Fri, 06 Nov 2026 16:01:10 +0100
Subject: [PATCH 2/4] phy: cadence-torrent: Do not request reset by index
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
Message-Id: <20261106-reset-deindex-phy-v1-2-6a9c9f428be8@pengutronix.de>
References: <20261106-reset-deindex-phy-v1-0-6a9c9f428be8@pengutronix.de>
In-Reply-To: <20261106-reset-deindex-phy-v1-0-6a9c9f428be8@pengutronix.de>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.15.2

There is no need to request a single reset by index.
Use devm_reset_control_get_exclusive() to request the first and only
reset.

According to the device tree binding document, the PHY reset should be
specified as first reset, with the name "torrent_reset". All in-tree
device trees specify this correctly, but there may be a backwards
compatibility reason for leaving the name unspecified in the driver.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/phy/cadence/phy-cadence-torrent.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/cadence/phy-cadence-torrent.c b/drivers/phy/cadence/phy-cadence-torrent.c
index d446a0f97688..4a021a0838db 100644
--- a/drivers/phy/cadence/phy-cadence-torrent.c
+++ b/drivers/phy/cadence/phy-cadence-torrent.c
@@ -2790,7 +2790,7 @@ static int cdns_torrent_of_get_reset(struct cdns_torrent_phy *cdns_phy)
 {
 	struct device *dev = cdns_phy->dev;
 
-	cdns_phy->phy_rst = devm_reset_control_get_exclusive_by_index(dev, 0);
+	cdns_phy->phy_rst = devm_reset_control_get_exclusive(dev, NULL);
 	if (IS_ERR(cdns_phy->phy_rst)) {
 		dev_err(dev, "%s: failed to get reset\n",
 			dev->of_node->full_name);

-- 
2.47.3

