Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793297611;
	b=aQrdaidxcVq9hvHzomjBO8EOwIOv9KXlQTehfsCKuN6w8sGuvUJ0GNvt+h/3ar0G36fF
	 UdJ0eHP5lap6VYRF71K/e0mOeu1YiQyqTcqsj4K8Ko36JnbpKia6uFeyOm0H3S9/C4qNm
	 QKty3mNQPkLBI4BiTev9fr33kVX0YQlaX7e6GXCQqqdc18KJ+997V4feHIA7x559oAz0S
	 AaYWE8baEJdmcID4+vVPsN4gMMp3iE9FLmG+gBp1iYfQoQh0vlIpcjjrPYYMvNlJEH2uJ
	 T64PI5V0Cy7E+bbzTsy/DdB9KcEl1PEUx8B7i+BZpdHLJolKmxvZBq/WZAzvCOUhRGA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297611;
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
	bh=MDBIZxECe+CVX7B54RZ/ll0WbapqA0tRfoigVNBgWN8=;
	b=vUhSGQoWB6Kabv575jJAXjtHCPptjjKybqMQATuWBG9SFyo9bbwOOBqs6ErMtiwppEsP
	 guuKT/WKM3E0XdmTKFlF8N4U1BFZicjohS3INkJVIH7hnwtMreVf0sEpLJzdF91Gc19/m
	 TWX2OK2DXCkRzrqWf9XglgigX0B/cMp0mUpFkV+gyOmmpSwvAniJEnmZEakMM6S7mfm0m
	 fVgwxIIJ3rVXMBooSoNE3hJCf6FJeZkvWp6WAX1l1WtHpqHws+HUjWSikGchJoVQcdoY6
	 jC5GMufCkwDvkpyoYCz70l42jcY6LIeh5oGTIwL6V/xWZgM9Nu49JRP5uYSSfN5ev+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=JeUYLQXE;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=bUbiTEOX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5523606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5523606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=JeUYLQXE;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=bUbiTEOX
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGDivO2604281;
	Thu, 29 Oct 2026 13:13:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=MDBIZxECe+CVX7B54RZ/ll0WbapqA0tRfoigVNBgW
	N8=; b=JeUYLQXEDDSn9HStlbLYIvuvWJ2t3mrW/mNuqdnbJLVVvy33pd24uYNPy
	niFuFjrd1ZIpgaB2uzqtiu2tq3fOEXfZONGz2iwzye9uttvhkWVwg+8st5/9u44V
	UVRElQgcmSP1Vbf5lzXutBeYmyF0m6vN+SLP36ClR+DNM37cykY4Sj6ICl1/Nagh
	QAkQ8UBKVOvYoUIUfZbdDPHghwxDT1nSwVdIrcxX9kKYzjHfpuDTOt+v9YAUX0/J
	/Eig3AvHf9AIllXFU02YWOVvOFdUONoPfahh1rByCpmJihbLAafU70M0od5THmaA
	NSYxnP+3czftCTsz/QxgHsHmQVt/w==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013044.outbound.protection.outlook.com [40.93.196.44])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hm55ak3rn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Oct 2026 13:13:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s6PQbQt1pUncnAfvPTtOR2Xusm9Ea1TH4duTr5I/W0DdzLrOGVBZbLdu3zZpk7QwfuQ+LfF+wK37MAs9kg+TIDA5L/zH8LEEtMyk8KNHrKD/lXZ5jOw0bthn4WkMjEzkZXvsiwIeiwbZN3RHQ+cbfdRYs6iHpp4rYXzon1UmNWzcmCmL+pcQsZGXoVBzPATly2cfIOPhmGReuJDqCnHYHsqfSItT5ZWkE3XOJdYdOCqZ1muWNafBC4DkTh9Y3panVXbQgwgim2IRKM3ZSK2htlVNIkf/H1wkwbY+gzaM+X818aCMdp7TMWF7e44G0CAXFw0bg6GSi7M1Uzd/69jwsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDBIZxECe+CVX7B54RZ/ll0WbapqA0tRfoigVNBgWN8=;
 b=lHG6bZ+fJN9ifVMfTeaK++fHrACdcXvZJ87tNxdOu/ZCM850N4NS1BqbZyAYS6R+QEtcCZhb4tVM5iL1wdSXniLwcr23wzND8/QERkxQfiYfVI/rzO1joI18F0jJzLU+0tAKN6RD5jmXiGy+3KNRLl5S9iV62ukXHIdDyQSY5JTAOh8QlysiYtMR2QiI3vxaIhb4vqElTHFEm7f8CNfavB8a3JphK8y1RQMxO0LozbeLFHDny806qUVttP4+5HwzuBJLaylVxGtos5IFiGpOQMDmtS3fLzWhkw4I6/xb0RsTiof85qI7sDbPc71tngDsm9eoHFe2n4Pmn7yRC7mPhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MDBIZxECe+CVX7B54RZ/ll0WbapqA0tRfoigVNBgWN8=;
 b=bUbiTEOXSbitid+2xFTRMt87TtcaYdhH+hnqoAtx5oj5mCp0oLL1dC3jqyigc+aWCtuTEeAdqlMqeSI3kcWr0/KEl5rQmvIwNVZKn4Tw1PmA7mkPJuBgd2eIW+8JsA2PQAtDOo1XxbotG3XvDDxmQ9sEN7MuZmLhW88G/BG57WA=
Received: from SJ0PR03CA0241.namprd03.prod.outlook.com (2603:10b6:a03:3a0::6)
 by LV0PR10MB528721.namprd10.prod.outlook.com (2603:10b6:408:3fa::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 18:13:13 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::1f) by SJ0PR03CA0241.outlook.office365.com
 (2603:10b6:a03:3a0::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.8 via Frontend Transport; Thu, 29
 Oct 2026 18:13:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 18:13:11 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:12:50 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:12:50 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 29 Oct 2026 13:12:50 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69TIBmMJ3408718;
	Thu, 29 Oct 2026 13:12:47 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v3 19/22] firmware: ti: ti_sci_clock: Move clock ops into its own file
Date: Thu, 29 Oct 2026 23:41:44 +0530
Message-ID: <20261029181147.266771-20-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|LV0PR10MB528721:EE_
X-MS-Office365-Filtering-Correlation-Id: c4474b20-71f8-46bd-3ce0-08df35e84abb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|56012099006|261009221727099003|261009221227099003|261009223027099003|261009223327099003|261026140227099003|261026121527099003|261028144727099003|10067099003|261022113327099003|261022105027099003|261021123027099003|261009220027099003|261021121427099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	2pVG2EvIdgG8muEqah1b7Esh3vVv7Xki8efaJAWcuhDd3/jlVuMwNXnKke4tgn8Z/RxlO8MqfsgjlOS6SiSIejSPVoxyP1IdpmX2imdt1FbolXNLskbiluXfseoGvYAMreL5eCm9DSIwmlTCiSN6+Ht2M0gO0KMYq9dTAYQJgg7wU+VSVliMxBA8l6F4q3qNgcCy6cuTAtzgjHEWLSamfMLw6i8FvW7ghA9PnPsu3NZcinnP8snCqvb0aDJzF0oWgDDi4UafOZKkMvSOoQjkGBQCch88yWhCFl70q/8tqPAzjku920OMNrvtilBibOjaxYYnPKB+L1FxIfDczFTtzaspEwoPrz2Q8B1Yx3KUaLXS4TRPPhZ5vpkqfmFQ6s2gU9WsxwxVVuE2BEfWgOi3cWovDQ5+8dItzGX06BB2GI2W98lc1qQ4I5ETjQ6kzk5D3TGB8QTvN4pGtMjZNULpp8bSUgr5T/PX/JKodMq3KzOC4n7/WhyOXRWXGmPwuryLQU7rrGUTbuixzUVtOTURCps1keRFaSo7NYX1cabxipbLfic0xSrr2H/h2zvdqL0Qai0aGn/uNdupppQpQoXJjxpbz1+ywOJ88euitzpnGrE265v3G/ATikcSjiHu6lG7DNBqzZzBiYGAC6OJL11Y1Q==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(56012099006)(261009221727099003)(261009221227099003)(261009223027099003)(261009223327099003)(261026140227099003)(261026121527099003)(261028144727099003)(10067099003)(261022113327099003)(261022105027099003)(261021123027099003)(261009220027099003)(261021121427099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iRKfiQ8CTKz7t2ikUT7wmIBNEm4yXAf9Qwo2SUgUBR0MfRYXrajtKqIg6CHvRGfmy8la1vAUKler/iw5QmScPhUYjpB2u093B88LNyy4Uyae3wv5NdU9Zbfqk/p21xMAhDFS9oFlwYXqe6SNa7OrSHl8IPZI7Uirlu9D21B5VGcA51nVYU+ALEeRexeI9cM07xnKXtsNR1oFAcE6NaSGmZN7pcyxn0LEBhGid6/oLzN4jxSwMYa76b3wWwOaZMepO7MA0NzBjLBmCOgUFY2WT8lwECpeE3A8ikRcU2HTepHQPuwWz1DXthcm9/97O+OxhHOktbyeTQdomueMy53rFUbAtnVaxHzZCPgldzQ1wYpmhUv8tcCV3cRU7DZtORShWDZzeNHSRUICVaDhqGih4+NcNO0UuESijBi53cSArqMpVphD+oXLeK8tyoyRhuaV
X-Exchange-RoutingPolicyChecked:
	xKsOtxa/ukP0lCR4w47B7aXdJYF3KAnaQc0kjydw5XotQBOy8wrzxd5qmxZDOY/Chwvy9ne877kY4BqAi6iZ0xc4CihNZwyL/cG2FZcdvV/hMuNumNBaqxt1jOwXgjaG7LFFPQZ0QOri6lHxHgZZwQtIFn6VMhws22DEJlo0KEO1SC5xovqZFqvGDkdhkexlJ0GNPo4ANJSu2KedlJXYjZlxptvcjXdr4f5m3T6ujX8m2t7qzgWtLWD3aHNijOdKWmNcy/S7YKw0ymAy0gN4ai9tAuU5nvLjcaVSiubPTagR2Xr+jII2GYEJfFe4efuYSomn1rNSuiceH4lYuPC28Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 18:13:11.1100
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4474b20-71f8-46bd-3ce0-08df35e84abb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB528721
X-Proofpoint-ORIG-GUID: Ct7yS5iEMCOTIY6x0rmipJqTPfbS8wjk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfXxcom2ae3HBSv
 KNbM7VPaokWZrlnMsbNfvM7MrykP2dJLANcnuLIvKeh4amivHFg3mt0wX79+J5a/lNkK0fltYfp
 Z8IKVxSTpT92+ZNocjviDciKo6NhgCcL2fXT5p49hFY8a1gaBSBoC18YWR1Vjwj3tgh5KD68E8E
 vvMxmKImC/2dh5auD0ZzefYPGVHrOjZt2TaaBurXuJ8vI/zQRKNo/nOhDqNGrJor2DZrWjU2dui
 CAXwXAgiCIYcN0FVPSQGepHdgga/nZiODeL7QM1N4ZJdylp0lOGEI96aNoRyAY53VbuA6gNRwLt
 yGJq83N9EiWn3vewhJ9LU1mYT8jhEpEs+ma+MpQ66ikKlliBuvOQpGQp3VNo7S03JxzucfTgUfv
 RM0KceF8JBazvFUfGIjTRTWOqMrarA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfXw5OZpZMbTP9y
 JO7e8tT5aATJV6fLhej7vyxFN/XbNDhUfJVYe5xOF22HfSotdSUE0/rtkwmiBHibltEt05/e+je
 EAwTgjsbMRGFUMUbFCo1kfp7AUtlqig=
X-Proofpoint-GUID: Ct7yS5iEMCOTIY6x0rmipJqTPfbS8wjk
X-Authority-Analysis: v=2.4 cv=eM2GH3p1 c=1 sm=1 tr=0 ts=6ae38cbf cx=c_pps
 a=Ji2ygefkweamrNJ/4LFw0Q==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=myWusNq7Z1Ndx3JLH8AA:9 a=6EDSWHHbUuOq48cG:21
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610190000 definitions=main-2610290071

From: Andrew Davis <afd@ti.com>

Extract the clock operations related functions and services from
ti_sci_core.c into its own file. This breaks down the single large
file into smaller logical files for better readability and maintenance.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v3: Changelog:
1. None to this patch.

Link to v2:
https://lore.kernel.org/all/20260930160607.2674980-20-b-padhi@ti.com/

v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-20-b-padhi@ti.com/

 drivers/firmware/ti/Makefile       |   1 +
 drivers/firmware/ti/ti_sci.h       |   1 +
 drivers/firmware/ti/ti_sci_clock.c | 553 +++++++++++++++++++++++++++++
 drivers/firmware/ti/ti_sci_core.c  | 535 +---------------------------
 4 files changed, 556 insertions(+), 534 deletions(-)
 create mode 100644 drivers/firmware/ti/ti_sci_clock.c

diff --git a/drivers/firmware/ti/Makefile b/drivers/firmware/ti/Makefile
index a3a056eedd9a5..c4233542ad57d 100644
--- a/drivers/firmware/ti/Makefile
+++ b/drivers/firmware/ti/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 ti_sci-y			:= ti_sci_core.o
+ti_sci-y			+= ti_sci_clock.o
 ti_sci-y			+= ti_sci_device.o
 obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
diff --git a/drivers/firmware/ti/ti_sci.h b/drivers/firmware/ti/ti_sci.h
index 79f56699faf29..cce59cac35ed6 100644
--- a/drivers/firmware/ti/ti_sci.h
+++ b/drivers/firmware/ti/ti_sci.h
@@ -1566,5 +1566,6 @@ int ti_sci_do_xfer(const struct ti_sci_handle *handle,
 		   void *rx_message, size_t rx_message_size);
 
 void ti_sci_setup_device_ops(struct ti_sci_dev_ops *dops);
+void ti_sci_setup_clock_ops(struct ti_sci_clk_ops *cops);
 
 #endif /* __TI_SCI_H */
diff --git a/drivers/firmware/ti/ti_sci_clock.c b/drivers/firmware/ti/ti_sci_clock.c
new file mode 100644
index 0000000000000..f266522fb7d08
--- /dev/null
+++ b/drivers/firmware/ti/ti_sci_clock.c
@@ -0,0 +1,553 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Texas Instruments System Control Interface Protocol Driver
+ *
+ * Copyright (C) 2015-2026 Texas Instruments Incorporated - https://www.ti.com/
+ *	Nishanth Menon
+ */
+
+#include <linux/errno.h>
+#include <linux/soc/ti/ti_sci_protocol.h>
+
+#include "ti_sci.h"
+
+/**
+ * ti_sci_set_clock_state() - Set clock state helper
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @flags:	Header flags as needed
+ * @state:	State to request for the clock.
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
+				  u32 dev_id, u32 clk_id,
+				  u32 flags, u8 state)
+{
+	struct ti_sci_msg_req_set_clock_state req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.dev_id = dev_id;
+	if (clk_id < 255) {
+		req.clk_id = clk_id;
+	} else {
+		req.clk_id = 255;
+		req.clk_id_32 = clk_id;
+	}
+	req.request_state = state;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CLOCK_STATE,
+			     flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_get_clock_state() - Get clock state helper
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @programmed_state:	State requested for clock to move to
+ * @current_state:	State that the clock is currently in
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
+				      u32 dev_id, u32 clk_id,
+				      u8 *programmed_state, u8 *current_state)
+{
+	struct ti_sci_msg_req_get_clock_state req;
+	struct ti_sci_msg_resp_get_clock_state resp;
+	int ret = 0;
+
+	if (!programmed_state && !current_state)
+		return -EINVAL;
+
+	req.dev_id = dev_id;
+	if (clk_id < 255) {
+		req.clk_id = clk_id;
+	} else {
+		req.clk_id = 255;
+		req.clk_id_32 = clk_id;
+	}
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_CLOCK_STATE,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	if (programmed_state)
+		*programmed_state = resp.programmed_state;
+	if (current_state)
+		*current_state = resp.current_state;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_get_clock() - Get control of a clock from TI SCI
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @needs_ssc: 'true' if Spread Spectrum clock is desired, else 'false'
+ * @can_change_freq: 'true' if frequency change is desired, else 'false'
+ * @enable_input_term: 'true' if input termination is desired, else 'false'
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_get_clock(const struct ti_sci_handle *handle, u32 dev_id,
+				u32 clk_id, bool needs_ssc,
+				bool can_change_freq, bool enable_input_term)
+{
+	u32 flags = 0;
+
+	flags |= needs_ssc ? MSG_FLAG_CLOCK_ALLOW_SSC : 0;
+	flags |= can_change_freq ? MSG_FLAG_CLOCK_ALLOW_FREQ_CHANGE : 0;
+	flags |= enable_input_term ? MSG_FLAG_CLOCK_INPUT_TERM : 0;
+
+	return ti_sci_set_clock_state(handle, dev_id, clk_id, flags,
+				      MSG_CLOCK_SW_STATE_REQ);
+}
+
+/**
+ * ti_sci_cmd_idle_clock() - Idle a clock which is in our control
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ *
+ * NOTE: This clock must have been requested by get_clock previously.
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_idle_clock(const struct ti_sci_handle *handle,
+				 u32 dev_id, u32 clk_id)
+{
+	return ti_sci_set_clock_state(handle, dev_id, clk_id,
+				      MSG_FLAG_CLOCK_ALLOW_FREQ_CHANGE,
+				      MSG_CLOCK_SW_STATE_UNREQ);
+}
+
+/**
+ * ti_sci_cmd_put_clock() - Release a clock from our control back to TISCI
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ *
+ * NOTE: This clock must have been requested by get_clock previously.
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_put_clock(const struct ti_sci_handle *handle,
+				u32 dev_id, u32 clk_id)
+{
+	return ti_sci_set_clock_state(handle, dev_id, clk_id,
+				      MSG_FLAG_CLOCK_ALLOW_FREQ_CHANGE,
+				      MSG_CLOCK_SW_STATE_AUTO);
+}
+
+/**
+ * ti_sci_cmd_clk_is_auto() - Is the clock being auto managed
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @req_state: state indicating if the clock is auto managed
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_clk_is_auto(const struct ti_sci_handle *handle,
+				  u32 dev_id, u32 clk_id, bool *req_state)
+{
+	u8 state = 0;
+	int ret;
+
+	if (!req_state)
+		return -EINVAL;
+
+	ret = ti_sci_cmd_get_clock_state(handle, dev_id, clk_id, &state, NULL);
+	if (ret)
+		return ret;
+
+	*req_state = (state == MSG_CLOCK_SW_STATE_AUTO);
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_clk_is_on() - Is the clock ON
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @req_state: state indicating if the clock is managed by us and enabled
+ * @curr_state: state indicating if the clock is ready for operation
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_clk_is_on(const struct ti_sci_handle *handle, u32 dev_id,
+				u32 clk_id, bool *req_state, bool *curr_state)
+{
+	u8 c_state = 0, r_state = 0;
+	int ret;
+
+	if (!req_state && !curr_state)
+		return -EINVAL;
+
+	ret = ti_sci_cmd_get_clock_state(handle, dev_id, clk_id,
+					 &r_state, &c_state);
+	if (ret)
+		return ret;
+
+	if (req_state)
+		*req_state = (r_state == MSG_CLOCK_SW_STATE_REQ);
+	if (curr_state)
+		*curr_state = (c_state == MSG_CLOCK_HW_STATE_READY);
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_clk_is_off() - Is the clock OFF
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @req_state: state indicating if the clock is managed by us and disabled
+ * @curr_state: state indicating if the clock is NOT ready for operation
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_clk_is_off(const struct ti_sci_handle *handle, u32 dev_id,
+				 u32 clk_id, bool *req_state, bool *curr_state)
+{
+	u8 c_state = 0, r_state = 0;
+	int ret;
+
+	if (!req_state && !curr_state)
+		return -EINVAL;
+
+	ret = ti_sci_cmd_get_clock_state(handle, dev_id, clk_id,
+					 &r_state, &c_state);
+	if (ret)
+		return ret;
+
+	if (req_state)
+		*req_state = (r_state == MSG_CLOCK_SW_STATE_UNREQ);
+	if (curr_state)
+		*curr_state = (c_state == MSG_CLOCK_HW_STATE_NOT_READY);
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_clk_set_parent() - Set the clock source of a specific device clock
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @parent_id:	Parent clock identifier to set
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
+				     u32 dev_id, u32 clk_id, u32 parent_id)
+{
+	struct ti_sci_msg_req_set_clock_parent req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.dev_id = dev_id;
+	if (clk_id < 255) {
+		req.clk_id = clk_id;
+	} else {
+		req.clk_id = 255;
+		req.clk_id_32 = clk_id;
+	}
+	if (parent_id < 255) {
+		req.parent_id = parent_id;
+	} else {
+		req.parent_id = 255;
+		req.parent_id_32 = parent_id;
+	}
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CLOCK_PARENT,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_clk_get_parent() - Get current parent clock source
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @parent_id:	Current clock parent
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
+				     u32 dev_id, u32 clk_id, u32 *parent_id)
+{
+	struct ti_sci_msg_req_get_clock_parent req;
+	struct ti_sci_msg_resp_get_clock_parent resp;
+	int ret = 0;
+
+	if (!parent_id)
+		return -EINVAL;
+
+	req.dev_id = dev_id;
+	if (clk_id < 255) {
+		req.clk_id = clk_id;
+	} else {
+		req.clk_id = 255;
+		req.clk_id_32 = clk_id;
+	}
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_CLOCK_PARENT,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	if (resp.parent_id < 255)
+		*parent_id = resp.parent_id;
+	else
+		*parent_id = resp.parent_id_32;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_clk_get_num_parents() - Get num parents of the current clk source
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @num_parents: Returns he number of parents to the current clock.
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
+					  u32 dev_id, u32 clk_id,
+					  u32 *num_parents)
+{
+	struct ti_sci_msg_req_get_clock_num_parents req;
+	struct ti_sci_msg_resp_get_clock_num_parents resp;
+	int ret = 0;
+
+	if (!num_parents)
+		return -EINVAL;
+
+	req.dev_id = dev_id;
+	if (clk_id < 255) {
+		req.clk_id = clk_id;
+	} else {
+		req.clk_id = 255;
+		req.clk_id_32 = clk_id;
+	}
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_NUM_CLOCK_PARENTS,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	if (resp.num_parents < 255)
+		*num_parents = resp.num_parents;
+	else
+		*num_parents = resp.num_parents_32;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_clk_get_match_freq() - Find a good match for frequency
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @min_freq:	The minimum allowable frequency in Hz. This is the minimum
+ *		allowable programmed frequency and does not account for clock
+ *		tolerances and jitter.
+ * @target_freq: The target clock frequency in Hz. A frequency will be
+ *		processed as close to this target frequency as possible.
+ * @max_freq:	The maximum allowable frequency in Hz. This is the maximum
+ *		allowable programmed frequency and does not account for clock
+ *		tolerances and jitter.
+ * @match_freq:	Frequency match in Hz response.
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
+					 u32 dev_id, u32 clk_id, u64 min_freq,
+					 u64 target_freq, u64 max_freq,
+					 u64 *match_freq)
+{
+	struct ti_sci_msg_req_query_clock_freq req;
+	struct ti_sci_msg_resp_query_clock_freq resp;
+	int ret = 0;
+
+	if (!match_freq)
+		return -EINVAL;
+
+	req.dev_id = dev_id;
+	if (clk_id < 255) {
+		req.clk_id = clk_id;
+	} else {
+		req.clk_id = 255;
+		req.clk_id_32 = clk_id;
+	}
+	req.min_freq_hz = min_freq;
+	req.target_freq_hz = target_freq;
+	req.max_freq_hz = max_freq;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_QUERY_CLOCK_FREQ,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	*match_freq = resp.freq_hz;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_clk_set_freq() - Set a frequency for clock
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @min_freq:	The minimum allowable frequency in Hz. This is the minimum
+ *		allowable programmed frequency and does not account for clock
+ *		tolerances and jitter.
+ * @target_freq: The target clock frequency in Hz. A frequency will be
+ *		processed as close to this target frequency as possible.
+ * @max_freq:	The maximum allowable frequency in Hz. This is the maximum
+ *		allowable programmed frequency and does not account for clock
+ *		tolerances and jitter.
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
+				   u32 dev_id, u32 clk_id, u64 min_freq,
+				   u64 target_freq, u64 max_freq)
+{
+	struct ti_sci_msg_req_set_clock_freq req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.dev_id = dev_id;
+	if (clk_id < 255) {
+		req.clk_id = clk_id;
+	} else {
+		req.clk_id = 255;
+		req.clk_id_32 = clk_id;
+	}
+	req.min_freq_hz = min_freq;
+	req.target_freq_hz = target_freq;
+	req.max_freq_hz = max_freq;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CLOCK_FREQ,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_clk_get_freq() - Get current frequency
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @freq:	Currently frequency in Hz
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
+				   u32 dev_id, u32 clk_id, u64 *freq)
+{
+	struct ti_sci_msg_req_get_clock_freq req;
+	struct ti_sci_msg_resp_get_clock_freq resp;
+	int ret = 0;
+
+	if (!freq)
+		return -EINVAL;
+
+	req.dev_id = dev_id;
+	if (clk_id < 255) {
+		req.clk_id = clk_id;
+	} else {
+		req.clk_id = 255;
+		req.clk_id_32 = clk_id;
+	}
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_CLOCK_FREQ,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	*freq = resp.freq_hz;
+
+	return 0;
+}
+
+/*
+ * ti_sci_setup_clock_ops() - Setup the clock operations structures
+ * @cops:	pointer to TISCI clock operations structure
+ */
+void ti_sci_setup_clock_ops(struct ti_sci_clk_ops *cops)
+{
+	cops->get_clock = ti_sci_cmd_get_clock;
+	cops->idle_clock = ti_sci_cmd_idle_clock;
+	cops->put_clock = ti_sci_cmd_put_clock;
+	cops->is_auto = ti_sci_cmd_clk_is_auto;
+	cops->is_on = ti_sci_cmd_clk_is_on;
+	cops->is_off = ti_sci_cmd_clk_is_off;
+
+	cops->set_parent = ti_sci_cmd_clk_set_parent;
+	cops->get_parent = ti_sci_cmd_clk_get_parent;
+	cops->get_num_parents = ti_sci_cmd_clk_get_num_parents;
+
+	cops->get_best_match_freq = ti_sci_cmd_clk_get_match_freq;
+	cops->set_freq = ti_sci_cmd_clk_set_freq;
+	cops->get_freq = ti_sci_cmd_clk_get_freq;
+}
diff --git a/drivers/firmware/ti/ti_sci_core.c b/drivers/firmware/ti/ti_sci_core.c
index e98bf3c5f9dc1..848c040f598e0 100644
--- a/drivers/firmware/ti/ti_sci_core.c
+++ b/drivers/firmware/ti/ti_sci_core.c
@@ -565,525 +565,6 @@ static int ti_sci_cmd_get_revision(struct ti_sci_info *info)
 	return 0;
 }
 
-/**
- * ti_sci_set_clock_state() - Set clock state helper
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- * @flags:	Header flags as needed
- * @state:	State to request for the clock.
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
-				  u32 dev_id, u32 clk_id,
-				  u32 flags, u8 state)
-{
-	struct ti_sci_msg_req_set_clock_state req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.dev_id = dev_id;
-	if (clk_id < 255) {
-		req.clk_id = clk_id;
-	} else {
-		req.clk_id = 255;
-		req.clk_id_32 = clk_id;
-	}
-	req.request_state = state;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CLOCK_STATE,
-			     flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_get_clock_state() - Get clock state helper
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- * @programmed_state:	State requested for clock to move to
- * @current_state:	State that the clock is currently in
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
-				      u32 dev_id, u32 clk_id,
-				      u8 *programmed_state, u8 *current_state)
-{
-	struct ti_sci_msg_req_get_clock_state req;
-	struct ti_sci_msg_resp_get_clock_state resp;
-	int ret = 0;
-
-	if (!programmed_state && !current_state)
-		return -EINVAL;
-
-	req.dev_id = dev_id;
-	if (clk_id < 255) {
-		req.clk_id = clk_id;
-	} else {
-		req.clk_id = 255;
-		req.clk_id_32 = clk_id;
-	}
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_CLOCK_STATE,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	if (programmed_state)
-		*programmed_state = resp.programmed_state;
-	if (current_state)
-		*current_state = resp.current_state;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_get_clock() - Get control of a clock from TI SCI
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- * @needs_ssc: 'true' if Spread Spectrum clock is desired, else 'false'
- * @can_change_freq: 'true' if frequency change is desired, else 'false'
- * @enable_input_term: 'true' if input termination is desired, else 'false'
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_get_clock(const struct ti_sci_handle *handle, u32 dev_id,
-				u32 clk_id, bool needs_ssc,
-				bool can_change_freq, bool enable_input_term)
-{
-	u32 flags = 0;
-
-	flags |= needs_ssc ? MSG_FLAG_CLOCK_ALLOW_SSC : 0;
-	flags |= can_change_freq ? MSG_FLAG_CLOCK_ALLOW_FREQ_CHANGE : 0;
-	flags |= enable_input_term ? MSG_FLAG_CLOCK_INPUT_TERM : 0;
-
-	return ti_sci_set_clock_state(handle, dev_id, clk_id, flags,
-				      MSG_CLOCK_SW_STATE_REQ);
-}
-
-/**
- * ti_sci_cmd_idle_clock() - Idle a clock which is in our control
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- *
- * NOTE: This clock must have been requested by get_clock previously.
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_idle_clock(const struct ti_sci_handle *handle,
-				 u32 dev_id, u32 clk_id)
-{
-	return ti_sci_set_clock_state(handle, dev_id, clk_id,
-				      MSG_FLAG_CLOCK_ALLOW_FREQ_CHANGE,
-				      MSG_CLOCK_SW_STATE_UNREQ);
-}
-
-/**
- * ti_sci_cmd_put_clock() - Release a clock from our control back to TISCI
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- *
- * NOTE: This clock must have been requested by get_clock previously.
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_put_clock(const struct ti_sci_handle *handle,
-				u32 dev_id, u32 clk_id)
-{
-	return ti_sci_set_clock_state(handle, dev_id, clk_id,
-				      MSG_FLAG_CLOCK_ALLOW_FREQ_CHANGE,
-				      MSG_CLOCK_SW_STATE_AUTO);
-}
-
-/**
- * ti_sci_cmd_clk_is_auto() - Is the clock being auto managed
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- * @req_state: state indicating if the clock is auto managed
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_clk_is_auto(const struct ti_sci_handle *handle,
-				  u32 dev_id, u32 clk_id, bool *req_state)
-{
-	u8 state = 0;
-	int ret;
-
-	if (!req_state)
-		return -EINVAL;
-
-	ret = ti_sci_cmd_get_clock_state(handle, dev_id, clk_id, &state, NULL);
-	if (ret)
-		return ret;
-
-	*req_state = (state == MSG_CLOCK_SW_STATE_AUTO);
-	return 0;
-}
-
-/**
- * ti_sci_cmd_clk_is_on() - Is the clock ON
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- * @req_state: state indicating if the clock is managed by us and enabled
- * @curr_state: state indicating if the clock is ready for operation
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_clk_is_on(const struct ti_sci_handle *handle, u32 dev_id,
-				u32 clk_id, bool *req_state, bool *curr_state)
-{
-	u8 c_state = 0, r_state = 0;
-	int ret;
-
-	if (!req_state && !curr_state)
-		return -EINVAL;
-
-	ret = ti_sci_cmd_get_clock_state(handle, dev_id, clk_id,
-					 &r_state, &c_state);
-	if (ret)
-		return ret;
-
-	if (req_state)
-		*req_state = (r_state == MSG_CLOCK_SW_STATE_REQ);
-	if (curr_state)
-		*curr_state = (c_state == MSG_CLOCK_HW_STATE_READY);
-	return 0;
-}
-
-/**
- * ti_sci_cmd_clk_is_off() - Is the clock OFF
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- * @req_state: state indicating if the clock is managed by us and disabled
- * @curr_state: state indicating if the clock is NOT ready for operation
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_clk_is_off(const struct ti_sci_handle *handle, u32 dev_id,
-				 u32 clk_id, bool *req_state, bool *curr_state)
-{
-	u8 c_state = 0, r_state = 0;
-	int ret;
-
-	if (!req_state && !curr_state)
-		return -EINVAL;
-
-	ret = ti_sci_cmd_get_clock_state(handle, dev_id, clk_id,
-					 &r_state, &c_state);
-	if (ret)
-		return ret;
-
-	if (req_state)
-		*req_state = (r_state == MSG_CLOCK_SW_STATE_UNREQ);
-	if (curr_state)
-		*curr_state = (c_state == MSG_CLOCK_HW_STATE_NOT_READY);
-	return 0;
-}
-
-/**
- * ti_sci_cmd_clk_set_parent() - Set the clock source of a specific device clock
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- * @parent_id:	Parent clock identifier to set
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
-				     u32 dev_id, u32 clk_id, u32 parent_id)
-{
-	struct ti_sci_msg_req_set_clock_parent req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.dev_id = dev_id;
-	if (clk_id < 255) {
-		req.clk_id = clk_id;
-	} else {
-		req.clk_id = 255;
-		req.clk_id_32 = clk_id;
-	}
-	if (parent_id < 255) {
-		req.parent_id = parent_id;
-	} else {
-		req.parent_id = 255;
-		req.parent_id_32 = parent_id;
-	}
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CLOCK_PARENT,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_clk_get_parent() - Get current parent clock source
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- * @parent_id:	Current clock parent
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
-				     u32 dev_id, u32 clk_id, u32 *parent_id)
-{
-	struct ti_sci_msg_req_get_clock_parent req;
-	struct ti_sci_msg_resp_get_clock_parent resp;
-	int ret = 0;
-
-	if (!parent_id)
-		return -EINVAL;
-
-	req.dev_id = dev_id;
-	if (clk_id < 255) {
-		req.clk_id = clk_id;
-	} else {
-		req.clk_id = 255;
-		req.clk_id_32 = clk_id;
-	}
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_CLOCK_PARENT,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	if (resp.parent_id < 255)
-		*parent_id = resp.parent_id;
-	else
-		*parent_id = resp.parent_id_32;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_clk_get_num_parents() - Get num parents of the current clk source
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- * @num_parents: Returns he number of parents to the current clock.
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
-					  u32 dev_id, u32 clk_id,
-					  u32 *num_parents)
-{
-	struct ti_sci_msg_req_get_clock_num_parents req;
-	struct ti_sci_msg_resp_get_clock_num_parents resp;
-	int ret = 0;
-
-	if (!num_parents)
-		return -EINVAL;
-
-	req.dev_id = dev_id;
-	if (clk_id < 255) {
-		req.clk_id = clk_id;
-	} else {
-		req.clk_id = 255;
-		req.clk_id_32 = clk_id;
-	}
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_NUM_CLOCK_PARENTS,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	if (resp.num_parents < 255)
-		*num_parents = resp.num_parents;
-	else
-		*num_parents = resp.num_parents_32;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_clk_get_match_freq() - Find a good match for frequency
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- * @min_freq:	The minimum allowable frequency in Hz. This is the minimum
- *		allowable programmed frequency and does not account for clock
- *		tolerances and jitter.
- * @target_freq: The target clock frequency in Hz. A frequency will be
- *		processed as close to this target frequency as possible.
- * @max_freq:	The maximum allowable frequency in Hz. This is the maximum
- *		allowable programmed frequency and does not account for clock
- *		tolerances and jitter.
- * @match_freq:	Frequency match in Hz response.
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
-					 u32 dev_id, u32 clk_id, u64 min_freq,
-					 u64 target_freq, u64 max_freq,
-					 u64 *match_freq)
-{
-	struct ti_sci_msg_req_query_clock_freq req;
-	struct ti_sci_msg_resp_query_clock_freq resp;
-	int ret = 0;
-
-	if (!match_freq)
-		return -EINVAL;
-
-	req.dev_id = dev_id;
-	if (clk_id < 255) {
-		req.clk_id = clk_id;
-	} else {
-		req.clk_id = 255;
-		req.clk_id_32 = clk_id;
-	}
-	req.min_freq_hz = min_freq;
-	req.target_freq_hz = target_freq;
-	req.max_freq_hz = max_freq;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_QUERY_CLOCK_FREQ,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	*match_freq = resp.freq_hz;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_clk_set_freq() - Set a frequency for clock
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- * @min_freq:	The minimum allowable frequency in Hz. This is the minimum
- *		allowable programmed frequency and does not account for clock
- *		tolerances and jitter.
- * @target_freq: The target clock frequency in Hz. A frequency will be
- *		processed as close to this target frequency as possible.
- * @max_freq:	The maximum allowable frequency in Hz. This is the maximum
- *		allowable programmed frequency and does not account for clock
- *		tolerances and jitter.
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
-				   u32 dev_id, u32 clk_id, u64 min_freq,
-				   u64 target_freq, u64 max_freq)
-{
-	struct ti_sci_msg_req_set_clock_freq req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.dev_id = dev_id;
-	if (clk_id < 255) {
-		req.clk_id = clk_id;
-	} else {
-		req.clk_id = 255;
-		req.clk_id_32 = clk_id;
-	}
-	req.min_freq_hz = min_freq;
-	req.target_freq_hz = target_freq;
-	req.max_freq_hz = max_freq;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CLOCK_FREQ,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_clk_get_freq() - Get current frequency
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- * @freq:	Currently frequency in Hz
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
-				   u32 dev_id, u32 clk_id, u64 *freq)
-{
-	struct ti_sci_msg_req_get_clock_freq req;
-	struct ti_sci_msg_resp_get_clock_freq resp;
-	int ret = 0;
-
-	if (!freq)
-		return -EINVAL;
-
-	req.dev_id = dev_id;
-	if (clk_id < 255) {
-		req.clk_id = clk_id;
-	} else {
-		req.clk_id = 255;
-		req.clk_id_32 = clk_id;
-	}
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_CLOCK_FREQ,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	*freq = resp.freq_hz;
-
-	return 0;
-}
-
 /**
  * ti_sci_cmd_prepare_sleep() - Prepare system for system suspend
  * @handle:		pointer to TI SCI handle
@@ -2223,21 +1704,7 @@ static void ti_sci_setup_ops(struct ti_sci_info *info)
 	struct ti_sci_proc_ops *pops = &ops->proc_ops;
 
 	ti_sci_setup_device_ops(dops);
-
-	cops->get_clock = ti_sci_cmd_get_clock;
-	cops->idle_clock = ti_sci_cmd_idle_clock;
-	cops->put_clock = ti_sci_cmd_put_clock;
-	cops->is_auto = ti_sci_cmd_clk_is_auto;
-	cops->is_on = ti_sci_cmd_clk_is_on;
-	cops->is_off = ti_sci_cmd_clk_is_off;
-
-	cops->set_parent = ti_sci_cmd_clk_set_parent;
-	cops->get_parent = ti_sci_cmd_clk_get_parent;
-	cops->get_num_parents = ti_sci_cmd_clk_get_num_parents;
-
-	cops->get_best_match_freq = ti_sci_cmd_clk_get_match_freq;
-	cops->set_freq = ti_sci_cmd_clk_set_freq;
-	cops->get_freq = ti_sci_cmd_clk_get_freq;
+	ti_sci_setup_clock_ops(cops);
 
 	if (info->fw_caps & MSG_FLAG_CAPS_LPM_DM_MANAGED) {
 		pr_debug("detected DM managed LPM in fw_caps\n");
-- 
2.34.1

