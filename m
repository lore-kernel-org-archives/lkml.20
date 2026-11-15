Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794774029;
	b=zd0snCSLVLV4xt6ljpO2QBateP+XIc42Uttlqg6qpCjj63e2WfO0aErGUejVcmocj8X5
	 a1zVnaQc+brrxrRbqDSO2pTkmTmdOTJmHVbcQiKhqkeRTs+nJ0XMVb9ckyqLXVoIzFtOu
	 +rNH3jvtdZRAtQUbq+sbDFr7Yg90fv96HgxFbVOrr02SRV4sdBRuhN+rK3skoJfLCw4oA
	 SWe27tZApaixj7YSz6e8TRtIw9dHxWl7y8sxiFHTv3nM8jCLgB2EKrLr1VNVXpYIXbbfF
	 sUatx4afmadN6X7byTGOoRdonBpNsILRGZeJ+CkzrW4Qm+Ar4GHC3CVgGVH2c9QU2wg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794774029;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=ruXxIOgPU4StBLWWgdLOPSQXt2hA6YQg13ko5zLV/EY=;
	b=AeXzr1d1GUqn9veEexNJzAA377bvYiI4rAAPb3W27ra+CcCTWzhrZ7p+A/CIsUssDG+a
	 6+tnzrFAJocxWFaNSIZdKKfcFv24Ua+E940Mevzn/scvpcXbePguBBJNmVCGzSxaKjJLe
	 rv2bDHKjHqRulxhFYlXGcXVeSkF49FL2OTPmBxivpbmCTG/8ytFxkFzF+tq1TEYySRRjb
	 XI00KEzQN9ZsHHJzXXJFV0wOYuNAYR5UvflR565dVOTJTlQ49wGsau11Qqz86XqgAednC
	 MVpa5AWK24ajmOO3GjtVlai7OqGmbAOboi/7iobdzA/uG/WSk8SaBzDWyVgEn1UM1LA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yc8eeL1P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5ED606BB3F;
	Sun, 15 Nov 2026 20:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yc8eeL1P
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794774029;
	b=G94t3VrxBj2CrjvdOCS5NYkx5wMXfG7uRAWuhc1Vli2vTrrSL5rUMjpHXq78vhUiHw3K
	 ONOYjDr3j8bAnzA3tCOFF+JKKQAVb92l/YW8KGalChvlXmjXV7YsdCHyLdGKb30EGrDTc
	 54dlmznlkely5QzhP7a/TtK2sQfbAmp54cvfbSleiXVRQRfG+1xUbPAMGagRoscmWC0FJ
	 g0ag9x4ocgmPKAddPaa7Z6f593V+O2lI7EnQTtd84Cc+oofzii/3MANy91biiVZXZ2Knu
	 Rm/5O2y5bPoJliB5GzZPAPD/eYbwaOVL4s3JLB9o1pFXvEdYbTbowrnklxfT9xzK8ug==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794774029;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=ruXxIOgPU4StBLWWgdLOPSQXt2hA6YQg13ko5zLV/EY=;
	b=tc8HVyAdv8vFXZ+SAOdoJ/KmzyvJiQkkfBsN6HUe9UE7hr+o3M1AQHBWwhexXZNHSXEk
	 fk366QKDJLg3yHzo7MdeXl/s33KFBzVtohR9psYNp2XYbDNwKGFtIu7XG3CQ35oJ8YU41
	 NIcvdJkCyIAiC2mRr9R/TkMW9blWaUoV42ZKlbBIhCvooV6Md2Z3wccXaRQJLjTaNy8BR
	 sFBPmlYk9816Voxj3EJd2igg2ZcAynx/3CC3oXXtxRmUcRyV7zuvtp9pKHYdV/BA8pfux
	 h/nMfyA8eMr1Tj/+FVBDyU82r5nzXsEtnqZHN2rPcnUVYCV2Cr0pmN+vQ10jasn3Ebw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8DD7F1F02801;
	Sun, 15 Nov 2026 20:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794774029;
	bh=ruXxIOgPU4StBLWWgdLOPSQXt2hA6YQg13ko5zLV/EY=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=Yc8eeL1PZuHOicRKAEGqMNeOa1MJlwWc/AOUVfWHSXX9YSE0k6zOJxlZtqux6a1NX
	 hoH45EGI75RuFVxghgwf3AWl2Dcq74K65n2PB7whK2iAZdyS9ZH8IOxYaX73O0Rpsr
	 f5GdzsXPAPYP1/D0v1795vZfpPJDT1TTAapbImh7YCcnDIAbQJWLfRctKSjGxNVeZz
	 dp/iXABXzEe6KvFtZdQSbQ44zvwMXkhFTvwzmVOPl70m8d6q8z+59kz5HlJS983UsY
	 X3MUmsv/ZRVBFcLcsaN9WyYA41MMiPYwAathJEgot8V1XsmPsYWc0AxMJzAYCLHW0D
	 xJa9SGhm+LZAQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1B00C4A181;
	Sun, 15 Nov 2026 20:20:28 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Subject: [PATCH 0/2] ASoC: qcom: Add the sound card of the Motorola
 Signature
Date: Mon, 16 Nov 2026 01:50:27 +0530
Message-Id: <20261116-vantage-sndcard-v1-0-df69a8759833@yahoo.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqAIBCF4avErBMaCYOuEi1Mx5oWFk5FEN09q
 +X34P0XCCUmgba4INHBwkvMwLIAN9k4kmKfDbrSBhGNOmzcbJ4lemeTVwGx1k6b0Pga8mtNFPj
 8il3/W/ZhJre9GbjvB/YVkhNzAAAA
X-Change-ID: 20261116-vantage-sndcard-f1142c26f7d4
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794774027; l=1069;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=Oe6OeT8RwHKrTHvPAPN/a1CWaI7nMbR56LFpTyYY3Gs=;
 b=an9vVmlYBD2jj71PQbdMkvSlN1WF1nLtTvg+plnabK/0blSY1L2gBLnDwWkvvo+TDcBuRNmZL
 jvWHpds9rT+DcpXDqZN0yVwCofKjzuXdvYAM9FqKzWC2Dye+JMvc2iS
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com

The Motorola Signature has two TFA9865 amplifiers on the senary MI2S
interface. They expect 32-bit I2S slots, which the sc8280xp machine
driver does not support so far. This series documents the sound card
compatible and adds an option for 32-bit MI2S backends together with the
card.

Tested on a Motorola Signature together with the TFA9865 driver: the
speaker and the earpiece play audio.

I used an LLM (Claude) to help write these patches and their commit
messages. I reviewed all of them and tested the result on the device.

---
Venkat Yadlapati (2):
      ASoC: dt-bindings: qcom,sm8250: Add Motorola Signature sound card
      ASoC: qcom: sc8280xp: Add Motorola Signature sound card

 .../devicetree/bindings/sound/qcom,sm8250.yaml       |  1 +
 sound/soc/qcom/sc8280xp.c                            | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)
---
base-commit: 4e019254b80b70f6fb90d17a50f211de1daf7ffe
change-id: 20261116-vantage-sndcard-f1142c26f7d4

Best regards,
--  
Venkat Yadlapati <venkat.yadlapati@yahoo.com>


