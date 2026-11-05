Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.38
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793846528;
	b=FK6scYB1H99moT0FGFF0ovqGM3GElMM6GYINTerOawFd7SJQfYlMy1ISdMkZCC6iAL54
	 /+rwGGTAdZF+d+/XixhczMDSmVYs6YNvLckvy8i9RiZYAJWdTys3tHD8xomWOPYGzRPDt
	 G/8AFybdiLf3aEUSQea3XA6CaaBNtW9kPkdBbLaSqELDuh7huv+oi+2BpxR9ezzc3i2tP
	 HlQt8L6a5zrikEJ9NxbwTI58ODSaOwY3J/1E3DT2/k/zUx+DVBCvfruVC0k0v87U0Tbs6
	 Fo2NDatCyjA/jRAzVQL80LQJgwEuuKOpx7unAWLv1U1A7Q/qybPB7mAViAJnB7rV8Lg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793846528;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Originating-IP:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=MfnCciDtll/QJB7rALHUSV/TwRBLKuEV66h2ZBbDPk0=;
	b=u9O6TBLIn8T6mg56IgXWuekNw2Bv0+40pLK2XmsFt+VGV3cCpu1gjdT4MnpR23724RbQ
	 ZWRNND80lU8hS9tPMByQefVWm36rlfWmJD18zb/XfESltmr9j4uha2BxxuxTm14q2i7Lp
	 UuGXWy4pkq4cI443CBXh5j8JZm2bH8bka4IzBOLRstmbivx73TiUuise+KnhyL5MsSIwr
	 y7VSYromLHwJFxJY04r2YsGeo56Gh1p7xn8wdUr99Jmv+Ive4U53pGkpEnrbLUNVM4CbO
	 eQJCNeGC+nPprYnISizZatwIIW3DdVi52KuTVgemic/vxuSqIKyrSRWvaOaRSbwqLSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cn.bosch.com;
	spf=pass smtp.mailfrom=cn.bosch.com;
	dkim=pass header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=ENy0HkoT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.38
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011038.outbound.protection.outlook.com [52.101.70.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FF1606D818;
	Thu,  5 Nov 2026 02:42:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05FF1606D818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=ENy0HkoT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MwF9hfvI9MKQIiaMvSzZ8m10xJuqkC8p/Knjzx8gtI1Z0wY20pdkV5q7Uj3WPzgohVz1G280MAcmYhiNm9+NE6bAGg/YwP37JtH18dUCCn3dHcAdYGd1/RMUvf0JCJOm9zy38HznhqRVU0awTqGGMhs3Vo0g0R53KF++mTHf5tNL1YonMR20hAx+1ckDZgb+gVxwHjDrKpTvZkD8TiLrPhMUjlxeGzwERSnVdXQSA/LuelHwELpsQx7xhgfkBabuowm0igcms2ghxr/mStU8Yxma862Rpo5rwFFE9OHroSE1AuNAhX5xdbbdopZ1uYNgWuEicvf40Zyluepo4Y0IKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MfnCciDtll/QJB7rALHUSV/TwRBLKuEV66h2ZBbDPk0=;
 b=FS7e7rHg8+mAryDlAW7LKpSUEyuSlI9DCEC/nOlP7bTmp7HEZR9X1Idmn87Gp5SJ1eb+06xBJXgnFppcVlv94vZRab1ZOtjnXSVVLamHEqxBXYmezGOP23vNMFd1rvsDz8Oc9yxWVaK1UgAF3Ip9Ukk7y/DoIs87VrQBD0eaBbRocnyww3j7PncBmdZbB1P1DNlLRXGdB0IHQFoU2MD1In2UALJ0ZuBw7mwtLGf42a1Oph2sX+g0ewB0idfkImdMEupUlAKN7IJyu6c08wFhPeaPKl04n1VaeBmzO+e5U85MzM8Y9oOvi6Mwnl91z+mtqZKNb7kUZX3c0XRYPvSUQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=kernel.org smtp.mailfrom=cn.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=cn.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cn.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MfnCciDtll/QJB7rALHUSV/TwRBLKuEV66h2ZBbDPk0=;
 b=ENy0HkoTBAR9H0C1+/0GrHPbOEDkp6owa0Hxq8Zj9y/d6b2J/022Nk0NC6VYDykKzv0/0jwi268qAaR0O2eFD6O0UVGjJlDpOWlaAFPkw5zlWw4vdT9LXP4slOKkr56W+ZxArMtGaneAsTjY1Rba2q97T/RcivHhBoxqbmiKIuPg3tApGpIr5ykdb0Oa8dldJc9Q4gYnyOIhsLO/jFH/ACkJVorejrNXQaaxnv366+gZc4gRdfUJ4RyJCDMsugPIbSI1LIqUNb9Fau5EtGSCbkyUmBzPEGEsmlwqb7LHl57sYmyYlC2PRKfHQnv9AoT7ZybDoOG3zQ+YuL7c2qE9RQ==
Received: from GV3PEPF0001DBFE.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::319) by AS8PR10MB6389.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:536::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Thu, 5 Nov 2026
 02:42:02 +0000
Received: from WA1PEPF00009B3A.eurprd05.prod.outlook.com (2603:10a6:1d8::118)
 by GV3PEPF0001DBFE.outlook.office365.com (2603:10a6:158:400::319) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.21.592.10 via Frontend Transport; Thu, 5 Nov 2026 02:42:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.205) smtp.mailfrom=cn.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=cn.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of cn.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 WA1PEPF00009B3A.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Thu, 5 Nov 2026 02:42:02 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 5 Nov
 2026 03:41:49 +0100
Received: from WX8-V-0008J.wx.apac.bosch.com (10.190.167.205) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 03:41:45 +0100
From: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Date: Thu, 5 Nov 2026 10:41:18 +0800
Subject: [PATCH v2 4/8] ARM: dts: imx6ulz: Fix BSH SMM-M2 WLAN host wake
 configuration
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
Content-Transfer-Encoding: 8bit
Message-ID: <20261105-add-bsh-smm-m2-v2-4-fb5ffc7da486@cn.bosch.com>
References: <20261105-add-bsh-smm-m2-v2-0-fb5ffc7da486@cn.bosch.com>
In-Reply-To: <20261105-add-bsh-smm-m2-v2-0-fb5ffc7da486@cn.bosch.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, Haoning Cheng
	<Haoning.CHENG@cn.bosch.com>, =?utf-8?q?Roman_Smr=C5=BE?=
	<roman@amarulasolutions.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1475;
 i=Haoning.CHENG@cn.bosch.com; h=from:subject:message-id;
 bh=aJi1IOKIt57IXF5Fkw4foY57jFIsqaX3yYJCPcTmnIk=;
 b=owGbwMvMwCV2Lz9jvnXEsVWMp9WSGLJev7lxfYLo0nP8zYUrb/2Y9KF8SvTeYte6qGep/3VsU
 zXET3537yhlYRDjYpAVU2RRTfA+K3k1wHTazGq4OaxMIEMYuDgFYCK3/jEy9P1YKbIz65C7h5Wa
 stShwHaPcp03OxXl1yffKKv5wbAil+G/E/enPL23gqyLleardRmn1Yv/NXibKFqXrmMSfu3Fiy4
 uAA==
X-Developer-Key: i=Haoning.CHENG@cn.bosch.com; a=openpgp;
 fpr=25604BCD19D5503596997B16DE6F689F3B58C6AA
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF00009B3A:EE_|AS8PR10MB6389:EE_
X-MS-Office365-Filtering-Correlation-Id: 2081eea8-c48f-4186-8705-08df3ae65f18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|7416014|1800799024|82310400026|11063799006|56012099006|261021123027099003|261021121427099003|261022075727099003|261009223027099003|261102123227099003|261026121527099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	e6zpZh7m6MT1J+9rm27xXbkrAPa8sNTXucXp2Eh3sU71iN7E+R1edU/bkBqbMa8TWP4iMmc3j8XHoXsNIdvBPEC+ijt4oz5pdLGfeCFcP38iz2XvL3L+X4Uq02IobaM2FHJM9+2M1wy7EKHQlKp0Xf5BfBy3y3BzI+br9oIWsGOsYTsmUM3czAj9Jrk0ShM/Vk0c/w1ofxqnkigC1wwkP+R6JUWLsRC8KQJ2+9Y+K9lvZtZ/REhc2DGvKIkF9BIzclXI1YNCVCrrwDyJLFKoCxQ71VYfk8bYggyhd02mwu2hLAAvV5qkR5iV3EEwjkhCvN7baHK28DMHMp84yqul2D6/wBS4EO3U4F1oPXWtylpbfMJSv8kplDGqxW3tTeYBHtUEW2P2SeL905ErUlhwNGxKL7oJGnrH92ZAzPKNhW6ViyedzTieoxFAPo3o1+Tq1aqxzg18TIt7rrrHKq0jQEEkihi24Bqn/qeTly53uf71b6B4Cj/dUpibb3LeBOOKJgtQDrH81UAjMQz+FLDC7qr+RQGYzCRCXICXKylleoIw4MvycC8xI4nw1emOaPNhTmxYCKCKUeYt+QcNlh1X3vxj9mn1wAbh/NTDbQFSQddacm0UUv+/njPxZze7Xlo5Xd3NGW89xhnIjPK9NsJxx38GsIUSnntOtoPlJR7MGsSvoYXszzklrTkMgCHLGj0NBq/iJQiAyyfX7Pb/DjIGqA==
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(7416014)(1800799024)(82310400026)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022075727099003)(261009223027099003)(261102123227099003)(261026121527099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jtZYBm8AB/hYVdsjqLB410k9U9yB0EhMX1aLlH/SO28nTpm8mzcn5ino1OGzRtBHnMLJ55lIzMmlNP12rUcmcK980sWHphiKY3/YQHDWxtZEZwqHU13qk6FqUx0jnu4bNDN57VhAewI7JrT6tysRY8+Jhgd7xTPvvcXkvxRr82TtY7GGl12Do53XoBNMGGag8LWuF3a2n40RsMZQJZ4mKzFIeAaCSBCQneoUctWim4sixkv5Hf0ZcuZ3v+aPGCACNMg1PAL1nWxOba8TBsNkPJ1E88lAorFcEgHESprbHpe9b6mmzxa7mb2F0aKWyrYBp2eUReRRIMrVK/Il0eDpB9Gorj5CrDL6s42RjOlXtFCx73rJNwKEoAdjYhgTVyL7pXOZ4KRyOAF0vD+ROPAt9F54vj4YgGAu+hGRlYZt2j/+SkMvMAb5H9kd/G79cdZz
X-OriginatorOrg: cn.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 02:42:02.1247
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2081eea8-c48f-4186-8705-08df3ae65f18
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	WA1PEPF00009B3A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6389

From: Roman Smrž <roman@amarulasolutions.com>

The pin is active when high, so pull-up configuration can trigger
unwanted interrupts during module loading or unloading. Change the
configuration to pull-down to avoid crashes there.

Disable cap-sdio-irq as it is not used by the driver.

Signed-off-by: Roman Smrž <roman@amarulasolutions.com>
Signed-off-by: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
index dabe17222f13..91c76909c086 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
@@ -81,7 +81,6 @@ &usdhc2 {
 	non-removable;
 	cap-power-off-card;
 	keep-power-in-suspend;
-	cap-sdio-irq;
 	mmc-pwrseq = <&usdhc2_pwrseq>;
 	status = "okay";
 
@@ -148,7 +147,7 @@ MX6UL_PAD_CSI_DATA02__USDHC2_DATA2	0x17059
 			MX6UL_PAD_CSI_DATA03__USDHC2_DATA3	0x17059
 			MX6UL_PAD_SD1_DATA3__GPIO2_IO21		0x3029		/* WL_REG_ON */
 			MX6UL_PAD_UART2_CTS_B__GPIO1_IO22	0x100b1		/* WL_DEV_WAKE - WiFi_GPIO_4 - WiFi FW UART */
-			MX6UL_PAD_UART1_CTS_B__GPIO1_IO18	0x1b0b1		/* WL_HOST_WAKE - WIFI_GPIO_0 - OOB IRQ */
+			MX6UL_PAD_UART1_CTS_B__GPIO1_IO18	0x130b1		/* WL_HOST_WAKE - WIFI_GPIO_0 - OOB IRQ */
 			MX6UL_PAD_ENET1_RX_EN__OSC32K_32K_OUT	0x4001b031	/* OSC 32Khz wifi clk in */
 		>;
 	};

-- 
2.43.0

