Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14764C6EEE;
	Fri, 25 Sep 2026 15:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790350088; cv=none; b=XZpWOqqmSW2+z6fxpUZbzAD7jPc45eExH52lMtrq04+p3unIpZyci+to+L3PPSsDInhkrh7DRX5sT42JB4wvQpcpX6S0ynZSXuMTtGiIy6w1Pb4JdxfmCGVbLwvX7MpklW3+VTLaZmuG9lE/+BAZt/RsqYzAAnvbZbFs3fx/w74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790350088; c=relaxed/simple;
	bh=+Zw5ZXJxCKmRX0O0/izetZHpH2KHryO5H258PyWwvVo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MLSvO/foTT5pCYEbQWHnz+0124FuqdRYl5sGq5riiMGWgNSPcPx4tV6E2NbSB3NofnL0vUnHZbaIrQF8j+7uyoesrZVh/eIcibfHkcRaZaUDIF83T0CJbgqn+KnwkREqWUS2FMzgzLoRbo616aOqSBXNmm/3QoHoiyM4IXkxkts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c1jaFQ6F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c1jaFQ6F"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2F712C2BCB8;
	Fri, 25 Sep 2026 15:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790350088;
	bh=+Zw5ZXJxCKmRX0O0/izetZHpH2KHryO5H258PyWwvVo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=c1jaFQ6FK52YaPaQkEeQibuECXdc8eyNzL7eH0CSQf45v1ZuxaRIFs5F1QTXvglz0
	 nXbuRTaJGnNPW1TOUUzCoxWAJgImtjYemdeQHrT605dXALab6MaXTbEI8832Q17Nso
	 FU8o89gont81VCLNTlbmXfbnsCREw1EX8PiLxcnz+XxGLn7JowUVH6t80d0I7n7aAg
	 x8tcGe18giBxqCtlveNahCNCgMz4BDu/Cvs0+fR3vgFqAHCjSfzPD/Kst1BSuryQug
	 QZaMR0NdV7/QZTp25GxfnPbt6u+Rj5VabOKiRlWWe+2dbna7bubhj3jFnmTv1slp/N
	 44mo/RtEZYkVg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 078C0C98325;
	Fri, 25 Sep 2026 15:28:08 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v5 0/7] Speakers for Pixel 3 / 3 XL
Date: Fri, 25 Sep 2026 17:28:01 +0200
Message-Id: <20260925-pixel3-audio-v5-0-7ffb32c980bf@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33OTW7DIBAF4KtErEsFDGCTVe5RdQFmaEaq4gQ7K
 D/y3YOThRsvunwz+t7MnQ2YCQe23dxZxkID9YcazMeGdXt/+EFOsWamhLLCSuBHuuAvcH+O1PM
 QQwraYSugYZUcM6a6n+u+vl854+lcW8dluKdh7PP1ebLIefpqb4R5by+SCw7B2gTQGpfkji40f
 nY3NtcUtVAnVo8VVWnTKYXRSaPcisIfqvSKQqUmCqutSF3r3TvV/1FdaWuCiRLAe4MLnabpAd8
 HhxNsAQAA
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
 David Heidelberg <david@ixit.cz>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3496; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=+Zw5ZXJxCKmRX0O0/izetZHpH2KHryO5H258PyWwvVo=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqtpMFXwud6it6n+Qn4BBO29UF2cYOkk1UNgcz3
 d+Ooi/4TzGJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaraTBQAKCRBgAj/E00kg
 ckcCD/9+tEo8zlDEpvTDYeqDp0c85jHK4VosePwOSNTsn0SjhF+n1Yf3T2eDxtEI0zFONHoNvGB
 WykvyEsQnDTVacRYl5JhDd7mRS/ANGcxH9UJZZ0md1v85/vlEfKlvFwJkZSViHL2jysfYDYyMsT
 NM3+zOMZ3c+aem0bjLy4n2YdzpBOtyM9tr37Y7argb1tr2MIRDu4SPG/RBFXuMdpm/ZfoVuc7P5
 L+6w/TP0a/3XUqqBmhjesFYNGmu6DXtvjRR6j6UQVDf5pGQyBNHfFOgbe/kSXtqjKdLX5GDtHoQ
 5voByN4NQm286zIx7BwZQ67u+K+ms5FhJh61lL25TmDd0V3sca3rrQR7V43fvP0euDG/EFGgWfs
 EcOBTSuSO9Ffx666TPBIwAE9kasQdExo8pfTEEuNuOrAg64xx1QMyqsUPXB5kCsQ0FzhfraGzPu
 0usBMbySIhUi3rDC3A55mOCd8ZM0s283NILLIevT0VX6XtLUJ4y5XCo6sHUBBGhW97kql2dswdz
 hcxQH7IGoKXMaaw3oyz+tvrPV/FwRtStw7G2RIJa5TCyMjwes7FbadeqZv+R07ycwwd+tFQNUV/
 zmt+o6B+fTIPz6PMjMdp7qQquhkqpPiPT4XF1jL/+57EP6mY9cEwHc6+5CEGmlvwWT03nSboZqH
 MXjBOcmXEjAvVqA==
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
David Heidelberg (7):
      ASoC: qcom: sdm845: Demystify TDM masks a bit
      ASoC: qcom: sdm845: use DSP_A format for TDM codec DAIs
      ASoC: qcom: sdm845: Use per-speaker RX masks for TDM slot assignment
      ASoC: qcom: sdm845: Set codec dai and component sysclk during startup
      ASoC: cs35l36: Implement set_tdm_slot to program RX and TX slots
      arm64: dts: qcom: sdm845-google: Add basic audio support
      arm64: dts: qcom: sdm845-google: Add WCD9340 codec and microphone capture

 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 190 ++++++++++++++++++++-
 sound/soc/codecs/cs35l36.c                         |  44 +++++
 sound/soc/qcom/sdm845.c                            |  49 ++++--
 3 files changed, 271 insertions(+), 12 deletions(-)
---
base-commit: 5f063f13788dabaff119c78e425a0cf6c428e348
change-id: 20260613-pixel3-audio-bdbfb49e8037

Best regards,
--  
David Heidelberg <david@ixit.cz>


