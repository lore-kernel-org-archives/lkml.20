Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A782E51614A;
	Wed, 30 Sep 2026 16:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790787139; cv=none; b=lxfvQ9BtR3Uidqx8hNzVEIp0FesQLxjS2MbA1nZqLJJIwKXPQhNJDMjK0UbOA0Zxm5JeEfJepsR0Rc2E+rJAz6NhkJ4xbZGRlBHgFCxIlMZVJT/lftyqy9PduMYhB+DKSiGGROeO9f0Zsj1ZpvvIDI4tBKZ9n05VEQBnBgOfH+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790787139; c=relaxed/simple;
	bh=FkTS1J850r7Vj79AJGPS5AoW9XnMem2eGQVjUeS1sP0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mBH6md6gz+LHdX4KHU63junSUu3ycByXYTO/JwBypkGbeqHYMjRtbve/tEroGJjH5ta9hzKNw1X8x666vBxDjbz/Grai9Ni7oIQVaZSEDYyuQ/JbVOCNPdgWUPcKzphKLPwIcd3rPz5ifqHljbV2njGk8qsuKe4dMuRmCsjLYgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lckSvKwt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lckSvKwt"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3DE0BC2BCB9;
	Wed, 30 Sep 2026 16:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790787139;
	bh=FkTS1J850r7Vj79AJGPS5AoW9XnMem2eGQVjUeS1sP0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=lckSvKwt9uj2sA4OcHoQgoHsE0dffyzGcWOAzHJiVv59EeBnnec0g11ALlfc9bxor
	 LVaIdi7DdeORzdo/WOfCosWO4YMMT0QIzV1/PBaB97npNcetJA8/RzMUIMHu9pVfa4
	 RbN1ETezqlQXdOxL9VowXGRSJgWTqxQMcPbWup7TbjERXTuFa0qL5mYCCpA3qNPwCn
	 R5zeSicjup/NtJlidOMxT+wW79Nmo2jLdaTmtKEnfXF/vRMhiADp+A1MhXhn4Np0aH
	 n3PrKWsR2F8/fwLqjlo3JTXI/WkTDxG12ZLr5/PKmslrUqcEkxq+bd2WqS6VU0dPuS
	 l4E01elod9Rxg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A483CA5FC5;
	Wed, 30 Sep 2026 16:52:19 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Subject: [PATCH 0/2] arm64: dts: amlogic: meson-sm1-odroid-hc4: fix the SPI
 NOR
Date: Wed, 30 Sep 2026 16:52:13 +0000
Message-Id: <20260930-hc4-spi-nor-v1-0-9a3351e2984e@iav.lv>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD0+vWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS2MD3YxkE93igkzdvPwi3UQLA0NTo1Rjg9REQyWgjoKi1LTMCrBp0bG
 1tQBEQpybXQAAAA==
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=793; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=FkTS1J850r7Vj79AJGPS5AoW9XnMem2eGQVjUeS1sP0=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFl77Ry+ae2L8vxTvSl2tdjba93Cf4SeTfPdmyhyauPpT
 a01a7vmdpSyMIhxMciKKbJMOKRxK2PJ1b/+HuYPYOawMoEMYeDiFICJpP9n+CtQL/L8hb3782ns
 JguX1ZY/FWj5UX7k4/PN2fzcutNfB1oy/BX5NsVdR+DUgfvdxj/qn75j3sLie8H6e0ZN4sHcqpW
 bNbkB
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv

Two fixes for the SPI NOR flash on ODROID-HC4. Patch 1 lets the flash
probe after a boot from SD past the SPI. Patch 2 lowers the clock to
40 MHz, where reads stop returning corrupted data.

U-Boot takes this device tree from dts/upstream and gets the fixes with
the next sync.

Signed-off-by: Igor Velkov <iav@iav.lv>
---
Igor Velkov (2):
      arm64: dts: amlogic: meson-sm1-odroid-hc4: mux the SPI NOR HOLD# and WP# pins
      arm64: dts: amlogic: meson-sm1-odroid-hc4: run the SPI NOR at 40 MHz

 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)
---
base-commit: 065957517880dc7053e0723cc9532b6e78c8855c
change-id: 20260930-hc4-spi-nor-a80152e30ea1

Best regards,
-- 
Igor Velkov <iav@iav.lv>


