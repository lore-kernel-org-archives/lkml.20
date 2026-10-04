Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C664A3C0637;
	Sun,  4 Oct 2026 16:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791132458; cv=none; b=C5b6Ju2nohofp0Qo521MO5IgpWTDQSPFUYaqF+tDzqX07vCBMMzgRu0iJXtWKQHwoJRdknZMOy3C22Lsbb8iaa62GQ8/lGabKgN3aSS/CTlG80HPemI5WrrkRxbOtkR2cJNOrkFXgjjIVGKEtNp5MfOFuyEu/LB/CaMboZLMtpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791132458; c=relaxed/simple;
	bh=VGH68o1So4n95en4Q1zcMapfjEJZnTyyYoRL4fIbGRQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Sbm5Nb5nMjkB9GzaLmkAurQhM+z8mEVeoCN+3P3PfNfr/3W1ZjMNqlcSioyso7+OaiW096oTOBKxm7Cd3lQWu4BjppW1vCdoTzBhtNCqye7efosM0oJxKc6MHn68uwCL0vYlIFTKFIKbC5DFqAUCwgQRbtIiLGNDB73D4QQ0pVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wo/jSH2O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wo/jSH2O"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 53280C2BCB9;
	Sun,  4 Oct 2026 16:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791132458;
	bh=VGH68o1So4n95en4Q1zcMapfjEJZnTyyYoRL4fIbGRQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Wo/jSH2OabrZAq/Bt24GAMU+IedyUZQjeAWxE5RIcoMu+r84ILVbqG6X1O36TellH
	 yOj1hCNkrOSim0V/Zjbm0/shZ3ZAh/FnLx5VCY6FhGwOPrI50rzABNV2y7ssSGKAyC
	 RHGEr3mH7nVMCPZzkva/jS7HajQQsful0SrJoG185RkhxL9QFgwIEli9G5afQgFBch
	 JsqS2CAkWB3SBYfpkMKnNdb6B1DyOL7O7NCR+0PiP3vUvJTQZj0pV/2x729xlD/hGp
	 j+VbcRmHkXhB5l3kvtXx1cIi3AQMlSmHfnQX3SWWjT1olvRlmHHtjYhBGctHab3XTG
	 jJ0gCSZkXABeA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 293D0CA5FE6;
	Sun,  4 Oct 2026 16:47:38 +0000 (UTC)
From: nacht20-de via B4 Relay <devnull+nacht.dxdmail.cc@kernel.org>
Subject: [PATCH 0/2] Add Samsung Galaxy Tab S9 Wi-Fi (SM-X710) support
Date: Sun, 04 Oct 2026 18:47:20 +0200
Message-Id: <20261004-gts9wifi-dts-v1-0-1f0d7dd47e4a@dxdmail.cc>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAwMT3fSSYsvyzLRM3ZSSYt0UIxNzo1QLS1MjYxMloJaCotS0zAqwcdG
 xtbUAcToC8F4AAAA=
X-Change-ID: 20261004-gts9wifi-dts-d2472e895234
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nacht20-de <nacht@dxdmail.cc>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791132457; l=1335;
 i=nacht@dxdmail.cc; s=20261004; h=from:subject:message-id;
 bh=VGH68o1So4n95en4Q1zcMapfjEJZnTyyYoRL4fIbGRQ=;
 b=6mQ0qrTNApStm+7dynyIUGjjMJgeMCxnMeNdDF2gArGe43lf82/eiJV6+ATy3WB4PNGQMvK6n
 iDm8x19cSIPDKYegmBBVtv4MA3bmg0RQcgnZ43tlgFNvnFn9PJ5mt4e
X-Developer-Key: i=nacht@dxdmail.cc; a=ed25519;
 pk=Kay3P3pOJq5klUD+0/I8QX8JGOh0CeQXEwRVv7CMm4k=
X-Endpoint-Received: by B4 Relay for nacht@dxdmail.cc/20261004 with
 auth_id=1111
X-Original-From: nacht20-de <nacht@dxdmail.cc>
Reply-To: nacht@dxdmail.cc

Add devicetree support for the Samsung Galaxy Tab S9 Wi-Fi (SM-X710),
an SM8550 tablet. Two patches: the qcom.yaml board entry and the board
DTS describing UFS, microSD, USB 2.0 peripheral via eUSB2 with an NXP
PTN3222 repeater, keys, GPU, video decoder, ADSP and the CS35L45/VA-macro
audio path.

Tested on hardware on top of linux-next next-20261002 (boots to a shell
through U-Boot): storage, USB gadget, framebuffer console, keys including
the book-cover switch, CPU frequency scaling, GPU firmware and render
node, video decoder node, and the ADSP/audio probe chain. The microSD
slot is described but not yet tested, and audio playback/capture was not
exercised. The wireless module needs additional power sequencing and
follows as a separate series.

---
nacht20-de (2):
      dt-bindings: arm: qcom: Add Samsung Galaxy Tab S9 Wi-Fi
      arm64: dts: qcom: sm8550: Add support for Samsung Galaxy Tab S9 Wi-Fi

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/sm8550-samsung-gts9wifi.dts      | 664 +++++++++++++++++++++
 3 files changed, 666 insertions(+)
---
base-commit: f0406245cb9855e6318335a8a223551354291a46
change-id: 20261004-gts9wifi-dts-d2472e895234

Best regards,
-- 
nacht20-de <nacht@dxdmail.cc>


