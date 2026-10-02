Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE634BB7F0;
	Fri,  2 Oct 2026 18:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790966209; cv=none; b=c8hk8TAphw+tw5Zr5UD+xkK1htAagG2+JWDlDtv1JTk/Br6hzIshDYfcAxOeYTW8qFMwUxc03kgefOWx/cwIQZnxlJIkEA908ybyBCyEvLNtkYw6vBeMFQlex4Y39Gp0TS2v2G4ORMnyjRsGIkvyjGihQihBzEZ9XoehVdCnsWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790966209; c=relaxed/simple;
	bh=b1yPZi82g5YJjfiKmfE3necw60fkrcFAPcinKeqKRUs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lPsS4Ii2HLuBHX1O+/06Fp49g0GXWQgSk8vNONK60ez2rtbhiKMmXbjfOsU3pgx7YoBGZDQQ5ujfh1bH1h91QfcsOzn7dOUkEamf6CTSLzvhEsB8xT+WO63pQLqGxsFxQYicN5EwfEPMYSrOBupVrVjgANmgDljDugr9qH6S0M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XH3mdsOo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XH3mdsOo"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56E09C2BCF4;
	Fri,  2 Oct 2026 18:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790966208;
	bh=b1yPZi82g5YJjfiKmfE3necw60fkrcFAPcinKeqKRUs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=XH3mdsOou+EpbPmhJ04gKwYHqxuNG2AmXt+q+1soAqXmfGMbkT37SD9HcFG1P29tg
	 HFYHX0nvLqq9Oaq9Wj0PoWmOoX66/sGkTjl88ho84FeprwKYKLzcNz2mKUQZkKpJtG
	 uDgq276zv2LoSurCUQydAyzawVw/3iJXBnHdhoYeOByL7rvgcuOAhvxZkVwdwqo27u
	 4T4oD/397qJ19RK8TsP0cCGOt/ej/p7NYeuH8vslg9dzNVPXN1RKKyzTO0RJMfzoby
	 abYS30w1H9/Plfo0HHu79ToTPz8bDRe1IvNBIp4WqC1av2l45ogj0kdLv9JSyWPxIf
	 +XK6kUt69ckrw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3241CCA5FE0;
	Fri,  2 Oct 2026 18:36:48 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Subject: [PATCH v2 0/2] arm64: dts: amlogic: meson-sm1-odroid-hc4: fix the
 SPI NOR
Date: Fri, 02 Oct 2026 21:36:45 +0300
Message-Id: <20261002-hc4-spi-nor-v2-0-8366a4f91049@iav.lv>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL35v2oC/23MQQrCMBCF4auUWTsySVppXHkP6SLU0QxIUhIJl
 pK7N3bt8n/wvg0yJ+EM126DxEWyxNBCnzqYvQsvRnm0Bk36QtYQ+rnHvAiGmNCNpAbNhtgpaI8
 l8VO+h3afWnvJn5jWAy/qt/53ikJC64wZFGs79nwTV87vAlOtdQfMm6CfowAAAA==
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1092; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=b1yPZi82g5YJjfiKmfE3necw60fkrcFAPcinKeqKRUs=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFn7f+4N1HnAzNsq2ufuFNnO8HmGxIMWXVHutOxnZT6yQ
 ietzuZ1lLIwiHExyIopskw4pHErY8nVv/4e5g9g5rAygQxh4OIUgIncTmf4X2Ha9crFovxM0lWX
 lX9qDv35fcD/REMti3+LrbDwn/MWtYwMK/u33irZ21L6sMJk1oQtlQUym7cFMt9vtp1qUCN361k
 wBwA=
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv

Two fixes for the SPI NOR flash on ODROID-HC4. Patch 1 lets the flash
probe after a boot from SD that bypasses the SPI flash. Patch 2 lowers
the clock to 40 MHz, where reads stop returning corrupted data.

U-Boot takes this device tree from dts/upstream and gets the fixes with
the next sync.

Signed-off-by: Igor Velkov <iav@iav.lv>
---
Changes in v2:
- Patch 1: move the HOLD#/WP# group to meson-g12-common.dtsi (Neil).
  The HC4 dtb decompiles identically to v1.
- Link to v1: https://lore.kernel.org/r/20260930-hc4-spi-nor-v1-0-9a3351e2984e@iav.lv

---
Igor Velkov (2):
      arm64: dts: amlogic: meson-sm1-odroid-hc4: mux the SPI NOR HOLD# and WP# pins
      arm64: dts: amlogic: meson-sm1-odroid-hc4: run the SPI NOR at 40 MHz

 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi    | 9 +++++++++
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 4 ++--
 2 files changed, 11 insertions(+), 2 deletions(-)
---
base-commit: 065957517880dc7053e0723cc9532b6e78c8855c
change-id: 20260930-hc4-spi-nor-a80152e30ea1

Best regards,
-- 
Igor Velkov <iav@iav.lv>


