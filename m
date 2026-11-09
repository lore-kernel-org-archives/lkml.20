Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794225976;
	b=VBxxYzRm526Vl/7XDaowMmKBvN7bo5dTb3IGLgU3y4QOXXleZEq5qYNUbiKgRNftR042
	 gK37hwfNzRf4VF8d3Geq+EDJJ5I4uuODYWiduCUuFQ2KjCEJDbtH0qigAOq6NIBqHHVNz
	 QE889jQDrxxszIv5MkG0uT8iSciwMBc0oFMrSadOe0xiJFSC1SANZJTuVaF4gT3bwcnQj
	 8u0Nsb5ExPH2FbJPzXuJt4HadCNmHOz96C2R+9NfVPfHvqZICKa7DF+esBw9HGZMfV9yZ
	 TXU24+h3LV9ykyRfDJ8nQN8x3Mr679KwDvZ09yoUrPPwszdsr/PyccnAYLeMD2srM8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794225976;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-TM-AS-GCONF:X-Proofpoint-Reinject:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=e+e20lFNeHTJ5tfcVMj7+xqiyD70fxGB8M749yZaW9I=;
	b=hq9GikILf5AL786ESefE4EdjwybWA1Oqz9fygFlBuourts7QnB4XGo7C7qlN6WsNlD3N
	 6/IqAKemQB1hkogGIwP4IRziH0d5qA+uRmsWnVRXhf4EoXowoXOYR30/6FOaKih2BNUcj
	 OmJEjiXbQ4eUG8gz1mp3CrfmQ4ENSh5xSYccflj6TQWsesovZ/IB54hrgqzM2dzdy17U6
	 c35KEEQ625JCqOKgBAuseE6sASUaXiAncbva0DBzZ3yTNePwnunDTuuRDDf85lTa++/vq
	 kW53i8clrB6frVplAp/Giy9ugBco+1Eytt9FiWwMQJ2jks2QxV8vFwtEcm+5cbqnUgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kNUh+HFS;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885E9606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 885E9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kNUh+HFS
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9AEBYx1915852;
	Mon, 9 Nov 2026 12:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=e+e20lFNeHTJ5tfcVMj7+xqiyD70fxGB8M749yZaW
	9I=; b=kNUh+HFS4kW9cHtaLGiuJZ5Wco1Wdx5RjJu/JelJjaEhkhxvvMu3yBFtb
	PqJ1IZ1nTo6KsaYVY/kaxZ8jiuFbr6vRvV/xbiNxnFZxsHYyfiltHizffDkx4gH9
	ab/NBmIPUnn1BvWmTQZLM4FuX1b53dgfVGMDORM6vZ1LCFZkEHyI8Yf+QBuOQ4XI
	jYAgguhpvXU78j5A+JyqKzwT4mzyNnu20xfMCRy5GGX2eAVNQtZiiHZRHpqu1J2o
	lbIWXJFZevEW1O0UGtnC8E/+ZYcLIBx1PaqQ7FrF/9FJxraXLi2zVGFwgnuesWiO
	GElFCwkRK79CJyr2B5w4GzGk+UrhQ==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hstdfvsxr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Nov 2026 12:05:53 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9A51u04047436;
	Mon, 9 Nov 2026 12:05:52 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4hteapyu13-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Nov 2026 12:05:52 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6A9C5o0j30212460
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Nov 2026 12:05:51 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D653E20043;
	Mon,  9 Nov 2026 12:05:50 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6D8702004B;
	Mon,  9 Nov 2026 12:05:47 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.87.145.90])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  9 Nov 2026 12:05:47 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ben Segall <bsegall@google.com>, Juri Lelli <juri.lelli@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>, Mel Gorman <mgorman@suse.de>,
        Steven Rostedt <rostedt@goodmis.org>,
        Valentin Schneider <vschneid@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Srikar Dronamraju <srikar@linux.ibm.com>
Subject: [PATCH] sched/fair: Skip sched-domain traversal when wake affine is disabled
Date: Mon,  9 Nov 2026 17:35:22 +0530
Message-ID: <20261109120522.1704752-2-srikar@linux.ibm.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=J+M/fwnS c=1 sm=1 tr=0 ts=6af1b721 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8 a=iVEMHt5rDdb-cKQk6CAA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0NiBTYWx0ZWRfX38q4aQUPdxfz
 Sei69gOQNBGts6PUqCDvC83nsa7crLrc4295MvL0KWOyf/9SUZA0ahrhEt1dyLLE9kAnDGGVa+y
 7IzgtZNaqTelSHy190Kye+WRwN0b/H+Q8QfKz+PB1UKEBqPWdUWO5kOAD6xrp9pzzl7NFovRPMD
 Lo6Jo+vIV75YEAskTaCWg5NsLmUEKfs29eXV/4EjRhdxO0GDRfzBtWWiHrSf8DR+TdFnP2GcEmc
 sRMn8hllrXlngip8pjRoL95HOZoY/XpBS/mHPXgZlcSHW9cio0WMmsxWHuO5WZSLBN3hUoPkHsw
 p1NGEA6YWoAk2hbwCadVduaLdP6iOft0z3TpnIhE1Z/iKKVtPYpxydtL3Jof7bg3CJA0ivnIjLP
 NfGHBhywyUW+z9ZzBncjbNdM/JhUP//48NjKVq+Oj30MeJtrAH8mfDeykkv0kQjEYr+3I/su/pv
 g5xWlCZ5PdLt/21/WeA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0NiBTYWx0ZWRfX9u8EnSBgV6Tc
 7p73lYNqf9LJMZ5/6u9xTaAq2c45QZkAzHxXAv8zSOO3hug7O17lPD5W9otUNXUyyC0p/0hOS64
 zxjbrAmUJYBfNOARB87NNQ1eHwxKwYk=
X-Proofpoint-GUID: 28Ax7lBDJqpXZIibmjno-CBXEGWKXGU_
X-Proofpoint-ORIG-GUID: kT4VjsnBBQyJD6UUfHReKtsT6-FyoBgG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0
 malwarescore=0 clxscore=1011 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090046

In select_task_rq_fair(), TTWU wakeups for which wake_wide() returns
true, or where the waking CPU is not in the task's allowed CPU mask,
want_affine is set to false.

For these wakeups, the scheduler does not perform wake-affine placement.
The existing code already treats this as a fast-path by exiting the
sched-domain walk before locating an SD_BALANCE_WAKE domain, ultimately
falling through to select_idle_sibling().

However, select_task_rq_fair() still enters the sched-domain traversal
only to break out almost immediately. Avoid this unnecessary work by
jumping directly to the existing fast path when want_affine is false.

As part of this cleanup:

  - Move want_affine into the WF_TTWU block where it is used.
  - Skip the sched-domain traversal entirely when want_affine is false.
  - Remove the now redundant want_affine test from the
    SD_WAKE_AFFINE check.
  - Remove the corresponding !want_affine loop termination logic.

This preserves existing wakeup placement behavior while avoiding
unnecessary sched-domain iteration for TTWU wakeups that cannot make
use of wake-affine placement.

Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
---
 kernel/sched/fair.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 3ebec186f982..58ff55e093cb 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8832,7 +8832,6 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
 	struct sched_domain *tmp, *sd = NULL;
 	int cpu = smp_processor_id();
 	int new_cpu = prev_cpu;
-	int want_affine = 0;
 	/* SD_flags and WF_flags share the first nibble */
 	int sd_flag = wake_flags & 0xF;
 
@@ -8841,6 +8840,8 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
 	 */
 	lockdep_assert_held(&p->pi_lock);
 	if (wake_flags & WF_TTWU) {
+		int want_affine;
+
 		record_wakee(p);
 
 		if ((wake_flags & WF_CURRENT_CPU) &&
@@ -8855,6 +8856,8 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
 		}
 
 		want_affine = !wake_wide(p) && cpumask_test_cpu(cpu, p->cpus_ptr);
+		if (!want_affine)
+			goto fast_path;
 	}
 
 	for_each_domain(cpu, tmp) {
@@ -8862,7 +8865,7 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
 		 * If both 'cpu' and 'prev_cpu' are part of this domain,
 		 * cpu is a valid SD_WAKE_AFFINE target.
 		 */
-		if (want_affine && (tmp->flags & SD_WAKE_AFFINE) &&
+		if ((tmp->flags & SD_WAKE_AFFINE) &&
 		    cpumask_test_cpu(prev_cpu, sched_domain_span(tmp))) {
 			if (cpu != prev_cpu)
 				new_cpu = wake_affine(tmp, p, cpu, prev_cpu, sync);
@@ -8878,8 +8881,6 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
 		 */
 		if (tmp->flags & sd_flag)
 			sd = tmp;
-		else if (!want_affine)
-			break;
 	}
 
 	/* Slow path */
@@ -8887,6 +8888,7 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
 		return sched_balance_find_dst_cpu(sd, p, cpu, prev_cpu, sd_flag);
 
 	/* Fast path */
+fast_path:
 	if (wake_flags & WF_TTWU)
 		return select_idle_sibling(p, prev_cpu, new_cpu);
 
-- 
2.43.0
