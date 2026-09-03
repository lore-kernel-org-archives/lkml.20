Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4340B4AF9C6;
	Thu,  3 Sep 2026 13:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788442139; cv=fail; b=RYmdp1ISN4Pl/gPf3pKkERz1cEYzA8NCfwUe8AwdG0gVP+87NF+09L5V1qsue8S8vy/oQsFdPrZhNp8YZJLWJ8SEAPZfpSifm57r6cOZgYDTySHOZMV1RwIKAl3wef8Z6AQtWHvLsYOwY9KP3uRgjXrUC+ldHGLrXoNoDFbjmuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788442139; c=relaxed/simple;
	bh=8NndoEDCgJ8e9JZj0WE4HzoU0563MBUe0wqf/dsm1I8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LvT0pM+27vFNARbr5H3niN/Vxk+UPhIeaPkqNBt8CToNf0s4vU8BLgWzk3tNtVzbE2NqaP6ri5ft8Z746o9RZEuSbtcCBA0N2/qudF8hzJJONTxbhkI5NFckT/twhwzuNkR4sPb/VdMWSAbj9cih+IWmXFsL/EoqWuLUS0QLuIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Tdlg5593; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=SGGXemQ0; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Tdlg5593";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="SGGXemQ0"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 683D8YIS3762122;
	Thu, 3 Sep 2026 08:28:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=tw4BinYgsHYnnj5
	VivGipco+uQjKwUZUs+VGbcS9iKg=; b=Tdlg5593QaJBjsKxdnb6sRjHKBKWbT6
	uPmGERVBPOh7QkJmfLsH1IdlYpr+P/dFsA+mDCjBb6mTT677AUn5OBlWUINB/7XS
	7WPTaBgFjOMx/as/IC90eY9V49fO0PGogUPzZmgwa4j5Q9F3LUsETXY0+r+JAtTu
	uokzN0m9QCTVQttlvGYi8r0Xe+cZFupF9S3yryhzoOqJrD+ldz0R4jwOmoECXhs2
	HBNW3bggVr3P4K2yAyFQWHqPDdkjeistpYsXnA8JvulqnyKfpUBcxZr8lRRHQ8Ft
	ENvB04BHYSxzqPPvx7E6q0vQkqha3yvZ5AQqUhUPDpa1YXLNqHDELfA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010017.outbound.protection.outlook.com [52.101.56.17])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gf0jv35cw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 08:28:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xCTmivBwQ/Ko9U0E/cYf0clfYZ9bDZRrTPZQ8YMNlsyYZNLrTw2HuIz1iicEQuNIGOAOVdRUYhekJlzRfoxceCQ4zWkiopFVr09iflD/rVJeX35Zhr3r6VoWw9HCgHPnb09AY+DTEQ4DMcPLuvO4XOc5KJv0T/KqxbpnZ49J9qE2y8YcfwxEa4N0Bj5F6JybhKcPKQ+IKk1d6rNAtT6iOZvcSsTAebxHZ3/kb9wzcuiM9x9QBHMWaoVw5uOse75s7W8lOkEC2BG0LvUhqc0GEi8gOHupM5RESjOb43XW74H2Zge/q+/MKgAOb1pzi8OZF2S4Q6KzhANprM5/iJlNJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tw4BinYgsHYnnj5VivGipco+uQjKwUZUs+VGbcS9iKg=;
 b=nKbrcwQyZ1AUht7bkCemQIWXr35SF4Z6q65i0zx6HFVW5wIkbx+vXBlrn8km42SOAsXbFpVsxcQ36Ewgyi9yASs8FAc8gR2TEgekRfYEoyJ4Spk4Kyt8UwSTtmCaz0P/Egf4UhXeNSozOQK/69o2hn70RS5fmiwbGf3HQ4m2rjHCb4JkFXreEXYuaXnbzTWiidAqi4oVujSIbYldVc7l9nw1VijIg68X1wHF4pydWGYi9cdmlKRnpiJQTa/BgZKKCN5dPR2KRZkQ00ICu/KPQ/OHkeVOWX8E5IdIOicgI/bjkk7QLktOPulbGCC4RIM6c/N3EKuuq1teATJV5FYvtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.phytec.de smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tw4BinYgsHYnnj5VivGipco+uQjKwUZUs+VGbcS9iKg=;
 b=SGGXemQ0asnkKf1GeZt59ZvAcQeoVqDWxmWHHbRUA17M6rU3KZqXg5ste87g1ZZTwZpWpuRdrZSERs3KFJdyBasyd0wHbJXVkAw7if+ulghXOl2G/YQFANxkwDvRqbdLqMhhNgToUCyLFcbirpNyATng08khz+18T5U0QqdRGBI=
Received: from MN2PR07CA0010.namprd07.prod.outlook.com (2603:10b6:208:1a0::20)
 by MW4PR10MB5680.namprd10.prod.outlook.com (2603:10b6:303:18e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 13:28:24 +0000
Received: from BN3PEPF00022BCE.namprd03.prod.outlook.com
 (2603:10b6:208:1a0:cafe::61) by MN2PR07CA0010.outlook.office365.com
 (2603:10b6:208:1a0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Thu, 3
 Sep 2026 13:28:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF00022BCE.mail.protection.outlook.com (10.167.248.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 13:28:22 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 08:27:27 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 08:27:26 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 3 Sep 2026 08:27:26 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 683DRQm31609017;
	Thu, 3 Sep 2026 08:27:26 -0500
Date: Thu, 3 Sep 2026 08:27:26 -0500
From: Nishanth Menon <nm@ti.com>
To: Nathan Morrisson <nmorrisson@phytec.com>
CC: "vigneshr@ti.com" <vigneshr@ti.com>,
        "kristo@kernel.org"
	<kristo@kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "sashiko-reviews@lists.linux.dev"
	<sashiko-reviews@lists.linux.dev>,
        "afd@ti.com" <afd@ti.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "upstream@lists.phytec.de" <upstream@lists.phytec.de>
Subject: Re: [Upstream] [PATCH v4 1/2] dt-bindings: arm: ti: Add bindings for
 PHYTEC AM67x based hardware
Message-ID: <20260903132726.us2vplb7fey77mqw@clarity>
References: <20260630173131.3000303-1-nmorrisson@phytec.com>
 <648d3128d73c6b27c1fa9a3fb1ff5b39156810e6.camel@phytec.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <648d3128d73c6b27c1fa9a3fb1ff5b39156810e6.camel@phytec.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BCE:EE_|MW4PR10MB5680:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ec72d19-95d9-47c9-8e45-08df09bf39f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|23010399003|7416014|4143699003|10067099003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	He2xzKacudV+52U3ydUVZuyt1TLhHLqZMsxmtY2K8u8zlWkwpJRUD6qY1jHbMkmdlErm4+bpvHOHUHUr6kD0VpEtxYS5eO1Lp+YBSjwOtag1JkgOvsKv5P92H36YbxxSx4iWLLpA3hSSEWBjnvYIRNn23SUTXCs/cl9H1e6vco0MKpzqaV1ZN+PJpzFtKwv+h56elE9Y61fJ6XPonmYDIRrw+VUpwocF7gRvzKG1XGZD5Rd/3JqL+g+/oPjHbDTfGCgZlYSvq+nd+XTLVyVxUeFQ0fCAj1q034sgNWiXHX1W/7Q1VEgf6wqvERgpHvCZc/jfqOfg1PyaprzTS2uH3V6Oh5lXrv1SNWkHBGTPDcTVbHQEfYo1odFBfiqbsSazwr7kpVlpMkDMBifnyMHIH0ib6uBO6+rWU9vMaY2DRF6tmRHT0CyhK96Z25iz8b3Gq0e50Bt4iQ56K6+PyiZOsbt5igu4ubbZg7VeDvLJfvK2aJa7DSTL0y1hKohPhaIl70O31NDZIyBGejcIlERNfD/lFqH/JH64FBqI/05ck1fWnuLsck4y1Y7bndR4UPqIfrwFwHoMxFeZYnCiHMrBfM1qkcPsKHii9Je/ImQPrz9qmvfZzUfQVtD/PlfsBD0KkaNrCf1cesdkBQGCZ6giWOAoXz4WOB7zbC3GAiuaxkSabmYBbHGFAP4fdC99t3G0iARrX46L6O45glyCZ1gb/Q==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(23010399003)(7416014)(4143699003)(10067099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zlG5KZ0eNVHpYjG32NBEDIaDz/EZUlri1bWbYXwhG6xJ1RQqNqxkVmcfo4BFjo3umvLqzygGqVkJ9/PP6uNgbhBvqt7hqDcyXkyMIgcChpX7ISY//65QG69pe11w/zTP6f4NLRG9BZo3WJaKGKmc8MwQoElz1JMPCBszgDdBzgpjYCQPk/3NWh/OIWUxukmn3lnhvm3c0o4HKaiMFsAhJlWBkp5zugDEH45UME1AM8eL12kczNwQN7Zw/FdkoHppIOhx7oKPR3e753li1LiztS2QsxBaF24mqer5urpzZqp5iu3Ec43E3F9thT2WqeSYomxp7MWATQeLHvLRrxNkbPxt17hYZvOdCa20msWQ1x7NAwtxGhoP1TlpiEhIdFFSNRRs8QmW6KaRdJG1jMcRqVmYR8cgHNC6iI+9JneNMHqgwo/C6KPeNmibzVKA6ZCU
X-Exchange-RoutingPolicyChecked:
	KId01UWTxRvKpm41XT34yAabAG+5lfdrBdFMEpiSU3HkzdHD+i4xcqNHUFC2ryfgQR0q8R5CemX4/pTWsRio+XkUpyu4ool2bpjSm/I7PMq+NUGJIcLuMn4a3hrbVGcudGVBbvmcsELfA5DgCTK4bCLmTTR8XQKzCG0v7AKX2QWwzWbHecUgINokWNbHS8J/wL0Qz3pEX0kXUFJV5w4i0EkjIEsiQRkmBXJhe+865LVIiBlt0w7DVyeXCtRrZEAs5qZLnni8pyWMEjzGtcKSIZPP2rTT8g4/5so8jjjhiiiKL8ZodIJXCQKnChplWlg6z+wdC+LBjiO29vZhXU/DyA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 13:28:22.4393
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ec72d19-95d9-47c9-8e45-08df09bf39f3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BCE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5680
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExNyBTYWx0ZWRfXzgQDrqeFjnZF
 1L5BgvbNin2/Eu0KpqOxQ5C27AVp+pcoF+X1FGis4P6fZ//Z82nIZpBOCv2XqOi30I9SKE5RRBH
 ojncOxnrV1OAaWn21ZxIKxJ50gIrbO4=
X-Authority-Analysis: v=2.4 cv=J6eaKgnS c=1 sm=1 tr=0 ts=6a9975fb cx=c_pps
 a=JAvUoUKTMhMV/AtIpjtZgQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=YyvoK_82j7mrY79aEykA:9
 a=CjuIK1q_8ugA:10 a=QYH75iMubAgA:10
X-Proofpoint-GUID: 7OJshW3ooBi0-RyV15tFJBScdrMWZoS-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExNyBTYWx0ZWRfX0wltixOJD4kE
 unYBL31C7yy+I4oWalV6yKvNoJuodV73EGTQH35AYfKGj7guu7qx5pUrZoMYgLx3zcn8ScfoACi
 CzgHaPTC+PV7Z7IL4CNFCHYFkhHH8B7ReP0OBnbjlGgiYSFLLhNUX7PANPEnYLpMlcujVj5ZLE1
 QA0Qeo2tXe6Auju4AYYX256jCXPOt+xwXkK/WRuIc4rc1KsmFhjVlz/W5SxkUyhELzVgJzqTFhI
 kOAT02gmb6FeGT4oeggKEvYQlAkWTo55EJMAOuo3hkECOIsbCsu/Tj1AR3oxYLUEESkVhc5jNCO
 ABAXoA+CU5jXjGumQyNBYH9e3xOuwe6M7Vbp7rf3b5rvBn10h7zIpL7M7bToxywsyF1ekrdE84Y
 owgJkaS+z7cYHZY1++R9FyGIgVx0K7qRuFysUGjDHuRXJOydWlP+suqDDDvAcNqdPzEUeZ9Iawc
 DWIQBsOZzdFq9lUelNg==
X-Proofpoint-ORIG-GUID: 7OJshW3ooBi0-RyV15tFJBScdrMWZoS-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1011 adultscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030117

On 18:20-20260902, Nathan Morrisson wrote:
> Hello,
> I just wanted to check on the status of these patches and see if there
> is any further action required by me.

Could you rebase to 7.3-rc1 ? Sorry that this missed the window for what
ever reason.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
