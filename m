Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEEC43F8A7;
	Wed, 23 Sep 2026 09:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156244; cv=fail; b=K2dVmjM5aGMvU/TxCvkX6VkN/jNsJ87eEGpndGEu5Ls1MC4gnorhJfZSfF56v3VKrd4uITndqQJu1LsfthY2kcLCFTETwzFm4uz3U7zo1dBySCE9309SfekYRV6GBMIbaqTJRW6ztN9LwlHe1gewVwWtQER8f8jJ2dr9pf51ja4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156244; c=relaxed/simple;
	bh=U1ipezOmIAWl0RUCDpJN/ebLO24tWpFjryZD1YFBeSI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DInAvCPGK6OUqyYiBVEIgKwT0vhHKSTQOlyxt8nVm+gmTrxxDNSc3tLJdF8w4QKCaqhIG73v7iKvxseYt8/06XAxLpL987+sJKLMy2Ak/lZNgJriqjeRb3qcZJAdWMNOgPCYfEAW0sEgrZSetODM+oGBXzK3/tu/MHcIFJ58Q0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=ZxmODEqj; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=o5nsO4CK; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="ZxmODEqj";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="o5nsO4CK"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8JDTY775625;
	Wed, 23 Sep 2026 04:37:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=2HWWrbtym5i8cEWJ2gpgA/wvheN48qRyVTF2/Y7fr
	tg=; b=ZxmODEqjEZTYnjmh0vmKWmalE/mYgqo5WCbQBbPSnGJp8VreZBE9YrAbu
	359WmJC7Jl7nTLEv+zF/U9ZhlidjQHUOxwl8majpckFR7M4x0xzaAo1yxyjOqH4z
	OgcGguIKD/qqkTs8y3u/YxDYcW1XNxKsyQv/DZaYWAGBZOyQLkhVxNJVITceoJnG
	rSHXe9I/0o7E6g2EHmZSs2Q00bEk4L/LqmVNhQyuCFXPzgsO08qVfQ2/vWN1KBhZ
	B3pKeM+54BKOLXe5GbrxnLlU48rHguYW1h2CkMQqSo7SmizgHcyV3LqSTd5KCmLZ
	Zc3iT4HTNY2H4mfqKj33LTjZFmJPA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010059.outbound.protection.outlook.com [52.101.201.59])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gv2ycu2mk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 04:37:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TSE1deg1ZBSTmRqMlU6+a1AIkrVWfPgBsHUAQd07waIb9jYj0h845ZPYnabTrNojdQF6Lm2CF2cM4n2Nkg42pRRBmGAAjMeavdtcDsEwCC9rloPLy1uFad/bjP1BNIugQ7QzAnoQQInXg/Vm0aCwYirX5sWEL7sPuAdkMwYOPSHOSJivx9UtGX1gg5Eotm/8b89AXUJIskHhW0+92HfUfXhPSdRd1E4Z7Ej1Yv6OncjSmWcwWt5sLgObuydRLD2L0GUWIs3a6hDQ5wYauw+Gic+Yvr55R+uvf5gCVzBcYxg9cIRYg4afKUGoO1wWl7wXX12XElGiacCkU8RjI1zpxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2HWWrbtym5i8cEWJ2gpgA/wvheN48qRyVTF2/Y7frtg=;
 b=HFscFWxaY6d8IjzxsRPWQWO+oaMOGnJNDbPoKrM1Adr4mxZtdPAPrelEkBFS+RTr+QQPQSt2HXCJRmJQq5UyELL6oTU07FB0p4pHnqxC0fTlLOYO7HgVk8K6vuCYZFu0WROI/vmYliaZ5gwBbtKmLnAl2dgO5yGUsenXDJHBw0KkM1esS74FwxepA3jWl8psOWFjwL6ch1FuVsXHXGGRuKemLdjQaBgghe4YJKePiSHW7N4lLctqg+vzbpdRvdphMRfr419mALFY3mYJmd2+HiUhNm9hN+qSvkYpX6d+n2+W21w4Q4IsZVErAZkbAG0aZlQqAxjSLmXjFuq+cFKMqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2HWWrbtym5i8cEWJ2gpgA/wvheN48qRyVTF2/Y7frtg=;
 b=o5nsO4CK/Vd6cwpx1oxkXU4tCXg2i1ygxgFViLNKkT2uWAwRO8Au807jH83lPDSiwVV4ClVaZcwTuPGogWDS+TS8hUOHhmxs/FGPhXabr+p0pXeh0/86xaXUfhanhAepYSeLW8qep4dj3+lhF4GtnsAFTFaKbJ2lqcbmXNCF/l4=
Received: from CH0P223CA0024.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::12)
 by IA1PR10MB6076.namprd10.prod.outlook.com (2603:10b6:208:3ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 09:36:56 +0000
Received: from BL02EPF00029928.namprd02.prod.outlook.com
 (2603:10b6:610:116:cafe::17) by CH0P223CA0024.outlook.office365.com
 (2603:10b6:610:116::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Wed,
 23 Sep 2026 09:36:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF00029928.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 09:36:56 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 04:36:39 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 04:36:39 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 04:36:39 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68N9Z3WZ1760658;
	Wed, 23 Sep 2026 04:36:32 -0500
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
Subject: [PATCH v3 11/18] arm64: dts: ti: k3-am68-sk: Add overlay for dual Arducam V3link fusion
Date: Wed, 23 Sep 2026 15:04:52 +0530
Message-ID: <20260923093459.28125-12-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00029928:EE_|IA1PR10MB6076:EE_
X-MS-Office365-Filtering-Correlation-Id: 86f0c853-a1e2-49de-35f8-08df19563567
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|36860700016|1800799024|82310400026|376014|13003099007|3023799007|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Z9dlu40UyDAQW83Ajl9/J10ppjMs157lqlxOMtzDx+0Yq0zq3VSv1NS0vEYRo5Ub6tIT1S1zVkY0mrj0yDJys8D/FpQFVpkCN2635UveqUunz+VMoxn6CQxIex8dPAJZbzEob/lHNis9vV5Rx7iJjgHoFwmWmLZi6DIe2SnFYWHbhE29e6Ay4Mej2CLW67wQaBrc4J6Htr60gL3X79EvyHj9u4IrQDzjsxRlEY6OkivIm38OqEUcriSzbt0gL9h6Kpetdd9UExiNMV7qIxJDQxZq7KmscqFZJGOi30IMdNrGpeF7d9ZLm7lVq3PRO6kYzoMXrmsJBHejGPaZsNYT73pCMBgMMd0QuAGAvZtel1fLRx8BT90nBc25qgpSdElPdVKovnX6DrThUclAJetOV7r7ExyLk3acyUshO7Q+4o0io2NXL2uqVcDndufASduKHSb3TEGhtORa0Mt7EyOoJdp/v/gTim5BKDpUy5DT6XWFNY2K7qfFPAWzsZP2UGs7jMiepJyOewWVMWAGQb4H99CEmjYP85nB9gvqCxMCg5OD6FJRbeiYBIFD/o2FA6yBBqDwgT3WW1mykaJwxlKH3MdSMBhHg7/PkTM/Zv6nFs8/7/mv8SqVZre6eZPF4QRRtfqbZHzxrKLbUMorhE7Whg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(36860700016)(1800799024)(82310400026)(376014)(13003099007)(3023799007)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DBUTYXf0ZmBTtmHh0jIG32YF5p9U7dK2glcZ4jSov9CFGl8BV5rDLZo5FpaK2cpkhjiI1KSIaxM0X+vH+aosWwqugOctdqGjc1e20nx7q1XD3WCoiuD11x4OAfRL/gP7jrJdl/R4mm4rNMWAfBkBxVRVpTC0Ak84Y7379WWyRJPBKO3NY5pHDmOyitWoKXQSAzPZ3yWJvb2/ZxQIi3mnOBPrG+AgJFMvNT4ZD21DF5fPFOv9fqnDojPt0tNM0kweef1dIDm7YaX5qhyUqpUkST0mRY3OPgt8EnXwBS+JZSQI/fl6UMM8sOAFDzKNc069rF4jhdNjiIi9jwyVQ2CDy4VrHorosM51bR+M+Dt2fKuH2KcuLgYgaERE/j46yJZCLAZ8tgSP7fDrQb4l42H0/E4BQc2ffgdNgVBhNfPudozTmXCJuTmRXivPbTCqsQ8j
X-Exchange-RoutingPolicyChecked:
	hdCQAv+HApj0nXvJ91JWRrERTDYmzyddPIDrLC3yDRrkhS7KdNCnZD/4Fu197Llw0vVpjRyej5qWh8y/B5WVAs/vLmD4UVdRLVfKhcKkGarYJf1sKySZ9zxmtTJkxhhxRzD2an627dF1axN9hnkAjZ72BCvhLAjVGf77hnEmgZestp2doZlKyt1VBfsU9M8Z92MKv53mSix4idhK71Jlc/uKYXd/EPPPrAwgxdm+ryxzdXEeQr6mnvY8254pQB9IXrgM7GK0fyOU+lrgq7tFPu++VxtrvInG92SraOoENha+EPoJP5M4J7dNoSucNSa90Dn/cvJONZ1b2mFdui/s4A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 09:36:56.2543
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86f0c853-a1e2-49de-35f8-08df19563567
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029928.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6076
X-Proofpoint-GUID: 8dZRSaiX7iEUVAYz_-2GFdgjA-l7dMUB
X-Authority-Analysis: v=2.4 cv=WZKZ+EhX c=1 sm=1 tr=0 ts=6ab39dbc cx=c_pps
 a=mPJaQZadrGlgYT55Vo1ogA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=KtRVGM7OAAAA:8 a=sozttTNsAAAA:8
 a=Me3zt4t8hVSPujjKYl0A:9 a=fO9at-cOa0qPyS5aOM0m:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfX7arIVljThbSE
 mRI5OfS90p2LarWYGsEPQKUvPeUvwL2P2ySWR75sXYnQofkCSsoSpqtRhZTEL++IDo8I8iJcxr7
 OyLIKWgfkrleLjfySKZuQE6oFmi+LzUWGfy7D+6p3XT0G8vjTC+pCXoofIa4HWpvevPz7tqW5Ts
 VD+o5sfgNh9Js01TJFQCa6veE7wLYN47215Qrw0iETGReKrhJKxx1PfxyNDYZyW5dro6xI8EcdE
 wjb62rsz+jqwswaHzBdobRv2NOR54X/QB9APabbQ8fkm7AXuNV7bPj8rPGY5yu5lDZ6B8nXqksf
 0lpvLQK/NcHm3r481r/eZeo62+XnjKTLrNWs7s46Vzwkw77i785y99hND+/d7XU8C7qZ2txNjvO
 SD+Sc2jY3cycd8yb8qHwmR494NLGzi2iegUz7tJ/DMIkXL8LqA2n1pZNtVZYEcY3WSsXXja5P17
 dMtODCBgVv60VrBQbTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfXw95tP+R5cRaJ
 I0XYH19lgyELBHvYNQD4QuV7cy0wu6hS2beYRkAPB0mNDp3vKrxGaQ/qSb97cccsxopubzrUERj
 0FhtLIP+DfGXMp26BYDDA/nBd2MLCdQ=
X-Proofpoint-ORIG-GUID: 8dZRSaiX7iEUVAYz_-2GFdgjA-l7dMUB
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

Arducam's V3Link mini fusion board [1] has a single DS90UB960
deserializer which can aggregate input from up to 4x V3Link (and
FPD-Link III) based cameras over a single 22-pin FFC (4-lane) CSI-2
connector. Add an overlay supporting two such boards, each connected to
one of the two CSI RX inputs on AM68-SK.

The same overlay can be reused on AM69-SK and J721E-SK.

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

 arch/arm64/boot/dts/ti/Makefile               |  10 +
 .../boot/dts/ti/k3-am68-sk-v3link-fusion.dtso | 184 ++++++++++++++++++
 2 files changed, 194 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am68-sk-v3link-fusion.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 0fff4c815597..3d503811168b 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -194,6 +194,7 @@ k3-am68-phyboard-izar-pwm-fan-dtbs := k3-am68-phyboard-izar.dtb \
 	k3-am68-phyboard-izar-pwm-fan.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am68-sk-base-board.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am68-sk-base-board-pcie1-ep.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am68-sk-v3link-fusion.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-common-proc-board.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-fusion.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-gesi-exp-board.dtbo
@@ -377,6 +378,8 @@ k3-am68-sk-base-board-pcie1-ep-dtbs := k3-am68-sk-base-board.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtbo
 k3-am68-sk-fpdlink-fusion-dtbs := k3-am68-sk-base-board.dtb \
 	k3-j721e-sk-fpdlink-fusion.dtbo
+k3-am68-sk-v3link-fusion-dtbs := k3-am68-sk-base-board.dtb \
+	k3-am68-sk-v3link-fusion.dtbo
 k3-am69-aquila-clover-panel-cap-touch-7inch-dsi-dtbs := \
 	k3-am69-aquila-clover.dtb \
 	k3-am69-aquila-panel-cap-touch-7inch-dsi.dtbo
@@ -406,6 +409,8 @@ k3-am69-sk-fpdlink-fusion-dtbs := k3-am69-sk.dtb \
 	k3-j721e-sk-fpdlink-fusion.dtbo
 k3-am69-sk-pcie0-ep-dtbs := k3-am69-sk.dtb \
 	k3-am69-sk-pcie0-ep.dtbo
+k3-am69-sk-v3link-fusion-dtbs := k3-am69-sk.dtb \
+	k3-am68-sk-v3link-fusion.dtbo
 k3-j7200-evm-pcie1-ep-dtbs := k3-j7200-common-proc-board.dtb \
 	k3-j7200-evm-pcie1-ep.dtbo
 k3-j721e-common-proc-board-infotainment-dtbs := k3-j721e-common-proc-board.dtb \
@@ -420,6 +425,8 @@ k3-j721e-sk-csi2-dual-imx219-dtbs := k3-j721e-sk.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-j721e-sk-fpdlink-fusion-dtbs := k3-j721e-sk.dtb \
 	k3-j721e-sk-fpdlink-fusion.dtbo
+k3-j721e-sk-v3link-fusion-dtbs := k3-j721e-sk.dtb \
+	k3-am68-sk-v3link-fusion.dtbo
 k3-j721s2-evm-fpdlink-fusion-dtbs := k3-j721s2-common-proc-board.dtb \
 	k3-j721s2-evm-fusion.dtbo
 k3-j721s2-evm-pcie1-ep-dtbs := k3-j721s2-common-proc-board.dtb \
@@ -511,6 +518,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am68-sk-base-board-csi2-dual-imx219.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtb \
 	k3-am68-sk-fpdlink-fusion.dtb \
+	k3-am68-sk-v3link-fusion.dtb \
 	k3-am69-aquila-clover-panel-cap-touch-7inch-dsi.dtb \
 	k3-am69-aquila-dev-adapter-panel-cap-touch-10inch-dsi.dtb \
 	k3-am69-aquila-dev-adapter-panel-cap-touch-7inch-dsi.dtb \
@@ -521,6 +529,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am69-sk-csi2-dual-imx219.dtb \
 	k3-am69-sk-fpdlink-fusion.dtb \
 	k3-am69-sk-pcie0-ep.dtb \
+	k3-am69-sk-v3link-fusion.dtb \
 	k3-j7200-evm-pcie1-ep.dtb \
 	k3-j721e-common-proc-board-infotainment.dtb \
 	k3-j721e-evm-fpdlink-fusion.dtb \
@@ -528,6 +537,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j721e-evm-pcie1-ep.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtb \
 	k3-j721e-sk-fpdlink-fusion.dtb \
+	k3-j721e-sk-v3link-fusion.dtb \
 	k3-j721s2-evm-fpdlink-fusion.dtb \
 	k3-j721s2-evm-pcie1-ep.dtb \
 	k3-j721s2-evm-usb0-type-a.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-v3link-fusion.dtso b/arch/arm64/boot/dts/ti/k3-am68-sk-v3link-fusion.dtso
new file mode 100644
index 000000000000..667c7e1edae7
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am68-sk-v3link-fusion.dtso
@@ -0,0 +1,184 @@
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
+&csi_mux {
+	idle-state = <1>;
+};
+
+&cam0_i2c {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	deser@30 {
+		compatible = "ti,ds90ub960-q1";
+		reg = <0x30>;
+
+		clock-names = "refclk";
+		clocks = <&clk_fusion_25mhz>;
+
+		i2c-alias-pool = <0x4a 0x4b 0x4c 0x4d 0x4e 0x4f>;
+
+		deserializer_0_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				status = "disabled";
+			};
+
+			port@1 {
+				reg = <1>;
+				status = "disabled";
+			};
+
+			port@2 {
+				reg = <2>;
+				status = "disabled";
+			};
+
+			port@3 {
+				reg = <3>;
+				status = "disabled";
+			};
+
+			/* CSI-2 TX */
+			port@4 {
+				reg = <4>;
+				ds90ub960_0_csi_out: endpoint {
+					data-lanes = <1 2 3 4>;
+					clock-lanes = <0>;
+					link-frequencies = /bits/ 64 <800000000>;
+					remote-endpoint = <&csi2_phy0>;
+				};
+			};
+
+			port@5 {
+				reg = <5>;
+				status = "disabled";
+			};
+		};
+
+		deserializer_0_links: links {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+&cam1_i2c {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	deser@30 {
+		compatible = "ti,ds90ub960-q1";
+		reg = <0x30>;
+
+		clock-names = "refclk";
+		clocks = <&clk_fusion_25mhz>;
+
+		i2c-alias-pool = <0x5a 0x5b 0x5c 0x5d 0x5e 0x5f>;
+
+		deserializer_1_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				status = "disabled";
+			};
+
+			port@1 {
+				reg = <1>;
+				status = "disabled";
+			};
+
+			port@2 {
+				reg = <2>;
+				status = "disabled";
+			};
+
+			port@3 {
+				reg = <3>;
+				status = "disabled";
+			};
+
+			/* CSI-2 TX */
+			port@4 {
+				reg = <4>;
+				ds90ub960_1_csi_out: endpoint {
+					data-lanes = <1 2 3 4>;
+					clock-lanes = <0>;
+					link-frequencies = /bits/ 64 <800000000>;
+					remote-endpoint = <&csi2_phy1>;
+				};
+			};
+
+			port@5 {
+				reg = <5>;
+				status = "disabled";
+			};
+		};
+
+		deserializer_1_links: links {
+			#address-cells = <1>;
+			#size-cells = <0>;
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

