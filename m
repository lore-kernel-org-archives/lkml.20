Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E453655F5
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 06:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788850102; cv=none; b=PyZqG2c6deansGA+wjEtNXxSa9o/uOIA/IHBOo4QIheMQf2QeXYMweoWJgo3JiR4+cY3Y20MXIvjhUyTk7uDSl2kC+eK/WiM2f67YEf5lGBIoGjjMtO6xQmRrNlgP2txkyFAUfnkkI/WFiffHiNFNkuR4BD71unpjKDFKqjTEYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788850102; c=relaxed/simple;
	bh=PiIJhEzJQC+U2RXQdoGTffC6zNtxMoHC0O/L0yQeKs0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d+XUZWX2Bm3wZwQbxA63MxOUrHNpmIfwiS7Ez3/8J9c+5ZtSvIwBYREbrv1B/hVtSly3T63eBObsTlVvy0WGxHdtNw7I4zEqGneRDBqsuI0RHo14OPpPLce+qP+2XMhc02M6IZP5pF0Ym9M0HSZH9T85pqo1OZJ67NEcw9bBwvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=TO1TZ6sm; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="TO1TZ6sm"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886VZEa065733;
	Tue, 8 Sep 2026 06:48:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=dhOFUY/slb8lEyg5s/Y6m7TINfaVYhHeBbhsYaPcZ
	5o=; b=TO1TZ6smBUNHgXmsHLdZQFQl+HDDBWwsq3MIhEJPyGRGC7sdWoIUO129X
	xaBoKvYeCBPLaqSqGiTwF7T3CU6AAlLuz82lgzednhVKu6dHefSFAGRG9d0x2rP2
	gYNE92vaLcnglDrvhcjO+OpzgIvfuclM0bQXTwnt8C1Qdx00RjIIwcetz5a8d+Yh
	dXi2qfc+tvSx5Hr6izVKXh7Pg+3IPfSmNDDIAWWIc26A3uo1xOHZ3qhqAiXZfUZU
	YcMnSFyZSAcJ0+HNbSL2rhy4vMua6Tv2EBFurbS+Vv7Cfktq3NzxEssbEFB1Vn2r
	AyXnF7VQvrr9E5L15LddDOI73nuIA==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ggbf3w3dk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 06:48:16 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6886fJpN021379;
	Tue, 8 Sep 2026 06:48:15 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ggwsw293a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 06:48:15 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6886mBdK51970420
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Sep 2026 06:48:11 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 107ED2004B;
	Tue,  8 Sep 2026 06:48:11 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E6A5520043;
	Tue,  8 Sep 2026 06:48:10 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  8 Sep 2026 06:48:10 +0000 (GMT)
From: Thomas Richter <tmricht@linux.ibm.com>
To: linux-kernel@vger.kernel.org, hca@linux.ibm.com, peterz@infradead.org
Cc: sumanthk@linux.ibm.com, Thomas Richter <tmricht@linux.ibm.com>
Subject: [PATCH] perf/core: Allow list_del during perf_event_overflow()
Date: Tue,  8 Sep 2026 08:47:59 +0200
Message-ID: <20260908064759.1241413-1-tmricht@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: eFNczyX_2--fdEW5pyF3P-bJr-wCqKr4
X-Proofpoint-GUID: eFNczyX_2--fdEW5pyF3P-bJr-wCqKr4
X-Authority-Analysis: v=2.4 cv=DbEnbPtW c=1 sm=1 tr=0 ts=6a9fafb0 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=JfrnYn6hAAAA:8 a=VnNF1IyMAAAA:8
 a=tpjk3lqxN-sNga2Lk8kA:9 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA2OSBTYWx0ZWRfX+GgKLBMQn/j6
 qIH0J9Dxydmi4yI+sLuDjACwVZ2y/NLRVrpgP4Krl/vgCpE1lAoA/nolRM3wu7hmxQgKknIu4Kr
 WZjAdP13zn3p/u5YtJuHdskKAX/R3xl346MO+MzwuYW0l+caZSjIuwz90bPnqACZHdZa0g3Npb+
 QWo0U7GlUGDyDCHqSias6ReCClwZwQ1m2PNPA0cy7Um6P2UlIF+++HZspbX/jOrG14mzEmQH30e
 GtjDg34jO4Gou5jzsgBlYHH0jWl3INfxstBn9L/BTGYlAXXOg8uVLliAECFDPRqC3ZaI1309epE
 ogiVkVg5rZpm5vZwJUBvwPHaxoUMuTvDtSyvOpeJEfmrFsg2XAjdmLmkyR+/sqppH3ubzLn8l1v
 DdOOiEt1mQB2lZlX4PG9deD6uD0VTIc3Ml5btmSp1xFs0ZqynjDwMCPSbjSejrEYbOEov0zWhyG
 7Pb/6+IaratGwTG93/w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA2OSBTYWx0ZWRfX9NzddZRO5oqR
 HX294rcfrMwjQEgbQF2CLjRPwMg4Bc2OPpeFA3bmeN1Qw2WRgnHKbj1Gdwad2pozyR0ov/qhdrZ
 uekspaQ1G9vhGlPTH1uaNopQWcAe7MA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080069

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

