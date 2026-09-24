Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AEE43F4A3;
	Thu, 24 Sep 2026 07:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790236525; cv=none; b=FCAUd0ijDhtdSkfFwEqiBzWkfk3DtDQxTia4PZ7toi6AUesbjIsJ4//eCRkIVQR3gTJqqwHtiT6+me+PuC/LIwKjl4m9zmHWPibMjermG+3JbSITo8HrRo8Yte8/8ZjC0obRRS9jGlP7mo5PrjHS+KCuB4nVTagReze6eK+TrVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790236525; c=relaxed/simple;
	bh=+uFwpByf2LCo/+vxMzKp8oQ51ZDMbMXPPhDKZXRiZQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iUDLXq6rJ0tE48fTk5YlZiIP55u2STHOOIBNkriNZW0tMygK9SCtt5eWlqrX8zdaQvSUK7Lle5Y9Ru+83ooskTEp/J8suCuVZBcqb5c/SrbrRPxj1hC4TfTY8Gwcd2vx7TTskGklavsq2x44YGMhIqDN4Mf3HgO96SFCVvpnegM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YPTF1CO7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YPTF1CO7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39472C4AF0B;
	Thu, 24 Sep 2026 07:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790236523;
	bh=+uFwpByf2LCo/+vxMzKp8oQ51ZDMbMXPPhDKZXRiZQY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YPTF1CO7TIsVNkdDe5yc4oH4HwiUv5dXlKkVz/qxU4ynJ2RsvhxSmebsIw8TGeu3K
	 1fKAbmjnrnYrxs7lWYlT/gtuj/g8a9/ORD1wui1Pc50GRKmigWxSJaWTzWnPfF0XrT
	 xOpPRFaYBYMmjCQRCzIZ14XH9s9Tr7H6EtNakbdenttatXYmhggjUnHZtwvXayySTO
	 4esBgZL99ZtzZ6BtKeFoOyuBMqd5ie2QBV+2pch5jirE9UxIqFZ9e+dm+s3K5H64Ea
	 82oYrYWnEN2LA1204DdfigwZ41xQmYRavMGt8h6HBad2Ak2SlGjwp2r/xOBDSGE6Rr
	 6HQmlwx3asbsA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25D9DC98315;
	Thu, 24 Sep 2026 07:55:23 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Thu, 24 Sep 2026 15:55:13 +0800
Subject: [PATCH v10 6/6] arm64: defconfig: Enable CONFIG_VIDEO_AMLOGIC_VDEC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-b4-s4-vdec-upstream-v10-6-1289303a58a4@amlogic.com>
References: <20260924-b4-s4-vdec-upstream-v10-0-1289303a58a4@amlogic.com>
In-Reply-To: <20260924-b4-s4-vdec-upstream-v10-0-1289303a58a4@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790236515; l=804;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=pkxh5YjN/46und6BilAFWFBEvRqbE1Z6teriyhXV5cA=;
 b=dVF1ml1MzdrmuJ15YfefdqwsNvDB9ya4fUXYnke2jnpsD9/CLSgPdIO7KUqUKPVZNGhnCIEQy
 trJYtDoieZDBF2ZBLD7VYWyMdLFEj/VtbTQEQHXnGalVMyhlXj+kymn
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
Reply-To: zhentao.guo@amlogic.com

From: Zhentao Guo <zhentao.guo@amlogic.com>

Enable the Amlogic V4L2 stateless video decoder driver as a module
in the arm64 defconfig to support stateless video decoder on Amlogic
SoCs. The driver is used by Amlogic S4 platform, such as S805X2
board.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f0947c8176a1..d29e7bf5769f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -919,6 +919,7 @@ CONFIG_USB_VIDEO_CLASS=m
 CONFIG_V4L_PLATFORM_DRIVERS=y
 CONFIG_SDR_PLATFORM_DRIVERS=y
 CONFIG_V4L_MEM2MEM_DRIVERS=y
+CONFIG_VIDEO_AMLOGIC_VDEC=m
 CONFIG_VIDEO_AMPHION_VPU=m
 CONFIG_VIDEO_CADENCE_CSI2RX=m
 CONFIG_VIDEO_WAVE_VPU=m

-- 
2.42.0


