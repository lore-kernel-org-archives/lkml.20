Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DBA3B19B9
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789528106; cv=none; b=MIvSpwzSiLKbo4UVcabL8Ujymury6DC9j6s8Y5Vy9Rw4uZC5k1G6PlUcqtpeepu92UJOTzvA3Sv2NbILJXgq16/Nr8XOmzy6zgY9WkhDlV2x+/dADT4xzSLWChrM46zYzs04PpBWlasEPRMORh12wHfi1gTbHi6q/1zz9RMV8EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789528106; c=relaxed/simple;
	bh=QHVgJvpKezcvlggXMVVjq9FpqZ5k0yxkTV4q1VHG+A4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JgnI8IXeF9Y4Lk2zNCjtsLdWpMhyUd5TQDXtOO5Imlp40rLGIOIRBIlvXjN0aLH5UyWfGIWaBZR4aulgVNyDkDgwHYTdN/0A/qdA9MGS4zngMzRBV2KFctCDe4xysYq75dtf+adNtRFBQWASnjOEt062Yuw3BYw4x87vmmc8f9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TVZLfzLA; arc=none smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVZLfzLA"
Received: by mail-oo2-f39.google.com with SMTP id 006d021491bc7-6bcc0c496d1so182552eaf.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 20:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789528103; x=1790132903; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QS2BYMR+x6ZlCVJM56HodZfD/aY2Xxc0QJwlrpiO7pc=;
        b=TVZLfzLA3ByBH4vZfdhcyxoSheprZ3YBLsy1/2GNrSuBkTKEXUA5Q9Rzd69bC/toAG
         3Z8hidi6Q+r0KAHhPtxYLrflbO5FlBtXnuABlqfaikwkYw4ARXAKG39xSsaebzf4uF9x
         Wc7RnbbvV9ld/PKySRwzNc0Uoelzae3jX6n05IXnAMWkJs1d4yA6SFRhr0gqeA9FEJWV
         DMI8fVZcDmOLROC2doAPKvU3x1g4pe85gH2rki+WDEa4ctcaNtFjG44Q/MlGQBLvrzcA
         OUQxb//TWZLs+9p2FH0iEbBckroZveueG2PLL4etMVUGy1WOsNqKcCQ3IbD8VBa/LEDB
         vM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789528103; x=1790132903;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QS2BYMR+x6ZlCVJM56HodZfD/aY2Xxc0QJwlrpiO7pc=;
        b=Hqf52+wOepMPDZM25nCYIUYCqHaU+MkZqgkjjuf2CVeXZR8PIRQeJvcjLOsGyAbfpB
         O8ItBI5JWppE7R25psn9xngjFnHv3B1DpFHsPJtGtfDVqMy3ZsCuNtfUsWwU52KH4oDh
         1GeBtUIt9wg/XEWK4ySftgLTPyHQrY5yt6AueV0RFo9odOAVO+v7HMAtZxJwEfURa3aa
         maqbDvzajlK80Ps6wppjlK0+TE+wmYT2cE/J80sVhjmGf6glEeMmHhKc53jKBac+7D5D
         kGPTMFCRZzkLAkXDtQmXNdwNMcJp9cFdc6PSkYVn6DQee7eDgiRqySXGvNZWOqX8HrX+
         sUEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwslRQFgUHgV16ljHAjcA3OT88tvXIFuVyLZ0sr9DXcofJFd1mY4UX/70UsB5JuD0+AwpzeGHNtLb436QQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nvXlUF/xSIjkuth+p/Umce3z7O8vncqdHKWgxZNY/SoORI+aQj
	kFBSFuCkKtbWCfjef67Gdxon3PbAnN82eL5zcOTlD4XgTFl+XJtCQbm82dCjCXqz
X-Gm-Gg: AYBFou0V/gH52Zq1qrNbnlyyzeoca+UbNymeY6mecF0MMrUT5Ie4N2Pl/hnhxdcMsG1
	/i0vVeyo+NU7i0yr0ZdUkckZqK1+75pXjwK6UfaW0nFWzgrMmXSS1+o2gDHxRvJczXEYnrKhCHf
	mYbAeQV38DpA0sH+EpmtkWjfOlUAsuYoUdYZGAFy6E2txs98gh4wy0LBeckfVfHNTV0d3iCdBdE
	rfJOHxpMxd5xQlD+6sWvq4Tq7ILGE2CiZF2kIA6tgy5j61/XiTJ9A35SHGuo5unAkqmKxPPoMOA
	L391SpePBw77Dw0DtiiISkTLeTQ+OFVP2cAUEf9Z0YXXpBIqJw2aJ7tAxPFzvz9ASSysm4MS/xg
	xZTmpZikrwbrcyNGFmt+Vcl8A/5UrlwX6wOG3sbgllMH8x2CAYxku8Y2WJBzLLd+arLydQTSCK7
	NnD/5Rq4vxtV4Y718IjN0JRYCx9mICGQu194GHAhMFVMezaC80w0hqv+486RqfxNqybZjF4qsgI
	EuwnD6lBUPALCNhUqFf1xaZEO/7JLvW0UFAWUy7N6Q6CyiR5eR85zEXyccyBnsz65XSJ5TGjF0c
	89wXBb+n/El2pnz2PBpv+E58qMSJOA/6lp9HVdyXvjRCzs/zJJ7ef6kRHGhcmvU/sSSJUo+v4ay
	ewZSZixPEPfe8FNHbPPvaFA==
X-Received: by 2002:a05:6820:624:b0:6bd:ea89:56d5 with SMTP id 006d021491bc7-6c7d1fca49amr1195068eaf.22.1789528103375;
        Tue, 15 Sep 2026 20:08:23 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c7a677b3bdsm1718078eaf.6.2026.09.15.20.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:08:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next v2 0/2] net: stmmac: add Allwinner H616 EMAC1
 support
Date: Tue, 15 Sep 2026 21:07:39 -0600
Message-Id: <20260915-submit-h616-emac1-v1-v2-0-322b32e40eb9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22OzQ6CMBCEX4Xs2Zq2/IiefA/DoS0LrLHFtJVgC
 O9uQY8mc5nMzje7QEBPGOCSLeBxokCjS0YeMjCDcj0yapMHyWXFz6Jg4aUtRTZUomJolRFsEkw
 U+YnndSGV1pCqT48dzTv2Bg4jczhHaL5JItzRxI263Q4U4ujf+weT2Bu/sfL/WBJn4ly2yLUWX
 a2uvVX0OJrRQrOu6wcKN2vx1AAAAA==
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

EMAC1 connects internally to the co-packaged AC200 or AC300 EPHY and has
no external PHY pins. Leave PHY initialization to the PHY driver instead
of using the H3 internal-PHY controls. The RMII-only variant does not
expose the RGMII clock-delay properties.

The AC200/AC300 EPHY driver and package bindings are already in
net-next. This series separates the H616 EMAC1 MAC driver and binding
support from the earlier combined series. PWM, MFD and device-tree
enablement are being handled separately.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Drop EMAC1 TX/RX clock-delay property support and keep the existing
  RGMII-only delay descriptions unchanged, as requested by Maxime Ripard.
- Clarify that EMAC1 connects internally to a co-packaged PHY, not an
  external PHY or the H3-style internal-PHY controls.
- Rebase onto current net-next.
- Link to v1: https://patch.msgid.link/20260915-submit-h616-emac1-v1-v1-0-195de0bb1f8a@gmail.com

---
James Hilliard (2):
      dt-bindings: net: allwinner: add H616 EMAC1
      net: stmmac: sun8i: add support for Allwinner H616 EMAC1

 .../bindings/net/allwinner,sun8i-a83t-emac.yaml          | 13 +++++++++++++
 Documentation/devicetree/bindings/net/snps,dwmac.yaml    |  2 ++
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c        | 16 ++++++++++++++++
 3 files changed, 31 insertions(+)
---
base-commit: 87b80c2f6b05cad9f0ff9136709c62a0f59923e3
change-id: 20260914-submit-h616-emac1-v1-143703842abb

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

