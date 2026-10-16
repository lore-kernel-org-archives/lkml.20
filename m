Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010008.outbound.protection.outlook.com [52.101.84.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45ED235C1A9;
	Fri, 16 Oct 2026 14:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160119; cv=fail; b=lpKxk9Tzp49EOiMh/2gm4e1vb07duRTZ4X244ie+sKSvA8rAg5ER0vxzlVw4HJbuJEQxLPxE62EOwAAwxwGmpUyA1SXMxp5KRvQnb1i67os5V57VEgpNzLy1naEsmNWvgQ5ouTbOMlfQME/C7slVbIdPLpnZYQwHKOI0jSja/6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160119; c=relaxed/simple;
	bh=+QYxv17gV+Rn1e5z3IaSCYynJ84ENZKMF5bJo4ccXJg=;
	h=From:To:CC:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gKIJJN6US621Rs9MSVavK2WrhKCEEnjXu/X5mbHrcTsIVftKKWZlMvnlIzymSGB9tVSzI3lzclpgwsFjTOW0YRMf29IZ9qwJAuKMDnSzeBdF+b053FJzNBVghw7aqw1HECH2WbbK7ocHNiWvVUAZoeFjjqrKN3K5/U3o4lhNL9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=lYZxAczc; arc=fail smtp.client-ip=52.101.84.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="lYZxAczc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=obSoZCpI6P3+gkU0YYqe/gkeYtN0lAH4LXoA7ySmKxdGffEke5weRF3CxIU5xKNs2o901aK43jOLvbxbVLGH/dqvEk/QR3r/+5rfoTL87+ISjjMUrbPYXvGwwXuNphbbSX6QMwhEUDMzE13lGDpRgO7uuKBpctL8ZkLpKXhQusEU6FpxP7tWW3yAc5bCmZcoOjpk1Y+yRc9lb65LAe+6tp376Shuuoxx8lvArpRFN23BcPbxG4mvPV6Bq52ruYT/UTcmr1hYqdRSkap3WOgpO1Skg88VoEyaj0xxOqGtzBjcb1E7d+PxrZR46spVIG9/9QqsRQokQRpNoLWP4fOnSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B0ZDcq9W27dq23foGZfogn61DjuBqE76Lge/dSLrrZw=;
 b=tSQBkLtANBuWTgzmYuGHreVRE+XS5U34Z7Hnd0SO856BGL5GTB2tsUUdrMKRJJDvg0yFa4OCiSf1Z7VBVBkVDxVm0z9c9cUeIL7PbbKPj6EMjvDNjQ7b8SaRSTy/1w86uXqwnMZH3cGnNHe9kK9e73HJ9L0kSXMw9cLUandQh0gBd7w0R4wJxH+WMEFrmIUjyOmzP5N+I7auEJmoZqehPXymTKEw3mrAxTQFvfCJmLFWtOuPo+IS9rMRiY+uZ6HBczrQ/XKXEbs8TdjdiTtS0Ir8x1VwB9nGBJn9agJmc2HMONeYUHLXHnqkpsv/pXkSIGkkm+kzWTobAjJtO7tCUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0ZDcq9W27dq23foGZfogn61DjuBqE76Lge/dSLrrZw=;
 b=lYZxAczcNPzjOZY+VLSzc6VH6jL+YFT4tv1p3ggRCycxjKsdWIQKWZ3DejHnGWqqmIH0lwsqPWSig8dIv4ZTlQClkk9XD7/Ef2c3J92X05fZM8YJm9H21zKKOXzLDyhrmjM8ogUvrmsMXHZe8FkIxGrORR1yY1qwKgz/YX8txxY=
Received: from VI1P195CA0089.EURP195.PROD.OUTLOOK.COM (2603:10a6:802:59::42)
 by AM9PR02MB7329.eurprd02.prod.outlook.com (2603:10a6:20b:3e5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.17; Fri, 16 Oct
 2026 14:15:13 +0000
Received: from MI3PEPF0000848E.eurprd03.prod.outlook.com
 (2603:10a6:802:59:cafe::47) by VI1P195CA0089.outlook.office365.com
 (2603:10a6:802:59::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Fri, 16
 Oct 2026 14:15:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MI3PEPF0000848E.mail.protection.outlook.com (10.167.240.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 16 Oct 2026 14:15:11 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 16 Oct
 2026 16:15:10 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 19/38] arm: dts: qcom: ipq4019: Break long property
 array data
In-Reply-To: <4ec3f929-9845-4762-bb2b-f6b9dcb43776@oss.qualcomm.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
	<914f62eb921e67f31cce119ed5852dae86858890.1790892852.git.waqar.hameed@axis.com>
	<4ec3f929-9845-4762-bb2b-f6b9dcb43776@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 16:15:07 +0200
Message-ID: <pndjynhn34k.a.out@axis.com>
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
X-MS-TrafficTypeDiagnostic: MI3PEPF0000848E:EE_|AM9PR02MB7329:EE_
X-MS-Office365-Filtering-Correlation-Id: ef730833-2d7c-43fa-8c7a-08df2b8fe43d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|82310400026|36860700016|56012099006|4143699003|11063799006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3F6xPeasvryj3TMgK55rNfqNxQZd797sw64AKi9fvV/nR9vFMCGaIRvmT0EwOA5hj3LzikvRLjWuGF3TtoqQQI+eipNcCJ0wJVVUGQtf7sEF0QCPqibktFccyZNO4eVc4Imy8u/JjYCtHhNcXU+CX/7MRmZR+XolmiYdZWt0mElyFelg4bDJCQVTAQImcmrMHDfwCXMBgz/2quqPAe7v11gmtPDdlXB6c6PY5WaF5R7ElUzH4ow5oxS+kBtlfx+oH9EIrBAfNsi3/0tbgeuxMElKGjNskFsERhNBi8jWpaJW7uqT7bhg8yCT3jIGYmVyZxUfln7gm2Wop4HTBezJdeB3gtzI/M3KHz0g1bUCaVrP7fBJVRPv1OGQz6c2Fh59tEFQ0D4WoKlWiY09iMS2yAEOy5fUlmcG9zz8AJcmxWSyJobNubZvAMrsL2NP/2eiDRqHBD3gPZh5yAtAdEXiznBLp2vM6F+M5tthULJmwGUI7nBMQRPbyZToQR/2qD4wkVAdbOl2h7klorW7+XcVfDVbITQeClqJyeJXVNMKmo7I+rM6RyNmHRVEExclTWVYI2ebsmxgbo9kaXS5vZawlh+aDiTAQWP6FG1BJhJ0/POJYhQF4oEpkrquCr2teww5sDglosKzksO1OetJdxpNr1cOgj9KDtfa3uGRfGcNLHdsKLUH+m53hufVYqSymlvAwJUcySbFyd7NlZUGyOw/xw==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MSp28uXb1NYhZ5WDDnXHhl0PoSsknZgRb8tTNtfRe1CIivUrLcGQYkMy/yswMSiY/NZXjvg4298EFQl9xDNwFuKmOFBe4Gd1lPYOs4nKF1HXHuMmtZDcw8d3zbyIAgi2kDrKaqm4cN4IVaklq6YLj5nUf9tdziGm80QcZi9p8kCfWpQlkJy+lxR4kDBSTycIKoY0JEqjebpe1sHZebQfaW9oe2SpKthcFTUqV76uJTUF1xdTDjdNdLE1CdhpKn+qr7L8Oll9kbHVZ8kT05pM9AlxzjdD8XYp/JGz510OCcwqlzuDRMr6eUPJXI/TFECL3z1K5gPt7/0wGQ5cBsb4UlxsPkBQfvaAF51uvlf7nxj1F7Wl16AUkNh8W9nvRlANMVzK4mnwjORr09KObth+2B9orJZBKw6dwm1Oouufj6cA7nKvCZbH+pyn96m+1Ku4
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 14:15:11.8787
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef730833-2d7c-43fa-8c7a-08df2b8fe43d
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF0000848E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB7329

On Mon, Oct 12, 2026 at 17:26 +0200 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:

> On 10/2/26 12:36 AM, Waqar Hameed wrote:
>> There is an awkward line break at the last elements expression. Put all
>> elements on a newline instead. Found/fixed with dtfmt (Devicetree Source
>> formatter).
>> 
>> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
>> ---
>>  arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>> 
>> diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
>> index 1fa1aef140a12..51721fedf7d60 100644
>> --- a/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
>> +++ b/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
>> @@ -135,8 +135,9 @@ memory {
>>  
>>  	pmu {
>>  		compatible = "arm,cortex-a7-pmu";
>> -		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) |
>> -					 IRQ_TYPE_LEVEL_HIGH)>;
>> +		interrupts = <
>> +			GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)
>> +		>;
>
> I find this equally awkward.. especially since this fits below
> 100 chars

Yeah, I agree. dtfmt tries to be pragmatic and guess the intended style
of where to have the opening `<` and closing `>` of the array (since
there is no definitive answer in the kernel). That is, if the `<` and
`>` are different lines, then you probably want to keep that (many
examples of this in devictree files in the kernel tree).

I will remove the newline. If you now run dtfmt after that, it properly
formats it on one line (since `<` and `>` are on the same line now).

One of the hardest things left to implement is line wrapping (i.e. lines
spanning over 100 chars). Which has been left out due to too many
uncertainties. I'll be happy is we could come to some kind of agreement
on how to do that (but I'll guess that will take some time indeed...).
