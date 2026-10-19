Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011002.outbound.protection.outlook.com [40.107.130.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609FC49E143;
	Mon, 19 Oct 2026 08:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792399967; cv=fail; b=LNEnAM39jWugmx4V3Vn0ODo2ekK0mtKsJTsfxWXY6Yt3GrGdvR8DqGxkENTJiuCFjy/bFT7TcCEgSiyXKUBJTPbdQ9QeuN+k4e50k2w9/MjstAmycqpnZdfKJWH/k7/xFeStJuBaFNKOQMcUENG2PnxVzctTOBhvGhFfqq5mEtU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792399967; c=relaxed/simple;
	bh=tVa+GY8/rRfTNkjY6LezLzLH+7UDc9DIpc4TulEqxGM=;
	h=From:To:CC:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=peWVCrd6rTk7eZRMtsZmAv7U+H8NLs1KiiZ/fNcusMc16EhP3FX22a+o0PhoJ7QHJbXI3mfh5RugwVsjbGijE7JZZnA3Y4ESQyLfi0YIfMKKT+UdbZO9FhEPZ3mSRKqibaS5gtwgiLfgQWig8I8a76HfvLJYQ/AYKAmtQawHCEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=AtYvibxV; arc=fail smtp.client-ip=40.107.130.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="AtYvibxV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a1ct3BOsvUGaQaSp0VHpVHn77fZABZPflTyAT78u3lL4qP1OF1pS26ZHimirvniaTKtkDZcBHh+Rk6oIBEB5PxTVobKpiGA6rNLbPuC8adb/krCPdYEh6nF6BRTmk5i6sDpZv5flPace3JniZFfIG7egoscZU05FJhxQIw0rz09NZEoWf2BZfda84YIVQ8nOtdDapeADFb9LHHrXycon6SY0Dl+9Iy+G+7aery22obiw8dZxSfkVqk8DviloPJk2xBx2kIDG+GN3r+4EjHhmbxLXkcKazswTrh9ElCG4DYUO71XPqE8ilojgolaMLYidmUiZ3pdUMqxjM9QtYFkbbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KjAMpi9AD+y0/6UQD4nrEkHL4bUmwFyFC9MfEWN57LE=;
 b=hRlRiTirrA7hTz6bPG5YbarbzP13EtoIfs5MUuyPDJR+ZAhHW15518GMcrKKCDa7PtS8JnESLwg7PPZqkBGMRqhicCu3w/nwn+tLB9ljLzib8O1ZG32lihBhBuKnSIx3RcRvDS8bmHc09vpzrzeWDhjHq8FRzL+UEEISozwr5fUHcjqJ9sRjPmGMgyBHdf3NQeDjhte671GSbas4GUMARl1omv/8u9c7glngrDBfTh9InGhzsHjgy1VsKt/K+bathh9IiByUDBYLe7pg36BoJsMCY08T5YLxxJz+ffCz1gnXls7Bt4cpGJUUeJ+ahfzncv9CuhAO9NqVGRVRWyThiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KjAMpi9AD+y0/6UQD4nrEkHL4bUmwFyFC9MfEWN57LE=;
 b=AtYvibxVSN+7yhYsKRJ/o3xvdRbJdQK7bftMiwntpUf0whSpKpjc97SMumc1AGk9NYtI0L7vcpKVjUcpDJXHoO3ZBvsE6F9YqvtYtgK2p4UATa5SHW9PUWj0T3f4ll1td7LhAOdaIAQTgNT1wMNxuXkKeqqhxS7f20JMg0bsjkQ=
Received: from AS4P191CA0012.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::11)
 by VI1PR02MB6048.eurprd02.prod.outlook.com (2603:10a6:800:180::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 08:52:41 +0000
Received: from CPH1EPF0000051B.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::5a) by AS4P191CA0012.outlook.office365.com
 (2603:10a6:20b:5d5::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 19
 Oct 2026 08:52:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 CPH1EPF0000051B.mail.protection.outlook.com (10.167.241.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 08:52:40 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Mon, 19 Oct
 2026 10:52:39 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson
	<andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa
	<abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, <kernel@axis.com>,
	<linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 22/38] arm: dts: qcom: ipq8064: Break long property
 array data
In-Reply-To: <861b11cf-fe29-413b-a39b-5abff011ed77@kernel.org>
References: <cover.1790892852.git.waqar.hameed@axis.com>
	<3eb4fba92d67e7ff3486e8dea17233369f62545d.1790892852.git.waqar.hameed@axis.com>
	<4451c072-3a11-4819-aff4-e7de100cab8b@oss.qualcomm.com>
	<pndfqy5n343.a.out@axis.com>
	<861b11cf-fe29-413b-a39b-5abff011ed77@kernel.org>
Date: Mon, 19 Oct 2026 10:52:39 +0200
Message-ID: <pndpkx6kr6w.a.out@axis.com>
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
X-MS-TrafficTypeDiagnostic: CPH1EPF0000051B:EE_|VI1PR02MB6048:EE_
X-MS-Office365-Filtering-Correlation-Id: f49ac687-bae5-435e-6195-08df2dbe554c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|36860700016|82310400026|56012099006|4143699003|11063799006|5023799004|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gRuOCtU5PDKe67rxaC++V1vSSFlckVkB5LnMQajO6oRJLhe5l8vmSqd2zo+dfIre7P0dCEg2Pu+POBpLc3Y36x3+GVChlz/7/A3LWg+DuJ8VKclyW1/LurUhK5bW5r2A+BrF0YIUrAafWU+ZOoIl+17TqYuIz/dotiPxHwvVhhXDaALBVZ4yPv57Yj1OwtyAk81/d6uwGW58sBGPe8W9V3mWJ4BQawTWS4JcRdRg4UvryhViI7K5vH33tvCfa6orr1m269fBoKhMKKQoeW8G7LucCufRSZAjt17wUFbSp+9T8NkK2LexwVzXKMlRyqWEtTvCwTcNC3pPDbNHc1rzVHb02QdDTlhREdtjric3ekkMCsLCroOag0vOpbISiglYTe9gVWN5BXS16b5g2guL09eIee0L3vWTjGgYwc75gIFmq7JH96D7WqbSOCiIAbLJtAlEOVQ/axvHbnBKg0v1exDS6PG3F4Ed2TXgeEmXLBbxW4cmh7olG7UX/5mGGgkEpEB4LbMkyxEBgjVEUxoJgzY3obiyLsKS456Ww6tvmyJZXYRmN3ARyOP+OMhvEdXLBMVS0gJUxGpzQPopo2ED2BQa3AlV4iA8ACT5N9xfsHdflGrXrj8RRuN4yNcU13lv7lA2MehGa1hSXWw0JYzRU6kYsPKk7b1RT14FCZJQSDJPSp5mcmwbvHSERt/Fgv/voGge/HYin3HxbLIfkVqUwg==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(36860700016)(82310400026)(56012099006)(4143699003)(11063799006)(5023799004)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QUIcMbVxuOXpZuwfBkxgmKDhCyXwsyHflIN2p8jI3+4mzqicul698fYwvCP+tH4OWvneah7RlKuFS9AdAHKe9F+5CtXz4cygsh75U2sizH2lu00RZhRjwo9jTS05ftsE+Q0QJP8WK1Jx2adjstA9ko91Mn1gQj7ZepEoIS8phXbKvP+x1Jgy19+7T9fl6v34OUVQfuod2/z/JiWYIS8yclA3f+XEgwfVprMBMGFQbDsAkft7JaNWMuX6Esk68bDnldihNCKR3fi450DX/+PbrqBc0C5d6zIp2jxDYnJD1Wm6xC2GsQUlAUQiOnNRwY6l1a1Eed/gvMQAFYk1489k01RiTJVwTz0rHNMAfLayaFL2EXuD4FfzJCwIlZffmi2AwxvCEbqEQ9KAisZXOnCPdYxgyqHo4KpXyBLymy7YzHDAbUJgrf+d7fc3bqri3JP5
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 08:52:40.7811
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f49ac687-bae5-435e-6195-08df2dbe554c
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CPH1EPF0000051B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB6048

On Fri, Oct 16, 2026 at 16:48 +0200 Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 16/10/2026 16:15, Waqar Hameed wrote:
>> Yeah, as I responded in patch 19, this is hard and needs some
>> discussions. Having the braces on separate lines like this is one way to
>> do it, and in fact that's how `black` for Python does it. `rustfmt` also
>> chooses this but first tries to fit it on one line with a newline after
>> the assignment:
>> 
>> 		interrupts =
>> 			<GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
>> 
>> If it still doesn't fit 100 chars (like here), it then formats long
>> arrays as
>> 
>> 		interrupts = <
>> 			GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)
>> 		>;
>> 
>> This still doesn't fit 100 chars. Maybe we could then wrap the
>> individual items like:
>> 
>> 		interrupts = <
>> 			GIC_PPI 10
>> 			(GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)
>> 		>;
>> 
>> I think that's a reasonable algorithm to have in dtfmt for wrapping
>> arrays, or?
>
> The code should be:
> interrupts = <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)
> it fits within reasonable limits. Why would you wrap it?

Ah sorry, I can see how this is confusing, but this was just a response
to Konrad's comment "... For lines that overflow, I think we may need
some brainstorming from the wider audience". This was my "brainstorming"
about line wrapping in general. What do you think Krzysztof about this
approach?

We are all in agreement that the line in _this patch_ should only be on
one line, without any wrapping (since it's shorter than 100 chars)!
