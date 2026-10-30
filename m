Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793347876;
	b=TkEXPOVM9pHFiSBK4H11SI8fg39S/aGQj9CPBbQHev+2Znbt2dpWsXLfFmggeON6MV4w
	 pxPIZK9r+YBHQvHO9SjhBTvDRG6FzxuxiiXLLAgckCgApGq/J858uZVfq9173Bkxjj+wB
	 rs6ABlCzlPmK+4kfrd5KIqaxTQye9RYUkRIwRwSJQy19DlEfcryf30sCESXoerfdsxBJ+
	 zZULa3Tzfw302SvKGJEI9OAWW6ODxP5ZQp3AQ2ol2HnvBVLOfb7TrSS92ibFjfDT6howu
	 cdtKa/o6V8OR9VD6ptKedtHDj/SZGrKtN18kFH5DSedeb/EyX1dvan8notQ6eo4nTNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793347876;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Change-ID:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=krV9rPevm1y0iw7HwKLM2j4q0Lx/o/rTqYyh873iSTw=;
	b=5BcvMQ4TP4QBxB5Xs7jlfp5pY/vhR9Q9zNtOQP7+AChzPO4MB1Ui4y7AHRh6/j5w19Dp
	 W0D5h+stqxw9UFj/HwqaeLY+XSKp7m4AS9/mq7Scdyr75SSj19l+DnAG+AL4sCkjmis1z
	 0gOUaMznDEDWPFnWvCvrNTVt3pNHUT9FZYuq5I7v/LDBahMUgs+NxeodrnGAx1hrsr7Pe
	 QXtu4FPB8CQ3T9zzAWxthoqFiiJEDr1vi8VgeVxN8esgCej3glncgPtqANz3MjU8afdyo
	 Eajw6srUH1l7TPcvh2JUpbFQd5DwysUAGo6TQPWhb8gpBxRkjPsZbN6c5Qmo6FtDCYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KqHc0PDi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i8oS+oAt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14FC606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:11:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C14FC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KqHc0PDi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i8oS+oAt
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5FcEN3346041
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=krV9rPevm1y0iw7HwKLM2j
	4q0Lx/o/rTqYyh873iSTw=; b=KqHc0PDiWu/d7ZMt/OorqRJXCtSshRDzvbcJB8
	xo2VZE2pJoCuRr5WIbd7Gcbmv/fNcOmlMTTxe1IyR9PtGFZbP1uRQOou60WNmBA5
	6Ih4WFrM42Pa68VLb+vbixKL7DgWzoQlppSF3ZRoXdYCWXcyMYwSpzPXP1yvEltI
	UkumPriopkgc3E2i4sUutZ1s2Xy+PJYMePPmjtpGH7KGW4HRFUNkpzJ2bunDwMEN
	ONQl0RtqsCzwyDIqdWpsutrhFoURWXdKQViPAILBxDBcOMImuvzu4agIPF2Mv8Cj
	hzH4CKtL9vJiCePpfpIXINvQEJywwlCgYQQmgLCQ0q5Yf4aw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme751vk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:11:14 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-18eb2616974so1588819c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793347874; x=1793952674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=krV9rPevm1y0iw7HwKLM2j4q0Lx/o/rTqYyh873iSTw=;
        b=i8oS+oAt4ZbQ2VViSNYyHycwOROWr+Ezprikon5LpAdjVLgLPg/+QDPvEEdPlcuM7R
         pLZjvuBG+J9P9i++hD/RdjfUvRDLsYm/A6PfcaCczX/3iU5EFzxuE2KfHlnuqJfL/EiU
         qDfa+E3vYridpfX24tjdRv6bV3EGoiXz+8u6sAZprElghoBchAbneNv+qdqS8xFOM/r2
         Bm7fE72WwtZWjaR8WoQRLfSzUrPGmbO+V6S2WLYiO4JoP6XFKONCeVFeuphZA8vwExZF
         rWJ6DujnEx50KKWfO0t8skeKeQu9hIOJBvJyDk348u/+OUzSbjfvEnJIKDsRShGo6Ayf
         FvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793347874; x=1793952674;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=krV9rPevm1y0iw7HwKLM2j4q0Lx/o/rTqYyh873iSTw=;
        b=wc+QswOeqnc3HPBbra6Cy/8KZq+HXE9IGdD0vLNrMSfHvFNM2xmCXYRuyNQdPq26Am
         EVxcVtxmAE4eduK1eTFsE632/wmmBwkijOjnof0bzFt4CgD65bIYWxNIALPYbmvtaq4b
         Ue5Er1CBYlDvjYt7zd91PAGfykJrDJAIz23rC+BcRlNy6RFseqLjYwpDABaEZKT1wWlt
         nyVQX1GwxjkT01+VVlZqrTqdqWoMj6uTTTt/pRhOmcjEiufpCw74UMG7PR6EPKHpiDdy
         dC7GOx6QET9q3QEq/lT9oPfOEVC1Qy21B0PjXM5TKA0SxyJSQNWW5Ze7GU+0FbPvLjGi
         gmzg==
X-Forwarded-Encrypted: i=1; AKwUvBzkwldozR872A054gP8VSkodDPwpjfgmff5/UAnA7O/u62TmF/uvz8ZUFIoRLq+kPKIbJ09LYZHDSadhrY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzHowviPy+FO96ytcleSTuI9ExIN4hfT0EZaL1h+4Mv6VY/3Kc
	GzK/nJ3FBpKbqJrVeNQKTIpspf7qIGBzsXnE6Xgt2ED6Ip7OlMM9MuHO+tl0EExF90/WikN97QJ
	fLzIe0B4OZtLaOlkvsl5bUiwStG3ap+68ft9TZb+lzCG2XEpGlaqJc5F1VzSQrdHf+9Y=
X-Gm-Gg: AYBFou1GPqaj+/XPDJdnXsJedw21VC+gKuwCf2Ry+ZhPCZRU1OUNPdhMj+I7F8WAvSr
	gxxSybQ9Zf6x+rrW7b+dwfvqwf9CfS/aJpAaHxpeW2z75S0NwYvAu4O+nShG2sp1QZ8muzpdEJP
	sTPScLhQMOhevprAckq2Y1A434cjvNanl18D1pMrf9QSgAvCfLQkKzu5BrmFa4aK07mue8oWgQq
	tfJhGjtU2GQbl7uoOP8Qrmia5TQw+NDnM6p0YRTrkbKSgoxsAbD1SR0sEYi05r8Tjdt84S9BLAz
	D8cqUKA7h6uma+E7E3tnM1yjGG2t3ve1VXySVxm7103hMjj2OIT7kz9vgf5qJEWA0U8Hdoknfdh
	ogwYE73kIJ2C3NvTo2Ij1RZLLKiI7U7sLKoAQOtlCLi7xH3u/ngloFrEwM/TOIStan497x0oj3E
	tuCK920CYp3mvynVsHUW/LPrqtR8wmcg==
X-Received: by 2002:a05:7022:3c04:b0:1a9:c52f:655c with SMTP id a92af1059eb24-1ac5c555f7cmr2006780c88.36.1793347874102;
        Fri, 30 Oct 2026 01:11:14 -0700 (PDT)
X-Received: by 2002:a05:7022:3c04:b0:1a9:c52f:655c with SMTP id a92af1059eb24-1ac5c555f7cmr2006731c88.36.1793347873397;
        Fri, 30 Oct 2026 01:11:13 -0700 (PDT)
Received: from QCOM-utBXLfHQRa.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac194b5437sm5706777c88.13.2026.10.30.01.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:11:12 -0700 (PDT)
From: Guo Chen <guo.chen@oss.qualcomm.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Lukasz Luba <lukasz.luba@arm.com>, Pavel Machek <pavel@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Vincent Donnefort <vincent.donnefort@arm.com>,
        Matthias Kaehlcke <mka@chromium.org>
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        xin.liu@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        tengfei.fan@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com
Subject: [PATCH] PM: EM: Rank boost and non-boost frequencies separately
Date: Fri, 30 Oct 2026 16:10:56 +0800
Message-ID: <20261030-em-rank-boost-separately-v1-1-238a6b2bb888@oss.qualcomm.com>
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
X-Proofpoint-GUID: 92hm6xP92pgvirXil3N4iRqucl2PqGXs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzMiBTYWx0ZWRfX4Wzn97ULGWlQ
 jBwSEXpQpWSYl9F5Cf7npEh8IjCa36rOicPgq9T5Huo7B8meYEWw3mcFFfhR3MKMmXPr+9qn9Hb
 Xhk77MakLQHpmkZeeb5G4LGwaHuZ0CnnXPe7/Jfz/VD6jNQwSYoh06N7/R55Ul4SzaAk81KbCpU
 SGsgcAVVXpMwlFafsy3Tter5/fprCX/v/cWc22Q+K660tykCKZCghb1kFjWMZlylbQuDV4VPLYS
 EbwNoyutdUODXhjrQToUJAjzQNkd9Y/BhaJG2h81y+MfSUgEqqp4PvzVSRlKaX4Khh1ajVSekHn
 exJcnpfEVfCc7U0NMD770xnqXS5MNX7nIUxLhPOHKNzdVqh3CzQTqgZEx2Je0oYSKUOLxS3U05o
 ufLL+P+aJN+kLMlvZFT2iJXILk0Ac4/2yMoEEOK8NTfQkWs2MA6rEE6mp18tjs/iHyxI8eMbzPB
 CSvUtr7IJOiD/ISy0EQ==
X-Proofpoint-ORIG-GUID: 92hm6xP92pgvirXil3N4iRqucl2PqGXs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzMiBTYWx0ZWRfX7gRTVtAN6fFw
 CJ7vXOmYr2ukqtkdxuzhQwWYAvyqx/bw2RJcaWCaWvty5Qua6kmmdUpbEy5WmC471uaA1RonSh7
 TRsfzL2ZymdGxc71JhcrdjxQQc2mLQM=
X-Authority-Analysis: v=2.4 cv=KdtHIgYD c=1 sm=1 tr=0 ts=6ae45122 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=2hJP1i3fRuUWVGmBDcQA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1011 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300032

em_compute_costs() ranks all the frequencies of the table, boost ones
included. A non-boost frequency can be marked inefficient only because
a faster boost frequency has a lower or equal cost, e.g.

  3.9 GHz  4.0 GHz (cost C)  4.1 GHz (boost, cost C)

With boost disabled 4.1 GHz cannot be selected, but 4.0 GHz is still
skipped by governors rounding down to efficient frequencies (e.g.
ondemand with CPUFREQ_RELATION_HE), which land on 3.9 GHz instead of
the best selectable frequency. Several frequencies can be affected.

Rank boost and non-boost frequencies separately in em_compute_costs(),
using the highest non-boost frequency of the CPUFreq table, returned by
the new helper cpufreq_table_max_nonboost_freq(), as the boundary.

Fixes: c8ed99533dbc ("PM: EM: Mark inefficient states")
Signed-off-by: Guo Chen <guo.chen@oss.qualcomm.com>
---
 include/linux/cpufreq.h     | 24 ++++++++++++++++++++++++
 kernel/power/energy_model.c | 15 +++++++++++++++
 2 files changed, 39 insertions(+)

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
index d19a65461ae8..253c53ca6a74 100644
--- a/kernel/power/energy_model.c
+++ b/kernel/power/energy_model.c
@@ -255,15 +255,30 @@ static int em_compute_costs(struct device *dev, struct em_perf_state *table,
 			    unsigned long flags)
 {
 	unsigned long prev_cost = ULONG_MAX;
+	struct cpufreq_policy *policy;
+	unsigned int max_nonboost = 0;
+	bool prev_boost = false;
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
+		bool boost = table[i].frequency > max_nonboost;
+
+		if (boost != prev_boost) {
+			prev_boost = boost;
+			prev_cost = ULONG_MAX;
+		}
 
 		if ((flags & EM_PERF_DOMAIN_ARTIFICIAL) && cb->get_cost) {
 			ret = cb->get_cost(dev, table[i].frequency, &cost);

---
base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261029-em-rank-boost-separately-a7e7c7d78058

Best regards,
--  
Guo Chen <guo.chen@oss.qualcomm.com>
