Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793637738;
	b=L7Z9FX1YHlhrmY6LtptgPWoh2LjZ3Oh9+Hv//oZshCY2Zc4flnR68nodgJHIC0r2x9CZ
	 gc9YGvlIFMSuj9by27d171ayxwrtVcxzwm8xANINNCTR+zv+H2utJn9XgxPLxS7dWgZRv
	 2TwR0I9eoELkoM9we1/rVr/6Cl9MDsOoGmAoynV4vAShFxkB/PXiEbLI0WAQkz+YtXj8Y
	 J2I/IcSeKRsS6iLj/17n1L5qYeEVHCveShz/UC+/rKvk+fM/saGet1Tcai2kt5anzBeC7
	 PlWbXnYbDxj+lYegYTtlm7JTFb5Ed0lRfSfmMspa3ZpIAKhNgHCbunwMFq8c7AMjdwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793637738;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Reason;
	bh=eFpRF+TkoIkvncpFyaYZ1I6sLtr/JIUJLtLj4Mshwjc=;
	b=QvVuJBy/qJr6DObFvcFGZHWWK/rg2/8NyGx9vibTEUtRZlpD8oYDXVO3jHJot8aWJoBt
	 +niPf/OvZgTUFYmZlQEW6Hm9o0C7PZq2gIVLahqoKjvsKNPX3p0ZxLRfKu1uAGyRV968K
	 8oEiobd4zlubFI4jV4+sUlzMK5McT6yqgmZTbf+zlJmb8KZ6ALAQSwXjaC15Lmr58W2d9
	 giCKTeMCmGS5VjC73PPK5di1nPqvCroCyHlOf9n4MYOXUqa/kvu+DeZfL/nk+nHHtX5g2
	 8NC4v1NpyXV36wDOMT8jw58T82DHy8UXmjIWXPqx4s0hkdtkCXJWyYngoFMqWJ2L7qw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=PW3TMkTo;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=y20CjUxo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B14660A1DAA;
	Mon,  2 Nov 2026 16:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B14660A1DAA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=PW3TMkTo;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=y20CjUxo
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DPAAD2776585;
	Mon, 2 Nov 2026 10:42:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=eFpRF+TkoIkvncpFyaYZ1I6sLtr/JIUJLtLj4Mshwjc=; b=
	PW3TMkToRtLbD56budsalz/aKl80lsH/PeWNZ/AH9k/in6XFnDm8CYOfkKtYNsQu
	HLcrSvQMn0prjSBCnI3Z78yUjoo4hUhTQtesR3tW6eJltzfFSoLtgCu9++HQnOqK
	qlKLwt9inMCeteZJ/fN0SP8m46iogjE7T8eVQ8pCHBx+Neywp3KpSbGqU3YaMImq
	wCTRuupoHDciL3pOefgY5JhXXe95kAqgBIpZ0GpZlsOZVQjpLhfn9/ueIy5go9hk
	+vs3FU6W4TTUAwRYa46IJw3Ri9w78vKspXAxSZsjYTN5+0vXMwXjRY/3NmDKtu/R
	iYzGXMWepbLC3bi1wSfYjw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021104.outbound.protection.outlook.com [52.101.52.104])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hncrft98k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Nov 2026 10:42:06 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GRYzjZSNUPUnULowzQhik8a9CawH+u4f7w8pvEewQb8HAvWb42tRTz845cIZskvYl/YIKuXohiQiMXu9wnugZD6WF1ea2tdAPMagbj/8NvWb1oMByuZ8LhrsxRlgWo01P7AS4QoHLCELrVeuZGNklayX8k9xgn9eaf2QirHU0Mkd8e8CyB0ksxcT45RsRFPEqRwmMkC6DvC/Z/M18OM9NIX1wMG0JEh5FNJ6NkChKN+DbfzcB1I1Q2HQ+24fUS+KUzLkEtTy32MqeRq/22qPTq7L9IirdeAafbQwnCzN9+ggXi9NxW/vf4moRa6kLdL7EuIts3zp+zfO2dDThnO58Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFpRF+TkoIkvncpFyaYZ1I6sLtr/JIUJLtLj4Mshwjc=;
 b=tFDP1i/Unt5tOI+XeSIzrRZoNZbI0pd7JgWCjB122WHejMK4EjpsKhVg5jO3Ej3hwtQCdJzhb2nMJdalqjb9Vjw4Ou4M7xLJLUjfmJ2ks+kTuyXSGRvGa6sBHgl4qxuU4ccytseI/o/Hy2Ny51IdKk2nh+nW8jPdtsCM7rK1eS9uzIJw6CWKOCU3lWcrhF/NdCjb269ZWPoHjT2mr4k88A7q7WpAi/19ATunBaPEasZCsI23h89vmPB2O/Woxsz+OuCvbyxiAuPYFgK+1Y2PX3iXNhCM7f+5arTE1EoKlOJ7wYT/sqFiQSc3nVbbWAjV9NGYr8bkZMvECSQT2xcIdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFpRF+TkoIkvncpFyaYZ1I6sLtr/JIUJLtLj4Mshwjc=;
 b=y20CjUxocAWhby8ON4a/oQWwx+AOtaG0Lu2ow3ek0styTg7E4bYd1akC67mxc34zaT+8VPKSwAznC+/XovTkwv4FmkwZsLP2qhgLs6icAmhAGq4mKX5stln4qpr/gcl0IVR3XJP44VYC7Zx73u9/RQL10yrmmBfdc+MGOhJRfmE=
Received: from DS1PR07CA0001.namprd07.prod.outlook.com (2603:10b6:8:456::18)
 by CH8PR19MB961360.namprd19.prod.outlook.com (2603:10b6:610:31a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 16:42:02 +0000
Received: from CH3PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:8:456:cafe::97) by DS1PR07CA0001.outlook.office365.com
 (2603:10b6:8:456::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 16:42:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF0000000B.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Mon, 2 Nov 2026 16:42:02 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3902F40654E;
	Mon,  2 Nov 2026 16:42:01 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 20BAD820273;
	Mon,  2 Nov 2026 16:42:01 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: lee@kernel.org, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2 RESEND 1/2] soundwire: Add a helper function to indicate a device will detach
Date: Mon,  2 Nov 2026 16:41:56 +0000
Message-ID: <20261102164157.4010002-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102164157.4010002-1-ckeepax@opensource.cirrus.com>
References: <20261102164157.4010002-1-ckeepax@opensource.cirrus.com>
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000B:EE_|CH8PR19MB961360:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e1bcfafa-7a53-4dcd-bbca-08df390038d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|23010399003|376014|36860700016|82310400026|261102123227099003|11063799006|56012099006|261021123027099003|261009223027099003|261028144727099003|261022105027099003|261026121527099003|261021135927099003|261021121427099003|261022113327099003|261022075727099003|261026140227099003|10067099003|16102099003|22082099003|18002099003|6133799003|261102124527099003;
X-Microsoft-Antispam-Message-Info:
	cBuet0S00fdGtID+sauj5Wll879uPOEdcm3X4pmVN1DrxPCD5x1HbK+iMC/rs+/L6Bu7fko35oaY3Xn9JNLGOPfsdsWN1nef0x6DNjhQW5YNsFFI8vawdTCNHNvYgzhylo6ZVNUQlkfkKpMLUwWZBxuVHhME8UurfvP5BlqLzMvQt13s4wj6kBTSE9KMnUCtSgbCf2X9QQaU2dHynVIywgwFkmyfXr8KeVBL+8UHLu2U5X9BP/ElBr2gbNuB7WEj3ofE4xNWwMxCj2qdzt5Ktvt/G7sztmNRf1GjEiPhIbuEwQ3Pm6ltZf0n+wvjr8jPjKoEwLsnx5fC0r9HPMmoCxbJcQWpOgdCy4w42j2U+t25ZckfNwEwu9gN7BsMnwK8ksgmGUJ5I5zj3HfCNa5Og0kON5+QRJQwkQFGJRkZxtyHj0CbgOzkLmm9MX/H5P6o8vmRM8YvPRZXLswMvSp/FhHB8bviAatgTT58B7KIkciXQjhsmheG94pNTgRCApRD00Xx1YYoBL2YM1FuRyTAB3bTp88bAYyssFk0xfGP3c/tqTtqjPn7eEH8UyHSae8quj7yCpD+s1CQXeJ+54R9CPbPiwJZctY2ELKn7Q/rYdHnNSuGR8c9dHcY5OASIyWFdq0zmvBNr7Tq+qWN1aXUglK80XsEzvuUnX2ybUDZH0MO9deKIjhBEDk8UAa+KH+VlRdUg1W6vSuiDp7SyQSC0g==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(23010399003)(376014)(36860700016)(82310400026)(261102123227099003)(11063799006)(56012099006)(261021123027099003)(261009223027099003)(261028144727099003)(261022105027099003)(261026121527099003)(261021135927099003)(261021121427099003)(261022113327099003)(261022075727099003)(261026140227099003)(10067099003)(16102099003)(22082099003)(18002099003)(6133799003)(261102124527099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	scwKUcj0DKTiVvZOurDetm2YvEmErOPmZJ2fgkeFZfeb12Ev6rDjizhK6VNtYL+GmhWr6is6NkMFPloNJBOLfGoJMqQEkKUYTHdBJXhy/pZBKhtnG/ucr7N/+lOTeKXnmvjzu4gyjSJwwGg/bpqd2Mfcw8rNnzyfkAxbh+DJrTZmN0kKmGU2OnZ1bI3b3T2lapBmKaFV5W4XcIvRwFmjFS9v11gXY1JMQUQFa1NWqHr8qHyjDP63BB57+aqVtlYVw9NykSsKMwQAIOel987qxBhXgtF3NXdRL25UYzW0FUM8p/OT0CcgTz0ykmRyFDVAFsbLZG5dUWG+qsDu34fNrqtiS9d56bmN7YeIvvJNIRWGiyPwuGVwtOv1FMxcNdTuu9l0g1WWrNDw4W2Vo5qJQWUJlS45S7Rdxck3BTaGjTL9CHqjmBolqLBJ9GVGPR1+
X-Exchange-RoutingPolicyChecked:
	AX3Vdn/JjgcKBqGvlaM6CMG4lTgznKXhbzvDOw4C+wViWAPs++A1KGHLUSQAs9LVwDVnwxOVt10ukEE3nnuV+RZWjsrrpX5nT1rw439nEVrq5T3uygQ6N1DaDz69H30tP4kHgA14QoSctZxQLdyOM/njh/smkdB1+C8AJVPCnN2yD+boqpIBYnzaQFiEEWjAIdn0SlXpMwFYJdamspo0azvn+BtE6DvsTToZ1fk2vajWDIzrcEZ5Bx18lM6JGzCllZy0mp5R6+8pRgWrvlauSjNn9RvbY8ppYOZpQRfDOE52j2D7j9bRy57YQbLBjvX07OC6QBXqFLC4Ylz4mpAMpA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 16:42:02.3985
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1bcfafa-7a53-4dcd-bbca-08df390038d7
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR19MB961360
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2NiBTYWx0ZWRfXx2xJofLugDHP
 EYChYFfJXmn6It6QbZxB9vMEshgDW0dAL7Nniv6tjgrOwp4pnKO7M0O7qsk2eikwCvqn5s4pmTw
 uxWMD6tD4DUb/yJKf22orwpDf1AwB9YpC8izUdPBafR058RK4VMes3Rp3LSWx6VMZtVrJ3hz78K
 4u00HPqtQg+g6rrihEp6IrbJdo2rSG+jX8zksTdNJsllOOWY2yBjBtWkScwxdAzKl8q4x2kgBiG
 kqE7AimjB6SYxZZhPYOHF9SSEDXDO4OOe/cBHg+ur0LDKiDgWR0/EAlu0XTYwt3L/zdJZr7DcG2
 A/TO3LrzMm8+RC6dmJ5FCYTqXc3whfysj53+f2imiARdZvI3z4Ho+uwFH9fV+whFdd7ZC3JtzbA
 +NXUOmt11f0WQGlThhjHEVFGHP/c0eoSgZrncKa7sE+Jjfo0hHMWvzTz8yLnzq2Jqn6ZJkzdfOt
 6e1rtMC9p3TMMm9BykQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2NiBTYWx0ZWRfXx4ZjwSWkcAXZ
 ZkDKkd63b1dFmPTQ2FjolCWYrWjYPrZdZc0htiGgvh5FaEj2ayuw1gyIZu34WsWz4l19M/tw+qc
 T9wsDNVXaJCkA4ZNRtZbXfvYL5Pyo4M=
X-Authority-Analysis: v=2.4 cv=LtgHWXdc c=1 sm=1 tr=0 ts=6ae8bd5e cx=c_pps
 a=l/exgBlJIAx+5Sipbyuv7Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=8GfHkCRbLTLxf0Ih6UUA:9
X-Proofpoint-GUID: jTyHdwSb0Rx26vpsK7Mu3a9bwGX939eU
X-Proofpoint-ORIG-GUID: jTyHdwSb0Rx26vpsK7Mu3a9bwGX939eU
X-Proofpoint-Spam-Reason: safe

SoundWire devices will sometimes need to reset themselves,
typical times might include when taking over the device to ensure
a consistent state or after downloading a firmware update to boot
into the new version. Often such a reset will also result in the
device detaching from the SoundWire bus, in this case the driver
has to be careful. Naively calling sdw_slave_wait_for_init()
after doing the reset could immediately succeed if the bus hasn't
seen the detach yet, causing the driver to proceed attempting
to communicate with the device whilst it is detached.

Add a helper function that a driver can call to indicate it is
about to initiate an action that will cause the device to detach
from the bus. This will reinit the completions in the peripheral
for device attach, ensuring that the next sdw_slave_wait_for_init()
will not complete before the detach has been seen by the core.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Acked-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/soundwire/bus.h       |  6 ------
 include/linux/soundwire/sdw.h | 26 ++++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index 44e4f51939176..59b6aee0ea6eb 100644
--- a/drivers/soundwire/bus.h
+++ b/drivers/soundwire/bus.h
@@ -231,12 +231,6 @@ static inline void sdw_fill_port_params(struct sdw_port_params *params,
 int sdw_bread_no_pm_unlocked(struct sdw_bus *bus, u16 dev_num, u32 addr);
 int sdw_bwrite_no_pm_unlocked(struct sdw_bus *bus, u16 dev_num, u32 addr, u8 value);
 
-/*
- * At the moment we only track Master-initiated hw_reset.
- * Additional fields can be added as needed
- */
-#define SDW_UNATTACH_REQUEST_MASTER_RESET	BIT(0)
-
 void sdw_clear_slave_status(struct sdw_bus *bus, u32 request);
 int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size);
 void sdw_compute_slave_ports(struct sdw_master_runtime *m_rt,
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index f710e5932b4b2..4937d1a2f24f7 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -25,6 +25,13 @@ struct device_node;
 struct sdw_bus;
 struct sdw_slave;
 
+/*
+ * At the moment we only track Master-initiated/Slave-initiated hw_reset.
+ * Additional fields can be added as needed
+ */
+#define SDW_UNATTACH_REQUEST_MASTER_RESET	BIT(0)
+#define SDW_UNATTACH_REQUEST_SLAVE_RESET	BIT(1)
+
 /* SDW spec defines and enums, as defined by MIPI 1.1. Spec */
 
 /* SDW Broadcast Device Number */
@@ -1218,6 +1225,25 @@ static inline int sdw_update_no_pm(struct sdw_slave *slave, u32 addr, u8 mask, u
 
 #endif /* CONFIG_SOUNDWIRE */
 
+/**
+ * sdw_slave_signal_unattach - Signal that the peripheral is about to detach
+ * @slave: Pointer to the SoundWire peripheral.
+ *
+ * Inform the core that the peripheral is about to detach from the bus, this
+ * is usually due to some implementation defined reset mechanism. After this
+ * sdw_slave_wait_for_init() should be called to wait for the device to
+ * return.
+ */
+static inline void sdw_slave_signal_unattach(struct sdw_slave *slave)
+{
+	if (!slave)
+		return;
+
+	slave->unattach_request = SDW_UNATTACH_REQUEST_SLAVE_RESET;
+	reinit_completion(&slave->enumeration_complete);
+	reinit_completion(&slave->initialization_complete);
+}
+
 /**
  * sdw_slave_wait_for_init - Wait for device initialisation
  * @slave: Pointer to the SoundWire peripheral.
-- 
2.47.3

