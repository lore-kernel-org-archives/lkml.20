Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793805955;
	b=XKnubPPV/CRQ7MoCNCF//Qn0jxZs8cWtGmdvYw70z+HKINDrYDfS7ge6xPTDZ6dNm7kr
	 XYyudo2F7rwCubx8FfAU93J9qQ1YIl0zPbdT6stOH7qU/jxip7ZWw9MQrdaOZTKA4ZwpN
	 NyCXx0Yg5TEFaPQGoutz7A+m70598J8NFrSv3JCbgm6P9WLqMYKPIhNWPlb/tSws7nHu5
	 6dBj8XCUZmf7WVMxIPGomcnb+/qPf5jpWbZcsNwEDQ7JNLW0vywfslY1QsyN83XQqwWVS
	 syVSd2IYAssV2e7sWnuBgstIof2Z02i3Mp24ERm2BtFypjVyot81y2vQpfuWqPrpDYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805955;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:
	 X-B4-Tracking:X-Change-ID:To:CC:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DLhrAWFqfU0n+t+Tg5CnIr/oS2hmwlyP5hslMjpjq3Y=;
	b=Bs3t0760kQbSyBBEHzisFiEcslkkYHhyPhxJh5ePlIpQxJWSB7Jb+6sZZPyR9mCx+r1P
	 elLl3Lwb+Fw3FjjqC4Jy7xVF3QXWhALr5SP3/bRw0fj+caSDOrJv8sCMnTTk526Op91mR
	 aTwtC3a1+lHjV7vIxQ+ZwB2pej2mgSodfD3Nj9mXxxdrFXPB84mDorkWdfrbZD7dxsRrK
	 oSQ7U0OIxUj0ykjuUfYrGS70NpQ6f6cTNj/1hKC7jG/uc786AJYsLZ77HMbvhBr432Cjz
	 g90NbQ0nBywwvxfhb+LqOGEYyDJOLhP5V8SFdxFl7zdO04e6J5Wmba3PiYfJg9j0xZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=RUJOgbfY;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=E2Q7UG21;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CE9606A326;
	Wed,  4 Nov 2026 15:25:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34CE9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=RUJOgbfY;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=E2Q7UG21
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Bbj5Z2350494;
	Wed, 4 Nov 2026 09:25:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=DLhrAWFqfU0n+
	t+Tg5CnIr/oS2hmwlyP5hslMjpjq3Y=; b=RUJOgbfYEE6jM8jsy1vrmTNlJkxLr
	vs8W8jm6wh4CvAI0MVM1RYgkYbwMzAou5djYfTc/qiNvMkV658xsP8fpXcmmSjNR
	2wjc3La0B7GvHTBYhckl14qflLxAfTOVs6I9NXWQns+J4dbjd+YI5L/hzmduDpI6
	Rvp0rcir96ZicX9l8IB3KQOymjCJ+kxKQGBaDR3jXXDjN+IDIinyxx4TdI6a4RXa
	s4pkrJb7Z/oou82Y7/p3l/XA9tORqUP6kfQr8PBFZmM1USib/BoK6DcHgZrGwQm/
	90P3YTXis890lcy3524S91FrlIaCH34n5VNHCmbCy1g/n31tV69q3as2w==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012056.outbound.protection.outlook.com [40.93.195.56])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hqu7em4t1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 09:25:45 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RwOHp7s4d3fXxVgmFYUiy275+vthPxlPOl9NMayIE+cZ6WnyAEbrK/xD5n6YAo1Pv8KXMu4SKiCTPLch0tRgtssswATYjVU3J56iiaRoGauhSYlZSF7bcNkXLJ9k4YRhSPOZ+jamopRO/k6ue6vRzEtVJUdbeYPf1fDGR90j//rc7Z4Yehc8mDQ7eP3huR8/T0PDkUPMddNDwEtyRHrON+3+2PrqBlBFRpvUGi/OK2sbQ3YdBX022i5tI55GWPnXZuaKcb1nIwdO8zzJ/piSgJ+4EEHxg3B/+SvqAjrilu/1rIH2lmD5WvKdZNO/5h7VvKWy9sLNI9UuGbDclqFn0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DLhrAWFqfU0n+t+Tg5CnIr/oS2hmwlyP5hslMjpjq3Y=;
 b=KBn/BYDhAUDeCy8aVsG8LiThozyNB9iTlME/GyKmmYMs9ous4CvhuWeMvnr4J1my1JPgN64WTiFsnqfMrO5DMjkNhng0Qb3o+VeEbkf8XSB5kOFvU0UD1rHGIRTNUBAFbFAhK1LXf5hJwoHXLw8aW+eaTu9PKdpSAW2TRnvqBHiDCnaIK4ugdS6FZyp5c5ViEuFQpLwe/EMWMUJFVgLGy6US6U5KHY00Mu7PzYurG7ebN89PvPvCi2tHEnbslQGDqlfVKh+kg3oYn9eNNr4i+bJ1Ub5Fen3kzLeD3/9dHKtJmjy4IAk8MuFb9+K2Iy3OSeQFNeJ+L38gUTPFLE1pgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLhrAWFqfU0n+t+Tg5CnIr/oS2hmwlyP5hslMjpjq3Y=;
 b=E2Q7UG21+sGsRiP2k1rwcivOInTXLLO4h64wW5/VQYMuopsUms4Bi1JXcB/fyc9KL2q3u6fq8OtCOALahLjCYJDWs1NA0GIO8FfRHg7u6rblKkVHlrnBY6lfJUw8UEkwcumVQCmYJDqor0h3s0GXMwdisL9EobB7pHT4itLxR4Y=
Received: from BY5PR03CA0022.namprd03.prod.outlook.com (2603:10b6:a03:1e0::32)
 by PH7PR10MB5829.namprd10.prod.outlook.com (2603:10b6:510:126::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 15:25:40 +0000
Received: from MW2PEPF00014675.namprd04.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::52) by BY5PR03CA0022.outlook.office365.com
 (2603:10b6:a03:1e0::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 15:25:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MW2PEPF00014675.mail.protection.outlook.com (10.167.249.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 15:25:39 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 4 Nov
 2026 09:25:18 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 4 Nov
 2026 09:25:18 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 4 Nov 2026 09:25:18 -0600
Received: from [127.0.1.1] (a0512632.dhcp.ti.com [10.24.52.205])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6A4FPESq2404850;
	Wed, 4 Nov 2026 09:25:15 -0600
From: Swamil Jain <s-jain1@ti.com>
Date: Wed, 4 Nov 2026 20:54:59 +0530
Subject: [PATCH] arm64: dts: ti: Add LincolnTech OLDI LCD-185 Overlay for
 AM67A-BeagleY-AI
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261104-v1_beagley-ai-lincolntech-lcd185-v1-1-f5daddbbd0a8@ti.com>
X-B4-Tracking: v=1; b=H4sIAEpO62oC/y2NWw6CMBAAr0L6bRNaWyhexRCz3S5Qw0NpIRrC3
 a3i5ySTmY0Fmj0Fdsk2NtPqg5/GBOKUMexgbIl7l5jJXBZC5Iqv4mYJ2p7eHDzv/YhTP0bCjvf
 ohNE8B3t2pXWgZcNS5jFT41+/xbU+OCz2Thi/3b8x03NJ73hozEIgjtMw+HjJjC1FWUmRWykbQ
 8qAkaiRAG3ldAEVKmwIFav3/QMVSumU0AAAAA==
X-Change-ID: 20261104-v1_beagley-ai-lincolntech-lcd185-0ab3d7bda52f
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <s-jain1@ti.com>
X-Mailer: b4 0.16.1-dev-53874
X-Developer-Signature: v=1; a=openpgp-sha256; l=7618; i=s-jain1@ti.com;
 h=from:subject:message-id; bh=JhBrU90RhA/rvpL9HxAIdEpihKZPbrn9XTlkxN0Zt5w=;
 b=owEB7QES/pANAwAKAXQhhQx4u/uZAcsmYgBq605ZI+wEJVnLhZzj0D/TLJ8hL/hSZsh4g+jBD
 ZS49a3LxPeJAbMEAAEKAB0WIQSX3grxmEgbaU60Blx0IYUMeLv7mQUCautOWQAKCRB0IYUMeLv7
 mcxdC/wNXzg7zD+j0kj00iEZoapFrneKqazN055OSRtPsJNy7fvIB4Ry7hj1aLBlyi24t9TQ76m
 4x+G1vXEStTqUCB0nzoCcqwprti3btxsP+JJEVgY3AoYATb4a/24tKOOk7blNN/9NsZaJERRrWB
 RCaQMG3yeCarEQ23eMZLm/xYqBNbW6w0PZAuNqYbumx/Y1QLwqr7xJ+9l8TX7hUtzUcDwX5M/gN
 KKN0Stb/jJUmy3VJ/S0G71ojHsFAuLRfYOmmbXu77oj/MbwBus/tsX1c/ILVqenlsIPVwzExwmz
 GQm3Nq1m6JBAOJpPHer+tbsSGXCIffs5UAP4vmpir3pyprYAfNyJOcjCgD44wRUEJPsRPDa6wvN
 uLO1s9aTiqtvtIgSV8lVgs6iio1Jpkk0FNW66g3Fre3AYNhAMYM6bUPKcqbslm0SqNSZRBwAnC4
 wvCHhhdVeO8fVREjvSru6tMUtkgLpps2nCX9ahI/NB8kaZ+1w9nwHM6EkCXCdbgfjrRBE=
X-Developer-Key: i=s-jain1@ti.com; a=openpgp;
 fpr=97DE0AF198481B694EB4065C7421850C78BBFB99
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW2PEPF00014675:EE_|PH7PR10MB5829:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bbc08fa-25ce-4e1b-748a-08df3a87e22c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|6133799003|18002099003|56012099006|3023799007|261021121427099003|261022075727099003|261022105027099003|261022113327099003|261009223027099003|261026121527099003|261026140227099003|10067099003|261028144727099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	Adh0xiEVdOU2lKbvTWfgDhQE6nZVD05NoFhEZbT3xBP/lp6hrqko0dDDN6kRxvotfA7AsD3AMuzBV/pY5JMA+BhuMBrifcPAcT1hokT9wRUTlHYlaDgY2RhORP+EJm6D47qi0lkVBltn4Aop7azf8Vmn+5o8rUxXMI83LbA17JX5pEFRe1JNYVFdzhjL/P1XHUtnjz35vyTT0Co4hj6nK1HdO2L3yvvRdste0Rr7qpWrzUdZXE9rKiRSC0znAJxrneWBwkxFcqdUeLhslYlxQDgOvqRDnTW78D961ziU5gDgEGqrdsOf34Zkh3T/SheY5/8HGWG+LnvQM1uU+WnP0bXeTJon28FoRhkcxxBtON3maKIi6ToJ9EWtSLXPcIZP2x/Dn+hF4fjd80QWZ41NPBIB4Nieanbw/C9m4jEeipX33LBdWouYF4XQwFoO/I31bd8tzwUrrJtWjHvM/H5SHT/ZVYfa0NII2KVe9tGWmPWW0gkmAnifSYx+tuVbhCv6MWQupeHCzxMWUhdBuDy3aUKs9rBHJ2k8NTOw6K4d1seb5ANC+UpqLrFaqKSLSHnI4MVWtyoqScMq1KgP9kI+mXcAa15n9Ep8ngtItAU7dAAMyxKvDLFLkvvjSEy0N+UVjGk3CccTe0ItUW9XYeWzLg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(6133799003)(18002099003)(56012099006)(3023799007)(261021121427099003)(261022075727099003)(261022105027099003)(261022113327099003)(261009223027099003)(261026121527099003)(261026140227099003)(10067099003)(261028144727099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	APzi8oFXJorXpEtiBeSjLQlN6yaz1IlxPWfn1SXUo+wnFUQjzl7GLjSMmc531brYi9R3P82wh4cxiwd1FkdcjeBbOOKQJhcGu6TLR2Uxg3mf3Ac72PWibkU80bffBNTIgekoDSYiaaWda/SVH0pwMpycrTfJWW/xrjr4uR4RjSrcZeiWcmjI30smlK1EuSWBwbSUa4045S6fCp1uBF5QlcJ8CrVp4R/tklnpPD2i99uj1DxRvpfPKbnJeWCbz7aKmFB/r1cuY0Hbf4b8ovHc0HMCx5RbxzM79/TuhS+21L8XKbvdTY0uNR0/QGqBB5RJrIWhhFtkWXzop71nYQ5bueVPkc/dFcDNhjP6FW5tnVnyBCbWVBuL/gdLCOyiNH4VCE+UMu60YSPjTlIt1O0uYWZM6TvxSKoodC/iIYK0/F8DHo0FOQp0LTtOXOngOC1X
X-Exchange-RoutingPolicyChecked:
	YYUQQJ7m4nuDAHsEpWYALCNku2XDNGOC5etjpmX7hzwSbX12W8hf9p4IFcT8K2Hy7HCPoPK/rSj6fBbqRfgojMg0Untf3BXjjHzPPSRBrECD5/3kQp/uE5tHadETMq9lan4J/SXsmQ/IziNqXvCiTQEU3hzHJr434XSufrxCg6gdQmRVC+Z8f/5B4UBULhy5W3KIDn7dJ/s8IifRC2Fm4N3swpmoh592BUHLyS88A7HL4A6nQJXYk18VM0zCcy35vihc8KywOq8LQSOSIYJkgjvj1h227FmYXA2MDKbihmmyUyXeuKs0LGBAYKn1rqUGv197xvZfVe8SC5x4U/c/VA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 15:25:39.8047
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bbc08fa-25ce-4e1b-748a-08df3a87e22c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW2PEPF00014675.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5829
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2MSBTYWx0ZWRfX6ot7XOyKIG7z
 /no/ARX9VkfgO1stFvzHGRfJD2IHfDttrVVUj8YTgfDjLk+JkKl6b2dFv6Io57McIJDKCs9UUDO
 veqpSBzy1N/ZA565EicojBwTN+CwcAo=
X-Authority-Analysis: v=2.4 cv=fPusTpae c=1 sm=1 tr=0 ts=6aeb4e79 cx=c_pps
 a=3QgNZYwUpJBVNtkd9Eusrg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=KOmJlRZdAAAA:8
 a=VwQbUJbxAAAA:8 a=P1BnusSwAAAA:8 a=sozttTNsAAAA:8 a=gLqrbhXjkwb4umn8D8IA:9
 a=QEXdDO2ut3YA:10 a=Y9KJ9d7ijktqh0zzt3yb:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: xNohR0f7aRp9TSkc-HEVE-sdtBKPCZjJ
X-Proofpoint-ORIG-GUID: xNohR0f7aRp9TSkc-HEVE-sdtBKPCZjJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2MSBTYWx0ZWRfX2GZEVvVrdmKS
 NTXUdcQYBkyzBQ4XmdBd+wxxcvj03kUnqZ3pdDo7Qbazn4HSBi4ucQUrbLzDhnSLVUCcOU0PsTi
 DXNW36uMZ6wgXjo6hHPJ2ByG4OEZTydiUgmc2xb14bcqbCk5Z8k/hJXVFcUOhtATJrvF4+x0MUA
 FAhkgei9Hto2inD6V4qu8XEIbijn7v98Kf/rV+fpqhkXtIUVJinICrt/F6UvGvODfVBDZNIuidr
 uDKKi2Lu+6qWwq2OBsuSSk70OMzU/JNAAeVUw5KRLsvAr/Wg/tBmpszWVKswNjuUGqS6WR3bv/l
 1Qd3BjTV4ddibd2qGxWPvQ2We4N0nl9KQVb+VO2fh1EpCfrfSy5bEikvt6Jt+QLIeWMYJ2Tki4J
 l/DAc4ayKC3A2JjqQAl7kINzxcfg5cgKZvU60aaVH6nxkb2XEFZAiFzzDcLWrJIPd7DClzYxDc1
 kF49pLZsl9GrlpmUSwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040061

The panel is Lincoln Technology Solutions LCD185-101CT[0]. It is a
Dual-Link LVDS panel and supports WUXGA resolution (1920x1200).
Furthermore, it has an i2c based touch controller: Goodix-GT928.

Add DT overlay for the OLDI panel to connect with BeagleY-AI platform.

[0]: https://lincolntechsolutions.com/wp-content/uploads/2024/09/LCD185-101CTL1ARNTT_DS_R1.3.pdf

Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
This overlay adds support for Lincolntech LCD-185 for BeagleY-AI.
The patch depends on "[PATCH v5 00/15] drm/tidss: Add BeagleY-AI display
support (and some more)"[1] series.

[1]: https://lore.kernel.org/all/20261103-beagley-ai-display-v5-0-f1c8d0e52bb4@ideasonboard.com/"
---
 arch/arm64/boot/dts/ti/Makefile                    |   4 +
 ...-am67a-beagley-ai-lincolntech-lcd185-panel.dtso | 199 +++++++++++++++++++++
 2 files changed, 203 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index da654153a35b..f7c0b514b330 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -207,6 +207,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am6754-phyboard-rigel.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am67a-beagley-ai.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am67a-beagley-ai-csi0-imx219.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am67a-beagley-ai-csi1-imx219.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am67a-beagley-ai-lincolntech-lcd185-panel.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
@@ -370,6 +371,8 @@ k3-am67a-beagley-ai-csi0-imx219-dtbs := k3-am67a-beagley-ai.dtb \
 	k3-am67a-beagley-ai-csi0-imx219.dtbo
 k3-am67a-beagley-ai-csi1-imx219-dtbs := k3-am67a-beagley-ai.dtb \
 	k3-am67a-beagley-ai-csi1-imx219.dtbo
+k3-am67a-beagley-ai-lincolntech-lcd185-panel-dtbs := k3-am67a-beagley-ai.dtb \
+	k3-am67a-beagley-ai-lincolntech-lcd185-panel.dtbo
 k3-am68-sk-base-board-csi2-dual-imx219-dtbs := k3-am68-sk-base-board.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-am68-sk-base-board-pcie1-ep-dtbs := k3-am68-sk-base-board.dtb \
@@ -490,6 +493,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am642-tqma64xxl-mbax4xxl-wlan.dtb \
 	k3-am67a-beagley-ai-csi0-imx219.dtb \
 	k3-am67a-beagley-ai-csi1-imx219.dtb \
+	k3-am67a-beagley-ai-lincolntech-lcd185-panel.dtb \
 	k3-am68-phyboard-izar-lvds-ph128800t006.dtb \
 	k3-am68-phyboard-izar-peb-av-15.dtb \
 	k3-am68-phyboard-izar-pwm-fan.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-lincolntech-lcd185-panel.dtso b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-lincolntech-lcd185-panel.dtso
new file mode 100644
index 000000000000..8004c058bfb1
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-lincolntech-lcd185-panel.dtso
@@ -0,0 +1,199 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/**
+ * Lincoln tech Solutions OLDI panel (LCD185-101CT) and touch DT overlay for AM67A-BeagleY-AI
+ *
+ * This overlay adds support for the Lincoln tech LCD185-101CT OLDI panel interfaced with
+ * the DSS0 display subsystem on BeagleY-AI. The panel includes capacitive touchscreen support.
+ *
+ * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include "k3-pinctrl.h"
+
+&{/} {
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pinctrl-names = "default";
+		pinctrl-0 = <&backlight_pins_default &backlight_en_pins_default>;
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <6>;
+		enable-gpios = <&mcu_gpio0 11 GPIO_ACTIVE_HIGH>;
+		pwms = <&ecap0 0 20000 0>;
+	};
+
+	lcd {
+		compatible = "lincolntech,lcd185-101ct";
+		backlight = <&backlight>;
+		/*
+		 * Note that the OLDI TX 0 transmits the odd set of pixels
+		 * while the OLDI TX 1 transmits the even set. This is a
+		 * fixed configuration in the IP integration and is not
+		 * changeable. The properties, "dual-lvds-odd-pixels" and
+		 * "dual-lvds-even-pixels" have been used to merely
+		 * identify if a Dual Link configuration is required.
+		 * Swapping them will cause an error in the dss oldi driver.
+		 */
+		power-supply = <&vsys_5v0>;
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+				lcd_in0: endpoint {
+					remote-endpoint = <&dss0_oldi0_out>;
+				};
+			};
+			port@1 {
+				reg = <1>;
+				dual-lvds-even-pixels;
+				lcd_in1: endpoint {
+					remote-endpoint = <&dss0_oldi1_out>;
+				};
+			};
+		};
+	};
+};
+
+&main_pmx0 {
+	backlight_pins_default: backlight-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x01f0, PIN_OUTPUT, 8) /* (A23) ECAP0_IN_APWM_OUT BL_PWM */
+		>;
+	};
+
+	touchscreen_int_pins_default: touchscreen-int-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x0038, PIN_INPUT, 7) /* (J22) GPIO0_14 TP_INT */
+		>;
+	};
+};
+
+&mcu_pmx0 {
+	backlight_en_pins_default: backlight-en-default-pins {
+		pinctrl-single,pins = <
+			J722S_MCU_IOPAD(0x002c, PIN_OUTPUT, 7) /* (C4) MCU_GPIO0_11 BL_EN */
+		>;
+	};
+
+	touchscreen_rst_pins_default: touchscreen-rst-default-pins {
+		pinctrl-single,pins = <
+			J722S_MCU_IOPAD(0x0030, PIN_OUTPUT, 7) /* (C3) MCU_GPIO0_12 MST_RST */
+		>;
+	};
+};
+
+&dss0 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* VP1: Output to OLDI */
+		port@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			dss0_dpi0_out0: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&dss0_oldi0_in>;
+			};
+
+			dss0_dpi0_out1: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&dss0_oldi1_in>;
+			};
+		};
+	};
+};
+
+&dss0_oldi0 {
+	status = "okay";
+	ti,companion-oldi = <&dss0_oldi1>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			dss0_oldi0_in: endpoint {
+				remote-endpoint = <&dss0_dpi0_out0>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			dss0_oldi0_out: endpoint {
+				remote-endpoint = <&lcd_in0>;
+			};
+		};
+	};
+};
+
+&dss0_oldi1 {
+	status = "okay";
+	ti,secondary-oldi;
+	ti,companion-oldi = <&dss0_oldi0>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			dss0_oldi1_in: endpoint {
+				remote-endpoint = <&dss0_dpi0_out1>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			dss0_oldi1_out: endpoint {
+				remote-endpoint = <&lcd_in1>;
+			};
+		};
+	};
+};
+
+&main_i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_i2c1_pins_default>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	eeprom@57 {
+		compatible = "atmel,24c256";
+		reg = <0x57>;
+	};
+
+	touchscreen@5d {
+		compatible = "goodix,gt928";
+		reg = <0x5d>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchscreen_int_pins_default &touchscreen_rst_pins_default>;
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <14 IRQ_TYPE_EDGE_FALLING>;
+		irq-gpios = <&main_gpio0 14 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&mcu_gpio0 12 GPIO_ACTIVE_HIGH>;
+		touchscreen-size-x = <1920>;
+		touchscreen-size-y = <1200>;
+	};
+};
+
+&ecap0 {
+	status = "okay";
+};

---
base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
change-id: 20261104-v1_beagley-ai-lincolntech-lcd185-0ab3d7bda52f

Best regards,
--  
Swamil Jain <s-jain1@ti.com>

