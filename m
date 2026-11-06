Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953548;
	b=Z4crqTkYlXdDhQ4CFuNUBtiyH4RYvU30FhSxn/vIlGRqsnpVTb6Nyc7rO3FZcM2x8oev
	 GCEhQI8p3Z2HwQO7v7dFC8GE304zOONandx7EIAqKncu1dvyTNhepjp4iolMbIod6e4/Q
	 RblCiIiv1Yr0SdM8YhEVHIFpx38TKIs2GmWu/gZ4hqEENmNkEnua33Y91kEKUDYm6RMSA
	 mKeNZwLSw2uWyDXTNy95TmLzi5ow1ArSW2TkMgGztZ5mt4cLqb875PDEX0VBfP6ikcLGw
	 7zj3PJt885Z82Kli/hlUTimZQ8PDRgJswmboVuAW2gzWvjC3/Kvbw9RkE01llASPfgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953548;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pPUcN8Y0DEBYTymsQLP2R9H776VthPiOJucEBEeA9nY=;
	b=KZ1x3ES6s3Bpyub82WjtT4PymMZNH6b99foCMr8q8MzVgWseW/YsA+1fyd42kq9b3eGm
	 ysz4hnLXVlBciAijDQ5cYXofhr6utcTFv1sq/qdw7fK8aDiUXwcc87RejZfsTGo/T5jlX
	 awGPPsuHQDfHfhcJqOT53B80Qe57fKB87YNfsSdlx4zkASCvWOIv1ZktEIMxR8sXciasV
	 Zfj86Kzn41v7heJM39iwGjwNwQtFe73Eo6idvSznzmQ0kvbDOTI+VsXORwz49dDniyJ8E
	 uX1A38wyJdPbmg2JDAzIQlJbwHlnw4drZHoPlylRa7ZtJlNnrbVNdy+A8WJJqFBY8yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O0ghQTGI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IUI0Vq+5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC98C606D807
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC98C606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O0ghQTGI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IUI0Vq+5
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RNSb2933638
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 08:25:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pPUcN8Y0DEB
	YTymsQLP2R9H776VthPiOJucEBEeA9nY=; b=O0ghQTGIF+xmuXJFYJkvzw5CkkY
	ctGxbUf6UskXn78fVlNSkVPQ4dw1EUhoR2Fv32Ovk7oRln0oMkrcLE9HK4AOc+gs
	GvFiQHPRlmazi8SGgkFNEFYrsrbUYyE0s2XwvDhULyjb89j13gm73TjK4n6nruUK
	9qBz3E4CL13mouE47/5GuNf2dZI+OFBUAGnc9WM/3APbwQiZZnBDf9cXaJkibV9j
	yDcbLQMbdESXXzweslK9Du1bZjjGry2O/h9Hh8OrPLu+fd+o/b9WBuA681sAlaD8
	6mZdcq7U/vIt8+mOjdkqMeoy8ro+kne0rzwcRwwGkzSFF3gKgilh+CFBblQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa1ut8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:25:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f559420f3so47353585a.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793953531; x=1794558331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pPUcN8Y0DEBYTymsQLP2R9H776VthPiOJucEBEeA9nY=;
        b=IUI0Vq+5p30Arv7JhU8uyEHLOm4AivxH9a1zx1csAQVC2ANowCrlmiepwO/8D7lReV
         rUcgv5nl3EMhZmteU6lCU3zbCGD9BkmY+xH9aMHzG38VKzAWnpP5FQceVLbkrQUcp02R
         df/fM20miP8fdKJ1fxXcOeyyzstXmF0WQSyjs9AwHy0nDGLfnjKRKDR0tRAfltYMywKh
         ARMTTcNf1jB0nDrvCOOqARPwliSGCvUoxBLSU9fp/nkN864FCJ3vaqoKqmu37YCAn8Qd
         VlPDf6iDdmvMn4qOZ1th8eI3j9zybAgRe4Ba8TY8kBzqq0ir1qWf/XFh6iP2eL+rB2+K
         UaNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953531; x=1794558331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pPUcN8Y0DEBYTymsQLP2R9H776VthPiOJucEBEeA9nY=;
        b=p440guHGyItGvwSJ1IeC0jz9wlMZtDIVOZfoLshsGeXglFR/20YFvR5IhMq8F+KCXL
         EslL3JCYZHinAcxV74E5opKBin4bZU6wndeIuwgXFKfG2FnfMVvBtszQ4q8x0uohGonb
         tBaF9VF8upmvIC9sVrwb9ULyVV0N9VdOKbocTgjbSKtdDCz0j6HnyzuNNElx51yw1I5J
         JA6wl83Da2cAj01bEW9tU1yYm9+NOv9p7RqabRHe/qVuY6bf0ZdyEGr4Bnvd/sLLLHSN
         v/pgd18pzeRD3wU0mM+vbD2ceTdcDUWgh0FVPO6ZKhaq7TU96RtifUNgdWMLfYRmcWll
         cAtQ==
X-Forwarded-Encrypted: i=1; AKwUvByo3jZN6q+lQLJQEeINspe5CbD4r3CdzHbfmCkQyACzq62iBOo6xi+4S9opF8opr3g12z1VNdv9NJCIOWE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cQrZnOFhUu3Jcr89FTodLNu3xV/4X+bj+c9yTA3HJM05MPHrB
	UUQsXT2zvM7IGRWGl4wiCuiBPzRkjljg2sF9hUfBZbU7fXWLYmAUmvBhO0pMTy2LDN3e0CiUwYi
	z7jq5zzJn/x+vcPJpBsyakNewX+QVpQP1WxgrvnW4zmFx3QPH6jwJd0khv/TeOzUciPk=
X-Gm-Gg: AYBFou35a2uaoyOM3VTiN4fSY8Bk9jo9aEul6wtMtzW/ipC6MQEfVLOH6/+6BPFkaKx
	Yuh8g4F1A6YFxPjYdnPH5BLY9btlIUQMzwEDt1cW/93VWcGj4FOR/8Z2DBR1HgbqK+imkWDbGqE
	+Wuf2Pel7ZQmhdhtHnK8SVWdwOshm9O72X7LnlrtAAF5320h6x2jVhyBEKiy/P8t4EzgO0tisMQ
	yotaU7TrUw8vITAbYYZhqs5nnHVzkEw26LBjm4mAJUjCAwDMqIH8c3oZ7ntkBI+b9Lg6Y7YcWCQ
	+qxy5ObdwNLAJzW2kOnPQeptc0Y3OVHOQM6Hce6bY1tqF9ZCkLBNhK3xkxn6kFPt9WXroPtuvf0
	19rm+VZAYN45aRbkf2Yr+pG1G5L3WMx4M7Ck0YZ85+bqQ0fa9oyRU3SA1qvvseRi8zxb90wMIyQ
	==
X-Received: by 2002:a05:620a:4690:b0:93f:ca9:3ee7 with SMTP id af79cd13be357-945f355bf60mr260829585a.57.1793953530758;
        Fri, 06 Nov 2026 00:25:30 -0800 (PST)
X-Received: by 2002:a05:620a:4690:b0:93f:ca9:3ee7 with SMTP id af79cd13be357-945f355bf60mr260825785a.57.1793953530191;
        Fri, 06 Nov 2026 00:25:30 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ba6bc36sm130723255e9.0.2026.11.06.00.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:25:29 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v7 2/8] media: jpeg: Add JPEG baseline and JFIF APP0 constants
Date: Fri,  6 Nov 2026 10:25:16 +0200
Message-Id: <20261106082522.1448390-3-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
References: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-GUID: 39pO2tAyOaMd292en_gUp3IDz-2h-xiF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX0oZBewJTm6jC
 voe8L2tZwuv/f44wabIyL46M5i/1/D5xh7X0WsPuIp8Sewa6G0ZjC9tpcnfUkVL8mHZilpbJe8I
 1RsQ0vg4a9DOBN9t8MhPb/C4gYlytP4uYAUnMvkV+ryAVQStkyUKTteTq0OM++euZHsnK2hJX0f
 P7xB9CHSXeFQ3/FvDCGUc1UDu4tCOBduUlY7rFfi17SFwRWbzUZ+JGdkvmvdO2iKADkqxRKBqH/
 qogBWItvRmqxe13Q42GfoOXJk9Ckqd0oMIk15bhl2ft5dJM6b0FypBsj8Ifqdjsbhqzneobl6nY
 Shl3VBC22MjTS23CVcsITHjoQj8RcpCW/yrOv2jpoMnFwSj+GmztaXq4DZsR3LLLtI+LSur2kL/
 LDphr0NB1HArZ4XznMQMi40vEAR39tGXyhq0Wre7srjZRR9eJO+mdMIbPefvcOYWj+3uQLSo4rp
 P331JV3kQV2B2R46TyQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX7iMbZVkZEBrA
 wfhfIUHdSw+PVbYKgJ4O8LS8zjlqTd5+57OrNfEhAUzMWbFJIQ60wRQif7SJ/AI9MAilNXfIh3L
 f/RvWASqRV0s08kcHBd3ulXtFIPJwJs=
X-Proofpoint-ORIG-GUID: 39pO2tAyOaMd292en_gUp3IDz-2h-xiF
X-Authority-Analysis: v=2.4 cv=CaKdd7rl c=1 sm=1 tr=0 ts=6aed8efb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=SSmOFEACAAAA:8
 a=EUspDBNiAAAA:8 a=Rl42jcqtOcFU5aT7_7AA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060033

Add the standard field values of a baseline (ITU-T T.81) JFIF header
to the shared JPEG marker header: sample precision, component counts,
sampling factors, quantization table identifiers, SOS table selectors,
spectral selection and successive approximation and the JFIF APP0
payload values. Describe the marker segment header and the SOF0 and
SOS headers and component specifications as packed structs, so their
sizes and field offsets can be taken with sizeof() and offsetof().

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 include/media/jpeg.h | 79 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/include/media/jpeg.h b/include/media/jpeg.h
index a01e142e99a7d..a93d0a580bbe3 100644
--- a/include/media/jpeg.h
+++ b/include/media/jpeg.h
@@ -3,6 +3,8 @@
 #ifndef _MEDIA_JPEG_H_
 #define _MEDIA_JPEG_H_
 
+#include <linux/types.h>
+
 /* JPEG markers */
 #define JPEG_MARKER_TEM		0x01
 #define JPEG_MARKER_SOF0	0xc0
@@ -17,4 +19,81 @@
 #define JPEG_MARKER_APP0	0xe0
 #define JPEG_MARKER_COM		0xfe
 
+/* JPEG baseline sample precision (bits per sample) */
+#define JPEG_SAMPLE_PRECISION_BITS	8
+
+/* Number of components: greyscale (1) and colour YCbCr (3) */
+#define JPEG_COMP_MONO			1
+#define JPEG_COMP_COLOR			3
+
+/* Chroma subsampling factors encoded in SOF0 sampling byte */
+#define JPEG_SAMPLING_H1V1		0x11
+#define JPEG_SAMPLING_H2V2		0x22
+
+/* Quantization table destination identifiers */
+#define JPEG_QTABLE_LUMA		0
+#define JPEG_QTABLE_CHROMA		1
+
+/* SOS spectral selection and approximation fields (baseline JPEG) */
+#define JPEG_SPECTRAL_START		0x00
+#define JPEG_SPECTRAL_END		0x3f
+#define JPEG_APPROX_HIGH_LOW		0x00
+
+/* SOS table selector bytes (luma: DC=0/AC=0, chroma: DC=1/AC=1) */
+#define JPEG_TABLE_SEL_LUMA		0x00
+#define JPEG_TABLE_SEL_CHROMA		0x11
+
+/*
+ * JFIF APP0 payload fields, as specified by the JFIF spec referenced from
+ * ITU-T T.81 Annex B. See: https://www.w3.org/Graphics/JPEG/itu-t81.pdf
+ */
+#define JFIF_IDENT_TERM			0x00
+#define JFIF_VERSION_MAJOR		0x01
+#define JFIF_VERSION_MINOR		0x01
+#define JFIF_UNITS_NONE			0x00
+#define JFIF_DENSITY_HI			0x00
+#define JFIF_DENSITY_LO			0x01
+#define JFIF_THUMBNAIL_SIZE		0x00
+
+/* Marker segment header: marker and length (ITU-T T.81 B.1.1.4) */
+struct jpeg_seg_hdr {
+	__be16 marker;
+	__be16 length;	/* bytes from the length field to the end of the segment */
+} __packed;
+
+/* SOF0 frame header up to the component specifications (ITU-T T.81 B.2.2) */
+struct jpeg_sof_hdr {
+	struct jpeg_seg_hdr seg;
+	u8 precision;
+	__be16 height;
+	__be16 width;
+	u8 num_components;
+} __packed;
+
+/* SOF0 frame component specification, one per component */
+struct jpeg_sof_comp {
+	u8 id;
+	u8 sampling;
+	u8 qtable;
+} __packed;
+
+/* SOS scan header up to the component specifications (ITU-T T.81 B.2.3) */
+struct jpeg_sos_hdr {
+	struct jpeg_seg_hdr seg;
+	u8 num_components;
+} __packed;
+
+/* SOS scan component specification, one per component */
+struct jpeg_sos_comp {
+	u8 id;
+	u8 tables;	/* DC and AC entropy table selectors */
+} __packed;
+
+/* SOS fields after the component specifications */
+struct jpeg_sos_tail {
+	u8 spectral_start;
+	u8 spectral_end;
+	u8 approx;
+} __packed;
+
 #endif /* _MEDIA_JPEG_H_ */
-- 
2.34.1

