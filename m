Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900846;
	b=Djn/TX+XlSYpFzlrHpU+T7MN1VK9oQbpuZnsSpVCrRPa8cg1yslhXprQpPedX5YxkOH0
	 WnRY2bb6AnInfRWYQr9ml9p172BXB+1WOWQTbPJn16JlVqUW9Qm9NYTz9YARAF9E1+6Cg
	 03C7/PX41gtNPdcjrDABWgihIgFju0JV/CD6ekGSBH4Gu+ctP+kBVYSUbMPMPcd3IslnL
	 aCq5z7Lf/sg/wYsuto/D5XFZh+r0K9ZEHUT/RCKNBXuuPh7KTY85hiJTW5MmSTnB1/7ho
	 +kzBUVteOz8Bb4meCmd35gSWLDXG6P0cbfUayuBTc7kR04c2y/XfCbpB7g9Eob3FJnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900846;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=C1U6sGJ1wofOSp0VAiQlaKb1uloa76oQfH+mRg/e3Uo=;
	b=OhUp31lZiUYyJf5C1+boPOu459ijHb92LxD5MVYs81cOZMGP/pSsCjkmJ9TD2ghLji63
	 goSr63zWZfHSVAalfHkUH4JhEv4OtaW/+8tlBZiaCDXNP0GQ3atXO0CI4NIVI9Y5bzpC0
	 aLEB9nDx8Ra8thW/lMHrx5EhbHEIj8yDh7wGuzwSeswpvY9mFHChAnSzUZ9G3g38V5IM4
	 qMt34qtqaimRxkRNGPvlN3HJx/ESEqVUWQqLfIkkbAaPPBsZKuXAlI9k4eTH9Ep5cA4aa
	 kJbEQr2pJYRY/aC6svd3jmgXCm8UFo3akD1HTiQWNgS/VkAwAMNG4GFH61B3rjwpweQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LuPxAYH5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Q4/t54+g";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06EC606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:34:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A06EC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LuPxAYH5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q4/t54+g
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aIUS4146686
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=C1U6sGJ1wof
	OSp0VAiQlaKb1uloa76oQfH+mRg/e3Uo=; b=LuPxAYH5NJgQOpppiP1xJ6eD+Ha
	uGKcXWmiEqWBP9HMl77Z1m06AOijLxs+hlTG0FcEhaq6e//0IhtaKJ6pmTXgmKIJ
	NdCsB9XDnKQzv2hsycnW/4F5MMdl0OmVIeQiuivYIPCqRubnt729mpNx/xNgBP5e
	7R3whG3gXooQwLBJSsLnTPLtj9Yi3lB3lDcL3M4HZ1zdIniqthkT2a65ISO5qdCo
	XM6wMpEUhFSecf3WeQHnbSHzLgQ5eVvrPYwGIp94YYQAJdjUEd7mxEG4MKwPne8U
	YmNeT0k+d05DzZKQMjRShpAW6kBOxGk2v9ghw/ynIiGmHw09CJP/xsmIsEA==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j00nfmas1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:34:04 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-81b20bea169so2697359a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794900844; x=1795505644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C1U6sGJ1wofOSp0VAiQlaKb1uloa76oQfH+mRg/e3Uo=;
        b=Q4/t54+gLw2U+nsqsKz/4iG+bwF4XaSnAADYT8Gg/5crdfhMRzuJ2rg2gMDobOFEsr
         Y9gmC1u2UXrUYL/eys+cmpwM44XLXbW/+zznZrpuescq5Wczj9XuXE/UijkGASbvDg2h
         t/jmQ5IWdeJBiiSunKsrU8tJGMWo+Md99PSIV26PHJXpjjEgULNTr4oFN1AQbBwdCMpI
         YaccL+ZdwBdQZCwNP5odz1qcoeXXSGOYVGiClDsLvk5dEAw0IfkcitRFjzYQFfAo53KE
         jlSqFyeezlbkch8xBUa+DiawTq5J/oSuRCfk57EtMvkZ/yRkl1r9snb5TBGPWcV+pBwI
         tl2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794900844; x=1795505644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C1U6sGJ1wofOSp0VAiQlaKb1uloa76oQfH+mRg/e3Uo=;
        b=wB7eWroWWgb0tnZvPYq1umqLEiOk5PIgoRoiXu4WqCrHKbx6xE+aT4MNzf1i67/Rnr
         FQMYod4Ph8GbxRmV5FY7QvAD0A0K0UV5f1/52u5SAv0qhNhjUJj1+Te4osqmPe7zybN/
         7+SGynplq1OuVYL1FwmgLUjr2p8S3/ABmvbhXnyz5Dp8+Tbk4iNBjJoQkpoYq2Pho2Pw
         MRaDB1VuskxvDJYIAUGATUApN/7Hq7Np8b/pSC1CSpkkI16336UtwkTXQFKWjZYmWmjj
         wCph0nWmyks2BZIQSrDNjrnCpdo9I9AKYYGA2zQ+Snf4wf3nfTeAGdGZaGvGf5jBZC0N
         iI6A==
X-Forwarded-Encrypted: i=1; AL+hErF0AFoVjJNEhZVqLhgtXcnOjuh3597f3h1LrTEjh/nW4V/ROcY8vbH2qPpYiRPOx56i1/LA6U1wXexFrYc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XNKoi/AZKbdTmcaWU9a3m9nAHxgVY1lo0jcoSutom94bvMLjD
	oAC8S8ieqFLuSY1K+IDGwCgkB20wMsRRvn1ci+eVIVKGdJCbFxygsVLNsUQnZIWZ25IWWqRwwzG
	w+8ZHz06fMZ/O87HwZpmtEEA7OZpDbdR3WSZz6SNJkhu0bzqgG+hlPrcQmIrqWSrojcA=
X-Gm-Gg: AYBFou1EippJbthw1h5e6FOECeQrqNH8/KjzkYoXRSbEmc6AUvDJWn5ypP7La8IYGrE
	+GILFLCupNzPbug5+Pp15UTJes/UUYTIpJxs9g6oiQl2qN1URUb91yP1HQhry64l4niiwnn/Ghd
	nVOzY0kepCEcRNutjP1ZhpS8ba2PDhIYmx2RhRUhRU73AoxnTEah/i9MqN7UasdaxDsu5ZU4GMv
	eombVquUuoJlJ4qZRR/QS9Nxogies43yeWGWidMoNiiRusezsfjAsWh2Z2+Q6V2xXH3pno7eHN4
	59Ik4urvR2J3VmbFCKyhncaKB806GTLqUDpJamR8qthAKPp1ZGmBQ91Df3ijwePQ14xGaAt7WL4
	D8N2r34vo8Ni5oeLW/9DFiQKS9/ABM7DVyUusfY3aMrFIAjKxcThmGSDyoRmjEhFN9rmTDrDQGU
	jtX0aACWd7REKKMHEA7CKFGh0Y/2AmilIPig==
X-Received: by 2002:a05:6820:1ca3:b0:71a:e9eb:6b94 with SMTP id 006d021491bc7-71b014fdaeamr1468405eaf.20.1794900843965;
        Mon, 16 Nov 2026 23:34:03 -0800 (PST)
X-Received: by 2002:a05:6820:1ca3:b0:71a:e9eb:6b94 with SMTP id 006d021491bc7-71b014fdaeamr1468362eaf.20.1794900841323;
        Mon, 16 Nov 2026 23:34:01 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862c67db8basm4944508a34.13.2026.11.16.23.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:34:00 -0800 (PST)
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
Subject: [PATCH v19 8/8] qcom-tgu: Add reset node to initialize
Date: Tue, 17 Nov 2026 15:33:05 +0800
Message-Id: <20261117073305.3854951-9-songwei.chai@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=BrEIUoX5 c=1 sm=1 tr=0 ts=6afc036c cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=u6OCHy2KTxjFLSf8iyQA:9 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX7NoVxNa1xMDx
 xzmfwy7sipcoIGFxxLCMxaqHnIhH3U7I1zxpYWZgasfg1yI+31TC/068GLzRK9FC2NPYAh9T7cO
 7R4NyK+E530pUk6/UTaDditDdOp+53M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX5JQ+Qb+bSgcw
 GjOxmeTN9DfqA2A9C6jDQCD3gqXnpNnqotu7IFMmFa6mZzVJ5m9NiaaSbfixLnsidzbeb7ZjuuI
 FANdmgdtoXmUOdps0LEzkUwsRyKojzZepugGf7RXjdifzmoCa5+nE3HWs7KW56kTBNmsVJsSvCk
 Tna389YfolpNYADNLN1Qnk7VKDLDAfM8FGxRxRiF49VHz7KiAMpPKMUhsb9J4z0PSey00sSwllm
 lx+nFIYJGMBAMWpRLXU/Jb5Q5WsZqmjNvvTHmTcDhsd4wi1AnsaqXMb151SLncL4Dfm2kZnbYPF
 2RdDYGerHOEod3ha6Z3Pi/CqVy5egUJTdCtakWOoQfaxAMqaV3hi8LQjNkeS5AWkRiTBbHtGfKC
 1MH991MlrqdY9HiI8l62g/dSzI0rlFl+2ONkDcabJX3izRmWNK8yaqSblfkfLbsvLcQCy1RgvdY
 PXvU/fqHEtsc6v9Y2sg==
X-Proofpoint-ORIG-GUID: ceydhjyhjxDPa-fGEH22YvHDprscudIq
X-Proofpoint-GUID: ceydhjyhjxDPa-fGEH22YvHDprscudIq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170029

Add reset node to initialize the value of
priority/condition_decode/condition_select/timer/counter nodes.

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 ++
 drivers/hwtracing/qcom/tgu.c                  | 85 +++++++++++++++++++
 2 files changed, 92 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 71187071cbc8..b3a2fb9cba6e 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -51,3 +51,10 @@ KernelVersion:	7.5
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the counter value with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/reset_tgu
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(Write) Write 1 to reset the dataset for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 5045c0f344d0..dc8572628f57 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -241,6 +241,18 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 	int i, j, k, index = 0;
 
 	CS_UNLOCK(drvdata->base);
+
+	/*
+	 * Quiesce the detection engine before mutating any comparison input.
+	 * This function is also reached from reset_tgu_store() while the TGU is
+	 * already running (TGU_CONTROL == 1); rewriting the priority/condition/
+	 * timer/counter registers register-by-register on a live engine could
+	 * feed a transient, half-updated match into CTI/interrupt consumers.
+	 * Programming with CONTROL == 0 and only re-enabling at the end keeps the
+	 * program-then-enable ordering for every caller.
+	 */
+	writel(0, drvdata->base + TGU_CONTROL);
+
 	for (i = 0; i < drvdata->num_step; i++) {
 		for (j = 0; j < TGU_MAX_PRIORITY; j++) {
 			for (k = 0; k < drvdata->num_prio_regs; k++) {
@@ -460,8 +472,81 @@ static ssize_t tgu_enable_store(struct device *dev,
 }
 static DEVICE_ATTR(enable, 0644, tgu_enable_show, tgu_enable_store);
 
+/*
+ * Element counts for drvdata's shadow tables, shared so the reset path
+ * below can't drift from how each array is actually sized/indexed.
+ */
+#define TGU_PRIORITY_COUNT(drvdata) \
+	(TGU_MAX_PRIORITY * (drvdata)->num_step * (drvdata)->num_prio_regs)
+#define TGU_CONDITION_DECODE_COUNT(drvdata) \
+	((drvdata)->num_step * (drvdata)->num_condition_decode)
+#define TGU_CONDITION_SELECT_COUNT(drvdata) \
+	((drvdata)->num_step * (drvdata)->num_condition_select)
+#define TGU_TIMER_COUNT(drvdata) \
+	((drvdata)->num_step * (drvdata)->num_timer)
+#define TGU_COUNTER_COUNT(drvdata) \
+	((drvdata)->num_step * (drvdata)->num_counter)
+
+static ssize_t reset_tgu_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t size)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	unsigned long value;
+	int i, ret;
+
+	if (kstrtoul(buf, 0, &value) || value != 1)
+		return -EINVAL;
+
+	/*
+	 * Hold the mutex across the whole sequence so it cannot race with
+	 * enable_tgu_store()/tgu_dataset_store(): the enabled check and the
+	 * hardware access stay consistent. No PM reference is taken or dropped
+	 * here - the shadow tables are plain memory, and the hardware is only
+	 * touched when the device is already resumed via the enable reference.
+	 */
+	guard(mutex)(&drvdata->lock);
+
+	memset(drvdata->priority, 0,
+	       TGU_PRIORITY_COUNT(drvdata) * sizeof(*drvdata->priority));
+
+	/*
+	 * Every decode register is about to be overwritten with the neutral
+	 * 'NOT' value below, so there is nothing for a prior memset to zero;
+	 * calculate_array_location()'s step/reg indices for TGU_CONDITION_DECODE
+	 * densely cover the whole 0..TGU_CONDITION_DECODE_COUNT(drvdata)-1 range
+	 * with no gaps, so a flat loop over that range reaches every decode
+	 * register.
+	 */
+	for (i = 0; i < TGU_CONDITION_DECODE_COUNT(drvdata); i++)
+		drvdata->condition_decode[i] = TGU_CONDITION_DECODE_NOT;
+
+	memset(drvdata->condition_select, 0,
+	       TGU_CONDITION_SELECT_COUNT(drvdata) *
+		       sizeof(*drvdata->condition_select));
+
+	memset(drvdata->timer, 0,
+	       TGU_TIMER_COUNT(drvdata) * sizeof(*drvdata->timer));
+
+	memset(drvdata->counter, 0,
+	       TGU_COUNTER_COUNT(drvdata) * sizeof(*drvdata->counter));
+
+	/* If the TGU is running, apply the cleared configuration immediately. */
+	if (drvdata->enabled) {
+		ret = tgu_write_all_hw_regs(drvdata);
+		if (ret)
+			return ret;
+	}
+
+	dev_dbg(dev, "Qualcomm-TGU reset complete\n");
+
+	return size;
+}
+static DEVICE_ATTR_WO(reset_tgu);
+
 static struct attribute *tgu_common_attrs[] = {
 	&dev_attr_enable.attr,
+	&dev_attr_reset_tgu.attr,
 	NULL,
 };
 
-- 
2.34.1

