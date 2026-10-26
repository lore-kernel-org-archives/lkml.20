Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793034779;
	b=j7hHBKkcLTLgCGBVYoPTa3FF983QC1YDdBGCRBBQUsonYWBqUQYbl0XjeK6NZon6YFf5
	 jHjqYnySNOZEMRWgqcfuWjtYfvm0ui1QUuY3lp0jkrKC4LTZZkxtW9BHgMVPAC2+o3hAO
	 Y9CDGWz93v89UdHpr0WoRE+jZ1ZuXBtl9a42cskgY/HmEnJm5biqZ5wYhlCwv9amEqVeZ
	 RI+qE8+D4EGIg2OOEy7Byv82WuQUXx/WjgpdKjZqRfOsRUYad1XM7LGVzfZp2wcJFMuDo
	 C1LW3JLwGLq1ytNYvOndmTaCqiO7ZAwDPFYw/yjNlCu2nfWoQPWL6XCMRMB+f24J3Gg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793034779;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=KK38krFhtZ29kuCxFsDEgwumSp94oAg1dutfbCIlP1c=;
	b=0KnaY+xiK8Eret9W2NpFhxJLUIaZkSzhZhxkh4bZzFvQhqjpAR8NeAao8E62ER4jh08R
	 RdauUozjo/kmKBcAOJQDXH4YtNhfdL8X6BcOaj+VcycxCbFrIlGwv5R3t/avqmzS8mwt/
	 FYEqAjrOzB73suhLzD5Ot3l71KzcrR1ERg02neRq1ZXc+dsBrsAupGgLICoO+8De6Mjrl
	 W2of1ch58FS6Z2oLhD3xyz27Fp+SCsJcVrAkCl9DfJr2o5byBPnXREfpa4JkrZsMpwIkv
	 r6hSbmETeTRcwjJi8jEwgohSfXk8l/XL7AT0JGWnlV8BlRq2gViGqNR5oz/zKQjI4ZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TipDCmQf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.49
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013049.outbound.protection.outlook.com [40.93.196.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45047606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45047606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TipDCmQf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJfB0HjW63Ok4swWCtmz44rO0r/RvZo/j/DayJWHl4oylEaklcjS2DnbrgQ4YRhnQBjUTKNOlc+oP8IXenod1+oZZ2afpSMXYDEVssBlinRuOHctT29dqn7o8rcC9XlS7X+imyo49qEOiN7h/lHnpICji5kw1i8D7XMc9wFeh/BTwKVsiVoqyd5tpekXvxDATPxuJ2lcUIN1KsPMsR7NLfgd4idpihpzbW6qXEhe5+rYQbJVWpciCY0WgaQle9AXJHPPwYos94Nb+McPhRVVk1xeN0O6EQT/dqYjyN4iz9ygxDQfC5bFC/sA5ohh6JEVCIfw5n0xYUp1q8v7TV0wFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KK38krFhtZ29kuCxFsDEgwumSp94oAg1dutfbCIlP1c=;
 b=J8eM11rgz3MeZxFGlLJkNjftDJCBlWHTf02Jyi/WxzDRV5r1t4dT2W/Y0IZYpsmJNH9fbR1H+vBzIOrL3jJBGOf+KXp1L8xAavjJYv3V0uGLhxvPsZWm1ntn9SOqmC7tjnflJeRzXdc4Udj7oO0w3gYHM6lTTgfY095qLfkZiupUMz74Dm96Fuhs67dKNX3cICBsFlCl0exz+6YzottO2Byweeq7sFs/R9FtF1p0V57SYnH3kOGuv2VAFqmyHF2vl4cR3zyiv4mC3gbnaqvwz06+gxfSxOtas2tnPeKYmzSDvaS0RzD6OJPFG/gGRqwRvC/kRvX1Qo5wnK+LEu1LLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KK38krFhtZ29kuCxFsDEgwumSp94oAg1dutfbCIlP1c=;
 b=TipDCmQfbP5nQV0hIYMWcyxvWgOub6BDsCnBydlzgAvaFb/oLI0hWNuVlSnimcuEBmyrLVfvHGC4RxNeXx7WfLQhmYjEIBrcjvcqkY2uim8U87ZoNOZJerBSE17L9FeZg3CMgYAzFecfCfbTzSNe/QwqZfUg5cO2R3ykl2lcQXH8IteUiBdP9mbhPglQ3neqHxB2UCx0TwIY4lKQzH5weniiVz1IHiUYQUAYRYmEKBTRQWAe3VMthFBKK2eY44EI6mnAxvtoM9386qY4wRLJnQgVIXUQP6bGnB3Fc5pTrOllzaWsFmgBGsx2puqoNN3hM4sRW0gylBHl2zYSeuY91Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by SN7PR12MB7854.namprd12.prod.outlook.com (2603:10b6:806:32b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Mon, 26 Oct
 2026 17:12:56 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 17:12:56 +0000
From: Yury Norov <ynorov@nvidia.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Yury Norov <yury.norov@gmail.com>,
	linux-kernel@vger.kernel.org
Cc: Yury Norov <ynorov@nvidia.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Subject: [PATCH] virt: steal_governor: store only the sampling delay
Date: Mon, 26 Oct 2026 13:12:51 -0400
Message-ID: <20261026171252.3860162-1-ynorov@nvidia.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0027.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::18) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
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
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|SN7PR12MB7854:EE_
X-MS-Office365-Filtering-Correlation-Id: abac4a0f-ce69-4f99-f2b3-08df338460a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|10070799003|366016|6133799003|18002099003|261021123027099003|11063799006|261021121427099003|10067099003|261009223027099003|56012099006|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	ptYI6YfY/8z8PHYfabU64XHhfnf/lOhxvZYgXdBg/55mJJKjAgfn6ZsfzFFlaJl7tf3dVUuCx3Ow9EiKGldaUBpU9V+IH+AUpdw5zAx+azUGZx5FZsHrVgqOw30sjH09XgytOtmHZtQ+OvxfHL7J4ljlJsguEVgWElmjQd6Z0tUJrLrLugNGARDTqaOavXDtI7iRNsCPg6Tk496sZsdfz9rGw+Q4iysJepU43RxAdlG/664ErMMX2E1SUOhk7yRG0+IILpeZay++cIkc0XHVd4Rf080NyK2WdW7+3LbiA9yv1QRZCOMNdzhY5AI9W6u0tBr1sxrRVBxznKjrwepzyfmY2g7ksPsHERLM1QKLRFb01DXu6R7xyDMpbFj+O6tiflLBzDgdLlh/ss/ViNVJNaaDk0/IpwKnKXPnNbNRL9E3pMpHGO4s3vgpZeMuXlS7Om4HPs3qpgN4ffSHdol8Dv+hKI/F5VsE1tLjfyLP6afZuO4cTMQIOp4JGnJx0V/el2l1FSAblys0EtSqgPdcjmwMGtXjXUiZelptvNn2nEYaqzx5U5FFZlNbLTCg/UdOgn/krbNvT1f5lMpinBlyy8DWrnoy2lBqPXZS93NudI3xU4/yzsMDcaN74kvjvqFnyZgS68S4iUSWJ98MUxGj/FPu1ax8jd+6S834vM42w/g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(10070799003)(366016)(6133799003)(18002099003)(261021123027099003)(11063799006)(261021121427099003)(10067099003)(261009223027099003)(56012099006)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aVJafwbZBR97g9WurjVMqH9DZtGs6Xn0Dug63Y6PkA1PErbgOsFQdUjkCudx?=
 =?us-ascii?Q?SWekEwXWDh843gEkmSZlhMTtbMs8ZOaOi0gQvdggvXQ6SrsoMUU7J/3O+pgM?=
 =?us-ascii?Q?vGTtgtfNvJA0K6VwlY1pMkrS9vpKpJx+AVZZz0gGfrs2LzibdQw4wACHcbMs?=
 =?us-ascii?Q?ZitOehe5pkNX2ln7bAUUAh2M6EYCK/6ctNZXy100bGCFQz6HBb6neeGV30xH?=
 =?us-ascii?Q?kIhfPRb15Map7NIIAXhfi3gtpJBOedie2FvXKXTqGwPbTMQdCUqPfaq6vfbz?=
 =?us-ascii?Q?AiRJW3abMEe2F70hu2NbxxUE7zP1sKv9xKqbRbf/i5uzc+LI/mAzR3rco0WF?=
 =?us-ascii?Q?etmDT+/5Hd6meCA61y3tyKtgChHIfFkAEL+w6Z5iujsDvU37Ax1zFgGeP2kK?=
 =?us-ascii?Q?cmqQLcZiwRugTX8VW2gDkjeuboEAGrRxZSBJCzY3yb8g3upztYVNrxj1BV9s?=
 =?us-ascii?Q?IQKzsi2WCUzzL0yb83YfhgJTcuXLVMbifYHnXSlH9VgZIgchcd0L3GJZI24z?=
 =?us-ascii?Q?kngf64fWhz//M9+ZUiVKuMlKUdS2ewyJGtYZmxXmi066w31vwZHaaixHFz7J?=
 =?us-ascii?Q?HoyIl6j/pndOBMrQ+q2R7CjNcs1JE4il622XFed3aoT6KaUlPu9fl7oiy4FS?=
 =?us-ascii?Q?Qmw+tJwcVi6lU8g9ar3IOpDDsMgDHOiK6SzeiZH7KS3Dqmuhi4nl2aPVNI83?=
 =?us-ascii?Q?wibBNLtloak/S4hpen+RCr6ZjjAE3CaXFJAMOe7X+fRWDgW1g37wD4K9TzS8?=
 =?us-ascii?Q?n6rPJ6qOSCizLqPqD6cZUcrKinbSBydf/hmeCVGRDTIbCyUlv0LAW0gvjxtQ?=
 =?us-ascii?Q?/280QK9eq/dbfjD4Ss0HH+DvhZPsJ5jZJKjsT8HCtN1ZRSARHIFJ5Idcj2GU?=
 =?us-ascii?Q?bzlSo7mzwcd8nqv0rpmJI3F3Fa2aRvAOGCiJSjRA6yTG6nezTJPx3DYiNcwt?=
 =?us-ascii?Q?+Dg+UKxKtn1NUraX2ASzbGSR6N99HYGZGyNJYMBOyALo5EN71bMXzj/K/ofO?=
 =?us-ascii?Q?H+HaBIZrDgkGNNv7cp513JbKL5wwPWZeAFdPW96EO7qXYkQxp4WHzvTRBBLW?=
 =?us-ascii?Q?XaFubQaCOVC9SnK7cZyoqefevPeN8YGwaJj8YWj6RDUyUITn1c+JTp00LBm8?=
 =?us-ascii?Q?OaW4aiyUkqqtkfuVAPs6+FtzLmt+esnoF5Ry1XtzsRkwHf6I4tFACVCV6ZCa?=
 =?us-ascii?Q?qszJi5GjpOgfmE1seu1iuEufyxgZlh3By6DXJt9+q2Ac10HGfccOibNV9dQV?=
 =?us-ascii?Q?sLLJrTwppyW0s7hQByp0muXIbQ3+Dnlx8mJNYsJJf1YWTS096hSJmSuqDDz4?=
 =?us-ascii?Q?h5ly62mlTw/pDSn4zho9cMtuRPoZbMKM/bzwuh3GCJOT3NL/4s5yoqQw/pap?=
 =?us-ascii?Q?KhoTQZlbblybKror8ZoVMk+W9JuiW/O7VFIVjpig0EMs4y5Xl0WEzynRA5cu?=
 =?us-ascii?Q?iToIEl22wuD3GvDkT0eHg0SZZPbECf70Hw6AOm56zRWHaFbFsWzHSg5cncqv?=
 =?us-ascii?Q?F+dF6519WO3CskfW4WooaiJRgBPtiRBeQqaoxwUS27vLk/XmsLG8IL1dQC9E?=
 =?us-ascii?Q?WoGosdMRbydSoE2xjZhvzm32joxAC/7CeicFuUp+wzeHgHXJWoqodT4y9+2c?=
 =?us-ascii?Q?kNdKW61GpzP4TsmaoNu8rf7uEGIxhYAbU4Nbu/r+8aAnJr+pHJndvWpOI9Bg?=
 =?us-ascii?Q?dEdHVZ4caikqhVU5XFtNaLTAE13WfkohaEr6xGoFKFEL0B/MRt2dNn3H1wGd?=
 =?us-ascii?Q?whcCQziVAMJZvJsVX8L0mOcJn0lUM+S9Je+tKibyAX6JyPCCNB7Z?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abac4a0f-ce69-4f99-f2b3-08df338460a7
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 17:12:56.5224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MRhlPrFoXSppn7tNtF7Qf6P3nO7Ecl8wNlIJKTUN3ncKINPePdn583Q9+Df4k5IqG+cHoIPvnBZfdnYvb+Ugyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7854

The governor stores the sampling interval in both milliseconds and
jiffies, although delayed work only needs the latter.

Convert interval_ms to jiffies in the module parameter setter and store
it directly in sg_ctx.delay. Initialize the default delay to HZ and
remove the redundant interval_ms member and initialization conversion.

Keep the read-only interval_ms parameter by converting the delay back
to milliseconds in its getter. Use the same conversion for the startup
message. Both now report the effective interval after jiffy rounding.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 drivers/virt/steal_governor.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/virt/steal_governor.c b/drivers/virt/steal_governor.c
index 6e31f9923dea..81e5089ba824 100644
--- a/drivers/virt/steal_governor.c
+++ b/drivers/virt/steal_governor.c
@@ -39,14 +39,13 @@ struct steal_governor {
 	ktime_t			time;
 	u64			steal;
 	unsigned long		delay;
-	unsigned int		interval_ms;
 	unsigned int		high_threshold;
 	unsigned int		low_threshold;
 	struct delayed_work	work;
 };
 
 static struct steal_governor sg_ctx = {
-	.interval_ms	=	1000,	/* 1 second */
+	.delay		=	HZ,	/* 1 second */
 	.high_threshold =	500,	/* 5% */
 	.low_threshold	=	200,	/* 2% */
 };
@@ -74,15 +73,21 @@ static int param_set_interval_ms(const char *val, const struct kernel_param *kp)
 		return -EINVAL;
 	}
 
-	return param_set_uint(val, kp);
+	*(unsigned long *)kp->arg = msecs_to_jiffies(interval);
+	return 0;
+}
+
+static int param_get_interval_ms(char *buffer, const struct kernel_param *kp)
+{
+	return sprintf(buffer, "%u\n", jiffies_to_msecs(*(unsigned long *)kp->arg));
 }
 
 static const struct kernel_param_ops interval_ms_ops = {
 	.set = param_set_interval_ms,
-	.get = param_get_uint,
+	.get = param_get_interval_ms,
 };
 
-module_param_cb(interval_ms, &interval_ms_ops, &sg_ctx.interval_ms, 0444);
+module_param_cb(interval_ms, &interval_ms_ops, &sg_ctx.delay, 0444);
 MODULE_PARM_DESC(interval_ms,
 		 "Sampling frequency in milliseconds. default: 1000");
 
@@ -270,13 +275,12 @@ static int __init steal_governor_init(void)
 		return -EINVAL;
 	}
 
-	sg_ctx.delay = msecs_to_jiffies(sg_ctx.interval_ms);
 	INIT_DELAYED_WORK(&sg_ctx.work, steal_governor_loop);
 	sg_ctx.steal = get_system_steal_time();
 	sg_ctx.time = ktime_get();
 	schedule_delayed_work(&sg_ctx.work, sg_ctx.delay);
 	pr_info("enabled. interval: %ums, high_threshold: %u, low_threshold: %u\n",
-		sg_ctx.interval_ms, sg_ctx.high_threshold, sg_ctx.low_threshold);
+		jiffies_to_msecs(sg_ctx.delay), sg_ctx.high_threshold, sg_ctx.low_threshold);
 
 	return 0;
 }
-- 
2.53.0

