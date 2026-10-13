Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD817511E82;
	Tue, 13 Oct 2026 15:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791903893; cv=none; b=QevLTX3Y5fyRTGnLQ3wjE4dfcKowo5nhYAhKuDMAVcYFQhBUdckIwuDGv1waVRxyVf/mfb6qJpPLj+BdWBdorYarB3LGlgdRpP8McnCKG1jUhqwy2W6jYXqLxxeAzT05FK0966buJVaJ+Rcd9wSWH62zGOXk2ofTp4A+F6d5l3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791903893; c=relaxed/simple;
	bh=RUudPQA8z+0LZXJ+57PTH0IevBIz82+0+2DHH7x12zE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=khefmdwz0Dtof/1wFqqa6hiC92la4qHsbM7hOUFn3aDrsNxN//y1SuDbB04nqARSPebHdGAr0BVdXphwH0dxlDqGtWjRPOKnCiYj5dhvE20anyaodrmYO5cOQvGHDgt2CqFHYcpA6/1YJGv2hXRG+l9gfSR3300M65adpPt1Cnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FL8q8Bue; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FL8q8Bue"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4890BC2BCFA;
	Tue, 13 Oct 2026 15:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791903893;
	bh=RUudPQA8z+0LZXJ+57PTH0IevBIz82+0+2DHH7x12zE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=FL8q8Bue3gE9cOo8HZBMsBWBv6m9DcuT5pDLg20AJ9AdnXqi85txhDuSPzejuxmww
	 IDxhdvCzxIM2qz7E8umEqegkzSFQ71vzxLwqEuumL8bsCVZWfY7vPfQrdyqtESkiDg
	 fBd3pe9eTjPNy11KW5D4y2byTYz9ted2cxd8v7lA4QgMInJ812bPYu+ftdyCJNN+u6
	 YOcsb0e/hszkbaVERNj5codwqjlWEWADVlKNV3OVZPLlzlsKx05Xo3oDcc4icAUvoB
	 GmGZLab5M0OqJuBr2EA9j2m3MiLR6yyoI1OLRXCade1ue1zn3FSNWXn0JFAk31tOuL
	 IUNGrHPyO92cA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34E9ECC6B16;
	Tue, 13 Oct 2026 15:04:53 +0000 (UTC)
From: Mizuno Miotsuki via B4 Relay <devnull+founder.crepuse.com@kernel.org>
Subject: [PATCH v3] Add UNIHIKER M10 V1.2 touchscreen
Date: Tue, 13 Oct 2026 23:04:51 +0800
Message-Id: <20261013-review-self-touchscreen-v3-20261013-v3-0-beec2a35cdb8@crepuse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJNIzmoC/02NywrCMBBFf6XM2sE8IKC/Ii6SOLERSSXTh1D67
 yYpisszc7hnBaYcieHcrZBpjhyHVEAfOvC9TXfCeCsMSigjhdRYJVqQ6RlwHCbfs89ECWeNP0f
 SyUjjZFBWQFl6ZQrx3SqX6848uQf5sU5Xw1kmdNkm39fTHjm2SHv9l74Z2LYPnSK9mr8AAAA=
X-Change-ID: 20261013-review-self-touchscreen-v3-20261013-1e9616b1f2a0
To: heiko@sntech.de
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, conor+dt@kernel.org, krzk+dt@kernel.org, 
 robh@kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1557;
 i=founder@crepuse.com; s=20261012; h=from:subject:message-id;
 bh=RUudPQA8z+0LZXJ+57PTH0IevBIz82+0+2DHH7x12zE=;
 b=owGbwMvMwCUmds2G2fVJ/hLG02pJDFnnPCbnNOwTXtvaufb8wZBFWvv/vrq2etKkqcfyf9fXd
 /7O5dK80DGRhUGMi8FSTJFltih7+aHmFdfmTmiyg5nDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10DHSMGbg4BWCqF+1gZGj803hDwqxnPeOJDZcuqryas03xkMWZDaJ1Ar4rJHTqMvIZGSYtiHa
 czeMaZZe74UX1db6Hb6NMtM+KSfDqRp0/1sJdxQYA
X-Developer-Key: i=founder@crepuse.com; a=openpgp;
 fpr=9B150777C283A8D69D90823E16D63C0345E46FA4
X-Endpoint-Received: by B4 Relay for founder@crepuse.com/20261012 with
 auth_id=1166
X-Original-From: Mizuno Miotsuki <founder@crepuse.com>
Reply-To: founder@crepuse.com

Describe the NS2009 on I2C2 using the existing shared vcc_io regulator,
the validated raw contact threshold and Y-axis inversion.

The NS2009 VDD is connected to the board's common 3.3 V rail, represented
by vcc_io. This connection was verified by continuity measurements
against the exposed 3.3 V header. Additional measurements around the
SD/MMC interface and SoC decoupling capacitors are consistent with the
existing vcc_io supply topology.

Changes since v2:
- Add vdd-supply = <&vcc_io> following the required-VDD binding review and
  V1.2 measurements, without changing the shared regulator's constraints.
- Keep polling operation; the 10-pin package has no separate VREF pin and
  PENIRQ routing remains unestablished.

Dependencies: the submitted common I2C2 v2 patch, based on Rockchip's
v7.4-armsoc/dts64 tree, and the NS2009 v4 vendor-prefix/binding series.

The combined DTS passed schema validation with the pending NS2009 binding.
The v4 driver passed touch and supply-consumer lifecycle tests using a
temporary live-DT vcc_io reference. This final DTB has not been booted.

Signed-off-by: Mizuno Miotsuki <founder@crepuse.com>
---
Mizuno Miotsuki (1):
      arm64: dts: rockchip: add UNIHIKER M10 V1.2 touchscreen

 arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts | 8 ++++++++
 1 file changed, 8 insertions(+)
---
base-commit: d6c0b613da7796745d9ae71d0d0b87cb48ca25c6
change-id: 20261013-review-self-touchscreen-v3-20261013-1e9616b1f2a0

Best regards,
--  
Mizuno Miotsuki <founder@crepuse.com>


