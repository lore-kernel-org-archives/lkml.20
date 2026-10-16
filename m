Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013057.outbound.protection.outlook.com [52.101.72.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C295F380FF5;
	Fri, 16 Oct 2026 14:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160153; cv=fail; b=VEkAv/F0bpA4bUXa6xc5cALASXHpGiu2xOMQR12OOzlPO5lUN76G37WzDlUjrS8AiQHfBuH+D0t5zY2XHeCqftB6LS3M2Li1a8CzuObk2/T0XWY1sNv5iZIvqmu6uUvcsmkc1zgCeJpkrun7m5L0LBYBGaP05QW71itB0Z59Gic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160153; c=relaxed/simple;
	bh=ti8BSw6T4M7iFRrDn3ziql4ZhmZiXVLvgolvpIXRIaA=;
	h=From:To:CC:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UDCmCgmn5/1N7dbV48iw4TPCGCQ/88/M83JGSk9i9ZOoDh5sSbD3YoY1fSRQnAPo970P1MBUpG4YNHN0R/tUiS2/j40WWswe+DC6Z5KslWeGOsN1Q2+7H6N1suDInKXTyGVUsw2Qov0zoySKSiGFn26U4+djwLSFrANunifE+OU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=XRNpIDHz; arc=fail smtp.client-ip=52.101.72.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="XRNpIDHz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FrwAgoDjTo9XAZeqq9q1ljNcTOZODZEbOyu2wjzg7rBkWDDAQISX5ffKlHDadHISVykdI3b93EnMqs5e6zEcglbwIG2apFO1p1Qdu34TdgX7ue5X7gFMqY4G5BP6aN/eqexpzI0yFlZZiubXZBnGnAjv9zCeHkHma2kWZ9hFdeCXJ/yy2K2UwYCw6wCayIktQ5OjzODg5fkPi65SZA2MJLTQ5chzkVmAHVqmt3F02gLkUqUQqoII/QGqAPQqHmL/qK0nguJ+nsdjh5gQJYGh0tCgRpq3Na4a+2Y1ttJO9xTj3xahMJu47MLLdBgZrQL4V7lmKm+je+KO/5dFrT8Ihw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/8xIc+qKp56xYBeY8siKW1xSxYL0hbsWMVn9/A5mI38=;
 b=UeKxKLHwxJIgDpaddnwm7msDBxOll8Z/MgQNy34QKJ/iUi7XFLr6MhjG+F1SJ8FiwDN3BkjlM5bM01Fc5VmWsSwwdC38QBta/95XceCe0NMBoq/cmnz2zGGfEBk7LZVwKHSCebYGpRQ3LuQaiP6QvjPMgDYuatQv//IVAkr05lXIeK2Do/wTsGs3qQd4n1xoEAJ4Vb1vvSsj3pKEWdPByfyypIR/GHhkqNGDVGhAVKyd4mGEM3TzF+l4CteHR+pmoIFX45KmcZYJqzHDMa9CTXoUyHZtYHJN8pljRNOMiSkovqBOGqjZwWyI5A+/rJGBmmCGhl9ljo+GwGFN1JBriw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8xIc+qKp56xYBeY8siKW1xSxYL0hbsWMVn9/A5mI38=;
 b=XRNpIDHzDIh22C+k/RSscWknBNdpMhyTZfuB4/YyxemaBlaWKmurNQDdt+H9RVS0pRM8XoA0Z0YsXGBg72Ue2IpOgv91P91UTM1ikFy5q6gbewXcBU8SSo+Z02OtuPxFhxG1Kr9xe5cjWOLIe0u56gfEbUFspj6fFcWeJHWfmLg=
Received: from PA7P264CA0134.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:36e::16)
 by DU0PR02MB8620.eurprd02.prod.outlook.com (2603:10a6:10:3ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Fri, 16 Oct
 2026 14:15:39 +0000
Received: from MI3PEPF0000848F.eurprd03.prod.outlook.com
 (2603:10a6:102:36e:cafe::1e) by PA7P264CA0134.outlook.office365.com
 (2603:10a6:102:36e::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Fri, 16
 Oct 2026 14:15:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MI3PEPF0000848F.mail.protection.outlook.com (10.167.240.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 16 Oct 2026 14:15:39 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 16 Oct
 2026 16:15:38 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 26/38] arm: dts: qcom: msm8226: Align multiple property
 data
In-Reply-To: <526230fa-d8cb-4e33-936b-a3b99d271026@oss.qualcomm.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
	<d9bcb8ae23ce2143e598d1dc68b1050684b22246.1790892852.git.waqar.hameed@axis.com>
	<526230fa-d8cb-4e33-936b-a3b99d271026@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 16:15:38 +0200
Message-ID: <pndbj8tn33p.a.out@axis.com>
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
X-MS-TrafficTypeDiagnostic: MI3PEPF0000848F:EE_|DU0PR02MB8620:EE_
X-MS-Office365-Filtering-Correlation-Id: 22527333-68b8-4e02-73af-08df2b8ff493
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|23010399003|376014|1800799024|18002099003|22082099003|10067099003|11063799006|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	7546QTAGU98hG96SCghv2SoGYqT9i2dmDiUvg0ZyPbuwbUQDFcAafyQBD3bjzHDCa2/2J3F/IxP4q1bBTwwoIGWj9OLuN6RgdUw/Gp/E6n1kyU4+l/Pe+6D/1aBv4OezoTlz++nH8Idfi+k2ZedkX/qdUd/26KL6pdNlz1XsQwnQ82SVJ0ZwBw0HwskL7nSrhXXfaynwShgSvGrTZmSySmhHjGopwupMtNcvG0HGI23cGyHhh/HvAp0O0eLrhDZnB0Ndopjszv9h4RhjgnekJnbptHTdAOBB/FDWEQmCSFjpn+jKMt6JaCA53hqpUcWtKzH5GVuLbYEjV0rEjRwtIoIVjZ3hLqSBNx32fWU+vEVNE6wrdcV7v5V+RkMEibJEc0PdWFSUF7sUb6Ef74kc/d5zAZ4zhJ/4PUSLlG9aMpyDaRfT4brRYAATwQcOTA3kYH50923tsxQ9a1kPkVPLZgsYFMJgr+tZ5ZofXRgeyAm2/eODPs4jtYaFlvp8s4nGOVHFuCSEy5pkIXU9gB2gWn5A9gWMc/V8GLWYxPOLcjBqnqhi3cTqzdbVt8uVBdyi8ONp8iONAN0129i3ps341Kn3PonMvryBSxOactLVNlFLrPgrLtLTwyp4YAXNoT0jt6J+1ifPs1L5+ZWwvFh3/h0v1A69JGwD7HtAwFmLuyFhiFAPCZf+kaPYMxhuil0wsFd/Y5+zZ9EOk5XuZkJqkg==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(10067099003)(11063799006)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0A2RrhERy4m0wqnhv+yzr75KOoszyNh2GvOlD1W08MjHu26KcRhi3xj/E2oo5UQiwlFpe/aobF2ghyxzk8E25hljsRmm95ZryEJk4EyFXH7iG+EmErigJlTzFYBQYm0DTnvhkWhdVmHDet/cUe8e5fhit4DtEI0wPCVmPofqXk993ETFNPYDKXTZACmaIP44PyVenLNurTjsjsFWPLDUb00tZZ0edYLatEKO90povVycqJvD4oHjz58/f9qMJcUVpWqyITlvXX+aebLj3PZfGqqUXF0ZL0wB0hcUSsZgHj4ebXwDy6oUl5mjw+k3XK1BOIRzh1LmacBj+AdP3hYW06JhRbbHL5WrVUIeuksUCrdT0bquXDKGo8VoOX8whpJusO3rRVoRa8OnbnGTLpZkhj4DtfKG3V0UiEgMnwVDcaQYgcCK6dHWkRDICaebTRoN
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 14:15:39.2940
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22527333-68b8-4e02-73af-08df2b8ff493
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF0000848F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB8620

On Mon, Oct 12, 2026 at 17:31 +0200 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:

> On 10/2/26 12:36 AM, Waqar Hameed wrote:
>> Multiple property data on a newline should be aligned with the first
>> one. Found/fixed with dtfmt (Devicetree Source formatter).
>> 
>> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
>> ---
>>  arch/arm/boot/dts/qcom/qcom-msm8226.dtsi | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>> 
>> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
>> index 346aef4a1d9f5..ac18744b50924 100644
>> --- a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
>> +++ b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
>> @@ -1483,12 +1483,12 @@ cpu_crit1: trip1 {
>>  	timer {
>>  		compatible = "arm,armv7-timer";
>>  		interrupts = <GIC_PPI 2
>> -				(GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>,
>> +			      (GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>,
>>  			     <GIC_PPI 3
>> -				(GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>,
>> +			      (GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>,
>>  			     <GIC_PPI 4
>> -				(GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>,
>> +			      (GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>,
>>  			     <GIC_PPI 1
>> -				(GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>;
>> +			      (GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>;
>>  	};
>
> Likewise, these fit into 100c

Yup, will change if we come to a conclusion (c.f. response in patch 19
and 22).
