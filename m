Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011041.outbound.protection.outlook.com [52.101.65.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6262837A4AB;
	Fri, 16 Oct 2026 14:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160134; cv=fail; b=LuJjMFKlajGypR2+NE/0GTNdQafMdrX7mUcixTHbFkf0VlG/zXmxsivqyohDkuMvv0f1yrQqpYzFt6whaAG9hc4KlxhLxu/Zete5W3TPi/IpPqD0fx+37ToawRyIgMGI0tIciyV6r88YudbsLfQ1MflFjSu9Z0mS5NIPOc+mtv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160134; c=relaxed/simple;
	bh=VnQ0cw6QFA3M2SWY46KMLHjWlg0pRcg5bvt08TLGP/c=;
	h=From:To:CC:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Xli/B5o3Z2Mbr8IVowv0WrrhACkLQDF7RTW6YdC8X5WagQpBvMD3aRUlCfOJ/PlRTOV7ENlmyc/SXhZAnCsfTI1KdHSt+aEyfTCw8J6law2iAeXB3o5b19e5MTGQmL1Uvho6pSaemcd6yfP5Mmh+GG5Sl6hjNf6PpXx25TF9yac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=ECt6Lknw; arc=fail smtp.client-ip=52.101.65.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="ECt6Lknw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lCq5FY39otnl5NFJNMj+7TcXDFy9xISn767yDU0P1u2b6kwQcqX4+CYj/BtDqhWZSdPxUKGjbUtwnH7swJu6aRom6jkAKqjmNOxOSy/z4cgxb61SdVBmI/NsuP9yy8wexdIvbA64v2k4Y3NwVHz9K2i+ZVjQhKyaKnemQtnAdcB7FQctBjUPZxy889CAy4cr1++2Txg7PeWK2pI001BBCs8xqrWyxMzvJPegcFafNyU7pLYFTDIoQ2YJwlOGHocVFcNRHzjLifzkT5nJn5+I3t1IVM4BhLvV1uyGr8MaGwb7r8Z/blYKsU6nUKzMzgrZDh132gIJ7qMFCZOyL2Oenw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bG5MmeCR1Ted/DAVvietmgKqOvHrX86J6/nnzH+j7x0=;
 b=tNEeqaEzFIzBqlDdeyfrD5diBNvleM++id3eGXgHOtmBvZ/rFkddXvfm7xIHBsuVGnmyvaPniB2YAzuWPUZ+p135+zsCxYRETIMAFEkJqZF3hqmrcRYJDnrVoF914FEAX/fW+ZeU6TBgsb5k93HF7lV3y2CSGandaqVyDQKZRJ0Zjgy/ICu7ZJM/A+gxEpZRXgHY79SxLwhotV1o4yrK+X2BzgLzUE1HcCbefNCfWnJKRlL/YcWhbXptsj5iLNR3935FH3ltfh7rNxjncoubFhVPsIzkK1pbGRcdnIg0RYARyFaxkcEIomGNyzE33qEFmh6wup0zKXHn+qOXinlltg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bG5MmeCR1Ted/DAVvietmgKqOvHrX86J6/nnzH+j7x0=;
 b=ECt6LknwelTetxJzzdB3XBAFQEdaZyIZ68VSDS4EZx0mFbVr+CvHHEppYB+O4TwfQvQYY5xLaRWgeWA3Po3um6dtEd4heLiUorJKYYVcV40mvgoBPL826QxdKMFn6TmDEKsqgNHPHH1QTaN2wy2zyQAxU6l6TYcHieNNrFFh5L0=
Received: from PAZP264CA0106.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1fb::15)
 by DBBPR02MB10841.eurprd02.prod.outlook.com (2603:10a6:10:53d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 14:15:27 +0000
Received: from MI3PEPF00008492.eurprd03.prod.outlook.com
 (2603:10a6:102:1fb:cafe::7) by PAZP264CA0106.outlook.office365.com
 (2603:10a6:102:1fb::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Fri, 16
 Oct 2026 14:15:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MI3PEPF00008492.mail.protection.outlook.com (10.167.240.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 16 Oct 2026 14:15:27 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 16 Oct
 2026 16:15:24 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 22/38] arm: dts: qcom: ipq8064: Break long property
 array data
In-Reply-To: <4451c072-3a11-4819-aff4-e7de100cab8b@oss.qualcomm.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
	<3eb4fba92d67e7ff3486e8dea17233369f62545d.1790892852.git.waqar.hameed@axis.com>
	<4451c072-3a11-4819-aff4-e7de100cab8b@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 16:15:24 +0200
Message-ID: <pndfqy5n343.a.out@axis.com>
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
X-MS-TrafficTypeDiagnostic: MI3PEPF00008492:EE_|DBBPR02MB10841:EE_
X-MS-Office365-Filtering-Correlation-Id: 975f9a80-27c8-47f5-7ea8-08df2b8fed86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|36860700016|82310400026|1800799024|10067099003|18002099003|22082099003|11063799006|261009223027099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	yc0lfKDE2xr/YhHwEXQZrJO2uFDdEBtjn9sIDVVAARUy2OFUzTXX7DAzRdKemLW3F16uvnvwjcuB8d59BBpvG6gLrYZbjKzJZBZMZ7Dmiyu20/kcyqTsFEPTas7sZBo9pFe+hS3D/lZ1Azuv75QnrofxY+Pa3v7JmitQqXq1t8OrMLbHxaD9erh0xLRirHcYA8F7OUiJm81uVX89AgLIrgholXcgFo+P19axAatKsE5Fq5L439cxKqYvNY3AkhQ0+bryIKhRHbGIacOA3R425cGSI7JInxG4nh4oz2eWMlCSlfmrM60hs7nTa+8V+owqki4uoEhNJ9tKIilz7km1NWAZQv2AsnTCx0kFKQn2ISoK8o2PluIUZlj6S4taVFKopIae+aRLv404J1/eYmg61ZdVU7Ayg3eeaWqccaRtjZ7q0c0ngR7olvmbPticTEIoU2fY6jRUyVeurX6RdnwSsd1iK7x9F4h20uzIWTpzv/OYRklawTd41mMr3gtzWva/GCb8LGui1uayx3AfDU0fg9DbiuPu0IaDgg225LAjSBmmMpTPumX3hK8kVnk18P53Dd+G/MZGMT4s17lgzdz3467o2TXrf1MsOSdO4xw2T5sDtYaKprhMcygqb8iR8aL7viAefwTmyzuor18SsQw9iCW2wRJEcnNmbeHfryo2llISw4K5QpAxZNt/BWVOQ6eFzfq1sjou4hTLGKly72dSYQ==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(36860700016)(82310400026)(1800799024)(10067099003)(18002099003)(22082099003)(11063799006)(261009223027099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/5ybsaZ9p6nEcLUUB/KgnDQdzQA/6pDX5iZ4XAc7/ugXltIVvOEbMtvEVtU88V1JDWkbOQwc6N9RVr/IWvCpsthQgFLScguKAS8NkAmaarU36WJ9BT37wYExKBBvsJQ9FF0cm/mwBDB+ig7pV59Ujxb12zmU86/hgRR6LRTLYvSsbwulRIJsA6xgbQe44+Qt6fIlVKYRgk3R9qeeKDc06IVYgfHH+ZQkYmJWY0OokJXTyZmWAvDs4A+sEGeVbiC884QLMdsD9/2Z7GaV846h/cayTeSKDGEa+IV+RyshBnC6R4sOy6wmkupgbCVUVgbbCg4XofCCHZqZC8sGegZNDxqr4C2Da1qSLLQ0D0oyJ6xCLxz5ZXHcB+VhctdgbK1WIw3EomW/sW/vezJ9GIxEEWbBio/x3z8yEV0xjQCalXMKkZNvZwAh7GB4p+IIW9lb
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 14:15:27.4585
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 975f9a80-27c8-47f5-7ea8-08df2b8fed86
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008492.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR02MB10841

On Mon, Oct 12, 2026 at 17:31 +0200 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:

> On 10/2/26 12:36 AM, Waqar Hameed wrote:
>> There is an awkward line break at the last elements expression. Put all
>> elements on a newline instead. Found/fixed with dtfmt (Devicetree Source
>> formatter).
>> 
>> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
>> ---
>>  arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>> 
>> diff --git a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
>> index 24632af28d52e..d2b576a37c47d 100644
>> --- a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
>> +++ b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
>> @@ -278,8 +278,9 @@ memory {
>>  
>>  	cpu-pmu {
>>  		compatible = "qcom,krait-pmu";
>> -		interrupts = <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) |
>> -					  IRQ_TYPE_LEVEL_HIGH)>;
>> +		interrupts = <
>> +			GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)
>> +		>;
>
> Let's wrap it at 100 chars. For lines that overflow, I think we may
> need some brainstorming from the wider audience.

Yeah, as I responded in patch 19, this is hard and needs some
discussions. Having the braces on separate lines like this is one way to
do it, and in fact that's how `black` for Python does it. `rustfmt` also
chooses this but first tries to fit it on one line with a newline after
the assignment:

		interrupts =
			<GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;

If it still doesn't fit 100 chars (like here), it then formats long
arrays as

		interrupts = <
			GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)
		>;

This still doesn't fit 100 chars. Maybe we could then wrap the
individual items like:

		interrupts = <
			GIC_PPI 10
			(GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)
		>;

I think that's a reasonable algorithm to have in dtfmt for wrapping
arrays, or?

>
> For reference, we have a couple of very long lines in the Qualcomm
> soundwire nodes (qcom,soundwire-vXXX), and we just kinda let them
> overflow for the time being

I think the above approach would format them quite nicely, for example

		swr3: soundwire@6ab0000 {
			compatible = "qcom,soundwire-v2.2.0", "qcom,soundwire-v2.0.0";

			...

			qcom,ports-sinterval = /bits/ 16 <
				0x07 0x1f 0x3f 0x07 0x1f 0x3f 0x18f 0xff 0xff 0x0f 0x0f 0xff 0x31f
			>;
			qcom,ports-offset1 = /bits/ 8 <
				0x01 0x03 0x05 0x02 0x04 0x15 0x00 0xff 0xff 0x06 0x0d 0xff 0x00
			>;
			qcom,ports-offset2 = /bits/ 8 <
				0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff
			>;

			...
		};

in `arch/arm64/boot/dts/qcom/kaanapali.dtsi`. What do you think?
