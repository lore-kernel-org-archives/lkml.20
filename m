Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793346255;
	b=M86kJ/Kt/lDQJRPoy6QS6BcjFQrkqPlCnjpSK0HGzSGwJ2f8zRdzuFxjkhjYRVAD7vkB
	 /BLrzfJPEIFjBTOXulyEIvw9bq16g0enTqs4KD2/5o5uOHb6TxzLyXKoY4u+hGxSCkAuB
	 AGBnnKyGVdIyUbpCQlSgqgpwyOkosjhlelpGhq3TLyPKrDQb0oklMa+DCbP0qxSm4/EKU
	 2c99/VxPFRwh/aSjlIqgZCULL802lKRtSkloU6tGpxXhJRggoVmLVg2sSz4xjWYLA3BG4
	 Pjarkj46lIsHc713O31Xuzr1DCZi0scEXPpsyXSYXcl2vGdYf5SjPh/emxnXIjquTIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793346255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=03qqmHBSW9MXdmI5eo6TZGADNcBJXPTGl20o2AD8AeM=;
	b=xFe5/rXIEgHk2v72Mmi1zZenOmP9VWb5LbDuPz/3T/G5KqtntqqZIYBTpVNODnNoEXni
	 rInFLAUBOr1NXrmRAgyTNZyV7RKGLVVkBREznW2g4Hq//0/rkHNBoSKZi5MscNjsz8GWs
	 vRF1z3hzqScIpBKGHqA4z+tsoS/YBBBBLg1CLkkbQ7EqsQgCx0MQBA+s7BWIg4zrhq9vi
	 3ei06wXBA9wtwvY5mm2gwkNZ5AwjANvC+0NQuqMCdSkU+AxKSbZmA8jl/eSiB6bTOZ5Sn
	 lYgKbbK2oq5GXzCn0rvtyv/bftTI7abIH84pLwb5gWEdLrFIR0QxvowDmKoufRc4x2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="I73D/JIW";
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E388606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:44:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E388606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I73D/JIW
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15ea896ddc8so664452c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793346254; x=1793951054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=03qqmHBSW9MXdmI5eo6TZGADNcBJXPTGl20o2AD8AeM=;
        b=I73D/JIWeqqMaqnpN2TqvAc4FFoDTlDFdOPfAPRDSQxNojz3M7bdr7pnhe5X7NYMbq
         bgSVBsbpvIMeIV8limp9+keuy7ZIbF9dJQP2PlZ/mtC6c/Qwdp1uZlPXLkLbi06hbTXT
         8ag++qRuiTYIomfEhGtRsOVPQCZsX8jbBnLFXb9yZObTG59HlrGrVs/l7VjKmVj32g2+
         u4OffBLWxV3sLKaX13zTsa3UboHXE0mDwbVlngXoZXYPclNSwo/+EFoFKvb5+GHRSeKn
         fBf0d4TKrihlLG6qNaU4HOw4TN22FkICTjebC0IPL7fQSB/PQyZ4jlP27JUdL3jH4EuI
         Rrxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793346254; x=1793951054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=03qqmHBSW9MXdmI5eo6TZGADNcBJXPTGl20o2AD8AeM=;
        b=0R5pKMozZcOy8FOeNJdYa2QvPJ2kO+ICZCY5Kx9pI2gGy8NVcIhVL04RsU6VD67wRC
         678AO5fTS9LBNOvMg2B3wXon8VNJ3nwHfG888ZNrOqsU5OO2AoMKvqFzPYIP3QEfeWbf
         6tTVmhHjAq58hCwgjl50T8tj/2iiKIO8Xb8VbJ2hXf+NIunQ1+nWTbbYIEDHu+Z9gdxj
         lW3QjWjinS2qM9kFfTp8QhZjxL4tLMXF71VMU1q9iCFn9zzLaRCo/xQ35vqDdl7K0Fud
         F9UoxsSqX2n2cFQq0vgjwpHUDj92TVzU5g89fPE8FunjuJrWwCXTbKeNhm31c+V32wa0
         dsEw==
X-Forwarded-Encrypted: i=1; AKwUvBy2213NxDeOtZ4iwHEGFij8n7zVyQ8+/gXcjp983YKKbSdOz0UBQLpxRiZEJV9tcKYBIFsZWl4F1jM9Vgo=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2dq0MHrIbeDDKnASAUUlK2ea31JEKWWvoMVuTTTXkc515NqpK
	IS4Fwd/Bi0buXi1N1W7bbpq2Ce/RVnVJauWU2sc8akXS7w0os8/5qvjt
X-Gm-Gg: AYBFou0xpMBnLhWRbVqW/xDtQfHTjdm2uIEp5ZTHh2Ct3t3jXFkOmXfH6FXSC7zmGBx
	la7dGvvGpJ1mWq8pgZxtX9xfzfcgWCTQDKCPiIqLHOWSwanPYW27AL4OSWEINo8Dw52L4XdcRNP
	3OAd9CT5f/wuejy/g/xKFdd7HRfp6zyifosUcwODVzD+89VAaVzSrEKQJONobws1rg62uo6Kiaw
	qCcUN2cSbf1OW/V4lqpoCULDsJHKpSu+Aet1FYFsBu/e9KOJjZYwlrnGa3AafJHbIxDK2S+ilzD
	N58K0A/EyN07puI336iljY+xy+z3ZfVDddq2QBr/sfDSF3Dc9f9wmx5rp2NuCOqlTMBgm5jSEYc
	JTaifxUHj8Bm/aJtpumEs2DaB7YPcDdWIbRLqFwAqcOUUDbGyf91R/6yq2zZPRFYXIh+i0aZIiJ
	6xsVZZ9e6mIHEdYDKdKYXmlGVQgrtZDjsl5580p6x7nv6d76FYWpcNV6hiY1NDpnp8yRIkxzmcw
	/tujiOFWxdULM0Nl3IbtEMbGXuubkxLh30naSZhVZQi+kK8pEvTH0yIdrVPIP6ooBxyA6END0JI
	AO/YSxWVpsbPMsNbVpEWGLOXDQuNHsLDzjyw01r0JGUYVHoUWc6Scy4=
X-Received: by 2002:a05:701b:4241:20b0:143:2968:564c with SMTP id a92af1059eb24-1ac5b9cb040mr2258198c88.26.1793346253483;
        Fri, 30 Oct 2026 00:44:13 -0700 (PDT)
Received: from 192.168.1.130 ([2402:a00:163:2ce9:fd6e:e797:613b:a5eb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c27cdsm7466562c88.10.2026.10.30.00.44.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 00:44:12 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: andersson@kernel.org
Cc: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: Add Vicharak Axon Pro
Date: Fri, 30 Oct 2026 13:14:02 +0530
Message-ID: <20261030074404.33517-1-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
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

Add initial devicetree support for the Vicharak Axon Pro SBC, based on
the Qualcomm QCS9075 platform.

The board description includes the debug UART, UFS, USB 2.0 host with
an onboard hub, PCIe1 (NVMe), GPIO LEDs, GPU and DSPs.

Changes in v2:
- Use the "lemans" subject prefix and name the SoC as QCS9075.
- Drop the PMIC gpio-line-names, which did not match this board.
- Drop Ethernet and audio to keep this to initial support. They will be
  sent separately.
- Link to v1: https://lore.kernel.org/linux-arm-msm/20261029133654.6585-1-blfizzyy@gmail.com/

Ajit Singh (2):
  dt-bindings: arm: qcom: Add Vicharak Axon Pro
  arm64: dts: qcom: lemans: Add Vicharak Axon Pro

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/lemans-vicharak-axon-pro.dts     | 514 ++++++++++++++++++
 3 files changed, 516 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-vicharak-axon-pro.dts


base-commit: 62f4c998b297cf233997a2b4cd6fc2d2df0319c9
-- 
2.50.1 (Apple Git-155)

