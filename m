Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639935;
	b=F1GgUtHx6EnA9fLdj9gGZSSnMPxUHB8z/oP9cZ60lP8JSmeUsRTi64zufvbiOFjbB1xE
	 DctOxJ6O9OyPe/FfV1LBkOpNfKCowmHjjoGLdwcjAJBRhsbsf2WxhBa6W1aywIlB++s5n
	 EVl+fjYatAxTNsrQ57CC8iUbZj6pHZsvFCIAIdjTGWwX8LIaTmiRmGJ2jdBYfyCmJBGJE
	 W+IWk9uzvBRP4djr5qshM0FJBKGL2wH92fIWhAYtcy+qFuQ+t6N2ZuUzIELT7nZc9NsQP
	 I42k+lcMWUyZ3mSdM/eY5blq0Z36K8zV0F1vGBxqYnXzU5FrWZraF4lNV3MTzdsZ3KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DDphUJPz2cWD4JwcRyLV0ZDnGyYMJHlTqCBmcqLDAcg=;
	b=ojMM4RWsX2kuxK2Jfhdf26s+WphQV7CzBUerhBqcbJbPn02eCmdCPqWtsnRTLGsMLHEy
	 01716MOW8p7XtNj9hsNQspbVO1J/JAfRsdpWJuLW2D1IqdKErmfKNpWTGm4+lMwluBItA
	 JEJ1bdgTN0kOkdfTHpKuKNECQqdZ/KScxgomRoRSOvao2FxD78XsjMMPshNQYdSZ7aote
	 no4ZJonkshFykPvoV1BJCV8Erwy22OctMfHgxyy7fO9WfF95eLovU/EOWxhDwMFFIuOyf
	 MOkYM2uCglUHKtJjqDP5Do1N33uLjzC8FcmMYClH+EMx0AoVXSB37Ybkl+WBLX3YTqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ivBzNnke;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D036606B0F0
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D036606B0F0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ivBzNnke
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-3678f64d078so5067592eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639934; x=1794244734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DDphUJPz2cWD4JwcRyLV0ZDnGyYMJHlTqCBmcqLDAcg=;
        b=ivBzNnkee6IPxDDv9791ObM8u2k/gzL9kwCDlIly8mdaZrF7lbmj48GlMGMZpunQM4
         FyB9nZzO7IjSwT2sd4fNk9/76avOBZgqtMrITWPKfpZGbsXBkzvrz9leKUJijY4mxvVG
         7/1+dFdnqY5ZAWMSQbFTHsOsda3Kbw47fzOgIi7IZnYIrhzdykhrfc+VLSwhsbeIa9tr
         LLumJjaibLK4uedWelHWPdJJLhx8iwzuBZjr4ARETXpJEA31lkEopWVVCxr2oHbwQeOW
         8S2PR6kTmbXWoMcFRIop/5fb2JD9A9S3mFItniBAITpSO+B3f1jLIpBnrgluedRi9/ZY
         0hEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639934; x=1794244734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DDphUJPz2cWD4JwcRyLV0ZDnGyYMJHlTqCBmcqLDAcg=;
        b=agBQl4UhQiGqnxnxaXt2YxfmQi69ea5GHpvsHFq2Y7Eb6HswvUSeV6jFVd9lpVJC2i
         h/nGAYwQOwD4NaRKIcAuDTat5D9C8lsLm8jVqG21UQgVBdBXth1bGMjTVg7ZkmwfP2Tn
         mMNjQ3RR7SEGEku0lmo5Ldzqo1p1lqaw0zVWbphw2J+3y7dX2vlF75fsS2wYodgfG7pe
         /PicqdlyFVlN+U3UU6ri6lfNIj4qRIBR+FWYqWwX2VhsIy77ETcwwYB3NdAvelmce3PJ
         G2e/Zt6zgczDgXb7EOPVmPMZZet2iGlMCX/JZzkBoLRE8TK+/ic9oxGdt6v1yy1khLS/
         6GSA==
X-Forwarded-Encrypted: i=1; AKwUvBz/xIXOiD0bK97wsGmidQQT/oliRS0y/nndyyZmqIX9SuHgyl9XurKIbfD3HMe5YxqbzQS/GxLWBfKUl9M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ih65vg9ZcTMxQmXoa97nFHNHsg1EPfmUj74GdRg07F/5r4+/W
	ulUccvZrn6/HQDL7d0AduT0ompIb3kis4v6Y8/7cy74b1FyHYCSEdbJn
X-Gm-Gg: AYBFou1kz0g5k14kdsa1ufEZjp1RiwzOchOUfaBvBszNU4QghUqx3UwJmRHG0vGvqFg
	5jtvAcvqQSPK5zBgFEX2HRWj92UMcNqkcPgJpTYUK0HjlnN3otJtbz07yn8M7S4IQk37iBq0YQH
	n3PRivs8aYD0lps8HHl/voRPm2CzpiGUp95wFbhJJjUa/YKgxc8aPRNukTWf87rgnX1K7VAJXtn
	++1sSCsW93k/lUieP1s2JFNKD7ZnYh8hsCSlI2FBttsFfo8HqEXXGX5wNJJNRG6AEs1IjlRA6OT
	VQmQYtQUOQn+NZ0OAfQQWzKkkP78663xyqQVD1N420cuwOORclBCtkEpdnLGCfKwfkvbaHbnI5K
	VZirkqlzH2YryyKTWRyH9siHKJNNBHUvMe0RxfpCQ+oUJD5+uv+E050R45XOyfV/db/DtEPqu+S
	URf4GKZymacXuat+qjBaGat4yFZDdAe6Oapp1U2sYtFEnMQLIR+/cCn8z9hacjEa1mdY8vtqzH6
	UBj4yNPTr6BRxrhvplcqkh+pBsrMqdDKA6m59AqmOgaIBe3pe9/4kkPuodqor+h3vh88/fNYVQz
	MeIso2w6oiH5NOZTSRcNnHV+dqc=
X-Received: by 2002:a05:7301:7e16:b0:361:fd60:3cd2 with SMTP id 5a478bee46e88-36a4232bee6mr15558588eec.10.1793639933915;
        Mon, 02 Nov 2026 09:18:53 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm36978047eec.19.2026.11.02.09.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:18:53 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Frank Wunderlich <frank-w@public-files.de>,
	Peter Geis <pgwipeout@gmail.com>,
	Junhao Xie <bigfoot@classfun.cn>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v2 0/6] arm64: dts: rockchip: fix GMAC clocks and USB OTG power on RK3568 boards
Date: Tue,  3 Nov 2026 01:18:32 +0800
Message-ID: <20261102171838.2958552-1-coiaprant@gmail.com>
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

Changes since v1:
- Patch 5 (USB OTG power): Reworked the power tree based on the schematic.
  Instead of tying usb2phy0_otg directly to the boost, model the OR-ed
  5V_OUT rail explicitly. Add vbat, 5v_boost, and 5v_out nodes, and fix
  the vin-supply of vcc5v0_usb30_otg0 to depend on 5v_out. Drop the
  incorrect phy-supply change on usb2phy0_otg.
- Patch 6 (modem power): New patch. Fix vcc3v4_rf vin-supply from
  vccin_5v to vcc_syson so the M.2 B-Key modem does not lose power
  when the board runs on battery.

===

This series fixes three classes of board-level issues found while
bringing up several RK3568 boards.

The first four patches address GMAC clock parents. On these boards the
DTS lists SCLK_GMACx in assigned-clocks but only provides a parent for
SCLK_GMACx_RX_TX, so SCLK_GMACx keeps whatever parent the bootloader or
the hardware reset left. Add CLK_MACx_2TOP explicitly so the GMAC main
clock always comes from the internal source. BPI-R2 Pro additionally
describes clock_in_out wrongly ("input" while the port is a fixed-link
with no external 125 MHz clock); switch it to "output" to match the
hardware. On RK3568 clock_in_out does not change the hardware clock
routing today, so that part is a description fix.

Patch 5 fixes USB OTG power on the Ariaboard Photonicat. On battery
power the USB port is dead because the 5V_OUT rail (which feeds the USB
load switch) relies on a boost converter that is not enabled. Add the
vbat, 5v_boost, and 5v_out regulator nodes to model the OR-ed power
path from the schematic, restoring USB host functionality on battery.

Patch 6 fixes the M.2 B-Key modem power supply on the same board. The
vcc3v4_rf regulator was incorrectly modeled as supplied by vccin_5v
(external DC), which means the modem would lose power on battery.
Correct it to vcc_syson per the schematic.
---
Coia Prant (6):
  arm64: dts: rockchip: fix GMAC clock parents on 9Tripod X3568 v4
  arm64: dts: rockchip: fix GMAC clock parents on Graperain G3568 v2
  arm64: dts: rockchip: fix GMAC clock setup on BPI-R2 Pro
  arm64: dts: rockchip: fix GMAC clock parent on Photonicat
  arm64: dts: rockchip: fix USB OTG power on Photonicat in battery mode
  arm64: dts: rockchip: fix modem power supply on Photonicat

 .../dts/rockchip/rk3568-9tripod-x3568-v4.dts  |  4 +-
 .../boot/dts/rockchip/rk3568-bpi-r2-pro.dts   |  4 +-
 .../rockchip/rk3568-graperain-g3568-v2.dts    |  4 +-
 .../boot/dts/rockchip/rk3568-photonicat.dts   | 53 +++++++++++++++++--
 4 files changed, 57 insertions(+), 8 deletions(-)

-- 
2.47.3

