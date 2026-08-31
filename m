Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02C33D565B;
	Mon, 31 Aug 2026 08:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165135; cv=none; b=VpIlYTZR9pzuCMudcZVQWWlNDEMcTxWqxD1lwfkDTzkRitlLyWW0L92Q59vhJ47Vtp6ucl58knJJGK4Q+CGOIaGs0XLmMwBLQ4MTeEpvLJdDMhxAVZ52h7SzliJJDQ3fvScDG0+UvLvTEhVCvwPrHk4bzz4I5NROxunKWcGgxlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165135; c=relaxed/simple;
	bh=WUzJAYQHchFad4GvLC0D7YFZzyv0eyNbhdVP3Of0Nvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RaYYh+4Wb11TtTc9VKCDIjmEbwUVQiKlQErAxsBHhxgdfGqYgx9au/Ud8W9UwrFqGVO5tYGehzfV1XFGWaR/d/fDDB1Z82sb6f3EM+0laL+YKSRK1hTOc+OpyqzQGF1UUDg3JWImrgke7qKIrAifRHpOYKoMCffF8aozbBLMSEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ev5VF4Ed; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ev5VF4Ed"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 252F4C4AF0C;
	Mon, 31 Aug 2026 08:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788165135;
	bh=WUzJAYQHchFad4GvLC0D7YFZzyv0eyNbhdVP3Of0Nvo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ev5VF4EdlnXlpD4Cup9NlSSyLMMg75AtspPdSX0ZA2eiH1UUVuLVNI80Yv7A1Tobg
	 jDtLBqR3adsQOmQLn7V+hS5YUdpGrNnwuTC0+aDYyFbNVXbMwspMndx4arFQyN6tS5
	 IofRDN2Y1gLJszv6pD783f1TT8FCxepgQ7TFdV05lyvgI2beb5o4CoxlkGWE3eMmqQ
	 P+ncMfZc+b4MEe+s6OrTKUOM32ktp0X7ZHTjYv0xPuflOVK1NwqAOc6MsKQsrcR46g
	 5wVmCdEcx4ZafF1PgDW8FIHT32ZaZTLWIttiKPT7QyVQVyIFdnXrhRslKkH2NbmjL6
	 ZBTGtS7S1EHOw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03407C61DE2;
	Mon, 31 Aug 2026 08:32:15 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Mon, 31 Aug 2026 16:32:03 +0800
Subject: [PATCH v8 2/6] firmware: meson: sm: Add video firmware loading SMC
 call
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-b4-s4-vdec-upstream-v8-2-830195b9bd91@amlogic.com>
References: <20260831-b4-s4-vdec-upstream-v8-0-830195b9bd91@amlogic.com>
In-Reply-To: <20260831-b4-s4-vdec-upstream-v8-0-830195b9bd91@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788165132; l=711;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=wZ/Fw+jH+tOBVIXbBc8zSjH7Kx36sATJ09qPRAeyKKk=;
 b=Je027hNjFvJhqQxz3gyGU+pTuGc3gyPbJEWktzD1g2IXpBzZASG4AQb3wVNgx7Po/LM0E15rK
 d9TXM3dsrhPAQEJSbDLij2UKAdmq/J8Q8Yl6J20ogrrw9TZH3piCoZY
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


