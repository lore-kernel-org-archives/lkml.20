Received: from ZR1P278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazon11012066.outbound.protection.outlook.com [40.107.168.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA1735C6B2;
	Thu, 24 Sep 2026 20:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.168.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790282805; cv=fail; b=MhLcONv7ySIOjS4yh2+/IPw4IWH0fsK08Wr8uw7iEmenJ+0Y8G+qUn/AdlAN5t4vL2oLRz9hVt4fvrONV+3c59z8+/KH9NVIzsjklGGnf1tEkLCleepy/8Cfq33pUbBWtJIKdSwmcrKrWZCvGV7tZa57k7DYiOw821prJHsEWSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790282805; c=relaxed/simple;
	bh=TwCS5BKXoEVDTyQbDIcMR7LUpr3zSf9RylqtYBwJjNQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Y7lpdM4aab0L9ilorMPMovFgnHOa1EM2DpNqwa4mVWdI3drDfjH/cX2dy7UPozN5Pkiiy0ygEa1qTbLhYUP4GRzDJjWPXLmsKiu8zluindOcsRQU9mFFugdg/eaQ61G3QISm4Tlo43IbL1XM6d8CGRDzEwktB43DmVBLJRMLbtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch; spf=pass smtp.mailfrom=cern.ch; dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b=ZooMBncW; dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b=ZooMBncW; arc=fail smtp.client-ip=40.107.168.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cern.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b="ZooMBncW";
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b="ZooMBncW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=junAjtRDGSZzefiL+kRC+UXy1THRBflvoyzja0wgiTKGSnJLXP231gkE3QXfEeGNMTVGG2XzSA8BgejismG3wsNfl9EFPLl69C8vfjpHEwAlRKKrkdQwpevh+hsOPS7MdYr7g4DZlMAzbvX67bjrrzpzGlRsgYHxVtWkcyxQTaqo0xkSlvrDv+EPBw2C1sx1TNI79zAe5p/QEOfYXVsftSSSV3DYxqjMOx7j780C9Ad10VeD3Evllu9E6yaBBwNd/u+HwEThJJDqWrRFQiCKMgoY9LnWi7qmfGIullzRv4wI2CX00rxkQZ8Y4WvtX3xzOyCMiCHjrU034j0pZG48Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UHgoa2jL1wubqP58mT1Fbrhtaw3zA0VODx6Dgt1ci/U=;
 b=L7c/9XfqXdx+T/PjaHrl1P7jRqGlV49Xzyv/ziBOcGZY5huAwI4PCdogC7TM1xNy4jH6ne/rQB6BKQE7pY1B7wd/042QIrhzXdjgNB2LD0KbuCFCLPvlgIjEcjPOIfcZRkiPY3g/Ic29E8bRTrA0TDud0kJWt05JKTR4ztAh1PwTKe/Yy3SWMO08GL2fbY3o1ABmVlyQqSitk0l/WLfMLPRfZETNSnjAKH5bqE+OmzJpc89K/Kyf3Vuv8P7V1Ha1+DwfYrzWaPrFAcr/z+WE9xnMpCCE1awuUdjExNRIhEKCwr87kPwUUG0CH3QKUi1CY2165YRzEP1loe4dWU0p6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.208.138.155) smtp.rcpttodomain=kernel.org smtp.mailfrom=cern.ch;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=cern.ch;
 dkim=pass (signature was verified) header.d=cern.ch; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UHgoa2jL1wubqP58mT1Fbrhtaw3zA0VODx6Dgt1ci/U=;
 b=ZooMBncW8G+7krzMZLTKlmJyaqkz5ORXYefxZ+W0g7+EM2c9GqO7+TVzZT7aj/No4kjxWLRxCtduBg+dzd6vulGs6aPkRcAonOVSRLM7ea+RzS49zp4KbGrDF8E1ZlexIqBssbV1eQ1LxSJe0ZofdvNKkxaWiPNEIbsyrtrLfNs=
Received: from VI1PR07CA0286.eurprd07.prod.outlook.com (2603:10a6:800:130::14)
 by ZR0P278MB1513.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:a5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 20:46:38 +0000
Received: from ZR1PEPF0000E460.eurprd04.prod.outlook.com
 (2603:10a6:800:130:cafe::a4) by VI1PR07CA0286.outlook.office365.com
 (2603:10a6:800:130::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Thu,
 24 Sep 2026 20:46:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 20.208.138.155) smtp.mailfrom=cern.ch; dkim=pass (signature was verified)
 header.d=cern.ch;dmarc=pass action=none header.from=cern.ch;
Received-SPF: Pass (protection.outlook.com: domain of cern.ch designates
 20.208.138.155 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.208.138.155; helo=mx3.crn.activeguard.cloud; pr=C
Received: from mx3.crn.activeguard.cloud (20.208.138.155) by
 ZR1PEPF0000E460.mail.protection.outlook.com (10.167.241.58) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Thu, 24 Sep 2026 20:46:37 +0000
Authentication-Results-Original: auth.opendkim.xorlab.com;	dkim=pass (1024-bit
 key; unprotected) header.d=cern.ch header.i=@cern.ch header.a=rsa-sha256
 header.s=selector1 header.b=ZooMBncW
Received: from ZRAP278CU002.outbound.protection.outlook.com (mail-switzerlandnorthazlp17010021.outbound.protection.outlook.com [40.93.85.21])
	by mx3.crn.activeguard.cloud (Postfix) with ESMTPS id A3B7281377;
	Thu, 24 Sep 2026 22:46:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UHgoa2jL1wubqP58mT1Fbrhtaw3zA0VODx6Dgt1ci/U=;
 b=ZooMBncW8G+7krzMZLTKlmJyaqkz5ORXYefxZ+W0g7+EM2c9GqO7+TVzZT7aj/No4kjxWLRxCtduBg+dzd6vulGs6aPkRcAonOVSRLM7ea+RzS49zp4KbGrDF8E1ZlexIqBssbV1eQ1LxSJe0ZofdvNKkxaWiPNEIbsyrtrLfNs=
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=cern.ch;
Received: from ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:5d::11)
 by ZR4P278MB1785.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:b4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 20:46:35 +0000
Received: from ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 ([fe80::79ac:8d79:4b56:709c]) by ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 ([fe80::79ac:8d79:4b56:709c%5]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 20:46:35 +0000
Message-ID: <b42f6bb6-5315-48aa-ac14-e858f3d11e39@cern.ch>
Date: Thu, 24 Sep 2026 22:46:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] arm64: dts: qcom: Add hamoa Samsung Galaxy Book4
 Edge devicetrees
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, marcus@nazgul.ch, marijn.suijten@somainline.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, abel.vesa@linaro.org,
 abel.vesa@oss.qualcomm.com, johan@kernel.org, konradybcio@kernel.org,
 kirill@korins.ky
References: <20260920184148.31541-1-mstoretv@cern.ch>
 <20260920184148.31541-4-mstoretv@cern.ch>
 <20260924-curious-sociable-nightingale-66ffaf@quoll>
Content-Language: en-US
From: Maxim Storetvedt <mstoretv@cern.ch>
In-Reply-To: <20260924-curious-sociable-nightingale-66ffaf@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0155.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:346::15) To ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:5d::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR2P278MB1053:EE_|ZR4P278MB1785:EE_|ZR1PEPF0000E460:EE_|ZR0P278MB1513:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ab74593-2e3c-4a67-649d-08df1a7cedbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|786006|19092799006|23010399003|376014|7416014|366016|1800799024|10067099003|56012099006|5023799004|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 gGuAjtSxg2uI+FlRo3zorUFhJ3ZnJ1rWlaiN45rCNkf695btk4nxvBvMHD4lXMdPwWduWuGuTA2f7yDGyqe0ir6OIhgEY4hbEQYBfvhOCMhvQtUIBTF0mtNaYM0OkIJKUT1/CMrd4ABuZWwHeYh4/uF10HCmdLQCc2KnruvJfD+/8dlWOGvtmV0ol2QzRECiaSV5p5RTvgq8tMmgyFSdz0oboAk3QbI1ttzFxp11SkBO3pFGx5Y9gznFxOlynrXB0lTGnS54OYTV61FjKCAHLwEKtVa/uZOVu6Cb+iQylRYsPuLqre4Nvf6U1lTRTXr0L0dbzVdQsKWFNeFaVwld+tPP3htYWIM/gUqUNF2Y0PmMGkpt7DJhgcmAg9c7hWnDxDhcynSlXUVE+gy5D6SjMPOj6FR1O0dmcJL74VUGKdHHbklgX3qkQLWB/oZNeXE/BwgzaI8OR8kMyVDOgco2Y7WLdfixCqMlsKc07Hk4nTuFEa32wHJ0MmxqewY0UloXtdS/07lrNWRnznP+PGR6lL0qhVro3wEx97uKJf6Cpa9q5IOaplE4hXsdPSYmLOM3lwICgMUoyXsLraKeLhKQRmmR2a9OFlL7P+VqhOIIKCo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(786006)(19092799006)(23010399003)(376014)(7416014)(366016)(1800799024)(10067099003)(56012099006)(5023799004)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 EVA3IjF7n2CHTd1D9zf+iPLJFwGdsGDEQhX4oPabGwtJALsHnJedxzeHn+JIwlPQFG54SLjV0Qhj+5q68aszMGLVZPYVB38Jo8q0/bZsLmVj8UNd76hf2cFz2AgPYrb4biKPKrU4CfUwwZC7hVqy6Apt3FlRW3l7O6dQebn5lwx3iWSTNuu7M7DgGo9ry1VIKe8id+mFMzg7Eh8VAGDAFk7DYjnsmvg5FidUfIfBET0vyOJHESXZ/BCT/5odfevGFbypYsVFXcB1ShdGVxBZhUg1rYK5tLIrX+EJlYuKxZ/SFtI0BUkF8h/r4kYXjmXpBP8h4thTkHuIZJeQ/q2nQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR4P278MB1785
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 ZR1PEPF0000E460.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4d922db7-06e0-4021-e249-08df1a7cec55
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|786006|82310400026|19092799006|30052699003|23010399003|1800799024|35042699022|7416014|376014|14060799003|13003099007|4143699003|56012099006|10067099003|5023799004|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	EGRy43bhM3ziTL7d4x5h7cw4vAiOzUovuGlTL3QFlBx4tmKxyf5RfWLxh2rmr6iY1/qPvR05Hvg2Ptir5qVLTJcZgk21ROG+NKRVBids2tnW5fgZ9vHooSusspb4jpHH82Qrv0J5qByVj3itevFQMXhhk62s5ZbLKcPncU/agQJhWv4bs9Dyu9Lj7cNqFUEZVZKEEVzAzub8kfNxXZ0yfkETZMShbxGGivr6vgIZogViV02JDPNvmlXxbbPuIRsKJ+RA9T6bf0d9aHDvwL4c6oh/ZrKtFaPNjVIPclODW93H6qqO+aY7NhBmo5UWFGc8hF4vYxymtmEhNt4l03b58qLXmh5O+gKPUhCGtiLAhP3A/h1JdR4hVvIGtsVd1+oNN7jZBatppf/DSyR6R4mK8S96dQU0vSgsLZsMk3OcmI1vJCTFs50khimoZjjG2Ijdb/8ikfeoxAlkgfEnMCxu9Xv/baX1nHLV5mK9v3dehAoMkt08VM1bX7DD8twOadmVXXfULv+Gy0WwuccCZ2I/q4CdpP8kLdKQZOP/VONGAP0Wi4o+CCcB9rMDfCiTs6BOGXs6Ac/1ukKCdFoiJO/uacPRD3IqlmDoVJFUaWCVOQUNhl+bJ8pXNrl4p/okU2L600BEqB1JWGu05GkIORSo/g==
X-Forefront-Antispam-Report:
	CIP:20.208.138.155;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mx3.crn.activeguard.cloud;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(786006)(82310400026)(19092799006)(30052699003)(23010399003)(1800799024)(35042699022)(7416014)(376014)(14060799003)(13003099007)(4143699003)(56012099006)(10067099003)(5023799004)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KqlX2LIbTpLDkn3XbqIUsprjh/iPNDxDU1zQeMsnaX1y4DvbEa49K5uSZ1jELOJxZCv0NIow9OSK1oEippLXYcKKMUsIQO3n64Mi3/JJQmmNujwy4F4pv34sIMm3aF90q6aoQlJx05wOc7eznde9QEoEAw15Re+BnSRN1YJZ1XtKAdZJazvB9q1Nkmz1z1LfQ0RwBmK21AbJkSKNKscP3qA+e3HwS6wwE6nwUqGp92MzH+tVCGKQTOkGCIt7NruyqSMm3vhTwa6LQflsNvJ0o1nIxJLrxTKAJsltB6HGuqbrLrnZew8Ntvjl10W6klO/L+VQnkHAeNBJXO4r5Vo4E6c+gz8X+ZmkqBrDjKJfAoufmGTqQGhXm3EfxvjJaSV/gZdgiqAVQh+j/iA2m8oNUMRxDv7MiILnmNil+gCMqxzhUnKmJnoqTtgtwdkr+jNC
X-OriginatorOrg: cern.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 20:46:37.6264
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ab74593-2e3c-4a67-649d-08df1a7cedbc
X-MS-Exchange-CrossTenant-Id: c80d3499-4a40-4a8c-986e-abce017d6b19
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c80d3499-4a40-4a8c-986e-abce017d6b19;Ip=[20.208.138.155];Helo=[mx3.crn.activeguard.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	ZR1PEPF0000E460.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB1513


On 9/24/26 15:08, Krzysztof Kozlowski wrote:
> On Sun, Sep 20, 2026 at 08:41:04PM +0200, Maxim Storetvedt wrote:
>> Adds devicetrees for the 14-inch and 16-inch hamoa SKUs of the Samsung Galaxy Book4 Edge.
>>
>> These use a common dtsi derived from nodes that were able to work on Linux
>> from the initial Galaxy Book4 Edge DTS by Marcus:
>>
>> Link: https://lore.kernel.org/all/p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms/
>>
>> combined with the patch series the Honor Magicbook Art 14, which shares device similarities:
>>
>> Link: https://lore.kernel.org/all/20260629154812.9066-1-mail@etehtsea.me/
>>
>> as well as a few more adjustments on top of that again to get additional features working.
>> Special thanks to Jesse Ahn for helping expand on what would eventually become this dtsi.
>>
>> Based-on-a-patch-by: Marcus Glocker <marcus@nazgul.ch>
>> Based-on-a-patch-by: Kirill A. Korinsky <kirill@korins.ky>
> 
> There are no such tags. Don't invent own.
> 
> Either they provided SoB for the code you used, or not. If they did,
> then you could take them. Otherwise not and read obligations on your
> side expressed in DCO.
> 
> Also look at Co-developed tag, if that's applicable.
> 
> Best regards,
> Krzysztof
> 

Not formal tags by any means; both of these patches have been very
useful though, and should somehow be highlighted. Bon, to be revisited.

In the meantime, there seem to be some sashiko warnings that need to be
addressed before this series can continue in any case.

Cheers,
-Max

