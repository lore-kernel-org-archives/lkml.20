Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792832869;
	b=GayF8u1x+gZ9fXsjEU6O/fyfTDOO4BeYK5qdgQB0a5KeASsyKfLLL9vuU7q58mISp2zr
	 /32Ln/OQiLW+yCDtz71Zsjus5MCTfUf4QiUvJjetg2OybyulQHR7oCH3gnEVtEwhW5aAf
	 irSAOjngUsa9AWKMSBlXgfc/IJaxgFBTAmBHGoWvnqJa77tfalp6Rz94ymdTlQfeZPAI/
	 H/pU2Fder9jJLcH+uuC9pv3uUOAz63UHyCedpXSQTxtXUgt20ZtUuoBbzLI7Vo2jG+LTr
	 cr2NaWdUjV+d716eaKSHtjNERrub6NRxMP78dzJGgj4XwFI4Mqy9oQk4LT46YhqgAuw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792832869;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=IJoZk1vlOtdrQRmtJjiLIKc3JS4KQ11ob+SMYMvTFxo=;
	b=J8TbNLiyvIvVg6BCE+Llz/yPzQddA59LbAGvOKVExaU2tYobRRHVlo2/dhDI/EoDgmue
	 //gHKBpX5bAp93rqwaApJQvfDhTy85SyXxSyFfwCiGvG0tR/Twwb7Cx3iSJuaQwh7berB
	 8tUjE9B2YY66FCkbY7a9xcvt9WtvSro0/zL5+2j1uo8vrGGoR+Okx76zw1eWxx3wQagmi
	 /L6RGquZajLdQlN3QTw47wTGwAlxmZoIb5rKVXIu1D3lDPBiHU3e0AxeRs3qpMpUSCbXw
	 XSZ+z+0OESxRl85ck+0Nd3cgVus9DYXflG9gLEqQqufNQ3pKpj8HOcdvL3EaoAL2Uxg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Mpeqmz0B;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.14
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011014.outbound.protection.outlook.com [52.101.52.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5492606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 09:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5492606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Mpeqmz0B
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=puLg3lW+JVcHtqtke69OZX2+S4D/UmR2e8+GjRE2PWQcVSTIocTlmD6X9fUU12P6tGD4xgDDyPoH9LGihWXV59V9nE6Ds4bsfFkFYrV49ANHAOV6EbVsvM0KaTSPwhCMBqJsZJVftH0SH9ZWlDCRq2Eb1SNtcGE0kzXQvF+t6zCVKnwNyUhVyxYZj2NmvlqYZsPoN/NuHiZiJb2U9VKWjDxpwSMd4CYc67zu/9AE7CNN1mU7RkQUWVotu/ixDTHqCVnHH0bW/+tDrAVYdkQLjID6GCKmbYTR54Gl/iaDICZ1bNyBCKSJz+srVx1xS/TGsQzeoXXnWm5KjTYqjpYLrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IJoZk1vlOtdrQRmtJjiLIKc3JS4KQ11ob+SMYMvTFxo=;
 b=pjFF1qL9to3Zpih2UDit2VwhAsBi/zx+aRdyLSsqjHtHvuppMgl+ADlVc0/4+BvG8Y8t/Vr6yaJWwwU0MtJ2qmrGdYgAZcLChySALOhRYcV3DBnld2Fbv7we5caq5P9sAeyXNsXRPUl1X89A0MhbGZsdmDMYFLJCgMwZwKK+QWtKHWhY5B5fMT1CxNJt3qZWoQwxB8udclWBLhbKTZm644faaQyBKwMjVR8dSCYsCNVJ0AG0qt8u646nzAgk9kdXZB6ayAV+HETOPKAiRifWJdn7kR7BnbFo5NyZeljOl2WCpFoyUArXChb8hMtTI/Mj9io57UnA4aJdSdDYJTW8eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJoZk1vlOtdrQRmtJjiLIKc3JS4KQ11ob+SMYMvTFxo=;
 b=Mpeqmz0BdIvluwr0e/6I06jl/GAbwmDSjhcK8KT4KjJw3pNhuBWk4D9Sxa4L64me/CnoAaceydKKg9yyBAEqeLzZ/f6GJSz+WrW/wm1fH1sotSZ9QLnpHd0IYPG9nlXiU19jYjFElm5i1DEOFPxJLcH2L0p2QgkVc7ua6MgdfG7Zi/21RZSuP0KBCNJ9/3DFdiPOVI+r0os9RFD8o4rQCwzSxFtMDOT84EOh2irBnGScoGpPHAEBmclSh6jtIitoA8SSwIZwTcSjiINyCzxwb5Ia3o8riYuMBcVo72tTITaWKU9wTzg+nh4rMFStOwwTAI5erN1TBtPEuDUVzIQtJQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL1PR12MB5174.namprd12.prod.outlook.com (2603:10b6:208:31c::19)
 by IA1PR12MB8587.namprd12.prod.outlook.com (2603:10b6:208:450::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Sat, 24 Oct
 2026 09:07:45 +0000
Received: from BL1PR12MB5174.namprd12.prod.outlook.com
 ([fe80::58de:822b:868:96e9]) by BL1PR12MB5174.namprd12.prod.outlook.com
 ([fe80::58de:822b:868:96e9%6]) with mapi id 15.21.0546.017; Sat, 24 Oct 2026
 09:07:39 +0000
Date: Sat, 24 Oct 2026 11:07:31 +0200
From: Andrea Righi <arighi@nvidia.com>
To: John Stultz <jstultz@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Valentin Schneider <valentin.schneider@arm.com>,
	Connor O'Brien <connoro@google.com>, Ingo Molnar <mingo@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Valentin Schneider <vschneid@redhat.com>,
	Suleiman Souhlal <suleiman@google.com>,
	Metin Kaya <Metin.Kaya@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Zimuzo Ezeozue <zezeozue@google.com>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Qais Yousef <qyousef@layalina.io>,
	Xuewen Yan <xuewen.yan94@gmail.com>,
	kuyo chang <kuyo.chang@mediatek.com>, hupu <hupu.gm@gmail.com>,
	Zhan Xusheng <zhanxusheng@xiaomi.com>,
	"zhidao su (Xiaomi)" <soolaugust@gmail.com>,
	Hui Su <sh_def@163.com>,
	"Shubhang Kaushik (Ampere)" <sh@gentwo.org>,
	kernel-team@android.com
Subject: Re: [PATCH v33 7/7] sched/proxy: Add deactivated (sleeping) owner
 handling to find_proxy_task()
Message-ID: <atx1U_0FC-fazkV7@gpd4>
References: <20261023220431.1106611-1-jstultz@google.com>
 <20261023220431.1106611-8-jstultz@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023220431.1106611-8-jstultz@google.com>
X-ClientProxiedBy: ZR0P278CA0021.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::8) To BL1PR12MB5174.namprd12.prod.outlook.com
 (2603:10b6:208:31c::19)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5174:EE_|IA1PR12MB8587:EE_
X-MS-Office365-Filtering-Correlation-Id: c76c122a-fe9c-4175-5780-08df31ae408e
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|261021121427099003|18002099003|22082099003|261021123027099003|261009223027099003|4143699003|5023799004|11063799006|10067099003|261022105027099003|56012099006|261022075727099003;
X-Microsoft-Antispam-Message-Info:
 154Avrv5dcL8ztK4LzmizPogvoPkvEGQIo/+mqin2N12g9VRhMxDzeRfmrGkpiMOYzwnX6mwgWgGItXDjJZNBBi5Zjb5WCpC3bjpVPHSr9sFc0nJgWCg/hC9NPnJ2UlLZmYcd8lmaJ2WtEj10n+c2Koydk3dD+YY4V5oFRsxfbpcY9P1ND/DTRHs5979+GxxuFEU1UCc6CGT618qTPD6jPKbcDjhpgEtE7JmGhXLc5EKjyttIxCPuLWF7fM59b1ByKgU6sYohYfHSGWpF07XvcNawWsPRUiXgX4t+h5iue0TnePdATNtA9w237NUF0d8LIG6s46k88MjEB2mE0dC26DFsxKKgDkWg5vkgbvKH6wAp6RYwodck59oAIJPg3r1gl+m7OVy4ajlK5a1D5dLBh38/dywW74sjfGH0ahSPBuFLIdwxsSbt61TsMfwQb5DCMa/PjHN6/f7aSSpVndRXdyTkRVShx5lH67cKUUbdIBzLBQ+CG5jRmpVrb3nkIuZ36ECBEV28IBZYizc4lSu2T10VeJe+UmckB+vx2IOIcQlocJxI5rVKRSHbVvUnceuzR7HDGEFLu2AUR3GDeXnDnD0pNgPdCXvbMN2UUkPdJXLGLcXbcncfLiKjfWXZH4pY/ctrJyutiT4cYqmXzo9VH7Vw9niOlQtZA7Y0dFkuBo=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5174.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(261021121427099003)(18002099003)(22082099003)(261021123027099003)(261009223027099003)(4143699003)(5023799004)(11063799006)(10067099003)(261022105027099003)(56012099006)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?9ICF5edUbF+TPJqBHOJiijTxMng9pagbtNwJTz3GX2091IHHw/fUmgyOcG4c?=
 =?us-ascii?Q?Oh1K3HHohWu88xhT4o0RteG2MqRms0QvJp4P7b+fCUYWsNc9hPPtQzEaR3uZ?=
 =?us-ascii?Q?Idgh0gLhWn87qqaInZwmG5Ujsky+DA7WwYVCJEPRn2od1yRgabLLDMMTF7te?=
 =?us-ascii?Q?Td+DXEzu2f11MFpJ3UIsqlTimlvxASy+GuhMtSP6VuS1k7VoW+O4aBZJvSaT?=
 =?us-ascii?Q?qS6v1S80ToPOf610cB4WS8G4g829xCuxmnD4dyE/2YLr0naOrjslY+XvsY7w?=
 =?us-ascii?Q?352Q8pWUoIutdjEMQkciWHX0DJw/d2lx5VRh6AbQQDz6iZHejvuXPhub3XAF?=
 =?us-ascii?Q?tqBxsP7je8kMarHEQxkfLmyVLRhCy0lEkxpdqwVidgM7PQhr9WSBhtQIIXyE?=
 =?us-ascii?Q?Si3qMtuy3nyOo4yTvbDRESDBd6kxsH6mVDbirCp9hTIY/slLG+sgK6Smdcvc?=
 =?us-ascii?Q?CuL9dreY90S2OXBESgkvQsNWg/e/YLRPJrp32uHNoRL29MqhaY0BfxZOFgm3?=
 =?us-ascii?Q?II1BlhxJCh8oyZLuEVsfUslIzIxGHOtPxKcwGiF3RMK3uOkQW5FXXkg9qGPw?=
 =?us-ascii?Q?FqVcIgJwVZWZvH38xiXdP/yuaOeXx3JNwEznUFJtXb8rH7TMgSfLjFx+71JH?=
 =?us-ascii?Q?eEmO8st6nlXTeaO5uPSuBX8P9K2M+lMZTHK61kiozu6LctjJoSIQIkhWV+RT?=
 =?us-ascii?Q?ZrExhlOdDNDYv/IbwE1/dJY2VIwhpMI7V4oHr1yG6xXYH0se/BWcKa3YTe6w?=
 =?us-ascii?Q?CUSx44qAFzB1YNPnPNAIUbYujjsDpaEvgdEc9sr7+95xM/pshZ6oeT9to2W1?=
 =?us-ascii?Q?mcjCEfRVlk4fb0NLuG3QmgHEKn/aTrAGCUymJSuI2USFDKGJphoXnsxAR1hM?=
 =?us-ascii?Q?BuUO/5YMjApE2+fj8wPKp3IhJDac3RCUfLp9dyHgPqYKoLrgnrX4gJ5uxTPe?=
 =?us-ascii?Q?QnaZ98m5BZ58pPBSwXtmw28T5kCJE+Aan75IlNSUDWSqpiS5v2o1yzSwmqaX?=
 =?us-ascii?Q?6ubVe/VLLH0sdTUjVPS4u8elIcYb/Z88YsGmUTNEb2TI3mP8ixAXRWz27uF6?=
 =?us-ascii?Q?0SkYntaIBfc1lgcpcXcxBi/hOdYkfcqMloaSXrGU07J1Lu3TF/1m4dvIdVm/?=
 =?us-ascii?Q?5OtFzeGkNW9ElRrC7y/0+VwIzs4YDVd4XBsC3B/PpBdsVn4y/QOEQs/KwTMs?=
 =?us-ascii?Q?cJMI0BCE/969I6FZ4i8Xqsy2W2od+E2gLWBVLYWJWtSPDncIqkHvZAY0leCz?=
 =?us-ascii?Q?cG6JAmueiS16YBQ2RSpoq12YQ2qn42uNZoNKEMHKIgDH+BrmtHNxYMfEUmdr?=
 =?us-ascii?Q?GOdQBe4Z/GNj6Md06F1MpcpV1ooVYLjMWieB+CtC+z7dkbtE3+zSCMsWDY5x?=
 =?us-ascii?Q?vHBbTdka2MrFnP3K94yYNmY1H6TMeUlhFGEmEUvA09kt8G1Rox3sLRMWhiyA?=
 =?us-ascii?Q?xZDF0ZkkD/mDlmyopJDKk1uJPnPePwM47kysC/8kcXOFio5rFnnWQQjkDBxZ?=
 =?us-ascii?Q?y5E5Es2zCKtlDSk70EbZBSZwm4eaafMZx2iAZfUfYV//YREOB/ekUmQQ/F2R?=
 =?us-ascii?Q?aKBGvl4Gn5+PRPM0vLdqYYgqRCZD/jl+nTZ2g3UhwL7Uxg5YSRZyJyUoWLQZ?=
 =?us-ascii?Q?rq1In8aujOEzsJXSdCiWoxNDIO7wS7j+nR62tDn7ydSVGbs1kLv8eqrr56Gc?=
 =?us-ascii?Q?82wDYePGymyFaq/0k98ElmknRtGJQl0rc+g1opo9FhqeR3Dl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c76c122a-fe9c-4175-5780-08df31ae408e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5174.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2026 09:07:39.0462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XP48ksRL7rymsR2gbpbRep1RCzPN0EWsMFS2yOm9ETPCl9ycsC1gLtXrEBlz0iV9mGiQMA6drLdzb97JNIpQYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8587

Hi John and Peter,

On Fri, Oct 23, 2026 at 10:04:18PM +0000, John Stultz wrote:
> From: Peter Zijlstra <peterz@infradead.org>
> 
> If the blocked_on chain resolves to a sleeping owner, deactivate
> the donor task, and enqueue it on the sleeping owner task.
> Then re-activate it later when the owner is woken up.
> 
> NOTE: This has been particularly challenging to get working
> properly, and some of the locking is particularly awkward. I'd
> very much appreciate review and feedback for ways to simplify
> this.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
> Signed-off-by: Valentin Schneider <valentin.schneider@arm.com>
> Signed-off-by: Connor O'Brien <connoro@google.com>
> [jstultz: This was broken out from the larger proxy() patch]
> Signed-off-by: John Stultz <jstultz@google.com>
> ---

...

> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index 12a7e094a3e6b..3fae2f1438583 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -1266,6 +1266,13 @@ struct task_struct {
>  
>  	struct mutex			*blocked_on;	/* lock we're blocked on */
>  	raw_spinlock_t			blocked_lock;
> +#ifdef CONFIG_SCHED_PROXY_EXEC
> +	struct list_head		blocked_head;  /* tasks blocked on this task */
> +	struct list_head		blocked_node;  /* our entry on someone elses blocked_head */
> +	/* Node for list of tasks to process blocked_head list for blocked entitiy activations */

nit: s/entitiy/entity/

> +	struct list_head		blocked_activation_node;
> +	struct task_struct		*sleeping_owner; /* task our blocked_node is enqueued on */
> +#endif
>  
>  	/*
>  	 * The task that is boosting this task; a back link for the current
> diff --git a/include/linux/sched/task.h b/include/linux/sched/task.h
> index 90ed5bc3c7afe..26c19ee980456 100644
> --- a/include/linux/sched/task.h
> +++ b/include/linux/sched/task.h
> @@ -160,6 +160,7 @@ static inline void put_task_struct(struct task_struct *t)
>  }
>  
>  DEFINE_FREE(put_task, struct task_struct *, if (_T) put_task_struct(_T))
> +DEFINE_GUARD(get_task, struct task_struct *, get_task_struct(_T), put_task_struct(_T))
>  
>  static inline void put_task_struct_many(struct task_struct *t, int nr)
>  {
> diff --git a/init/init_task.c b/init/init_task.c
> index ce7c2b07d855d..aed3f7d8a5cc3 100644
> --- a/init/init_task.c
> +++ b/init/init_task.c
> @@ -213,6 +213,12 @@ struct task_struct init_task __aligned(L1_CACHE_BYTES) = {
>  						 &init_task.alloc_lock),
>  #endif
>  	.blocked_donor = NULL,
> +#ifdef CONFIG_SCHED_PROXY_EXEC
> +	.blocked_head = LIST_HEAD_INIT(init_task.blocked_head),
> +	.blocked_node = LIST_HEAD_INIT(init_task.blocked_node),
> +	.blocked_activation_node = LIST_HEAD_INIT(init_task.blocked_activation_node),
> +	.sleeping_owner = NULL,
> +#endif
>  #ifdef CONFIG_RT_MUTEXES
>  	.pi_waiters	= RB_ROOT_CACHED,
>  	.pi_top_task	= NULL,
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 394906afafd30..f87f806c2958b 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -2277,6 +2277,12 @@ __latent_entropy struct task_struct *copy_process(
>  
>  	p->blocked_on = NULL; /* not blocked yet */
>  	p->blocked_donor = NULL; /* nobody is boosting p yet */
> +#ifdef CONFIG_SCHED_PROXY_EXEC
> +	INIT_LIST_HEAD(&p->blocked_head);
> +	INIT_LIST_HEAD(&p->blocked_node);
> +	INIT_LIST_HEAD(&p->blocked_activation_node);
> +	p->sleeping_owner = NULL;
> +#endif
>  
>  #ifdef CONFIG_BCACHE
>  	p->sequential_io	= 0;
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 0cb41a884ea70..be3ce8b554fed 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -2229,7 +2229,7 @@ inline bool dequeue_task(struct rq *rq, struct task_struct *p, int flags)
>  	return p->sched_class->dequeue_task(rq, p, flags);
>  }
>  
> -void activate_task(struct rq *rq, struct task_struct *p, int flags)
> +static inline void __activate_task(struct rq *rq, struct task_struct *p, int flags)
>  {
>  	if (task_on_rq_migrating(p))
>  		flags |= ENQUEUE_MIGRATED;
> @@ -2240,6 +2240,76 @@ void activate_task(struct rq *rq, struct task_struct *p, int flags)
>  	ASSERT_EXCLUSIVE_WRITER(p->on_rq);
>  }
>  
> +#ifdef CONFIG_SCHED_PROXY_EXEC
> +static inline
> +void __proxy_remove_from_sleeping_owner(struct task_struct *owner, struct task_struct *p)
> +{
> +	lockdep_assert_held(&owner->blocked_lock);
> +
> +	BUG_ON(p->sleeping_owner != owner);
> +
> +	list_del_init(&p->blocked_node);
> +	WRITE_ONCE(p->sleeping_owner, NULL);
> +	put_task_struct(owner); // matches get in proxy_enqueue_on_owner
> +}
> +
> +static inline void proxy_remove_from_sleeping_owner(struct task_struct *p)
> +{
> +	struct task_struct *owner;
> +
> +retry:
> +	owner = data_race(READ_ONCE(p->sleeping_owner));
> +	if (!owner)
> +		return;
> +
> +	/*
> +	 * __proxy_remove_from_sleeping_owner() does a
> +	 * put on owner to match the get done in
> +	 * proxy_enqueue_on_owner(). If that put is the
> +	 * last one and it frees owner, we'd be freeing
> +	 * a lock we held. So get/put owner around its
> +	 * usage her to ensure that doesn't happen.

nit: s/usage her/usage here/

> +	 */
> +	scoped_guard(get_task, owner) {
> +		guard(raw_spinlock)(&owner->blocked_lock);
> +
> +		if (owner != READ_ONCE(p->sleeping_owner))
> +			goto retry;
> +		__proxy_remove_from_sleeping_owner(owner, p);
> +	}
> +}
> +
> +void activate_task(struct rq *rq, struct task_struct *p, int en_flags)
> +{
> +	lockdep_assert_rq_held(rq);
> +
> +	if (!sched_proxy_exec()) {
> +		__activate_task(rq, p, en_flags);
> +		return;
> +	}
> +
> +	proxy_remove_from_sleeping_owner(p);
> +	/*
> +	 * By calling __activate_task() with blocked_lock held, we
> +	 * order against the find_proxy_task() blocked_task case
> +	 * such that no more blocked tasks will be enqueued on p
> +	 * once we release p->blocked_lock.
> +	 */
> +	guard(raw_spinlock)(&p->blocked_lock);
> +	WARN_ON(task_cpu(p) != cpu_of(rq));
> +	__activate_task(rq, p, en_flags);
> +}
> +#else
> +static inline void proxy_remove_from_sleeping_owner(struct task_struct *p)
> +{
> +}
> +
> +void activate_task(struct rq *rq, struct task_struct *p, int en_flags)
> +{
> +	__activate_task(rq, p, en_flags);
> +}
> +#endif
> +
>  void deactivate_task(struct rq *rq, struct task_struct *p, int flags)
>  {
>  	WARN_ON_ONCE(flags & DEQUEUE_SLEEP);
> @@ -3815,6 +3885,184 @@ static inline void proxy_reset_donor(struct rq *rq)
>  	resched_curr(rq);
>  }
>  
> +static inline void proxy_set_task_cpu(struct task_struct *p, int cpu)
> +{
> +	unsigned int wake_cpu;
> +
> +	/*
> +	 * Since we are enqueuing a blocked task on a cpu it may
> +	 * not be able to run on, preserve wake_cpu when we
> +	 * __set_task_cpu so we can return the task to where it
> +	 * was previously runnable.
> +	 */
> +	wake_cpu = p->wake_cpu;
> +	__set_task_cpu(p, cpu);
> +	p->wake_cpu = wake_cpu;
> +}
> +
> +static void do_activate_blocked_waiter(struct rq *target_rq, struct task_struct *p, int en_flags)
> +{
> +	struct rq_flags rf;
> +	int target_cpu = cpu_of(target_rq);
> +
> +	scoped_guard (raw_spinlock_irqsave, &p->pi_lock) {
> +		/* If task is no longer blocked, don't activate */
> +		if (!p->is_blocked)
> +			return;
> +
> +		/* Avoid racing with ttwu */
> +		if (READ_ONCE(p->__state) == TASK_WAKING)
> +			return;
> +
> +		if (READ_ONCE(p->on_rq)) {
> +			/*
> +			 * We raced with a non mutex handoff activation of p.
> +			 * That activation will also take care of activating
> +			 * all of the tasks after p in the blocked_head list,
> +			 * so we're done here.
> +			 */
> +			return;
> +		}

Is a racing activation the only possible case here? When
proxy_enqueue_on_owner() calls block_task() on a fair task that isn't
eligible, DELAY_DEQUEUE keeps it on_rq with se.sched_delayed set. In
that case p simply won't donate until it's woken by the mutex, so
nothing nasty shoudl happen, but maybe it's worth updating the comment
to describe this case as well?

> +		if (task_on_cpu(task_rq(p), p)) {
> +			/*
> +			 * Its possible this activation is very late, and
> +			 * we already were woken up and are running on a
> +			 * different cpu. If that task blocked, it could be
> +			 * dequeued (so on_rq == 0), but still on_cpu.
> +			 * Bail in this case, as we definitely don't want to
> +			 * activate a task when its on_cpu elsewhere.
> +			 */
> +			return;
> +		}
> +
> +		scoped_guard (raw_spinlock, &p->blocked_lock) {
> +			/*
> +			 * Again, if activation is delayed, it's possible the
> +			 * task has been woken and is no longer blocked_on,
> +			 * but went back to sleep, so double check blocked_on
> +			 * before activating onto the owner's rq
> +			 */
> +			if (!task_is_blocked(p))
> +				return;
> +		}
> +
> +		/*
> +		 * Have to make sure we handle nr_iowait adjustment before
> +		 * we call proxy_set_task_cpu() to ensure we are adjusting
> +		 * the same runqueue we left (where block_task()
> +		 * incremented nr_iowait).
> +		 */
> +		if (p->in_iowait) {
> +			delayacct_blkio_end(p);
> +			atomic_dec(&task_rq(p)->nr_iowait);
> +		}
> +
> +		if (task_cpu(p) != target_cpu) {
> +			en_flags |= ENQUEUE_MIGRATED;
> +			psi_ttwu_dequeue(p);
> +			proxy_set_task_cpu(p, target_cpu);
> +		}

Can this break SCHED_DEADLINE bw accounting?

p is sleeping here (not TASK_WAKING, not TASK_ON_RQ_MIGRATING), so
__set_task_cpu() skips migrate_task_rq_dl(): the old rq never does
sub_rq_bw(), while ENQUEUE_MIGRATED makes the new rq do add_rq_bw(), so
this_bw is leaked on the old rq. And if p is still dl_non_contending,
task_contending() on the new rq just cancels the inactive timer, leaving
running_bw on the old rq forever and making it underflow on the new rq
the next time p blocks.

set_task_cpu() doesn't help, because migrate_task_rq_dl() bails out
unless TASK_WAKING, so I'm not sure how to fix this case...

> +		rq_lock_irqsave(target_rq, &rf);
> +		/*
> +		 * proxy_enqueue_on_owner() called block_task() which
> +		 * increments nr_uninterruptible, so we need to reverse
> +		 * that when we activate the blocked waiter
> +		 */
> +		if (p->sched_contributes_to_load)
> +			target_rq->nr_uninterruptible--;
> +		update_rq_clock(target_rq);
> +		activate_task(target_rq, p, en_flags);
> +		resched_curr(target_rq);
> +		rq_unlock_irqrestore(target_rq, &rf);
> +	}
> +}
> +
> +static void activate_blocked_waiters(struct rq *target_rq,
> +				     struct task_struct *owner,
> +				     int wake_flags)
> +{
> +	struct list_head bal_head;
> +	unsigned long flags;
> +	int en_flags = ENQUEUE_WAKEUP | ENQUEUE_NOCLOCK;
> +
> +	if (!sched_proxy_exec())
> +		return;
> +
> +	/*
> +	 * A whole bunch of waiting donor tasks back this blocked
> +	 * lock owner task, wake them all up to give this task its
> +	 * 'fair' share.
> +	 *
> +	 * This is a little unique here and the locking is messy.
> +	 * At this point we only hold the blocked_lock, so the
> +	 * owner task may be able to run and do all sorts of
> +	 * things while we are processing the blocked_head list,
> +	 * including going back to sleep, which can cause tasks
> +	 * to be added to the owners->blocked_head while we are
> +	 * processing it!
> +	 * Thus, we pull the entire list off the owner->blocked_head
> +	 * here so that we will only process a finite amount of
> +	 * tasks. Tasks added after this will be processed by the
> +	 * future wake events.
> +	 * Even though we have pulled the list off the blocked_head
> +	 * the removed list is *still* "owned" and serialized by
> +	 * the owner->blocked_lock! As we have to serialize against
> +	 * mid-chain wakeups, who may try to remove themselves from
> +	 * the list.
> +	 */
> +	raw_spin_lock_irqsave(&owner->blocked_lock, flags);
> +	if (!list_empty(&owner->blocked_activation_node)) {
> +		raw_spin_unlock_irqrestore(&owner->blocked_lock, flags);
> +		return;
> +	}
> +
> +	if (list_empty(&owner->blocked_head)) {
> +		raw_spin_unlock_irqrestore(&owner->blocked_lock, flags);
> +		return;
> +	}
> +
> +	get_task_struct(owner);
> +	INIT_LIST_HEAD(&bal_head);
> +	list_add_tail(&owner->blocked_activation_node, &bal_head);
> +	raw_spin_unlock_irqrestore(&owner->blocked_lock, flags);
> +
> +	while (!list_empty(&bal_head)) {
> +		struct list_head tmp_head;
> +
> +		INIT_LIST_HEAD(&tmp_head);
> +		owner = list_first_entry(&bal_head, struct task_struct, blocked_activation_node);
> +
> +		raw_spin_lock_irqsave(&owner->blocked_lock, flags);
> +		list_replace_init(&owner->blocked_head, &tmp_head);
> +		list_del_init(&owner->blocked_activation_node);
> +		while (!list_empty(&tmp_head)) {
> +			struct task_struct *p;
> +
> +			p = list_first_entry(&tmp_head,
> +					     struct task_struct,
> +					     blocked_node);
> +			WARN_ON(p == owner);
> +			__proxy_remove_from_sleeping_owner(owner, p);
> +			raw_spin_unlock_irqrestore(&owner->blocked_lock, flags);
> +
> +			do_activate_blocked_waiter(target_rq, p, en_flags);
> +
> +			raw_spin_lock_irqsave(&p->blocked_lock, flags);
> +			if (list_empty(&p->blocked_activation_node)) {
> +				get_task_struct(p);
> +				list_add_tail(&p->blocked_activation_node, &bal_head);
> +			}
> +			raw_spin_unlock_irqrestore(&p->blocked_lock, flags);
> +
> +			raw_spin_lock_irqsave(&owner->blocked_lock, flags);
> +		}
> +		raw_spin_unlock_irqrestore(&owner->blocked_lock, flags);
> +		put_task_struct(owner); // put matches get prior to adding to local bal_head
> +	}
> +}
> +
> +static inline struct task_struct *proxy_resched_idle(struct rq *rq);
> +
>  /*
>   * Checks to see if task p has been proxy-migrated to another rq
>   * and needs to be returned. If so, we deactivate the task here
> @@ -3872,6 +4120,10 @@ static inline bool proxy_needs_return(struct rq *rq, struct task_struct *p)
>  {
>  	return false;
>  }
> +
> +static inline void activate_blocked_waiters(struct rq *target_rq,
> +					    struct task_struct *owner,
> +					    int wake_flags) {}
>  #endif /* CONFIG_SCHED_PROXY_EXEC */
>  
>  static void
> @@ -3945,8 +4197,10 @@ static int ttwu_runnable(struct task_struct *p, int wake_flags)
>  
>  	update_rq_clock(rq);
>  	if (p->is_blocked) {
> -		if (p->se.sched_delayed)
> +		if (p->se.sched_delayed) {
> +			proxy_remove_from_sleeping_owner(p);
>  			enqueue_task(rq, p, ENQUEUE_NOCLOCK | ENQUEUE_DELAYED);
> +		}
>  		if (proxy_needs_return(rq, p))
>  			return 0;
>  	}
> @@ -3975,13 +4229,15 @@ void sched_ttwu_pending(void *arg)
>  	update_rq_clock(rq);
>  
>  	llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
> +		int wake_flags;
>  		if (WARN_ON_ONCE(p->on_cpu))
>  			smp_cond_load_acquire(&p->on_cpu, !VAL);
>  
>  		if (WARN_ON_ONCE(task_cpu(p) != cpu_of(rq)))
>  			set_task_cpu(p, cpu_of(rq));
>  
> -		ttwu_do_activate(rq, p, p->sched_remote_wakeup ? WF_MIGRATED : 0, &rf);
> +		wake_flags = p->sched_remote_wakeup ? WF_MIGRATED : 0;
> +		ttwu_do_activate(rq, p, wake_flags, &rf);
>  	}
>  
>  	/*
> @@ -4488,6 +4744,7 @@ int try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
>  		ttwu_queue(p, cpu, wake_flags);
>  	}
>  out:
> +	activate_blocked_waiters(cpu_rq(task_cpu(p)), p, wake_flags);

We can get here also when ttwu_state_match() fails, e.g., a signal sent
to an owner sleeping in TASK_UNINTERRUPTIBLE. In that case the owner
never goes through select_task_rq() and task_cpu(owner) is the CPU where
it last slept, which may have gone offline in the meantime (hotplug
only migrates queued tasks I think).

Should this be done only if (success)?

Thanks,
-Andrea
