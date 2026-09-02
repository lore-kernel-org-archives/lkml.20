Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C463748BD5B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788352600; cv=none; b=u5GymXtxZo7sse2lLb2DRZR7Uu5kZD5HaTeJX/fZ5h8K37kmC8mLceuO48FIz2hEKecj+/4UIL2jlQu8QiUnpgLfJLuQPPqq1E1ISloDKk8Z4AmAPBuXVTaIkcHtwmS+X8zLksLxHrBfZy56PU2WNcKb+XIbBez0V8BFU/gF3x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788352600; c=relaxed/simple;
	bh=9GvD+GOCb4CQvSnQ4pluwjVf4ut6d9HD0C3yfLJGIls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YT+OI0KjYJM+0zGqksYeHUeqJxWuG+D/UYfMBKbm5/7EYBd1oZ8v8+JPLeiKuZjbI+Sw3pdzenVYixvcg41glhruvJa4YzMYO9xxJMng1Qvend+Q9MfP5f2G2FAYQ3twUkz/Smef65PNNVSwRlIK7DCPJq46dVg94cOE1kO/xIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=tKtuB7ns; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="tKtuB7ns"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682CVtZ23058750;
	Wed, 2 Sep 2026 12:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=nMsE4g9GesjD7JaEE
	Qmaw7jiefOtsdEaQcrJhBaHLXw=; b=tKtuB7nsk+v4ZueEqZ12V4NDRRQEqJ1XS
	fR2HHN8ep+VzZm3kvotcDGxbGOeev0vbDOhwtZewy3vcpms7nNLfsckMKXcc9/NQ
	DORejineebgWRdjr853Uj5p1xbf4hlU6AzGUPFQOO3rwwvgKg3JQEoQW3qt9N6Eq
	4PoVxRcQHecf20VvqwXFz3PwrSNTQ5ZQfKKVNxhKyIDuGifZHFsU93K7jnsWxm9e
	YrgQaZo3aFvO2NAXQ+2azPVGD1Dm+tUPnAAC+l0o4dEt50l3SuZI7IWdRgs1f3XX
	lyVH3QS0tS/wePuAIqtfqQL7MwiKF3TIf7wMIX2VPCmSGBQvhPiQA==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gbnudx4fw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Sep 2026 12:36:11 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 682CTxOw024891;
	Wed, 2 Sep 2026 12:36:10 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gecjaj06c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Sep 2026 12:36:10 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 682Ca6qS42205496
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Sep 2026 12:36:06 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 66D792004E;
	Wed,  2 Sep 2026 12:36:06 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 288B320040;
	Wed,  2 Sep 2026 12:36:02 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.111.3.140])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  2 Sep 2026 12:36:01 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: skiboot@lists.ozlabs.org, arbab@linux.ibm.com, mahesh@linux.ibm.com,
        Srikar Dronamraju <srikar@linux.ibm.com>,
        Ritesh Harjani <ritesh.list@gmail.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Valentin Schneider <vschneid@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] powerpc/numa: Allow cpu_to_coregroup_id without PPC_SPLPAR
Date: Wed,  2 Sep 2026 18:05:01 +0530
Message-ID: <20260902123458.340456-7-srikar@linux.ibm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902123458.340456-5-srikar@linux.ibm.com>
References: <20260902123458.340456-5-srikar@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 01rGl9lp5g7PtLyqILVC7_dUmBhn-XcW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDExMSBTYWx0ZWRfX7Cbxin9VzUcj
 BzgICq6A0g1w/HBvaljmtKwQ7bi5oXYrnEG2Vork9FPY7AcSQ58E5EaiU/jMqqtSR41RzVeO/+t
 dBI4uyuCVxVPxbTQRjlXRQ3D+teDeJN0ZCQ56Xjjlj1urpH0Xjx85HJvO/j8hVlmMjo1lfuwYE8
 Zu7Yt08I1Z4Lgah89rHLR7K8+emUPHjm99UT/BMu1kSWdtcPa1vsa/UTz/fhqMiI/Zy9xd1DjxN
 OoadbaGbkdrcQi4qvGc3xZMrA/nKPIPr3arxPNoxpNEF0W6TKyS9qCK+5tqUSHlm/b4dfM5ZI61
 yQPaRzuu1Wzqbz+uTANZaO9odNrY17iLeMsCLWCIt5ffrq7tKWa8lZSO+9QSVaNxzp95hIVcxb+
 b6wRZas4eBdSFIgmM5Ak1Vh11kJE2bvej52kY1FAdr6AM9i0LJc/MNRmCG14/kf+cwwQooI74hN
 S3lE+sHLcPgDOaKx4Ow==
X-Proofpoint-ORIG-GUID: vIMyHADCWNuYwwpb2iUti40KXHm4-m6W
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDExMSBTYWx0ZWRfX0WBajkF5NENa
 Bl+Unp1TDQ9mY/L24+PjuhFSWyGD7iUKZqGw/uWQF/hhf7HMECvVCrz3UoEyprWKr9yYXcQsLGB
 clZrYYvdCC8A4XPEnDzrmnqwuM9bmZY=
X-Authority-Analysis: v=2.4 cv=B92JFutM c=1 sm=1 tr=0 ts=6a98183b cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8 a=7dv0z3e6AKYFnwaEaUMA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1011 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020111

Make cpu_to_coregroup_id() available outside PPC_SPLPAR so it can be
used by platforms that do not rely on the SPLPAR-specific VPHN path.

Keep the existing fallback behavior by returning the core ID when
coregroup information is unavailable.

Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
---
Changelog from v2:
- Handle comments from Ritesh (one hunk needed to be moved from patch 2 to
  patch 3 to build correctly)

Changelog from v1:
- Handle comments from Christophe Leroy; Remove extern key word in
  declaration

 arch/powerpc/include/asm/topology.h | 15 +++++++--------
 arch/powerpc/mm/numa.c              | 22 +++++++++++++++-------
 2 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
index 44ec416fa489..02c3c9ab3ea9 100644
--- a/arch/powerpc/include/asm/topology.h
+++ b/arch/powerpc/include/asm/topology.h
@@ -71,6 +71,7 @@ extern void map_cpu_to_node(int cpu, int node);
 extern void unmap_cpu_from_node(unsigned long cpu);
 #endif /* CONFIG_HOTPLUG_CPU */
 
+int cpu_to_coregroup_id(int cpu);
 #else
 
 static inline int early_cpu_to_node(int cpu) { return 0; }
@@ -107,14 +108,6 @@ static inline void map_cpu_to_node(int cpu, int node) {}
 static inline void unmap_cpu_from_node(unsigned long cpu) {}
 #endif /* CONFIG_HOTPLUG_CPU */
 #endif /* CONFIG_SMP */
-
-#endif /* CONFIG_NUMA */
-
-#if defined(CONFIG_NUMA) && defined(CONFIG_PPC_SPLPAR)
-void find_and_update_cpu_nid(int cpu);
-extern int cpu_to_coregroup_id(int cpu);
-#else
-static inline void find_and_update_cpu_nid(int cpu) {}
 static inline int cpu_to_coregroup_id(int cpu)
 {
 #ifdef CONFIG_SMP
@@ -124,6 +117,12 @@ static inline int cpu_to_coregroup_id(int cpu)
 #endif
 }
 
+#endif /* CONFIG_NUMA */
+
+#if defined(CONFIG_NUMA) && defined(CONFIG_PPC_SPLPAR)
+void find_and_update_cpu_nid(int cpu);
+#else
+static inline void find_and_update_cpu_nid(int cpu) {}
 #endif /* CONFIG_NUMA && CONFIG_PPC_SPLPAR */
 
 #include <asm-generic/topology.h>
diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index c44a80d8fc11..5f326b005a2a 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -1428,6 +1428,21 @@ void find_and_update_cpu_nid(int cpu)
 	pr_debug("%s:%d cpu %d nid %d\n", __func__, __LINE__, cpu, new_nid);
 }
 
+static int topology_update_init(void)
+{
+	topology_inited = 1;
+	return 0;
+}
+device_initcall(topology_update_init);
+
+#else
+static long vphn_get_associativity(unsigned long cpu,
+					__be32 *associativity)
+{
+	return -1;
+}
+#endif /* CONFIG_PPC_SPLPAR */
+
 int cpu_to_coregroup_id(int cpu)
 {
 	__be32 associativity[VPHN_ASSOC_BUFSIZE] = {0};
@@ -1453,10 +1468,3 @@ int cpu_to_coregroup_id(int cpu)
 	return cpu_to_core_id(cpu);
 }
 
-static int topology_update_init(void)
-{
-	topology_inited = 1;
-	return 0;
-}
-device_initcall(topology_update_init);
-#endif /* CONFIG_PPC_SPLPAR */
-- 
2.43.7

