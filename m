Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900827;
	b=wzey08WlCfGVfSqqKeg71yutgEYSzG9qDalPvCUgQj/t/k0TmcN/Ycu/f2lW1BCwZunE
	 xcGtamORE/XSMNPLpBMnZhB4qR4AvGbgXvsM6d3/hstU4Jqb+zDF1R235I4W+tp8TmYjP
	 g3Jej2+t0qH3jHiSNJS+8kSK5Un7nKyV7cZs+7eVhbmY2xWhJBnHcRq3PERvftrQcRb5O
	 wbdD80J5bDC27XA0HW1Ap18bz8Vc01fK6H8s38RR8V5qo6AdTjaEamDDwxkU03CISylpO
	 WcdqzliBOnKJmSyApjhEvv9qaA1I/wuW0MV4W0xmhBspzKWjohiIbkLhWqbtjwRf0+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900827;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VKM0LeDW9uPELLsJ3ydKc0YLcym1Eatl7rEsmoWJvPA=;
	b=uVW4fPSU34KOpnzgDcEqfrQIS3bvfU94pYTmAfO0caxfLpB3T9XdIeCQBDr5QIGVA+r+
	 ARnJ6f2d0Qo5IxSbglcBEGCkz/ebPBQSQIBf0HuufcuDBl3ez85lu5fC0Wck58RJxRsmP
	 EYfKKmuCwyAJbGTfZjPDC/JiokaGXv+mo34f+10HsopcAd9dPwJOKMl7n6wlz9lFhV2tk
	 sr0okx7nNSLnJYJc/CFQ3XcrXkcWMW99Gxrte9VNRrWddVh9Y9R3l8MCSPxMzgnzcOD5n
	 eFYmDmgLR7cRTqnA7z9SKK/TVYp6EnJX0czpUwMVfi+erdWL0JlvIsXpnxljAEe7Tkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XP6l0n+q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cHET3vSw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0236D606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0236D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XP6l0n+q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cHET3vSw
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6M31U3980901
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VKM0LeDW9uP
	ELLsJ3ydKc0YLcym1Eatl7rEsmoWJvPA=; b=XP6l0n+qPnFAUX/8vjhKKFOpFQa
	G0irgByzs2/r6qnu0ZqaopZ0ILYol+4OnAhG/QoT/TVJqCZPM5LfaQyE7WDtBsKV
	DMbwKGziNAJh0qnrJYQDwaxrLazaXVCxeD/nR+FXYZHn24FYmQdqgwujBrTq+O8P
	rLya0zgJxz0bVefgo1ONNVdZrzhTiNF4p7m9f3nb+H25F0VkHWXodQjfjwR4p+xM
	ewNHTSlzAMEXxRlYQl3bUimMOsieottnfzwEXTPZajLxbyVxOHSB3Fnlxb3fhuUE
	zkeyO/+t0aS2LA2QZjJhLmJxpOc3IpDqgk0vPxTwQ46vk8FoGGiF8qgLvHQ==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hkd08ab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:33:45 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-862c4207de6so2694894a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794900825; x=1795505625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VKM0LeDW9uPELLsJ3ydKc0YLcym1Eatl7rEsmoWJvPA=;
        b=cHET3vSwPmhXBAyZFaA0MQNQvcctJSri5K/ACvxPi8xdJxhaKJb11rO/giCH0OT5RL
         KwdIwBuygNnIBK6PLUmp91abgymviQ/9gl/Cwz8QY4vZDnfSm4/YcIPNj1d+2AZ9hbJr
         QBXbaWnNtihzi14N/X7Hhe9D+Eai2Oj737HvDIh2j4X7oI/VxvdfaFcxTOvnYq6Tg7Q5
         DeERNYMo1vqIuFrqsteqFeZleHMF0P/fbyTdc42vX5/d02m/9SLYSujVNYEoGXV2nQYl
         AiryidzMXKy0Q2aW/ooBF5/S8iBywvF9xfLKelRvZ6QMpku9WElqX7uM8M3j57gE28+s
         kVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794900825; x=1795505625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VKM0LeDW9uPELLsJ3ydKc0YLcym1Eatl7rEsmoWJvPA=;
        b=dVmSdX9a55wHu1uG4gEstUhEo6QksfFgNSu3CedMyBAVAK1QL4w66kbN336zu4aZfR
         iKc/FZrCA12htp1aIF48vbgsN3OghJ2wtYqm86qMJmdmnwpGVadtWY8JXCdHdeL5pqdp
         D4RsqUU9LK4DW5gksf4+xaDg8L1vpnxrXcvIu+9V6gYgf3xQa2xkBNlIWwzp3hlz17mJ
         SpUY4N2dhpsAb6R/F54tqHaXRAiRwA9FdC5kI8M3jvACwtf2tk/h7388JmW2KMwIJXDR
         +oWyFz1gmZ2onz5AC2uq0rVXcUmAASr49FGWUUcTCUFIRfYBOJ6CJ8wUV/0KlC9Fp/T/
         uQ/g==
X-Forwarded-Encrypted: i=1; AL+hErGWJG13IF3ma6URQ1gCthVJPGPo5OFaeOtARaluPsjKM1vLPCGAXp/CebafEuDzDrDTJKhiHUIQB1dil9I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dfoknnhLcsQTCK24i/kXuUtVnfB/wsapKFK6u9XBLzq+X43Ga
	JNe7M28nrRj3wkr0V0atkgyLlG/N2+elN1LUYXh0lmTTEVQBu5fRlRg/DnEy4hnowH3k6YRZ4Oe
	G1CG0jmT/z8/OosD7Qk2IZmyvGFQFiMz+Fn1PP3LfxD8l+mOn5llCCMAA3chcKv+Cs5k=
X-Gm-Gg: AYBFou3JcqngTlwoblKMwQXQPmGy7Q3G3Yam8UG1hUVqn6M2+2yAipcTI410FTQ5tzC
	DcWGWmbJpSFx+9XeLOfNCzwNcd/JxXogfnRX/EUAPjfifoCttuBLBnWv+27CUopPICAfUxRy15Q
	mpQFHDx0lz35kGwyExCEi9Di0s/KixaX7upSmFOqk7Yi2guWuWKBJX9a7pAOyaSeXdfUkRwFl/7
	NfJA0DS2txw8CBL9fzGU3uKYt/sE7NNEJWTfPyeTtRv9XZs7zkD7qGfdVkXQjG/W2epf3zyPPpH
	N+flC42OGnHHlgY2Qj4ofBSvtZisjXIeXzS3jgx9EO3f04uzJMmgmRJbJHUPFggpFNcMy70BCck
	yEthgiXnSbfYNh41cBI2HupXE957tz2Vz4kjMltYhbRNE9oHO7maLRbNb6L0OFThhm8a/wNqSE+
	zrMBHJ1umVFQ6HgGob7dtiI+C3Cl6Zvh9fyQ==
X-Received: by 2002:a05:6830:3e05:b0:862:b4c2:d173 with SMTP id 46e09a7af769-862b4c2dd3fmr8067854a34.31.1794900825114;
        Mon, 16 Nov 2026 23:33:45 -0800 (PST)
X-Received: by 2002:a05:6830:3e05:b0:862:b4c2:d173 with SMTP id 46e09a7af769-862b4c2dd3fmr8067827a34.31.1794900824580;
        Mon, 16 Nov 2026 23:33:44 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862c67db8basm4944508a34.13.2026.11.16.23.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:33:44 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, songchai@qti.qualcomm.com,
        Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v19 5/8] qcom-tgu: Add TGU decode support
Date: Tue, 17 Nov 2026 15:33:02 +0800
Message-Id: <20261117073305.3854951-6-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117073305.3854951-1-songwei.chai@oss.qualcomm.com>
References: <20261117073305.3854951-1-songwei.chai@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=eqFKXYpX c=1 sm=1 tr=0 ts=6afc035a cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=YABCWhCaaoNg3nrmXDQA:9 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfXwXMNnDt1WKYp
 xrftBP64ZpJ/MwXymnqw8UvUicLmJydDqJLF/9EHlABZs30qwOMKytlEfi7eXxZCT/wOkUeO7+L
 MMTvs563SVY9RfEQgnLTmx7I657PTFM=
X-Proofpoint-GUID: JWhamSUtimvjiWN3v3O_ewty9wj_61Z1
X-Proofpoint-ORIG-GUID: JWhamSUtimvjiWN3v3O_ewty9wj_61Z1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX2UnNmJMQbPAA
 8YtWHCXX7r6NifZPe/EoOBbXWMk0tTE7HDrt/AGwQH2KvK7htsGL26C9G3OIKy8U/idLKX/mczT
 2TuzIEI/rhhUulR03BUm+D7RD64HqE5bkh+sJrwXGzrS4ibPYZnwdNDLiyCDlScmmK2b/dPSPIO
 URxP22txi8cKqZz8kJ3H5eOhSwaDjRjuBP4ctyn8c1nnQgU6XCWyzYc46RAJ+EE97E5A7tL+0nn
 baVDi86XFDsG+q2p8Pgy+2hSXG1gYB0kuixAmvpx/fAFvcnEAnoL9HO3Qs/HWV2o1FD9Wd1UHwV
 WYwPX8EegaXZlrj7wlIkTSPbd/wwpy8sBjiHMGeQjvTZr4/Xc7lcmOghPqpfMcPmHFLA1QENSHv
 SoSPkEf12ivxQ09g1kUZZoIAhUfxSkIMNzenm75C3ytb8Gr31k/7VHK9jHWWiqf3MqTpRzCqM3k
 /yGlo6kVlRYAYf84OnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170029

Decoding is when all the potential pieces for creating a trigger
are brought together for a given step. Example - there may be a
counter keeping track of some occurrences and a priority-group that
is being used to detect a pattern on the sense inputs. These 2
inputs to condition_decode must be programmed, for a given step,
to establish the condition for the trigger, or movement to another
steps.

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |   7 +
 drivers/hwtracing/qcom/tgu.c                  | 191 +++++++++++++++---
 drivers/hwtracing/qcom/tgu.h                  |  39 +++-
 3 files changed, 211 insertions(+), 26 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 3be0b912c937..c7e6f13da83d 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -14,3 +14,10 @@ KernelVersion:	7.5
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the sensed signal with specific step and priority for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_decode/reg[0:3]
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the decode mode with specific step for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index c876b98e43e2..5562b3d83ff9 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -18,8 +18,8 @@
 
 struct tgu_attribute {
 	struct device_attribute attr;
+	enum operation_index operation_index;
 	u8 step_index;
-	u8 priority;
 	u8 reg_num;
 };
 
@@ -27,11 +27,26 @@ struct tgu_attribute {
  * drvdata->priority is a flat [priority][step][reg] array.
  */
 static int calculate_array_location(struct tgu_drvdata *drvdata,
-				    int step_index, int priority,
+				    int step_index, int operation_index,
 				    int reg_index)
 {
-	return priority * (drvdata->num_step) * (drvdata->num_prio_regs) +
-		step_index * (drvdata->num_prio_regs) + reg_index;
+	switch (operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		return operation_index * (drvdata->num_step) *
+			(drvdata->num_prio_regs) +
+			step_index * (drvdata->num_prio_regs) + reg_index;
+	case TGU_CONDITION_DECODE:
+		return step_index * (drvdata->num_condition_decode) +
+			reg_index;
+	default:
+		break;
+	}
+
+	dev_err(drvdata->dev, "calculate array location - Fail\n");
+	return -EINVAL;
 }
 
 static ssize_t tgu_dataset_show(struct device *dev,
@@ -43,8 +58,10 @@ static ssize_t tgu_dataset_show(struct device *dev,
 	int index;
 
 	index = calculate_array_location(drvdata, tgu_attr->step_index,
-					 tgu_attr->priority,
-					 tgu_attr->reg_num);
+			tgu_attr->operation_index, tgu_attr->reg_num);
+
+	if (index == -EINVAL)
+		return index;
 
 	/*
 	 * Serialise against tgu_dataset_store() and tgu_enable(), which read
@@ -53,7 +70,20 @@ static ssize_t tgu_dataset_show(struct device *dev,
 	 */
 	guard(mutex)(&drvdata->lock);
 
-	return sysfs_emit(buf, "0x%x\n", drvdata->priority[index]);
+	switch (tgu_attr->operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->priority[index]);
+	case TGU_CONDITION_DECODE:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->condition_decode[index]);
+	default:
+		break;
+	}
+	return -EINVAL;
 }
 
 static ssize_t tgu_dataset_store(struct device *dev,
@@ -73,12 +103,30 @@ static ssize_t tgu_dataset_store(struct device *dev,
 
 	guard(mutex)(&tgu_drvdata->lock);
 	index = calculate_array_location(tgu_drvdata, tgu_attr->step_index,
-					 tgu_attr->priority,
+					 tgu_attr->operation_index,
 					 tgu_attr->reg_num);
 
-	tgu_drvdata->priority[index] = val;
+	if (index == -EINVAL)
+		return index;
+
+	switch (tgu_attr->operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		tgu_drvdata->priority[index] = val;
+		ret = size;
+		break;
+	case TGU_CONDITION_DECODE:
+		tgu_drvdata->condition_decode[index] = val;
+		ret = size;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
 
-	return size;
+	return ret;
 }
 
 static umode_t tgu_node_visible(struct kobject *kobject,
@@ -95,15 +143,32 @@ static umode_t tgu_node_visible(struct kobject *kobject,
 	if (tgu_attr->step_index >= drvdata->num_step)
 		return SYSFS_GROUP_INVISIBLE;
 
-	if (tgu_attr->reg_num >= drvdata->num_prio_regs)
-		return 0;
+	switch (tgu_attr->operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		if (!drvdata->num_prio_regs)
+			return SYSFS_GROUP_INVISIBLE;
+		if (tgu_attr->reg_num < drvdata->num_prio_regs)
+			return attr->mode;
+		break;
+	case TGU_CONDITION_DECODE:
+		if (!drvdata->num_condition_decode)
+			return SYSFS_GROUP_INVISIBLE;
+		if (tgu_attr->reg_num < drvdata->num_condition_decode)
+			return attr->mode;
+		break;
+	default:
+		break;
+	}
 
-	return attr->mode;
+	return 0;
 }
 
-static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
+static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 {
-	int i, j, k, index;
+	int i, j, k, index = 0;
 
 	CS_UNLOCK(drvdata->base);
 	for (i = 0; i < drvdata->num_step; i++) {
@@ -111,6 +176,8 @@ static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 			for (k = 0; k < drvdata->num_prio_regs; k++) {
 				index = calculate_array_location(
 							drvdata, i, j, k);
+				if (index == -EINVAL)
+					goto exit;
 
 				writel(drvdata->priority[index],
 					drvdata->base +
@@ -118,14 +185,28 @@ static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 			}
 		}
 	}
+
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < drvdata->num_condition_decode; j++) {
+			index = calculate_array_location(drvdata, i,
+						TGU_CONDITION_DECODE, j);
+			if (index == -EINVAL)
+				goto exit;
+
+			writel(drvdata->condition_decode[index],
+				drvdata->base + CONDITION_DECODE_OFFSET(i, j));
+		}
+	}
 	/* Enable TGU to program the triggers */
 	writel(1, drvdata->base + TGU_CONTROL);
+exit:
 	CS_LOCK(drvdata->base);
+	return index >= 0 ? 0 : -EINVAL;
 }
 
 static void tgu_set_dev_caps(struct tgu_drvdata *drvdata)
 {
-	int num_sense_input, num_prio_regs, num_step;
+	int num_sense_input, num_prio_regs, num_step, num_condition_decode;
 	u32 devid;
 
 	devid = readl(drvdata->base + CORESIGHT_DEVID);
@@ -153,12 +234,28 @@ static void tgu_set_dev_caps(struct tgu_drvdata *drvdata)
 		num_step = TGU_MAX_STEPS;
 	}
 	drvdata->num_step = num_step;
+
+	num_condition_decode = TGU_DEVID_CONDITIONS(devid);
+
+	if (num_condition_decode > TGU_MAX_CONDITION_DECODE) {
+		dev_warn(drvdata->dev,
+			"DEVID reports %d condition decode regs, clamping to %d\n",
+			num_condition_decode, TGU_MAX_CONDITION_DECODE);
+		num_condition_decode = TGU_MAX_CONDITION_DECODE;
+	}
+	drvdata->num_condition_decode = num_condition_decode;
 }
 
-static void tgu_enable(struct tgu_drvdata *drvdata)
+static int tgu_enable(struct tgu_drvdata *drvdata)
 {
-	tgu_write_all_hw_regs(drvdata);
+	int ret;
+
+	ret = tgu_write_all_hw_regs(drvdata);
+	if (ret)
+		return ret;
+
 	drvdata->enabled = true;
+	return 0;
 }
 
 static void tgu_disable(struct tgu_drvdata *drvdata)
@@ -212,7 +309,11 @@ static ssize_t tgu_enable_store(struct device *dev,
 		if (ret)
 			return ret;
 
-		tgu_enable(drvdata);
+		ret = tgu_enable(drvdata);
+		if (ret) {
+			pm_runtime_put(dev);
+			return ret;
+		}
 	} else {
 		if (!drvdata->enabled)
 			return -EINVAL;
@@ -234,12 +335,13 @@ static const struct attribute_group tgu_common_grp = {
 	.attrs = tgu_common_attrs,
 };
 
-#define tgu_dataset_rw(name, step_index, priority, reg_num)              \
-	(&((struct tgu_attribute[]){ {                                   \
-		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
-		step_index,                                              \
-		priority,                                                \
-		reg_num,                                                 \
+#define tgu_dataset_rw(name, step_idx, operation, reg_idx)                   \
+	(&((struct tgu_attribute[]){ {                                      \
+		.attr = __ATTR(name, 0644, tgu_dataset_show,                \
+				tgu_dataset_store),                         \
+		.operation_index = operation,                               \
+		.step_index = step_idx,                                    \
+		.reg_num = reg_idx,                                         \
 	} })[0].attr.attr)
 
 #define STEP_PRIORITY(step_index, reg_num, priority)              \
@@ -280,6 +382,24 @@ static const struct attribute_group tgu_common_grp = {
 		.name = "step" #step "_priority" #priority \
 	})
 
+#define STEP_DECODE(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
+
+#define STEP_DECODE_LIST(step_index) \
+	{STEP_DECODE(step_index, 0), \
+	 STEP_DECODE(step_index, 1), \
+	 STEP_DECODE(step_index, 2), \
+	 STEP_DECODE(step_index, 3), \
+	 NULL                        \
+	}
+
+#define CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(step)\
+	(&(const struct attribute_group){\
+		.attrs = (struct attribute*[])STEP_DECODE_LIST(step),\
+		.is_visible = tgu_node_visible,\
+		.name = "step" #step "_condition_decode" \
+	})
+
 static const struct attribute_group *tgu_attr_groups[] = {
 	&tgu_common_grp,
 	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 0),
@@ -314,6 +434,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
 	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 1),
 	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 2),
 	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 3),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(0),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(1),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(2),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(3),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(4),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(5),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(6),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(7),
 	NULL,
 };
 
@@ -321,6 +449,7 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	struct device *dev = &adev->dev;
 	struct tgu_drvdata *drvdata;
+	int i, j, index;
 	int ret;
 
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
@@ -340,6 +469,18 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 
 	tgu_set_dev_caps(drvdata);
 
+	/* Initialize all condition decode registers to NOT */
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < drvdata->num_condition_decode; j++) {
+			index = calculate_array_location(drvdata, i,
+							  TGU_CONDITION_DECODE, j);
+			if (index == -EINVAL)
+				return index;
+
+			drvdata->condition_decode[index] = TGU_CONDITION_DECODE_NOT;
+		}
+	}
+
 	drvdata->enabled = false;
 
 	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index 4a443475c156..1dd99db09f39 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -16,7 +16,8 @@
 	((int)FIELD_GET(GENMASK(17, 10), devid_val))
 #define TGU_DEVID_STEPS(devid_val) \
 	((int)FIELD_GET(GENMASK(6, 3), devid_val))
-
+#define TGU_DEVID_CONDITIONS(devid_val) \
+	((int)FIELD_GET(GENMASK(2, 0), devid_val))
 #define TGU_BITS_PER_SIGNAL	4
 #define LENGTH_REGISTER		32
 
@@ -51,6 +52,8 @@
 #define PRIORITY0_BASE		0x0034
 #define PRIORITY_SIZE		0x0060
 
+#define CONDITION_DECODE_BASE	0x0010
+
 #define REG_SIZE		0x4
 
 #define STEP_OFFSET(s)		(STEP0_BASE + STEP_SIZE * (s))
@@ -63,6 +66,7 @@
  *
  *   TGU_MAX_STEPS         matches the static step0..step7 sysfs tables.
  *   TGU_MAX_PRIORITY_REGS matches the static reg0..reg23 sysfs tables.
+ *   TGU_MAX_CONDITION_DECODE decode region 0x50..0x5F holds 4 u32 registers
  *
  * Each priority level's block spans a full PRIORITY_SIZE (0x60 bytes),
  * i.e. PRIORITY_SIZE / REG_SIZE = 24 registers, all of them implemented.
@@ -70,6 +74,7 @@
 
 #define TGU_MAX_STEPS                  8
 #define TGU_MAX_PRIORITY_REGS          24
+#define TGU_MAX_CONDITION_DECODE       4
 
 /* Maximum priority that TGU supports */
 #define TGU_MAX_PRIORITY               4
@@ -77,10 +82,37 @@
 #define TGU_MAX_PRIORITY_REG_SIZE \
 	(TGU_MAX_STEPS * TGU_MAX_PRIORITY * TGU_MAX_PRIORITY_REGS)
 
+#define TGU_MAX_CONDITION_DECODE_SIZE \
+	(TGU_MAX_STEPS * TGU_MAX_CONDITION_DECODE)
+
+/*
+ * Values for struct tgu_attribute.operation_index: TGU_PRIORITY0..
+ * TGU_PRIORITY3 select a priority level, TGU_CONDITION_DECODE selects the
+ * condition decode registers instead.
+ */
+enum operation_index {
+	TGU_PRIORITY0,
+	TGU_PRIORITY1,
+	TGU_PRIORITY2,
+	TGU_PRIORITY3,
+	TGU_CONDITION_DECODE,
+};
+
 /* Calculate compare step addresses */
 #define PRIORITY_REG_OFFSET(step, priority, reg) \
 	(STEP_OFFSET(step) + PRIORITY_OFFSET(priority) + REG_SIZE * (reg))
 
+#define CONDITION_DECODE_OFFSET(step, decode) \
+	(STEP_OFFSET(step) + CONDITION_DECODE_BASE + REG_SIZE * (decode))
+
+/*
+ * Neutral ('NOT') value for the condition decode registers. This is the
+ * driver's default so that, before userspace programs a real decode, an
+ * enabled step does not spuriously match. Used both when seeding the shadow
+ * table at probe and when clearing it via reset_tgu.
+ */
+#define TGU_CONDITION_DECODE_NOT 0x1000000
+
 /**
  * struct tgu_drvdata - Data structure for a TGU (Trigger Generation Unit)
  * @base: Memory-mapped base address of the TGU device
@@ -90,8 +122,11 @@
  * @enabled: Flag indicating whether the TGU device is enabled
  * @priority: Per-step, per-priority-level, per-register values staged by
  *            sysfs writes and flushed to hardware by tgu_enable()
+ * @condition_decode: Per-step, per-register decode values staged by sysfs
+ *                     writes and flushed to hardware by tgu_enable()
  * @num_prio_regs: Number of priority registers implemented per priority level
  * @num_step: Number of steps implemented
+ * @num_condition_decode: Maximum number of condition_decode
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointer, the lock serialising
@@ -103,8 +138,10 @@ struct tgu_drvdata {
 	struct mutex lock;
 	bool enabled;
 	unsigned int priority[TGU_MAX_PRIORITY_REG_SIZE];
+	unsigned int condition_decode[TGU_MAX_CONDITION_DECODE_SIZE];
 	int num_prio_regs;
 	int num_step;
+	int num_condition_decode;
 };
 
 #endif
-- 
2.34.1

