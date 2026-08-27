Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210F526CE05
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787832866; cv=none; b=lt+HwtH6JhMHU3zkxRmNavQGotk8qyOyckxVL7kznucJkIdthAYIbLcCtN6HmkA+kOhN3kOdNFOTu4u9KpOHifZhraHlsW9l+fnWI+YvBX+kNgfy/AnFICdSQr2U9Pla9JKy/eCAVNeun9996Fbmcmgi3AECbfi89uTTQQnvVqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787832866; c=relaxed/simple;
	bh=fwgvCkNeSA5l34Y0iCt3LsKvvAmdvPfuM3OSSi9Lmag=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RyZUOetfIhlJbP4mQpv1BYQOFdGrQYIswsRgvV4gnXXfJSuTUDDQMChc9IXU5dxp8MVSUUOTCYxg2moYqcuDvI6gDBozTZadKn0J4zaR7IvGG79KrsjuMJJA3tNPvP+ulNLGNZ3eqQzNSatMaJPa2NupKi8kBSGI1DJ3jhAw0UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=UZm6XEva; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="UZm6XEva"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R9Vgkk2607971;
	Thu, 27 Aug 2026 12:14:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=spWKnohdNvRYFIvl5WzTPlmVhzuGAQjnlWZPGQae6
	LI=; b=UZm6XEvaXvnzDGtPmyQ/T1tcdA6xQf267h3R8zsTfiPRwggsiqpJuCQ2n
	eFalNFY1n9AwsWcD7KAQK9kD5fSB9AdZPd5UYfwEc2yGibkOfCni91TzvZySm5er
	QLQU/GKaf1FLzPDpyLJ4ncU/ST+GKzpyBLY8bQ1z+ywTpgO1nvtTK+b4bTntdYos
	6rIaXPrlVoLXtjd9TICgYQ1bEVTJV+Jgq2OqAnPdo1h1oiDSqZi7Pfp+3nvyYKM8
	CVdJiOcNC963NsmV/oFgBANToFBUDg6Q4vZBUiHDBGuM0X6P3Bwlg/6uIhY4wXdA
	UbosYgFC/jSxUF1y5Owyt8wjyeX0w==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4g73g557wx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Aug 2026 12:14:14 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67RCCbR5009860;
	Thu, 27 Aug 2026 12:14:13 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4g7p3qg508-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Aug 2026 12:14:13 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67RCE7DV46072294
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Aug 2026 12:14:09 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3DF972004B;
	Thu, 27 Aug 2026 12:14:07 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6F1D020043;
	Thu, 27 Aug 2026 12:14:05 +0000 (GMT)
Received: from dhcp-9-123-15-208.bl1-in.ibm.com (unknown [9.123.15.208])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 27 Aug 2026 12:14:05 +0000 (GMT)
From: Gautam Menghani <gautam@linux.ibm.com>
To: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        chleroy@kernel.org, ritesh.list@gmail.com, sshegde@linux.ibm.com
Cc: Gautam Menghani <gautam@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] powerpc/configs: Add debug configs for debugging
Date: Thu, 27 Aug 2026 17:43:08 +0530
Message-ID: <20260827121309.94434-1-gautam@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: iBgxXwSzrxVEIe5B-cEzHxSa9U6BNBQc
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDEwMCBTYWx0ZWRfX3QvNoLsAeeNM
 +fXX1FhcZim0wj5I/BxgEollY9CUkPQ+uAVsvCbs0DBwggI9n4gMqiZD0W5QTExCkMWZgZIZ+NQ
 NL58/tAvy1j2x4xORbaElVRNBIPxgb8=
X-Proofpoint-GUID: cv4JOi0HHlZk08lkopuf3VYP2zhZ98d-
X-Authority-Analysis: v=2.4 cv=JZyMa0KV c=1 sm=1 tr=0 ts=6a902a16 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8 a=DbwssUh_5Ore-AhUxMUA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDEwMCBTYWx0ZWRfX23nvJu8o4Z/b
 MeHQtgro9Xj5mvIcKFqKGjJgC1FjGX9SflHLZpajaoZpcyS4Pg1Ck2FwvrjIcFf9IKY303d3cc0
 2QPzT357xoKMEgdewzpkqQV0RL4YIIyBhM5Ol2Yin/AxXbv7hknvTaPJBJIJz/ZzrSN15ogmK2S
 X5fA+rLED7YQ6FdYvrJJ0jK0SqMWmGXptscT+gRRove8we4NTjkxhKAANIcIr0XjnxyYphDJ+CP
 a593/az3R00JJzIHEs2A6r8wpWvlIUbtCjfVnVL132jfa4dHK3dSJkiAzM6I/C1KvJBNZFPmHhX
 pvsYH2ez1xZTuFjnTLdNQRhIkpsavcihshwFHQ8WRXl+jNnGKQijhdwj+IoM4KWicZcmZx2NJmi
 yV9WSWNBTe00LM+8WRJw+Cy+b/Nn9ivy2wIMnE+Lm8G+6CQkrLe46VhWQAOS5nHmWJenLj+jRqT
 J1yI/eoOZ3E/wwXcYMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270100

Kernel has multiple config options to run extra validation checks that
can help catch bugs. Define new configs for major subsystems to
make it easy to enable the debug config options for a given area.

Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
---
v1 -> v2:
1. Split the enablement of configs into pseries and powernv configs.

 arch/powerpc/Makefile                    | 32 ++++++++++++++++++++++++
 arch/powerpc/configs/common_debug.config | 11 ++++++++
 arch/powerpc/configs/locks_debug.config  | 13 ++++++++++
 arch/powerpc/configs/lockup_debug.config |  4 +++
 arch/powerpc/configs/mm_debug.config     | 24 ++++++++++++++++++
 5 files changed, 84 insertions(+)
 create mode 100644 arch/powerpc/configs/common_debug.config
 create mode 100644 arch/powerpc/configs/locks_debug.config
 create mode 100644 arch/powerpc/configs/lockup_debug.config
 create mode 100644 arch/powerpc/configs/mm_debug.config

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 9385db478c59..818aacace875 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -352,6 +352,38 @@ ppc64_randconfig:
 	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/powerpc/configs/64-bit.config \
 		-f $(srctree)/Makefile randconfig

+generated_configs += pseries_debug_defconfig
+pseries_debug_defconfig:
+	$(call merge_into_defconfig,ppc64_defconfig,le guest kvm_guest common_debug)
+
+generated_configs += pseries_locks_debug_defconfig
+pseries_locks_debug_defconfig:
+	$(call merge_into_defconfig,ppc64_defconfig,le guest kvm_guest locks_debug)
+
+generated_configs += pseries_mm_debug_defconfig
+pseries_mm_debug_defconfig:
+	$(call merge_into_defconfig,ppc64_defconfig,le guest kvm_guest mm_debug)
+
+generated_configs += pseries_lockup_debug_defconfig
+pseries_lockup_debug_defconfig:
+	$(call merge_into_defconfig,ppc64_defconfig,le guest kvm_guest lockup_debug)
+
+generated_configs += powernv_debug_defconfig
+powernv_debug_defconfig:
+	$(call merge_into_defconfig,powernv_defconfig,le guest kvm_guest common_debug)
+
+generated_configs += powernv_locks_debug_defconfig
+powernv_locks_debug_defconfig:
+	$(call merge_into_defconfig,powernv_defconfig,le guest kvm_guest locks_debug)
+
+generated_configs += powernv_mm_debug_defconfig
+powernv_mm_debug_defconfig:
+	$(call merge_into_defconfig,powernv_defconfig,le guest kvm_guest mm_debug)
+
+generated_configs += powernv_lockup_debug_defconfig
+powernv_lockup_debug_defconfig:
+	$(call merge_into_defconfig,powernv_defconfig,le guest kvm_guest lockup_debug)
+
 PHONY += $(generated_configs)

 define archhelp
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

