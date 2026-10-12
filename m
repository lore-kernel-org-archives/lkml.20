Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C244E3DA7D2
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791800506; cv=none; b=cFX2HSgPYR41/gX1NlKrzK8i1xJbQR6OM8AInyyPErq8FMnMrBpJuNLOe097QOgMN+CgS1nEZNqjXdqkkIu1xNm7ttlsz+7vWZ/ecYi7ejYgGuOG0pkdX89lSGaYC3z9u8BF/r/fzylFG/6bcf/cKGvpvGqg88hh/G03xP4tx38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791800506; c=relaxed/simple;
	bh=AYPP/LZgSp0Ae2RbA8JULz9F5Oc4OjYmrmHiwEVMUpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WUdnO0UE4dU45ZsDx6LX0jPKMRkEiIoaPpa06dz1lprXXcobYFQQcPX2S/7N/A+Dtbf3TZsJSmTYkkY57le06KSDIkGrepZLhqzf4OW7BvoVJS68cDKv5JHeiInQPBkdBqgGCsOdGvlmCgYzOK1LmaRl0HNU4B1trMEKlzi67SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=TWKx8kQT; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="TWKx8kQT"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8iMqE2750226;
	Mon, 12 Oct 2026 10:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=yqE0pceYfaVgK/JAI
	EXJNAZFQIMoUb7ZGWBtyF0tUj8=; b=TWKx8kQTqB6Nqpi5DAT2FcbksGcAYa3qF
	yjgdoYDSgx0eCKD1BIClpCDpWdxDd28U89sdE5ITNNd2/1NBGeCxojmum2gJeMec
	bsgl0/Pg0Mc/fI4MaGB5ML0AYnT1igypYYevBiB96zNfhhIADV5m2hBIj8hhWxcU
	xb1yI5pYlEqjWnovTYF4OQQuooIHLl3mcnQ4w/LMQUxw09LVLO6d7IUc6T1Qs69N
	Dw6p7QPePoInqHSAicQyfDwoBN+odX82+dyw/QMyBc1wdz/Wb7xCI2yjlHT4RCls
	Pnxkts7m3DYcppuqFYV6qrbswE7u6beoeo+GP5stZNzdicMUsM+fw==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4h7dv0812c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Oct 2026 10:21:10 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8K4Hx3934769;
	Mon, 12 Oct 2026 10:21:09 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4h81wfvger-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Oct 2026 10:21:09 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 69CAL6iw47645034
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Oct 2026 10:21:06 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 280B720043;
	Mon, 12 Oct 2026 10:21:06 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EB4AD20040;
	Mon, 12 Oct 2026 10:21:01 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.124.215.77])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 12 Oct 2026 10:21:01 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, peterz@infradead.org,
        tim.c.chen@linux.intel.com
Cc: sshegde@linux.ibm.com, christophe.leroy@csgroup.eu,
        linux-kernel@vger.kernel.org, ritesh.list@gmail.com,
        kprateek.nayak@amd.com, yu.c.chen@intel.com, vineethr@linux.ibm.com,
        vincent.guittot@linaro.org, srikar@linux.ibm.com, npiggin@gmail.com,
        mpe@ellerman.id.au
Subject: [PATCH 4/4] powerpc/topology: Rebuild sched domains on llc_override change
Date: Mon, 12 Oct 2026 15:50:37 +0530
Message-ID: <20261012102037.2477378-5-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261012102037.2477378-1-sshegde@linux.ibm.com>
References: <20261012102037.2477378-1-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0MCBTYWx0ZWRfX4JPSI3NXVT2j
 cOv1q83l0pwEEPrF9c4Lz3LIwQLNxiiYVhjEP22dFIN5rvq71DjvChpJRkQKgVNlwTuF5TEfs2n
 aeWSgYTwrgnRsVQeS8KH5bv2z4tTc3fD9q2Krz3BY3n68fKI4zJ3j3mOHn/TmrvkZncaf9m3AIs
 PxsKTXjXZWE205l1W33PalZgwI9S1LzuBPBLqCnK9/P9vLSCWzZwIWMrILPYh888CoIxM6rBxnq
 rRNtL5ZlLEQy2zDYXhxgtDqFD7uVM7vN0EOnO28NESYISPSBHFSdTnsDCjzZELX6svYMC7MLVvk
 G5QgtHPJlfFzEJyTJmfRdqdPCXm1P88aWStBbBq24ZLgTLlS4bXX4Kilv6cqHtShiVRzlX1Nmee
 LeA7szXpyIe5PRWQ5//gO6+BE+47iErPTWdjGrCAqT4+atwrmKQOWCojo/BdOn3P4upbBXWh0th
 Tu72pKdjq6+YdgpGxVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0MCBTYWx0ZWRfXwdxou7C2f4un
 SK0DIlE2CdzcatUOXvSxGXVrtMiy1DoY5vxw6ZRj12w6I0GZ8A5gOvteCtdkFEG7L8ArP0XobtS
 d/ILFZNTsjwd3dfl3mj01tMgh/4qThM=
X-Proofpoint-ORIG-GUID: 4Pa8r40YIwhySoGg7EA6RM6_reRZJIMN
X-Authority-Analysis: v=2.4 cv=a6KlZkSF c=1 sm=1 tr=0 ts=6accb497 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8 a=VoiLvOrikwrOPNCf7twA:9
X-Proofpoint-GUID: sWDCCqh9Iy2EYwirXgS20nHHvOUk79Jv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120040

On changing the llc_override, rebuild the sched domains.

For the rebuild to happen, indicate it to the scheduler that
complete rebuild of the sched domains need to happen
via arch_update_cpu_topology(). 

With this, llc_override functionality is complete.

For example, on CPU10, 
domain0/name:SMT
domain1/name:MC
domain2/name:PKG

echo 0 > /sys/kernel/debug/powerpc/llc_override
SD_BALANCE_NEWIDLE SD_BALANCE_EXEC SD_BALANCE_FORK SD_WAKE_AFFINE SD_SHARE_CPUCAPACITY SD_SHARE_LLC SD_PREFER_SIBLING
SD_BALANCE_NEWIDLE SD_BALANCE_EXEC SD_BALANCE_FORK SD_WAKE_AFFINE SD_PREFER_SIBLING
SD_BALANCE_NEWIDLE SD_BALANCE_EXEC SD_BALANCE_FORK SD_WAKE_AFFINE SD_PREFER_SIBLING

echo mc > /sys/kernel/debug/powerpc/llc_override
SD_BALANCE_NEWIDLE SD_BALANCE_EXEC SD_BALANCE_FORK SD_WAKE_AFFINE SD_SHARE_CPUCAPACITY SD_SHARE_LLC SD_PREFER_SIBLING
SD_BALANCE_NEWIDLE SD_BALANCE_EXEC SD_BALANCE_FORK SD_WAKE_AFFINE SD_SHARE_LLC SD_PREFER_SIBLING
SD_BALANCE_NEWIDLE SD_BALANCE_EXEC SD_BALANCE_FORK SD_WAKE_AFFINE SD_PREFER_SIBLING

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/kernel/smp.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 4b6512d25f73..6a4ee7d3b8e5 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -37,6 +37,7 @@
 #include <linux/clockchips.h>
 #include <linux/kexec.h>
 #include <linux/debugfs.h>
+#include <linux/cpuset.h>
 
 #include <asm/ptrace.h>
 #include <linux/atomic.h>
@@ -1863,6 +1864,16 @@ void __noreturn arch_cpu_idle_dead(void)
 
 #endif
 
+int arch_update_cpu_topology(void)
+{
+	if (READ_ONCE(llc_override_changed)) {
+		WRITE_ONCE(llc_override_changed, 0);
+		return 1;
+	}
+
+	return 0;
+}
+
 static ssize_t llc_override_get(struct file *file, char __user *ubuf,
 				size_t count, loff_t *ppos)
 {
@@ -1909,10 +1920,10 @@ static ssize_t llc_override_set(struct file *file, const char __user *ubuf,
 	if (override != READ_ONCE(llc_override)) {
 		WRITE_ONCE(llc_override, override);
 		WRITE_ONCE(llc_override_changed, 1);
-		pr_info("sched LLC override set to %s\n",
+		pr_info("sched LLC override set to %s. Rebuilding sched domains\n",
 			llc_override_str[override]);
 
-		/* Will be calling rebuild sched domain in later patches */
+		rebuild_sched_domains();
 	}
 
 	mutex_unlock(&llc_override_mutex);
-- 
2.52.0

