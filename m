Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D693A56853B;
	Wed,  9 Sep 2026 13:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788962259; cv=none; b=i5UcJgYJ6sPEH/c8z1mQSpnTWS58zQnMUCKT8xQjG8z5UW+cW2rRSn24BYhq/dYOOKiK/3jS9ab05Vx0/tHB9TYEiywyQ2yuhNrkofl4f4G2WQK0fBjI5/Dcm2EIRdANzyxMAUKy5frq7C5HSAWejbwvFuY50CFrJFdED9tj+jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788962259; c=relaxed/simple;
	bh=KRcnPZxJ3TxjYbvZ/ffwiydMHYyd7oDraGjHWCGvvcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=crO71b2mFHywO0lJnfCqE3Bs7lAN8FN8siYcU62TzGcHJ6ooH12Yjz1zGgwfX9Lz77KfgIVWUlYQuYquXFz5FQdJvcpQBveUyINOc0sgPJTJUn5LtN5THOO4+h0ynQyakJwelYGSoSQIrpNR7icZv/bbRiWGWZWaNP72I2XI4/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=pvnbzR0y; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="pvnbzR0y"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689B1gQ03802446;
	Wed, 9 Sep 2026 13:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=zmk93sQzf03EanZhV
	Bee2OYiiS4IEVygsO5Vm1CSPyc=; b=pvnbzR0ylmPna7lHdHrMuFADljixaIfSW
	yx64r50kn51SEGl1AtMTkJKCmJn5+dkhJL+Q5QVvMEWU0+tTzo+To71gLB+rwYX5
	AxJJ/rxp7+0vB8IH2j7mNctRexFkiVAkzlcd6E0IwIjQl4de+Ad3D7O3rNjfbXY9
	J4fvhV5wE/W5QZYRR3aX0W2M69IU8ZackNl7OpY1NwRvki3+qm8fNGH1s+CuIoaJ
	wrQcFftGGhvjGwdbpd6Om9aOJW4F2TlbE/AjdIBkeuNU0jzQ3OkTbrof3yiF3tQw
	u7Q0RuNURQFlcdLb04tNj3r2Z3E1eulIw1LgBwfp+vPr97FHR/IwQ==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ggbhkx9ma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 13:57:31 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 689DuFLW011978;
	Wed, 9 Sep 2026 13:57:30 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ggxwhahga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 13:57:30 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 689DvSmY49611184
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Sep 2026 13:57:28 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DB16720043;
	Wed,  9 Sep 2026 13:57:27 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EBD9220040;
	Wed,  9 Sep 2026 13:57:16 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.124.210.73])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  9 Sep 2026 13:57:16 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        yury.norov@gmail.com, kprateek.nayak@amd.com, iii@linux.ibm.com,
        corbet@lwn.net, meted@linux.ibm.com, ynorov@nvidia.com
Cc: sshegde@linux.ibm.com, tglx@kernel.org, gregkh@linuxfoundation.org,
        pbonzini@redhat.com, seanjc@google.com, vschneid@redhat.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        maddy@linux.ibm.com, srikar@linux.ibm.com, hdanton@sina.com,
        chleroy@kernel.org, vineeth@bitbyteword.org, frederic@kernel.org,
        arighi@nvidia.com, pauld@redhat.com, christian.loehle@arm.com,
        tj@kernel.org, tommaso.cucinotta@gmail.com, maz@kernel.org,
        rafael@kernel.org, rdunlap@infradead.org, kernellwp@gmail.com,
        linux-doc@vger.kernel.org, jgross@suse.com,
        virtualization@lists.linux.dev, sunlightlinux@gmail.com
Subject: [PATCH v13 05/13] sysfs: Add preferred CPU file
Date: Wed,  9 Sep 2026 19:26:09 +0530
Message-ID: <20260909135617.871006-6-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260909135617.871006-1-sshegde@linux.ibm.com>
References: <20260909135617.871006-1-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE1MSBTYWx0ZWRfX7qK+tLHkNLHB
 2VjFD/iIyD0965fEs6e0pQZbdCKJCCz2PERKWoVUKVPqXeZ7gcBjMj/+7QqfF2iNqlSPMJ9D5Ly
 GrYpSYZW/g81OBgpJ2NnYSkPl7TBUkQ=
X-Proofpoint-ORIG-GUID: 4tQOJthREYog_ohXMRHcyKDrhqjqZhwK
X-Authority-Analysis: v=2.4 cv=NMDlPU6g c=1 sm=1 tr=0 ts=6aa165cc cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8 a=VwQbUJbxAAAA:8
 a=94fVmjRkuoLjN79_KVgA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE1MSBTYWx0ZWRfXzj1O+Zk/YIVC
 6iKsfuxJxr1+LXQwUAMAZCtBuCtUdLut9/18OQXzjM+654DrF2q0rrMfegE9L/a3hAriTEJVI1F
 dxm1+Wq9GLPAVwIolUok5fA4n1rZpn6/42UPsQBjjkys58cTPD4WewPy4SLmqXEA5NYtXPTAIgD
 Fqf0F0MHDrIdRD6va/c0+9opMzziWAqa87vSs8CRDhDlu1K8h8GRwTB2kJGcdlZAMCkNo7yTz4h
 JMSr5SMfn0G3EOXrf//lvmliY7TvIRqCVraLsBLl7bdFFKszoJJraQ9Xj5AlFz9BuVDA1V+q0uK
 ksgmJaEk5kQxTjtAyn1I0wtnVZkGySPnQrxFI3gO00pQk0elS/Sdv4sFw77qx91olcWpZlUmv/3
 IFNVm2PduBSyqqQoK3XFO5GVvKrXfbw8EQJNLQMHsCB7nTSuOe9mVl2Z5DvFn694Ym0NscM4wv/
 c1Bta6pFTceW7l/le0Q==
X-Proofpoint-GUID: 2_069fPvK8xd2v_glJOH1V5VGNnYRCLy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090151

Add a "preferred" file in /sys/devices/system/cpu/ when kernel is
built with CONFIG_PREFERRED_CPU=y.

This would help
- Users to quickly check which CPUs are marked as preferred.
- Userspace daemons such as irqbalance to use this mask to
  route irqs into preferred CPUs.

For example:
cat /sys/devices/system/cpu/online
0-719
cat /sys/devices/system/cpu/preferred
0-599        <<< Implies 0-599 are preferred for workloads and 600-719
                 should be avoided at this moment.

cat /sys/devices/system/cpu/preferred
0-719        <<< All CPUs are usable. There is no preference.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 Documentation/ABI/testing/sysfs-devices-system-cpu | 14 ++++++++++++++
 drivers/base/cpu.c                                 | 12 ++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-devices-system-cpu b/Documentation/ABI/testing/sysfs-devices-system-cpu
index 82d10d556cc8..8f250b8693b8 100644
--- a/Documentation/ABI/testing/sysfs-devices-system-cpu
+++ b/Documentation/ABI/testing/sysfs-devices-system-cpu
@@ -806,3 +806,17 @@ Date:		Nov 2022
 Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
 Description:
 		(RO) the list of CPUs that can be brought online.
+
+What:		/sys/devices/system/cpu/preferred
+Date:		Sep 2026
+Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
+Description:
+		(RO) the list of preferred CPUs applicable in
+		paravirtualized environments.
+
+		The steal governor driver dynamically adjusts this mask
+		based on observed steal time. Scheduling tasks on
+		CPUs outside of this list may lead to performance
+		degradations due to underlying physical CPU contention.
+
+		See Documentation/scheduler/sched-paravirt.rst for more details.
diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
index 69e52fed4241..747915ff974f 100644
--- a/drivers/base/cpu.c
+++ b/drivers/base/cpu.c
@@ -391,6 +391,15 @@ static int cpu_uevent(const struct device *dev, struct kobj_uevent_env *env)
 }
 #endif
 
+#ifdef CONFIG_PREFERRED_CPU
+static ssize_t preferred_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%*pbl\n", cpumask_pr_args(cpu_preferred_mask));
+}
+static DEVICE_ATTR_RO(preferred);
+#endif
+
 const struct bus_type cpu_subsys = {
 	.name = "cpu",
 	.dev_name = "cpu",
@@ -531,6 +540,9 @@ static struct attribute *cpu_root_attrs[] = {
 #endif
 #ifdef CONFIG_GENERIC_CPU_AUTOPROBE
 	&dev_attr_modalias.attr,
+#endif
+#ifdef CONFIG_PREFERRED_CPU
+	&dev_attr_preferred.attr,
 #endif
 	NULL
 };
-- 
2.52.0

