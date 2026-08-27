Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022130.outbound.protection.outlook.com [52.101.101.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D578237F8A1
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787869109; cv=fail; b=hm8tvhXZnAzhBaP2W86vhM/XrCeZiXxTclerSetclFBno2WoVODvMp67niiqviY+IE1s5wlcJGtCmwfiC4I0wg7Rznxp05EpMjNmRcJLDyn9x9oEvZqX1+kRbGtku4wLdWEXifkFujmmAB+euzuH5Pbx2xcuKVfm5jc61mMBGY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787869109; c=relaxed/simple;
	bh=FAMBmEKNH0E3r93mDqrGDdpD1wt5J3bOKGCk+3QO3y0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uZHr/zoer9lkVAtzD0vRl8b/et/tcFm7IzsB/AaDYr0CO/0/wWbpm4quWRS4Ph/K/G9EPhytBfVmH7k/+XYKZ0wAnMv29yezX2jOXCFB3khW8NaTHVWUg3oV+LS0K82xk1VfrnmYo++m9ZbgLoeBZ+zATxu+rJDHyL3x/3JbLH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.101.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AKua2bZa1arP673e0CESkg83jbsyZN4fwk/3gtbHUsB2IP/TgHE98zW2sZ7c1+VEjXkBG5Gs+13WwU4WY+VYRRK3jq6/es2En+i/9f3bPGUNQkxEms1rD/7dlge7XmWoraCI4J4vR/e16CyzlAiCZr0sE55vg8wdfo4CxsEd32/2ReJBZwbwXTjis19wwYWqJBl33T4jIq4xK9S9gps3rrbsQo+28bmphgEy7/DmJeGeuOvHmqnGO/QE9wYfZ4a6eLYlYGWVOVkSuo0V2ppg5sc4IL1P2o3p009wEn8HI/9kEczbNngMBj4X1b8ODS1KmtzalPYpKT7s/CnTdXUeCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=8LrLKpfCtcUw4SDnojsAv51pIUjB6Rdt3xL3H1e6+mg=;
 b=JjQfatwZv5Lz+3hyfHIAnuqZJBC8v4QiGyJ32wjRPywkV/3XQJes3+XBjtwl3PAtahFbsWvUahZd/uNTOL8FZVPCssjfjgoevOiQkaZ9tkuk6lSwIo245qj9rYNWS/Le67A/9A3uQjc6pSgWgYuWMs30qMU3QxyNIXVoFYB801rCZGTLrATuMHPakCrEYi4doYKGHVLA0Ljl9/0PQIKAlnlSgPUgwpemAa4P1fTt0YvSEe8teZ+ndl4vbevLDzQYfTHIVoiZgxrK7CQ2HyCxz/he7oXuVdmuPeZMR6L6PknBpqhLNKODsG1/7oIoltTemYMq1UNvbiV5/tGn48YLQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:183::5)
 by LO6P123MB7095.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:342::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 22:18:16 +0000
Received: from CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230]) by CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 ([fe80::cec4:77ab:262e:d230%4]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 22:18:16 +0000
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
Subject: [PATCH v9 4/6] sched/debug: Protect p->mm access in sched_show_numa()
Date: Thu, 27 Aug 2026 18:18:06 -0400
Message-ID: <20260827221809.988394-5-atomlin@atomlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827221809.988394-1-atomlin@atomlin.com>
References: <20260827221809.988394-1-atomlin@atomlin.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0256.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::9) To CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:183::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB6607:EE_|LO6P123MB7095:EE_
X-MS-Office365-Filtering-Correlation-Id: eeffd775-79fa-44f1-57a1-08df048917c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4VUSY4qfJalO7kPkc8JNne2c3sdFB/eFxAOffXmZCR4kV4mcgrDA0dpuT9lR1/cl0zPospxapuJAZbTpBDwrdGEXW1StKJyerEYf7pPbLXY6aFco4XvLpY2GActpRcGkQDtmNw5vXnI9KBiQsxOeKyAMnHu2mMtFQD0kjS6d2H2x+0rMc0f6dR9Kc3nuYiPSREI/TZOmBX/T8/azPo1rdbH2XeZy5i14MiIYznOeJJKuQLGmfWM/f7bdJbAyrj8iR/Yvyd02KWtVM+aXq+c3hahd2LsZxb8aakk3BnBWQn9mP1nAliRylq07Z7kDav14WI5rOQUvBBV58O80hEXiSDzxQdm6i8ffnStm3gy7KeAovWgew1gsyx4vl/xKLa0WbsllXnrdyYQvu8YJHbr/eZ0Z29FMmw+isy5/MkM0XX9aFd0HwmcJfk8cH42PsIGsO5RPhKbnVo5jWlENHwI/0033Evpfo1NQ3TSwGXPB/0PBc7uNCJLH8bBhi9TMr1nz0mh+dR6R7p3ez0zy/VQY6rZCvGKPTFnQrjNdnFccdHmxTJGmk+fCkmz1gPEZ9HQCBS9v1wMlcnGhXUMMDFEG2UfpVqSetsN2jbzB1vIUhU2qu23oshuQFACc8DMLV3nh4XjfoAXgkmYCpTiwgsB0LOWcmrCdiSzd3oj2tyl9yB0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZoWr4hFfeEMDAvhoTKmf2QnwWRMqep9k4nj6B9pSj5Q5/UnHhPxGWnARViPc?=
 =?us-ascii?Q?ML7BQ1l50a/o3N0nFONpWb6SC5maKI8/ZFM4qAme7Bf783agcomffvqGv20p?=
 =?us-ascii?Q?AEW21h99G84cd82/MJwwKNm4z940rjTNxXAf3Bsmecje7yuxF3l6n0xFiaPR?=
 =?us-ascii?Q?NGJBy3hwQC1FoYr+jpCsBqiF5RidMU1pAOrdQvtUjImOq/P+1y9Thv9sOyx5?=
 =?us-ascii?Q?4e0Ebxg9pqwAvjtBENZEFVM4gxdkqSsgc68THODM+McXSbj9LQSEjqMoj+QJ?=
 =?us-ascii?Q?lNJ12eQs9h7o5udwbwB+mQvCT/7NTr6okQzaLUlUW2dWRhsCElf+yZYGPD+n?=
 =?us-ascii?Q?i37AQGJjel64LzPUEZua1obuvpFwlypMd/SY+dAm0+UeN/wTG6UHNfhuBoAn?=
 =?us-ascii?Q?ytTWGetIBOdz1ECQO/1eGEb322noJzKnTEMNaRfdjT8xE//JwbHGY7jFtcof?=
 =?us-ascii?Q?KjqdYsEksk3yvKzZ8um3ycmoBW24LenHFK/wSY+RIipiA4LUz0ph/Jc69peG?=
 =?us-ascii?Q?ZRA06tMCHZk7Bo6/II3GjF4uimOQE8fOyqNFJhhnsMzpec1dzW1IcKFaSAfN?=
 =?us-ascii?Q?Mh1+ea8ZjUMBx/uXmM5sbLfPQQmVCrjoBzNjNSdtBNem958JuSZhpLQgd4jw?=
 =?us-ascii?Q?kTavsgtJDsUp5wCZC2YqtPxmZaqsIgC1ziVWX4xBXyv0hqdWG11XE6RDOFeD?=
 =?us-ascii?Q?bi6kOWQG95FvTdZMkZARYUa9G553RDp+dtpRJ+HQup0M6WD82Kn3XlKBWhua?=
 =?us-ascii?Q?XZ/WP7ou8FCvqaeIbjyQGRVgfhLh8BUW6d2XH3FNcFsYc6XK5jQnQn18fHIp?=
 =?us-ascii?Q?x2qYjo1Z45yUd90UzFTccKJ1NJs8EDNuMpDlFY1I6eILj27YVoEHe32yGXDM?=
 =?us-ascii?Q?WFgMgcvP8l3lWe4zeUMf6dGGX2dfSRBN7/h82AoyaKMpNLWMddho48emKa1t?=
 =?us-ascii?Q?K4+Ixg0V8kC0spyG31k70IjkHWwS3V6a0TcEoy5gOb2jI0lWdQalo93ODVM5?=
 =?us-ascii?Q?O+OyS7yEfBpNQdLXFYkhiADFSsXDxqw+VO8+h9YG0lEbi9W7hd8OVWrmZ3wP?=
 =?us-ascii?Q?kPmwDsPCF5jBNPNAAj/xdCw4yjn+0IOfx3/zLNJGdieegRqC5wPb4L0h/khD?=
 =?us-ascii?Q?npf6igx80sD0aNz0wOGZtRvMPimDWDWhwfEDlssHMHt2E1WyhX4+Q8a+geVX?=
 =?us-ascii?Q?XMP42TL+GOMt+lmf2Ri/GGIVN/TFp4bvbm1J7af+7EZlxgSz2fAk4+ayrYkU?=
 =?us-ascii?Q?IkfkgZ7ROdwJkhwIEoZ60vU4mwj78LUoeNYG8R/ouB1CJRFv95UNzRRISl3p?=
 =?us-ascii?Q?E2EHrDcDO6F0ohTs9kqBjF0+lOAzA+SrZEJXZoSLJ6aGHRAJgo3BsppUp1vE?=
 =?us-ascii?Q?0nY86Qlq43wTPXrIVpfEG1iNbMoyQMX/yhUDDibn3RlwAModKo/T72CE7k9M?=
 =?us-ascii?Q?eUIaRoaqZ274FWae1+r9lE2hBfmDe4y9SZ8SN5oSfVcwmJbx2r1IUcVJfXYo?=
 =?us-ascii?Q?XPsnT9TPLUg+1H0pfv+kkka7b1NblMNEDRgRM+aVZStv9lnbMjbv7Ho6gOCr?=
 =?us-ascii?Q?QOfhYl71YEC4dek/oYY+87x1s09Mv243qBQCS1lOeovrtLR29ib2gUtNpuGk?=
 =?us-ascii?Q?d2TF4I+5kjOLrye7Z9d82m9tI7St21E3WrAS06gUWuxXzBndlx/a6I7mmhjU?=
 =?us-ascii?Q?rHT9PZCMIWKsr9vgknE8aLPBt8/7dM47GKq3t/M2eJkc/O5d?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeffd775-79fa-44f1-57a1-08df048917c9
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB6607.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 22:18:16.6918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WZJIZ3TLMx6twZEWx7jZPI48sG3R7FNKoyr1ghb+rNnB/+N7lEaTiXl6CAcLz5S5KgTJeB7KBfHbjpQfrX9mYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P123MB7095

In sched_show_numa(), p->mm is checked locklessly and then passed to the
P(mm->numa_scan_seq) macro. This presents both a time-of-change to
time-of-use race and a potential use-after-free vulnerability.

If a task exits concurrently via exit_mm(p), another CPU can set p->mm
to NULL and call mmput(mm) to free the struct mm_struct. Dereferencing
mm->numa_scan_seq without holding task_lock(p) can access freed memory if
mmput() runs immediately after the check.

Fix this by wrapping the p->mm check and macro dereference in
task_lock(p) and task_unlock(p). In exit_mm(), current->mm is set to
NULL under task_lock(p) before mmput() is called, guaranteeing that
p->mm cannot be set to NULL or freed while task_lock(p) is held.

Fixes: b32e86b4301e ("sched/numa: Add debugging")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
---
 kernel/sched/debug.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 3d6248c50dad..1b6d2a83d50f 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1395,8 +1395,10 @@ void print_numa_stats(struct seq_file *m, int node, unsigned long tsf,
 static void sched_show_numa(struct task_struct *p, struct seq_file *m)
 {
 #ifdef CONFIG_NUMA_BALANCING
+	task_lock(p);
 	if (p->mm)
 		P(mm->numa_scan_seq);
+	task_unlock(p);
 
 	P(numa_pages_migrated);
 	P(numa_preferred_nid);
-- 
2.55.0

