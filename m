Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794247847;
	b=Ej99vn6EoTVcfmm2S8B9osmXIGdur5vZi4cBt7TPvkIf0X66Mb+J78+WdBBNUX0d+PtZ
	 OaJQcWbHGC51EGRDtnPCw+h4QGr3nYBaqz/G++4ds43DNQi8M8dv6iJWWOQjQOUblBmdW
	 6S5qdjvrjQS2SNPxoR+AJrVIT3vTlLHr/MbexKR8kMkGVAGfJVbiUQtF3dbfAGQJH219R
	 Mgb20RE1h4vrhRsisaZVWOEdQwkAmnpaQAF8sO3xusMOrd8L7T9XY9GP/4Yi8u5cOwz6S
	 d/Q6tuQX/BLN20Nak3vXD9URDVX5zQMZQJm3mVuKl/n7BUnui7rvWTKWaZu5BkLEosg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794247847;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lk5CK7v3OXIXkpwh4FyZqK8/9kAHGQdjRRoiI106noo=;
	b=Ym8PZxQxcWgZmjzb3TGCctOjHb7BuYnnHF3RX1dbqdF7lw3eh3lvEtBnuq5StcWrS1+0
	 diyG6d3JPK2VvQpJAVcyAbJpsJL5dzXzwoo3EMSAHEVqgAYlnSfWxnxdRlBVu2sL1tIXV
	 15BJcWomRp/B+1DHMjZV3BKTgErl94PGelKg67Kp2oScPU1Nj40HEtHtvWrFVicLr+ClS
	 mbUOOufS85vIWRZU1vGYDAGCFl8MQOIKbxHUNKX7vsvuORPu13G0M/O+2yDyji0+YOZEn
	 RVlNcEMaiunb6iS5aYAwnP97HwcaNGrnvLEYEL2Xt3+yLPJyToaxyHeb7vrirNgEXRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=R035Kuyy;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=O+yBTOsC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531BA606A325;
	Mon,  9 Nov 2026 18:10:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 531BA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=R035Kuyy;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=O+yBTOsC
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9HISCv3961842;
	Mon, 9 Nov 2026 12:10:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=lk5CK7v3OXIXk
	pwh4FyZqK8/9kAHGQdjRRoiI106noo=; b=R035Kuyy2cRbqZoMbh2eru/JkVrp/
	HkRHoDB30t9PMqsDtVt9dtT5pFTg/g1r5bfqNUp1jsPcAByaQwyrM0mATK57bxtA
	1kylCsddfoRVo6PMxSy1q5P/le/wIvKAk5T0bLDap4wBSchZ5Gir5guwzC+Jtfko
	NN9cAQkOEIac67mUfNKVOASvjl3U+qjahbnztyyzOyQdo4wgJNkYfe7a2PQALUNE
	FkkEWoA4M97MANC+hxuFRm+5T3TkkVm5xVc1zLJjKxbGEHtdTW5Ewd9KnVOoK/xH
	CBO2RayC5JeF4LruhboV2IdS77uUEnc54DHA/Gfr1bQTQ8rgrZaJ48tCQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012039.outbound.protection.outlook.com [40.107.200.39])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4htm89qvb1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Nov 2026 12:10:29 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yEY1rcl1wAtb+rvNzkJjiZCnUUsyUYQ7LFb7iTS5iKEBdzVpU/X9cq4TaHv9CQiCB/gh/mNcSXPSoHr1PyWOFBQDa9Ejk520aPv8vJXxnZQkxq4Pd0S0qxRoxqZmp5vrYBPk3a9zKKEuuieGepW/hsf8qD4PO8CxzMebhHxd/eqIvAZIZa1LwNKhutN/2178uvjSPYZgkbLfIygrWsm2rawYiGSmLWjM58SSP9OmX5O9j8Bt/s7jsABDPkHlYMJFVn1FVdWuW39NGpCMRBgPYPZynowuXT7zoTU+iOIg6H3F6GjSID+nrg1XwBQ5NpJ8QESraajlu1MbqaK7GaABpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lk5CK7v3OXIXkpwh4FyZqK8/9kAHGQdjRRoiI106noo=;
 b=saNQoq2cDr6K/zo6M1F74mbVbr+dh7fU/iOrsXDdL6/g6RsBrWD5b6Rc3OnZRA1ISp3sO0AVWVJGe9p3dPltMEM7S40voNg/JeeXEf9Oby1Dn7zA+etQ5ZllNjL1IffLHRiJ3k/v9NM5aqZ4gO4AayCjQpx12HjJ+OYo1JBPwfx7bGSzlQqynWH/CQjMlgCWY/EqrdR+JAePMs1ADps1PQDGr8Ftol7iwWS6yqOd5uktYjrr3usKIzfyhSNoxhEL9QMGW27cfbJkvOaw07OMdKfyZidXH01rwlzH/R1P1Howa2erWELiGnl0mAF1886px3V3hsTvbvv8NETkG2p3JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lk5CK7v3OXIXkpwh4FyZqK8/9kAHGQdjRRoiI106noo=;
 b=O+yBTOsC6CXI8YF0hDHqTAO4mucINu4zjj12vjqUQMcwNuuEewKH8m29veDVIOglV1WpC4bzVyZ6s/Z1Jw12BQ2T4M5nw6CPjaEsLkWkf3An2r4rYQi86pQsoNjDoY30VD/oJlC0Gd6TkVhOoSulO7X6irqQoMCv+/VsWSgAHwo=
Received: from BN0PR04CA0064.namprd04.prod.outlook.com (2603:10b6:408:ea::9)
 by EAYPR10MB997901.namprd10.prod.outlook.com (2603:10b6:303:2d2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 18:10:27 +0000
Received: from BN5PEPF0004698C.namprd02.prod.outlook.com
 (2603:10b6:408:ea:cafe::63) by BN0PR04CA0064.outlook.office365.com
 (2603:10b6:408:ea::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.12 via Frontend Transport; Mon, 9
 Nov 2026 18:10:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN5PEPF0004698C.mail.protection.outlook.com (10.167.245.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 18:10:26 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 9 Nov
 2026 12:10:08 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 9 Nov
 2026 12:10:08 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 9 Nov 2026 12:10:08 -0600
Received: from udba0500997.dhcp.ti.com (udba0500997.dhcp.ti.com [128.247.75.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6A9IA8xI3363147;
	Mon, 9 Nov 2026 12:10:08 -0600
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <linux-arm-kernel@lists.infradead.org>
CC: <b-brnich@ti.com>, <praneeth@ti.com>, <r-donadkar@ti.com>,
        <devarsht@ti.com>, <kieran.bingham@ideasonboard.com>,
        <jai.luthra@ideasonboard.com>, Nishanth Menon <nm@ti.com>,
        "Vignesh
 Raghavendra" <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] arm64: dts: ti: k3-am67a-beagley-ai: Add orientation to IMX219 sensors
Date: Mon, 9 Nov 2026 12:08:57 -0600
Message-ID: <20261109180859.4139929-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PEPF0004698C:EE_|EAYPR10MB997901:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d004b5e-3ac8-4a55-c76a-08df3e8cbb63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|18002099003|6133799003|10067099003|56012099006|261009223027099003|261028144727099003|261102123227099003|261022105027099003|261022075727099003|261021121427099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	JpcbJWEW/9pxObUaceRroJDyxALywKUk/li00D1ZOO1Px7mjOrInSUjn6ngqCbe5xS8PB0rT+MPi+U5+CMkz6YyWiSRSn4QEekfxOtuv4hP9HXbuJUIK9hKLLvdX5w8IAdLBfTXef5V9jO7GZg2JkgHThLa0v5OTz4U0IoovkAq4sC+a0/wSO6RpyphF+sXAUhqmKCe9PzzWL0slsGsbmwXGZBZJ50PqF/LrBcF5Ux5tRfapnxHqM9IgLiXEMmKzHZHHnZs48/WV37ZaoGjxJxUOqDv0NDwCDeRCp1bsdE+Tm2wwfauzv1x3PdSaEYNkuB0doxbfRrl6BNr4spQLnUSMQwMnle0xksfsZzUrkCCO/BaUxWG4a7zNS3sZsEcshMI1aoo0hak023jiofecO4NCHQuvRhjqw7apbhS3RpGtzLyxph3vrYYMY9bdeQ1PTYifWYpIWvk5A7reuNQDXg9Ic2K+VKu+EKThSqmh7uzv1WidOq7nU7OmUshFYDeCqypVeQxrT4KRFn56D8UOULWc8Z6Ey1abNYXWZ3oAKFLSNGTXKyjggDvoSoOG1eHS4C95Xe68/1aQFl8/83Wp/iwP0mjz09yJbdSF78AmtGetZZGTVeYd/mZZZrlbSy6jN0/aGZ36F/69kGzSqkY1LtL19CeOFr1k92wl+ll2qhoMvWqLMymj0ROlfMsi9XmOnvDZr4uvtpL+itc75WlRUQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(18002099003)(6133799003)(10067099003)(56012099006)(261009223027099003)(261028144727099003)(261102123227099003)(261022105027099003)(261022075727099003)(261021121427099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cqtWVzlbedXB3blsNja63JE9hwXSG+rnSYEWoZXe07dygM8QuKabt+drVW9ZGIHLd62CtWrjVXPpBlPLD8ZIDuOyTo1OaidF9j2xb18xV0ZIIFbrfNoibvTlEnRuyKdEyM6hfNhX1MLj8GRvhxs1JHn2kNl565CYMUHyhttF4vM4ShMthYSPg9tdrAbjr7PktqtaaUhcQQRxVg0OPtzggmwmgmUQL0W8AVR9RksC8+7TgJs4cKgZdEmuGHPCH15c2SmZ/Enfh7kNEN86sGJFemv5vC1c2SvMn0eSB18fSXDjqkLlpuK5sFJgw/NNMSnnd9S+2I4u91YCSZTb+7BM9hO7fll0qqKmCA+LrZ8yITvSckrrvtmaoOEYYKIhetv7jJhgHMV2C8ci3Aiz7L4DIxZNm2r2mHV9dV5pOzEayoOkoIxFJTeMw5IsWaHnS5cs
X-Exchange-RoutingPolicyChecked:
	iP0jBQJa46Mkw4p/8mfxrovqJ8KLWJYUW0x5YOSCyqiP7MbPI8m1aBDpDjsFpw5FNOUIyoAO+UqN/GDO8fPcBF7KUzgR98/xG3pT8oePKXzo7juEN5uh/ok6oSFhZ90H+hCME/ljBNJRORaEMP45rjVrYTQJ9Ez0/fdUn8wjsLTXsodB0+D5XeR5pPENgtuSs8EdnvBN3LRMCRjFodicpnuvRTcmenAisN361Oa/8z8JrWLjgBatJ86Iyv7CDX2AP1ydG6wiN5QFnnMX68sTn5uCuEzIEvAvQcRSVreWVblZQqp6zqOIJ2tH9D3GeEiawAqmUtH2RpVTpHRjYfW/pg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 18:10:26.9022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d004b5e-3ac8-4a55-c76a-08df3e8cbb63
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN5PEPF0004698C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR10MB997901
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA3MiBTYWx0ZWRfX3WjpD/tCZnle
 BejKkyC0DnZ4zvx7CUTiP/UNjNcwORLaiEJ8FGRc5bIWOsHUSV0YxS9Q+Eu2SwSD8F6gLykwT37
 hIkDWQpJZdtpB2OglNOpr2r3gm4vo2jG3M5IAdUWBbmPh32i4fHsRBed9RpIJ0BuEv+/X/z6luw
 EwY5ivI8wJifHdi0Lzl8gHjskH0q6mZAjRJEsjuVD4KgQ78VtgUT9YMYYXo/0uKg+BqehzQxrg5
 8e6ZR5yNplFEby06NBTpOy+tAk+MdxRk19SOJBmLD1QZlbeAhMWJqsCYogeZIvQzI44dqXuc3eC
 t3XwEu/i1zudNjADiek+UrO+tAdOVklnvfNELCbk1dE8vgpThLyLuXG485XXl/RszResv5DW+4v
 8WTAMYXPOwFcvJlp7CfgElHx23+Ap/en9sCC9lE+CA2mDdiQPPFXxk7ylkYcDLd2ZmWUrXApho1
 c1U+KLwuWhE9FnMoi5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA3MiBTYWx0ZWRfX3DtpaG4Zasd3
 wBGG0n3DRI04NBFQ82CAdAo12F18wMHeP3Z+I1v7KE1O8BNXugXJzBaa9CRuya8TbI3Ze4txY3C
 VM7N5fbz6k5DvtXwgGNTiIMxqSo3a1U=
X-Proofpoint-ORIG-GUID: brM-JLa8G_taXZ7HzBDc44nFp_-J--WA
X-Proofpoint-GUID: brM-JLa8G_taXZ7HzBDc44nFp_-J--WA
X-Authority-Analysis: v=2.4 cv=bpDZl0ai c=1 sm=1 tr=0 ts=6af20c96 cx=c_pps
 a=gX+0JOXwNCEsWCXnQOdOsg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=-km-e86kKVgzOD7pSK8A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090072

The IMX219 CSI2 expansion modules are externally attached. Without the
orientation property, V4L2_CID_CAMERA_ORIENTATION (0x009a0922) is not
exposed and libcamera fails with:

  ERROR CameraSensor camera_sensor_raw.cpp:465 'imx219 4-0010':
  Mandatory V4L2 control 0x009a0922 not available

Set orientation = <MEDIA_ORIENTATION_EXTERNAL> on both CSI0 and CSI1
sensor nodes to fix this.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-csi0-imx219.dtso | 2 ++
 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-csi1-imx219.dtso | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-csi0-imx219.dtso b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-csi0-imx219.dtso
index 1b1c68f23cc3..c4c906f0000c 100644
--- a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-csi0-imx219.dtso
+++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-csi0-imx219.dtso
@@ -9,6 +9,7 @@
 /plugin/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include "k3-pinctrl.h"
 
 &{/} {
@@ -78,6 +79,7 @@ imx219_0: sensor@10 {
 		pinctrl-0 = <&cam0_reset_pins_default>;
 
 		reset-gpios = <&mcu_gpio0 15 GPIO_ACTIVE_HIGH>;
+		orientation = <MEDIA_ORIENTATION_EXTERNAL>;
 
 		port {
 			csi2_cam0: endpoint {
diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-csi1-imx219.dtso b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-csi1-imx219.dtso
index cf3729f5ae60..32305f46e58d 100644
--- a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-csi1-imx219.dtso
+++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-csi1-imx219.dtso
@@ -9,6 +9,7 @@
 /plugin/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include "k3-pinctrl.h"
 
 &{/} {
@@ -78,6 +79,7 @@ imx219_1: sensor@10 {
 		pinctrl-0 = <&cam1_reset_pins_default>;
 
 		reset-gpios = <&main_gpio1 24 GPIO_ACTIVE_HIGH>;
+		orientation = <MEDIA_ORIENTATION_EXTERNAL>;
 
 		port {
 			csi2_cam1: endpoint {
-- 
2.34.1

