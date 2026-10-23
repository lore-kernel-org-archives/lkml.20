Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768183;
	b=uXAXB/buYJVmZ3Vm8X1v4HnR7El4jukc+Ikoz8WTCEAOhdTve9Q7sEcWyXVheBf9H9wO
	 GG5QUKnfcB4s8MGlKaHXSe1wkJMpG+UpCc6L1fNN1nKJo39y6PU1nprI9v6UERbdHYFUY
	 PqbVz/C94bIHRJk2E65b17NfwuYBn8VG87+hK5eewhO1PCvRhCpeeMPBa1l8dvUhjwcD6
	 eHNgBT5Nm//Of3wOQI8WJuAKpaQw0/GuX+CI3eEsmMc4sOarud/Mcc+xMrda3sm2o1jof
	 EZys83nGe+ksylUF345D+PLZCswuy/dTzzAvaf0+kPYM7vA9Y2oGj+L2o/H38Dp231g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768183;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GK+YDzIPYZBQYW/Kyml/YWjbXuZpS9AEGYoSg6CWENU=;
	b=XOy0fGBxrgVAVx0F25DjeyAc2jNtYzcX4kyJqz2deTLePCWkYRz8ZVuxf4vqr2tV4BIZ
	 mZfTAATPUfBYmk74GzEGy34ZOYt53OLmASw/vt+MYUsUe/l5RKf6grO2K/VfYBd34DdOv
	 T5Ht6iB8p4fJHC6dvgVmCj6nAf3+0j7eRvrAgoujRcFkxNO8reHQFQSQHE8Q8Fj+dhMeR
	 Y9AyP5bFr4rmglKuPFf9wr6Np4EIR6EH9MqSszmaD4uOdloB8iya4Qf2OfG8ox//Qa49l
	 m4M1658yAoXAFpOnJyeTIPnAi429LeT2ESIxNNZY0LJ8xCTh+0Eg9dpqe7zH14+B/Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K0uevluw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bp6FPL4U;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFE660A2622
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CFE660A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K0uevluw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bp6FPL4U
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6rQB1492211
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GK+YDzIPYZBQYW/Kyml/YWjbXuZpS9AEGYoSg6CWENU=; b=K0uevluwF3j1dVC0
	AXuhj/+Mq0KZumoPpFAa6bCDlfbXM5Si1AB2lxhhRYByyqgllDezXezANhuJ65S1
	IZPmsfFItm3aW/4io/d2jxVr3ohO3W8ilp0fViKB9/x/NCKr0v+Bf5OFDUiZsOBV
	MLRxikl7TTDwCcQqaTAtRNIoZdVOvWuSheFVPsVXsfgX/sooWz4jDN085sLb1oPx
	gOzar7czeFZ5VPwI5S9bmENzKlELCF0Ygbw2dTUVdemeL3pkR13Ee9CAu0KZfWk6
	kFrymcyb6C6jwa2+NqboovfRd9oliymL3MIpP8EQyfdCPsjaCqI32jJ0smP5tlkm
	kQC3JQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsmaupuq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:09:42 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99063f4065eso249850241.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792768182; x=1793372982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GK+YDzIPYZBQYW/Kyml/YWjbXuZpS9AEGYoSg6CWENU=;
        b=Bp6FPL4UytFNTQyRMohvdZRyYLTVqTZwak3vJRcFzizfYE3pcHvcFwMjMgWzRoXb9P
         YmyqtsFgbznx75yhe6WRabc1dk8Ape1Cp2J6sHHukQ+/PfuGAtvqbaGyfMpl922edT2G
         HP882B8Px6OFYej/FExqqdkl1ozlm8+gCIwTCElmNY2z8aus0XC2VQt8JWRdX0jjTCP5
         aFTXJbCoy07nfTFTv8EDpAUk99dGDFYs7ynlHR0EKpKLutKhmXn23NFkmbuSuCBdGOck
         5c5vJu+JATB+DNmwYNBNIf+TI8IVbXTZZrZ5gYSrc+swj2pC7/l+68lO8FxE8gfsIOik
         ZhYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768182; x=1793372982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GK+YDzIPYZBQYW/Kyml/YWjbXuZpS9AEGYoSg6CWENU=;
        b=Te7aD0/ghue5l7dPHjgM6XRW/aRD3npzxtfi4usFCn/P8z/pXcCj7Pkzx/Lu4ntWGI
         uko08xybxrNTbkJIblydqfmmORnUK3AJuBJG027tRdBOSrrJhGblIQtdjaYx92WBn69m
         9H3hvESTWwZkWAEFhAViNMEyZb9UrrfnvpnAWjMziSvSBpc5TuGase/uWaVeg4eSYfli
         pP0+8r5apW64PPQIMHw6lGiYMLbyHlA13lDdB6W8q/VArrMx4Tdm/7sPh1s8NfFb/1dg
         REsi3YdEmn2K8nGMQMqu++SrRNE+vWUdEuCH0X+bI89Fm33nOJKK43L9h8WUHNDTbEf6
         oiDA==
X-Forwarded-Encrypted: i=1; AKwUvBxwfFuEADxxu0OMcZEYzmGA687iq7KDi/H4HUUjlt5xhYapFNQlen66tSrrs04xrWzdf2nT9YAfgYbi9LM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgPH9xXmefPsJWVoyjEWewsE046NMmu96fkeMOZv8REGkQZ6mC
	cupUBdadedsys48ozjjaJp5M31XqJFnfhY09lMCiNmSV+mAsrAs1CK8HxTBKhhabCVo3Fa15Dde
	3wxF2onyTf7afvp2mv6093h7i1pvIJUKwconO/P7IRCxu5vA3NGxqJdFHMogFLvRkqJg=
X-Gm-Gg: AYBFou04SKbnsWkk0nUi4Io91W9OymxG/x/VAiqih17LF75SxXHigQC+lE+rh1Fsk36
	o6L7n81HxKR0E2nQDCyrabDDvKOy4ORofDEz6Ir2WZp/RLpbXrHKre9zAS1BIaOhJK/R16kHCLo
	3EqKWWm8PLNouIlSfVnxPjBQCx2coQwdpdEkEKbfTBSzh3CnIKxiE0mDhbLlQx0sK8MeKi4eagp
	YmcOUN3+80dJ5srn0ps8BQozFArFmff8hwyBjsoKCz1XvU5jH70jcoffMOdciD27/PnoUMCHPdv
	tCJXm3iwVuAyBpGpBeHO4p6jBkCsWg5bFrZ0Aeru/fP1zlg5hOu5GoYX1yzJZZ+vn8fkE7rz7PO
	9tKLrNeCz52HxoHPO1bX3Z6b1QAU7ERMjcEWaLHmzDbbqmwOy8XxbqOpgfbjInHNT4fHmFWH5P1
	Bykjq87WDBBmYPF+bRHC3ceGW8zMaVBufp294DYj5B9Hja2nirBQ4=
X-Received: by 2002:a05:6102:4457:b0:79c:99ea:2c9a with SMTP id ada2fe7eead31-7ccc31d07bemr714546137.11.1792768181392;
        Fri, 23 Oct 2026 08:09:41 -0700 (PDT)
X-Received: by 2002:a05:6102:4457:b0:79c:99ea:2c9a with SMTP id ada2fe7eead31-7ccc31d07bemr714495137.11.1792768180779;
        Fri, 23 Oct 2026 08:09:40 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d0fb:daf1:3106:3697])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4040d3sm323962f8f.27.2026.10.23.08.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:09:40 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:09:15 +0200
Subject: [PATCH v11 4/9] media: uapi: Add CAMSS ISP configuration
 definition
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261023-camss-isp-ope-v11-4-0c2937195298@oss.qualcomm.com>
References: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
In-Reply-To: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=V7LoQuni c=1 sm=1 tr=0 ts=6adb78b6 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=cBt3T3tByBXynNCq78MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX5eujHf/9pcuU
 Rz3F89oyFm+FPPvusAdwhBkfXtYdtUl3KrsW8Qsn2t3H+03eVwJ/UGRORWKFnDHAvT8gdyom71G
 g0iOtdl7P6zmsqngCKjjQNMPwzyq0nc=
X-Proofpoint-GUID: l7B-U59Tg-wkNB7AuCMAj08TwnWeC7S3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX9zzqIZq8VzZq
 PXRkkYdOpeaXI6v3gNFpyAD2AJOZV0pVa5rBIKYT0AnRASk4nya0AX/Znd1c074LMe58B3SmCF5
 PLi//okr+iIc2SLbpojSO4pI7XTiq92J2aZZNLsDuFzPZ0i/EAN6wGkgrh94amJzFm2Oh61WKc1
 p3mYsJ6aCmSwjG5Arcv5g+1j/ksep1sWHIFhMSrOhlMSkNm3VfKxaIawAlSv0T7K5EWxrYNSZJJ
 7ki+7gRqWrhQnVtDPgtcxR8bZkEw+iOWViXjXiOijUWeb/SQLZWf4d2VHR8xkE42Yv/Gkbcca2t
 TJvlW5Y8E6GPSUTdsiK+9ubPDJjnFcUzvfY8n0Vl+NOHDPCvGCsmqSjWv0YRTVsqxI9i4J1WxR5
 ZW8XPskP5Le7TbqtYmepA/wex1uorDXPMQ5/7SoPsjiPFqIcGqyZGquL/9ziR9OQAFnJH81xVtW
 K7+PqjXXDTWO2A8b0cA==
X-Proofpoint-ORIG-GUID: l7B-U59Tg-wkNB7AuCMAj08TwnWeC7S3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230059

Add the uapi header qcom-camss-config.h defining the ISP parameter
structures used by the CAMSS Offline Processing Engine (OPE) driver.
This includes structures for white balance, chroma enhancement and
color correction configuration.

The block type enum is shared across CAMSS ISPs so that userspace only
has to deal with a single set of block identifiers.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 include/uapi/linux/qcom-camss-config.h | 212 +++++++++++++++++++++++++++++++++
 1 file changed, 212 insertions(+)

diff --git a/include/uapi/linux/qcom-camss-config.h b/include/uapi/linux/qcom-camss-config.h
new file mode 100644
index 0000000000000000000000000000000000000000..5756d165e7e873a6d268909da077acb6f5f56054
--- /dev/null
+++ b/include/uapi/linux/qcom-camss-config.h
@@ -0,0 +1,212 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/*
+ * Qualcomm CAMSS ISP Driver - Userspace API
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _UAPI_LINUX_QCOM_CAMSS_CONFIG_H
+#define _UAPI_LINUX_QCOM_CAMSS_CONFIG_H
+
+#include <linux/types.h>
+#include <linux/media/v4l2-isp.h>
+
+/**
+ * enum camss_params_block_type - CAMSS ISP parameter block identifiers
+ *
+ * Each value identifies one ISP processing block.  The value is placed in
+ * the @type field of &struct v4l2_isp_block_header.
+ *
+ * @CAMSS_PARAMS_WB_GAIN: white balance gains and offsets (CLC_WB),
+ *	&struct camss_params_wb_gain
+ * @CAMSS_PARAMS_CHROMA_ENHAN: RGB to YUV colour transfer matrix
+ *	(CLC_CHROMA_ENHAN), &struct camss_params_chroma_enhan
+ * @CAMSS_PARAMS_COLOR_CORRECT: colour correction matrix (CLC_CC),
+ *	&struct camss_params_color_correct
+ * @CAMSS_PARAMS_GAMMA: per-channel gamma correction curves (CLC_GLUT),
+ *	&struct camss_params_gamma
+ */
+enum camss_params_block_type {
+	CAMSS_PARAMS_WB_GAIN = 1,
+	CAMSS_PARAMS_CHROMA_ENHAN = 2,
+	CAMSS_PARAMS_COLOR_CORRECT = 3,
+	CAMSS_PARAMS_GAMMA = 4,
+};
+
+/* Number of entries in each gamma channel LUT. */
+#define CAMSS_GAMMA_LUT_SIZE	256
+
+/**
+ * struct camss_params_wb_gain - White Balance gains
+ *
+ * Implements the CLC_WB pipeline module.  The pipeline applies three
+ * sequential operations per channel:
+ *   1. Subtract sub-offset (black-level subtraction)
+ *   2. Multiply by gain    (colour balance)
+ *   3. Add add-offset      (output pedestal)
+ *
+ * Gains are 15uQ10 (15-bit unsigned, 10 fractional bits). Offsets
+ * are 16-bit unsigned, normalised to full input scale (65535 = 1.0)
+ *
+ * @header:   block header; @header.type = CAMSS_PARAMS_WB_GAIN
+ * @g_gain:   green channel gain (15uQ10, 1024 = 1.0)
+ * @b_gain:   blue  channel gain (15uQ10, 1024 = 1.0)
+ * @r_gain:   red   channel gain (15uQ10, 1024 = 1.0)
+ * @g_sub:    green sub-offset, subtracted before gain (16u)
+ * @b_sub:    blue  sub-offset, subtracted before gain (16u)
+ * @r_sub:    red   sub-offset, subtracted before gain (16u)
+ * @g_add:    green add-offset, added after gain (16u)
+ * @b_add:    blue  add-offset, added after gain (16u)
+ * @r_add:    red   add-offset, added after gain (16u)
+ * @_pad:     padding for 64-bit alignment, must be zero
+ */
+struct camss_params_wb_gain {
+	struct v4l2_isp_block_header header;
+	__u16 g_gain;
+	__u16 b_gain;
+	__u16 r_gain;
+	__u16 g_sub;
+	__u16 b_sub;
+	__u16 r_sub;
+	__u16 g_add;
+	__u16 b_add;
+	__u16 r_add;
+	__u16 _pad[3];
+} __attribute__((aligned(8)));
+
+/**
+ * struct camss_params_chroma_enhan - RGB to YUV colour transfer matrix
+ *
+ * Implements the CLC_CHROMA_ENHAN pipeline module. All coefficients are
+ * signed 12-bit fixed-point Q3.8 (range roughly -8.0 to +7.996).
+ *
+ * RGB2Y - Luma (Y) coefficients
+ * Y = v0 * R + v1 * G + v2 * B
+ *
+ * @luma_v0:  R-to-Y coefficient (12sQ8)
+ * @luma_v1:  G-to-Y coefficient (12sQ8)
+ * @luma_v2:  B-to-Y coefficient (12sQ8)
+ * @luma_k:   Y output offset    (9s,  0 = no offset)
+ *
+ * RGB2Cb - Chroma (Cb) coefficients
+ * Cb = a x ((B - G) + b(R - G)) + KCb
+ * with:
+ *   a = ap, when (B-G) + b(R-G) > 0; a = am, when (B-G) + b(R-G) ≤ 0;
+ *   b = bp when (R-G) > 0; b = bm when (R-G) ≤ 0
+ *
+ * @coeff_ap: Cb positive coefficient (12sQ8)
+ * @coeff_am: Cb negative coefficient (12sQ8)
+ * @coeff_bp: Cb positive coefficient (12sQ8)
+ * @coeff_bm: Cb negative coefficient (12sQ8)
+ * @kcb:      Cb output offset        (11s)
+ *
+ * RGB2Cr - Chroma (Cr) coefficients:
+ * Cr = c x ((R - G) + d(B - G)) + KCr
+ * with:
+ *   c = cp, when (R-G) + d(B-G) > 0; c = cm, when (R-G) + d(B-G) ≤ 0
+ *   d = dp when (B-G) > 0; d = dm when (B-G) ≤ 0
+ *
+ * @coeff_cp: Cr positive coefficient (12sQ8)
+ * @coeff_cm: Cr negative coefficient (12sQ8)
+ * @coeff_dp: Cr positive coefficient (12sQ8)
+ * @coeff_dm: Cr negative coefficient (12sQ8)
+ * @kcr:      Cr output offset        (11s)
+ *
+ * @header: generic block header; @header.type = CAMSS_PARAMS_CHROMA_ENHAN
+ * @_pad:   padding for 64-bit alignment, must be zero
+ */
+struct camss_params_chroma_enhan {
+	struct v4l2_isp_block_header header;
+	__s16 luma_v0;
+	__s16 luma_v1;
+	__s16 luma_v2;
+	__s16 luma_k;
+	__s16 coeff_ap;
+	__s16 coeff_am;
+	__s16 coeff_bp;
+	__s16 coeff_bm;
+	__s16 coeff_cp;
+	__s16 coeff_cm;
+	__s16 coeff_dp;
+	__s16 coeff_dm;
+	__s16 kcb;
+	__s16 kcr;
+	__u16 _pad[2];
+} __attribute__((aligned(8)));
+
+/**
+ * struct camss_params_color_correct - colour correction matrix
+ *
+ * Implements the CLC_CC pipeline module.  The matrix computes:
+ *   Out_ch0 (G) = a0*G + b0*B + c0*R + k0
+ *   Out_ch1 (B) = a1*G + b1*B + c1*R + k1
+ *   Out_ch2 (R) = a2*G + b2*B + c2*R + k2
+ *
+ * @header:  block header; @header.type = CAMSS_PARAMS_COLOR_CORRECT
+ * @a:       G-input coefficients per output channel (12s;
+ *           a[0]=Out_G, a[1]=Out_B, a[2]=Out_R)
+ * @b:       B-input coefficients (12s)
+ * @c:       R-input coefficients (12s)
+ * @k:       per-output-channel offsets (typically 9s effective)
+ * @qfactor: Q-format selector (2u):
+ *           0 = 12sQ7  (range ~-16.0 .. +15.992)
+ *           1 = 12sQ8  (range  ~-8.0 ..  +7.996)
+ *           2 = 12sQ9  (range  ~-4.0 ..  +3.998)
+ *           3 = 12sQ10 (range  ~-2.0 ..  +1.999)
+ * @_pad:    padding for 64-bit alignment, must be zero
+ */
+struct camss_params_color_correct {
+	struct v4l2_isp_block_header header;
+	__s16 a[3];
+	__s16 b[3];
+	__s16 c[3];
+	__s16 k[3];
+	__u16 qfactor;
+	__u16 _pad[3];
+} __attribute__((aligned(8)));
+
+/**
+ * struct camss_params_gamma - per-channel gamma correction curves
+ *
+ * Implements the CLC_GLUT pipeline module, applied in the RGB domain.  It
+ * holds one independent lookup table per colour channel. Each table is a
+ * direct (not segmented) map of input level to output level.
+ *
+ * Each table has @CAMSS_GAMMA_LUT_SIZE (256) entries of 16-bit unsigned
+ * output. The number of significant output bits follows the width of the
+ * engine's internal bus; the upper bits are ignored by the hardware.
+ *
+ * The module maps a 12-bit input to an 8-bit output: the top 8 input bits
+ * index the table and the low 4 bits are used to linearly interpolate
+ * between adjacent entries. Entry i therefore represents the output for
+ * input level i/255 of full scale.
+ * Output range: 0x00 = black, 0xFF = white.
+ *
+ * How to fill a curve (same on all three channels for pure luminance
+ * gamma; different curves per channel additionally shift colour balance):
+ *
+ *   Identity (pass-through, gamma 1.0):
+ *     lut[i] = i;                                // i = 0..255
+ *
+ *   Encode with gamma g (e.g. sRGB-like, g = 2.2):
+ *     lut[i] = round(pow(i / 255.0, 1.0 / g) * 255.0);
+ *
+ * @header:  block header; @header.type = CAMSS_PARAMS_GAMMA
+ * @glut:    green channel gamma curve
+ * @blut:    blue  channel gamma curve
+ * @rlut:    red   channel gamma curve
+ */
+struct camss_params_gamma {
+	struct v4l2_isp_block_header header;
+	__u16 glut[CAMSS_GAMMA_LUT_SIZE];
+	__u16 blut[CAMSS_GAMMA_LUT_SIZE];
+	__u16 rlut[CAMSS_GAMMA_LUT_SIZE];
+} __attribute__((aligned(8)));
+
+#define CAMSS_PARAMS_OPE_MAX_PAYLOAD		\
+	(sizeof(struct camss_params_wb_gain)	+\
+	 sizeof(struct camss_params_chroma_enhan)	+\
+	 sizeof(struct camss_params_color_correct)	+\
+	 sizeof(struct camss_params_gamma))
+
+#endif /* _UAPI_LINUX_QCOM_CAMSS_CONFIG_H */

-- 
2.34.1

