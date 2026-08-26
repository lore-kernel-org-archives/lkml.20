Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E7B463B7A
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761275; cv=none; b=Kv0UGo5FfWeL7TN0g/BWKjgN2Eu+bbgDxW/YIp4IS3P6YgaZ9geNEW0neezTjUfs5teRcpvQPFhAJuVB2mgMfx1AG5+iXCoYTHkKNUB8XKYGMGlfo2WogKyQNyGXYWmOPWoKZlyAbM5GIJYrzG2rw1B39EPmAqQowncMaVqmg9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761275; c=relaxed/simple;
	bh=AH8eeTsnXkB1t4KJdmMDaXScv4BIm1yCfSCPuQ1dAlg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rye4D0fBNNJqbQJr6U0NpGgiTFiX/A9FIaEk8I7uGI7f6wm9ooAV0R2CQBBF+FxBcoaiq482drqBpzqZ0T0RklzoIfv7484d2uqCxhpRiuwE/ATGurZOk+WhNu2M5bZ9Wsz6SbJJv7SbvVFlGxgeQtXxhq/cieeoSPaa4UnbA6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=FoakEkAa; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="FoakEkAa"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QE1cFl3084617;
	Wed, 26 Aug 2026 16:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=MTcBMEIesxM3zL+MfpgL/JhtUxSn3joUFmm5h4/d+
	Lc=; b=FoakEkAaugzX+V0CzAWKUmvwFTY4Gvt71U3zjn4hCgB4LQBGlrTPmuU+n
	08x9K0rNkFik2QaF0EBLKb59qJj7kJvrPeUsSNYK3ClUUMt2byOmYzEzmV2Q5Gco
	bWDJ3CR2zVePDxJ9QGAwZb06bD9mwfiIPTUnbUFF0LPDMzdnmkHU30hAiXNKWWj+
	ZU7/RIQzoqNQ2nNEe2JbEBLG/va+l1CnDVKaaXJMbhPLPgcmVyATOkTlAp1ERuZa
	bPhC77VlktTj2rHEDjcADqNYjj6Jhco/021EaZIAI6Xxih7qfby66+Qv861Q+g9z
	Wh4jS983pZl+N5RX9BTcnSB7a0DhA==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4g726eqraq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2026 16:20:49 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67QGBGGC017011;
	Wed, 26 Aug 2026 16:20:48 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4g7p3qb45f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2026 16:20:48 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67QGKiMa47317446
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Aug 2026 16:20:44 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 64B9F20043;
	Wed, 26 Aug 2026 16:20:44 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F06B620040;
	Wed, 26 Aug 2026 16:20:41 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.39.21.125])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 26 Aug 2026 16:20:41 +0000 (GMT)
From: Gautam Menghani <gautam@linux.ibm.com>
To: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        chleroy@kernel.org, ritesh.list@gmail.com, sshegde@linux.ibm.com
Cc: Gautam Menghani <gautam@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/configs: Add debug configs for debugging
Date: Wed, 26 Aug 2026 21:50:34 +0530
Message-ID: <20260826162035.27068-1-gautam@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=TfimcxQh c=1 sm=1 tr=0 ts=6a8f1261 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8 a=9H6hm6EcYpu-G-HrPV4A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDEzNCBTYWx0ZWRfX64hhbhQGj2p8
 7ai0gU2ts+CnEj7sUoxLs6awUylEWeMIizl8q7IAIR+P5lPU3mFWnXeQbCTMDP587NQI6TrYWAY
 W/fBqd5WlsGLvCxUJ8PfjKrcxC1Zqxg=
X-Proofpoint-GUID: 3UCyiatnfKRy1DDXz6SpigJP9lFagNtN
X-Proofpoint-ORIG-GUID: adf3iqlxp19pBC_XksMqsYn0rfeheCVy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDEzNCBTYWx0ZWRfXwGXTKhsYKTut
 49+5JJMhZw6kuKaJl0adiicSDXMjZc9Fox1snqGUEbtlS72M399jymwA7fOqmGsjGNiwIh9iuIB
 etOerWfiL3eC6h1B0X2a2Nerw/uvsiVNu9XqXyyQ4Kx+8GhZeDovArPa6UjM9okqlqNiIt8+z78
 UcLH6SjWtog/yp833XNnfoOkAWtGrxaTznRqrfZt4WWnSq2hpWBVIo9OIIfuSVEZIfvSLm84zWq
 6pKXKI2ISW89jhKegq7HvHw/Q4EmG97xqLdpeH2Bpj4MS/iTdzZ8BT6kW4zOo53j2sORPqplsbe
 fYD74LU08/NAmSUZTphNbHP/UMB3p2+wntyLOrf3J9jQWD9KJKP4Hg44Egh83kDYVdLKZvxMbOi
 75vP0b3CaEGfBbwx2h2qoaVRw83vpN/IBOQ5bAmPy3YhwYl9IMPS8MgPlvLMDRaK9vRi0mQGFy0
 5vZYc2ImxG5s5xwknrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260134

Kernel has multiple config options to run extra validation checks that
can help catch bugs. Define new configs for major subsystems to
make it easy to enable the debug config options for a given area.

Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
---
 arch/powerpc/Makefile                    | 16 ++++++++++++++++
 arch/powerpc/configs/common_debug.config | 11 +++++++++++
 arch/powerpc/configs/locks_debug.config  | 13 +++++++++++++
 arch/powerpc/configs/lockup_debug.config |  4 ++++
 arch/powerpc/configs/mm_debug.config     | 24 ++++++++++++++++++++++++
 5 files changed, 68 insertions(+)
 create mode 100644 arch/powerpc/configs/common_debug.config
 create mode 100644 arch/powerpc/configs/locks_debug.config
 create mode 100644 arch/powerpc/configs/lockup_debug.config
 create mode 100644 arch/powerpc/configs/mm_debug.config

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 9385db478c59..425f36c3f471 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -259,6 +259,22 @@ generated_configs += ppc64le_guest_defconfig
 ppc64le_guest_defconfig:
 	$(call merge_into_defconfig,ppc64_defconfig,le guest kvm_guest)

+generated_configs += ppc64le_common_debug_defconfig
+ppc64le_common_debug_defconfig:
+	$(call merge_into_defconfig,ppc64_defconfig,le common_debug)
+
+generated_configs += ppc64le_locks_debug_defconfig
+ppc64le_locks_debug_defconfig:
+	$(call merge_into_defconfig,ppc64_defconfig,le locks_debug)
+
+generated_configs += ppc64le_mm_debug_defconfig
+ppc64le_mm_debug_defconfig:
+	$(call merge_into_defconfig,ppc64_defconfig,le mm_debug)
+
+generated_configs += ppc64le_lockup_debug_defconfig
+ppc64le_lockup_debug_defconfig:
+	$(call merge_into_defconfig,ppc64_defconfig,le lockup_debug)
+
 generated_configs += ppc64_guest_defconfig
 ppc64_guest_defconfig:
 	$(call merge_into_defconfig,ppc64_defconfig,be guest kvm_guest)
diff --git a/arch/powerpc/configs/common_debug.config b/arch/powerpc/configs/common_debug.config
new file mode 100644
index 000000000000..a341c8b41468
--- /dev/null
+++ b/arch/powerpc/configs/common_debug.config
@@ -0,0 +1,11 @@
+# For use in CI testing
+CONFIG_EXPERT=y
+CONFIG_PROVE_LOCKING=y
+CONFIG_PROVE_RCU=y
+CONFIG_KASAN=y
+CONFIG_UBSAN=y
+CONFIG_DEBUG_PAGEALLOC=y
+CONFIG_DEBUG_VM=y
+CONFIG_DEBUG_OBJECTS=y
+CONFIG_DEBUG_KMEMLEAK=y
+CONFIG_DEBUG_STACKOVERFLOW=y
diff --git a/arch/powerpc/configs/locks_debug.config b/arch/powerpc/configs/locks_debug.config
new file mode 100644
index 000000000000..b2cb23de75db
--- /dev/null
+++ b/arch/powerpc/configs/locks_debug.config
@@ -0,0 +1,13 @@
+CONFIG_EXPERT=y
+CONFIG_PROVE_LOCKING=y
+CONFIG_DEBUG_LOCK_ALLOC=y
+CONFIG_DEBUG_ATOMIC_SLEEP=y
+CONFIG_DEBUG_LOCKING_API_SELFTESTS=y
+CONFIG_DEBUG_MUTEXES=y
+CONFIG_DEBUG_SPINLOCK=y
+CONFIG_DEBUG_RT_MUTEXES=y
+CONFIG_DEBUG_RWSEMS=y
+CONFIG_PROVE_RAW_LOCK_NESTING=y
+CONFIG_RCU_EXPERT=y
+CONFIG_PROVE_RCU=y
+CONFIG_RCU_TRACE=y
diff --git a/arch/powerpc/configs/lockup_debug.config b/arch/powerpc/configs/lockup_debug.config
new file mode 100644
index 000000000000..ad0a79abf60f
--- /dev/null
+++ b/arch/powerpc/configs/lockup_debug.config
@@ -0,0 +1,4 @@
+CONFIG_EXPERT=y
+CONFIG_WQ_WATCHDOG=y
+CONFIG_DETECT_HUNG_TASK=y
+CONFIG_PANIC_ON_OOPS=y
diff --git a/arch/powerpc/configs/mm_debug.config b/arch/powerpc/configs/mm_debug.config
new file mode 100644
index 000000000000..0e88eb983536
--- /dev/null
+++ b/arch/powerpc/configs/mm_debug.config
@@ -0,0 +1,24 @@
+CONFIG_EXPERT=y
+CONFIG_DEBUG_PAGEALLOC=y
+CONFIG_DEBUG_SLAB=y
+CONFIG_KASAN=y
+CONFIG_KFENCE=y
+CONFIG_KMSAN=y
+CONFIG_DEBUG_KMEMLEAK=y
+CONFIG_DEBUG_VM=y
+CONFIG_DEBUG_VIRTUAL=y
+CONFIG_DEBUG_OBJECTS=y
+CONFIG_DEBUG_OBJECTS_FREE=y
+CONFIG_DEBUG_OBJECTS_TIMERS=y
+CONFIG_DEBUG_OBJECTS_WORK=y
+CONFIG_DEBUG_OBJECTS_RCU_HEAD=y
+CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER=y
+CONFIG_SCHED_STACK_END_CHECK=y
+CONFIG_DEBUG_VM_MAPLE_TREE=y
+CONFIG_DEBUG_VM_RB=y
+CONFIG_DEBUG_VM_PGFLAGS=y
+CONFIG_DEBUG_MEMORY_INIT=y
+CONFIG_DEBUG_PER_CPU_MAPS=y
+CONFIG_DEBUG_KMAP_LOCAL=y
+CONFIG_DEBUG_HIGHMEM=y
+CONFIG_DEBUG_STACKOVERFLOW=y
--
2.54.0

