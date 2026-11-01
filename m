Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793561374;
	b=uq4KvK7bqnvT8uANzYmbjnkhBDw7Cr9YHZj74mRVRjBP3i8O+fir/ODX9MFyz4BbS2cF
	 Gja0GTuuVZEnTEuBIyzZlvWzGnuIeAW/bqwuGUS8K3JeaH7aaN3sBOyUANpqtB/E1Y02F
	 tDO4c+7gDNLyPfBsfAcPsbriUrs8e/rYjmfHT2o9cxPU3q1E/QjnTLT79q+/4rpe491xx
	 hE1sBMImgi161H5L/TgFRg6iXL62mGs6CSBYYtst5WkUrFbUGUYsXPgo8gwnBjYRTYWwT
	 y3NqhWN6rvZTYavlmSQMIuO5M0qSyZhNaKqkningqykQm0DwGlh7Rivg4iuzXep74XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793561374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CGDnJpx3j3drQchpBAdAdBGb8yAOu+8mQ/5VXmFBbTQ=;
	b=1gxlQXaoSSfCmD6cpj/6ITZ2r+Jfj7F8Q28yVVJoePOzmTyDJpzHdoVIGCdy4aqNWer+
	 5ZXY2EqEwPX0KEklYWNJaXnPMWDRTN+S2evhoGdXFE0EE2fRs/rF5BV3a1DlwD1KMjjiI
	 nHOU8yn2FcqaDXjqRHc3mmh4XNDKylNwlxMp6b0BioaHt0Dj8vmIlzHMDj6r62FH9QHMD
	 3Ym4xNhZAwPXEyiUxYYoe9/pWX/+4vmUfgSr08eZ0qDFa4M8UswIxCFo6FQAPdE+qlC7N
	 /e5QBLup3tiMAikm8Sv4HA6OGWq4nWYRpu1oojtXBheApEuh3qlzi4puaygQOjMhCmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VBWtmS4v;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683D4606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 19:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 683D4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VBWtmS4v
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-35dc2af1f2fso1059211eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 11:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793561373; x=1794166173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CGDnJpx3j3drQchpBAdAdBGb8yAOu+8mQ/5VXmFBbTQ=;
        b=VBWtmS4vyfAc2ajQC7AeTP7aX7Nqvc6OM/5Z11jf/xf6lcsVQEtZJR9KBHaPyhuRSY
         dAcLYi00hXQJAI3HzIvQHICwBwmbkywMuoH/1nIwDSdRV8oVKdRJs7odiR2W88IdCbvN
         GKubtlNyb9g0O/VePS1rH9KbacSKGujP/0s2ax0aELfhS/aUf6e460VKE/XbYYK7QAQ3
         XcOJsvspUPXBC4iR3oHBrB8G73bRDhctQmBJql1y/66MjP/DsSVbY6DZgAmi3SPEuVl+
         Lv8w74Yr1Cwnw6J4EqX+N0W6V5432wRXey0ToUqr6aUYRljcAu3jsoZhyTL3n+23zAbv
         mLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793561373; x=1794166173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CGDnJpx3j3drQchpBAdAdBGb8yAOu+8mQ/5VXmFBbTQ=;
        b=cx0ghYJB8ymecL9z6FgaCCp5WZOUCoD1/vUWoVBzy+7uBZAZh1/PwGxoxEJMOr4RI1
         nuosaibybswEA1dOrRenZviZagqVVjoZHp6uSeiykZyMJIeJPnGMZQLMs0M9HZG2sT2e
         0/yChtdMhuSvwm1VHJkYRNVUv0fM7W9Z9hVGIx/ZDq/vB7uw9iMH6L9f02Vy+Xh+AGBO
         bbcqIZd7PHuF0zq82kn2gdR8mmJCa+Xjxg0MdF1Fkdisfx8rvtFtcLBRH5k58DJmXqxl
         74xV7T0RLna4TPkrq5aXuGkLjXGRkQupZttn2I00TRF0imx+CiXP9Pg240X3+NgEG9i6
         c16Q==
X-Forwarded-Encrypted: i=1; AKwUvByqJqwahG94iKHIb7+6a6gaPDvB0D8p+esNbMrwgU5kYHGIdoKWg4BsMetc3nPZOTWD8pSn7G6VizAzV3o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qWtaER4CiEWDoBZx6AT1LYBjJu9Exlrke5XlJ2E7QEKNjyqHw
	rGNmeIxoNM4yNRZvnB9ECFVu0oe3ZoEpJ43YcilF6zOgvpXlHJT3CY5z
X-Gm-Gg: AYBFou0RrJveV95PJJDRsp4A5sieUo2WOBcsDRoQu5SF8Pom1e2nW8VwyGI0iAVdkRf
	Kk9RcufPSyTC7lhxaQa2F1R+hxXOgwwCLnsmN1I1N8/T/MKRJ03qTYX0CST9MxX/KLFzeSJsqnr
	0lsa0rsnEYTBF/PmnKaAF0lm9xr6J6moyT1+F/hIHcWCC2DRXsdk3S66/344sDy7dWu11nP5bey
	7R8j8qw0VDIWB7FuDR/1RgHXpvatfp259bCCuRTpIBtW7z3eq5sMYBQjq5bLZDbrYUArAubvquR
	bFadbqztOcOxv1IBM8zU2LEniMGJS7rWTU/22URiHzSPZU19ohpDrzSTJid6mTr2sbsYUlk9Mkq
	ddVerDSVMGJEM7LDsK0BHZfVASWSkcFzhr8022yOBMrjrzLHjJ81XUHgDyLBv8h3i/SiqceNYps
	hkuOStONyOiN9lphnrDUkpAy8Ycgq3p+KRx5YgC1meF7SNxgs0pm89qZruT/zyUpkrZ9euyCE3O
	SUjG0thA6m8U9WHNScGPMdwLcKU9uVOtboaLuGs3+3lxRvupeZxy6Tiuux3IinEOPqi5K8SQAU0
	ZwoWPdGCrM6q6UMjLQEDEktB/Eaq3k5MteuSspjMvHT15/Y5
X-Received: by 2002:a05:7300:8251:b0:36a:1a65:ebd3 with SMTP id 5a478bee46e88-36a4237d4a7mr11951653eec.18.1793561373232;
        Sun, 01 Nov 2026 11:29:33 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm31471861eec.7.2026.11.01.11.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:29:32 -0800 (PST)
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
Subject: [PATCH 0/5] arm64: dts: rockchip: fix GMAC clocks and USB OTG power on RK3568 boards
Date: Mon,  2 Nov 2026 03:28:02 +0800
Message-ID: <20261101192807.897562-1-coiaprant@gmail.com>
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

This series fixes two classes of board-level issues found while
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

The last patch fixes USB OTG power on the Ariaboard Photonicat. On
battery power the USB port is dead because usb2phy0_otg is fed from a
regulator that only exists when the DC input is present. Add a boost
regulator gated by the existing vcc5v0_usb30_otg0 rail and switch the
PHY supply to it, restoring USB host functionality on battery.
---
Coia Prant (5):
  arm64: dts: rockchip: fix GMAC clock parents on 9Tripod X3568 v4
  arm64: dts: rockchip: fix GMAC clock parents on Graperain G3568 v2
  arm64: dts: rockchip: fix GMAC clock setup on BPI-R2 Pro
  arm64: dts: rockchip: fix GMAC clock parent on Photonicat
  arm64: dts: rockchip: fix USB OTG power on Photonicat in battery mode

 .../dts/rockchip/rk3568-9tripod-x3568-v4.dts  |  4 ++--
 .../boot/dts/rockchip/rk3568-bpi-r2-pro.dts   |  4 +++-
 .../rockchip/rk3568-graperain-g3568-v2.dts    |  4 ++--
 .../boot/dts/rockchip/rk3568-photonicat.dts   | 21 +++++++++++++++++--
 4 files changed, 26 insertions(+), 7 deletions(-)

-- 
2.47.3

