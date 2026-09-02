Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74744052DA;
	Wed,  2 Sep 2026 21:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788383076; cv=fail; b=PpLnmLle7KqCHRXLUBiCtl3HMPpgSBvO4FnkXS8QQ8XjxZtE9afUKtcRLOFyrfgNig/5HVaIdnue5p9DqpX8F1wBKDmweqRnesceyeJnz6i95yqT4wV0E1jgs7x3JUma439JpVNgyGa+Ej7voxSxVZzh3xi2zvZV0L+59FXJMRs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788383076; c=relaxed/simple;
	bh=1HjQ35qv6KvcgWFPKmfKPsZRtb++HREm6CKVuCLNulg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Wx8sS7VUHAcvg0LCY3amqMIctqdtThOFSbTlU0GJnvdzjO3/lnKQVLUM/17LMfw2pZamWw0DmGF5otRdn2J8obSddJucpr3gPIIxjW9uVV9LgRulTgr91udCxYjNpNpvIdNLl+MJnwTmu1wRvZYqwLJdfxjR/N68LyKD1K+MXoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=MDb5Jyt+; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=mStBxIF5; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="MDb5Jyt+";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mStBxIF5"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 682KH4xD3234069;
	Wed, 2 Sep 2026 16:04:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=69pwRY2y5A/4drEHBOG1LsmDerzyca6dh66d4yF95
	0s=; b=MDb5Jyt+oE0YC7FXTCH9b95PMCI+kteP/GWUX710sBaOqEkKOqaKYeyuk
	3YGevCaOHxW1Qqmb0DUHUnnzsVDsldxjMN5nUQ23LyA72WyZzTTkg/vXnhcmCArS
	eSVJ59Di3YKHan38Id8rBW5Fy6f2ltY44+hlaYblRpxwup0uXWWbq5RT++EnpYKT
	p0gEvIFLkPNUBhKizBzoGmlRDtVl+QrP2kg/KdnIn7p0GZ3HPOfl25TuUzU/GN9X
	/Qb/RK5YdF0xXuneIwr4ic2yZGvUwr4JYjWOx2h3aUzHj8/AIfSd6U5gtYxe1Qim
	miIQH2J+EhbtRuvqachzPz2MctdCA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011047.outbound.protection.outlook.com [40.107.208.47])
	by m0380145.ppops.net (PPS) with ESMTPS id 4ge7gqfaf0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 02 Sep 2026 16:04:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cO3q3yxYJVFQITL4CBjqa2SngowUSFZgQchXSLIbzj+Nce4k2NXWTvzDn9plYO7jj5ca+OcS0PQLDA2tlBHsxJM4CbZTXXTW5CfEuE1vjxazOkHeEZkuZybA060qcd/WlHy/su37sMNkqtB3oQ8zOzn2zdhZbnCkOVJw+uASNhqgad7y2EAIOZ8KAt9kMmHjdKB6k+68iGX0ibHVxcIwnKxVhegUL2xtt63vpGhnJx63PAy2OKqCEewguIte+FWL38TABd43PdUIwr99zEdKE84yXvQPEPilZ9zo1MdUM0EfIaz9E6EKiElH1znAUBSK1mBSgVcixkVzWE1JA0vaFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=69pwRY2y5A/4drEHBOG1LsmDerzyca6dh66d4yF950s=;
 b=bOWkMrA9WJfk2k43nitRfiVOktOt/6GePxHSXVwNYumzPWkHhVDYzYrngbeTfRNjCWK6oG5AMPtrVhHZxULSbfBGAmfF2Gye973m981BLdzVlw4/5MTR2bL2yI8tYLXUU6C1dPvgNrTdEIRUm/MfxcbEryEyTbn9Mau0oQSiJW4Y53CUZhpAt5JxzowkyXsnDM4s0xBZlZTzjvXmToRhEoB+leI6BD6794rcfc/tK3UF1GH4KbkL15C0jy5ePnRHdR8sbk0VZnW/WF11AIdmA/IOG4N8owrvz++PYdmAvPfelKSYzheOj+C0qOGaFxk7+YkHTtOxNEPylvJJnMsHvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69pwRY2y5A/4drEHBOG1LsmDerzyca6dh66d4yF950s=;
 b=mStBxIF5ReF19qTc7kDcWSIYh413HGkWHZZt9uxrT4PrpW4K212brVxLdlQOSUAyZOBZXjUixzIhIn7FsCPqdel1QLdyiuHdZNPVqy0buez51o6VQJzkynDvkLmHl7uGu75DyT+ZPUvgps9Rgz/xpMtncKtE+VjwFDlh7iiYozw=
Received: from DS1PR04CA0024.namprd04.prod.outlook.com (2603:10b6:8:243::18)
 by PH8PR10MB998088.namprd10.prod.outlook.com (2603:10b6:510:40c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 21:04:28 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:8:243:cafe::44) by DS1PR04CA0024.outlook.office365.com
 (2603:10b6:8:243::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 21:04:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 21:04:28 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 16:04:13 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 16:04:13 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 2 Sep 2026 16:04:13 -0500
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.196])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 682L4DL11301748;
	Wed, 2 Sep 2026 16:04:13 -0500
From: Kendall Willis <k-willis@ti.com>
Date: Wed, 2 Sep 2026 16:04:12 -0500
Subject: [PATCH v2 3/3] arm64: dts: ti: k3-am62p: use ti,am62-m_can
 compatible for m_can devices
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260902-smth-v2-3-b3678ca44c7b@ti.com>
References: <20260902-smth-v2-0-b3678ca44c7b@ti.com>
In-Reply-To: <20260902-smth-v2-0-b3678ca44c7b@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <s-kochidanadu@ti.com>, <a-kaur@ti.com>, <s-tripathi1@ti.com>,
        <vishalm@ti.com>, <k-willis@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788383053; l=1447;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=1HjQ35qv6KvcgWFPKmfKPsZRtb++HREm6CKVuCLNulg=;
 b=yMhXDHsOELpAy/0Le3VAqb/WP65srGYPfyRhfWmr69cmViKV6/yYnLOcpNUuEq2e4IuPJ256S
 IvsE17KHEIKA+LBVGCsIyd0aOBhaixHCXLVzHp/Fd4vBUmx0jVZhDcN
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|PH8PR10MB998088:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e5d1dcb-cede-43b0-038c-08df0935c6f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|22082099003|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	RJNFfzK7hovxz/g55fUEwU/uO0UcL78u04dcdIWvtGZpVb4jMk8zrK+5NcYQNacOtU0KQexb5sf9hKSX9VImxff8pMy32L474hsjAxc46E7RTexKzhDWoTjokmT6gbnYDrSztRHKK8DQ1Tbbar5a7+4pk3o+2fmVqvAWa2dxPUE+WYYFYtXTKvqlL8OjMp9SgKxKvBJ+LqsYiDxgFNUmbF5XEQh/A4xZiDXKPmf0kh3g/JBtTjxw0g1ClmCQ8beGosWAYIT9N4swErcRioOac5pbqcB3nWRZ/V7E3AoVZO3p1nA3K2CR8fMZvUVA+Wgeg2M6AMKLjK4znLuxMmwvKqzDy8LydcTz5xaibafEXZA8p4jQbqPvSWmOVJU1SwST8mEbS+PowFbHibPwh04zAo6f1OWammfBpYSbM/llI7RSqTnR4iSpBaMAQPv7vxQrrXUyFllheeuZkVBlQo+wEWbkzy+hWYOdzXz4F+LKdr5FLyOV4mMfvJTFHfv9cguVqc4SWVc0NG516AvZ/mQauqjKxJWSOj4PMnlaFaEPto9sQKFcZ3biZbLiL3bpvVi8wkVP/Dmtg5M7vNjO82u4g+XmWok2Aob6tK/LnUQjFcFqIZq0wpd6G26l2mFAYa7ohB3n4GmKNih/g7es+SoR3w5nbHNMBGNc7++AKQG1WI1hQ7At5XMX4JNb4BIV2lbhCBloyj+NnN+Mp0psl9codQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(22082099003)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Pr7H97X8sk2DO3+6maXJ8vGBoknKnXlw1jzosGeBtRp7Euq9c0FKDub/mV4iQEeGa5cA+fVBR1SUYyeEoff8N1C/K5IKBDnAwv/O1NXm48RTPm+0q5rjF1EbYuk2Rnz35119afv41n+dEnO90UsySHUnD2Kjcz9GOJZy2UsRRDQRiHe6+Mt12y7EMpAd7fzbzjGLkbo7qr+qdYNtRip/loO1BDBYNxmcivE5BlBvMLG36DhDtAhe9sB1R2M0DLYta7jX5Oc/aBLhvmHv90Uj5WPSJZbkcDIHENbYlPrfm+gvSz15iVdotetNJA2vZIoBYrLvptnEZrTaJpSavtwVLOzC9e8L1fh1fy76uUoJ4WnwyM9Dl75t9cxjpiQ2f3YRpMVKjlHYKojlWXy0oLZ3BMoXfNSuDPEiOeFiyXELnuBk/lzmhw83tBlQhmLGFv5t
X-Exchange-RoutingPolicyChecked:
	gq1Rkm4GJiJOd6ifM2tcW3UTv3FoEjSl/r1bi4wA1eZ5e1YgyLvdZHc/mMo/V1UJAAe6aX571fiE5hpaWk9G9Z5da7PUF8kXWl0eUgtCV/jUqn0l3TF2lzMPRwn7Mec11IJMnJqJlPt3QPaCXpN4mFU0F6yceXOSIwMxeJcwP9Kz/n0+Uc9H1FbknKx7wHkkIJkJwAqkNP/UuxNyCEZOLz6/at3dCh/1w5l5Xme1oihFe13YzmuBnR3uXESruhY1+izDc4skAYy1V0EGppAhIKD6GBEUrYYlGuro5YGBKxVbGlXqI6o5cefYOaIuqi7c1OuqlVqU638fgYo5KdR5Fg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 21:04:28.4871
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e5d1dcb-cede-43b0-038c-08df0935c6f3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB998088
X-Authority-Analysis: v=2.4 cv=fZ6dDUQF c=1 sm=1 tr=0 ts=6a988f5e cx=c_pps
 a=xwsl9B6YvhynmxkULKMBWw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8
 a=NDy5iHuOC7z36dMLNNsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: siGlEd7be5H_H4Xr94LP8eKYI4-DddDt
X-Proofpoint-ORIG-GUID: siGlEd7be5H_H4Xr94LP8eKYI4-DddDt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE4NyBTYWx0ZWRfXyQHnAWWO4UfL
 RykjLo5foZR67CPqmX0AySY3uPI3Iu8D4uN5Fvm+LS2KFSOlXw92j7x4+aOCLAzIN+/eI/48IkH
 GXLjdBZEwOqEmSYILtGap2+UjZdvZ68=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE4NyBTYWx0ZWRfX19UuZAiSSvlJ
 2Kf4fcBwqxPotgoM2Vs7rnIUz64vXw/KwIhrcqpSS3xwJ9xTtkfXrD/QLSk9BXk57wmzm18vWBX
 zFe20qnqAHRExC/SF06qKNFRlYHJC0+XVPt6kKJyBALSqySM++8+I0VIr2akNvv5xVv4RYVwvaE
 WGLcLYp28CBwpNTeQII9Kvvp4IJT0PiLuXDyYIAnJLxPU2CDEX5JSfzpR2tzQzm/u1XYHmgLVdq
 yg2s8SnGX4oW5R8RtWNq193OsFOZgo+4oLc+3qauinlIudjyg4grhHNJK7C/O60X5WMcRQyggyi
 dRdCnEg4u5d1XrcXPOEHLNo3Y5cpX+hbsKOokE9Rb50lOPlZBtvjFFFxV93AbmrBKUvbCe30a3e
 QUJJjygTDerb/9WZIL+H3002IHVsshkK9dVGcG7LccNw6kz56eiMQZxPeWRmR2gUNWAM6GJg4ky
 z6cgP1Ki6fnYhQP0ewA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020187

Prepend "ti,am62-m_can" to the m_can device compatible property since
this compatible adds out-of-band wakeup functionality to the m_can devices.
The m_can pins can be a wakeup source in the deepest low power states,
despite being in the MCU domain which is OFF during deeper low power states
since it has the out-of-band wakeup capability.

Signed-off-by: Kendall Willis <k-willis@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
index 5288c959f3c1aecfde363f9e2440253545591171..d26d6b6d0cf46a19bde9f58769b3eb8c86c836ab 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
@@ -154,7 +154,7 @@ mcu_rti0: watchdog@4880000 {
 	};
 
 	mcu_mcan0: can@4e08000 {
-		compatible = "bosch,m_can";
+		compatible = "ti,am62-m_can", "bosch,m_can";
 		reg = <0x00 0x4e08000 0x00 0x200>,
 		      <0x00 0x4e00000 0x00 0x8000>;
 		reg-names = "m_can", "message_ram";
@@ -169,7 +169,7 @@ mcu_mcan0: can@4e08000 {
 	};
 
 	mcu_mcan1: can@4e18000 {
-		compatible = "bosch,m_can";
+		compatible = "ti,am62-m_can", "bosch,m_can";
 		reg = <0x00 0x4e18000 0x00 0x200>,
 		      <0x00 0x4e10000 0x00 0x8000>;
 		reg-names = "m_can", "message_ram";

-- 
2.34.1

