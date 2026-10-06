Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29393A16A1
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326480; cv=none; b=IbZy9+HxHHSYbMxf4WCf3b/3r3s1YQ522xRlZO5STOBlOCkVaCpzZRqF8BuJdFea+pRQvLpjaA9inrmBtWPwAmTFRvxB2aamTMtkQof0nqVIBcf0+WW3kgmbYZL+K8uQUnQADXYTSV8Vwr65RMi39bGXzGLYl28MO8+8OZwoGhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326480; c=relaxed/simple;
	bh=7ig8RKzME4Tg23U2NT0cmp9t9Bqv3O5xWJzNztTvKZg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UOQ7xIMbRivsoG6TskHxxGBjzdks0blNhqnjNpNDH3Z5QExaFV+bjXCOytoHP6ByBkgiVqrOfmUuEID4nqiX8yDbASiOO867qWVzNs04DXwg787kJJN5GBbFYHDjeAxpMzyxj5YUP61DhAnRBQcILtwNp7SNugpirpLU9Q8w+tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a63p/g5N reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a63p/g5N"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696Lh1KL1430100
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 22:40:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UoErLMLnc44
	hB2Tr7ICKukvAM52COTfpqVXrz+zrfqE=; b=a63p/g5Nz/hy4KSPJCMyGjE3Mpd
	9hTjGTMjdUUnKmTsgiJn3hZsvY9LD5hGUsnCejSVpFOGecoTlDjZjY9XJ2rBsXNY
	sTRfQZN3rFn5kMNgttHirPfwN7Qioj1jYHVIxcE2b7jTC4yqFB0cEdy/y8E4tJg4
	LJHGyZhjakO1MF1mD8gxdqNg1MkWNFEo7wo3M1OSEoYoV4kqgLmakMir1H7wnefz
	YlcmRcFOE5y5sG9LZflwzMEMp8iegCjQcy8AkayZuxM4TR0No+vMPqGjvEnfxJPg
	wdKAfpLtiE463YWrrR/HwjyWaP/blA57EEV4inbedFzikVwLZxH+u0i1xNA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xf7u16a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:40:52 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91961d4b31bso64521016d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:40:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326452; x=1791931252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UoErLMLnc44hB2Tr7ICKukvAM52COTfpqVXrz+zrfqE=;
        b=Zp0Dj+uM1SgBIrgOcE+F8IUSpPKFC39PJQXqfub9iY1ne3Hl7h2Vh5SGjNS6d9yg0z
         ONr0wJHgJzKYhC8Eequcc8a/Bs4bDu4UoCVIwdH1AVwKzY3A0TaxEuumr1SWsx4Z5eOl
         yaBpbMMn94NO3kuvxUTp5m7U4YBD7JoBnSfTVrHqVTTjVEXJsjd/1LcpVCob8OnSHL6D
         Tx9yDzpCe5mnd8OkZq+SoZ78pRc6DHq+AOAwa0wCm5l51XyIMm4NZvQBBmseYmA9Mfl5
         BkKyiTZBTrlZDzChZlMIb9WVn90PNjgMIQBMFzAm1rJUOvKVP7PCPS86G2/LORJZ47Vz
         3U0A==
X-Forwarded-Encrypted: i=1; AKwUvByTs/oT66OMOU8nLYEUp8rnRtSOwrp+tMwdNAeeRMjMhGw+3pNIJDV4kUx7gH64dgKY0IfmiGYXUGlh8Ug=@vger.kernel.org
X-Gm-Message-State: AFuF++nj7keAvaxa94XZoJ73PnEj+ju95pqVWMQ0lvVtPUeo3cnd+tQR
	IiR2cfjxqjDLTMhe07kbnMNTn4ylO67a1fytGy3bILi8IV7B0UN6IHvJmRN5R+r4gfg70abkjph
	7hvFlu1/lKH1gue23c1swOlLpnhsnvAE7Wzqpqw9RPPr6T3+4dQw+MCVgHD5OASR/BkM=
X-Gm-Gg: AYBFou2TXZsetivoOKN9jnYNPgxRrKrdhx7t1OTvh8fvg5q1ShpuzL+D8VHOordIZ+j
	8y6SibbUb1CYTNCs13h/p+TftzgdaiTT1+nxsrcLOqlEXQVuPGxWQ5QZJLrz5hUYCuZrbFqO8dN
	jTlNBmyI5TTWvuvFjGTq0W76QCAdxjyl78DbTrzdmc3+TGei4bm5pfvTbs2tkNk1GKfx2ZjtyVt
	lTRVTufKOqz3enADE+uiq1no/7Mp3x+HqtGsuceCb7bQxOh/qmoWiQVYpVTUbpRIIyxB/qb3iXa
	n/t4v+yVHwpBUjzrr7JyY/3ElhHDILmWG8C8RY2/EkG54eYB7HhzVywz3fg=
X-Received: by 2002:a05:620a:1a1d:b0:93c:63f5:eab with SMTP id af79cd13be357-93e9b7c5728mr78438485a.31.1791326451984;
        Tue, 06 Oct 2026 15:40:51 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1d:b0:93c:63f5:eab with SMTP id af79cd13be357-93e9b7c5728mr78431385a.31.1791326451329;
        Tue, 06 Oct 2026 15:40:51 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:40:50 -0700 (PDT)
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
Subject: [PATCH 15/45] media: qcom: camss: video: use helpers for line-based formats
Date: Wed,  7 Oct 2026 01:39:23 +0300
Message-Id: <20261006223953.3382273-16-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfXzDJpOrh1hB/q
 UB5u83peGCWZNfNiGON28faMPVA/1FGYziXJgqJc+QyI7bhMXx2u0xOdGgz4g0L4ooEgPAwYRuR
 Vspta2NYsVDLYa6hCOFaLBw9/9wH54w=
X-Authority-Analysis: v=2.4 cv=FpSQbGrq c=1 sm=1 tr=0 ts=6ac578f5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=qbJzVsoXupL-68DMvHcA:9
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX6QPTX48BB7A9
 xP4N1mMfUEaX2bplt32z56aQMqzeDtGQXI4/Cv05sjXRSq7+RA1sTj0/KCEmKs1ff6vNnDExbQa
 65CyD3L+NIJ2GrIffnhaqaHaaVYAPGiW2F2n+xkTpqGQA5Lk6ujIuXjW2IwqjuvQEusnWxaIW+0
 AI1rT1qHHJgBM/Ly5n9ldbhxcRsCM8DGFzPxojFbIyaAVT6Gzhw3XMNYzXN7hKrMKMeoLPTQcuX
 dQeChDYANuW14wO1pW4HdTZG9ULsOY/EGdBG8IaYYnFVL3ZrYDQzvrcQKYoTZWHWxGjYtJhdYrd
 8v1fINzYAh1/QajzGzyzPW2WSk8+JejYdpsZKFpUqqM2PV7VY4xrORFwXjzEHgWIO58eXj4HC/6
 ET0g6wDlczVFM373q6MGrTLcSQ8YoUwR3GrEjRXovOyujA9ztDypCk0f3ggO/IzNGKWDnqaslPm
 rzkaJkKB8LdSO++9rSQ==
X-Proofpoint-ORIG-GUID: UjG6j_K-IpUYG_Vjs6isgfLwwcUqdV45
X-Proofpoint-GUID: UjG6j_K-IpUYG_Vjs6isgfLwwcUqdV45
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

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

