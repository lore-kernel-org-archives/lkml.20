Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792817296;
	b=FHEiccodwM76rB6+zD3X/8v3E5gtknYuPnsO8Y0bdrnZb4ZnDPctCZjVkB+GdJT1+z5X
	 YTUXJqjTBSjQheGT6zhHzDEsIpdRJNQU6qhwNo0vGC/qE3A68WGv0OvgwUVA0T2UeHc3z
	 6RtNY/CrIX+4v3JNIP3JErtPx6HlU9thbaXcwgl78+sMsZCBlKhOfTrenZz8EF5zFvfFO
	 YFhTu1aH0MYJdnODcHXPqANiFk2QOMfuXQ9wD3NF+6kGUe0DQtPh5dC503rdIMqjnZU9B
	 eioez65Dcz5n4mURgUV1SKl3nwxf8Ee4EZDxL9hL9xU+Z1U1PO7NlmBDI0JnpRb6q9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792817296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hLEsygWM6+4H/+RqRuEHadaGd+pRQ2KkZeoK/YR9z1Q=;
	b=DVx2Sgtuobbw9Bzd6Y9u0Qpm3yk7oH477qEM5RWLU6TD3q+7cWeg6W1w4C0qzq4/ntvR
	 i5sBo+Zz/YWeQhDMtXrLfmBvJ4GhE4rkcSHbQxG5XKzNsojsuItOdcveJ7WOmWmvqRRFH
	 F4qxl2vdl4NAaz9ZkB+OJWekKDpODXpacJJMZA4tAjW2gPKLBOx/csb74/tds+fNpKVgf
	 LU761c1IODDTZ9fBI7r9CKJj5r6Zls9PaORJvpmTiMDJ+/pc7NersqE3UJNy5kP7zZtsv
	 e9KqI/+F+PtX4AQ4nd/G3UV3I/yWoivSMGJ4e5h0FFeQmsmlwTwRNDxXqTU+8f/+Z7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bn5HdHFo;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F098B606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 04:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F098B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bn5HdHFo
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-823e4047037so1105791a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 21:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792817295; x=1793422095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hLEsygWM6+4H/+RqRuEHadaGd+pRQ2KkZeoK/YR9z1Q=;
        b=bn5HdHFoht3tPfTohGv771TsC0f2WPm59gfEoeVqoK9EN+61yvh9pXgdDwhlmUAYKy
         ku3Hepd2tRo1Fq5Q7oiTAzmTEMfsid3EOBABukgTAr16DlRlj/ui1VTKVFQMfc9IFMjP
         xrCT0Ek9YwWW9xXLlfjm6hJfrFtsybjhi57keSrGMNV6Ejin6ivL9ffnip0ajxivBs0C
         pccD41tB66oSuQo/dJlEqJ6BiAQkmoqdQ+b9FJGjUCBXEnRSvBQqN9eIWH6NcE6tTbfR
         znT26lvkKnAFYRh4NsKe0xjJ2iWkrzltczFAmtcLjzsE9cP/VoeGtVRbW9lvfjJQcWTz
         hMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792817295; x=1793422095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hLEsygWM6+4H/+RqRuEHadaGd+pRQ2KkZeoK/YR9z1Q=;
        b=OTTNjFqMx4mUtfp4fh2T3Rr9u61sohXFcN27+uHp+oE4G+nx5NqnTGcfLPBRu2W6Mc
         x1tjjPvccHQ4kwAAhGD4aZLAlM6mXe11AJn0mssq+MDF3kkGtZuKmH3ctdCodUsEUHNq
         1xIuii5Oq8HI1UmWWoIsyy6o5LkPclfLgu22SiqzxzMb71VWKrOIoGjuzfOc85dAoIs+
         tCAxB5gc2JpQTZLMTkJnn+UMBupBU4LfrZzqWyxMPFA2kwB1KrhUK5WIKjOrG/gB/k/P
         n4dpyGHTKkxTkkyLaTvq6M1JD4GABBDhZ+XL2hfX+FvT6yYHCfYROWEWEx62/49xP4sI
         oiaA==
X-Forwarded-Encrypted: i=1; AKwUvBwNpYtW3tLK2VpudX2cZwqXSBLhe2+PFR9aoTYOluHSUMUzVvCjnnkSOd4ODJh9BHqWRKQsvdFQX6325vs=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1DFGx2iMNoXr1+v0YEryINvfwBw+Y3etHyCKg2aVh+Vg4SUZD
	E1vvPlftT0CoWN8pEVbiQRpgCUNQAQklAvuiHzB0vbKCwgW+0WvcvGTm
X-Gm-Gg: AYBFou3ezS1mULLuiP0y9xHlFAlLxt8UpP7b0hdnv5Ak2EQFHG90/SJBycNon2nt1wr
	XX1W3vdkMzFfW1PJ5413u09+V1KUmnuebjPhAyyGso30CflqM8ir73lKQszDSTek4JJcjeMQzlM
	CBwD5lBDanrMoIlMTxgQoMhMsLemW7USAavK1nNL+iMj1Z3KLX/o4Tt7YFxdr1ywQMEiXz2CPEk
	KUGv+7K0c5krJDhMiDZIn7bsBNQ7EifqB2Usa80OVpnJ3sYLeeZupZr5JoH8r9qFlD5M4jCMwML
	ig7OYpcBrbZp4Rgy+tVVrYugBnxnjGrHefGLsjjEppfJw5umVXmz1Cjy64Gwb47y0oxfHNZnEI5
	j93mPGr0j7u8hIodDskWXnk8FblonXOe4qqMfPUbj9Ws0RlkK0vk1yaKt7yEvKbp5sZP0AKifnz
	9WnFN4dzR03Icnt5locLdu6UV0envOu2Aeq7qCiMo05OReBi+xSauMTQTKaNL7aQns0wM0ro/Gs
	phAYmcx3CJnN8N3kMMBNwL4MJ60QNVLc61XzeKMyEQqqDBxBtrwNS49pnm8akNrqKnP056PQXq2
	G7q3
X-Received: by 2002:a05:6830:4489:b0:7dc:dbe4:3f21 with SMTP id 46e09a7af769-850fb0769cfmr1141196a34.1.1792817294879;
        Fri, 23 Oct 2026 21:48:14 -0700 (PDT)
Received: from jeffmr (63-152-17-145.cdrr.qwest.net. [63.152.17.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb0749dcsm1331577a34.11.2026.10.23.21.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 21:48:14 -0700 (PDT)
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
Subject: [PATCH 0/2] arm64: dts: qcom: Add HP OmniBook X 16-cp1
Date: Fri, 23 Oct 2026 23:46:48 -0500
Message-ID: <20261024044650.9936-1-jeff.roach0@gmail.com>
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

Earlier bring-up report: [3]

[1] https://lore.kernel.org/all/20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com/
[3] https://lore.kernel.org/all/CAAnD8Rb4ZZrHFWMJayabioB_8bOHh1mqZ5LCXZz0jTNGMA7UZQ@mail.gmail.com/

Jeff Roach (2):
  dt-bindings: arm: qcom: Add HP OmniBook X 16-cp1
  arm64: dts: qcom: Add HP OmniBook X 16-cp1

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/mahua-hp-omnibook-x16.dts   | 840 ++++++++++++++++++
 3 files changed, 842 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/mahua-hp-omnibook-x16.dts


base-commit: f5672a3dff0291d6a45eb0c258b9d2baeb4dc577
-- 
2.55.0

