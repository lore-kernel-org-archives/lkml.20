Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD77483817
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363772; cv=none; b=iIsAQuSk/5BFBcYvuLYXQeLkBqd1nq5dKNiGmSbjQ1+wqUYAUxsjRomSi1lU3hQ9NWukd7wMZjc/4vG5lDPBnSl6mOTbG+wVwx6wTO0PV2w8j3fN3GKO4D2r6s4ghVKbCWJdleFCZ4wftO4iAGp6a8MnPHMr4AW4sBRs9Rk9hQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363772; c=relaxed/simple;
	bh=h9cIQpDQR8sTSXsjgaFZKV5k/jQzbKW0bv418SSMqs8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sckk38P9kPdLJrPRgSBL173aUvGDxKn/2M8hucMk8VHn1JgGwM5e1lr276yyw/MV16YLNt2pj/gQtf703K54zxI8noL36SVtdjaHG+mIqvwpq6t3+c3Gu+fgq2DgH58SetygYCZpBqLj11JuQsFdyUhgk8G9iuXlYKL5rmCkPgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aP7EWRkr reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aP7EWRkr"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jrpx2312929
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 09:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IAfjCgeCXAk
	mlGqd7rTMwbdlm62OIWjNlAWHC1Rsbgw=; b=aP7EWRkreg/oiYgwPHx1Lwq8f5B
	2qDDzCOXk+fRUgiMwY9RijPkLwdaq2eEs6xmtU5TOw+xCP16BbQNvYZEDlkwwVnR
	xftI5hh3i3nWUhcELyTsBIppuXktE90ecpl2nDYuO00ReQkSaV8aZyxKvPUeqB6Z
	jXaXBxH57r80ZKalZ5xttxV0cyZlMRFo3+tj9n5id37jiWxclKi32icCsT8FUuFM
	o1SWuMTtksiDJW6bzmJds8+JAunRLqGq3AZG+bVl+6rA3RPXl2A4Ykx9zb5OLkoJ
	djq6AeKBkBR/Dr9BFPXYJP8Eo/GMdylTUmlO1XgfIYUI8cuBaesN244apHg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h53askne3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:01:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc5f70c8dso422972985a.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363711; x=1791968511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IAfjCgeCXAkmlGqd7rTMwbdlm62OIWjNlAWHC1Rsbgw=;
        b=0mTC/1BAxqxjGLb0MMeCssaOuApezlThlsijP+M2ae6n4nlSwgnyMUNNp3xnbmmWUY
         eEJIsdZsWBnwpN6J75hA8mNPN4TS5hwflZV3gY3wR9XpdXgaQfJSfiTGT/CnMuVYZYmQ
         XaznALPOSb5VL9Xq7xASUvYfpj2Qg1sbZXANjtJvWNd4DG77nXdvOEcjISQiotV3PNHL
         Ylqqiy7YHhPUCKAwszF9URJ49wAdR1DVsckWjpLiYJije9yAiOf4RxzAvExlotJaPTLV
         6OhQ6vDudjh8bJ3vyQam6/95Jh93cBW0wWaAXKhmmwGnFMpD2aeuVZQgS74GZYbjCy74
         LQfg==
X-Forwarded-Encrypted: i=1; AKwUvBy2N07YDXVMT6q1VhvK0aoP3MM2Ug8k2c/RllJlQQ3RFaT+BJxuIoPe9aBbulPQ4YuCSSXBUMUuMmbZaQI=@vger.kernel.org
X-Gm-Message-State: AFuF++nz/cRzpqfm8zAyUALc+baJnXF2Zt1lNVDZdKo0iS8P9eeANMQI
	WaoiD6Sao8v18WYVxQnc8ACuPqBvzGG9nxF3gItoSsDBr8Zfo7mMbAmD+zSj2hX0V4sjclwV7ZF
	x6PfNWxQjHIcX7PU4tx/LlSx2SrGgiXb66uVDV4beR7pvUfBe6gCs4jOeojKLpHatDeU=
X-Gm-Gg: AYBFou1/OLdZKQ6FO3aZ0vYo/W79WxezfBcllPSlDuX5CuYSnyTQ14EjMvhZwCI1CTC
	cUiRxuAwV5C92lOLYJKLv8NIpeb3BH1xvTQhKsAJeTeOsM1gi4rE2xEWieEX1UoNSdTI4KyDvL+
	Yi7SLuxDk78LvjXKpIP8XuhF9CLh2SkF6FLaH1SXKBBVBJXFf2SNvFEKON/Dikl10JkHkQTRmBZ
	I0sO3eUVhXipFVe3sK/51ibxJtAgH3/t4W3PHpXY1KV4AmpGgf/mqlbX1yTn8YBWQUi7h8tCQTP
	e62oPzRiXHOTYw/QIREnBGrTWr773EMooAURcakNJbi2EowvKvtOUHiP4xE=
X-Received: by 2002:a05:620a:4609:b0:93c:746d:7c72 with SMTP id af79cd13be357-93e9b8150fbmr302041985a.64.1791363710649;
        Wed, 07 Oct 2026 02:01:50 -0700 (PDT)
X-Received: by 2002:a05:620a:4609:b0:93c:746d:7c72 with SMTP id af79cd13be357-93e9b8150fbmr302035485a.64.1791363710038;
        Wed, 07 Oct 2026 02:01:50 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:01:49 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 18/45] media: uapi: add Qualcomm IFE statistics
Date: Wed,  7 Oct 2026 12:00:14 +0300
Message-Id: <20261007090041.3732717-19-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: F1OrFDTKcg7dwvj0aDIueBvrIDJ3S9pM
X-Proofpoint-GUID: F1OrFDTKcg7dwvj0aDIueBvrIDJ3S9pM
X-Authority-Analysis: v=2.4 cv=Xt5vqlF9 c=1 sm=1 tr=0 ts=6ac60a7f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=WOjdieuOH5yenQkIkwsA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX2D53aQdpek5N
 DYTZ2HZpZm/c7sIzv1raNbEtBtKa1EFn8e6RT5G5Oror/bItLhSD0uJI8U7ilFdp7XXMRGqr4NA
 YecDt6OkUJoJJdUDKj1SiWm5T6LGlCKkBEKnxbWYfppbhV6NPqtubcEPdtP2tuThEu7amSYsaR1
 iwODqS83xbHZS7vwJPSR2XgylaYUC4aiLHr5KOz4lPLHF9kyomz0DNzPp57JRwyMVbuOrZksVst
 M3tyQM3+ElXGRlUiv4VKUyxwzc5dYkADaBENjXvEP1bLzbLKRgapOD1P+FoXk3H0cIWMLekMECR
 xVENncQgFggMiCQmGSNlQTOUUwzFWIimij60iI05w8p7dv/oiMEimUVUNmqZOvmwvKBYrj3egjb
 MsPLtUqMTPMccXet4D8CA1KqECM2kjkrth6uGjwnSavzzVCvrPtJmtaVAQJdvctHzC+4HP6kyll
 N23whwfku0glkadpm4A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX2pTQMeB9FmKz
 /nTlQSCpvNjHEW5ta+qJwnKONDd3lF0LfA8cA1fZSh1XRgRwOSdjcTj2O1hXbqZksEOyvKy4u3T
 mmJoR6q0z8f8m++7642IkFb3xY628xk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Define the Bayer grid statistics buffer produced by Qualcomm IFE
hardware.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 include/uapi/linux/qcom-camss-stats.h | 62 +++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 include/uapi/linux/qcom-camss-stats.h

diff --git a/include/uapi/linux/qcom-camss-stats.h b/include/uapi/linux/qcom-camss-stats.h
new file mode 100644
index 000000000000..52a9d3e8171f
--- /dev/null
+++ b/include/uapi/linux/qcom-camss-stats.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/* Copyright (C) 2023 Qualcomm Technologies, Inc. */
+
+#ifndef _UAPI_LINUX_QCOM_CAMSS_STATS_H
+#define _UAPI_LINUX_QCOM_CAMSS_STATS_H
+
+#include <linux/types.h>
+
+/* Max number of bayer grid regions available in statistics */
+#define CAMSS_IFE_MAX_BAYER_GRID_REGIONS (64 * 48)
+
+/**
+ * struct camss_ife_bg_region_stats - IFE bayer grid statistics region.
+ *
+ * The IFE bayer grid statistic region contain sum of pixels and saturated
+ * counters within the region. The region configuration should be available
+ * in the IFE params bayer grid configuration structure.
+ *
+ * @r_sum: Sum of the red pixels.
+ * @b_sum: Sum of the blue pixels.
+ * @gr_sum: Sum of the green red pixels.
+ * @gb_sum: Sum of the green blue pixels.
+ * @r_cnt: Red pixels count.
+ * @b_cnt: Blue pixels count.
+ * @gr_cnt: Green red pixels count.
+ * @gb_cnt: Green blue pixels count.
+ * @sat_r_sum: Saturated sum of the red pixels.
+ * @sat_b_sum: Saturated sum of the blue pixels.
+ * @sat_gr_sum: Saturated sum of the green red pixels.
+ * @sat_gb_sum: Saturated sum of the green blue pixels.
+ * @sat_r_cnt: Saturated red pixels count.
+ * @sat_b_cnt: Saturated blue pixels count.
+ * @sat_gr_cnt: Saturated green red pixels count.
+ * @sat_gb_cnt: Saturated green blue pixels count.
+ */
+struct camss_ife_bg_region_stats {
+	__u32 r_sum;
+	__u32 b_sum;
+	__u32 gr_sum;
+	__u32 gb_sum;
+
+	__u16 r_cnt;
+	__u16 b_cnt;
+	__u16 gr_cnt;
+	__u16 gb_cnt;
+
+	__u32 sat_r_sum;
+	__u32 sat_b_sum;
+	__u32 sat_gr_sum;
+	__u32 sat_gb_sum;
+
+	__u16 sat_r_cnt;
+	__u16 sat_b_cnt;
+	__u16 sat_gr_cnt;
+	__u16 sat_gb_cnt;
+} __attribute__((packed));
+
+struct camss_ife_stats {
+	struct camss_ife_bg_region_stats regions[CAMSS_IFE_MAX_BAYER_GRID_REGIONS];
+} __attribute__((packed));
+
+#endif /* _UAPI_LINUX_QCOM_CAMSS_STATS_H */
-- 
2.34.1

