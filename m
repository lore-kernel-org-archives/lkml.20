Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794471081;
	b=j8GOhIMCXO1H4eRlQkfFaWQj8/TWXGQUsgL6LvyU1AjaIlXBFEw0buT3HZYlA2IO8xhd
	 bMBUNPOMZXEaO1Kuc8lhmnHyP1e6lTzmxDZC/UoRyD19Z5O6YvqIEIdTO251YJOunBIIE
	 oI6Ih8ojBsdgGdrVh279Lq7qJ9ZPsrSAwESdm9npyqhHn/H8+oWOCPyELFvHGmQW7otV+
	 C2OC00/E5haxMeDI3nsCg7MzBPAc5blpdnbFn46hIIX2pJQiNQyWX3jZDwDsULUxVTN26
	 iKLzgUznr/7UtqEQERSNvDSggQ3kqoMFVz7PfNJ1CcVLtnjTCRpz/TEmjeS245aa//w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471081;
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
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WLw+K2gevzwJjIj2qfWa/NmUfAsNOd+u2sr4nRDPehI=;
	b=pFvZMaY7Rlb6UdPYF7bTWCcPICpMJcNNjp7EehCTfHloGZ9DfeJFFp2FML4eubgzY4Bl
	 2GyXAnw6m/9goB5P2XE+KaZoRFJCyHpW3EFu9wR9dgB6H/IXlZcy+TxF5likSYPTA1jVz
	 qoIvZH4dMsosSe+vKQh+gnSXSV+up1lg6apyBIqnTT4GjhZs7WQKf7fSC1UOjrZOfYB26
	 rPDDadwb5tfbQA3e2AaTaoyxFH1mTvTn3/sToFBpcI6F1+JLSTqAif/7TNxXdO0cnfmV9
	 OLZboxeeoeIPxxfswZky59+ZgHUwN2ropc549oerEsG5tgvqa0nDy6LMN92x1ymTCpw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=I5IVkihk;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=GsbwUCu9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA21D606A338;
	Thu, 12 Nov 2026 08:11:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA21D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=I5IVkihk;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=GsbwUCu9
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AC7nuog3094898;
	Thu, 12 Nov 2026 02:11:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=WLw+K2gevzwJj
	Ij2qfWa/NmUfAsNOd+u2sr4nRDPehI=; b=I5IVkihkd2Bh93AkzPMhL9WX1L0IQ
	4Op6b12LITl8afGmxYn1LZ/j6DpbAZvT8zrVyQufIvuBvJTCyQYk+dm09emPAb2n
	IOKj9CqBiG6uON8Ip7ss+a4n7rtxr8+buOo5NcUym2c0lQY98kJg0lhc0zSvmLY8
	ntVEMak3VFChFI71bN3O7q6/u7BBVc/boC1oU0jeWU4QqKfgNrS+Lv4fkvkT0QH0
	K5Cmoqe0RDT0OUtYLH96KV0EScYWUIkzNAxkjZEGjtp14WJBc248WWGsEfrIoV7d
	pmGmno+d+IhQX/KCzkggj/ZRrBREsjccrejJgS6v21OJF7/15NRS5x31A==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010039.outbound.protection.outlook.com [52.101.85.39])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hw4cy1v3f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 02:11:08 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SuhYDjwWVTyRsVYeBumPknHWK1zEbWKAcswdFgsM0d18/ZJIFIMgN0itAvrVayib5H0vWjj3TtLAiC5SMDiMnwumcVy+yU82g1O0Dw1TSY9ric8eOkxL4uQ+kXfmo8UG+4HX6Qi65MmQneM6PiB78QSBCnzcZLHQEfhmbsMUSV5VJWh4xgmwlk1Ns82HZc7ONuugSD497iSy7GIlGqROeHme3MNbCMTQ6+eGFAQNOxa8IAp+OFdb44cxUkNb+oq+sMK4HvMhBim4AApVovj2bQTgLYMRseelGQ5FTF8J1+LsBJRaMmiq003lBQcMqs+7P1UmdS1nndvMV4fL2dJq5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLw+K2gevzwJjIj2qfWa/NmUfAsNOd+u2sr4nRDPehI=;
 b=RsTv5OClWXIvSgtCUky4pEUsOKF0VZPWVkAF96UxudxqMb2S7I3+FFKzMnZ7DmJLHJxJmT0BprbqXp3LttLy3n2FaW5kZWlytYWiVyKARCLcGq4F3N34oldRRlw9YXlj1FVHyxKEE7NQBTSSsn+g3DTBTr4etDzp35ctELc4CleZX4cxiwo3ONcxEXIr7De6V2xmIZxlSzGJQL8N5oNHhEuPc/+9cSi2SYwWS4I9ftRhroR7Thu2OA5TISyUQ+MmBH+QboysDmyqyYOaWJ9NbAHZy38rwPElFvrXRZN2l5zEmvNdxUcXVHnwxRGPAqGq/4EY3GRdRg/UGhmgZQ7GMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WLw+K2gevzwJjIj2qfWa/NmUfAsNOd+u2sr4nRDPehI=;
 b=GsbwUCu9dDeWeqkRSRjbg5NGzP41BJBxYVuB7luRNhbr5Jp8HdQPjCxE88JFv8eVOkNgMBmcU3D+PkbKxVtyww7t+OM6NLNYQaOnn6O/ejXZGch0xPGFDEYpQAMNj0C2gPQZTOZrrJX8GOVlR88NY88y01ZCra9FlGvuKN7EDwA=
Received: from CH5P223CA0008.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::29)
 by CH3PR10MB7162.namprd10.prod.outlook.com (2603:10b6:610:122::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 08:11:06 +0000
Received: from CH2PEPF000166BF.namprd04.prod.outlook.com
 (2603:10b6:610:1f3:cafe::11) by CH5P223CA0008.outlook.office365.com
 (2603:10b6:610:1f3::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Thu, 12
 Nov 2026 08:11:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF000166BF.mail.protection.outlook.com (10.167.252.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 12 Nov 2026 08:11:05 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 02:10:53 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 02:10:53 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 12 Nov 2026 02:10:53 -0600
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AC8AlaK1453305;
	Thu, 12 Nov 2026 02:10:48 -0600
From: Moteen Shah <m-shah@ti.com>
To: <conor+dt@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <nm@ti.com>, <ssantosh@kernel.org>
CC: <u-kumar1@ti.com>, <gehariprasath@ti.com>, <m-shah@ti.com>,
        <vigneshr@ti.com>, <afd@ti.com>, <a-limaye@ti.com>,
        <y-abhilashchandra@ti.com>, <johan@kernel.org>, <kees@kernel.org>,
        <jm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 0/4] soc: ti: Add TDA54 SCM configuration syscon support
Date: Thu, 12 Nov 2026 13:40:43 +0530
Message-ID: <20261112081047.1550471-1-m-shah@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF000166BF:EE_|CH3PR10MB7162:EE_
X-MS-Office365-Filtering-Correlation-Id: 04241b8f-1286-4fd8-1044-08df4094801f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|18002099003|6133799003|261009223027099003|261009221227099003|13003099007|56012099006|261028144727099003|261102123227099003|261021121427099003|261022105027099003|261102130727099003|261022075727099003|261026121527099003|261026140227099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	bMz4nBSMoTPUHadls+uEb91UiA+TFLupxSKWSMGzVzORUTMjelH91/kUOiWLg/6K02W4X9vB6AlH56aVFeo7/bYCUzrct45cCJFgQ9FRbVYYCAmS5rLdWQLx98BOngE+VfQ6nPTU0WVnvYUqwnyBwkf0tvk1vQi0XF+RppQvYA7X7DGeYVvAkFE4qaCMqQSRNiANhenI0E9JM4fsezEUGIPeh6jVrapS0+GrEqtYBTmEbeK6uQF8GrHqGRgRxuWttRVcj0u7kb8c//afSJGQIo87cv8iPBIbhYtrzM1NIR7T+lS3v/XRRlB/Hl8CQoBDRKS1wTUNQGqhzQpSGaXTUx+JTSZ/UgfIZMHXpBHZKUMS86Mx6xq6I3hgxLiWGjvx1uiwpj22Vwdnu/LRDm13nzdUvYy5puTQYpJvj26QZLKb1fVwpagAVO1sreD7G0fHLaYbBIToRllVOhLjE01dhSNvFF2ykILatpSTTAdJpjkqrec+m+ijVJdMOC3++HDTA7AVYuUsNKRYBijVzUfB8gL8C/jeJX1Y+TBtKnYqajNuIFth9KAaLF2tHNYQUtdNhskP+EVJp6/aSbwI4BLlvLNFGfmlfYsZlCzNCjyNwQHwAagjouOU+6myWrb7U7zzDvFOdMRMSVP4oaU8h23jMg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(18002099003)(6133799003)(261009223027099003)(261009221227099003)(13003099007)(56012099006)(261028144727099003)(261102123227099003)(261021121427099003)(261022105027099003)(261102130727099003)(261022075727099003)(261026121527099003)(261026140227099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QpGeM2Dl0HQewFMEBfsGmbyOQ14BZwHKc/eVvuovGxux34vHR1pRPiTxre2XJBrWbXyA1DmEJ29wQJGkkmTi+1EoUmMiH/WDc7CfIXJ1IAt2yS4v7GL46XdUwyo1gjza9NXzNn2UhlEgg9fEPz00/d52Hjn+j8F/gYrU+iZxeDcZ9xY5rX4CIkvIfqVsZMdLBdk+5PaNuLks8w/XkS5yz+K5R33zaCzqvBYRtJunCLz1MEHNrMfkonM9/0OoHgR8q5WRcRW2na+PTeRzMdk6uq+OLCBY8FqKJCeNy58rjmCh1KMisrG1NDh7IhfMjK015qpyc1qe2baFlX+Dt/Rnl/DS/HlBB8cqiIna2kpPN4D4WW+IP9mcllrdw+3M3OizoGRA73/jtF8fq0AoJ64hjxukcRZ9515l/45xZRXBeboAv6O3dxo80HHJb5lpGQmt
X-Exchange-RoutingPolicyChecked:
	Kje5w83JYPW0Wv56O6vDnxGXOQgxPuusXY8bz7ImkfxxPEXoQ9m/4xJ2+IujK2VmjjMb4CxMyZ1oyDmBG1XjbOxatFbWWk/ALD+WcoD3OyPdt1Lfeum7NWvhvv7+G/e+uNLA66wddD0vuBEA6n4QVu/fsjjbzomgoShiA77dtK7YiYfZSus+rj+FJ1oYzeXsWxzLib4dfJKfvZMYjg+25pYB/TBeBtk3oB24lr+Ap+7e4wcHpXpG5PX1IZlk77qzzmqojKnG0KpK9C+Fu9XI1wf5b3+3JPG0cs1wob3/0Q7GWwX1N18sWFRQioynXI6t1JFf+7QO/r/HDsnrSrhX1w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 08:11:05.7764
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04241b8f-1286-4fd8-1044-08df4094801f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000166BF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7162
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMiBTYWx0ZWRfX4sRDKmb1bfhx
 7LCPPYHx9tMcWriyidX8KG9k0DhLUvdl+uhyFdBatK/aU9CqqQ3blq9YiIfk6c7rF6lsZ+ZLRSs
 UaBgKkjsnHsfo5Vqu3SbRoH44+v2BI8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMiBTYWx0ZWRfX7wOYFEx2Ilhw
 V3IsX7CaOP5FsIPfpurPDfkmbjfgDPtdlZnyVI6++76G0CsYfQ7XxEbmBGRjsKeVlcUhDEe0Tr0
 /4Y+IMVQV577ME5443SOWikIKvs9vZGneGsyF4/9IT/NdevcWSAZNSfI7FWSDqkWnF5E0M5kNi7
 OoisR4/Bcs93tVhTiCuMY6Ync1WcuBtOB2t9C3xknoq3XOyf0CcuaEoKt0qZQanPOYMKLyw795y
 Go13Kizi1g2xKgJBwJYOBxPhv17WRSGcGxkKxaSo7cijazWm6+oGhOtMuYuPc1n+DmmbrZdUyKP
 uwskIDZ6RQYABkSfckLpUT4/Z/A7T0M8OoEttc9sc2mNUiBWQl1TP9HEh00ANHDxbc72fZ2+Kyt
 AU1jGwhWUff1bxQQ+EnF6ZB41f26QVgfaBdG6fIfgGf9l2oqbqOVDazsRBRvjsshEx7cWjbY9Uv
 NokZXBU2L9k+y5PlWIw==
X-Proofpoint-ORIG-GUID: FUQFSm2YurOc-lfPEcf_nuvMKKxL7K0u
X-Proofpoint-GUID: FUQFSm2YurOc-lfPEcf_nuvMKKxL7K0u
X-Authority-Analysis: v=2.4 cv=asYnmiZV c=1 sm=1 tr=0 ts=6af5749c cx=c_pps
 a=pAJzO7k5KbwWJfk/IQaIJw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=UCzFRFlywXcFtRv7-asA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120032

This series adds support for the TDA54 SCM configuration region in the MCU
domain. The region is shared by several peripherals, so it is exposed as a
syscon regmap for other drivers to look up by phandle.

Patch 1 adds the device tree binding for ti,tda54-mcu-scm-conf.

Patch 2 converts the SoC attributes, revision string, and registered SoC device
in k3-socinfo to device-managed cleanup.

Patch 3 splits the SoC decode and registration logic out of
k3_chipinfo_probe() into k3_socinfo_register() and exports it, so drivers that
read the JTAG ID through another access path can reuse the common K3 SoC
identification logic.

Patch 4 adds the TDA54 SCM configuration driver. It provides proxy-aware
register access with SCM unlock and claim handling, publishes the regmap
through syscon, and registers TDA54 SoC information through the helper from
patch 3. The option defaults to m on ARCH_K3.

Changelog:
Link to v2: https://lore.kernel.org/all/20261027083700.1964371-1-m-shah@ti.com/

Changes in v3:
- Split the k3-socinfo device-managed cleanup changes from the exported SoC
  registration helper into separate patches.

Link to v1: https://lore.kernel.org/all/20261019080736.944127-1-m-shah@ti.com/

Changes in v2:
- No changes to the device tree binding patch.
- Use devm-managed allocation for the SoC attributes and revision string in
  k3-socinfo, and simplify the cleanup of the registered SoC device.
- Enable fast_io for the TDA54 SCM configuration regmap.

Moteen Shah (4):
  dt-bindings: soc: ti: Document the ti,tda54-mcu-scm-conf
  soc: ti: k3-socinfo: Use device managed allocations and unregistration
  soc: ti: k3-socinfo: Export SoC registration helper
  soc: ti: Add TDA54 SCM configuration syscon support

 .../soc/ti/ti,tda54-mcu-scm-conf.yaml         |  78 +++++++
 drivers/soc/ti/Kconfig                        |  16 ++
 drivers/soc/ti/Makefile                       |   1 +
 drivers/soc/ti/k3-socinfo.c                   | 111 +++++----
 drivers/soc/ti/tda54-mcu-sysconf.c            | 217 ++++++++++++++++++
 5 files changed, 380 insertions(+), 43 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/ti/ti,tda54-mcu-scm-conf.yaml
 create mode 100644 drivers/soc/ti/tda54-mcu-sysconf.c

-- 
2.34.1

