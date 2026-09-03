Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67D9396588;
	Thu,  3 Sep 2026 18:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788460003; cv=none; b=Mugiv5vfBGNFEb9R8SzUUTeceO0nh1IQEgRX0i1U6PrYkv1sQI0Zj/g9aOEGlFVXMkqoNxprV01ZCLCtLDw0tO1M1ZPNqUKFiFOTs57IHS2MMEBjZXnY9utoAPUaMbgbWG8ljnCJztEcyPY3170Wj1+YuYnFrQqt+tfPZwYj1mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788460003; c=relaxed/simple;
	bh=swhrbSD3HdK0AP2/e4RRVmalQc9TAXTMchmltY6AmDY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=B4o28eDSbtbcBlfq9P2wyO9kZBaW41LHxneEE0gLUSaItAgLQd3cOm5jI/9E+u2IvGCI2Cq7dd+E+icAfdT7hpn73jNcc+aT3fA4nm91VeKIjfANhcIO/DuFjuSDk4wSxXCqWCnKUUBpFjAWpQPovqTF4CfquRZpBvHBGATcLV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jKXCoBHD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jKXCoBHD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 34B9EC2BCB8;
	Thu,  3 Sep 2026 18:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788460003;
	bh=swhrbSD3HdK0AP2/e4RRVmalQc9TAXTMchmltY6AmDY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=jKXCoBHDJSko6qcgcbrH8NtDrGN9EaH5vDA9cV9WmYECWTt9PdqDfz2lMImVNw0I8
	 VLvjp5rQ5yxQNCMYcR32lX7McYLsKn79JmmHUslCBgKtW45JcjbtuteYIoggWIoPzW
	 oUyvYhVbvIUrk+bmkkXpaEkgmtq3MdGJrbbcqY4FlnlSnd5gFkwLInjFKJmv1oDo7n
	 a0h3c3yeswHckvmogD/OZ4IrOBRPTSJVREXYesLQkRk9a878L/tyBCP6o44//ng2XH
	 yQGujoCn7sAgj6DVs/UsLAEMqEgoExSPbB6aaA2SWlut7rMVayu0KAnTWjr/Sw2FU9
	 puHTioxaaiStQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07FD1C624D7;
	Thu,  3 Sep 2026 18:26:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH RFC v2 0/6] Speakers for Pixel 3 / 3 XL
Date: Thu, 03 Sep 2026 20:26:36 +0200
Message-Id: <20260903-pixel3-audio-v2-0-7c22ed915291@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WNSw6CMBCGr0JmbU1LpYArExMP4NawoDCVSQxgC
 wQlvbsFVi7/57eAQ0vo4BwtYHEiR10bRHyIoGrK9omM6qAh5rHiSkjW04wvycqxpo7pWht9yjH
 jMoUw6S2akK93D7jfrlDspsX3GK6HPVnNhtzQ2c/GncTW3xApT/4Rk2CcSa2UkTJLciMuNNNwr
 L5QeO9/GIJ0KMAAAAA=
X-Change-ID: 20260613-pixel3-audio-bdbfb49e8037
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 David Rhodes <drhodes@opensource.cirrus.com>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
 devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1964; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=swhrbSD3HdK0AP2/e4RRVmalQc9TAXTMchmltY6AmDY=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqmbvhftd5/BDYBefz6ncuVCrJMR4oiHkZymA2Y
 rhYtGPVMhOJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCapm74QAKCRBgAj/E00kg
 csJyD/9g2iBXVdmahUfPlV2YCq+X8+YMg4Kx9IpFkCAj5FPbRy+irB570MhZZ3CY7OZyYkp8KzZ
 9mnkOSzziuzrxGk1QQshe1sCxdnJ4SI+KUQkPaPmwUMIO9pLS1wdV/32+A9jSWmvQwVpiinN10R
 9suoCgEqM6b7VS9yFdPGHtYlfoxfO9YsbyGHgcyOCAPaVexup9C0m+mD9aZ0//PjzAn3qiL1q45
 Uow9oxLCfmgy9NOYoC646l65WsS9uon1EU89FFNYhaDwpjYOxbfcNUoTP5gBjo6Bk7m04Ltbx24
 +qSG4WJxwDGzK8lpvVzJENr87SYs1+vyuoy5a/eCR7U6iBFg5j4hwRxtn1AbhWHRHdevoUVRTu8
 9oCO9Gqvb5pS7SKVqTEzg2BHwEE2xeetR4qRmLLpEIvSqIUN2by+puo4Sd8yYCKQeixZvH3bozZ
 agmvaYIZ7nyGdkbs/Xlo1Ued9ZIQUFK6Sb7EWkAdX8hCoj5hnm563sT62NuGJkVP0xxH45aDdP3
 +kFV1S5kRtCepS0gDWgL/5hWKx1hynbTMxn1f/W81quT15eyKfHTWtl5CCLtMAF2vjC0zkT24Z5
 SZkQv2Qv13i1StKvYCYLtDbH6ypuAXSxkRPGox1sQv6ktdpplQ/2U6dH3KhdqgcRy7wC6FOGhvp
 mXaO/T/wg8x4bIQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

This series address:

0. demistify the hex to BIT() macro and add left/right rx spk
1. most likely wrongly set DSP_B in sdm845.c
   my guess this is because TDM was never used in the mainline with
   sdm845
2. applying correct mask to left/right speaker for the TDM in sdm845.c,
   so both speakers can work simultaneusly
3. setting sysclk at startups, which some codecs need (such as cs35l36)
4. setting proper tdm slot in the cs35l36 driver
5. device-tree wiring for Pixel 3 / 3 XL

Consider my knowledge here limited, thus sending RFC. Some parts we're
heavily assisted by LLM.

David

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v2:
- Device-tree name sorting, with exception keeping mm1-dai-link in it's
  place. (Konrad)
- Make set_tdm_slot cleaner and less leveled. (Konrad)
- Added TDM MIC defines in sdm845.c.
  Should we in capture use speaker mask?
- Renamed model from 'Google Pixel 3' to 'blueline', I would love to
  hear feedback on this one.
- Link to v1: https://lore.kernel.org/r/20260705-pixel3-audio-v1-0-3b66f33859f1@ixit.cz

---
David Heidelberg (6):
      ASoC: qcom: sdm845: Demystify TDM masks a bit
      ASoC: qcom: sdm845: use DSP_A format for TDM codec DAIs
      ASoC: qcom: sdm845: Use per-speaker RX masks for TDM slot assignment
      ASoC: qcom: sdm845: Set codec dai and component sysclk during startup
      ASoC: cs35l36: Implement set_tdm_slot to program RX and TX slots
      arm64: dts: qcom: sdm845-google: Add basic audio support

 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 132 ++++++++++++++++++++-
 sound/soc/codecs/cs35l36.c                         |  44 +++++++
 sound/soc/qcom/sdm845.c                            |  49 ++++++--
 3 files changed, 213 insertions(+), 12 deletions(-)
---
base-commit: 7079a12d7506b07fb53b54a664bfad5fa9b16d70
change-id: 20260613-pixel3-audio-bdbfb49e8037

Best regards,
--  
David Heidelberg <david@ixit.cz>


