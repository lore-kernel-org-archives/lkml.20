Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793297599;
	b=lcJmqDVA41Kj8DhF2tHOyBfrsckeM2u9zSUpiCiLIkABlm1lnbs5xjmyX64ls/Ml0dJB
	 GDMSSvcphTYUJtAwW7zrFnhPZDUivQj+yUCCclceASlqbOdaJon9Q3p2t90Yx7PKMJU0S
	 bkvbKeSeMhvUcwi970snFUPmDI7S4ANaMM3vSGUqvEDjh/DQHxaoEA7nW6IXCk9nR/kVo
	 OpFz32iOEgci8ER5gwA0LeOPOxOu7m+ssfEfCxFQf/wa0aUd2Zy+65eQWBiz+YOvHNt3K
	 kLhwhPg5+tfsAJZi/uec5z6WvlzsrK/inyQAiiLBTxoMzc5Fnwh8bmeRAjaVXkD2yew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297599;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Clqeb5LeHf9eH7p9iHXDd58MotpSwx/QovTCPF6P074=;
	b=H5nDaAWNbjS3QtWyLqTNs+vf34Ft4iCC9f0dKCS9g8yeHHBDzBnXdgEF3kiBsPxhQJO5
	 hj++W1ud8qfKM421vuA27Iln6lMF/G9EJ+7+zXfwy1KAKVZp0rxW6M3LtnXjWlMduHM9P
	 NcI/by7PgLUEqNIC50nOUZZvYX2g70e9Bvn/TGNkloti9IT4Rm9zZ1jeNHQO3i/5x9Oue
	 /jWiBAs4pBf6BTP8S3ThZ+N0xWqLoeIBrUwLkjxR9rh2EGT+OIcmS7Oyzzv60sa1gsY2C
	 +16aYNP/o+LEsnPvhORW7n9nkSyoAi18X1rjCJJlDFWTSfFnYAR+w7h0R+Mf2ERWKyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=GHNAdUGE;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=sURLkXwr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40E1606A321
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:13:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D40E1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=GHNAdUGE;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=sURLkXwr
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69TGDTD21079060;
	Thu, 29 Oct 2026 13:13:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Clqeb5LeHf9eH7p9iHXDd58MotpSwx/QovTCPF6P0
	74=; b=GHNAdUGEVexkrpG7/Rt39RYUD2UO//IJKDa6naH3B+y/Y65HZasQXkK8M
	SrIRNdmLfhOXQC4A9LEi9hos+uZFqDrB9xwo2QmWCv5rmoB9z2MM5OtokHKLa4Es
	IAZotUxeYYXaMjjBdu/4cG0r4PmthMRXU48Fm2tmHXElnvJrgt5QDdutCB/ITr4z
	c35PssOjo9n/EHmwEKX7oOKOH5WXnIrR0WEVyrll2ebBiEBQf8aAArEDADXWcxhJ
	eCO6+lF2/iXIsSnB8Pb1bFy7aN8qPCJLELIOMZNaZUyzQjnAmQCA6RVaxMEUF4Ww
	Hu2KxiZVxZIluP8ldkSv3TrROYNZg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011009.outbound.protection.outlook.com [40.93.194.9])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hkurvxapx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Oct 2026 13:13:15 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X5iM0NK3JvqSGahhhy6ySQdbW0xXtVG4N9E4M9clCAaqpQPYMaOy/jGE/z7t/Cg8FVAVeOTWom64LDbk/rSU5vEYnMwz3RgFfcAK+lO7hZub6pFCAPN08i1Gz+3gFxD/whfg6aTPz6+F31B5ZKbLO+QVl/PFw8doI9LnhOU8K3MhhNIZqZrhoGsL18RY6HRSuep6HuUW55Ovuh848R0RuDf455nIcBbIDLPfvbcMvLw7+ytV/nwMiViHG2uA9eozVpRr3zy7gs+GETZPL1hSkcwnV88Hgv4uPs1jwUcIMl1pcTohKqVdk2qt88CAbdUBHq3K+eM/1fNCNW7q0FpOIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Clqeb5LeHf9eH7p9iHXDd58MotpSwx/QovTCPF6P074=;
 b=gCAO6gJbQnD/rC5rS96P6Ci3vc6JhhGBGieTEj93KBnWMUNtNV5w5dhcMbF7FIsTS2V7aODGcgJg39jPaSdqU4ZsVOyzVEyHp30P9bfDjV7ekI9gZXb/+O/bAE8xsW19qAUFi/LJt855cTnu0l5T6ZrzfZf36ONdlye8v+6UxfAeeZIXrdpaliX7YKfWSD3zksmFOz30Zzkhnzj1wimALugr0fqYiQXlukDUaD6UYMNPCrSTHszreW2sGyqZJ+F01ZnnnGBW5Y6w9ZLGb1j+hSR/QSyxNNtlfRyEoYl4MQd2hp9brmobcyvq2N2fNgG2o5EG4XW9IpsRWxgdg29BXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Clqeb5LeHf9eH7p9iHXDd58MotpSwx/QovTCPF6P074=;
 b=sURLkXwrJhqb287djmBx33hdclDV+2aeBd/9RgtY4xzUrEDQ6UiUhapIOts/kCgqcGDrJTJCmW7SMy6F8JY093iCPqhcY8AAV6/jaXWe9rBarXu9lnPLB+tKT2gBm/1lBfycDSwStEj9HSA9XPv10Rj7pICc2AH+uIsgJ9s06Z4=
Received: from DS2PEPF00004560.namprd21.prod.outlook.com
 (2603:10b6:f:fc00::50e) by BLAPR10MB5057.namprd10.prod.outlook.com
 (2603:10b6:208:30e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 29 Oct
 2026 18:13:10 +0000
Received: from CY5PEPF00000E75.namprd02.prod.outlook.com
 (2603:10b6:93f:fff6::c5) by DS2PEPF00004560.outlook.office365.com
 (2603:10b6:f:fc00::50e) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4 via Frontend Transport; Thu, 29
 Oct 2026 18:13:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY5PEPF00000E75.mail.protection.outlook.com (10.167.247.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 18:13:08 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:12:41 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:12:41 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 29 Oct 2026 13:12:41 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69TIBmMG3408718;
	Thu, 29 Oct 2026 13:12:38 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v3 16/22] firmware: ti_sci: Move the huge ti_sci file into its own directory
Date: Thu, 29 Oct 2026 23:41:41 +0530
Message-ID: <20261029181147.266771-17-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029181147.266771-1-b-padhi@ti.com>
References: <20261029181147.266771-1-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E75:EE_|BLAPR10MB5057:EE_
X-MS-Office365-Filtering-Correlation-Id: c616c51c-0bfc-4cca-bace-08df35e84972
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|30052699003|376014|36860700016|1800799024|23010399003|82310400026|261028144727099003|260925021911599003|261026140227099003|260925021311599003|260925022911599003|261009223027099003|261021123027099003|261022105027099003|10067099003|261021121427099003|56012099006|18002099003|261026121527099003|22082099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	r1eZ34LS2cC6td4bKiiMW6Krfa3+hz9ocqYnAscuCL3EILOwGvSDy1Rbrunfgz/vMNpFBSuvVrZvQ5jqhXYWdC+VEheeTCxkWgeOUHJsSI7QSV0IAUkOSL7KjgXkRRU/lAIuROFed9uhNF70CmxPSQgTC8WTwbP62j1/TSu/H8HIqvpDpHEBg0HBw+7FS2eh9ztAbheA1D/EcEobdG59m7ulBB/upibcduAF74nMi2i80TmGdlazdqVALBc4fdWwMEgwJqpcIdECHlOO/WhC37JOXkKNt9mHGHzx3bSbmcZtDN5TWv2yPgbtz2dAxcUFJt2SArk2goS7vApNK7ewKEoL8EzCfRb1YyWVetecMYYrY4MQkJxt6Uu5vGBroIEb/38g8evHaSkCYcd55z+nuQYxrjHPQ6C6BjkrZ8A/72mNRXyB0/D4kIr8xGJLtqSVnvMv2hJPR6aE3MJXoh2aVWeT1LauZuBOqxFYSc6RlqbEzMLJxcjPuSGQykcPH4tdie4bkaKn35HxfcDpTbZ02uxujPGP5BTLkC84www0oYTjUCpR/OEjSLIHp4FFLuwooVNlCzF6fVUnAtGTlM1SU8A48VtJlKiKKcbzBgqVpjyrbYKOZ3yV1QP6rznNyQ51/jwQiSo2rKuBoAsQTriqvA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(30052699003)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(261028144727099003)(260925021911599003)(261026140227099003)(260925021311599003)(260925022911599003)(261009223027099003)(261021123027099003)(261022105027099003)(10067099003)(261021121427099003)(56012099006)(18002099003)(261026121527099003)(22082099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aDgjc11YMTCkCEv7qFMpcUBbuW5hOqZmw+Olc4UX6NSfbk9d+TfNDklbIX8iUqgf3/XqduklyOF5hlL6sgNdz+MTX/xoFpZkoUG/hkzZZoqaLIz+ILkWqIcuNWQRhglegSqiGZ7OvGpsGdhvI6syMOJ/p62bjtX9scw1kKW/W2/eKGdnoWDrj1FI24W29rGNvoPx4EjcS/Ap6tAkXWkFCc5q68rqzvFKhhp+jgAG+RRA1qf8GKwpOxXXBCKlDkqnngoMpV/Sx/f68Isl/Bs2wyTr6q23+/n5L6jrKiOnDsQijFzi6RwqlMr3KTUpNEwUDjRfWxMEfvEmtUBIruFNFGkRcOHy2crtrbjThFhEXojx+5Iq4RIXjZHlJThN3bWlqL2TMt31VN6jTTyowlCYg2VtMtIdZ0nhB9xTQqHKnQfRBHOWs/YmNwclTAOo0XIf
X-Exchange-RoutingPolicyChecked:
	zPHeu5zMk3XdAUyqL96bkGKheheXAE0JWq52m76BmNc/tn/3U9WazD9fiteIBOZn/TtLdibD0baQNud+J+GG3pFzghZ9Ul6wZBz8FFf0wsPElV4bZzb4Z3xl37gvCvLR8Hz0ed7Kn5szmkyepLvgyqZ2TGxipmkIwnpP8Y46NkJagCt66pRPGaj0CVIlrjZr8RE8Mz+uIJvWDQ/2uRfPDz4cdqV65kTsWjV+A5qua3lstS5L7JJ5U2UhQVEjYvMIuCElN1gNtNdkcdrDxlrFB2L73Br8dybrUADZflrq7baXrJ+cqbRZdt7Hc4ruO22MAsQhzGnmZPwlSoMUVyB3pw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 18:13:08.9946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c616c51c-0bfc-4cca-bace-08df35e84972
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY5PEPF00000E75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5057
X-Proofpoint-ORIG-GUID: lpnpvW3cc6ynHXqWTAZGL45EyBJSdriX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfX3ffXGzzt3L5W
 t6BsatExSedQEW0FYvc7enwbnETRq8kXiWb5+PJh/tLwFhFQYsM+Z8CeCgER9tDBgxCkCSUuIhf
 nWx63NvNK07xOLW9tcw6xIwC5ynnmi75h+drh6RxP7I9ZlYCHOXIXSD/8FL4hBL3Q1EoS5CWngL
 ww/pC1/cBW0uVqaQn14WirgkxqYHOrQ8+wzGjjIr8HQWT52nXBYpE6inMHx62XXiig5QP4IK0d5
 QK/yECnWqjikLx1Gw9qSQJimUTKIvCeIFlkd9KNVkmO3O6LdqhOc4HpeE2sStjDHaoKeFXqq1YS
 UvVL0NKEc0gFvMC9sll3Ipn0lFSaDpIFrc1HemMS6WhZr+vIhnjEp8PHoOKY0C8oBT2Mltm/ram
 lgJAXJDZ3qAoMHGi3yGYE9FtrtUjxJDmZXZGJZcc6G/DnKpQqxF+wV8NQTqvW4eqN9sbBkRit46
 DzYoQgCNy79a71E0QAQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfX3ZuxbAyRe/3o
 NwwfIiifjZWfQB6VcqKA4+FQIUru2A2uqp+FFuaGg4hy7/ak48wRdUIHEArNW5OQzcotLz8fssh
 xzX0yX5idK3Gf4HMkCh45mzZDkDOEps=
X-Proofpoint-GUID: lpnpvW3cc6ynHXqWTAZGL45EyBJSdriX
X-Authority-Analysis: v=2.4 cv=DtrDa2/+ c=1 sm=1 tr=0 ts=6ae38cbb cx=c_pps
 a=9d+VVJWglIGFt+56pYWlLw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=t0xcZEm9miO1DoCZsTsA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290071

From: Andrew Davis <afd@ti.com>

Move the huge ti_sci.c file and its header into its own "ti"
sub-directory. While at it, rename the file to ti_sci_core.c as this
file will be broken down into smaller files tied to operations as part
of future cleanups.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v3: Changelog:
1. Rename ti_sci.c to ti_sci_core.c while refactoring the files.
[Andrew]

Link to v2:
https://lore.kernel.org/all/20260930160607.2674980-17-b-padhi@ti.com/

v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-17-b-padhi@ti.com/

 MAINTAINERS                                     |  2 +-
 drivers/firmware/Kconfig                        | 17 +----------------
 drivers/firmware/Makefile                       |  2 +-
 drivers/firmware/ti/Kconfig                     | 17 +++++++++++++++++
 drivers/firmware/ti/Makefile                    |  4 ++++
 drivers/firmware/{ => ti}/ti_sci.h              |  0
 drivers/firmware/{ti_sci.c => ti/ti_sci_core.c} |  0
 7 files changed, 24 insertions(+), 18 deletions(-)
 create mode 100644 drivers/firmware/ti/Kconfig
 create mode 100644 drivers/firmware/ti/Makefile
 rename drivers/firmware/{ => ti}/ti_sci.h (100%)
 rename drivers/firmware/{ti_sci.c => ti/ti_sci_core.c} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index e4ca41cdd8729..2ebc349551262 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27774,7 +27774,7 @@ F:	Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml
 F:	Documentation/devicetree/bindings/reset/ti,sci-reset.yaml
 F:	Documentation/devicetree/bindings/soc/ti/sci-pm-domain.yaml
 F:	drivers/clk/keystone/sci-clk.c
-F:	drivers/firmware/ti_sci*
+F:	drivers/firmware/ti/*
 F:	drivers/irqchip/irq-ti-sci-inta.c
 F:	drivers/irqchip/irq-ti-sci-intr.c
 F:	drivers/reset/reset-ti-sci.c
diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 43e2e2a645945..aa9e0396605e7 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -236,22 +236,6 @@ config TH1520_AON_PROTOCOL
 	  the kernel through the Always-On protocol, using hardware mailbox as a medium.
 	  Say yes if you need such capabilities.
 
-config TI_SCI_PROTOCOL
-	tristate "TI System Control Interface (TISCI) Message Protocol"
-	depends on TI_MESSAGE_MANAGER
-	default ARCH_K3
-	help
-	  TI System Control Interface (TISCI) Message Protocol is used to manage
-	  compute systems such as ARM, DSP etc with the system controller in
-	  complex System on Chip(SoC) such as those found on certain keystone
-	  generation SoC from TI.
-
-	  System controller provides various facilities including power
-	  management function support.
-
-	  This protocol library is used by client drivers to use the features
-	  provided by the system controller.
-
 config TRUSTED_FOUNDATIONS
 	bool "Trusted Foundations secure monitor support"
 	depends on ARM && CPU_V7
@@ -313,6 +297,7 @@ source "drivers/firmware/qcom/Kconfig"
 source "drivers/firmware/samsung/Kconfig"
 source "drivers/firmware/smccc/Kconfig"
 source "drivers/firmware/tegra/Kconfig"
+source "drivers/firmware/ti/Kconfig"
 source "drivers/firmware/xilinx/Kconfig"
 
 endmenu
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index 50b3383131522..d9e72ba2e4e01 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -21,7 +21,6 @@ obj-$(CONFIG_FW_ATTR_CLASS)	+= firmware_attributes_class.o
 obj-$(CONFIG_SYSFB)		+= sysfb.o
 obj-$(CONFIG_SYSFB_SIMPLEFB)	+= sysfb_simplefb.o
 obj-$(CONFIG_TH1520_AON_PROTOCOL) += thead,th1520-aon.o
-obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
 obj-$(CONFIG_TRUSTED_FOUNDATIONS) += trusted_foundations.o
 obj-$(CONFIG_TURRIS_MOX_RWTM)	+= turris-mox-rwtm.o
 
@@ -40,4 +39,5 @@ obj-y				+= qcom/
 obj-y				+= samsung/
 obj-y				+= smccc/
 obj-y				+= tegra/
+obj-y				+= ti/
 obj-y				+= xilinx/
diff --git a/drivers/firmware/ti/Kconfig b/drivers/firmware/ti/Kconfig
new file mode 100644
index 0000000000000..07d7968f9cc8f
--- /dev/null
+++ b/drivers/firmware/ti/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config TI_SCI_PROTOCOL
+	tristate "TI System Control Interface (TISCI) Message Protocol"
+	depends on TI_MESSAGE_MANAGER
+	default ARCH_K3
+	help
+	  TI System Control Interface (TISCI) Message Protocol is used to manage
+	  compute systems such as ARM, DSP etc with the system controller in
+	  complex System on Chip(SoC) such as those found on certain keystone
+	  generation SoC from TI.
+
+	  System controller provides various facilities including power
+	  management function support.
+
+	  This protocol library is used by client drivers to use the features
+	  provided by the system controller.
diff --git a/drivers/firmware/ti/Makefile b/drivers/firmware/ti/Makefile
new file mode 100644
index 0000000000000..ca54cd35eaef2
--- /dev/null
+++ b/drivers/firmware/ti/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+ti_sci-y			:= ti_sci_core.o
+obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
diff --git a/drivers/firmware/ti_sci.h b/drivers/firmware/ti/ti_sci.h
similarity index 100%
rename from drivers/firmware/ti_sci.h
rename to drivers/firmware/ti/ti_sci.h
diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti/ti_sci_core.c
similarity index 100%
rename from drivers/firmware/ti_sci.c
rename to drivers/firmware/ti/ti_sci_core.c
-- 
2.34.1

