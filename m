Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010055.outbound.protection.outlook.com [52.101.56.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469C32D7DC8
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900076; cv=fail; b=ZPz41YtubMkH8z+8cgWWFE+n1c8H/MwG3RuUgsjvqHZiF3HeP2dT85xsezeKVZDuYD4Q6+tykxKmm7Q80v+LphDq7k0DHsCKmLJzxAdaYfAkFqcwTtp7xhmd8BlTGIociUWsi60HKfrZsAxojvKmC1vPSKnSOBZDcBkA+Di94fA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900076; c=relaxed/simple;
	bh=gcAjv+UWF60Wa7k178VXDF+PylI3vMpN/1r5p9pnHQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qoOjk8U1Ua6cgceoucVd5Qokd7pZHFi+1nG3bm2xeCyVNu3TS/uUvNrRfFItZCOUrUV2yx7G6Vl68uk9omWmGNWuDWfFLtZnKGbREFBsQhxancvgXPxQ5d3e+O+aSkXV+DHpdTK0nDft4nHEuOxPZfLti3QqWcUHtIeadjXLo10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OWZMvVpd; arc=fail smtp.client-ip=52.101.56.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OWZMvVpd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N1c8mSQfYQYYy5eswr6qtlNCSILV1OlwI7HhkU1scMpT6lqJbUTnZuL1QI+qcPGHjDgPxXo8B6/lZSZQ42IgWKiJRFy7kdr6cBjx/x3ben0HPVUYBsXN7L8+7Gn0LCCL/uh/Q+uXMDQ2F5/7D/aJT5hMis7hU09MW24Jtsu9txgpjsT6bhDu3kRTI7iNRESFFdVBlKFA+MshfNLHQUJiymfZi2RgV/U8BwbtU6lkeNc1OsGxmFkCqPYnkrlr5V/gWP71FsLCt0N5FfaBi3eDrjGaJxb5dmPEkccu4NaTijZtMra7jYr59GHBeOZux5Ke4qxvln4wo/jKTz5mUChmdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gBUmFcTDsuJ36wD+ZNYRgvEbM1nKKT61b12Fjtgg3EE=;
 b=W536Tg/DqEzpNSZQuKOlYwmjcXK9ybD9k5xUkUSxXgFnmrPLG/6bS0jOPIRKWPEsmmSdHrc1352rRdUZu6JtZfH3R4QfvoqbKAHl8+7IPBigZH1Az3GPZeAsUjyrfELoAj+NrwcN2ifr9ne8FT3Epf1Ixv1L148uGuDlyalIvx/fWlz7ZDtpZyynrOctN7NshZqZSXK551IzppdNXeyNzoLJEqOOsCE3EtI6jeLsMxRt8c2R8Jfj0DCXhfTcwq9MsXGdlQNyHnPrizBSQFQZAplBewFS9bIS+HeTt0/lB46Ho7iF4n1b60P9hJLEln87hii5KWYfOvRqRZBj6tL/sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gBUmFcTDsuJ36wD+ZNYRgvEbM1nKKT61b12Fjtgg3EE=;
 b=OWZMvVpduSk5NPQNl6Fu7scV5tHZZKcZOwm/iEmrL7PIk9mbmF98iXpovNLJtHo118BKrtUpjTNau6H7fwF9xovobZ8Jof8El69iTYFHhg+9m1h4Q5Egjg8zZQJFNcdZCsli1fzF5O7lcG74XtbEtbpVczMPfzIrqGIA8q005zo=
Received: from BY5PR04CA0002.namprd04.prod.outlook.com (2603:10b6:a03:1d0::12)
 by BL1PR12MB5705.namprd12.prod.outlook.com (2603:10b6:208:384::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 14:01:09 +0000
Received: from BY1PEPF0002696A.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::1c) by BY5PR04CA0002.outlook.office365.com
 (2603:10b6:a03:1d0::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Tue,
 13 Oct 2026 14:01:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0002696A.mail.protection.outlook.com (10.167.244.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 14:01:08 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 09:01:02 -0500
Received: from [192.168.0.226] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 13 Oct 2026 09:00:55 -0500
Message-ID: <0007c8a5-7175-487b-a927-37ae7a52094c@amd.com>
Date: Tue, 13 Oct 2026 19:30:53 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Apparent lost wakeups
To: Joel Fernandes <joelagnelf@nvidia.com>
CC: Peter Zijlstra <peterz@infradead.org>, Vincent Guittot
	<vincent.guittot@linaro.org>, "paulmck@kernel.org" <paulmck@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, Dietmar
 Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin
 Schneider <vschneid@redhat.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kernel-team@meta.com" <kernel-team@meta.com>
References: <41BA40C2-AC25-4339-8607-4A45BD4ED87C@nvidia.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <41BA40C2-AC25-4339-8607-4A45BD4ED87C@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0002696A:EE_|BL1PR12MB5705:EE_
X-MS-Office365-Filtering-Correlation-Id: 490108a9-6508-4d90-9528-08df29326e90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|82310400026|36860700016|56012099006|11063799006|22082099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	KVWF6BRDmb53mWaXdxyiAccD70TehwMWdQ4BDhXFOYPxpZKrD+AsxoV266Be0VDNIG6N1jk2eZw9YnUqKFsP62O5Bs1gH/XcVmFsWK9Nc0EAbkRdslKN/6k1CGgrlSkfvPwQhGw51KsuQkQFuIyzmt3NxnP1GhbA7NFnE1DJ1dGBZov8M43PIzAqLueaA63y/lP/r1eM/l0Dw/eI9T4cvV4nr0peYxxS62qTZbOQCnRZF3jlGq0RkVTJAPtP8EpVLlLXICm8XsxbcLhuZTfyzW1IBaw96T+jP/z0IUvomSDejMuN/rsLaPKY/3gMlgWyv7irNloNjmlNAZq17xkx0/Ej4o+lLq5po5MgRphyvc63re+PsOMRj6jOv84qQw2iFHKYXae0o9QWcJWw4ZBlLpO3UiRuRvq4HKKvOniibxjN9M8CaziqMIJBNVwSlJbSPhBXjqmP/qW1SWQeSiVUK+DNfqLHghVoDH+GRy+u4rpyuwNUjyJmy1oLP9nYtUsf4qbONXZYIHIJuM6Il8WiZkzxcCr95Ma6shEuPtWwcGKJ2lFX2LYfGmblpHjMBdvlt90QIVVaEYMAFep35DvXN66B9jtndaUhFidupcz4hWKmLVBmz/tc2ZqgHQvDUrAOPaPcT8x1OQZAPpZFnXE7cm8dpS5mkt4r2y20pFJ7GsQDAtXQ/feODXXatywciOSgzfn+W8FtyQD1yaeqYVyZ/Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(82310400026)(36860700016)(56012099006)(11063799006)(22082099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tx6hsLZFE0oZsrhVs7+eV9gLcwUTSPoIK+fiPIHbF8O4bCbFxR6R9az9jRdZavdJc68D9cd2WqamLHo3GqZaai8yZ3qEKMK/UEXl3whVuTd+c6K/xebRGnvlt74Hw8AsjD0OVRxOFmTPCdp7z2PT8RnASfos/pSDpgqz513gC13gMlp0l8wTkSe5GtQmPz02k/xjMkv8JKCwHhRNPt5ysx/4LD0fBTslFc3K/ONN5jsIqGiA6qFxoUOSIMtgr+SY+de+umap3Ze12cr3dbGjiTb/R0ETR0bkh5QBNU3JVWx9uhKhYefhVwqzVYhQ2oWGv4EVWOiGYwrEaXydPlZPe0TMHTd1aZ6ihP3aXx37hwyOgTU4vFf75E7Kxn564en1fg4gXUciwh9mWEPfi3hy2mZmQ4vdlWSU+kTBMvAEED05MDqHde7ejbKgkwKkilNJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 14:01:08.8968
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 490108a9-6508-4d90-9528-08df29326e90
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0002696A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5705

Hello Joel,

On 10/13/2026 6:19 PM, Joel Fernandes wrote:
> Quick question - with that fix, is there a possibility of a live lock if the sched loop keeps restarting because another CPU kept toggling RT?

__schedule() only drops rq_lock for two activities:

1. Within sched class' balance callback: This is done from all classes
   from donor's sched class to below. Once a task is found by the
   balance callback, we break out of prev_balance() and jump straight
   to pick so something is guaranteed to be there.

   All balance callbacks use double_rq_lock() so we are guaranteed to
   move the task from a source rq.

2. For newidle balance: When no tasks exists on rq, fair class will do
   a newidle balance to try find a task and prevent the need to switch
   to idle tasks.

   If a fair task is found or woken up, the retry is limited to idle
   class. If a higher priority task is woken up, we do a full re-pick
   starting from top.


Now, in theory, there is a possibility where:

1. rq->donor is a high priority RT task that went to sleep.

2. Lower priority RT tasks (>= 2) wakeup on the same CPU during
   newidle balance. A retry is triggered.

3. balance_rt() triggers a pull because the newly woken tasks have a
   lower priority than rq->donor which went to sleep.

4. pull_rt_task() drops rq_lock during double_rq_lock_balance()

5. A different rq gets lock first and moves the RT tasks away.

6. double_rq_lock_balance() returns, finds no task to push, and
   eventually __schedule() goes to pick.

7. Fair class' pick triggers newidle balance and jump to step 2.


I'm not sure if there is a safeguard for this case where the CPU
can get stuck looping in pick_next_task() but chances of triggering
it is small (albeit not zero). This can happen even without the
changes from this patch.

Maybe I'm missing something and Peter can enlighten why this is
all impossible :-)

-- 
Thanks and Regards,
Prateek

