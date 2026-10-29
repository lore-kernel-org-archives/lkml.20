Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.95.86
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793280339;
	b=P/QGjbeXkiCUkySI27QB9BecsSG3zsub0rDoPGFahGmNsVagf7rjyrDa+49pz5zZlX91
	 WNv0xH6rjIe2Q1lbDLp/uu3cvKc4JRuYFIE2a3KMEv7s0RUzYPi6C4Jv4Ro0409FjA6nm
	 l19tRzl9p4Rd6bm5sUJ94bTokVhSstxpAdB2sDA5vZfB7PPYIWiQRf6a+pFK1C2yOG4uq
	 0phGQY2ebDZ+5c5VGWkPAlZCHOLOIuJkG4UQX6F/rFWbUmwy4UDWeYn0TAJRjHJ6Oy/WM
	 er3V4qO+UPMqXGTrqmOUQeQ/0J+u5fA2kbBCq7DKweLxNbtail0LI58e0Gi2KYHebEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280339;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
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
	bh=c4Q/H+LUKl/MeEEFKdX/pqszdJ3bsPKTYTYrnaIVz7E=;
	b=FGF7WLiQkADSk+7rJiGHQ5lVhZqv7vK1vbYSt72BFSl2Y4Guzq/Uyfbrsh/wg2ylvv7p
	 3zHcBZytXwTW62CkhsWfTD764Llnx38KvQVaQm4Ruz+PlBpbx1UK5KHDW6/sozXnSTErN
	 B302EBZfY4/5ZqaabyfOgSYgLxWcKFj7XeDlL2o8pa9GVXjDp9/eembel+JOWtkK8jeA7
	 TavQZfQ6fHK7lzDE+60/XH4rWhASH564JCEcdHoQHvRQ9dOkTY+T/wLYhiRfknj1Txzx/
	 LRakWAU1DABB8Xc2c8qYhC4qeS3vKxFOOnOSGOnPDikrpQ4VoJwG6to5hob8PVJc2Dw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=atomlin.com;
	spf=pass smtp.mailfrom=atomlin.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.95.86
Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021086.outbound.protection.outlook.com [52.101.95.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF39606A321
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EF39606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sDfx5jGSOo3x9o76eWrux17qJsibE0ptv/jAxiWD4pny6neL47NM5NpOomztg7EdaDbxIPOl/yxtNdw/io2aNYhEKTQ6LtXot9MjnEqnb1Xzjlz7XcLXjFqGJpoD2FA4UamnZUe1YD5zmGD5AvjjCUXMERCPDHIOE00ktQInl/p8FAd6kzvyOVoA0iA/uoXe9QR41xidql1JMKQ2m+6N6GGRjggR28vYBVsmPpm3r4sA5NKK4O7pItKSPzQKKrCoPXrA3almrd+Aqnb+j6DwTKHQUtpRmLyVYYF8BYkrMtyFfke4p3WhITr+WowmKyDQkdoefI4ef+ekuzwPzA5TmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=c4Q/H+LUKl/MeEEFKdX/pqszdJ3bsPKTYTYrnaIVz7E=;
 b=DE3fGyhuHLc6CxwLFV6pVX6HmURNZxGZ2sNs9nyROJhUEnH+7k10ta6wh4+9+f3KCcc5QwD1zCq/4fX/CwwaIU+is/Ty7cnLZ7oxYlCjmJab98xPz1buqWk33LrJKg3vJmMRsa/QemOoXeJlZSXpWT8hI6QNxlqa+9OoycHhv4hpm2r6uBkGTY/2dBBQ1kaA5afljpn7DRkOgwQn0rwiZMZCF6xo2mfHaTiSOkxp3KbSrAf1yofJsMyFF5WXwIbWbItEHlkTNrXSc2iY2FDhzu+Fy4sh1AOCiYOjPvz5ampHXx4aC+7gqO506RerAdhB+DSl06r91aIYeJ79kWKZNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO8P123MB7811.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:3d4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 13:25:33 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%5]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 13:25:33 +0000
From: Aaron Tomlin <atomlin@atomlin.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: paulmck@kernel.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	zhanxusheng1024@gmail.com,
	neelx@suse.com,
	atomlin@atomlin.com,
	chjohnst@mail.com,
	mproche@mail.com,
	sean@ashe.io,
	steve@abita.co,
	rishil1999@outlook.com,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v9 tip/sched/core 1/6] sched: Annotate rq->rd with __rcu and update lockless readers
Date: Thu, 29 Oct 2026 09:25:06 -0400
Message-ID: <20261029132511.712391-2-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029132511.712391-1-atomlin@atomlin.com>
References: <20261029132511.712391-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0252.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::11) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
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
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO8P123MB7811:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f2496e2-58f9-4b57-7ec9-08df35c01c05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|5023799004|56012099006|261009223027099003|261022075727099003|261026121527099003|261028144727099003|261026140227099003|10067099003|261021121427099003|261022105027099003|261021135927099003|261021123027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	AdoW4yhmRiHqamjA2LVNWbdHyhN3JpcMIwmTtRNE3JZ5aZEmb3gWEZV0Db1DIM+oi9CjramYFveqaX0cJTOKI1v/fDwsJLKAe3o+dhrfDd8sfebxM2ARqnX8j3y4LSzkL49FKzfVyRDNJ1+i9MsFwtoJOvire4IE8USikhogONUZq9oEBbfeVYLF7vnn59NvtMaMMhEc2E6KGpvT73gwgwIrtrszJVJoQZDzXtC2Bp+XHwtcpps/pH8wkOm4iuXzL/g3J1FMQCnR32Pb3kzuIi5iMfgE/N76W9tw+0Ja7DYSHVkK6+47U7J8U2S6FCLoL/S6geOY1G0utDapU2FE4LqH/+PaNA4s5inJywQ4o9KC/VCAHUVF8yQjNoEA6eLjra9Tm6Xii+FqidBPVjbxx8yBPKrBQ09qSWf7UmPs+S7D7ZFe6tHPNGm5OLbrDK/UBJ1VT3J1VT/efFTdv9hz4ub3RshWFwwYlqB2/qLRAXWhncUKcRB51GT5RObmc1sVn8mSzSVIuxA4eLRcU0PLInqBbhfnmlTpk3v05fHRkAtVuDUbU9fz/yZRCEUctenYrRteggKJepS9rf6bgpLQqAlM95B1hpWGVMTXFMjD/k15PTFCzXE64JP9IolNmlIAoWEPEzmGOVa33vJk8NOAZl473wulnnkgDDs2o5pPKBY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(5023799004)(56012099006)(261009223027099003)(261022075727099003)(261026121527099003)(261028144727099003)(261026140227099003)(10067099003)(261021121427099003)(261022105027099003)(261021135927099003)(261021123027099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1+GLPJcvGHWRtHUJdg9ABqEL2AeFAjkuRZKEXsc+BKvVspSrnuERRIqnTrVE?=
 =?us-ascii?Q?nJ+wzq4SnZVT0ERfSIrfbbaBeosD3+S3snpMDJhbMP0mgFAEGQ58ffd3x0Dm?=
 =?us-ascii?Q?A0XE+iYY6/IrKTvvRUUis66urJFNIGE3/vDUQhXIWxxqJgDxLGd1XLllGG/l?=
 =?us-ascii?Q?B0corY97sSAyo/vZLxfgXNZW94zPPs5ENuFjGMuiz+QRVzkYqCYF+6qRuG/u?=
 =?us-ascii?Q?c55cnMI+HfAHbbM+6SRv8HIdVq/EWZZSgBpwnXCVU2vBZag/JDWj2DtpOcDR?=
 =?us-ascii?Q?y59oT6GsuwsJ9f1epriVMzwprQfJch32ZoBtBLRymGC89xgk+LqD4StISYoa?=
 =?us-ascii?Q?G/O/yOzbhS41GUxzjlPQRFrxq76HtXMxzUrWGpR6rQAgOZMTWUlog/Rpansq?=
 =?us-ascii?Q?Jyi8xMd1Ms3EuM+2Qi4bgalUzxIKSVfFBoFAnYKueL5pc/5GxDFRTLYQrAgs?=
 =?us-ascii?Q?w/sXshPTZRVQrhzWGuuc+JZ7lJEUY3VeXRvPHRQp6w4+MYOGGz9zlhMUUfXt?=
 =?us-ascii?Q?JIX4mH/hrh6cPdyZIJOilKP7h9G4zfzsqdoBDkjPXdwdBDczx7yWUtJtRIef?=
 =?us-ascii?Q?sdaskKD2iavC2mLQpeo55CpX47c2lTxZxnmUBniMjlkMzhEovU/mfzDay18p?=
 =?us-ascii?Q?kI4IcLiXtZIYpQ9m0IJcjmY1bDK0iBw5VVYAGNvq1WsrgKqMUbrOcD0G1hGc?=
 =?us-ascii?Q?TCoCUeVXQFt+1SJ6uSJhV3G+i/wz6Avj+licLgX8lNBALn8IFLDPI+PJyBfT?=
 =?us-ascii?Q?GsOj/TKEAXBxjqMuPpS6CmI4UBgfNLoyjNC3/vR9XczPc4Y+S5GQl7Ned302?=
 =?us-ascii?Q?BBng6t7Qh7pcZ8MoNePTlhi8tMgXywvbzkPJI8jBwIoEFN9jlTiJ/Mugn/qQ?=
 =?us-ascii?Q?4UFWrzuyFJr///uXngYOhLbRYtgQ8X1Yfd7czdznIkank7vLv5WknVn39PtM?=
 =?us-ascii?Q?9ksTMicuzw2fdcDpeWiepivcoOo8gJYE20irv8APNQAI3YhfbX3V5vyxamBC?=
 =?us-ascii?Q?4BwbK8fixFWFCpyrs18msf4giRk7IJMxax69h6beUeLuxaC8vO6ccLU3DpgR?=
 =?us-ascii?Q?QEsPSIc6fA+BicjZ/Sk5CEF3T8lrI49KfPYmIqPvwenQiJ/5QsfQ1GvcIbst?=
 =?us-ascii?Q?OJX17cko4jpq5y5iUOfr7kQjpDwwc42Rr9rj3WPf9AAvSVbCyoqkRtHvJo8p?=
 =?us-ascii?Q?MkgK17+TPGWFqvgKRuqZrocC5o7jkDlQNrR4RjrAtUyveioaNukoMFzM/6hc?=
 =?us-ascii?Q?HyQGIvWB93s6vo0Mj+RVmo393euoqJgn7HdQ0UVPmlieIsqF2aLB30xp7mmG?=
 =?us-ascii?Q?7160kBQ6vs3Mld6ZJSg0Hdo7HxEadBra/evtfe9lmrloiTFjNpIUZ4+Qy/NY?=
 =?us-ascii?Q?ZLfZZm2kqmt9n+YkSt0orBfqVdscSwSav1xreLehkpb5rYiwFV7nXyPPJLT+?=
 =?us-ascii?Q?zNIM0/zcFPhn7oV7LtaqwSp7sX8OmtfCMfi7JJ6yHkeRD7tW5pbjB7X/7809?=
 =?us-ascii?Q?wO/CcAGCi3RqRIigcGRwXnNBlnQM+4kdqUPWTvsS6uo5wqFLHFg+oaSTedzO?=
 =?us-ascii?Q?ZqXG4CbCP9TVfh4Ul2bDr8dDKhblVxbY4nzBL0tW2wuVt3XlWfGY1SPWJhDY?=
 =?us-ascii?Q?GAoLg3ZzFy0qyCAh6XJn3uOqb0hoNepfFrzPKDGQBbaJIMGHmOuorDvUa/fz?=
 =?us-ascii?Q?va/7MVYFzGOQ/0r3Wg7NL2X3tJr/FYudvO2F2iybw2144YA0oTmq/x9rEDaH?=
 =?us-ascii?Q?IyKZgTtYNQ=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f2496e2-58f9-4b57-7ec9-08df35c01c05
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 13:25:33.2162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Qdm9pYzlkvpltqW4l8SVS7P16NuGUAyuiONtTt6OYgPoUhSYjFb51J37ssjGQ5d4kkqo4RIKqcsF9FVyz1vNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO8P123MB7811

The root_domain pointer rd field in struct rq is updated dynamically
using RCU, and its memory reclamation is deferred via call_rcu() in
rq_attach_root(). However, struct rq's rd field was missing the __rcu
compiler annotation, and several lockless readers across the scheduler
subsystem accessed rq->rd directly without using RCU dereference
primitives.

Add the __rcu annotation to struct rq's rd field. For code clarity,
introduce the rcu_dereference_root_domain() helper macro to validate
access under sched_domains_mutex or active RCU-sched read-side critical
sections. While mechanically identical to
rcu_dereference_sched_domain(), defining rcu_dereference_root_domain()
preserves the natural symmetry of rq->rd and rq->sd in struct rq, while
keeping grep-ability straightforward. Update readers and accessors
across kernel/sched/ to use rcu_dereference_root_domain().

This ensures proper memory ordering, enables Sparse static analysis
validation, and avoids false Lockdep warnings under CONFIG_PROVE_RCU.

Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
---
 kernel/sched/core.c     | 24 ++++++++-----
 kernel/sched/deadline.c | 77 ++++++++++++++++++++++-------------------
 kernel/sched/fair.c     | 27 +++++++++------
 kernel/sched/rt.c       | 64 +++++++++++++++++++---------------
 kernel/sched/sched.h    |  7 ++--
 kernel/sched/syscalls.c |  8 ++---
 kernel/sched/topology.c | 11 +++---
 7 files changed, 126 insertions(+), 92 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index d7c3b43158de..4ead07fd0f6d 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8542,8 +8542,10 @@ void set_rq_online(struct rq *rq)
 {
 	if (!rq->online) {
 		const struct sched_class *class;
+		struct root_domain *rd;
 
-		cpumask_set_cpu(rq->cpu, rq->rd->online);
+		rd = rcu_dereference_root_domain(rq->rd);
+		cpumask_set_cpu(rq->cpu, rd->online);
 		rq->online = 1;
 
 		for_each_class(class) {
@@ -8557,6 +8559,7 @@ void set_rq_offline(struct rq *rq)
 {
 	if (rq->online) {
 		const struct sched_class *class;
+		struct root_domain *rd;
 
 		update_rq_clock(rq);
 		for_each_class(class) {
@@ -8564,7 +8567,8 @@ void set_rq_offline(struct rq *rq)
 				class->rq_offline(rq);
 		}
 
-		cpumask_clear_cpu(rq->cpu, rq->rd->online);
+		rd = rcu_dereference_root_domain(rq->rd);
+		cpumask_clear_cpu(rq->cpu, rd->online);
 		rq->online = 0;
 	}
 }
@@ -8572,10 +8576,12 @@ void set_rq_offline(struct rq *rq)
 static inline void sched_set_rq_online(struct rq *rq, int cpu)
 {
 	struct rq_flags rf;
+	struct root_domain *rd;
 
 	rq_lock_irqsave(rq, &rf);
-	if (rq->rd) {
-		BUG_ON(!cpumask_test_cpu(cpu, rq->rd->span));
+	rd = rcu_dereference_root_domain(rq->rd);
+	if (rd) {
+		BUG_ON(!cpumask_test_cpu(cpu, rd->span));
 		set_rq_online(rq);
 	}
 	rq_unlock_irqrestore(rq, &rf);
@@ -8584,10 +8590,12 @@ static inline void sched_set_rq_online(struct rq *rq, int cpu)
 static inline void sched_set_rq_offline(struct rq *rq, int cpu)
 {
 	struct rq_flags rf;
+	struct root_domain *rd;
 
 	rq_lock_irqsave(rq, &rf);
-	if (rq->rd) {
-		BUG_ON(!cpumask_test_cpu(cpu, rq->rd->span));
+	rd = rcu_dereference_root_domain(rq->rd);
+	if (rd) {
+		BUG_ON(!cpumask_test_cpu(cpu, rd->span));
 		set_rq_offline(rq);
 	}
 	rq_unlock_irqrestore(rq, &rf);
@@ -9009,8 +9017,8 @@ void __init sched_init(void)
 #endif
 		rq->next_class = &idle_sched_class;
 
-		rq->sd = NULL;
-		rq->rd = NULL;
+		RCU_INIT_POINTER(rq->sd, NULL);
+		RCU_INIT_POINTER(rq->rd, NULL);
 		rq->cpu_capacity = SCHED_CAPACITY_SCALE;
 		rq->balance_callback = &balance_push_callback;
 		rq->active_balance = 0;
diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index c0ebdcde5fe5..2dcb3722c317 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -122,12 +122,12 @@ static inline struct dl_bw *dl_bw_of(int i)
 {
 	RCU_LOCKDEP_WARN(!rcu_read_lock_sched_held(),
 			 "sched RCU must be held");
-	return &cpu_rq(i)->rd->dl_bw;
+	return &rcu_dereference_root_domain(cpu_rq(i)->rd)->dl_bw;
 }
 
 static inline int dl_bw_cpus(int i)
 {
-	struct root_domain *rd = cpu_rq(i)->rd;
+	struct root_domain *rd = rcu_dereference_root_domain(cpu_rq(i)->rd);
 
 	RCU_LOCKDEP_WARN(!rcu_read_lock_sched_held(),
 			 "sched RCU must be held");
@@ -156,16 +156,13 @@ static inline unsigned long dl_bw_capacity(int i)
 	    arch_scale_cpu_capacity(i) == SCHED_CAPACITY_SCALE) {
 		return dl_bw_cpus(i) << SCHED_CAPACITY_SHIFT;
 	} else {
-		RCU_LOCKDEP_WARN(!rcu_read_lock_sched_held(),
-				 "sched RCU must be held");
-
-		return __dl_bw_capacity(cpu_rq(i)->rd->span);
+		return __dl_bw_capacity(rcu_dereference_root_domain(cpu_rq(i)->rd)->span);
 	}
 }
 
 bool dl_bw_visited(int cpu, u64 cookie)
 {
-	struct root_domain *rd = cpu_rq(cpu)->rd;
+	struct root_domain *rd = rcu_dereference_root_domain(cpu_rq(cpu)->rd);
 
 	if (rd->visit_cookie == cookie)
 		return true;
@@ -533,15 +530,18 @@ void init_dl_rq(struct dl_rq *dl_rq)
 
 static inline int dl_overloaded(struct rq *rq)
 {
-	return atomic_read(&rq->rd->dlo_count);
+	return atomic_read(&rcu_dereference_root_domain(rq->rd)->dlo_count);
 }
 
 static inline void dl_set_overload(struct rq *rq)
 {
+	struct root_domain *rd;
+
 	if (!rq->online)
 		return;
 
-	cpumask_set_cpu(rq->cpu, rq->rd->dlo_mask);
+	rd = rcu_dereference_root_domain(rq->rd);
+	cpumask_set_cpu(rq->cpu, rd->dlo_mask);
 	/*
 	 * Must be visible before the overload count is
 	 * set (as in sched_rt.c).
@@ -549,16 +549,19 @@ static inline void dl_set_overload(struct rq *rq)
 	 * Matched by the barrier in pull_dl_task().
 	 */
 	smp_wmb();
-	atomic_inc(&rq->rd->dlo_count);
+	atomic_inc(&rd->dlo_count);
 }
 
 static inline void dl_clear_overload(struct rq *rq)
 {
+	struct root_domain *rd;
+
 	if (!rq->online)
 		return;
 
-	atomic_dec(&rq->rd->dlo_count);
-	cpumask_clear_cpu(rq->cpu, rq->rd->dlo_mask);
+	rd = rcu_dereference_root_domain(rq->rd);
+	atomic_dec(&rd->dlo_count);
+	cpumask_clear_cpu(rq->cpu, rd->dlo_mask);
 }
 
 #define __node_2_pdl(node) \
@@ -699,14 +702,15 @@ static struct rq *dl_task_offline_migration(struct rq *rq, struct task_struct *p
 	 * since p is still hanging out in the old (now moved to default) root
 	 * domain.
 	 */
-	dl_b = &rq->rd->dl_bw;
+	dl_b = &rcu_dereference_root_domain(rq->rd)->dl_bw;
 	raw_spin_lock(&dl_b->lock);
-	__dl_sub(dl_b, p->dl.dl_bw, cpumask_weight(rq->rd->span));
+	__dl_sub(dl_b, p->dl.dl_bw, cpumask_weight(rcu_dereference_root_domain(rq->rd)->span));
 	raw_spin_unlock(&dl_b->lock);
 
-	dl_b = &later_rq->rd->dl_bw;
+	dl_b = &rcu_dereference_root_domain(later_rq->rd)->dl_bw;
 	raw_spin_lock(&dl_b->lock);
-	__dl_add(dl_b, p->dl.dl_bw, cpumask_weight(later_rq->rd->span));
+	__dl_add(dl_b, p->dl.dl_bw,
+		 cpumask_weight(rcu_dereference_root_domain(later_rq->rd)->span));
 	raw_spin_unlock(&dl_b->lock);
 
 	set_task_cpu(p, later_rq->cpu);
@@ -2222,9 +2226,10 @@ static void inc_dl_deadline(struct dl_rq *dl_rq, u64 deadline)
 	if (dl_rq->earliest_dl.curr == 0 ||
 	    dl_time_before(deadline, dl_rq->earliest_dl.curr)) {
 		if (dl_rq->earliest_dl.curr == 0)
-			cpupri_set(&rq->rd->cpupri, rq->cpu, CPUPRI_HIGHER);
+			cpupri_set(&rcu_dereference_root_domain(rq->rd)->cpupri, rq->cpu,
+				   CPUPRI_HIGHER);
 		dl_rq->earliest_dl.curr = deadline;
-		cpudl_set(&rq->rd->cpudl, rq->cpu, deadline);
+		cpudl_set(&rcu_dereference_root_domain(rq->rd)->cpudl, rq->cpu, deadline);
 	}
 }
 
@@ -2239,14 +2244,15 @@ static void dec_dl_deadline(struct dl_rq *dl_rq, u64 deadline)
 	if (!dl_rq->dl_nr_running) {
 		dl_rq->earliest_dl.curr = 0;
 		dl_rq->earliest_dl.next = 0;
-		cpudl_clear(&rq->rd->cpudl, rq->cpu, rq->online);
-		cpupri_set(&rq->rd->cpupri, rq->cpu, rq->rt.highest_prio.curr);
+		cpudl_clear(&rcu_dereference_root_domain(rq->rd)->cpudl, rq->cpu, rq->online);
+		cpupri_set(&rcu_dereference_root_domain(rq->rd)->cpupri, rq->cpu,
+			   rq->rt.highest_prio.curr);
 	} else {
 		struct rb_node *leftmost = rb_first_cached(&dl_rq->root);
 		struct sched_dl_entity *entry = __node_2_dle(leftmost);
 
 		dl_rq->earliest_dl.curr = entry->deadline;
-		cpudl_set(&rq->rd->cpudl, rq->cpu, entry->deadline);
+		cpudl_set(&rcu_dereference_root_domain(rq->rd)->cpudl, rq->cpu, entry->deadline);
 	}
 }
 
@@ -2686,12 +2692,14 @@ static void migrate_task_rq_dl(struct task_struct *p, int new_cpu __maybe_unused
 
 static void check_preempt_equal_dl(struct rq *rq, struct task_struct *p)
 {
+	struct root_domain *rd = rcu_dereference_root_domain(rq->rd);
+
 	/*
 	 * Current can't be migrated, useless to reschedule,
 	 * let's hope p can move out.
 	 */
 	if (rq->curr->nr_cpus_allowed == 1 ||
-	    !cpudl_find(&rq->rd->cpudl, rq->donor, NULL))
+	    !cpudl_find(&rd->cpudl, rq->donor, NULL))
 		return;
 
 	/*
@@ -2699,7 +2707,7 @@ static void check_preempt_equal_dl(struct rq *rq, struct task_struct *p)
 	 * see if it is pushed or pulled somewhere else.
 	 */
 	if (p->nr_cpus_allowed != 1 &&
-	    cpudl_find(&rq->rd->cpudl, p, NULL))
+	    cpudl_find(&rd->cpudl, p, NULL))
 		return;
 
 	resched_curr(rq);
@@ -2951,7 +2959,7 @@ static int find_later_rq(struct task_struct *task)
 	 * We have to consider system topology and task affinity
 	 * first, then we can look for a suitable CPU.
 	 */
-	if (!cpudl_find(&task_rq(task)->rd->cpudl, task, later_mask))
+	if (!cpudl_find(&rcu_dereference_root_domain(task_rq(task)->rd)->cpudl, task, later_mask))
 		return -1;
 
 	/*
@@ -3235,7 +3243,7 @@ static void pull_dl_task(struct rq *this_rq)
 	 */
 	smp_rmb();
 
-	for_each_cpu(cpu, this_rq->rd->dlo_mask) {
+	for_each_cpu(cpu, rcu_dereference_root_domain(this_rq->rd)->dlo_mask) {
 		if (this_cpu == cpu)
 			continue;
 
@@ -3358,10 +3366,8 @@ static void set_cpus_allowed_dl(struct task_struct *p,
 bool dl_task_needs_bw_move(struct task_struct *p,
 			   const struct cpumask *new_mask)
 {
-	if (!dl_task(p))
-		return false;
-
-	return !cpumask_intersects(task_rq(p)->rd->span, new_mask);
+	guard(rcu)();
+	return !cpumask_intersects(rcu_dereference_root_domain(task_rq(p)->rd)->span, new_mask);
 }
 
 /* Assumes rq->lock is held */
@@ -3371,9 +3377,10 @@ static void rq_online_dl(struct rq *rq)
 		dl_set_overload(rq);
 
 	if (rq->dl.dl_nr_running > 0)
-		cpudl_set(&rq->rd->cpudl, rq->cpu, rq->dl.earliest_dl.curr);
+		cpudl_set(&rcu_dereference_root_domain(rq->rd)->cpudl, rq->cpu,
+			  rq->dl.earliest_dl.curr);
 	else
-		cpudl_clear(&rq->rd->cpudl, rq->cpu, true);
+		cpudl_clear(&rcu_dereference_root_domain(rq->rd)->cpudl, rq->cpu, true);
 }
 
 /* Assumes rq->lock is held */
@@ -3382,7 +3389,7 @@ static void rq_offline_dl(struct rq *rq)
 	if (rq->dl.overloaded)
 		dl_clear_overload(rq);
 
-	cpudl_clear(&rq->rd->cpudl, rq->cpu, false);
+	cpudl_clear(&rcu_dereference_root_domain(rq->rd)->cpudl, rq->cpu, false);
 }
 
 void __init init_sched_dl_class(void)
@@ -3443,10 +3450,10 @@ void dl_add_task_root_domain(struct task_struct *p)
 	cpu = cpumask_first_and(cpu_active_mask, msk);
 	BUG_ON(cpu >= nr_cpu_ids);
 	rq = cpu_rq(cpu);
-	dl_b = &rq->rd->dl_bw;
+	dl_b = &rcu_dereference_root_domain(rq->rd)->dl_bw;
 
 	raw_spin_lock(&dl_b->lock);
-	__dl_add(dl_b, p->dl.dl_bw, cpumask_weight(rq->rd->span));
+	__dl_add(dl_b, p->dl.dl_bw, cpumask_weight(rcu_dereference_root_domain(rq->rd)->span));
 	raw_spin_unlock(&dl_b->lock);
 	raw_spin_unlock_irqrestore(&p->pi_lock, rf.flags);
 }
@@ -3507,7 +3514,7 @@ void dl_clear_root_domain(struct root_domain *rd)
 
 void dl_clear_root_domain_cpu(int cpu)
 {
-	dl_clear_root_domain(cpu_rq(cpu)->rd);
+	dl_clear_root_domain(rcu_dereference_root_domain(cpu_rq(cpu)->rd));
 }
 
 static void switched_from_dl(struct rq *rq, struct task_struct *p)
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 0feec172fd37..201864ef8c61 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8043,13 +8043,14 @@ static inline void set_rd_overutilized(struct root_domain *rd, bool flag)
 
 static inline void check_update_overutilized_status(struct rq *rq)
 {
+	struct root_domain *rd = rcu_dereference_root_domain(rq->rd);
+
 	/*
 	 * overutilized field is used for load balancing decisions only
 	 * if energy aware scheduler is being used
 	 */
-
-	if (!is_rd_overutilized(rq->rd) && cpu_overutilized(rq->cpu))
-		set_rd_overutilized(rq->rd, 1);
+	if (rd && !is_rd_overutilized(rd) && cpu_overutilized(rq->cpu))
+		set_rd_overutilized(rd, 1);
 }
 
 /* Runqueue only has SCHED_IDLE tasks enqueued */
@@ -9721,7 +9722,7 @@ static int find_energy_efficient_cpu(struct task_struct *p, int prev_cpu)
 	unsigned long prev_delta = ULONG_MAX, best_delta = ULONG_MAX;
 	unsigned long p_util_min = uclamp_is_used() ? uclamp_eff_value(p, UCLAMP_MIN) : 0;
 	unsigned long p_util_max = uclamp_is_used() ? uclamp_eff_value(p, UCLAMP_MAX) : 1024;
-	struct root_domain *rd = this_rq()->rd;
+	struct root_domain *rd = rcu_dereference_root_domain(this_rq()->rd);
 	int cpu, best_energy_cpu, target = -1;
 	int prev_fits = -1, best_fits = -1;
 	unsigned long best_actual_cap = 0;
@@ -9925,7 +9926,7 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
 		    cpumask_test_cpu(cpu, p->cpus_ptr))
 			return cpu;
 
-		if (!is_rd_overutilized(this_rq()->rd)) {
+		if (!is_rd_overutilized(rcu_dereference_root_domain(this_rq()->rd))) {
 			new_cpu = find_energy_efficient_cpu(p, prev_cpu);
 			if (new_cpu >= 0)
 				return new_cpu;
@@ -12974,13 +12975,15 @@ static inline void update_sd_lb_stats(struct lb_env *env, struct sd_lb_stats *sd
 		env->fbq_type = fbq_classify_group(&sds->busiest_stat);
 
 	if (!env->sd->parent) {
+		struct root_domain *rd = rcu_dereference_root_domain(env->dst_rq->rd);
+
 		/* update overload indicator if we are at root domain */
-		set_rd_overloaded(env->dst_rq->rd, sg_overloaded);
+		set_rd_overloaded(rd, sg_overloaded);
 
 		/* Update over-utilization (tipping point, U >= 0) indicator */
-		set_rd_overutilized(env->dst_rq->rd, sg_overutilized);
+		set_rd_overutilized(rd, sg_overutilized);
 	} else if (sg_overutilized) {
-		set_rd_overutilized(env->dst_rq->rd, sg_overutilized);
+		set_rd_overutilized(rcu_dereference_root_domain(env->dst_rq->rd), sg_overutilized);
 	}
 
 	update_idle_cpu_scan(env, sum_util);
@@ -13226,8 +13229,10 @@ static struct sched_group *sched_balance_find_src_group(struct lb_env *env)
 	if (busiest->group_type == group_misfit_task)
 		goto force_balance;
 
-	if (!is_rd_overutilized(env->dst_rq->rd) &&
-	    rcu_dereference_all(env->dst_rq->rd->pd))
+	struct root_domain *rd = rcu_dereference_root_domain(env->dst_rq->rd);
+
+	if (rd && !is_rd_overutilized(rd) &&
+	    rcu_dereference_all(rd->pd))
 		goto out_balanced;
 
 	/* ASYM feature bypasses nice load balance check */
@@ -14879,7 +14884,7 @@ static int sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
 	if (!sd)
 		goto out;
 
-	if (!get_rd_overloaded(this_rq->rd) ||
+	if (!get_rd_overloaded(rcu_dereference_root_domain(this_rq->rd)) ||
 	    this_rq->avg_idle < sd->max_newidle_lb_cost) {
 
 		update_next_balance(sd, &next_balance);
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 1535046a23ff..7ee86b65bf05 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -338,15 +338,18 @@ static inline bool need_pull_rt_task(struct rq *rq, struct task_struct *prev)
 
 static inline int rt_overloaded(struct rq *rq)
 {
-	return atomic_read(&rq->rd->rto_count);
+	return atomic_read(&rcu_dereference_root_domain(rq->rd)->rto_count);
 }
 
 static inline void rt_set_overload(struct rq *rq)
 {
+	struct root_domain *rd;
+
 	if (!rq->online)
 		return;
 
-	cpumask_set_cpu(rq->cpu, rq->rd->rto_mask);
+	rd = rcu_dereference_root_domain(rq->rd);
+	cpumask_set_cpu(rq->cpu, rd->rto_mask);
 	/*
 	 * Make sure the mask is visible before we set
 	 * the overload count. That is checked to determine
@@ -357,17 +360,20 @@ static inline void rt_set_overload(struct rq *rq)
 	 * Matched by the barrier in pull_rt_task().
 	 */
 	smp_wmb();
-	atomic_inc(&rq->rd->rto_count);
+	atomic_inc(&rd->rto_count);
 }
 
 static inline void rt_clear_overload(struct rq *rq)
 {
+	struct root_domain *rd;
+
 	if (!rq->online)
 		return;
 
+	rd = rcu_dereference_root_domain(rq->rd);
 	/* the order here really doesn't matter */
-	atomic_dec(&rq->rd->rto_count);
-	cpumask_clear_cpu(rq->cpu, rq->rd->rto_mask);
+	atomic_dec(&rd->rto_count);
+	cpumask_clear_cpu(rq->cpu, rd->rto_mask);
 }
 
 static inline int has_pushable_tasks(struct rq *rq)
@@ -580,7 +586,7 @@ static int rt_se_boosted(struct sched_rt_entity *rt_se)
 
 static inline const struct cpumask *sched_rt_period_mask(void)
 {
-	return this_rq()->rd->span;
+	return rcu_dereference_root_domain(this_rq()->rd)->span;
 }
 
 static inline
@@ -608,7 +614,7 @@ bool sched_rt_bandwidth_account(struct rt_rq *rt_rq)
 static void do_balance_runtime(struct rt_rq *rt_rq)
 {
 	struct rt_bandwidth *rt_b = sched_rt_bandwidth(rt_rq);
-	struct root_domain *rd = rq_of_rt_rq(rt_rq)->rd;
+	struct root_domain *rd = rcu_dereference_root_domain(rq_of_rt_rq(rt_rq)->rd);
 	int i, weight;
 	u64 rt_period;
 
@@ -659,7 +665,7 @@ static void do_balance_runtime(struct rt_rq *rt_rq)
  */
 static void __disable_runtime(struct rq *rq)
 {
-	struct root_domain *rd = rq->rd;
+	struct root_domain *rd = rcu_dereference_root_domain(rq->rd);
 	rt_rq_iter_t iter;
 	struct rt_rq *rt_rq;
 
@@ -1058,7 +1064,7 @@ inc_rt_prio_smp(struct rt_rq *rt_rq, int prio, int prev_prio)
 		return;
 
 	if (rq->online && prio < prev_prio)
-		cpupri_set(&rq->rd->cpupri, rq->cpu, prio);
+		cpupri_set(&rcu_dereference_root_domain(rq->rd)->cpupri, rq->cpu, prio);
 }
 
 static void
@@ -1073,7 +1079,8 @@ dec_rt_prio_smp(struct rt_rq *rt_rq, int prio, int prev_prio)
 		return;
 
 	if (rq->online && rt_rq->highest_prio.curr != prev_prio)
-		cpupri_set(&rq->rd->cpupri, rq->cpu, rt_rq->highest_prio.curr);
+		cpupri_set(&rcu_dereference_root_domain(rq->rd)->cpupri, rq->cpu,
+			   rt_rq->highest_prio.curr);
 }
 
 static void
@@ -1575,8 +1582,10 @@ select_task_rq_rt(struct task_struct *p, int cpu, int flags)
 
 static void check_preempt_equal_prio(struct rq *rq, struct task_struct *p)
 {
+	struct root_domain *rd = rcu_dereference_root_domain(rq->rd);
+
 	if (rq->curr->nr_cpus_allowed == 1 ||
-	    !cpupri_find(&rq->rd->cpupri, rq->donor, NULL))
+	    !cpupri_find(&rd->cpupri, rq->donor, NULL))
 		return;
 
 	/*
@@ -1584,7 +1593,7 @@ static void check_preempt_equal_prio(struct rq *rq, struct task_struct *p)
 	 * see if it is pushed or pulled somewhere else.
 	 */
 	if (p->nr_cpus_allowed != 1 &&
-	    cpupri_find(&rq->rd->cpupri, p, NULL))
+	    cpupri_find(&rd->cpupri, p, NULL))
 		return;
 
 	/*
@@ -1796,12 +1805,12 @@ static int find_lowest_rq(struct task_struct *task)
 	 */
 	if (sched_asym_cpucap_active()) {
 
-		ret = cpupri_find_fitness(&task_rq(task)->rd->cpupri,
+		ret = cpupri_find_fitness(&rcu_dereference_root_domain(task_rq(task)->rd)->cpupri,
 					  task, lowest_mask,
 					  rt_task_fits_capacity);
 	} else {
 
-		ret = cpupri_find(&task_rq(task)->rd->cpupri,
+		ret = cpupri_find(&rcu_dereference_root_domain(task_rq(task)->rd)->cpupri,
 				  task, lowest_mask);
 	}
 
@@ -2192,16 +2201,17 @@ static inline void rto_start_unlock(atomic_t *v)
 
 static void tell_cpu_to_push(struct rq *rq)
 {
+	struct root_domain *rd = rcu_dereference_root_domain(rq->rd);
 	int cpu = -1;
 
 	/* Keep the loop going if the IPI is currently active */
-	atomic_inc(&rq->rd->rto_loop_next);
+	atomic_inc(&rd->rto_loop_next);
 
 	/* Only one CPU can initiate a loop at a time */
-	if (!rto_start_trylock(&rq->rd->rto_loop_start))
+	if (!rto_start_trylock(&rd->rto_loop_start))
 		return;
 
-	raw_spin_lock(&rq->rd->rto_lock);
+	raw_spin_lock(&rd->rto_lock);
 
 	/*
 	 * The rto_cpu is updated under the lock, if it has a valid CPU
@@ -2209,17 +2219,17 @@ static void tell_cpu_to_push(struct rq *rq)
 	 * update to loop_next, and nothing needs to be done here.
 	 * Otherwise it is finishing up and an IPI needs to be sent.
 	 */
-	if (rq->rd->rto_cpu < 0)
-		cpu = rto_next_cpu(rq->rd);
+	if (rd->rto_cpu < 0)
+		cpu = rto_next_cpu(rd);
 
-	raw_spin_unlock(&rq->rd->rto_lock);
+	raw_spin_unlock(&rd->rto_lock);
 
-	rto_start_unlock(&rq->rd->rto_loop_start);
+	rto_start_unlock(&rd->rto_loop_start);
 
 	if (cpu >= 0) {
 		/* Make sure the rd does not get freed while pushing */
-		sched_get_rd(rq->rd);
-		irq_work_queue_on(&rq->rd->rto_push_work, cpu);
+		sched_get_rd(rd);
+		irq_work_queue_on(&rd->rto_push_work, cpu);
 	}
 }
 
@@ -2280,7 +2290,7 @@ static void pull_rt_task(struct rq *this_rq)
 
 	/* If we are the only overloaded CPU do nothing */
 	if (rt_overload_count == 1 &&
-	    cpumask_test_cpu(this_rq->cpu, this_rq->rd->rto_mask))
+	    cpumask_test_cpu(this_rq->cpu, rcu_dereference_root_domain(this_rq->rd)->rto_mask))
 		return;
 
 #ifdef HAVE_RT_PUSH_IPI
@@ -2290,7 +2300,7 @@ static void pull_rt_task(struct rq *this_rq)
 	}
 #endif
 
-	for_each_cpu(cpu, this_rq->rd->rto_mask) {
+	for_each_cpu(cpu, rcu_dereference_root_domain(this_rq->rd)->rto_mask) {
 		if (this_cpu == cpu)
 			continue;
 
@@ -2395,7 +2405,7 @@ static void rq_online_rt(struct rq *rq)
 
 	__enable_runtime(rq);
 
-	cpupri_set(&rq->rd->cpupri, rq->cpu, rq->rt.highest_prio.curr);
+	cpupri_set(&rcu_dereference_root_domain(rq->rd)->cpupri, rq->cpu, rq->rt.highest_prio.curr);
 }
 
 /* Assumes rq->lock is held */
@@ -2406,7 +2416,7 @@ static void rq_offline_rt(struct rq *rq)
 
 	__disable_runtime(rq);
 
-	cpupri_set(&rq->rd->cpupri, rq->cpu, CPUPRI_INVALID);
+	cpupri_set(&rcu_dereference_root_domain(rq->rd)->cpupri, rq->cpu, CPUPRI_INVALID);
 }
 
 /*
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 7d2ec527b8a2..6607963efa30 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1277,7 +1277,7 @@ struct rq {
 	int membarrier_state;
 #endif
 
-	struct root_domain		*rd;
+	struct root_domain __rcu	*rd;
 	struct sched_domain __rcu	*sd;
 
 	struct balance_callback *balance_callback;
@@ -2167,6 +2167,9 @@ queue_balance_callback(struct rq *rq,
 	rq->balance_callback = head;
 }
 
+#define rcu_dereference_root_domain(p) \
+	rcu_dereference_all_check((p), lockdep_is_held(&sched_domains_mutex))
+
 #define rcu_dereference_sched_domain(p) \
 	rcu_dereference_all_check((p), lockdep_is_held(&sched_domains_mutex))
 
@@ -3083,7 +3086,7 @@ static inline void add_nr_running(struct rq *rq, unsigned count)
 	}
 
 	if (prev_nr < 2 && rq->nr_running >= 2)
-		set_rd_overloaded(rq->rd, 1);
+		set_rd_overloaded(rcu_dereference_root_domain(rq->rd), 1);
 
 	sched_update_tick_dependency(rq);
 }
diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
index b215b0ead9a6..89a2465727fd 100644
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -621,15 +621,15 @@ int __sched_setscheduler(struct task_struct *p,
 #endif /* CONFIG_RT_GROUP_SCHED */
 		if (dl_bandwidth_enabled() && dl_policy(policy) &&
 				!(attr->sched_flags & SCHED_FLAG_SUGOV)) {
-			cpumask_t *span = rq->rd->span;
+			struct root_domain *rd = rcu_dereference_root_domain(rq->rd);
 
 			/*
 			 * Don't allow tasks with an affinity mask smaller than
 			 * the entire root_domain to become SCHED_DEADLINE. We
 			 * will also fail if there's no bandwidth available.
 			 */
-			if (!cpumask_subset(span, p->cpus_ptr) ||
-			    rq->rd->dl_bw.bw == 0) {
+			if (!cpumask_subset(rd->span, p->cpus_ptr) ||
+			    rd->dl_bw.bw == 0) {
 				retval = -EPERM;
 				goto unlock;
 			}
@@ -1127,7 +1127,7 @@ int dl_task_check_affinity(struct task_struct *p, const struct cpumask *mask)
 	 * root_domain.
 	 */
 	guard(rcu)();
-	if (!cpumask_subset(task_rq(p)->rd->span, mask))
+	if (!cpumask_subset(rcu_dereference_root_domain(task_rq(p)->rd)->span, mask))
 		return -EBUSY;
 
 	return 0;
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 919d0fb00bd9..98a65d127e46 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -427,7 +427,7 @@ static bool build_perf_domains(const struct cpumask *cpu_map)
 	int i;
 	struct perf_domain *pd = NULL, *tmp;
 	int cpu = cpumask_first(cpu_map);
-	struct root_domain *rd = cpu_rq(cpu)->rd;
+	struct root_domain *rd = rcu_dereference_root_domain(cpu_rq(cpu)->rd);
 
 	if (!sysctl_sched_energy_aware)
 		goto free;
@@ -492,9 +492,8 @@ void rq_attach_root(struct rq *rq, struct root_domain *rd)
 
 	rq_lock_irqsave(rq, &rf);
 
-	if (rq->rd) {
-		old_rd = rq->rd;
-
+	old_rd = rcu_dereference_root_domain(rq->rd);
+	if (old_rd) {
 		if (cpumask_test_cpu(rq->cpu, old_rd->online))
 			set_rq_offline(rq);
 
@@ -3483,8 +3482,10 @@ static void partition_sched_domains_locked(int ndoms_new, cpumask_var_t doms_new
 	/* Build perf domains: */
 	for (i = 0; i < ndoms_new; i++) {
 		for (j = 0; j < n && !sched_energy_update; j++) {
+			int cpu = cpumask_first(doms_cur[j]);
+
 			if (cpumask_equal(doms_new[i], doms_cur[j]) &&
-			    cpu_rq(cpumask_first(doms_cur[j]))->rd->pd) {
+			    rcu_dereference_root_domain(cpu_rq(cpu)->rd)->pd) {
 				has_eas = true;
 				goto match3;
 			}
-- 
2.55.0

