Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794774026;
	b=qPORJ04e02vxs3fA0OiHMbhp2ib40MAXE6ox0GMHUa5JZmD5+e8qRs9nkBi2fvEABms3
	 eDO1DPpL8JYd5f2mZDTVbmae5e5xmu7tL0Xn/k8F3Sv4A7LcX4ut7FYsBlWf0Kn7kNfym
	 4ImHmw3ILF0n02W79agLV3uirhhd0pXsUMv3R56/gexdTZ9VNjpe2AXiALwJDNfYYyLVs
	 oiNznLrdOeoup5eN3+HCXYcoqVgu5ksSu6jcdjv8S9wLQ9vzzVT3pZqZka4u2ZALH2f6+
	 rPpCL4Np29Dd/33p3/VqkNZPzm0uIJZUDCCRmdiA7h4uCupEmUIx0CpSNtAzFaI20tA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794774026;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=Gv1Nw7Xuguq/FkN6MM8WBDdy5yDo9eZD6qzm3WKY07I=;
	b=ugAgZyV9OKk4a7bApSVNMWRE1aWv8eLLz9+0TFQgDNHTcqV3yriDziyZplsUgG5PouZN
	 Gx1v7ivdwfGEGIUTmbaWvp1oeivmwV2Z4niAEUpAYNzY7FAMISG5zuTVgRySCEQdG7krT
	 7SbVzAF/OIScX4Chhvap5XAzb+tPVnwtta0MMDHcrZJoLnEaX0x+wu+lrbnyjiQnsAgvu
	 tiuNzRy34bh7eGNb6FYiCs1FKpdvgBMwMyLIgCi4Bditf96hNcr1jGlUwX1yvNMmavvO0
	 agGcqaM3bbZz7eakT3BQ9LObi6dVb6FweilJA1kdBHGRUTeg6zc+VinVKByynqAditw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OMlCczLm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA151606BB09;
	Sun, 15 Nov 2026 20:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OMlCczLm
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794774026;
	b=UYoT58tGCYn7wjX1bJwYTuRjR9usAQPLOYViHYodvKBH6VKjw2CybRKHCv1n3bPYBOyl
	 mF7RwTQNjUPoEvPEJfeOFxs+t7ihPXbs4mCHZLpKDiHS+MdFnxn4hejSXjiwwZnHAoqin
	 MVHGRNdDr68aspU1M+vcYOQmj4vQHI94YVfltNTPzyZulEbM1nam2p/cJ8ZBFXnTYZwUK
	 oWVGIg6g6XGkQ0j5Ga82Eyx+3ANFvjGRR6J7SRq8YOvVzVYS+BmeJ/jMt6tCjUGKaFwjF
	 be17AoVoV7bVk81rEIHjYgawmNs7qNnOVIPDQyY3NUAscbennBcX7vMTryXiK1bAFaQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794774026;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=Gv1Nw7Xuguq/FkN6MM8WBDdy5yDo9eZD6qzm3WKY07I=;
	b=ACWfqofVjssAMJiD3spAMg+et6aTEUBGrFVWT+pKAEktA7ejgBG10Vtr9+e4v6r4p318
	 pWxaqmJxgLz8wuj29nRdrZkB8f8TAPSVNs8TSnO8bQwar2ZgxKYwWDjtX/FvSEW2gz4nP
	 X1ij7DDwQA+oai3CXCli4oyepfbERPmH9dfYLAob711FZU87dJDvBnSelXt8KyW1aejMY
	 5NJu1jpk4xEr7lwC4dfcCt9T0myyZItTGnI7mXj3O2frS9HertQS8HeefcKyp3Ck02V+Q
	 7t+XTNfQZ0YatKZSMjNaxhjm2oJ4IjEryNnu+sFGlxQDZx8jvPDcm9cDTe+jvf5wsXA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E4D991F000D4;
	Sun, 15 Nov 2026 20:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794774026;
	bh=Gv1Nw7Xuguq/FkN6MM8WBDdy5yDo9eZD6qzm3WKY07I=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=OMlCczLmPD9A+DnJ1f86VM3HlHu2hts779UywGU0k77UlRuDfU2w7WWYQzhHKffXw
	 82DVg13VrYGn8ilWkW0PaNVXe7rJVMztU3pt0xcp5FDvNqvOKPwcRjpyydpI8qdUBK
	 jJQh4c/w/yMsTDSbViga3RC1kS5hcCQr8eGhNah8OxbUdaYybrtyZeByEPoCn8oZ4r
	 s5sJ1KLehvZuETdrGWvABntaQr4f9BVHR7oKdAx8f9ad16U8JrdLRn6Gn1yZc1JRRl
	 Vg1aMDUuzAET7u+079dSqwiD4BlVipi6EE9tjZy3T8Wc13v8DfxSs4SxaomMoSXQno
	 VbCSLRzhzizow==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 75CEA4A1A2;
	Sun, 15 Nov 2026 20:20:25 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Subject: [PATCH 0/2] ASoC: Add the NXP TFA9865 amplifier
Date: Mon, 16 Nov 2026 01:50:24 +0530
Message-Id: <20261116-vantage-tfa9865-v1-0-e88f0dccc427@yahoo.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw5AMBCF4VeRWWtiXJrWq4hFMRiLkrZEIt5ds
 fxOcv4LPDkmD3VygaODPa82AtME+tnYiQQP0ZBnuUREKQ5jg4lzGI1WshJKqSrTSLosC4ivzdH
 I51ds2t9+7xbqw5uB+34AGIVm9XMAAAA=
X-Change-ID: 20261116-vantage-tfa9865-8885091e9443
To: Venkat Yadlapati <venkat.yadlapati@yahoo.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794774024; l=1492;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=at0sHXHf6vK/GlbIqTB90pF1KE2GhXvyxvs5+f1KJLM=;
 b=17C+9uWBcOPQX3Jz4KyeWp7/S7WBn5zvwnoY9Q5t0wiWlls6ggaBof1fkVNKe5CIHkpehEuNF
 x9erg3TxVppC602Xh7mGhdSw0ltDWgqgrhNFerJhZwGfcsRxbDxTJaH
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
Venkat Yadlapati (2):
      ASoC: dt-bindings: Add NXP TFA9865 amplifier
      ASoC: codecs: Add NXP TFA9865 amplifier driver

 .../devicetree/bindings/sound/nxp,tfa9865.yaml     |  65 ++++
 MAINTAINERS                                        |   7 +
 sound/soc/codecs/Kconfig                           |  14 +
 sound/soc/codecs/Makefile                          |   2 +
 sound/soc/codecs/tfa9865.c                         | 359 +++++++++++++++++++++
 5 files changed, 447 insertions(+)
---
base-commit: 4e019254b80b70f6fb90d17a50f211de1daf7ffe
change-id: 20261116-vantage-tfa9865-8885091e9443

Best regards,
--  
Venkat Yadlapati <venkat.yadlapati@yahoo.com>


