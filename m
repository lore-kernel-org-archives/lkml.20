Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793977278;
	b=DW8viFSdlXaJ18fcIrwmXueSIm82vzGmomHD82h3wX2FZu6xIFraesWbt0ulzVcDKN6o
	 eQEB2yZawWEfz3s0IxhB4H8tw/zpaA5JUR1dYFyFkHzaHVP6gbt1yv+z8H6v52rJnng45
	 fGiNhWzhPGisGCDXItiaSUUg2GHJp2Foexa8K7agBwFgqQ8bVc55VrnRKHQPXXSFf5OFJ
	 XtMDL/xQgkztdmcyDYbxescf6EwIPTj/9WYhsQOSJlNeGyUgnBq19biDj2vi8wtRhcCnn
	 6x9BRZfcEgdBsayRpzOuH7PfSSGFfHFZTJuI3PczX7VP9hCjfti4FnT8PMu3Q3B6PtQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977278;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=QOSfFfKgNyCA0ifvnyaw2Um6hrt2CJRTPoz0Nc739L8=;
	b=jv8DyrUdOjOBRhWJIuEMUVN9EGE2xlCNEn8s+azd8PkWG0rAnTKCnG8SpmAou/sY9Vfp
	 NVkPA0dslALqEUybc69BFnjqkSDwMsidji5l6opxO0D3T+Y+qX5/LAuUfsfio4nqiWUn3
	 hke7GI7XgU5Xy+H1U1hcC8n7W8zWZGcEWV3tco+/9XpDEBTTMI9MtXpWNpOpcWT38tJff
	 qqIAEl+KOBuj/dcjxcOxhaxzrjVu6FeaWymZb4NsATRJyTl6Mvf7zs5rKpT2yRgGZkNgo
	 M5YPhTbQb6I5uMMm7rJCySCU9YtddcJ/3EHZkaiGqHXOy0lgZQNQm/Sv4invjzRDhRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=JbA+oDNX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F933606A326;
	Fri,  6 Nov 2026 15:01:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F933606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=JbA+oDNX
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 5B41620039C;
	Fri, 06 Nov 2026 16:01:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793977274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QOSfFfKgNyCA0ifvnyaw2Um6hrt2CJRTPoz0Nc739L8=;
	b=JbA+oDNXY+91mVKd4rXWmemuFqDclVIiquUfR5r8ffZEmkA7+G/VyGCnCQiZdsX5qVvRcJ
	ByfYpgV379zWZf+LY6GqDL31ymwKBpN49LGwz7w8piV23gy920jB767dxwcyhV0IKAcMt4
	434RXKchnuU+CMamffvqu+8OMJTK3ZuHnW2m3rD5aNJgpEToC02JToD4ws00Xw+EB+TuFH
	dlED4IZxR5Vhd908PoFSfxplsREFGnmhQdrLkmjG9isuPOg5oF1YIXmAPynwKrhaQWHIuf
	xLbsyBvHLofs1qDxFU0YJLrouYyLmVN/ly1gBF3Ef4uHrg9kpKKx3R9Mf+sbnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793977274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QOSfFfKgNyCA0ifvnyaw2Um6hrt2CJRTPoz0Nc739L8=;
	b=bwDlA+Nt9LlHaKa/RfsRL0lTrx44xb0y8iLCX/8t5vlKNU9JNZYJmfMFdmtREFNJbWBYop
	7E4+JpzfskpT1uQpwffTL7Mk6Q/RDoBGz/329Qe5P/WaMvW8PmME+Ch8T6u3UAYSBzsoN3
	rEac3TWASq+sXbmCtG9qfBUHtiLLhL/Hfx/0+q6tdyF8VoQ88epLb4xEPMeY9HOe0tgkIE
	RW0xhRoIZ5izMgzj1k/B5Kxdu3wLXnZZ2zzw5gKhAOnVF3xTLrXX/ITvGw4COQa7bT31ZV
	b0xdi1D5TPuMeOjIeg0xNYMsSnl14OYtpFSZaBw8LZBO5mVnSJLKnAvNhX/GLA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793977274; a=rsa-sha256;
	cv=none;
	b=GWKT9WNaVL6vIsWby1CeXKRmowmxcR5W2F7w4cA5Pgf/Q1epPw9feqVreFxco/O5aKCJiY
	EpanfILXEGPePIPl8a2PDocixHtiKS64K7QxbV63bvIMM0rWlTa7AjwaQp37V4QPTe+f3a
	dBOE2pqHNq68/4TaterwKH4ZGhUEYFeXDAaT79387i2Z5tFlNRICZds8FVTSj6mxCdqD+J
	OfGagpLSphur8mbi1IfFAjJmRXcXONAGHWmtTyezYXVts6nrrVM3UcjpQX9IAX/sA/t0TI
	ruQAotouwUBTCvg2BJKCFtCTrYKerRGqHSodikr8XCHTUSR2X1o5sQegTBchCw==
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xPLRK-002v0X-0n;
	Fri, 06 Nov 2026 16:01:14 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 0/4] phy: Do not request resets by index
Date: Fri, 06 Nov 2026 16:01:08 +0100
Message-Id: <20261106-reset-deindex-phy-v1-0-6a9c9f428be8@pengutronix.de>
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
X-B4-Tracking: v=1; b=H4sIALTr7WoC/yXMQQ6CMBBG4auQWTtJC6FErkJcSPsXxkUlHTQYw
 t2puvwW7+2kyAKlvtop4y0qz1RgLxX5+Z4msIRiqk3trDWOMxQrB0gK2HiZP9yaJvpmjLi6jkq
 3ZETZfs/h9re+xgf8+h3RcZzkvhdEdQAAAA==
X-Change-ID: 20261106-reset-deindex-phy-503fc3bfe967
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.15.2

There is no need to request a single reset (or even the first
of multiple resets) by index.

Replace usage of devm/of_reset_control_get(_exclusive)_by_index()
with devm/of_reset_control_get_exclusive() so the _by_index() API,
which is only ever called with index == 0, can be phased out.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Philipp Zabel (4):
      phy: qcom-qusb2: Do not request reset by index
      phy: cadence-torrent: Do not request reset by index
      phy: qcom-qmp-pcie-msm8996: Do not request reset by index
      phy: qualcomm: qcom-m31: Do not request reset by index

 drivers/phy/cadence/phy-cadence-torrent.c        | 2 +-
 drivers/phy/qualcomm/phy-qcom-m31.c              | 2 +-
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c | 2 +-
 drivers/phy/qualcomm/phy-qcom-qusb2.c            | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261106-reset-deindex-phy-503fc3bfe967

Best regards,
--  
Philipp Zabel <p.zabel@pengutronix.de>

