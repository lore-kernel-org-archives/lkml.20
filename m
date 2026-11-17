Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794895384;
	b=qNs3mXJ9WWbXtw6+DaML8uakn9Y0ZvIdX0qgPR8otSzUlDor17SsbM7IoEUqHrJwByK6
	 R4GIXaPieYpp7/zzNlc/rB058BLQBIM0iBld9h5of2f1vEOTm0pCrYU86vqkhMOx3yDGE
	 cBpozx50eIjYbLdqExhTGGkhY8e98XXCNvNToL8AZdhFWsXQdnQFqGPFjtcmNFgD+pIXp
	 gO06JB8htpA/FBgXylXUn1Fvd8Ic/Rk4BVG7UfMK+CUYdxwq/2ZVgV7NB/JcG6gAnVo6S
	 dkTRme7F3BqIdaioNCf5tNJ2PVPZBiwkUZhF7Hq98egVIn3dpAYaHg4VDUuvKj9z9sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895384;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=nJM/Ao1YYDexvsF+PRHjThGGhzPzft4V23f6+dsxi5U=;
	b=sYMzFWa0spfMLrDapWdVwCGtERJo787SufYeMflHrJ/4+z85rsESRvclvdsOkoh4MxnI
	 S6qr3UQW2p7r8L+leDEx2mgyjFzCXdBSv6A14hQT8xGANP9xxP2EuJVw9P7UTdlWpsW9v
	 ZMKIsmbgmKLMovz64BI0rr8tzYdiw7+c3rC9Dd968Rbt3BmUhIt82jP0x62F35ALgV5z+
	 cp/MH8y2QPfHt4eOfOtDEBp8w7KVncjxTPqaTO7XZQTyVAXJVw9bngCBvZ3d2ioqi3YXL
	 XmGTbn3RyrPL7mbmOxK0+RF+YHbFQYt1tabjArS27PBJgqUr7AyuwaiMIL8lDIzuatg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realsil.com.cn;
	spf=pass smtp.mailfrom=realsil.com.cn;
	dkim=pass header.d=realsil.com.cn header.i=@realsil.com.cn header.a=rsa-sha256 header.s=dkim header.b=DvLJTt6B;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A6D606A31C;
	Tue, 17 Nov 2026 06:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4A6D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realsil.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realsil.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realsil.com.cn header.i=@realsil.com.cn header.a=rsa-sha256 header.s=dkim header.b=DvLJTt6B
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AH61NvF44166715, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realsil.com.cn;
	s=dkim; t=1794895284;
	bh=nJM/Ao1YYDexvsF+PRHjThGGhzPzft4V23f6+dsxi5U=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=DvLJTt6BH86vbd8UdDwxJS/tnoTBfvmB4yoL14ir9HKY/KbB8RPrE3AiBI2wdPIqS
	 +zXbB/z7Y20+IJxDZTvsiCFYtOyCyn0obc7ru7cDI7ktK1azBuLB7KpsydsuezXPq/
	 CYfLj1x91XWQsyOAwXIrwtMuzFJ+w/NWqNbXL126X32Qu64PhZ/J0tzRv8y64Ln1mw
	 jAEWn3NbbD7FsqEwOZwskwcG4tV+xawa2Dmq7wfiBr0eNw6FnYzw8ypNWGSLWI+jl3
	 F4x6KlkDYiuYH1oRS/y4648pRGhiiXrYT4KnpYvvCpdUhRoCGurVWzk9XyZJnaj+W5
	 OtL/x9nu+kCQw==
Received: from RS-EX-MBS1.realsil.com.cn ([172.29.17.101])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AH61NvF44166715
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 14:01:24 +0800
Received: from RS-EX-MBS1.realsil.com.cn (172.29.17.101) by
 RS-EX-MBS1.realsil.com.cn (172.29.17.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 14:01:23 +0800
Received: from 172.29.37.154 (172.29.37.152) by RS-EX-MBS1.realsil.com.cn
 (172.29.17.101) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Tue, 17 Nov 2026 14:01:23 +0800
From: javen <javen_xu@realsil.com.cn>
To: <andrew@lunn.ch>, <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <nb@tipi-net.de>, <maxime.chevallier@bootlin.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<daniel@makrotopia.org>, <vladimir.oltean@nxp.com>, Javen Xu
	<javen_xu@realsil.com.cn>
Subject: [PATCH net-next v3 0/3] net: phy: realtek: add PTP support for RTL8127a
Date: Tue, 17 Nov 2026 14:01:17 +0800
Message-ID: <20261117060120.1175-1-javen_xu@realsil.com.cn>
X-Mailer: git-send-email 2.50.1.windows.1
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
Content-Type: text/plain

From: Javen Xu <javen_xu@realsil.com.cn>

The PTP block of the RTL8127A resides in its internal PHY (RTL8261C). 
Therefore, this series adds PTP support to the Realtek PHY driver 
instead of the r8169 MAC driver.

Javen Xu (3):
  r8169: hold MDIO bus lock while loading firmware
  net: phy: realtek: add PTP clock support for RTL8127a
  net: phy: realtek: add hardware timestamping for RTL8127a

 drivers/net/ethernet/realtek/r8169_main.c |   3 +
 drivers/net/phy/realtek/Kconfig           |  11 +
 drivers/net/phy/realtek/Makefile          |   1 +
 drivers/net/phy/realtek/realtek.h         |  20 +
 drivers/net/phy/realtek/realtek_main.c    |  19 +-
 drivers/net/phy/realtek/realtek_ptp.c     | 782 ++++++++++++++++++++++
 6 files changed, 835 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/phy/realtek/realtek_ptp.c

-- 
2.43.0

