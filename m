Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793555216;
	b=VLq/Poslxd793kTwA6rbjCSJsz4upcyOg2dtmfZtAw7t2kmax7NmXpdgqhuMO7lfiuMO
	 wuP68tAd7YsxIV4QAnytQyiDaDWHNSamwj8SFqIJvg6RVGgctJRBhnesZEDSDWdlVyejM
	 u/MftwtRKwjR3hn6NbrG7dVSmVzX3ob8W6PCD9J5w1OE2md8/YgCKtOKUVTM7jQ/GQRq7
	 /xVVPyAoAk7/P93RUUM/MiqAcQPHlJMqVuyi0tZqiJHTYJWnasTuln1M76NvPdCwPQAfW
	 IWuaXlU9RHQtIbkuKwe5IxBVkswqE1AVlqVHqyh9u/vTZx2YDukO1Vl8cekYPgH+xzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793555216;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ykBFnu34zbEfS7RDMlFrrKA/aG0eK8eZnKjyWXnokT0=;
	b=Y5HjBkmnUXNHzay1/Qag+0/051sLTWJWefM52rOQYQ99QsnJSfggJpsUg4ss42opL/A1
	 0+/kZsZAqwvqra+rFNSia7Wjju/3+eevmXzjpWwGTFGKbut6cBkDtYIom2aRZ6WMszwve
	 lHiiZnPzHLEWayUBJl0vfgqt+DDEiDtsOjneOeXvOrNYXcdJmBDQhLhUC4NQeTP6xZmF/
	 Kzm8t57+W0NvWaaWR3qx3wsggvGY/QCi8qy3WEDCIZ6fvtVeBMhNsfhqcCz0vKLOtjig4
	 uQz0Mpya/A3a45dVwwmjOGgy5K74NxArg8llcIU6OEpRIstwn53qJ/L/gMlMuqGGmVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N0NH3RNu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iklxPYux;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C71606A335
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 17:46:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2C71606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N0NH3RNu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iklxPYux
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HQDOb2020136
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 17:46:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ykBFnu34zbE
	fS7RDMlFrrKA/aG0eK8eZnKjyWXnokT0=; b=N0NH3RNul24a0gAhuaTrH4+V1QC
	SdhwZYDK+DEWjo8T71V9f4WXNRsAY+3GZk/OyuOwj2aBmaSU39Vdt615e7BhSwpU
	88HHJkcD7pmzUssSNYqN92yMII9xzfWj9M5BB5FqKskb6vPLcAK2b2878QObITQd
	PiSMO/fwA94KvQUsE1ahO4An+8f2K7Ep8Vdv0lEIprVezDzav6396/Q0zmEEehcc
	go0T+6IyUAMpJuvyeV83Whkm7qPsJ3xtU/evpEkbtT7Lw8CDS9V2CR2QGwqsZvb3
	jI/4sxMngEBhnF5l5i1+m70JYFtuBbLONUn1qMePU+WdGbRVpid8RCjJ+mw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6kyjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 17:46:54 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd61bdc8683so1144588a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 09:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793555214; x=1794160014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ykBFnu34zbEfS7RDMlFrrKA/aG0eK8eZnKjyWXnokT0=;
        b=iklxPYuxt6dK0jSL2UXE8wpltn2Fq/FwIdYRQTE5K6kSJ1p4Nr8juNVs0wgz+boS5k
         nHNtuiMnNcpZc+xSqRi6zSA41cfvEIgZB/C+8gr6C8hlxalxEXlBIDNzTHsOaJJziM3c
         8R6LkxiwF7btqtCeqW+dHRGJm527ibG1M69CfaEAcpx50X6IhP4hkIBUqXBGnB3biL/O
         cHbNOAIx4JyyFgzqshkXSPFaEvS4w/K2NFTIp9CEV/eRXhiDc21QraydNi1inFXvtXvK
         mSYHo0ZWHoi3ACyCNkeq0np+vS8GqRgkudH+MPF4iHx/woqFtBJjWmlT091S1cSG0UKo
         UM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793555214; x=1794160014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ykBFnu34zbEfS7RDMlFrrKA/aG0eK8eZnKjyWXnokT0=;
        b=HShHN7BCJ3MBVy2axYnlHtiTAEEjbkeRh3hcRRods86RHz+jdv0QirAmgPN0vGfPWN
         cBwU/PTIFwAxf0afzfrtPW9GXsTY6fXsbCyft5sHR8fbkR+w/ro8RWE8dg43cmwwx9Mu
         Gs2zS/cxSfqVShpXZnDIhJD7RM2jeke2JfodgxUKvkh9xxqKfYE5yDo3+izHojJTa66Z
         Brbq3FOr3cyRiA5SbKoCwwPqxBtqVKUPHeB1/yxemFlHcGzeHF2/Ub7Iyr5vQ+uCkxZV
         Mz6EjtfSTOMo7lUcK9jdEiE6DZiY2lQca0G+pXboZ3riRx09tf1aeiWOABqTtbzI4WCl
         PSqQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+27BO7V547sI/8TeY71CFNfeBqNXdm75pJgqYSzDcg2PfvhiqM+qkn5zOIw5QfVD3YbJ5DpgacNleZcw=@vger.kernel.org
X-Gm-Message-State: APuU4Z91EwLGn4CGXk8vqCiWqrbevkNDBc7DcLn7ofgJdok7RENBt4QQ
	RSpuN6jA9wuHz5hMQQfHB9BsCYoBhw9rR/WFvVPdVmtcemKorCiRWXETOij8Y4bq1CPvew/57mF
	C0bcz52PDgD69GR/VjYI8IvvMcNCg2hV830L4IDA3wlIqWT5JRS4eas6vnBhfbW1XQIg=
X-Gm-Gg: AYBFou0Wp148vg2n14UTa+4Rp/P9SY8uLHu1APm2SVlgimHARGXumiwU5HcscNpJW7d
	1qn+9ylpDG+Uk6AJHeYdFu6rHk8EibfjxtQcEYvT/mkpXZYtpeVzOL5EtA5fQd9dqAgHFIZsaFc
	6Mj7JTpgj77dbvXD/SdS+/QKj5vUc4/LshBMUzeb8om+By0aM3iV1p5dUQgUWb8rsQ2ihi/x39i
	eVyQZcGy9jrM2FcxOeRAQHhmNr7qhBeRmqIijB5VKUwevNfOUexgeVwf0ZD2SLMgIYv513O+i9y
	xzc1xyJFkJ9otKpWkyHpVLF5lfENI08MLvw/UfT5AhDsjjk+CCFO4/EpCtonYS9H7+H9vpK3xF/
	7twHkuTCj3BUxUbjvudpC5EfjNVvtRM03+gBXJYl94/luF/IRkFjIvEBUJvCVzUFMLHGASzHkmm
	pVPguAbRFNo9piaYb0GJNp5w==
X-Received: by 2002:a17:90b:4f42:b0:3ac:a521:953 with SMTP id 98e67ed59e1d1-3ae897c777fmr6103969a91.46.1793555213567;
        Sun, 01 Nov 2026 09:46:53 -0800 (PST)
X-Received: by 2002:a17:90b:4f42:b0:3ac:a521:953 with SMTP id 98e67ed59e1d1-3ae897c777fmr6103946a91.46.1793555213020;
        Sun, 01 Nov 2026 09:46:53 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aebaac28c9sm2045136a91.15.2026.11.01.09.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 09:46:52 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/4] drm/msm: Rework IFPC disable
Date: Sun,  1 Nov 2026 09:46:25 -0800
Message-ID: <20261101174631.23637-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101174631.23637-1-robin.clark@oss.qualcomm.com>
References: <20261101174631.23637-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: uAfwvKIBxLgc-GBSWKtX6P_jPrHfikA_
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae77b0e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=sgg8FroAFpLa0IqUokEA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: uAfwvKIBxLgc-GBSWKtX6P_jPrHfikA_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3MCBTYWx0ZWRfX0Gj7oy5Gz/qj
 GiE7tGJ7vAEjs2XBlzLmFZDaF7EM8UGsLTKwfJvRFono+dfXnzEf3vBYTL2zLZX3qpSbykJ9VWY
 0Dr/BG609thh3p1eCv/u6FXpg1MBaRA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3MCBTYWx0ZWRfX+N8S0lwOY6oQ
 N797fNW0Nrz/dYfUvP44z6FDhzGhZE2T6fuq0lmUqAf0JSNxP14J9SdenYUsfwxhBLOG1XevsIY
 N5uvzVnuKu24IcFlWnisXMzOfh6biNpfARhz7sRR3xq/zEJTKSkDCHUDdwn1iXLM2/3q/nOQRIs
 B9fK3BZzR94cSUvHISw3ykYtRCJFr0upDQCfZmlA9xz4lgnQMIy51ybBRbl+5dGINEwZEWW/koj
 4eQ14Bpw8qQ1xq4Q1x0KIKS4jNbZx5t6ql7lCNWr872wjmpKYe7ZkBHyj/qVyFX+xekB/jIEDXm
 jMYdWJzt30qESVsucU4EPUlTpJW44i4nksmWbSE5oG9hmLwB1m1lodQP0tsst/YAeZU2Tuo1rxm
 OBkdc15KeK3EnR6ghveOE1L1oUtRmX9A3e/XE7VwhUri52nKq3ro30Z6mz3jt+EP/DFTGKDFbn1
 xiPPslpcZr5qzeCHYEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010070

Previously this was coupled to SYSPROF level, which made sense at the
time.  But there are other places that we need to inhibit IFPC.  So
decouple it from the sysprof refcount.

Now it has it's own refcount, so multiple threads can vote to inhibit
IFPC safely.  The renamed gpu->ifpc_update() simply applies the new
state by setting or clearing an OOB request.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  8 ++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 ++++--------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  2 +-
 drivers/gpu/drm/msm/msm_gpu.c         |  1 +
 drivers/gpu/drm/msm/msm_gpu.h         | 26 ++++++++++++++++++++++----
 drivers/gpu/drm/msm/msm_perfcntr.c    |  6 ++----
 drivers/gpu/drm/msm/msm_submitqueue.c | 10 ++++++----
 7 files changed, 40 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 662f09bec9d5..d1fe6c40da83 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -2128,12 +2128,12 @@ static int a6xx_gmu_get_irq(struct a6xx_gmu *gmu, struct platform_device *pdev,
 	return irq;
 }
 
-void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu, bool force_on)
+void a6xx_gmu_ifpc_update(struct msm_gpu *gpu)
 {
-	bool sysprof = msm_gpu_sysprof_no_ifpc(gpu) || force_on;
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+	bool force_on = refcount_read(&gpu->ifpc_disable) > 1;
 
 	/* Nothing to do if GPU is suspended. We will handle this during GMU resume */
 	if (!pm_runtime_get_if_active(&gpu->pdev->dev))
@@ -2145,9 +2145,9 @@ void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu, bool force_on)
 	 * 'Perfcounter select' register values are lost during IFPC collapse. To avoid that,
 	 * use the currently unused perfcounter oob vote to block IFPC when sysprof is active
 	 */
-	if (sysprof && !test_and_set_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status))
+	if (force_on && !test_and_set_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status))
 		a6xx_gmu_set_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
-	else if (!sysprof && test_and_clear_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status))
+	else if (!force_on && test_and_clear_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status))
 		a6xx_gmu_clear_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
 
 	mutex_unlock(&gmu->lock);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 74064eba98c7..3de6892d1b9c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1565,11 +1565,7 @@ static int hw_init(struct msm_gpu *gpu)
 		a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_BOOT_SLUMBER);
 	}
 
-	if (!ret && msm_gpu_sysprof_no_ifpc(gpu)) {
-		ret = a6xx_gmu_set_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
-		if (!ret)
-			set_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status);
-	}
+	a6xx_gmu_ifpc_update(gpu);
 
 	return ret;
 }
@@ -2851,7 +2847,7 @@ const struct adreno_gpu_funcs a6xx_gpu_funcs = {
 		.create_private_vm = a6xx_create_private_vm,
 		.get_rptr = a6xx_get_rptr,
 		.progress = a6xx_progress,
-		.sysprof_setup = a6xx_gmu_sysprof_setup,
+		.ifpc_update = a6xx_gmu_ifpc_update,
 		.perfcntr_configure = a6xx_perfcntr_configure,
 	},
 	.init = a6xx_gpu_init,
@@ -2922,7 +2918,7 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
 		.create_private_vm = a6xx_create_private_vm,
 		.get_rptr = a6xx_get_rptr,
 		.progress = a6xx_progress,
-		.sysprof_setup = a6xx_gmu_sysprof_setup,
+		.ifpc_update = a6xx_gmu_ifpc_update,
 		.perfcntr_configure = a6xx_perfcntr_configure,
 	},
 	.init = a6xx_gpu_init,
@@ -2960,7 +2956,7 @@ const struct adreno_gpu_funcs a8xx_gpu_funcs = {
 		.create_private_vm = a6xx_create_private_vm,
 		.get_rptr = a6xx_get_rptr,
 		.progress = a8xx_progress,
-		.sysprof_setup = a6xx_gmu_sysprof_setup,
+		.ifpc_update = a6xx_gmu_ifpc_update,
 		.perfcntr_configure = a6xx_perfcntr_configure,
 		.perfcntr_flush = a8xx_perfcntr_flush,
 	},
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 36717b511316..077b5cb60896 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -298,7 +298,7 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
 int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
 int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
 void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu);
-void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu, bool force_on);
+void a6xx_gmu_ifpc_update(struct msm_gpu *gpu);
 
 void a6xx_preempt_init(struct msm_gpu *gpu);
 void a6xx_preempt_hw_init(struct msm_gpu *gpu);
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index fb07803f5aba..37f9e93daa43 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -1012,6 +1012,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	gpu->nr_rings = nr_rings;
 
 	refcount_set(&gpu->sysprof_active, 1);
+	refcount_set(&gpu->ifpc_disable, 1);
 
 	mutex_init(&gpu->perfcntr_lock);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index d27d54bdb7a7..0334a0f604ac 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -93,7 +93,7 @@ struct msm_gpu_funcs {
 	 * for cmdstream that is buffered in this FIFO upstream of the CP fw.
 	 */
 	bool (*progress)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
-	void (*sysprof_setup)(struct msm_gpu *gpu, bool force_on);
+	void (*ifpc_update)(struct msm_gpu *gpu);
 
 	/* Configure perfcntr SELect regs: */
 	void (*perfcntr_configure)(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
@@ -186,6 +186,14 @@ struct msm_gpu {
 	 */
 	refcount_t sysprof_active;
 
+	/**
+	 * ifpc_disable:
+	 *
+	 * Count of votes to disable IFPC (1-based, values above 1 mean IFPC
+	 * is disabled).
+	 */
+	refcount_t ifpc_disable;
+
 	/**
 	 * lock:
 	 *
@@ -375,10 +383,20 @@ msm_gpu_sysprof_no_perfcntr_zap(struct msm_gpu *gpu)
 		(gpu->perfcntrs && READ_ONCE(gpu->perfcntrs->stream));
 }
 
-static inline bool
-msm_gpu_sysprof_no_ifpc(struct msm_gpu *gpu)
+static inline void
+msm_gpu_disable_ifpc_get(struct msm_gpu *gpu)
+{
+	refcount_inc(&gpu->ifpc_disable);
+	if (gpu->funcs->ifpc_update)
+		gpu->funcs->ifpc_update(gpu);
+}
+
+static inline void
+msm_gpu_disable_ifpc_put(struct msm_gpu *gpu)
 {
-	return refcount_read(&gpu->sysprof_active) > 1;
+	refcount_dec(&gpu->ifpc_disable);
+	if (gpu->funcs->ifpc_update)
+		gpu->funcs->ifpc_update(gpu);
 }
 
 /*
diff --git a/drivers/gpu/drm/msm/msm_perfcntr.c b/drivers/gpu/drm/msm/msm_perfcntr.c
index ce65b1160955..867dd476ed88 100644
--- a/drivers/gpu/drm/msm/msm_perfcntr.c
+++ b/drivers/gpu/drm/msm/msm_perfcntr.c
@@ -259,8 +259,7 @@ sample_worker(struct kthread_work *work)
 	}
 
 	/* Inhibit IFPC while accessing registers: */
-	if (gpu->funcs->sysprof_setup)
-		gpu->funcs->sysprof_setup(gpu, true);
+	msm_gpu_disable_ifpc_get(gpu);
 
 	if (gpu->funcs->perfcntr_flush)
 		gpu->funcs->perfcntr_flush(gpu);
@@ -297,8 +296,7 @@ sample_worker(struct kthread_work *work)
 	}
 
 	/* Re-enable IFPC: */
-	if (gpu->funcs->sysprof_setup)
-		gpu->funcs->sysprof_setup(gpu, false);
+	msm_gpu_disable_ifpc_put(gpu);
 
 	smp_store_release(&stream->fifo.head, head);
 	wake_up_all(&stream->poll_wq);
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index d307cdd17d90..8434a09319bc 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -24,7 +24,10 @@ int msm_context_set_sysprof(struct msm_context *ctx, struct msm_gpu *gpu, int sy
 		pm_runtime_get_sync(&gpu->pdev->dev);
 		fallthrough;
 	case 1:
+		/* Disable zapping perfcntrs on context switch: */
 		refcount_inc(&gpu->sysprof_active);
+		/* Disable IFPC: */
+		msm_gpu_disable_ifpc_get(gpu);
 		fallthrough;
 	case 0:
 		break;
@@ -36,16 +39,15 @@ int msm_context_set_sysprof(struct msm_context *ctx, struct msm_gpu *gpu, int sy
 		pm_runtime_put_autosuspend(&gpu->pdev->dev);
 		fallthrough;
 	case 1:
+		/* Drop our vote for inhibiting IFPC: */
+		msm_gpu_disable_ifpc_put(gpu);
+		/* Drop our vote for disabling perfcntr zapping: */
 		refcount_dec(&gpu->sysprof_active);
 		fallthrough;
 	case 0:
 		break;
 	}
 
-	/* Some gpu families require additional setup for sysprof */
-	if (gpu->funcs->sysprof_setup)
-		gpu->funcs->sysprof_setup(gpu, false);
-
 	ctx->sysprof = sysprof;
 
 	return 0;
-- 
2.56.0

