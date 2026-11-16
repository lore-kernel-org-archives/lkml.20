Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814933;
	b=wVc+rKphzuZLPDUvDq6yTYxJNXpoA/5qjx62o5ogaLgsJu/s0c4OBs+F3E6mgakWTQ/c
	 /Y/mG0KuJ9hku8Mg+SXvFxVPSPbK+hvn8InPlp43qhfrdriH5Mu1/s1X8UtALs7uP6qls
	 bL5PCPsXZkzTzybAoN2z3uA0yAlutclQTg3wgxJgBmwu+IkfTOblkE5mRmzHWLovUAgMW
	 BLNHJr/XQf/SC3ihNS/WnjmBC6nvPwtLSXny2nHqLnp4gbRxPEAofiKo3uvsZbSFE1QLy
	 8ep75vGDJUCq62xEfwShjiy8nTgXTKpvO8kHzNOk9et0RlllE08fdoHOD+hk0VrHi1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814933;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eWCyBzOYdStcG81vSg5ZBEf9+pK1C4x4t0+1pPY3m2w=;
	b=4/nn7WMjUcQ8OQKeiidHW33pL4ODgKEWxkE9EkD/oqMiaphwVWKzZiD3+4Wno+w00+Ow
	 KqWzi3QloxwJwLnVROyHesyxRPkpZbznn7BrDNW/kL9NP9+tjid03G3tKckXE703gp0Qp
	 Iwnt7a6JbVLaJVTI74mKX3aQC/liuj95oAytrbEx/ZxfpDQVeoGV9VhyVBlVUmaKa+wHP
	 u/RBRpaH7NDomnjsvT0OkefwwzA5Ny8iIH2rEAmtK6VY6hWdKbB8DHFYWb6DlXYRc22br
	 RYehcyJjDCg16/YtIRsDJo6eqZb7RDVoq3NC8SpuJrjegfpTcSwPuNMq3jWZjxgKQ/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OJSyCS6Z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ifjQdpGE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F746606A335
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F746606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OJSyCS6Z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ifjQdpGE
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7enfx1109768
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:42:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eWCyBzOYdSt
	cG81vSg5ZBEf9+pK1C4x4t0+1pPY3m2w=; b=OJSyCS6ZIk1LAcZ6YXwzEbiOnWV
	lWgAZwllEtsVjacTfHpBO0ER+CA0GH1Srxg1uCy/QkKsBPtiVU5dhw/CofqigE0m
	KZ4N/Y5NrAUeh5whhZiU80cWr4jJgmZZ3aNVZwAZd4mpYUCAaFbg+bGRsajV8sSG
	T20+TWL51dWMcpgC+KvRRRaCsVyB6VIczZXeYgkiLa0hQjixKKKIX+ddt4ETB2FV
	DeHkZ+4nKzkZMIlPL70Po/I3VnhBQpBu09rVNmtP3elkAyTGhJMj+v1Yawm3RPuZ
	6kW2c4IZi5kJQrqRBiprWAtHwHzdMxEFO4E0Iid0JZOgDgljqoVcIqPWS0A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyrmc139k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:42:12 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-37628596fc9so8607897eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794814931; x=1795419731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eWCyBzOYdStcG81vSg5ZBEf9+pK1C4x4t0+1pPY3m2w=;
        b=ifjQdpGEys/+Rsb61Tqv8elcm2nYOQwU0wiL6rwgNEpBeKyTQ5dA4Fe1zM9zsl38jW
         9FpDAnl0B2Nu7qP/dZRunFM6VXV0KTBaIBdnac3FL6PgzYOoqFfuNwVoXZMzMBCIgMJM
         ctLuVy3sTnY4GqvcznvaoU2Qlxux5gMaLP6HO1cnM+uheFw/6g7n+/UIbvTu7dDbK9tS
         PnO6YVxwZXPhhAKOBXZJbyjmpGVvUTG6jdwdhxjuitQplC4qzhhg4UUXY8d3cPgrTL1X
         vWtYQcOKczt118HdMH8KiOpqW47CBeTXfXvOtTxb+1I0/7ojcAZzNvKqT7ff27qaSYRS
         P9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814931; x=1795419731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eWCyBzOYdStcG81vSg5ZBEf9+pK1C4x4t0+1pPY3m2w=;
        b=SJJo+8AiAbBy3LoIDTH9Lje5d96jvgDV+xRPVbryJRe1Y1DDvFTDGNZTVH6M8xPp8v
         b8XbQA+RYdygnJ+pjTbqRCIbMzlRFSbgD2qDwsxRV+YQlETQ3PsOFWF0jeLDYusu7OCL
         gI+PR6kpZIyHLpEottD/ey62D05QJBC+PZ2G5MClq+W8dXwFPLWMKJ/ZDcXlLj5M0c5X
         s6WeVR861BpukwEKx6RPq3XfsAW578hJpFNYHHo7lZkyT1bCyWage50vto1Ox0+LBSzb
         qZ0Kxd0Xmflys76aHmouVR8OlLU9sLST2nHzvVwV1OLCzH9QCmCOnC0wjznlCkB6UGca
         vKww==
X-Forwarded-Encrypted: i=1; AL+hErEuOzVWnmGH9MP+SC1OEk0pVauAqcT91AJ1yxWz3FNyAshvDzASEbvjbl+lKm5c1CGvCiNIXUz88EBRQe0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OYAwMAMh6WaAeT+ZfHT776ujHqhrwvReDhICPoDCyysf5UlMo
	ELbjeJ29joKu/U5O0BJb+pEoML0GIr9O0uXMUUHEuoF8cUyZUJMey4WlGtSFO4VRVr/PO6mWE50
	wTYe2/x0FkohVUQbLTl6vp+C902zu2gMpDishnuMivYyDtM4X6PO7zoU/Yh0Pd8m8h1E=
X-Gm-Gg: AYBFou2xgKUJzxzl8q+3qHO7ftF750cZr4pAi9yvXfWPac4bumw+JHk7t7slXnMFPJE
	vJBFSy4OaqKtwxHO12tvfVXvZDTfN95mNo2EMiR8VT5Ru08c6MNL08NWxlldNLdWO/aiFYJ56Kg
	8niIHurceFulmOUOhVdXGQP1jrbwDm3dtxcf9BEZuC9BW69POokegIVa2cwmnVBbJALSlYQpWWX
	vatWf/DrLNyjkZJh+r/KbtPk82maVFyvtRt3FiIhYY73BpHpWEagbMZDH4u9Wab/70i5Wvq+gXh
	1qGMerEYnF0BfW6W8TH3ZUxwQSfEGjlwp1CgiRY4+FOCh3aCz+naZw7tptKgQ9Zq5BBgbQV7Tnh
	jSE03YBq8FSLJIYDew7/jfFnmgT9v2g5V5kyYTity2tNxTFCS9GLZoz25zvts5264JwDWjWEF8B
	v243aL55eQ/Cy1I1iwvdk3Nop1DsYBRSNsVg==
X-Received: by 2002:a05:693c:805c:b0:376:9323:22b8 with SMTP id 5a478bee46e88-37965da96e5mr11689155eec.10.1794814931388;
        Sun, 15 Nov 2026 23:42:11 -0800 (PST)
X-Received: by 2002:a05:693c:805c:b0:376:9323:22b8 with SMTP id 5a478bee46e88-37965da96e5mr11689124eec.10.1794814930711;
        Sun, 15 Nov 2026 23:42:10 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm52137536eec.25.2026.11.15.23.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:42:10 -0800 (PST)
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
Subject: [PATCH v18 8/8] qcom-tgu: Add reset node to initialize
Date: Mon, 16 Nov 2026 15:41:18 +0800
Message-Id: <20261116074118.822731-9-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116074118.822731-1-songwei.chai@oss.qualcomm.com>
References: <20261116074118.822731-1-songwei.chai@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzMCBTYWx0ZWRfXxwWCxWgXe0m3
 RPr8kPdI2KPxNJBlGfB3IeRyoRzv+Po95fskyj12pEqpC+1BwEtgG/zVruMdCjzOGNr4kfKKHPy
 j7DHxjiaGDhO8iSuzIorxYUjZuMsak8=
X-Authority-Analysis: v=2.4 cv=C9N8WgP+ c=1 sm=1 tr=0 ts=6afab3d4 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=u6OCHy2KTxjFLSf8iyQA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: 4NvV_a_7-m1A3xHAdeWOSHrc_52rxtY6
X-Proofpoint-GUID: 4NvV_a_7-m1A3xHAdeWOSHrc_52rxtY6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzMCBTYWx0ZWRfX1DSDFgWqMofD
 5uNFwGY6Azqn5oXWgbbId5sQPt6ApqLEWsD4AJRT1JwEWPc9qVL4MzaaAf27njH8d8B79k4BlTz
 2I7w1QCR4HkHf50I4JbsPg7q8yyosA3Gyhxfj7IM6fuz0lpvFPtsU7M0Z5LySwnuel05e/HXD9x
 j5l9nH4laLMh8TwJP2RxmmXlkg/kpVnONXuaNPl6ZLGdBOleB37ARSLcSmwJSGWkG2iv6S16nTW
 6Mq/bBMoHTjCiMwK30mjqpfF7yLT3iIuUvdQx9U6fWu2zst19+qi/VFrXc3ym9nk9avIEi9hbiA
 fu2Bu8+50IY4TjSMek9c/lPg1rLsV63O4hBF6wKkr3KqpDR+U1+wShWnmbE+sSg2CFZIRuSIIly
 8QctYmRCzN3soKPGB9Ku9I4735tiJAvlEKGTONe0LtpO1w+nW+dL6kWAbkfFn+OhI0ZjJU5gxHY
 Ch7vrspN+G0ce5Syc6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160030

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
index aa7eaed0e738..6f76d4f83cc3 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -251,6 +251,18 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
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
 		for (j = 0; j < MAX_PRIORITY; j++) {
 			for (k = 0; k < drvdata->num_reg; k++) {
@@ -470,8 +482,81 @@ static ssize_t tgu_enable_store(struct device *dev,
 }
 static DEVICE_ATTR(enable, 0644, tgu_enable_show, tgu_enable_store);
 
+/*
+ * Element counts for drvdata's shadow tables, shared so the reset path
+ * below can't drift from how each array is actually sized/indexed.
+ */
+#define TGU_PRIORITY_COUNT(drvdata) \
+	(MAX_PRIORITY * (drvdata)->num_step * (drvdata)->num_reg)
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

