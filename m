Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1933C10A0
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326559; cv=none; b=Lgy7EREOVPx8ztPtET7WVUfp7+FMv6bsHlWYyDSRIgI6ZBPnHv0aE+Fh1rpbksYqb4Q0B9ebyc1x/bP/WMhIrQxnLO2uQIS/xEhq7YpnvnFjZT/HLkBYpgnbi81vSHQfrziJNgkfoBhLdzlaoMBjBGgulNsWi6BIht6tTFgA4z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326559; c=relaxed/simple;
	bh=6Y6z1JDeisJ2Nl0/RT2ILCUl8kE590RGswDtsPSxnfQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=URSbfqK9oGY5TuIXHyHePju7DgcNIn6z6Y6R+nTylABz3MWSNVdyb+4yCunTbaS/3aVowG4pzTdiCt1yVN0rFDGyplhj9HicD5Pk+kAwB7VTR61Y6iRYvU5DAyz/eDjF9XukdbkcvHdxe2h6AQUVTltf97WHkCORFOaP1jYT5xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W2WnmFp1 reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W2WnmFp1"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeWQv2514042
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 22:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1Wprkf4GoAH
	etdPZnQoqyiufpWRYQl51t90Ivzv6Nlo=; b=W2WnmFp1+YgurQ8kboiFg9FU4i3
	8iqkplJpJA7iEBUx0vE1wU07wg1Ookj4BQcTFNtQc/OVitijwdyFDMMjxcZj9tnd
	RGuN0PAcocoXSzCxxR6aCe5IvrQ9Uh0BVOWAbblniuw/h+eTxBxA0pCIh//GXEg3
	cbmWGGee/2ykEfOeTZWiyXIzfp0tELIzYGZEP124wo9iYrZvKO7vUX6cbltuLGxl
	wmXTUCFONRXKiMbCHwhSBJmKYSUqpFF91+amV5ert0H4kAyX86DAVXX/SglRaZhB
	2ysMsOUutn7sfWLNdY56DYruPPqbfE2QrBu98jdLFHCPC3VN4WPXoD1k0eA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xwwtwc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:41:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93dea1b6c89so555147485a.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:41:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326472; x=1791931272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Wprkf4GoAHetdPZnQoqyiufpWRYQl51t90Ivzv6Nlo=;
        b=Pp5WgPeXw8NxOHBofWbMYKrV3iP1Bbc5KnJNKOerRnTQYR8uIGrMnr69pGQrAjvamD
         BIWy9hlEuvvgyRGAXACRMp+PDQO42bioqPXuzMdyG26usXtN5NgNkJyggxRgIlzoK16m
         yF70eqDNmoiVpbt0ixRA9tjacKh/S2rlNuA154CRpV9eTX+6kSYLGvu0sCuDU/EcMgYT
         4J7TwIIlxW3OGUUP5h3XgWSj2Fdc858q3Xs8bEXwY3LDV4AvjBZPIEZXmnqdYvPNxlAC
         H/u6A4wi5nCZkcaiOPnnJjhECFE5Ge0ZTkjzPkJ/p+t8oBYo2WL+Fthwm6uAwA3Ogb06
         sJHg==
X-Forwarded-Encrypted: i=1; AKwUvBxiEEmpjrfqML4PyZ/C356p+jx4ePz7vcmbGUugDRQeRBqXmDjTCGd+68mYe68fuzp/AlxWvsXdTFJKie0=@vger.kernel.org
X-Gm-Message-State: AFuF++kBx2xuHzIRyJXuyydp83gPTfINqdCzhkD12WSF2lvHSJMiwS20
	B8vR53PryO7Z+lyjvpXKvivZHy5U4VlySSMfwW3X3kZURyPzj0dvXEZMwfJ7ZzjqgNgRryThKHH
	UjvdUqlGrAgcH0by4teSufX19jE+QUlvv8kNwXB2xwY3g71auWsGwQzR2ewxpO5JGZ5Q=
X-Gm-Gg: AYBFou2y/Cz8mbB8nEChfEMIkWS6AbdNi1YNT3/n7Wgzhfu/LFjeGwEVBSlxeSxFILF
	LoS1jAxoRTSBPDJKEQ0d5KQQFkf//suVkYrg5KoSC+TmBMLPB0ResBcWZJUMIc+5SlbFcdB4o63
	3mrH9RwnvIfswQoLZ/3Azst0lZoHpzKyYhZODWQakTBAmBs8E05yXzqEMePepPX++Fng1SwXGfE
	GafEqsaKiR/5JJXih9JkqyX9atOmKMxK3gbozjgFK6xargHvdFrUAcAIgPZRhSnSHB0ts/rX0MY
	kF23jKK4OgZPMq406fO4ZZFJ0tUe+z4asCnlH7ScYXNbbxRL46EwUp7VDKo=
X-Received: by 2002:a05:620a:271e:b0:93e:9809:336a with SMTP id af79cd13be357-93e9b856ecdmr80447585a.75.1791326472053;
        Tue, 06 Oct 2026 15:41:12 -0700 (PDT)
X-Received: by 2002:a05:620a:271e:b0:93e:9809:336a with SMTP id af79cd13be357-93e9b856ecdmr80441485a.75.1791326471534;
        Tue, 06 Oct 2026 15:41:11 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:10 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
Subject: [PATCH 24/45] media: v4l2: add Qualcomm IFE parameters format
Date: Wed,  7 Oct 2026 01:39:32 +0300
Message-Id: <20261006223953.3382273-25-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX5EhIbliMquln
 gi2LBU/sRGV1I6l/Jf1rHQVPFBUtdsZmxcK6DYSwq7AQnhs19t/JPMOsbJ/7Xo9h/RGbyFz5TcN
 ESKRR/PVEUT310Qhgm+8V8yfbjcx5/WvY166S1K3BX5m5hTYNtcyVyp+SL6Q3Sf74wQeElelJv/
 s9I2FgRjLGK7iyhjEoQi1jzx6AbwHc79TrmradWJfmmO2FqKu3ElBcodGVU7e/qhnEKgADy3+Uu
 nNCe7fH8aEE0npgvMzJofUjhHD8FYdo5Sb9l2oBEx4GyY0F+mqQt+bJeWumYgc1g1jNJxlhoJue
 2T1RKzd7e+scpdwofHbiCmiX/U8ZBc/QB3+f9wzD0H/6yjO6D6IaW+ss+3e2gjRgRM2zxof+fEn
 fMde21hqKn4ir3F9Dtl0vaEedbINCSXUc/dT90N/2YNydnnrQq3Mvmk1TrUBJiUTvSJR4288A3x
 T0EhpCw4lrkouSKJzKA==
X-Proofpoint-ORIG-GUID: i1SscDgB3Bi0m5ph3P33CkoBuaftgTNk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfXxenzCmmty/MR
 9VqFZtVeloTpG9Obj6tSP8JkCWe44N7jsV62gZK5xK34n3ABA6gH5FQGNGdEcphK12s+27anuLt
 nVbgJhOACOYVhlGsNJjs3J0Y80SIr+U=
X-Proofpoint-GUID: i1SscDgB3Bi0m5ph3P33CkoBuaftgTNk
X-Authority-Analysis: v=2.4 cv=SJXXx+vH c=1 sm=1 tr=0 ts=6ac57908 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=1ys7_V7Nn-5Y8TJEc3AA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060090

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Describe Qualcomm IFE parameter buffers with the QCF0 metadata format.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 3 +++
 include/uapi/linux/videodev2.h       | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index b7173a258225..581ed9d74b82 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1470,6 +1470,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_QC_IFE_STAT_3A:
 		descr = "Qualcomm IFE 3A Statistics";
 		break;
+	case V4L2_META_FMT_QC_IFE_PARAMS:
+		descr = "Qualcomm IFE Parameters";
+		break;
 	case V4L2_META_FMT_C3ISP_PARAMS:	descr = "Amlogic C3 ISP Parameters"; break;
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 4a0748b60a15..52ad260e65c8 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -878,6 +878,7 @@ struct v4l2_pix_format {
 
 /* Vendor specific - used for Qualcomm IFE camera sub-system */
 #define V4L2_META_FMT_QC_IFE_STAT_3A	v4l2_fourcc('Q', 'C', 'F', '1') /* IFE 3A Statistics */
+#define V4L2_META_FMT_QC_IFE_PARAMS	v4l2_fourcc('Q', 'C', 'F', '0') /* IFE 3A Parameters */
 
 /* Vendor specific - used for C3_ISP */
 #define V4L2_META_FMT_C3ISP_PARAMS	v4l2_fourcc('C', '3', 'P', 'M') /* Amlogic C3 ISP Parameters */
-- 
2.34.1

