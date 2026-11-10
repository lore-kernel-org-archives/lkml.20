Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328760;
	b=H7H6qQftmHHX3Un14igHn80VFHspUw2+ez0gWeA7ZyIwrIdQ2lq8oUX2TZv5xJUGhVaZ
	 biiA9K6V134tg27pVW5yj+xoHAamS3qbYbfExwn9+d4jphRNJYr7B5Ypkugy5X9oMgwI7
	 0X7uqyRv+wWEEFB1ZWU3p6RZgxOZ5i+991HNzDa73AT0bBkFbpFXWfA41YVbKHMapwyvM
	 g7yO9i/0kNZm6cQ5BSDbO5fH7Z8EAInJf/5GSqzD0/btizymw4oO5yyaXH2upzrM58BCL
	 T3hLnCRwiG9nuCH6C5Y46XwN/4MLevPk4xEUJtcUACEiqkUG9be03I5+PF0fQwFb1Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328760;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pPUcN8Y0DEBYTymsQLP2R9H776VthPiOJucEBEeA9nY=;
	b=ZrUmPRuG07uC2Q7rlNbdA1aiDmM4vK9HRqaRHxeK3esLTYNo+GQKFnFvG8auL+FwmXof
	 +rl3VNBocPHjrG8FqZZ/a2clF1vEa7Tf2+adE9LPXHjJqOeRtxwEYMzvmDlCQMNcUyLDF
	 fd1G9VwWFn2Frlzp+yOM/4iF1YO8Z+xcyevzXC0u/ZvpbjTB05vqXCBzWtopW5rf0XskN
	 9hZBAjaNv9HqFoNqAWESQjjart2ARtwOYdcu1k1kr4gHa95YYCD46X4c/l4BCIlpTkHyj
	 fKOYxFU8d00KpSWO7xus7CLWQc/afDyi6ZnQbt/wKK4RPgkIK0NOLnJSCTmN6AvPoXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D1sfM8Pb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vw3uBaYP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B11F606A33C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:39:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B11F606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D1sfM8Pb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vw3uBaYP
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF074J3376588
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:39:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pPUcN8Y0DEB
	YTymsQLP2R9H776VthPiOJucEBEeA9nY=; b=D1sfM8PbAphvGUWtv1Ki9uUc+IE
	rWupVk0mGt/nibXNyq5W+kQmBHSabna/Mp77KGncQ2EQjYyTgLmaINagC6h0s+Hn
	4ADtro5KVMofPyhJ7gVSCHBx6n74jRx0fS+eFHlpSra27aiTOMbprrXzvfAGaqj0
	ec8h792MqhrBbEnl+Rwy2NiF9p3paxrI4yy/cS+YwcRnldQXiUVmIjr4MeR3ZKIf
	uX8SdvZxZ4A5y4Lu6exqWtNABZlAcrKHIR8gEfE5O1lWb+65G0bXVuyaBCJqVUM1
	xtrG5ZhQLDRaU+bDNJmErLsqjNaDlb8vn/jAhW+/C5PTPIAyAw7LoaHqI6Q==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hux84a7bs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:39:19 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99063f4065eso743849241.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794328758; x=1794933558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pPUcN8Y0DEBYTymsQLP2R9H776VthPiOJucEBEeA9nY=;
        b=Vw3uBaYPhPz+ImU7D36wqcXOuAYQ1H+KOOGwNFHiAJtMg0anhwDhjnQNan3QVx0ZsR
         4kzWt8m80KQoPiBgfanHIWJGwZ+pqZmL06cz8SAAyuAHPXnGP1QSnYgGXNIl0eNmG17s
         Qoh0oOEtcwK27cD99YOaPVMf3NedNTx2odc96fpJDn5qae43NXrPCRK6dLEONxja8Y9I
         47WqP0Is+A1TD58MzBxl+JfNN6ox0niePUYM1QZ+ruKqZiO1By6pEs4nBFTXV1O9np2A
         tZmCPSsqjDYdBvtu8skixvv4Onz4EA4hFwJQUHeDJBxTNI9mSLOkOMQGVtGmHJp+9aQ+
         EM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328758; x=1794933558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pPUcN8Y0DEBYTymsQLP2R9H776VthPiOJucEBEeA9nY=;
        b=g61k4egbuaow2S/s8DaN9eduWa4pg20FXeKRR/L+foGZ6/TGCD/tOVBAUx4ANzCW8E
         IIla5K4fyLh1BMdPisjQZy7SiniEWrXDpPuVhqMS7gfBb1jXBAUnxrjQENbShhWzoBPA
         DOTfRpO2ekpC3iIKo01mo0Zvas19g9vNmClF9vGpxlWe/GoWakv8fivcOyw00vZmHLpa
         uz/eDn5LZ36yfQbCWzGCYrDsZgpcdv6ztggz5nX6DY97PDrG+5B7+0uEFcZUv/xhc8Qx
         LboRssLWZAjGFZrU6Wuuz9LPWewJKnVV2CWQ0lW+n/gsTOXph9nJkswApRNj3u0dI7jh
         yu8Q==
X-Forwarded-Encrypted: i=1; AL+hErGZNPy0bFMkdf/eiulmrRr2C7HJWBiW4CAsOqO6JvwPigl4eD5bMEkKPkiTSWVWMdFcpImpLIVIQ3RMb6c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ioYbnwf1CeMYXqHRQljc7QMbiGo7lFxeXVBXfGBxm/FnmCjEb
	CvOi5c5p4BnmPF9WUw6S6FpMXtFKjlQwkhx3RDTuzgY10WJN/dAS3URSffKuVc0P+TS8x3D9jkC
	QJznznKQnlH21Ezb/dJEEfelEwByC+Kl7+vX82asofLpdYnBU/PzMCihF4RIp6+nlb2k=
X-Gm-Gg: AYBFou3ex72JGSD+nShsguNVxMj+Svcnw/2b190mp2OF0+EuZMRPeZcgxD/APAHfz+g
	ArPiD+6yF0H4wtw2MdAao5+dCLRfwuqG8ThhCPAe1hqIvi9Jv2tN6wMCCkR/g3+KGaDEMBZBnKI
	j3YKejPuF1L/8Ptq+jrpLyrevs0esCnCyJ7LDjeJ2EviodzKqsXfvoyRFov+3Gffl/O0ztLF4nB
	84nfQGizpZeipuZZDamKgZMMhtEMZ4YkrgK6NTzTt1NSKisX5NXnMWPt+M7X2vBs+PgScxJF3Fm
	NchyJ74oxTQy8neS+lzKqlcovhhg4qJT3huaFm0U0S3vWwwsHyQMeRx2v6M0oC7IjZlKib8KePw
	qFepmDjzF+NCdYiYSmZUjzJA2kcngwj758u+B59waDSwpKAgIOcSttzQNWd2rqUv/dmW+VJXUyw
	==
X-Received: by 2002:a05:6102:c54:b0:7d2:75bf:2fd6 with SMTP id ada2fe7eead31-7d301ba381amr1087065137.18.1794328757530;
        Tue, 10 Nov 2026 08:39:17 -0800 (PST)
X-Received: by 2002:a05:6102:c54:b0:7d2:75bf:2fd6 with SMTP id ada2fe7eead31-7d301ba381amr1087049137.18.1794328756999;
        Tue, 10 Nov 2026 08:39:16 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01ff3428sm85130395e9.15.2026.11.10.08.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:39:16 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v8 2/8] media: jpeg: Add JPEG baseline and JFIF APP0 constants
Date: Tue, 10 Nov 2026 18:39:03 +0200
Message-Id: <20261110163909.78085-3-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfXx8mUI2DXLjmn
 aAW68pyQ2jJUCKVTKECbplqulnEpKv/FRgVq45MTo4z5tU8rpteXcuhJPCBFLH0EUXFbTVLlINU
 nyT1RlRpbzg3xcVqUbQyN6wnRKHOp3gctlJm+hbkQXa1GOiyTwHXzZAIZeQBu9uUK39tnldORYx
 OUCNFr3GDsAs1XCIe+hfnw7TeYB6h7GaqZVYpG28URJzAi/mbcmzehcGZxBmaVywk7ovfPezD9a
 xxA9zXxKbBQb9xvxdBUF834DI1XNtSAqKKztmSYLrbLwrheoaVpMHtAZh09MszSGoSQ+b8d2bSZ
 kw0eKcc/z4aBL44Yt7Vn11Nzdbt4TrPqQx0nhieohhVxk1I7FjkPdCWiNjk2oDvnjdnkoqkelYu
 Eox1AQ47ykeTqGSXT1rTThrrojrnEv9c65tKkQTJxX/IxMQX0jnXyaOZ8xXPCFQXybz59cp9Lfa
 aTttrzU3xlgmbFH1xZQ==
X-Proofpoint-GUID: rsMTudXnUFkMcaWrN7uZLUtnrLIs1dF0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX7v1AZkSn7Bxe
 NA5/03AtThzNtxrVWduOPERiUVgEWAX5hIP54WolPmNdRbxM+zxOYSAF0Ea46dv3ZSYy9gitWfK
 w+fON3ALYSBs87P/5CsrsXKXWi59ICc=
X-Proofpoint-ORIG-GUID: rsMTudXnUFkMcaWrN7uZLUtnrLIs1dF0
X-Authority-Analysis: v=2.4 cv=JNSuIMKb c=1 sm=1 tr=0 ts=6af348b7 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=SSmOFEACAAAA:8
 a=EUspDBNiAAAA:8 a=Rl42jcqtOcFU5aT7_7AA:9 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100066

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

