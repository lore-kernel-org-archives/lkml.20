Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794827713;
	b=WL+DXPFr7sMNfgqesJSIdAY+iSnDD3Bxsl6yseHQuo7zB/OzMrl62KgNBhAcQAooZeXk
	 ujpnZassxLEVLZyC2X51MwZQwGLXOWg7Osyq+B+Y3aOv4MYOH1UieILFIHmIM3M20nl6Z
	 FXi3EY9Yteq932SkjvspFHKDQo9r0Foy6FlwmCJMqtSRQZfGgw2TePLJiQZSb/t5XjDr0
	 eyy7xxcP6OHwGdWSBvSkWly96VzKhT1nY1A2pWiJsJY2jMpzFofhokUfP2Z/hL7O6oIcA
	 FxpwzYugrlAbeQMHt61lBJYio4oUMwqSczqzz1KproohLF64YzL+2y8ym8UJi6Qfzgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827713;
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
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Reason;
	bh=yYbBUokWd52NxCNbwZtuZlKfoMHIfBEL+Ocvpk03C8k=;
	b=s1EEDuP173PG1V2DUOWyHIZ2h5CfazrcubZVZTbNCfeov0Zm91iVTKyrPgXeeRzuwCFr
	 b7/MpF6zj3KeC+yOYlqvSQUTDOWV9+frQkQ6PspNn3Qac48tyDT0O/H2yySOZ0kHDQzQ7
	 jZfOGrOwmAszcHcHXNSL/W391QSAbmLF/9YVRTfKazTC843yQVZCv4rb7eegtFtpleHbn
	 Kq2uvgeRDOhKAcoOFrNwAc0blBOBNVoeXJjAjWw23QX7YUFgk7IeYDWHKUSfsmrmWyg16
	 Ltjr6pl/fl0mqePI4sQLG5nYHfCi3vBGd7/yAbdmO0SrflhV75BFlR0zri1UqwWJdZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=FPWnLuNB;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=CVVE5d5o;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BC0606BD3C;
	Mon, 16 Nov 2026 11:15:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3BC0606BD3C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=FPWnLuNB;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=CVVE5d5o
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGAblu81643381;
	Mon, 16 Nov 2026 05:15:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=yYbBUokWd52NxCNbwZtuZlKfoMHIfBEL+Ocvpk03C8k=; b=
	FPWnLuNBkKimwbl55mSNHf0P7XUa4g1Ee7LcONUbN5sthoo1cZv1NHQo1RIj/cMM
	9hR/PPoVOc7o0e8ijnEW0QUFGv9034RnVu/fL8IJOHfuhGFNiIFrEyPDpxzTkxyg
	GEjgeGvYu03QNqPTELlz1z/xOP9W12/PwmahEldobGJAStew5xRG0rmEJDglDWr/
	imyy430sAuBVXJ8tzsCn7sDxYFfOl54nHPgRGyA1bWVvMj0U0KLY+GrHTT8Kdn8I
	MPx6c/1g8l/7ntT0G6s9hceYNK1natUUm8/E7b7+i/LY7Ij8jvukoxELSZPY9jKS
	fkZIfHFDFsswvSNUDiVqQA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021097.outbound.protection.outlook.com [40.93.194.97])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hxnxej018-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Nov 2026 05:15:01 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QSbCukjegdFCI5gslyIdZ2GOJ4mGwqyYZfR+b2bgipSQHWlkMFj5WXtwUtw6E0uSaPHS85HNWK9Ta/u51CGo928O8AG3STy2VpIvNvhgrvpEcYwgONt/w9Qv0pLylQhY9AhBQbXvIdrYQY4XG+O365zS07V0mkHxzXOklaDmk3t9ykSEQPRWHFoMXk/Xw++OhbXJEBx7v40TTe2s33SNcDXvfTqwuorLCdlRT7j7tOMZFFb6E+bg1iYQYmr9Lb2YqC+SNztcEr7irfMC4E4bLdf8CQIbgUW45Olz2YHxs3FZhaWNz08hrdamVtkSOahIru+46P0xq4ivU7Q7MZRjgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yYbBUokWd52NxCNbwZtuZlKfoMHIfBEL+Ocvpk03C8k=;
 b=pDE0+gQz3cHWS0jDBqx/tqX6c2xSxMeJSRBSuZjkj9q4xYbBJKP7MjFwgcRonLb5+w2k43bbzfHAoQ/IztXNzM10o8MLQcphuQ5XOLShAdbKI+jC8eWBGo4E8pDO1KHRmEhELUnvxb25lAIc8BsoJ+E8sQI7dmnWrh4Naz7QnPEy4T/4gTftRaiHbPvUDhuiemtuDdRwC/pgc6LECU9FN+TLh2+2ryomGWBiqz/fHqSwST9eMnAT1Gd7h/s/a8zvmZAUHHRBx8bF4l4W9uRyZB9tz/ZEimpilamEfw/vHNzKZ1JWrw0g1qPmoHMXxs3UU9qwrR/oEJrK0RUQAgHshA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yYbBUokWd52NxCNbwZtuZlKfoMHIfBEL+Ocvpk03C8k=;
 b=CVVE5d5o44JNgkjrMSyIZ3LUluVGNlOt7zXsyHYzcRcd12TIDj5nrYCGeyqxyWTLt4qNP1SlZ6nPjnxlqATSPbuyyYD/Jz2yx3c5rkXDICGpq6WBbKUEt15aSqTI6XhTTfVV7GDkgOAAmrSsLsNkAQayWDi4mwPEDiweZdSH2AE=
Received: from SJ0PR05CA0118.namprd05.prod.outlook.com (2603:10b6:a03:334::33)
 by SJ0PR19MB4543.namprd19.prod.outlook.com (2603:10b6:a03:284::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 11:09:18 +0000
Received: from SJ1PEPF0000231C.namprd03.prod.outlook.com
 (2603:10b6:a03:334:cafe::3b) by SJ0PR05CA0118.outlook.office365.com
 (2603:10b6:a03:334::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Mon, 16
 Nov 2026 11:09:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF0000231C.mail.protection.outlook.com (10.167.242.233) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Mon, 16 Nov 2026 11:09:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C52D640654B;
	Mon, 16 Nov 2026 11:09:16 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A2D68822563;
	Mon, 16 Nov 2026 11:09:16 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: lee@kernel.org, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v3 2/2] mfd: cs42l43: Move to core detach helper
Date: Mon, 16 Nov 2026 11:09:13 +0000
Message-ID: <20261116110913.3555209-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116110913.3555209-1-ckeepax@opensource.cirrus.com>
References: <20261116110913.3555209-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231C:EE_|SJ0PR19MB4543:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cc194b7b-c9f4-4d1f-10e0-08df43d20f09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|61400799027|23010399003|82310400026|36860700016|376014|10067099003|56012099006|11063799006|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261021123027099003|261022105027099003|261102123227099003|261009223027099003|18002099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
 iKliuR76TBYBMTyvIUttB6LtxFtLAV4MimuDIsyG3tjf2NVrq/cLn15qizDHMFsdmPIaD+D+jpL/iFy/upTPkI4QR6pRvzrMLeZ2aulYyvyBq0iNeRUa/zm0ug9P2BcfXBl7zAaOl7Dkerl53Ebq+7kNtyazKSq1fQAwIrwc+eww3axEnI3+UiiIdbD+nNg8B7V6q3aPV8rcR6w6tmcYENCdQFJY/56HRFU7QFdLeqxRMnLpiKTswgsnhBajnOWhit4T8GhFj+LqxvZw54OWb2Ama4x1+a3BgFPM8RUris7HhWqTIMB8vVtxrlLpzkHKxf1u9ZgoozK6amuX6sQJ9w2RI5AVGHO/ERBb9s+D/g15rbH3upNRUYFNSLVoStsjjGxeiV5TEQ4Z/07aHqMmickDRrw1/Ehmvp/CMR98BZtIsOJWu23o0ooP1r7vQPd8/ibHHhaO7ObyxCOJfhOCAiockrVQLFrj0oXxXojI0tT7LFtWOE5wkHeTdrvrgykWcjN4jOBs+KLhtCyej0YVgz7vvt2QWBM7K3b/J89/D0UqnjMGGiX13v5/2PTEmyeMBMbz8av/0J9tOnKl1+JjdXdlK39KkYAkdb4WLmfWwKnRU4vkHOnmGaDOJZBfbYvlSvOZVfiNKQE+LsK2MDPa4dc1RI8U5DU0pgTJ8KD3u/uTmQpeUYiABayKJEvQS5LTO3aoXcN0eIzcXdERTm0TzQ==
X-Forefront-Antispam-Report:
 CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(23010399003)(82310400026)(36860700016)(376014)(10067099003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 tTIgIBs6u5pIpjOmF4tmDn+vOppotcYY6DoL+mHlbr5y5/MdXRqnCTpTrN1ywif15ax5eIjBXqfVtfS1JlLHoEj0kavEVzJU3YBsU9LQxSyu4aBQ2Cf6olQ1cvWrZwLeW92cy9BqIzAq7XeJzbs/5rsje4vSKLmgFafDFFHWdNd9hjBN8lv3LoAQB26o2+iMUVSTn1R9kdFxfHCuGYozPleDaDCwYXvfrVIWTbFACIZwYPpxxRvt9ohWY9DW7ij2ECBW8EswWlpGUdDOGTBTzk0CwloQPiewxOm/9mpYi43dSnFZiFr+L8tXY+RaIB9q3lwJyK7LhPHSnj83CeeWqu8QCJvduxnEtX5XJn/OIiHZS/Zm0NFDSfK4Cl7Oxk8JRvsW2FyEwi92dU0tTBLJk7TUxl8WkHUgFt36wlPe+60Wfawsa/azMRt2k761vPsO
X-Exchange-RoutingPolicyChecked:
 qt0GkodGku85wmBf1a6A5pV4Q6GvgR2tLBwQg3kQCe++8DHxSX5cLWFqGvjNcRukSJ3nZR/9+51P383e88m5Ua9OHaylqrlArtRe56LqlsYjGHUFhyCg7gY1yON5e2ElH+fKovMxI7/jKVT7ZVXZ47QvmmGrvWYlrFVJwAm5Knmkc/VYJr8yc0hN9dvNjI0plBfDekmONH4MV6nzHzoAy4OK4qMjZly9uzqtW5srFeOdarfi4n/uOP6Eow64MRem6OYDepmlULoVGNiDBVroirm740Ieiz8HmLvoZVdBPuMa8atpVwqbu4QQtr6U5H5co876yv2oNXNJdZvTkNNLuA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 11:09:18.1179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc194b7b-c9f4-4d1f-10e0-08df43d20f09
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF0000231C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB4543
X-Authority-Analysis: v=2.4 cv=KNbPn1Fo c=1 sm=1 tr=0 ts=6afae5b5 cx=c_pps
 a=9OPjPng9tO6d8HsITUYRUQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=a19m-bV138SPV-5EhrcA:9
X-Proofpoint-ORIG-GUID: whoDK5ctzVwjSRlPJzdBhIuKmgA45b91
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0NCBTYWx0ZWRfX7T7x+42q4qu4
 6GSNfu04+03qcWh9NPZKKCwSHg1NYf4jwN90NdUdzw6Ej9uqInX5jdzEk70hQlX4mlXnGZ/nrHJ
 lv93KtDIRXAuXtAWq3JQHV9pCHWNumMQFTFtcr+21TnFjV1lcsHfMftztmbAdBxclZlc0c02tQ7
 XuGbAZvfkOgxvjV4JFinzkmHuZ0tIpFQEuVi6jJPYuJTNXAJVWOgdaFk/PL4CMEFpdatvHi9wuF
 jS9MvOpFHvw3wLRMcdb5ODvb7A1CQzWu5YBGae/Q6xYEltDRPigyBszIkixBydFQrYY87gBmY1k
 1GZBiY0N7kFG1iHexoQ249+NzFRcBLWBfeFGFW+Out3p3quP8Tn6KyCZafhbFQi2XZtxs4nCLC9
 nJtcAMqEc8UApc9cq/fv66L9/3mhanGabi0jicvFUg9LvSxzeGLCC8TiruszXScjlaU209c0cUr
 5fHfki0PrtTO22AkepQ==
X-Proofpoint-GUID: whoDK5ctzVwjSRlPJzdBhIuKmgA45b91
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0NCBTYWx0ZWRfX4GuAD35NmsNO
 0eUUYxtA0LadeaVHlvj6LbP9NkHpyI5rho2kgPtkUuJSF6DGedkDWTqopc5UZZKUJ7XTyKucwsa
 1GxI+odbhddKPlTGbVG7Z6aCPKbKqwY=
X-Proofpoint-Spam-Reason: safe

Now the core has a helper to signal a device will detach from
the SoundWire bus, there is no need for the cs42l43 driver code
to separately track that. Switch to using the new core helper.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v2:
 - Updated comment on cs42l43_soft_reset()

 drivers/mfd/cs42l43-sdw.c   |  2 --
 drivers/mfd/cs42l43.c       | 21 ++++-----------------
 include/linux/mfd/cs42l43.h |  1 -
 3 files changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/mfd/cs42l43-sdw.c b/drivers/mfd/cs42l43-sdw.c
index 22e4c1fe92984..7e4a23aa22556 100644
--- a/drivers/mfd/cs42l43-sdw.c
+++ b/drivers/mfd/cs42l43-sdw.c
@@ -102,8 +102,6 @@ static int cs42l43_sdw_update_status(struct sdw_slave *sdw, enum sdw_slave_statu
 		break;
 	case SDW_SLAVE_UNATTACHED:
 		dev_dbg(cs42l43->dev, "Device detach\n");
-
-		complete(&cs42l43->device_detach);
 		break;
 	default:
 		break;
diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
index a83b62064dae6..a7bedde09e395 100644
--- a/drivers/mfd/cs42l43.c
+++ b/drivers/mfd/cs42l43.c
@@ -30,7 +30,6 @@
 #define CS42L43_RESET_DELAY_MS			20
 
 #define CS42L43_SDW_ATTACH_TIMEOUT_MS		5000
-#define CS42L43_SDW_DETACH_TIMEOUT_MS		100
 
 #define CS42L43_MCU_BOOT_STAGE1			1
 #define CS42L43_MCU_BOOT_STAGE2			2
@@ -545,9 +544,9 @@ static const struct mfd_cell cs42l43_devs[] = {
 };
 
 /*
- * If the device is connected over Soundwire, as well as soft resetting the
- * device, this function will also way for the device to detach from the bus
- * before returning.
+ * If the device is connected over SoundWire, as well as soft resetting the
+ * device, this function will inform the SoundWire core the device is about
+ * to detach from the bus.
  */
 static int cs42l43_soft_reset(struct cs42l43 *cs42l43)
 {
@@ -555,7 +554,7 @@ static int cs42l43_soft_reset(struct cs42l43 *cs42l43)
 		{ CS42L43_SFT_RESET, CS42L43_SFT_RESET_VAL },
 	};
 
-	reinit_completion(&cs42l43->device_detach);
+	sdw_slave_signal_unattach(cs42l43->sdw);
 
 	/*
 	 * Apply cache only because the soft reset will cause the device to
@@ -566,17 +565,6 @@ static int cs42l43_soft_reset(struct cs42l43 *cs42l43)
 
 	msleep(CS42L43_RESET_DELAY_MS);
 
-	if (cs42l43->sdw) {
-		unsigned long timeout = msecs_to_jiffies(CS42L43_SDW_DETACH_TIMEOUT_MS);
-		unsigned long time;
-
-		time = wait_for_completion_timeout(&cs42l43->device_detach, timeout);
-		if (!time) {
-			dev_err(cs42l43->dev, "Timed out waiting for device detach\n");
-			return -ETIMEDOUT;
-		}
-	}
-
 	return -EAGAIN;
 }
 
@@ -1125,7 +1113,6 @@ int cs42l43_dev_probe(struct cs42l43 *cs42l43)
 	dev_set_drvdata(cs42l43->dev, cs42l43);
 
 	mutex_init(&cs42l43->pll_lock);
-	init_completion(&cs42l43->device_detach);
 	init_completion(&cs42l43->firmware_download);
 	INIT_WORK(&cs42l43->boot_work, cs42l43_boot_work);
 
diff --git a/include/linux/mfd/cs42l43.h b/include/linux/mfd/cs42l43.h
index 8e993fb535e68..798dc55149662 100644
--- a/include/linux/mfd/cs42l43.h
+++ b/include/linux/mfd/cs42l43.h
@@ -86,7 +86,6 @@ struct cs42l43 {
 	struct regmap_irq_chip_data *irq_data;
 
 	struct work_struct boot_work;
-	struct completion device_detach;
 	struct completion firmware_download;
 	int firmware_error;
 
-- 
2.47.3

