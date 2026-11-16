Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864268;
	b=uFWfZI+mbGl+K+cfoIY550hhyZBmzN1/GqFLhEiCvfI9fbcH4NiIYHzSLfekwyNUCDeN
	 FeoSgXeIyCEGH0mZJP3hjRzxhR7a9fEPZFbwAdHOeJ7OpMMrQm3ni8B76WAAULM8IQCQr
	 oePSTYSqx54sK4eM/hPkq5tI2HcFvpAX2DUM0sk9WZp0ZPN9xaQ4RF/tepB4O8qAd8cZ1
	 FpXz1Z2sRsllvGoW+Y9jra1dZBTIN32X1DlKh6ijhlfHvMu0gGHRgPzKTKG6t0StOCwBO
	 SY2llfqONdTkN1BBXwLVB09H0+F9NzNb+82BWQ0I5iIc7IGU8ESGtLlz4i6P48DzE8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=SVbBJIE0UBMoZDDXFUbCowdBxaKmTm3xtl/vwOrYCpo=;
	b=URhRSsCbDouXTPvPfwfc9A9lyZ9LM7+7tkFJwINMf7DOuonUGSOXOadkYtHLuCHDCFl5
	 PxJubXyit8xXv8Vqa6MCr5TLTPvFBJHnfYOxSVMa1mGOq5hOcGAmmblMrh8+Jtw4NxrAb
	 dZ8OEI6k7idiLeY/PcNSfxKMT+pLB+GWmqgcNUkleh9Xon44v+gcigPEFGUuPb1pymEDT
	 W2HQxh8RqXU52EVIFMIdvE7e37OHQjMZ7pW957zwYpYMc2g5bB7Jh/FQuqtZGZzoPINQG
	 ETrod5P4ldFOhmoX/uDg2WYe/MrgaOynSwPRZGE8U4lsZdR9Lg48h+bH4EnVVErgWDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=juy0Ini1;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83853606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83853606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=juy0Ini1
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso1606983f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864266; x=1795469066; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SVbBJIE0UBMoZDDXFUbCowdBxaKmTm3xtl/vwOrYCpo=;
        b=juy0Ini1YCCl1DbqXHd9Am/uDxlGe4PFtG8GyDtQM8Yy9fqEcKuyZCICFaQv0iQXET
         MyHh/WhuPMcqOVXnKk6qJ5TVHBCO6xMMlTCnVGdITFJg/lS6vQxgH4lg4cUp4p1GlYVp
         ihdw0RrKSjzIDIyOO9eGusBtzL5aQg7+n5GXl8R2HMOHo2eK3o6Rv3NtsX0+QTf4q3Zf
         TAG6JVMp2Lv9ACtz5tf4kIQq88jSD5E/bAGRX+s4McU+XiYW8lBnBr11zLMsfD4SKCG+
         P8+tiYvPyyQZKtBEZMVxF+5ox7ZrVBsXl6rDYZMikOONvIAriDSdYHGbAeZmUTjk9vOf
         VeWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864266; x=1795469066;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SVbBJIE0UBMoZDDXFUbCowdBxaKmTm3xtl/vwOrYCpo=;
        b=xJNt8NYKD6hFDjDDvEfrxO/2tnafn9MEiD2TiY32qdqupUC8v+nn17XjquFW6Wg62A
         p8P9QUdWtBBJCgEDgZM6BZewxhr2SbskkcmDXEZbW+n2HGcBFXTd+ETfKjjIm9qBUN1B
         xzwqOR0xPWaQHrjfd24HY/LFE5ItSNR/5A/v62q7IGC5vOoluWuYvos7BZqHwcz6TOSD
         Y6EgkWLVN1eGDrNW4fApoyuqdIP/MfMltWsuAHjKwvBjnU4RAUFkoFsvR8qDncyulCiM
         9nKMxUAzrZkAbVdYOIrB7XgObB2S0+qZZ1NoDucuyGgwC9eLZ+K5aIjSeub04NITkJvQ
         cHsQ==
X-Forwarded-Encrypted: i=1; AL+hErEWf+C69Ms1OzwFc4iC2EJjk5AlJN7buyhnDETbeocRE2/RDEgUYB3fL5hsSNF6fpz2OHwaweHfX+txU04=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QvLr8vDl39HOMO2OLkjpNiaQxFH7PZzgMoovGDkEARCEFSiWn
	OwIbyNr3N2a+wEf9ISbVQbLlAMVIh9Ae9GD0qlxRevwpt1ZqeQ6QYguU
X-Gm-Gg: AZFdTZdmcrR+o5yycks42xHiKVqn3HGUjkgPjYoMaoitmrfe5nF4BV7pGnyF3v8ifvA
	YVRFSzzaV9FuSa6YTP75zGdH4Z5D1dPPtMF+SzhkoK5cHHESxUsu8X+hnTrQ8699y5LLp471SKe
	NSDkLBUyC/AVNSFtrwERmxitwm+CHLC/VHmi5ojy2aIInLRUWSydmRmJcA3wr2j9Hky6mJlu9tA
	zil4rg7BYg0HGPkvFDJZ8UZbk2fcIdpQMbM+dIF6nuHxdSlNPSe2uVNnbMb03fTkG3+Ka3G8BJr
	CxfCAFeCoi69CKruQFbCSBek/+kKZFIgOFtofFoM/4MlZG2dTgiMU2aTCESQHqgGF2M3575UYS6
	pWfFXGb4Ywt3Vve2zwzLJzHCDkzF4YGKAVpkIOmC1VWo4dVrNuQc4UmvsVoVfuP9WARc4Ne4ZVy
	Euo+SmnvnfLdaREH1azjmO1Pzgf77Wg0CDYROFvf59etG9TBnzkfiJq1RpvQITOIkhW/MPCFkp+
	KAmso+D7x0t+GqDm75K/Zh88IAX4eR0AL9X/JK4yUeq2rDFh7e/gRgds5opV8XJ3nPMSIFg4an+
	jDhZPeieWACWDny9/IpwbQI+w8aKPBv8C9NMyXtW
X-Received: by 2002:a05:6000:41d7:b0:492:b5d9:f627 with SMTP id ffacd0b85a97d-49c7353c794mr23553821f8f.46.1794864266042;
        Mon, 16 Nov 2026 13:24:26 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a2f61c0989sm2414728f8f.48.2026.11.16.13.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:24:24 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH v2 0/5] Add RPMh and global clock controller support for
 Qualcomm Halliday (SXR2250P)
Date: Mon, 16 Nov 2026 21:24:18 +0000
Message-Id: <20261116-halliday-clk-v2-0-28208928da36@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAIJ0+2oC/1WNyw6CMBBFf4XM2pq2KAFX/odh0ccAowVMi0RC+
 u8WjAuXJzn33BUCesIAl2wFjzMFGocE8pCB6dTQIiObGCSXhRC8ZJ1yjqxamHEPlhdSVLw5NWd
 rIU2eHht677lb/eXw0nc009bYjI7CNPpl/5vF5v3S1X96FowzyU2uVamRa3tte0XuaMYe6hjjB
 xff0P66AAAA
X-Change-ID: 20261108-halliday-clk-362190f4f5dd
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864262; l=2616;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=1wKNlxbUO05hN5xuomY/VWb202BKFBlZseityHzBS6g=;
 b=QLeMRLS3lJhKq/slwW2g7GS+lXLf7jP40aImaALzbPkpD1trwZ+XOVRhn6iAC4ieIOkTp5e6j
 v7kaITBUy8mAfz7eyrfabPUk1zp5iwyVBaDR5tE9u/x4K+DSeNrTXCG
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the RPMh clocks and the Global Clock Controller of the Qualcomm
Halliday SoC.

The GCC has the clkref_en gates on the outputs of the QREF block, whose
supplies are shared with the UFS PHY. Patch 4 lets drivers built on
qcom_cc_desc register clk_ref clocks next to their other clocks, so
that the GCC can vote for those supplies.

Halliday (SXR2250P / Snapdragon XR2+ Gen 2) is the SoC in the Samsung
Galaxy XR headset. The DT changes follow in a separate series.

The series is based on v7.4-rc1, like clk-for-7.5. Patch 4 conflicts
with commit 4dd10fbbeb9c ("treewide: Convert devm_kmalloc() family to
the devm_kmalloc_obj() family") in v7.4-rc2, which touches
qcom_clk_ref_register(): the resolution is to take that function from
this series.

This work was made together with Claude, ChatGPT and Gemini.
Reviewed and tested on my Galaxy XR.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
Changes in v2:
- common: Return a NULL clock, not -EINVAL, for a protected clk_ref
  with an ID above the last regmap clock (Sashiko)
- common, clk-ref: Use devm_kzalloc_obj() and devm_kzalloc_objs() for
  the clk_ref allocations
- gcc-halliday: Reuse the wrap0 S0 frequency table for wrap1 S0/S1
  (Sashiko)
- Link to v1: https://patch.msgid.link/20261109-halliday-clk-v1-0-20c3ba8be0bd@gmail.com

---
Stanislav Aleksandrov (5):
      dt-bindings: clock: qcom: document the Halliday RPMh Clock Controller
      clk: qcom: rpmh: Add support for RPMh clocks on Halliday
      dt-bindings: clock: qcom: document the Halliday Global Clock Controller
      clk: qcom: common: Register clk_ref clocks from qcom_cc_desc
      clk: qcom: Add support for Global clock controller on Halliday

 .../bindings/clock/qcom,halliday-gcc.yaml          |   84 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 drivers/clk/qcom/Kconfig                           |   11 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-ref.c                         |   90 +-
 drivers/clk/qcom/clk-rpmh.c                        |   22 +
 drivers/clk/qcom/common.c                          |   68 +-
 drivers/clk/qcom/common.h                          |    9 +
 drivers/clk/qcom/gcc-halliday.c                    | 3533 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,halliday-gcc.h      |  249 ++
 10 files changed, 4016 insertions(+), 52 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-halliday-clk-362190f4f5dd

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

