Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793158820;
	b=3MDknYpDcZvGWtxCovceg1u6bGBT86ijO0Ei6NAOCm4XiA/DTj8QGp/QvueUwNP5b4TP
	 82BorE/XjOuzcO1zXSAzaFhCF+m85ByVF0m3AZihzQvxdKMfFn31R1hahJMSm3miItCc8
	 TuzlNK1nTHgM5TuLpBfK6vrm2D12YKXMefag6CLDaRVzSsDEqIRbl2PoUY733+DIb5JJJ
	 7DpLX/KlueTQ8rcdxePBiN2MxE+p0b4hPhx4G92mJBlZrcT0Ah9TtTc8pTrFWyYi6fJr1
	 tyUT68oxN+8a3BFflBAZ+GdWJmWkbBuolZfbOR2gNUDo/ub9xGQF+3LZJYBRhNIVOmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158820;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=QebEkyEToL0ew7yEqvaX2rH08qey3HbeP2EabghiPEw=;
	b=A/0L/gQHbWEdHZTnL0Td+OS+Is5UVGc0XOFs5+NtivKgPOZfUoE8BAyyOfNYS04zuaFM
	 JZ2dYuqAiIR6LroRcVFZj64V7KZn5gBPjixCjeUfb3UHCr+sLtjWHJUYjOkOYvYqokZF/
	 Q+fxAm4xWTcXPd0saosmT6jIh2DnelOEmu2D+TPAXFFXZTgbEklU7By9epOjDdk37BVKP
	 unsR0u9h3tsTlEiVyMahNqpFkyDYVrE24I5LZBgb9hXOmQTtHpFVULJ6sPWf41JNIFdNU
	 MBYZG0EEbbQzLM9lMooptfxRVAie/yxTnnoLtrpI5sVz8klaLQj1WrKkah78JJSPUDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ynr58AZ+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.17
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010017.outbound.protection.outlook.com [52.101.61.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399D8606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 399D8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ynr58AZ+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sntFmaQ+pbU40YGzeNSm45J7lBvhCqhwNi4vQTK4WEPLdZUm6llTHLrzq/OTTJqNynfqqhmsz1696kWf2WVVQ4Yp+qL94oHdiVV+11/J5jaPLB7WMISvr7NtIcWljpxmbQwd1j/zH83ZqgyNWSNM0USHBQQq4rQsdypk97jb5papsrJY2DivsXQ5loLpzKK8EfPWUHERaEtC0n/sChWc9ssBLaDF03eBFUiC3zDvTFVYA9KgBZbCYTUc1H2ztBdrQ/sOvNa7nUvHCEMYg36tLG3wbi6WqtnkDVXIgHlPvrg9bY1uuYFAd3QrvrWAJeZdc6SGHfPa2455Bs8B0rG8pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QebEkyEToL0ew7yEqvaX2rH08qey3HbeP2EabghiPEw=;
 b=JFF4tKgEURvnRF0AcedDTpx9oxaBlwFLz2Cy5qx6M70qP+Kin6gvfI1CAAYay/tUm0arutnqK2pQ8sIvB/HthUYMW8ZRmlFIH00QisUJo7ZZXm4KIWwrMlSTRAhrn4FtsLr0batAEmlyAZYmB3v7Y9teZWWTpntft6VlFTocuAKNXbEwPx8WXY7EkhI9fgQAWpZBrr9MqwuHVsAH1naXDySMMe2aOo7LkmCYLRbOhyo/frSBpyg/m9lmXCaT7KoBTKlojQwWKW9rwzGBsgGkZiRHnq7dpUoCeimx43e/J0yUP29ZXhBSftHaZHw+1tlohJict5KWOQ28FEqtOL4gpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QebEkyEToL0ew7yEqvaX2rH08qey3HbeP2EabghiPEw=;
 b=ynr58AZ+HlzMgmcD96p60YC+uGA/5l7ZWM4+MfYVVtz49zmQWHkw5flosIiwzAJHtjb9PuorlPLVZ2aghCuuJJC+wdgsuFMQ6MLA69akvhWR91EWU6tCpnSnrH3ciM3Au1yOarVPESJg+cpdQ7s+LKT5OHF5wYm5NnQGowb9msM=
Received: from DS7P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:1ca::9) by
 IA1PR12MB6065.namprd12.prod.outlook.com (2603:10b6:208:3ef::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.21; Wed, 28 Oct 2026 03:40:05 +0000
Received: from CY7PEPF000000F0.namprd05.prod.outlook.com
 (2603:10b6:8:1ca:cafe::41) by DS7P220CA0012.outlook.office365.com
 (2603:10b6:8:1ca::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Wed,
 28 Oct 2026 03:40:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY7PEPF000000F0.mail.protection.outlook.com (10.167.247.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Wed, 28 Oct 2026 03:40:04 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 27 Oct
 2026 22:40:04 -0500
Received: from [10.85.38.248] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 27 Oct 2026 22:40:01 -0500
Message-ID: <0d9bce4b-0d50-46df-b865-76511b2670f6@amd.com>
Date: Wed, 28 Oct 2026 09:10:00 +0530
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
Subject: Re: [PATCH] sched/stats: Fix run_delay over-count for proxy-migrated
 blocked donors
To: Kayra Cizmeci <kayracizmeci@gmail.com>, Peter Zijlstra
	<peterz@infradead.org>
CC: <albin_yang@163.com>, <albinwyang@tencent.com>, <bsegall@google.com>,
	<chen.yu@linux.dev>, <dietmar.eggemann@arm.com>, <juri.lelli@redhat.com>,
	<linux-kernel@vger.kernel.org>, <mgorman@suse.de>, <mingo@redhat.com>,
	<rostedt@goodmis.org>, <vincent.guittot@linaro.org>, <vschneid@redhat.com>
References: <72a6eb77-0461-477b-a0e9-c06a486e3e0e@amd.com>
 <20261026133831.4111227-1-albin_yang@163.com>
 <36f12b2f-9fc8-46e9-8312-536c918722f1@amd.com>
 <auA7AQ_S9iwPHr4d@scheduler.schedules>
 <4ac4564e-08fb-4639-a89e-a2ad54cee3f7@amd.com>
 <auBEeDRRFKZOGlZA@scheduler.schedules>
 <f23a6e77-58ef-46bc-b8bf-d9f043bcfa57@amd.com>
 <20261027120945.GN2668564@noisy.programming.kicks-ass.net>
 <auCU65gKjdeUOoLl@scheduler.schedules>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <auCU65gKjdeUOoLl@scheduler.schedules>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY7PEPF000000F0:EE_|IA1PR12MB6065:EE_
X-MS-Office365-Filtering-Correlation-Id: ac10ea0a-9055-45f3-7874-08df34a5279e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700016|23010399003|10067099003|261026140227099003|4143699003|11063799006|261022105027099003|261021121427099003|56012099006|18002099003|261026121527099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ROqhzvFpF0tV+40m4LEbJL5Ao03B/2BvqN7zhp21N2O3KlIvRadcckPMVUuI6y0lar0Mq2P41PmOeV8JaTBboqFKmqjF56rd7Mx7/keQQmqARtSnYwDYbaLjhUV5Hct/L4AqchF3Tl4Hpm7ZE8lysWeP051Nkt3tTGgavZLQOBJjBnK2klkyuKSy6ALzIzYW80rJxQ53IhEWd0nkze6g+aqReNDxskCE6TJON2bA+Twy2K+A7bUA/bk+aIKeAa6sn8MgCine/paFKBzN61PAsY2vFPJQ32qnDuabIsmjTRnC01zqEIuTOLzh8F54Fz2L7Bu0joqOcP1/qID/U6uvVQqyIXH7aelqwGf5v27YABqQv+K2SFdM2AT/SnEol0XqKkoNAAxBp3IeKQYj4EvfeywP9pXYvNKyZkG3hKykkuUmz+6QMYi1GRyT2EbYP71WmnJroqiD380ufD0g97bxXDw5dA+IK3qINJjMrlYhr/WPC9JpkkHqjCLdLFmpu7tG+IFi5UFSZyue2tZKG7QO7m9HFAIvp76Fu091SzvbblkAWPwwLdyj2img8WWwNE+TT2+UuIO2Fx30IN8vW98K13OLFfoCqZoZZ4yfDvF4ZixH+oYyiKwaXrSVeRezelNy6rt/yo2PsZa4o2qQW5+mo22trq+0Hsj9v1yravEgk6LhROo4v8891VsBZsJPu1sxtjiB9rpa/IUZ/Ur60i2h6g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700016)(23010399003)(10067099003)(261026140227099003)(4143699003)(11063799006)(261022105027099003)(261021121427099003)(56012099006)(18002099003)(261026121527099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1aLqKx7z3oDUOgAqMKdHNe81udIytn4XumGFZdZaw+an6efCL/58kvnIzb1tQmgBiA0b23bQ0YymkksGq9d5UQBIVRGt7X2Y8X7v0bZPStdwSvy89Aj4FB2GT0Gw5jr9xrJBUR0+CgAkYUSx0Mot7ZVS1p60af7pK5M3UwC74CH4dMaG0wO/nfpeS7ZbjLYgyPFOf7IEgxIpaUPBfrOjYS7Hd/wK8vVgeK65FGl9BYRuEPAgGo1jbqne4j0agN5GGLbOdYAj30kesDa6m0S1KZapgIlVx+IjwC6OmY6+z7d6feCKcrHrIfUy71er1JtEdetBHDW3QYP4GRzMU7WumUes+mlrUoPc40z7a1/inPZsHItRmZzwd1f0wyw7hOdD+S5v0/dqQBOfBB/cBOxL1pzVH4meRdMjZo2CWJ//foWW7mt7kXgRsBpv8dui9JWB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 03:40:04.8003
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac10ea0a-9055-45f3-7874-08df34a5279e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY7PEPF000000F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6065

On 10/27/2026 5:43 PM, Kayra Cizmeci wrote:
>>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>>> index 04b62c16fa8c..d5758b78b741 100644
>>> --- a/kernel/sched/core.c
>>> +++ b/kernel/sched/core.c
>>> @@ -3956,6 +3956,8 @@ static int ttwu_runnable(struct task_struct *p, int wake_flags)
>>>  		 * it should preempt the task that is current now.
>>>  		 */
>>>  		wakeup_preempt(rq, p, wake_flags | WF_TTWU_RQ);
>>> +		/* Start accounting wait time. */
>>> +		sched_info_enqueue(rq, p);
>>>  	}
>>>  	ttwu_do_wakeup(p);
>>>  	return 1;
>>
>> So the normal wakeup path goes through enqueue_task() which gets the
>> sched_info_enqueue() callback there. But yes, ttwu_runnable() does not
>> go through that, and needs this additional call.
>>
>> There is one more site in ttwu() that also doesn't go through
>> enqueue_task() and that is the p==current thing at the top.
> 
> The counter already measures how much time a task waits for CPU,
> curr is already is at the CPU so we don't need a call from there.
> 
> Or not?

Yup! on_cpu / task_current() gets dealt at sched_info_switch()
which will enqueue the signal if the task is preempted.

-- 
Thanks and Regards,
Prateek

