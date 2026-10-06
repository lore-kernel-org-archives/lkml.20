Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C12390CBA
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 23:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791328216; cv=none; b=u9DqtyX3PQEjedGx+WJrKrkozEP3AEC5gHIwi5rQ4s8ifVUAUpwzV578qOo+xR0nLII2Ti8UdloulFWFBkCVtxJb1q3uTlBlnuWom7hPRpbKuhgw4Jl7etcknev31+vbvkEVolwYF2S6I+FFWI0OtUuspObSdSdJ6A0QNgfeFek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791328216; c=relaxed/simple;
	bh=2t5J73v/MouUPPv8BeanhmSwIres2KIrufqDwmaCcNk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lpbGwcQMPU4TcjKMSJrLTGpy4LTNOgUbn80+i5OYhWqoVp1QaNXVgxugfEhwgGt7G/y/kl+rnNkcnhwMhzc7U2/5Ir8qUHlfcCXQhcUSy7lJ6A/rcOooxSh04gEhfwjSmTMWCLXAbLOx7Kiqa1NPQqyQ2jbJCScudD430kZlIH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lBycZyyM reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lBycZyyM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeRWk3015262
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 22:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=S6xUJpnqHpK
	MXNveefo1cXTh1FFN6M8v+59Kiz3wW9c=; b=lBycZyyMOkLPvONYEB9pWIoIxmN
	kd34QhrxDt4qy8A3PRJWfUIbKd6tmM1ABSBSyrA927Kyg40Oy2a8wyAi6A+9tTbs
	tuNxkiZZYNI3PgZXtWLHrPM+OfGl1AImbp+Ap8iRqc7NUhlkjisIE97d5gqF2QVa
	hRdTSZj/n5vSTVg9NH4tZ5QUohduE5AtHbbRJvVkpoPlbDL4ehY3Nz428yfhqh+D
	y3YBP92YnAdiaMSZ23IdyHydrMG3ftN6Fd7QmMv/RPGHJdawu31eMWh5DM1kWklu
	KhFRHIFzbNHAwzQmf7n3MmyfVGcNgznwEKUNSeoE6Piw+PS/EqJ7ErLGzgg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4uy4kk64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:41:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93bfb2da664so764416585a.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:41:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326509; x=1791931309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S6xUJpnqHpKMXNveefo1cXTh1FFN6M8v+59Kiz3wW9c=;
        b=uCxOwGXQzEAc16lh/DtbZG4ykFYG7w0YIrMDcamRFkBUHeU2l78eKHuF/3dFdg7r0q
         DO6iVRS+x+r8kQrXrFp3hynaKgr2AZYbmAfhphjQAXcKm7NmGwOLm/PlPmzsacO6JLVl
         BTLbWn8oSXNBiHtdJkJZ2jpgQwYcATbKwSF1bYMU1TUl2FfkYIXw1hzidb5ttooJTH5C
         Hug0uXA5xFaAEob1tVsueuhaiuQI69FPO9Y1Pf8V3B/MicM0S3ndMX8we935NBberfXZ
         8M66pXXtt8Rj61hT32znWWoH6eJ8wpCQIy5f7LDRlc46yEBIMjPfSdCE3KR0M/WrSqy3
         8uuA==
X-Forwarded-Encrypted: i=1; AKwUvBw2PnpHajnpzzoC1TpnXlhD86CAfGlNBf5pmIQPLdN5M5rB1vEP/fsnVIOe2IwT8OxdOr9rfnehCKciaic=@vger.kernel.org
X-Gm-Message-State: AFuF++mJRKWCEfmd7lfbBlYrn+pMcXsQQRRMhq6KXf5DACZgKRkLnTUv
	KqD//rMnRVukV1O5RoDfcKFjUA+doDR/ZmR6rY1VNqShzZRMHUrCy87cuWu8FHFZ/lDdm7uvNyC
	YCEek0dDiPGEpzoAcZwwsGuNyUK2YNKZA+wdlnJY+4WzxcHPooMFMyHY+eOY+wSvM9OA=
X-Gm-Gg: AYBFou3xtAjiu1wWX3z5CyCOP5Z9z0gjza7R2+WlPsiU5sYEa9dlquOm1iMaSHmqAYn
	n+67rlD+geFz4sUTP1QvVMhQX8TPfvo3gE6qA610ZuBQ2RMScbEpflXKBmbkeK5SVsb+LGnrJLk
	ZQ/+o1mrg6sJf8vxya1yODGZO2EZNUxuEOq4+buhupxtMa3uvZwFVp/lEY/66Ef3GkWNTPcpg5+
	/ZYko8xl9x+DC/Ai7iK1h9f+cwZZT4Msaf+kTfYH8eebCTHs0LEM0K14HN4MMoHBb61WHAs2gV5
	cLlvrGNbxokHuYGT0nb891aawTvxvEKOS0H7ROeRqkCkFp9z8m+EPIozCBI=
X-Received: by 2002:a05:620a:6495:b0:93e:9807:9792 with SMTP id af79cd13be357-93e9b86fa54mr72258285a.83.1791326508899;
        Tue, 06 Oct 2026 15:41:48 -0700 (PDT)
X-Received: by 2002:a05:620a:6495:b0:93e:9807:9792 with SMTP id af79cd13be357-93e9b86fa54mr72251885a.83.1791326508425;
        Tue, 06 Oct 2026 15:41:48 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:47 -0700 (PDT)
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
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org,
        Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Subject: [PATCH 41/45] media: qcom: camss: create TPG links for IFE
Date: Wed,  7 Oct 2026 01:39:49 +0300
Message-Id: <20261006223953.3382273-42-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfXyDWq8prN+TF3
 TkvW48PAsoaE5H3ImAswpAbmFzKtoqTDWeXRpA9KV98xF+OdQ2z70l7qip7WT0BZJZkV7dWdZFr
 GRmi4GVFef9NSnYTjijY8RFdaf1PjxLBMTIxqLsoR9uQ6heOiXfW77dBjGCumgfIrAfIq7y3Hqv
 jAwgo0QzkqghjpmeRcEOfT+TWm/nyhvatQ+nPIfaDV9rYTJVj5tdVnruXa3hqEeD5IY/LBWvB70
 e0BKyC3hK269m3yFc4R3gnnXgy9AXQNst/1Fs+W/buGnsvd3Xo2ogXNYIv35xzBX8dB2mBMj5zL
 H3HATuV99WtmYH+awnRVTxIZvO0cvrEgd68o+Mj+Wg5E5TuzmMrmcEzoQC3nZO46ogLx70upSW3
 pEaIFL1tgVP8M/GGXAPAe1CL/xdhp52jIug8Vt2k/LfON0VVQ6aV0cN0kYQvajoIPzMXsZ7XWds
 nN3YecdWVCc8HE+0bNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX9zrixh2LY8SW
 pewRhQjHVm42q3CeCc/Lfg7rh3GRvKGeGz9vlU9UB8HaycKFAFdnBp8z2QHRUmDvaygcdbLGbqF
 qNZ5RExKI9o8wuF6yvQCNppUCld+lQI=
X-Authority-Analysis: v=2.4 cv=F97C5ahN c=1 sm=1 tr=0 ts=6ac5792d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=Edoj-RGbKjCKvmuEXRoA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: pRnwrDKXZRAgiJJYq9pnoRgUlOYIYhXs
X-Proofpoint-GUID: pRnwrDKXZRAgiJJYq9pnoRgUlOYIYhXs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>

The IFE topology uses its own entity-link callback. Create TPG-to-CSID
links there so a TPG can feed the IFE pipeline.

Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-ife.c | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-ife.c b/drivers/media/platform/qcom/camss/camss-ife.c
index e2049e00ea96..ab6102fd1126 100644
--- a/drivers/media/platform/qcom/camss/camss-ife.c
+++ b/drivers/media/platform/qcom/camss/camss-ife.c
@@ -12,6 +12,7 @@
 #include "camss.h"
 #include "camss-csid.h"
 #include "camss-ife.h"
+#include "camss-tpg.h"
 
 #define CAMSS_IFE_PREFIX "ife"
 #define CAMSS_IFE_IRQ_NAME "msm_vfe"
@@ -1574,9 +1575,28 @@ int camss_ife_subdev_init(struct camss *camss, struct ife_device *ife,
 
 int camss_ife_link_entities(struct camss *camss)
 {
-	int ife_id, csid_id;
+	int csid_id;
+	int tpg_id;
+	int ife_id;
 	int rc;
 
+	for (tpg_id = 0; tpg_id < camss->res->tpg_num; tpg_id++) {
+		for (csid_id = 0; csid_id < camss->res->csid_num; csid_id++) {
+			rc = media_create_pad_link(&camss->tpg[tpg_id].subdev.entity,
+						   MSM_TPG_PAD_SRC,
+						   &camss->csid[csid_id].subdev.entity,
+						   MSM_CSID_PAD_SINK, 0);
+			if (rc) {
+				dev_err(camss->dev,
+					"Failed to link %s->%s: %d\n",
+					camss->tpg[tpg_id].subdev.entity.name,
+					camss->csid[csid_id].subdev.entity.name,
+					rc);
+				return rc;
+			}
+		}
+	}
+
 	for (ife_id = 0; ife_id < camss->res->csiphy_num; ife_id++) {
 		for (csid_id = 0; csid_id < camss->res->csid_num; csid_id++) {
 			rc = media_create_pad_link(&camss->csiphy[ife_id].subdev.entity,
-- 
2.34.1

