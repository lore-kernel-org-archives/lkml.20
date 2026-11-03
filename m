Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793704902;
	b=p0AFP1N1bxavzY9LxgzlaJ8GDuMmOucxUEPpqGXQhEyf6/0P89K/FuHJB4XRknU6vckf
	 G1tXAUTqynJJu+x+GKc9kxlVxtmMu4yx/WHyYK0/a2YacFQ8BeA0H7A5wHHFDCHQRVYuK
	 LhkGHb+E/h0Oc1j/csU3PzbZ/e2ZtrQFKsYZ92fJK8UhsMxzK7oGWBTGeVioxELU3v26c
	 zaMt6cdEIDti8ggrPSOGKzQHlLMHKIpiq+qOXbgIQFuDIPWphPGoE4pLnEy0qAVjgBFpH
	 YAYSd+bydTqayOxpxK6gVfm+pLuTbyBEIXQbOwoSd3XEy30LpR4dVHxIe4zmlDrQfLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793704902;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Change-ID:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aSwLV1CBcuXDV7sv0OALbaamU2BuWrR2qGPK92B099k=;
	b=ux10lO8lrlhDszSaIFfuPkphMKvHDPst/pcBtBXTSQGTwwfZ//JpQOw0Zroub/smr6L7
	 DXX+93IohjkI1jk5/EWZ93R6Hou/j3ZMy55Ub4zAAtY8eKxSwQvJz7HrOg9mS56DB4DTQ
	 yAoKfsjCne7HGN609yF3JYMgCRwG4ZyeDLQp7IT7cPXA4dYb3U2vHwcT1NE3EfYntOwMG
	 tGV8g3h6VWgVXirPqh+JoZc1ee/qK9P1YTSG+K883VUV3KY89x5UFniSRmibu4SAIWITm
	 H7/I95vkFp+nq5bXROpjuD+fGdXE81a1M1qnAeXm8uJvHgpq788t3klKTyJhnSQaPDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P+1cc2w8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PnXW6+U0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81BF606A830
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D81BF606A830
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P+1cc2w8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PnXW6+U0
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AA7Cn3526130
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 11:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aSwLV1CBcuXDV7sv0OALba
	amU2BuWrR2qGPK92B099k=; b=P+1cc2w8oJC3yzQgPPiOqHDtK7+2IhP2qRDRGz
	S9kjt62s7L+Asd8laUMgzkWuhZkN6p6mQk0SvKq7Qr5mx7k2XP8B9OUw5BihXeDC
	XvB+cgBJA4dWljoUDfd7Aw/esJIw9p/CG4t2kdI6lQXfv3fqU3hmZbNecT0hw55R
	8gNmLOdbV+4Kkf4nAfg4fTWPOE4CuuoU2wqiHPTxS2g3bTvtBsFWYle+Xh+oknPC
	xL09gWMxwPTJ3jzyxclbO1YJAr60mFLflYTIJsFDKLN9GjFycf2zSZeLzIcW0aHK
	RNdxa5FGr3cHupXZ83lsuugz+SBEz3qYk5vlErHuO8Z1OReQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq3uy2kxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:21:41 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab27eb38d6so3081871a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793704900; x=1794309700; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aSwLV1CBcuXDV7sv0OALbaamU2BuWrR2qGPK92B099k=;
        b=PnXW6+U0Cm8yWp9a39792Ai2IMyIiN23LmPSbsEQxOe7YRyQ3MIUck+KHh/9syB8jz
         1E7bhFc0g9CDCuiVd+y0ka9T2hTFJC9GOKLgGzaRlgLfvJo+qv7ch2zWqz57LOCFs4RK
         r9UMIb78MZBR3trW6rMJ1X4CDqvDQ+lJPC47Y5Rwri7Hok6Vl9KTHnU9YujavfrR0zyN
         8v31X3fMxNQGyYLroQC3GqPR1Idz4pM/l9VCHsOqM7JAwFBYshZFttEq/rO4Vd1MTTua
         rBCnbFY5pT6FxYnjeSPQb7RyuVtKP7LmtkPiN8J/rsanQh/dXdVEQEN75e64BWJ1E4cx
         xgag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793704900; x=1794309700;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aSwLV1CBcuXDV7sv0OALbaamU2BuWrR2qGPK92B099k=;
        b=uqUnBQgybembEhnP86M/1ElGLp9TieyKN7RzPLHFwfAkYgDW4jIeilCCuj+9lMo3cF
         r2xX6bvf4FA/Ki8r6iI6NSy/HbLKld1d0CH5kcWauHw1wLrIK/47C7K3/b8n2Ae2joZ9
         zt+/uuLFwBOc616YRLSpY1Sb2oTysQXw3b4h3bK80AgkLBFEx/aATTdBfvI3YTerhTQi
         SLlrg7YI4amxkuz1WNsarqetPpOGuU0FRvTh7u7pLsyjfi7byQrIcfyHeMKi/YGbiG6S
         XtnBGpKbXvaP6tOmIS+tMTiB3jb72MPy2dlS2c1F3IHf2/OJiEgX6Yn2ul3exG2E1DpK
         Zf5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzdYkMQR9CozOnhapHRke2AwYMg6ouUR+Lj9AXBqRUrP2DC0p1op/3SGFPIMbZ/cDoywzFSJaJlkliWSSo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SBVx36F39Hxgb0exsIb1n2/W+9ec05fCuvjkOLh8xnV2WPNrD
	xpXq1831glnGkLOXEDBs0zkAmPvjBNIonm6NdAjRjf2badq+s/6FAdPwOwFAaG5ZJVqqsoRfRnB
	ASryM0F4IPYkbmXKouIApbyvvEw4Gpu9gCoaAHR8xK8hOI0WM7ekaVLTMJJucuhis2u8=
X-Gm-Gg: AYBFou0SdYo+Zxp/H4rWqGfkafIMaTeVzvAmmR3rvzFD0+7hXx0+6aLPzOCHWgG3KYj
	E+FePYMkSAho0rKPbPV/SJU74Xn2OfxbG0rAESwbc+Qzna2PSyDsGGEQy9iKLLLYO/anhOc1u7u
	/pwRfrQt38eFiKwOpiRAtI+WtdIMvfznWOrDSEZYMrgfXrWCgE8vPo/F/WABZ/FoK7R10q4pKmp
	FndywUokIOI0bt+1utbD7u36m0VarCpwkCL+Qep5bLKu3eJrL556eT5b7qmLe5bruMg6hf3tFyi
	sQ2FK6YeaD1yCiXrk4TMf/L+BnTY7jGXR2izomGlqfdj3kFHhPk1i3F5K2nYF/3cH5FhdlIh1sr
	5hUaqJ+bliC6ntZjg19E9qTshAEGmn3UKOvry3OexeF1tB4KBcsgLLSjtqFR5gZ0h8FCfDR7hB7
	bSDkikAUbnDdLtVy59DWE9C4gjKmRP
X-Received: by 2002:a17:90b:224f:b0:3ab:33b6:2c27 with SMTP id 98e67ed59e1d1-3ae897c93d2mr10975165a91.23.1793704900283;
        Tue, 03 Nov 2026 03:21:40 -0800 (PST)
X-Received: by 2002:a17:90b:224f:b0:3ab:33b6:2c27 with SMTP id 98e67ed59e1d1-3ae897c93d2mr10975145a91.23.1793704899707;
        Tue, 03 Nov 2026 03:21:39 -0800 (PST)
Received: from QCOM-utBXLfHQRa.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6b3493sm4135296a91.13.2026.11.03.03.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:21:39 -0800 (PST)
From: Guo Chen <guo.chen@oss.qualcomm.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Lukasz Luba <lukasz.luba@arm.com>, Pavel Machek <pavel@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Vincent Donnefort <vincent.donnefort@arm.com>,
        Matthias Kaehlcke <mka@chromium.org>
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, xin.liu@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, tengfei.fan@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com
Subject: [PATCH v2] PM: EM: Exclude boost frequencies from inefficiency ranking
Date: Tue,  3 Nov 2026 19:21:28 +0800
Message-ID: <20261103-em-rank-boost-separately-v2-1-5a13d1b38d37@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20261029-em-rank-boost-separately-a7e7c7d78058
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: XZBI0HBLPVVhxhFx--mlB9UabbBbTA48
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NSBTYWx0ZWRfXxEba0iIR7VFu
 zwKoNwh+/W001QyQ+i50Ro0J8HA7SV3cP711cHwMFle/Bci6+j9WcsHCOSXm7NI3ciHh6bwJ6b5
 0Zt2p6XpBue8c58Fndu8O24jJnSLBvnUWobdzn1GqFZFwAHkq/ckD66/SCUBx+HvNlYCZdrzMzr
 P40B8MON5pvjlepcbDzIhfYoliBM9xTSu+S7drfRYi9YfunCbaFTaMpoimeq0i7jV5CjuyLp3vI
 xlVjduUzxIwaPwP0jIiR8A5UexrhoncdHSrFVyr3vfSlhggaFbiMZ9y63eNrqy2gF0rtcgiWJwM
 kq+LZQjb8touv7RD2KDmOjEcee1DlgVaaBecQAJuDC9+5KZuIPkww/HxmXteaXH7RYwoHP20PNY
 SdoT8ws8X0Il8FCXgd1ybJNJkEM8Yn/MXcH0PB61nEyhU4mZAI1vCr60DeP8VQvXijicCLgoDYN
 47a2FwriaPhl/oAru5g==
X-Authority-Analysis: v=2.4 cv=VoG2kO2n c=1 sm=1 tr=0 ts=6ae9c3c5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EJyEkKy6ZwYBekfyMqcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: XZBI0HBLPVVhxhFx--mlB9UabbBbTA48
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NSBTYWx0ZWRfXxiI/sRO/EVwK
 qHgiypb2m9ufBVvTYJC71n3dGqfho8pwDtZNbAXanQU2vhq65mRbilEM+phKuNeUHoaR95hvqUq
 wtfFXmy2bLSypXD+ySMgLrc9sWsAj3g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030045

em_compute_costs() ranks all the frequencies of the table, boost ones
included. A non-boost frequency can be marked inefficient only because
a faster boost frequency has a lower or equal cost, e.g.

  3.9 GHz  4.0 GHz (cost C)  4.1 GHz (boost, cost C)

With boost disabled 4.1 GHz cannot be selected, but 4.0 GHz is still
skipped by governors rounding down to efficient frequencies (e.g.
ondemand with CPUFREQ_RELATION_HE), which land on 3.9 GHz instead of
the best selectable frequency. Several frequencies can be affected.

Exclude the boost frequencies from the ranking in em_compute_costs() and
keep them all efficient, using the highest non-boost frequency of the
CPUFreq table, returned by the new helper
cpufreq_table_max_nonboost_freq(), as the boundary.

Fixes: c8ed99533dbc ("PM: EM: Mark inefficient states")
Signed-off-by: Guo Chen <guo.chen@oss.qualcomm.com>
---
Changes in v2:
- Drop prev_boost and keep all boost states efficient by resetting
  prev_cost for them, as suggested by Lukasz. Boost states are no
  longer ranked against each other.
- Retitle the patch to match the new behaviour (was "Rank boost and
  non-boost frequencies separately") and reword the commit message.

Link to v1: https://lore.kernel.org/all/20261030-em-rank-boost-separately-v1-1-238a6b2bb888@oss.qualcomm.com/
---
 include/linux/cpufreq.h     | 24 ++++++++++++++++++++++++
 kernel/power/energy_model.c | 16 ++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index d3d0d9d02aa4..c93316141a11 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -1155,6 +1155,24 @@ cpufreq_table_set_inefficient(struct cpufreq_policy *policy,
 	return -EINVAL;
 }
 
+static inline unsigned int
+cpufreq_table_max_nonboost_freq(struct cpufreq_policy *policy)
+{
+	struct cpufreq_frequency_table *pos;
+	unsigned int max = 0;
+
+	if (!policy->freq_table)
+		return 0;
+
+	/* The table may be unsorted, scan all of it for the highest one. */
+	cpufreq_for_each_valid_entry(pos, policy->freq_table) {
+		if (!(pos->flags & CPUFREQ_BOOST_FREQ) && pos->frequency > max)
+			max = pos->frequency;
+	}
+
+	return max;
+}
+
 static inline int parse_perf_domain(int cpu, const char *list_name,
 				    const char *cell_name,
 				    struct of_phandle_args *args)
@@ -1219,6 +1237,12 @@ cpufreq_table_set_inefficient(struct cpufreq_policy *policy,
 	return -EINVAL;
 }
 
+static inline unsigned int
+cpufreq_table_max_nonboost_freq(struct cpufreq_policy *policy)
+{
+	return 0;
+}
+
 static inline int of_perf_domain_get_sharing_cpumask(int pcpu, const char *list_name,
 						     const char *cell_name, struct cpumask *cpumask,
 						     struct of_phandle_args *pargs)
diff --git a/kernel/power/energy_model.c b/kernel/power/energy_model.c
index d19a65461ae8..5b1d095fd376 100644
--- a/kernel/power/energy_model.c
+++ b/kernel/power/energy_model.c
@@ -255,15 +255,24 @@ static int em_compute_costs(struct device *dev, struct em_perf_state *table,
 			    unsigned long flags)
 {
 	unsigned long prev_cost = ULONG_MAX;
+	struct cpufreq_policy *policy;
+	unsigned int max_nonboost = 0;
 	int i, ret;
 
 	/* This is needed only for CPUs and EAS skip other devices */
 	if (!_is_cpu_device(dev))
 		return 0;
 
+	policy = cpufreq_cpu_get(dev->id);
+	if (policy) {
+		max_nonboost = cpufreq_table_max_nonboost_freq(policy);
+		cpufreq_cpu_put(policy);
+	}
+
 	/* Compute the cost of each performance state. */
 	for (i = nr_states - 1; i >= 0; i--) {
 		unsigned long power_res, cost;
+		bool boost = max_nonboost && table[i].frequency > max_nonboost;
 
 		if ((flags & EM_PERF_DOMAIN_ARTIFICIAL) && cb->get_cost) {
 			ret = cb->get_cost(dev, table[i].frequency, &cost);
@@ -284,6 +293,13 @@ static int em_compute_costs(struct device *dev, struct em_perf_state *table,
 			table[i].flags = EM_PERF_STATE_INEFFICIENT;
 			dev_dbg(dev, "EM: OPP:%lu is inefficient\n",
 				table[i].frequency);
+		} else if (boost) {
+			/*
+			 * Keep all boost states efficient. Resetting prev_cost
+			 * also keeps the highest non-boost state efficient,
+			 * then rank the rest on their own.
+			 */
+			prev_cost = ULONG_MAX;
 		} else {
 			prev_cost = table[i].cost;
 		}

---
base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261029-em-rank-boost-separately-a7e7c7d78058

Best regards,
--  
Guo Chen <guo.chen@oss.qualcomm.com>
