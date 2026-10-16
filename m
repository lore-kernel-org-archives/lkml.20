Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010015.outbound.protection.outlook.com [52.101.84.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A514DA9C7;
	Fri, 16 Oct 2026 14:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160075; cv=fail; b=BZZQ6uT98m7FOgwtr2/YRScUO2/VWzGbUXcSbOFPeyQAK6Ksq/AgNeVxfF1U7hpM2FmHnqooikOF5f8nBpxUIrDNu3TRrIyWw4Dn1PncbMvH9AwbqEBr7kihXYbdNI70INgIwIYVSEBv/zTgQOqUy9e79S+/naV3SMJpOsgFTvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160075; c=relaxed/simple;
	bh=VVcVPfX9X8NryxCKzXvi1JkO29dTu7FHqzxUUwKp1E4=;
	h=From:To:CC:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mTwg2brruYS17Of0KYjTGUlFiEqHZDmCXJp0FFhyv15a7vreZuYw0y2Snx1KMLuCJ0W5B7/OgUbm1dBNz8dTlPWWqoMBKXqG1vdWwmw8I+JhmqTCD7hLP1VjGFIDK9/kmb3kMxKfyNKWNX/QOKlEBcXVa6H1XxyCdBRrZQ1sfs4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=PaIdO/yx; arc=fail smtp.client-ip=52.101.84.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="PaIdO/yx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BT5A1o1YkMLyIE74Ozml1H1+821qeSsdQQ0An/J0fh34S7PBe/8R41pbGUpPqV1nhGFdBjtYRf7iN41R2kXNcVfUFXHEUfeR1/2sOc6qd4sJFRKcWcWQsgcsBqm0gbrehvf6nzX3Y2apG9UnxB3JOs9/qR6KkzYdYwUxgWBTaYK2QgQywZrj+w3ZoXiXF8b2CkoTnAElg5IiMAlijRgFfR5UkqaVgw2VH3ncn36oXI6MJx6lt5r+uFJEDFPhkTZCoMXfE4dxU8jcDjYV3Sg022KiQwM0EnCzzjgt4NxstVH5QxyybwrMc4yD0QQmoo6rQvXVh7FuHSxb4VkTN3fcOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VVcVPfX9X8NryxCKzXvi1JkO29dTu7FHqzxUUwKp1E4=;
 b=Ue0YZYmKS2tq0v7LuPOl29CdzoEqNEISDOOcDz8iOLYb+lEwdH9YfaxHRGOYWfx5HPeTqZ+XL6HVX1crvYRa4dDOYjGe77QkyYFn6PjgVHseIEb970qkpuu8412BWukxyPLrm3Myfqa9u4QNM/AplvzLN9bT8fOVieapr9Kfrp0a6SvH8SwhgR1sEH3kA+O6fS0BqJcPJ+NQrNNs0cH+Fyu21370yRPod84MN+Ecw6Lk+T3VNqYHdbPe/HJU0+ZQt2NTWuZXODkPJKgQQpKEsiN9qjecAn1sM5FArD+jwC38qHeMQLb9lt8FLu9kv5OqYK8tW8lU0fmOxDewJ2LNdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VVcVPfX9X8NryxCKzXvi1JkO29dTu7FHqzxUUwKp1E4=;
 b=PaIdO/yxirnPEGOa+P48KNDTIhIcpDuQlhjgH+eUlfCU3/6RtlbrAa3/W9/2MqaJ1VbO0NXIdVGp/34dohAzAZrJUP4zGTATSGn1yp+gCPfU75wy+NUlc/kDwU1jfqQuhzB+OF/3qZ3IDlFsOIZs7LW6/ko0HGQiAHLrKFAg3wU=
Received: from DUZPR01CA0174.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::23) by VI0PR02MB10993.eurprd02.prod.outlook.com
 (2603:10a6:800:25a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 14:14:26 +0000
Received: from DU6PEPF0000A7DE.eurprd02.prod.outlook.com
 (2603:10a6:10:4b3:cafe::7a) by DUZPR01CA0174.outlook.office365.com
 (2603:10a6:10:4b3::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.17 via Frontend Transport; Fri,
 16 Oct 2026 14:14:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF0000A7DE.mail.protection.outlook.com (10.167.8.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 16 Oct 2026 14:14:26 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 16 Oct
 2026 16:14:25 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 11/38] arm: dts: qcom: apq8064: Add newline between
 subnodes
In-Reply-To: <08bb76dd-6516-41b7-be5e-a67513997ad1@oss.qualcomm.com>
References: <cover.1790892852.git.waqar.hameed@axis.com>
	<b86dabaeeea3672a790fb5e8378f829bd616de78.1790892852.git.waqar.hameed@axis.com>
	<08bb76dd-6516-41b7-be5e-a67513997ad1@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 16:14:25 +0200
Message-ID: <pndse25n35q.a.out@axis.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7DE:EE_|VI0PR02MB10993:EE_
X-MS-Office365-Filtering-Correlation-Id: 245be7c8-0056-4af7-fd46-08df2b8fc957
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|36860700016|82310400026|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	i7pJz3TUuJnS+cbfxB+X6OK8CD5skgS0tYyBDDcxVfYnZSocpLMiIV+MxDjLeA/Ootvhh0DIDqmLJLzuOlNl20cFbWKzXvQKXuVECat+OUwF2nqUHDihb/CMbDuEjRoCwUk7eVfF9jByY6iEeCNPZMWUgnr8Dqy7spjnAzkwQuSDBuD5raAyRuWb6X27JdixD1YTXPE0PgwDUofvw5Ijx9bTM55wjqS4BFnqmHCMd6aXnLq2iSs2Pf9bMA8ukRfxwqjK5ppjfg35Gn+RBGBvAXXN5ipo39gpGyPMdrxKSQ/kMdXBrU4Oj1ijOOFtINfdCMiL9L539ey6YqYk4UEwFBZIVv3eK6mqPNWiWm6dpe/rSYn11387lD9e84uIMQ4McdjlNN9JT450w+yaB1Awn7cm/itSgrEBbCtdSF+etgEKxtgjfkGFWtigMQar3fEES8/JyZEjELe/tVc3BOt/qyuJK+n3AHda2eWSaRA4DmRLORImsbS/IDjgiKTcjhiosDkRHtz18fnQL/ji4LcmTuQnhmdTqewfMQsW8bRhq8vKPXSw++r6iWli3hxEgtXmtBi9XsMZaAEsk4BWlgbZf/JZGAe7nG6N3rlJQKoX1WLFQ32itxPtmYCjB3o2IhL4xtt8e+7eg0bR5wRi/0uj2GGbv/WZ8+Kk9A+KhbWOXkt3m9sxJ7kOSgW9qY/lGGNVEQg3mPxmAgpAZJuibspJjA==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	20lyPAZJYzFrxTKd+FfSLH152FvH1CifmA//OJAUBHvvtSiTw/08fqu7ejXqyMp2vzK2IqVfxiXcad+UleprEub0yhXBYPpJz+VgCrQe36D9s6C0C8alQbzeyEEPZl8nIc7x0aYpHr5u1Vy/9948xZYUr4pWDlaQ5oxDng5VY3hkl3x6iIruf8oRIYbK9Mv8gVo/Z1mV6SY+NVzEIeoeZUifJ4IFlaqLB6lENQ5QTCnKbbMetVjltjmw+49yU3fZioOjAseOAIDSa74fQXR5wJE/nc1jtf36RVpVptOmasdiVbiIQ519XDqDCf8TCuIyrwPcDm4b55TfSdueyvjglNTCBqBn7K+3BjM0dw54jumPJTGajXRcrnIW+Tn8ohuCw63dojLk8+42NCYRoPzlGlUi0WcfjRK6qxwNTbwgJ0/Ujac/r4DtCMKMilF1iEGC
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 14:14:26.7701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 245be7c8-0056-4af7-fd46-08df2b8fc957
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR02MB10993

On Mon, Oct 12, 2026 at 17:23 +0200 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:

> On 10/2/26 12:36 AM, Waqar Hameed wrote:
>> There should be a newline (and only one) between subnodes. Found/fixed
>> with dtfmt (Devicetree Source formatter).
>>
>> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
>> ---
>
> There's some 'remove newlines' in there but the granularity on these
> patches is already more than enough, so I don't mind!

I tried to cover both "adding" and "removing" by saying "should be a
newline (*and only one*)". I guess the subject "add newline between
subnodes" could be rephrased though :)

>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks!
