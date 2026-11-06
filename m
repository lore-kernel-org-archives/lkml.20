Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793963633;
	b=klM0PW/bV36URPdlovDVj1Ni+IHx7WSyoeEaP1G1yKpyrRxJUUbieZtUxv85eLzO8nzu
	 JTMmqhGRM7mAEWx9IPXHnHgY46kyiuuRbOJzaFZ6xE2hmU9ndZ12DNhODI0yhv0p1fk7J
	 72E541AH1BJXroVxu2efrpu9DrZS/YjMU1tOogJ1RaphzjcQx5U7bUwuZqZpAcQc0Y4t2
	 hBqzR1ydcZ4oIjd58BlyJ3b0Q6sWnLHIttX92/VA+uD/Ctm+dJ60jCMhyQWJIYEnoU8ov
	 YfOscoCnDH5wGIPljto7diGsNW0LqL3T2hACyokXmS62icaF8fIUHrWE/HmUDzmxv8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963633;
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
	bh=3iLvLsQh1LQHJISIjx+t+WXBBKVSJkd4YqxsBGJcwO0=;
	b=TJ+stWqq17e77QaTlRgwMpPup3JJ6L9U+cJqb6SvAX3H3QDBp6shL/qFukQftwaV9Vj0
	 HLxe+2HhGMyyeAEZjt0IJg8Dc/mMu/67Li+vVt+onHOQGsA8sA2jTFR0Yir5MKT61eADD
	 B1so3WyV/Adrp3eZxOwOQaA01k2kW5tfXerUUb0MgRTF9N/Uz61OWUV8sDRk+LTRxD8eL
	 vsxa6S6oVaT6UpYyEMsdoIO0JiHragAbEEaeQTXhPX3XtW3UmL2r5OmRiZp+5NTdR/6om
	 cNYsaRJl6GpL7HzRuqCv/atWS3U8/6L7CU88eZmWAgAcRuuOikk4jQb4iMdGyFyQtJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=apquuVit;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.43
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010043.outbound.protection.outlook.com [52.101.84.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EDF606A326;
	Fri,  6 Nov 2026 11:13:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98EDF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=apquuVit
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=crB4bKkjrYmFlaYHsUllioPF7Exi4/jyVGWDmY0rAzbGRiOIMX+S6vfxLRa/Bfm4E3kiYMU4gGLK8oxjr+k6xOAm0fSdNQMpUUWKPTi6/v0BK5t4Rs07IcLmmrSNRfE28J+g8/OEK5Dx+Ou0xRwelFZ30EGFZ4xjr+aO57ojmzyh0QKfjx4L4qbbgH+y2UjTBlkPo+Gwgx3GoWP99D0prGH9CRzYj5JTwB8yoJOl6roYOgvMpaBjKnvFlhwBB/4CwvV/mV/ZQGnoVlkk3uaTn7SAMrw5bClnSI1DcAfK+TUFTp0wAq3rePxmwqwFR2kjbvFBXIzwKN2KQs7XLuf50Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3iLvLsQh1LQHJISIjx+t+WXBBKVSJkd4YqxsBGJcwO0=;
 b=coDg5luDVRwz3GmJcIh2F9nfj2m9r7MHl+5gOZL6wtmujE0H4mDjrNwlA8qVgKsz1leBi3ZT4nBj0+cRWQu5JTUG0ukxkpnFXAaUL6SC6ctaG31y5mWvQERL+7xkTy9upLBWX56/j7Kozrvw/p21D2DJNConPdJ8KNLtryKjrrPTrEpSNYlcJP8VrGrcwHqZ7DQIbqcQsm7pFJvkNbUJJQZUrULMl1XjQzME4ROzPFk0gIg6KifbyYLdc+wX865FyNCRPaQ3BuWkjG1cAy6ADuZupcG+cIZQ44S78NGML1tyg6dpXRI+EYfvAnnvq7m5yPCx/mR1Dq09i82bmUArfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3iLvLsQh1LQHJISIjx+t+WXBBKVSJkd4YqxsBGJcwO0=;
 b=apquuVitlz88g3730el3QdOLEahRSGQD28lzCAN48tTiwY2rCHNv4yFAAce4MD9r4hXbsqks9WvgIBT83yw+as6eJag9E0+EQu/wV2dzi8bm+OG0zpR/43vpku0xoo8eb6oTRGs5CZ2v23KHLPmoe9hxVFv40rsrYrRchLWpuLlL/1hwPZgO/ndtUgwLQKULlShrBAQg7vrPveiiTWZa1RePchpFhiKNFTW25Uq1gOU+ZSblzA6s4ta3K3pAwMIRWob3jNrgQRJMb8JXLU1amEgtf+kCSsUUqVJDDNGse/jW/xfZwq1bmVTDl2w1yRQ2s/ux+1LuT8/532uy+Z3ttQ==
Received: from DB9PR06CA0003.eurprd06.prod.outlook.com (2603:10a6:10:1db::8)
 by AM0PR10MB115117.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:7f6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.5; Fri, 6 Nov 2026
 11:13:50 +0000
Received: from MAD0EPF000008BF.eurprd04.prod.outlook.com
 (2603:10a6:10:1db:cafe::3) by DB9PR06CA0003.outlook.office365.com
 (2603:10a6:10:1db::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 11:13:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MAD0EPF000008BF.mail.protection.outlook.com (10.167.241.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 11:13:49 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 12:14:35 +0100
Received: from [10.252.31.114] (10.252.31.114) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 6 Nov
 2026 12:13:48 +0100
Message-ID: <6a530e5a-ab86-4519-a0b8-fcf61970bb3e@foss.st.com>
Date: Fri, 6 Nov 2026 12:13:46 +0100
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
Subject: Re: [PATCH v4 1/3] dt-bindings: nvmem: add STM32MPX TAMP backup
 registers
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>, Srinivas Kandagatla
	<srini@kernel.org>, Simeon Marijon <simeon.marijon@foss.st.com>,
	<linux-stm32@st-md-mailman.stormreply.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261104-upstream_nvram_reworked-v4-0-144024496a44@foss.st.com>
 <20261104-upstream_nvram_reworked-v4-1-144024496a44@foss.st.com>
 <20261106-truthful-humorous-centipede-bc21ab@quoll>
 <f8a1dacf-f701-4d04-b837-906504d6afa8@foss.st.com>
 <13a16c37-90f1-43e6-a50c-80c8ad8a2168@kernel.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <13a16c37-90f1-43e6-a50c-80c8ad8a2168@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008BF:EE_|AM0PR10MB115117:EE_
X-MS-Office365-Filtering-Correlation-Id: c6d2a8ef-2d84-4484-49dd-08df3bf708ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|23010399003|376014|36860700016|1800799024|6133799003|10067099003|22082099003|18002099003|56012099006|11063799006|4143699003|261026140227099003|261026121527099003|261102123227099003|261028144727099003|261021121427099003|261022105027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	9/PS7fjWG4+PTIZ8zYq+MWYUd+r88rsKaV8lRTif/WzkV0u7I7k3tQB4F8qvUEJjb1/6rMdbXZHoy68BJnqxtRZzW3aogS/hlJdrl7XUsjh8uk/7nwqqtHL3lgqtbTzNBZdQLw+XZmsLGiN/gaaO8TydeJSxDBPYt3DnNmXhCZeD5n0cmjMph+tS2B+29O7Af3R6flB6qBvstpMvKWfh7GrcLkpwXSvisQ5fXG6gHpnBCKV8cFLxPK97G2hSHrKPmBQJoz5vfCK6yJypFt2XJo1Rql+E052HcHTQrWUB7nR6G6r+zFwGyNMF/xO6LWGXD7UdXDx2b88B6e7NN/QXfxH2ypF2DmqtlNtRk7XVGnDajSDJVXyVwAAH+t5mhpZcwC0YhqwKMLH/kyOUGsNW1nxy/SGctXFQEGMpwjhR19Mm7xwMF5Euw8Q3UfRWkasnvFjKCrTp0Z7/tr95Nz8zy0q3hMi14fztt4SCGANsV0jtflTEKzmwu70oCOI/ZTGB3tHFd3agA1Y3oYyMnBYWNJ82LyZPa0qh9s47uLMLi5HWkCrx9y6nDr5SAiqqWbIgLMrxb0gQRHcXdUExoB211NU0vUjea9te7sAHGIZWayIZpNQlACP0zpEk6qwchNm2KT28NmNr+L4250k5dRvZom+XawBXZuxgiMxD9IpbnZ7OsN+yUd0AbY6w+YGqmBTvLC5Cm6vrhwbcZwk4JUhozw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(23010399003)(376014)(36860700016)(1800799024)(6133799003)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(261026140227099003)(261026121527099003)(261102123227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XPtKsOfVagmdKZUtP9jWnNHKKZOdkjAEp3mJNxYJ+n2Q95LgAgx1qphFCu/C6+kJEvg5y1n3vhrz1DlQ/tZ6bqM1WVe6eBaUI+UbH0DN8odiVl2/HwPD1TyUhQDCTYwf2PRJrSI8PmFbfnXdO0PQP9hON351gFvfy94a6lNGklROBvqGiYj0+vwVHb4chbPDE7oTyn73M/Qu1LDxgOnR4Mi7uNVRCCb0my/grQIpyt0pbJjfl904qLb9a/Y4HF9h/0ZgaxcEdkwa//f16iSHnh45xNBoLaRXZNaULNSw2dICLPp05GYKffiMffD8DQ726oueEAmt4vIZtdu4LoAznFdpEL/0kFx71TkXH6v3ejeYvvTDnRbL/SYMz2gU3pm5LwdXDhA2O7rt6kmMBxnZM7upjajg/fFc3DtLvcqH/hL+ZrDY+mBfpYpvbrP8bS45
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 11:13:49.7269
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d2a8ef-2d84-4484-49dd-08df3bf708ac
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008BF.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB115117



On 11/6/26 12:00, Krzysztof Kozlowski wrote:
> On 06/11/2026 11:33, Patrice CHOTARD wrote:
>>
>>
>> On 11/6/26 11:16, Krzysztof Kozlowski wrote:
>>> On Wed, Nov 04, 2026 at 04:20:08PM +0100, Patrice Chotard wrote:
>>>> +      nvmem-layout {
>>>> +        compatible = "fixed-layout";
>>>> +        #address-cells = <1>;
>>>> +        #size-cells = <1>;
>>>> +
>>>> +        /* Data cells */
>>>> +        wakeup_sec: tamp-bkp@0 {
>>>> +            reg = <0x0 0x4>;
>>>> +        };
>>>> +        boot_mode: tamp-bkp@50 {
>>>> +            /*see boot mode selection feature*/
>>>> +            reg = <0x50 0x4>;
>>>
>>> Mixed up indentation. Please also run scripts/dtc/dt-check-style and fix
>>> obvious issues.
>>
>> Hi Krzysztof
>>
>> scripts/dtc/dt-check-style  doesn't return any errors.
> 
> Yes, bindings should adhere to strict mode, see line ~40 in DT
> submitting patches doc. Srtict mode would complain:
> 
> Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml:50:
> example 0 [indent-consistent] indent mismatch (expected depth 3 * '  ')

Ok thanks for pointing this.
As the v5 is already available on mailing list, it will trigger the same remark.
it will be fixed in v6, once you will have reviewed the v5.

Patrice


> 
> 
> Best regards,
> Krzysztof

