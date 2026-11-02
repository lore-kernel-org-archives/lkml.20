Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793596870;
	b=KK24qzyUsPBV8WX3oJQPHeWAD1r9LzRVORuG6s7bvGHvedQ94EuaimDn3uSvWjhE9rRE
	 VpazWJww8BpSagg1GFd8Ff8VgXPDCC0ggKsEFzhlVHspXMRyEN7pTf+DEYyBoKQgSZv98
	 u5Amns6wzD4qV0LzUVNQo/wjA2RK29G29UBxHM1r70JtWKlZLImWE04S+76rqAuZtEDKp
	 SFogWufLXeqY0A3f2jn9dV19Is2OtbXkKuE8OJuE+WXhKupEBS4qWzIQZKnJrnFK0rQgE
	 6pQt/pX9W8Tm+YN/Ie8xx6OUT7O7LQmkcBeL94VURnkJfsRqGkSU3qxwuyxSgII3HwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793596870;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:CC:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
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
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=b0cG3//j0Sc2AcD1R5ngdZ67dNjJRt6wVVyx7se4iFw=;
	b=49KIEb1tGzdobUF0ncybkB2H+dSExj/mMyD+wPjIY90U+R++vvxFxTq6kvgJYU27QZBF
	 xkpLwd9bX/CuEI+xMwkBe3B/0ozCsZbRBUBBSGFVtj2nBANFWSjr1LSjIvz8KXtFnqdsT
	 lyOTujrAscABU5ZM1ZYg7oj8ETKp1iS2HXBCNRnv5pZEEw8OOrDiPEg5WQYPgmYNLSmWf
	 UoDCPmRIKqjBHBmLF/ErvEzQ1hT7F3CK9W+ao5JdlOnJSAU13EWCE2nndktf8rkL2zQVB
	 f5n8GFPATfxcQfX5Hvg5nyifGSoBglujlA8mFtLW3/h4KhVpM4O8Xu6oCOThJAL26gQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=pTYjLNPO;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=Qn7DyDky;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1501A606A326;
	Mon,  2 Nov 2026 05:21:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1501A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=pTYjLNPO;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=Qn7DyDky
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23w5K54151432;
	Sun, 1 Nov 2026 23:21:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=b0cG3//j0Sc2AcD1R5ngdZ67dNjJRt6wVVyx7se4i
	Fw=; b=pTYjLNPOUkuh0oVqiw53wpykZ6KskyBV+3080bA9+OHthmdVOqB5io2pi
	jcGYI4VB0TSlzDogLJq+9pvNniyIjtvxPvf+tR2W60EgmGemPjtysKcHEYg62Ocs
	YesOs/EXlF5AQlTbsAq4AwZwneZZ70qAXzAk3y0xwWqGEbYhdJ9YNE0gtviwQL1e
	kUZG1FBzDiw1ra8mlM7RQMvYZfklVI/3SZ1s8mnCz92RHCyuEDOvBpvubdL9aTxV
	9jYaUDEjpA5vyt1Z6UVVDIBu9ropcM+60m6AhoHrMktrAQBNeUL5imJ2VlwZ5jMT
	OczViFRs0bEndLb/a4iGKitJcKkgA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011067.outbound.protection.outlook.com [52.101.57.67])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hnyq5ksce-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 01 Nov 2026 23:21:02 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GZI/fPf1RPqS+C933Er9q4SeZSgNLpoFrP1ysbNmPsXFPXiKzpGiyOOiKr+dtA79jF3QHuAqr5M/lohv6JAKK8okbj/h+wUj9YpWu3OJXanYx0TgVfeQttLv+bO6sRwvhMU9P0bnUOoVDAvAEke13idwXUUE3hyMDLSSKf0ptKNxEro2C9GzlXcrQIBUp+I12BY4ZEQ65PrQonRaSJarPCYo3ommfakZoPV1HJFfH+SvgNa2dOZU9onL1ka5+TESOUXMroctOH/9ua7D129DWNiACU/SLC9fZ4o4jkzpEpQsOAfhMtYD+uHEhoEDGK6iCkMB2c9TcyNbiC+nUH0qOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b0cG3//j0Sc2AcD1R5ngdZ67dNjJRt6wVVyx7se4iFw=;
 b=LU/nl95T6vbE0ueTuaIK/eplppPHQG1kXizgF0U/57QQXan+ufKnZEuidVHeOdgtMq12t1eVEL4st/G8vp/aLSr9uKnOAvlntFl/c1WvVlHjmEgLbNjX2clsfzLXT6LKuTqGoDz1tda3dY+jCSF9tSZLdmm+217mywBNBxz9WmYnepAeKR9HMo2Q6f9gvoF8OUV5ZZmHlHXpF03idhJio24aAXOHN53E2c538Ib9+NntXI2yOiAcwrik3UAP+fo7A4lK6NdZPxEfZ4xo2BkbwAAScBepiK+t9aNr/KbnrtC5wD3dKp7iwzwB1gbB2L8V9a5PyFkkgnebm+yh7IEwAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0cG3//j0Sc2AcD1R5ngdZ67dNjJRt6wVVyx7se4iFw=;
 b=Qn7DyDkyXmEQJ1qMZ2yfo43KFAU/6ryBvdEOd2VoryW5Be6pncuBj/Mwjm5DACrTI1lneBTiA/7l+zpfYUO1JnTBWpvmI156MABW3jDa6XKH1LRQLHviw4QDOR+2LV+SfIj5ry1rlaXZpvRUJsWRwiwRLJZubvxxaHEY1VnzE1o=
Received: from CH0P223CA0002.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::21)
 by SN7PR10MB6642.namprd10.prod.outlook.com (2603:10b6:806:2ad::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.13; Mon, 2 Nov
 2026 05:20:58 +0000
Received: from DS2PEPF00006E21.namprd05.prod.outlook.com
 (2603:10b6:610:116:cafe::81) by CH0P223CA0002.outlook.office365.com
 (2603:10b6:610:116::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 05:20:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS2PEPF00006E21.mail.protection.outlook.com (10.167.23.214) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 05:20:57 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 1 Nov
 2026 23:20:55 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 1 Nov
 2026 23:20:55 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 1 Nov 2026 23:20:55 -0600
Received: from [10.24.50.20] (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6A25KnAM445775;
	Sun, 1 Nov 2026 23:20:50 -0600
Message-ID: <b53d0986-33fd-43d3-a03f-2bbb39dda42a@ti.com>
Date: Mon, 2 Nov 2026 10:50:49 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: soc: ti: Document the
 ti,tda54-mcu-scm-conf binding
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <conor+dt@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <nm@ti.com>, <ssantosh@kernel.org>, <u-kumar1@ti.com>,
        <gehariprasath@ti.com>, <vigneshr@ti.com>, <afd@ti.com>,
        <a-limaye@ti.com>, <y-abhilashchandra@ti.com>, <johan@kernel.org>,
        <kees@kernel.org>, <jm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20261027083700.1964371-1-m-shah@ti.com>
 <20261027083700.1964371-2-m-shah@ti.com>
 <20261028-inventive-screeching-bettong-9f4240@quoll>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <20261028-inventive-screeching-bettong-9f4240@quoll>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00006E21:EE_|SN7PR10MB6642:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fafde02-0004-40dd-c1c2-08df38a11391
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|7416014|23010399003|36860700016|261021121427099003|6133799003|22082099003|18002099003|261026140227099003|13003099007|3023799007|261028144727099003|261026121527099003|56012099006|261022105027099003|261009223027099003|4143699003|10067099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	A+9/VenJSuS5ahnDeIK7XDfxeLFb+ttK9QnTscsmLGdFj9f/XlMiLFyZrLOOpubQEsOe7oghw7MMVa3QJJGAVnKIi7ejB/VksWCg/B/aff04eHb5VkXMtgvIr9mCGFBz6+VW7TKIsOG/6xuFqfJ/GWzUIvbDpt+wjxlPmeDSaS2SVUzuKOncy86bj/wCLGVJWZnGsdyEBDkIRewxfUo33l8bktsmvbkAmzzZouVVN0+Bms1Ra+hd0q+d0z2fwAF83/JL6k4ce2Y64mtyzdpn3+UrbbFTHs8SMqlC1Q0G/Q0Z1eQNcXmlYeIexAwAb8BhyI+It2F1UnfE4hffqtI4q4ALX1KugrKShRwTb46UK1+LBhylnQC7j3okHbsYSmLN7FHVwnC1m9zUu3u3e8hzywzxzGtxz50089SOgGtr6Jv1TnCHfeosr9JBWzVRkMGURJQ14F5UFB59nLJiWzTKqUtbeEeJ2B60Z+La1reHUmLJm3kwPg0VsedipwiPQSUTcwioq5mY6QmS8H4imd9GV/RjAsKiElpWwx9sk2CcBiBPQ14kbxMeQhw+YumAl3xR5r/xs4i0Tibnp656kM49Nff7/LvEJ+Fj/6xoyLzdQPTUl6HP6z8sdGfT4RTWwgK5R+2B/ERaAUiGagWoc/aNJA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(7416014)(23010399003)(36860700016)(261021121427099003)(6133799003)(22082099003)(18002099003)(261026140227099003)(13003099007)(3023799007)(261028144727099003)(261026121527099003)(56012099006)(261022105027099003)(261009223027099003)(4143699003)(10067099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VbG0QD9A4np1BUJnti7CtDKyq0SFVClCL1HKRGr6aI2+XpKuE5h3t26JgVAwm6oOFhhzyoD+N/R/iDhsqB2kfoapSbp8jlCd8V7l6NgvZQet/Ld+1vqGX22Fcvh4IBy02jW/5/vsYdXhQTwkB3INahQUt32uORXg5L4WXwv5e7lBgvBnZOYieZZoNUf6+D7/t29Wb6TScPpVSXQYSTTKIhSOb921o89Cuc1u1ntHDCa8Sw26+eHxqT6qi+cvB3Ycrz5WlNcbYEqCCus5oTBVTgWbAZWwlN4CBpGMPJdRNHCDnN5jR2p69TpDwCeB0A6fpOglrH6A+XVoSUpg2NtK5ljtJHizcCKVGu8Lhyi/9npXM9aWwiYVyo184gJHzOIonT5NWPxI9vfzeHl0XJwHnY4F3YkdZ3AjWsmCAoAqXON9BmUR/QwGiirsQl+vYdkb
X-Exchange-RoutingPolicyChecked:
	alNzoUFOIB9iEMPEcKWJtirXglWT86VGBtVsXPEu6kp5zSmjI7DuqbeZfLpkzTjOPb019EtZYVZRv/Eh2+c69Z6i6DDKdBPDb9OK44EnENl+xW1UKkIHhSD4QLRhCEFdY0NEaIvl0UxopyaLDVRY1/Y25nN4J8H//mmjzZQIyH3S4ByJwz9vM4LaBVbT72bgjpORUsX2Xii/KUiv0ZQNsgDMYJU2kgIEs1XtFYOFJ5xpqJabT4FmkOVHCayxKFl2bwJhnl1EgrdVMlCv5jZQCdjfzq/Z3S+LiAjLnZXvF1UF7PANUdIDUToltfFOQRLz3qpofU7+Nt4IJNiEJv+xEQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 05:20:57.8099
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fafde02-0004-40dd-c1c2-08df38a11391
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00006E21.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6642
X-Proofpoint-GUID: PqKn3jL28jlUO0e9hivO_qwn0_DQKA9h
X-Authority-Analysis: v=2.4 cv=Q8tHcI2a c=1 sm=1 tr=0 ts=6ae81dbe cx=c_pps
 a=mt+QW+PagoHSMqpqf5GGBw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=P-IC7800AAAA:8
 a=gEfo2CItAAAA:8 a=sozttTNsAAAA:8 a=cyFs4o_SzGjK0cp6c4wA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: PqKn3jL28jlUO0e9hivO_qwn0_DQKA9h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyMCBTYWx0ZWRfX4sodUsOuf6iB
 kw+0WWG7vNrx/7UBLqONK9ILxF3OVdhXKkh9mt7Q3WJvSu05TK2E4f8yuIQ3EQnGJu8CMWvysD0
 ty+Q9Btv7pDgAj+mDbludIMZAP89cJoieQN3LQLHltwwK/1a8AKpwWebYh9gepye5mEzL/6lmNK
 nQ00w2TVvHM6kuXACbB3+ejpwgNs6WUbaxFrX3Keg9lSZaMOi0YTxrZwB77owRFDTdhUhAsH/ps
 88X252j804uZZaXafZ7zWkclsw4ZfzmFM5zUPgQztahibDEtWsCEBn+1R9pcPlQJgbfXeNwYmGD
 lVGrvecAoJFb/UE7MOZ/KFpwrZBLoj52zHLEKNCSYfpRJE2xc/loQn2W2B2poDvP3TbF5dwKFN5
 3H1ax9o+eCvVPfrH69jvaNZK9Af9xY2konHqMeTxbeWe1HD3M4DxmcgUMFJeoy3rRpdudwTpZP1
 b4RKnvT4BluCEZTofwQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyMCBTYWx0ZWRfX0WrY4iwJy/hd
 NTS17uhyH+J8o0T2NgyMp4zJOv7F3JaoPRFM45pYEK4Ycc57rQHCGCxj6eW3eNS2m1s2PZ9V3Ax
 K5+3yNXoOe9Mxobxi9zyVqxpTrMbSZY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1011
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020020


On 28/10/26 17:54, Krzysztof Kozlowski wrote:
> On Tue, Oct 27, 2026 at 02:06:58PM +0530, Moteen Shah wrote:
>> TDA54's MCU domain exposes a shared scm_conf syscon region that other
>> peripherals, including chipid, access into rather than owning a
>> dedicated register window. Rather than a bare fallback entry in the
>> generic syscon compatible list, give it a dedicated binding
>> describing the region and the proxy/claim/lock arbitration scheme
>> that gates write access to a subset of its registers.
>>
> A nit, subject: drop second/last, redundant "binding". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23
>
>> Some of the claimable registers are gate clock controls, so also
>> document the required "#clock-cells" property that lets the node be
>> referenced directly as a clock provider for those gates. The clock
>> specifier selects the ePWM time-base gate by instance number.
>>
>> Co-developed-by: Aniket Limaye <a-limaye@ti.com>
>> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
>> Signed-off-by: Moteen Shah <m-shah@ti.com>
>> ---
>>   .../soc/ti/ti,tda54-mcu-scm-conf.yaml         | 78 +++++++++++++++++++
>>   1 file changed, 78 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/soc/ti/ti,tda54-mcu-scm-conf.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,tda54-mcu-scm-conf.yaml b/Documentation/devicetree/bindings/soc/ti/ti,tda54-mcu-scm-conf.yaml
>> new file mode 100644
>> index 0000000000000..111cbb739b5f1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/ti/ti,tda54-mcu-scm-conf.yaml
>> @@ -0,0 +1,78 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/soc/ti/ti,tda54-mcu-scm-conf.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Texas Instruments TDA54 SoC MCU Domain System Control Module Configuration registers
>> +
>> +maintainers:
>> +  - Aniket Limaye <a-limaye@ti.com>
>> +  - Moteen Shah <m-shah@ti.com>
>> +
>> +description: |
>> +  The TDA54 SoC's MCU domain exposes a System Control Module configuration
>> +  register region (scm_conf) containing miscellaneous control and status
>> +  registers for MCU domain peripherals, including the JTAGID/device
>> +  identification registers, boot configuration and status registers, and
>> +  device feature registers.
>> +
>> +  A subset of these registers is write-protected by a proxy/claim scheme:
>> +  each register is mirrored across 8 proxy regions, and a host must unlock
>> +  via LOCK_KICK. Any proxy other than proxy-0 must also claim a register
>> +  through its CLAIM register before writing through that proxy. Proxy-0 is
>> +  the default access proxy: its claim bits are tied low, so it needs no
>> +  claim and can write any register that is not claimed by another proxy.
>> +  For example: Proxy0's CLAIM0 register sits at offset 0x3100, while the
>> +  same register mirrored at ProxyN sits at N * 0x4000 + 0x3100.
>> +
>> +  Each of the 8 proxy regions also has its own fault status and
>> +  interrupt registers, but a fault can only be handled through proxy-0.
>> +  Hence, interrupt/fault handling is not described by this binding.
>> +
>> +  Some of the claimable registers are gate clock controls (e.g. the
>> +  ehrpwm_tbclk gates). This node is the clock provider for those gates;
>> +  writes to them are still routed through the proxy claim scheme described
>> +  above.
>> +
>> +properties:
>> +  compatible:
>> +    const: ti,tda54-mcu-scm-conf
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  ti,proxy-id:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    minimum: 0
>> +    maximum: 7
>> +    description:
>> +      Proxy region (0-7) through which this node's clients access
>> +      claimable registers and their fault status registers.
> I don't get the need of this property. You have a one, specific device, so
> why the proxy id would vary per board?
>
> It also looks like re-implementing access controllers.
>
> Best regards,
> Krzysztof


Thanks for the review, Krzysztof. I’ll drop the redundant “binding” from 
the subject.

ti,proxy-id is not intended to vary by board. It selects the proxy 
window used by this Linux instance. One use case we need to support is 
running two VMs with different proxy IDs, with each VM’s DT describing 
the proxy it uses.
The driver reads the ID from DT and performs register accesses through 
that proxy; it does not allocate proxy IDs or decide which VM uses which 
one.

Do let me know if this clears your question.

Regards,
Moteen

