Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794814801;
	b=lSmR+nJ9BwvqIHZbaZmA/Wucbz+WImUQ9zy/offebuvNdTMWnzYenPwR7lESgp3E+rPt
	 nqx7Yk1UdPXoitFeIKzwKpH2accuRQSqE09uCIARTZYT5MflMgF/mgVJtbnphGlqCdNpH
	 V8FQ6N+NgNknCRKO5CaRmrSa8Q4FNbWvv0W+zsW9p3w6JyiIuuDLQEfM4va6gjT/gQmfx
	 xuHh8Iob5FRXryDzoTt6sHuG7fD7Mrsr4fi7GQeop16X1AKlQFXHO2UCmCF3IAfpmp3p8
	 15B0j9CC6kdAEXVGuugV6Rtkg2gJzi4B6gcHfiE3715+bAGdumq7onoqqYwFAvci+2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814801;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=fRMpjqmQmfQ1fyaV+nLqulpV/jLhiHSkyS81enXX51U=;
	b=rnkmGhsToFQ7zwtgmBV9wSKhcFdDyJEPfaLd6bBlhztkx/G3ojk+QJ1/a2XRVtHKk5oR
	 d9jT4pfnEPueWhlRooFONLTglYtpDafHVnTdPKxMKmNLqqB5ZAR/063PiPcYB2w7Lbp0z
	 /Afi8vziJ+wRwvT58OTO6AbhlwwHnWn256D2T+mBikh2ie1mnu0dOO1CBXRoi9XohWUgC
	 H5A56hOP8dJqsH3VEEfTmiC3NqtI+2X1DgoEfn4cumjlJOge5cnw1qJ1jgxQCnQ2Dx7Id
	 Ni/fJj9qo7F26ce/ZnZ2I//6z7UylK4AoBFHF7HPnx01OyZz4zWPQLZAliWWLWh+iAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZE7ctN4g;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE22606A335;
	Mon, 16 Nov 2026 07:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZE7ctN4g
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794814801;
	b=xkv0SN3sW3DjRGhj6qxQPYwR6Cn7ykWe6oLEGnywcGXcb8Md8n/f28bEV6I+C0YSPX9x
	 rFgeHK0F2Rvo8rrddTaFtO9ONf3KSj+72sofscy3yPlYHzHrNY/EwSfqw5iap8oEnasmX
	 yxLtKkNwln5NC93LXMwgYbdUY3Vn9DUnl5i4Ayc+P9Gwb+iIxUvrLZGcrclZOKNwIZBfg
	 S+7iHsFMSqoCGFsoRxR6rkBcl/vGXU7V7rv9k293hFZfmB83NpxaGyajTut23RQMoIFZQ
	 KwrZFjD2p/duujiVQj/v1oarDM+6l7svSQADslv6ebhlpm4zzw3HZN/drh9B9eOmbzw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794814801;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=fRMpjqmQmfQ1fyaV+nLqulpV/jLhiHSkyS81enXX51U=;
	b=LXOyv60+JRWwKdNHV7C4KrLnXAytccwHXmlSQfxcYR4D67Nixr1jPmt7+2ZvXbPsdJPo
	 bGkh/63ZjPo2ypCR4SxxPS3LPN8RZvqwxYyVX9ShRL5pHlCmQAGPszjX0v8ni1XBejTl+
	 kgd8vuNkiI5JThs7+zilmnLaaHagcs/UK8y4wssfZ8yn8Pxayxb1CsL8G49tpO1pt8UQK
	 rry+6r6T5bY0HAlDnr3Ac0NIxIbkQSECL5SnGvZwO6NaX0jzcQYGIChl+uI4ReQRcOdZx
	 DiXpxyjDLZhimRb7tsmZlLxNPyMKi1B2ng9785xUbuxIqL4pGmquSH1ENgyawMPu9ew==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 763441F000C7;
	Mon, 16 Nov 2026 07:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794814801;
	bh=fRMpjqmQmfQ1fyaV+nLqulpV/jLhiHSkyS81enXX51U=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=ZE7ctN4gvGgN2brDhFrIGpKesWB1reee98P+3gG/SxaO8QHOdx2YN6vqbBqVQd0FI
	 nojNT0KU1Ta6MQ3bUH/PVKu+x6WBamqwhWLErPoGjhEYEdGn2TXibvusXxV+TSFPPx
	 xstO6m1irGMzEEIKJBOhUcyhk+Mnn/ijIzH1zawD6znpl2qJb+6mAKtu+ie3MeB6dB
	 xxU4Ntnewnu0DpmDzpmSVyixHbdqSfpB/Etp2A3v3Fznm7C9+SSRAR54wS0rDc1NWQ
	 AsXIQ8F8IoRqLyhpLZ1n+K0d2aLYKEQ9ZOmqQZr5smv6AyiVL9D6SIWVCxHvTj1pOt
	 mAtUZafWQRcfg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 043B54A37C;
	Mon, 16 Nov 2026 07:40:00 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Subject: [PATCH v2 00/11] Add support for the Qualcomm Molokai (SM8845) and
 the Motorola Signature
Date: Mon, 16 Nov 2026 13:09:58 +0530
Message-Id: <20261116-molokai-soc-v2-0-9dc4dddc4e96@yahoo.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/41Qy27CMBD8FeRzF9lrnMac+A/EwXbWxC3BYCcRC
 OXfcQCpVcWhx1nNa+fGMqVAma0XN5ZoDDnEYwH4sWCuNcc9QWgKZsixEkJU0MVD/DYBcnRQea8
 tauXQS1YUp0Q+XB5u290T58F+ketnixcj0XkoMf2T9pNSQv9m9IeuA2s40UpUpIRcj4L9bvZGs
 z8NzkFjyDb4qWqrmn+ITI0atLO14lpygatZM3/QhtzHdH3MU05z4bdLjAI4SItEGrk30m6upo1
 x6WLHdtM03QE24EZxaAEAAA==
X-Change-ID: 20261116-molokai-soc-6ff9b295c2f3
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794814798; l=4502;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=oZyV2CZnxAKnIRmKaxZ/CaUsKjreVXX4pq0tIOXjOQ8=;
 b=xxaIERpZ7Ay/BC0sUpovGGIl1JLlW84lRuSiqF0uStBIHnDlC3treI61I+kRATdxSaFr4aadv
 pTdjN50vNk9AiXi0gZKt7Qy3c+xCzFQCH70XU+BgUZDfKa1CEk9wUkB
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com

Molokai (SM8845) is a Qualcomm SoC derived from Kaanapali (SM8850). It
has its own TLMM and GPIO to PDC wakeup map, a PDC with one more
interrupt range, no I2C master hub, no fourth QUP wrapper, a different
GPU clock controller and an Adreno 829 instead of the Adreno 840.

This series adds:
- the SoC ID (685, as reported in SMEM) and the socinfo entry
- the PDC compatible, the UBWC config and the protection domains
- the SoC compatible patterns and the board compatible
- the second DSI controller and PHY of Kaanapali, which the Motorola
  Signature uses for its panel
- the Molokai dtsi on top of the Kaanapali one, with its GPU
- a first devicetree for the Motorola Signature: UFS, USB with role
  switching and pmic-glink, the keys and the splash framebuffer

The rest of the phone (display, audio, DSPs, thermal) will follow once
the drivers it needs are reviewed.

It depends on the Molokai TLMM, GPU clock controller and Adreno 829
series, sent at the same time.

Tested on the Motorola Signature, together with the board patches that
will follow: it boots postmarketOS from UFS, with USB networking, the
keys and the battery and USB power supplies working.
dtbs_check is clean for the Motorola Signature and the Kaanapali MTP and
QRD.

I used an LLM (Claude) to help write these patches and their commit
messages. I reviewed all of them and tested the result on the device.

---
Changes in v2:
- vantage: describe the PMICs as reported by SMEM and the vendor
  devicetree: PMK8550 on SID 0 (6 GPIOs, instead of including
  pmk8850.dtsi, whose 8 GPIOs made the GPIO driver read registers that
  do not exist), PM8550 and PM8550VE RPMh regulator compatibles
  (were PMH0101/PMH0110).
- vantage: the LDOs are PMIC5 LDOs without an auto mode, start them in
  high power mode like the vendor devicetree (v1 asked for auto mode,
  which the PMIC530 table encodes as the PMIC5 low power mode).
- vantage: drop the serial0 alias of the disabled uart7.
- vantage: drop alignment from the static reserved-memory nodes.
- vantage: move the memory map comment to the reserved-memory node.
- vantage: sort /delete-node/ lines, the clocks and the label overrides.
- Link to v1: https://patch.msgid.link/20261116-molokai-soc-v1-0-3b2ee920fa3b@yahoo.com

---
Venkat Yadlapati (11):
      dt-bindings: arm: qcom,ids: Add SoC ID for SM8845
      soc: qcom: socinfo: Add SM8845 SoC ID
      dt-bindings: interrupt-controller: qcom,pdc: Document Molokai PDC
      soc: qcom: ubwc: Add config for Molokai
      soc: qcom: pd-mapper: Add support for Molokai
      dt-bindings: arm: qcom-soc: Extend pattern for Molokai
      dt-bindings: arm: qcom: Document Molokai and the Motorola Signature
      arm64: dts: qcom: kaanapali: Add the second DSI controller and PHY
      arm64: dts: qcom: Add Molokai (SM8845) SoC dtsi
      arm64: dts: qcom: molokai: Describe the Adreno 829 GPU
      arm64: dts: qcom: Add Motorola Signature (vantage)

 .../devicetree/bindings/arm/qcom-soc.yaml          |   4 +-
 Documentation/devicetree/bindings/arm/qcom.yaml    |   5 +
 .../bindings/interrupt-controller/qcom,pdc.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  90 ++-
 .../boot/dts/qcom/molokai-motorola-vantage.dts     | 784 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/molokai.dtsi              | 327 +++++++++
 drivers/soc/qcom/qcom_pd_mapper.c                  |   1 +
 drivers/soc/qcom/socinfo.c                         |   1 +
 drivers/soc/qcom/ubwc_config.c                     |   1 +
 include/dt-bindings/arm/qcom,ids.h                 |   1 +
 11 files changed, 1212 insertions(+), 4 deletions(-)
---
base-commit: 6a876df4686788cd39128b62d7fcbff62f39278f
change-id: 20261116-molokai-soc-6ff9b295c2f3
prerequisite-change-id: 20261116-molokai-tlmm-ba0ee416e513:v1
prerequisite-patch-id: 370171903d0f17fe15c388c1656b22e24100153f
prerequisite-patch-id: 99e2c8b1997ebac9bf0463fdde3d83f6712ce487
prerequisite-change-id: 20261116-molokai-gpucc-daebd2758b5d:v1
prerequisite-patch-id: 0e6a86461e4d0ff585e2c950c87b4492ec9d96e8
prerequisite-patch-id: 6e286744dc03d7bd7216695a9c9632b22ad41f05
prerequisite-change-id: 20261116-molokai-a829-9cb850930124:v1
prerequisite-patch-id: c3a4e2985176713b54c997f91fa4975db8cdff3a
prerequisite-patch-id: c8fee006e015f2c35033a51779a4f1eb4655dcd0

Best regards,
--  
Venkat Yadlapati <venkat.yadlapati@yahoo.com>


