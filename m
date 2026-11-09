Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794263925;
	b=Dfm6YP4wTa7nxdEdEz7IUjuzglRXyFwBkudBkjDTTegqj4O6iSx8ZreW5DqoqVoQPFGD
	 fBJLU2ai4ofeObtpwaq38CaA/k0fFa+nCcCMpH8XlTzMHW+0bP5z1OQuysC8IOP5+NzHJ
	 udXeLJGljweWuwFaoOgcMCIUzn/2Crcc9U0NUo905pvWglfu1lKBdcQKUaeBRxZ7IZ5la
	 dl4ZL5Jnq27A29IHN4fK5W9qCyvsmGeV/QRf39MsaSEKnpxxOw5LDQXtLhOEx08NfdfGY
	 XdLRb0rCQxzJ/txKNuWJbOVbJETQmV3tegTihljRJjF4nw+ppvFCGRYu2d+rqo8GYZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794263925;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=3eXfdK+/ERlcqk0A2RmXoKMP6hm5guIAqsMLPqJM56Q=;
	b=d8b5u3A3xkz66HoL8Nk4QqByliwOwrgeJjU6o6syXnxVCO9t6am5ftMPOv8WEMI5EGJ6
	 T7sbqkZwUSHYpOHbB6cpR06JjlI5W1G7CtfyjAguqNC6bmEw+vO9AcnObfz3uTqZzZAc2
	 aKItEzDrB0f7f03W6APEccUBipvERdy7chsZIgsUkVifLPaEiwocIOhpC9MsRQjjW6iGq
	 8jhJ1EOVxucu8J7l1xjxwanV8ipWOxhpqGBz71gNIjK5MGw4gfWmZePGw8U37II5QXZT3
	 8ora0LSI1iI28crY9wyob/xU+nr+I0PvlIjCnzzB9yt4+x5ucdGeZ3F2LHq2zCSAAqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TrTJl8WM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81CF606A31C;
	Mon,  9 Nov 2026 22:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TrTJl8WM
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794263924;
	b=JfuiznkQzdIHPkXWEz6tDRXZvn9NS/a9ZMVrC8aSQwmMH9l60DxYZkHjzj76qayL+kQ7
	 oV27y1J5W30l4CRBijreVfyWBflzQd371NelMOdBy8eIrE9Hx+L8yxAclTNBfqtx4g+Bj
	 C1WIXESWJvb+je3AaMjy8SlkgouvIlOL3LBCBw5JVfI8JkKw2oNU8UuAdlkGHrQ55D0xz
	 j9zCxmq60qS1/rsA6aVUefLjRyP7uDcxG6LFvGoSIhfIeyek7C9X8IsiJpWy8rYKq8PBT
	 ETzdc1slXR8mH29ijqwsRZ5M87L2cvTZkPVaXMg/kvZI5FzD8coS3sXesGc/Ci7jmrg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794263924;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=3eXfdK+/ERlcqk0A2RmXoKMP6hm5guIAqsMLPqJM56Q=;
	b=Dn1PQjLL/rAq3LBlVbXiKPqe1A6ySLigCCfbrwb49Jc1JyqrwKfBAcE+RG6G+r4B3h12
	 TwqgB/n3EWaP+cTSM6ZZd+7H/ZotynRXGoP5KK2C92nYwomoa3QF3NT5IYa/XEwKDZipH
	 R/iKK2qemXiKmcTAAXKCcYsa1mJeFQBnUQmhcgeYbuveKTIRk6sWdEuyXZ6CvGG9THaYw
	 Fh4lF92/rLaZ8msNjWwSZl4IEeiPVz1sWb/RYIjd7F7fcvSxYcKwLt7K+JXZDQJUoStMs
	 9AbEXOGjvDAik+0BcanlQTPzip139LxK2w97RGMa3b+qDWSJkEPA2jfGHQSHcpXpxPQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A71141F0089F;
	Mon,  9 Nov 2026 22:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794263924;
	bh=3eXfdK+/ERlcqk0A2RmXoKMP6hm5guIAqsMLPqJM56Q=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=TrTJl8WMN3N7AJTgKcENnPah1MGYVCfEey0K+tj3Q8798T1OHePKtJPEsK7r7xV2n
	 B6H2bLPxavfWziR+fFTTqm1KRgBel/zcN7OWXHEoG2fTWDUFdrknXv+zjJykK67qej
	 Dvw3/1czLu24v8BnNwymj7Nxe41+OP3xFJxniHJjUzI/Am2W9GII0udyheq8s2twtG
	 A+LbLsj725KmHB0L966dNDFsTCFPV5SoKLIgnKc1Xi2lv8b3wVHkQKPuMrJzgdzi4+
	 7kPQHPV3iYwLPFiuvjY2VPC2NFx0NVp7Noxto9DgTqZLVmDz52ExRa3+CLf77nvaMM
	 iwFFbnS8EN2gQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 02878486C3;
	Mon,  9 Nov 2026 22:38:43 +0000 (UTC)
From: Gaurav Suman via B4 Relay <devnull+gauravsuman007.gmail.com@kernel.org>
Subject: [PATCH 0/8] Add SM8150 CAMSS and LG G8x ThinQ camera sensors
Date: Mon, 09 Nov 2026 22:38:18 +0000
Message-Id: <20261109-sm8150-camera-v1-0-3d2e7b407516@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAFpL8moC/x3MTQqAIBBA4avIrBNUUKyrRAt/xpqFFgoRSHdPW
 n6L9zo0rIQNFtah4k2NzjIgJwbhcGVHTnEYlFBGSjHzlq3UggeXsTpuYlJCW+t9VDCaq2Ki5/+
 t2/t+AguuhF8AAAA=
X-Change-ID: 20261109-sm8150-camera-6df20588bbd2
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Gaurav Suman <gauravsuman007@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794263921; l=5453;
 i=gauravsuman007@gmail.com; s=default; h=from:subject:message-id;
 bh=V0gxOM2+wQBEiJW7jBW/SNch7ZQr8m8J9Q6jbHcbWdU=;
 b=Bj65NyVHBcsx5uucl2Sxdj4GMPIoqzce0DT+tdCySvmN00TKqBD31U4Q1VDTUGctkA/xJdWmD
 d3jWcSFHafIDDqgmgUrU38ErgAEJd/WgH3KG0NYxLgH6cOXj/x+gUSo
X-Developer-Key: i=gauravsuman007@gmail.com; a=ed25519;
 pk=lnUC0mQfc0KyA0LE73pQ4+QWYVRaCD8Sd3XWxLZO+JY=
X-Endpoint-Received: by B4 Relay for gauravsuman007@gmail.com/default with
 auth_id=1467
X-Original-From: Gaurav Suman <gauravsuman007@gmail.com>
Reply-To: gauravsuman007@gmail.com

This series adds camera support for the Qualcomm SM8150 (Titan 175) and
the three cameras of the LG G8x ThinQ:

 - CAMSS for SM8150: four CSIPHYs, two CSIDs/VFEs plus two lite pairs,
   reusing the gen2 CSID and VFE 17x code with SM8150 clock rates, the
   CSIPHY v1.1 lane table and camnoc_axi set to 400 MHz by the driver,
 - a driver for the Samsung S5K3M3 13MP sensor (wide camera),
 - a driver for the Samsung S5KGD1 32MP quad-Bayer sensor (front
   camera, 2x2 binned mode),
 - a lens driver for the autofocus part of the ON Semiconductor
   LC898123F40 OIS/AF controller (main camera module).

The main camera, a Sony IMX363, uses the driver from the sdm670-mainline
tree (Pixel 3a), which its author plans to submit; it is not part of
this series. The board DT for the G8x will follow once the bindings are
settled.

The sensor register settings come from the phone's vendor camera module
data. Each driver supports one mode for now.

Testing: on an LG G8x ThinQ, all three sensors stream RAW10 at 30 fps
through CSID0/VFE0 RDI0 into libcamera's simple pipeline handler and
GPU software ISP (GNOME Snapshot), and the lens moves with
V4L2_CID_FOCUS_ABSOLUTE. The patches apply to next-20261105; the
drivers build with W=1 without warnings and the bindings pass
dt_binding_check. The same code runs on the phone on top of the
postmarketOS 7.0 kernel (only the client_info callback argument
differs).

Tree and test notes: https://github.com/gauravsuman007/nura-g8x

This series was written and tested with the help of an AI coding
assistant (Claude Opus 5.5, Anthropic). I have reviewed every patch and
the test results, and I am responsible for them.

Gaurav Suman (8):
  dt-bindings: media: Add qcom,sm8150-camss
  media: qcom: camss: Add SM8150 support
  dt-bindings: media: i2c: Add Samsung S5K3M3 image sensor
  media: i2c: Add Samsung S5K3M3 image sensor driver
  dt-bindings: media: i2c: Add Samsung S5KGD1 image sensor
  media: i2c: Add Samsung S5KGD1 image sensor driver
  dt-bindings: media: i2c: Add ON Semiconductor LC898123F40
  media: i2c: Add ON Semiconductor LC898123F40 lens autofocus driver

.../bindings/media/i2c/onnn,lc898123f40.yaml  |   46 +
 .../bindings/media/i2c/samsung,s5k3m3.yaml    |  104 +
 .../bindings/media/i2c/samsung,s5kgd1.yaml    |  105 +
 .../bindings/media/qcom,sm8150-camss.yaml     |  389 ++
 MAINTAINERS                                   |   25 +
 drivers/media/i2c/Kconfig                     |   30 +
 drivers/media/i2c/Makefile                    |    3 +
 drivers/media/i2c/lc898123.c                  |  138 +
 drivers/media/i2c/s5k3m3-regs.h               |   71 +
 drivers/media/i2c/s5k3m3.c                    |  451 ++
 drivers/media/i2c/s5kgd1-regs.h               | 6137 +++++++++++++++++
 drivers/media/i2c/s5kgd1.c                    |  451 ++
 .../qcom/camss/camss-csiphy-3ph-1-0.c         |   80 +
 drivers/media/platform/qcom/camss/camss-vfe.c |    2 +
 drivers/media/platform/qcom/camss/camss.c     |  250 +
 drivers/media/platform/qcom/camss/camss.h     |    1 +
 16 files changed, 8283 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,lc898123f40.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k3m3.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5kgd1.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8150-camss.yaml
 create mode 100644 drivers/media/i2c/lc898123.c
 create mode 100644 drivers/media/i2c/s5k3m3-regs.h
 create mode 100644 drivers/media/i2c/s5k3m3.c
 create mode 100644 drivers/media/i2c/s5kgd1-regs.h
 create mode 100644 drivers/media/i2c/s5kgd1.c

---
Gaurav Suman (8):
      dt-bindings: media: Add qcom,sm8150-camss
      media: qcom: camss: Add SM8150 support
      dt-bindings: media: i2c: Add Samsung S5K3M3 image sensor
      media: i2c: Add Samsung S5K3M3 image sensor driver
      dt-bindings: media: i2c: Add Samsung S5KGD1 image sensor
      media: i2c: Add Samsung S5KGD1 image sensor driver
      dt-bindings: media: i2c: Add ON Semiconductor LC898123F40
      media: i2c: Add ON Semiconductor LC898123F40 lens autofocus driver

 .../bindings/media/i2c/onnn,lc898123f40.yaml       |   46 +
 .../bindings/media/i2c/samsung,s5k3m3.yaml         |  104 +
 .../bindings/media/i2c/samsung,s5kgd1.yaml         |  105 +
 .../bindings/media/qcom,sm8150-camss.yaml          |  389 ++
 MAINTAINERS                                        |   23 +
 drivers/media/i2c/Kconfig                          |   30 +
 drivers/media/i2c/Makefile                         |    3 +
 drivers/media/i2c/lc898123.c                       |  138 +
 drivers/media/i2c/s5k3m3-regs.h                    |   71 +
 drivers/media/i2c/s5k3m3.c                         |  451 ++
 drivers/media/i2c/s5kgd1-regs.h                    | 6137 ++++++++++++++++++++
 drivers/media/i2c/s5kgd1.c                         |  451 ++
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   80 +
 drivers/media/platform/qcom/camss/camss-vfe.c      |    2 +
 drivers/media/platform/qcom/camss/camss.c          |  250 +
 drivers/media/platform/qcom/camss/camss.h          |    1 +
 16 files changed, 8281 insertions(+)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261109-sm8150-camera-6df20588bbd2

Best regards,
-- 
Gaurav Suman <gauravsuman007@gmail.com>


