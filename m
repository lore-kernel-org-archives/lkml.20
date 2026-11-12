Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794486248;
	b=FlhXLZcYCWl51NgVegF34f7npTB8txag02KpjW0Cm718RXQZFDMfNBIocS1WCyY5mTBE
	 82g7Qs0qpWJErLX8BJke+F928FMIqXHUL6DD/7tvwAnKkEvlPXA95kwGg9H/0lLW9H82W
	 wF++3aL2HWEcX5nMB0b4tdYZUvAJJw3JWQdvUuwTQx0EBVDF4qxT+FbwX8ExismBzo5z9
	 LE0evVP4GEuDdEBHj0KXRhC+nUz+PPxwUyrxb/WhgvZLEPwzbqkP8LOrRHBVcS2i7t21n
	 E1XnvxkKRn2XlI6ZXut5+vOI6tMfAa+sF0/Hlf+jQhzukjLGHJPnuNOG6wCknJ8phqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794486248;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=6jjbM3FM0vEh41D6tTAiBxzcbzcUKnDu2QUW56tX9Ug=;
	b=336AbVPpbcz9ksYxQE5CgvxAtF5UGZjfL1V1V1so7Tdl1/eJhALAXzTy8Zs0ErSjzPaA
	 EdS/Bf8EQSN6vOZjcWk7xD80sjv+1WavJ91ANNV13qzYW9rGG6xp+E3rn74jzjvGJRtU0
	 AEPB1FrQqqjIt6um9EKUrg7roHej5OyXIELl8o1Tf7OwpxyPdrTl3hSObfYtQBKlxqqSC
	 ULlTo/9YQKUGeP+Gdw9vwCIflj1l2MVMLHP6iOKSWSfemv/FpvLdj58XDPbxjXbDgJ5aC
	 SbAFgH/v/sjrqdrtrgXU9jccEBDLaJK5WYRqjylhJxnjmMJ6moG7JZ7k4LTW9OzthVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=02Ee+baK;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36315606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36315606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=02Ee+baK
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so5162404a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794486247; x=1795091047; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6jjbM3FM0vEh41D6tTAiBxzcbzcUKnDu2QUW56tX9Ug=;
        b=02Ee+baK1h1XUD6WO/nascEjWrwiuWrZ9E9j2MFQcrZI5K14rA7YSabQFZqCFSvC3N
         ikyw7KKQgOI1ld3nNdFDTDd5OmzNRUttM1oIZghE0ToKxHlOE17aLobyJRitiIoejqNG
         SX3XX8oHBl/GOFBVpjPgVTxjDbSle/WjdqOh3U8OGGI/2vZzio5/iVz5eAVVsJpDRnvM
         eyx92Iw2Ybw9Da1/5/WmCEY9yES7r+L+75EybPosobSiFFqEC9MOqcLtX8lqUVwiDxVi
         4V//JpLYWXeWE0e02nucAt510hEbI43eS7S3Xlwp/s0W1fjuv1UYI6ioe2Sj6ehZ70DD
         nZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794486247; x=1795091047;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6jjbM3FM0vEh41D6tTAiBxzcbzcUKnDu2QUW56tX9Ug=;
        b=ybEZCLwwdnaQ2eTL3IRf4Uc1gJvf10ffqTP1J/zpGkAK6WWleC/NjMOwzJHEh1x52S
         7xg62xPjGZ5Q173ObjD//J85gB85iZG8aqR/quIUKsbKsNiW1NOP7jMe8G7p3SVtFWWF
         9Yg1TIBZjaDweCT2W4Xdy9QchmES8XPThAy/sX9BBejIBDCIlj+QrzH+ClssWCdJEeMX
         d0XRJasskbvxNLDjxDakW5HjZduNFrIvL3JtPBhKTzFM5HgzuaykIFGzA0hs9fKW2/QE
         1ydRcYIDurZoEyqX0rFv7HfUHu6+FFx2epQNUAvJtkEQPfO+1uCvNka5vu46YCu0RRZV
         RoKA==
X-Forwarded-Encrypted: i=1; AL+hErGdTFDiyQa7e9GnakSiBJwD7FOTGQFVydhXLKhpQr6gM2YNijERHUU+5AysAREdLEdRPwpGFd2JuTLGfIA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZK7kcXAUU0RHbSfunmGhHiGPYAljqbJ0ViQn/Ga3cDKYdwKa9
	JmkdHllA+zFo8Ke7K8Q0+wJwZlwx1lF2a76cQ8zLMcF71twOa3nf9N4T
X-Gm-Gg: AYBFou3b16puonFyqPB6Tg4axt4F8wtwrVCLAnamrf7Yg3R/HjE6IqNspmBbhMC5zYc
	OB96lD3ZM2z4wrb1c1H/E/8i/Pupdg85Rk3AWPkEVTaomG79w9wpdGnlndjXpjgdM55XIbfrIT+
	9Ex1dDjq/5IK7kfU7FDH/eMRR+d1YE/zPwa1Kt9oBuS6ME/4kjydMHJYD6MLHlpNC7AfHNtCTAo
	igB53Pj4TwJ5LVefOR75X1uFG77JH1L1kuGdyzud2a1TTiqL5KQaKcQS7q8RR+2zZEcPB+uYobg
	aVhg+6R0vkLQerlDVZUWWlP5AhojBo7EkU+M8reI4jU4jSI+dQ5FLM9P+WRQLmBs5E+GZFGDWEG
	YdAtTgXWBOvTflhDG6cA1wjyRGqVAeAtvRSdvfAkzJUpVeD3YWc6bZWnrlMBfI8ORD72vUuuOry
	3nwCDqP6PK4uyHkaI6YkhMe6CJ+8Ic90blGtzT7NPrk4eCpChUW97ohGt/tx3jUqCNIF5dg3yH1
	5D2plPIw62kCrAUnMP0llliE42y2C+h74ZZaYy309Ic3W5fpT4fm+HuTLKkDgpDVBUf24lolpCb
	i3UmVvSM57/iZPCT3Kxgkvpz5dO/qspzVJJPAoyu
X-Received: by 2002:aa7:da59:0:b0:6b3:b10c:40f9 with SMTP id 4fb4d7f45d1cf-6b77770232emr3279335a12.31.1794486246730;
        Thu, 12 Nov 2026 04:24:06 -0800 (PST)
Received: from crispy-cucumber.local ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b77918d094sm1835931a12.26.2026.11.12.04.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:24:06 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH 0/2] arm64: dts: qcom: sc7180: enable GPI DMA
Date: Thu, 12 Nov 2026 14:23:21 +0200
Message-Id: <20261112-sc7180-gpi-dma-v1-0-2a8eceb49563@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5EQBCF4atIrVWiSTSuIhatulCTDNLFZBJxd
 423+xbvP0A5CCs0yQGBf6KyzBEmTYAmN4+M4qMhz/LSxKGSNVWG4yrovw6dtXVZ+JoNEcTTGni
 Q/xNsu9e69x+m7a7AeV78i3zncgAAAA==
X-Change-ID: 20261111-sc7180-gpi-dma-a77963d9e1cc
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Erikas Bitovtas <xerikasxx@gmail.com>, Vitalii Skorkin <nikroksm@mail.ru>
X-Mailer: b4 0.15.2

Enable GPI DMA controller for SC7180 SoC. This can be used to
make access to I2C, SPI and UART peripherals faster.

Tested on Samsung Galaxy A72 on an I2C peripheral, in particular the
Samsung S3NRN4V NFC module located in i2c0 0x27. The peripheral driver
is not upstream yet, submission can be found here:
https://lore.kernel.org/all/20260811220135.472380-1-jorijnvdgraaf@catcrafts.net/

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
Erikas Bitovtas (1):
      dt-bindings: dma: qcom-gpi: add SC7180 GPI DMA

Vitalii Skorkin (1):
      arm64: dts: qcom: sc7180: Add GPI DMA

 .../devicetree/bindings/dma/qcom,gpi.yaml          |   1 +
 arch/arm64/boot/dts/qcom/sc7180.dtsi               | 101 +++++++++++++++++++++
 2 files changed, 102 insertions(+)
---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20261111-sc7180-gpi-dma-a77963d9e1cc

Best regards,
--  
Erikas Bitovtas <xerikasxx@gmail.com>

