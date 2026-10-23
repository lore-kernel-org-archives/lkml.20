Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792766900;
	b=0tr8LWm3YEOWmrD2qH2VniM4ubuXK4FAyKAr8x6T//lB7Uh2nlY8EZnO0AjagasXthel
	 ViD/tKncYGLY4N+p0jOYoch4QqaLCiYQxGu7RKGM/GRA1J9eu4aZ5wf4O+LHge8NMbv5+
	 tbrzDPMEg2Y/VtyCP/WzHQvPG+1pns/+WXQriIRxePFVMqOmGG3zfZX8IiffR7HllC0ih
	 +WMdJeN3bLGcCYp31RmF4qREQSNISHp1wGNx2kZK/Edek9HMkwX9YewneDnUKbkt/JJwW
	 IEy+9pePb+1XDX0e2RGGHRXW9W9rSCTDo924hcO3xIsrs2Rv1+go0uYZZwTbgVNZJog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792766900;
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
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=58YpJQTO2oRp+O7/3t3U87MRlDdLTO5P1QmGw/uHFkI=;
	b=HOM6xONRKk+fvybKAjoY4DfKICF2cfHI3eI0NUd7gHWiFyZUi1jQcJw4OeYR1DtIy/0x
	 2Od1RBAnpswxeH4sDX1fznA7NBTccNTQkAkUwhpCl2GHwJkFF/8nPtAUXKk8oYDMWH3sT
	 stKh3uZVQgyyNenYbq/rGGwBest8YwI0o4xcXwPq+7y52MR97VB4Q7mJ31Q39qxcOx6Fp
	 Ut1pRAJxBeEExL3r3A/74q2uXwYg/p89MMaEqd/1cEaQpaBxFcDJm84mKCL94Yfhs4Ygz
	 xhxLQDiIUQmzl3waSXkjFVRVrM50F0VLaVdQg4EPgMcZUP5HZoIUedl+BimuTvngp0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=R7A6oHkM;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=RKhyD4bE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D83606A31D;
	Fri, 23 Oct 2026 14:48:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74D83606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=R7A6oHkM;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=RKhyD4bE
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69NE5d1C1740038;
	Fri, 23 Oct 2026 09:48:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=58YpJQTO2oRp+O7/3t3U87MRlDdLTO5P1QmGw/uHF
	kI=; b=R7A6oHkMKRp25XT9ks0FNudEO0uaWafcku2BxOXCZpaRIhkIU7dah2NkI
	NwcbgXJh3jaGhPnOBSEE5Vg6a5dMHDHuOkIOmsBPVHeh7ZM6x/EelqEKBG/Bu/gp
	G9OiuewJD+pgf/xlMb25ABfR4QBUJtlLa5x0aCBdeYvJ28pNiTHbENKPt5jKXhkV
	iRmEQbPD4qJTmgGK0PEfy8jh/VSeDH6juXaBkgXXyRYhp6jom1OsE3UZMSJhEkiY
	P+VW6L3SnAPrxkL7EYEfbK/5y3fYA6m0ePaZcw/2R0n+mk9w8gwLlx8dtPgzDHZE
	6lr7PP5NdGN9QsDKq1VQKkY//pg4Q==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012047.outbound.protection.outlook.com [40.107.200.47])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hfmg87487-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Oct 2026 09:48:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P5dhZQxyp8JbkmAQmgSgJyXPLesBZOeERqI0dyTLWpHJ35A3viy9D7LpVoH3pafx9autrSncyOSvmmuMvkLSl1CxfLqp1QFsbMU8jVMX+MpYgSzqdbNpKrorAgrhpLvck64ZdON+b9W++BjvP8+E2lkUxq5dGXSVOnpfbLxs9Cdz2ydQo1HDMKb0HAELhKeFhCT6yyq4z2k5bTcnDZoVUixHUF/BVWnevGynNoWRKcsaigXkkFcMG9vLAYmfPvZBjZnIFxUqRzqVOX0cHe5uFixks085eh1Jtt8pAJXrbA/FhzAN6AlLj7GvxLtF4p2K0HPsB0HtN/TKAVCYBOuIpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58YpJQTO2oRp+O7/3t3U87MRlDdLTO5P1QmGw/uHFkI=;
 b=L8MD8PPO4Br0TuedpSO26xEyv6rY5HMQp2jgH8ee4FaDM4dJa0IR206wKC1/97nryBAQoVe/qm8mM1fOIIr7SFNbw0/bKc77CiXwfQ1TsfRBc7e4KuvqOthFNVT3skE2zLd1hcfDxieWjjxwHlKYhG+w4nc2FcNj/JGrIsTh07kReeXmMPKEbcpSgy65u3xPW0KxlS9nLped11zmv1lMVb1tixjArcwdlCE4uGoibsXXWkesuLM1BdJUC+oVNOUyVaw7VtMz4NsAvD/cFzI+CDsCGSasKqEJZGtvg1g2OsmeH3CdCMwSadfbztPRbD6wqG3KBrE1uNoo7UhB38gKYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58YpJQTO2oRp+O7/3t3U87MRlDdLTO5P1QmGw/uHFkI=;
 b=RKhyD4bEOjUL9FhQIFFNFkU7Q8bKr5bnY+ibPafPTHZaJXooYs3FEOBl2ZET0mqp9ehiq6J5ilVQni6ZwpCOQdApVYxOhl1ONTbL/yQcC9lLbASAE5Myzebw9DW1SqzybRWcu4PHXXJbbgp22jkrNrhOVostr+6hSzC2IAj6y9Y=
Received: from CH0PR03CA0428.namprd03.prod.outlook.com (2603:10b6:610:10e::23)
 by SA2PR10MB4491.namprd10.prod.outlook.com (2603:10b6:806:f8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 14:47:12 +0000
Received: from MN1PEPF00079401.namprd05.prod.outlook.com
 (2603:10b6:610:10e:cafe::66) by CH0PR03CA0428.outlook.office365.com
 (2603:10b6:610:10e::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.19 via Frontend Transport; Fri,
 23 Oct 2026 14:47:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MN1PEPF00079401.mail.protection.outlook.com (10.167.249.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 14:47:10 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 23 Oct
 2026 09:46:21 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 23 Oct
 2026 09:46:21 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 23 Oct 2026 09:46:21 -0500
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.75.1])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69NEkKtO3571302;
	Fri, 23 Oct 2026 09:46:21 -0500
From: <b-brnich@ti.com>
To: <devarsht@ti.com>, <mchehab@kernel.org>, <hverkuil@kernel.org>,
        <nicolas.dufresne@collabora.com>, <benjamin.gaignard@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <b-brnich@ti.com>
Subject: [PATCH v6 4/4] media: imagination: e5010: Enable autosuspend for runtime PM
Date: Fri, 23 Oct 2026 09:46:18 -0500
Message-ID: <20261023144618.1652390-5-b-brnich@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023144618.1652390-1-b-brnich@ti.com>
References: <20261023144618.1652390-1-b-brnich@ti.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF00079401:EE_|SA2PR10MB4491:EE_
X-MS-Office365-Filtering-Correlation-Id: 37c175d1-ccf6-49f0-cef0-08df311484d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|56012099006|261021135927099003|261021123027099003|261021121427099003|261022115727099003|261022105027099003|261022075727099003|261009223327099003|261009221727099003|261009221227099003|261009220027099003|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	9GQDw1U3pyNuLE5TfrTJ9ClKrLlVi2XERBkUq+8p9TMQTOKPuyuoyx/iHOfPCWa4UV5pf+w+9/XKWyffmnrEGuDSrHJnsV8/iFxMgZ+oqbMHWyJhL81Qr/A5nzWYHd9n9vQDMmJaJ1KRr9Sb6xZf+0+zYTQwb7WM4c12PPn0SX0jyBKsJGkabkkcCxHZBdhD7U3MLCjyYd/XhnjNl5RqiviGzUBq8WmJSKoHo8XtO++v/ywXv1IlfzHrJ3AR7Q2uenH1+xTW91Jn8UBi2HX1UuOFT1yuAHL32qxBKYG7cIAGCVd4OFftQ6ZFyHe3iWBfybsnP9yO5vuiiMGEtY9m+GLOb72LJB3EAqHgqD4P1nMJpVWekxkS7A7Z2ehdipUUZDhWZHKMyAOMsCCZALYRwKlP9F8mPFwwI5VKJfr8hK+okZbaIEHb20SNrfjUQJMP6CKvNdBVXMUmewPiMpdy9mt+BWPFAnUfplD4KaJ1hWR+d3C6GHuYtpbAmq0R4FIvWA9pLsiUEwQu7ua6JOFKJKUHI2D+yaRkHAqDlJ/3T9ktePiUrDxzZZeHzF0oRHMUyboPptdk4bR+V9wubjQ6wAdAbUZ7IKWyHhVMLvJZcxfQZZat+3pdTQalK7TwmZ+hUqTqgF5HcJ0GVriHxGYC2j7CP6S87OCq5AoQSESVh9wnGy5JKCULsmosIqFohSOScgrLyV4bad3ycKy+JwmpBQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(56012099006)(261021135927099003)(261021123027099003)(261021121427099003)(261022115727099003)(261022105027099003)(261022075727099003)(261009223327099003)(261009221727099003)(261009221227099003)(261009220027099003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pJoduPRzevVpe60RtkXabDCh9eF1N+ZnwFYhatpzYrYzOcKAHHDLleX4WceB1jQipHmGxNcZIfxFeueYFl9Dwb44V7wZjNhSWz6Cm/rfAV80oUx5MLCKdI3cKYZbEAuwNlKCj/LapkjOowNvJV6CVdqtJGU/zSnhTGKrw97CCfQ2cul4wO1K/LeiWgkZ6CkWp0921wG2am3jpUL6B3hFL4Gmg3zV6L2G0if9T1FaMR07WzUR7skB+Ve6AvwLJUA+RRZ5KypC4fuuaRKaTuyD8FznY16cJMhRov7x56hQhDlPCwrJxTiEdGaes/VYegGR5Y9X94lX7j/zbrBghGY08xYvSByRZg33uHSG7kDXm/iNVl/F01R0mcFTSAjDB9EEdfPOlXYWEudsUh9CRwek24M2yxAFW7uYIU8aW1zCv/vSwh8aM0HMPeIhHEXDS7N6
X-Exchange-RoutingPolicyChecked:
	BpZ1zIkV+VxkasDFoIohxcOgj1t2Lb0HmcLR7awT44EF9j5UB4EDlVJW8AzbALTKQSSzGEOiAPWc1kIv+TStooR5D2y98pIZCnI3dMYOElbQAXKTXJQHemu60k0MkNC2wcqV5hnOf2UCK065xeNwimvvzTrHxXVxQYwRs30wLHwkoZPGv66pK7CNIPuF7pGKnt0zwsWKMhVWg7f5Efq9VsMsIJFyIXjxRIizXfrFMlhwkl4gJkKZl+uOAho0CiDiDqZdgFLWhc20TrbiRFqHGivK0Kg4ZWdFG+Y1W7PRjrJl6TGBwzUx7wl6Znknj6afHzfW0QGAcaPkIyV4LhY/1w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 14:47:10.6608
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c175d1-ccf6-49f0-cef0-08df311484d8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF00079401.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4491
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1NyBTYWx0ZWRfX9yJbhyXh36sw
 hz+HboXOYyF8E2/eTN8lOW/Q+6zCv8yDy5aT2DsxVI5noBFUiwLkr7Oqm4Rt+8HWrdtLVloMc7q
 8q3YLUARbJaCSrnMoPQGCsf2SzgmZu0=
X-Proofpoint-ORIG-GUID: tsLVN9g-XAs33k1h6kTsDAhCZRksPddn
X-Proofpoint-GUID: tsLVN9g-XAs33k1h6kTsDAhCZRksPddn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1NyBTYWx0ZWRfX9jdc5/YyjX59
 Q65PuL9ojaOEBk4nbn0jcM9onzXU1tV6aTYNL/dZw81CNMwxcL/XLSMXbCCSt207AW0TGuYWBnf
 bF5ynCNTLiARYeaBJQZ6SkdV8FRdvIgXuUVpPPXHv0vo+qWYMThRdGVEqUKtkF/pCMPkp3qLwwp
 MJLPbq4D2Du9svRHJakFcEvkpJ9TRNJvrkKaxeTCzM1zJ3lk8dxtpMXb6CyURuiGHLKD6R7V5PS
 x4gFFk6ckVahgzWQfmcvlCi7Xvh7g2V5Q0BqrEneVht0/Crgbv56OU0LjHQd1bO8EA/I6ziu5As
 L3Mg/tutg1afwXwgoHbTwZHW6e2ZWKXk8QpC5YbgzpJIUhG7VyxOZIJoSwxyamyoRMSULtly0Uf
 UjUtIaOOaKoZN8JTgoV6woy1Kl6VwBw1GNsi6cF/QgjB8YCihiVJc5EcRaBodgWYj6imwNtFpJr
 MsNLms+pGHj4zJZrcCQ==
X-Authority-Analysis: v=2.4 cv=H/1OUOYi c=1 sm=1 tr=0 ts=6adb73b0 cx=c_pps
 a=JPzmcyOoIuAgIyAaop9pOg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=-42tRimauhUyQ1eQmagA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230057

From: Brandon Brnich <b-brnich@ti.com>

Current implementation only has one call to turn the device on -
start_streaming. This can waste power of device as the device can be in
STREAM_ON state, but no buffers are actually being submitted.

Need to set last_context_run to NULL in resume hook. This will trigger
QP value updates during next call to device_run.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---
 .../platform/imagination/e5010-jpeg-enc.c     | 50 +++++++++----------
 .../platform/imagination/e5010-jpeg-enc.h     |  1 +
 2 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.c b/drivers/media/platform/imagination/e5010-jpeg-enc.c
index c25ab9627518e..228137243f749 100644
--- a/drivers/media/platform/imagination/e5010-jpeg-enc.c
+++ b/drivers/media/platform/imagination/e5010-jpeg-enc.c
@@ -976,6 +976,7 @@ static irqreturn_t e5010_irq(int irq, void *data)
 
 	v4l2_m2m_job_finish(e5010->m2m_dev, ctx->fh.m2m_ctx);
 	dprintk(e5010, 3, "ctx: 0x%p Finish job\n", ctx);
+	pm_runtime_put_autosuspend(e5010->dev);
 
 job_unlock:
 	spin_unlock(&e5010->hw_lock);
@@ -1099,6 +1100,8 @@ static int e5010_probe(struct platform_device *pdev)
 		goto fail_after_v4l2_m2m_init;
 	}
 
+	pm_runtime_set_autosuspend_delay(dev, JPEG_AUTOSUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(dev);
 	pm_runtime_enable(dev);
 
 	if (!pm_runtime_enabled(dev)) {
@@ -1107,6 +1110,11 @@ static int e5010_probe(struct platform_device *pdev)
 			dev_err_probe(dev, ret, "failed to enable clock\n");
 			goto fail_after_v4l2_m2m_init;
 		}
+		ret = e5010_init_device(e5010);
+		if (ret) {
+			dev_err_probe(dev, ret, "failed to init device\n");
+			goto fail_after_clock_enable;
+		}
 	}
 
 	ret = video_register_device(e5010->vdev, VFL_TYPE_VIDEO, 0);
@@ -1121,10 +1129,12 @@ static int e5010_probe(struct platform_device *pdev)
 	return 0;
 
 fail_after_clock_enable:
-	if (pm_runtime_enabled(dev))
+	if (pm_runtime_enabled(dev)) {
 		pm_runtime_disable(dev);
-	else
+		pm_runtime_dont_use_autosuspend(dev);
+	} else {
 		clk_disable_unprepare(e5010->clk);
+	}
 fail_after_v4l2_m2m_init:
 	v4l2_m2m_release(e5010->m2m_dev);
 fail_after_v4l2_register:
@@ -1139,6 +1149,7 @@ static void e5010_remove(struct platform_device *pdev)
 	struct e5010_dev *e5010 = platform_get_drvdata(pdev);
 
 	pm_runtime_disable(e5010->dev);
+	pm_runtime_dont_use_autosuspend(e5010->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		clk_disable_unprepare(e5010->clk);
 	video_unregister_device(e5010->vdev);
@@ -1304,31 +1315,13 @@ static int e5010_encoder_cmd(struct file *file, void *priv,
 static int e5010_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct e5010_context *ctx = vb2_get_drv_priv(q);
-	int ret;
 
 	struct e5010_q_data *queue = get_queue(ctx, q->type);
 
 	v4l2_m2m_update_start_streaming_state(ctx->fh.m2m_ctx, q);
 	queue->sequence = 0;
 
-	ret = pm_runtime_resume_and_get(ctx->e5010->dev);
-	if (ret < 0) {
-		v4l2_err(&ctx->e5010->v4l2_dev, "failed to power up jpeg\n");
-		goto fail;
-	}
-
-	ret = e5010_init_device(ctx->e5010);
-	if (ret) {
-		v4l2_err(&ctx->e5010->v4l2_dev, "failed to Enable e5010 device\n");
-		goto fail;
-	}
-
 	return 0;
-
-fail:
-	e5010_vb2_buffers_return(q, VB2_BUF_STATE_QUEUED);
-
-	return ret;
 }
 
 static void e5010_stop_streaming(struct vb2_queue *q)
@@ -1344,8 +1337,6 @@ static void e5010_stop_streaming(struct vb2_queue *q)
 	    v4l2_m2m_has_stopped(ctx->fh.m2m_ctx)) {
 		v4l2_event_queue_fh(&ctx->fh, &e5010_eos_event);
 	}
-
-	pm_runtime_put_sync(ctx->e5010->dev);
 }
 
 static void e5010_device_run(void *priv)
@@ -1358,7 +1349,6 @@ static void e5010_device_run(void *priv)
 	unsigned long flags;
 	int num_planes = ctx->out_queue.fmt->num_planes;
 
-	spin_lock_irqsave(&e5010->hw_lock, flags);
 	s_vb = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 	WARN_ON(!s_vb);
 	d_vb = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
@@ -1366,6 +1356,14 @@ static void e5010_device_run(void *priv)
 	if (!s_vb || !d_vb)
 		goto no_ready_buf_err;
 
+	ret = pm_runtime_resume_and_get(e5010->dev);
+	if (ret < 0) {
+		dev_err(e5010->dev, "Device failed to turn on\n");
+		goto no_ready_buf_err;
+	}
+
+	spin_lock_irqsave(&e5010->hw_lock, flags);
+
 	s_vb->sequence = ctx->out_queue.sequence++;
 	d_vb->sequence = ctx->cap_queue.sequence++;
 
@@ -1487,7 +1485,8 @@ static void e5010_device_run(void *priv)
 
 device_busy_err:
 	e5010_reset(e5010->dev, e5010->core_base, e5010->mmu_base);
-
+	spin_unlock_irqrestore(&e5010->hw_lock, flags);
+	pm_runtime_put_autosuspend(e5010->dev);
 no_ready_buf_err:
 	if (s_vb) {
 		v4l2_m2m_src_buf_remove_by_buf(ctx->fh.m2m_ctx, s_vb);
@@ -1501,7 +1500,6 @@ static void e5010_device_run(void *priv)
 		v4l2_m2m_buf_done(d_vb, VB2_BUF_STATE_ERROR);
 	}
 	v4l2_m2m_job_finish(e5010->m2m_dev, ctx->fh.m2m_ctx);
-	spin_unlock_irqrestore(&e5010->hw_lock, flags);
 }
 
 #ifdef CONFIG_PM
@@ -1523,6 +1521,8 @@ static int e5010_runtime_resume(struct device *dev)
 		return ret;
 	}
 
+	e5010->last_context_run = NULL;
+
 	return 0;
 }
 
diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.h b/drivers/media/platform/imagination/e5010-jpeg-enc.h
index da57bc1baa464..807821ded127e 100644
--- a/drivers/media/platform/imagination/e5010-jpeg-enc.h
+++ b/drivers/media/platform/imagination/e5010-jpeg-enc.h
@@ -23,6 +23,7 @@
 #define DEFAULT_HEIGHT			480
 #define E5010_MODULE_NAME		"e5010"
 #define JPEG_MAX_BYTES_PER_PIXEL	2
+#define JPEG_AUTOSUSPEND_DELAY_MS	100
 
 /* JPEG marker definitions */
 #define START_OF_IMAGE			0xFFD8
-- 
2.43.0

