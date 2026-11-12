Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794474664;
	b=ZwwAQclbj/Hq+5hgAo3K3PQW7Hx9YR1DFcur6LttXCXW6IzA17ct/R69sHLP56JeTFDr
	 nNQPsg0LRwkC0lCadbHt2p6rkKnqG5i34y+BTz/ODoT5D0zIaPrXMUqL/VXns6DBnn0ZC
	 nF8r4uhyN3HkWbrTpDWfXnoToyC7EZsZecl0XC+oQQJAeagbFVUXIJh+cJauQKOfhx/04
	 hYJ1qjwuWjA4whHFkiIVuUY96AH2jjRefH47HPXSIYJI56BEGU2cwhA6w2ko+zsuk9TjH
	 IlddhFBGNhDkIDspWrzjt3EznrZZ/g76GY51PstBZbNUP1lKJkifR8bfIQV089fLAUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474664;
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
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=r78bJvOS+YOiPXNO3v++qrthGLT7Dlv3Zf3pQmblGtg=;
	b=CXpyxW+NybJpEYxENlrD8EXRyrtR1lF0TYdwZqFkHuuozGI2i2l2mdk3qF4blYgF1VZq
	 V8uPk1153TS9vK8GjMLBGNORzgl/4MDUCCmwYAjPPiuTF4VmnFust63ZRO+0tjGoY00fV
	 1Jqby/yRxKekJwvgLX6dNggx23QBEbZRY/+Qgd2oqsKrEKbmvsHFftNeHDHhnthldtlPK
	 ZLVxYeJXw7OgjUeJIFaOarg3tEHuqLhpinoMDyAspjs32mSwbEDajMx64ZlvvNSUjlxLm
	 Imxm8WxFUlPt16wUF+P3TqJO8AYkRykosJkfOZjErkPcTY80J7nqwf9Lc7qnBLAoENA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b="pCH6/XWj";
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=XWi1Mqcz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F020606A31C;
	Thu, 12 Nov 2026 09:11:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F020606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=pCH6/XWj;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=XWi1Mqcz
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7N4Fv2098017;
	Thu, 12 Nov 2026 03:10:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=r78bJvOS+YOiP
	XNO3v++qrthGLT7Dlv3Zf3pQmblGtg=; b=pCH6/XWjpgfOb5P4fUFTsITWZowcJ
	als3ENvOKi6ILMd1JgCLDIvk+VZcpDYQ+ygKD08hPudB08JRmE9oMIMkQ82T6cia
	35LqvZQhI3VK75dKwNpVg/l1DfvBCVXjGoKqFlEjFvu8uLZ7tDvRGSaheBciXzyB
	MDHioNzSOvyo1/DChyLfWedKtu5vV3nTsOPYtNNUp+FsK+R/+OLeDNrapJjb43GI
	N0HzP8rJh0J/jPK7sfTx1XzoCdbFs3sTThE6ig0aLWepGCCno4mA3eytDy6AhgVd
	n9amZgNV1qZaW5MN6JvSIVkSP10GiGoj3Q5v9m/eu6TTHdCBi7P0WQzgg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010031.outbound.protection.outlook.com [52.101.85.31])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hw915gjkv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 03:10:57 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EZVDKcTpQAZ6cifi0vT/Yk7GAVhjc733FlxWcQgcTLI59sTVyVDK3wVJXWFxJtnVu+6qFlm285rQWZkyQvmLwDERIsJETT5NqFLZBitkB93kHxgtp9S6qtnw2/XKENovKwGzL0YazatCDLxHcrctEkJhRBVXRsk70iz3T+JC2nmK0c2LvbzCgxN4uO1Lj5gjLCEK+UOXP87/j/UkRkUJ/XpkyLvxF7z2s6yZa/XVrZBuHF/D29pn9cRHeEFn8rILhXC++VgcI8jZaJRJQoBbLgK8VxI32/Yc04VEn/05MyUXL7G/ABe/LCfP23JyrGLY/ObeSnl9tGVJqlnA1WDDiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r78bJvOS+YOiPXNO3v++qrthGLT7Dlv3Zf3pQmblGtg=;
 b=KblU+nJW9qx/cb5ZHnCwEL+VuMFJHuVA+kM8ueM46UROuf82Bo151Tf6n3A7ouGcgVSjxRlU5gPONLa3JkR6qAPiP6jqfsIUWr8sLQr3XlpxyM209F6NUoExpfaZyBZtWCeZDh7YYyHSfNclaAjXIH8AzUqM1AzvzRSjawvbo6DF2lRVKA9v5MlqRP2XUBGHUAUAUZlLWa7fpiKfsaaxGkborSOzbhi55FtFUTCvzMAA4x/ao2SXMSV4TM8i9NXZgt4ujOu9DSIXiYtzdmg72cS6BSPRJorLThVT5onIOF4FuOMGFSteztJoiTHP1x/DPq04Rk3nEb5U5x00Vg7VyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r78bJvOS+YOiPXNO3v++qrthGLT7Dlv3Zf3pQmblGtg=;
 b=XWi1MqczGBBURit0XDttqFxLics8zTb9OE2sLR8Sth/A/mANOmlvrzA4MK/5CYZKYB+V162p3uOgtG0xlqqAudH2+AGG9xlruI0+pc7y5dU8PESFCygBDDWofBK4YI/EHmCtmtiMsdtN9G1CISkfMMB4T+gBu6/Kg4x5wEyzcm4=
Received: from CY5PR19CA0050.namprd19.prod.outlook.com (2603:10b6:930:1a::34)
 by PH9PR10MB782475.namprd10.prod.outlook.com (2603:10b6:510:3e8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 09:10:54 +0000
Received: from CY7PEPF000000F0.namprd05.prod.outlook.com
 (2603:10b6:930:1a:cafe::19) by CY5PR19CA0050.outlook.office365.com
 (2603:10b6:930:1a::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Thu, 12
 Nov 2026 09:10:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY7PEPF000000F0.mail.protection.outlook.com (10.167.247.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 12 Nov 2026 09:10:54 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 03:10:33 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 03:10:33 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 12 Nov 2026 03:10:33 -0600
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AC9ARXw1549289;
	Thu, 12 Nov 2026 03:10:28 -0600
From: Moteen Shah <m-shah@ti.com>
To: <conor+dt@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <nm@ti.com>, <ssantosh@kernel.org>
CC: <u-kumar1@ti.com>, <gehariprasath@ti.com>, <m-shah@ti.com>,
        <vigneshr@ti.com>, <afd@ti.com>, <a-limaye@ti.com>,
        <y-abhilashchandra@ti.com>, <johan@kernel.org>, <kees@kernel.org>,
        <jm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v4 0/4] soc: ti: Add TDA54 SCM configuration syscon support
Date: Thu, 12 Nov 2026 14:40:23 +0530
Message-ID: <20261112091027.1601122-1-m-shah@ti.com>
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
X-MS-TrafficTypeDiagnostic: CY7PEPF000000F0:EE_|PH9PR10MB782475:EE_
X-MS-Office365-Filtering-Correlation-Id: 401a3f8c-f200-4adf-b3d0-08df409cdaf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|18002099003|6133799003|261009221227099003|261009223027099003|13003099007|56012099006|261028144727099003|261021121427099003|261102130727099003|261102123227099003|261026140227099003|261026121527099003|261021123027099003|261022105027099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	jWJ++Eex7y1MUtu5s+Qn40WAFJdt1iofxcIDkgQAvVFyQWmfRYteVzatkZCXpsJEmaSxN6i3zi4GZDk/U8zkZ5PEz1efuOLw68A60PbfLrUShmBkdioNG767aG5SDs23vZDbyHC1kFRXcJlbbKr7v62KPQcp9zufA3oybGDUw8ZDLfl3yL4Wfq87pUUjUmICU2xT8+y9Qkl/t0YO5oil3J4d7x3TwW31lTAN2m6AAt5Wa5YSuxdpNQMU2aiL2pRc2FKhsEo4b6W32JDMrkI7IQ9xpwMZeWueSJm7aMeakFwtLqQx4u7TVa6LmqGv/4Vk54jhGcKaxTtUXOMUMGTYAXGD5KUV97DjozvM9DjMbBAzv0CjD3B/RwcQb1Kyuhh23/xFRBHScS6Uqak4rkssRjMQ+K9oofEv+RX28seLLmTpH3NnRqpJn3WQcEPnnyZ4TZra1NnkCoC1cfNK82QeEFeHMBwAHRivW7TLPtV6O/UxQAykbbdvwAHorwHoh+tM+b1HMEch8SLphgrxae6DO8csAuoJiYPOM9DSDsdZplYrfcr9jNYZaFUJJtDXlWBIY4QN/LaL2TSLai4fFX7u6B1fMaQYoH8ebzdYW170iuViSGmP5V+dnWl8SJSFyR4P9GkEquIa04B4/R/1mhezaw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(18002099003)(6133799003)(261009221227099003)(261009223027099003)(13003099007)(56012099006)(261028144727099003)(261021121427099003)(261102130727099003)(261102123227099003)(261026140227099003)(261026121527099003)(261021123027099003)(261022105027099003)(261022075727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	f1SJrJlNF2Ykz6knQ8hYfZtdLlUsf0eiRO6WanBqIu520tPftMMQNwpHYDMrdZEqxlev0pI2HbWMz6t5kl/KxuxQ4xTj9mZvWAGQwtaDOG+7k2sjqHDTOYJTKABp2vEKSfVRwbI+sBWo2uFvGsQsrGYojxREtSTIYSeR6VcMjacHd52Q48S/taJn4lIUC/CwE6CvAB8GVd3UvxxNxE03mkyxILxyhaFa+DgQP/PDGOOF23WYVpeRh4No0DS5e0z5p5zCV1NyfQmVA/+Er8krClgJ88oK3avKDt3uO55ygF7AdrM2WFelSYcO7TLqL1u5xBAwgZNn53d7owEDRZIVtMYEwft7cNyW51wrRvjL89cqYko6FekKkKnBDMv53mnXAOSvy0ytshAheq6CS6K+RxTMkFD9yDpl7YklAEpkYss3C36DnLVAIXa60alh1R97
X-Exchange-RoutingPolicyChecked:
	QM6FRTBuF+gvbbvj2Ulkb5hGC2/u3h1SyglFkJDoHZQTTc1jBtDRDH/mTNuzOemkxw7wZr0neY7q3xTkH+va+MtWGTRmNl+JsOxcbJIO0WT0IC/H6x6K7QDjjqnlIZ15NZVvbQpdzQfjmLtpcIhmE0o0UPfO9sSYcfrYICi1eDWEvHp6jWV0Q+moZA51BfweZ5igBrohfFq2M/mHPXHckBc4lqXC1Oiv2RYUf1WKKpFiv/zLaIlZaMrBO1ivQkjyMw1FzxQj5VkVVjhVNBKFfc9sJfwVCD/HSM2eDpsopr4YZ3J0WNfqSixJvxzSwJw+xwrklJKgLOqUoPaQYtQCcQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 09:10:54.1476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 401a3f8c-f200-4adf-b3d0-08df409cdaf3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY7PEPF000000F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR10MB782475
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNiBTYWx0ZWRfX5Ls/YSExcEYN
 3SMLXirsyphGcYYw7RJ5oyfNmLySzck2wf3pepQQbqt/iyPfdPh4XtuvWOgk6rsbD9jLiJAGo5v
 EA+WFD+hyTKWpiaJj3B7hbR3kPPdWJY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNiBTYWx0ZWRfXyDlKb/Pj4dNA
 kam6LdeQjHmPHCvsGUDNV0FuN19et3syIoRz8QRbJXu3lC+0MgvoJqSW1yMa0d90so55OQKR0lb
 OW6Ptjm/E7s6/FlUr10GMId6Tn4fOtxUcEbuchSE/ynSRyrynRBFAXiJjtUNQZpEQOAlp1X/ciN
 sk/TTkwEs0OJjbE0oeyT2lP/jFi/u3C1oD5R4vo1aiyTSU2YgRcCXshqeFE2a4hm4DGeKrJiRaG
 7bnryF0dRoe8lS4rlDTvHk7SD/PYYSHMjK3s8Rsj8OEG+VW0RKqAfelMm44QOCoNkt1xx52uIaJ
 YEU8zB3r8oKvv9D/SXrRw0oo8mXDoUAh1LnnvVWaDuFbX5yhgGFPhgYmdcNP/kVv5JmYz87oghO
 YRB1R5WrDLGEQxzIcPjCHvU5bhONe8nC69oLPP7vu8hijaBt2bzJ6lexV4qn66AG9l9/kll0eKk
 PKzKs3AgD0uFEgJpY2w==
X-Authority-Analysis: v=2.4 cv=a8WlZkSF c=1 sm=1 tr=0 ts=6af582a1 cx=c_pps
 a=mGKQszq4vdWEHw2ByKFqMg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=UCzFRFlywXcFtRv7-asA:9
X-Proofpoint-GUID: d3t8Rp0eUkTkq_Udebjdl8qDNNjwf-r9
X-Proofpoint-ORIG-GUID: d3t8Rp0eUkTkq_Udebjdl8qDNNjwf-r9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120036

This series adds support for the TDA54 SCM configuration region in the MCU
domain. The region is shared by several peripherals, so it is exposed as a
syscon regmap for other drivers to look up by phandle.

Patch 1 adds the device tree binding for ti,tda54-mcu-scm-conf.

Patch 2 converts the SoC attributes, revision string, and registered SoC device
in k3-socinfo to device-managed cleanup.

Patch 3 splits the SoC decode and registration logic out of
k3_chipinfo_probe() into k3_socinfo_register() and exports it, so drivers that
read the JTAG ID through another access path can reuse the common K3 SoC
identification logic. It adds the public header declaring the helper.

Patch 4 adds the TDA54 SCM configuration driver. It provides proxy-aware
register access with SCM unlock and claim handling, publishes the regmap
through syscon, and registers TDA54 SoC information through the helper from
patch 3. The option defaults to m on ARCH_K3.

Changelog:

Changes since v3:
Link to v3: https://lore.kernel.org/all/20261112081047.1550471-1-m-shah@ti.com/
- Add the missing k3-socinfo public header to the helper patch.

Changes since v2:
Link to v2: https://lore.kernel.org/all/20261027083700.1964371-1-m-shah@ti.com/
- Split the k3-socinfo device-managed cleanup changes from the exported SoC
  registration helper into separate patches.

Changes in v1:
Link to v1: https://lore.kernel.org/all/20261019080736.944127-1-m-shah@ti.com/
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
 include/linux/soc/ti/k3-socinfo.h             |  11 +
 6 files changed, 391 insertions(+), 43 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/ti/ti,tda54-mcu-scm-conf.yaml
 create mode 100644 drivers/soc/ti/tda54-mcu-sysconf.c
 create mode 100644 include/linux/soc/ti/k3-socinfo.h

-- 
2.34.1

