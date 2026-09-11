Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020120.outbound.protection.outlook.com [52.101.196.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF8559C976;
	Fri, 11 Sep 2026 20:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789157546; cv=fail; b=T3HL2gVvxSdAuGEyp4g4MJbNoPNj8mKsgJCeTYCQV13ZL7GOj9hXlUpbR8DQ3z3UcrqneeJ02eBakVnYv7B9WeZKQlNgUZDk87W6D8gw86vuVDBnHp1agEafozSz4P1435ywTlJDUQOVBu/2cvfzNfeu2ZJ8l7FeAj4e6XkvCQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789157546; c=relaxed/simple;
	bh=ezFZDn+nK4eT6xnu4pbaxxWnX6V0BhOXHsCclREqiRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hDNeRPULoB05uifiZ7gGhyJjKre130eM320KJ/xxVyDQ0xQrxrbcyUPAKmWQyEsfRsgDGRun0Dfun+GKB+PrxhqJiaKOs3aUw5wNyKUzA4W9qVqyExDsx6/v0cQh99T/7Q5KsupfEFvxUjIyJQp+kiWjJzVVrk4nlZFGdnOi1JU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.196.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HuZYKCWvlwgpuYQE1pR0bs88SDiZQtWUXQ1KbOx+QVQ8XRAubIejTHGubHVcUyb+wcwoD8fy9CkKYWenIOWjgyIjAXDjin6U7+mwp6zicak+nQokMlkq8ELatOoOKpinvuQZjMrQYF/niAMnx1Idovv+kF8rLJ6cUEDcgCSq08aHDMC6EeSUNN0lC8Ec7hHD26Gd4VI72N3TJMbaDw6MUONwJi/pbnMJt61YHc7CJHXRuhiukPJAkQx1tyjE0ML2U2gZcKDJSQVTCiwnTlT+zTv4N2jCljw1+4ArBy8Fm56el+WUhwTSzWPryxa2lwS/spkfZbB0ZsHqFsHZDJUfnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=1nHxhrK5XASI/i8SjDEdO/bffHrIEYRR+FQg8rh1rpg=;
 b=fks0r7PsUyhLzc64BnmT7HgUslxtiFv08VO5em38FEeRehCyIEUkBYI5/9iWZNnit3239LnqmkZnqcXwEevsRwqSSm08/Nhb9P90eat5uKf/Z15v1eD8FQZtEJPEXKq7AW5TWcMvYmW44aVyPBtip8psOkn3NDuj7GtZrYkXMivAQl0pA7MS5QPCC/a54rNrdHPZ4otB3IKIjVkPJhzPIcqJCtzzMqCSwJvE5fksOL6B2q+Lm3n888Fw2rOCVLDicYc1e3zKpMnofyMeg1AIitJzWzFYqG15ULbm6S1VpVcFulwuChN3YgtwUHQcWNrhA1JvUapzjR7rdXwKEbkivw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by CWXP123MB3207.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:3b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 20:12:14 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 20:12:14 +0000
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
Subject: [PATCH v6 1/4] x86/mce: Do not reinitialise mce_timer structure on CPU restart
Date: Fri, 11 Sep 2026 16:12:03 -0400
Message-ID: <20260911201206.532113-2-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911201206.532113-1-atomlin@atomlin.com>
References: <20260911201206.532113-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0567.namprd03.prod.outlook.com
 (2603:10b6:408:138::32) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|CWXP123MB3207:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f49c1f4-148e-4b3a-d974-08df1040f85d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|6133799003|3023799007|10067099003|5023799004|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	I+baumGM5JA9cveAr1G461Igk8zwPArjc4R9S6X/72E/oUZ6u+dS8lMDQfA3Efq/ZLrERKw/izuWoDT+8vyQ5zKrVWj7SQvq+WoKwcgrPyyvA58B4EcDlPs8tGHigLqWihzy9aTxFDRgrklvXvaVvU3WmuyjTRAZb6M8eoTAOxBYQD/pT47BOYRrgytARglaVu5qQ2ImPqv1O1bKUOV4tC8XzoQtk8J+WUhT2AWAGxJujN512SjglwcKusKC7U6vMkaEoyu7sPpysD+IfIVUw5UIBtZsmPAKqhR3k5Pa6c0afN/1IB09CSfACJJYrWffGWVDRAOK0Aw6OXFawgg8hIAmSHD70b2cG85nY+NdUFLsqsZVxOvEFhOIHA4XjGRUGjKxjm9zLnFgPGROlOapw2N0OVw4uTfm4VKleiqKMmfILGfy+/xkqfRJyE5kqsFqpOziUa7ei4EGUjQTiFhfKnsWv+kqDqQ+4uJfREpe9bHyZH52liaRjjCY628FrgP+vmiJp/Ck183/692BRhISS6+EuVVMX495GSbBTg0oGmUq/UvH0h0ETNBqU0xDxzr8glonfW0Znlg+uXtSThgbjsgGaRqbLxhQgGMYUm//Sx1i43B3F7uMnhp5VeexD5x9e6xOTgtRZHparxVPfafewQoVSwNwDP9o7KSJi4h5pjY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(6133799003)(3023799007)(10067099003)(5023799004)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3orLktFQpUAdNHE+ggd62Ks6tkOmvEZhCgC8mOk4jfFgfgYg5q+FLoZR4HrJ?=
 =?us-ascii?Q?9nhv08YKayYBxY8ay5IYL56KdUuS/8BS72e03F4LVeEOJoA2QUW/1gkLWCow?=
 =?us-ascii?Q?p7qzQUba3/9Ur+54Ql1Hae/YuRTztqrhLsvW/pQsEfkxotb1QNNhpy9uiN2k?=
 =?us-ascii?Q?Xb/A2eHhYC9J0E2TaisLfZ3JQcZckFZyGbtX4MeX6LGTkEk1cSmOMHMQnWLb?=
 =?us-ascii?Q?+i9zbTnaOgDoTyteL7vqbN+UMtKAdlkFTLxjl0pE4BdoTpCtcfj/3pXSQa0D?=
 =?us-ascii?Q?GnW5f4bp0TW/HV50+qcuBpVp5jlaOkpMPZgr7jz0omD/MtH7F+oP7OLQWJ6/?=
 =?us-ascii?Q?0/NnoHPJIj4GOSrV9PLS0N68IzjO3ZQzl2BxJcRn/YWh5OtQYeR7u5cbr8Xu?=
 =?us-ascii?Q?fN/qR8Vl2q0XMq/ryxh8QaLAc7yR1QCceeWPNhum+hBjQs3pZ+52cyxWiWHs?=
 =?us-ascii?Q?QRN+omCXSoKU7lixRelXA7ksabtcJFYZNB1OU2IIwvXji0whlcfpBUlHmscs?=
 =?us-ascii?Q?cQjMtPtmjZpClLHApzbsoyYkKTxEu7XgeIM8KqbOUaTgb5M6YZ9DUJaXh4X+?=
 =?us-ascii?Q?/KnpiXilEp4n5I8whvOJcuvUvA8sPA4V7kqByepuJeijbE+HdJ8Kfq56uIiA?=
 =?us-ascii?Q?ZWKK2ryptqKZc8Bd6lzch3AqkeDV26CNq4TiK4niW+aAjfB7tQ1vyWy3B2RU?=
 =?us-ascii?Q?pEe4KEbPpxT5wvQMWz/+I8CGxPaQTaoJ3eqr71zmcNjNgupEcUzBzGSpSVas?=
 =?us-ascii?Q?HZFmKDcj7acGT5ExuBdsE8g5pweVXNDANSuQuBN3itH2GbRs3QWch8tAI924?=
 =?us-ascii?Q?z4xVXnOi5+li/54L0BP7hX3kljQg8qdQROLS3tm6qGxJtZQqhCQmO5DXWw9v?=
 =?us-ascii?Q?OjZ96S9I59+Po9hG3tncgZNFsD0rid07py85x1Cko3O258z3Ia8YrQs7Wm2x?=
 =?us-ascii?Q?NY7zkNqheh5eXiKWysWY/W5gCCjkyljVvdIMX8MemPoyHjrOsqdERAuLqs4H?=
 =?us-ascii?Q?z+dDnJyhqzk1iHg84yLl1Up5I4EdmoM+jnCtmDTdsoX4o5kWGriwCVJ/Crfb?=
 =?us-ascii?Q?XxIHfQLhc7T2hQhyipnck+0o8a/g6KRlsc1ahL7klIzAPp+4czQ4DIKrf8pD?=
 =?us-ascii?Q?tdz0ss4K52bG5pKkyUz6wesCv6Yd8RmEIxqbaprPKCfEoOwTYUVBplmxswQI?=
 =?us-ascii?Q?503olSiuANhrYfuJIQyKvRgilZG3v1Eytqtx9xJ1Fs6zKzLpynlyUlK8XTJA?=
 =?us-ascii?Q?LPDIOJG7J9KocOuVWD88kFga3skGWTUCEXpNYMGD+rjDxcJUb9YCkOLhkAAw?=
 =?us-ascii?Q?Km4rT/z2uPeIbMS9KdZ2AsN593J2Kn9p3MVdbtrRkrFjoKaFoq724O293JbI?=
 =?us-ascii?Q?c7d6cWYayuDkky02eWbahJWchg3vto6pa46ASVdcwZKLapKcjf4SNHTRKAaE?=
 =?us-ascii?Q?MBlVyogvXelkoMI3Y1kyB8mIlqbTQugjrIEi2qnG44Y3gMjvi8apRSh9Udpu?=
 =?us-ascii?Q?hXs/2LG6kzpATz4K/absWBV9tRkwXtWDwI9Vi/cZI1/8ZQn/bgj/hADp2Yfs?=
 =?us-ascii?Q?qOOr539Ou0OT1IpPJhANK4UEiJvwFFG2NxCk9syH47FxDaBrBPEzJXhEraUc?=
 =?us-ascii?Q?5mQHJAkjSOwJJVYjXFjf+tDm2J1YB6CIhUGctIFQF38haxhHcWZ1w1VItScP?=
 =?us-ascii?Q?cnWJ7yW8cLRRCiYtr8k69hkLvcWH0806ixpllK3HZNN7Folb1q5wvjdhWSPJ?=
 =?us-ascii?Q?TxxTb2StMQ=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f49c1f4-148e-4b3a-d974-08df1040f85d
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 20:12:14.2861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eZTSrQviWS9fgyxyXeb/5Hc+mRmatotIl8sACZ1LybZIWRHSRrGHUHn/eowlNXhWhyHq6+f4phyHEuVyV/zq/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP123MB3207

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

