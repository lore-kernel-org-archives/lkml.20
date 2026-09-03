Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021132.outbound.protection.outlook.com [52.101.95.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A9C509EEC;
	Thu,  3 Sep 2026 19:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788464521; cv=fail; b=ruURRxJH3vumvzldW/MbiR8t3dIdN7PbJ65J6o8KL0YF0t+1CbPqqqtO897+R+vqnWNfILyCnKB0U5MPuRt4xjR0SUMFep3+P0MKlAdexVqn5pLxWGBMoNS+AJhZfc6nAP9JJ3yZVztLRiv3VVXpBp10zRuApNpETSckrtE5lS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788464521; c=relaxed/simple;
	bh=ezFZDn+nK4eT6xnu4pbaxxWnX6V0BhOXHsCclREqiRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f1jRA61G/cylXUD38VhieVuOSSDiyHpQlCH7kJ74V8BkAb9Lk2MNZUQBFXBcJEhmD5rcCU3FftHmqPkUXYYbC+n4JiOjSsUPZuhaZ1Ru89YYHjjlWEff8hGSuriwebrABXK5euCX0xphgctmKypP1jeBnHa/YNl8LDzsREpgDD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.95.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSKal+S/UE/YmVGrhXkvmP0QOTIuUjr/nOAtHwPTjKs2cVT2zPkZshyymvUCNWsqwpgh22bbfFc0nJqMzq/S2QmQJBY+kFrVvMSczayo8gHCcKea7G53Abw86r8fr16w7UO88Onm1McsaK5mZTj4H3OUTlNJE1n7ZmOH7fKf3lgtpveeE3Dvhs1WbeO3G2oXQbXKE2iMss9Hnvsv5nUipBNaJ8vg1qkmG+62MgNWgdZAB1Wh3TkPvS+VxgOa4xMPmvIzBBoju2e41IIl+e8Mv2AD/qZXkTb3aCL2qXSio9qRR3XuMYT44gmE1naIzBjin1CJjCNB6MEFFs1HxE5VlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=1nHxhrK5XASI/i8SjDEdO/bffHrIEYRR+FQg8rh1rpg=;
 b=sOE7h1OQuHQEQLAb0zp4YAHaw588CjqbEF0khePKY63lAukQfVqHgfIug0kCbFhl77QNluq6E0ziBP19MLELcVFlhbCRvodorNl32T4lg1ROd06cR9qkiOij5MGgd/leGLpazIa8Jt3SG7chPGG/VEOQ7cVhggZONGb6ckEHCvzSzs3JPMNKHP9c0cDDTC0Lw+6C6GBgwG5135QV9db7Ps89cfA38birAEjGeeGXLpE8EEg+XarGFa6LRZWGe+e4rax48mVaYS9belUAxZ+5KTkEZ/xXx3I+p8Wjx+t97RB6esMY5nmtgZdTfxXzrb5i32EdlMahN/vMjCCtfHhDjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LNXP123MB3609.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:130::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Thu, 3 Sep 2026
 19:41:38 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 19:41:38 +0000
From: Aaron Tomlin <atomlin@atomlin.com>
To: tony.luck@intel.com,
	bp@alien8.de,
	tglx@kernel.org,
	mingo@redhat.com,
	dave.hansen@linux.intel.com
Cc: x86@kernel.org,
	hpa@zytor.com,
	frederic@kernel.org,
	marco.crivellari@suse.com,
	neelx@suse.com,
	sean@ashe.io,
	chjohnst@gmail.com,
	mproche@gmail.com,
	nick.lange@gmail.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/3] x86/mce: Do not reinitialise mce_timer structure on CPU restart
Date: Thu,  3 Sep 2026 15:41:28 -0400
Message-ID: <20260903194130.186096-2-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903194130.186096-1-atomlin@atomlin.com>
References: <20260903194130.186096-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0191.namprd13.prod.outlook.com
 (2603:10b6:208:2be::16) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LNXP123MB3609:EE_
X-MS-Office365-Filtering-Correlation-Id: 0189f0f9-e906-4602-8000-08df09f35ebb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|7416014|1800799024|56012099006|10067099003|3023799007|18002099003|22082099003|5023799004|6133799003;
X-Microsoft-Antispam-Message-Info:
	kJzXneWQ2Te76fIIH1A0XK3Qh4ykzRvG98ME0T8VBp1T8yhrZreXUGxTF+WdxH9AJuqykS4YGVajJofIH4zXxIHJQ5ERRq6sXtTbXVmjuRKWkrLNaVneTfF4g+iKmQrJbFHD7+St30UWa0ti9WiulFebfJ0LbYtEVTMyvMMV21PA+t0zQH/CNMNtaaC3flYMPc0Ujoeh0sy5o2DS98zf4M7BN1l9X3wgpcdRJWd3KgDatNHM2E8wr41KOtV4Xl7IoG0qlIVPD129fOEVvxN87B7VYiJlnAL3zkQ+HmShd09HnMHO22v/TXs7c2XR8Z58VQTTvo7x4sUP5rqbVlXRqTvQIisNcS/GEa4AH65kmEBgE9xdxuqshkaX7EEfK86ToLHhx7En24dRcAyuMZNAEmT2CxRshm8ug1WyNJabmeAYcxDUlTCUo7SSb+Pq9E0zAY1ylqzP982DDq3tsk/WyJVF98K0efSTGGDNnbf2xQHvV4nZYbY5UdcuY0mo3mfjygQ2Oo47QfC02/dsZPDyYBcIeEvlahjsm0ziW24sRTQqkNUd0Wme0YG4tc7+X1rIJ7BAvelJwjXD4OxoKrDvHjERP/JihfvIq8Wk4tylCf2rLA433VEAOOqcV8NbkD6AjCZBz96FP7bsig1iDiNq/zRkOotPg/DXZ4mL60wu5Tc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(7416014)(1800799024)(56012099006)(10067099003)(3023799007)(18002099003)(22082099003)(5023799004)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qFCIyoLba9xYFiHc/BYNtEskMkwZ7PLwz7MwkPfx8ZlfMEpRx6ynEyJTsM17?=
 =?us-ascii?Q?PaGpV24KbOkB/Ikb3maez3mykhS6HoRUSirr0wExQcF9mXA3tIVmk0eBb7FG?=
 =?us-ascii?Q?DQWgaaeWFff/pTvCKsBH5gnkaEdnVnndPk5wPLS1WUcV8//GeNTagr4GAq2n?=
 =?us-ascii?Q?v/uv7N4ElVCDgIpokJZdQ+DtKbcPIfNRbYWBBhq4glkULEwfnorvxFPGks9n?=
 =?us-ascii?Q?7q5jpd2pcXpk9RXrAcbuXpbG6zwWhvlLpmoS/tbcPzRHxnRpVDy92oICKbwM?=
 =?us-ascii?Q?MpnBpumKjDCQTA1NeTJJ7HFrLACP+yhF9O/S0tqpAo9dLw7wbZjdp8daXToE?=
 =?us-ascii?Q?Y85prIYco5Dl/8QgW4eFOeF9u+1Dr1GRS37Jd2nQDjFmCNz+aylAQv+ZDr2l?=
 =?us-ascii?Q?ijdNsgQcWe7DRosbJ9FAeiS5lcN1eyRorXIcGa5NXRSFIeQ6OoRaRRAowTwT?=
 =?us-ascii?Q?cs9wFpGnvNa/zVtl8Yxc1FrxKiKgWgSQ8cLM1DX0K9FTtAq7BYfegB4OYT3C?=
 =?us-ascii?Q?4QW+8+tiXwoMkaw0hlh6j+F4ZzTrorKGAGAcFNfB9R9mSGg1+++5CCMLa6yM?=
 =?us-ascii?Q?4YZmmMFVpPUh6C+QAQrA6j0V81RHowKhCoyrn5YylkCr+wtmlZy7znvhpc2l?=
 =?us-ascii?Q?fkQKGgHQ0O4oHrZCFBnLimUBULgJlvEu6vYFtg0waMx6U983+XNq51l0Uc2d?=
 =?us-ascii?Q?HRjV7E95xHId6qvTB7Y6d7bxEeEMePsvS4SfKT/+5HLsbrLqu6YdcnrW7Vwl?=
 =?us-ascii?Q?jBtVvcKRtK30wjSs8Rmw5TopeXvfL7jC3t2q/lMg/rF2bBOhtRGJ8sfI77zA?=
 =?us-ascii?Q?2djxxz5mhMENOgYVtZlCXHnPT9+PvplzP0Jm7wAnss2Sk/oHWDJPXGUtSM3N?=
 =?us-ascii?Q?fDDpUTGuQ/Nj6zNg2PRlj5fI84TLPGHmTL5JwVosqxKxvH5W+mf+xtI6tvt/?=
 =?us-ascii?Q?ohEnEqPx1isFliALjOAOtGkItHe94dRvKVNzXkGZqXXqzWUPwPIY7rfUYTiL?=
 =?us-ascii?Q?UHI9Pqdk+rGF7/+b+zmahs9kcuCoUKWnEWMxGGwAiD1F+fUjjzmVKlSm/xxK?=
 =?us-ascii?Q?WskqySB4FPhbj8gCuKbkqvN58FUrPHCz17nj5o3jRnR3DI/opm3nps8e9uMl?=
 =?us-ascii?Q?jAfUlNRvrvHTY0O4owTCevr4IzGmxgEbcFBCqoUtsrh0kfMln9IbheSYo9ak?=
 =?us-ascii?Q?Z5huMnWPpyJ4ypUzgCgpE4vamJ+lwcvD3idCX7yKlzqLwtY1uZdv8XJ2pB/f?=
 =?us-ascii?Q?xMiJE5qhLRxt8wZxvmcvqVBDSdFux6fw7ibo+6tCmZZUhg5zdz8iMQTkbu84?=
 =?us-ascii?Q?3hks7Ts48qONF5OIsqfJBnQtQ9hngxnJrDwwvi8ZRHXA7vMHGdx74hWHg11j?=
 =?us-ascii?Q?iF7lsjcpgvh3EkMx6E73wWT/tnCGZCbHfPVAZ8zfYJ3i5FyVXvuI8BajadNt?=
 =?us-ascii?Q?BA7UkDSgJxpCoiTtfau/CToZ4Zr7X0mOcNP36IQ27vNDfiXYTpwCldXfp6Sf?=
 =?us-ascii?Q?JOYmKR2iiXjQ/HoD1ZBshsTYJlw42u59BqHKU4c/oJPKdIJnkggbm/K4Z6bi?=
 =?us-ascii?Q?wpxtmr6bdWCZudT7fLu6NOw5gECdkUdmthWIcIp0fnB1V2e6N1bBmWNWWAyi?=
 =?us-ascii?Q?PA96avcpIFo+Ms2Dw+ZnJ80C4hcOfBYPOfDc7vt+KyVkzTpUemCj2bcH1mCO?=
 =?us-ascii?Q?R7kGiY7d98soWQAtMwLri4E0JRvS98UGjoyJTtXHJvbTE1lbI0//wihum4Wj?=
 =?us-ascii?Q?UHu150Ij5A=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0189f0f9-e906-4602-8000-08df09f35ebb
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 19:41:38.2237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LZL5YcN7kdeA3WPkxHgZV8qv35j6dcmBSQmlXX+MAXgXITlTnW99f0dMyaudZ58rz9sveobjdzM1vzT7DjcjXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LNXP123MB3609

During early CPU initialisation, mcheck_cpu_init() invokes
__mcheck_cpu_setup_timer(), which initialises the per-CPU mce_timer
descriptor via timer_setup(t, mce_timer_fn, TIMER_PINNED).

However, __mcheck_cpu_init_timer() is also called at runtime during
sysfs reconfiguration (via mce_cpu_restart() and mce_enable_ce()),
redundantly re-initialising mce_timer with timer_setup().

This introduces a race condition against asynchronous CMCI interrupts.
When mce_restart() runs, it invokes mce_timer_delete_all() before
broadcasting an IPI to execute mce_cpu_restart() on all CPUs. If a
hardware CMCI interrupt fires on another CPU before the IPI is serviced,
the CMCI handler triggers storm tracking and arms mce_timer via
mce_timer_kick(true), enqueuing it in the active timer wheel.

When mce_cpu_restart() runs subsequently in IPI context,
__mcheck_cpu_init_timer() calls timer_setup(), which invokes
__init_timer() on the already-queued timer. This clears the timer's
internal list pointers (entry.next and entry.pprev) whilst it remains
linked in the active timer wheel bucket, causing linked list corruption,
softirq lockups, or kernel panics during timer expiration.

Fix this by removing the redundant timer_setup() call from
__mcheck_cpu_init_timer(). The timer is already initialised once during
CPU setup; runtime restart paths only need to arm it via
mce_start_timer().

Fixes: 26c3c283c5b0 ("x86: mce: Split timer init")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
---
 arch/x86/kernel/cpu/mce/core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index ab469605fc89..765e8103b0d2 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -2091,7 +2091,6 @@ static void __mcheck_cpu_init_timer(void)
 {
 	struct timer_list *t = this_cpu_ptr(&mce_timer);
 
-	timer_setup(t, mce_timer_fn, TIMER_PINNED);
 	mce_start_timer(t);
 }
 
-- 
2.55.0

