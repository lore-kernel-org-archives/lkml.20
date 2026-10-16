Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F904CF471;
	Fri, 16 Oct 2026 21:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792187548; cv=none; b=hf/M0JKW6FRpKv6Mw1N9MT69c/WTDUv37Rp2Lw6efwCp3f8lM1NT/q1i7Q22WnCInBjR9Wysl7AcxbJb1dHzFxzMjv8DfcjqP40bzqhNpmzNfzBoAicQ8Yo+ouaDUXzCmdREuLc+8tOabOrzcp8I7r7S5tlts5vWaud0XiH8gjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792187548; c=relaxed/simple;
	bh=N5mNLmP6Opqmd41Az0BIGbMTx/iM95OTgnym2i3XUVo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hZrvVOxmHev/2gciiQqELfhPlCrPI6I1HTdSeaQLpHKK1UG6xoa1wJEGmnZR7ld/CGge0z9+YJNKPIDHSfLTYQThYi/pYAlM/omzUOtCUBdpd4Kt1Yz2BdZSKt0nNmpmQnp2TripAJ7PjXN7jU+uLlIvH6Bw5LX2/dmKBm9eltM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BQWb4lH9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BQWb4lH9"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8DBF2C2BCF4;
	Fri, 16 Oct 2026 21:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792187547;
	bh=N5mNLmP6Opqmd41Az0BIGbMTx/iM95OTgnym2i3XUVo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=BQWb4lH9iox3XqJ3qPjO5NEFCPYz/t4VYw4TsHXdURi1w6bDccIPC454Ti+UgwUg8
	 T/lU/2L90Fjvf4KqE3kpQapebHwaDYJhxHwfPW79ycudG6HeD0m6CnyotYjqlVL7eE
	 2nnnnk9yHmm+RHJRz+ahRI3dgUU7T6+cppwpzFAWPLTB2bnXltTvG6gMZNYGkDIdP5
	 GELPJ2BWwgZFQj+6dmpvDMyfRFAiOcpMqHcns8t/uhDpR/y6t439lvrunIy9YiFj0v
	 k3jC7HYLsgSbuWCxedAyn92PKK4HRQ+dImF70zyhcZWC0V5W//YAhFwY1URxH91xO4
	 Oa0Rdh+qStAvg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73882CCF2C4;
	Fri, 16 Oct 2026 21:52:27 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v6 0/2] Speakers for Pixel 3 / 3 XL
Date: Fri, 16 Oct 2026 23:52:19 +0200
Message-Id: <20261016-pixel3-audio-v6-0-11c88448b3be@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33PTW7DIBAF4KtErEMFDGDoqveouuBnSJCiOMUOS
 hv57sXNwrEXWb5B32PmTgYsGQfyvruTgjUPuT+3oPc7Eo7ufECaY8tEMKGZ5kAv+YYnoO4ac09
 99MlLi4ZBRxq5FEztfa77/Hrkgt/X1jouw2Mexr78/H9Z+Tx9tHdMrdsrp4yC1zoBGGUT/8i3P
 L6FXzLXVLFQyzaLVdFoF4TAaLkSdkPhiQq5odCoikxLzVIwzq6pfEVlo0Z5FTmAcwrXVD3T7a1
 qXjglDyJYw3xa6DRNf8kI3SanAQAA
X-Change-ID: 20260613-pixel3-audio-bdbfb49e8037
To: Srinivas Kandagatla <srini@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 David Rhodes <drhodes@opensource.cirrus.com>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
 devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3284; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=N5mNLmP6Opqmd41Az0BIGbMTx/iM95OTgnym2i3XUVo=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBq0pyZD6QjgG+z0w2qa5OiqbRXCWyc4YCXu1lIn
 GohGcXuB9WJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCatKcmQAKCRBgAj/E00kg
 cqRBEACG5Cl7it/jI7Y8FgWb2hWTWn3dqbXO4dp0rjK3Cd/loY+2RB5RuI0cioNHcQGcWcQc719
 D6ypL0gWaIAojLklzKaqzQyx6NQiD9ILB80japw33kvcqEFlq6eL9XRRF9Qb0xDeYoImucWSGGC
 dvg4Vh23nnh5JUU02avRp2gF3s3T9yvFBYBBecT2yUYQVLUaVNkGMEXwhZ7x0uOMb8clE60G9ml
 hisH+aFumVE7M6nT4gmiT5Dp4dUyKIE7yDmB/Xi3aTLzywTvFGWEC9MSJcEos/sly1TgBkOXmTL
 4UUPIC+WXtuvLxa8ylvBpmfqDYP/xtytuCodK/z1nxEkx9VUgL/D3IRyRMjOORa/dder4IKiXw3
 AvEhuvqTeEfFrpGyTBY7oOMZKrlvSj4/hJ1e1Qng+BawHo43zz4Gl4spFBmSVbHy1239gZmR8Ef
 1RbNEHTUKciBS/33X6zR6j3vs2rk9bpJmHc7J+FEM5SIt99nyvSvkpzQSvUa/T2M0DK77e+VdDQ
 vF6I3GQZ0yI3G03sQ4TJipXLW6trImrShlHSzntUvQou2t0wnIQiF7z9PBhjGiTj5YK/VTDlWDk
 JJR2u5/7501uc9b0dnWSLEpXoRR5cj9fcmysE5UCOWlQ7oLvVjTYlQZrO4Vx1iTkqoECjVn2UDT
 VU1nL40tYWFOeLQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

This series address:

--- merged
0. demistify the hex to BIT() macro and add left/right rx spk
1. most likely wrongly set DSP_B in sdm845.c
   my guess this is because TDM was never used in the mainline with
   sdm845
2. applying correct mask to left/right speaker for the TDM in sdm845.c,
   so both speakers can work simultaneusly
3. setting sysclk at startups, which some codecs need (such as cs35l36)
4. setting proper tdm slot in the cs35l36 driver
--- remains:
5. device-tree wiring for Pixel 3 / 3 XL speakers
6. same for microphone.

As per previous discussion not seding patch removing the "Input Mux"
which now interferes with TDM callback. If wanted, I can send it as a
follow-up.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v6:
- Everything expect device-tree changes got merged. Rebased on top of
  latest next-20261016.
- Link to v5: https://patch.msgid.link/20260925-pixel3-audio-v5-0-7ffb32c980bf@ixit.cz

Changes in v5:
- Dropped
  `slimbus: qcom-ngd-ctrl: Remove data channels on stream disable`
  in favor of now merged
  `slimbus: qcom-ngd-ctrl: Implement disable_stream callback`
- Applied R-bs.
- Small clarifications in the commit messages and comments blocks.
- Link to v4: https://patch.msgid.link/20260924-pixel3-audio-v4-0-85b5d133aa5e@ixit.cz

Changes in v4:
- Rebase on top of d4d1619ebd55 ("ASoC: codecs: cs35l*: use .auto_selectable_formats") (Mark)
- Link to v3: https://patch.msgid.link/20260924-pixel3-audio-v3-0-5d06460fc8a9@ixit.cz

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

To: Srinivas Kandagatla <srini@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: David Rhodes <david.rhodes@cirrus.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: patches@opensource.cirrus.com
Cc: devicetree@vger.kernel.org

---
David Heidelberg (2):
      arm64: dts: qcom: sdm845-google: Add basic audio support
      arm64: dts: qcom: sdm845-google: Add WCD9340 codec and microphone capture

 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 190 ++++++++++++++++++++-
 1 file changed, 188 insertions(+), 2 deletions(-)
---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20260613-pixel3-audio-bdbfb49e8037

Best regards,
--  
David Heidelberg <david@ixit.cz>


