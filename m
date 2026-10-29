Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793297563;
	b=0fQsqX5+zC6RBBTB4HBkD/X23JOZmK6eobqPViTI14OWt4YkxFB/8cM39GSLKwEwP0Qj
	 b1+oQVmnipLM9jNdtwtCSXt3UiI8NwjmEAQBWajc+Vy0hl3FTUBx/ozE1WP1pWnZ6lajP
	 WyMj6IxIhtNk8kmJme+4PLhqBFh8fklnKPoBqSURUCDq4ct5enuzkcdTDJay5ydc2R99Q
	 K2p3Q8RpxOwsOFJL0zL039HWCY7Qv6Ms/+wdWQ9ABZG04yf31W+dw6BOUvA05i0TQSFqc
	 IbbkCbhM0zMCKGwXZ7cxQlDF6cw81+PUTRNR45ncDKjPvYzl5G5X7kWorkg2I8PcvlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297563;
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1MygGL0443bwInL2cUpuASlULLcojKu9I8Tc/Nd0tdw=;
	b=jBINHWIPqP1HLi2n0wFaULAO3QoqRcD6gTfQKLVLk4ZdynrYDZizpAKWNTCyoK/F8shq
	 ophwYqt0VJ+BCy8fdzkCmw5Yuqs24h1zANF4beaNivxzEw88enPEoFX5Jatx5lIrnyHj+
	 BZXnk3+UWivDc6vfR7tnUWpXX7c+lLdKw+8DDSP2qpJKOutkifjOSjIinWoxGCzKyDwbu
	 Wr2CI/gsPp8f8duwiaSV1WN/TD/crlLXMDXs9TYBhX7ahq7frlYUNyU3V0NtZ1V6ALx7z
	 LW+BKSwlfzbJqEVhrLNEPlXhmPCqkF57FpLiF9mwTdcR95yzb7Re3E+VXljLcI0oqaA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=HrCwSdA+;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b="e2u/nJX8";
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B5E606A321
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:12:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86B5E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=HrCwSdA+;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=e2u/nJX8
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69TGDnkO3021589;
	Thu, 29 Oct 2026 13:12:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=1MygGL0443bwI
	nL2cUpuASlULLcojKu9I8Tc/Nd0tdw=; b=HrCwSdA+W+FWuy5BFhHHJtp7ko6Kt
	+DGRPlNj79vJoCGLRS8CZ+XJjcKLMVnZ10bMxkxKmnLER1AquR/kqdowrbNKpTTX
	Z3hdp4wyWRX1LL/Jkj435+5kkXLfOKtLB20WQsz6QSF52oV0/7GnwkeeHF9Fgmg/
	8isHTQjGIuck+mcX4kAjk0czJHlPR1FP0OyFBbfCpElfVU+X4dyedYllwBKQNnvL
	YSiu+KqQWm7EDnUWXIzgroNqSEPr5TSED0B1Cryn4VcczxKNlbrddr+NoGH+SeiJ
	e8Mh1HibXOhWu0HolC0cT+9SBTBBHoHLrJJNEmy28vFUoFYGpVWU4CNrw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012032.outbound.protection.outlook.com [40.93.195.32])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hkurv6k83-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Oct 2026 13:12:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aeUCzlQCBpTUZMynuKBXl+XvMAFZfCpIw+5nRZgV8vA+dKZ4zqNhOlx2POJU8aIrjaLOrIKClzyBWtGHaHllONRBwkZkBkSs1H2ZgtURh4oBAj47UrdPD5S1nO2Yv+F1nN7CxSrbpns0SXu2/Ly7k0XfHaEbTnoGTL3oRVz7XXOC3Vzf1moy1EEXMCbuCNFulVG6RdDQhZmKLEVZndblY8GbCfZxivK0ly26TVmrkLVcbdwgKcCtxhnMeTHAHiIaGcd4lVvWoWwfhhty8ZVoG2MFJIHg7dkc6QMfvkS3muIG6NLkWdUZ9sVDTZC1mmdf7L+NbIkL+Hkw6Ue7vlXPrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1MygGL0443bwInL2cUpuASlULLcojKu9I8Tc/Nd0tdw=;
 b=Lv0maxkjivL2IvSxtC94DYiWMGGDINThnMTxOby1uRvJyYDZjONcpyD6iT10IwXnzMHLGm9WzfQDSY9h0iMzrkWHkeiLvXQJLY+WNcao1wCJVEM+8GrJnMHxr7JhgMwHSTRYmjEcSMqfwOKIDW2rPIpDLOsMS/JhMSEyOvoF9yXSUjgLXL9EFglW/iwAFDgKdk0Cs7CvWSkLyryX4mvI26vHVhVForFnem+yvJV/UrGcpezenFzGHvR+78e6NuyAYrv1org8HduIJa5fMYmzDKD8ubQplbW6iuAs0CuA7HsOyh8XjthSblUfyQ3fSjzXijA5gJw0y0oaYmWjOLur8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MygGL0443bwInL2cUpuASlULLcojKu9I8Tc/Nd0tdw=;
 b=e2u/nJX8TmPn+taAjlC9taXDvEElCSy4XRmWLL6hNCRUCmYOEtbo9LqNbcCqI5sQGdcv973WVpaaQEeyklnEEPakCvHup4o5xjl5gWeRLyySuCNjnGmIvKHBpIX1xl18Rj6APggFWKCMYSOHmfx4MBka3fE9nDGG1QrINF/e9Lk=
Received: from PH8P220CA0050.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:2d9::24)
 by CY8PR10MB6540.namprd10.prod.outlook.com (2603:10b6:930:58::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 18:12:34 +0000
Received: from BY1PEPF00026957.namprd05.prod.outlook.com
 (2603:10b6:510:2d9:cafe::5d) by PH8P220CA0050.outlook.office365.com
 (2603:10b6:510:2d9::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Thu,
 29 Oct 2026 18:12:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BY1PEPF00026957.mail.protection.outlook.com (10.167.244.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 18:12:33 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:11:51 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:11:51 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 29 Oct 2026 13:11:51 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69TIBmM03408718;
	Thu, 29 Oct 2026 13:11:48 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v3 00/22] Cleanup and Refactor TI-SCI driver
Date: Thu, 29 Oct 2026 23:41:25 +0530
Message-ID: <20261029181147.266771-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BY1PEPF00026957:EE_|CY8PR10MB6540:EE_
X-MS-Office365-Filtering-Correlation-Id: 859e41c4-53ed-4c91-003a-08df35e83427
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|261028144727099003|261022105027099003|56012099006|261009223027099003|261021121427099003|261026140227099003|261022113327099003|261021123027099003|261026121527099003|10067099003|18002099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	1yldLPKNHGey1dv6qtzFU3Vu95vVWN792bsdB7K0dLqhaoghbpBAJwsBAuXXMURElvf8/cDc+XNzoN1koJP3wyodUvK0/d1dP1i4yIO7SUZmVqDEIn11Wx30xIL+vu4dRwr9MEEyUQHGMUhRX6HLAokj4B/Wom20aSLsJVzcfmMZp/p0g3DrJ9w+JED69J+qlAhMJah/QyNt1Zw8AgZQEoN8T1fGWk3kcscdL3zs7uALJLIy1I3IQT2MUnes/pESYw3hqc0j5F570yECPobNWGzvJ7EFHgbpYuGIm344rgzEyvAr2DVe5wyeAJo1WBda89hB9pb2/viJDW0Docv17n2n9iYWdDG41hSF5VlqlTOvD+oKzl/gpgawxE40gojK6ltVN6iBJPNUUq1TrfkfwcZWrLZ3v0umuWamozPkXiqDoGIDjZwEcxNjnUP5unirmAgPhxRsfptjkeggkqcSkeGU6aQnGSyVV2nc2qwkbWune3Xwph2jwuzhj1defHoZ8uRaxb+P7ByVHnrZ7vSgMCzD+croQwX1LgA6hazMKtZFLKg5wj2Z8MVWGpo4THh4yPuLz2DiOWwkSzLf/yhSU+07F8A/5KXgM5RIhiecQ7IpwA1DOx7VLPEWakrvWfu2AQ60Ig5E0DGv5ahLfU9T4EqcZ2fkI4HbQBUypaukUZk=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(261028144727099003)(261022105027099003)(56012099006)(261009223027099003)(261021121427099003)(261026140227099003)(261022113327099003)(261021123027099003)(261026121527099003)(10067099003)(18002099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	z6i2UKQH16RDA7M7fuANbDVKqpeULs5DeKNbTDoQKDw0Eri+NHtesO6AyCecaedhJe3aiKk79ywd6ZZB911+8ld3i65AItv+3TzzzJnwGiKADf3+p6h6VQI2oi7oD6DcQMtfEj76XRA1vAfVoK0MvRUbA9wVEXGsiMRQtVzHdbFfhtN4rNYKhcCQeuWguGXDx8m22seySrCpr3ykmjJMyvbwuBADXWDCrMBc0WmXDqBQD+XI/jEkrtk1RjkT9NG0gDz3sbk/Lim3zuDovMAgrX4o70QU041idG9Bn3FQRlNLaNXNpppk71Pi9mPl6PbvwQHia/3a9mepvDsIOklbEiBfUOMzcwVrh4XKY5vmezJE21bMC6F++swNKSaU4xcFE7A0U9vZbsrsm3J5MaeqQU297beSO19ysQ/UMUxsaN9Jzzm9vGMB/fEXW+x48mJm
X-Exchange-RoutingPolicyChecked:
	yxgPJpX09OZq8Oc0DYJq+FxcYHRvFAu+hC7KDSzIfKX+LmVzqMaDAs6P/n5wnmNUseaLTU/TlhM5Tx5rMoS5Ec6hFbhWGEfpTzLEsQrEpZze1Ry0DCCpTKAx0RIBYXW0pI3n5v5USFqW5PtHRfJJpotYc123F+KyXxkL3l2Q2Mh0xWa6Qu70QWvlanPHrwHyq3tm4KC66/nEYWHISszvuoUMY7tXB1TsZ/QvqFLVWC1JlfIT15X9TSrhrQ8BnAAITWDI1vBcBKrRWvVoElKkv2TT5GfZemanutug0LDBpsQbyeUGAwJ4E3+/2kx62ZCgtA5AxzAD6kVQWggu2QXAqA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 18:12:33.2298
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 859e41c4-53ed-4c91-003a-08df35e83427
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026957.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6540
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfX3zFBjw9MdPCs
 /EiwH2pcRLW2c7ijuR03YvVDPNYBM4ke30PQYYshR8TuvjZil57asnL6nAsI8+8SUUZ3L/452dE
 0PF8HH2FyXZsw5d/9QFb0FY5cOEGhysNeYxpACOc9EPr/4lEFVpIUFdlJ+RKzpZf7qczjYvhUHx
 gloBio1Ro4F9zt8AQabmQdE1ooen18TeYRx7mvo9W7sA1N+uZN7q7MfPiYT13TNEUZM0mDWC6SL
 eJVtT19lIWBLLMy1A3RmLtsvEg2rvVtM/y+Au55JSeFeBw1kXilbnh+fvFRKtCR7fx4SiOuQNcT
 oNb+U8kNJpc+M+ns+89TazGxl8+HVd6ZwjqBTWGfPArt5Fnhj0K8Wo8ilAXJwnstsO/005vNa96
 y07FJSLScTcj9EWedbwBMDUbG0r7zK8984GXEJYBiF1/J3Bfa+vLQZjTOTb4Ig43/BkLuUNH+1e
 5uW4eqEspKkmcYV1xsg==
X-Proofpoint-ORIG-GUID: x87u-SfxSbnPO3YIk-bxjPsKtHFPM5TP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfXwLlgfv5Fn5CZ
 gZtDznlvQci6VruUYgEA1qaeoyQ67QbFaqaoKgYnI5cmxc1vNdgZdrzUUU3ZQXzgqJvaDMkayfw
 2IhoDCJFYshLga5BItdIBaETnB0RRD8=
X-Proofpoint-GUID: x87u-SfxSbnPO3YIk-bxjPsKtHFPM5TP
X-Authority-Analysis: v=2.4 cv=epNKXYpX c=1 sm=1 tr=0 ts=6ae38c97 cx=c_pps
 a=SD1VBa2HPYRYF6UykHdizg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=NEAV23lmAAAA:8 a=90ffOSFFPvb03zTGe60A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290071

This series does a lot of cleanups and refactoring of the TI-SCI driver.

Patches 01-11:
The first part of the series refactors a lot of common code from each of
the TI-SCI message functions into a single place (get_one_xfer() and
do_xfer()). Result is removal of net ~740 lines (~20% of the whole
driver
size) without changing functionality.

Patches 12-15:
The second part of the series does some preparatory work for being able
to break down the single large TI-SCI file into smaller files.

Patches 16-22:
The third and final part of the series breaks down the single large
ti_sci.c file into smaller logical files: ti_sci core, device, clock,
pm, rm, and proc. This allows for better readability and maintenance.

Note:
All dependencies for this patch series have now been merged.

v3: Changelog:
1. Carry Kendall's R/B in [PATCH v3 15/22].
2. Correct API name in dev_err() string in [PATCH v3 20/22]. (Kendall)
3. Rename ti_sci.c to ti_sci_core.c earlier in the patch series in
   [PATCH v3 16/22]. (Andrew)

Link to v2:
https://lore.kernel.org/all/20260930160607.2674980-1-b-padhi@ti.com/

v2: Changelog:
1. Fix build for arm32 platforms like keystone by including appropriate
headers in ti_sci_rm.c in [PATCH v2 21/22]. 

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-1-b-padhi@ti.com/

Testing Done:
 - Boot tested on all TI K3 SoCs.
 - Boot tested on Keystone platforms like K2G-EVM, K2G-ICE, K2HK-EVM.
 - Tested some of the Core, Device, Clock, and Proc ops with remoteproc
 - Tested each patch for no new warnings or errors.

Logs:
https://gist.github.com/3V3RYONE/b8ef9d63eaa45db251dc84306b1451e0

Andrew Davis (18):
  firmware: ti_sci: Move error message handling into
    ti_sci_get_one_xfer()
  firmware: ti_sci: Move error message handling into ti_sci_do_xfer()
  firmware: ti_sci: Move check for ACK into ti_sci_do_xfer()
  firmware: ti_sci: Remove out of place RM debug messages
  firmware: ti_sci: Name response variable resp for consistency
  firmware: ti_sci: Handle xfer cleanup inside ti_sci_do_xfer()
  firmware: ti_sci: Pass request struct into ti_sci_do_xfer()
  firmware: ti_sci: Combine xfer allocation and transfer functions
  firmware: ti_sci: Fetch info struct from handle inside
    ti_sci_do_xfer()
  firmware: ti_sci: Use tx_message as message buffer directly
  firmware: ti_sci: Use rx_message as message receive buffer
  firmware: ti_sci: Do not export reboot control
  firmware: ti_sci: Move the huge ti_sci file into its own directory
  firmware: ti: ti_sci: Add missing includes for self-contained headers
  firmware: ti: ti_sci_device: Move device ops into its own file
  firmware: ti: ti_sci_clock: Move clock ops into its own file
  firmware: ti: ti_sci_pm: Move pm ops into its own file
  firmware: ti: ti_sci_rm: Move rm ops into its own file

Beleswar Padhi (4):
  firmware: ti_sci: Fix some kernel-doc references in structs
  soc: ti: ti_sci_protocol.h: Add missing documentation for structs
  firmware: ti_sci: Use pmops fxn pointers in suspend/resume hooks
  firmware: ti: ti_sci_proc: Move processor ops into its own file

 MAINTAINERS                            |    2 +-
 drivers/firmware/Kconfig               |   17 +-
 drivers/firmware/Makefile              |    2 +-
 drivers/firmware/ti/Kconfig            |   17 +
 drivers/firmware/ti/Makefile           |    9 +
 drivers/firmware/{ => ti}/ti_sci.h     |  258 +-
 drivers/firmware/ti/ti_sci_clock.c     |  553 +++
 drivers/firmware/ti/ti_sci_core.c      | 1320 ++++++++
 drivers/firmware/ti/ti_sci_device.c    |  388 +++
 drivers/firmware/ti/ti_sci_pm.c        |  145 +
 drivers/firmware/ti/ti_sci_proc.c      |  214 ++
 drivers/firmware/ti/ti_sci_rm.c        |  910 +++++
 drivers/firmware/ti_sci.c              | 4259 ------------------------
 include/linux/soc/ti/ti_sci_protocol.h |  389 ++-
 14 files changed, 4121 insertions(+), 4362 deletions(-)
 create mode 100644 drivers/firmware/ti/Kconfig
 create mode 100644 drivers/firmware/ti/Makefile
 rename drivers/firmware/{ => ti}/ti_sci.h (89%)
 create mode 100644 drivers/firmware/ti/ti_sci_clock.c
 create mode 100644 drivers/firmware/ti/ti_sci_core.c
 create mode 100644 drivers/firmware/ti/ti_sci_device.c
 create mode 100644 drivers/firmware/ti/ti_sci_pm.c
 create mode 100644 drivers/firmware/ti/ti_sci_proc.c
 create mode 100644 drivers/firmware/ti/ti_sci_rm.c
 delete mode 100644 drivers/firmware/ti_sci.c

-- 
2.34.1

