Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010022.outbound.protection.outlook.com [52.101.201.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8340249C4D1;
	Wed,  2 Sep 2026 13:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788354089; cv=fail; b=gjPlyfmDza0HGUMI0VPIn81bPfD8FBbwzUAL88u50k5i0DZQ1AT71QM05Jw2dYPHtDx2CStymbXV25+CsU2gQYRbFHVoEi59H7S7ZROd2VGoQD0YD9hhUiOxs5JQBU6WucNKkJkwg78T4Fa3AyItGDv8aiQXclS+p0j4pdEJPSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788354089; c=relaxed/simple;
	bh=h9AQ9vSJ+U/kqXzzjuBschWgi+IGzKAsm5UdgPagJdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gvc59Z2kXaAmw5MZKl0YsSkxelDPOGDgK29w3jqoO96RXpCjjQwUJ0ieoPJkmemQgh3/Xw/LUmRhD28VMpkdeVv8YsmCr+ijkBrBgeJXRXIAX+0sjgIAQdUaiHGSmJomzAOnC2Vs4BItbOCkW+Clw9aLWcgipMdFs5b6E3ZeABI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=HIlMyMN3; arc=fail smtp.client-ip=52.101.201.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="HIlMyMN3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vfpbPSxkaKoNw+4LqUX6N+s39x3/Omro3TQN6IIF7HZ+UiWGqLEL5iNR8M/PvLOT/Wp164rM2+aMYmo9QcuiHQK7l+C7vbWqGiduRepKQjiiTDJf3VVopYH0/+zyNbaniBbBuTY5siFqWrx3R469Va8qSyb5I7qlBVGhMxWS9pfuzZmWqv3TS2InaMCv2glX6axWL2Yu5bbnvNZ0R8j1G5Nzf8mD6HmTWU8LHRDIk/LG49XPoPD7Ov8zWIB+bCiPoDxYJ0hta66QXdTTGz/tykn6uWJDbZjE99wupYkaFM5dQmzrfTzlz/k04/foPHTfpeb9QoMYET1LUqaitQLV6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hISnVxC+UF1TuMOVBU8FODxzoVA+suR5aIVTwxAvSD0=;
 b=Q/fs2eb34KY/7MOlLVxLJfW6E2TDDBLT7qLLA7tVl3IEJ/wN4b/MumDTbhTdsdCJXPT/svYyd7cDoYwjnbaIFM6/2biiuBo0MzU3hKyRv4Ujk4PHT36L9/TkXE/461OOhbaOexdZajv03TKDzrgSLdc1Mrjl/azgFHeLZJvsf5UbtsicLyqMM2r8aqnMzdlMZCUf3RSu5LB0iJ6TOySZ26mz5yfYKpvr0xXIFaQ2zSusKyOSzIHVGYOZ0Tz5OWEoPwJXoRabNKEqJND7X+6R8VekUVebDJ664/YwONNfoD4ZMmcpKHGbx5YiPFYqFU1kX+FJyiwi9T/w+D5IwkTgOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hISnVxC+UF1TuMOVBU8FODxzoVA+suR5aIVTwxAvSD0=;
 b=HIlMyMN3SAWC25rsQWLntIMwmuBqGpojCErz+1AbPNUVxdBgMAF8kLuQHg3eW0Bk1VeVDXhydGxq3ZJ4P28ctLvrW0gHM5KyUwF3RoFFJeXisrMsfr3ASHb/u/8G1M5xGsPGdr/5vPyryBIdPBgA6A/J/L7Mi0m4jgubYDvGalRNHDrZyDUcjzal4MznPrL+QoI9DiVP8GxUA9QiVlj1GyIwcfwVR8sdwqiuWuX7lTaScmK2Nb7gYohASqPqwZeyfJB2jZwxPmBC1X+zYLC1/h+A5LadgfTj81y7nXkrVCFi34pqCY8FWj/6HXaHSFvd5KUDxGZs1PPmNWnIG5N2Dg==
Received: from PH8PR22CA0001.namprd22.prod.outlook.com (2603:10b6:510:2d1::16)
 by DS7PR22MB3645.namprd22.prod.outlook.com (2603:10b6:8:74::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 13:01:26 +0000
Received: from CY4PEPF0000FCC1.namprd03.prod.outlook.com
 (2603:10b6:510:2d1:cafe::37) by PH8PR22CA0001.outlook.office365.com
 (2603:10b6:510:2d1::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 13:01:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 CY4PEPF0000FCC1.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 13:01:25 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 2622119249;
	Wed,  2 Sep 2026 16:01:22 +0300 (EEST)
From: Ian Ray <ian.ray@gehealthcare.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] ARM: dts: imx: bx50v3: ignore HDMI rxsense
Date: Wed,  2 Sep 2026 16:01:15 +0300
Message-ID: <20260902130117.2731-3-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260902130117.2731-1-ian.ray@gehealthcare.com>
References: <20260902130117.2731-1-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC1:EE_|DS7PR22MB3645:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4927536b-1fba-4875-0bf8-08df08f24bcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/MvDn3hv4zw4tSz35328WDi/l4aSJLjIP0Fodh6eCGnRZk9yk8PdbpI0SbUpS4M0S61sQ+DRsT/JK2NixqwI7Vl6UDvgSuzhkQmXuWBG+L41H4jTBF9m5SIkKFtbVQVxZ144HrSAip++EJq1olIpxxlcgTv6VqywxGdjU2lPxabipA+M7nCzAe8iHgTmji+s7wRW2mO40Dny8e2cH0DjEF6bHkRrf24u+eK4TXdKigFHwni5DYyFl7DXNcj4curbG8Dp1cr+nBAUC12Ba4b++UrX+TU2ofSRL0+OUPgkn3ktYOAkRnL/QvhXSezjelFWrGOycFkT+jTqld97lVJZeA/uB7xNhJXtG0eA3CWJlzP9kx35FklrPa2pLZp+9X4dbKyc7mcjafXSMj+/mjRKQKV7HgE3rNvjoBDDfAs6M/iXjxt56SuFdqERYJG0g04x7hxC2CI7KENbxDuI0LjKXsnnynhLI1xFcDyOF+N2bI/FIterrQGFFP1S6akKcA/iL8FXoanMR2K7AIRg8CIii9xOPSk30+uij+9fPdlc+4HVtNy2k9fZU5YF1Te1LMq5DhjOajeJZ4bR87pWY0GH9svkNinqaWG1TpUlABx9aL6j3Zf19QHqpytC0S9X9W0Dh7chGU+24McjDSJQ3twc1GqA40J+GVFoizdqJWDVpJmX5pX0s+2ZqJzpLhRQFDeWkQUY8nk5TuqIH1XbLMfClg==
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Wt2DUN6EdNkQEJ3MtdH+q5twpN4yTngjbzk8P48xN/zvw5KipSA6QnULBQUMHqJQF8bjWE3nONVMTetxzitrYzua9i6A/x3KNYOoRgbYO3gVtjrJoHaLTYr+wnbIytvHgHBKYDYsrJ5B3QFJpZ88jMiSpb+5CpcLNVnL/UZvj4ZfHEss+WLn4v4Y8iA9976InwoTQzhevKHSihqnnaHsinfLnSMqpIEjW0ZCNCZHTM1EWai1VXYNxc7t9EJJ8u4NrAVtW1We5M24p6yYwK8i/TZlASHdyDUX2qewDKEbdYdj7gn1zXxntuUhHaRPhz0ggyVgZUtO9OXe3OYDvfnwFTqHhtWYm3po5axSliXtDNfjBdU3U3e9oHnWj1KcOXp5ounJDRueBQlofmYbLyHkcsSN87W7H2a464/eFCxIOAi9vfMHV69GEXYXOqpxYDN1
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 13:01:25.4110
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4927536b-1fba-4875-0bf8-08df08f24bcd
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000FCC1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR22MB3645

HDMI is converted to DP in the B450, B650, and B850 boards; as such the
rxsense must be ignored for hotplug detect to work.

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi
index 2c8d2ab8cda1..8e129b1bdbbf 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi
@@ -174,6 +174,11 @@ m25_eeprom: eeprom@0 {
 	};
 };
 
+&hdmi {
+	/* converted to DP using STDP2600 */
+	ignore-rxsense;
+};
+
 &i2c1 {
 	pinctrl-names = "default", "gpio";
 	pinctrl-1 = <&pinctrl_i2c1_gpio>;
-- 
2.47.3

