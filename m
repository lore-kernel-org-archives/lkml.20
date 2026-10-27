Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793087504;
	b=Mp62lRK7yGBYNv3Oe2gB1/k4tE/0iZvNF379mLTOslT3Kt/ZoX23aWlCDw4F3qx9Alfd
	 tsT8l2F3qt2smBXui2cZQnbvUOH8m/JFhwH8wL9Euui0rPvkKqFpCDmSXEjd3oWuLUUau
	 Wj4ij1M9E1Jz8TZUsY3CNA5UjaCxua6WpK17Ui2/8QDSECWPsyfwV05esb7gsdS3K+54F
	 c/NuDUx0QmecoA9qHGqJYEMyofWIHSrs2bByvnS0nOPnhimKSBDZtPMOVIayVV2bIVeD1
	 CmF6aLZ2tN5cIWPyFKjY9H3K/g1X4dXJQ+Ge71KhxsySPiU5cK7xiGTpuAD6N3Df2ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793087504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=acnStiLnhMHoFtH9MxN6320P5itUUR4d4HGEJJqetkY=;
	b=xRYJFZy5izo826OYBBiLCBGoTzHNjZ4yzFgi1nDjo4zGnQd4ctxbgP3ecjrEvg8WcjkJ
	 V/GYOf8BlN7sHTy+i1KkgJEhKtvypSGU2bMmA3RM8BC6oI4VwDsPuJBjr2XdmFC/F1pK5
	 fKQrtOUjmP0uT//fITPNIwQdsK0BF5OkScrJHktxKLKt/Bwx6z47SfUdcxdxMXkdu91zo
	 /WEkthlfEvok9AUVNyCuJ7PVScER3hrledNdZZf5HdYbv2EkvBNMaHLAEGaP1hXgKvRlw
	 WShIxn4QUCtqQWxoZcQy4oAruf7KCyvx2TUS56ClwmoAUQKQKQrPHeTOgs93Mq9ocCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EsuF8IBF;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5AE606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:51:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D5AE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EsuF8IBF
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso707070a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793087503; x=1793692303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=acnStiLnhMHoFtH9MxN6320P5itUUR4d4HGEJJqetkY=;
        b=EsuF8IBFEyWcx92BGt0MefrirPegPiY5VvVfx0NRbT1NBCbqvuXxVtodUpzbjZ/OK8
         CKVrL2M/UxNsGf9+j3FBShQCCgKymDyDn2TrlM4ZBGsvtLBmPKPlA5z2lr7xH5QHXYBi
         FZEyuspH0U7Jph7qDwuf+M8lxutNE3bF7zqA7rJWOSoWerCgxAmdatquMPmsit+2A5U9
         gIdnxXhwfjEG5KCSbiImFm+bpQk9zCld3WhSjM/WEdxzAL23vvz2InTpPRYXUmRLyN3B
         Lr4T1wfVdvOnTcovr0hU8Lt2UeYWgfcKW2ZQx+TrA3lvwKF0AMzPPan8H4YCiglETX/A
         4ZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793087503; x=1793692303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=acnStiLnhMHoFtH9MxN6320P5itUUR4d4HGEJJqetkY=;
        b=M9i8+XBBZ5jCcMxnVJx9F6p+VV4IhZlYjEu7xp/Y2gtZpYLZiJRrNEvflVPFdDEmSl
         B21aVAA11lNaQz0wf5JE+UP5ZlHV1vGCPj8ZGCm/+WgD277Knr2sWZcvv6rKH8mJRh4r
         2VVIORVJg57h9jGc93GfY7GpaMye9RCcVKkAQMNb8u450miDOg9RoUiN/bZt9X+1wz5B
         wL8KT6IBdj4vuBgKQPegrIhZZFa1+aEfMWHsl6slZJtec6ar0RsxVYEZCjzg9hOVDmoc
         rcOjz2PtJWV3gLLI5EBQrjpQdsUREZJmyfZNCmHqirDM1n13C+EAcqXO1iQhAbHodNTs
         dTKw==
X-Forwarded-Encrypted: i=1; AKwUvByAn+iYsaCytvpXuV41fwRIcOfN961IHF5gExcDNiIuQhYt7J2vjEm0EDlQGTVEB3N6YCHnQMBdNgNzrM8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJdbrzVlv17BzrFypDRNJf/XDnzFUl+bPMJ2pxIOXZA84gXmuS
	1x/HLdChGq+RES21R5OU5EvOYbmUSjqPaG3Qqz31PwRMg3x4dSjXVKO0
X-Gm-Gg: AYBFou0dXcrE+z0FmoyLGMc7N37RXH6Matg1cwgQ+Vtqq/WHpuJMuunrquMGkpREUxu
	W/vWBqY0zL12G1oOBdyAZqUzBuV0ZHltSO3X4VXndJDYXgTNX13vHV2AOa+qByW8YMP/E/IR7HD
	5tvPpDZGdaSDTsE0plt1iYwhXxc1m2yNKLIoz2fO45OTTpBs2otoS4qyCNJGI66Ytb+qPHZ0SjF
	GtxLWuJY31RHUPnd1/NYuQxK2uJJ+IV0MkDzUzruZhRrxCPHzKAa//YTbuC2k4/ajdx+Wh60Eu7
	dMDMsZH9e47+JHs8hWe5CyqkkzEBsncRMGCpFcSdVmhpgLAuZDKTW1YZqwQf8QnXsFG9RAREPO2
	c/YpSwFh3yqRT9+Mx346Q6rNEMWaG4j3WH9GeaC/d5ykMylmr8iC78fhjlOxc+BDCPd/uly3hBK
	8BFh1ePWoV0iCPVwBj8ph3PQToKpOtFCstNeV91baa89pEFc+5cbQglY6aBG/0QwpPI3Q83TdQQ
	c46yIxgVTGRCgbgJBKx82bGDqRV97iVPtrNoO/sokhaBQJXgIDbm7ktHrD25J7pO9Bmt824K+pn
	cmSr
X-Received: by 2002:a17:90b:52c4:b0:3a4:8c41:fab6 with SMTP id 98e67ed59e1d1-3adead50adamr7301154a91.46.1793087503455;
        Tue, 27 Oct 2026 00:51:43 -0700 (PDT)
Received: from debian.lan ([121.101.131.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40614d7dsm2542311a91.3.2026.10.27.00.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:51:43 -0700 (PDT)
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
Subject: [PATCH v1 0/2] arm64: dts: qcom: Add Xiaomi Poco M3 (citrus)
Date: Tue, 27 Oct 2026 14:51:14 +0700
Message-ID: <20261027075116.41673-1-killdeath104@gmail.com>
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
The series is based on qcom/for-next and passes W=1 and
CHECK_DTBS=y for qcom/sm6115-xiaomi-citrus.dtb.

Amir Hanip (2):
  dt-bindings: arm: qcom: Document Xiaomi Poco M3
  arm64: dts: qcom: Add Xiaomi Poco M3

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm6115-xiaomi-citrus.dts    | 516 ++++++++++++++++++
 3 files changed, 518 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115-xiaomi-citrus.dts


base-commit: f5672a3dff0291d6a45eb0c258b9d2baeb4dc577
-- 
2.47.3

