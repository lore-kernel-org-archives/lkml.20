Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638229;
	b=4ZBvvctultLZrPooaKtcPMqNHdIJ6KntbFG8omxpp3QPUwDQaFXqKMME1od6PXpD6Ela
	 NvT2AJjRYZttqbtPMeLsw2Pyn/ruZYl3sUISlkq6yVpgGchBWiDGXyOoEtyetwsYHP2PW
	 868xds0psCKUgrueN+w2nX0CGfJPd6MtfQ4jfXH3F4uFr9ZZkIB9bYJxQw+yAqyG+j3Ij
	 bcsF68LInYktztE/LiLATZvJgdrJwoIfKjrfmRlI/vxGAo0atB8Nae5Qu8zxWdMKn+yOZ
	 43YeDJXvk1tT5aoepXCrwAUROHFgAfe7JlyIznDXdQG34SyqxJ0hCzbdEvy4gKQ0R+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=zM3VpGqk066yvlDhCbkoqjg4/pybiKa+o08CKjiTZQA=;
	b=G2iOedTX6endxAxPu9nuWARLNqwiNB6rO5lEd3nrri6TEUTqN+ycJ+AB8L99cFxbklsY
	 e7bvnThfQrur/z5Mn03iq8BFmuwNbw87NL046obrxMtUvDKSFU9TzfY5bxmiBiQaS4UWh
	 qeAClvFqMdFYaXj79GEf+0g1S/p34f2MI5d6wcluWxMf9p3ewjdkQZkta6YkyhQc9EKXW
	 kJCTNrj6VciSrUO2z7t2109xYL2pu3/xwL4IioHCGnR00KZAVryPsJpWbuZ9bN3m3jrCM
	 cNHE5acLJHU2JfUuvSll5tdkQz8RQfUce4e6Qambeoy1hTr77PnZxdA72YVMuwEJflQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=axf0tRDt;
	arc=none smtp.remote-ip=74.125.231.138
Received: from mail-oo2-f10.google.com (mail-oo2-f10.google.com [74.125.231.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F2E606E029
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02F2E606E029
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=axf0tRDt
Received: by mail-oo2-f10.google.com with SMTP id 006d021491bc7-6f9b24c99b6so1191799eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793638228; x=1794243028; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zM3VpGqk066yvlDhCbkoqjg4/pybiKa+o08CKjiTZQA=;
        b=axf0tRDt0sMe6i07s+o9nbmWLTaguaMwSKVokW31n0d4S44IyWwqnemb4fMw+96zgv
         s3fuY7SPEAHWyxhMngDS9+Xr05yqpnVBw8DhH330WDvE1If13zhPnSMq75dWMkvoONG6
         pNNHOJh4y9Yc63IaaJD0uPtPgZnPMhVLehoIwsiHwtNmWt3T+1JN3s8DcU3YbcBI1coW
         q/lYbyyhwKxlNYhn3tiXRLUEJ+WtnTCx44uNlWY/ZC5YZCSsMRmc/nJXFAPOWNjJE4Yn
         c8nav11dQ+OVjkH3uXcvlTzoi+8jQ+pjUQbseqdsTc37HGWgx4iyzvpWuBqoLMGuHxbP
         joQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638228; x=1794243028;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zM3VpGqk066yvlDhCbkoqjg4/pybiKa+o08CKjiTZQA=;
        b=hq8j/BuP/8j6O400jU8PVTrcXWQ0a5+7jixB5X2g9/cavNJHlLGZlv2gBbX7gQy2C3
         8Qtb1PuI00GiPJ108I6LkljvHxuRxuESj2YFhzo7KgTebs6jH/apSZfIPEZ6OeEBqg5u
         fWUmID1w/mM6cYE/Lq7FQ6japUt72uP+ElZh7kS5wF0N7vuBLSyuOMNYUF/dDA3OAQz8
         SrmpjyIDOEGGgFdwurmhJ0LrcvOOYfPz7OeoGz9Cfy3vM8rDsA3U1ewsFucDdIEV4Vm5
         e4uk85KaCWVNIPcWMjcFj1ZCGXpUqWPGgV0tUcjBbmGhpAxgT1/wc9HyDb1Deuap/jlk
         3/dw==
X-Forwarded-Encrypted: i=1; AKwUvBzhbQjhNQX0eToPJZKc0SbRH1lHmMTvR41wLhvFr0DF6p5B/rEG6ma43LyLW6YlbrpfPEVLCJF8+1lnGfU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuJSuFLSElaeMTMzqyGlYrecJVhhgW4rQg39mi3ZKB1fczKvuE
	rs4eHjZpw/awEaZjP3oiq49jnDgwjfzskQq+akwaGkI5+CSOlUp63WBD
X-Gm-Gg: AYBFou2bJW9qUJGhniO3g2Jm2mJDP2oIqnG+fq3QuCH4lkP1G61alo/0fWS64Ut3bot
	B2nIq3QOu+jJKNKzONSMwqwpPZmn2Cv9NC1mrOwKsg498OXA6UrcdGH/qw8Venk9hsxF817u5Pz
	miOIT1CYR5U/Jz5fFLHQnFWUkJhDeiss3bk0fAYtuT8B1GDQFq+Dyo8ntL7vik3Ba6s0HtkPtC8
	TGikhmxcKC1oRKt3xgTKlCTOx+uNoXGQXuvL+/S34WlCC5h3PYet7qltNtTVzFpmEvAP3nyl9ac
	2OaLXevFbS9EHvtAay3Ct7KbHMjSB8b4Aysm5ttcQRbJgvrGjPEQ5idSpXGuWnYXS2Dpd6B86Lu
	OFIjbCRqHmsY+gTzmWINaLsJIUdU+Lm9O87ViZ94JCI9eNcYElEso8Vz4gnRkWseq/TCriZH/Nq
	/d9ksbHntKXdAB2P1HbnQe6J++SCLTAmyPoIHoAvACxXGhU2WCnur/6MbAzOcCN3gsYkWOuJwjO
	CTx56AAu3C2I9mxFAmlAxqglQl4yECtNTBPplwDPvNvMDP1EJKgXmq0HPgqsV/Lbv6sTRYyL44N
	JaBYuQc9iNVJXqKDwoTJ6LR8Z9zMeGZ2C7bGMl1GNbYgBSvszfe7sgfryoctOuL8DGTE9WHegVJ
	UEfAa22O3XlfsyAIAmuQ=
X-Received: by 2002:a05:6830:4105:b0:7df:5fc:3fd5 with SMTP id 46e09a7af769-85d362dff0bmr7694825a34.1.1793638227841;
        Mon, 02 Nov 2026 08:50:27 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354985cdsm9936779a34.10.2026.11.02.08.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:50:27 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH v2 0/2] rtc: mt6397: provide the RTC's 32 kHz output as a
 clock
Date: Mon, 02 Nov 2026 10:50:20 -0600
Message-Id: <20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-0-19ca72815374@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/43NSw6CMBAA0Ks0s2ZMP1I+K+9hWNRSYKIF0haiE
 u5uxAu4fZu3QXSBXISabRDcSpGmEWomMwZ2MGPvkFqoGUguteDyjOEWFodxcW9c5piCM57GHn3
 SqiowJItK3pEbYYXutFKlgozBHFxHz+O5NhmDgWKawutoV/HV3yC4+HNYBXKsirzsVNkWPFeX3
 ht6nOzkodn3/QO0HV2M2gAAAA==
X-Change-ID: 20261024-rbrue-suez-upstreaming-mt6397-rtc-32k-0a1c16f63383
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eddie Huang <eddie.huang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rtc@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793638226; l=2364;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=ZOmLqEV8DHWh2DzcDPWX0yn3ibXvLVXOQgGwZxT1ZLU=;
 b=EYIi/kP66XwXIMwPN4Sc/iR0MoBldI6Gl1SwMDFNh6FS6aWjtblle3rpmua61fZlG25Jv2kBd
 XNlFeUApXDTAnJpLQ4whIOSoDkCLs66sO0N9UcNyu4N9A7PTHVFlJuw
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The MT6397 RTC drives a 32 kHz clock out of the PMIC, which boards use as
the sleep clock of a Wi-Fi/Bluetooth combo chip. RTC_CON.F32KOB gates it,
and mainline never touches that bit, so the chip only works if the
bootloader happened to turn the output on.

On the Amazon Fire HD 10 (2017), which can boot through U-Boot instead of
the vendor's LK, nothing sets it in the former - the bit is set at every
boot, and the MT6630 combo chip's Wi-Fi and Bluetooth never come up.
Letting the RTC provide the output as a clock lets the chip's
mmc-pwrseq-simple enable it. With the clock wired up both came up on that
board in two boots out of two, and in none of three without it.

The driver registers the clock only when the RTC node has #clock-cells,
so no existing board changes. The MT6323 shares the MT6397's driver data
and gets it too; every MediaTek PMIC RTC whose registers I could read has
F32KOB at bit 5 of RTC_CON, but for the MT6323 that is inferred from the
shared driver data rather than read from a datasheet.

Both patches apply on top of the RTC nvmem layout pair, new in
v7.4-rc1. That pair went through both rtc and mfd, so I'd suggest these
two go through rtc only, with Lee's ack on patch 1, if that works for
everyone.

The board's devicetree that uses the clock is not upstream yet and follows
separately.

This series was developed with the help of an LLM.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Changes in v2:
- rtc: check for #clock-cells before reading the driver data, which is
  NULL when the PMIC has no RTC node, as on mt8173-evb (Sashiko)
- dt-bindings: add Krzysztof's Reviewed-by
- Link to v1: https://lore.kernel.org/r/20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-0-9758f38d7053@gmail.com

---
Ryan Brue (2):
      dt-bindings: mfd: mediatek: mt6397: describe the RTC's 32 kHz output
      rtc: mt6397: provide the 32 kHz output as a clock

 .../devicetree/bindings/mfd/mediatek,mt6397.yaml   |  6 ++
 drivers/rtc/rtc-mt6397.c                           | 85 ++++++++++++++++++++++
 include/linux/mfd/mt6397/rtc.h                     |  6 ++
 3 files changed, 97 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261024-rbrue-suez-upstreaming-mt6397-rtc-32k-0a1c16f63383

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>

