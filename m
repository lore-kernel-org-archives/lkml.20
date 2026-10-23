Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792761449;
	b=CSyGo98yhm8yCbPZF6WTCmDcL5yK+kwuvvdWIeRaWrcgQrm9Beaog2JC6RNO6Sotpbmb
	 zeS49ASoA7Hx+ld1yiaqlPQWT4D1ZhOHBkCN9qx874xjvOWjH1fe4JPYkMhR8EHf/eJEr
	 uxo33JFFJrAT4TuFwz9Ov7ec2jo2kqMVpLTOBiIBjcU+PAKf1t3aDemcJ5sYmgmqOC2ew
	 YHRnq0jiwEuv2WuiphkPU2RDETzAAzKSIPUc8uP9DJmwtAAH0tXdwog7QgskvcdkAfY2z
	 OsFR60D8QHFgnDYhF/0YFSRJpcJ9yLKYQhycfTrku747cvYehc4f2WsNdU2HNnVmKDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792761449;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-TM-AS-GCONF:X-Proofpoint-Reinject:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qVX/nRcZvB0b9d3wqQbCXtRdYuKkjKsZPRmReAZp0Qg=;
	b=o8MEnNmmkFxw3IoA+R50tp2dDnEodP9iLbw13FuZ++PTRMCwO8S0MS6FCtED8OaTiba+
	 hS7I0djKjSK5iLgYUq8urZjtx0uH7AOE+9DKNppKy7wstPowZ18D5h322EPqD+YP+a4XD
	 tTAuviJZjJq5GzolYY+6DFNZvQnC8pug2T1QnlsdDMCtp3NmSKLm2xm5zHNWwPD3j/ZbR
	 dWp+SbEQjXpsxaM5HhOG5T++IWRPpTPpY1AE14y78PrmPsWKhHQTQ1h3U9thUs3O8mKfO
	 YF6kuzw4e306ljmps7B17MYljbw3snYzwnXkOZ6VhniFLLBd/G2gcYmqBpais8SujAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N6bwKHgF;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2DE606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:17:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C2DE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N6bwKHgF
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAEL3f2615497;
	Fri, 23 Oct 2026 13:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=qVX/nRcZvB0b9d3wq
	QbCXtRdYuKkjKsZPRmReAZp0Qg=; b=N6bwKHgFyV50uNQ71/h/NKy2LnWOwmuOQ
	1+jAbMn3ZRtPegqTMGmXtOIUk1wQ/kIVAsq+WKNIspXp5YsebsgPaZdpS62umvKT
	PoC0zBmAP6l0ZR0rfKsaQSipmeI7WugQMj0k7bmy5200QD6lFU7D7RRhtPsNhEK1
	AGPOcPFGQkiSMENalDLUpSFuFbzxsdjwXeO+zj8h/qsjf/fmH5qfF4iTm2iJyOPA
	NaSOn+qepxPwTxIJR68+AXW4pXnBxNtoSK4DeANd3qppyRvMGZqay76VYrkyjXQX
	jYPdK0tZjwyG4VT/i855DiJQDPJLewTsZqffSf8unkQ5ONLID4SiA==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hdw5acnju-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Oct 2026 13:17:03 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAKCv42010293;
	Fri, 23 Oct 2026 13:17:02 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4hfgck5kgw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Oct 2026 13:17:02 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 69NDGwKT49479956
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Oct 2026 13:16:58 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6BFD520043;
	Fri, 23 Oct 2026 13:16:58 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2920F2004B;
	Fri, 23 Oct 2026 13:16:54 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.19.68])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 23 Oct 2026 13:16:53 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, peterz@infradead.org,
        tim.c.chen@linux.intel.com
Cc: sshegde@linux.ibm.com, christophe.leroy@csgroup.eu,
        linux-kernel@vger.kernel.org, ritesh.list@gmail.com,
        kprateek.nayak@amd.com, yu.c.chen@intel.com, vineethr@linux.ibm.com,
        vincent.guittot@linaro.org, srikar@linux.ibm.com, npiggin@gmail.com,
        mpe@ellerman.id.au
Subject: [PATCH v2 1/4] powerpc/topology: Introduce llc_override kernel parameter
Date: Fri, 23 Oct 2026 18:46:43 +0530
Message-ID: <20261023131646.2907938-2-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023131646.2907938-1-sshegde@linux.ibm.com>
References: <20261023131646.2907938-1-sshegde@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MSBTYWx0ZWRfX8oUL74Lj7UaP
 P+kUHr0Sp+x0QjsbBD4aUu3VPyA2SnlPhLTdzZUtoGxx0n2NfXbyE2WE26Syl2udxc9DNTA/Puh
 xDxWmMt221pfrzGYk2Q/LBI/q4ro9cv52VLFZbKSDJsBdQHUEHrvvuGjBu1AE5D0AdkVOb194+U
 5wS4KoF94euA5CIHkJAsJd+pnDOUjG8x1SuB4IPAraORVcDRTCWJHKrJL0eIwSu74/pmhFFBaYG
 rmpZ5n/4/2CEH8jaV91AClm6C0L/tfsb3UTK6mUS3IHm5pGhx+Dhk2K3pOd0/hYJbNrd7kxmeWh
 X3GldhIxef2TJn+2O3EW0FRe1oICN3+578SyHpGTIAnTPJU3D3fmQMjusx+y27CPnGE6CXb6nm9
 q25CHvTBnsVexrx0z+tTyubk8/VwXqjRTrMih0n/DgdjQ1uaOkWeQ9VUhTNRYYDm7RbcUmd1KyU
 8YlAMsLH/vo2ATgzPeQ==
X-Proofpoint-ORIG-GUID: H4xSTqwBafoehc2VgUB9Z2gbzDesihyC
X-Proofpoint-GUID: AiUrep1QrU2uQQtPuMS85sRX2eX0Yf_k
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MSBTYWx0ZWRfX9jEg8Igfc/9P
 c142fAXdYJFakQbAdNRNMXlg9LWigB668z5j92+8DYha2C/SVxrFOs9lUZMMj+L9hFODJCPD5eN
 YPr527xKsdkH+JQLr19kiQCRBDeHHCs=
X-Authority-Analysis: v=2.4 cv=ZfSIpcVA c=1 sm=1 tr=0 ts=6adb5e4f cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8 a=K5S5juBvcUcC1lOVBgwA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230051

There is a new feature in scheduler called as Cache Aware Scheduling.
It tries to keep related tasks within the same LLC domain while
keeping the system reasonably balanced.

Cache Aware Scheduling assumes that the scheduler LLC domain is large
enough to be a useful placement target. This is true on many systems
where an LLC spans several cores, but not on PowerPC systems where the
scheduler-visible LLC is at the SMT level.
In that case, sd_llc_size is effectively the SMT width.

This becomes visible in the capacity check:

  !fits_capacity((mm->sc_stat.nr_running_avg * cpu_smt_num_threads),
                  scale * per_cpu(sd_llc_size, cpu));

As a result, it may be enabled but has no room to operate.
Hence provide a kernel parameter so that one can try experiment
their workload with cache aware scheduling. This also provides ways to
explore it on system with SMT=4 to see if there are any opportunities
to improve or uncover bugs if there is any.

This does not change the hardware cache topology. It only changes the
sched-domain level at which SD_SHARE_LLC is set.

There is no point in setting NUMA as the LLC domain. So give option
until pkg to experiment with.

Actual flag manipulations for sched domain flags and llc mask is updated
in the subsequent patches.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/kernel/smp.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 6a5a5469aaae..6b1201ea3572 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1059,6 +1059,29 @@ static bool has_coregroup_support(void)
 	return coregroup_enabled;
 }
 
+enum llc_override_values {
+	LLC_OVERRIDE_MC		= 1,
+	LLC_OVERRIDE_PKG	= 2,
+};
+
+static int llc_override;
+
+static int __init set_llc_override(char *str)
+{
+	if (!strcasecmp(str, "mc") && has_coregroup_support())
+		WRITE_ONCE(llc_override, LLC_OVERRIDE_MC);
+	else if (!strcasecmp(str, "pkg"))
+		WRITE_ONCE(llc_override, LLC_OVERRIDE_PKG);
+	else {
+		pr_warn("Unsupported llc_override=%s\n", str);
+		return 1;
+	}
+
+	pr_info("llc_override set at domain: %s\n", str);
+	return 1;
+}
+__setup("llc_override=", set_llc_override);
+
 static int __init init_big_cores(void)
 {
 	int cpu;
-- 
2.52.0

