Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793029267;
	b=tCp/pbqwH8b8+Uh/rgAxRZPlmFtZrD0T2fWoLGreIa1A441PC28xKIXChufMIit6MsJk
	 Xn+sAj1GRioshPHrSfzwEWYAs0SqNzBxjpdKGkZ1zSoEH3BWVIDB2e0tDyYJoyM63mEMY
	 1Ij1ieYoonpctzKkmCp1k5RVdgwr8uD2tRvag4gLk0+twFWE6fvGmy0YWHbDb8rlA0o86
	 vb52skK8sWINeTyVFjTxllHYquSx7ygOXkY+ZSB9KS5Uh73dzS8FE+u1H5mDOJXGZvwzZ
	 Gapo5KB0XABx12KkaJAVVu5SfcSF4bp4fzDyj62CFg7fO5LG1MQ7KTQmbkAvOQSUF1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793029267;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oXvlMSArAdPznEGPoRfsgQqM9zglSgDnbfxhA6Z+wyk=;
	b=GJH/KqH7Qck8B/aRFP39ZOiVlbo3D6d7FKJNdV3WTqaqhhiTONYJftle81HsGV740eay
	 IXS9IlFB0lhb53VPk6oCoCMikF2A53Wbm8/WKbL0TRw6osNMNWL5spdeeOBIafG1amRKw
	 y3Yb4Lf+p0q0hML5bZEN1wOWHO7mKBDiUGE82U5XH+KxRwhARzwdBmZYjrkofOrV0drCc
	 NoIoEhRq3XMrb6N0okdZK9eQ7nyTPAFECn62BeFEBQYSwQAZBZQRSR/zX/zI5plj42u8y
	 /e6JGLdLUyjBvxm+bm11QhTQ/vfCSPWcwItcmWY7JHXL0W/UIALMWDwc40/z7+wQ+hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kydrx5lC;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8467606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8467606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kydrx5lC
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6dd059478dcso2251637eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793029266; x=1793634066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oXvlMSArAdPznEGPoRfsgQqM9zglSgDnbfxhA6Z+wyk=;
        b=kydrx5lCCIvCkSDYdmEzz5tuOnzwKKCEvi+/GimiJ/pbp4X7dtXpkSy8g0554b7Z3F
         KssOxSNc1k65L2cdK/q63N9sp6BYHdDq52Z7aWfM7wZsEanX/yQODUNE09pOAPNfxTam
         aUCI16NSHL1lClaLj0NoihkBAywcb2hm+C1rq6+Z3Sbsft6EdgGFNwr0JejGfBsEbFYG
         k8x0MSSxYECwwLhYDP645aRZa705vFNVDuQlitov1vSoPWRDYR+JpMbJp4ZCLRiUiQIV
         y0HSKCOE1k5rmgFXrBW7PFAT8P3sx0HXxi5CbSEyueJZ/UwTGNfqdFvYslHsEtODsfZd
         Z/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793029266; x=1793634066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oXvlMSArAdPznEGPoRfsgQqM9zglSgDnbfxhA6Z+wyk=;
        b=lY0y/P8gLo+Jev51Fs1vbEBrRqbqpcX74oRnkDEeYWh0aCed2n/KzmTXsNfS4ZdRnN
         1Hid/48lx/gDfB/eGM2EdQI/awqPTOZL8itOM+CLR30dAnNprNQn9qxPwwWSPdC70FX0
         Qat4qgmFpTc4GY2E1lHNLz/ZnlTGWKg9scWix/XUwN+/mJ98G+wbcjNY0VkczbePK7qu
         /a9FWcEmmHIb0xviQpbfP3Jggl87cJihf3ZbbNNWX3pu6Io+y1u8LUFJOZ7wo1heFdXY
         ejGpI5YBxjciINIRHQXDYzTvGOFKkwuLRpoTqsCyeHvN4U1B0a/rcS8IlU5oX5Qh8yf2
         C7rA==
X-Forwarded-Encrypted: i=1; AKwUvBysoGncHOvSHp5uB523dkn+v2aaNDpsrN/mCq7+fvH5gcPovhn3f5WXhMDlBRReQRubVgkMbOtYyyH8uTs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBS28Xz/fQ/RHJqTKt0E+YDi2j/sEKIhm+C2vEfq9yM7vmBXWX
	ktqkUOYj1I3f6uYIsTd4kGqb4lRVbLC3Up35TmvRnEXywFsBqqvnnMrJ
X-Gm-Gg: AYBFou0FCzGf3oTvBACLMG7otxsJ49TVVcCCdiDNK+PWdeAsSg2Tnwd0sfiLvcq9lhQ
	fqi9EeiEWjWRbwt9hLge8eaUjmd1NcK/swkmDhqxKJrvTCNcRvWY5Pz/JhxY6kNLLPfJTnKUPFC
	7rhuycanlhZGS9XPFeP6xVoQSE+ShKXBKtCrPyr7udJRM6Rl1S69QpE35TeNxzLjqpZmscSb8jb
	j1g+5ll0nKkANLzllMRrYrs6BvD9d+UYorPyEz7b7hjAn4iEJZXuP3ri0iMFS6g/KzJp2E23Wct
	JW8BINsW9bOLKoe3xKMRsfdhSKQay4a63bOCbIG+yV19schw4GCenDOKyrdmkS79ctNfjvZSXXv
	L8e3P2omHQe3BjBvTDfB1CPLFPA4MG0sE44q24Z6cUBTT1khO7oobVuPuZq8nkGVEY4dboe8awA
	oK0oXhhU8OVIcHXEGxxMv1Is57342gJdDsat6cwP4lN9rrjEEyH+EdQtPF28Om3NpeBOWG6h7L4
	ALOTT3gRhBLppE0jpHtMTF72ljBJYGZdqC6CSxvBM0LIEvvCO2PCn8d1de90nbtfSmMaufa4SyU
	MNBJLr1cjw==
X-Received: by 2002:a05:6820:2203:b0:70b:afc3:25c6 with SMTP id 006d021491bc7-70bafc3263emr2251069eaf.83.1793029265744;
        Mon, 26 Oct 2026 08:41:05 -0700 (PDT)
Received: from jeffmr.mynetworksettings.com ([2600:1014:a112:1526:a95b:f8ab:d834:50c9])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a84315c0c9sm4746441fac.7.2026.10.26.08.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 08:41:05 -0700 (PDT)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] arm64: dts: qcom: Add HP OmniBook X 16-cp1
Date: Mon, 26 Oct 2026 10:39:59 -0500
Message-ID: <20261026154001.9323-1-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
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

This adds a device tree for the HP OmniBook X 16-cp1 (board 8F46), a 16"
laptop with the 12-core Snapdragon X2 Elite (Mahua).

Tested with Ubuntu's 7.3-based linux-qcom-x1e kernel. Everything listed
in patch 2 works there, including suspend (s2idle).

Notes:
- DisplayPort at HBR2 needs "phy: qualcomm: qmp-combo: update DP PHY PLL
  programming on Glymur" v5 [1]. Without it the stream runs at half rate
  and the monitor shows no picture. With it, about 1 in 4 plug-ins still
  gives no picture; replugging fixes it.
- The GPU is disabled. It works with "drm/msm: Mahua GPU support" [2]
  applied; I'll send a follow-up to enable it once that lands.
- Audio needs a topology and UCM config for the "HP-OmniBook-X16" model,
  which are not upstream yet. The headphone jack (SDCA) is not described.
- I hit one hard lockup while plugging USB-C devices during testing and
  could not reproduce it in later plug/unplug cycles.

This series was written with the help of an AI coding assistant
(Claude): the device tree started from glymur-hp-elitebook-x-g2q.dts and
the laptop's ACPI tables. I reviewed it and tested it on the laptop.

Earlier bring-up report: [3]

Changes in v2:
- Add static data-lanes to usb_2_qmpphy so the PHY uses USB3-only mode
  (reported by Sashiko)
- Drop the Assisted-by tag, describe the tool use in the changelog
  instead (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20261024044650.9936-1-jeff.roach0@gmail.com

[1] https://lore.kernel.org/all/20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com/
[3] https://lore.kernel.org/all/CAAnD8Rb4ZZrHFWMJayabioB_8bOHh1mqZ5LCXZz0jTNGMA7UZQ@mail.gmail.com/

Jeff Roach (2):
  dt-bindings: arm: qcom: Add HP OmniBook X 16-cp1
  arm64: dts: qcom: Add HP OmniBook X 16-cp1

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/mahua-hp-omnibook-x16.dts   | 855 ++++++++++++++++++
 3 files changed, 857 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/mahua-hp-omnibook-x16.dts


base-commit: f5672a3dff0291d6a45eb0c258b9d2baeb4dc577
-- 
2.55.0

