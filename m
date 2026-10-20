Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792499155;
	b=AI4mKgEJ8ZNjIFHsJ5Gt02wuw7IQ9NuKqn1/Z2AhDNrfBu3Acp4cpfm3BfmgVlTK0MBc
	 hP9pf8qpx/fYPaWdx7oYsx4T0sLXYBGOrxUtP7LPsKOROIAKCGLZmdRoMyAAkKeY4Y+YY
	 KdwXAUEtUUA1O68Z1XnZiIeWBE0+HIWZyiAcGTjoRmeii433hVK6QHt1eLCi1ir4a+1cD
	 bNj/XmHeXf5kmaokpwCnOSPP8dodzBSQbvTKhhl3ZS/QqYKDSAhmICc8rnPkdydBgveZy
	 O0o//yP2Hyiq0cxxNWCy7DJrP1cGuc8Vw6qM0zqFkaEETGKtL6S2PKSBllQlkd54ugg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499155;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=8ekumBlr4SmCGKX9ZOBmYu0keJnZqEh5TsaCM/Qgmss=;
	b=aH2mlXeANqyNtmZMxrdTiu/dEy2wzWfy+Z/lEYeAsi+4oMfYtOPwqoAXwNFHVh5K0jd5
	 hA378LzOWX5G+j9eSrEL9CQW4Omg/jo6zbP1TuXlanP+c4dn1fRYKHP5dZpx+27W6YCII
	 7d/oPUWOZE1FnLxg5S43rdhPNhG+lKt2Stl0KbdsCYM+FKMLRw3uqNO8usDVeshxRlG9V
	 jU6AjrRpA2a/kFh+T13sfxLO0+KeOfWudQoguoSZ7e+VoNgKPulc0E0ZZT9u5zJuD3zu9
	 Zn1udikISXLzqo4vKPS1D9HDLkBAEixtBUkUawuhKeasqrG3ih16qdHmzRlMC6io+zw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=RHpQIuWd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.23
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011023.outbound.protection.outlook.com [52.101.65.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69B7606A319;
	Tue, 20 Oct 2026 12:25:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A69B7606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=RHpQIuWd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qobjUpGlojkPXtQLCaAAZFJNSGTu0nIrs/FHtvHJXKRP0vdCj3sCCo0ngsjT0uJdKRS6EoUp7zd+mo3OmRJ2gw7mrxCUMra4g+Pa32cuq3iLzSC8UsHKhAv4Upqj8oaohSVyvic953apv+Z86jtd+HXzNzwK2uzJ5fHftKyFYIUeneLJZ0eaRoj+4wGQYiFzI/HTpLqIlHUkCylB+i6Bhbi4vXOJ++IEd8EH8PSZzDNuhNwBBKYc7Rob2sHICYQw9avo2SpHg7MY56D3Da+XX4xEY2XJoSLY6LRUzQGKPdv5/lTtT4vQyPldNcT3/Oo6JzNJCWE6cJ4L2eR16pAktw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ekumBlr4SmCGKX9ZOBmYu0keJnZqEh5TsaCM/Qgmss=;
 b=qwFOr9uUPQjpNunIDMg4M+NaBL1kUgEQ8CSOqEsOPXgk0PDdiRUpjJqUChvXqJfxJs5H2KIw9qWVcJWVg7yLDYm5AZGFjipNVLscCNQYTRNwlluOZ+FVlndVJ/UQ5GEFBtAqUrb8dyWFfyTZc7JPDfSZlA8+Lbv3LqGQsqrzULgNLdLH5Hw1CGtZ0rICDPbBM/DPrbiWnOAV6s4+6YsJXUqNevWAAoLtlDF4xFYSvNVmJRAXMbGeM44J6ta15OBWz02tzBHuoSwnSSEkHqqyCmD8oZ73XItOZqzsebtAufjJ2qnJKJS+jsCLCzXH3lPb47xAO0ox/9ujtTLEXnCI2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=pm.me smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ekumBlr4SmCGKX9ZOBmYu0keJnZqEh5TsaCM/Qgmss=;
 b=RHpQIuWdSTIiemGQWXmmPaD220ba67q626bppTiFapF4ShTgClh5O/MaKRtvM1OC9z/7kwgN+giYFaEVxNOZOt83DQCrK5clflRXeT86207COdm1brh5Y94VN+ZQLOAZifxwpJo9AfM7fR5kFpdJkHbBbBmwUSBfznH6iNE4INYZLoyQwIp0mTg72QCQZIcKVp47XS7TBT6KfOR0nkZXDghkNVEr0/LVHMCqrAQqkTorTntWHbaR/RzyeXV2mOdp0AjbH0F3RSDyJEyAE9nrEff0gJo9w7iULtG8QioR4ksw+oOn1HfPE2rBOrpEDRL5n1wpPwjBhOaNLE19LvqFVA==
Received: from PR3P193CA0050.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::25)
 by GV2PR10MB9746.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:350::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 12:25:49 +0000
Received: from MI3PEPF0000847D.eurprd02.prod.outlook.com
 (2603:10a6:102:51:cafe::6b) by PR3P193CA0050.outlook.office365.com
 (2603:10a6:102:51::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Tue,
 20 Oct 2026 12:25:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MI3PEPF0000847D.mail.protection.outlook.com (10.167.240.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Tue, 20 Oct 2026 12:25:48 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 20 Oct
 2026 14:26:06 +0200
Received: from [10.130.78.67] (10.130.78.67) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 20 Oct
 2026 14:25:47 +0200
Message-ID: <de8c6003-c7b5-40f0-beab-4c3370b98f09@foss.st.com>
Date: Tue, 20 Oct 2026 14:25:46 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] media: i2c: Add ST VD55G0 global shutter sensor
 driver
To: Sergey Lebedev <lsa.uz@pm.me>, George Neacsu <geocausa@gmail.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>, Sylvain Petinot
	<sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>,
	"Hao Yao" <hao.yao@intel.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20261019162722.25587-1-lsa.uz@pm.me>
 <20261019162722.25587-3-lsa.uz@pm.me>
 <179243379000.31842.4735750009847702427@gmail.com>
 <20261019193402.52923-1-lsa.uz@pm.me>
 <179247822513.25202.7960395606350309657@gmail.com>
 <20261020085200.60619-1-lsa.uz@pm.me>
Content-Language: en-GB
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20261020085200.60619-1-lsa.uz@pm.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000847D:EE_|GV2PR10MB9746:EE_
X-MS-Office365-Filtering-Correlation-Id: 742f497c-f907-4e80-fcb1-08df2ea545f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|23010399003|376014|1800799024|36860700016|6133799003|18002099003|22082099003|10067099003|3023799007|4143699003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	vqm+Mup7RtFafv0G8T0VkB+4aOjv3RH6VIVm7hCjx9NjNinFkF04fCmnXEz241dR0QPN9mlXE7ygFGU2CU/lqETHVkVkadtr+nHygfq8hXy8UbQNlOE/cRH6W9VMFxwKG+cDMkxGbznh7fDWuy1hsDR/YLgRK1dMEWNxcmd3Wk1nqzk8caQTic/9MeLfHoghJ2IXneMqCYT36WrM36wnPlf6hIaMYnKp6WDcSfz2E9068HtMlXlPs6nawNzgS1GEA6qYNQYgIR1NU+3Yo0C9OMvxHGVFr1gW9UcEen51BA1wFuH+a5mjq6HB2V2feVH2rNMofdmVtmf6Ydxi9yvUpcyvoLkeU3NvqcW1s2Q2wKUVdQVztHs1N0IkaleMeUoxAwmAG6Q7h8kURpJPfeVirL2m1+yPJREnSgyyvCLsLMxZR909N6+RlyyPG8ZKjHeC0c3VzHuLYeSt8jifpt6wVzTr4PyFKMJ054UHfwAqfmrjiQiR5R1ogAx61BcgQrwm8rwJ6/fE9OW2t7RtFu0e+s7znhOOPsm28M/98ZUL6NJHNH627s/nQBR5+lA+Est+ALR31QHK9rtOvztpOPWTSe4NRrwm7s2t8PTzCX6UVZaxLXMIu564EXTEdzBHeMMZMU1PGcmuEK0ZZdI3kwmAGHrVgjOPcFhDYAJYALLZswiY8Ti88zt2C51e4ycZyCA4hv/KaKW7EJWmeQXC7UPE3g==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(23010399003)(376014)(1800799024)(36860700016)(6133799003)(18002099003)(22082099003)(10067099003)(3023799007)(4143699003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Bja+lKidMVVHIRN6oIhJzQqWbA+D8PL8em0kCXVS5L6C8rmWyNqUlVXFyhFxTvmh4mskMFpNp2K33LK3E2ZB2eU31it7B5YPkA2DQmrxNOPLzX5ZTVC0AsWY8vmTU59Lm3dzvOu1uHKVXNn4SDY7VtuRaoI+glTOmyBDX4x0nIqYSKTCgAEq8N03qokE9Ydkxzyb2z9lW5YlGEFVcLfcJBmBDCbeAE3AQBAU8UEVExwcSN6ov+/8dDhsBrfki9TXVFVh9PDv1xg4dkLTURDDpI9efOkW7BobvWZDaUtcXFZqXH+vIDArA4eTT6ZoQ7EBXeMIuKMqHvx4jcEH8RzYxl7n2+0ua/I1yRqDke9RP/CUkCxqfTRDZocK5yto/m9hgQGbTEBa6bCZpwzEu3lS9e8gzNxxA9E17jT/881eXh0YV2N3FRrvcI45NpvF4Vxw
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 12:25:48.7632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 742f497c-f907-4e80-fcb1-08df2ea545f4
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF0000847D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB9746

Hi,

Le 20/10/2026 à 10:52, Sergey Lebedev a écrit :
> Hi George,
> 
> On 20/10/2026 07:44, George Neacsu wrote:
>> Would you be comfortable dropping that write in the next revision? I can
>> retest the revision on the Snapdragon model and add a Tested-by once it
>> is clean.
> 
> Yes, I will drop that write in v2 and leave 0x0329 at its default, and
> Cc you on it. Thank you for narrowing it down to one line.
> 
> On the Intel model it makes no difference. In one boot, with the sensor
> held powered and 0x0329 set to 1, then 0, then 1 again, each state
> streamed 150 of 150 frames at 59.14 fps and restarted 10 of 10 times.
> The test-pattern frames showed no shift or extra lines in any state, so
> IPU7 does not put the status lines into the buffer, and its error
> count did not change. The full test run without the write
> matches the run with it, v4l2-compliance 46 of 46 included.
> 
> One thing I cannot explain: on 16/10 your vd55g1 build streamed 2/2
> with 0x0329 = 0 written once per power-on, as v1 does it. So the write
> alone may not be what stops CAMSS; something else in v1 may take part.
> Leaving the register alone is simpler either way.

I'm a bit puzzled on this.

ISL are output on a different data type than regular data. They are
output with 0x12, which translates to MIPI_CSI2_DT_EMBEDDED_8B in V4L2.
Your receiver should drop these frames regardless as it only waits for
data and not ISL. Outputting them doesn't affect sensor timings either.

I guess there could be an issue on the receiver side ? Maybe your
receiver is ignoring data types and completes the frame with ISL data,
effectively filling up the DMA ?

> 
> Sergey

-- 
Regards,
Benjamin

