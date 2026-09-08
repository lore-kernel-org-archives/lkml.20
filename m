Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4F73947A4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 10:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788865016; cv=none; b=p0bJMdWGZdbH+bppxNbL4vHvlbFRPibGvuIXWHP2P2QcyLiidONwPYyglvsgVvXyrvLKlsZqfheyypn5svXawdqWAbdt1jPtxQGmUq3p3MpAaHHjpDWkHmeYqJCocUWEDA281ae/tfppCfHcJ8PiXg6dPArvTKp+dv+a2B/kUUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788865016; c=relaxed/simple;
	bh=0I+BrpBjIcfkNQ0GgTa05sK2IuWRcrM28mh/nKdplB4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hs+9piqjdaBvX/K+o9rOgHyirwoevr5jIM+mQvLoDvC+jTJn9Y5sX98STX/oSxrhQ1awjqwLyEwsQuK+njiiDZyJhwRE8P3PycN01zwtsvLvC/MVnYpDFvBAjEEmWarTQrEUqTdIiaMzU4EwZFR0NQr5o5a7WZXCZN3TUIdNWOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=PYzJshTL; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="PYzJshTL"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688AVxIZ510969;
	Tue, 8 Sep 2026 10:56:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=xaLOOyMjoYcAOq6CG0cMVEIJAEQWi466DcPj01r2a
	2U=; b=PYzJshTL/n7YYVIHFaUHsUbC/o41Oz9D2XmA+TY6697nPCTQTYocLwc6K
	xxaieAFxNTe+Jh5rOLlw6Mg8JVamQtoJhqaDxkwlSa0xP4r02ew6wVe/nUSUtHT7
	QRSoCplb2ByYd9YK8eQOTwJBWEgCm+Qj4oO41u+bAOujNT26LRMVZwm2TyQpPYvx
	TnaDSJpZM8tdED0uF0ghQX+skJy7iaj1NQR0Zrdi8weyj5B5wwUlJ40vg2Rvc0uo
	BKETVh5FNfS6SmHVBQnMZI3AK4ogTCTNBvPyApF26+hXHR7AbPRDlzv8TzxEa5Ue
	RF/SBnZR7pofWuu9zJllLfvHdPBBA==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ggbj86400-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 10:56:45 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 688AuEkW012236;
	Tue, 8 Sep 2026 10:56:45 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ggxdjubde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 10:56:45 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 688AufdR31851238
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Sep 2026 10:56:41 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0843120049;
	Tue,  8 Sep 2026 10:56:41 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E009620040;
	Tue,  8 Sep 2026 10:56:40 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  8 Sep 2026 10:56:40 +0000 (GMT)
From: Thomas Richter <tmricht@linux.ibm.com>
To: linux-kernel@vger.kernel.org, hca@linux.ibm.com, peterz@infradead.org
Cc: sumanthk@linux.ibm.com, Thomas Richter <tmricht@linux.ibm.com>
Subject: [PATCH v2] perf/core: Allow list_del during perf_event_overflow()
Date: Tue,  8 Sep 2026 12:56:37 +0200
Message-ID: <20260908105637.627004-1-tmricht@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UHRsPW_Xxah1Xpiah7UpPNWCXaWszLuy
X-Proofpoint-ORIG-GUID: UHRsPW_Xxah1Xpiah7UpPNWCXaWszLuy
X-Authority-Analysis: v=2.4 cv=RNCD2Yi+ c=1 sm=1 tr=0 ts=6a9fe9ed cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=JfrnYn6hAAAA:8 a=VnNF1IyMAAAA:8
 a=0yv5PlfYPpRjrY4jywYA:9 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDExMiBTYWx0ZWRfX+eDheSalqx/6
 iu/63zrYqLpYnG1hIISTzLTU92ezKgjsMtGg8/QHEi2JFM1n9twr7wNJe2DuPy/jB/8kwvrAVdZ
 x5VDLzyAwLdcwO6mBbK+Hjd4lxzCezc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDExMiBTYWx0ZWRfX7o8b8sCnqZ/6
 Jg0ENDCzvdCKKNVzroxoVpEmmsYYpKlR2OXNZHsoHEFZp7dc/USmez9AXLp3h7iRURODTnGRCGO
 8sGWc6r+S6Xt8p9JwlgIQrj+MS4/ByAHydi2BhNDqoE+i97+s5tSOE4yhS3DggKAKyNI+h/DQdZ
 KuE1gqgtxb1zKy4WhOO2Sq5pVPRVKppVEMEApkBQ/g/Y3hGAIfxi7sPmxBluT/5fhy0yIP+uain
 VdtNcQSZp74IOyo1gs+pVj8SRR4lj3kEIoJtZG9meyvEql7vLrJPc48ul68a+BhrqAkaA4QuOuI
 kbbCDY+bw4bV9ISDzGYtSxLdoV1u/rT0MsuzMvV8DfyhXuZf+D+cw6HcXCvpLO6UtV3CGRBaDlw
 xss439PyEBEnCoCdJsDM9YH9mhqGgMh0rGSPqPdd7ldKt+8nAbOucNUmDRdLzZuvCDVGL4RGTYl
 IJHmP1gg/KVyFggNMEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015 spamscore=0
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080112

V2: Add Fixes: tag

A PMU might use perf_sched_cb_inc() and perf_sched_cb_dec()
interface to get the PMU call back function pmu::sched_task
invoked at schedule in and schedule out. This is achieved
by walking along the list anchored by sched_cb_list.

The following scenario might lead to a list corruption.

   perf_pmu_sched_task()
      for_each_list_entry(..., &sched_cb_list)
      +--> __perf_pmu_sched_task()
           +--> event->pmu->sched_task())
                +--> PMU_push_sample()
                     +--> perf_event_overflow()
                          +--> __perf_event_overflow()
                               +--> pmu->stop()
                                    +--> perf_sched_cb_dec()
                                         remove entry from sched_cb_list
                                         while list node in use.

This happens when ioctl(fd, PERF_EVENT_IOC_REFRESH, xxx) has been
invoked and perf_event::event_limit hits zero.

Prevent the list corruption and convert for_each_list_entry()
to for_each_list_entry_safe().

Fixes: bd2756811766 ("perf: Rewrite core context handling")
Cc: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Thomas Richter <tmricht@linux.ibm.com>
---
 kernel/events/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index a6c8e38a3110..cdd9518ac046 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -3925,13 +3925,13 @@ static void perf_pmu_sched_task(struct task_struct *prev,
 				bool sched_in)
 {
 	struct perf_cpu_context *cpuctx = this_cpu_ptr(&perf_cpu_context);
-	struct perf_cpu_pmu_context *cpc;
+	struct perf_cpu_pmu_context *cpc, *cpc2;
 
 	/* cpuctx->task_ctx will be handled in perf_event_context_sched_in/out */
 	if (prev == next || cpuctx->task_ctx)
 		return;
 
-	list_for_each_entry(cpc, this_cpu_ptr(&sched_cb_list), sched_cb_entry)
+	list_for_each_entry_safe(cpc, cpc2, this_cpu_ptr(&sched_cb_list), sched_cb_entry)
 		__perf_pmu_sched_task(cpc, sched_in ? next : prev, sched_in);
 }
 
-- 
2.55.0

