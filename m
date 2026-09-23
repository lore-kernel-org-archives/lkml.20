Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB2947012D;
	Wed, 23 Sep 2026 09:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156246; cv=fail; b=LJ4HV01Cr7qTF5JAWYuWRi5T5I39YMWuBKjk5yBrS2VMxeIvCKgjWWaVgtGQXjCoMAHlPuEhgdzv0V4eEP4exAqftslv1KaLY36/zSJS4cq0jJA9Xgps6L15MWKcG9I5dLHLN34hkJg6lY/eSpot0fnL2NFcBri3ns/APasZ9Yo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156246; c=relaxed/simple;
	bh=mNHhcCpV5SPD45dDBsEsDJnhQ9nbzB4fHM/cLdF5mRc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GzNNWbBTtURySgf9ZnGjQyI3BNvkT2wRyVBJRYqFT++fCF8HphvjUhUjRemqiMjAU5HyoIYcD/iuyYutqbnwYhwy457VR0rmZZumR4nCqkfnSfD2Dr61Mj7WdPjuCwhDaU8mJkvvmWVcqmIXIGKBj2O8MrG2rNE/OOHvffHt01U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=X24etU1v; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Ql4wTk9T; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="X24etU1v";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Ql4wTk9T"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8J7ff299713;
	Wed, 23 Sep 2026 04:37:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=INy+NWrjAw5a5jxsgIZ7lQ98HghIYDJ97iHZYLI/v
	JA=; b=X24etU1vxqLnUeo6kAT4JmyT6btqDT7aX+1I4CcCKBuFnAqSi3EOXL5sz
	oWpwjWzdDYm68IskUAkuiSFvuy1V5pm5b1jLHz3TCKkHXjEjlvhD5Weg1foHHP4o
	UA+LzBqUoKl1UmMAqUJ8lKs9a5fWo4Jimq6vmmJLPCc3MRxL4+LvlPVglYbOahwb
	/nwYZcVNRYxyZ4ty+lnuIarNFvp/M0WJqwZAo8ndAATAqNQo2s1XYXe0QIH4z9Nw
	0a6KtQfmEA5w1mu3rp57uTSF0rMq5eHUPq8zLjq/mP5fXYSdKgsp6yM+uAt3eRWb
	DZqMmNNN5jkq4nU7cTMR+MXbIIDHQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011069.outbound.protection.outlook.com [52.101.52.69])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gv54tjcnf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 04:37:04 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ncocQ04jI5A9DHtkxuEK/YlDBfz4EsU5TiT0McBGd0RM2sxOVm8kPS9oufLv5YJq1TUhWepKbA0RjPEm+y94TEVwhJffmsa84s59rbwImceELneyHnLC6Z2mJDHEx7kos/0k6uu7Lm4+D3u46BPK761wyQQIpbauLHdEeHTVsOxI9cBzaD8wweXp45B4ABFXLzq4ZcKpjj+Chowtjf5GTICbOGH1UbkyCV8i+5hmDKDMOztZ39NifyHNKY/lvjgzWnWPvLPUz9vIPZmXxAn/gIAT6oCyfRWYpp25uuqyLO6Zm6aHhvfNrZfe9NOXsPH88mMQ3/kqzl579JFO/nYdgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=INy+NWrjAw5a5jxsgIZ7lQ98HghIYDJ97iHZYLI/vJA=;
 b=zQpAzxtBabVCNJRq2LGPp15YvuYH33Kl/+/IIyemSr4IJtnIgoP+VeR0a7XWEd8tpq/J9nyyNmn9pqPbnNkr3fO3MXKn6JcMfBw3SZShlepRW44rCnte1cbfMpYhAMLbfEwByXNGj8vGG169nuMxiV50lyqaJjMXxvM3qDUUgIItWTNB1uBVysmRDGYppnveZefWsijPukO0Almj1CNxLOpa/QoOb/vuEQ7NEzYpM/NJOvYW8PQicPviTzugYVJANmNtO2iPSLCAJtynJMYegnYn8RVv3Fmdl8fZnHZpredJ9poZU6es00fIFdBm+ysoDavLyPoDLQBUdYgwi1H0pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=INy+NWrjAw5a5jxsgIZ7lQ98HghIYDJ97iHZYLI/vJA=;
 b=Ql4wTk9TpgTXDQKs0/U8dxQMlbjZfQWveD9LRSVlGxvcbK7sNBCm6Z6B1pA5pmfixP9MsOhO1r38bB4RaoNphOKP3wjyInIguhVDKvARGJM4Ts3JGiTqh1RGAKHUydY3OsUnatrtD4CLtMQNMxFcOPaasIiMcH88N/brtAir+DM=
Received: from IA1P220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:461::14)
 by CH0PR10MB5146.namprd10.prod.outlook.com (2603:10b6:610:c3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.9; Wed, 23 Sep
 2026 09:36:59 +0000
Received: from BN3PEPF0000B370.namprd21.prod.outlook.com
 (2603:10b6:208:461:cafe::4a) by IA1P220CA0008.outlook.office365.com
 (2603:10b6:208:461::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.16 via Frontend Transport; Wed,
 23 Sep 2026 09:36:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B370.mail.protection.outlook.com (10.167.243.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.5 via Frontend Transport; Wed, 23 Sep 2026 09:36:54 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 04:36:23 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 04:36:23 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 04:36:23 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68N9Z3WX1760658;
	Wed, 23 Sep 2026 04:36:17 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <Frank.Li@nxp.com>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
        <festevam@gmail.com>, <andersson@kernel.org>, <geert@linux-m68k.org>,
        <dmitry.baryshkov@oss.qualcomm.com>, <arnd@arndb.de>,
        <ebiggers@kernel.org>, <luca.weiss@fairphone.com>,
        <michal.simek@amd.com>, <sven@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
        <r-donadkar@ti.com>, <devarsht@ti.com>, <u-kumar1@ti.com>
Subject: [PATCH v3 09/18] arm64: dts: ti: k3-j721e-sk: Add overlay for fusion application daughter board
Date: Wed, 23 Sep 2026 15:04:50 +0530
Message-ID: <20260923093459.28125-10-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923093459.28125-1-y-abhilashchandra@ti.com>
References: <20260923093459.28125-1-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B370:EE_|CH0PR10MB5146:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b667803-504a-4666-1c74-08df19563474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|82310400026|23010399003|36860700016|13003099007|3023799007|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	SJHxMFYgLEmKYfW77dsa4DWF6kp9haqKFabNx+0AgsFV3bOr4Wuh0irXZfmMb1heKop2VeQuovmKB9IjAcIbSoOzTwzzbLtTkIzQKDI0cROhX1lRKrsLbX+GLd1LzSI4k1CSeOXOZ78/kxEJvOHOOXpkJtBWSAqmOILRlqRJbBNY6SZJ0s5zfoPZ6sRbfUdXixw1FvjGoKKTT79eBef4P3yuigeGLEcxpnoa/DteFju/9u/DGO6+Wi40jZPB6tab/I+7zNcWp0UBzk8+m42Xtnjn4cQQPYYR3/UUYnayDVgtWJY5KI4vEC61wePIbcXf/sLC9J09fYcamH3XD5SWpgIztlmi+/ODxrYxiWwfcP1gA0VYbl5hxk7RL58SJKRhrpA0w36b1rq9ERkUHTmAcXwYOZqWHFQgBfWZyj5n/sZy68DIuO66zKXRiC6IXX1nz1ISGtDkygshitqdEA67c++P+5jGKUqbFaM8BjK30YZyRX5voi+EcbB69n7tnQP4YJRhBZqZWqcLK5IK5OJGOSiuL4+eDYPnOLD2BAB5M9wPRKMwNllCGV1sSY4QjmE6Y5ppUTro3kvWSR9C8EqEypewoQius3w3kNoGQKMX8mTxhRA85fzbAwMKeviOoj3xTRmvyYJtmbquq7f075wAgw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(13003099007)(3023799007)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BvtBjT9mQVVJS4KtbI7t0KS7FKifQUcCeft+pyJBpeXP9hJM9iaAlP5WbjLYkpTZw2JeKFiGQdyieNIevUZGRmu5YJRumFNYzlSGGGX0aCC3o09AYEJe5WbfmJkL+trlCDU7+oR3kFrcL+ehFdWymvPotPiDkuqUorKVg/Rm0rOwJdFaC1Tdn+0mFBDSGagbTKv6Wbgqfi7qSQQfNPTHUbHZpSM7iuFQiz4fGuMov/o7JOkMuWGXMEDDaCGbxCslsaRt0580JyaN9kCuLZWTBojjaOzqySWKzliR1R9ogA9zyw7TRHubU/Po8Qo9+tQUUZA1cuf5iS0ZttIHp7OIdT1dSjn6Zs7fKd0uHHeRtmBYyo5nhCmyztelUWKv2n0YlWPLS1MBBHo+thfdQq9edL8Zr9TN1kHgMNFT+TwL2d2i2jzEOI3IpVamMPWQT1lH
X-Exchange-RoutingPolicyChecked:
	OIrrdHfis0XQxKW1a+VIKqol1bngQts7l7fINcKA9tVVe/YQw8Ybnb5xm6dJ4wbN6juKFYlc7BY4XTUvCnnHuVsKAUx+epm6R8FGYbdz8Fs/nuIaGkgwVL7wGpoBngZGdaiSgPRa19c53UENTUX+Yn4JleW4P/9Qt+08o7w1dn/FSQy6ppZP3uGEa2W0+2xln1ykwiP/HYFI0uSa8ZgqShoNEwSVtSl363eQllBqDD1EMwIgfMVAP2IAA0yTU5T5wwFDfxVE4b/6dYqNm3cEcgTfk5nk15wVpYXnzepNmHcHRyP0vAhgWyC9KVHbUuizmQMyszsvecAYO/yqsqqGmw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 09:36:54.6620
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b667803-504a-4666-1c74-08df19563474
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5146
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfX9okf4YA3zHqz
 fpag41UGGeQ6X6jnihTonw4Szq6IwcR3Ka50OlsREhK594lffCizCYn9CGS8w0MBBwktASO1wd6
 keqX/T9XC22gzkKvI1ijpC1m2k5knHY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzOCBTYWx0ZWRfX0aNttrMzn8Y8
 iy8yQ9AipXxyVrF2oiIjClqIKVWgW0/KT5p10Pxy4rWUFqn0y6j3F0peT/prpHsnqhC8K11IYAX
 /UZyW0Y6zFRWDdt0LUP49WpQ4/fE5OLZZl9E4ZULzifOUUsxhDOznKdHcH1E8yOjyQhl0nvrB6M
 07Njt3S2i/8OS6epHSAAmyRQP6i5FFfQ+6f8lIGEV9nMvbgypL0gHEI+O00/7RClAKZXl8nNZtf
 bv6tCwvLHaw0y0R7dv8Z8GLQL8CG2YiyCWCf/dRbhhS5FSvV6ccK/lr5oDku/g1BMkLMcNOw3tC
 v7EwVm3HgHbZsHsefUQeAiGvFiwi1BKVXXZU8L6j9UMaL3wtiiWWj3Q8mZokMgpjN+dcnm0o8II
 3vcN463Xh1KuQdZTNt3/Z6fBiOQh+YX/tP+Mh3Rv6kJW5sO647EsLVrfZyaWQb+7fegmEtbQegQ
 u+cD9R1OeyAVJsaomfQ==
X-Proofpoint-ORIG-GUID: 7VtY-Sd7U6MIk80VbzWkuW7NzWC8Og_Z
X-Authority-Analysis: v=2.4 cv=TpFzFzXh c=1 sm=1 tr=0 ts=6ab39dc0 cx=c_pps
 a=KKuy1w1gR68tVOnyqteslA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=iY-8cndAAAAA:8 a=sozttTNsAAAA:8 a=JFaIKmMPQViuOQAtcpwA:9
 a=spcmYsBHvreeK_59bKkA:22
X-Proofpoint-GUID: 7VtY-Sd7U6MIk80VbzWkuW7NzWC8Og_Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230038

From: Vaishnav Achath <vaishnav.a@ti.com>

Fusion application daughter board [1] can be used to connect multiple
FPDLink-III based sensors to TI EVMs. The board has two DS90UB960
deserializers, each of which aggregates input from up to 4x FPDLink-III
sensors. Up to 8x sensors can simultaneously stream over the two CSI RX
ports on J721E-SK.

CSI2RX connectivity on AM68-SK and AM69-SK is the same as that of J721E-SK,
hence the same overlay can be reused.

[1]: https://svtronics.com/product/fusion-application-daughter-board-evm577pfusion-v1-0/

Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
Changes in v3:
- Rename fixed-clock node to the generic clock-<frequency> form
  (Krzysztof)
- Also rename fixed-clock label to lowercase
- Override CSI2RX ports using &csiN_port0 labels instead of the full
  &cdns_csi2rxN node path, and drop duplicated properties (Krzysztof)
- Fix minor DTS coding style issues (Krzysztof)
- Use GPL-2.0-only OR MIT license for consistency
- Update copyright year to 2026 (Udit)

 arch/arm64/boot/dts/ti/Makefile               |  10 +
 .../dts/ti/k3-j721e-sk-fpdlink-fusion.dtso    | 172 ++++++++++++++++++
 2 files changed, 182 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721e-sk-fpdlink-fusion.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index f0bc771da0fe..15b69fb1cd43 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -179,6 +179,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-sk-csi2-dual-imx219.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-j721e-sk-fpdlink-fusion.dtbo
 
 # Boards with J721s2 SoC
 dtb-$(CONFIG_ARCH_K3) += k3-am68-phyboard-izar.dtb
@@ -373,6 +374,8 @@ k3-am68-sk-base-board-csi2-dual-imx219-dtbs := k3-am68-sk-base-board.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-am68-sk-base-board-pcie1-ep-dtbs := k3-am68-sk-base-board.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtbo
+k3-am68-sk-fpdlink-fusion-dtbs := k3-am68-sk-base-board.dtb \
+	k3-j721e-sk-fpdlink-fusion.dtbo
 k3-am69-aquila-clover-panel-cap-touch-7inch-dsi-dtbs := \
 	k3-am69-aquila-clover.dtb \
 	k3-am69-aquila-panel-cap-touch-7inch-dsi.dtbo
@@ -398,6 +401,8 @@ k3-am69-aquila-dev-dsi-to-lvds-v2-panel-cap-touch-10inch-dtbs := \
 	k3-am69-aquila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtbo
 k3-am69-sk-csi2-dual-imx219-dtbs := k3-am69-sk.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
+k3-am69-sk-fpdlink-fusion-dtbs := k3-am69-sk.dtb \
+	k3-j721e-sk-fpdlink-fusion.dtbo
 k3-am69-sk-pcie0-ep-dtbs := k3-am69-sk.dtb \
 	k3-am69-sk-pcie0-ep.dtbo
 k3-j7200-evm-pcie1-ep-dtbs := k3-j7200-common-proc-board.dtb \
@@ -412,6 +417,8 @@ k3-j721e-evm-pcie1-ep-dtbs := k3-j721e-common-proc-board.dtb \
 	k3-j721e-evm-pcie1-ep.dtbo
 k3-j721e-sk-csi2-dual-imx219-dtbs := k3-j721e-sk.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
+k3-j721e-sk-fpdlink-fusion-dtbs := k3-j721e-sk.dtb \
+	k3-j721e-sk-fpdlink-fusion.dtbo
 k3-j721s2-evm-fpdlink-fusion-dtbs := k3-j721s2-common-proc-board.dtb \
 	k3-j721s2-evm-fusion.dtbo
 k3-j721s2-evm-pcie1-ep-dtbs := k3-j721s2-common-proc-board.dtb \
@@ -500,6 +507,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am68-phyboard-izar-pwm-fan.dtb \
 	k3-am68-sk-base-board-csi2-dual-imx219.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtb \
+	k3-am68-sk-fpdlink-fusion.dtb \
 	k3-am69-aquila-clover-panel-cap-touch-7inch-dsi.dtb \
 	k3-am69-aquila-dev-adapter-panel-cap-touch-10inch-dsi.dtb \
 	k3-am69-aquila-dev-adapter-panel-cap-touch-7inch-dsi.dtb \
@@ -508,6 +516,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am69-aquila-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
 	k3-am69-aquila-dev-dsi-to-lvds-v2-panel-cap-touch-10inch.dtb \
 	k3-am69-sk-csi2-dual-imx219.dtb \
+	k3-am69-sk-fpdlink-fusion.dtb \
 	k3-am69-sk-pcie0-ep.dtb \
 	k3-j7200-evm-pcie1-ep.dtb \
 	k3-j721e-common-proc-board-infotainment.dtb \
@@ -515,6 +524,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j721e-evm-pcie0-ep.dtb \
 	k3-j721e-evm-pcie1-ep.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtb \
+	k3-j721e-sk-fpdlink-fusion.dtb \
 	k3-j721s2-evm-fpdlink-fusion.dtb \
 	k3-j721s2-evm-pcie1-ep.dtb \
 	k3-j721s2-evm-usb0-type-a.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-sk-fpdlink-fusion.dtso b/arch/arm64/boot/dts/ti/k3-j721e-sk-fpdlink-fusion.dtso
new file mode 100644
index 000000000000..28bb4b265494
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j721e-sk-fpdlink-fusion.dtso
@@ -0,0 +1,172 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * DT Overlay for Fusion (FPD-Link III) board on J721E SK,
+ * AM68 SK and AM69 SK.
+ * https://svtronics.com/product/fusion-application-daughter-board-evm577pfusion-v1-0/
+ *
+ * Copyright (C) 2026 Texas Instruments Incorporated - http://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	clk_fusion_25mhz: clock-25000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+	};
+};
+
+&cam0_i2c {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	deser@3d {
+		compatible = "ti,ds90ub960-q1";
+		reg = <0x3d>;
+		clocks = <&clk_fusion_25mhz>;
+		clock-names = "refclk";
+		i2c-alias-pool = <0x4a 0x4b 0x4c 0x4d 0x4e 0x4f>;
+
+		deserializer_0_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				status = "disabled";
+			};
+
+			port@1 {
+				reg = <1>;
+				status = "disabled";
+			};
+
+			port@2 {
+				reg = <2>;
+				status = "disabled";
+			};
+
+			port@3 {
+				reg = <3>;
+				status = "disabled";
+			};
+
+			/* CSI-2 TX */
+			port@4 {
+				reg = <4>;
+				ds90ub960_0_csi_out: endpoint {
+					clock-lanes = <0>;
+					data-lanes = <1 2 3 4>;
+					link-frequencies = /bits/ 64 <800000000>;
+					remote-endpoint = <&csi2_phy0>;
+				};
+			};
+
+			port@5 {
+				reg = <5>;
+				status = "disabled";
+			};
+		};
+
+		deserializer_0_links: links {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	deser@36 {
+		compatible = "ti,ds90ub960-q1";
+		reg = <0x36>;
+		clocks = <&clk_fusion_25mhz>;
+		clock-names = "refclk";
+		i2c-alias-pool = <0x5a 0x5b 0x5c 0x5d 0x5e 0x5f>;
+
+		deserializer_1_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				status = "disabled";
+			};
+
+			port@1 {
+				reg = <1>;
+				status = "disabled";
+			};
+
+			port@2 {
+				reg = <2>;
+				status = "disabled";
+			};
+
+			port@3 {
+				reg = <3>;
+				status = "disabled";
+			};
+
+			/* CSI-2 TX */
+			port@4 {
+				reg = <4>;
+				ds90ub960_1_csi_out: endpoint {
+					clock-lanes = <0>;
+					data-lanes = <1 2 3 4>;
+					link-frequencies = /bits/ 64 <800000000>;
+					remote-endpoint = <&csi2_phy1>;
+				};
+			};
+
+			port@5 {
+				reg = <5>;
+				status = "disabled";
+			};
+		};
+
+		deserializer_1_links: links {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+&csi0_port0 {
+	status = "okay";
+
+	csi2_phy0: endpoint {
+		remote-endpoint = <&ds90ub960_0_csi_out>;
+		bus-type = <4>; /* CSI2 DPHY */
+		clock-lanes = <0>;
+		data-lanes = <1 2 3 4>;
+		link-frequencies = /bits/ 64 <800000000>;
+	};
+};
+
+&csi1_port0 {
+	status = "okay";
+
+	csi2_phy1: endpoint {
+		remote-endpoint = <&ds90ub960_1_csi_out>;
+		bus-type = <4>; /* CSI2 DPHY */
+		clock-lanes = <0>;
+		data-lanes = <1 2 3 4>;
+		link-frequencies = /bits/ 64 <800000000>;
+	};
+};
+
+&ti_csi2rx0 {
+	status = "okay";
+};
+
+&dphy0 {
+	status = "okay";
+};
+
+&ti_csi2rx1 {
+	status = "okay";
+};
+
+&dphy1 {
+	status = "okay";
+};
-- 
2.34.1

