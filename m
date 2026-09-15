Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584C04B7172
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491449; cv=none; b=iQQc5MCL/txIw2O5POHiK9nmXrBGC6ahtzs8aF0Gnqi1tj94t5lsyMHf7P8DStzjpGUkRfyjzMsqO93nkSh08FNClewXAxdi7CJAXOifFa1FUE0TXjnJl/Tqq1h66lz2qCYrWqkzmz2kA+t5zhmOW4yU6TtlzlbGi/9YLhWilCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491449; c=relaxed/simple;
	bh=3JoZslnkrMsaU3dbbMDWnwmTMC8zQq0qdN+qFoCdvA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QOQaau7siN67pI5kHfd9p4iReyidO2x4vWEb9g6gWnTWHPDEJE6SfGWkr/8dCU03thYm2K5GQ5nwObClwFc5IeYYqmIfFyoiJC0KijBFNL06v+R/8wnycDhCpc0cRIXIdaxqdWur6EFeWlDf8dQTkobrfiDS8PavUrmii0xDw/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OsL1mDSj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DSCqDkca; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OsL1mDSj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DSCqDkca"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAU2M4176143
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:57:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fN1FhCnQZY6
	7jtn7cG6ZH44bflXnGtosQXBJzsdeJFo=; b=OsL1mDSjgBPzJZYXh04KiJq8jq0
	NY5vFWNH5KAJiAhaQifGCJ9uFu2aKlWT9QuZfM36taAYBMR2LioCszAmGH1/qYuz
	hDoJwBvfQqAdhz/NBGo4EtE/FwXyzp7SNO9UCzyyXW+ih7JV31LwKw7YsgeUdC3x
	l81nMT7xjH5QeS4U6rfGbtU6S80IlAbDiLohTvZfDwDMjBGLcWHBkp3NgFejSCLw
	4VQbEAVE72OF5khGrt2/xHvOu6cVfqY+AxbM47lNpy3AoDul6eDnn6Jm4MOBrO7Z
	BNeuJmigzksxfHPLq5RVYs8VFyfhK1cMYYDPvo2s8BDnfOVGh+b/d/fVLig==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3hc2jjv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:57:21 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78a686d205cso3874269137.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789491440; x=1790096240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fN1FhCnQZY67jtn7cG6ZH44bflXnGtosQXBJzsdeJFo=;
        b=DSCqDkca5giWlQXbanOaARaFmbbKWgjA7bKneDkKGXN/ZguLPViBTYnnGin3CrYXW2
         /H+hPaLZlrPQXL+08XhvveXTajPJsDQo5/0hZ29GEpg67yB0Scb0FVql3RUhwDeLqY0V
         1r2tMzH/Qv1VeItSGrPkYiYhLan/iHcymKqrMmZhS6wMFNu9/ISf1daBXYj6l0oqiQsG
         FfHY816rF/iAovwL3Lz/Q/UoMcuADGFU05ZovwYX+4TkdqsAqpisTz9RTKFtQUEcJZ4O
         tf2tJM5yYav3+RDD7uHcD04yBt1BbLzLseVw+MoCUAQ9W1koo3e8885+LZ5VQxRDJdcn
         Inqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789491440; x=1790096240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fN1FhCnQZY67jtn7cG6ZH44bflXnGtosQXBJzsdeJFo=;
        b=sehpXuzzQatC9y2DnchaVLeSmqcc6YedL+s3FNezlzwuc4hMiMROIA0I42TMyUidTs
         CgfwnCGOqYP7bEi4/GsNdLP6FbFUs+SGSB80MY459gSqTW94NTfnoH0tPinzpqqT7qwB
         6i1MA9Or3UR8TRZ83X4qdi6STVWntA4FWIbj5Wg8C/Qh8W7Vytex/cy5Pl6fc+6PvItD
         WhCX1ikDr3XQGPoaQyDrin0ydEbgPcG2aaC59czQBSP/rNzcBqpRHn34vOvU9n98JEr4
         gflefnLpB/i5Hbo2TBV5YohaQ73PdHTvciz8J7Rrk+Hd3J2Kq9M3Nz9US02POrtCQAtg
         J8+g==
X-Forwarded-Encrypted: i=1; AKwUvBwK1/mGQ0IC92QhjBufPtTb2WsCVV/lr8qxrsCxThMsL+Biw90ZUEN6TXoeNMmPCvPRmBWpfS/l5i9JClg=@vger.kernel.org
X-Gm-Message-State: AFuF++kbjz5KBFgGR5aslJbl1KiBIBhrxGxHpr0sM7WzosoJMAOCF0QF
	gVY2/DpkPgtCirjiYQyPRJJGcGO9IQY6XeVpKa9DK7v6CsnAoSDCHgegsZrI7yhcwjERPsGIABn
	HBtrUBcJZI/C/zVnv3XdF9G/jXTUwZs2woTEN48vERsl/oLBWjkTA/Lai9qvokDdwUIQ=
X-Gm-Gg: AYBFou28RBvsaINEwLvmLxn6fsoH/FY19e+zqWLhL0H6PWljKeeZX0Bfr85vhCj/jBb
	tOVHIswvaiyf9M93MVdXM7PlSVGkHRuNAl3ItcKByupizFSE93LK+svEMjYhErifYFcWQV8vkfD
	BUdjsQw5Wv4kKJ4lNoKc4nEDBMU6bOJbwzgr9eJ4iMFeX8ravDJTMMqNU1XB6R3+gC9WX10k+j6
	tZtJhXIiGYJCZYxAXfg9fSbHmYM55HsYFlSp9Jw9N1/sBwFJkspVU5WVJWBC56XtEcx5HP61iFN
	74fST1X0j9eJ1hWGNj/fmLUYFpFDutGoykN91BTP0Q69zwubUaLt3V4xuKP+N0hpceGO7FTiIQg
	qbxlhLihoxO4wcw==
X-Received: by 2002:a05:6102:fa8:b0:79b:cc58:2973 with SMTP id ada2fe7eead31-79ed474a097mr3876355137.5.1789491440438;
        Tue, 15 Sep 2026 09:57:20 -0700 (PDT)
X-Received: by 2002:a05:6102:fa8:b0:79b:cc58:2973 with SMTP id ada2fe7eead31-79ed474a097mr3876292137.5.1789491439960;
        Tue, 15 Sep 2026 09:57:19 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83d9057dsm4361335e9.3.2026.09.15.09.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:57:19 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 5/8] ASoC: SDCA: class_function: xlate sound-dai cell by entity index
Date: Tue, 15 Sep 2026 17:56:47 +0100
Message-ID: <20260915165652.914893-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915165652.914893-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260915165652.914893-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: n2HBmC_SWYdhsBo7UT0Vv6KrVbK1_Se1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI0NyBTYWx0ZWRfXxFc9YQuzKEfo
 ShU94Sc1whBrYu+oHu4Ez15jhUWEzLR5/GpZJ6/m1i7/NneAH+xwk+TN/mfu3qUqPMfVlvOxVHq
 cBVcfdY5t4dj3Zoo6zRZRCDDtuJADLQ=
X-Authority-Analysis: v=2.4 cv=dcUVTnXe c=1 sm=1 tr=0 ts=6aa978f1 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=D7LRd5SpCY7MsyqoJ6wA:9 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI0NyBTYWx0ZWRfX1aZ0cAVeSXTS
 Humyf/jlC6yLQqlyDk3vgUcmnjpdZCIKisGA0yILs0mxahZt0V0yPlsfeFIkP49WEtKd2pZ/Amg
 T5DD0kSO5fa9aSOBfO4WOxRO8j5jestL+1E/f3k3wevbO1Ka8oP12eH3mbXA9YLFi1mUEw3O7QN
 0Q7K0bN0HV1HrMStxyWt1PbtW2SzqdEwDywIWhgAQWbsqEOv58fDbjet2uyRZMYaTJaDNyo68lX
 PJdcZQwEqUZ28i281mCVbsYDt6xzCCPR28VEe3h8jI89wtvD0IA/F57sMv0O5DmACc14ADCR8yj
 GVM5Cyl53oz7qJJGJAOZXproe41VyOGdZ6yfaOwJalyllqDM0q0RWwc9s7F8TTojWhgGg8nxU1d
 x+0/zoIMhM9DgT8QGYssZMzT9cwxQJf9T5zRQPmg9XThqgo9If6jVW+EZiJB9n2p+YgKadHKJWK
 sovVD7Q8coxG52M4wkg==
X-Proofpoint-GUID: n2HBmC_SWYdhsBo7UT0Vv6KrVbK1_Se1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150247

sdca_asoc_populate_dais() sets each DAI id from the SDCA Function's
entity array index. ASoC's default of_xlate_dai_name treats the
phandle cell as a positional index into the DAI list, so on a Function
with non-DAI entries between dataport entities a sound-dai phandle
resolves to the wrong DAI.

Register a custom of_xlate_dai_name that walks the entity array and
returns the dataport entity whose array index matches the cell value.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/sdca/sdca_class_function.c | 34 ++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index d83be8474e7b..328c667edfd9 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -216,9 +216,43 @@ static int class_function_set_jack(struct snd_soc_component *component,
 	return sdca_jack_set_jack(core->irq_info, jack);
 }
 
+/*
+ * DT phandle cell is the SDCA entity index (matches dais[].id), not the
+ * positional DAI index the default xlate assumes.
+ */
+static int class_function_of_xlate_dai_name(struct snd_soc_component *component,
+					    const struct of_phandle_args *args,
+					    const char **dai_name)
+{
+	struct class_function_drv *drv = snd_soc_component_get_drvdata(component);
+	struct sdca_function_data *function = drv->function;
+	struct sdca_entity *entity;
+	u32 target;
+
+	if (args->args_count != 1)
+		return -EINVAL;
+
+	target = args->args[0];
+	if (target >= function->num_entities)
+		goto err;
+
+	entity = &function->entities[target];
+	if ((entity->type != SDCA_ENTITY_TYPE_IT &&
+	     entity->type != SDCA_ENTITY_TYPE_OT) || !entity->iot.is_dataport)
+		goto err;
+
+	*dai_name = entity->label;
+	return 0;
+err:
+	dev_err(component->dev, "xlate: no dataport entity at index %u (num_entities=%d)\n",
+		target, function->num_entities);
+	return -EINVAL;
+}
+
 static const struct snd_soc_component_driver class_function_component_drv = {
 	.fixup_controls		= class_function_component_fixup_controls,
 	.remove			= class_function_component_remove,
+	.of_xlate_dai_name	= class_function_of_xlate_dai_name,
 	.endianness		= 1,
 };
 
-- 
2.53.0

