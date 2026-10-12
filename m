Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443D14399F2;
	Mon, 12 Oct 2026 07:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791788789; cv=none; b=NBOSYDAd5WILdhigXhycKWa+P6ETf0/kEGb/fPHb+ZPy/4EoQSICj3hWDWfjOqhJ/l/wxyv0qFXbISAABGKgNos4X4g876D0lpTpGbPqPQz5KzDRxinMNy63xpP8Fp2LYVKyZl7lD3DLUqRJHfQzH/n8o3VXqm2mnMKokveUkNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791788789; c=relaxed/simple;
	bh=WUzJAYQHchFad4GvLC0D7YFZzyv0eyNbhdVP3Of0Nvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZUOGX4oRHVvNGdvw+IBglai4iEHhLpiqZjG/0htEHqX68jg3Uh6GvSbl6jCUuvW7Vs3BjE3xI06/mfxQpfKOXbxJr4e//OOeHPk4rWftgSEFQGTD8CfU5GtOmpT5X9XuQr5fHPDDC1UcySutSc+OEJ2+ITy84UohLMflY7FxJKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gMFxAgNi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gMFxAgNi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 12D03C2BD00;
	Mon, 12 Oct 2026 07:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791788789;
	bh=WUzJAYQHchFad4GvLC0D7YFZzyv0eyNbhdVP3Of0Nvo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gMFxAgNirvcRAgh8nGlQHd8FKsZcnl0zzMNTMEJCmHLj50XIBSjBtgDnCxZn9mjLS
	 o6F3JV9iCb1E4gKT8Kv9cBJT7WF6qgr05iFpOVKC81q5NHkPeXtRjguZDtY+cKDfRt
	 Ah2/t0Y6X49ODi6XBWaY0dVejNO24tG2PtHj1CAbyM5wDY2a5WrYRJKnj1Cs+7vAWH
	 s1pDD6U5oM71scLVclZkox9g3ZhgZnCoaaeJmPdixkbahlzwJuOn3z2TwSCGZ4G4y8
	 i0wz1pgi8eknTn/TPL/KPfhdHgr8s4MqppyXDUC85GVPOBwSwPWLmLjBdYMczVjH7O
	 ubT8ioZtBV6UQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E69F5CA9EC5;
	Mon, 12 Oct 2026 07:06:28 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Mon, 12 Oct 2026 15:06:11 +0800
Subject: [PATCH v11 2/6] firmware: meson: sm: Add video firmware loading
 SMC call
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-b4-s4-vdec-upstream-v11-2-25939f85ada5@amlogic.com>
References: <20261012-b4-s4-vdec-upstream-v11-0-25939f85ada5@amlogic.com>
In-Reply-To: <20261012-b4-s4-vdec-upstream-v11-0-25939f85ada5@amlogic.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791788786; l=711;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=wZ/Fw+jH+tOBVIXbBc8zSjH7Kx36sATJ09qPRAeyKKk=;
 b=bMCo5IfbmPgu14O+mVSwyonPiXITpdvlO+ZXTrT4DKmXSg+JsPm1E2NC+saG7D4PvqvT8g0I1
 sTsLceV/GdfAF29yqaXrRZltslnpbPLiFes8WZHfsYwCjnaAinlo0qE
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
Reply-To: zhentao.guo@amlogic.com

From: Zhentao Guo <zhentao.guo@amlogic.com>

Add SM_LOAD_VIDEO_FW at SMC ID 0xb200000f in the command
table to load video firmware.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 drivers/firmware/meson/meson_sm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index ab9751a59b55..887caa5c625d 100644
--- a/drivers/firmware/meson/meson_sm.c
+++ b/drivers/firmware/meson/meson_sm.c
@@ -48,6 +48,7 @@ static const struct meson_sm_chip gxbb_chip = {
 		CMD(SM_THERMAL_CALIB_READ,	0x82000047),
 		CMD(SM_A1_PWRC_SET,		0x82000093),
 		CMD(SM_A1_PWRC_GET,		0x82000095),
+		CMD(SM_LOAD_VIDEO_FW,		0xb200000f),
 		{ /* sentinel */ },
 	},
 };

-- 
2.42.0


