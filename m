Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794538334;
	b=eCpu9G6Y9BIg2oEeaZuS6VMgwHQVhUoq/rQLvA8YzguOvuWgmSZ7WqvhodNVPlc0yrPf
	 XHowgUm2zpx1NwYYp+PCXGzQ6G8iHRfSqWuDhXmGN3w8CN426c1e4ndEl4nHFbO8VYFm2
	 TAuwJgGvQHkP3kCMDubZ3qiuSAbhA4Cr0jMgBJrrXIl1p5cdSaQrlxWLg/QTAkCcMUWe1
	 PKLeOZzZd38xJTtDNXoTty0+fZGIqMHgP8xiRv+WG8Oqv4fGv0g84jzTaoTKcQ0gZHPtd
	 nP8f9w2/bHPENXjYk5wNDLpFv6Kg0aHrDWaKWxchybMyI9j7sOm9ETWRwcs9ORjDS6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538334;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MU2+tmmCPa26DXQExpMSKDNbgJ1/fyIMIRynINL7wAE=;
	b=JlN7fLQ6iuxFl1Na1uG0tk5jwKj52w5d4NzfG+KvGNIU/s2j1dh8legg8mcuYW0sFtFa
	 pY4yLpbmaOD+l7bgS3gWjJk8fEgX4OOvnIvsncUdStFO0q8fInt2uCkS9ZJhv7l/pcJAs
	 UM3WVUIAyrl0dbD9/mNZRTWcb1xcOpqjsgWH5lQtKaZA7AKvzE+0P4PUSpwKeGAnz9+PB
	 rfkoxjeJshRRa/px7+kPJoYW0E8oE4srR5hqQ7A0Lk9acu+vjrMSpf+DWkFyPFkKxoRc/
	 NZ4wrC/S9r+1gcEdrL8uhdipxOYTrXGUBBFPzgoB5UR/0cK7wNkGO1VzxNyZJpNJvJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X3CLyaDf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FUOoJ3F4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F325606A883
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F325606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X3CLyaDf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FUOoJ3F4
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2KCHN2636848
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:52:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MU2+tmmCPa2
	6DXQExpMSKDNbgJ1/fyIMIRynINL7wAE=; b=X3CLyaDfMtzkIwaFplQPGeVstFM
	Q5gGWmDtDwy4Cnz6EMbicmdiQepEeWHMsWJysf7SHQYnBKRvWOpeWtzEDFteIZYz
	0ZKV6ydaJs0ZIUkWVIDzifSy0WqpDhzEAulPCl5lrwPuaed22dnjzXoIcY7djyuf
	nzoSqCtTICnf6yTPeACHG5r/mLVl1xzeqR1yptt6ZiQ55CQrJE9dAlGvoahS8IV+
	/6P7M3qmO85Q3a8a6+CLW4u0QFx9NYoeFS1IpuMnR8iEnXo1B3Yrs6lZ6RlldRRy
	V106EwLq3ZYOFF+iKB/14+Uei7wFn6y4268s5vRLFt5NfX2grqbQ/ewrlRA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6re4as8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:52:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e987ec84afso4031725ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794538333; x=1795143133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MU2+tmmCPa26DXQExpMSKDNbgJ1/fyIMIRynINL7wAE=;
        b=FUOoJ3F4IWTHhsYo586UB3V715kZIrzVBOfEs8h1PXVGAtOKN4U/Hhd6QI/Sio7sS7
         XSacMMkbqSAVGqTl81Yts2uDvMps7ghl/ah4kIWc7nbiLM/fRDG3/HLvq5Rd6DWSvWRG
         +ZpyV0RQwoZ4KuDD/gYiPt4iuOfXXxjnp72r1GAdhUCmFPIfY7n9G/sQts9eaTJoi7o8
         nRL4NUvty4hb4NnPqlCOd9eiE8qCuJ1CejL+jdMwnUAouCPYSEWkgzpTznrx4BtDfPwE
         0ahwBNxnjN6urYiGrQk5mHViS/XJTHwfYqwXB0KzSZivfzXCZAOYZVo0HD+LxbPVSII8
         Gk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538333; x=1795143133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MU2+tmmCPa26DXQExpMSKDNbgJ1/fyIMIRynINL7wAE=;
        b=PVtkgFfhUF8UxDfkytxtpOZeubsmcHZ3UFNu7TOA4v4q6c1L/axgbnVY05gyzSoplp
         g0sB76ajyO+rCo49tlk5s2PG7p1xqndS78LL84Fa/2R2NPVw1HHTqt5F8tKW0Q/d7yEQ
         PDOOHWRH4LdkK+Ey4daDrzgDkpsMwCEIujdSvGYFBxdjtfK3sBwOvoVAVZ3eF6CrNHCl
         /3wimGyXhE6/C0aLhZKc4WRWzEnGpNx4sRZKu/BQ7fpmU3uKlp7BvEZAR8Rkvou5R4+q
         NKPtPr5ytJStAfwnnnm8Nk43OrxEJRcL6AOdrldFyjhLvDJPdv/pdddBOvX8lThp9PmB
         z4gw==
X-Forwarded-Encrypted: i=1; AL+hErHSlqWA6MJV2WZAgZYlKcNsZRmyvOmjbwfmasIxE6y0WDYok/ATMVVa8Tn7leBapEGZyBKeONkmw386s6k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9i48TtzMrEtagzIhJos4fPW2wmRqZ8Exv1KGvhEEueYEs5e1qv
	0w76lYwbDunadSYNS+zzG+/kUUMYQKBcNOILJD/TygDTvQDEO1kNmMxUrPKSqa+R5umQC3EujVT
	6nPgh6trGtGdA0uZWH9ET0NE53VjZ9Wnsu0rAaUf9nzyY4YT53haEkj+FDnrJ2h1t3e8=
X-Gm-Gg: AYBFou0c1uTIApyELEIPqhZWoksIeiesPgyr02qH4TxdFO7mwGHo2FRAtri2kvZNCGQ
	FylclyToDSp4OlyXEyg5LlNvGmG0fQRsoHnRgBgnmZlKsFyl+6EhmV6S2S7l5rTVMJQpcjRhCCY
	mnbdXwSMXqtmkEj4VaRN8f8h7cdZGD+TQAeOH02k+IZJ8K50G+5LxI485/LB52x1lGzhBt9m3ju
	1jyQFfTxXGAQCSJhKnxe842AupHg3rJHhSHgYcEoA8oTa2YuJlNTxTiom6tcxNjZZe62CrArmJ8
	4F4sKqnvrMDQuIMHKf5QRTvKKTNaKqFrMyREO07Xbns22ldA5zDWMlBLCcP82uxRsE+QcPpekN3
	aXDuRTXHWL9BQ0T2cwNEBfxEWhXnrV11JUgY+mwl6NRMQ4F9CX9MJqikEPchl4U2yYykXDvhGqz
	s2MEvKW7o=
X-Received: by 2002:a17:902:c94e:b0:2dd:ad74:ac32 with SMTP id d9443c01a7336-2ee0dad0617mr11244305ad.27.1794538333042;
        Thu, 12 Nov 2026 18:52:13 -0800 (PST)
X-Received: by 2002:a17:902:c94e:b0:2dd:ad74:ac32 with SMTP id d9443c01a7336-2ee0dad0617mr11244075ad.27.1794538332498;
        Thu, 12 Nov 2026 18:52:12 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0fa0b3c6sm3044435ad.68.2026.11.12.18.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:52:12 -0800 (PST)
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
Subject: [PATCH v17 10/10] qcom-tgu: Add reset node to initialize
Date: Fri, 13 Nov 2026 10:49:35 +0800
Message-Id: <20261113024935.3173715-11-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: WMaTnbq-9VabKFxvWk6lUAr2nct-K-kh
X-Proofpoint-GUID: WMaTnbq-9VabKFxvWk6lUAr2nct-K-kh
X-Authority-Analysis: v=2.4 cv=NJhAaE6g c=1 sm=1 tr=0 ts=6af67b5d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=u6OCHy2KTxjFLSf8iyQA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX5KZ2ZSPw4Fdr
 XBtGk6INtCtMEbWS1A390VFujYiYBjC26X7vinX5ijKi74AUUbJp/ZQNjACLiiiby15QpiKbBn3
 SkGNRPmlcD+ufYa8cRgI0yfMuUi9HH8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfXyH7Zscg+TpRJ
 PcSiOFQ15Pm7xzLsodoUL9gSXKLJsc+XOKOkBTjXkFf5Y/uNSLGwN6f219XGN5VlnCnOGOlIjYr
 2lPPHt6iJri/AWhKAvKOcd1rWoVFUTdLwCbWumSR2Ez0aVQhe56Ot4PQbgf66lABd8TN0TIDyZ+
 BuBmiJ3zfR56HR4SO35oh0ZfhS3C9UnqDsGXDb7anKLJ7I0fE/W+9gJqWc5GtclvzdRqzdKTFcO
 rAWo4DdVCESwok8ibNsI3/eFM47voVMi6PzWcZQ1YNnhlf9Eyg+iyNHz9xmHnXGwHTdzc8HTVOA
 CUj2mi7FoO2jip1Y51PDRjNyY17pleevLrmhKIjpBWkdo9xnjXdi+54foH0T0vB9LUE7J9/SbdD
 0b5LRnS1gCs3LBRS2WJNdkU8WhsZejKd2X8AseSmAOVL9TsErjHBgdFxA+S3DXLlxet1dL4N4oH
 TUhO3810aqkUQEHF46w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130010

Add reset node to initialize the value of
priority/condition_decode/condition_select/timer/counter nodes.

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 ++
 drivers/hwtracing/qcom/tgu.c                  | 85 +++++++++++++++++++
 2 files changed, 92 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index e0ea5419188e..c0f10678e4df 100644
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
index 1cb131a3c521..2386c71ab8d1 100644
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
@@ -470,8 +482,81 @@ static ssize_t enable_tgu_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(enable_tgu);
 
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
 	&dev_attr_enable_tgu.attr,
+	&dev_attr_reset_tgu.attr,
 	NULL,
 };
 
-- 
2.34.1

