Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023126.outbound.protection.outlook.com [52.101.127.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D2431B80E;
	Thu, 10 Sep 2026 02:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789008758; cv=fail; b=PxXlMwvzuITky/619jp67IAsoBoWuzR8pXA+rOBncv9Q8VQ7C2r91lB61vzLDX8HgIQFGJ/mH/n6gAKqRsnO200LudQz0sy84Y6kChEtAn2qKbvxxfI7yQmSnrXOVCy4fTrZAK5FGD6f/Jesk1D1sNvAGso6e+ibSikFgkN1YGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789008758; c=relaxed/simple;
	bh=THV/EZxwE8+Ba+CmwRmBp/QJVgw/K5FkV5DLrHZOc38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LuWBUeUDNr7155JSXHW2XzZM9ePxgVZINd6vf2U1dlmQ2qYazDxFuCY6+EXSu+CbcaDMxp/6lXIdeRYXu3uUcxjqNRmiuWDfZFJpRzKtvBuCXbd4B0TnGF6ISZmmzpVf4DJvVRPp4JQg+S9Jd3au5OqrfVt1+DNaQVQC+Vc/zGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ud8g3HCv8lIZfwtlLjOeouwtX4vtOx89I2U0ldlrO1doW2JAkhZK5OzvzQwjqxwI4ZaQTh2wF2VoTJnCJfn97qHjlfaM6L2d8jUnuB7cnb7R8Bjony4E08hd1xwjYH5Co4dq+JLMCwOjdoZT5sek97U1QLYKm4PLkRSIAJUrtehVwlFOIQc/glOBmJn/xStv5W8l1o/z1MhhACL9wToZVpWsiub2TxzX2dLB9bVDM0vFtf4dVrgZCeorqJa3gempah3wo6tFdzJ8BaNankPOu1XFC4Rq+CPSf030QeXODj2lkvUvrgxrEJDBIkBFkrt0dlTEsIegrgmhEExBMEtvWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GomFmuATENrI7QE0xTIQNphH7lRgOJ3vvZ/t2nKBz3g=;
 b=jqc/+rKWIGKrln9Dxglmo49nOxVmsY0Rgj7O8te/NMbaxfvzyHM2BKvPICxl7VC05eTMXjHDdniqWmmtwwgvo8PTIkWJAqoEbdEtYWMNCWVWeR8xClohQcZsktcg6LgucmtECloBAEqhzmmxJZxIlOcpfEEKLENk4lyb7GWczdLbvukCaDo4bFvlCSUw3DKdDVReGSfXUK8znDq8ufx7Vzyqoeal58NNHVjMff+CMpXQmCHSrPumPzGuytP8ouqPAcz8weEPUzpB9vq9sLiY5oWvlqqidLDJEvmJrwsmQCGFVgf73grX5w9Q37q0QxMRSK7slSoOBKgLT/bJad3bDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR04CA0003.apcprd04.prod.outlook.com (2603:1096:4:197::23)
 by SEZPR06MB6642.apcprd06.prod.outlook.com (2603:1096:101:17b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 02:52:32 +0000
Received: from OSA0EPF000000C6.apcprd02.prod.outlook.com
 (2603:1096:4:197:cafe::6e) by SI2PR04CA0003.outlook.office365.com
 (2603:1096:4:197::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Thu, 10
 Sep 2026 02:52:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C6.mail.protection.outlook.com (10.167.240.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 02:52:29 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 48F8E409211B;
	Thu, 10 Sep 2026 10:52:28 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hongliang Yang <hongliang.yang@cixtech.com>,
	peter.chen@kernel.org,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	pawell@cadence.com,
	rogerq@kernel.org,
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v4 2/4] dt-bindings: usb: Add CIX Sky1 USBSSP controller
Date: Thu, 10 Sep 2026 10:52:27 +0800
Message-ID: <20260910025227.2490151-1-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <7c52bcf5-8b58-4c15-bf1a-ba7a0bb04db1@kernel.org>
References: <7c52bcf5-8b58-4c15-bf1a-ba7a0bb04db1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C6:EE_|SEZPR06MB6642:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 30a5d185-74e5-4bbc-83e0-08df0ee68e2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|7416014|376014|10067099003|6133799003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	qqynJjaIgWFzvP6bEXwZPQNNY5i1rGspel+G+Ca6G8DFKIrwSenscDcrI10gGOQy+wLTu3AP1O4h79ltKS2pCGsMFueDGTpX+NZN8/jhSQBR+xM4vB6r2GUdzTp9iXZEssKlb5jHSm2eMnA7oKBE+VHnc4ZAGJLLp+WuItY/iHXx9itOmnya251WAT7jlwUEJMbE+Iw+xtVAWJP1r9iFvq60sLe8YqyS48AsX/3wXR2XnJPyDB+fxeQkQJ29t44YAsefLt9QJbplwiKl3UcY1Wj9Btmm9yso2mhX3bKVffO+0qvEhhAhri13clPWMQGx1HFjDGkt+FRPf/XiJFh+sG2xLvG1HPzfm0jyf9vvxdA3kvAyDCvNZkxytum3L0QfC6bws1R1jk5pykr/DAgSbmQQLC3dV5cxiXHZDoswjvUxAwNNiCReRWykMe6MaJ2XCEbEjw9U1gfRVGDseL9k17ukthRuNzwnO1izbzOE7JScARAT112gXwfvVamBZdwIZmUdkWm6OiVy/aoIzLevqGHT3k3BrCk9Wl6Ccl6QvJzjhLLiAxxSHk+sla4YW2ot8/jC4EnRd6IUYHiUfGhD+KVDIEJawMHzQDXxlS8DE3HL0z3gnUFOoY9+2PWoG/D1nq1d5HiqTGrE+1TquI/0KX703h3+bRtiZZrBFR7bzbNJV4FzJ26Snscpkw0PX9sh5tOHAqAYOvIwsOQoHWSHIw==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(7416014)(376014)(10067099003)(6133799003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	u9yG5b0TE7JULe9BAR2Uagb0KnB+AG5C2w6CHfhTZZ1/NNTdAKaoigDrVvGRuDq7GNfjbF2YHDHZPFkgr0OV5oRU7iR0rUKrGBlTzvbfI5lHBFFWI6qmLZjE0eqGJ4wVXSwLpijwjNvLSG8s4uCAWRXuZRVl6ZYsMonp0erDQzWdSJEHSPQz+LPV4/nqP8iGMo7UEMQKqyMPexJoTV2WRcNWON4zAwjIhzPYxmnCrlGplvg0bj2vqtodlDKpDXsPng4ZJQEuHRvB8XVyFKcvQguba8fIiS0MCUmN340219mErn3PjpHB5xhRJA5LPsd0D+YxHqCq4AG7otyKrgTD929thpy1PPfNKvaNRyYgXUrM//UP+2VnwHEqyYlbWbaXb7qJU5B+WaJg4YzH6vTrRASKici6sZxrMbk+U+iC5XqriE4Xjn8MD/h/cAlXoSLi
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 02:52:29.7850
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a5d185-74e5-4bbc-83e0-08df0ee68e2b
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6642

Hi Krzysztof,

Thanks for the review.

On 06/09/2026 08:55, Krzysztof Kozlowski wrote:
> No MMIO here?
>
> Then this is your device.
>
> Last time you claimed you have TWO registers. ONLY. Now you claim you
> have entire address space, but somewhere else.
>
> If you do not have here MMIO, then this glue layer is not a separate
> device node and you should have one node only, just like we did for
> DWC. One node for glue layer and CDNS USB.
>
> If you have here MMIO for some glue over IP block, then it is unlikely
> to be a syscon.

The glue layer does have its own MMIO: each controller has a small set
of RCSU registers (an AXI attribute configuration register and a
controller status register), so I dropped the syscon node, the
cix,usb-rcsu phandle and the separate cix,sky1-usbss-rcsu binding
entirely. The glue registers are now mapped through the reg property of
the glue node itself.

One complication is that the two controllers (usb4 and usb5) share a
single RCSU register region and their registers are interleaved inside
it, so neither controller owns a contiguous slice:

    0x091c0300 + 0x14 : usb4 AXI attribute configuration
    0x091c0300 + 0x24 : usb5 AXI attribute configuration
    0x091c0300 + 0x100: usb4 controller status
    0x091c0300 + 0x110: usb5 controller status

To express this in DT I made the shared RCSU region a simple-bus
container node with an address-translating ranges, and moved both glue
nodes under it. The glue nodes then describe their registers as offsets
inside the RCSU window:

    usb-rcsu@91c0300 {
        compatible = "simple-bus";
        #address-cells = <2>;
        #size-cells = <2>;
        ranges = <0x00 0x091c0300 0x00 0x091c0300 0x00 0x150>;

        usb@14 {
            compatible = "cix,sky1-usbssp";
            reg = <0x00 0x14 0x00 0x10>,
                  <0x00 0x100 0x00 0x10>;
            reg-names = "axi", "status";
            ...
        };

        usb@24 {
            ...
        };
    };

The Cadence core stays a child of each glue node with an empty ranges,
so its addresses are unchanged. The driver maps the two glue registers
by name via devm_platform_ioremap_resource_byname(), so no driver
changes are needed.

Would you be fine with such representation of the shared RCSU region?
The alternative would be to keep the glue nodes directly under the soc
node with absolute addresses in reg:

    usb@91c0314 {
        compatible = "cix,sky1-usbssp";
        reg = <0x00 0x091c0314 0x00 0x10>,
              <0x00 0x091c0400 0x00 0x10>;
        ...
    };

Both work with the current driver; I slightly prefer the ranges variant
because it documents the shared region and constrains the glue
registers to the RCSU window, but I am happy to go either way,
whatever you consider more appropriate.

> One more syscon?
>
> ...
>     cix,usb-syscon:
>
> One more syscon?

The cix,usb-syscon phandle points to the Sky1 S5 system controller,
which holds the USB mode strap controls shared with other USB
instances of the SoC (it is a genuine system controller, not a
register block created for this driver). I will clarify that in the
binding description.

Best regards,
Hongliang Yang
