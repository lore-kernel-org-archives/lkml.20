Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794440381;
	b=REothmDTslsyEADicpLoPwhnQBxc88dqLMSgduLLj5IyLFeWJqYPimjFBFEwfvKt0iaI
	 mq3vN3G4b/bieGFSs4+DT6GkjPinNdNkp1fyxnSLOSgHJv+0hr8O094q51mxF82m1KkPz
	 oukRBmXeogI5bfOSC2A3LcYY0W3704TfDxQ9YJlYgeho1QNMaW/xRnuH9pjE7lqSALq7y
	 WjeX1wLKEXORWaMVLTiQlA1JQH6Q8jG8wp/f1sIMdc7CcJePBiIolPSieoG3vpuIA0uI+
	 vTGpuut7HOApUrIlk50ALPUx3JR1uLE4lPSB3b4ep/kmOWd/IEHScolAAaJJmqv5sZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794440381;
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
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GUpartwp3BZW81j2ExrQ6kctp8a8450QvpBdGDfP3v0=;
	b=w2U3IlXZfdiPctsSldfM8OEnPMUq4npMNE/Qt24PFWDDgCSIe3HxMJgo34jk1PQwv5hv
	 gwChg7jjAQDcKK+PVzKG5Ew7nG45rNBia41HasUThEcDGvLPNxKHEU8IfDyFtv/3mha2N
	 eO2p+436Ex+oHWvaPdZT+wLr8bq5F/SpY6XSta2DBZqETZZuW602twuYcC+6budmeUS1u
	 a3nivtzMYFmfz8sGk1dyEwo/OhlxN67RxZ8IWYGdRCNi8UiE2xh3N7utFn3CrUzE6xN1V
	 si/vV/bBWSdAFvXcLo5KGBNHg+Zbe0B6G1rQe8HLNlv078ljvKqyNo/QExpksjHL6jg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=a9LgbL6K;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=ZSfsXeYg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594ED606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:39:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 594ED606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=a9LgbL6K;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=ZSfsXeYg
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6ABNbndM1589068;
	Wed, 11 Nov 2026 17:39:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=GUpartwp3BZW8
	1j2ExrQ6kctp8a8450QvpBdGDfP3v0=; b=a9LgbL6KfyxQ0s8/nFuZhy6GsozMl
	nM0hkFm18fqtkh/zcCBfk62VxN41atmske7UrnVPwfIVwC99t/jcqXtDhd0LTcet
	3wplUksmDQuFQKJQiuC3K6n/8nmRhujTTxUOJTLleuOtIdICCcSmRlZB6+XG+PQ7
	OXQ131/lKCqDYx7XgcBGT0JS2nOlSIrBcIr3WW9jk5Sn/rhS8zogOnJwuZKR8Q2q
	e2T+xrylBcwaI9HKtPK4N+L7lnPklK3O76VPLIm0y0et8BuGvrh/s4Va1Lfsq1SB
	Jc0r997PNgWQY8eS227zKoGiqIQryy9ybmGIlt/cylWeg2clMZgJupbiA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013058.outbound.protection.outlook.com [40.93.196.58])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hveupxm9w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 17:39:38 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ehKFYMKGkSfSGPRzdrudKjXSFuFLJWzI3iKEK4d7hH39SlWCo1zS9f5a5shq0YqWBbufn3dSkdHaX4dx5JdOU5AbjTPm9uLnOLiwqnaGC0jeHwhDNf82j6IjALQTutoIv+QSn+P6ud22J1ObKV5g52ROFEP5TGbFWfoKnopF7N1CLndTp/nCkuL5d+MzsmV0J9U0LbE4j+TqROsCR7Z91Vm7eLK38L1Qw51xHfSbQdMZl+wGxmRr0Pz5UW0NEj6zcshLcha4mAVd9BSmfQikqyVTfMsdOqC52eCw2oJNR0LJ6DRfNShibx/lcIwzC3oalAT9OwFyPVBL5f/k1hl8iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GUpartwp3BZW81j2ExrQ6kctp8a8450QvpBdGDfP3v0=;
 b=tUjvIHlvhnKXYV/NuEPsIHixWoqTZ5ginqXBRl0c04QlQpu36VxQFUFcg+Q4re/SbSxu5gInBCX0tD5cz3dy6Rndm62qPX3Q0NSAtxh7lcTooxQPj4Xf32K+/cYaR6EDvQmGAycU8TGG9/p0KGcWtST84hcowgI+WPBO5wa+BV17CDsktitYCV8AWSG6PdurXAGEDC7K47Cax6OAfGWTwXrppW+eB6hnFxUgmdFEW64yHW1erSPdOm990+6zkPe/7LQnwt6q2bv+ZXvVEk4scU6c4SNI/MTfSCN/sh99dvkffzk+UzTJBTLq++LoGBb69u8A/r3AFmZR78OKZO2ffQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUpartwp3BZW81j2ExrQ6kctp8a8450QvpBdGDfP3v0=;
 b=ZSfsXeYgL1KZ/Per2Gk7KzYcGUrxSXATWacRJSoyBiKefskFYJ4y18m+JMUNG3u7owDha7/4XyexAW3B+d9ldS7DIWlLMmzi9qHCukGKqjhkrmTijfZ+c2r1z3TGbpzfZc8O+m1vr+9Ms7c7QrxxaU+OFN00IYBiM2kCFseOdsw=
Received: from CH0PR03CA0099.namprd03.prod.outlook.com (2603:10b6:610:cd::14)
 by LV0PR10MB997588.namprd10.prod.outlook.com (2603:10b6:408:33f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 23:39:35 +0000
Received: from BN7PEPF000000A9.namprd05.prod.outlook.com
 (2603:10b6:610:cd:cafe::57) by CH0PR03CA0099.outlook.office365.com
 (2603:10b6:610:cd::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 23:39:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN7PEPF000000A9.mail.protection.outlook.com (10.167.245.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 23:39:34 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 17:39:34 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 17:39:34 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 11 Nov 2026 17:39:34 -0600
Received: from ula0226330.lan ([10.249.32.167])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ABNdXT53883381;
	Wed, 11 Nov 2026 17:39:33 -0600
From: Andrew Davis <afd@ti.com>
To: Mark Brown <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH 1/2] regmap: Users of REGMAP should imply the needed support
Date: Wed, 11 Nov 2026 17:39:32 -0600
Message-ID: <20261111233933.537905-1-afd@ti.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A9:EE_|LV0PR10MB997588:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ac6b815-30d5-4c8a-1925-08df404d0ad8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|261026121527099003|261009223027099003|10067099003|261028144727099003|261026140227099003|261021123027099003|261102123227099003|261021121427099003|261022105027099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	EPaEocEmUEJrNOaRvXAnJMyI2jdMYpEaSb/EVkfVCFP+YtOcP0UhyAiJd4j2HyLL3NEvPU4s9xHEcPcFk0YCJcAIpa+wHIDIW0nbJNFxU+F6lcH04cfyOrDtf0Wg1w5KpKE1sBxTnHeDSbOBQBvThPbbIp1E3yBolqiDSC5jWwGicMfj7j2a0oGG7AtCHXcLSRhly5yXwEYeiDip5nCan74qMUwOHYkdDxUzOR7pdMbOPdIW/i3UzKO06oqqsj2eSf9k0ktTuaKrGi0ObWMznCcz+7kby07f+1S+c27bwXzq2Ri9FZyDvqTAFEirDFLJxV37B78KFbMrESh231zwXIsEYTVzVJL/9Og/MhAep8agGE4cKws/KjPdTbc+/mc5CpFocUanP095Og5tGutbpclLVwOsTVDGVzD8YxBs+nJK0hjW4oRuJhu2x/7tRr7zmIxKe2+gduB258Q+J+PGH9naybvKbMSA1Swv9o5vP7XTOK1LBN4FP6XQmLNFKhCoA7DByhkXnhvP1jfNJtP6XBRXiSiuDvgJ8221WIGUiUxaGWBchYmaspft1uQROdTDjprkjCiLXq+KaQAZ0BB3lTBOP4x0FwyDytddZmVaLRa+nPyYNEYbb3J7Q3jZNK08dEVPm6MaNsVM3bo505Icu5dXbW8ElrRGbWiZM/I9jM6Pt+YH3KPlqpMRjMaM6qYVLEQVq2zlgbha3zPOrmkGbQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(261026121527099003)(261009223027099003)(10067099003)(261028144727099003)(261026140227099003)(261021123027099003)(261102123227099003)(261021121427099003)(261022105027099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4D2BqASAnRDxinaFG4UDAkSXUINr9GpDQ8wBOE9Jhopt77cFMyy0vpOAtO1QG4NfwlqTl1uuL/ocOba9WN+TCTac6dWjUjgb7mq4HJoGwzwzTywf8uyEh2p1Q1bHvS5irrJ97LzhJhIsGJVmeRk7RAyAEPapP3JEmlUexp2YpZzAK3x6oHSqkCVZ04Uqi5nRXCQUFdJ3pJnOOaWipbhp0vmxtQCZdxuJ08ESgpa3ZTTYqw2MX24Asxsyyl9na1h9RlzHrHM5IxjcrWIHZMXwIDpTJURMO4mTms+CFFe8aIbWxsYiYa+lRLc0VgGNX3IEV3jk0GWFPlMjgpM5CpnnLh4JlLLz+dtgCAXjAtuhlBh7ktLe6wZeFt/jbbH+OopsMpKdv8gAKn5eeU4AzXGKa2x6vaYybIws3vQH+5hXjJvJqjdxi0UzREufhNc0kCav
X-Exchange-RoutingPolicyChecked:
	iI6kXnmCjNzuCrteCODxXvWAsyRNh66j8Koupc5yg+NnMAVzB3oo+4M0TEbVTKC9PQNeaIb6knDsrTKwEYOwyV2MAfLRLmR9HeJ7mxe2U2TEXQiGExgUy7NHhyaOBYnOOyCxmS+pvrGlqzENgM0PfJERc/8hwhqxmKY8V806V8scDCfvyGvY3k9RJaNvSHHQxnBIK4MC6c4nh1TuPqNK1Fho6cQqF4kOs+09SLyBF9REOEeJgncK6WzrXt6VMrfhxdhxAP3patdZRqcaL5/S9G2GdVJbzozvTiqDdIoBH9lIk5NgQB1OJ6tL7ZITlwXT8O9Lsd9LvUsm04PEd/IV2w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 23:39:34.7283
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ac6b815-30d5-4c8a-1925-08df404d0ad8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB997588
X-Authority-Analysis: v=2.4 cv=KeRHIgYD c=1 sm=1 tr=0 ts=6af4fcba cx=c_pps
 a=5YU8ENXygJz5UkgxsLF+dA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=ZZU4DHmAOaP0EZtLoAwA:9
X-Proofpoint-ORIG-GUID: hkumJwewtU18Uy8V8gccpPZjwPMkvDu0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA5NCBTYWx0ZWRfX6wHb66Ct85AM
 Ub1Nnis9GNLqyEhBPNs+Tncca0Cw+eQPtwDsLwqOdVUQER0TWdJ+Gk751diMdeRtDvlirYs0CeV
 ZC25bEOUiwNuBWFMlrZlfDa8IdV/XMeEetMdPDnksYZm2EiJvKr4u4HSLooEHEivLhOdclzBtmg
 74dGyedozwRHXucixZ1wcyN728mS1R9UqQxksbQMekPfwNzQBlkHkz0CaeI9Fri3ndBVVy2inYD
 KzzDBWqBYOYa72mCOX7XC9fisqsKwoTFMZsvQw6ZQQcOouS/M04+kIxmCbXA9AiwQRjeBpz0hQn
 wqXn5kjxQkHFOPg003F0cP77tkInv+Dq0OvbG1LTxU8Kn9Fx9e/JnChdm5zjqymSnJS0WVcEnd6
 vIRV6ZQS9ZfPLE015e9RvaW+PRjl1NKFhZUQzKnnouteKjjzvgXcovfgQY40e53V/ktoyM72qwl
 gjmJX9kO7eyuJPq2pUw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA5NCBTYWx0ZWRfX/+hac6cfisY5
 duFL+TQBn+U4K9hSSf9qT1cCbRcF1+FSP35lYaw24UvoIySOUC+3El4icrbVqC6XgbRoGKDOkDJ
 7BscLRwtaOS7sPpIRyCzAP/DxHnowSU=
X-Proofpoint-GUID: hkumJwewtU18Uy8V8gccpPZjwPMkvDu0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110094

This has the same effect but makes it easier to see each that each
config symbol is enabling REGMAP and avoids a really long line here.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/base/regmap/Kconfig | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/base/regmap/Kconfig b/drivers/base/regmap/Kconfig
index 3c76a5bf67b7e..ef5fdd1ed6c7e 100644
--- a/drivers/base/regmap/Kconfig
+++ b/drivers/base/regmap/Kconfig
@@ -5,7 +5,6 @@
 
 config REGMAP
 	bool
-	default y if (REGMAP_I2C || REGMAP_SLIMBUS || REGMAP_SPI || REGMAP_SPMI || REGMAP_W1 || REGMAP_AC97 || REGMAP_MMIO || REGMAP_IRQ || REGMAP_SOUNDWIRE || REGMAP_SOUNDWIRE_MBQ || REGMAP_SCCB || REGMAP_I3C || REGMAP_SPI_AVMM || REGMAP_MDIO || REGMAP_FSI)
 	help
 	  Enable support for the Register Map (regmap) access API.
 
@@ -33,37 +32,46 @@ config REGMAP_BUILD
 
 config REGMAP_AC97
 	tristate
+	imply REGMAP
 
 config REGMAP_I2C
 	tristate
 	depends on I2C
+	imply REGMAP
 
 config REGMAP_SLIMBUS
 	tristate
 	depends on SLIMBUS
+	imply REGMAP
 
 config REGMAP_SPI
 	tristate
 	depends on SPI
+	imply REGMAP
 
 config REGMAP_SPMI
 	tristate
 	depends on SPMI
+	imply REGMAP
 
 config REGMAP_W1
 	tristate
 	depends on W1
+	imply REGMAP
 
 config REGMAP_MDIO
 	tristate
 	depends on PHYLIB
+	imply REGMAP
 
 config REGMAP_MMIO
 	tristate
+	imply REGMAP
 
 config REGMAP_IRQ
 	bool
 	select IRQ_DOMAIN
+	imply REGMAP
 
 config REGMAP_RAM
 	tristate
@@ -71,23 +79,29 @@ config REGMAP_RAM
 config REGMAP_SOUNDWIRE
 	tristate
 	depends on SOUNDWIRE
+	imply REGMAP
 
 config REGMAP_SOUNDWIRE_MBQ
 	tristate
 	depends on SOUNDWIRE
+	imply REGMAP
 
 config REGMAP_SCCB
 	tristate
 	depends on I2C
+	imply REGMAP
 
 config REGMAP_I3C
 	tristate
 	depends on I3C
+	imply REGMAP
 
 config REGMAP_SPI_AVMM
 	tristate
 	depends on SPI
+	imply REGMAP
 
 config REGMAP_FSI
 	tristate
 	depends on FSI
+	imply REGMAP
-- 
2.43.0

