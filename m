Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793134360;
	b=jvELdKJ4xrw+AiJtkqapbe6mqM/A51glHfpyF9PjvbFlqNH2/6M5yIUZThz3MOjLP7ar
	 53kzJzLOvoQ/LqnB5ryJJjmVKwmjv4/XjAzCA3TyRnyfHCJjYtc9SCMCXroDtvTA22Vds
	 mC/ix6WEMuDZ2By+LElIlfOOz1j2J3Y+E3MCCs5RSqSTP3vO3CqpELPcDoTjvitcdEBzq
	 ATo2tbw/eR/ts8aMGlbyd2uO3qh01XYVbLwE1K6DbgwJIa7BOEZM58r+6jY90MCj9aZyH
	 ddPOZvnqRb6Dw/q9U9jYuBoe3E3LiEPSadU2dp/5a88JMqEMU0JQzSLUu/Vm3s2q+rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793134360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JAPuSSjBy2HiV0XHwgEt3aaV8Ughg4BjhBgy8A9BioY=;
	b=tqfRVoJ135Z+1Cyoif/knmZ4NZD7CdBDHaEbCXWcTKs+f5ocaBMP24UpUwIWYPIuVo78
	 xsdMQv90+P+RTzgeV9aXXHQTpPqJhlMF8S3FSHjh44nolyZQNBAmukRpSVYeuH3g65If9
	 aO+kPBe86alkopwnVkdhFXylH1qIXsg0RH88CNn/06TmLD55mBLaGAYpSgrLuo1fDRxmQ
	 K8VsWH48zNLKjxXUFYWD2CLmGU/MyFTSo2EqGUn/swgRyWgrwT8IKyYsExqgVVVUqDtLL
	 1+H3MQJKUd0xWv2mEVfDkgCPrWOtUhpJACh/aM5SI65dBToey4m46MMrkJsQ+f7cPyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o8+uIxak;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEBE606A322
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BEBE606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o8+uIxak
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ae0852df46so255393a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793134359; x=1793739159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JAPuSSjBy2HiV0XHwgEt3aaV8Ughg4BjhBgy8A9BioY=;
        b=o8+uIxakmfDagDkZCK7+K6/vRP/IVouu2zhyMfMqSNNIX8uO4j7UOSdKzAnJG10Qgg
         TcZ0qI6eEWtQfCuXaxmrArt6DgXQAISp1+BzCg4MmL3coNG2Oa081uRLgqaSMIiS4GiY
         hOjBeH/qnW9dN5trvA9hGcQKE1N51RrJGgVg5nGhH1aMJTlPtf4NG9qZukH5OylYQPkh
         4nWMF2UckyXkbGyijuyO761Z7iu51tD0qaP9PyluGQbBM3+qZOpULIXkqZAs6XsUCn2p
         7MZ77ZoeliWVVsTIgmRDtzJCJrKJ+mOLIZRFOEfFmco7vZDadczAUbT/floDWB0ZAqqK
         YTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793134359; x=1793739159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JAPuSSjBy2HiV0XHwgEt3aaV8Ughg4BjhBgy8A9BioY=;
        b=vn+uPU09+N12CIXMOi3c36oSmLKHSYQAaBlf5yOGlT8oXxQnUgTHG9VG4XPhXCP7Ch
         4Mwa1TfpwRqksHL0dFhUmHESaUHAioZIoBL+u0fpUuU9u8q4XrZLfCA54lN3WNywMMrT
         8nJ4vI9rlD97dpgPy97bqQPLk37qbzxzcHhM/5I8w4jL55OBk8CfV+PBVwX7bobUYATT
         YlwlhfZX4NKUeYX207RTumN+omIk45GT5M6PqmcTIQBtKg44MpFKOrb/hEuRBTbucEbp
         WqNfcyeStdJ1MG78DVxlruizCStP19ZSFdiJEkohbReI+Pvr3mGHQFhe+zfCVxraZ24X
         7Lcw==
X-Forwarded-Encrypted: i=1; AKwUvBx7zwgzs8G7hBKHG3sX+iwvMw5WlKC4ZU63Jdck/RgcdDduxl88qCsHcPNT5OgCGL+vUSjASTmoDeMKV/0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfzE0sM+ugh/jRJZfJV0SBjqY76Jqud1xJA3lnmqJMCCck+Rou
	zCfqmTAoPbblKX3qyWyO9l2Xzx30UCwWkaMtKxVqmLcND0S/CcCRsuCnm+TZUJehj4s=
X-Gm-Gg: AYBFou1/XuTIs64wrRBeIDAa3BFpGocsBsjldCDRvKBDVDUYq4inHjzEqtUqkV6bPrH
	1gO7tVS6mVcXBVwf90EkMYVlKO3qEG7EY4X6fxAxyjM2jL5dVsSZZbbW/PLfxYKJWvibeEmLAgc
	5OF9gzuNHHjk8Ene2NVFDPAdf7WnNSbhVflC+SCp4P/iBR4RaeUxMVOd9nWOTP6kYm3wJ4N/Wv2
	SF0vuYRq/NR89lV2COnAm8sPxLjNRLTHRkBVCiVuaqGWiFP+ExJg7s7rxHgRDU2gVL2a5UycGLe
	/hYcSpFWqVNt0WgeLJeIv02Gur96QMkHArAU2wtwXcHsz+OBFjR5f+cR+CiED3tjopO1/KqXnoO
	VCSIXAKrd9dBb45cz/Div+2xBz/LKNwggy2UZ2eDbfREF2DaEbwAtw43gU5IPVObdkS1E93nlc1
	d4lkr46h26hAIdfmltwZPnpXbs+AJ9pPEsva/tFZiF8dfcfVKZmDwNHKEOPmJwCjq7c+P6XneNy
	zRaX78ePCH7W/Q2gmIiKkXhKv0JjAS6g6hCfdg57u030Ix6Zj/3okdWo2EK1hABosKgjXLKe/th
	YgNHbsl2oLbhtGI1WoiTdI3gzrtgWMAH
X-Received: by 2002:a17:90b:1c0a:b0:3ae:3b3d:c617 with SMTP id 98e67ed59e1d1-3ae5812dd39mr123478a91.29.1793134358980;
        Tue, 27 Oct 2026 13:52:38 -0700 (PDT)
Received: from debian.lan ([121.101.131.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae57bc67bbsm372192a91.3.2026.10.27.13.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 13:52:38 -0700 (PDT)
From: Amir Hanip <killdeath104@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Amir Hanip <killdeath104@gmail.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: Add Xiaomi Poco M3 (citrus)
Date: Wed, 28 Oct 2026 03:51:44 +0700
Message-ID: <20261027205146.16384-1-killdeath104@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds initial support for the Xiaomi Poco M3 (codename
citrus), a smartphone based on the Qualcomm Snapdragon 662 (SM6115).

Currently working:
- UFS and microSD
- USB host (OTG), limited to high-speed (SuperSpeed is untested)
- WiFi
- Bluetooth
- Remoteprocs (ADSP, CDSP and modem)

The memory map for the ADSP, CDSP, IPA and GPU regions differs from
the SM6115 defaults and follows the layout of the stock firmware.

Not included yet: the display panel, touchscreen and the GPU display
pipeline, which depend on drivers that are not upstream. Until then
the display is only available through simple-framebuffer. Audio is
not included either.

Firmware and userspace: WiFi, Bluetooth and the remoteprocs need
device-specific firmware which is not part of this series. WiFi
additionally needs qrtr, tqftpserv and rmtfs running in userspace,
and the Bluetooth controller needs its BD address set from userspace.

Tested on a Poco M3 booted from microSD with a v7.2-based kernel.
The series is based on qcom/for-next, builds without new warnings
with W=1 and passes CHECK_DTBS=y for
qcom/sm6115-xiaomi-citrus.dtb. The existing dsi@5e94000 warning
comes from sm6115.dtsi.

Changes in v2:
- Unrolled the wcn3950-pmu regulator scopes, used lowercase hex and
  kept a blank line before 'status' (Konrad)
- gpio-reserved-ranges: dropped <0 4>, the device boots fine without
  it. Kept <14 4> (SE5 SPI), without it the device bootloops. Added
  a comment (Konrad)
- Kept citrus separate from lemon: reserved-memory, PM6125 regulators
  and the wifi/bluetooth bits differ, and I can't test lemon (Konrad)
- Patch 1/2: no changes

Link to v1:
https://lore.kernel.org/all/20261027075116.41673-1-killdeath104@gmail.com/

Amir Hanip (2):
  dt-bindings: arm: qcom: Document Xiaomi Poco M3
  arm64: dts: qcom: Add Xiaomi Poco M3

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm6115-xiaomi-citrus.dts    | 538 ++++++++++++++++++
 3 files changed, 540 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115-xiaomi-citrus.dts

-- 
2.47.3
