Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CC1443A81;
	Wed, 23 Sep 2026 09:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156269; cv=fail; b=b+YkzWJAwyKMa49B+2QItOKDvHz8+DFglt7myRj/0T3iGku+0YjiCgGzESlZT2A6DrlvcuhQrIxApddikneq3Luo0LqhYto2/OCz7FcAnCnwHnR1mATBgPvpv29RcCNqm1R8MzR6vTkVvYljYca4cIWcpn4bdNWKjbsd30spMis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156269; c=relaxed/simple;
	bh=sI2ddc7qBG70BLtngqp1+zXSL1mXvMKNZHnUnGJ9j3A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R8oT2FYXFIhMP0qqtC32An/E/rYazVDlJhjGKGZqIdrzm9LDbjyYgu4LCcMuyULwlpJ1kUEqCLGtPVmKKFs2SmFjtE621hBhboW1uXHXhwe1XIHnXKM6+jmq0uu8LBz3wp3Hfmmngr80Pk2N3g0RzYySe25UG5JlYKBJgzFE4M4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=LrCoPO7s; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=KZy1aGve; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="LrCoPO7s";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KZy1aGve"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68N8NBm41611723;
	Wed, 23 Sep 2026 04:37:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=6taMZTwwDAmvIXHPckYFIEovwqD3jVwqK1iabJ4aR
	Hc=; b=LrCoPO7sw5m122FdY3lbiUq7NiR//9kHltV2Bcq0zR/V80bbyyLavh9PN
	TpIyMrm0AsH/Bh06p+Yv/uBH4MCB3CkADNgYRZR173eBS0nAo+5dKDwRvX+UQ/Md
	Dc7T1IksC5AmW5yepi71Khx08HaCX/DUH/wLrGnCG+qiOtnUJCyels2BXVkVrfHA
	j8k6iNOv5HXKE2bpHr3cleJ5MWY1xYbk9b0arHBHAu1KIj+80frvr3bUOUN9QpOr
	e3tP+KwskARzjc72ZTTsbghMT5jKgsKg+gLrx11WVxBZWjda1zPan/Z6zrML12Vk
	nD0EPgSejQWEEzgP27ASHuI/VpKVA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010029.outbound.protection.outlook.com [40.93.198.29])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gvb77rdc4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 04:37:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EMyfPacROJ9xbJtdyFOaZmZ4pjNVEapHvUFYl2UHyRkAGcCPpCZzw4r7QBTynyH1nxCSsnXwQltL2y6hS7KtQZcrQJ8OeSWMhdWrPaT0T6zPDwOnclpsc1ub7Sjs7q0Ds7bG4nDmzAPe4LGCdrPr1Q1fbTqVE5bA9He1EhP0Tk3lb5qdgsb7cBR5N9OVw4ReKIuP5nnVMcypwMvlKEcWywETisIGjfwTWoVLG723ry8pvtrAthLJUQN9bwO5lUeYTL3oBW+xqBTpZPFTU21oOhfQlirvhpzlSZSnk36e624XE7y5vUa3r3dnNWFUXbnQbKgTNf8zgc3UCtoJ8tJlcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6taMZTwwDAmvIXHPckYFIEovwqD3jVwqK1iabJ4aRHc=;
 b=jTZNfiZRgh4xATd0JX5VhrjxVfsQxNvubxwdjcl0tpR27sXmP6NvVZgp+22P3UqqOKWz/x1+8fL0U0ymig/z2fpuf/iuk1wBUKLVqMfYSU7uuMiNxK01NrCOaDi5YpmSdSiVPtRL3h++jHwwJ+Gen8/hy0tU5+67vGNhXxcLwYjo4OZFa4+NyJ+kzkTJDxKDyaUQd2HrVCbUTMfk4IijrKG5tkhnLRUDNOxYJcCi9ka3Sn7aQwtXPKpA65L+pZNw1hY2ZVUYKAWQw02O+Gw3XQQKvzNLN1B4DNl8gjkIUGS6F7lRmbJXbnSwSvD/gyB8xeeav+zl6T07NWdR2wby+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6taMZTwwDAmvIXHPckYFIEovwqD3jVwqK1iabJ4aRHc=;
 b=KZy1aGveopd4Bjs7jG93TYTUMEdJER0vXGIhyxLkxP0h1kbFSdxTHHQ9sdGUNPxaj/waGpQEGGx4iaLtL6qH+939ilWkdIknry/Tw+8KhANKhSPf/HsG4zDsn+QLKWRZdhjarmxn8+eWTMcvsfBjIht34cSnMGtEB0z7IhNmJI8=
Received: from CH0PR04CA0034.namprd04.prod.outlook.com (2603:10b6:610:77::9)
 by CO6PR10MB5634.namprd10.prod.outlook.com (2603:10b6:303:149::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.4; Wed, 23 Sep
 2026 09:37:12 +0000
Received: from CH3PEPF00000016.namprd21.prod.outlook.com
 (2603:10b6:610:77:cafe::54) by CH0PR04CA0034.outlook.office365.com
 (2603:10b6:610:77::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Wed,
 23 Sep 2026 09:37:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH3PEPF00000016.mail.protection.outlook.com (10.167.244.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.0 via Frontend Transport; Wed, 23 Sep 2026 09:37:10 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 04:36:31 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 04:36:31 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 04:36:31 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68N9Z3WY1760658;
	Wed, 23 Sep 2026 04:36:24 -0500
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
Subject: [PATCH v3 10/18] arm64: dts: ti: k3-j722s-evm: Add overlay for fusion application daughter board
Date: Wed, 23 Sep 2026 15:04:51 +0530
Message-ID: <20260923093459.28125-11-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000016:EE_|CO6PR10MB5634:EE_
X-MS-Office365-Filtering-Correlation-Id: da552434-5ff3-47bd-cca7-08df19563e0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|82310400026|36860700016|13003099007|3023799007|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ZFPJxvr5R85vyGqfY3U/HPRh/Vip66G7gkROdxXszzAjgaoDOXL8y8WNBYXplpO+h64ZlI3T6ooYeMMs+8jsKmrflz7DIMRkznbP+11Rh5TGwsILa+wzvkmGn6mOV7F7OBovWkDPDbBYeN3Jtzd1Q2lSYlH85b/d5U/GuqvNhGOCUKmYYq1CM+OITBFkv60NUUwm0R/jzMsqRh7KAFCsLLOuFR0gXCg0xk3Qxyq3OVieH5NU1GE4/AOXsmDwwOjuxfmh8+8MTIlVLUfE7xMOpdtMwlbGxTWc/3XSwNG2i/C6AVxih1Q85wsZUuSXplkRBxiWQk96oYg82A4VOFnet5uVpSnI1PR9waa2kG7vZO5Dhlzi4GJ1TiHQFlquxYIMYD2rZ7mq5xIiX999k8mt/HTFmBPVcAmS/+RqAQj6fCcdfNrByfkVQNxV7X95QF5o3s5m3NXmrDdDUJze8Iutq2Sr9wGZgJI9wmHAxrasuZblkvwtTTJwr3IgPp0mkEMLJuUYF+3OHhadAmjrBpDG7SDFdBv8EPPb8/0yj0X7xNxO8o2SSQhBZAC5EejHyAw7MgDENBt4yrkK2e3X8C+tcLfmtDN1FMZei0ylq3eCXlzQNuiV49SYhwZI/+xDQlZ6OKKN0MOsR8bXv2B7fe4dPw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(82310400026)(36860700016)(13003099007)(3023799007)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IGgejVDS+Go3r5UVKRQGf9lVJ1QFAhJPM8Q6/L62UgDF9Ht68nO9NCVYFi+Ca3zKuaExlcX0HbbXQMGfrAggOIy3CPvifu48jz18r0xDwkjFV2lJ8EDrL7Hv3tVPTG9EOFvoYAcuhZSjkVuFWHMS2tM1iP2nCcO4O/iqZuPSSOe53yoF54nt0uM5mRpElkh0EZ4DKZ8C3WIlxRLAnDDFcfgI9z8OoUZebD40QwZ9s5d7JPeG+NSeyoGW7quMFnSpibrTvQKNKndnYooSk9GZTDyhXFsXvHMbh7UAosG37uqcBTm3A8cfg/PAfWhD7olrwAZlbuIZapTZ/8E6iQ7Z5UPOzCMRd6rzrwmgdVzVKD5BUWaMRBKriQK4KsgGVxvCIf4pWhMUXNBdA/qnJcMmLlXqlqWqM3AL1PcGPrMkk4qTg19gdeOLCeeEYgNlGoyf
X-Exchange-RoutingPolicyChecked:
	KnLyh39kR2V8H7LZk9xU4ZrEjH8jSVxWAvmZ6iEeBXN7E72QjBCMXVqWy4gTkTyvRvU8RwSNMzGnvnjouDSeXp2G3bBl28NA4BPhmsJWjReamdPDJ4wWYKPEegav5wzPfmvobMUvpzL9boV7ewDl9ZHkmxww6CseUjXpjzzJmq+oRYphTKLphIXLjXkWfchzTr+Rm5h2HW7Axq/pc6N/PX82kYsPrt19QS1xe8/I5frVsJL9VF9yRRlSWsoS4iOdQu8muTifX5lNVMMJrLe+eoOVzQVl2nH/luHrEjkwAt+iMFOd4uJDUmLtLgw4XeHdqIKHrc4o89iQ2cQzLaM7vQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 09:37:10.8008
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da552434-5ff3-47bd-cca7-08df19563e0e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000016.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5634
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfX/Eg7tl5c5yX0
 orbfqHKzqtGITO1q53nVyKLSPDLwovVt5ErceCz5iBWZb7ud+lykSscmVSTCT8q5/Zt57l+7wQQ
 XymsC+W7DExqhh3X40MzOICf5g5VoaqYDHnwTe3Zt6evC0psL/8jomdMeWusfsib7FXVrizm0ph
 a4+9AJjJw2VsaD9PYOKzgfh+xqHl1FNUMfkwt7WsaAumCYRbBX9S459nJ9JVWkeZCKpfLMC39Y+
 wVkPzXKzr3ZwhUB/6vKZz/3pqQWiRT52LiVTQGmGKZOJIC0WRqo51wSr+17cq9BoKG2Bh3A5F/s
 BG3YhvnLdV6glVTganXk0iYYiMk065M5QUwVIhTxKlU2zj7sp7mXrLfuNx65ZS1lWCi0WEaUgwE
 PlINTFYUD5m1sSuXOSQKSjVfYr3LSa8e5nMrVRvOhc9KDBpYpLRsAn4DmcfTHP+v2umykdqDWzh
 2EkAr0HWrmRKMPJtHdA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfX2aZfAgy/ZZD5
 63wM+tXC4u61ej+XelCx8N1t2ZpUJS7+Cx1cvNL8kDiXM4gt5iST+cIzLCsPzbWKHlI3WiLKPD3
 3+kUfdU9GKeoHLCsweIfPEAVIcViveI=
X-Proofpoint-GUID: BkoOfbs-08_VngI92XtacR0b17ljZ1G6
X-Proofpoint-ORIG-GUID: BkoOfbs-08_VngI92XtacR0b17ljZ1G6
X-Authority-Analysis: v=2.4 cv=cPt1IVeN c=1 sm=1 tr=0 ts=6ab39dcd cx=c_pps
 a=KMP5/9L46olBb+slh8+hsQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=iY-8cndAAAAA:8 a=sozttTNsAAAA:8 a=t8nLTxPk6ZERqU7PhUMA:9
 a=spcmYsBHvreeK_59bKkA:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230038

From: Vaishnav Achath <vaishnav.a@ti.com>

Fusion application daughter board [1] can be used to connect multiple
FPDLink-III based sensors to TI EVMs. The board has two DS90UB960
deserializers, each of which aggregates input from up to 4x FPDLink-III
sensors. Up to 8x sensors can simultaneously stream over the two CSI RX
ports on J722S-EVM.

[1]: https://svtronics.com/product/fusion-application-daughter-board-evm577pfusion-v1-0/

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
- Use GPL-2.0-only OR MIT license for consistency
- Update copyright year to 2026 (Udit)

 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../dts/ti/k3-j722s-evm-fpdlink-fusion.dtso   | 179 ++++++++++++++++++
 2 files changed, 183 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-fpdlink-fusion.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 15b69fb1cd43..0fff4c815597 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -210,6 +210,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am67a-beagley-ai-csi1-imx219.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-fpdlink-fusion.dtbo
 
 # Boards with J784s4 SoC
 k3-am69-aquila-clover-panel-cap-touch-10inch-dsi-dtbs := \
@@ -429,6 +430,8 @@ k3-j722s-evm-csi2-quad-rpi-cam-imx219-dtbs := k3-j722s-evm.dtb \
 	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
 k3-j722s-evm-csi2-quad-tevi-ov5640-dtbs := k3-j722s-evm.dtb \
 	k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
+k3-j722s-evm-fpdlink-fusion-dtbs := k3-j722s-evm.dtb \
+	k3-j722s-evm-fpdlink-fusion.dtbo
 k3-j742s2-evm-fpdlink-fusion-dtbs := k3-j742s2-evm.dtb \
 	k3-j721s2-evm-fusion.dtbo
 k3-j742s2-evm-usb0-type-a-dtbs := k3-j742s2-evm.dtb \
@@ -530,6 +533,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j721s2-evm-usb0-type-a.dtb \
 	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb \
 	k3-j722s-evm-csi2-quad-tevi-ov5640.dtb \
+	k3-j722s-evm-fpdlink-fusion.dtb \
 	k3-j742s2-evm-fpdlink-fusion.dtb \
 	k3-j742s2-evm-usb0-type-a.dtb \
 	k3-j784s4-evm-fpdlink-fusion.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm-fpdlink-fusion.dtso b/arch/arm64/boot/dts/ti/k3-j722s-evm-fpdlink-fusion.dtso
new file mode 100644
index 000000000000..05fb61eb19de
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm-fpdlink-fusion.dtso
@@ -0,0 +1,179 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * DT Overlay for Fusion (FPD-Link III) board on J722S EVM
+ * https://svtronics.com/product/fusion-application-daughter-board-evm577pfusion-v1-0/
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
+&pca9543_0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	i2c@0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0>;
+
+		deser@3d {
+			compatible = "ti,ds90ub960-q1";
+			reg = <0x3d>;
+			clocks = <&clk_fusion_25mhz>;
+			clock-names = "refclk";
+			i2c-alias-pool = <0x4a 0x4b 0x4c 0x4d 0x4e 0x4f>;
+
+			ds90ub960_0_ports: ports {
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
+						clock-lanes = <0>;
+						data-lanes = <1 2 3 4>;
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
+			ds90ub960_0_links: links {
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		deser@36 {
+			compatible = "ti,ds90ub960-q1";
+			reg = <0x36>;
+			clocks = <&clk_fusion_25mhz>;
+			clock-names = "refclk";
+			i2c-alias-pool = <0x5a 0x5b 0x5c 0x5d 0x5e 0x5f>;
+
+			ds90ub960_1_ports: ports {
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
+						clock-lanes = <0>;
+						data-lanes = <1 2 3 4>;
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
+			ds90ub960_1_links: links {
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
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

