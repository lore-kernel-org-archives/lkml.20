Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023084.outbound.protection.outlook.com [40.107.44.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EC1440A35;
	Mon,  7 Sep 2026 08:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788768927; cv=fail; b=ZFHk4kg5+InRQKO1Pc0gvjNHpvOBaQjlmPVRgjyt9FBMa2y7NK/hwmIMKXvjcquLk2lV8WBkT6ebrdIVtz/bLNbiHTYqL9t+QCqHOZKMx0kfNbbIYOnqYIaBxhVapXImasIOWh2ZWdaDg+JZcEjyF1zMD8zqfxEtJbVbO4CY0Po=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788768927; c=relaxed/simple;
	bh=F1uwANrtOI2IRCWqmz5iH8pf+CSvUIC/EsJwKFZkVWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l5+bu6gmNNyEWmjW6oH/kL7BSMGCGGnEli06ESN3O1mCIsADcOlJKUrL6y7vpSUNqKXH+20TzaBJCc2ZTbowkJ8vfLwGT4kn/ZuIA6S2/NqcQ20wKK30yyNpPDtNQbilXOChoQKIyHi/JI97kH04nbHJ7AlAGGHUZN9v2L2Xzxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZM0XhT+o6BJLVW84G4kxhOmChLKtmCwc6c6bw8HEn6E0Vjsho1NG3qHgscEENdGri7mfht6iSO+5J79622X60X4GlZ7CigKH4r3p4Phzi5WGPHl5WLUVed+CLLfkduqrKWX4jtKnXJPZqlvxvLmfi7BG/9fiyT5YBnLLhLGwv4XJWUJfUS7YbK+56RKG0UkOnFzqAVSYbCsPUBwnywxqTYab6y4OC9cxuyQzRJLtlrG2jyWYeQ/fF6AUFhxGwBsyzY9XoX8QN9gY4mGfuD+x9oqMHXDSd+6Zs42jntHt59CJ6eVp+pJdW2P52F/Fl8ZyyLMAHD/5Lb/yFFDm99t8jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=229EHJuVgm9ehAt2tv+LuPOSjagAOPOX3SkSWtWPm+k=;
 b=jZNO7xqwIy6zg9mDk/lo1RT9kkvZhUOGhsKkPFem/AQluEG+powIWR71Jd/Uld0Ll8i0ZudOpCuDuTzOsxCbP24AkqorsLueeRX5zPLIg1QRVM48fWCwH/YKLTgNoMfgmWwJ+7Rpmb+foroLMv/k4lByXlfA3Sbg6cl/tWqdgmtmN7vDQZHkimzln7kh6wvAaeQsWwp8E8FQvx63oeuOYTowzVky+POkLr6zCTp4ogSoQPWUQWOvJKWUXqaSMx8O4bHCcvN/1HNbzw9d0XNni781SFrqtIevKqncw1vKFOCrggsaC6EEGsEOjQbZYgts6XhRK8mXcthn1/lwmRxVOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PUZP153CA0005.APCP153.PROD.OUTLOOK.COM (2603:1096:301:c2::22)
 by TY1PPFFE5B965AC.apcprd06.prod.outlook.com (2603:1096:408::933) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 08:15:19 +0000
Received: from TY2PEPF0000AB89.apcprd03.prod.outlook.com
 (2603:1096:301:c2:cafe::a8) by PUZP153CA0005.outlook.office365.com
 (2603:1096:301:c2::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.1 via Frontend Transport; Mon, 7
 Sep 2026 08:15:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB89.mail.protection.outlook.com (10.167.253.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 08:15:18 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id E36CF4092117;
	Mon,  7 Sep 2026 16:15:15 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: krzk@kernel.org
Cc: peter.chen@nxp.com,
	pawell@cadence.com,
	rogerq@kernel.org,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v4 1/4] dt-bindings: usb: Add CIX Sky1 USBSSP RCSU system controller
Date: Mon,  7 Sep 2026 16:15:15 +0800
Message-ID: <20260907083000.reply-merge.hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <f76cef66-1283-440e-9530-6eb7168c6e58@kernel.org>
References: <f76cef66-1283-440e-9530-6eb7168c6e58@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Precedence: bulk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB89:EE_|TY1PPFFE5B965AC:EE_
X-MS-Office365-Filtering-Correlation-Id: bbe6d9d6-22a9-4a18-b62b-08df0cb82772
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|7416014|1800799024|82310400026|376014|10067099003|6133799003|5113699003|3113699003|18092099006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	yCEUKDmroIpKKURwj8HOuYbhkhoTBZawzxmUL7crf82FBBZ5V/Mwf/5hyC2EbeUhWSgXK2MXcinOvCa7Khnglr8RFqszags9Na6PL9I1KM+OhMa+JE2wb8qEh9LyFmwZ6Whb2L+Z0QvxezshIso+MO7ig25ydpnQHAEIGx1zVtbfR540neSNaqHw1lm3ZZp7hqDe3ESW8KzVnAbYpGENacT8fLSfmHLX77wAP3PNPYbALRc6xmc+JvsHep005unsVPo7FySdBvCJhIeP2xfkmhkuRS4iiXroqW++jwj5AlRjodSqKn5AvgOI46NkL/tnPDQUpKASkqWTb9kJ6jOmgI44bMcFU2KfglTfimDhFOT+fAJO3UFj6kUmYob5F0rkmFdPirhOu0E7Q9MKFFBTbf1fc1jLu7vNiA2ewBy4mdHE0owtXfjahX12ux//5HOwdppf/qJVbDihECdeQOyPIh8bb5bY2TJAbER8OTt4PFN4PTnBY2u4pjrYNQJrPTgg/UgYJimGQfg7ZLJUctZLzZoCQCRRJ6wVjh1Nh3Z3SfqWxHRb9Q8vsJYQCgFzJ8KxKFUSSorzn97alreNEKrib4asnGtz/rTmKS3TcKs7ud7NZ0ruAhX5ibniJFxs+Q5Px0MMAosNPUzTDn7bPjsuc9xdqCFOSirfrT7lXr6qgqrIZw79uPvjddxSJ39nEsURzPCe9vmh5uRb0ELoAuuhdA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(1800799024)(82310400026)(376014)(10067099003)(6133799003)(5113699003)(3113699003)(18092099006)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	w5TPz3+gvw8178kkPu9GqqWMNwh1VG244d8kroQv7XNoJQ3CQ1ifZ9XLJF8B+sFawFYVqvyPYLwUxYIQohRu7igZFg7LArorPZXtw4KNT5p+IyqtLIlCG/qoE2RTOUEk/awROKPb8UmcRxNC2Acmu5cpoJVMAaWTR1gWi15236RttBGYg6l1Ocdn66N/zcyZ5cwr6cQCdWsOXH4siyo+Ec+nYzJbHJyKEMY8u9S0dawqqH2TB1kpIlJb0s8Lgj2q5upGry4vOgXIc2NKZByCHmDNWkpDecaZM+RlY8raGHPxH6evFx5/7/kqyGr5kEphGlBURb10dmeh2Zj6yx7JJaS3u96h+HTojk9Zae3Fimfty0YJ52SZdR9AXqBl/vNwB80XHy7LpJiadOa3C4zRzvsBvY082gJk9479+4IHtmu5FkTiAnARsulqKWM96TOI
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 08:15:18.2941
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbe6d9d6-22a9-4a18-b62b-08df0cb82772
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB89.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPFFE5B965AC

On 06/09/2026 06:45, Krzysztof Kozlowski wrote:
> In the description you describe hardware, not binding.
>
>> +  glue nodes can reference their register offsets through the
>> +  cix,usb-rcsu phandle (see cix,sky1-usbssp.yaml).
>
> Syscon is not a USB device. This is not supposed to be in USB.

Understood. We will drop the syscon node and this binding entirely.

To explain the hardware first, so that we agree on the target shape:

USB4 (controller 0) and USB5 (controller 1) do not have their own glue
register bank inside the controller address space. Their glue registers
live in a shared RCSU register region in the SoC system control
aperture (0x091c0000 ~ 0x091c0440). Within that region each controller
owns its own registers and the two sets do not overlap:

  - USB4: AXI bus attribute configuration register at 0x091c0314 and
    controller status registers (clock enable/valid/req flags) at
    0x091c0400 ~ 0x091c040c
  - USB5: AXI bus attribute configuration register at 0x091c0324 and
    controller status registers at 0x091c0410 ~ 0x091c041c

Only the USB controllers use these registers. The remaining USB
controllers (USB0 ~ USB3) each have their own private RCSU slice
elsewhere in the same aperture, one slice per controller.

Following your feedback on the wrapper node ("If you do not have here
MMIO, then this glue layer is not a separate device node and you should
have one node only, just like we did for DWC"), our plan for v5 is to
drop the separate glue node and merge everything into a single node,
in the same shape as socionext,uniphier-dwc3:

    usb@91d0000 {
        compatible = "cix,sky1-usbssp", "cdns,usb3";
        reg = <0x00 0x91d0000 0x00 0x4000>,   /* otg */
              <0x00 0x91d8000 0x00 0x8000>,   /* xhci */
              <0x00 0x91d4000 0x00 0x4000>,   /* dev */
              <0x00 0x091c0314 0x00 0x10>,    /* axi attribute cfg */
              <0x00 0x091c0400 0x00 0x10>;    /* controller status */
        reg-names = "otg", "xhci", "dev", "axi", "status";
        /* clocks, resets, interrupts, phys, dr_mode, cix,usb-syscon */
    };

The cix,sky1-usbssp binding would then $ref cdns,usb3.yaml and add the
two extra reg entries plus the Sky1 glue properties (clocks, resets and
the cix,usb-syscon phandle to the S5 system controller for mode
straps, which also provides the resets). No syscon node, no wrapper
node, no child node.

On the driver side the Sky1 glue driver would follow the same approach
as the DWC3 glue drivers (e.g. dwc3-generic-plat / dwc3-imx8mp): the
glue driver binds the single node and initializes the Cadence core
in-process instead of populating a child device, with the core probe
split into an exported helper as done for DWC3.

Does this match what you had in mind, or would you prefer a different
split of the reg entries / naming?

Best regards,
Hongliang Yang
