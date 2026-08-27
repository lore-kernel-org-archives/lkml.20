Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309FE306775;
	Thu, 27 Aug 2026 07:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787817179; cv=none; b=WjNP3PKsVTwnQhAz0WEt1CJ4xApbvsUx4s4hZ0CwZtxuwtxw0kc08EM9wverWgZPeebxAACX5U8sU4o5cVZt9FajVnThs2G7PG5YtkXj8tospJSwKTI2ncC5YkkEExIEHmQbED4hok4bxemraJluSYSttBqh3a0eXtRZF9zfWIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787817179; c=relaxed/simple;
	bh=/3WjKRc0Ejg9Huc+0Y0xlAX3CWkaDgTen+amlQSOAxY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Mk64Sm2/oDPtUSzKxNDDEJov1bCns3IztXZu8lCAfImKyPkGpI3c494BLmk4YBFKghfNGVVip9Wfgm5hc9QA5ddJhQUH/cykhU80R1ihu2H2m6Wl9yHOiUkehbjce8/oFOtfkETBVxjYqFsdI26xO81wrG3EMx9LPogOD7osXkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YoL0Xpbv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YoL0Xpbv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D0720C19425;
	Thu, 27 Aug 2026 07:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787817178;
	bh=/3WjKRc0Ejg9Huc+0Y0xlAX3CWkaDgTen+amlQSOAxY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=YoL0Xpbv5Zphd10+HueIlLD7h9Evl7v2OAKa3ZcvQ3Nv50tl8Ism/W3ksD9cYvEfb
	 qOHAMfNI6gEIb9LrIUkZn+VaOaZ6rMha4lEWMcO1x6zVvKB5lCDXxa5Xoz0uOS7BhH
	 J0xNkVsy5N9w01F9wGwVGCMX8Qpw3z4r7rZgvqI5tiCl0Xw/qLZLJ9fQ/Txu/asnev
	 n0JMPkdaPVABrasiUyzoPQ6JuO9x01OuZnpouHsxXFY5iVA79eAFtniIdw+bJIGBQ5
	 Ctu8nro0D50yvOyie+4dwnN7vnD75kLUg4rC/o7pDTuIxbq2usKdc8vaPyImI4riyr
	 XixPaltimOUcw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A93CCC5DF9D;
	Thu, 27 Aug 2026 07:52:58 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Subject: [PATCH 0/2] arm64: dts: qcom: sc8280xp-x13s: HBR3 and USB-C DP
 audio
Date: Thu, 27 Aug 2026 09:52:47 +0200
Message-Id: <20260827-x13s-dpaudio-v1-0-da73414c6ab5@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCyNz3QpD42LdlILE0pTMfF1DS3Nji0RTC0uTxGQloJaCotS0zAqwcdG
 xtbUAzsinTV4AAAA=
X-Change-ID: 20260827-x13s-dpaudio-19738a5894ac
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787817176; l=1589;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=/3WjKRc0Ejg9Huc+0Y0xlAX3CWkaDgTen+amlQSOAxY=;
 b=Rwne8J0jgoegeRj3YQlwte+cIJF6kpyD+AteTLCccUak3ytO/EZHzkrBdXd4CeruM+BukYcaW
 8c5bgS9H4/nCM4ES8iEspiEH0DjFNMlPPziQ9gz6xcpWZbVkucRfd3c
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

The X13s already enables both USB-C DisplayPort controllers, but the
board DTS never described the link rates or the audio paths.

Patch 1 lists RBR through HBR3 on the DP0/DP1 outbound endpoints.
Without link-frequencies the msm/dp driver still defaults to HBR2,
which is not enough for some docks and monitors.

Patch 2 adds DP0 and DP1 DAI links on the existing sound card. The
sc8280xp machine driver already handles DISPLAY_PORT_RX_{0,1}, and
the X13s AudioReach topology already has those backends plus the
mixers and routes. The PCM devices were simply never registered.

Dependencies
------------
Depends-on: 20260822-blackrock-audio-3a90de4ac4f9

  [PATCH v2 1/2] arm64: dts: qcom: sc8280xp-microsoft-blackrock: Replace
  old sound nodes, enable DisplayPort audio
  https://lore.kernel.org/all/20260825-blackrock-audio-v2-1-659cc4724d57@oldschoolsolutions.biz/

That series adds the sound-name-prefix properties this card needs so
the two DP codecs do not share widget names. Please apply it first.

Assisted-by: Grok 4.5 (xAI)
Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
Jens Glathe (2):
      arm64: dts: qcom: sc8280xp-x13s: Enable HBR3 on external DPs
      arm64: dts: qcom: sc8280xp-x13s: Add DP0/DP1 audio playback support

 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
---
base-commit: f82a5da2f04960df9fb57489992d03dd5e64ec6f
change-id: 20260827-x13s-dpaudio-19738a5894ac

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>


