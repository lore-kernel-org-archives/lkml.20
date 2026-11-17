Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794910086;
	b=XfsX1vlLh80LCEVydXffPWFk/9CLS/wBosPG6N4tLgJq9prxQi11hOlAnZx4253eNbNM
	 7kQ+soEWZIDWxEe9eEfSVhz1xFQXZU6WjP0g1Du0nKYCBPn1oncQwGvHcmUWCHPkXQAEI
	 1MTD/VgAeLCTagCo4PUdaumy6w3lYw3UsudkgYQcczeNRZd8E9SKElOSANO7u+UfwPl2I
	 Eg6Wbifn3/aqQEgBnT9jf0Fb7s06BFy8zDpQzkUudM53GBxI9LmTddNmBiYKPzic2OKYM
	 5Ls7Rz3MxukgNlXul9Z+AhALQv9+fNhiQSLNvFVZ0q3eRAvPOIaLqcF45dPpkDtVrvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910086;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Reason;
	bh=apvm1pDkUeUtMUQil1j90bPXu3JANfsRCd3iXre/rgc=;
	b=ZSa7NKM1F+S5NrEtrefppPPKt0cFQx8IUNEbns98FoYCpeY62iyfCHjbWeL0FrgPRTwB
	 Z7NL/Lgc7hRYHvTikJ2x1uGFkuPBiMGtcKDHExrlqnmt+gfJ2ny5AUGSaDXWb9F+lQ5GN
	 MdlmKLRpbz/momCZ2egzI7LMTIiLlbhCb+MjP3AVMqrrMbZNeNdzvhv3RBSPRDSKKDtPk
	 L/0bE6B1bqUCl6xLsQXcrQfPbCoH0gJMydXPa+wGMK6JEOLWbLSnYixT9h2mvZxOESnML
	 +XdH2zmPrSXJICqL28DrBwIPss583+MJpVn3eLsHQqvMUgRMPD48aALVBSF97XFsVXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=EIV4b0qJ;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=tYkCp1o+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901D7606A31C;
	Tue, 17 Nov 2026 10:08:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 901D7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=EIV4b0qJ;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=tYkCp1o+
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH9LdvY3855370;
	Tue, 17 Nov 2026 04:07:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=apvm1pDkUeUtMUQil1
	j90bPXu3JANfsRCd3iXre/rgc=; b=EIV4b0qJJbTNAa7JgComJ2Hui0MC6hV6Um
	COGIStbJP6X2evWRGQUc6P8nzfUrogJdlJ/gZOtf7jt4mMS9HxXVgLACf+0XDPfl
	nR8swkkk7Pg6sK65qho/tOoE03O6uLMqfrt5VUpt9M0tad//0fDO1ScOWOtllJOG
	oyFSgMD4j6KA0UhaguDHCTXXjMIctR42CPS4jYmU8lKlabTeJwtjNZucbSQTLq9G
	FzJMDVVZOLoZOSAiFO20l4n/ZKXVXBhr9M0QY8Ls5IvJYejCoRb9rIBRF+QpXhkO
	eKjgvSBsjJ39t4Y2jNAdmiUfI7yECQmc4DiVYbAgHkZRVZqm65Qg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022105.outbound.protection.outlook.com [40.107.209.105])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4j0kr503fb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 04:07:45 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nJqnxrjXUbM1Ejiem9j/rOewENojOEL+02Xno7VUVoUO0eOiwgYpuZnyICdlnLtfBHB2CapaKZUT9kn+XA8efA3PwBbZHZhsVPznKLs65Kr9HNe6KbnBIjiLyJKcDfeSDrZTDz3Ad0kkPLj86Tzi5LEUeuzyvtw1Dts5Gs5e9i/k3O4FrVw9tldwwGAERBHEeD0ikHrMrq+ytCQ9Iok5Q3+auZw7ZzssTbofNHSP5Y1HswELNnJykwa9J+Aho3DM/Y+mGD8xNb+9YWclWUFQG+/oLNIXYNlbW/0FHS+yPNu5plB8O9HtDkpOotprhQO9Fww2gbMW15b9TgDXq+/E4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=apvm1pDkUeUtMUQil1j90bPXu3JANfsRCd3iXre/rgc=;
 b=ZCvElxUfZfm39pxIj9yUnr45s4JcKUsig4LxYzEiZN/hB8F/pQDMttRxw3qjcdgWlGnDuo2iGlXhSAOQNzt8qOWPPiR1zlEWfh3/OL1OpEqtyGPR9s70SQ+2xnaSko9SRsAG5ZvNVWwzYKIyAAqbK9UNgrn+iR5JN4G/eT3HCPbChdqCy1HVt9Li+Dy0bA/ecORWnCQ9kgYWArhxtsO3D72h7T4flsFrhOoQSEZ0p72x3gCHEJO9K7FL696262RmPwMy62B2uXSRkeUS8zmlfhjNyDVZmDrzKFC3FP76POb40tDyWb1bRhoPIWjRZ4CVVKZrLA8N0j0DSzon7VuBhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=apvm1pDkUeUtMUQil1j90bPXu3JANfsRCd3iXre/rgc=;
 b=tYkCp1o+n26tzBr4wtKcmcW+G+SSANH2wyF7qnkDcjgJ6iwLolJlLFmuu6F3juodwZHRJ8cM9+2yTyJCzMgv2NviEZrrHbbQ/+ZPBL27efsy9W5RWkX5ueghj3yCBWM8SLCG3POC4C+SroBst0pJzXHiSrB+45wcQQ7XqLWst54=
Received: from BL1P223CA0033.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:5b6::8)
 by SJ4PPFB04496E67.namprd19.prod.outlook.com (2603:10b6:a0f:fc02::a44) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 10:07:42 +0000
Received: from BN3PEPF0000B371.namprd21.prod.outlook.com
 (2603:10b6:208:5b6:cafe::9) by BL1P223CA0033.outlook.office365.com
 (2603:10b6:208:5b6::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Tue,
 17 Nov 2026 10:07:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B371.mail.protection.outlook.com (10.167.243.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.0
 via Frontend Transport; Tue, 17 Nov 2026 10:07:41 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E96D3406543;
	Tue, 17 Nov 2026 10:07:39 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E79DE82025A;
	Tue, 17 Nov 2026 10:07:39 +0000 (UTC)
Date: Tue, 17 Nov 2026 10:07:38 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Chen Yuxi <chenyuxi19@huawei.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, patches@opensource.cirrus.com,
        sebastian.krzyszkowiak@puri.sm, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, yeweihua4@huawei.com, pulehui@huawei.com
Subject: Re: [PATCH] ASoC: wm8962: Fix broken headset button caused by wrong
 guard constant
Message-ID: <avwnarkAYaaaSIQJ@opensource.cirrus.com>
References: <20261117070516.3861828-1-chenyuxi19@huawei.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117070516.3861828-1-chenyuxi19@huawei.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B371:EE_|SJ4PPFB04496E67:EE_
X-MS-Office365-Filtering-Correlation-Id: ccbc8739-ea91-4df3-5b7d-08df44929de1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700016|23010399003|82310400026|10067099003|5023799004|56012099006|11063799006|261026140227099003|261028144727099003|261021121427099003|261022105027099003|261026121527099003|261102123227099003|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	hNkxZV6pHu4eIp8N3mlXYedtr6LkU8WM3yDEmM56X9hGK3iQfxGBR3v4UB/y592zRtv6HY/HkEcUIYgcMVpCLDbYUmgu5T4lv+8qhNyCdenq1iLzaurIn1KGn1V30pBiPEcTXJVukGVTknNduNM1W5Scl/JOt4dWicYyO3SV0QmP84JThxjM9bj7w8S7v7+SmvtcNEI6mUTW5zJT2bWD6vptXRPtZE8s99PVW9PKLqqpR6BwV35wDGS+C+/yvR7MGijwIRJJU7ibyTwwHP0VgN/0BOMBad1BFStqejPT9kQ9HkZMmfLXjTnf6ZxWncHOfMmX4X7hbrNRtWYfrwNCandzatmcTPwKvqvVjTlngqkGkfxYn83IivDzz7fogoWPjoupWRG0Gn4c5lKbOIefwA25UPgsKYUKVntK9wvujIlVKgHEa2QfCRz+e/MFhIgPqVmWclKGBqIT+/Z35TyMZLs7h+P6nxg6a1X1s3qLDSRsDbkaMrfLgZW1XebuphA4T3SN5k5bMPtMhrzWHrM2alzNcfYjRgvy6ePX6fLEoYfxbzs52c0+SayQWz0ho7tF7HnsoeDMsfSaN3dmXf+9TbRxj5L7uj8zQVUuI4DfjjXiSfruT7h5UqyKsuOxuo9mdBiSAnPeXgGzKpBrv73nFBaKtLf7/oJ7MisXuVZvvWVussxDNrYl9M3utuOkLutEwBsKNT8uE4vFKkdTPrOXUQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700016)(23010399003)(82310400026)(10067099003)(5023799004)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261026121527099003)(261102123227099003)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BhPqPHXe4tz9TVH15MIMu2QFE2gN9icCNyL0lG0bFQKy4wPgpSgl+0UwjM99n5hA8aVYuUmwiB+jUv/YlaHflexpMyCmNPj3lzBNzceB8FN/iTlos8tUd5U9T9BaOFA0XJW5aZa7kwHeqF/twWNi06apdjs68suEO+XE+Yn7PgUoiqa1EE+35i7kPEEC86Lqa4jYmaY22kkI86nEXhQ4PcXBDTg1l8RZ50I8uU3LCZXnVbzfPWld6aWLZhRDxCKMmpkEFtjxLNxvT/ijiWNMfXKrwq9wo8Loeuwe6d7EMdcwlLx9bdgI8o2w4ZBO1phErFXSJ05CGH1m5XlWWdBZg8ZtTvMWLyy/Kq4xeT43UY8vbkdiQjxkJL9h2VREy4lPOLRENfvRdr6tl6bNdS9NPU9mOGINsPfD00jJlsNROaDmEp3KaeHh/xzQgxqHw3MH
X-Exchange-RoutingPolicyChecked:
	w8zPRurMtBKn4MJewE033fBj2nE54tR6zgphn9yNb761WBlvxxhA9roZVM+PqVnPcoDRX0JZXpqjpxjnYpMbkX6of/D+p9b3hxhZvvFdsoawSs+6lQApwyAkotiTKMNMDt6RCpvQ54yxs4IQBSVKulGF/4FXPsX2b/XjyEUiiMC+ps7OR8q5BidqCzUEY0wvsKxFdfxnkOdoYTaJzs4XTa7KH94QDkNSXKAVGs3ddWtSSqfTXraKtUtTWEQ/v/UY38ouzXBVSHameDkyFZRqbRzx9g38YbjOgxPxFcqoTDSgMOcdxjqK7GcAUET1+mJ/iozKJ6Pc2JgrM0SwQWW8wA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 10:07:41.2468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccbc8739-ea91-4df3-5b7d-08df44929de1
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B371.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPFB04496E67
X-Proofpoint-GUID: pkNRrOYwmRCRkjeA4vmWARKFyzK8s7sI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzOSBTYWx0ZWRfXyytcpzl3Sf8l
 K0K3ssQG4A2Xovh8rKB332NcoNeaXF1Eq5xX0lKKEAXsxU19D0t36QAdMJ0WQNmlz3/dIWjKQwd
 y/zphTC3VvZ5x51451NQiqJ1DErrOXM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzOSBTYWx0ZWRfX4TO5mdwrIIpp
 0OG/j0c5c3lEE84IViClP/jls6FRCeHZus9O4sLRwaDawMHSNFtXRivg+dkCH0ihSzkqCG4oZmE
 7te6UsoDAhCeeQnnNrMXBeJf/FU3JPzRkdGUeGI8piMXMQzn89qeL82e5AeLnZyTxZV8celo7qG
 icrGzhqR/DfFPP9aKP3lxwfMirz5InPZr4oaat09JZW8sn9jnYfWJ8o/nyjeLTUgY/Hz0qjFEvh
 mWpu+qva/1DWdmidLjpiymSX4ZhSjzlRiyLEsq5UAkbQtqaCQ02aUYYWF/bJxcunE9F4Byu2C3i
 DvM3kUCtyo+kuTfSMT57PFD/syo0BXTJHfWNvFacyFujJwLXndlL+ImrwZWXFGPWbZVrRD07HXH
 Cn/vuYelRljJ826c4A9ABeYWi/3MourSfw/hFD2XoHwtymlSEt6L3pjwcRcmb4OLXRi9h2hRS1k
 Wi3EDtV8udY0uWf66QQ==
X-Proofpoint-ORIG-GUID: pkNRrOYwmRCRkjeA4vmWARKFyzK8s7sI
X-Authority-Analysis: v=2.4 cv=aOllOr9m c=1 sm=1 tr=0 ts=6afc2771 cx=c_pps
 a=5fNYnt3/gC+uMcP5UkWVcQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=i0EeH86SAAAA:8 a=w1d2syhTAAAA:8 a=ny06a6cgeH8OaXsHD8kA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Tue, Nov 17, 2026 at 07:05:16AM +0000, Chen Yuxi wrote:
> Commit e59075211902 ("ASoC: wm8962: Don't report a microphone if
> it's shorted to ground on plug") guards the mic short report by
> testing wm8962->mic_status against WM8962_MICDET_STS.  But mic_status
> stores the reported jack status, composed of SND_JACK_MICROPHONE and
> SND_JACK_BTN_0, which never has WM8962_MICDET_STS set.  The guard is
> therefore always true, so every mic short event reports nothing.
> 
> Pressing the button on a TRRS headset shorts the mic pin to ground,
> which used to be reported as SND_JACK_BTN_0.  After that commit the
> button press is silently dropped, breaking the headset button on all
> wm8962 boards using the mic detect path.
> 
> Test mic_status against SND_JACK_MICROPHONE instead, restoring the
> intended behaviour: suppress the report only when no microphone was
> previously detected, i.e. a TRS plug in a TRRS socket.
> 
> Fixes: e59075211902 ("ASoC: wm8962: Don't report a microphone if it's shorted to ground on plug")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chen Yuxi <chenyuxi19@huawei.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
