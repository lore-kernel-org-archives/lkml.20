Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5F4516155
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790681921; cv=none; b=WhKVMqw2JIV1IXNIO5JfOPdPh4ygGtKKGVsRr9Nr2qd0mtAgpN3ydj6TNCe5Exv+g3QAclOeadQwNKBBCxvsrGWaWsXnQlHDim0rt93/DPytFyy3datIbHcQRwbvTsrXqkT2wZEh56PdLDZKsDtp9SawWhoojkNL19VMEBNeN6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790681921; c=relaxed/simple;
	bh=s2r+aG6JBT4mh28miyv4N2FD6h3ZOgckSan+lgljeos=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CRdaWzX+RoPYhgXMp5ebyWIrd3f6FTxt1Z74uZClkOdJ9AD3ydriPUrxnQRrrKKT+uHKunm+R43LAVqGkou8e3Wt9Eh7VgR3fw6i/7/2X8+tM3k85a+Pxc1Wyix/YS+2YUqXAEL001BB4e+hDSs1/JPTNnGn/wvPdonUAzmqWg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dx+3tlOm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WknUC9VV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dx+3tlOm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WknUC9VV"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TAionZ1295851
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:38:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IRfGyQ6QmoDFDjciGfxzicvIkhMdvju/02K7yq5y6Q8=; b=dx+3tlOmKTiJtfAq
	IZ+k9YfhZkZq81Rsx4HRBB52KU2QKiywiVnVjf42E95j9Q8xFtwOpCSv19dLULda
	rHaeWJBOPWSjMyAULI29KrkhwFfMmMmBqkPjpBUyi/GPJxBb+ln6pu4bI7xX5/Wp
	OcG23cEUu6t91XKhtPwULj9QJ664YH3DsV1nwH6JMfIKRqJRF1coCMUTmFDldSUr
	Rf/f775uHK60qmenEzARHj6Dx1eDi0zDilAj7PAri3e86Db/mZccLwkOptaVW5kC
	QZ/3/BkrFuc4faUKyv/4sz5Mk5yj3CHzjLf5pDIvAha2j0qffPVbp2xpLV2Ciqzi
	VVmyew==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h09x4rqwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:38:39 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33baaba6371so15422596eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790681919; x=1791286719; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IRfGyQ6QmoDFDjciGfxzicvIkhMdvju/02K7yq5y6Q8=;
        b=WknUC9VVwwb0Iq/wkae68U8uaE2EEi6S+6q9OkPTwqKsTmtW/hPgu9odSwXKEyhrxZ
         6NthOoauz2ylKULgXQd4WZJnSqd/WGLGw0UWNdueRnQRm8M0JVQfP2IQDaDiK6Dq6wkX
         eWS6IHcFVLBstsg6EHRTRyy2xYDVy7h80emCL8EsXUlUcxJXu+RhAXqg5wDSTRaSSRNi
         mnsxfaIdx45zwCsujexteVeziFKFnTY97055XNmbU0i3CXzULM8Ah0N4SVE1I29Xa6Y3
         AyuGPQ9GuiTi06IxpF0bt+XJy96azRuvbiGLQ9QAKsujIu2emWlUpE/zSZ01CpUUv/gD
         sqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790681919; x=1791286719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IRfGyQ6QmoDFDjciGfxzicvIkhMdvju/02K7yq5y6Q8=;
        b=VUwPTQqTuHa6bWtshDSMAr8yRbSfHKHI1K1CR+UaE9W6nh98vmAVoo6go0O5uY4iXz
         RpBnS8KI7d7LxQP1BOtlSYwBSgwPH9f8M6ia9Wz+XgRV5FbUH5v9hwZAMLy6VD4wIJQM
         ny2RjquPdkJ0fJxQfiI0vhye9xo1UvRIjyEVfy5mSh+hI/yq+lrvlpVwyPbwJdPnIe6A
         ULED4s1hi2+9/EgGTeXOS+zV/ssWUENEBlacH4G34kfsMH16OdN6DpVKUEWT2TI4u/MQ
         XeiLCygH2T+e4Gg+Qpkmr7XR5pccmEqSrWYJ0I5114AsANxnWU45V6/erpHFn08FYsNJ
         /b+w==
X-Gm-Message-State: AFq9FYKE4ll81h3K1bDwKGsMOZ9hSCeBa/eXj3cXbl0WTBb7sowkgjoH
	Vb+nVI4+uZbJvw7DyC87CnQzmult4pcr+My8xQpCd5fjU3xcewrEFnQzflYwNxxi1T5VKY20tax
	59oUCjUjBY8RNIoOlMgrR3OXljLEAxim/JUR/kqo890uDAqWoezWEJ3TSOtbYwLBxLTODbzSy/j
	E=
X-Gm-Gg: AYBFou3oTR20DqaFGt5c/eVN7VfXsFmXuzVihmueFxLa7Wcm7iWVHJRwFgImK+C4tI9
	MCzHPkBoy3CV4wWidAEewtz25KvigOpKv7raR8aQDI4sOcnjZrfXPLulwEhBsRNWFjzIEbitZTe
	BTLc/cjFWdMw0ucMMNveK4FUIOSW4dHNHfqwqaPpkdZfqQ9aXT/l9IQxebrP1W7kZbI1iihg598
	4PpyhW02RUDtHIfBmxSo0rh+xrvO9+2AvQBPHQTU1eVLJ8LBeQ/hMvFhoerwQQ7+2BoBMP08561
	PUxhWzDMqcrjDUyu9+U0ua8SwghjH5XGeu6yhyGSrGq4KvACxNDMtS7RO+h3Tb/hmVpQpnnqSVe
	R+kb2bSIv85q+mL1lnJMRI5mT2vU45fi1ZKuBq++TXdPC2H1jO2E5tUJ1ZO1ji8A/Px1WkFB1Ih
	e4/nYx0Xa34lt8fVQ=
X-Received: by 2002:a05:7300:cc1b:b0:33c:e61:e201 with SMTP id 5a478bee46e88-34271d88c7emr19475308eec.22.1790681917698;
        Tue, 29 Sep 2026 04:38:37 -0700 (PDT)
X-Received: by 2002:a05:7300:cc1b:b0:33c:e61:e201 with SMTP id 5a478bee46e88-34271d88c7emr19475242eec.22.1790681916682;
        Tue, 29 Sep 2026 04:38:36 -0700 (PDT)
Received: from hu-anancv-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145d0fc9fsm37145604eec.25.2026.09.29.04.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 04:38:36 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 17:08:06 +0530
Subject: [PATCH v3 1/2] arch_topology: seed capacity_freq_ref with highest
 available frequency
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-schedutil-boost-frequency-handling-v3-1-68de169498c7@oss.qualcomm.com>
References: <20260929-schedutil-boost-frequency-handling-v3-0-68de169498c7@oss.qualcomm.com>
In-Reply-To: <20260929-schedutil-boost-frequency-handling-v3-0-68de169498c7@oss.qualcomm.com>
To: Vincent Guittot <vincent.guittot@linaro.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jie Zhan <zhanjie9@hisilicon.com>,
        Pierre Gondois <pierre.gondois@arm.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        linux-pm@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Oleg Keri <okerixx@gmail.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790681906; l=2363;
 i=ananthu.cv@oss.qualcomm.com; s=20260903; h=from:subject:message-id;
 bh=s2r+aG6JBT4mh28miyv4N2FD6h3ZOgckSan+lgljeos=;
 b=O7WoFXnsTUsk2s8fvmjrluM8lOpqTZ9CMzCp15IpnizoPU+j/11mbcZ2lJ76R6dmTW+w99Kj0
 yGTuGu2rDepCe1WHfncMt/kiL5AruEdmdtgNMr5dW5ZMezcIzMkSAGH
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=gutNfLSMVTRkB+MxVviMFq9I07C5qPe9xHY2J5XCMpo=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0NiBTYWx0ZWRfX0BJAJJveTw91
 66+rAQBLS7VqvnnfBlpQELs0bwzlSBZxhQ93oRfeJySdGlr3RLtijEC8SFRvnQVG4Hm+7MsrTKU
 0ghRHck8ZXNBM8Vg0W0luHMvYD7mSNg=
X-Proofpoint-GUID: XbAJvh-v2vW8POWPIFvMD9QP-V3cDwYh
X-Authority-Analysis: v=2.4 cv=I5Hw19gg c=1 sm=1 tr=0 ts=6abba33f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=TcNSCKXCNKdZ_9qoEdwA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: XbAJvh-v2vW8POWPIFvMD9QP-V3cDwYh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0NiBTYWx0ZWRfX2RQX2jzGW99h
 MHAB9t4ttcZC0CwaZqGj4OpjcDj34G0jxU0YYviQqLD6rugHveVCCQtFXG9FQKlaLF3erqxiis7
 eb8vzg6GLxUVRSjBe20z2jovW9RCh9pU3kpm1sOKE8HjAjahrI6NnmMI7A9fuMcLrK+9uPo8NVI
 b5hHTz0lsNOzJFiPdk6NicIEG7+5cbQe/tv2xCvAU2I7b5ywklZY3pE3qR9GJ1Go795tUN+wcAf
 bjKgzANwCXSPPG4YX9l5D/yPMJZUmi9oGSj/7ciZJoeVECXrGEzcKNSfZDZdwgaaotzF3tzVLkg
 Y5id44VQRAf0WbscKu7uLATr2uDC4C7C2jynlBp3ziKZ7B4nsQJfTy1RBEV99vHLXwP04kUqJ5S
 XApDdfydSukldcREf+RZPZPROAo9LwRl1jQOcfobwbc2pjbq1IUBoeTfzn/oYRYPDUNqcmG+FLX
 4yZlXtR5mnkr0iO/TCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290046

capacity_freq_ref, the per-CPU frequency-invariance reference used by
schedutil, is seeded from policy->cpuinfo.max_freq at policy creation.
If boost isn't enabled yet at boot, max_freq reflects only the
non-boost ceiling, so capacity_freq_ref never learns about boost
frequencies for the policy's lifetime. Enabling boost later raises
policy->max, but capacity_freq_ref stays stale, leaving schedutil
unable to scale utilization or target a frequency above the non-boost
maximum.

Seed capacity_freq_ref with the highest available frequency regardless
of whether boost is enabled. Runtime enforcement, still handled by
policy->max, is unaffected.

Suggested-by: Vincent Guittot <vincent.guittot@linaro.org>
Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
 drivers/base/arch_topology.c |  3 ++-
 include/linux/cpufreq.h      | 13 +++++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 8c5e47c28d9a..92966be712d5 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -404,7 +404,8 @@ init_cpu_capacity_callback(struct notifier_block *nb,
 	cpumask_andnot(cpus_to_visit, cpus_to_visit, policy->related_cpus);
 
 	for_each_cpu(cpu, policy->related_cpus) {
-		per_cpu(capacity_freq_ref, cpu) = policy->cpuinfo.max_freq;
+		per_cpu(capacity_freq_ref, cpu) = max(policy->cpuinfo.max_freq,
+						      cpufreq_frequency_table_max(policy));
 		freq_inv_set_max_ratio(cpu,
 				       per_cpu(capacity_freq_ref, cpu) * HZ_PER_KHZ);
 	}
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index 35ce665edfd8..f048c925fd98 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -1107,6 +1107,19 @@ static inline int cpufreq_frequency_table_target(struct cpufreq_policy *policy,
 	return idx;
 }
 
+static inline unsigned int cpufreq_frequency_table_max(struct cpufreq_policy *policy)
+{
+	int idx;
+
+	if (!policy->freq_table)
+		return policy->cpuinfo.max_freq;
+
+	idx = cpufreq_frequency_table_target(policy, UINT_MAX, 0, UINT_MAX,
+					 CPUFREQ_RELATION_H);
+
+	return policy->freq_table[idx].frequency;
+}
+
 static inline int cpufreq_table_count_valid_entries(const struct cpufreq_policy *policy)
 {
 	struct cpufreq_frequency_table *pos;

-- 
2.43.0

