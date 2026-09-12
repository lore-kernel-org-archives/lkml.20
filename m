Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDAF26D4C3;
	Sat, 12 Sep 2026 21:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789248749; cv=fail; b=owyePDtcWKm6z6ZVnsrak/qeYaiNXqTW/ktILzbIipLikuSA/jdsiNEfbFIARiCx6HreTtlPB+IDnRxQv7uVQSoeoD6wierziJD2MJ3pRklrz8u5S7/Z28EkRwrXIU6OdRy3rXb7MtxUic6hUZrmue6MuqAENbdfU/9V+ATgq1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789248749; c=relaxed/simple;
	bh=tMuHRD0zX99B+dzeFGaWQ5MtUjmuNfGincUu8lkyL7Q=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=uUVcIpg/KZ/WJiplTHC/uC2Ra53HXwCLsEmClFlyLR2tHS3qRaC7hyN5qkcTZCasUnYQzvnvsp6OyGMakrQm4ZZdgpSaT4J1ZadNUUWg6umenU3RnPce7e4c4TmbR3govNYw/1DOA4Nsl5UwJyo9mTf0I5GR7huzwKoxHFo05aE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Y3S6UDPd; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=lJUrzu4+; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Y3S6UDPd";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lJUrzu4+"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68CI1kW22895356;
	Sat, 12 Sep 2026 16:32:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=B7OypVuO3XCWK
	6ngr7KQFCkxUkAJp/IrpLJlrwxa1ak=; b=Y3S6UDPdabEsPgHsIgbUWLipdFtrV
	yDfBeEZxAh0xlzJJ907PwUiPYwlKW2rjRYmGMZBFecl4XZ9d2onif4nBnXvrVyPk
	Q1WjvNSk5Ii5lAjW7jKNAUDaAj0upV1PnqlXPiNbvu4oRcahUfkyVkuIIGw0JJRF
	W5Ncxc8/00TYLZEOT3XkbZ7UEyEkYn8SDlZCXZsjRO7lmGPl0JMRP8XoNlG8CKHT
	GqLZixz5KDE4+/QkR0u/j+nxtIXaGjild52wZeSdiKtotByhKSa8cA8eD6vrzQX+
	HZnaLdKM+sGkN/wT5JPtaOx8/P1/ckfLD/LCvi6OHLR+mJYNyNV4GMHjA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012022.outbound.protection.outlook.com [40.107.209.22])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gmy5d36cs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 12 Sep 2026 16:32:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2ZganuJK2r/wejBOiA2JykQiRnLVxU2XYA6tcyiCLurpoFNFE33+qwGHOfXLIxU5IKtd2YHmOXqMvLcFSNbDgt/BaHI49X0jgn3NJvDc8i0OCr6D2OUQHEEVM3SJxBYQ/sq4TUD59C2X72SvroMREAToO+OCyqlIozeuEX50S2XgP4rf1+LK77FDicf87nzj33Zlp1yIiYzQnk9RVIoc+QKIrCXAiUxiHX2szKKAMvRSGmMPVXX9+LvGmkppk7VnKHn+NrcTmIFNi+qGxsVdvWfa9W2I18IFmsdtECvA/EYeQ+Tdynv/e7VhYWHrpMW3S9OPt7NyqkyrXgU3U8MrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B7OypVuO3XCWK6ngr7KQFCkxUkAJp/IrpLJlrwxa1ak=;
 b=c5UgeN850sCHSxAT5dz4dnfDE8uWL2iDnzMz/eu35ngF7v81ZjgubKRp5Z4zD/lolDDnCQyV7iyB7s1wepbLdU3fp5zro1aI/UfHQGFCmFd5JASKTN9Bbb9RTq9L2EjWaGG1xBj9rIA+ziEbjJOshtK8+Y39pFyKsDXpfrEjZbfZ5MDetJwdbpUQw5JQ3Q/TDnpjNZ5NonXuD3g1RoVxCyX9kGByB/0H4XSCgn4VFg15tH+I2qIQ+nzheXSg/5gvCmt+R/aaC1S4XRLXTq+rNPeizFcUxDLyJ+rpfF2SzwuqJPUrx9Vw8qzCgeHlp2yGsrgYCVADKD/9d2ZCi09Ccg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7OypVuO3XCWK6ngr7KQFCkxUkAJp/IrpLJlrwxa1ak=;
 b=lJUrzu4+k/IOwJwE5k27RpOB4zbFo7cPzfpL5uVp548X4ADVvuwGWjDxMB6FKallM7RP5ETo6ecXMApqOCH/3f7LsnggJIJ9xO+6CzUF6+rUgTv4evtulXAIpaNeJdJz3LQoRxCaXuh3xnZNFg+Zl40JQU2s+E2YU0ifmYddlaw=
Received: from BN0PR08CA0018.namprd08.prod.outlook.com (2603:10b6:408:142::29)
 by PH3PPFF6F8BBAB5.namprd10.prod.outlook.com (2603:10b6:518:1::7da) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Sat, 12 Sep
 2026 21:32:21 +0000
Received: from BN6PEPF00000070.namprd03.prod.outlook.com
 (2603:10b6:408:142:cafe::3d) by BN0PR08CA0018.outlook.office365.com
 (2603:10b6:408:142::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.11 via Frontend Transport; Sat,
 12 Sep 2026 21:32:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN6PEPF00000070.mail.protection.outlook.com (10.167.248.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Sat, 12 Sep 2026 21:32:21 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 12 Sep
 2026 16:32:19 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 12 Sep
 2026 16:32:18 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sat, 12 Sep 2026 16:32:18 -0500
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.196])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68CLWI8k3511026;
	Sat, 12 Sep 2026 16:32:18 -0500
From: Kendall Willis <k-willis@ti.com>
Subject: [PATCH v3 0/3] arm64: dts: ti: use ti,am62-mcan compatible for
 m_can devices
Date: Sat, 12 Sep 2026 16:32:12 -0500
Message-ID: <20260912-smth-v3-0-6fa661ae5a4c@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANzEpWoC/0WMyw6CMBBFf4XM2po+EAZX/odxAWUqs+CRljQaw
 r9bkOjy3NxzFgjkmQJcswU8RQ48DgnMKQPb1cOTBLeJQUtdSFSVCP3cicI1CitnVY4O0nXy5Pi
 1Z+6PxB2HefTvvRrVth4BLb+BqIQUpEqDtcH2gnSb+WzHHjY76r9RSX0YOhmNKUq0dZ7bsvkZ6
 7p+AEWYXF7HAAAA
X-Change-ID: 20260819-smth-6fb189fc148f
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789248738; l=1930;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=tMuHRD0zX99B+dzeFGaWQ5MtUjmuNfGincUu8lkyL7Q=;
 b=aYUJLOJ0RZ2XxU8T2VlxBcknk4oosFuGjQY4joFWgxwCjSz2/Hj0LKZ5yWgJAdoAnc9NmaabC
 WwaY9GHxVeYA7BE0TuOvQSu+HaaoRiz0kYhIV8ZATps8xq4CpvOb3vF
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PEPF00000070:EE_|PH3PPFF6F8BBAB5:EE_
X-MS-Office365-Filtering-Correlation-Id: 90e04275-9a34-4eab-9dda-08df11155432
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|10067099003|18002099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	HHwuL32LQBUdPHseEKs4zd4KycJg55K3QiEmKhlIAdHqcb11y7OgbJ6FQXPS32+wMP0gtfx2QxJZ2KMqZJxfcJUj4aNSuECVy7vESPexRtq/aCDUUCIHGyI9pLYue0+lG4AZjVBXZI1Ad/Z+pzEbVAA+BVEo2QV2ygT8BTY6sYX7iPTcBHt6wNtvBQTFn0Mq99DkJeSFBDUxYtcACHiFIiGIyeDUd+8v3Ya1PRSEhNh9G3mDqzTUA3d0xBFN5LTgUUZxf6ijJhBw0vZ/cN5uoharOFZ+KShTF7zKSuxxnfM4OjnwjjngStu66Z/+3j5/ltR9l31adRprzcbkJspCv4K1tBVDsQyW1drRuvC6d0A7HekIAjwZvo4kXBkerNzPqfi26406EiQIZm3Hw0fCspCzhQ4mLGF2vi7rd1Dsyrsd61veLKsRWaT6ViwP1ywFFGthWcV9FeY/ofutb/67qms/bvuOOi1QH+ddORn1lt81bBun1wwRGGTrsgKmIPMhRjdKmdSXyFmxQuIb+zfOlSAiGH06hiUD23CSW5zebKhDwzJjoFUpYL6G4Mowt44LM/RS7jQo94Xn6u0846Ofy3YezKOx17caMpzr7P5DxNAgA1FKF8K9VlCTYqOolFJrb9LY0uwrb8RKXFmNwoZnRk5BZhAxVeIds6CQDzQzBLz8aYfoS7NeO2s9tt2QhWvkoDeqXQPX8SQ2hBzvMWxbgA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(10067099003)(18002099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mdxM9RVT9b3fRjcKbm8gizlDD1l6nfDHU4GgcTHMpv4XYU5LCVudx6dcnzIRqADHfTlF/a5PojRWdY9bNv82B4VORtFPfj9/E6zdZj0GC+2s7i2fb5amYGfjW64ZyzIKAG7/z38iXRR97RJfG8dgkdE9M3mH5O9Ve4E7/iMzUN74TL8jVxN10cHaCriIz1axLK2lqAE0O28+Xw9w5DcT48AnXql05rc6yPyaBFUsunK57gLkOsra6lx1teuAgQx7gcNkDpl5uNKG9cebv/nuDrNSZI5JZCM8y+0qQpxOL+S3pRLkQOsktTbQP7vaVKgI5mPzsPJ5QDnDDv6T++48kVyPDmEgSWAV/7zMJ9Mfi1B3u9DSvDFccYSHiEhJh+Ktpazd9IuqXNLh5B6k1Sfuru/USyaZ0Yao7qTxg6NUlaJq17LFKRA4yX8OZuzYnHsw
X-Exchange-RoutingPolicyChecked:
	hMP1NlkYWd5KPdpv/YThel/3ZwSUrB+7kaYwakvI7S3/Z+J7i+4n+YgyT9gVWAqN7azASezU7sTfqHseepWMf21V1sxsNUqtu7joD1se1mEXMRRlD3DPsWmQ1lmhNoSFVzOwsjCGr/IrcI6kZBgIcyIJn/6qQocShsHcgwucwkukfRIM1WENQ3A/pe0cw7a4fzb+ZnUn18vr6HFNiTgSZRhZcLy4YQoSD/sWYzH9kA5Jt4cyBjeDX7rDKBZFfGHB4V/D8b8O4ea4UyKU2UFSOI9fM7us/E0zLnNk2Cw9kw8+USz8Z7BaCJQdwav8rH1LvCshtOPYkTFH8gcFrhoiGg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 21:32:21.3293
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90e04275-9a34-4eab-9dda-08df11155432
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000070.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFF6F8BBAB5
X-Proofpoint-GUID: j5g2iJNvTL5c9xgssJI3yX6bnAH4HJig
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDMxNCBTYWx0ZWRfX7fRlsCyMHTgr
 OkljQSv8wmDBMLF9K5CuX6IeLXLCxPavp9mjzdkG+YA5remitPr1dzRZ4TyMpms/xOCW2MSpubD
 5Sj4NgHWvUOKVydXZ+kR/X0GqGtvuUKWOGKZV4iqSEkJwjHj1j9VPfDojYNRP7Dir30BM+oKYpf
 DXUeUeeyRqLiZ93Q4lse5lXIFZ+ur5EWlBBb87O7fu7XEhLhOdIHcK66SAytpaT36cwvzsVLUb6
 +JWIyzwX1UJ784jKfzxPiwOnxa+gAzjgs0vJbFf74u3G1WBnlvOOaEfAqv8oo400lS9fOsXqqrA
 USGXKvRD37YqUvtAHorJRur80BQh3YyjoW582GMNJWZMCizPvkTzobuWJBgyI4yQQ/Imdq8G9hN
 o1D089WHN/WeII54HNotR0wz5p7T0eJW+cQ7zXfKi9YZaSgLRpcNOx6rbqfDsUnz0N9VXOsVbOQ
 drlSgVBRhWRmJ7V3SNQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDMxNCBTYWx0ZWRfX/elAYzxYZgAo
 q0mbJT/mXsqXUWfYp2O0XNlZFqhEusFpuOKkTkaYs+ra6850VHNJKCoUB1GZ0+kAw/H9aXj+YMi
 Cm8zem/P00tCGC5fzz3jsgpsHETtvRM=
X-Authority-Analysis: v=2.4 cv=F6vC5ahN c=1 sm=1 tr=0 ts=6aa5c4e8 cx=c_pps
 a=LdSsacNKwWtvIYfRw5AjOg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=j0SP3X6kSRXRHeAwYTMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: j5g2iJNvTL5c9xgssJI3yX6bnAH4HJig
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120314

This series prepends "ti,am62-mcan" compatible to the m_can devices in
the TI AM62 family of devices. By adding this compatible, this series
adds out-of-band wakeup support for m_can devices.

Dependency
----------
This series depends on the "can: m_can: introduce ti,am62-mcan compatible
for out-of-band wakeup" [1] series which implements the "ti,am62-mcan"
compatible in the m_can driver and dt bindings.

Testing
-------
Tested suspend/resume with CAN wakeup on AM62P SK EVM.

[1] https://lore.kernel.org/all/20260912-temp-v5-0-2e3201c02109@ti.com/

Signed-off-by: Kendall Willis <k-willis@ti.com>
---
Changes in v3:
- Renamed compatible from "ti,am62-m_can" to "ti,am62-mcan".
- Extended coverage to main domain m_can nodes in addition to MCU domain nodes.
- Link to v2: https://lore.kernel.org/r/20260902-smth-v2-0-b3678ca44c7b@ti.com

Changes in v2:
- Removed "out-band-wakeup" device tree property.
- Add "ti,am62-m_can" compatible to m_can devices.
- Link to v1: https://lore.kernel.org/r/20260820-smth-v1-0-e1738a38d58e@ti.com

---
Kendall Willis (3):
      arm64: dts: ti: k3-am62: use ti,am62-mcan compatible for m_can devices
      arm64: dts: ti: k3-am62a: use ti,am62-mcan compatible for m_can devices
      arm64: dts: ti: k3-am62p: use ti,am62-mcan compatible for m_can devices

 arch/arm64/boot/dts/ti/k3-am62-main.dtsi               | 2 +-
 arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi                | 4 ++--
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi              | 2 +-
 arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi               | 4 ++--
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 4 ++--
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi  | 4 ++--
 6 files changed, 10 insertions(+), 10 deletions(-)
---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260819-smth-6fb189fc148f

Best regards,
-- 
Kendall Willis <k-willis@ti.com>

