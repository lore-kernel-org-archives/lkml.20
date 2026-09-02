Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2E14A8A22;
	Wed,  2 Sep 2026 21:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788383092; cv=fail; b=j+Zxb/rEsiLP8Sb5wl6euckRJzN1AoSwYAkwn4AopPZFiNkyX8MIbmDbm6Hj5PFA9Vvfctd6r+A+kOZUzOljZ8IDJBtjl9d/jtkibiCqwoTtAQ6Vdu4dfzLyznU4yzA5BFP0G7khGhqBdoIt1UX7+bHeDeH80mQ3Vz+NxGIJRUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788383092; c=relaxed/simple;
	bh=3g9r0ejDawRo2kPnoqsK+B4UUyKDqSdFX8nu2sROJ70=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=depfJZpsZHhdMfGnDEWpLyLOXw3x2WDaXdRXgLyLPBm45/fu9vjcXrZOQ+bRJ0PQr5jrqnKpMxTZIiPXn7X3zDphjKlDj2uu94wbT1lfDRscWw8+7Ua7p6RRp8wfddvZp0L1O6BegL0rIvNFfRdCNEq63lqG04D1NuGpyU7uh4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=OBq/JEgv; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rr2kstUD; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="OBq/JEgv";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rr2kstUD"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 682KHFtw1851575;
	Wed, 2 Sep 2026 16:04:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=jXIp/XVvm3Xid/Zq8FdegWgMNyLiyANnxUUay04N9
	yk=; b=OBq/JEgvHjeKfEIYihtGePZnm05C32KVDInTgI1lZlip9Mgsh47X6TOGQ
	ilf7SbVgwnJyjN87pJp44N9M9fw2YS3BGgnAODICL2/dVRRTt65TGQvAuquJtspn
	IURVYtp9u3oimhorrJABVAlndlJeOXLGGgNKsv7v2fNw17u7nK9+D3ZsZOce4Ctk
	5LSKGYy5vR0cPut4Mpjfey1hAzWI8h0BwhfT5DkjxO2SI4/ucGcCGIj2ovcSGNhj
	veFmtHRxk+zWhEgr4Z8mGudU1CmR2zsd8OExNjPnIrElJdpKZnYz+dsUX9lg+tn7
	DDAqm5WcdoAyyH2afM1gNcGxz3CFw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013058.outbound.protection.outlook.com [40.107.201.58])
	by m0384305.ppops.net (PPS) with ESMTPS id 4ge7cgf9c2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 02 Sep 2026 16:04:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jw1h90GyhHaQ9bQFO3Fuq75F+d5e60uH0c3NWEwbkF7oVpYGXIf4dFMX8kIvs5MNRSnJ8BGtSb7lAQqj+Hgz4QjtQ0JG/uvKst3tWlWQCWRN5RnCiup6jIEMWvHrxn94D68mtgqZ+PpNTxFFA/6+Chcd3KTVZ53UyzZS0imfjU8CWoGTb1q9Psl2FkT6RoU451W0YXNC+dxF1Sy/PWF6LWeYi+dwRzQYwwCIaTa/de4onGKn34TxGfRFg4q2Vvso7N04ZT+WXCQpFYzW+fp6hdLo7h7/tFMbseCD9DKPZ53Z7VR+JHsbnAfNpDs6TmEqUnS9qXbKqyjQRc1C5puOcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jXIp/XVvm3Xid/Zq8FdegWgMNyLiyANnxUUay04N9yk=;
 b=jLLnGwCKXRkfiUtcBv/9I3KOLWK3vTmHbWSkxrUOUIkPql425W+UQviU/bTc1cnN2EZ08J4nqV/ZNzVf8Um1pXvd1uMPOzoxjcFuptTM/ICGwIy+7os7uz8BHeQ3Sk/cW//xBF7vo9rGYd0ENZVwphL2vKjM7F4rN8as4v7Qj/pj2sfl/ozIbKN+mr9icl/ncUU2BYnCBEZ+X5vrCQdci7PRsc4E5eEXnpT+4mG+84773ZndTOhDLKEpvbsC0SQ5VQwX+fzbIvBLGKwPcokZH1ytDmF7YoBvdJGL2BHon9Xw9GRa4ea6H2YCOUBRecnUHXAav/SBW0tsIBJ9WwypMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXIp/XVvm3Xid/Zq8FdegWgMNyLiyANnxUUay04N9yk=;
 b=rr2kstUDCsMMz17K50xAp/BsfAehwtmBLgHLYYiN92HdZhfPo1pkCKHhxKL7ROa+1tKwe2yNNK7waNeAoDGRs4j33IFCe4LlnIYau/6woIIHfKe7xSKmrcAORd8TV9pXo9zQki2zQ9MQv2r3gSZGJY4BhxO0cIMObLvjwFmVuJo=
Received: from BN9PR03CA0803.namprd03.prod.outlook.com (2603:10b6:408:13f::28)
 by SA1PR10MB5868.namprd10.prod.outlook.com (2603:10b6:806:231::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 21:04:39 +0000
Received: from BN7PEPF000000AB.namprd05.prod.outlook.com
 (2603:10b6:408:13f:cafe::60) by BN9PR03CA0803.outlook.office365.com
 (2603:10b6:408:13f::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 21:04:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN7PEPF000000AB.mail.protection.outlook.com (10.167.245.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 21:04:38 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 16:04:13 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 16:04:13 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 2 Sep 2026 16:04:13 -0500
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.196])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 682L4DKx1301748;
	Wed, 2 Sep 2026 16:04:13 -0500
From: Kendall Willis <k-willis@ti.com>
Date: Wed, 2 Sep 2026 16:04:10 -0500
Subject: [PATCH v2 1/3] arm64: dts: ti: k3-am62: use ti,am62-m_can
 compatible for m_can devices
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260902-smth-v2-1-b3678ca44c7b@ti.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788383053; l=1377;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=3g9r0ejDawRo2kPnoqsK+B4UUyKDqSdFX8nu2sROJ70=;
 b=EBa+WgQfrod0CTuUY5JTIdDJ2KmrV1+a7C9Ebf/D7elC1EClX+kQbK4xmaTMRk62KylleUDq5
 EvJ6UFk2CTIDT7F3HVAY/23a+4sMoURGAH6nFSValz/EEwAyBHxN/bJ
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000AB:EE_|SA1PR10MB5868:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ba22b26-bd90-4674-97ef-08df0935cd3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|23010399003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	fIG6O3p0Eyqi+PZ/nIbLrurvCshx/T3xsEWdgdcOPRHYhiyEIHyvqu6M53s7x8hw3f4I/YtPWp/H9o+QJBfGR7Whnkp3wBBNeFd0wi6nowTz/feOF1povASJcLdFAlIZcAKSM3hg6gadmKvF+q/HRtoU8LSiIQAZ4EEKijh388XzPWAkvq02/ZlVmbuYft4AMqPohGtyMyEIBnNOfCi/J8NBhb7CWnyv06Tb7CLMFHvaXAG2+xo9IjYxCachIIYYTlGGll9hYpvrnYZjNuL55Yh/hgo33LRWdgGl3fKnJ7E2eBmVpnd0iRJznLt4SCj5/1KZkG3ZqcDQOvbFpUNp0UOf2X7LpZIsrYDj2LzysNplbEMMXiBmS6IsXnEfH0AYTsbrx3obspKRk2PDWQCGVCA2fUY3p3lapqUrxranKfwauwZWBH41mbwke2bFZhgQYfVGrSS/wpGlk3LtoNXSQ8bTnqi8wOwa5M3YviS9Mbv1S/NnbgRXgixw/CWgzsrR9AI+MJg4Tco3wFzmBnJ9nO0DOHSqn48rhTeL6BdEQgk9JGQkgztvmqPrJjQhq+ZSGD5vEqnZq96hU+BRiNnWtfEhLp31zSybRFiJShNzwpi+JkkcD9q0A5if0Nsv+Iix4hE7JMpRw/PcM/B2ubaug5FxX/23ryua1m4JmgH2NRyWKjXnVfUTcd8VqPOHqAYfxYKNZ8CZk02HUkHBn0zekQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	k3UNb13efb3ZsQnGgcq67XhsiJuzOlogPp+hTNJB2oD2PgrQ9Usu6c3WmovrONc/TD8AgaAAxoAVYvByyG7c+mwNJldWHVs37Znf2WREOM8z3NNqkF5tJPi8khEtS4zT9Zi2foD8CZyWVeAuczPbRhNvu2U263YC14aWp37l9n7PsDryJkqRVbPY33JQXN2BBETvrdEhK/J8DxuCebTvDqiygORq938I4WdSbg0SIukuWfz9ocojlllSgAFhKvDqNFMINB3D9F5sOt3M6jhuYSr6J8HkNv/XboqchRgWMKZ6n+BY9H7xEsWQGgWf5enZMbMSSPi447EIlzaTnzCJ4Hu8z2lJU9K7nvsVkY/LE/Sf/PcXK/exet8qwehNZ5bEaMUv6TDMkS7upP4ob6D+Zb8BjwbEww0OckcU3BQ+FrGzOUougsbTwHfwWjZDsr2H
X-Exchange-RoutingPolicyChecked:
	Jsr5zQES1U+6ZULwJRvyCKkcx8z58C3QjPZ5LeLXXpraci6ISjaSiKp4cQxgQCi2D0VOJC+2bouXAb+gtuQXzFGmnChSU5qn9kK5i5DVe6Fxyz/q/iV/mr2g/GTJdtX7V8xbP8XbkqzmZzsD3WPo+d7t2eLZ9ikYhsOWwoU/fbXkNZ+qI4MCWbotuOZ3ESGMyTXYYXEHvaqgzMvq1ZPLX/E/4yZQEJHa8eCn9xGU/OLHW89qFn872TRGMmKbAtumQbKJJNUQLoQ8axD3XS3mkAkXDYDDbklblUMzeddSc0tK3hRrzGtMshJXLl6sBH+hzSLe0arKBFScXBTFPgDR5w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 21:04:38.9875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ba22b26-bd90-4674-97ef-08df0935cd3a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000AB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5868
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE4NyBTYWx0ZWRfX5g9asS9FSVKl
 52Wiu+CrcCPR1fa1oUBjH9HHLJvmkcia//z1cP7LWo/p2fMC90DOTiTpW7Ji6Egj+z/eAe/xH3A
 8VcfCq6zi+9XVmD+Fwi430+xEBbVY30=
X-Authority-Analysis: v=2.4 cv=Ka3idwYD c=1 sm=1 tr=0 ts=6a988f6e cx=c_pps
 a=kezO0BecKy1es1U8+DqiPQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=zYzSmd4XCWFqueqVWv4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: GogLP8-XwEXWeNfqFuJw0WpxmNvvplw7
X-Proofpoint-GUID: GogLP8-XwEXWeNfqFuJw0WpxmNvvplw7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE4NyBTYWx0ZWRfX15NRSjXG0a2x
 52BqJvELpjc/nSuwXsKemTa9ibLJ4m4fVdk78pBshXpxyk6Q40oW0a6wC8YOBaBB6O0z+0OQ/4M
 4yypkU5PVhWHr1t7QLgmwlJePa+B+5ktCXkuh+yM4h83RSvYWVjj6diNubYyB9JZjo1KMDK89dS
 RqSGZBbmQpFQiqP2SmdCQdf07B9B+3KQC/Ek9RExVELVteNEMfAoREq5PGhc/b37tT+2C/ygYWG
 hxFU5xL/hbahMNythFp+prhrOaxJMcvv2uB6BYmPFKDriRn6AD+AXR21Ckor9yoQyXcFGwVLf+q
 1bdd1G2EjcraKHLeJgNn9Z6j/rb5x9NK46yXf0Zvfwj2sgd//OHe0BUegTq5sYBKml4Y83E/DPU
 vlRLhN00isJQacHmdUNitVnQ6pQ/b5JoI4IKS8NPXGQTj67IBsKX/y1pH1ZNyFFeUuXg/WZo/Nd
 jD8VwqDNZgsVoVrVMhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020187

Prepend "ti,am62-m_can" to the m_can device compatible property since
this compatible adds out-of-band wakeup functionality to the m_can devices.
The m_can pins can be a wakeup source in the deepest low power states,
despite being in the MCU domain which is OFF during deeper low power states
since it has the out-of-band wakeup capability.

Signed-off-by: Kendall Willis <k-willis@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi
index 68e906796aefebc5eaaa5a231e56105a9cdd13e5..b4e14364e7e2b3e40afd1d010a012de6414409dd 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi
@@ -152,7 +152,7 @@ mcu_rti0: watchdog@4880000 {
 	};
 
 	mcu_mcan0: can@4e08000 {
-		compatible = "bosch,m_can";
+		compatible = "ti,am62-m_can", "bosch,m_can";
 		reg = <0x00 0x4e08000 0x00 0x200>,
 		      <0x00 0x4e00000 0x00 0x8000>;
 		reg-names = "m_can", "message_ram";
@@ -164,7 +164,7 @@ mcu_mcan0: can@4e08000 {
 	};
 
 	mcu_mcan1: can@4e18000 {
-		compatible = "bosch,m_can";
+		compatible = "ti,am62-m_can", "bosch,m_can";
 		reg = <0x00 0x4e18000 0x00 0x200>,
 		      <0x00 0x4e10000 0x00 0x8000>;
 		reg-names = "m_can", "message_ram";

-- 
2.34.1

