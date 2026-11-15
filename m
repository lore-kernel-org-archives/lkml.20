Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794762714;
	b=W+yCI3A4a6ge7ielntcDv6SFhFzE+tLRS13ZxanddTLdyr1NSzlityZWt4qDz71/vhJ7
	 EgdTvugMXh6yu+ilyjq27/A3x4lGqh+BEQ3j+pqbBpEQcs3GW7VoKa1DoyrX2DYe952Ac
	 uyO4FpIWXNMWgJNBCSk6IbJFq8akaV0vi9Xo+Qsx0xh/03p1TAD+HJ0FACKeySrTNFNQe
	 I9mferTmlHemShRQzPNlCIjVWu5/yHfGVoTHVcOP8wmBas0I2jX3I0Vi2Wviog3mJWgBX
	 7q8wgugcL2E5Tb8uigTGsPBDKVU+vKiDUBGsFCXmF1LVoCSOjpygeBtGvQFy0ttnCtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794762714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dBdYXLHSNjF/d84cRLaI7Cq4Vv2L1S+rQoNIA2JWRWE=;
	b=4L/LrXMnZnosTIphap4VX3nQi6dK1NPdy7UkFempS4PLnM9O+a3f+fr0xY/kzDClazm8
	 87H/pFqqCiTd1gNUR0mArUFf+BPmr3wl8+WL2bWL6cWBFALTBolViBeMV2JU9bx7tZqWv
	 4/+CptLa6n4sO3TgLSCOW1hZNHLqTAYdoK6mJiMMXkqZjHIwxrXt8ubtQJQtfd7dVO1I1
	 pWHhh2bbln7RmCj8LhkkGcKIaQBL81rjGNXVUiW42XAL3Xux1ED8TX+HiMmM4lvevKaqm
	 FF7Z5kr+wyn6EhOAfwuXamGWFvfHyQimfS0M6jbNm9TH8695B4VoVlKjLRxu405lU8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="SWuIHq/E";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A055E606A329
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 17:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A055E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SWuIHq/E
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so3379755e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794762712; x=1795367512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dBdYXLHSNjF/d84cRLaI7Cq4Vv2L1S+rQoNIA2JWRWE=;
        b=SWuIHq/EFwUbWvv1PS+fH1cvpCjDMSLsTxs0uozhavLibz+Ot6uHmHNrlpkM4+UpFR
         z78q55Gf5zn56ECPTn5/4d5qlqC4Qoc2VjqX3NZR4Vm1KxXYjpojV/plB2tkANCzJzVr
         flpIfqay9VIhospYpLFn9JvNX3bqPLYDyJXHO2W/nFyuUC3lgkjyjKal0xrPn0lRpSzw
         IonbN+N89UZK6eNR7HYPyoLXiDR+flbRm9j83Kt7jS7gquOdFR5kOiRH9xFLjOcUDUcH
         SS6qFzsVhpS9L1jRafrUCkFLWm/sRhkMwTu60gANgjzOO46X1d/bWCekqcSXxUYWOcfo
         lysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762712; x=1795367512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dBdYXLHSNjF/d84cRLaI7Cq4Vv2L1S+rQoNIA2JWRWE=;
        b=KrUUAojlG+HAl4RcxaGtM+rCqWIQAW1iTaIXnv2Afxi/lJUmF5UqIe3naEsL7dGth8
         UANMP6ZvdNLZ0NoVCkOCUyRluP4kbuzuo4iO1RCE3MH5cN7Yc3LXcX6btXpZQlF34y0x
         8LzoAzbIrx/TB3Oe12554ahJnj4eR9O95bBNfoyWit77xPgBGNaKNr5e6auusZNbJEuM
         DHVrfERTGkFbYtaa7WY9eLAaBVUdMaNJDNr/v8ZcQYxYWWhA37mhZcDu3znM05wwj+1S
         5ZC0Z6IsxQmyFxnA2nncqm220oYmiszk2DmMWNe5Fec1Hd+ixhyVNcDu9IVfhsk3niZ5
         ZX7A==
X-Forwarded-Encrypted: i=1; AL+hErEN/Wp/Tdkpj1+/dunxn1030XvPg0iePL4uLMMwGen3/DVGWTgAMBj9JtIHewFbR8HgH5xMgOw0lwwRptY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+tFiZGBLzb4WE1L43Nmdpxq81FPEEtQJg2LLlpeWjqqHVauy3
	A8jGthCBtgrX1djM5JiIZbibLiCz53ISo2QZ/O9LGOL0+7lRhuvlk70R
X-Gm-Gg: AYBFou0hvc3bheLj3ntg7xFhvqWv2+KC8r/y+dH+QYG7dcd7/Af8UVpM80hW0oEQxrg
	3cVtFNX1z+cMPp4T9otbtSv+AGMad0cY7xj28lukc3bQehJK7+tiOP8J+u8XNFUON0ow7Ary7EG
	yF+pmR9ckK8LgazFSQGnqWocOGXqHk0fxWxEb6oH7E83yyZl5pRSDstFsOwnsEAarmYKbRh2aaJ
	FOEKLZIjQ2/xiL+/ict7jK+Gt6z3J+dQ5GCGYCnjYTvmtsQw/AmY4ADEhAlqcs9UAnsBeHWjA3H
	yjmvUxZkvo+gLfW+UB27wi8AmrK0tKdxvWl3jo0+6ln20zTYCOYeAseTYzGc2lkfUa888MnvoDZ
	UqR2OO3fOsm51IQoTUpOWQb3N2IfkDEQmYHuYNa63rXyJS3k+V5OJlEB+1IMXznqsEO7VutqYBK
	J3YTh3c96h0RjjERoiqomV6BvUzNQGuadxWMXBSVKSc2qhCXVVCjI8D8jPfTVs9lWUpe+xyjjeB
	IAvRAKrB0sp1f7CvWzAabfHEudtg7lcvp3PtqYZ0c5k+CmC46Iw8QBCINSnAI5fm/yDYfoq6bxe
	KN2m0JtBbSNbMjyB6HsaEyhi4nUlkTEMcvPqMIcqA+kKYaxIjXOmOGC34nDdmfoJUK83tJOmS89
	ECT5tj5QvhjhsT/JxmqjCPIbiWaYuukUy/8EXfzAUN9y59EufCZGRvXTxX6iFHJz+qgH+J41MT9
	PByi/uTQsICTTAEZD2Sas9mw9SVZA+lrdWriHcmdodnjlOVZ4ASfwU4ifJj+LlH2KIe3ODd+Sul
	/UwRD47PPqHpg==
X-Received: by 2002:a05:600c:6994:b0:4bb:647d:dabe with SMTP id 5b1f17b1804b1-4bb647ddc1bmr101003735e9.3.1794762712078;
        Sun, 15 Nov 2026 09:11:52 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm501415845e9.1.2026.11.15.09.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:11:51 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	James Hilliard <james.hilliard1@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 0/2] arm64: dts: allwinner: h6: Enable Ethernet on Tanix TX6
Date: Sun, 15 Nov 2026 18:11:46 +0100
Message-ID: <20261115171148.37784-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The AC200 MFD and Ethernet PHY drivers and their bindings were merged
in v7.4-rc1. This series adds the device tree parts needed to use them
on H6, starting with the Tanix TX6 and TX6 mini TV boxes, whose only
Ethernet port goes through the PHY in the AC200 co-packaged with the
H6.

Patch 1 describes the AC200 in the H6 dtsi: the I2C3 controller with
the AC200 on it, a pwm-clock that provides its 24 MHz reference clock
from PWM1, the RMII pins and the EPHY calibration value in the SID.
Everything stays disabled.

Patch 2 enables Ethernet on the Tanix boards.

Tested on a Tanix TX6: 100 Mbit/s full duplex, about 11 MB/s in each
direction, and the link comes up both after cold boots with no
Ethernet initialisation in U-Boot and after U-Boot has used it. The
TX6 mini shares the same dtsi and was not tested separately.

The arm64 defconfig does not enable CONFIG_MFD_AC200 and
CONFIG_XPOWERS_ACX00_PHY yet; I can send a separate patch for that.

Best regards,
Jernej

Jernej Skrabec (2):
  arm64: dts: allwinner: sun50i-h6: Add AC200 companion chip
  arm64: dts: allwinner: tanix: Enable Ethernet

 .../boot/dts/allwinner/sun50i-h6-tanix.dtsi   | 40 ++++++++++++++
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 53 +++++++++++++++++++
 2 files changed, 93 insertions(+)

-- 
2.43.0

