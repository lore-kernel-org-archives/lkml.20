Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFB330274D;
	Thu, 24 Sep 2026 12:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790254011; cv=none; b=ewLTg0yPp9fhSwFOsHzLlV9PrPb4x9A50KmNV1k0Bp/WiumCLWLjdgks8PbKlEB0EOJ3QLm0PJnqOMt08X+m/Xb7/SbkthOMOJ3K45IoJfRnLQ7wED+qvx5+wMZ86dd+ozw8c1B8eSvwAykn80OyJcLOlgr4igsAPmhEJKKGhFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790254011; c=relaxed/simple;
	bh=WCww17Nbz5msM318Y+YiigiK/lae/kU3t0OrPKXBYxA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eMVZ7ui6WanhF0yXJ9BHgtFgIGXoqGbVUC9p7JSh81AGXUThZZp/0jsZxk406laS/AW7dqVUE+HUwwWsfEM4E7BltIiaERQDeKlwxXriBQT1SsJHKohU85xRIP4fNh3P0nyF3HFiL2cF3ZRTdNBZYziFH/e0ShAQaj5jfMFEYLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h9QJ88im; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h9QJ88im"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 926F2C2BCB3;
	Thu, 24 Sep 2026 12:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790254010;
	bh=WCww17Nbz5msM318Y+YiigiK/lae/kU3t0OrPKXBYxA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=h9QJ88imIePzlbdnTRmvPzkjo9bUAFbPcSghL5bzdZQMo8R3uqAImn0SiT58wu2gW
	 14OfISweK7f8Orze2ZUNim2MS3TfC0h8UyMhcmPdux5NaN5eGfhECisoM3JuFD1EGA
	 EphoByz3NUJEZokoas48ukt/XBu7nqqxvQmSjiZkSKhO4vHDFzrx1Y9BE6BhOjlp9m
	 umYGIwfE3z+wCOlXyDuRGxzwytwd8+gXigI6rmAVAORyJKhMNSOWu7AGV/AfGItUPY
	 QkPDt8qsmImHnnIN9/LcilOjrNknOmGne3vhnRVLNEBcrxzoQyQ1srxjxTE6Nb3Kv3
	 tn7dX3v2j8SLA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A97FC9830E;
	Thu, 24 Sep 2026 12:46:50 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v3 0/8] Speakers for Pixel 3 / 3 XL
Date: Thu, 24 Sep 2026 14:46:44 +0200
Message-Id: <20260924-pixel3-audio-v3-0-5d06460fc8a9@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12Oyw6CMBBFf8V0bU0fUqgr/8O4oHQqkxjAFhqU8
 O8WWaAu752cc2ciATxCIKfdRDxEDNg2Kcj9jlR12dyAok2ZCCYUU1zSDke4S1oOFltqrHHmqKF
 gMicJ6Ty4dF90l+uaPTyGZO23ssbQt/75mYx8aVd7zrJfe+SUUWmUclIWmXb8jCP2h+pFFk0UG
 6rZ32NRJDSvhACreSb0FzrP8xveBPUs9gAAAA==
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
 David Heidelberg <david@ixit.cz>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2368; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=WCww17Nbz5msM318Y+YiigiK/lae/kU3t0OrPKXBYxA=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqtRu33V70vGPgoK9kRrmF2zP8lixWUhtWMOIjj
 QJMDZckuYqJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCarUbtwAKCRBgAj/E00kg
 csAxEAC2My1jTW1COPi529iCest+b+a27uNQ3d8MeloVj0nrXvwqgpr3nAGkGivckem3Mdet8Sa
 r77/Vy4C77CGHjL/LJp/t2rDg3J0rKk1bltL8M7Grrmbng6NuQadd1MxVhwKo+/7gJH+UQOz+v+
 LXzKf0Aod8+BlwK+ZTWKm/jYyoKz75yLJUOvgeYUcCAfz/WsqX30THqSr+uFc/kzP/H1igtGto6
 Caeq4tj0Wm7v9y6TWEPpfdjvI6o+NCWwHl29K5fDP/LwvJcYPjOWJ8w/306C/EJYnzGHihTwOmi
 op/7tUxtHEHXTfgKeYS2wny2elDUyapRfXvHrMrqv/FLDLVb/yHF9rHYygtevti86TM2B1tKhD6
 okd13WI5/WwJR7pE0NCvDIHaXq9XMvQ7h3jhiDa6kOOx1CxVm9RXL6NmKIauN1fJ+vh0QFgvyCD
 AIvUpd+sxxY4LO9Rdc9hbhzdZmWlrOmGTK+ryoTpqJhBo/wSrGAXRBPQEZwfZM4NXZcQtI3cjoz
 LeF+a96vKlumc3Ol6SmhRo8d8qg+T9u35M8F7kRmYfkxxcnfXXp3gDtNni+zfgOq5VjldjpVKtO
 Nk4W2nD3EVJQ8TBryNGGAjuPxuKvEVZjBTRzAyWVN24EG1BFbe6kmhLtnTimGBrQ6ejL8gp9fg1
 t/Gn1A0qp4i+svQ==
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

As per previous discussion not seding patch removing the "Input Mux"
which now interferes with TDM callback. If wanted, I can send it as a
follow-up.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v3:
- De-RFC, applied Reviewed-by tag.
- Link to v2: https://patch.msgid.link/20260903-pixel3-audio-v2-0-7c22ed915291@ixit.cz

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
David Heidelberg (8):
      ASoC: qcom: sdm845: Demystify TDM masks a bit
      ASoC: qcom: sdm845: use DSP_A format for TDM codec DAIs
      ASoC: qcom: sdm845: Use per-speaker RX masks for TDM slot assignment
      ASoC: qcom: sdm845: Set codec dai and component sysclk during startup
      ASoC: cs35l36: Implement set_tdm_slot to program RX and TX slots
      arm64: dts: qcom: sdm845-google: Add basic audio support
      slimbus: qcom-ngd-ctrl: Remove data channels on stream disable
      arm64: dts: qcom: sdm845-google: Add WCD9340 codec and microphone capture

 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 195 ++++++++++++++++++++-
 drivers/slimbus/qcom-ngd-ctrl.c                    |  81 +++++++++
 sound/soc/codecs/cs35l36.c                         |  44 +++++
 sound/soc/qcom/sdm845.c                            |  49 ++++--
 4 files changed, 357 insertions(+), 12 deletions(-)
---
base-commit: 7079a12d7506b07fb53b54a664bfad5fa9b16d70
change-id: 20260613-pixel3-audio-bdbfb49e8037

Best regards,
--  
David Heidelberg <david@ixit.cz>


