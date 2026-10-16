Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012043.outbound.protection.outlook.com [52.101.66.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4F5359A9B;
	Fri, 16 Oct 2026 14:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160067; cv=fail; b=QtD03ZYSUDIq9N5D9JYEhPRhqZwnYX7jXfDHEfgyQWDv7kNkwS+2QJAUXNU2t3VuUTR6ZMQwF8Rayh135p5o3O/E7p9S07UBZU8I0xcfSnkH0uCkoMG0r+bXpMUvyRxLq7C7bC050SaXqIZR0mBsDzIZSXHgIdKaaXrZ0/AGYEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160067; c=relaxed/simple;
	bh=sqL7j/dGAHOiSkWZWns13PNoqVTpQVNYUA8/L2ScmLo=;
	h=From:To:CC:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ji3L019Kb9uIiwU5IcM3mMDah7MnsYiQy05kiMh5m4jOIjFSLenyEnKPOTvO9bMRCx57GBnCDDx2ZcEh4uvZTjr9SFbBGGIWNrci0sctyGTDJy7j6xTPE9E3DnhiLaJ5MDyWC/RfWLlWAfGOzWPfqGUsVKOEecq9+6E4FZPfE28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=cqoxXfv1; arc=fail smtp.client-ip=52.101.66.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="cqoxXfv1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bokogNwV5FjyTSazeg5KruvhkSv1hn+hdFW4nqESYw/Vqz+Gg1ZE+ZeIFdUYR6O3TzkoChMgspq/nuwK/v/j2cUp14p6Ww6zQLlkiqstfp1/1tMjrGFbvBrRsN6HAeXAkLhsFaARoJo/WDvmUAaQXqr9g+FnRb3vfvmO3QyPB8ZQ7OG+y0gVSWNrE+wvSQ+9zjm7DsVatY3E5cLQGr4JQ4q/NPECg+Se4Z37Fh0qXo1qvs/ibQGcfx6uHiEyj0WIf/Lrgbr/YoGK+riWNlXUwbXwx16RP0avJhAcIBP8eL/4ix13NnYBz2azlfgLEti/A7zJx11n+2RNZp0Jq/KwEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G2ebXGvXt+f6W6AcOc/qbod/2yvUmW3YLgwuqzSeImk=;
 b=WYmdlOIO8ESc5T7heLaj6ItW2hDgRusgaPuEEeFFj24L4+FG1mBcwEKRuSvLe9kqwAhyOU7vBu0w8DHwjqC9LBkPh3FiUbGVb55d87e8P1Dnj4uhoY97+VM9YyIa6EUdVUdbax4+UA0MD9T1tHIxFNEVDKq+D5joQBI7hXWud5G4/4qdftae8K4UpiHjodY+Pdv5C0CVuEQ+bs23gImUZ8izpPTb6d1HJakU9gEIKdJP+A88nXEMlTZmRacc3L16SAHVPRc+ZyaltmR2YKpxaMYd0NmkcMbe1y0ls3VqlVpDVJEchDYaCwrBMNC8XV8zzVsCIevegjBA3LdhAAxTGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G2ebXGvXt+f6W6AcOc/qbod/2yvUmW3YLgwuqzSeImk=;
 b=cqoxXfv1F7iR7HNaw00dIj1CSB5+k9re1NtMpgiIdGw7D22L1sjljHcN60DxM3c+YxYW+Kdl4sVX7lp5WuYqLuKuT5amZXy/SzA7okTvUMwmbQpJEQs+B7AJej9R4xe98h8OT94wu5fgmCjrj6v6IOBPLkwZR9TJMyDjWNumR0k=
Received: from DU6P191CA0035.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::11)
 by GV2PR02MB8579.eurprd02.prod.outlook.com (2603:10a6:150:7d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.24; Fri, 16 Oct
 2026 14:14:16 +0000
Received: from DU6PEPF0000A7E2.eurprd02.prod.outlook.com
 (2603:10a6:10:53f:cafe::6f) by DU6P191CA0035.outlook.office365.com
 (2603:10a6:10:53f::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Fri, 16
 Oct 2026 14:14:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF0000A7E2.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 16 Oct 2026 14:14:16 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 16 Oct
 2026 16:14:15 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 10/38] arm: dts: qcom: apq8060: Indent property data
 with tab
In-Reply-To: <16e7bb97-4280-4c21-a011-3a6b99971fb8@oss.qualcomm.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
	<a647694d7a5f1e2f8d5c31d878e87a6d054d4aa5.1790892852.git.waqar.hameed@axis.com>
	<16e7bb97-4280-4c21-a011-3a6b99971fb8@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 16:14:15 +0200
Message-ID: <pndwlrhn360.a.out@axis.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E2:EE_|GV2PR02MB8579:EE_
X-MS-Office365-Filtering-Correlation-Id: de0bc113-8b5c-4123-af59-08df2b8fc30b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|1800799024|23010399003|376014|36860700016|56012099006|4143699003|11063799006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	IxAUYF5OoixGxmLKXr/xWfK5JQOIqJK9jGYo1MW9cuckHMJ5IYO8U92B4+c/uO7V5HdwKXZtvcuKxBUMGgPhyIiTR2CO2hxTLNnzvjMjhSyLgVRq7pnpjCeTj8xQQt3mXfl4I/5QUVzDzJYk3A7AzWhZGkh4yn4Hog/NyAAQSu2ZsimSa4XPsqX48u3nscWGNYFHv7++hDoqXvAvWtWQT83u4bpBqh719s7deCyxOmczZFCSwq3g1KSmg1DT+64xFDIlrOLqX7nnYP0zmKpCpYE/j5n7/ClvM61csFQMzCf8o3WaQ2ZtVXzYjJ4aSxJhBQWZFWeW1tnWVwksD6V9Vo1qDEIuNtQ1NxYWBMP6FS1XXFxUQR2l+WKiSiqFIe1SoSRqIwALjA6R24Q/SBFofaWefMSzIbGMBb31IMlyEdBZRxFw+IY2kZXVfdd/xSep4c2bVa+44rB4TlTfLTjcMYSg59EE+03oMQ+Yx38A8lJSs3DcrWPJSrOTOxYSYIWLKGe1RTB4lnaqpNCeYBjNr1Fjwz9NfFEQwinQ+OkjrEPH4QIn0fepzElssGqwWQPk4qSleTCi2Y5TZFnmVsQZ9ht8doSsj6Jo+b8gxEzanDQZzXM2HZc6S3gzu5eYRYNuBtspt0Uhs6Xa9mD+OJzEkMrlxWxAJ4nUkJ+O0bTUUd9YBb6Ng7MlrcgSZMwM18cPB7vgZD7iEWqZlgkBFBjZSg==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(1800799024)(23010399003)(376014)(36860700016)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	E5IFSeBpJ6xA2dprWIR0bglamc5xJOFt1+aZc/sgwsU1S2L884vULWVajTuCMP3+NHw85RPIPur0u1BprjFNGcmLTcihlyY5DsBVm4V3wKvdEM4f3yfoi5ZXFRlWH7i1WmwGIBGL0vUatN4bW7ztYgbAvLfLUUuoWBKGBVdS+G58ddIqjIxKia2BVNINGO5gmwVj7DHQ53yZPmf9rPMemwGHOsaToVjmHeBcO7DYk/vhR7LUYJWQREq2iLTHuXlOZPsuNUjett5tFxHxDu5KTTHlhtruNQXxsZMp82jb5j94knbxuLaEzHTIcrT3lPPVj4GQ/UZCIzeR1SwrIF99zlcMRSFNgg5RRjUuadhZGxpJiy8L0N70hg29oC8lh4IaqQkibZgfLsWy+2s2kVAGUHi//uOZbYy4TRPtqRuB6EiAjdMqSGr2B2e4g2FW4env
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 14:14:16.2010
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de0bc113-8b5c-4123-af59-08df2b8fc30b
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB8579

On Mon, Oct 12, 2026 at 17:24 +0200 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:

> On 10/2/26 12:36 AM, Waqar Hameed wrote:
>> Multiple property data on a newline should be indented with tabs.
>> Found/fixed with dtfmt (Devicetree Source formatter).
>> 
>> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
>> ---
>>  .../dts/qcom/qcom-apq8060-dragonboard.dts     | 28 +++++++++----------
>>  1 file changed, 14 insertions(+), 14 deletions(-)
>> 
>> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts b/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
>> index 4dc63032cccb6..6ede4e5af4494 100644
>> --- a/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
>> +++ b/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
>> @@ -966,25 +966,25 @@ dragon_ebi2_pins: ebi2-state {
>>  		 */
>>  		mux0-pins {
>>  			pins =
>> -			    /* "gpio39", CS1A_N this is not good to mux */
>
> Here I see a possibility for improvement - we shouldn't really be
> breaking lines at the assignment operator

Yeah, this should be discussed and decided. dtfmt is pragmatic right now
and follows the existing style it encounters. That is, if there is a
newline after the assignment (like here), it respects it and follows
that. Try removing the newline after `=` here and run dtfmt again. It
will then align ...

>> -			    "gpio40", /* CS2A_N */
>> -			    "gpio134"; /* CS0_N testpoint TP29 */
>> +				/* "gpio39", CS1A_N this is not good to mux */
>> +				"gpio40", /* CS2A_N */
>> +				"gpio134"; /* CS0_N testpoint TP29 */
>>  			function = "ebi2cs";
>>  		};

... these lines accordingly.

[...]

