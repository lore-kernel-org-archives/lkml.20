Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1F343DEA3;
	Thu, 24 Sep 2026 07:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790236523; cv=none; b=iOX1liJKso9oRMUwN6OfT7I+ZxkNifF8WQGdFynY7utA2cS2WXPOSxLWM9NW0/qfvPIouNCCxhjut88Kw+KVxHw7ZqkAFxyeJwYW9z3rO3KZ4cWvnOjOg9PhRTbYzrJAlxALrjMceja8jOjOYiTLG1vusfQF4/KI/GQzfc99JCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790236523; c=relaxed/simple;
	bh=WUzJAYQHchFad4GvLC0D7YFZzyv0eyNbhdVP3Of0Nvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XCercooTje2XbKUQ35lHZ4mEOQPKlfrlQ0quxAXeglO1uYqFwgaanuqd4qfLptWWCEvhzaUV/qZY+vMHPHUbClLtE3AZfeVKGbY6rYQ+uZd+CXPTWzsBCwNLxhhzhasmzc0ApYimNtZRZm2K20h4ldkIVztC3A6UlE/QO/68a+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bm3F16Po; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bm3F16Po"
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED4E5C2BCFA;
	Thu, 24 Sep 2026 07:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790236523;
	bh=WUzJAYQHchFad4GvLC0D7YFZzyv0eyNbhdVP3Of0Nvo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bm3F16PoDRNEYRV2YzJsdOhgCmNvWVNNgL+CPGZDJP90Dsb0EKWFMJokP3YJcIdqq
	 pHrCrfsfCU68duxrwatiZ+ydB6oBdB4jWJ3JDRE3b2EyBnud4RqX+Ln4zH9405NeGE
	 4cLo6uUppGc4Bn6t7z/nzeIgXx7Y8xDF7NYsJHx8LW4rsNYR4rNd4Q2AUPwEz7dp4D
	 G/PdH4fYAwjPxoGG6nJNy+Tn/SEaxsaaWlbifkgpByZxXTSKPrbnoGbMqIPqxta3h5
	 N3JczI49qY4j4csb1zTnzwo2AvwRZu2VwXf2Ey9/XOBZOXlTggFwPXBVkX7XA/vibz
	 zUe0PRsAPE1Jg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC4EDC98317;
	Thu, 24 Sep 2026 07:55:22 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Thu, 24 Sep 2026 15:55:09 +0800
Subject: [PATCH v10 2/6] firmware: meson: sm: Add video firmware loading
 SMC call
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-b4-s4-vdec-upstream-v10-2-1289303a58a4@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790236515; l=711;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=wZ/Fw+jH+tOBVIXbBc8zSjH7Kx36sATJ09qPRAeyKKk=;
 b=Tbz+uK0VYas3dUMYvy3qBCJhbR2BH18XolHwGco5EnlwVvMkzc9vIC5pdcYmCWSqMmMnOIaSn
 fUo/GQfWPMkAIExPvZR3bNvoztCjpFcs3UVHGvbqKenx2tJd9SbfHvN
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


