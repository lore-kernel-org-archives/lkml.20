Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793279399;
	b=q7H08GL+as15u0x4PZfxz75TJuw6q/pDdHo5SB7hHuQEv4I7/Kvyw6MgQhzdjcp3sZhY
	 oLpEzf+XqbXc3FInbkibQygMRqpiBVe1KPNZE7sLrt/4q9Dl/DZcvR1KIE/iRyfWLbi07
	 qzXbsxJURUUcj09OQCsY6cOxDfh+mSlCBuxr9Z28bYaO4Dz8V90Yzc0bc2c0Pt6a3Vjn8
	 lpCG4qZengbMXvtOYwaLakiJMH/oPZTQwy6iXXv6k/oOqNsAci1s3dygmJI3f8wVPFBnl
	 InqCYAZZw7RJv58patjNLmPv3cCj968e4WqcAhlLfLaw8hCA9HxAp0ZBpXohMABD/cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793279399;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=O6c9DuoS8Ra0+zn4jvQnbBHB97ZOcmYxblC6VkPGOHg=;
	b=txO7/QNPUHqHRFmmJiKG5WXzeSSBs/MunPvx8+/BFsTGBe6IRsSm08HmNwGV28tp5jY4
	 cAswTSnOX8gM8zybwgHLJbu51avmZofh5Fef4h8FPlBvwYpe9zmw5F/to6jx+1P50+Zd1
	 cYUiQzmxqqXqLUwqw/Krn5u/T4TL6rGnJ8kqOWQDLcMzsVdr1fH9+PXRLyqVaBGtzU1SJ
	 AbF1Akq+rYPSaFo4uz3+iHzUvSYBCCtNnPlxSOjyWD0PK2ClRLQb5yt+PMRzUIHwHCKcM
	 3C5RLiQ2/aI8zIGcKn3yagV2LgOsB6t1aSn6a+vkR66rtlew84Oq13fD8Th/s/jk36g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mThmeQuE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QnXpIz06;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A352F606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:09:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A352F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mThmeQuE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QnXpIz06
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCdxXV067947
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=O6c9DuoS8Ra
	0+zn4jvQnbBHB97ZOcmYxblC6VkPGOHg=; b=mThmeQuESdIY6WrYvkD7n2eL2Uz
	jQRhysl6BxROI9l/f8QPSOSD2v5Q0SuNSWJrTtuzp5/euixCrL/qDOd7eH6/y/7j
	IOhINyN3Wbr8aZpykNgZYER7Frx7iYyi5oa/OWPlYnGmE/7GzQLVOCuBlmKSEvPg
	vpTiNjhu5oNmMyIngsgpnrzviVLCRlCm4Tgp4RknKpPYOvajmSCRjm15CEuibAzp
	ywHPETbmJ8bEfcx9Vs6xbr502JRBC30IVNu/X4OIeGg7bBOhnXY5k3hUjmFB1g+l
	4AAv7oSwBMZ5U3vBQ8rI/PWOFYXE1sW547wDTo9ZWsMLJVDQTWHQVBSL7/w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkxshsved-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:09:57 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cca35cf9f77so1317235a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793279397; x=1793884197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O6c9DuoS8Ra0+zn4jvQnbBHB97ZOcmYxblC6VkPGOHg=;
        b=QnXpIz060BSpkrB26VqHBZ3ciaewd3Ch9DUHiMewgRxKELZ/I4xihqJnUGm8pxK42B
         UWmr3tNHu5YdDIgqVNx8YA+MM1GeDz2RhP3HMnFljA1erjpv8CiNaLC/rquYHa9baQpl
         mncGw1BLtJkNAco4L2uuQNolSgYVltNCHU3UxTl8LSSFWRaxjJL7H+I4VXn4Dkb/LcQJ
         240Cg1kwjDSgs6vJfCOgSglV9LMGDERe88WxewWXq67wR88XC1bxU7ji/lx7kaIoWZWz
         J655ZBm58r9zEm1eSkQcRUVnwPY8XDGX/SiiZfBTPA2iQs1+83wOl98axcLfKf4jQI0K
         1pjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793279397; x=1793884197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O6c9DuoS8Ra0+zn4jvQnbBHB97ZOcmYxblC6VkPGOHg=;
        b=TxFfjA7xlPMZni0yjbh08BzC2NXWRgmqIpCo1yL7jAzcf8LFQk80OmCsVMiOEsODMS
         OWfxTeOLi15WmcIDQthW9R47TEeH/ePCpqXLLiPuGKjQsXV/ZUMHDehahVLIvMoKRlEy
         YUgAuvynKOVWNSpNnONcW6jJXgFcsG/7vUnO21z7DZJoqNi2QG3PtcP25YvRA+3ATZMg
         cxw4tJwHv/jv8lulQsdpnfLEbLVMidScfbpR6S5mvSOanAEM6lMXdAyDkqzOFLN/vt97
         r84/YkzM4UTZ96uYTG3WOrwOebecxZRXBmUJY2i7b23SAXWut8i6/7h10qoBj5NDhsh2
         pssg==
X-Forwarded-Encrypted: i=1; AKwUvBxEEk0533lezFiuniHe2v8jI1CjH4hOMr3ReC1+Z1ntx8M6mnEtTp/x3S7uni6ptbDPfCegozjU2RF/vzY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRgEDeqPzHVgTeuWVmhgedYNhVx8JA8p3zGYjOcyQNkvLdPFAc
	QC0fYiZF8/BXL8DC6hVpxdhMvr9pER6B9OfmvWgLJ+SRhODEOwBnpD/pySFws/FGeGByyqj5sBy
	F8xPOXdGYmGUoDgHTazg6X6zN5RDlBZQtsN9OFFtWWUipk0vmak1CyXPM2wVDhgcE/BQ=
X-Gm-Gg: AYBFou3pBb43OabasN09mA6lUuGV6szZ66TuMNOeJCdAwfF5VdDFA3s43VKYs6FcopD
	GXxd/rTlt442he86oZU8DECMtd757YYiFivPJBoUqN+cJUPgDQb0h6o3F+4pYhgD8IoGNpIWyhr
	NUg4yRqyExRZ5H1xUA2Y6Y6yzZLnJmAgmcyTPVMxItiY+A9H2sJV2oghCYO+fNBu7aXJ2HGfe/j
	MtlYRQP4NH+Deffh1aA46pIUIbcNec+mB70UHrRgRyORWJqshEkWOypJe+gUGwQorX9kpQs247D
	/R1vRiFlmIVTm8E0LPMvCZvxclaWnqJh8XkS4i7Y5xFCu+q5YvZcClep3WCuqfi4po2ewsifYBD
	Re/l1m+MVbkRsMUb5PsM2ouu8HXMaoAz/gubFdrNdNaoy3v3VjWnzheDT9oPymlFqzZbvK3K1iQ
	WNQdrOM+/QAwFQoR4zvrzsrgEMqV4v0prDxpE2CDvlA5rUXjVMgVfneihIYTC+M86Rs9BorpS8X
	A==
X-Received: by 2002:a17:90b:1a86:b0:3ac:80dc:f419 with SMTP id 98e67ed59e1d1-3ae5809fc90mr4441866a91.25.1793279396410;
        Thu, 29 Oct 2026 06:09:56 -0700 (PDT)
X-Received: by 2002:a17:90b:1a86:b0:3ac:80dc:f419 with SMTP id 98e67ed59e1d1-3ae5809fc90mr4441841a91.25.1793279395747;
        Thu, 29 Oct 2026 06:09:55 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3ae6e973ac6sm4598145a91.11.2026.10.29.06.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:09:54 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>, Anup Patel <anup@brainfault.org>,
        Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: [RFC PATCH v2 4/4] perf/riscv: Use Sspesa for precise sample attribution
Date: Thu, 29 Oct 2026 18:39:13 +0530
Message-ID: <20261029130917.3714691-5-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029130917.3714691-1-mayuresh.chitale@oss.qualcomm.com>
References: <20261029130917.3714691-1-mayuresh.chitale@oss.qualcomm.com>
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
X-Proofpoint-GUID: SwjqO1O9VflFW76PYSB46r2I-JhRjU6l
X-Authority-Analysis: v=2.4 cv=H6BOUOYi c=1 sm=1 tr=0 ts=6ae345a5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=MPwlUwCX0KYMQ8BLyxAA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1MSBTYWx0ZWRfXzRJIzD6p/z7Y
 7xOZJANqBfWw6h51DCalTbuFv5yyB0R/mjR4ogWSo6yxCVk2ypzhDvpUAmSc4gSQwlJNDu33KjH
 c+KzGgjxaF2jjP44MggKqu7gcDt0vgo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1MSBTYWx0ZWRfX6noiVpxdwd4p
 ZrxJd4NJBqCfi41x4r+8QnTvKtwhx+XbRpjAI7tWh/NK3Z/T4MBUOumPHRbHu9oW2m/ge6tGiYc
 y7XftOIhv3t5qvNRtQ6aySzE505i9O1IlBgwY/W5tMhbxB1gEi0KZTgJjv7dqYGmstg3q/2PhbA
 ne/PrXPH826qA4GStYPidTaGCvxYw5aGDBp7V1iV6m3ItKAlhLyqQo4suxd2OhzWrINpqNSrAg7
 IpOiFJVSg9Ft6zAP7VUQ5gcb8rkCRKgSK7geskfLrxOuIQuWHLOYy2PcMFVMIBXLnKm/4203Mvz
 hG2pk6EaiCTbeuvukc4OahFrRBdv1Wr0O3YCm769pwa579P/lQ1FVX3NKAg8PxCfg5VmxnA6S2E
 GWEs7VoECiWxzr294KY3o2y+UpSg2Nnd77o0U+coyyi7JepFIGBz1WjuKkJJ/OZsrJmbEddVYys
 UttsQIT3y769sLeRrXA==
X-Proofpoint-ORIG-GUID: SwjqO1O9VflFW76PYSB46r2I-JhRjU6l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290051

When the Sspesa (Precise Event Sample Attribution) extension is
available and a counter overflows, the hardware records a sample PC in
shpmspc register and the counter ID and additional implementation-defined
data in shpmsdata register.

In the SBI PMU overflow handler, build the perf_regs for the perf
backend. The regs->epc should be derived from the shpmspc and shpmsdata
values. Along with the regs->epc, PERF_SR_PRECISE is also set if
ssplcofi is present and the event supports pesa. If sspesa is not
available or for counters that don't match shpmsdata.CNTRID, fallback
to epc for PERF_SAMPLE_IP.

Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 2991dd92def2..c42122f0e676 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -10,6 +10,7 @@
 
 #define pr_fmt(fmt) "riscv-pmu-sbi: " fmt
 
+#include <linux/bitfield.h>
 #include <linux/perf/riscv_pmu.h>
 #include <linux/platform_device.h>
 #include <linux/irq.h>
@@ -60,9 +61,16 @@ asm volatile(ALTERNATIVE(						\
 
 PMU_FORMAT_ATTR(event, "config:0-55");
 PMU_FORMAT_ATTR(firmware, "config:62-63");
+PMU_FORMAT_ATTR(pesa, "config:56");
+
+#define RISCV_PMU_PESA_EVENT	BIT_ULL(56)
 
 static bool sbi_v2_available;
 static bool sbi_v3_available;
+static bool sspesa_available;
+static bool ssplcofi_available;
+static bool (*pmu_sbi_sspesa_derive_pc)(unsigned long *pc, unsigned long sdata);
+
 static DEFINE_STATIC_KEY_FALSE(sbi_pmu_snapshot_available);
 #define sbi_pmu_snapshot_available() \
 	static_branch_unlikely(&sbi_pmu_snapshot_available)
@@ -70,6 +78,7 @@ static DEFINE_STATIC_KEY_FALSE(sbi_pmu_snapshot_available);
 static struct attribute *riscv_arch_formats_attr[] = {
 	&format_attr_event.attr,
 	&format_attr_firmware.attr,
+	&format_attr_pesa.attr,
 	NULL,
 };
 
@@ -667,6 +676,29 @@ static bool pmu_sbi_is_fw_event(struct perf_event *event)
 		return false;
 }
 
+/*
+ * Check if this event can claim precise attribution on this platform. Only hardware raw
+ * events can claim precise attribution support.
+ */
+static bool pmu_sbi_is_pesa_event(struct perf_event *event)
+{
+	u64 config = event->attr.config;
+
+	if (!sspesa_available || event->attr.type != PERF_TYPE_RAW || config >> 62)
+		return false;
+
+	return config & RISCV_PMU_PESA_EVENT;
+}
+
+/* Check if this event can fulfill the precise_ip level requested by the user */
+static int pmu_sbi_precise_max(struct perf_event *event)
+{
+	if (!pmu_sbi_is_pesa_event(event) || !pmu_sbi_sspesa_derive_pc)
+		return 0;
+
+	return ssplcofi_available ? 3 : 2;
+}
+
 static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 {
 	u32 type = event->attr.type;
@@ -678,6 +710,12 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 	 */
 	flush_work(&check_std_events_work);
 
+	if (event->attr.precise_ip > pmu_sbi_precise_max(event))
+		return -EOPNOTSUPP;
+
+	if (type == PERF_TYPE_RAW && !(config >> 62))
+		config &= ~RISCV_PMU_PESA_EVENT;
+
 	return riscv_pmu_get_event_info(type, config, econfig);
 }
 
@@ -1073,6 +1111,77 @@ static void pmu_sbi_start_overflow_mask(struct riscv_pmu *pmu,
 		pmu_sbi_start_ovf_ctrs_sbi(cpu_hw_evt, ctr_ovf_mask);
 }
 
+/*
+ * Build regs for the perf backend as follows:
+ * 'U' mode samples - task_pt_regs
+ * 'S' mode samples - irq regs
+ * 'V' bit set - fallback to irq regs for now
+ */
+
+static bool pmu_sbi_sspesa_regs(struct pt_regs *perf_regs, struct pt_regs *regs,
+				unsigned long pc, unsigned long sdata)
+{
+	int mode = FIELD_GET(SHPMSDATA_MODE, sdata);
+
+	/* Virtualization not supported yet */
+	if (sdata & SHPMSDATA_V)
+		return false;
+
+	switch (mode) {
+	case SHPMSDATA_MODE_U:
+		/*
+		 * Hardware indicates 'U' mode but current task is not a userspace task,
+		 * so perf_regs should be left untouched.
+		 */
+		if (!is_user_task(current))
+			return false;
+		*perf_regs = *task_pt_regs(current);
+		break;
+	case SHPMSDATA_MODE_S:
+		*perf_regs = *regs;
+		perf_regs->status |= SR_PP;
+		if (user_mode(regs)) {
+			/*
+			 * shpmspc was recorded in 'S' mode but interrupt was delivered in 'U'
+			 * mode due to which perf_regs can't retain 'U' mode stack frame.
+			 */
+			perf_regs->s0 = 0;
+			perf_regs->sp = 0;
+		}
+		break;
+	default:
+		return false;
+	}
+
+	/* Update the epc to the more precise PC derived from shpmspc */
+	perf_regs->epc = pc;
+	return true;
+}
+
+/* QEMU hardwires shpmsdata[63:8] to 0 by default and so shpmspc needs no adjustment. */
+static bool pmu_sbi_sspesa_pc(unsigned long *pc, unsigned long sdata)
+{
+	return !(sdata >> SHPMSDATA_METADATA_SHIFT);
+}
+
+/*
+ * Following is a tentative guideline in the spec that if shpmsdata is not hardwired to 0 and no
+ * custom algorithm is reported then software shouldn't report support for precise attribution.
+ * The pmu_sbi_sspesa_derive_pc is responsible for implementing the custom algorithm and must be
+ * set per vendor and implementation during probe. If it isn't set then precise attribution is
+ * not supported for that vendor and implementation.
+ */
+static void pmu_sbi_sspesa_setup(void)
+{
+	switch (riscv_cached_mvendorid(0)) {
+	case 0:
+		pmu_sbi_sspesa_derive_pc = pmu_sbi_sspesa_pc;
+		break;
+	default:
+		break;
+	}
+}
+
 static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 {
 	struct perf_sample_data data;
@@ -1087,6 +1196,11 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 	struct cpu_hw_events *cpu_hw_evt = dev;
 	u64 start_clock = sched_clock();
 	struct riscv_pmu_snapshot_data *sdata;
+	unsigned long sample_pc = 0;
+	unsigned long sample_data = 0;
+	int sample_cntrid, cur_cntrid;
+	bool sample_pc_valid = false;
+	struct pt_regs perf_regs, *sample_regs;
 
 	if (WARN_ON_ONCE(!cpu_hw_evt))
 		return IRQ_NONE;
@@ -1115,6 +1229,21 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 	else
 		ALT_SBI_PMU_OVERFLOW(overflow);
 
+	/*
+	 * Sspesa records the PC and metadata of the overflowing counter in
+	 * hardware. The PC is precise only for events that support precise
+	 * attribution; otherwise it is best-effort.
+	 */
+	if (overflow && sspesa_available) {
+		sample_pc = csr_read(CSR_SHPMSPC);
+		sample_data = csr_read(CSR_SHPMSDATA);
+		csr_write(CSR_SHPMSDATA, 0);
+		sample_cntrid = sample_data & SHPMSDATA_CNTRID;
+		if (pmu_sbi_sspesa_derive_pc)
+			sample_pc_valid = pmu_sbi_sspesa_derive_pc(&sample_pc,
+								sample_data);
+	}
+
 	/*
 	 * Overflow interrupt pending bit should only be cleared after stopping
 	 * all the counters to avoid any race condition.
@@ -1161,6 +1290,16 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 		riscv_pmu_event_update(event);
 		hw_evt->state |= PERF_HES_UPTODATE;
 		perf_sample_data_init(&data, 0, hw_evt->last_period);
+		sample_regs = regs;
+		cur_cntrid = pmu_sbi_csr_index(event);
+		/* Update the regs if the current event caused the overflow */
+		if (sample_pc_valid && cur_cntrid == sample_cntrid) {
+			if (pmu_sbi_sspesa_regs(&perf_regs, regs, sample_pc, sample_data)) {
+				sample_regs = &perf_regs;
+				if (ssplcofi_available && pmu_sbi_is_pesa_event(event))
+					sample_regs->status |= PERF_SR_PRECISE;
+			}
+		}
 		if (riscv_pmu_event_set_period(event)) {
 			/*
 			 * Unlike other ISAs, RISC-V don't have to disable interrupts
@@ -1170,7 +1309,7 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 			 * TODO: We will need to stop the guest counters once
 			 * virtualization support is added.
 			 */
-			perf_event_overflow(event, &data, regs);
+			perf_event_overflow(event, &data, sample_regs);
 		}
 		/* Reset the state as we are going to start the counter after the loop */
 		hw_evt->state = 0;
@@ -1500,6 +1639,15 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
 	}
 	irq_requested = (ret == 0);
 
+	if (riscv_isa_extension_available(NULL, SSPESA) &&
+	    riscv_isa_extension_available(NULL, SMCDELEG)) {
+		sspesa_available = true;
+		pmu_sbi_sspesa_setup();
+	}
+
+	if (riscv_isa_extension_available(NULL, SSPLCOFI))
+		ssplcofi_available = true;
+
 	pmu->pmu.attr_groups = riscv_pmu_attr_groups;
 	pmu->pmu.parent = &pdev->dev;
 	bitmap_copy(pmu->cmask, cmask, RISCV_MAX_COUNTERS);
