Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794774012;
	b=WRn1ja1LdHdpSq9m7zs5piZetjdOAPSWR9TEbAE3mD48bbGkZqHq0OI41+EL8/A9N/MX
	 DYZs8HNx9yhOZdEh425LhzVj+mcB2TMuQ+GFxHXfhHvkjLnNzhDS+GDxL1sFlxHaJbzBH
	 w9EX8S3IU5BhGPMycPtW3eyS2AKFZquj9O4Rq2+rWH0WD6nG4BLTrwa6eKFtx7a6cV+nd
	 SsU74K8tbYLFng/quTZFoDtlTmD3r8L0DrP2hhMYwLN24DqtyMLFDkBi27Mv6BiC3jD17
	 wbhvEARdW6t/cIhH4v5nJto4pfIcHh63Yq1DAQG9OWhTQMfae8Q6Ng3ytnESiunvS7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794774012;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=yWT6BM5eSkk71PrUgFvsY8QutzZ3OJR0O9z5JsE384A=;
	b=KDrW+oVVOTvKmd9/ySDPENHP5wvk4IKy/kK9vqgXWZ0/JaCSSRRvCbC/y5aJwos8U4Sj
	 G/JcaDjpVCJnJ+qgOv3MteplvySN6beYKicJ0g0jsZYSq6Q69vP83ROJvR8e1BAQs3EST
	 zmUdHv+sLtdhnSNWBho2sPC9ajKqHTPb8cdQcn6mt6+mlydFg6xk/69ssutSaCxbfNJch
	 /hg3nr5AydDzHByQIp+kFJkHgtY+sVA0ta03uVmbN+2VA7fEgnZx3xlWUHwqrSbdjgKyj
	 jlFEWt/mOWRwC2BoR+cY7LE8fMwvNs8H/8tC/42txtbAbCbv7um7uwbfC8bpdYuE2Dw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JLfwxR8S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293CD606A882;
	Sun, 15 Nov 2026 20:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JLfwxR8S
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794774011;
	b=Z/oSFQ7WegbSIEsn4CTRqKwB4Kd/0wYzIIp2qDf5+H6zv+sJqjyeQuuJ/fDC9A3SfDvU
	 ZLiYBLyfxrUzTdpKPYW63+jG6McEyqKwQ+SKYpiupbvSGDq5EAubrR6hq9gHUiXupNUkj
	 H6W6LMa07IhemnazWlFTH7iSiwA1zoFSzjw4ZqJ5g4qr+bBp4f4YHtx1xJ1RcTZz5pvJL
	 TEqPSYpKj2ZdhAeCjP9GqWQdJ38b57lcaNOuSenabdjrn5LWaOK9zu1InmEiufkm1GLVv
	 rtWl/oqO4Es/HO2vgOIg/Fqi7gB9sCHHIPA6E7ltCebUtMlgZh4ZGkQFuiIKNeIsTDg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794774011;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=yWT6BM5eSkk71PrUgFvsY8QutzZ3OJR0O9z5JsE384A=;
	b=bSna4yimeJp9xyKf5RZX3oHe9P4fZUr3R7KDWKumXZw/wOjqk9Ur9ew7MdtmIJNa4FZ4
	 VuFtrb65Oo5i0+wcJd72YUxisNgMwQC2fa6d/TzTDKWygJSKAplzw+vGJ/AMWrb28zIY4
	 MRaeK2EHs9VCj1UtqI9s4p9F+3x6pxdjw+VccH+mldeDXjKn6C7UPWDRxZUwVDljAZPJk
	 LS55DfC+mGPETLYFWHY8rjJdIRhBKtkxUUvR46R81sr6lleEMUR3Rj04Q7GyZ7ndYazET
	 iN59N4/ldvH2PI0G0tEiVQQGGwX/KiH20WDSW7UwZPJnnQ/ZSDgHXGdH1EzlHKbWqkg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 99CA41F000C4;
	Sun, 15 Nov 2026 20:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794774011;
	bh=yWT6BM5eSkk71PrUgFvsY8QutzZ3OJR0O9z5JsE384A=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=JLfwxR8S1bJyrTskwz7EctXraQh/3Aa8OjuQqMjbt6AAR8ZvXb2pst62tuZRv0QDR
	 8JkYaqFIcW5RT5RPPPI8KXI//xl6p4pZ6fTsLkS3I2V55JCOroLoxlWLE0gkx+mDOT
	 o00aiklAeT5R4tNVRvehbKkJFoOHDXbR0jwMgZbaYRLImescUFGIavGNqKRN7fv4Zl
	 F0B5k+wbTTOgJ0F/WBT7fAKy554a9YNOofiFy2PUk82n3urGfihmmGrKKtGpuaiE3Y
	 uJy072Nynx86MnxkIGLzj6ShuT7KuJ4h70Ra7GJYLDQVNqt1Sui5Z9pZpAGjU/z3hz
	 nsdlACFwInacA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2A2024A1A7;
	Sun, 15 Nov 2026 20:20:10 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Subject: [PATCH 00/11] Add support for the Qualcomm Molokai (SM8845) and
 the Motorola Signature
Date: Mon, 16 Nov 2026 01:50:08 +0530
Message-Id: <20261116-molokai-soc-v1-0-3b2ee920fa3b@yahoo.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OQQ6CMBREr0K6tgm/0Eq5imHRlg9WgWILxIRwd
 0FMNNGFy0nmzZuZBPQWA8mjmXicbLCuWwMcImLOqquR2nLNhMVMAICgrWvcVVkanKGiqqRmkht
 WJWQleo+VvT/XTsWew6gvaIZt4tXweBtXzbDX3pY8+nIMTdtSrWLEFARySPIJyOezH0zdj8bQU
 qEu2ZFnmpd/QCpjkkqjMx7LJAaWbkyxLA9wnw1cHwEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794774008; l=3622;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=U1UpaCE7pWdkNuqQhejSk0JNKOHcG705Y2pQ/P+ldVg=;
 b=jt+18nSRrxU3k9qmIvR/NwxUMxVnGQ6U/2V2xrWgyYUXeZRXekwDpiZvimxXIgi2VEPOTk/Su
 AZcC8mFFKUxB+yQOQ8V4vZpSdqILOpvgDR0yaMfFoi3pr1X+9x0IC63
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
 .../boot/dts/qcom/molokai-motorola-vantage.dts     | 737 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/molokai.dtsi              | 327 +++++++++
 drivers/soc/qcom/qcom_pd_mapper.c                  |   1 +
 drivers/soc/qcom/socinfo.c                         |   1 +
 drivers/soc/qcom/ubwc_config.c                     |   1 +
 include/dt-bindings/arm/qcom,ids.h                 |   1 +
 11 files changed, 1165 insertions(+), 4 deletions(-)
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


