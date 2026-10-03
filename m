Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224EA2FFDEA;
	Sat,  3 Oct 2026 20:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791060669; cv=none; b=sEr+XLGQ6bPfXejUNgnuFTSNX7KFTgsm5gHlwYqxaYRe68cFrZASCwThl5x4IEFhtnkitF9J1sqzXBWW6WIIYa9nbJAKrGYhOW2nEOHMXSm2ubjkrvI6BfPqcDZXYWpq7yVUk6KTOSXVtIfXbhUZUwfTlKLESapBcIs1ynnu2u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791060669; c=relaxed/simple;
	bh=hjkUgIJ1jqk8Ay62xKb0orLgoJe2KP9bpAbBa0mAAYE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EVjoAdekP2bWC60TY24jSfJ0GQ0HL6ReuRyHMio+b8bObz72GnHqZGvSZ1lRA8bIH2V3TzKdrSNQak+WO/QNqmf60SWIdHf5iuFg5fPSoHTd9jgOPfe0ZwYY+IQ6Nnz17z/1XC7LPW5hlG4UlIO0gfLxtGeYNQRbcbuRvaZ92Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A9eNUnN3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A9eNUnN3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93A3BC2BCB9;
	Sat,  3 Oct 2026 20:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791060668;
	bh=hjkUgIJ1jqk8Ay62xKb0orLgoJe2KP9bpAbBa0mAAYE=;
	h=From:Subject:Date:To:Cc:From;
	b=A9eNUnN3QIPL7riU43tpSaafRpQEW58Fwcj/PSGLZoIlmo0MWS+2JEyRDgOBFuHVT
	 yP9sli+79/+2T53lMJE9RaO25TUE/PGYRTf19xDg/1CIiPOJSGzc3BpEjthTaE+CVn
	 6wGcoJRf6/fi6toFRzJLdblxJrSl1QitjOIw253xJTm/9qsuwhR6WXYx/u7JmaXDu8
	 7z/fTr5yQAJX315QNFNlNtp6C5Lp1KPQbRiHUm+i0SBBvkLtLXtuB567gnJbeJ1Vvl
	 7DR3yqCcSHvDfZodO0yEjUl8gYdKjen7F5K+m34bht00u/dEc6Z/jUBq35tTCQHIRu
	 1lzMLqU7G9HRg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F7AFCA5FE6;
	Sat,  3 Oct 2026 20:51:08 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Subject: [PATCH v3 0/3] Apple SoC CIO (USB4/Thunderbolt) reset controller
Date: Sat, 03 Oct 2026 22:50:59 +0200
Message-Id: <20261003-b4-cio-reset-v3-0-e605f9e5c8a4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw7CIBQFf6W5azEU0D5W/odxAeXSoqYYqETT9
 N+FulETl5OcmTNDQG8xQFvM4DHaYN2YgG8K6AY59kisTgyMsj2taUOUIJ11xGPAiUjJjaJCSd0
 gJOXm0djHmjue3hzu6ozdlBt5MdgwOf9c/2KZd3/SsSSUCMN5VVW6UUIdLuhHvG6d7yG3I/uwW
 fljs2QzTcXO1FQKJr7sZVleF1r3CvkAAAA=
X-Change-ID: 20260809-b4-cio-reset-aa3fb04bad9e
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Joshua Peisach <jpeisach@ubuntu.com>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2831; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=hjkUgIJ1jqk8Ay62xKb0orLgoJe2KP9bpAbBa0mAAYE=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9bBrO2bZjMG3T4YOf17Q6aB2F/ufR6MlzqEptfv0pOJn
 h15pbOqo4SFQYyLQVZMkWX7fnvTJw/fCC7ddOk9zBxWJpAhDFycAjCRgEMMX0VPvOXVCzp40+LR
 44/Hr9ZNL/no/DqySOjM6xgpHoHPnAz/vSS+Wr71z3/+cRrnGQlpC53pn2S7P8dfOdfRtuGW3/u
 dHAA=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

Hi,

The CIO blocks used for USB4/Thunderbolt on Apple Silicon SoCs have a
reset inside the power manager that has to be deasserted before their
co-processor can be booted. On t8103 and t8112 each port comes with a
dedicated register page while t600x and t602x use a single register
with one request bit per port shared by all ports of a die in the
middle of the PMGR MMIO region.

The first patch adds the dt-binding, the second one the driver and the
last one the device tree nodes for all SoCs. This will be used by the
upcoming USB4/Thunderbolt series to start the host routers before
booting their co-processors.

Best,

Sven

---
Changes in v3:
- rebased on -rc1
- Link to v2: https://patch.msgid.link/20260821-b4-cio-reset-v2-0-2d045f80a424@kernel.org

Changes in v2:
- dt-bindings: move the t600x example with the PMGR sub-node over to the
  PMGR binding itself where it can use the correct number of address
  cells such that the unit address matches reg again (Conor)
- bail out of probe when no match data is available (Joshua, sashiko)
- explain why neither a read-modify-write nor a delay before polling
  is required for the shared t600x register (sashiko)
- fix a copy/paste error for the M2 MMIO region in the dts change
- Link to v1: https://patch.msgid.link/20260809-b4-cio-reset-v1-0-4f33777d9b4b@kernel.org

To: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>
To: Neal Gompa <neal@gompa.dev>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Joshua Peisach <jpeisach@ubuntu.com>
Cc: asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Sven Peter (3):
      dt-bindings: reset: Add Apple SoC CIO reset
      reset: Add Apple SoC CIO reset driver
      arm64: dts: apple: Add CIO reset controllers

 .../devicetree/bindings/arm/apple/apple,pmgr.yaml  |  12 ++
 .../bindings/reset/apple,t8103-cio-reset.yaml      |  61 +++++++
 MAINTAINERS                                        |   2 +
 arch/arm64/boot/dts/apple/t600x-dieX.dtsi          |   8 +-
 arch/arm64/boot/dts/apple/t602x-dieX.dtsi          |   8 +-
 arch/arm64/boot/dts/apple/t8103.dtsi               |   6 +
 arch/arm64/boot/dts/apple/t8112.dtsi               |   6 +
 drivers/reset/Kconfig                              |  10 ++
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-apple-cio.c                    | 200 +++++++++++++++++++++
 10 files changed, 312 insertions(+), 2 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260809-b4-cio-reset-aa3fb04bad9e

Best regards,
--  
Sven Peter <sven@kernel.org>


