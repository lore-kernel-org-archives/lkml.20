Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA90947F3C1
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363727; cv=none; b=B3Xw/iTnGem6hjbs2lJ57951fL343QV6xp6/0qsQLts4Jv44kL5vy2IBGtEo9tKC8bCJZLF68lk/dA3P2EmcEDyFBAUQZ59fWiMUZGKMbKq4hDQeYINEYw3SZS2jBjmGglOtgu6EZKxnUFVAEYGsgDOzwFmVoxWdC9FB3saaC04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363727; c=relaxed/simple;
	bh=7ig8RKzME4Tg23U2NT0cmp9t9Bqv3O5xWJzNztTvKZg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RGXgWsbfoWaEiqXxQNSixCvX6rgJ9figjZxrGZ6j2HEVS0v0c+CA1NmSSjxiyNNCcv/AXBWDvfHUWOotdIv8TlAF9p1cD2Kr48LvJ48DENVljUn+LWghzZKoEHXmFhbaQNajpXhEurrmUk6M3hi++S22ILIW9L4NdfLPWj3rupk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ekexX+I3 reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ekexX+I3"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jdbu3194029
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 09:01:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UoErLMLnc44
	hB2Tr7ICKukvAM52COTfpqVXrz+zrfqE=; b=ekexX+I3YysZfBBk6zOG1uO8NJz
	iPI1H54t6JdM4dFwlDaQALHvTbzL9tEahcrJg3mAapNZYCThy5JbeoYqMZnVugIw
	SYIyA2Rw/3ynzO02VbsA5TXb+U+kjrYA/XTyL8N00PWdMqTnX1f5/iavqHuyHKZY
	RvGvpJ0F1IMgk6ExmtGsos8BEZqBxvVfjmAZwBylL0ZEE+xePYFtAHh8w9fta6tC
	kuz8S/Pz+pTUMBRKC9Ir/xIPsOPZ0IxSIIN//LQuhwGLG2B0exeBhRQRdZ57TZId
	EH2jRHJLdE6gIjjdopXXX0/acO/RErA66Kec/7eGqjysRv72XBaj3+9tGUg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h541ukgxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:01:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cbf2fd504so720679985a.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:01:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363695; x=1791968495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UoErLMLnc44hB2Tr7ICKukvAM52COTfpqVXrz+zrfqE=;
        b=YwV/t+MBJL1PbwUHQF/KL5hupmTXCQbhmfihZbVUvnFjXognDgDn8MzhghN/OcOpqa
         VnFB8+rKwu/FVC83FB+h9thtb1Rnyk5DF+7sh0QF8WQR6jF0LNekpwav39HwT0DnngnQ
         S8PM6npY4TnyB3EBWH5cxPc6hkoH9dngO9mvpX5mnwZ/F1LQ6/udTqWOTvy0ZriR5vKY
         nMPEI/Gc0+ciiDJkEVCThfckZKxVVs14fsmFLpoQpM+YExSAeHNgQDbOh1qgtXLlXsno
         8qVMYnQg6kaiO6DxsEwI1rxjzDQw1s/C5yoePnyvQa43RLZI/v7EygL7nqNsAq7I+ZYS
         1JDw==
X-Forwarded-Encrypted: i=1; AKwUvBxMGfe35B9UppG2W1jAfBz6zl3Ztiyp1KmJvBWzTwhXY8l4hxREkE/OvALRrQsGKdH8QvKYps3OrWWC/Pk=@vger.kernel.org
X-Gm-Message-State: AFuF++mIX0BQhb8bWtJ88q98WDepRFIIoeNpQVqtYlc/aYnTUe8dh9ks
	WIWxjwdjGJFfdHnPB4QVMyPufwGI6agLmZvCXJ37ikcIjyejB15CRzkUxesWndWEtB6diaHQsZI
	oGPV5UhwBW1Z0Jy/shGrfNLDWGAdnJUf+ru8rbEOpi3w1NQ+mhbtLXw/hD4QYBe7Goic=
X-Gm-Gg: AYBFou11y5wFTTgHvBUCgLIAdHLD1iBCA0HS+OP7fqRkwl9ZV15zfCqBj3+hk0kvqp+
	Ah47suH9DQGUmZhtH1YEc67dCzP24+GqLQjvyAR0JT/uIMon3K09YV72co2kKXCrhI2aulYfcFq
	NsFkX2rxKcf/Awi3bt44oHG8lvo62DJINLkVZFj28SxC+E1xfwDsyWBQ98p1wn9ZJGeeycwPBvp
	84nhhDU2856SpIXLH0X7Z7bm2rzdPF/+/le65joQ5IiRQHAlg3xZGhLV8BEQIEuPV4mNWwAnLx4
	woY5u1R9erYym7QzlzkqACJkg/VN1tdsZNxhfVG2CxI0o93dCR81qRWFowM=
X-Received: by 2002:a05:620a:404e:b0:93b:d7ed:ff66 with SMTP id af79cd13be357-93e9b835e0cmr317185785a.58.1791363695170;
        Wed, 07 Oct 2026 02:01:35 -0700 (PDT)
X-Received: by 2002:a05:620a:404e:b0:93b:d7ed:ff66 with SMTP id af79cd13be357-93e9b835e0cmr317178585a.58.1791363694627;
        Wed, 07 Oct 2026 02:01:34 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:01:33 -0700 (PDT)
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
Subject: [PATCH RESEND 13/45] media: qcom: camss: video: use helpers for line-based formats
Date: Wed,  7 Oct 2026 12:00:09 +0300
Message-Id: <20261007090041.3732717-14-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-GUID: AqEiqWEs-9Vyf9o2PNHsjDx2hJ28loRy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX1Xg+AQokudPi
 lOHhqSNJPczhmyA+1g2+BUXbVS0stK6N3dyLkxsuZRhsUqv0XIKwJOE3wVLp/LYrGEKrVEoj7Cm
 sfQV3WDG5aYpqMu+6FOuIu2ZzZH81jM=
X-Authority-Analysis: v=2.4 cv=XZYcX455 c=1 sm=1 tr=0 ts=6ac60a6f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=qbJzVsoXupL-68DMvHcA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX39NMVIIUR/zB
 FUvcGLz198cubLxPjV7So/XVgkywyCXOJF0rK/1DBZKrAjB3KbJS0jdjsfl2r0qfZxXf6s61Fvz
 foVTTefmIlAocj8OKn8//uxsjg1lV+noU0MyCbLcZvbaHu/ga7ayjzBtsHdMMREy+G3bFEXEcdy
 skq+u1EY08XpyceeiwBAzKmoZ1JDd1Q27qKqnXJH0EPTux0EvB++vRIQ0oBeXKMhP0kAUozxP3k
 H0Cg2AshzoORRgUm+AoIWpU5AwGR1Luj9IuRu6BmgwF296Jf0eFXWX95v8GFZGDrndEBQffZZL/
 X7Ax938c494394+H3JVisTBd638DFGWKgdsZO1jBImOIwE8NRwubDNBucCOaPaiRqx4ecnPb7bi
 T31O6wgIaQ9TcVxAzLc4TTbQU+WPwnrKzOSIdUufKFN++rYz1lX+UXsz0poYZhCWAgUX22unr4i
 moKvByO+12L0yhEPyJg==
X-Proofpoint-ORIG-GUID: AqEiqWEs-9Vyf9o2PNHsjDx2hJ28loRy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Use the V4L2 format helpers to calculate line-based plane sizes from
the selected format.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-video.c   | 76 +++++++++++--------
 1 file changed, 44 insertions(+), 32 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index c570d7f9258c..803e5ce9b9fd 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -7,7 +7,9 @@
  * Copyright (c) 2013-2015, The Linux Foundation. All rights reserved.
  * Copyright (C) 2015-2018 Linaro Ltd.
  */
+#include <linux/align.h>
 #include <linux/slab.h>
+
 #include <media/media-entity.h>
 #include <media/v4l2-dev.h>
 #include <media/v4l2-device.h>
@@ -513,29 +515,59 @@ static int video_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
 	return 0;
 }
 
+static int video_try_line_based(struct camss_video *video, struct v4l2_format *f)
+{
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+	const struct v4l2_format_info *info;
+	unsigned int i;
+	u32 alignment = video->bpl_alignment ?: 1;
+
+	for (i = 0; i < video->nformats; i++) {
+		if (pix_mp->pixelformat == video->formats[i].pixelformat)
+			break;
+	}
+
+	if (i == video->nformats)
+		pix_mp->pixelformat = video->formats[0].pixelformat;
+
+	info = v4l2_format_info(pix_mp->pixelformat);
+	if (!info) {
+		dev_err(video->camss->dev, "No V4L2 info for requested format\n");
+		return -EINVAL;
+	}
+
+	pix_mp->width = clamp_t(u32, pix_mp->width, 1, CAMSS_FRAME_MAX_WIDTH);
+	pix_mp->height = clamp_t(u32, pix_mp->height, 1, CAMSS_FRAME_MAX_HEIGHT_PIX);
+
+	pix_mp->width = max_t(u32, round_down(pix_mp->width, info->hdiv), info->hdiv);
+	pix_mp->height = max_t(u32, round_down(pix_mp->height, info->vdiv), info->vdiv);
+
+	pix_mp->field = V4L2_FIELD_NONE;
+	pix_mp->colorspace = V4L2_COLORSPACE_SRGB;
+	pix_mp->flags = 0;
+	pix_mp->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(pix_mp->colorspace);
+	pix_mp->quantization =
+		V4L2_MAP_QUANTIZATION_DEFAULT(true, pix_mp->colorspace,
+					      pix_mp->ycbcr_enc);
+	pix_mp->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(pix_mp->colorspace);
+
+	return v4l2_fill_pixfmt_mp_aligned(pix_mp, pix_mp->pixelformat,
+					   pix_mp->width, pix_mp->height, alignment);
+}
+
 static int __video_try_fmt(struct camss_video *video, struct v4l2_format *f)
 {
 	unsigned int alignment = video->bpl_alignment;
 	struct v4l2_pix_format_mplane *pix_mp;
 	const struct camss_format_info *fi;
-	struct v4l2_plane_pix_format *p;
-	u32 bytesperline[3] = { 0 };
-	u32 sizeimage[3] = { 0 };
 	u32 width, height;
-	u32 bpl, lines;
+	u32 bpl;
 	int i, j;
 
 	pix_mp = &f->fmt.pix_mp;
 
 	if (video->line_based)
-		for (i = 0; i < pix_mp->num_planes && i < 3; i++) {
-			p = &pix_mp->plane_fmt[i];
-			bytesperline[i] = clamp_t(u32, p->bytesperline,
-						  1, 65528);
-			sizeimage[i] = clamp_t(u32, p->sizeimage,
-					       bytesperline[i],
-					       bytesperline[i] * CAMSS_FRAME_MAX_HEIGHT_PIX);
-		}
+		return video_try_line_based(video, f);
 
 	for (j = 0; j < video->nformats; j++)
 		if (pix_mp->pixelformat == video->formats[j].pixelformat)
@@ -574,26 +606,6 @@ static int __video_try_fmt(struct camss_video *video, struct v4l2_format *f)
 					pix_mp->colorspace, pix_mp->ycbcr_enc);
 	pix_mp->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(pix_mp->colorspace);
 
-	if (video->line_based)
-		for (i = 0; i < pix_mp->num_planes; i++) {
-			p = &pix_mp->plane_fmt[i];
-			p->bytesperline = clamp_t(u32, p->bytesperline,
-						  1, 65528);
-			p->sizeimage = clamp_t(u32, p->sizeimage,
-					       p->bytesperline,
-					       p->bytesperline * CAMSS_FRAME_MAX_HEIGHT_PIX);
-			lines = p->sizeimage / p->bytesperline;
-
-			if (p->bytesperline < bytesperline[i])
-				p->bytesperline = roundup(bytesperline[i], alignment);
-
-			if (p->sizeimage < p->bytesperline * lines)
-				p->sizeimage = p->bytesperline * lines;
-
-			if (p->sizeimage < sizeimage[i])
-				p->sizeimage = sizeimage[i];
-		}
-
 	return 0;
 }
 
-- 
2.34.1

