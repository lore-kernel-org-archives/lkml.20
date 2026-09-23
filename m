Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E08A443C19;
	Wed, 23 Sep 2026 09:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156268; cv=fail; b=NtiSsIJ0NC74PdnHVSSmhZZdBh/wLw/FUU4FOzoEijxEwnOEvxszEchwNmwUgipVrQ5NMAUwtIh0R9GZhJKDEaS54dq85Us6uzciSXdOdhVXuDjuHeaqMYID/197xtRqbUH8AKeUHBjGgFEgebBrfdD69j2c80Iu+sDtbfCUiWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156268; c=relaxed/simple;
	bh=L3OaNzDlk5Ql0baoBtoMBjlIGP5C7vbv2hlZTWSlmas=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P5++KflxpGZKqOdwX/EjmA2G2z8U1QPM0EZTTQBNWmWKnHx7B0/a6vocF42qhZ9HmqIZ/pGL/X9ZXrpS/rnsLjH7oC4m/L93ajMT0SgGOY+wBqokQeDkBxMCMC6e/EHrCY2KrPD9wgCk0fpfHk/QAVKzepyDsqFnLr98d2cChJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=KTzqMENl; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=KQIcbMig; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="KTzqMENl";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KQIcbMig"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68N8JJos461343;
	Wed, 23 Sep 2026 04:37:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=soHxJNKEiwT/sHdRnU/zJPySlzNQuHee0iUU0OHoG
	NY=; b=KTzqMENlNEtEMKAtbCWL32fIIwi+TYNFZb+DKVc2zFlu9zm6sHQ2C1AXd
	Kj+pNx2lcQAEqa6QJ/1Ss6ABIXRvzb2jqDFGMzDAuIzUZMifbyqS147FrFBkQSmF
	Hk4aU7cto+4x/DNELNc+5Hw1le4eE+0jBtJQrNDtvylBP4GUwuLhGYt1ZXCGVHS7
	2XQtmH6lonPsMyXLRJlVYFO411xKBwFZuvosy3qehFaTg1ZXL+UPNYWG7KDp9u/d
	xVnchpv4IufxTRSFnsZ+lzUQTlAlyi7Nsxzc8aMgk5p6Gv8MpMC+8vei9D+Ygpfe
	HNRW/I+WAey/jAR1mCcGKwIgS7o9Q==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010046.outbound.protection.outlook.com [52.101.193.46])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gv3tsavt0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 04:37:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SNwvw3JaYLuSomrqllkwXyAhwmikiI5oMh3+iQihOG/lzu8L5/8P0ToggejNqhbexN4Vr3x97lvfKay0LT7Sz+Ygks1CG2pltkWzL8YKAltn6PmRByRNA/KyyNUerGcDKKQtvkbdOxUE6sMV7Ci3cPii/tvpj4xDpVGXUGPlZxOgut9bc3x41tAE888D8xDHVHywWK/+JXXTqyWfDpm+4TyXyEZUmqKtpf5A1KfgfpWtEi6Mw1RwJSiKpVjuLGxeNG62Sv9EORPgMAzQySRhSGIk57uQ/hjeAjuMdrtuxMz9LqxMeWPJaYoYDobAg9xBqFZmrkiZ23cni1+OQJ+qkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=soHxJNKEiwT/sHdRnU/zJPySlzNQuHee0iUU0OHoGNY=;
 b=e41HomYHuO6HKWWUUEpy+nQzjf+ny2CHOrtHMv/m8jnwtjJsSmgkmobmIns3kmk3oJPAiSpsnPvHCExYVkba7GGRwyiyRW3OsYL0oUOKyt08LeLBE4iubfzge9r/It/BE7TrRQ7/M7r495cc/ohxZvHHCNA/35yYhh3YWlWHI5jwckYiP4bB9tEFLjnoypEeoHNVv/6azIV4WqizwAVJINN2mCWNCNyMwSlvpJfCTUIWIe1VkrhoiGNr9glqgm9vB4flFn3woRuWVejJ4uGmZbKimoWIccNd9BbwWtj1m8703lITfnycRgQvI1RtTjMEn5tu89Oc6l2L6VlYPBJnPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=soHxJNKEiwT/sHdRnU/zJPySlzNQuHee0iUU0OHoGNY=;
 b=KQIcbMigYDvv2FGBROHRhLIiy98qoxb3yoco6TMSWpznCDuvLw4tOBDRmGhooaiWg3YfYUQ1qwAjzBBL95G7c4SqoJ25zBGdFZsvMtossNZ76lCI4QQ0W3cQDl1W7klNsz3xzWID/Kzzq/2Mfavrx1w0jVqSii2eH+qj12h/GjI=
Received: from BN9PR03CA0863.namprd03.prod.outlook.com (2603:10b6:408:13d::28)
 by MN6PR10MB8142.namprd10.prod.outlook.com (2603:10b6:208:4fd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Wed, 23 Sep
 2026 09:37:18 +0000
Received: from BN3PEPF0000B36E.namprd21.prod.outlook.com
 (2603:10b6:408:13d:cafe::3e) by BN9PR03CA0863.outlook.office365.com
 (2603:10b6:408:13d::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Wed,
 23 Sep 2026 09:37:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B36E.mail.protection.outlook.com (10.167.243.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.5 via Frontend Transport; Wed, 23 Sep 2026 09:37:16 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 04:36:46 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 04:36:46 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 04:36:46 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68N9Z3Wa1760658;
	Wed, 23 Sep 2026 04:36:40 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <Frank.Li@nxp.com>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
        <festevam@gmail.com>, <andersson@kernel.org>, <geert@linux-m68k.org>,
        <dmitry.baryshkov@oss.qualcomm.com>, <arnd@arndb.de>,
        <ebiggers@kernel.org>, <luca.weiss@fairphone.com>,
        <michal.simek@amd.com>, <sven@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
        <r-donadkar@ti.com>, <devarsht@ti.com>, <u-kumar1@ti.com>
Subject: [PATCH v3 12/18] arm64: dts: ti: k3-j722s-evm: Add overlay for dual Arducam V3link fusion
Date: Wed, 23 Sep 2026 15:04:53 +0530
Message-ID: <20260923093459.28125-13-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923093459.28125-1-y-abhilashchandra@ti.com>
References: <20260923093459.28125-1-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36E:EE_|MN6PR10MB8142:EE_
X-MS-Office365-Filtering-Correlation-Id: 2149dbaf-77ce-4cac-6165-08df19564169
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|7416014|36860700016|1800799024|13003099007|22082099003|18002099003|56012099006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	bf6Dkh/nGY0tQwgjpy+A9RRU5Vk4XP75FQH2XMydocaC7iW5jfSV7DUl8yx6iqTTSWbS4YiqVjiCCS5eYWP2N9ncBlL+oacJV1rfkiANpVycEqYuJb0ctwwoLBdp4vJFIWy3IA50KMbNmJW6Q+d8U9g0KlhdozpQKLxClE9ciIzwz5F35nWoonlKv/C0WkMdrwvxuAXKykDbpY5MtLsyH6xtlHEesnM0bXJ9eLRgPMtaiK9qFtGRDCEOQVNquwc1rDNV6Cs7UIuDWi/5rfCaYhL+irrwhhQnnBrRbbHzpplmjBCjqsEGEYg36G870jPZP2Jqs9D3NbwRyX8w8K6vcEPmm7pPuirgeVb4Zb0oNhg/J5X6C3p53D5b8ZhZeK+AN72Nvawk+urRg9sRYw7CgQi+eJ1QvEUL0DJCH8B9wMQLTiCLG/lJ6oEt98bvrWAKyw+eGytrIM9Wxr9m4IXOJyJAN91+07z20Q/iq535VgkLuC4+vTjMjlw47LeAW1Jcz6H86Oy4gKG0Kkl3xYXpeirXXdnQwqIFwXR7URsx3FYw1S0AUzRJaIapt6izLkyFSFQxLjnt/pDA0F7jh3VPDhMPTfT902F052oxXipH0L42e0OkJ0/0w6OEYM7XWR/UL/1Dzo0zlk1d+E+LOpif9w==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(7416014)(36860700016)(1800799024)(13003099007)(22082099003)(18002099003)(56012099006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EFXoQ/0I0JRXGg+gr1aplqJ07f4x77G5kEO7Hjjz2dZxhh2K7E3gDvdeEWl/4AD1suDA6YBiGK6gk/nkkFcInkXopTWvLCkC8maRE74x209+thGVpuqk72Dx9oY/c1XM5mFy6qEfzdpcvzV1XtsgSvQvvt4qat8weeeS0kcOmMyTdLIrjspZDk4Hkpb2H/i6XSCiyjmSc0TDkaWABVP6tovwAxwL651nrdGhL1jNTR8UsRFGPSTwnG2SwDAKpSKnXcBljTWNasRwnKf3FokJzIdoegiD2ls7b2+Swa5d4gQFqGy2jjbAhEsZ7eH12bDlyD9I02lGN+My/zHGdF0amJBc/ww13CvtF7ALls6oIM81W0xXUf93oyewH8FOeTTY/pABw0hj6bp1FXIbzlSJbq4VyuQm3lpr+yw4wN0+xcCEygdEWj+SzTaxVRTeWUTn
X-Exchange-RoutingPolicyChecked:
	i/R352r0gic49dpir6TwvpcQsyjoYhsf0f+99U1lVAmKdVqHElGXz7zFoebxJaIbvX3KXBHjJ5xOjSvNMy692oPRr0rHylnCYdvd5wBmttjOC9GAO4lMe+DSZUmAdf/m24XOxmQ+nLD5FzC7LsyKaUoeah7YMFXpYkwYudwtojkjo9cDXeQp6H+TOljzgZehJyruO/Gvkqjzb5PNmktkAzJi0se0EgdQ2JEV2Gmc7MC4dHyD9typZ4txmS4i+4mvbbvS+3SLeWrSZRrr0QENHXtzK0OeHhfYUPDpy8e7K2cTsQ20pFMmqy6OlT9S9RcSd+eVcOxSoQzkupxGhZdODA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 09:37:16.4007
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2149dbaf-77ce-4cac-6165-08df19564169
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8142
X-Authority-Analysis: v=2.4 cv=INaXmQvG c=1 sm=1 tr=0 ts=6ab39dd0 cx=c_pps
 a=imb72M7KABO0D7Cp285+Zw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=KtRVGM7OAAAA:8 a=sozttTNsAAAA:8 a=Z8xMYOVCaEgyEAq84WkA:9
 a=fO9at-cOa0qPyS5aOM0m:22
X-Proofpoint-ORIG-GUID: xOKeWxAxmQ5RLjzr1UVLhWY8UzGuM6iH
X-Proofpoint-GUID: xOKeWxAxmQ5RLjzr1UVLhWY8UzGuM6iH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfXxPm+miCzYCTa
 GwGpP6uFa28fHq251hBmPsP64Wys+VTcxvDGpskOfbuBaoo5y33FlLpB8MWLIQ/aCKlFas7L4jQ
 gZGOTqTom2r1eOeO1WboqOS0JfhNwGKZlCxRr+2FpDSCQB2I6xJwMjjTf11FKnNn9eehFxMSMFO
 qUagiRkgi2EFLxsXGVqz8mNsWv9gnVdwdTPy+QH53ODLRYo+0Mg7cYV3+tbwIDyQx4GHgW0vqeD
 3Xm+B9Fe13DAW9FGDoLbnVDZiPE+Jd46pV04EVCIOPQog0gSvHdlbjxjyPfJWFIYVWjuOMNec89
 0+qlMH+d3dx84TIUNQ0LiqgpEZTjHtpkLQ5y+IoFOchRuLzwFlsuTEifYOQuHB34700W3hQUg/8
 FfGY9O/nuBVSs1lozDwpBf5c0DeyCthArkQeNYaq8RvTa3NO338M2qmJ+2PtNjir519vqlZI09v
 8yd8R6Xay9h2ZqAQ80A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfX0TXliycJCoqo
 JxWSHrqAWKLgw8K+prh9L1S3MIhlnWa6IxxjY5Yb20AXTcNkMsdg1y7J4G7Wy/OTNCjM44yEbNU
 a4u8AmLbDTZ/m4fQHncF/1nf09DOnyk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230038

From: Vaishnav Achath <vaishnav.a@ti.com>

Arducam's V3Link mini fusion board [1] has a single DS90UB960
deserializer which can aggregate input from up to 4x V3Link (and
FPD-Link III) based cameras over a single 22-pin FFC (4-lane) CSI-2
connector. Add an overlay supporting two such boards, each connected to
one of the two CSI RX inputs on J722S-EVM.

[1] https://www.arducam.com/downloads/datasheet/Arducam_V3Link_Datasheet.pdf

Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
Changes in v3:
- Rename fixed-clock node to the generic clock-<frequency> form
  (Krzysztof)
- Also rename fixed-clock label to lowercase
- Override CSI2RX ports using &csiN_port0 labels instead of the full
  &cdns_csi2rxN node path, and drop duplicated properties (Krzysztof)
- Fix minor DTS coding style issues (Sashiko)
- Use GPL-2.0-only OR MIT license for consistency
- Update copyright year to 2026 (Udit)

 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../dts/ti/k3-j722s-evm-v3link-fusion.dtso    | 197 ++++++++++++++++++
 2 files changed, 201 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-v3link-fusion.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 3d503811168b..beb44ebe5277 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -212,6 +212,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-fpdlink-fusion.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-v3link-fusion.dtbo
 
 # Boards with J784s4 SoC
 k3-am69-aquila-clover-panel-cap-touch-10inch-dsi-dtbs := \
@@ -439,6 +440,8 @@ k3-j722s-evm-csi2-quad-tevi-ov5640-dtbs := k3-j722s-evm.dtb \
 	k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
 k3-j722s-evm-fpdlink-fusion-dtbs := k3-j722s-evm.dtb \
 	k3-j722s-evm-fpdlink-fusion.dtbo
+k3-j722s-evm-v3link-fusion-dtbs := k3-j722s-evm.dtb \
+	k3-j722s-evm-v3link-fusion.dtbo
 k3-j742s2-evm-fpdlink-fusion-dtbs := k3-j742s2-evm.dtb \
 	k3-j721s2-evm-fusion.dtbo
 k3-j742s2-evm-usb0-type-a-dtbs := k3-j742s2-evm.dtb \
@@ -544,6 +547,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb \
 	k3-j722s-evm-csi2-quad-tevi-ov5640.dtb \
 	k3-j722s-evm-fpdlink-fusion.dtb \
+	k3-j722s-evm-v3link-fusion.dtb \
 	k3-j742s2-evm-fpdlink-fusion.dtb \
 	k3-j742s2-evm-usb0-type-a.dtb \
 	k3-j784s4-evm-fpdlink-fusion.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm-v3link-fusion.dtso b/arch/arm64/boot/dts/ti/k3-j722s-evm-v3link-fusion.dtso
new file mode 100644
index 000000000000..a384168a460e
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm-v3link-fusion.dtso
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * DT Overlay for Arducam V3Link UC-A09 board
+ * https://www.arducam.com/fpd-link-3-cameras/
+ *
+ * Copyright (C) 2026 Texas Instruments Incorporated - http://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	clk_fusion_25mhz: clock-25000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+	};
+};
+
+&csi01_mux {
+	idle-state = <1>;
+};
+
+&csi23_mux {
+	idle-state = <1>;
+};
+
+&pca9543_0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* CAM0 I2C */
+	i2c@0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0>;
+
+		deser@30 {
+			compatible = "ti,ds90ub960-q1";
+			reg = <0x30>;
+
+			clock-names = "refclk";
+			clocks = <&clk_fusion_25mhz>;
+
+			i2c-alias-pool = <0x4a 0x4b 0x4c 0x4d 0x4e 0x4f>;
+
+			deserializer_0_ports: ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					status = "disabled";
+				};
+
+				port@1 {
+					reg = <1>;
+					status = "disabled";
+				};
+
+				port@2 {
+					reg = <2>;
+					status = "disabled";
+				};
+
+				port@3 {
+					reg = <3>;
+					status = "disabled";
+				};
+
+				/* CSI-2 TX */
+				port@4 {
+					reg = <4>;
+					ds90ub960_0_csi_out: endpoint {
+						data-lanes = <1 2 3 4>;
+						clock-lanes = <0>;
+						link-frequencies = /bits/ 64 <800000000>;
+						remote-endpoint = <&csi2_phy0>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+					status = "disabled";
+				};
+			};
+
+			deserializer_0_links: links {
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+
+	/* CAM1 I2C */
+	i2c@1 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <1>;
+
+		deser@30 {
+			compatible = "ti,ds90ub960-q1";
+			reg = <0x30>;
+
+			clock-names = "refclk";
+			clocks = <&clk_fusion_25mhz>;
+
+			i2c-alias-pool = <0x5a 0x5b 0x5c 0x5d 0x5e 0x5f>;
+
+			deserializer_1_ports: ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					status = "disabled";
+				};
+
+				port@1 {
+					reg = <1>;
+					status = "disabled";
+				};
+
+				port@2 {
+					reg = <2>;
+					status = "disabled";
+				};
+
+				port@3 {
+					reg = <3>;
+					status = "disabled";
+				};
+
+				/* CSI-2 TX */
+				port@4 {
+					reg = <4>;
+					ds90ub960_1_csi_out: endpoint {
+						data-lanes = <1 2 3 4>;
+						clock-lanes = <0>;
+						link-frequencies = /bits/ 64 <800000000>;
+						remote-endpoint = <&csi2_phy1>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+					status = "disabled";
+				};
+			};
+
+			deserializer_1_links: links {
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+};
+
+&csi0_port0 {
+	status = "okay";
+
+	csi2_phy0: endpoint {
+		remote-endpoint = <&ds90ub960_0_csi_out>;
+		bus-type = <4>; /* CSI2 DPHY */
+		clock-lanes = <0>;
+		data-lanes = <1 2 3 4>;
+		link-frequencies = /bits/ 64 <800000000>;
+	};
+};
+
+&csi1_port0 {
+	status = "okay";
+
+	csi2_phy1: endpoint {
+		remote-endpoint = <&ds90ub960_1_csi_out>;
+		bus-type = <4>; /* CSI2 DPHY */
+		clock-lanes = <0>;
+		data-lanes = <1 2 3 4>;
+		link-frequencies = /bits/ 64 <800000000>;
+	};
+};
+
+&ti_csi2rx0 {
+	status = "okay";
+};
+
+&dphy0 {
+	status = "okay";
+};
+
+&ti_csi2rx1 {
+	status = "okay";
+};
+
+&dphy1 {
+	status = "okay";
+};
-- 
2.34.1

