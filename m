Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17A83F3276
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791800488; cv=none; b=Y9b1z1Kf6y0ssFeFfPdNWjw5OnvfoeO0ZAhKBNBQJWKkvgVLqni6Kbv+JJ12b9KGZX77AmoDNKsCeKZPVQ7t43EAmoUkv9KVn6L8i6U5FF0s/bKEbawDkQ6SnvLHGedBwj8kVDv4FN87sIGJFjAZ07xDRr+V9R40N2jNST/LC5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791800488; c=relaxed/simple;
	bh=lBy+dl89A4spEA83ZdTdWdIrIdik2x3zlqKvvwn9okM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gl/HFCGpg758vTUvqcHVtTT/X9j+qKGREBKw39RF+QHZ9YkhR71OUXMgwa+0rROwrQ5yo7NQVjTjEmfb9ApKxLuProOE8s68HNToRa9QdFGjieCwquZzLbguujCD30c8DyvTKymvWxR93cV/BIJVZMPD/sI+gr6kU4VY0rlt7nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=k8rY7mMV; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="k8rY7mMV"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8iAFD3917815;
	Mon, 12 Oct 2026 10:21:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=xzx8yyTa2N6kW8axf
	0T5qGy+PahAfVEqrKrf7jTmM0k=; b=k8rY7mMVHFMmFsMQpvCuVbAteIS7UIfWk
	S27lvueGLvwr1LpfivHufVF5ioxpYksGfHd340iIKGhVdIa6NDuV3tuehts7u89u
	4WmSlUk6Gj5OBPyYIx8JiT/a8ZpXRPjJ2uUTzdyeXXJnhtEMh3ipembHvaybpZbg
	AfyLunugQ30getrsbVdQp6S9GTsEH8VA2HbFKBhp3vcBbTvmTjygMTr9CicaZm3+
	9Z2q1OXE9pEIeOvBUhvC2vD65KkDzqa6lhTkrlJiLxW3Wvocv5C/F+kNwHfwWAle
	3pWzEMbb1wAblXzUqbyOzjFSDHw8w7mR9ZSkJ9dcEgYHrQ6RlV7dA==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4h7dv38b08-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Oct 2026 10:21:00 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8K0de1013351;
	Mon, 12 Oct 2026 10:21:00 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4h82cycdre-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Oct 2026 10:20:59 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 69CAKuq352494756
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Oct 2026 10:20:56 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1BE962004E;
	Mon, 12 Oct 2026 10:20:56 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 94C3920043;
	Mon, 12 Oct 2026 10:20:51 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.124.215.77])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 12 Oct 2026 10:20:51 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, peterz@infradead.org,
        tim.c.chen@linux.intel.com
Cc: sshegde@linux.ibm.com, christophe.leroy@csgroup.eu,
        linux-kernel@vger.kernel.org, ritesh.list@gmail.com,
        kprateek.nayak@amd.com, yu.c.chen@intel.com, vineethr@linux.ibm.com,
        vincent.guittot@linaro.org, srikar@linux.ibm.com, npiggin@gmail.com,
        mpe@ellerman.id.au
Subject: [PATCH 2/4] powerpc/topology: Add docs for llc_override
Date: Mon, 12 Oct 2026 15:50:35 +0530
Message-ID: <20261012102037.2477378-3-sshegde@linux.ibm.com>
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
X-Proofpoint-GUID: D00o8eQo1I5r_OUBgNR4TM6igOoIh_zm
X-Proofpoint-ORIG-GUID: cue31ZNCDUOhHaSWz9uV0JPq7rXszquz
X-Authority-Analysis: v=2.4 cv=aqInmiZV c=1 sm=1 tr=0 ts=6accb48d cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8 a=goSn6fUrnbwpz7W_l2oA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0MCBTYWx0ZWRfX9aWDIc4qItRz
 RpkRNHG86foXdlPfCig8dgD/nchbdOTCiK90hxrnwZIH7LTdCgPgJEkl4MfgzIiKzeHSw5+bvEM
 Knj52vhenh549ZA0vrRtrhEoN2K8Nlk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0MCBTYWx0ZWRfX59MHEgoRBjbx
 iYlLp5V+uM219zBggafAzsj7YVA+tLuNQtWmIxkEgDpeE7k6jlBVf7AibbsXZIH4tqdlLB3QKi4
 0oUKqo71ImeYzpreCMK1GnThC259dr/gNWani5my6jMrCVgTG5XIn4gzjSFaNk8D++0ENpPxLPJ
 XcMJ+wHy+udeO5Fp8Ph2a/5udwQBuXiwlzzeRQvmboAqTSqKuvlL256nbyChbPAa0XkFUSKEeyM
 XQd0i/2+Rl0tLDhS78gxcjq/ZrdaLU6uux8FjGxpNfTb/WhPTUmHTeXccT5mTPbIFRbmUXG6C6d
 jtmivh+m+v+FMz7yzNa7tvUaeOsmIhUGR5zLFBXAl4U7oipr8auQ0BUxjGo+LkiSLdI8AoAaDgp
 NwQ3lcRBDDB9FJrE6gTTSTRBcAlDj+NfxI+E1IVeF2R9T9m/03HmJ7tfp06xHyXZkyWB/rABERb
 jAedTmoHBdHuGyySTMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120040

Provide documentation for the newly introduced debug knob
named as llc_override.

This may help one if they want to experiment with cache aware
scheduling.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 Documentation/arch/powerpc/index.rst    |  1 +
 Documentation/arch/powerpc/topology.rst | 27 +++++++++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 Documentation/arch/powerpc/topology.rst

diff --git a/Documentation/arch/powerpc/index.rst b/Documentation/arch/powerpc/index.rst
index 40419bea8e10..0f4caf50a9e7 100644
--- a/Documentation/arch/powerpc/index.rst
+++ b/Documentation/arch/powerpc/index.rst
@@ -33,6 +33,7 @@ powerpc
     qe_firmware
     syscall64-abi
     transactional_memory
+    topology
     ultravisor
     vas-api
     vcpudispatch_stats
diff --git a/Documentation/arch/powerpc/topology.rst b/Documentation/arch/powerpc/topology.rst
new file mode 100644
index 000000000000..9ed3cf7ade69
--- /dev/null
+++ b/Documentation/arch/powerpc/topology.rst
@@ -0,0 +1,27 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. _topology:
+
+
+llc_override
+==============
+
+Override the scheduler-visible LLC domain on PowerPC.
+
+Having LLC(last level cache) at MC/PKG helps to experiment with new
+scheduler feature called cache aware scheduling which expects LLC to have
+at least more than 1 core. Scheduler uses notion of LLC for wakeup and
+load balancing decisions.
+
+Accepted values are:
+
+  0    Disable the override and use the platform default.
+  smt  LLC will be at SMT domain.
+  mc   LLC will be at MC domain, including at SMT domains.
+  pkg  LLC will be at PKG domain, including at MC and SMT domains,
+
+Writing a new value rebuilds the scheduler domains. One can check the
+domain flags and look for SD_SHARE_LLC to confirm if it took effect.
+
+Note that this doesn't change HW cache topology. It is only a debug knob
+to experiment with scheduler related functionalities. So set it to sensible
+values. Also note that there is no performance guarantees across the values.
-- 
2.52.0

