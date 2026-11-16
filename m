Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794814790;
	b=K9Un2HKIYbUToVoxQ9fjSGuL4slf9ihslN0dRKNjawJhnZYbAv2FI90CK0/MwkWaC3Nz
	 ndwpo1BxiywdFM1Rhbg7a0DQYw1ZOW3TKJ/L3eXL6jIya3GyzBWnTRM50pemG0Apcgl90
	 gt0mEVbf/QEmhHxe2BPe5OdZjoE9h7GAb998/BtRwOpsFr0ghz9bd+s2yWaIRsg9ND1Of
	 O82ww4j8aHDtKq/ANN+E1HHifiCTbHi+9hwDlYTVmRA1bLmYhryuveskZ1iX7FXyJBJaC
	 1PC4GshHAzmfvCohJsVBn0eCHinn7Oc88ZYnxbga5yZXHAESoDKPnBFjIqjGs0+2zAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814790;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=t8vE4jzKsuUvTg1rj0HF3gziE6/o5NHdntkwfcXn7m0=;
	b=vS8i2N4H5q8iEdA5InBWgOOGxHGF24PV1Z9ZN87h5GwNwIPcMkXbrb7BLMxLTwjKGn1+
	 Tog3qTv3h6MwsfoNLyEnL7am+lreGiYSRbYI7+nuB3hW6u+rVCcvLQaHjgzVYo6GbCANh
	 6IVWtHRuoCi4uBaX0TutPqE+7OWYA6/+lJt1d0cnZBHryiRyQUTPbjMFsC5G+Muej4acG
	 HBdahR2OdPCGtgwGIJV6pxVOEhLmGN3XUK0+Rtzynl8ZRrcu3ps9gq1hZM+MDpMKSANbZ
	 +FeErCoo/2AY8CUVMwpBX7S7+9XbMlmgDKzFNvFZhO7xKdsCMo0Pb3Rd5TaHQ3lltVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cRPqShWf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0E9606A329;
	Mon, 16 Nov 2026 07:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cRPqShWf
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794814790;
	b=CPnA2av0FGGCs505j6l8i9VbEQJyepz1Pb6OQeegjeiMuaoUi5mTqttPeAob74Bes7Kw
	 bgyrBaGRPcIRi3YNI+Qziuzl7nzP5AMh1cFKlUToVzzZHgHskCSxNjrimneOY4iPO1FFd
	 KVbO0BPaBCzQ9sEq0kSOfJsIuNMqOkR2DvXSohEXglDXOMlI3T5GF5PVD2Stfk0nB1n/z
	 OHKjn5dBNJXeAZRWk0diJDNIxirE7P0zxyColoC6XkzlgBlql/duWu5mY+baLTk0/q2ji
	 WzRHbJFDrnXskdP05nuRk8Mk1esI4gR7m5fpNHmiCBkh++N4z+uPi6Eq/H6FaFukYsA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794814790;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=t8vE4jzKsuUvTg1rj0HF3gziE6/o5NHdntkwfcXn7m0=;
	b=k5WfRrICWKMFofZFURLIrmJtfx1uU9glGFHEslZxMZOJdbDZoVFspJSmD9IbhwWfonEG
	 9jp3AJaGiJ5slLL4H12ntsOsC9MKkOxsPlEtFf7ucRUjN+OLabCDFsEJSpWcO9Hqjf+90
	 gmcMwY0sl8TMMGrpFIGPZFpj+dBTL7YUu9wRFAhd9/WGzAnSZt3l8uxcuMDedY0TaeUwV
	 ZpVKCvajZ2rDlbXRS9KQRqoCHWI4SuCRFqDyXfBQIlxC6S0/L3M4RjK4DZn7dRXs1b1x0
	 1Op9vd6/q4dj0xgL4Lf0LseHjQ/eJpL13kn4HP0jZGEQFMb23fl4p0YkW3lThbWg5zg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0746F1F000C6;
	Mon, 16 Nov 2026 07:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794814790;
	bh=t8vE4jzKsuUvTg1rj0HF3gziE6/o5NHdntkwfcXn7m0=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=cRPqShWfCeUd7ywI2duu61oaTkmQ/yWmoI91mHlg4BCooIfEwIbogM6k2I2gra6mS
	 HJ9y2fhgnK2GejiDythELDj308HtuiS49MxHOn+H7Gj41aB29cYoWkY1NTN5Js9GLV
	 3KMDxYTegyfKpvuwURwNHe+58X2Xh7Cz8PH8TQEzgEi3WTHht9g6n+UEycvlOXrv/R
	 sOMY+5D3dZL91b1GKmaAIB3EgM9ylRiEeJh+naLtM4G4rgvrcPc7ORzHu/jJBQCMIg
	 RlpvFEAMVoCh4Y3nEWUqcNN4f791B0SZfOzL9f+lxUntwuKm/nrpKtZZVTGMVS3qsn
	 3vc1IwtMarGyQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8CA7D4A37C;
	Mon, 16 Nov 2026 07:39:49 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Subject: [PATCH v2 0/2] ASoC: Add the NXP TFA9865 amplifier
Date: Mon, 16 Nov 2026 13:09:48 +0530
Message-Id: <20261116-vantage-tfa9865-v2-0-a93f976c9479@yahoo.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ7CIBREr9L8tRhAWsGV9zBdIP21mAgNILFpu
 Lu0rl2+ycybFSIGixEuzQoBs43Wuwr80ICZtHsgsUNl4JR3jLGOZO2SrnEatZJdS6SULVUMlRA
 nqKs54Gg/u/HW/zi+7080adNsjcnG5MOyX2a29f7bMyOUoJQjHYwxgp+vi568Pxr/gr6U8gUur
 5ScwAAAAA==
X-Change-ID: 20261116-vantage-tfa9865-8885091e9443
To: Venkat Yadlapati <venkat.yadlapati@yahoo.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794814788; l=2137;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=tnkLifR8VCWfkQcPWoCVb9z6fxtCg2U6s3ff2KleuLE=;
 b=trKZAVj0XI+huVOT7XsovWfy1l6Mcley8jLtxrKo4gmwvzA6yMQI14Ukt+YZctBe23AuEnVTf
 pRYH0FxBcPkB575YYPPBi2nFYxNad00IlzPPsXodWrXwgIPNw+UgaMR
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com

The Motorola Signature has two NXP (now Goodix) TFA9865 mono class-D
speaker amplifiers. This series adds the devicetree binding and a driver.

The chip has no DSP and a different register map than the TFA989x parts
of tfa989x.c. The driver applies the initialization sequence for the
device revision, selects the I2S slot feeding the amplifier and powers
the amplifier and its boost converter up and down. The register settings
come from the NXP tfa98xx driver. Only the B0 revision and the 32-bit I2S
slots configured at reset are supported for now.

Tested on a Motorola Signature: with the matching sound card the speaker
and the earpiece play audio.

I used an LLM (Claude) to help write these patches and their commit
messages. I reviewed all of them and tested the result on the device.

---
Changes in v2:
- Binding: drop the redundant sound-name-prefix entry (comes from
  dai-common.yaml).
- Driver: no longer mute/unmute from the trigger callback, the register
  access sleeps. The amplifier is now enabled from mute_stream and a DAPM
  event on the AMPE widget, only while the path is powered and the stream
  is unmuted, so toggling "Amp Switch" during playback keeps it in sync.
- Driver: reset the registers (I2CR) at the start of the initialization,
  so a rebind without a reset GPIO does not find MANSCONF still set.
- Link to v1: https://patch.msgid.link/20261116-vantage-tfa9865-v1-0-e88f0dccc427@yahoo.com

---
Venkat Yadlapati (2):
      ASoC: dt-bindings: Add NXP TFA9865 amplifier
      ASoC: codecs: Add NXP TFA9865 amplifier driver

 .../devicetree/bindings/sound/nxp,tfa9865.yaml     |  63 ++++
 MAINTAINERS                                        |   7 +
 sound/soc/codecs/Kconfig                           |  14 +
 sound/soc/codecs/Makefile                          |   2 +
 sound/soc/codecs/tfa9865.c                         | 393 +++++++++++++++++++++
 5 files changed, 479 insertions(+)
---
base-commit: 4e019254b80b70f6fb90d17a50f211de1daf7ffe
change-id: 20261116-vantage-tfa9865-8885091e9443

Best regards,
--  
Venkat Yadlapati <venkat.yadlapati@yahoo.com>


