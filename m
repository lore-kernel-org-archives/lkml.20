Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3023BED6A;
	Wed, 23 Sep 2026 09:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156198; cv=fail; b=FTjMXAd2pMC5FKQ+qclic8Aerc7maKo5DlA9VOVR9kglpmLMXXBlzMzPevLQRFoOETsg6uZZdhIB/chvnSLyGuvUz+7OxN8Wy7q8RgOwKOr0ts8O28Ma1UPig2XKjcsu18qBjYn66NlCFt7ohtOa+sS2BmJ3m4iQRgIVrpt1KFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156198; c=relaxed/simple;
	bh=zSbITv2WFlxpzTsYMdZv/iH954nh/A8Rzt51Ou43xGw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hGd8V3gUKT7VfLGn3f4WFZbY1QmVcVU5XwdYe0+Bw8KNk0xwErbHLAsfO5D5EpZNycHmLk/YzSvHANhSeoV3f+8Sccly8j+gZXPGw/VqOwHQjuorvW4GIy4jF2bZzrTKc0SFnPNC3MGk5KV49hqXirH/hEXKWhjikAcyAV9mT+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Y0Y0fhNY; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=A2GHqP85; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Y0Y0fhNY";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="A2GHqP85"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8JGGR775676;
	Wed, 23 Sep 2026 04:36:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=D/yi3SAtwSX7PwtgLSOcdWvMxtmyHWQqpIfMV1Om2
	TE=; b=Y0Y0fhNYqSQ4b1ytakfXirOnW/AAs4Gjj2mwlcI4cAreHzATzGnnKrBEs
	1vLZMD3LaAJUrk0D7e8SOeQbd8gIUt3iSPSYpT+QgungZ29fNA07wRUWJ4SuipEB
	v0kxoZlBHoAYsPdmCt/Vk04nJGBIpQlsx5APV2nmRC0ov+N4PCriMB0928V8HWRM
	7HviKH1Wj724Fw4YHeHPdCR63egq8cuJ7XlbUPkreRXcib0A617GpXI9ZXWT3xod
	Jr+DVwZcg0rroW+SpDT5HB7s56MZAWOYbyDNpEIDPPYfY00mVCtV/gp608sV24Mn
	MG0JtBBXNNPvtlEE7LzQ+8f2/BQog==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012041.outbound.protection.outlook.com [52.101.43.41])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gv2ycu2fq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 04:36:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pwLCx3ooEChKineUo/I7Wa0yeO3ntxcAUGq/68SdaxiewUq6A8/2uaSTjcWRoGh8Pskt/1/XyF7hTbr+k+EG9TCtscyT6TB0+JmKAD8Ujn8DFyOPOfJv/k3PCscSWAtH1nRMwnPHaLLS449wVWMxGx5a/O0Vom6UrspJ5V30W4BuhRRGP4n0sY1zUEbYAYYunobRVAgSjSzVy++cOLXCXoBaJzhs53LGGUGggvRnC2pAIfvSpfULSmlTsIZJXcx27N8D6X/9DR+sLmm7jyndGnAi4LoF2RQQgBoerXtRr3i9n9qjIQoEk7asa7mf+Y/2f87hXoVKCO13ezHMGKkZPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/yi3SAtwSX7PwtgLSOcdWvMxtmyHWQqpIfMV1Om2TE=;
 b=AkfioQY9NWk5hQo+Hmtv5iYg3y0f1iRpr2FneG634KrqG4zKRzkgtXlRbsQsIDl8JzF2BBQJf8NYdT+ZfbAg/t80j3ctf01FHZ7SXSHmIFOPVeI1RaSHzBCNWiiotVG/rRBz/Hx2UUt3EJPRMrF+vWDSPxU0XD35BW9F4vzNbWQXJNB6Oqkg8L2qn0K4T+OC1ePM4ahvxqZHlY9xdH4ZNe2sYEYf1+40gPahDCM69maQfJPwVW8xfI1p7RGQSxLjSqrIq+AHluqjgH1WSQq7c0MQco5CJEoviQGLoyOEuUFAPBv8OsAS66An18sdcpkgamlZHpsyQoDBdQ5jTSg21Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/yi3SAtwSX7PwtgLSOcdWvMxtmyHWQqpIfMV1Om2TE=;
 b=A2GHqP85gixdBn4nR37n1a2SEcsXdbcfR45Hh4Oc+sm7bP3U/5Pp3C7zbhmzZ80dSU4jsS1hYG0cqEz5DDtY33YNO2rQJpIk3lA8rusNDzcvTPMLFQuH+IXiQoVzru4K2bCB5p6fD6lDMxxra9c1PeToUzjaBaINLHX6VQTMUQM=
Received: from CH0PR03CA0331.namprd03.prod.outlook.com (2603:10b6:610:11a::22)
 by CO1PR10MB4657.namprd10.prod.outlook.com (2603:10b6:303:96::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.5; Wed, 23 Sep
 2026 09:36:13 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10b6:610:11a:cafe::7d) by CH0PR03CA0331.outlook.office365.com
 (2603:10b6:610:11a::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.16 via Frontend Transport; Wed,
 23 Sep 2026 09:36:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.0 via Frontend Transport; Wed, 23 Sep 2026 09:36:12 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 04:35:36 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 04:35:36 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 04:35:36 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68N9Z3WR1760658;
	Wed, 23 Sep 2026 04:35:30 -0500
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
Subject: [PATCH v3 03/18] arm64: dts: ti: k3-j721s2-main: Add multiple channels for CSI2RX DMA
Date: Wed, 23 Sep 2026 15:04:44 +0530
Message-ID: <20260923093459.28125-4-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|CO1PR10MB4657:EE_
X-MS-Office365-Filtering-Correlation-Id: d6659887-7371-460d-c9b3-08df19561b6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|82310400026|1800799024|36860700016|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7B6cdJYVQ+aFc14SebsNESGxk//wqnwZKlPfZb394eYWKgj46fA91gygoM9fzaFOmUe10XR9HwcwWFrjehroj7+e9EMYU9xEyP8uHiK58bFQsCkAUvzoSAOHwRHLhOFDTXPyN4N2l3os2ENOBFefsyycM2G35LiFamwmGvqlaELqPU1bg6FoBCHn2NdQEzN4eWb7YSJhS+Z68S6dW/2t+Q81IWalWfYLVjPSo62VyTBLa0nO22gDTg6q4fx+84ONVvke4iUoSmO1OWzfiBCE3YUtjlIpcTu8lLIIv8qFrPnZOYp2Ke0xjG8OBSZOVR5+l6KEVg7VjepUI4C32nuN+FOQII4V9ViK8Jr28V+c0HY2TRhiDoQPOKeIb0A1fZlVqtjb7uAyn98XI7UsRjGNagtJvcVKVZtLesx3qGpAEu2SSgFpLg4JUltdwhkIJvxfQFBswy25GEq3apW9Iy0x9UpcNsZw8JWN6/8Eqr/Hnkj5C99AnMRQgsf8BbdPgj+MnJcjbvK9byE+Ja5/3VWSWQoZLHo2wptOKGX4MHEYNqGTWXT+z5GniLCY2SzQ7rwBENm1uxekA9DlaUWz1eqjDcrDxIlOU69fgVg4wljdYbvqOs7wQBFLJjnwukORjEvbj9LDe2/UnDHE17JML++jL23KucB107vBVEA6BoP55t2bLg2/9MiqCU5cBfAZkaGHS660ZMiHsVVDON84KYpZiw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(82310400026)(1800799024)(36860700016)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6GLjpbL/9DY4lL9ccE8zLEuEed8ysW202gDiaEqcp5XYo71H6xRRTaGNHr26Mj01cOD3dsCjGoHfKnK5aIuRrjtoBGWFUBXUoxN2qvnurU6hpQrvxgPhen6qLNkyvHXAGY2DfBA3+/5bCrA/l1RtQMHWlFWDVV6is9j7Sng6kRFNPyGF0JHdk/rB8+BAY75MXBjENcSnqpUXvWNQWhymNWuDGrhKmDZSCnhpLTpPzZW7V/tykIPXPnicpNEgW0C9pY+opL7PLceWZk3VSz9CKxxRxIoGzN2R9p9eVOGlXTPzE2ub10RmWeeJPK98HlIiF5/lOIXp7dGYd2rwa66u/Yyq+xLQUrebwIFirchTgAtbMtswWDgprmQCxvJCxfRtPN089Gpa5sKz/SD3LMVqF/+ESbIZPm8hDKHgBkPPx7vOFwQ4ZwoLXr9YVb8FFnpk
X-Exchange-RoutingPolicyChecked:
	dn3hitfN43jFpodWpR8Tx1s31qpTMhW4bPmuttc8R5v12qlxqoxXrTNv08izEl/YFXsaTmMeo5Ex42hETel4AjFTzEB6JJHMBhpWztG0ufOpdOzHCvLH8UguK3Etn/TxwfPGx0qzJlulrtVpIs7vocP0g7GkmRqStfD3Rl6lnWTEB4vKZ/r8qD1BYNneMXeYwU9RQzscV+cDwkvmohDH62f5OrtoQuLVRa/w6VIlrgWSeBGTa79lr6m+oVOfczfsdsMNsCIb4wjl0UNFZpHAEYbAluwDMM6Es6EkJlz7mLz47g7zz0RUgh1diEhecTha052mD5CX/54iV6QZlHWqHQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 09:36:12.7159
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6659887-7371-460d-c9b3-08df19561b6e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4657
X-Proofpoint-GUID: nMJCPQ9vd9nKo4ond_2-LnNRIjdTxQGk
X-Authority-Analysis: v=2.4 cv=WZKZ+EhX c=1 sm=1 tr=0 ts=6ab39d91 cx=c_pps
 a=zZ5onIKbzmoLkk/LR1Usmw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=hgJp_EOl-7JfuhX-_g8A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfX9KC0iXhnPngZ
 emgUA91XR9cVO/c6Ypw/KNfOmaeBm3gdKCdznyOLtE8yyz090K1q7OAT46hhnVLIg2fpwbklGIq
 /6N71oYbAgDZScqGJhiIjaPGk2sufKr63h9OOhlV8otPT6Sg7APAB92HBX7NXhVBCoskrMhFxo3
 8m8iqdDr8IASTrCSRQcNadn55j9KzOSPiq7ubuGZshlM++Q3DuuFFQctrP2Ym7l4/N0PpOgCeg2
 OYDuh17C/3ralAlfP9O5XYpYe3VWmlLkNP66k7snG4e/2m2vU4IAOIXt2tQDiFXVkC0/eQqwfd7
 A0Ti9KOgaKQV7o2wJ6hsn+wAzZPekkFW7sob24C7awtwEGnkYfRte5WVkylouGFFCq5Di3GV+z7
 K6J2cHROw205dCezWdhLKk6V54goM3vP3vkz76TPcdVCfe8mijT/3IKOv6b1eQFbmsMynhW/mRZ
 OzzFZHFlj4ftDVRXTAQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfXycRoFQmfsYRE
 Rjf2iO6T7S4hIeGGWJW96gwKddIruVml7XVSC0X+0yJJe7NH9Jqr4Zvd9W3mH9OxqzZonBL8cS7
 OTEqSghjMd+/aUj1qZv21M/GJwHYF60=
X-Proofpoint-ORIG-GUID: nMJCPQ9vd9nKo4ond_2-LnNRIjdTxQGk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230038

From: Vaishnav Achath <vaishnav.a@ti.com>

J721E CSI2RX SHIM layer can support up to 32 DMA channel contexts. Add
additional DMA channels to enable multistream support for CSI2RX.

Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 5cac119e4292..f4b8713873b1 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -1239,8 +1239,11 @@ ti_csi2rx0: ticsi2rx@4500000 {
 		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		dmas = <&main_bcdma_csi 0 0x4940 0>;
-		dma-names = "rx0";
+		dmas = <&main_bcdma_csi 0 0x4940 0>, <&main_bcdma_csi 0 0x4941 0>,
+		       <&main_bcdma_csi 0 0x4942 0>, <&main_bcdma_csi 0 0x4943 0>,
+		       <&main_bcdma_csi 0 0x4944 0>, <&main_bcdma_csi 0 0x4945 0>,
+		       <&main_bcdma_csi 0 0x4946 0>, <&main_bcdma_csi 0 0x4947 0>;
+		dma-names = "rx0", "rx1", "rx2", "rx3", "rx4", "rx5", "rx6", "rx7";
 		power-domains = <&k3_pds 38 TI_SCI_PD_EXCLUSIVE>;
 		status = "disabled";
 
@@ -1295,8 +1298,11 @@ ti_csi2rx1: ticsi2rx@4510000 {
 		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		dmas = <&main_bcdma_csi 0 0x4960 0>;
-		dma-names = "rx0";
+		dmas = <&main_bcdma_csi 0 0x4960 0>, <&main_bcdma_csi 0 0x4961 0>,
+		       <&main_bcdma_csi 0 0x4962 0>, <&main_bcdma_csi 0 0x4963 0>,
+		       <&main_bcdma_csi 0 0x4964 0>, <&main_bcdma_csi 0 0x4965 0>,
+		       <&main_bcdma_csi 0 0x4966 0>, <&main_bcdma_csi 0 0x4967 0>;
+		dma-names = "rx0", "rx1", "rx2", "rx3", "rx4", "rx5", "rx6", "rx7";
 		power-domains = <&k3_pds 39 TI_SCI_PD_EXCLUSIVE>;
 		status = "disabled";
 
-- 
2.34.1

