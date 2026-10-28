Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793183932;
	b=3AUqbwbeLvU+B6IHVk4NXrrW1qF2KbkTAsKEkwjFDL1GkvBqF7IaKHb00927ZcHRG58x
	 nv8vMGEgAPhK9FlQEP5nuU83290LncaUOUyeH1OG3et3F44mUKwlDRqzK6AFbMWPyrn6I
	 PeIAviJUDjDT1Ohkjf1lP6tMt24Wcux+2V+04pp6jxpufPhc7c+nT9G8G4F0q41Vcg70k
	 ttwHYPHvfh+zHPGSdsvR4V8jSuKsklctuDW80IEjb14yxMgH+glcuEGHnbIusZMFv3ZUC
	 5E19cYvZGP9+dsAsMyFH282BkC+xxAmD3Xypq/aV0NgCsKvy1i3Xxcr+kifhZvVQzQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793183932;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=5o/pZvqhbTecT88RxUKMYDf2DRxUNlJZBmhZdxERoUA=;
	b=nDDy+mS6QwKa/Ziw3jEanwA6+1CCfuqEagEoWf1tA5Qo66z4vvcezJ2Km+k9lhiavGmI
	 G8/ab4V+BS9rv3qiwSkw4FBo7YpgNOr/g//WsbicmWxbmkLfjE8sBiXO4wKh7Y8IBuXOL
	 qrWbJ/FaAj+3jaX636jKHu5GyoV7F0P0GvEoCto4uIyNErFXo7DSAgLQpLFCXTdkOMheM
	 9yxSeQQJ8Ddzvg2xLoaqfGjP5lmWY4FQwu9EHylQTxw8YxzzuMenbeH6jOMEgsQbqFCVM
	 3UYmNCHrkranCVGssRZrfWErBXGBbuWBeLLUPdeTX4eIgkvqokilOmXag3D/9mVJCUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UZXCsKsa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E042606A31C;
	Wed, 28 Oct 2026 10:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UZXCsKsa
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793183931;
	b=zKzaIYGViITyXea3b72S/1APMs+HvOy/hC8C0wwKk2840p3paK+L6Xpyuj8ITTfV92IG
	 1WWy5ZjxDxXYf3VQ1Yngc1DwDZHBvONf8wEEMCcKQ6qs4Y2N94C/Jcyijyfh8YF5AFZpC
	 7BDxAQmos32ukEbaFR1qGQKOtYp+5T6EZsPeA1c15HUpK2IBPdcs59dBO1kTlaQnrPxNU
	 kJY25RuGXubO5MdXUAYO53J5V1uv2iV/awtrOO4F/g95/StnwzWO8DV8WY+JSl4fBKYX9
	 MXrXfkJbbpxAPTFxHe6cldiAUn4mJxbroZDQrSama1mJ8lNlQu98uM2HLi8pHcXTBYQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793183931;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=5o/pZvqhbTecT88RxUKMYDf2DRxUNlJZBmhZdxERoUA=;
	b=0gBGjJ18fgywABLfD5NZ2LA8xZJEOEbcp55xNBJbSy086oatxRwsIObkuqFDSmUeUQTi
	 8coya796fFkKGmJ2f5n9q6HJqEScUnYWmlH3mzJh/bY3xQRDJcO6DLM61DsqN+RutkDuD
	 SZQrP/pEft2QKPhQsSUj8d3oPKxBbEOM7ZpAigq+X3m7txAFUSerQBvHUC+uL9U0wRjPr
	 l6/HKFBCw45Ra8YT0pWxaD59mjWNww7L98kQ2IcOK13utSm5Dz5ujHsVebjbYLVcVMyYP
	 6ttSFZcKIGFQc4Pd7BbTMGT50xmv75YZXoKi1RERrOqkaWC/tWd9hP//QtH8XOM3ZHA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0CBDD1F031EA;
	Wed, 28 Oct 2026 10:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793183931;
	bh=5o/pZvqhbTecT88RxUKMYDf2DRxUNlJZBmhZdxERoUA=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=UZXCsKsaL/y4ohnuI04PKTlXgXG9IK+Z/AMJG8cPqPjQsX0lWBK5Zy/c5yygirCvb
	 VPd6nI2GrerNRJmkliT7lu97DZCQrnxUl6gEcaSQ8F1A/73xtwug7Nu4YobzrsB4VF
	 4qS9KCJko3LYfbErxhI2EjXPx6EusAyVQ/T8oKSQf6V3dqBCcY1xmtqdtk6zhNo2JA
	 hXSBhT6Op67Egp2y9CaqCjzyV13hRW/67Gv5mQN5azteJz98Jbdkpnj8E1aGJbTX6Y
	 T4C44GtcvGafXaCnqi1BNZ5B/jVcUGSmosomVx1B1x4yUeRWSzg+b3Vsnov+59Wf1f
	 Dj3JgABs0deZg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5CF61453F3;
	Wed, 28 Oct 2026 10:38:50 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Subject: [PATCH v4 0/3] soc: mediatek: pwrap: mt6572 support + log level
 fixes
Date: Wed, 28 Oct 2026 12:37:49 +0200
Message-Id: <20261028-6572-pwrap-v4-0-1780c58d2097@protonmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NTQ6CMBCG4auQrq2hPxRw5T2Mi1KmUqOUtFg1h
 LtbMEaILr9knncG5MEZ8GiXDMhBMN7YNg6+SZBqZHsCbOq4EU2pSHNCschyiru7kx3mqiSZYEr
 XlKEIOgfaPObY4fje/ladQfVTYbpojO+te87fApnuPmG+DAeCU1wXkElWKp2D3nfO9ra9SnPZK
 ntFUz3Qpc9WnkZfgSR1kRJVkOqvZ19f0vV/Fr3guSgrwbmQ6seP4/gCiA/uhDsBAAA=
X-Change-ID: 20260712-6572-pwrap-4c91563cfd23
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>, 
 soc@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793183929; l=1859;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=rJSpPVEVPd0aF8LzZm8VDw4PaJi/3ZvOaWXpH7hlhls=;
 b=2v0NrIKTGEwX1A5XYHkOaJuwQKzzo2fV2ckeeI/DM5UdabuqfcoyLQJlDC0Ln0egcudaPuE8I
 vFTkIO6uwbxDfZGyHXcNxRykDseZXINxapSKlk8azImrEvgRDCa133R
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com

This patch series adds support for the mt6572 pwrap.

All known mt6572 devices use mt6323 PMIC, which is already supported
by the upstream drivers. mt6572 also shares SoC-specific init with
mt2701.

Patch 1 adds dt-bindings compatible.
Patch 2 fixes improper log levels in the driver, improving UX when
debugging.
Patch 3 adds mt6572 support.

Tested on various mt6572 devices without any failures.

Note: this series was reviewed since July, but still wasn't applied.
Pings and resend for MediaTek maintainer were unanswered. Could the SoC
maintainers consider picking this up directly? The series cleanly applies
to v7.3 tag.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
Changes in v4:
- Send to soc@kernel.org, no other changes
- Link to v3: https://patch.msgid.link/20260924-6572-pwrap-v3-0-64769b6446ac@protonmail.com

Changes in v3:
- Pick up Krzysztof's tag
- No other changes, resend
- Link to v2: https://patch.msgid.link/20260715-6572-pwrap-v2-0-bea1d801c81b@protonmail.com

Changes in v2:
- Fix typo in patch 2 commit message ('Errors paths' -> 'Error paths')
- Drop unused registers in pwrap driver and use existing mt2701 array
- Also clarify mt6320 register usage
- Link to v1: https://patch.msgid.link/20260714-6572-pwrap-v1-0-d8e5a39cf7ef@protonmail.com

---
Roman Vivchar (3):
      dt-bindings: soc: mediatek: pwrap: add mt6572
      soc: mediatek: pwrap: use correct log level
      soc: mediatek: pwrap: add mt6572 support

 .../bindings/soc/mediatek/mediatek,pwrap.yaml      |  1 +
 drivers/soc/mediatek/mtk-pmic-wrap.c               | 71 +++++++++++++---------
 2 files changed, 44 insertions(+), 28 deletions(-)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260712-6572-pwrap-4c91563cfd23

Best regards,
--  
Roman Vivchar <rva333@protonmail.com>


