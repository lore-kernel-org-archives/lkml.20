Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011024.outbound.protection.outlook.com [52.101.57.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EB9135A53
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791776113; cv=fail; b=nqLa7wBgHWXX8FMssHIrZMDu3Tn2B6/4Gt7XrhCdimJaBBLifLDQiY7qTeN0VZmr4l9porGM2sP81S9THv/PIhWB5xx/KqPOlrgcFFqTmEAPagZG0sikutyI2kqo7Hkth04tlY1NGfUuYHIvFmyikczgKbH/q+G01YXAj+Oy9iY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791776113; c=relaxed/simple;
	bh=KulA7JxB4HCcxJP0cbrQWW36MD78/mTR1X2+abTMuOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=l6my44D/QIq/K/0SApbf9GubX1n11ZhxET1yhXLDi5t+co+9zGxUgHzkfcs21gXFNOq50cO4fYC7ON7yoip6ZvcZ15h6NvyZtbgoIS6CYRkbU0XLBphvQLlFFsQfZmeQ+Ns9wYgZkOhQgezKB9xzHFTpVNcp+WC5cZykS0grM94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=opzSKWY8; arc=fail smtp.client-ip=52.101.57.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="opzSKWY8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lLOhmpZzLywxNgU8SnDCp5naymIRKj0IqhzM2q8+8mPWmqD26LJ5mLx6bfhhWSt6vwB0Sja+X/G+P3IPwG/s7O0Tg0mJUIU2wK4tASNDFSwAI0UyHk3bs8Ad8rKIEReRv6A7sT69wlM29Ro/FzG41ba+JfV9niNAmY3dZCOX5L2vZvlCCOMNt7zebQtpRg7BjknKMaTidWyEL4adUhGoN772f0hmjNXCZqYfIzf6Amkpu5JhBrPBwGj275V0C2F7BIHs838wwLwR3CZ5Iwp8cEFyYISkp+ughSJfhkK6fquj9R9J9TNwuyd2AHIagdlqpMSEuz3sTVX/Nlc/fO8ZnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z5TJ+wYwEcxdBOdVWn7zS3Iyn3FPzgJtE0tpFRpgsqA=;
 b=vdTkQZKoxNGXz+bQrIBhXyuY6dDAB7Ly5qV64JKaskLHtuOw8w7Y/rbGmi5pDIKk028+9Vo0xh4jCtDPVWA6xAoTQnjR4v8/tdbbt+HgvZWTNB9migyavFPGoCHrKsGvSn8Uigr5uQzsFKDfUypl1ficCHs2AUCBb59xMhOBdru5yMLC/yYxDDK0mHXf0mPFN3dgvf02xOstT0El8BUVzhtS1ZCUcx3M4yEudSmGh0XJznGfLrxikEXGmfZ9/RdG6rkSsqw5Ekvz/wXp8Vmy6+Ta+KHFEDP+69OqlCCEYylxAxX77VhhWKV2rTFGA9ExvqJEjE1yRfLtbBOdjP5qoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5TJ+wYwEcxdBOdVWn7zS3Iyn3FPzgJtE0tpFRpgsqA=;
 b=opzSKWY8PK2/kOxsv+nBqdORu2fPY6tn5VNcw0guTcyY+eRpN6bsX3fiQie0e/1jqZ0fBtIiB+ttxPfltdQwVR+HX30DgG5wjvXA4aai6I8RpQXVyI5KQxnZ3HP4AQQw56Z2fh3YeDyC1SLnBzf9Kez2IGEdvZknrTAmKIXcggs=
Received: from MW4PR04CA0295.namprd04.prod.outlook.com (2603:10b6:303:89::30)
 by PH7PR12MB7938.namprd12.prod.outlook.com (2603:10b6:510:276::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Mon, 12 Oct
 2026 03:35:06 +0000
Received: from MWH0EPF000C6192.namprd02.prod.outlook.com
 (2603:10b6:303:89:cafe::47) by MW4PR04CA0295.outlook.office365.com
 (2603:10b6:303:89::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 12
 Oct 2026 03:35:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000C6192.mail.protection.outlook.com (10.167.249.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 03:35:05 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 11 Oct
 2026 22:35:00 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 11 Oct
 2026 22:35:00 -0500
Received: from [10.136.45.168] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Sun, 11 Oct 2026 22:34:56 -0500
Message-ID: <7c4dbf1d-ba28-484d-b7e1-a713414c284d@amd.com>
Date: Mon, 12 Oct 2026 09:04:55 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/cache: Avoid publishing partial LLC utilization
To: Jemmy Wong <jemmywong512@gmail.com>, Ingo Molnar <mingo@redhat.com>,
	"Peter Zijlstra" <peterz@infradead.org>, Tim Chen
	<tim.c.chen@linux.intel.com>
CC: Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, "Mel
 Gorman" <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
	<linux-kernel@vger.kernel.org>
References: <20261010113425.34829-1-jemmywong512@gmail.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20261010113425.34829-1-jemmywong512@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6192:EE_|PH7PR12MB7938:EE_
X-MS-Office365-Filtering-Correlation-Id: 1580257a-21c7-4243-63cc-08df2811cee5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700016|82310400026|23010399003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	a6oCAoMxJOo9jFyUf1HNFV6SsXb7rkkXqyItuw8qY4r+2YOoVX/rQrbJVoTlhWQDEE99gGbyw4FZaoHJ2tjwOl/9U9wKUNgF+xQ/Aq5QsOp3f4CEbaa33MzNHEnijq1uhgdFDbs2Vi02oraE2aCd5p3kuGqb6sLSx4QJL+etiTmSvQZoC4yNgKxWvooew+/0RAc2HfBoLwJgyRJAKslkfwkHzqoS/bF6dwaEHr4vXpmJsCrelJkcM3imEI9eYziQD1FU5kzqE/Z0/75ORiHMeDyn1im/M6Pihq5G4uOtB93OIV1P6hocH4OeviprDn1b5WmrW+wfTdNskBRuk0FAtsymA/P67atHWkkjbj+S144KNYk9rU7dpJjyNdndtBP1b2C3E7FNmeNeUtLVnIjHdFK3+CTWL5uOtOCtjYu4Oxt2xUQ9BqyZxIP/LtmsC0q10XNwY/qvTTlm7KZBdToYly/KK2/U/Ecpc4YSLReJmHTW3ykwbM71Y9XHxLvKImlUPc5AwOagQ7peoqwllPVM9Bn4BUdNSieOCvZHKyTOVrG66AVSM/APCV9F4JK5UuDaUEUMQ9di1/ueaEyXDW5tvLThyuwekAN60K1PuP2XZ1WzJLbLaq1FXWy7UmRseMbijwuQY/yfdpwbKbGBxGtn6NB2iAw9hzu6vTLpqwRAiXMTC+colcLI9QjlVzZygjSPpNu/KuX4AJfzIFsy7edM3g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700016)(82310400026)(23010399003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Fzs1Y3VVRUVOFm22LPpmYKxGinHJ8RqNACblCRyBCRevAFfzaIjj4sRkZUhBEcSphE3SxTN4wuOZ7Dw19zRDzfbKXvZ5VUbcCmY29X7NjaCafaAnFypVZTe5giXQO5ALk+T7dEUrs9hM3/TSgTn0s0KnFhHkzKd2tshJZIOv9IycEwCpO8TKJNaYL29Bw/+DaT/odpiUJ7wep+2v7rg6lrIDy+NN1CIZHEvicGb+qSh3+9CQwr8UqpWy1NYXBWFdS3Z3J6Bajcz4yFma3v/PsFLc7RFnCQBU+UnqrZOzImZtfF39qlZFtftmdo+1eGhSiPkTfEnrszLjWdAzqZ9fhOt2i8KvrQcRyvIr679qcB0TxyBBtL7N6IJVDGuhXr21UrLIC/KYyf1qO+6MwEF6VjHb612TcFck7oCzgBr42S1PnNssB6SXgbWAkZJ/0Ly0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 03:35:05.9780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1580257a-21c7-4243-63cc-08df2811cee5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6192.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7938

Hello Jemmy,

On 10/10/2026 5:04 PM, Jemmy Wong wrote:
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -12121,6 +12121,13 @@ static void record_sg_llc_stats(struct lb_env *env,
>  	if (env->sd->child != rcu_dereference_all(per_cpu(sd_llc, env->dst_cpu)))
>  		return;
> 
> +	/*
> +	 * Affinity retries can remove CPUs from env->cpus. Do not publish
> +	 * partial utilization against the capacity of the whole group.
> +	 */
> +	if (!cpumask_subset(sched_group_span(group), env->cpus))
> +		return;
> +

nit.

When sched_balance_rq() does a "redo" and arrives here, env->flags
will always have LBF_ALL_PINNED set.

That would be a much cheaper check compared to cpumask_subset() to
ensure env->cpus covers all CPUs.

Thoughts?

>  	/*
>  	 * At this point we know this group spans a LLC domain.
>  	 * Record the statistic of this group in its corresponding
> --
> 2.25.1

-- 
Thanks and Regards,
Prateek

