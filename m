Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794818374;
	b=yizccpZElBP0OMFzzwd/PYxnzbYw1lvsMPBy+IRUCjKBq0alN5uLzHj7SuimvDLbzLbD
	 MVCDAVT+lW/JyyVhUZefrI+df6RUv7FVmT5m9zN6O81qGaPeCHU3rI/KWkBQoK9YpGI0W
	 0AmxM0nTFenR3g1C8cfBy7iPlFc6BV9Y+fFHH0QVs/wDzzOshiweaWDRmmACz9B54oVcE
	 VvHTWPFkKTSyt8UO1op5PpA73Ww0flX26MCi9j627CAPBcSe/0WeoE1NvsnKnVKVCoTq1
	 9Nbo2v2EXWhz4WGgF/39V0AFn4mDqO+fbGz35J4XLO9gP/OBEelzgbyj2SP2vthxLtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794818374;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=M6YIGKBp2Uwn6NWKr3hKh++AtRtVXDvB3/mXc2CHH4w=;
	b=JE7RwVYj/DQcQYx4eY0NLACrybsITYGkVOseuYxt80eeb1OfGhzaLQsYVuWCBU9qFncN
	 XvJFKFVgnzuM0/6rd+ShYEkKEgKnEFsmY9sJ88jGxXGxGKlQHAltD+LR9PNg1qj2SSchk
	 W24zRg0+PzEVdmuaSHb8OL/8qRhxT454Ev32+NOV1DlEgaxcHzsGLgaEt7E8vKSNswpxV
	 1NvjgDQ8K9qyY/xnJbQJgOew7Hh+pNt0et12yOLurcf76YEWJvpF/CL+zLpoGbVSkHYG2
	 zNoYeNVv0kKdYpdxNRgQj4Exq9scwsOr0/csRsTkBguin6DYfx1aLccFF1FB0mAeQWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=imcV5ba4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Fl/Yfg/N";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A1C606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:39:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16A1C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=imcV5ba4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fl/Yfg/N
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7fJfR424935
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=M6YIGKBp2Uwn6NWKr3hKh+
	+AtRtVXDvB3/mXc2CHH4w=; b=imcV5ba4ohVDeUBr3xoYxAY52dOnSq80oxMNlf
	Dqrko283stk4+hefixEeKjSnY1OFopWzCSuC2AoCNw4VF5+K0dybAOv5CqqS2ocV
	WRmQOkgYbjUSEr+SUDzkCFub0oFdLUdmFIsGwxD606j3JTJqoXVtxvmQ5kSQ0Hj4
	W9Ie9cZOFs8SAZEcgiJL1TpVRUWRCqWOTFXsHu9MNpbklOiJPvaZ5ycoJQkPdo5A
	kkMzg27q/KU52+1Qmoj0bnkrwIgTi7Zig/2KEFVywz/C3MCKndfUFeMdIN/b8Rok
	jbO3LnLPhraOC/vjipbzMozzpdouFnq9EttJ22xz0HOE2WIQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhkwdhne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:39:33 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-378722fd4a3so3746787eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 00:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794818372; x=1795423172; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=M6YIGKBp2Uwn6NWKr3hKh++AtRtVXDvB3/mXc2CHH4w=;
        b=Fl/Yfg/Nicf4C75qAK2QpDoS/+tP+FR0eH0sv5rZ8EI3WKM+prJXh+i7cD8Y/CFStP
         icOIYCmTH6jaNiDeJzIl/D4U8JFqpf4YKDZCrMHNLe3FNU662rKqYtyHtaectD+vLAWg
         Dd5Uv/JYGZrJbHtqwG2Kkv4YnuBzGA1RtelLhnyfptOJoj6EsaFr/iwJYRZrFTwTdXIB
         xHjideb+Rr0xQjksjvaG8iXOwkIMaT3wrc2NvQspj/fhUzsvDmxMmpPomeREK+pdYFQ8
         /4d/sKEIznlhM3PGHt1TENOKL//5gqetk8qGYrWrb0Rhg8Dp6JYtPCGEQBsmS+opMrr7
         wHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794818372; x=1795423172;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=M6YIGKBp2Uwn6NWKr3hKh++AtRtVXDvB3/mXc2CHH4w=;
        b=pjmpYmcNB0ZPExdV8198DhVO9S0rY7RopoK3dnDfPeSfqNUtYyFOY5RCkq4TkvLgJs
         3sRqAMze30qusd91R8pQ508TOOrnlfJeuMjZO1AhjDQfa/hNO7uopJIjW3aheEUtVZ5W
         GAE7RrYEdGJn9NfFFVLwub1+9fhbecL/UFiQTv9z5jiThQzF9iXaZDuMz5bVMGdeYPXq
         0HnIhU2U57o3y5zISLb3894hjlssQO1he52E6ILNuIDoPhRa0bKWD0KbkLUBR9JQv6UG
         WZfB7NEVNq9CVKxd8+xYxfeo+XUsovoO6ghRH1mAqcA1evPGNN9OF1j+b+d4zv5ECQXe
         eK/A==
X-Forwarded-Encrypted: i=1; AL+hErFBdrXA7JnSTAE4oEYFbBKGWmRx4Te7V32UPwQ+ZxbgGwI6zReRSYw/zBcwj1sUcMcSr2o8VCA2zxoM4ug=@vger.kernel.org
X-Gm-Message-State: APuU4Z+u0viNSYy1GZnl8QzxoMF38UGUCWblMo9Lm0bSDCJlsStMkP3Y
	ks6y1rYXj6zQ16HSM2fanmokbpiSMtvEG20WQ8rSuLRDEoKM4hj+2jT2hCdwCCW5QbpWyqWJdNs
	CUS8j+xlawqeETOHLu1BjTAtjq75XcvtqjLxJcArc0wh1B+CwZfRq1sUlaJFVKNkd2OA=
X-Gm-Gg: AZFdTZdUK373U7euWm8p71A8DG/nKb2qMsicgZZzlerTMF9ccj3KWBE1q+clMbRvnpg
	pLsSO29cTesAtMaUxzA2l/EVZ806V7zNPRUZHLQbZhygaXbSSH67Tz05L7ozIhyMXj4C7XfDRIn
	VK4cs7KkM5EFNz3n7ybwKE9K4ZIYfQk2D+/FOB6ZxKMv3HCz3cNx4TFZzrm4ZU/nyObuEG5c0Da
	B7FMeAFt3c+3GZKmBXfj3Z1GVE/geS87F2zgjNQpK63+6KLMpiJvJhSmFEwvk2jejHoKpDtYFEB
	MGlkxu3ihfdlt63Gw3teuBqRfzM7Cnyket+V6k/1UqlAIfsBAgscEkhr1glCXYWbJYWGmQdJGIi
	DKssbirMEgef0aReRlaHTmndAmU4YOf9fP0Y0EdW7E89V1O8JPyF5GH8Pg/Q3J481USHoPvcqEW
	3nmJuU/sZV3+df3wERFKze+hyjZPydFCc=
X-Received: by 2002:a05:693c:8359:b0:36e:c07a:426f with SMTP id 5a478bee46e88-37967ae5b3dmr9545519eec.39.1794818372222;
        Mon, 16 Nov 2026 00:39:32 -0800 (PST)
X-Received: by 2002:a05:693c:8359:b0:36e:c07a:426f with SMTP id 5a478bee46e88-37967ae5b3dmr9545495eec.39.1794818371609;
        Mon, 16 Nov 2026 00:39:31 -0800 (PST)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm32874021eec.5.2026.11.16.00.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 00:39:31 -0800 (PST)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 00:39:18 -0800
Subject: [PATCH v2] coresight: handle runtime PM resume failures
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-b4-coresight-runtime-pm-failures-v2-1-cc437170e24e@qti.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADbB+moC/5WNSw6DIBRFt2IY9xkgfmJH3YdxgPjQl4gooGlj3
 HupO+jkJucOzjlZQE8Y2DM7mceDArklgXxkTE9qGRFoSMwklxVvhIC+AO08BhqnCH5fIlmE1YJ
 RNO/ph5obWfJG1gp7ljSrR0PvO9F2iScK0fnPXTzE7/1DfggQoPRgiqYuKxTitUXKt13N2lmbp
 2HddV1fSaBGFNcAAAA=
X-Change-ID: 20260911-b4-coresight-runtime-pm-failures-70f250927aeb
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794818370; l=10771;
 i=yuanfang@qti.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=YxgjJh7s4rVCCzUEUDoSws4VzvCFsq5v6NB/A8Ce7qo=;
 b=QIIgSboQILLNjdaXyhXvqrUHrbCSklk/3YDPj/4V0t6yyNQ0ZZwPpISPBQ1t0KkczlbAbGaOr
 suayumABxZbDepHYi3DPpuGLkHGNjaIz/8WJeRT29wxXWt4KkDMnL/M
X-Developer-Key: i=yuanfang@qti.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzNCBTYWx0ZWRfX0ml4pfx0pZIc
 GQPWUgYEo6S9Ha7PZdlzDmsGzDLDubIpdyIge2v0wG/CSucelEAX/6sC2hZxCldcBLZyfyGe82O
 qYsORDxCwAQYqsJJeh2+qZnwb/JGBcDuvtH/XnetCx+gi5EfACpyMl/Dudf0fHvf0aK/UXQkc/N
 J5YopT6MGMK+YkRUQflKvVbv4gB+I/gyGeAtQeoqu7Ju0YvnDAuAvy9dl+CzZO6pwFf3ZdvmiyS
 akFPfUa03hySRFpy1WPZe2t1UrEbtoMln5AOT8UnnaldziwHkI+Q/onfdfna5Gipf2u8ZVIeHiR
 Ah6jLDJyKYqavO5Mbz1iLeDk9d2Mhy/Bzq1JcsWWJpbygsn3EAjuFDGjiJCAN/ZpSpQQ6iuuKzZ
 KXOqtuV+tmj/iGgbDN5bmMYg4ggR1EmMZ67km6OkfFWtNedaHpnWoxkkYCGHnNwZ2IaIVcgAPeH
 CphMgp3TizqlDMEJPFA==
X-Authority-Analysis: v=2.4 cv=YPYKWhGx c=1 sm=1 tr=0 ts=6afac145 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=AmsXAa7n7-pT3CpYTX8A:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: w4XtyLPjDInc_TsfoZzNviF4HLcBIZ-H
X-Proofpoint-ORIG-GUID: w4XtyLPjDInc_TsfoZzNviF4HLcBIZ-H
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzNCBTYWx0ZWRfX8ilmo+mdqiSD
 Ct/nAmaDdWu2inPai842CkKB2b5dZ3DnsQN2M4tjFt6tmz7tAfeBbKanSyVl0NH5ydKcQ67gJSe
 TRv3tULWQzbEKDv4RE/u5/JcGM8bp88=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160034

When a CoreSight component's parent power domain, such as a CPU cluster
genpd, fails to power on, runtime resume returns a negative error. Several
call sites ignored that error and continued to access registers on an
unpowered device, risking an external abort.

Replace the remaining pm_runtime_get_sync() calls with
pm_runtime_resume_and_get(), which restores the runtime PM usage count
when resume fails. Abort before accessing hardware and propagate the
error to the caller.

In coresight_get_ref(), unwind the module and device references. In
debug_enable_func(), roll back the CPUs that resumed successfully before
the failure. Finally, release the mode acquired by stm_enable() if its
runtime resume fails.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Reviewed-by: Ulf Hansson <ulfh@kernel.org>
Reviewed-by: Leo Yan <leo.yan@arm.com>
---
This patch converts the remaining CoreSight pm_runtime_get_sync() users
to pm_runtime_resume_and_get(), propagates resume failures before
hardware access, and completes the related module, device, CPU and mode
unwind paths.
---
Changes in v2:
- Rebase onto coresight/next and adapt ETM3x to etm_readl_cslocked().
- Add Reviewed-by tags from Leo Yan and Ulf Hansson.
- Link to v1: https://lore.kernel.org/r/20260911-b4-coresight-runtime-pm-failures-v1-1-acdf49756e11@qti.qualcomm.com
---
 drivers/hwtracing/coresight/coresight-core.c        | 13 ++++++++++---
 drivers/hwtracing/coresight/coresight-cpu-debug.c   | 10 +++++-----
 drivers/hwtracing/coresight/coresight-cti-sysfs.c   | 10 ++++++++--
 drivers/hwtracing/coresight/coresight-etm3x-sysfs.c |  5 ++---
 drivers/hwtracing/coresight/coresight-etm4x-sysfs.c |  5 ++++-
 drivers/hwtracing/coresight/coresight-funnel.c      |  5 ++++-
 drivers/hwtracing/coresight/coresight-stm.c         |  7 ++++++-
 drivers/hwtracing/coresight/coresight-sysfs.c       | 11 +++++++++--
 8 files changed, 48 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index bcfeb1c97127ece0960241fe56a3e599a9329cc9..fc06756f2783fb0b499f4d9ad0c635725ed20f4d 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -822,14 +822,16 @@ struct coresight_device *coresight_get_sink_by_id(u32 id)
  *
  * @csdev: The coresight device to get a reference on.
  *
- * Return true in successful case and power up the device.
- * Return false when failed to get reference of module.
+ * Return true on success and power up the device.
+ * Return false if a reference cannot be obtained or the device cannot be
+ * powered up.
  */
 static bool coresight_get_ref(struct coresight_device *csdev)
 {
 	struct device *dev = &csdev->dev;
 	struct device *parent = csdev->dev.parent;
 	struct device_driver *drv;
+	int ret;
 
 	/* Make sure csdev can't go away */
 	get_device(dev);
@@ -843,9 +845,14 @@ static bool coresight_get_ref(struct coresight_device *csdev)
 		goto err_module;
 
 	/* Make sure the device is powered on */
-	pm_runtime_get_sync(parent);
+	ret = pm_runtime_resume_and_get(parent);
+	if (ret < 0)
+		goto err_pm;
+
 	return true;
 
+err_pm:
+	module_put(drv->owner);
 err_module:
 	put_device(parent);
 	put_device(dev);
diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index 87b39874461e205e1dbb9d5f15e019888ff51d28..edccbd2fa5e2c65f44d627b25bebff7bc0cc316a 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -429,19 +429,19 @@ static int debug_enable_func(void)
 		if (!drvdata)
 			continue;
 
-		ret = pm_runtime_get_sync(drvdata->dev);
+		ret = pm_runtime_resume_and_get(drvdata->dev);
 		if (ret < 0)
 			goto err;
-		else
-			cpumask_set_cpu(cpu, &mask);
+
+		cpumask_set_cpu(cpu, &mask);
 	}
 
 	return 0;
 
 err:
 	/*
-	 * If pm_runtime_get_sync() has failed, need rollback on
-	 * all the other CPUs that have been enabled before that.
+	 * If runtime resume has failed, roll back all the other CPUs
+	 * that have been enabled before that.
 	 */
 	for_each_cpu(cpu, &mask) {
 		drvdata = per_cpu(debug_drvdata, cpu);
diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index 2ed5d8eb1ddab907bff92057c54b7e90f6192a64..75018fe6527cdc019738eb7f66201597b972558b 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -167,8 +167,11 @@ static ssize_t coresight_cti_reg_show(struct device *dev,
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cs_off_attribute *cti_attr = container_of(attr, struct cs_off_attribute, attr);
 	u32 val = 0;
+	int ret;
 
-	pm_runtime_get_sync(dev->parent);
+	ret = pm_runtime_resume_and_get(dev->parent);
+	if (ret < 0)
+		return ret;
 
 	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock)
 		val = cti_read_single_reg(drvdata, cti_attr->off);
@@ -185,11 +188,14 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cs_off_attribute *cti_attr = container_of(attr, struct cs_off_attribute, attr);
 	unsigned long val = 0;
+	int ret;
 
 	if (kstrtoul(buf, 0, &val))
 		return -EINVAL;
 
-	pm_runtime_get_sync(dev->parent);
+	ret = pm_runtime_resume_and_get(dev->parent);
+	if (ret < 0)
+		return ret;
 
 	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock)
 		cti_write_single_reg(drvdata, cti_attr->off, val);
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
index 08c10fd146d5fc2bd0cfac829fc50109dd4a3e29..52118d6a2037a09af41641967d4014fcccab5b05 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
@@ -32,9 +32,9 @@ static int etm_readl_cslocked(struct etm_drvdata *drvdata, u32 off,
 	int ret;
 	struct etm_readl_cslocked_arg arg;
 
-	ret = pm_runtime_get_sync(drvdata->csdev->dev.parent);
+	ret = pm_runtime_resume_and_get(drvdata->csdev->dev.parent);
 	if (ret < 0)
-		goto out;
+		return ret;
 
 	arg.drvdata = drvdata;
 	arg.off = off;
@@ -43,7 +43,6 @@ static int etm_readl_cslocked(struct etm_drvdata *drvdata, u32 off,
 	ret = smp_call_function_single(drvdata->cpu,
 				       etm_readl_cslocked_smp_call,
 				       (void *)&arg, 1);
-out:
 	pm_runtime_put(drvdata->csdev->dev.parent);
 	return ret;
 }
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index db9e603f97ba82cd608d3d61881fe8153db020ff..f29e753245d3d0d367499b4a38ccf2f3bb3d66b0 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -2498,10 +2498,13 @@ static ssize_t coresight_etm4x_reg_show(struct device *dev,
 {
 	u32 val, offset;
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	int ret;
 
 	offset = coresight_etm4x_attr_to_offset(d_attr);
 
-	pm_runtime_get_sync(dev->parent);
+	ret = pm_runtime_resume_and_get(dev->parent);
+	if (ret < 0)
+		return ret;
 	val = etmv4_cross_read(drvdata, offset);
 	pm_runtime_put_sync(dev->parent);
 
diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index c981215ad64970245e44bf0f34e40fa6c6bcec9a..220c69cb4ee3e08cea32b17f85853fbe210ad670 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -192,9 +192,12 @@ static ssize_t funnel_ctrl_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	u32 val;
+	int ret;
 	struct funnel_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
-	pm_runtime_get_sync(dev->parent);
+	ret = pm_runtime_resume_and_get(dev->parent);
+	if (ret < 0)
+		return ret;
 
 	val = get_funnel_ctrl_hw(drvdata);
 
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index a75b1c56a86710ebe5ad85758f85007d4c158d2e..b358b5576d975f5d440d80c28a401d10aad00b50 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -196,6 +196,7 @@ static int stm_enable(struct coresight_device *csdev, struct perf_event *event,
 		      __maybe_unused struct coresight_path *path)
 {
 	struct stm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+	int ret;
 
 	if (mode != CS_MODE_SYSFS)
 		return -EINVAL;
@@ -205,7 +206,11 @@ static int stm_enable(struct coresight_device *csdev, struct perf_event *event,
 		return -EBUSY;
 	}
 
-	pm_runtime_get_sync(csdev->dev.parent);
+	ret = pm_runtime_resume_and_get(csdev->dev.parent);
+	if (ret < 0) {
+		coresight_set_mode(csdev, CS_MODE_DISABLED);
+		return ret;
+	}
 
 	spin_lock(&drvdata->spinlock);
 	stm_enable_hw(drvdata);
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index 5dd4e9b0426e4eb260655fc67d079dfb99949812..5edef1f395b9835a44b6c3cbb5b31eac62dabfd9 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -17,8 +17,12 @@ ssize_t coresight_simple_show_pair(struct device *_dev,
 	struct coresight_device *csdev = container_of(_dev, struct coresight_device, dev);
 	struct cs_pair_attribute *cs_attr = container_of(attr, struct cs_pair_attribute, attr);
 	u64 val;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(_dev->parent);
+	if (ret < 0)
+		return ret;
 
-	pm_runtime_get_sync(_dev->parent);
 	val = csdev_access_relaxed_read_pair(&csdev->access, cs_attr->lo_off, cs_attr->hi_off);
 	pm_runtime_put_sync(_dev->parent);
 	return sysfs_emit(buf, "0x%llx\n", val);
@@ -31,8 +35,11 @@ ssize_t coresight_simple_show32(struct device *_dev,
 	struct coresight_device *csdev = container_of(_dev, struct coresight_device, dev);
 	struct cs_off_attribute *cs_attr = container_of(attr, struct cs_off_attribute, attr);
 	u64 val;
+	int ret;
 
-	pm_runtime_get_sync(_dev->parent);
+	ret = pm_runtime_resume_and_get(_dev->parent);
+	if (ret < 0)
+		return ret;
 	val = csdev_access_relaxed_read32(&csdev->access, cs_attr->off);
 	pm_runtime_put_sync(_dev->parent);
 	return sysfs_emit(buf, "0x%llx\n", val);

---
base-commit: 1352ce9c99bdb9fb2905f59db5b74830ff2ce556
change-id: 20260911-b4-coresight-runtime-pm-failures-70f250927aeb

Best regards,
-- 
Yuanfang Zhang <yuanfang@qti.qualcomm.com>

