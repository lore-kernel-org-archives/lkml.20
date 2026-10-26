Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792993717;
	b=QkTLlbWLGejBqlTBT1QE5dw45r2h0Jps/2eKdWt1iv5FMmuGJSQRKOhBcKTLo+LdhA0Z
	 KYiW1IlScX1ixnPbqJt45gsSNbft8ITNzF6c4YHpuKNEFcVfeMI408d85TL4IMWafadr5
	 AKxOuRtwysO3AitFVQJDBADIJeiM1aG6dX0g5tNApTqS3GRi3F3yHIJPl6yzvtDHNIiP+
	 tP0qmwbTiu67b9TBc/D6snZtgNPHPaV59nmGj1Pq8zIWMjFqLwyKC7Bn/1Hj1E19NCMjJ
	 YUa6+BRlBFBwaj7Q/INQ+PrXW7pYg7MvyoeqR327Wc6o8Odq/vq3JnCWlp8I20tK+lA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792993717;
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
	bh=oZL2AR5kMu0scth3p0aT7lNXsGE5c9H5H4j2nFTOP6g=;
	b=s2ALb+Nyp4JwbygKSz1f0cmv8w3sCUgI/IvHq9ky644S1YQ9s62N5nupOQXKS5SFFUi1
	 yWztFLZk/bBa7QW/FUUG531XjgU+dJqfiKMFzVSGmR7cKlbPTafjPtOaYQ8se/yEMSGK9
	 5kt1lmGgVNdM0xKKqIlxrvI7LBUCeZY6SnV+R/zAH4jEkSNRyahH1OdsG66JqgrDxc/Zq
	 lG5aynaH9zwEW70FZb/Ts6qpsHywrkqyUTmy05fnDIasQwEtXGYoTKUZoNgDuQQCUXr8T
	 /iUQ55lJznB9PRYcSc/+dABpSYgKmSzdBLNcYCr4O2Sy5Twppzf2p97OtSGL/mc7Lmg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=OyoflYsR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.70
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012070.outbound.protection.outlook.com [52.101.48.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86609606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:48:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86609606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=OyoflYsR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=idElrGnuMUYFR5ClITKXjRZ0A0MfogkxliwI64sX/lVCyWsiylqxDBNn4GpYCSvAMp/esxixj7FAPQC0r44OhuAVnAVgpVvjEoGSijwV8rQMG2kCGJQowyXeln7j/5Fxj4QAmvnBWOXL5KGeduBHbc+YbbX9SbMIkvXYUSX4Cga4n5euchoSmpMbYhX7WyCdqjz+gu04I6xinKor3mTuEdlwBKzTYNLcdICofpWjzeaS3oBTCbDwArsqfW3vmEFOgnzoUHJQ5NiGi9KXUAKHcNUEa59E35VON0EqxFgbfmEP9W6yD//fBO4wRN1uMIahRSGldXn+LBXJwLiJWqmc5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oZL2AR5kMu0scth3p0aT7lNXsGE5c9H5H4j2nFTOP6g=;
 b=uRROKXofy5V+8NT1YCShbGlPxPoL3d0byeBYXu3BzOwiH/9MM1gKRQtZxTUeUo2d3pht8JW9iXVWzvGBfW1iAFqacyD2e7yFpw1EHBVn6pCgGoRgznST8LRze8K1iF4SxQtJl3/DmZ9/MOC7wLLWSSElZfJy/aQ28V6uKcKnZjyaKQFP7/E2jTReZPvMf3lFlftyMTA46TuwoOnwYBEsE/TPlCySlvJWAhgjxJg/lFwtl2FHcvpaEfT6MYmxXFL9moNp0HsiiX5IxlUeQhMZdZta2CULAA5PpXvGsGCBDkVNaLkGCMarx1UJX2Jol+j9bnhfVBEovQXOLgBpb+HfBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=163.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZL2AR5kMu0scth3p0aT7lNXsGE5c9H5H4j2nFTOP6g=;
 b=OyoflYsRHnft6APxArg3k0zdtZMTrIqmGfkb9sV1P0/6/lMyTbrXb3+Q2KqruBK3tN/K5vmCPe75kN82qsKb5QL3qp6FftThjCRsVN2AUlehu7/XfHAPMa7m5KpBO4umYfzWab9ttdl89wmLbPitOCznoSQIeM0qjDioS7hrF+s=
Received: from BY3PR05CA0037.namprd05.prod.outlook.com (2603:10b6:a03:39b::12)
 by IA4PR12MB9809.namprd12.prod.outlook.com (2603:10b6:208:54f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 05:46:32 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::1a) by BY3PR05CA0037.outlook.office365.com
 (2603:10b6:a03:39b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.7 via Frontend Transport; Mon, 26
 Oct 2026 05:46:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Mon, 26 Oct 2026 05:46:31 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 26 Oct
 2026 00:46:31 -0500
Received: from [10.136.43.232] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 26 Oct 2026 00:46:27 -0500
Message-ID: <72a6eb77-0461-477b-a0e9-c06a486e3e0e@amd.com>
Date: Mon, 26 Oct 2026 11:16:26 +0530
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
To: <albin_yang@163.com>, <peterz@infradead.org>, <mingo@redhat.com>,
	<juri.lelli@redhat.com>, <vincent.guittot@linaro.org>
CC: <dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>,
	<mgorman@suse.de>, <vschneid@redhat.com>, <chen.yu@linux.dev>,
	<kayracizmeci@gmail.com>, <linux-kernel@vger.kernel.org>,
	<albinwyang@tencent.com>
References: <20261025130740.3324391-1-albin_yang@163.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20261025130740.3324391-1-albin_yang@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|IA4PR12MB9809:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f508d15-3250-4f22-6929-08df33247cfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|7416014|376014|1800799024|18002099003|22082099003|56012099006|11063799006|261021121427099003|10067099003|261022105027099003|261022075727099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	vlcVNpFYxD5ptSMwNy2wuPwxMFOJONadYTkIuytquO047reqJJ7NLoeMe/l025QR3KO/wAPf5hKI9qe/lkfVjDlKPsId6vxP9B0OGjIk4/GKYb1HYFUQyIRx2dICXlhAFbT+OZNynLLiQ8PiKfDJzHSOK2rN3urgg2iSF+s+Eyjq52IyHufQShcK2EA3Xs76+nPBiXiD8HQxvP5qoODieo20nIyN9XQ7SzdXGd2ZV3mSyuwDCsndmQO6+YKMT/wy8ObXRUaNc6qIH4oCuCjmp+10v3+4kSFyaIGOpW8xlLgCFVdmYbsYCQ7LXuN/Or3tRIF7Syw3pkAszJTOFiXW685/oV0cB5UMv6b7atTBoDkJRA9Bo9Tevl+wPoell1CYLYjvtfPVdKpcxThiU9w2ALXd57ePJNct+Zdm73rFWWxuW7N8FV8QGqTDCXowfIKAM/QtU1vcpMiApqgTqa17tLlqDrsrs+3CIrRvRaniyWjiK9PFAf9IV5VeEVh3N2kD+mnXlsfU6072PaqgoDJ/Kdk/FyeyuMT8zCXKEA8WL8OR+KD26VINeVPTpHUaVkQLOpHaBqJPc8eb++0sAMY4w4/XXTAG8cnZVRD0pftB0tWafRJ+YQT6k+BQMTiVyLemxtRgfFlW29Q3hFsfODK/2jomWk8uSInyUjoA9yZkD/DNzt+13Nh9jWANXaEkkWaxnIdIdcgbs57vdJ8V7c6ecQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(7416014)(376014)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(261021121427099003)(10067099003)(261022105027099003)(261022075727099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EkRQV3I9BbO4owJDdeItcrXjoal4oqUxQE9jem6P1AQfREY6xeF0LCBiWfCi9qVr48p0lu9oIUe5/gALANZo+0J/ZD1esZw0dcjjiD6MN+WC8nVldsXbb3Is0qRhhfo84oX65N0sRWOoBrxWQTODvkbuSWUP4j9i3JwCnOpM06QGDX1hdqsl5q6uyFvRvWiP+KUfjJPHDF5sslXjqCgNI5cS/silZ6RX06uNfND2+UcIMvYEAE2nwQH5xKHAczhZU4+iseJWIjAXuky9i1SXYf959XvWLrSFs8FNBGmJ1QCGl8HwMWHYgm8hipwTcziUnhOgnBWVx6MGXv9LU9ZPUKPgbJIvzh2h4fYLY8b9f6irEAuotFr8upnCaizf93qZllNEm/GmHJ8x0HP82W1pT4MRWv5BUrTaZg0x5AXpJ8MafZTx6zJyleus0i3nVTT/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 05:46:31.7569
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f508d15-3250-4f22-6929-08df33247cfb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9809

On 10/25/2026 6:37 PM, albin_yang@163.com wrote:
> diff --git a/kernel/sched/stats.h b/kernel/sched/stats.h
> index dc626f99ffd9..ef52fbe86bba 100644
> --- a/kernel/sched/stats.h
> +++ b/kernel/sched/stats.h
> @@ -290,7 +290,7 @@ static void sched_info_arrive(struct rq *rq, struct task_struct *t)
>   */
>  static inline void sched_info_enqueue(struct rq *rq, struct task_struct *t)
>  {
> -	if (!t->sched_info.last_queued && !t->se.sched_delayed)
> +	if (!t->sched_info.last_queued && !t->se.sched_delayed && !task_is_blocked(t))

I think the sched info bits should be adapted to use the p->is_blocked
indicator instead of adding these endless exceptions.

Could you see if something like below works:

  (Only build tested; Prepared on top of sched-core-2026-10-18)

diff --git a/kernel/sched/stats.h b/kernel/sched/stats.h
index ebe0a7765f98..bd8c5cdfd12a 100644
--- a/kernel/sched/stats.h
+++ b/kernel/sched/stats.h
@@ -233,16 +233,13 @@ static inline void psi_account_irqtime(struct rq *rq, struct task_struct *curr,
 /*
  * We are interested in knowing how long it was from the *first* time a
  * task was queued to the time that it finally hit a CPU, we call this routine
- * from dequeue_task() to account for possible rq->clock skew across CPUs. The
- * delta taken on each CPU would annul the skew.
+ * from dequeue_task() / __schedule() to account for possible rq->clock skew
+ * across CPUs. The delta taken on each CPU would annul the skew.
  */
-static inline void sched_info_dequeue(struct rq *rq, struct task_struct *t)
+static inline void __sched_info_dequeue(struct rq *rq, struct task_struct *t)
 {
 	unsigned long long delta = 0;
 
-	if (!t->sched_info.last_queued)
-		return;
-
 	delta = rq_clock(rq) - t->sched_info.last_queued;
 	t->sched_info.last_queued = 0;
 	t->sched_info.run_delay += delta;
@@ -255,6 +252,15 @@ static inline void sched_info_dequeue(struct rq *rq, struct task_struct *t)
 	rq_sched_info_dequeue(rq, delta);
 }
 
+static inline void sched_info_dequeue(struct rq *rq, struct task_struct *t)
+{
+	/* blocked tasks are handled at sched_info_depart() */
+	if (t->is_blocked)
+		return;
+
+	__sched_info_dequeue(rq, t);
+}
+
 /*
  * Called when a task finally hits the CPU.  We can now calculate how
  * long it was waiting to run.  We also note when it began so that we
@@ -290,7 +296,7 @@ static void sched_info_arrive(struct rq *rq, struct task_struct *t)
  */
 static inline void sched_info_enqueue(struct rq *rq, struct task_struct *t)
 {
-	if (!t->sched_info.last_queued)
+	if (t->is_blocked)
 		t->sched_info.last_queued = rq_clock(rq);
 }
 
@@ -310,6 +316,9 @@ static inline void sched_info_depart(struct rq *rq, struct task_struct *t)
 
 	if (task_is_running(t))
 		sched_info_enqueue(rq, t);
+
+	if (t->is_blocked)
+		__sched_info_dequeue(rq, t);
 }
 
 /*
---

It is similar to how we handle PSI signals.

>  		t->sched_info.last_queued = rq_clock(rq);
>  }
>  

-- 
Thanks and Regards,
Prateek

