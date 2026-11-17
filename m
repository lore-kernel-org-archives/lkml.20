Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794895383;
	b=jpQZz1vHpXk/RQ8iTczi6OeX9/QSeMBhNpp3noDXc5jnyXgWbPy2bppAh+LhTD6ZvwZB
	 lcA1lSKOZIGRZrwM2gmMgv4uWTo4aF/NJf2UsIkV5xHoQ2UHvpVTB6M5c4nRb925i5URz
	 LGNkqUg5SOm1iBWypRyZNMBIPqWO4Seji07yWEORlHY5oqDaWXB0/gQpbsa7h0c+LlfYt
	 wKwYisuPjjAAqFORZvdY/cOOB5Skdm/H9JO//+BYYM3TMv0w+WqUcEYiO0aMGgPsLov+G
	 N3mFqLvzAO/Ys8QVoj82mUNggtyaRouaZbkZQAKAcOfgdgjOxKVdZ/DIeUe7IAjdvIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895383;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=io0BBaeVnjGXirCjbl+rt2I1LtzxyY3wzbu7MlpT3gM=;
	b=HXTSenYsYpm3kBmHXzpFaUT/LGQ7zmJKiymf1bV5MODLDgg8dOHMZtKo3xYBZ7KarHgX
	 dzkH1UYFNKfFUMgZFeUMfsTd2ULvCv3S6zzFMsZgazoP63wDVnfvvSn+kmIU/5kYH7OZy
	 3s039q1AYzaU8m1vzjIQ94ENiK4i8EbrBlwcvTUCL/DQ1X2ejxjfmu+vmgRnhqxygfzss
	 S4fmbWgwNzP/WONYjvYYKWt8J+wyANwQ5ub9Kssy0L2je/FDnVKxFoEdKjKO+bO3IKXBt
	 DvBlCNhS/cg08t6Eas9VfCewmZX+3CyO2Dih9yAQTEHQ3+Ehs5RztVog/rWHvPd9s+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realsil.com.cn;
	spf=pass smtp.mailfrom=realsil.com.cn;
	dkim=pass header.d=realsil.com.cn header.i=@realsil.com.cn header.a=rsa-sha256 header.s=dkim header.b=kks6fSdC;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C12606A32A;
	Tue, 17 Nov 2026 06:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4C12606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realsil.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realsil.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realsil.com.cn header.i=@realsil.com.cn header.a=rsa-sha256 header.s=dkim header.b=kks6fSdC
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AH61OvG44166715, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realsil.com.cn;
	s=dkim; t=1794895284;
	bh=io0BBaeVnjGXirCjbl+rt2I1LtzxyY3wzbu7MlpT3gM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=kks6fSdC9A/JQFEZVL/8dQwCJOfHmCyDzpfCe3opyArr+bl6DnGCHbXxYdQRHWN82
	 dNzXG4gFUOfAxtcx/lnb7ijRjQvHMGJsjKbQuiM29pQwkIwhjfB8HEoFUT/trQvAjc
	 agkU/lFh34K9jaa8oXBUlvoc0oWX6qd/rHQPDoNcSzpRIvkbu0erNyaZAA5jdZYX4+
	 QetqzYksnsYsKbZT+WN0TWvhzw98o3m9GXXcBkBIDexYTOlpxnCK9OVxLYbu2A1Wn6
	 hpISlMyqUzm9jvEgrE6NFZzqLrJqrkCMyBxD9vI3bOZmtdIIMnsYTi7os5SUcoVhU0
	 JNI1SaeJst+5A==
Received: from RS-EX-MBS1.realsil.com.cn ([172.29.17.101])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AH61OvG44166715
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 14:01:24 +0800
Received: from RS-EX-MBS1.realsil.com.cn (172.29.17.101) by
 RS-EX-MBS1.realsil.com.cn (172.29.17.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 14:01:24 +0800
Received: from 172.29.37.154 (172.29.37.152) by RS-EX-MBS1.realsil.com.cn
 (172.29.17.101) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Tue, 17 Nov 2026 14:01:24 +0800
From: javen <javen_xu@realsil.com.cn>
To: <andrew@lunn.ch>, <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <nb@tipi-net.de>, <maxime.chevallier@bootlin.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<daniel@makrotopia.org>, <vladimir.oltean@nxp.com>, Javen Xu
	<javen_xu@realsil.com.cn>
Subject: [PATCH net-next v3 1/3] r8169: hold MDIO bus lock while loading firmware
Date: Tue, 17 Nov 2026 14:01:18 +0800
Message-ID: <20261117060120.1175-2-javen_xu@realsil.com.cn>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20261117060120.1175-1-javen_xu@realsil.com.cn>
References: <20261117060120.1175-1-javen_xu@realsil.com.cn>
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

rtl_fw_write_firmware() accesses PHY registers directly, bypassing
phylib. Hold MDIO bus lock meanwhile, so other phylib users cannot
interleave their accesses with the firmware sequence.

Signed-off-by: Javen Xu <javen_xu@realsil.com.cn>
---
Changes in v3:
 - New patch
---
 drivers/net/ethernet/realtek/r8169_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/realtek/r8169_main.c b/drivers/net/ethernet/realtek/r8169_main.c
index f151ab681393..34ea4640467c 100644
--- a/drivers/net/ethernet/realtek/r8169_main.c
+++ b/drivers/net/ethernet/realtek/r8169_main.c
@@ -2686,7 +2686,10 @@ void r8169_apply_firmware(struct rtl8169_private *tp)
 
 	/* TODO: release firmware if rtl_fw_write_firmware signals failure. */
 	if (tp->rtl_fw) {
+		/* Keep phylib users (hwmon, PTP) off the bus meanwhile. */
+		phy_lock_mdio_bus(tp->phydev);
 		rtl_fw_write_firmware(tp, tp->rtl_fw);
+		phy_unlock_mdio_bus(tp->phydev);
 		/* At least one firmware doesn't reset tp->ocp_base. */
 		tp->ocp_base = OCP_STD_PHY_BASE;
 
-- 
2.43.0

