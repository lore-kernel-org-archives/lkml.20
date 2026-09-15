Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19694CCDF2
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499016; cv=none; b=EvilMdmz9fej/bdnlztitQAvzc8dOxjj9eUUfzUVSqcphSsVfhBfv9ffVchIL/YIH2b8PBTzaPsuDylefTeq3r6yas5MnkBfe5f30gSWxiLC0+pZLSbZhqzvSutltJVi/72VjV6loRPJHfM/cJO+xUvMZH9/pesBdRZS46Zk+k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499016; c=relaxed/simple;
	bh=4nxtyyqEl3KNqFM/VNPCt8/lxZqhenmbkWEsMZt3P7E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QQcQRa/vf2nT9TwnQv6w3+MlwtfZWCusvnTIViq1JyHn9dNVHnXqOCWhbJfin2ks58vCRj3FiXWO4D2uxDhi3dnm+GAUK/vJdXxq8Iafs9VtVWnw/MO7xUe4k37+1vP9Yt5o7k2Xq0b3cSuGmDODOBkWvQx7pFEwGdVwVnbR2bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rRm7PNs/; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rRm7PNs/"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4b37a3ed714so163566b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789499013; x=1790103813; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6m+jC2rp2azBWtBItSkEbw2wCnf8fSU8Zkxe0cev4G8=;
        b=rRm7PNs/JAnZD3WK4mxNSEHhBTG3IsKjKm9uVsIqfMTxmUtyJlAvfzK7XnT/2byjls
         dWXAqqf6vRTHO9MbfBbSyWyCzxbgunAGMjmIXS6vGdWCBMKV+i//fPh4SK1bSFkZuC5x
         Pa2W98mFWGE6yRG1moF8/5kKxYs5Z4qSccjAe794r2eCw+E82cJzcoSrocbqNzaNR6i0
         ri+hfk2y0IjrI8os+mtSyGJQovnw+Tg7eqKVuDuuEVmVXefrIBENf+wG+5YF+t3Ldq7e
         L2X0m5FhEjyO5GaLzBrFRAiC/I0cs/MUUAm7H76thPcDDloUtWlkfak4XFU8iIfu3P8L
         gVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499013; x=1790103813;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6m+jC2rp2azBWtBItSkEbw2wCnf8fSU8Zkxe0cev4G8=;
        b=dCYLZ6SLrSxI+9DUF0NEUew0rdt+i+ZFZoVZGQpArEvQZKG+IlCoTQYXUxFaNnHlLY
         Mq3ZrNPDToXV9324uwbYLDxTJ0e1Bv1TNPXFV2VJa+2h+JEkK7ldRNfovSKaNYyOgjnZ
         E5c9+UwW/CglDvd8aCkor4FQg6v46Ax3ACEJGJCC3DI2EgTPS5sbLNqzHP459j5sKZ0B
         RREak9xdyndV3BaBk7bB3/nbEax8Eta9PCHNmEEMxsUAgppiQNJuc9cj8z75PvVCUPhY
         ee0EQrbC43kInMBRDkNFBUolawrn2clKtOVbSQpHX6Qmh3Z1SGP+M2Ff9I20ZYg1z/ag
         O1aQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyy45fMlA49V+qTruAtBpRF0A/7rItuuixarGRj5CS5hpn7Bh4Eo1ufpK/hFj33km1JSq5IFZ9wk87BFw=@vger.kernel.org
X-Gm-Message-State: AFuF++nMi+p425Wx602rUzFAHUVN2XZ/LZtrvTpF1dISF7hB1zmGYWFX
	5IWAmp7jTFLVdC2RTWWWUMe/M84b3pWwujeRCEZ6pO3vb0sXYPEcDkiJ
X-Gm-Gg: AYBFou0ldAUjfY073neC/hI8CWMvWVcAr2g+/zpj66KNcl4KQ9CpiMtdpBSY+OUheie
	IkoeDAdWYfnYwKXx7rJIle/pxwCt8Ssh7E2WfCJqxFITp11O0hGndvVMEwzC7l6qDeO2ios4dpG
	3csV8dIGJCWwG9Lk6jxsmUUewF+Y38gfaDfWJKMqT+DcVhsxrkiao9RUnbOhsG8v+pV9fkrZsMX
	qT1584XnmBlPDYU7DRfKfM5ZY9tr4jhvOzOCWsNzUnoPVKpzk7E32Ec1onREDzUAlV6+DGxg1Zj
	ik+Q+WCFRPR+vqAMsXn+L+8937KCU0y9KkrAm5QV2yDJ+MWGlv59Z+rR0JXc4cCMI0Y9/QwM9zX
	G7n3fbdH7Z+YDpHSFpxaI2Cm/pEWsMmYjJlnnYd+GZV4CVC2NM3lhdwH2sn7P6ERbt5rh5r5XGN
	IEoSKv3ZCYwPllLIoM39Gf90+qzCkCZGjDbNfb/6wPQHVSrrqG10+THGGObIEGKDa6fxzzWRZ+o
	S2JspH/TA+aXYUhxvXWvswut7gBojRd+i4J8+uw15OqzjaXH/c2CcjikiF20rc5mAawlig3yQsg
	vqCZKxYIZuNS40nya2I4PcrnBEmKNlFH3HrkmaTRbjiKqMFhWbSUaIO+FCUdNGtRSbKdgzBK2Tw
	//n1IUJK3ag7YXl0t9P635Q==
X-Received: by 2002:a05:6808:1929:b0:4c1:f40e:b697 with SMTP id 5614622812f47-4c7b61758c4mr7115389b6e.38.1789499013397;
        Tue, 15 Sep 2026 12:03:33 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4842546a51bsm836569fac.0.2026.09.15.12.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:03:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next 0/2] net: stmmac: add Allwinner H616 EMAC1 support
Date: Tue, 15 Sep 2026 13:03:17 -0600
Message-Id: <20260915-submit-h616-emac1-v1-v1-0-195de0bb1f8a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqDMBCF4VeRWXcgE0N6eZXSRZKOOgVjSVIRx
 Hdv1OXP4XwrZE7CGR7NColnyTLFGnRpIAwu9ozyrg1aaavuZDD//CgFB0sWeXSBcCYk015VezP
 aeQ/1+k3cyXKwT4hcMPJS4HUuVfhwKLsK2/YHmuTXGoIAAAA=
X-Change-ID: 20260914-submit-h616-emac1-v1-143703842abb
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The H616 secondary EMAC supports RMII at 10/100 Mbps and uses a separate
system-control clock register at offset 0x34. Add its binding and a
sun8i stmmac variant using that register. A distinct compatible without
an older fallback prevents the driver from using EMAC0's clock register.

The PHY commonly connected to EMAC1 is in an AC200 or AC300 companion
package, not the H616 die. Leave its initialization to the PHY driver
instead of using the H3 internal-PHY controls. Retain the supported TX
and RX delay settings through the shared syscon setup.

The AC200/AC300 EPHY driver and package bindings are already in
net-next. This series separates the H616 EMAC1 MAC driver and binding
support from the earlier combined series. PWM, MFD and device-tree
enablement are being handled separately.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
James Hilliard (2):
      dt-bindings: net: allwinner: add H616 EMAC1
      net: stmmac: sun8i: add support for Allwinner H616 EMAC1

 .../bindings/net/allwinner,sun8i-a83t-emac.yaml     | 18 ++++++++++++++++--
 .../devicetree/bindings/net/snps,dwmac.yaml         |  2 ++
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c   | 21 +++++++++++++++++++++
 3 files changed, 39 insertions(+), 2 deletions(-)
---
base-commit: b8e9e7d82e7eefd5d2d528469d94ec20e96b38c3
change-id: 20260914-submit-h616-emac1-v1-143703842abb

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

