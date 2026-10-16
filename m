Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012033.outbound.protection.outlook.com [52.101.66.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEC64DE727;
	Fri, 16 Oct 2026 14:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160038; cv=fail; b=uArA9k8SWeEmuaATaq1eD8IFVJAbd0HkS+eY2sWZ6DYgodFrKfPnYyb0C8FbgCYQb243VuvnPYV2UD9kQ2x5o7XfdwMblSovN18/x3Dioas/gH6X0DbP16WBLqayfxVhhRm+qHk+96/UaV6Ap16Vjk14dIhuS98os0IO2eLJLJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160038; c=relaxed/simple;
	bh=dYOYh75bxjY16JeA/iu9oMDroH2oN+hhxdC4Rqit9bM=;
	h=From:To:CC:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rUWcnqwB95RGdXV3f6/moacxMpfWE9rmoiXalZlnJGAX/6lgGjFi/vGTJr3I5NzVNu5AxIHxUoO71L8/8YWTtvxy+y5kY+I2VYYPgQTTPb3xEqG1kMlnGn96k3oGlvxDW/57oyTPOFBRT8bfjbj1pwxHb5f12lZJdBF6TtOxibc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=BudO54Oy; arc=fail smtp.client-ip=52.101.66.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="BudO54Oy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J5+TEKDEfy312mFl48wgwj6iQjIA1RMksPZ6LUDGmTzb9/LZ0P0zp7Ou+YFPfV7XsQrwDJSMdA+1TIxi26I/lDtAgF3LPeULI9to8RHbJ+hMaM7LB1k48LE3nctuCCFln7Tqe6FoTacMr1PlVfCa/LWRnWvwMAEqYzDVbCAvYAtRwSwrsP4HqoTUIgWaytFox7zOQvwT95uSI8pepSwOe3rSQ0tH8jswkG0N8N8LN45RM7WHm3U/x5TWZjizkFmkP99E4WQKPvyMpXQfuyqnEfQGM6XOs0Mho3q01jRnPs8dZbm6E60SZLGaXMSVQbrxEo4deXZE99bk61P3qxniCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vhQnruLSBbhCyHPBLCdz+Jynu0DjLuZJlG4f3Z3rwfE=;
 b=ekyKxbfyoOndyVaTPkDH/sxXwGKI4OUdlpvc+6iF4MEKmPi25iVpF8W3pyaFvQQP+TtRl0Gm+3wbsWyVixqCFSRYbXVtr6XCPFAdaYz0bNhckUaJAyPNakoIyoKFtyO5zGT/DATLCLn2yH8sRsm2R3Pptq3rbdp7sIe+DQtVSuhqU8eJhv+ltDjef6SL/Az3q+lPsuqOccBn/UkhVkuzu0lpJYZZ+TCJx9iACSdKZIDV6xApEkxOXDWv3FOZd/tf8wJ7cIu45Ohd7oOz7sBLRCfFBEBialD39kL2KrJL1JnOn1EBkWTenbSxmXF0iFA+ctuQ3HbI/Qrd7SdKRGjMpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=sholland.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhQnruLSBbhCyHPBLCdz+Jynu0DjLuZJlG4f3Z3rwfE=;
 b=BudO54Oy30fAc1WPIQRbXnKxCOYvqO+83rCWH0EMji0V6hMKsCyMgwXaUfr6uFnBcvcxryZKEMmLke0t4bm3jyXszimqid4YuN9HSak6jT73QgBbnDNfMVDX6BQCIJOVCZM3iiq+T4HKk4lDIcZjtW7VGi2dMf97YLWff2dxgvU=
Received: from DUZPR01CA0183.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::21) by GVXPR02MB10941.eurprd02.prod.outlook.com
 (2603:10a6:150:21f::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 14:13:45 +0000
Received: from DU6PEPF0000A7E0.eurprd02.prod.outlook.com
 (2603:10a6:10:4b3:cafe::27) by DUZPR01CA0183.outlook.office365.com
 (2603:10a6:10:4b3::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.17 via Frontend Transport; Fri,
 16 Oct 2026 14:13:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF0000A7E0.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 16 Oct 2026 14:13:45 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 16 Oct
 2026 16:13:44 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<angelogioacchino.delregno@collabora.com>, <samuel@sholland.org>
Subject: Re: [PATCH 00/38] arm: dts: qcom: Format with dtfmt
In-Reply-To: <04f35f53-8297-4635-9bf4-5f7250a11d61@oss.qualcomm.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
	<04f35f53-8297-4635-9bf4-5f7250a11d61@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 16:13:44 +0200
Message-ID: <pnd1p9pohrb.a.out@axis.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: se-mail10w.axis.com (10.20.40.10) To se-mail10w.axis.com
 (10.20.40.10)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E0:EE_|GVXPR02MB10941:EE_
X-MS-Office365-Filtering-Correlation-Id: 2508a10e-6efb-4748-99d2-08df2b8fb099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|36860700016|82310400026|56012099006|4143699003|11063799006|261009223027099003|22082099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ze/HUrOe/Hs7a9MSaz1BZ9q207PTzzNQxWmd4L4/iPN+O0od9wZglOCB7r2x0DCM0ocr0P5yCyWR5/QRmpG0aADa6TFLRlw7uKilLzxa1qG11uLk/X4j90EHHqXTEdH+ztNEokchqscw63gRfXWvZkbqYkmOepFY8UkgvBgR+VZ10FES/vdvBCJs1FlB39uAZxVcQKotgOpLarhuRyseFPtzmE7Kwm/uU4ED11HoL1MFJoHnGAZc3bzT/BufQDPbnGvPW9bTPEfsUlW5n0i1j4mc1cJ5tl6LH2RkRPWWpHfcNSnkSxHQ1+HWeOfEwnoy41d+pP9/aQ/9uVnnEZY4meI5zQlZGryGkHJBIOR++HLwWwC7By6u5WxTBhTViBPkxq60MB9DgvqUjJqN5WicemoQIJ3lhmmyNfgD22s++g9kIjwEp+jf3wTQmyZKvfvqbe6zKPo12+sIWHTNbUtwjyvL72pKUnOk94V+GLpWkt/oCncohwacZJa/8LmXJu/EScinYx7Ccbd9AYYdbOURbCKKGXcajpQKiA4sFyPJbHXmqVZwgfrQ6ndchT0iMXdfJu+Xh+UOM6bcpn2LEDFmtIveO7wspDeJNeCrW2BbfQ5CJ3TZwb2+DAvEQ8agvqiHnP25f/lO4JHjxhFdUEslHCKDbIbWQsvPuxNmSTcCZ2M4JW4QhfVGBdgoCAl6D2M8HiJoFm0F0eLmj75FON/eZg==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(36860700016)(82310400026)(56012099006)(4143699003)(11063799006)(261009223027099003)(22082099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	crn8sQHRuEsoLb6tZ8yosQ7pRhkHtsXLgekp2dbMDxFk4WykwcU25U0+sbOVsSKj/FqmtjKMsWIDmg4Ipv6/AmTggwKLMJ5nbDF9Au6HmtXY1asJG+ycSIhRYGMJShy5jJW/su7VQjbcE6kUYHGC9iQvMDgYXBWWST7Duft7fCvxwsnjuCy4oAs1UCtqpMFN6PSY45756Pfb66bopRIVFWI0FC8gfPLau7ngx8ObsakYAztmNx4kuVbT6VvJRUV5vGTQ/D8euFU8QCJyiudryUlEoGnk8iR4qWDgmmSHEivRsRW/c8TdQZaWDo3MuofY8E+pUQRtweTMJMEJHEqgmjRk6AyAdNSSTcQFxz2c2bL9nbHJ3Z+3DDju7rtdGiMmNnba909tthBxtvJwU4SzPmbih5cSEuoQTy96k7cItNnTww/L86AKxTJv3/RKDI7T
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 14:13:45.2537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2508a10e-6efb-4748-99d2-08df2b8fb099
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR02MB10941

On Mon, Oct 12, 2026 at 17:28 +0200 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:

> On 10/2/26 12:36 AM, Waqar Hameed wrote:
>> I was looking through the notes for the last Devicetree microconference
>> at Linux Plumbers (LPC) 2025 [1], and realized that the tool I have been
>> working on might be of interest here: dtfmt - a Devicetree Source
>> formatter [2].
>> 
>> dtfmt uses a parser with lexical grammar (tree-sitter) directly ported
>> from the actual Device Tree Compiler's (dtc) lexer/parser, also
>> (hand)written by me [3]. It is primarily designed for the Linux kernel
>> and currently parses all 6872 devicetree files in the tree successfully
>> (found with `find . -iregex ".+\.dts[io]?$"`).
>> 
>> This tool was developed out of frustration when reviewing devicetree
>> patches internally at my company Axis. I would have published it earlier
>> if I was aware of the on-going discussions at LPC 2025. It only caught
>> my attention since I'm planning to attend LPC this year (especially the
>> Devicetree microconference and would therefore love to discuss this more
>> in-person!).
>> 
>> This patch series is only a small demonstration of dtfmt, primarily to
>> get Konrad Dybcio in the "To:"-field (who did the presentation on LPC
>> 2025). Obviously one can run dtfmt for all files and generate a much
>> bigger diff. There have been patches sent for
>> `arch/arm64/boot/dts/exynos/` previously [4].
>
> Incredible work, thank you once again!

Thank you very much Konrad! I hope we can have some fruitful discussions
around this!

>
> For some fun trivia, this is the tool you might have heard of as we
> walked around one of the LPC 2026 evening events and kept poking the
> various soc maintainers!

Haha that was fun! I will indeed send some examples to Samuel Holland
and AngeloGioacchino Del Regno (added to CC) soon, as previously
promised :)
