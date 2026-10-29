Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793294625;
	b=LXQPX7ya4UOb83Pjj28yQ++exAYvv8ChnvDdx/m5vdoWuv2G6jMnQPAHlZnG34a4fvRr
	 TlUros7HpuL3Gh2d7JKzE7YAmxIMWT7c+k9ahvjpXkjBc/XYfugq8QSKjoymdSPfjUToR
	 yTt0htUDCSYqS53rRDDxBeUfLRQ9kWdSoBfjg3jxybGXaaPRBdE8UHMFvbiND966MZ0Tt
	 IhjfS/intKYk8lCINj0NNTm666qBZryMM38OJQ86f2AwU+W0tcudak9tZgGgL33b5daeU
	 YOVAr5S7Xg4+GoquBiyxbOo+g+uqt8pu+kWK6ydLD6j6TXruqfulWdyOyGE5g5xRVEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793294625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sK+5+ySWu9IBFfxfFyEDRqwJRDyxGMa+VIc2I6+6GOM=;
	b=G4Z9GrHKgGjmyMeEolhJWbHAajhxxTG/9TvwDTMeQioujPRbbqlEFCBnr3jo99vaY26S
	 6k/ZCZp+ga0Myc8BzpsQC843GfqryzLLgfJoXdi1VyWAk+37JDegFEbIw9zLYfvz/WWKW
	 q1tnIlmYn/GHONHfsrpUtwp20eWyuGHzmPTZBEQLCNjJ7gqZIKqKrWqr7H0IGpPGDu+nq
	 A3/lN5NRGhQyIKuYJSC/h5AaNXP+2YEPE6go3QENWI7eo76u3EZ4rTdjjfI/IZhHENZSO
	 2HSkVACU/ABNJbje6xv9as2qKT9vskuwQd7viPaVl8dYO4U10dMzMKcFBaliSidW5rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZaiUIQwa;
	arc=none smtp.remote-ip=209.85.222.48
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EBD606A327
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:23:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09EBD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZaiUIQwa
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-988bb309c2bso1483653241.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793294624; x=1793899424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sK+5+ySWu9IBFfxfFyEDRqwJRDyxGMa+VIc2I6+6GOM=;
        b=ZaiUIQwarltYTodYgI0qTEB5hgigDjOSK8WLIYC/taLXiDlEE11DzLtpL/jUcs2qnM
         oBDihSKDp7c/c4AE1jtw+Qcl3bWYFhkkUbTdFOwKPrkGjYClExFmClPg/4VSv7l3HNP5
         VWUHpaEqLvBoDtTVjm221qkTO0ZNDQzLyR4xS5DtzPz9bPjXCLMBG4OEWNbES7Fq05V8
         5gukBT9TvSbc5mnvKCBJ+j/wWi3MJfKftx7wZP91bDwwesuyxkWi5o4/LCLDo34lJFQe
         S7r9bQgl/TffMj6WyPzgmfIMrW2c+Pp3vSNQfiRtj46Q5oBtPmw05Ndjz4OwF0whGAU6
         SzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793294624; x=1793899424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sK+5+ySWu9IBFfxfFyEDRqwJRDyxGMa+VIc2I6+6GOM=;
        b=Bfy1WL6tt1P9wXkLkfeZu9IDyxnOe0IU6srAsrgzYh0adI8PK981KB9MxAvUCLO2I3
         WlHbVMi3tRFXg6lDXrjK0V1N99ztMi/LMC5jxtpJzC72C2Ysjv1orILrq+I8vxrAXOkz
         +empws8klvFZJgUIySSKS8hWMx0tn6C4fbSq1E6JBssn7VMpLg6GTU6q1iU/AYMhlcA+
         LYgUsvuNIwM8Glu9k7sqzEV5MbjrP3FijyDmcWmQ3IjUnw4xc/3F4s47LtwgiR8ymVc2
         mXFvsCF2iWVnVmQ1sJ6xHwzggVoOKLEJfoddUHSwx+8lPKWhzNDOa8rqQQbuhNHlaRKa
         QZzg==
X-Forwarded-Encrypted: i=1; AKwUvBwEci48UzC0DLbxGJLvQheQg5Ke2axuUABYBQBCXB+xCxt4COUlFHJa34H2U25sJmrj2nESgkn7PwP0cNo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxLC1gUU9TwY7vRmYwH9YTe0WwneLJZzokgJ3R2kVxYs2HD+0U
	V8uDsFrlz0u5lNrBEXXwXhRuJWu0v9YgMgmlsYVCv4XZrzPNp0xPv00thC6velbTAq8=
X-Gm-Gg: AYBFou3C1+K3d6reiKxiJ4/HmOgZdp2akS7jw7Rl1MNhrEDQZuBCzUrX8yixAEeWutv
	mrNsjLSkKmD+HHAHGSNCcvSRx4zLrEcrO8di2BiiQB73CNa8rVoW0773lYnZfbLmODH+yLRaq3i
	M5xgRZtREmGkkWs0XGGvZ6XdjJ1Y3U2paJf0i8fQaamsRu1TXPPU4CPRxJDkMXSdvrFVMd4uwXH
	4gv1QNDOADb+9+cwaVwMkMsVHkVTeU+N1gYQYG8vQMjE7i6Y8fghz75T9rk+kkihVYg5Wp+nZyX
	GL097q5qC8Ski+9fB0+Tn3mnNq36mHxqGnGkQPaUETvMjuBUEpFD69AkxtzdB7TQ6g8zk4A1Z6+
	wfOf6zJH/Gv+DM5ziLevK+5G8NmWibtjShp5uNYfK/0c/Mvelb6wss2Yvoa4OjuqO0xcqUDBEZS
	GaF0FsIyxhq6h4FxA/Se1mQSt+ygPc5tPiE87ghSwX8cbZERgubsuRI4YAMTqSabQfIjZiDzVHZ
	/cqFOC4IOL5GkppseNq5igUVPpUzAfTNpKH6rLBw6UOUaeus3lubYVUnH7kSjRUcWOKKy3zGv1N
	NoKk/JfcfVy/gSjSN+dEWJnwg5QIdCkEUS4OukK2JaCEO2856XL41sZQucDw0x8thXE+Zp5vTZE
	vDgRRC91FXv36jIwo0RV4Knl4t+QxyTTmF9JxU+yUxEzG2gvtJBPbEI3ueA==
X-Received: by 2002:a05:6102:4b13:b0:7af:fef2:8ecf with SMTP id ada2fe7eead31-7d03a434b91mr3505471137.8.1793294623916;
        Thu, 29 Oct 2026 10:23:43 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cea3d32a48sm9907357137.9.2026.10.29.10.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 10:23:43 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Xu Rao <raoxu@uniontech.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] phy: sun4i-usb: add the Allwinner A733 USB PHY
Date: Thu, 29 Oct 2026 14:23:23 -0300
Message-ID: <20261029172325.3425046-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
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

This adds the A733 to the sun4i-usb PHY driver. It works with the D1
settings, except that the A733 gets SIDDQ cleared before the PHY reset
is released (patch 2). That made an intermittent USB1 enumeration
failure go away on my board.

I only have one Cubie A7Z, running a local DT, since there's no A733
dtsi upstream yet. Only USB1 is enabled in it, so PHY0 (the OTG port)
never went through the new order. The boots ran the same reorder on
top of 7.3-rc6, before I turned it into a per-SoC flag.

The numbers are in patch 2. The comparison inside the last run alone
(1/31 vs 0/60) isn't statistically significant, so it leans on the
earlier 3/40 too.

This goes on top of Xu Rao's v2 "phy: allwinner: sun4i-usb: disable the
PHY2 PMU clock after SIDDQ setup", which touches the lines just above:
https://lore.kernel.org/all/CE85F490F5646A2C+20260813130542.2425068-1-raoxu@uniontech.com/

One question. The vendor BSP uses this order in common code, for every
SoC. I kept it per SoC because I can't test the others and the manual
says nothing about the order. Would you prefer it for all the SoCs that
clear PHY_CTL_SIDDQ (D1, H616, and A100/A523 through the D1 fallback),
or is a per-SoC flag fine?

Vinicius

Vinicius Pedrosa (2):
  dt-bindings: phy: document Allwinner A733 USB-2.0 PHY
  phy: sun4i-usb: clear SIDDQ before the PHY reset on A733

 .../phy/allwinner,sun50i-a64-usb-phy.yaml     |  1 +
 drivers/phy/allwinner/phy-sun4i-usb.c         | 35 ++++++++++++++++---
 2 files changed, 31 insertions(+), 5 deletions(-)


base-commit: 8f56fdf3d8cb9f1dbdc93bf9ac816698aa6f70b7
prerequisite-patch-id: 77e92419764dd34a945f7d546d4cb1dccb6da112
-- 
2.43.0

