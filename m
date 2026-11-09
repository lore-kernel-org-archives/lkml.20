Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184126;
	b=ZeP+QNVo17VCKK2CfsfBxcUAc1hSBGrGx0A1VAbbQeZYUMHCu7hq4ogX4nn7427SmZmz
	 IEWjvrSncL9KG38lPGhxMhFG1vQSIHPCszW1eus07UBr6ZngDfxAmJJNbvJlKjUPFiOYr
	 s/bB21OMHiOfkX7wui7rx84abh+SoYAeU8tj5UCuxVrmet+CAT2C/ic5n3pNBjr26URjJ
	 d4w+U6Kvy0zLzYWhEeTOwUL0z2QYrdZq6+f1H7bmrebdWybaAvpRxSZIigkrf2zlYVm1O
	 atJS5GGn64nQyV9H98OLTlOqeZ01ZHQC/T24XPvi67RFTz6T0MLu5NvvbN6q/32OhjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=QW2ef/pirA2PTk8MffTe4SexcZzxaH9iewQRAz0ZFis=;
	b=mAIwFDnv/CJEm7KHPVXMt3gpD5+zIqgFon5vNC02XZneWJbCjMaL4fx9hq0DVID6hROx
	 4WDDdlBCvfjpA+volR4AXEM6mJnqOXxuU1ArkwmdWDFIR2ayCqDVNUfMYCYW8S+LbzxDk
	 Jn/V8/5aVJDv2DyCj6A4HKcdocGVSfCMd0luykg3ArZpI3Cq/qLgsxJZC0lMMpe2tN32k
	 Xcyo3mCkSSRFzTJH8zFHNqtj6thI6m2ArIaFmxtN7YVVgTQ/EtnUtCKC+tysrJJNqYFkJ
	 G2IkEW2GzRFkxb5Is4fqDBRi7zKhrLL7wOvj4Lv702q9DY/SYgSBQlzBUOGdTD/dHWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hl9YKQ3L;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E908606A330
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 00:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E908606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hl9YKQ3L
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4919a880834so164008f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 16:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184124; x=1794788924; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QW2ef/pirA2PTk8MffTe4SexcZzxaH9iewQRAz0ZFis=;
        b=Hl9YKQ3LPiAC1ak3hn+x4wYzGK7CwQBDypqxM0waL3/tJ/CPZdBZMZ/dNnSpy4WV8O
         HwxFkxDdSfjNtTEn94py7bp0bjENVagTy/CNktLzJUV3VO4/OPdT9IVuX7cxL2ZkiT0r
         xZE+FUalw7uaXwXwQSPXf5MdzMB8wU8lSEa7hP5SCUF/B7+mZ/DE1XXs4eSXQG+wbXaM
         p8Oxx3gp3UCpY9o5A1muMPhR08MBwbPnAc2XsmjrrafUr8GtYNvWz0uAecM41tBVlYDb
         EY5m6RWqkH1NarycP0gRkVZ+z0cSbYw2XWg+H5oIiJH4q3JOnmM7aa5sHDikgms+Arm7
         OJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184124; x=1794788924;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QW2ef/pirA2PTk8MffTe4SexcZzxaH9iewQRAz0ZFis=;
        b=jTtiNhursHB7JOKI8UxsguMkhLdt9g7UKB4mjO8hCSBsHov4pQQBRKxHNAHey3JuA/
         rulasdE2C2T5RyztfQUAfSRAnAOfbnNmPcyu4z5ggX44+JSVa4UhpAOc1jFYjIOp4XTo
         q93Kbp1QOtz6Ce2HNl9YoVadOoVOKpMUMFYP9c75URlGBn+igXS/QuSPlGoZ3aA3GVJ7
         Tv4Jxyf1iIJh9OGC9Tz+qOCJgmPODI08smmKvPhwpqEcuoimsw4s8SfRAtdd+/O5IlQX
         SvUk2vosmwoO8jHEbsWl9e/iL3CbM6unuYRJbKYA4JT7JHxtevy08mzDOFXgOlCQU2nV
         pu2A==
X-Forwarded-Encrypted: i=1; AL+hErGdgqPnaaLgv8y6IAYQSCInY8927FB1heeRYmTRLZ4Lm2oalG6tlMZ3N68ENamBMjzr7/K0yTumwXKEWbM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8d88SFQknlafExHbtKJeN2Sei54fw03DLFy0HoP26XGxEWocSV
	yStMq53cK0+kVh213ZPfpgb15q0TmaIDmJJ/Y1EMUjnS+cA09ugy8Z/vLPtbPGqc3J0=
X-Gm-Gg: AYBFou2FOLGJGnIPLsLZnSQQgujuAm+zSKoTb/83PnZenOHNTg4twgbJOdMkwUyT60W
	zN9OKjCN85u9rUBmF8XqgJBxHowISZigB0d629jdEoaTcypsGrcZBoN7yJqxFm7+3HH9+4+oK0f
	W92pRnYC3VKOU/wGtkGmd+PImdefMZy5gws+ii5b9468Zz4npT54b/h8/W6vFDR1Uom4zpF1vuO
	N0mAtx2vzeXf9bDsz9dFGNm8th8adDgcH3qxfwJ4DFyyNy60OtQBA9bAUwC9YE+idlI1Ibz/UhO
	Dd8cmhagkW3krqgJxH68emYkOl3N6VLEwTU1524OC95KLU3snum5PLlU3H7LZmFAZgR8MnWKR/V
	D6mSsSuHv50eWs5uDf1RYZes73uNgnJpQ5F3h0x6ZDJapq+LUSuIv+73qMjCic/ADRVJfiQxD9u
	gx7uHlcjRJLbs3IeujWG2JcQxbcLH1bCFHpTYl056lezTVbA02QfkiYpPx3tq0VTExJKc2WCsNp
	P77icD99HYMtybjt6yrt1XUzcVqpud6iDtch7ehgA/DdrVNBDZum6tMJUKwfACgIpcDvou/xRt6
	iujacWQzvNByQjWlRgKnJw5RvBJdLCvfGSIP4glp4+DRXpPUqNjHrWlbULGXwQ==
X-Received: by 2002:a5d:5f51:0:b0:48f:bcdf:6f68 with SMTP id ffacd0b85a97d-49589867ad3mr4694876f8f.37.1794184124022;
        Sun, 08 Nov 2026 16:28:44 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49673b94dc1sm2688388f8f.16.2026.11.08.16.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:28:42 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH 0/2] Add pinctrl driver for Qualcomm Halliday (SXR2250P)
Date: Mon, 09 Nov 2026 00:28:36 +0000
Message-Id: <20261109-halliday-tlmm-v1-0-a181d54214cd@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIALQT8WoC/yXMyw5AMBCF4VeRWWvS1jVeRSyKwUhd0pYQ8e6K5
 ZeT819g0RBaKIILDO5kaZk9RBhAM6i5R0atN0guUyF4zgalNbXqZE5PE+tkwqMs9gty8J/VYEf
 H1yur33arR2zcG4H7fgCD5MbGcQAAAA==
X-Change-ID: 20261108-halliday-tlmm-f250374110e0
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184120; l=1085;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=Sh78VNHMNROB3r4emRNABR7lWHBZToMwYlli1bwKY4I=;
 b=/DV44UnGt8sgl2eNOLqbZMptCZUi5sxdpNvdt6ndlPLFxWToXTFFFhDVgnkngnv9IdEOvTtlV
 ERnbOCYssFTBDf/BTxvGxy9MTa5fGhdJG9Uq3vUsddO1tW0ylQq+5WU
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

This series adds the devicetree bindings and pinctrl/GPIO driver for the
Top-Level Mode Multiplexer (TLMM) on the Qualcomm Halliday (SXR2250P /
Snapdragon XR2+ Gen 2) SoC.

This is part of the initial bring-up effort for Qualcomm Halliday
and Samsung Galaxy XR.

This work was made together with Claude, ChatGPT and Gemini.
Reviewed and tested on my Galaxy XR.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
Stanislav Aleksandrov (2):
      dt-bindings: pinctrl: document the Halliday Top Level Mode Multiplexer
      pinctrl: qcom: Add Halliday pinctrl driver

 .../bindings/pinctrl/qcom,halliday-tlmm.yaml       |  146 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-halliday.c            | 1825 ++++++++++++++++++++
 4 files changed, 1982 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-halliday-tlmm-f250374110e0

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

