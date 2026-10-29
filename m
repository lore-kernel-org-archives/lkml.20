Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793297644;
	b=LailKP95+yomWSEVG3Fi2LsLTc21PDtp3jPpXQ7MY9Ldhp1Ft/7AyAGa6onu8PzQVhPA
	 nUkq3TVsBv+HMJWW8sfBSK5BFKDrHxHdvzMIfF69bWGjJ+Ngfetl4HP2p8R0HDoLYw5Qt
	 hy/vHKppCyCVaMGKtn4EL+vVKiSDi6GA802XwGDmsZglZ5LvJj0JCIdQHDyxmtz4DfFAW
	 nAWtznX0Ig6Uosaz7gRpfdYRxcijNebxaLZOfmRk2pq+5NP4xJu9lrWzIN5DckusDacIe
	 D8jlPbc7dRjFmykz2Jv2e64K8Dz0cxAs4MIkXrHmM1RA7zswQrUh+O9HwL4E5/VFphg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297644;
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
	bh=nDOA+DT8u8fEkoNbcxGkEsoSsHTsAcRfSqj9z4gw6tQ=;
	b=v9WccEkI44lOeh100WJDCjZzwi4M15YH5HlGDcHZGGOBAxoAvvJapjlKdMt4nsRPQYAY
	 F+MA7giSwqIQP2IJ6F0zD4RInUstb5JMnRGFXLgHloZ2mpup4EenKGhO/DGfU8qOxTdpM
	 /fQem1ZqDUsZbKK78uyB6tA3Plg+fKrWy1MAP0l5mbsHVyY0XcaawUZRtXekZkCZsbIOj
	 xxWzPVAPITT5DtDbsmq4WT6xKrT7OR+d0cTw0omB45hHcTcJPo6jE4MeVI7EZkor5GHRX
	 xJGkvLnBMY+Zr8szxL6YLFjcB/gf1AXSOVQgwQSD4ax+x8QoCjgeuD2JLL5G06exw+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=QUX2Fqtd;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=SuDy4tGJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4302606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4302606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=QUX2Fqtd;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=SuDy4tGJ
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69TGDTgU1079057;
	Thu, 29 Oct 2026 13:13:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=nDOA+DT8u8fEkoNbcxGkEsoSsHTsAcRfSqj9z4gw6
	tQ=; b=QUX2Fqtd3YNG5WJ6FF1XJuiDIHm/lrVHZD9DnP2fh6/SWqlbfz7yW+2NQ
	i1IEZ+2X9f2V1GkRNBQ5ks+ab57NMfwgRS1kmAQ80v7CxQOHdZ21yIhOBuXyJRwv
	bMmQUDMi5iboJiKDwZS+AmwH4VTm4NO1wqfQaxWz5gMJ0Ly9dnywYQP72K2XCgph
	9TIJS4r3MMKn28Nd8OI+PcHh/T50oAvilH0PMfgZkSclWUh6KBe0mUyuEVs1viQo
	/QllpPucL+f1gFWpNgfNZ76LWR4xhpGrTqqlc0isz92K3vtcBPJRFjPOUJTpVQa2
	QVhQyFpLbg/zMr0DgUTqVmpwaf4oA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011026.outbound.protection.outlook.com [40.107.208.26])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hkurvxau2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Oct 2026 13:13:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fyLPPny6ERcmVEPvBCeRquB/weWrlx7UfKzwQsxgyLQSrpZYTnhUu9eUnWoiK0WVTV5wrDhJEdYhmg7LtcUzXg7WfbVfoif8zhu3Za0IlAScV7Pm6hsqvVh+bLaK6Qa6VwmMXy4mXDYmoGPf/OLuDISJZ0LxZ75UsIIgtRqHbqt9gfFT/xBRh5jXaJg2FclTztfs/xblj/1VriHOafwd0y4wRv7V5I9MsgwHlBsODx4l7aVzeznW56VzmLQurd8WUEJPbj+Uf4wyU2aDE9tz6TzQzoEz8HwMBhbOfUk2fBnRnfZIZRbg5rQIP4xQ0Q2bkZM3w3ZPVE3o1kYesNYlXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nDOA+DT8u8fEkoNbcxGkEsoSsHTsAcRfSqj9z4gw6tQ=;
 b=XBwi0ECWoz78CLXi8jSEUcY4a+MVq4lVgoL+6d33s51xZBdoskZUDTnMLVBjj+pBxXLm3Lx4rRN8u2BDM4cEkXXiXVzRykDZLd+TG6N8Z1VgUMNithUHztRLMnaHNTGFsGJlTFeG5y6v6aql+CM1DQDDrgdoTkSPQYkSSxWWnyFyvaj3VhWEQem7LDsrg+Lnr/0/qZgTkjs68qdgSPvLJN8Wz3KVVY2BDliGz4GA8U8Mu6Hg+FMCMI+PcThWwZ43XktvEDCbauLeqvedK1h2eKRNbhp4cX9I5soLYIcE2fh7kLcN3KcO7bYDsbT2UN8uWYNxnvdPWz2G7L3agfPPJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDOA+DT8u8fEkoNbcxGkEsoSsHTsAcRfSqj9z4gw6tQ=;
 b=SuDy4tGJL5QoqinX6rmpgeX4yIhdKCtAiJ+HeReBJo5WwvBbPhvcKhIBmv0/6+JNoq1QpOyCVMqJ3bmGFemalW0Pkaw9nwUNCX3ie5EA56/XrK8fVNcFQ/aiIdfMkPufvwxIQNv/Nw8ZvIpSvN298dRV61PYstt6eKPhQ0/eTDA=
Received: from MN2PR15CA0056.namprd15.prod.outlook.com (2603:10b6:208:237::25)
 by DS0PR10MB7512.namprd10.prod.outlook.com (2603:10b6:8:165::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 18:13:49 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:208:237:cafe::47) by MN2PR15CA0056.outlook.office365.com
 (2603:10b6:208:237::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Thu,
 29 Oct 2026 18:13:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 18:13:48 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:12:53 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 13:12:53 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 29 Oct 2026 13:12:53 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69TIBmMK3408718;
	Thu, 29 Oct 2026 13:12:50 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v3 20/22] firmware: ti: ti_sci_pm: Move pm ops into its own file
Date: Thu, 29 Oct 2026 23:41:45 +0530
Message-ID: <20261029181147.266771-21-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC0:EE_|DS0PR10MB7512:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f735c18-dea0-4f19-bb1b-08df35e860ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|56012099006|261009221227099003|261009223027099003|261026140227099003|261026121527099003|261028144727099003|10067099003|261022113327099003|261022105027099003|261022075727099003|261021135927099003|261021123027099003|261021121427099003|18002099003|22082099003|6133799003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info:
	r3lshcyBvpiUO4u+n+7KCuPpCbsOIvrJnarbnE96M8ULr8glVLdmzW83hWmZEOMypIpy4VPkzcRMb5yoGkNE3rfREMrb4nlhxAH4F878XqyewVvyNXu1ghueXB63hUMfwMkqRUj7XkAHOkDWRdzIhB8iEpVMyVmPWWv7yCa2zpXQDCnkBQ4VU6oNCXlZBQb+8fyhIGpfbDJ5/uRy7+bnyw+jIT9WWXm2F1+eXxTT6NeBVUBe20Ezf1hOBrLElX8Z/qwLJk8Janenf3CYR0t+yw9mqUt8xrA4B7os85Lcn8LRb/a4qlfzqRbn6Ob3/GQ7oOQVaDH2dZI+dhFENAhUWJapoiW7rZatBIgSBS/Y8tLHNqvGicR5/BjZI3AHyfutHppCgRWtDijEGtk3HRF9TYu/+nmJHxXfxJosLXA2FX1h3TWOyTygUHJod650FQrkT37ne9ZeYyeDImx5gYni+HC1v8OqH0sEO8llo4GsiAtf7dmU9be5ecZBWT1ZlcKuv1m76uJ9g6O7HW8vgBpdjj7UtHm/L1CqK5CCvQ8hcrrnAAztfjHtG8D84LpOFE8MGC+eWknV8arO/tyvJBG6NBS2qLabARCJ0sywTOZSFVxsP0ufJx7x6gxq8uXYzpqqbaQ7ZFj++xya1ELMe7T62g==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(56012099006)(261009221227099003)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(10067099003)(261022113327099003)(261022105027099003)(261022075727099003)(261021135927099003)(261021123027099003)(261021121427099003)(18002099003)(22082099003)(6133799003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4LyKb+FwvheBQyg5dqRBewv6dGO2hEK44oNJWVHpND0PZyCulUJ7thZiPfHLyhUFruGgPW/N/8egzm1B7gpu0x9FvI7VlEx6crJsOhBtFyzk6XaVAr399xdCPaX1abKGH76Mhnj0/gZS6MWDqTB+Q9b5zwQgrmw/NcsSI0qGemAOg+nFj00iy4ry0crVxhsokEKl24KrhLQyn7kwiEL2i0mms2uwlFzPvz1vi3kGUt1w5dPYnvpsA1XOdgZs6HmFIwPLrc/gh6RUfvT+ctoEuJoY5tvhdGrfzaheNnjzURRvmWKujZ2k3PPgoejNFKrxSSWmPsYXTMpeiac8SKsaju4VBd/+NvEpIbP9+RXW+6DTnoYIS9kAnaHq20HmQCbr28lcbHRcYvWJVJPUyG+AUrssg+70p8KYcqrjYtg1pnLIAtCIeK5a93MLuAywdA9B
X-Exchange-RoutingPolicyChecked:
	lGWNXfjjDKgnDdqhrHuiEqW+sBU4+Se721cevQTWVyM+vuBPvTaxkyOH986IQ7kjDVjVWfxRCcRUWX9iNgv+n5hc10M4eXJCGSB5TrAB8dfSjdXn0UKzvGGYzKXoKMWLPUxhTA0HYURoHvHFOZdlVK58EHgrFhxXGTPii21ejcXG9BvEzK71BbzAaGIIqwWy+ctl4YjjzYUDOSAqocv/M+HdPcdPgF62tQFqzR8BlyqBwI0iHYmhLdNjIPrM4lZ8K7xnOsY8JJ1jzaRItQgzdwWk5V0QWZU+4j14Be7mSPsIWejMZfF5S5vwWqOl5gWdsUpiZvboYIVrk8b6Xtrs1w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 18:13:48.0286
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f735c18-dea0-4f19-bb1b-08df35e860ba
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7512
X-Proofpoint-ORIG-GUID: Xgs7tI0WBFlv8wbnTbWuIs0iLDU08ab_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfX45Cv0gQlovkK
 8cyp3bXKfxLk2HwDCmjBWyginWY8e7js0JbwY4cZ84uOcER6ZA+5uZLRtl4/40xAqXkokzZgOyU
 t8hmciDFZvrUF4qpf+WWrrGQLKYN0Ts6bFXHcYQ6fU8huBO2BzcoFifA3kvCbQPlp61HWTamZtY
 y49Hb0lBieG9QUVnvVw8+fgPcRY1RQsLR/nVWEedAnku9GziGx21OLdu6Q7RlsBTaSxa1WbSlJz
 3yVYj8SQmhPthVJ9ylF3s8mW2k7AFKXgBBzT9tVi4sv1oTTnO+AN2cxJyUUb+puk1t8pvn4IVCm
 78MvNpW4lwbKOBwXhhYUTiLW9A2L9KRMBkn5bmh4uNU1dyH2CmAj9MsIhC9kkchf8BZK7cYLeqe
 ixAMSGp0DjJElPJV7jMtcQzInjiKs+YPc7+e58fSQuP0A76xDK7g1rpH4xcUTTv7yVe/lC6ZpaV
 Hh8FdBD8R0DJWMcMjbQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MSBTYWx0ZWRfX9WHXbQzrpjdN
 oHjx+sKpgicVRMLh/aWxzZ9fvzsbA4cVLTt2o/xINEl52FymSiQC4cAudjtTJrwABBEYcHqbg8U
 7/FAjON2RQVdXD3qXmtYJXkUhq4LX4k=
X-Proofpoint-GUID: Xgs7tI0WBFlv8wbnTbWuIs0iLDU08ab_
X-Authority-Analysis: v=2.4 cv=DtrDa2/+ c=1 sm=1 tr=0 ts=6ae38ce7 cx=c_pps
 a=uRIsUzfalb69z9iYDTnHFQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=WEwl4rP8Zldr9B4kZuwA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290071

From: Andrew Davis <afd@ti.com>

Extract the power management operations related functions and services
from ti_sci_core.c into its own file. This breaks down the single
large file into smaller logical files for better readability and
maintenance.

The pm ops need access to the TI SCI instance to get the device used for
error reporting. Move struct ti_sci_xfer, struct ti_sci_xfers_info,
struct ti_sci_desc, struct ti_sci_info and handle_to_ti_sci_info() from
ti_sci_core.c into ti_sci.h, along with the includes they need, so that
they can be shared with the split files. Upcoming splits also need
access to the instance state, so this is done once here.

Signed-off-by: Andrew Davis <afd@ti.com>
Co-developed-by: Beleswar Padhi <b-padhi@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v3: Changelog:
1. Correct API name in dev_err() string for
ti_sci_cmd_set_latency_constraint(). [Kendall]

Link to v2:
https://lore.kernel.org/all/20260930160607.2674980-21-b-padhi@ti.com/

v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-21-b-padhi@ti.com/

 drivers/firmware/ti/Makefile      |   1 +
 drivers/firmware/ti/ti_sci.h      | 100 ++++++++++++++
 drivers/firmware/ti/ti_sci_core.c | 220 +-----------------------------
 drivers/firmware/ti/ti_sci_pm.c   | 145 ++++++++++++++++++++
 4 files changed, 247 insertions(+), 219 deletions(-)
 create mode 100644 drivers/firmware/ti/ti_sci_pm.c

diff --git a/drivers/firmware/ti/Makefile b/drivers/firmware/ti/Makefile
index c4233542ad57d..bbfe73587a3c7 100644
--- a/drivers/firmware/ti/Makefile
+++ b/drivers/firmware/ti/Makefile
@@ -3,4 +3,5 @@
 ti_sci-y			:= ti_sci_core.o
 ti_sci-y			+= ti_sci_clock.o
 ti_sci-y			+= ti_sci_device.o
+ti_sci-y			+= ti_sci_pm.o
 obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
diff --git a/drivers/firmware/ti/ti_sci.h b/drivers/firmware/ti/ti_sci.h
index cce59cac35ed6..7a707c632276e 100644
--- a/drivers/firmware/ti/ti_sci.h
+++ b/drivers/firmware/ti/ti_sci.h
@@ -13,8 +13,107 @@
 #define __TI_SCI_H
 
 #include <linux/compiler_types.h>
+#include <linux/completion.h>
+#include <linux/container_of.h>
+#include <linux/hashtable.h>
+#include <linux/mailbox_client.h>
+#include <linux/mutex.h>
+#include <linux/semaphore.h>
+#include <linux/soc/ti/ti-msgmgr.h>
+#include <linux/soc/ti/ti_sci_protocol.h>
+#include <linux/spinlock.h>
 #include <linux/types.h>
 
+/**
+ * struct ti_sci_xfer - Structure representing a message flow
+ * @tx_message:	Transmit message
+ * @rx_buf:	Pointer to store received message
+ * @rx_len:	Receive message length
+ * @done:	completion event
+ */
+struct ti_sci_xfer {
+	struct ti_msgmgr_message tx_message;
+	void *rx_buf;
+	u8 rx_len;
+	struct completion done;
+};
+
+/**
+ * struct ti_sci_xfers_info - Structure to manage transfer information
+ * @sem_xfer_count:	Counting Semaphore for managing max simultaneous
+ *			Messages.
+ * @xfer_block:		Preallocated Message array
+ * @xfer_alloc_table:	Bitmap table for allocated messages.
+ *			Index of this bitmap table is also used for message
+ *			sequence identifier.
+ * @xfer_lock:		Protection for message allocation
+ */
+struct ti_sci_xfers_info {
+	struct semaphore sem_xfer_count;
+	struct ti_sci_xfer *xfer_block;
+	unsigned long *xfer_alloc_table;
+	/* protect transfer allocation */
+	spinlock_t xfer_lock;
+};
+
+/**
+ * struct ti_sci_desc - Description of SoC integration
+ * @default_host_id:	Host identifier representing the compute entity
+ * @max_rx_timeout_ms:	Timeout for communication with SoC (in Milliseconds)
+ * @max_msgs: Maximum number of messages that can be pending
+ *		  simultaneously in the system
+ * @max_msg_size: Maximum size of data per message that can be handled.
+ */
+struct ti_sci_desc {
+	u8 default_host_id;
+	int max_rx_timeout_ms;
+	int max_msgs;
+	int max_msg_size;
+};
+
+/**
+ * struct ti_sci_info - Structure representing a TI SCI instance
+ * @dev:	Device pointer
+ * @desc:	SoC description for this instance
+ * @d:		Debugfs file entry
+ * @debug_region: Memory region where the debug message are available
+ * @debug_region_size: Debug region size
+ * @debug_buffer: Buffer allocated to copy debug messages.
+ * @handle:	Instance of TI SCI handle to send to clients.
+ * @cl:		Mailbox Client
+ * @chan_tx:	Transmit mailbox channel
+ * @chan_rx:	Receive mailbox channel
+ * @minfo:	Message info
+ * @node:	list head
+ * @irqs:	List of allocated irqs
+ * @irq_lock:	Protection for irq hash list
+ * @host_id:	Host ID
+ * @fw_caps:	FW/SoC low power capabilities
+ * @users:	Number of users of this instance
+ */
+struct ti_sci_info {
+	struct device *dev;
+	const struct ti_sci_desc *desc;
+	struct dentry *d;
+	void __iomem *debug_region;
+	char *debug_buffer;
+	size_t debug_region_size;
+	struct ti_sci_handle handle;
+	struct mbox_client cl;
+	struct mbox_chan *chan_tx;
+	struct mbox_chan *chan_rx;
+	struct ti_sci_xfers_info minfo;
+	struct list_head node;
+	DECLARE_HASHTABLE(irqs, 8);
+	struct mutex irq_lock;
+	u8 host_id;
+	u64 fw_caps;
+	/* protected by ti_sci_list_mutex */
+	int users;
+};
+
+#define handle_to_ti_sci_info(h) container_of(h, struct ti_sci_info, handle)
+
 /* Generic Messages */
 #define TI_SCI_MSG_ENABLE_WDT	0x0000
 #define TI_SCI_MSG_WAKE_RESET	0x0001
@@ -1567,5 +1666,6 @@ int ti_sci_do_xfer(const struct ti_sci_handle *handle,
 
 void ti_sci_setup_device_ops(struct ti_sci_dev_ops *dops);
 void ti_sci_setup_clock_ops(struct ti_sci_clk_ops *cops);
+void ti_sci_setup_pm_ops(struct ti_sci_pm_ops *pmops);
 
 #endif /* __TI_SCI_H */
diff --git a/drivers/firmware/ti/ti_sci_core.c b/drivers/firmware/ti/ti_sci_core.c
index 848c040f598e0..60d0d64ac4ae8 100644
--- a/drivers/firmware/ti/ti_sci_core.c
+++ b/drivers/firmware/ti/ti_sci_core.c
@@ -13,11 +13,9 @@
 #include <linux/cpu.h>
 #include <linux/debugfs.h>
 #include <linux/export.h>
-#include <linux/hashtable.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
-#include <linux/mailbox_client.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
@@ -25,10 +23,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_qos.h>
 #include <linux/property.h>
-#include <linux/semaphore.h>
 #include <linux/slab.h>
-#include <linux/soc/ti/ti-msgmgr.h>
-#include <linux/soc/ti/ti_sci_protocol.h>
 #include <linux/suspend.h>
 #include <linux/sys_soc.h>
 #include <linux/reboot.h>
@@ -40,53 +35,6 @@ static LIST_HEAD(ti_sci_list);
 /* Protection for the entire list */
 static DEFINE_MUTEX(ti_sci_list_mutex);
 
-/**
- * struct ti_sci_xfer - Structure representing a message flow
- * @tx_message:	Transmit message
- * @rx_buf:	Pointer to store received message
- * @rx_len:	Receive message length
- * @done:	completion event
- */
-struct ti_sci_xfer {
-	struct ti_msgmgr_message tx_message;
-	void *rx_buf;
-	u8 rx_len;
-	struct completion done;
-};
-
-/**
- * struct ti_sci_xfers_info - Structure to manage transfer information
- * @sem_xfer_count:	Counting Semaphore for managing max simultaneous
- *			Messages.
- * @xfer_block:		Preallocated Message array
- * @xfer_alloc_table:	Bitmap table for allocated messages.
- *			Index of this bitmap table is also used for message
- *			sequence identifier.
- * @xfer_lock:		Protection for message allocation
- */
-struct ti_sci_xfers_info {
-	struct semaphore sem_xfer_count;
-	struct ti_sci_xfer *xfer_block;
-	unsigned long *xfer_alloc_table;
-	/* protect transfer allocation */
-	spinlock_t xfer_lock;
-};
-
-/**
- * struct ti_sci_desc - Description of SoC integration
- * @default_host_id:	Host identifier representing the compute entity
- * @max_rx_timeout_ms:	Timeout for communication with SoC (in Milliseconds)
- * @max_msgs: Maximum number of messages that can be pending
- *		  simultaneously in the system
- * @max_msg_size: Maximum size of data per message that can be handled.
- */
-struct ti_sci_desc {
-	u8 default_host_id;
-	int max_rx_timeout_ms;
-	int max_msgs;
-	int max_msg_size;
-};
-
 /**
  * struct ti_sci_irq - Description of allocated irqs
  * @node: Link to hash table
@@ -97,49 +45,7 @@ struct ti_sci_irq {
 	struct ti_sci_msg_req_manage_irq desc;
 };
 
-/**
- * struct ti_sci_info - Structure representing a TI SCI instance
- * @dev:	Device pointer
- * @desc:	SoC description for this instance
- * @d:		Debugfs file entry
- * @debug_region: Memory region where the debug message are available
- * @debug_region_size: Debug region size
- * @debug_buffer: Buffer allocated to copy debug messages.
- * @handle:	Instance of TI SCI handle to send to clients.
- * @cl:		Mailbox Client
- * @chan_tx:	Transmit mailbox channel
- * @chan_rx:	Receive mailbox channel
- * @minfo:	Message info
- * @node:	list head
- * @irqs:	List of allocated irqs
- * @irq_lock:	Protection for irq hash list
- * @host_id:	Host ID
- * @fw_caps:	FW/SoC low power capabilities
- * @users:	Number of users of this instance
- */
-struct ti_sci_info {
-	struct device *dev;
-	const struct ti_sci_desc *desc;
-	struct dentry *d;
-	void __iomem *debug_region;
-	char *debug_buffer;
-	size_t debug_region_size;
-	struct ti_sci_handle handle;
-	struct mbox_client cl;
-	struct mbox_chan *chan_tx;
-	struct mbox_chan *chan_rx;
-	struct ti_sci_xfers_info minfo;
-	struct list_head node;
-	DECLARE_HASHTABLE(irqs, 8);
-	struct mutex irq_lock;
-	u8 host_id;
-	u64 fw_caps;
-	/* protected by ti_sci_list_mutex */
-	int users;
-};
-
 #define cl_to_ti_sci_info(c)	container_of(c, struct ti_sci_info, cl)
-#define handle_to_ti_sci_info(h) container_of(h, struct ti_sci_info, handle)
 
 #ifdef CONFIG_DEBUG_FS
 
@@ -687,128 +593,6 @@ static int ti_sci_cmd_set_io_isolation(const struct ti_sci_handle *handle,
 	return 0;
 }
 
-/**
- * ti_sci_msg_cmd_lpm_wake_reason() - Get the wakeup source from LPM
- * @handle:		Pointer to TI SCI handle
- * @source:		The wakeup source that woke the SoC from LPM
- * @timestamp:		Timestamp of the wakeup event
- * @pin:		The pin that has triggered wake up
- * @mode:		The last entered low power mode
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
-					  u32 *source, u64 *timestamp, u8 *pin, u8 *mode)
-{
-	struct ti_sci_msg_hdr req;
-	struct ti_sci_msg_resp_lpm_wake_reason resp;
-	struct device *dev;
-	int ret = 0;
-
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
-	dev = handle_to_ti_sci_info(handle)->dev;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_LPM_WAKE_REASON,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret) {
-		dev_err(dev, "Failed to get wake reason\n");
-		return ret;
-	}
-
-	if (source)
-		*source = resp.wake_source;
-	if (timestamp)
-		*timestamp = resp.wake_timestamp;
-	if (pin)
-		*pin = resp.wake_pin;
-	if (mode)
-		*mode = resp.mode;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_set_device_constraint() - Set LPM constraint on behalf of a device
- * @handle:	pointer to TI SCI handle
- * @id:	Device identifier
- * @state:	The desired state of device constraint: set or clear
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
-					    u32 id, u8 state)
-{
-	struct ti_sci_msg_req_lpm_set_device_constraint req;
-	struct ti_sci_msg_hdr resp;
-	struct device *dev;
-	int ret = 0;
-
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
-	dev = handle_to_ti_sci_info(handle)->dev;
-
-	req.id = id;
-	req.state = state;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_LPM_SET_DEVICE_CONSTRAINT,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret) {
-		dev_err(dev, "Failed to set device constraint\n");
-		return ret;
-	}
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_set_latency_constraint() - Set LPM resume latency constraint
- * @handle:	pointer to TI SCI handle
- * @latency:	maximum acceptable latency (in ms) to wake up from LPM
- * @state:	The desired state of latency constraint: set or clear
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
-					     u16 latency, u8 state)
-{
-	struct ti_sci_msg_req_lpm_set_latency_constraint req;
-	struct ti_sci_msg_hdr resp;
-	struct device *dev;
-	int ret = 0;
-
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-	if (!handle)
-		return -EINVAL;
-
-	dev = handle_to_ti_sci_info(handle)->dev;
-
-	req.latency = latency;
-	req.state = state;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_LPM_SET_LATENCY_CONSTRAINT,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret) {
-		dev_err(dev, "Failed to set device constraint\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 /**
  * ti_sci_cmd_lpm_abort() - Abort entry to LPM by clearing selection of LPM to enter
  * @dev:	Device pointer corresponding to the SCI entity
@@ -1708,9 +1492,7 @@ static void ti_sci_setup_ops(struct ti_sci_info *info)
 
 	if (info->fw_caps & MSG_FLAG_CAPS_LPM_DM_MANAGED) {
 		pr_debug("detected DM managed LPM in fw_caps\n");
-		pmops->lpm_wake_reason = ti_sci_msg_cmd_lpm_wake_reason;
-		pmops->set_device_constraint = ti_sci_cmd_set_device_constraint;
-		pmops->set_latency_constraint = ti_sci_cmd_set_latency_constraint;
+		ti_sci_setup_pm_ops(pmops);
 	}
 
 	rm_core_ops->get_range = ti_sci_cmd_get_resource_range;
diff --git a/drivers/firmware/ti/ti_sci_pm.c b/drivers/firmware/ti/ti_sci_pm.c
new file mode 100644
index 0000000000000..fd30dd1715df1
--- /dev/null
+++ b/drivers/firmware/ti/ti_sci_pm.c
@@ -0,0 +1,145 @@
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
+ * ti_sci_msg_cmd_lpm_wake_reason() - Get the wakeup source from LPM
+ * @handle:		Pointer to TI SCI handle
+ * @source:		The wakeup source that woke the SoC from LPM
+ * @timestamp:		Timestamp of the wakeup event
+ * @pin:		The pin that has triggered wake up
+ * @mode:		The last entered low power mode
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
+					  u32 *source, u64 *timestamp, u8 *pin, u8 *mode)
+{
+	struct ti_sci_msg_hdr req;
+	struct ti_sci_msg_resp_lpm_wake_reason resp;
+	struct device *dev;
+	int ret = 0;
+
+	if (IS_ERR(handle))
+		return PTR_ERR(handle);
+	if (!handle)
+		return -EINVAL;
+
+	dev = handle_to_ti_sci_info(handle)->dev;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_LPM_WAKE_REASON,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret) {
+		dev_err(dev, "Failed to get wake reason\n");
+		return ret;
+	}
+
+	if (source)
+		*source = resp.wake_source;
+	if (timestamp)
+		*timestamp = resp.wake_timestamp;
+	if (pin)
+		*pin = resp.wake_pin;
+	if (mode)
+		*mode = resp.mode;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_set_device_constraint() - Set LPM constraint on behalf of a device
+ * @handle:	pointer to TI SCI handle
+ * @id:	Device identifier
+ * @state:	The desired state of device constraint: set or clear
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
+					    u32 id, u8 state)
+{
+	struct ti_sci_msg_req_lpm_set_device_constraint req;
+	struct ti_sci_msg_hdr resp;
+	struct device *dev;
+	int ret = 0;
+
+	if (IS_ERR(handle))
+		return PTR_ERR(handle);
+	if (!handle)
+		return -EINVAL;
+
+	dev = handle_to_ti_sci_info(handle)->dev;
+
+	req.id = id;
+	req.state = state;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_LPM_SET_DEVICE_CONSTRAINT,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret) {
+		dev_err(dev, "Failed to set device constraint\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_set_latency_constraint() - Set LPM resume latency constraint
+ * @handle:	pointer to TI SCI handle
+ * @latency:	maximum acceptable latency (in ms) to wake up from LPM
+ * @state:	The desired state of latency constraint: set or clear
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
+					     u16 latency, u8 state)
+{
+	struct ti_sci_msg_req_lpm_set_latency_constraint req;
+	struct ti_sci_msg_hdr resp;
+	struct device *dev;
+	int ret = 0;
+
+	if (IS_ERR(handle))
+		return PTR_ERR(handle);
+	if (!handle)
+		return -EINVAL;
+
+	dev = handle_to_ti_sci_info(handle)->dev;
+
+	req.latency = latency;
+	req.state = state;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_LPM_SET_LATENCY_CONSTRAINT,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret) {
+		dev_err(dev, "Failed to set latency constraint\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+/*
+ * ti_sci_setup_pm_ops() - Setup the pm operations structures
+ * @pmops:	pointer to TISCI pm ops structure
+ */
+void ti_sci_setup_pm_ops(struct ti_sci_pm_ops *pmops)
+{
+	pmops->lpm_wake_reason = ti_sci_msg_cmd_lpm_wake_reason;
+	pmops->set_device_constraint = ti_sci_cmd_set_device_constraint;
+	pmops->set_latency_constraint = ti_sci_cmd_set_latency_constraint;
+}
-- 
2.34.1

