Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010067.outbound.protection.outlook.com [52.101.69.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A0C391E50;
	Fri, 16 Oct 2026 14:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160163; cv=fail; b=GGwKsretBrAjKUOQtFSKjftuep69TYiyQWs5CfACdNtoZYXoRqsMv9mAAhLJ64aDBTZZSXbndQuDeLky6tbPFDZBE6v/keOSETnpwJLTVMzlif158+uQG5SwSxALUKv/QpeD2lAkTzbMsaBjd5AHwygL9cUpwW4kNhUjFzeQkM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160163; c=relaxed/simple;
	bh=iR0evGk/0B9zPS+QrhTq6XXt/NedzdBrF5Tbcm7IfFk=;
	h=From:To:CC:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DvUgsxwsmG8ZDy4aINM2wuWlr8Wrf/j5LbXGT/R+pAGQG59PmfIhHcpmZymjPx49rEyZyKcdyAvnxjD9WBVVp6qJPVFHW7I4+kf9lHMkfWnUIk3CWrO2fZ4nebuBcQkcaHVwxiVuGFD+MBeHbHdBo4mY03NMZPePp09B6tCspCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=JC6S7tz8; arc=fail smtp.client-ip=52.101.69.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="JC6S7tz8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ersSieR40UiMrHWhYCDw5xBHRQJ6zx6gledy9J55PE+FOPVRK7sIiLrd/IALWQw/SxY1ub31u+Vy5rpe1CHJBZP/1t62F67lXd/CUdO3+La08X9x8P+o21AoWK411zZxfWjlZSpPNubag5QWf0eiZCm9Gl+HAtaQ6ld3093V/N05jBQQjkEKKohVZggY2mYkBUbtH+tejDsEsPmAT1MpBQEP5HQ45nMEG81jVpSkGUie3anyXoNxrPTTBVTNlmusq09sy785Qas2Qx/f/oUV/HkveReYLDbP3HJKpdhV1kWJrrBSp5btFWbk1/7C00T0tENPMkTXl58/c+UvyWjzLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DrR9Ddrn7zfWidsmro+UIme3Ng02aJvHobdd0TUcSEU=;
 b=A5x07sUS2k5DxhpIxFg4VtV7dUjafEvGMw2zGjM1EHyr0ClalcsnyG/+8OXsgqxA5ndH/IrmIKpt91hkuluJxZrBxFvsPYrKdrP9I6oKfe2as6mShHZrmu5UUAnrek0kbZOReF4UD0NulUuBPLGcp4dXbDjETyosZx9s3rY4Q5cS22tlZDB2CsbJG8/akDyPF1s1T0aQm0+x8Hfe7jUkFR2I11aY2Gu1kYO7E7pFgjuNXVBqZeTJ0KJr5Sn9isdxbKWbK999HU3960EPm0gNHwxrNI4FpocBNwGRQ5Tl6/CbbvR3+m+aoCUCUifMb0lqKeDjZPfyV4O6yQ6jlsQ9/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DrR9Ddrn7zfWidsmro+UIme3Ng02aJvHobdd0TUcSEU=;
 b=JC6S7tz8WOl0S4ELuB/KRUzHsWhXYLecX1Dpio+5Bqq49HdnAYNWwWSZ7X1tV2mvfOi6eoS9heHO1hxmLm4n+iGaQuUJadTkujH5o2gGxOtqKcbp8Uh9hvQVpxodRmYf3+HNiZsTYMGjJJTTZOSJzTJ0NgAdlz5Wcy+cLWiZoJo=
Received: from VIVP296CA0125.AUTP296.PROD.OUTLOOK.COM (2603:10a6:800:358::15)
 by DU5PR02MB10678.eurprd02.prod.outlook.com (2603:10a6:10:523::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 14:15:52 +0000
Received: from MI3PEPF00008493.eurprd03.prod.outlook.com
 (2603:10a6:800:358:cafe::1a) by VIVP296CA0125.outlook.office365.com
 (2603:10a6:800:358::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.17 via Frontend Transport; Fri,
 16 Oct 2026 14:15:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MI3PEPF00008493.mail.protection.outlook.com (10.167.240.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 16 Oct 2026 14:15:51 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 16 Oct
 2026 16:15:49 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 35/38] arm: dts: qcom: msm8974: Add newline between
 subnodes
In-Reply-To: <8b22f94f-4091-46cd-aa4d-d45c05aad13a@oss.qualcomm.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
	<fba7a99d988200d102d88c7f644ea8cef7047d65.1790892852.git.waqar.hameed@axis.com>
	<8b22f94f-4091-46cd-aa4d-d45c05aad13a@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 16:15:49 +0200
Message-ID: <pnd7bjhn33e.a.out@axis.com>
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
X-MS-TrafficTypeDiagnostic: MI3PEPF00008493:EE_|DU5PR02MB10678:EE_
X-MS-Office365-Filtering-Correlation-Id: 23bfefa2-61ea-460e-250c-08df2b8ffc04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|36860700016|82310400026|56012099006|11063799006|4143699003|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hHlNVOt486pbwDE/3HQf2BTdc1LW/H4H460qxN4+g1VPELhD7T8vE8JYQnjSq9tYBXY6BgRiEK/MIIr8GIvZFldGUnzkoWFVRni/Evr1DorWOxqg5AqCmVPb97o6ChQcPnyQoq9puK1kBA53Dau3pZztDhnBqlBztiI/dhF3Url/6neeQS9YTLkyaNoHJ1/cXWUeajI82b2scuR+prJsO4oADr7CqFUrql4Dhwan2bURPRubEAexq7zW8pRoIEa2khDax8xpPOoLIw0JqrJz36QcUcuizya+xuHMjhUX3BRzCYDK67pX13a7L3pahi77I6M7JfgsGVIG47YY9JN6zMyo8gVZDv1HCjY30yHoUdZ/DX/PJr0jLoTlaQ+6t2hierxKXj2QT3EjEBInbKcpw/nRArESj8hzzArU4k0b3BXHYtfe1FZJ1ppNM+8a/mpaLxK++IzOl+Uu3w25oAN2kXF9yqrLadiyReqVQmDllyLmNd0HxvcQKUPFWzRTFTG+BVvkIhGgGl772K0ZcSO8CYwrdHNiPnoEpDmLD5VsjEosH7RJwPIF7fj/C7FrwY5Ri+TzKFfPa8gppiR7n0TJ7/lrt0rxWWAF+rML9orK+2ejbc16Nd4KOiMQUy2Q+dMV7P79V8BPQuzuUJ3tB9GKteBEvGhIAZ/HllmEOVF4IyAeQGXgOwhuTnMfwmZaH0ASXxnt2S1HJ8jRe+M9N1YSLQ==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(36860700016)(82310400026)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hC98R4j8xDCVTecg43RTvyV1eY8qt3nXFZZzurphnxQnwCzbo5mk7XlFYpIr1ZFN5soveIcjGXCHyVeYvw/J9L/x0tmqt1VE0wyTpnDPeXx+TzUcdXIbv1FwDoyfTgjEopsjbTkewhq6HrBulnFWYHDzdTrwaT6n3DUNsoI8WytrDnyLfb0yuWyChmA5s0f9xi/K6Owb8qqj62MqxKs7VscVlvnhS9BxGUIRv9piO/U/GKZyZZtRUqI7wxst4FtYD5azunSyKssM4sOC+nb+YPUj76qXbYcadZQ4oiR7AKI5cNwKP5nr8nK5Fc+fe+29TRAEkFdz6e5r5i/uXXflQz9+8Px0yosnWSH8XZ5KKB0QTYXnHeSZ4s2j0/TMp9IRQ3ES8hRYzkP7OgDPIEFdIMrWjHirPHiNiG1WaneKsZQbqirb36I/PdX/JPJ3gC1j
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 14:15:51.7771
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23bfefa2-61ea-460e-250c-08df2b8ffc04
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008493.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR02MB10678

On Mon, Oct 12, 2026 at 17:51 +0200 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:

> On 10/2/26 12:36 AM, Waqar Hameed wrote:

[...]

>>  arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>> 
>> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
>> index 4c2730b34cd1d..1a2f0cc9f8a03 100644
>> --- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
>> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
>> @@ -960,6 +960,7 @@ replicator_out0: endpoint {
>>  						remote-endpoint = <&etr_in>;
>>  					};
>>  				};
>> +
>>  				port@1 {
>>  					reg = <1>;
>>  					replicator_out1: endpoint {
>
> P.S. ^^ we should also have a \n between the last property and the
> following subnode

From `Documentation/devicetree/bindings/dts-coding-style.rst` I read

  8. Child nodes, where each node is preceded with a blank line

I guess that also applies to the first subnode after the properties
then, as you say? If so, let's update dtfmt to add a blank line there as
well then. Thanks for pointing that out Konrad!
