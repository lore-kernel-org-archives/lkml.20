Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794454098;
	b=xO35NLg911yBxKq1cMbkyovx+97N/uqNEWKG3odLxbr1sk1neXIcCWhg4CZzyT6T/Tc4
	 /uvH6FEU1pmw1RE8AFfGBLZ0E+o39npDPk16wEfQdOng1AX3mwsqkNiMfdyK7BSgCmUGb
	 N9OYvpJnP808nncv/OsXl0iKTygrkv2fA+TrMZ3uRjCilzFm2Fzc2fRk6QR3tUgUzoPSR
	 dhxAu5caVVJPNVMszuiarVjuB/LL+to90QMEVvBajHkJuZPzX5JSSmyA3i10/fOBx2IkA
	 LoOOad7/DIgpIpwSDAkJc7BEuBeKuzHK72mXKgFUZ6VJhMILkYTQiFOAWuJ9VpF4SgA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794454098;
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
	bh=F5Ihz3M65Lb+pFWR6MLo/LYTrj4WlmHIiABi6ACwTpY=;
	b=i2jyPDpK4PERAppey2R1yMJZduqh3dz6AOQmlL6yLfh5DNUfnOCIuTY7SLUfQYrKdCfU
	 qLqC8vp6sQhs8QRZPdBomtHxpeIytFKADMgq5wEjoyu9qCt/cLbmGcOZFIVyZExgtvpKO
	 PT01gPAGUvNdBBD+j+SaSye0Swrgvzh9U/FrKX446ajrv72ISQALFPFf3ly5rlra+JTmy
	 UppokcFenJ4Za+vpAJcKu8Y0FK56duziA965GWe13xxudUZPZiinSv61/20Edhc0S6gHd
	 XmvW7OF690+vR4YRvXsVBiV8GqjizcuuvkVzqIutbCdSGO1Q26CNBC/O0K9KihRLMEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=kGKDVcza;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.70
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013070.outbound.protection.outlook.com [40.107.201.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF8A606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:28:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFF8A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=kGKDVcza
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GYvL2xia3n4vBceCT5MmgNKvUmgh6lESygGTsUS9AmpSQM0jaRjovB7U2Xt5Cyog7L8jOJr9qQ1QdH30m3LiBPxJKQYNkv7zvjVIFAen0pr5m31NGZ6cyGCmVAqvBZUelH3AtvxAungvHZpRCzlh53IOETWjUqWSDc1rwr+C6An1gCl01FtbshNiNsrZv4lRyaaEQ25XVIht/C0/wtUCqWXJUPQitP0ADYhdNh5Zh9sdzoidFl4IIESMhPqhTG1YU48MajQoqf4BWYkOmMiJgwxwT7QFmaLKegE5aA2h8UnCpsJoVDyq3AGiC/KK7fj1vJniAS2kcNz1GCED8kwLgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5Ihz3M65Lb+pFWR6MLo/LYTrj4WlmHIiABi6ACwTpY=;
 b=Xiy9SRz1uIUge2eOqh3kzyE1+H4FRmbFErpTeNkrDpNou8HgUwyy9c5Gu91p9k9llF5ARV3x+RImVOm+Zq8qkGD+FBPfHOAIF/5fNfkADrzKAyJ/ue5BV0AP5hw3aCfT7Dj21A4zao2Q81L4K0xPoIm2v11rZrlr7z2ibpZR4Ua9r+zEeHasvEnMHA447BqjQx32qxSqYTxPoqOGeOMFpMcL4BpDqQj+/pDig7XXXNECBTR/bfeHwpP5t40mgtoCxpWbOs/D6+5hK6XC8jfIbr3z4TmGqW0Brr136tW4njb3zhHmiiXrgrn5Xzpo1YgOp3u2rJoCb7dzUEg6rf4O2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5Ihz3M65Lb+pFWR6MLo/LYTrj4WlmHIiABi6ACwTpY=;
 b=kGKDVczabGL93Sw9el7tj+nkDekNHTEwpwf3LUPtZUIS5GdcjQPukakgYQz+V1//UXP85bnJdwybS4QSTx3syrUq3c2kRtrRXZxtut0grPSgLFVqaT4U4Ta11n2zEZ4YSfLKEWM9WEPFKTVdemiJte3lUDO8u8dfIcGXHwASg68=
Received: from SJ0PR03CA0264.namprd03.prod.outlook.com (2603:10b6:a03:3a0::29)
 by PH7PR12MB7307.namprd12.prod.outlook.com (2603:10b6:510:20b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 03:28:12 +0000
Received: from SJ1PEPF00002327.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::3f) by SJ0PR03CA0264.outlook.office365.com
 (2603:10b6:a03:3a0::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Thu, 12
 Nov 2026 03:28:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002327.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 12 Nov 2026 03:28:12 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 11 Nov
 2026 21:28:10 -0600
Received: from [10.136.34.22] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 11 Nov 2026 21:28:04 -0600
Message-ID: <5c8f7574-d480-45fe-b658-c705511fde61@amd.com>
Date: Thu, 12 Nov 2026 08:57:58 +0530
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
Subject: Re: [PATCH v2 2/4] sched/idle: Don't handle polling idle as dynticks
 idle
To: Marco Crivellari <marco.crivellari@suse.com>,
	<linux-kernel@vger.kernel.org>
CC: Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	Michal Hocko <mhocko@suse.com>, Aaron Tomlin <atomlin@atomlin.com>, Marcelo
 Tosatti <mtosatti@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Juri
 Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, "Paul E.
 McKenney" <paulmck@kernel.org>, Anna-Maria Behnsen
	<anna-maria@linutronix.de>, Thomas Gleixner <tglx@kernel.org>
References: <20261111114406.346953-1-marco.crivellari@suse.com>
 <20261111114406.346953-3-marco.crivellari@suse.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20261111114406.346953-3-marco.crivellari@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002327:EE_|PH7PR12MB7307:EE_
X-MS-Office365-Filtering-Correlation-Id: 71a7d3e2-dac2-410a-f442-08df406cfb50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|7416014|18002099003|22082099003|11063799006|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	x5IIcp3kz+V9hw0sxa2vv8b8zZSedxODYF3d05+TIF6/BB0ULvuRJN7rparNMtXmlrpRg+O8PVjiL5qEvsbuJnzcvvVD/QodRf9UcuD9smos4WA6WOVXK0cHF04iqbNfPd+BXN3FJWAoUYluHNdEJAea9JXavfz7fYvFxKtxb83xm5VBzs0khhEmcVhbAqP/NLOyp/9C5575uL9UHKW+Zwg/3IZ6Qw9Yx5BZ6hckaOZaq+qk1VZO419YXlz5gZ14vXREuiDRPvOYzs9oH1NSnDbQjfct/cmIPZg2FtgGBq55eHtf7j5QoZGCoT96Ddm7f3+UXLNtq2uib3mMsbahuoMkkeXLH7y+lbheSMP1qPX+jxSX4V8Rb5h9vIUIo0A7xAtvRWnG6fRNeYvDCoZ+XQG0rdwhZC71DYk3Dkp2KiJXRw/uoBozs/XF7blrJxeYSW5CZ00Tt2bB2BSMNJXCAVvSwQb3l4WvPMG0yhej013o5ay+WHnDFrJgMdvG17k2jlA6UvV2IJc0p/3llsXfgEwpARgSlIsbqs+C4sUoZwHwGyJDpvCpewDhFukjXb7tfG63+HVmAVZw8Cl4WfeVuGQrIJ90Ogn2dhxzscxTGUtPx8uRtsUHzrJcGu8i4TmrJFLY0wZYKu4iZOS6qQwRlX3f54lOV3N3CzS/eKev8bDUpqAsN7TdMbUqsffQU2F2Ud/JSuD+jVH+i25HsHhskg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(7416014)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MwJFQAbNnMOafR3F3f+476JLWVQ6DEc5I8OkDrPdMVmK79hN2o57YyQfYytbrD7m3gZuejDdu6JdYOX8BoLL/bEPzpxePyM5yQQcjHibf/LjAiBNaS4fIzwjmzYzzwrE/ky+kpEcBxRld2FcQSeN1+qNAKsG7Y7RySqpnU8M51dX6gixJaGmZyE1N9GlEDwgstergM0Zxx8BYqVaPUJyYJ3tRJU6/HmL9Agxjwm6BxU8bdYRxqK2yQYZQJAb8eqzvCbrcigQg+jxRJOLrfGvdQCKEanRnDc3zKNeAF5fQkNQBUjRHc0xEeNRTUXMuGRDhhuo4UyxO17epmtOuF0ua23DRkljgv0TNH3K4RXO/Er22L4A8G2uaM2Qtoz3AgESKgA69nAn6nijudIyXrpaK+CGWmyt/tkxWyHJAC+sr5dlzdnoghAffKBeS/hZivQo
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 03:28:12.5900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71a7d3e2-dac2-410a-f442-08df406cfb50
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002327.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7307

Hello Marco,

On 11/11/2026 5:13 PM, Marco Crivellari wrote:
>  void tick_nohz_idle_exit(void)
>  {
>         struct tick_sched *ts = this_cpu_ptr(&tick_cpu_sched);
> +       unsigned long flags;
>         ktime_t now;
> 
> -       local_irq_disable();
> +       local_irq_save(flags);

nit.

Use:
	guard(irqsave)();

and you can directly return for below condition. No "flags" or
"out" label needed.

> +
> +       if (!tick_sched_flag_test(ts, TS_FLAG_INIDLE))
> +               goto out;
> 
> -       WARN_ON_ONCE(!tick_sched_flag_test(ts, TS_FLAG_INIDLE));
>         WARN_ON_ONCE(ts->timer_expires_base);
> 
>         tick_sched_flag_clear(ts, TS_FLAG_INIDLE);
-- 
Thanks and Regards,
Prateek

