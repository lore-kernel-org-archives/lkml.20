Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012035.outbound.protection.outlook.com [52.101.66.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A8D3451DA;
	Fri, 16 Oct 2026 14:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160099; cv=fail; b=mfUI5eEQhL5eABsTS654bzBkaE2zqCrD6HpHK7qtdj5Q1TrQgCn5bWQ10ZabDIupZNw8/GCphK+8zTWdEfda2CYVuElFgEFNtO1DHVBqs8Z1MIOH+7eTXiLrtRVE9PemNBT3dfeOT0YYBZ06YWdATR/QFthPYN9w/CfZ9DApyvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160099; c=relaxed/simple;
	bh=q3WryVB8/OMBFW2q33i6tOXsM3SDqmOUFQAQm3PnbPY=;
	h=From:To:CC:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rfSDHU3zi4TFcXsC+VGZcrTHMJqvyUYEyNYqTSwK7FCHNRe3jwb9bs1/q5g4QqpD04bJL3I+cXHkENoZ24qF74i8R1ALpgRT7NxoWdGvSe2gVCz390s7SzH51THu7vMXI1rsFeUoyKVIzu8bJIJH3ZpgGXjBR8NUQJUUQt897wc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=NnSIiDoJ; arc=fail smtp.client-ip=52.101.66.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="NnSIiDoJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gbe8NK29pS/ENp+R0moMwNR3PiXf5SwwZbRIagRfRq6WKoISvWTntT/9bDvYg8/P7Dv/2l+0mqFd0Vn/eIATBMQWxLByX/c+sKHOxWbBXb5DXUnuj+RQzOupdFwFcMKlc1/OmkFRfzzHIPa002ZegdXlR/WBJ2YvwEQi+9jr9H80ggmDFhJ+XcMgQIXRSrsgOBanRux3D9RKJPSE6nzDHUcnfcqe0bc7dZh+bMzyc6FoXKYQEHuRWdXDk8cOBDxq1ltCqQqdvUBOLM9WhNwUS1b9ixZ0l4sK0x+tIWt4I0v0qj9iVLgYn998G0TLuzRGi3YTfVULWkJrMgLEOZYGCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/VZsacz1rvju5qdsSZM0T2mZKiLhgdyKsugyWOCb7zY=;
 b=AWXqrR6FDvVQFlAl40G1riGP6XUFA0ZFs0moC8AnQ5plP35gCAXLrvEAVAKXVv60WKl6fTwxmUDCB6TjB6I5qS8nwEvWIKcQ9QzfAs3Tt4QXdpStqG02Wzg2o5nUflT23519X3KCstEf/hq4cUBPXoYpmX2AHICjL65EXzwuue47x1SMLJeonfgV0tomUG0e5DmhoZk+AankBteBupEHB2M87kONV9+rup6KkEYwO8yEAD2Nn9/sTOYCQe6mt5K4ZvIi1NIeRDHXMi3fSMosG64Sn+Aj76xfkJ5ggEnQc+VfA6eGPVSFUN1NzhqCBwV2gC2acoZxrvLfUlB2v8EtYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/VZsacz1rvju5qdsSZM0T2mZKiLhgdyKsugyWOCb7zY=;
 b=NnSIiDoJTpJ4ITjMqZLObnirCVplt4UFXbAVKHVud+WGfGxUqH2W8aeG2X+LxdaF0FRuMwUSvIGHBu9OKBmAbi2Ynw0YcWQ0L8ZS5IfZrZq/Ji5GYPJ0gyk1fdZnD9jYKLA4rAs2nwg4xRlSbJ0f6WVtBgEKqlsaTZgbOflQLMk=
Received: from PA7P264CA0002.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2d3::8)
 by AS2PR02MB9166.eurprd02.prod.outlook.com (2603:10a6:20b:5f9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Fri, 16 Oct
 2026 14:14:54 +0000
Received: from MI3PEPF0000848F.eurprd03.prod.outlook.com
 (2603:10a6:102:2d3:cafe::53) by PA7P264CA0002.outlook.office365.com
 (2603:10a6:102:2d3::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Fri, 16
 Oct 2026 14:14:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MI3PEPF0000848F.mail.protection.outlook.com (10.167.240.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 16 Oct 2026 14:14:54 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 16 Oct
 2026 16:14:51 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 14/38] arm: dts: qcom: apq8064: Align multiple property
 data
In-Reply-To: <f2bde571-89d2-40c7-9ff6-c23a56b3dacd@oss.qualcomm.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
	<c1886d808858a195ec78425b293b2ccd3756cfaf.1790892852.git.waqar.hameed@axis.com>
	<f2bde571-89d2-40c7-9ff6-c23a56b3dacd@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 16:14:51 +0200
Message-ID: <pndo6ctn350.a.out@axis.com>
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
X-MS-TrafficTypeDiagnostic: MI3PEPF0000848F:EE_|AS2PR02MB9166:EE_
X-MS-Office365-Filtering-Correlation-Id: 70637d31-3cc3-4827-29b7-08df2b8fd9fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|23010399003|36860700016|261009221227099003|261009220027099003|56012099006|4143699003|261009223027099003|261009221727099003|11063799006|261009223327099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	EBiNuq11vJ6i0S5T3DlkPzyU2YXJfSkc8hina7ah/82xy7PGz/uQW5NWyz69mhetMuusl9UnH5YiOeha8a/qjO9nGu08dznfDEITv7nS0+PRyRbcXRlQNVbzrVeQu4yuW7yJr5eiysoepbi1bcJ15DWHvbpnR75rZPCoa8IjNfa4XmbiBkWeYpKB5hVNkYUHpXxejIoRqSfrMEIbJdg9zHgxP6ie1gChnL9ZN3kki9VyRHrwhljAPcaRoVrAnMUIDtdXTxN2F9fZhUFSwg1zrZzgOtGPzS7C7alQPS+NCiwC9C/vuT6cEtasJXhmtXIJeDt7spqob+tJU6NeBx46S8NbDVBkKkS3WdHw4dSvYwycMpzQuoOJ73BaqzOnVeQ1Zmdag5DAOgqUx+x8F2v++NHfCVgOfBU9oDoWJ8FKgi+xhRcnu6jB2BQ23Mt4omq/NvjJftJ3mjo/W/gR2VG2OBGBMYc3cFRM61lSmRHgzy9SH2jV2J9X0rX6tuzORB3u+MxsHKKojEi4mARC94icBiZnzQp1i74qQJbnPzFudy6evPlvlFZyuV9Y6B9HlPls8zMrr9ZSjbIy7hYLSXz1niEktnIwGCUSHhtqVymyLINf2ldzKGuJLz63ewBoJ1nxDkTosKERywjComNT2W3bOE/5re+8TWeParlzc4oCdWu7r48OmIofYlTV00QsOxKSxnBVWhWiUiEuGU1rEcylHw==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(23010399003)(36860700016)(261009221227099003)(261009220027099003)(56012099006)(4143699003)(261009223027099003)(261009221727099003)(11063799006)(261009223327099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UGw/ZWV7Ob3EWDPTENvNnczAVayrDGSgIggq4ceq2V+2amVwzmqrxsMq3ngrnEtfA1og8xEWpEk2SgzChEd6IIcPkP787EKdtWtyy75a6CjFzqTl9p2g3KU0dKGnRo9g9y4MAniogAc2gEJDjLub8KyWPbGF60QrQkwgFBxiBqeLZIDrEQ1/BMP6axY5XfteQ9I/t3ujdcbu+K6ynIbYa68t3FdSX2kYK6uqWkhc42Thdvn5YRq/Jpos8ZciEYtzExEbmq4qyzBHf881swKNma+nnwQD68RmfDl8gkoTqzhKCgK4P/0xcvjN1vbgSRVmYVpN4U9s6/X/Aqkpr2wje9VE0PBxDyCpFFc5qz2A6P70e5BOGME+1B8Kch0z2ThfOVemY9sQVQLG5SCoz0sDhyN3nyxH6/U5ha6uOurPL+qAlqzeTU4Rm0XFQjee09WX
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 14:14:54.6922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70637d31-3cc3-4827-29b7-08df2b8fd9fd
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF0000848F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB9166

On Mon, Oct 12, 2026 at 17:52 +0200 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:

> On 10/2/26 12:36 AM, Waqar Hameed wrote:
>> Multiple property data on a newline should be aligned with the first one
>> or properly indented with tabs. Found/fixed with dtfmt (Devicetree
>> Source formatter).
>>
>> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
>> ---
>>  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 98 ++++++++++++------------
>>  1 file changed, 49 insertions(+), 49 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
>> index 150b5670e13b3..565f98c00b3fb 100644
>> --- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
>> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
>> @@ -89,7 +89,7 @@ l2: l2-cache {
>>               idle-states {
>>                       cpu_spc: cpu-spc {
>>                               compatible = "qcom,idle-state-spc",
>> -                                             "arm,idle-state";
>> +                                          "arm,idle-state";
>>                               entry-latency-us = <400>;
>>                               exit-latency-us = <900>;
>>                               min-residency-us = <3000>;
>> @@ -1036,15 +1036,15 @@ gpu: gpu@4300000 {
>>                       interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
>>                       interrupt-names = "kgsl_3d0_irq";
>>                       clock-names =
>> -                         "core",
>> -                         "iface",
>> -                         "mem",
>> -                         "mem_iface";
>> +                             "core",
>
> As before, let's add a rule to prohibit `property =\n`

Let's see what the discussions on patch 22 result in. It could maybe be
applied here as well, e.g.

	clock-names = "corecorecorecorecorecorecorecorecorecorecorecorecorecorecore";

would be wrapped to

	clock-names =
    	"corecorecorecorecorecorecorecorecorecorecorecorecorecorecore";

To fit 100 chars. Then multiple property string data would follow the
same logic:

	clock-names =
		"corecorecorecorecorecorecorecorecorecorecorecorecorecorecore",
		"iface",
		"mem",
		"mem_iface";

Which maybe is more clean than allowing the first string to overflow 100
chars and aligning others to that one:

	clock-names = "corecorecorecorecorecorecorecorecorecorecorecorecorecorecore",
		      "iface",
		      "mem",
		      "mem_iface";

So the question is if we should either "try to fit within 100 chars, by
adding newline after `=`" or "don't care about property data longer that
100 chars, always start first one after `=` on the same line". The
latter one is of course much easier to implement :)
