Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794245941;
	b=w64tG/rFqwrqPKk2sTFkJNePgmQuHHRz8lnvII7k7iKqB6voCHKLW/GsHtC/WuxZTK1o
	 Sn/l7e/vP71AV28O+lmEKiXVXz+WMI2oyV+q84+WnovPMLz8yXIUidIacPYz42uLZuHJo
	 QPd09z92cxBBJh1Mtbv8SVKLEeETzqQrByO9Z7XkizogUfsUcKZrxmdywKQg7CraOM1yJ
	 VPALCowhgbMx2ilerWypGfbJhE3Ry22ZhJeKJZ7vwWmmDRYHcgkGZQ9d6KDfv8npj26R2
	 accHtuACGiFhsAWNHl38tg0Zxv+fwuJ6hjfEnUegVMH/gsu+ffvkYoDxupNXGytydZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794245941;
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
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Reason;
	bh=Q0hS0oMid1yUOVwmCwHIPoXmKbz9YqaPR4uwEPQ1W+M=;
	b=jROqhc8gffMHFHF97JC5zlE6cvzrEno6QR7TC+9SCaMZ6w4Iuno59WhoRiZDt7HiOb7N
	 62tMbVuc4FZASqqCVUY9nBmV449xcJR4gCOTSQncV53FHcWLLq/kUylsQEeAM+hkAtSNC
	 Uz6EBWDcpv8ykDbccRoWBYhhobFAjdwnNNBCH2GJpmMtX86VZIHr8+XuLjJLbYYNvKw/T
	 BxkMyKRhBHhUjwhRtN51QbvnyaTIp8QqaB1b7K2WyKoqVxIbUOtt1ZHDoGm3cdIl58ZBP
	 Kmg37cEiuWEWn5NajHxS/IDl/VtOR+u0yvRr6YY4EsXg3U5/Z6ctAbuMQp7aZU4DK5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=hRMZRO2U;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=J0BrXYUc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC0F606EE89;
	Mon,  9 Nov 2026 17:39:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DC0F606EE89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=hRMZRO2U;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=J0BrXYUc
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9GCTGm2703959;
	Mon, 9 Nov 2026 11:38:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Q0hS0oMid1yUOVwmCwHIPoXmKbz9YqaPR4uwEPQ1W+M=; b=
	hRMZRO2UehVkpVJqg/bv69njq3R76eesH/gW392tNuUhBrlpYJnZ1HsaJU7Fx72e
	KDr1+tBYIDrkgFXJvpv9fFxe1myTgHyuzuJZT0JXp91Dxu65q/pfN3XZa7lP6GeA
	puUalXawUczBckvTDES5rbO4gMQoKBgyMePrAOJXfAH0IvCnq0GFUPsyfZmZ6j3f
	Q5MKZfyvENO2ORokeIiZsfdK6YLFljrAUaWvlifewcQIuPIT5mOj7t8QaYxwja8L
	+Dg7k8y30wMxR2unFpAy1FK3unvLxYaGQ4MMFPLm+6J1E7c2uxlaQpyJgcos+FCg
	4T+cQ/GVTgd0/G0Td3hzvQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023139.outbound.protection.outlook.com [40.93.196.139])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ht29had81-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Nov 2026 11:38:55 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gbHre2h0sc6KTHDCEpeO6kklQedMuuDP6O8Eyr7n7x2GPUbjqTXBa5TWowG3UtzmszhWUDKp6X6764WRfKWXa0StBlAV2kQhZJaXjeZOT3y06I7tcCV27wGp2J2K21r7kyyM4M+T16ZZ9M2CUj7+mboM/RxoSIs5cjHDhkFvo3Iu3N19GLuo4Cv8ma0LgmPPs+uiqX6SnlzrCsTE6WQsRI1CH0JwWR4IT1PcYc/SgEkoPU4dAUwp4a/baP/MQiqiNTUsvqjXwVUbE65j2mRrJZwtq+yGPIMXd8AyoM1G3XkhhKFTjm3QvO/mUDmlkWIphJWikpT1IMmKCMHTNG2R7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q0hS0oMid1yUOVwmCwHIPoXmKbz9YqaPR4uwEPQ1W+M=;
 b=i6Glq/PCK1Ze9yx7spSVFqQb7xUQ3EEnOLjZP0Fy+J/5Y5E1J110fkC1j2LcndGWcCj3Ti5uekROyyBSYw9CKT+ha9rdrMKZanUk0/L2GW8v5i2oW4umZG4DWgDIyo1PrrbMLziuXHdRv1JLIVbGAEGevBFexdZaEXzLYymVtohJse+ASKvzKfs62uflh2IBISwRN4nGwcDqKeiZ3ySvDo7wZ1LmckMRrhavtuF2AhGPpbF4gM0sTQxKs9e6ushyPeOgx8BiE44CHzG4RtBqhbueY3wzYt4WEI8zsqO0iyfTTBg/MicdHGbBY9KHhPTo3/AKUM20aUPbjozQrrEVkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q0hS0oMid1yUOVwmCwHIPoXmKbz9YqaPR4uwEPQ1W+M=;
 b=J0BrXYUcTL8LFncVpuDeVny/QuNjLD0sYkvXz/ozGDp2Mg/f3Ijak3dzS82iPh66KVv7TTN3WBUGop1nmzFk1S5fbCWlQnCaCxGetqF33Cq1Mme1iSrvjmq13DE7JcUB/SqufnfTG6nqrupsV9LwrHDdTfQeS2ipZCArvgZfdu8=
Received: from MN2PR20CA0046.namprd20.prod.outlook.com (2603:10b6:208:235::15)
 by PH0PR19MB4905.namprd19.prod.outlook.com (2603:10b6:510:7b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 17:38:48 +0000
Received: from BN7PEPF00000094.namprd03.prod.outlook.com
 (2603:10b6:208:235:cafe::54) by MN2PR20CA0046.outlook.office365.com
 (2603:10b6:208:235::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Mon, 9
 Nov 2026 17:38:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN7PEPF00000094.mail.protection.outlook.com (10.167.245.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Mon, 9 Nov 2026 17:38:47 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1335F40654F;
	Mon,  9 Nov 2026 17:38:47 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id EDC14822540;
	Mon,  9 Nov 2026 17:38:46 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 1/2] soundwire: Improve channel min/max comments
Date: Mon,  9 Nov 2026 17:38:42 +0000
Message-ID: <20261109173843.4184154-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109173843.4184154-1-ckeepax@opensource.cirrus.com>
References: <20261109173843.4184154-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF00000094:EE_|PH0PR19MB4905:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 40f42518-f754-42ba-194f-08df3e884f9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|61400799027|82310400026|36860700016|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261102123227099003|10067099003|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	pwfZUVeok7RDMxUdqbWy22XzHP1Wb5gD345z1A2K42GONd6ixAIP9lBgmZp0pQi+j3SqeNZQcqL2lWuAnQh/3OiOSXexzT2EkbBtSHsq6sY2SG6fxQPYZeWUtwJtPatb6ujTOvRRq1AumTKivY3CwnIMLbld8mqRG1/1nM5moNWM4yyyIbGEknHdAoeLWQM9NFawl9FbsiGFB5ZTJ2Mf9qEZjg33SnCPxJM7PoiMY3Zhjz40bu4zcqhVKTLf9JOlV1lRBCfYajtBKvtLSXzBV8B8GQvKFmWFpi+SHGtGpljRLIaqO+NZe2ONI8bLFFUE56P7gZ8vuQ2rzRAUsz02mcqf5A2V4lX0zPHfY3app8WxNJzzLR4iftYJTDcERMWUeJpl7ZkSCDqqN+HkM5mut8McLtHlhA9foM/rgKw5pudXO9GERjF4J8s08DrYQKrX1pT4xLJ8fNQdRrvDKAZoYrQnUAS8Sw15ZB0R0tLgb9ycD+FcroApBsKq2zshamw4EoE+4176E7go4MjEd+514J+/X7UNjKjw4YKSI3Cj9FGTcYoLKq6gTRDmXbTGY6nvS+OTcNRMv8m9xfnG6O//DJpwmCPtJrtbYb9NaC0FwLm8YKzzgtnvGmFLws07JAaoe5OxAhOPpP0GOo5gwUpHl0i7aBjPA1YPj8wXPpCGcSZFxwXb2e4iQqf/0IGCos4M3XsntIY3RsPGNgroKE/srQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(61400799027)(82310400026)(36860700016)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(10067099003)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eQHJzU+6tT5x8LvhzOOSXAu0rn8hCHekXtUyQl1qQxxWJsvBsCw1g4Cm43t8udSfMTrIfEcewYiztrspduONA/nxVqrNFGvvkUKf0fM1gdz5B+6PQlCmo60l8Af6Gz0LbViAgkTpCwp4JEeben/97x7b6xnGgy+DxZnCUO0KIFBvWdZEpCkoBaKiOlLEbTqhNBeShqEwj0XI3rn9Rn2WfJuA/CKOzHAioaRvW2Bexwqfh3Hl30XiXfpfmnQMTZJ2E6l6ZvWkZ7OcIkM60oDWhS6Ss4Y29VCFPJHsBDZ12VlJdJ3UaRj0+a9qMO625ub0QsZrz3y3lZMTWehJ5Gt+2VrhDaBRBOCPW4SGwoWP6Y3XzaIVUm14nJ8hBdhwcPr8/hApvVAOMZfWJSmDW1asyts2Wrpi1K3PX0guF9tDJPovLoVFkqeRi5YeuuIOBuyQ
X-Exchange-RoutingPolicyChecked:
	gKcemn7H0MaEVEM1fhV3SxYxNLzy9wAqeHjVjSvLqzW1FipwNc3OCauAvTWwZjnhSAu2kTypmgzADBiAF0gd+2KIwj2wgdT+fBudhdAJT8oGDPKlgKmlvtyNIsM2bYS16Fq3QZ8J6UBtz6TrRbHAgRI5Mil27B4BM7J3Y0DXC0UIHhkgJFoYcxfrAN9W39ngv/mEwZU6+TSzImalqnKvLd/dZx4dXHHWC+o7AlCRKp/iTRyw0jJx2dbnInWMF/L2fDCDTtOtMer24l/DATY2gXlhBvWu/Hdh0P/1UREKqjItTrKFh9lsnor4N6T09LRnUrUB3MuIVwTfreCvvQDE/A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 17:38:47.9804
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40f42518-f754-42ba-194f-08df3e884f9c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN7PEPF00000094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB4905
X-Authority-Analysis: v=2.4 cv=PO2aavqC c=1 sm=1 tr=0 ts=6af2052f cx=c_pps
 a=Bf9D2RbFEixf9qU3mYXllg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=SIj0_KyXEq0NIwT9P_sA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA3MCBTYWx0ZWRfX6Gr9+K2iLd8K
 pqmPfiyRr4/n0iIy48Mt+WNphifSjxFfr+GXB0w0x8viOKQn6N84FqBTueBKG//nzGyPczEdhWi
 7Np5FBBG7W5j0Fh+FpI4AenPsXXRn2U=
X-Proofpoint-GUID: wCf4L8ygzLQ5OTixD99l7b_PiWxmdwfX
X-Proofpoint-ORIG-GUID: wCf4L8ygzLQ5OTixD99l7b_PiWxmdwfX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA3MCBTYWx0ZWRfX8V07nNHGko5K
 TN0XkEmizhH0HsMpuEr+WwV0yBywRxSBDn5toDvH38eG+9jQp4/IgExjTnxQ2sNhjlnvEqeVyT2
 4uvlHf67+xptsXMmK/+CHktN8SFXIbrN9B2IXtD+arRiSSwtY9GIVRHrKkYOhXVGte+FUd1HBvM
 XM2AEsMu1C06ENDdsAHdLuR6zWC1UBK626tRhwJ2OTIrtRpJJW8eRbravGeVCJL07w242E/x3Kv
 DFFYQObkOvCCv4jml9RudfV6e/jd2NM9tx/eq9Vw6HIhrPN3WwjueCjXIhZKvmBLlh9PayLKfAz
 AFPn/XwIeUizNCOl6HYIVTLq3ycH41GRXiQfNwip1kpwjvxYxfjDw0pTfSDjOkUrpQ7UQJCEUGB
 LwcaPKleJzmbmt3IBVria5lcKVicQgxqG5qTA8mfXIDrJm1hFCDPXFwwLOvcO+HQWBuRfSkbpD1
 69ZJfB5EcwWf0OpWvAQ==
X-Proofpoint-Spam-Reason: safe

Presently, the comments for the minimum and maximum channels are
misleading. In the SDCA specification these are actually channel
indexes not a count of the number of channels. So for example
min_ch=4 and max_ch=5 means that 1 or 2 channels are supported.
Update the comments associated with the structure to make this
more clear.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/linux/soundwire/sdw.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index f710e5932b4b2..22fb7158bb709 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -289,8 +289,8 @@ struct sdw_dp0_prop {
  * @ch_prep_timeout: Port-specific timeout value, in milliseconds
  * @imp_def_interrupts: If set, each bit corresponds to support for
  * implementation-defined interrupts
- * @max_ch: Maximum channels supported
- * @min_ch: Minimum channels supported
+ * @max_ch: Index of the maximum channel supported
+ * @min_ch: Index of the minimum channel supported
  * @num_channels: Number of discrete channels supported
  * @num_ch_combinations: Number of channel combinations supported
  * @channels: Discrete channels supported
-- 
2.47.3

