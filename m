Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793297553;
	b=fuBJ1sXakYTw5rDbxKHSmWFgpRWCsjhyHJBmj5AGnyuk/rWzkfala9RoXkzIrdSl+Qsp
	 Gv+1froqKzMmDvfj2wMV28egAGSBPwdP1zJJAEFrX0bgmW3dguC9DISeNJO7lGGbWOqdh
	 bMljsQmsUlrJZL3BzAMHlwi2IWJbQlIXUDTtpI0UsciQh0LPQBQQrorfArxtWwwFhzT0e
	 hst7ERVhHov1vYwokSQQnxApwXwzTI28osGJnIBafNOBhVlUEGcFllzY5Z8Tg7bWM7EmX
	 Lgp5DaBBsTzwUM4HWv7Oyq6HZqyTX1cuZwC25+tNq+tCR1SFBP7mEWqE5C589SwOevg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297553;
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
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=a2VkQje1dJ8HIPx/K50GrW1rHCOR7VlGS21xjo4n32Q=;
	b=MoQ6/BfPKkusbWq2tjBMN4ksEtkuxAsUXgtm6yxnqfFajkxfusZ3StXiWgsDXEV7W+I5
	 Rxb15Epbm/hQh1wEwnFtx3mwWB9DZYFW/exEuDetz2JmAvaabKVnSFBpdFGwHyBfpLNle
	 9SraNzyzqRW1ZSAJf/JHi6Cf0PtLbfyHi4QjQh2jfVJ+5jWHqij3JBpwoG6DVG78lY8KH
	 CmxdDZyXW+bgd7IotdRi//1jHMYij5SB8T9DO5YtLDUL2bCCNGccjxsWNjpbqf0bSw4L7
	 FM4Ycc7q7MbNUFrkL4qE5ZZgT8Ptja2g0kJ4kzgjTIlqbjFiNfu/sq9FPENTZMRehLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=cb1L2+TH;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b="kJh41I/Y";
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08C1606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:12:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A08C1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=cb1L2+TH;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=kJh41I/Y
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGDU9G3224659;
	Thu, 29 Oct 2026 13:12:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=a2VkQje1dJ8HIPx/K50GrW1rHCOR7VlGS21xjo4n3
	2Q=; b=cb1L2+THo6G/WpPv5fZgM6RQcp9G5Smaen7bhXhm72KtI7LOsZf4sucbq
	SUtkZ6zcfC5RqrwgyZ7ms6dFCDfWBpqRikAm1d2xCa+gkeNl1F1ggFvpt+9S+/sG
	oUETp1YOwHp5ORYQb6GPR/GKRD96vFsjhIbShwFJWy5Nl7iyKpY7NFCw/3xUSnaF
	Piy4J7qbNON6Q7TRNCTVM7QEHd2kvqsGk4eeZm00BKrTDJ1I0v8VQj/Vbrru8GW+
	2goyQg3XmiROkcdSfcKEmZFu7SAP0rF3rVEiViQMptUnNmkAeUZrnqtEUzkjOC4Q
	8whAKk5NX8HN1GmL1OYZDs6SklmHA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012019.outbound.protection.outlook.com [52.101.48.19])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hm3h7kkbw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Oct 2026 13:12:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jEcpeqDUI+9eGplEQ/aSq3rKDy1waeUQWmYKGhFepKdhbaT+L6AKUn5rQqRxbF+A+ovM8ITQvFRfZdyzzhK5E2UQabWn/fu/jdY/vdHFtiB9qtdJfVxA13drO/MYTEw/+kcwkTbXV6SUFwlvajcr7pL4T+tJlzcW6OMTimlVPMSJ1an95hnITGp9tFX+WHTU0+edDP/LE96+w94RaB4D4fJ5hPyiX6QymemG99NB2dc/vJSsWkrB6UVfUbag9cppnHfz/hI3sFaq78JE6MM6aqa1ayTgsASuojfWfro2u3lshI3yosikmV+JBD5VyJ2opnQYjX8pgtXYXMAp6NKr7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a2VkQje1dJ8HIPx/K50GrW1rHCOR7VlGS21xjo4n32Q=;
 b=OnqUhhqRhFYQGzg99g+M5oRN9mS9hY+r226l8XdB95fjWhpDIf+l2TIspzP3PkXyoBkBAZ00Tl8twr8MUsk5gQ2zBjp3vFl5Nb4yqA3SwvdAlZXNfSfA37ENSbeaXHCIJTKPjUs5sAeCTnsMUX0iANZpN0YGC9CzGFHd7DiI8brqVmHanP9g3xWKRm1ZNl1G7lvViEKlkDAMiinEGCl0VODkBjQ1gqtywRksHbfJndySURZUWjn9d7Q5cm57DXeVojafwCt/B/vRoPIgwLA0yKWkibLHyQHYsYAp79rYZ5WmSmY8UT9+9a7JW+Qe4YgIRNfMPDV8pMVJ2OR5tafwnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a2VkQje1dJ8HIPx/K50GrW1rHCOR7VlGS21xjo4n32Q=;
 b=kJh41I/YxyieekhBdul+IwuLpKj+oeWCm5RYB1ktOwAearZvFhmVcHaRqIJXHw2CqcKhaNxugXlwJE02kaJ0s6hzV6XflXu7+38NuOejnp66Q/lwYCSuOrhnrCHNApsaFqlEiSAImcpc+oSFiazaQPffzKM3h2lJmVEY3xoMSJ0=
Received: from DM6PR01CA0018.prod.exchangelabs.com (2603:10b6:5:296::23) by
 SN7PR10MB6547.namprd10.prod.outlook.com (2603:10b6:806:2aa::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.8; Thu, 29 Oct 2026 18:12:16 +0000
Received: from CY5PEPF00000E7B.namprd02.prod.outlook.com
 (2603:10b6:5:296:cafe::13) by DM6PR01CA0018.outlook.office365.com
 (2603:10b6:5:296::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Thu,
 29 Oct 2026 18:12:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY5PEPF00000E7B.mail.protection.outlook.com (10.167.247.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 18:12:15 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:12:00 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:12:00 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 29 Oct 2026 13:12:00 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69TIBmM33408718;
	Thu, 29 Oct 2026 13:11:58 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v3 03/22] firmware: ti_sci: Move check for ACK into ti_sci_do_xfer()
Date: Thu, 29 Oct 2026 23:41:28 +0530
Message-ID: <20261029181147.266771-4-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E7B:EE_|SN7PR10MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: 658f7af8-2db1-4bd7-eb9b-08df35e829a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|261028144727099003|261009221227099003|261026140227099003|56012099006|261009223027099003|261009223327099003|261009221727099003|261009220027099003|261022105027099003|261021121427099003|261021123027099003|10067099003|261026121527099003|18002099003|22082099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	+4MYKNFt7FWqzZdTUDp/4/jGKkuU8Wu4JUXncXEE2fuD01FtJjW/WD2oLDt89eCJoE5x8YYDLp1dLeN/o6YImV7OKFomMhX3g0uhxqdXZbwUNKZlYdNGuOtqZ0WuK17tMJx039caYHV5a/C4nUkwnimswATm0pA+2vKuGPJjD1w5aXKOjyz89AXQ2Sa6LktQMIrA+EYZHHr29RhoFDAgKPBov4/YFymH8MuwRljwMfGknwqktz17bWF7NddkNQ15J4pUdNmOHXJRzUbldQRT5FzzFwk7dQdtlwM4aM/gOf/+G3EnC+Ne1fuFWxjxeSCBPD0qQS5QAWazVcVuWuZCOqqzEodGjZm/JxylFhBnnuJnzi4cP2T5C3mYQxwTqe2M/tV/2/hGO9N4/jPnbgQSRmomS0iWlg5UBHPOQ+0QUDqNM5XIE7vH9PxXwiWyQoZdSXhKJ0j3tf8XBxdPbXsysfjqTumA3TFKBLxdPnekWu+C00IGa8U1FgRFcGFjbr3MC6pRoShS7f0W97S+uD1FVy+o2aRnPfGMv9G315VYMROsg4JW631RIGVWy4PuU4h088LvUVWzla//Z4Fa1FptarsiCj7e1WExrs+9FM2siYRuJIo8pP5ThilnT6rlejIEttRV+DAdR26IV5CLbNLJkoW5VlrBNyAoqFVy40SCeQM=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(261028144727099003)(261009221227099003)(261026140227099003)(56012099006)(261009223027099003)(261009223327099003)(261009221727099003)(261009220027099003)(261022105027099003)(261021121427099003)(261021123027099003)(10067099003)(261026121527099003)(18002099003)(22082099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mseBMMyeM3eGK6J6kI81AJ1sF/LzMOlSqGDesSj7d2WimzHi+Kl1/R8KAfpWTMROvv1Zo56LjKbzREvcxmeynR8AGMcRarbjWblNd9Y5sjlONKs8S0UZmHiBG+Ox6iCzAyRpiirEbRTktAOrghReiPRtPw1yHAxglUxhUCdz1ZSzI+qt+6xEYuccWgmIitGudCj/30QcS47TmByjEKOW9/mpQ719kdTJIY8p854fk6oezqN1VKffNg6+RP35Nl3zsb6KPnglkwu/Harq3rThiF9i+fOwQwnswX8VLj7iMlIgfFhbapykAJNGSgzGeiZv4h5A2q5Zuysx1BmastktFLMFyKtDoOr2ONhQxWD7vFLsfiudXub+ye6RkUtmfif67dH2fHcJz32lLXKxzc3+IL3Q0UTnFVDzFoqOh5dYAqSEBxwzzM5yKayFm2QMnBlF
X-Exchange-RoutingPolicyChecked:
	Jb+zEcGr8m1cMxq8WxUWs8nzJYNWAe5/BxvYHktV9hsMAAFv3qg6I4/Y6EUiqcw+yng7cB++UilRLFKlrOK44k5pf3OgMrvbiJA0u3RboP2kCqrdQGY6Jbrc5Ct0VvdQrTYBdMm7WSaGs4sHSGzlvsSkKI++aNMcU7nY0BrizIfbfYV0V2kiXbjr6RGO90z5irKn5Xf7rzARur0vxdBYp2k4Ya2yYSruJphMQAGuurEd38qjx0HMli3VcSlUTMSt5s8lLtg3y0mjXSmSye6UTFnmitO9SlaWbJVJMTQ/2Xs3JsZisqXu2rf1mGay9aInVCUdNH5ZL8VetQC3LKMxBQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 18:12:15.6169
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 658f7af8-2db1-4bd7-eb9b-08df35e829a1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY5PEPF00000E7B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6547
X-Authority-Analysis: v=2.4 cv=fv1J914f c=1 sm=1 tr=0 ts=6ae38c89 cx=c_pps
 a=rwqFklNBBe0PgClOpsUSJg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=C4LaqBg6sCNJR2sbnPEA:9
X-Proofpoint-ORIG-GUID: NbSmaHRiKZceo26sv0SOdYcJS6_UBH2p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfX3/okPAUoC8tf
 eXl4LzV75YbB512fdRtwa+LhyVFUjmYMFTyslQufwGFgMszl/w9CXWS/3Q7Pjzv3TA7xjqtGd7Z
 7E3BQC9oruflFVdSZ74s5Spo+mHe66lSCI0kD0HmekHDBkDAy9SwBx6rI3x2mm+adTC9FkjJ/2u
 mV3Of9L0ynMZPjqstE2Jr92LsPahImFbuoPniKQ4Wxf4RJ8L4UMQKMbGk0HR8OF56R9TBox+NHd
 j2JVBobqYso8SMEIM3JEf+mCcSUEPbUDUVgzyNFMh9SoS8Jf50uyoSOuMfCDX9jRK2PiaAtUU5l
 94GwDDK7aZQRtHU4RaJ3U7PVHqr2zqGsI6zC1ezw4Ru9hwTBXpytTvmnYzQIS7SNjkGNh4d9StX
 20oBnu9xWVkrlrEph3EZt+pEh0qFUg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfX4KOP05QD7dh5
 jcwLbkhzAbS+SM7iU1pDodSytII7Y2IdA9Ig7yWvcNLnqwD7sAYdSlTFD0Wfwu83cm1g0SsJEbc
 KOUUUzAuGwnwj3XX8hddxvSYTMgGDPM=
X-Proofpoint-GUID: NbSmaHRiKZceo26sv0SOdYcJS6_UBH2p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 suspectscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290071

From: Andrew Davis <afd@ti.com>

Move ti_sci_is_response_ack() function up so it can be used in
ti_sci_do_xfer(). As we know if a response is expected we can
check the response in one spot removing the need to check that
at every call site.

Note: This changes the error code returned on a NACK for the ring
config, PSI-L pair/unpair, and UDMAP TX/RX channel and RX flow config
helpers from -EINVAL to -ENODEV, making them consistent with all other
TI-SCI message helpers. The users of these helpers (k3-ringacc and
k3-udma) only check for a non-zero return and propagate it, so no
functional change.

Signed-off-by: Andrew Davis <afd@ti.com>
Co-developed-by: Beleswar Padhi <b-padhi@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v3: Changelog:
1. None to this patch.

Link to v2:
https://lore.kernel.org/all/20260930160607.2674980-4-b-padhi@ti.com/

v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-4-b-padhi@ti.com/

 drivers/firmware/ti_sci.c | 239 ++++++++++----------------------------
 1 file changed, 60 insertions(+), 179 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 3b58fee07c257..6ec16fe57f132 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -410,14 +410,28 @@ static void ti_sci_put_one_xfer(struct ti_sci_xfers_info *minfo,
 	up(&minfo->sem_xfer_count);
 }
 
+/**
+ * ti_sci_is_response_ack() - Generic ACK/NACK message checkup
+ * @r:	pointer to response buffer
+ *
+ * Return: true if the response was an ACK, else returns false.
+ */
+static inline bool ti_sci_is_response_ack(void *r)
+{
+	struct ti_sci_msg_hdr *hdr = r;
+
+	return hdr->flags & TI_SCI_FLAG_RESP_GENERIC_ACK ? true : false;
+}
+
 /**
  * ti_sci_do_xfer() - Do one transfer
  * @info:	Pointer to SCI entity information
  * @xfer:	Transfer to initiate and wait for response
  *
- * Return: -ETIMEDOUT in case of no response, if transmit error,
- *	   return corresponding error, else if all goes well,
- *	   return 0.
+ * Return: -ETIMEDOUT in case of no response, or
+ *         -ENODEV in case of a NACK response, or
+ *         corresponding error if transmit fails, or
+ *         return 0, if all goes well.
  */
 static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 				 struct ti_sci_xfer *xfer)
@@ -466,6 +480,18 @@ static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 	 */
 	mbox_client_txdone(info->chan_tx, ret);
 
+	/*
+	 * If we expect a response and are not otherwise already in an error
+	 * state, then ensure that the response is an ACK
+	 */
+	if (response_expected && ret == 0) {
+		if (!ti_sci_is_response_ack(xfer->xfer_buf)) {
+			dev_warn(dev, "Message response not acknowledged (caller: %pS)\n",
+				 (void *)_RET_IP_);
+			ret = -ENODEV;
+		}
+	}
+
 	return ret;
 }
 
@@ -509,19 +535,6 @@ static int ti_sci_cmd_get_revision(struct ti_sci_info *info)
 	return ret;
 }
 
-/**
- * ti_sci_is_response_ack() - Generic ACK/NACK message checkup
- * @r:	pointer to response buffer
- *
- * Return: true if the response was an ACK, else returns false.
- */
-static inline bool ti_sci_is_response_ack(void *r)
-{
-	struct ti_sci_msg_hdr *hdr = r;
-
-	return hdr->flags & TI_SCI_FLAG_RESP_GENERIC_ACK ? true : false;
-}
-
 /**
  * ti_sci_set_device_state() - Set device state helper
  * @handle:	pointer to TI SCI handle
@@ -561,10 +574,6 @@ static int ti_sci_set_device_state(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-
-	ret = ti_sci_is_response_ack(resp) ? 0 : -ENODEV;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -616,10 +625,6 @@ static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
 		goto fail;
 
 	resp = (struct ti_sci_msg_resp_get_device_state *)xfer->xfer_buf;
-	if (!ti_sci_is_response_ack(resp)) {
-		ret = -ENODEV;
-		goto fail;
-	}
 
 	if (clcnt)
 		*clcnt = resp->context_loss_count;
@@ -912,10 +917,6 @@ static int ti_sci_cmd_set_device_resets(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-
-	ret = ti_sci_is_response_ack(resp) ? 0 : -ENODEV;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -987,10 +988,6 @@ static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-
-	ret = ti_sci_is_response_ack(resp) ? 0 : -ENODEV;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -1050,11 +1047,6 @@ static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
 
 	resp = (struct ti_sci_msg_resp_get_clock_state *)xfer->xfer_buf;
 
-	if (!ti_sci_is_response_ack(resp)) {
-		ret = -ENODEV;
-		goto fail;
-	}
-
 	if (programmed_state)
 		*programmed_state = resp->programmed_state;
 	if (current_state)
@@ -1279,10 +1271,6 @@ static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-
-	ret = ti_sci_is_response_ack(resp) ? 0 : -ENODEV;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -1337,14 +1325,10 @@ static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
 
 	resp = (struct ti_sci_msg_resp_get_clock_parent *)xfer->xfer_buf;
 
-	if (!ti_sci_is_response_ack(resp)) {
-		ret = -ENODEV;
-	} else {
-		if (resp->parent_id < 255)
-			*parent_id = resp->parent_id;
-		else
-			*parent_id = resp->parent_id_32;
-	}
+	if (resp->parent_id < 255)
+		*parent_id = resp->parent_id;
+	else
+		*parent_id = resp->parent_id_32;
 
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
@@ -1401,14 +1385,10 @@ static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
 
 	resp = (struct ti_sci_msg_resp_get_clock_num_parents *)xfer->xfer_buf;
 
-	if (!ti_sci_is_response_ack(resp)) {
-		ret = -ENODEV;
-	} else {
-		if (resp->num_parents < 255)
-			*num_parents = resp->num_parents;
-		else
-			*num_parents = resp->num_parents_32;
-	}
+	if (resp->num_parents < 255)
+		*num_parents = resp->num_parents;
+	else
+		*num_parents = resp->num_parents_32;
 
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
@@ -1477,10 +1457,7 @@ static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
 
 	resp = (struct ti_sci_msg_resp_query_clock_freq *)xfer->xfer_buf;
 
-	if (!ti_sci_is_response_ack(resp))
-		ret = -ENODEV;
-	else
-		*match_freq = resp->freq_hz;
+	*match_freq = resp->freq_hz;
 
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
@@ -1545,10 +1522,6 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-
-	ret = ti_sci_is_response_ack(resp) ? 0 : -ENODEV;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -1603,10 +1576,7 @@ static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
 
 	resp = (struct ti_sci_msg_resp_get_clock_freq *)xfer->xfer_buf;
 
-	if (!ti_sci_is_response_ack(resp))
-		ret = -ENODEV;
-	else
-		*freq = resp->freq_hz;
+	*freq = resp->freq_hz;
 
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
@@ -1658,15 +1628,9 @@ static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
 	req->debug_flags = debug_flags;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret)
+	if (ret) {
+		dev_err(dev, "Failed to prepare sleep\n");
 		goto fail;
-
-	if (msg_flags == TI_SCI_FLAG_REQ_ACK_ON_PROCESSED) {
-		resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-		if (!ti_sci_is_response_ack(resp)) {
-			dev_err(dev, "Failed to prepare sleep\n");
-			ret = -ENODEV;
-		}
 	}
 
 fail:
@@ -1711,17 +1675,13 @@ static int ti_sci_msg_cmd_query_fw_caps(const struct ti_sci_handle *handle,
 		return PTR_ERR(xfer);
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_resp_query_fw_caps *)xfer->xfer_buf;
-
-	if (!ti_sci_is_response_ack(resp)) {
+	if (ret) {
 		dev_err(dev, "Failed to get capabilities\n");
-		ret = -ENODEV;
 		goto fail;
 	}
 
+	resp = (struct ti_sci_msg_resp_query_fw_caps *)xfer->xfer_buf;
+
 	if (fw_caps)
 		*fw_caps = resp->fw_caps;
 
@@ -1766,14 +1726,9 @@ static int ti_sci_cmd_set_io_isolation(const struct ti_sci_handle *handle,
 	req->state = state;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-
-	if (!ti_sci_is_response_ack(resp)) {
+	if (ret) {
 		dev_err(dev, "Failed to set IO isolation\n");
-		ret = -ENODEV;
+		goto fail;
 	}
 
 fail:
@@ -1817,17 +1772,13 @@ static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
 		return PTR_ERR(xfer);
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_resp_lpm_wake_reason *)xfer->xfer_buf;
-
-	if (!ti_sci_is_response_ack(resp)) {
+	if (ret) {
 		dev_err(dev, "Failed to get wake reason\n");
-		ret = -ENODEV;
 		goto fail;
 	}
 
+	resp = (struct ti_sci_msg_resp_lpm_wake_reason *)xfer->xfer_buf;
+
 	if (source)
 		*source = resp->wake_source;
 	if (timestamp)
@@ -1880,14 +1831,9 @@ static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
 	req->state = state;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-
-	if (!ti_sci_is_response_ack(resp)) {
+	if (ret) {
 		dev_err(dev, "Failed to set device constraint\n");
-		ret = -ENODEV;
+		goto fail;
 	}
 
 fail:
@@ -1933,14 +1879,9 @@ static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
 	req->state = state;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-
-	if (!ti_sci_is_response_ack(resp)) {
+	if (ret) {
 		dev_err(dev, "Failed to set device constraint\n");
-		ret = -ENODEV;
+		goto fail;
 	}
 
 fail:
@@ -1975,11 +1916,6 @@ static int ti_sci_cmd_lpm_abort(struct device *dev)
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-
-	if (!ti_sci_is_response_ack(resp))
-		ret = -ENODEV;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -2013,13 +1949,6 @@ static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-
-	if (!ti_sci_is_response_ack(resp))
-		ret = -ENODEV;
-	else
-		ret = 0;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -2074,9 +2003,7 @@ static int ti_sci_get_resource_range(const struct ti_sci_handle *handle,
 
 	resp = (struct ti_sci_msg_resp_get_resource_range *)xfer->xfer_buf;
 
-	if (!ti_sci_is_response_ack(resp)) {
-		ret = -ENODEV;
-	} else if (!resp->range_num && !resp->range_num_sec) {
+	if (!resp->range_num && !resp->range_num_sec) {
 		/* Neither of the two resource range is valid */
 		ret = -ENODEV;
 	} else {
@@ -2193,10 +2120,6 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-
-	ret = ti_sci_is_response_ack(resp) ? 0 : -ENODEV;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -2514,9 +2437,6 @@ static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-	ret = ti_sci_is_response_ack(resp) ? 0 : -EINVAL;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 	dev_dbg(dev, "RM_RA:config ring %u ret:%d\n", params->index, ret);
@@ -2564,9 +2484,6 @@ static int ti_sci_cmd_rm_psil_pair(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-	ret = ti_sci_is_response_ack(resp) ? 0 : -EINVAL;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -2614,9 +2531,6 @@ static int ti_sci_cmd_rm_psil_unpair(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-	ret = ti_sci_is_response_ack(resp) ? 0 : -EINVAL;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -2682,9 +2596,6 @@ static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-	ret = ti_sci_is_response_ack(resp) ? 0 : -EINVAL;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 	dev_dbg(dev, "TX_CH_CFG: chn %u ret:%u\n", params->index, ret);
@@ -2747,9 +2658,6 @@ static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-	ret = ti_sci_is_response_ack(resp) ? 0 : -EINVAL;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 	dev_dbg(dev, "RX_CH_CFG: chn %u ret:%d\n", params->index, ret);
@@ -2815,9 +2723,6 @@ static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
-	ret = ti_sci_is_response_ack(resp) ? 0 : -EINVAL;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 	dev_dbg(info->dev, "RX_FL_CFG: %u ret:%d\n", params->flow_index, ret);
@@ -2860,10 +2765,6 @@ static int ti_sci_cmd_proc_request(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
-
-	ret = ti_sci_is_response_ack(resp) ? 0 : -ENODEV;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -2906,10 +2807,6 @@ static int ti_sci_cmd_proc_release(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
-
-	ret = ti_sci_is_response_ack(resp) ? 0 : -ENODEV;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -2956,10 +2853,6 @@ static int ti_sci_cmd_proc_handover(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
-
-	ret = ti_sci_is_response_ack(resp) ? 0 : -ENODEV;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -3013,10 +2906,6 @@ static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
-
-	ret = ti_sci_is_response_ack(resp) ? 0 : -ENODEV;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -3065,10 +2954,6 @@ static int ti_sci_cmd_proc_set_control(const struct ti_sci_handle *handle,
 	if (ret)
 		goto fail;
 
-	resp = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
-
-	ret = ti_sci_is_response_ack(resp) ? 0 : -ENODEV;
-
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
 
@@ -3118,16 +3003,12 @@ static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
 
 	resp = (struct ti_sci_msg_resp_get_status *)xfer->tx_message.buf;
 
-	if (!ti_sci_is_response_ack(resp)) {
-		ret = -ENODEV;
-	} else {
-		*bv = (resp->bootvector_low & TI_SCI_ADDR_LOW_MASK) |
-		      (((u64)resp->bootvector_high << TI_SCI_ADDR_HIGH_SHIFT) &
-		       TI_SCI_ADDR_HIGH_MASK);
-		*cfg_flags = resp->config_flags;
-		*ctrl_flags = resp->control_flags;
-		*sts_flags = resp->status_flags;
-	}
+	*bv = (resp->bootvector_low & TI_SCI_ADDR_LOW_MASK) |
+	      (((u64)resp->bootvector_high << TI_SCI_ADDR_HIGH_SHIFT) &
+	       TI_SCI_ADDR_HIGH_MASK);
+	*cfg_flags = resp->config_flags;
+	*ctrl_flags = resp->control_flags;
+	*sts_flags = resp->status_flags;
 
 fail:
 	ti_sci_put_one_xfer(&info->minfo, xfer);
-- 
2.34.1

