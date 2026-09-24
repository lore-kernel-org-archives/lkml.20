Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C1D43B6D3;
	Thu, 24 Sep 2026 07:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790236523; cv=none; b=ahbvzKSZBPzNp9h7j6nbKS6XhDzateu+IC7EQKfRqCUMIbbvDqy/B/KUyLnvNoNjxpDao0Ubzk9NJGNrOepzzLJI9dWbDUFHO662tlPZfK5dvO8xjnCTosTBKP2QPMoO1fQCcAG0jzxnkQsoZH8zvpBbiJk6jfSB8Y4Q6tuVEDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790236523; c=relaxed/simple;
	bh=PynJ5xo9Sdp/Ik69/y60OZIBerQ/6DJ4h2lEOta72bc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gjljnyLWza/lmyrWiIwn6jNAUDJn29yWMj6A2J0ihHD8EeG2u+ly+D3ZZ708m9PbwXoC2t93w8lncqUib2maNvltuclwbzhyAvwWXIJHrcKlBXImjtjrzh5qcnaSJdRAINq8e9txxLbHRUcKdVkHDzFLFriNfR5rkKoG86wtnLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aBl/gWXZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aBl/gWXZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF6CAC2BCF7;
	Thu, 24 Sep 2026 07:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790236523;
	bh=PynJ5xo9Sdp/Ik69/y60OZIBerQ/6DJ4h2lEOta72bc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aBl/gWXZTqPIbfHkMOtWNJly+xJ6CniObs+aSzEfDoGnJ4MezahBCI6a+f/eelKPf
	 NeKpoH98BeH/sNsOmG9st6P/LmCv5JTDyV4j1teVJO4zE+QbFksR+dLuewSLAp0k1p
	 WAXQmROiivnonVthRWCZk0A1NDnDriTcJwCAjuv1YZdg0JWLTPkeYC0uKOFlhzBTIf
	 Xpi6kf8eJDKnd/dre4ImJRdBb1QywIg0SvRx3/57IWE+jXwGB+XSsKqmT8gEUDWDlH
	 iYvO9qcnMWRzgyfGcSC/lde/M0STR+sGBL3SJcD1YxTUh5iepJK0mHerdXcDEmD+mM
	 EkZk6ModLrWsg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD8A8C98314;
	Thu, 24 Sep 2026 07:55:22 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Thu, 24 Sep 2026 15:55:08 +0800
Subject: [PATCH v10 1/6] firmware: meson: sm: video firmware loading via
 secure monitor
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-b4-s4-vdec-upstream-v10-1-1289303a58a4@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790236515; l=670;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=ioNPQiZsvUfM7WHdEfF4xb07l7H3o3hVIdC2XZUtO1g=;
 b=9NQ1zzcILOSplKICbluDdtW+TusIULvWd7UIdXPV30TeRhoJP9QEqvm/ZEcNRYmpRTGIw2wK0
 JcUW8f3wg35DiPun5uQ65Pgm+8RifxpEqYjVqcM4RWUXPcsX6jsqNOj
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
Reply-To: zhentao.guo@amlogic.com

From: Zhentao Guo <zhentao.guo@amlogic.com>

Add SM_LOAD_VIDEO_FW to the secure monitor command enum
to allow decoder drivers to load firmware through the meson_sm
interface.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 include/linux/firmware/meson/meson_sm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firmware/meson/meson_sm.h
index 3ebc2bd9a976..3b90b49d0552 100644
--- a/include/linux/firmware/meson/meson_sm.h
+++ b/include/linux/firmware/meson/meson_sm.h
@@ -15,6 +15,7 @@ enum {
 	SM_THERMAL_CALIB_READ,
 	SM_A1_PWRC_SET,
 	SM_A1_PWRC_GET,
+	SM_LOAD_VIDEO_FW,
 };
 
 struct meson_sm_firmware;

-- 
2.42.0


