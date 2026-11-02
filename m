Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641500;
	b=2PGSnRnwdzoVK7EF+zt43LhRNiQS//Jt7xRPa2IYYSL29YIFJ2UvaMTfXK/eBWr7WLvo
	 ISf1/u1vmhkh5HTsyMwSEd+R1BSW21mndY5CtLxbNrC2YwM0Lv6BJm16yhhfBvWQQ8aek
	 OXBRP4IfATTcDbNXKcZGsnU9+gGDsjaX5ChxJRnpD1SQlO+25uWUp202rb/RUtYI3b7Wb
	 qTKkP5+oqmiq0+gaO/gUvWnokCkgfKfWRSkylpJhxvh7J82qa+M2PxO+euyAq6stLBOLh
	 a0oSvkPsKCOjc+HgZ92NiR2UqV1rARUN1ZCxUso4QQyF4gr+yXdTdjf6v5/6ZqYaAug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3bh0GJU6K95rJPMyXBJ2rNzUcBtGgKH7isTHX83efNg=;
	b=EM0ASiwmBRN1ZqMAq7y32niMhf3TkF0adJai25offUNUonr+D4jxpGObPjSCBMFvlS66
	 GeN0s28feUAD1MCEB4Td8R+EjBqAypijoYvd8zZdZFb0OTYo+J2f4AFNdSMYbpVAfq7G7
	 u0Tm/MRXWwWqtlp6Gs6ZHBwokLHQPvpWf9hwsn/dEiBMqZUhixSnCEbbknbSATGSRX5aM
	 SPlhLKsOqUcaNfZzLS1aoDiIxnSf5JLxfpzCqkFtCvtgj1avpR+erRX+waNpa3TfAE58X
	 Es+49o/lyIvtUxsNRMDZJ/m7Nf6kdJPrkbLMMS/I9EBGYiocl81syknjBhtM4APL/ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vIg5cy0n;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6040606A335
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6040606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vIg5cy0n
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-35eaf84cc66so3201506eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793641499; x=1794246299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3bh0GJU6K95rJPMyXBJ2rNzUcBtGgKH7isTHX83efNg=;
        b=vIg5cy0nFrEe1qNau4YkNVZixJQaGLrUM7tRy8LdgRHhoroN64eKsYDKXobYSjyF0k
         LYaBdONSBFVSTLRLzSXGxYprkrlgwiWw5PaC+gf6sDAb3joRFgVOY41nKFgtEWk6h9Xb
         QRdnoA3jezQMB9gcgkqoOBwJEfbAgCaVxqOFFflw8jRWWjx1bUEEMrAKb1xIsSHRf0Zs
         GxF7AN70XuBOq6s/En/ES3RYbfX38qap7GZk3O1ONbp1zGUuvG1qE6a6nS542UTl2OGO
         pkggaHps1xlNjLo7DZSnbZ2cePWxSsGLInLmiWQ79/gQodkkmEQJ9cLgXDt7eSpYqkPa
         IDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793641499; x=1794246299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3bh0GJU6K95rJPMyXBJ2rNzUcBtGgKH7isTHX83efNg=;
        b=IzW1exrJVNUJyoMV8a+xxUSlS70yjyyF/uo3zydu5+44tf/QswEnYa33WTFJ8iJkp2
         Gj2SKkhEErsEm0XMipOLr7xgZ1vXjKFCS+z9kWdozve/ouKKSr7yMLVdui9/4QAsUw1n
         IdyIw5bFwCJa4MX9XP563ntShnUoKoCr1IxbZ0S+Ne6wR8umFRMLUjljcgS9TCt47DoZ
         fX9xY0V5gRwmlV2iYgDnKJ7Nbmu1qWAmiqSPEqQhPC5xKSocrm/IePXa8/UVIfZ5ikXh
         hBd0XQSVa+4/FgBYsYdJaxxG42OiCDx70sjl0JXivl7yg3yGrFJVEj9VPca/Mjzgq0NM
         uPcg==
X-Forwarded-Encrypted: i=1; AKwUvBwZqNqGn86MGkjikXyAidLDQcNiYsft3Ozg/69hzNs8rq/PfHr6v1Qa+2xJwddRcjYfQZF0QBlzXrVS+Y0=@vger.kernel.org
X-Gm-Message-State: APuU4Z962E+WVxEyR+tAUF7mKjJ5ZXJfl3TSTaSM/PAMlBcXb2YVYysQ
	3gk3gqhdxFDxFBusjqIBqqwoBOKkMXC0v5/rvjzf/h3Q9MDvx78Xmllz
X-Gm-Gg: AYBFou3DYByQ66bJFWnzUB5x24lmxxIGFoumDeUckPBHCa+hVgSyk7iYgo1DYbLo2zg
	QDjahdGLWU7dc9OpycQKvGl+NTp0TFQ477w+/AyiEUR6woFzzMukebk7xZyL5sEdE3b9ILK/wr8
	d1YJ2eQscM+EjQvtcGdsguS0F/8++ZsY2OaUS/peWvG59h7cTz6fbjb7i+MEeOym9pKYvZPKDhl
	o43uLKHJwGpPrKpV00kZH75whXps6L//IjD18C4iMY2sYSBIiTYYXqnRnP52KnNAxpMNyLxW6MG
	M0uRlbLDbit8BUIT0a/+nQnD/GMHkKkLVa5SPzzuAUsgryp/C6ZuQggg3YVl3FyEd5l2ts/H7lM
	+2981UKHl1ScpBVDML0mcqnaSll0MJbHwQJxfbA+qt2ff8a/qyQpnc4Ybqomwava+DgEL05iZpa
	bWlHZGQqcvgd43CIt+OD0sP0CofqDcWM19ImXvADNTv3BoKk9C5FFz7CIdq/zgshBoZeaszMLSt
	UKCN3vbH4QgcufEW4NGxBCvvJVutRnbD/iYH4OgMgGMDwEuKnWkjH+bl6DkRuG65rAVJyK228zr
	Z3AbW0/u1IcKUQ7iTALnXXCmpSA=
X-Received: by 2002:a05:693c:895c:10b0:369:f05d:6c5c with SMTP id 5a478bee46e88-36a4240f66emr17419811eec.28.1793641498907;
        Mon, 02 Nov 2026 09:44:58 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm53290803eec.16.2026.11.02.09.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:44:58 -0800 (PST)
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
Subject: [PATCH v3 0/6] arm64: dts: rockchip: fix GMAC clocks and USB OTG power on RK3568 boards
Date: Tue,  3 Nov 2026 01:44:44 +0800
Message-ID: <20261102174450.3000397-1-coiaprant@gmail.com>
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

Changes since v2:
- Patch 5: Fixed vbat min/max mismatch (both set to 3.7V) to satisfy the
  fixed-regulator constraints.
- Patch 5: Fixed vcc5v0_usb30_otg0 to depend on regulator_5v_out instead
  of bypassing it.
- Patch 6: Updated commit message to clarify this is a topology
  correction rather than a runtime hardware switch fix, as both rails
  are always-on.
- Cover letter: updated the summary for Patch 6.

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

Patch 6 fixes the M.2 B-Key modem power supply topology on the same
board. The vcc3v4_rf regulator was incorrectly modeled as supplied by
vccin_5v (external DC). Correct it to vcc_syson per the schematic to
accurately reflect the hardware power tree.
---
Coia Prant (6):
  arm64: dts: rockchip: fix GMAC clock parents on 9Tripod X3568 v4
  arm64: dts: rockchip: fix GMAC clock parents on Graperain G3568 v2
  arm64: dts: rockchip: fix GMAC clock setup on BPI-R2 Pro
  arm64: dts: rockchip: fix GMAC clock parent on Photonicat
  arm64: dts: rockchip: fix USB OTG power on Photonicat in battery mode
  arm64: dts: rockchip: fix modem power supply topology on Photonicat

 .../dts/rockchip/rk3568-9tripod-x3568-v4.dts  |  4 +-
 .../boot/dts/rockchip/rk3568-bpi-r2-pro.dts   |  4 +-
 .../rockchip/rk3568-graperain-g3568-v2.dts    |  4 +-
 .../boot/dts/rockchip/rk3568-photonicat.dts   | 53 +++++++++++++++++--
 4 files changed, 57 insertions(+), 8 deletions(-)

-- 
2.47.3

