Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022133.outbound.protection.outlook.com [52.101.96.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBB133D6E6;
	Wed,  2 Sep 2026 02:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788314579; cv=fail; b=Qo9G9qbbXSEFl4z2jAmqFBE3PvfUmVg6+hnCkWD1xeZM9ljSHamOtJ/RiVIHb3VBhhEpcC2zGTDH+qCA/CLP/8V+I4L3Sk0HKrYoWwadY5LFM4M0MOCY3VzuGpbexBDEFW2P2YHNpHrS/enieQAVKmV+MJEH3YYfX0s/M1X7v4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788314579; c=relaxed/simple;
	bh=ezFZDn+nK4eT6xnu4pbaxxWnX6V0BhOXHsCclREqiRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aRbN7FORVZtHbo+JitbYUDu2IyV+iez+hJe0kIqz4tEJWvrvPlZG1XR8gAWdU9UKBeRGwi9SbOtebNTxAzquT3fMPKoqX1Ae+gWKfrQJkvMKMtdpVb+3dv7YEz0lj7Bw0QklyzOY8LJD3kO0z55mH2NSKuRlwokZMDQQKewv1mI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.96.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CgAJaHQsq34k7gDX4OuFkWM5uOjhogWIrEs43oFxd9GXP2vPoPUcZyi9MUtSNcFBwOnWJ1d+Sm5/xfL0rPZIfE9tzi2als8EYxGyJUZjAJrd05cSFG3acGfdsipeNvytldIAz9hUonXAf3+ZXiFQi+j78NG4VmS+LQDMbpYl+s+w91tdHT3EBh5Y1XLuEbN1u6L7kDoKjHN416qV0Yl9fhadHpjHrXVtQdcuIGBT91eIe8BkaDp1cBPfG0Ix3dXvn2Us04KtKI4sHzJjwtOeo/HVeB1adOv+AugCykskOYX9xnEi33Nv1RrFUgs7LXxN22IwdIuEv0Wh6DQnG4NKLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=1nHxhrK5XASI/i8SjDEdO/bffHrIEYRR+FQg8rh1rpg=;
 b=dcEvrh+v9c0ZC8G4Bkf2++/1wq2MTptU86vKO+QeZcqktJ3urxxVuGyivm/58KYvbwPV+6SjWpYlxYsIvFpHiYSo5uZAJezTbzdmblHOkRS+sMDamvjoP1bYrbZBJUqaPOdnBQLcsbHvcHuxEC5pN4SL7KMycV+eYOMSKP210E9TkOV3JxxRehSc5ClfImsWJjOnyDliIRExnnznYc1lMwUHXRrKAGjMnzuP8CDhHTFy1hEi/YflBD/5ZBD0oMFHGkyykf7Pyf/59lJWZNDbSzlnPPQIHbSI0NMano5tqIJTlndOQbwhPZihGQkUPM4bAfX2xRls7k39eyaVcZN1Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LOAP123MB8292.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:43b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 02:02:42 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 02:02:41 +0000
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
	sean@ashe.io,
	chjohnst@gmail.com,
	mproche@gmail.com,
	nick.lange@gmail.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] x86/mce: Do not reinitialise mce_timer structure on CPU restart
Date: Tue,  1 Sep 2026 22:02:12 -0400
Message-ID: <20260902020234.149814-2-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902020234.149814-1-atomlin@atomlin.com>
References: <20260902020234.149814-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0301.namprd03.prod.outlook.com
 (2603:10b6:408:112::6) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LOAP123MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: e0aabd8b-3041-4bb1-e1ba-08df089645c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|10067099003|5023799004|56012099006|6133799003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	pslnUu837cQiKBDohKstHBZQKdsGulhPT55XdmsRmhC6Zsa4V1vZTWW5Dwv7ExmMX0D12seStqcEZEKSh8IsEW6nc0k+eJVbMJuHx9/j0gOw4bD5E1Y09TQv6SyLhaY7yj4ugYjVu2OYcdrUPYl2/B2OZPr1ctVVQndUGeNiqHmVvDdn8qfIY4IDGuOCiFAMoBtVC+2iF1hLp6cj1QvVGvNJbnK8D56SuVCc9z0LGeij3mCgpGwn46GrVaoQyJNgDxDhsIDAZAC1vMEjHPtpE3Sh5fBbUK2mwa5JRh0ZUPt+yHqc0waBebZKM87wio4zyiYe5MGO/2GXvU4vJbB9A+1hGZMceWo1Ke/fSOKxxMzZfgYuNw2/bqccwyQNXiCDStOToi7L7ddcN++HDPycO1lFEjuzIlLyx5kGHKM4gEcolbjlduc9Gvhx1IW+lHFOvUA/s4scZzBJZ0sYebvOfJpHtGUbMU1i863PAYkc8CTkKmLx0k5UNlOCSTz2tMi9sFZNA/iG3ygXc7u28Bt1DRk5SfXHvEYjWZHDr6CnActyct7ujhdt0WWSFBcQzjm4neVQFgAbdNRc8eB7aTqWyjy4BRcmg584D5KaAGJqBOaYgQnMChnHqKD7i6a9J6NEY1bCQr7Lk08NDvjeOcc1U4VnvNxA7FhpfuKKhNlIxU8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(10067099003)(5023799004)(56012099006)(6133799003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FZ0sIavcPV9uwwERzNed1SZz83jGv5LknSZsAOtc07ty29rVtvidPkKthcXY?=
 =?us-ascii?Q?5UzrV+Y1PzzXCwZmDSHOdOUuxIWWm+NIttJPb8+l7HCgdNhcDOKX6+as33si?=
 =?us-ascii?Q?3hZ3aBT7rhIEVfInVtkYGXX5FYxcVp6n67ZUZQC3OxXflT7ykww40TuOpKNL?=
 =?us-ascii?Q?Cdjo1FCH6vJJecWUvuvDknW+6TaMxlUfyHFwrb+T/5e7ORSkUYVzgR4fsQMA?=
 =?us-ascii?Q?TWUxEcm7QJ+7pq39RAd8ID7Bt/N+tzB4JHlprajAIRGnoDOm8KY3mN5dONIF?=
 =?us-ascii?Q?ktSJuLqgOgTCuMHOZ2jU4BGTKZJQWF5CjzyX39/qINqKtpd9ZkKPLKRAHyfd?=
 =?us-ascii?Q?1Tpz/EX/wsF62vGl0HFHiyhvbt/T6D2FwmqRh4TnZqz7yvjSQF4hN3YzSW91?=
 =?us-ascii?Q?RCjWXeMsEy/O25e5nqujokPqW+S+ucCD3ZWT41TllqOWKK3vnqf4Yt6hHAoJ?=
 =?us-ascii?Q?zGICen+uheLhJhbivBZ5XocpX7xQ8BQJKxEcbR96OPFUjyYu6X8+dmqbHO0Z?=
 =?us-ascii?Q?5j1KU/gHJ2LOs8B8hyGxnZiXvUlkHj9Q3Hi21lQpKqRNl03nQVTYS2c7iyaI?=
 =?us-ascii?Q?5BLvZfaTkUkltsEWJmG7taXmgTs1Vafe0xJlAIWRZ7Wz5YH6imD+wFJdw8Oi?=
 =?us-ascii?Q?s6Kx3JYboIzGtgSAG8Su5ZscT5CAcW9ro4Z84fbs5dENgcBkvQnejhRP2+W7?=
 =?us-ascii?Q?i77MqzWFH9TwID7fAI9ZQVFKuHTLIgFncNycWro/X3ndCZu6i8UIU1RKrIE5?=
 =?us-ascii?Q?Fdqqr01kQKLQ/CknwW8Xc5pCwLGtxrAfQbw2DlCyTsEWvUyOig6nWuT2LT5y?=
 =?us-ascii?Q?wPtkupokmtGlzdpPH5pfbBwgq2YBWxWc8Wsol2XC9dzZ/pkcx2AKTRmE40l3?=
 =?us-ascii?Q?jBHAQ24+KYZZThX+zR2sGtUBLjl2SEQj1kRnAlwEEu8IynxVuKotQzqL6mom?=
 =?us-ascii?Q?U8xlo608ry0h8DqtJ87I2XfCeOrZgMwRaGt5ry6ZdFKIg6dJS9OckbkF6QhK?=
 =?us-ascii?Q?GA0GG8yVWRWDTuzMm9Bo08qHG5kRkpobfYrjPjBtVGeR36nFtGTlDJRs3NC9?=
 =?us-ascii?Q?mK7IJhkXX4hSXSV+d4dqQVawPIKjweKqdvKGVSOLvEh3jcDsOTOQzQ+wd/tS?=
 =?us-ascii?Q?tZf6dThVdnUQP5t5m0WwyKX2o0OWXmNTI7xSmcsFiKkjoZ2l3w/+U+WyMrMl?=
 =?us-ascii?Q?iZ1G90BpEw/A1XTizGlJ03esfBlwXVLvpgonpgT7r9uaocSYt7cHezrhEBNy?=
 =?us-ascii?Q?X8zZrwtRj6dgiv8TTlHds8E7PgH5Kl5aUGj2y7HXaOrZRmvHRUU0yOODmlNp?=
 =?us-ascii?Q?2aaCO5QxRuyzHuJdWq1Ez47CHZATJ3RMvlKdSWqWhpId2I78rO4wz6PYzPCz?=
 =?us-ascii?Q?Wm6YWKtjgAMgA6RpwewsodrKEIpK3L14byQmKEu+46KJp8IH1zMu20L0Ac/w?=
 =?us-ascii?Q?qP+ZnH5Ph60JOWCdlXYjGxdOruOUhaq6sx9PNI3lu4p3gL31brKdMGo6yBI6?=
 =?us-ascii?Q?+U31ZXO5quZY8S7p/qC52/HhCSvDNLPIzQsUI+W4TjA/dgJYJLEuXJhh5EHS?=
 =?us-ascii?Q?2cl3Kgfms9nzq4Y2HE0+bRDTri/yvsuL13ncicqDGbwsURUJetaAxZhjAmF+?=
 =?us-ascii?Q?JsJ1kAQxsK7HEYBv1+oRrTPAcKbBIn97MDDrddz+i7s6ohF1XrvHwFPOGqff?=
 =?us-ascii?Q?ZWtcQ5CeZb4oeEZ8130hntpPujxhu15hFuK7PfZUbtRUq4BJMtWebTAu6m+b?=
 =?us-ascii?Q?7+8inr+PWw=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0aabd8b-3041-4bb1-e1ba-08df089645c1
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 02:02:41.9312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L8yspJ1aqJAsDnSKvc8YZiZ+x+mqXJXr1LlP4+cvK6SDOdWF4IEURcOnGS8AyAmfNlqjzKHCK90PVCa0ZZ18WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOAP123MB8292

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

