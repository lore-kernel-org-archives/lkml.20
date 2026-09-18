Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1323B3C13
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789744134; cv=none; b=Yp0UPa12VQsBFG2nYOl6RrEl3ydLPMeMBlQ5gsDo7QeFhW5Lw1ev7DJEZe2grIlSlFVH4/JXzcYazZl/cKU7ooyMkNZzbR8wSBm46VQ5Hspa/RIEVCarFx+iD19B3NPReyvnN8Olok7D/sOZzEy6vyZo+yabpsnDIK3iUc5UelU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789744134; c=relaxed/simple;
	bh=e9nFbdcPODykM6jcyFZ18+yb12ux8wSoro0rLUg3lS4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RcU8tRQoiF4H3txz5hTU0d3T/Pdd4nL2W3OJv0jKhKGpgW/Db9ZCq6f1TPokFJEXmp4y8kG2lM1IfR1xGOZQh7UPZvabPNukdvL0oloGQEP6+2pohsoXxDSsRsWtlyS65ZQL9yPETjW5YXSnQdXNpurghIR4tT2LcHWBBchZKyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=kR8P7ofN; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="kR8P7ofN"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDVse71394313;
	Fri, 18 Sep 2026 15:08:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=9FvzBA6cASGcUK6x1rx4pNH5R7ZA
	lQZlhI5xim5ujyI=; b=kR8P7ofN/YhkWrJHOiWf6q6ZOOp/FV/1dvzRpiPJLk/P
	FGjNWrJr9vImLao0dNmxWPiJikXOtcZaHUwpvOWnmDRuL0pGPU1dLkbYmyyiCOLp
	MUnfrE5z6wu4UVKN9vXGD+IFw2ATw836IB6I2HJBMDbgyr//SOwtedWVPbgIhqWL
	RePKIT6NAyrRsuXuzFl6uUw1qsa/VnZ+RSgDgesI0fGn0pRg0f6XR0n+eMW7cQp+
	InkdEjOlWmNMAzpUrtau+4iSWhAFUz1lByFcN6LJJcoUXg7Mu4uWkvCBfEpSWWBE
	dixUUp+r+4CExfx0nQB2uGpttPZrZn9zLrffKsMovw==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gmxf5gtsm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 15:08:21 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDNttB1684370;
	Fri, 18 Sep 2026 15:08:21 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gs4tv8prh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 15:08:21 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68IF8Hqo37093778
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Sep 2026 15:08:17 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 537C720043;
	Fri, 18 Sep 2026 15:08:17 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F0E5920040;
	Fri, 18 Sep 2026 15:08:14 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.18.35])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 18 Sep 2026 15:08:14 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org,
        msuchanek@suse.de, ritesh.list@gmail.com
Subject: [PATCH] powerpc/ftrace: Don't restore r13 during ftrace_regs_caller
Date: Fri, 18 Sep 2026 20:38:10 +0530
Message-ID: <20260918150811.1743769-1-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: m2gLy_VreWRdMN6iJVAqoHsHylAy2TtJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIxNCBTYWx0ZWRfXxXh6hvW5QiEe
 qLFfzrAjyhKxcJYPzSqoAcNwMZRoNg51lIiriE7GQHmoMDroUkq4sWhxbG9cBC35/6STshl+3hG
 WgtNy4qYLRqVYA+Xdk3oIqMfCP4iEpg=
X-Authority-Analysis: v=2.4 cv=cvgOAF4i c=1 sm=1 tr=0 ts=6aad53e6 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=5793ORmOmheN9jAXARAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 9yj6e0EcyvcQnHwSMx9Fp2PkNCEWLEuS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIxNCBTYWx0ZWRfX1CLx15bgIrV7
 sXLoofMWcA5+PWcwo8SZhZ4AyhLnXSGPUivahK+dXS7Z/7Unwoy74NDzeYLk04xYMkzwro1D1u6
 by93qF0hrWat/FDlyJ0Dd04CesaCKbEyZFuh+I5ncUE4iVZh85kcx62ON1uqx/EkfL86jb1nECV
 spN9HxMMeDnh5flVvgqwaoASXnE5IjMyavh4LpJixFhDFyQq+k4ML7lSNxZvfSnoHc32JES9UfC
 //Sa0QYSPHT5SBmgUBxPppRVY3CdnUoq+3c1vCa2KlxotaPwqFbEToEHbAqjm3yye1uNQ2YjDhV
 ATZQx6icKKfRYqYU9zj0HQVZk1C6hefMUMi0QvaaelatDemKPb9w8wm+3fhUPiEZlC6E567dg9m
 hy4p92/000zkdPk1f31GLGNuoPFgs8+HsPr6Lpi4lRTpi3cRp5ZMh7kb5GoPLLuYmIB4ovKjKyi
 d2q38juz1+iGKgTSJBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180214

Michal reported a stack-protector failure and subsequent panic when
running kernel builds. This was observed with full/lazy preemption.
Initially it was suspected as KVM, but later turned out to be due
to a bcc tool running in parallel.

Issue was recreated using a bcc tool. 
For example, running below in parallel leads to crash.
./funccount sched* -d 100 and make -j 64

The same crash was observed when running kprobe for schedule() function,
while simpler function tracer for schedule() didn't cause the crash.
This helped to narrow it down to ftrace backed kprobes area.

The crash occurs as follows:

ftrace_regs_caller entry on CPU A
    |
    +-> save r13 = CPU A PACA into pt_regs
    |
    +-> call kprobe_ftrace_handler()
            |
            +-> ftrace_test_recursion_unlock()
                    |
                    +-> preempt_enable
                    +-> task can schedule and migrate to CPU B
                    +-> task resumes with live r13 = CPU B PACA
    |
    +-> REST_GPRS(2, 31)
            |
            +-> restore saved r13 = CPU A PACA
    |
    |-> The task then continues running on CPU B with r13 pointing
    |   to CPU A's PACA.

The stack-protector canary is accessed through the PACA. After the task
migrates, CPU A may run a different task and update its PACA with that
task's canary. Restoring the saved r13 then causes the migrated task's
saved stack canary to be compared against the canary in CPU A's PACA,
resulting in a stack-protector failure.

Similarly, current is resolved through the PACA. With a stale r13,
preempt_count() can access the state of the task referenced by CPU A's
PACA instead of the task running on CPU B. This results in corrupted
preempt-count warnings and scheduling-while-atomic failures.

This path for example is called when using kprobes and parallel kernel builds
can cause preemptions during ftrace_test_recursion_unlock.

Do not restore r13 from the saved register frame. If the task did not
migrate, the live r13 already has the saved value. If it migrated, the
live r13 contains the correct PACA pointer for the CPU on which the task
resumed.

Fixes: 153086644fd1 ("powerpc/ftrace: Add support for -mprofile-kernel ftrace ABI") 
Reported-by: Michal Suchánek <msuchanek@suse.de>
Closes: https://lore.kernel.org/all/aqKfsVArHHaIK6M9@kunlun.suse.cz/
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
PS:
Fixes is the initial commit that introduced this restore regs almost
10 years ago, all commit afterwords are code refactors changing the
code layout. Also backporting all the way maybe tricky.
Backport can easily happen till aebd1fb45c622.

 arch/powerpc/kernel/trace/ftrace_entry.S | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/trace/ftrace_entry.S b/arch/powerpc/kernel/trace/ftrace_entry.S
index 6599fe3c6234..54c8727b48cd 100644
--- a/arch/powerpc/kernel/trace/ftrace_entry.S
+++ b/arch/powerpc/kernel/trace/ftrace_entry.S
@@ -220,7 +220,9 @@
 
 	/* Restore gprs */
 	.if \allregs == 1
-	REST_GPRS(2, 31, r1)
+	REST_GPRS(2, 12, r1)
+	/* Do not restore a stale PACA pointer if the task migrated */
+	REST_GPRS(14, 31, r1)
 	.else
 	REST_GPRS(3, 10, r1)
 #if defined(CONFIG_LIVEPATCH_64) || defined(CONFIG_PPC_FTRACE_OUT_OF_LINE)
-- 
2.52.0

