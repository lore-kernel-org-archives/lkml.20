Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6152B39C63D
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326426; cv=none; b=UJVBDvJ4lXSg5vMfcKavX9Y96b9SM2mRx68v643zvA59+6N1+O4nLZ8y7Dh0xcnMzumKzBoOgbzLafdIaoOv3U5uyd/n5k4S/W7gYVZGSDQRy1Xa4Pi32nONSUF4qWlrIlCdwQmbClouvv4LslHVR/zzjDkrbwNf9/GMbw06O8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326426; c=relaxed/simple;
	bh=DPgKLvB2PNcWdmQvkIzprusFWSgbJAmy+ICrqd4Fj+0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r9fLltnjZjG4MO5YsWCy42tyQ+ySvMmuRICWwe7R9muQat6KQ1QB3luA3ettp54vb0dSEViyonP75fpnCpSB5YX5luB3nRDALWJUMThuT4ZbHDBXlJwiHANSnby6YNAXFuOPe/B+GGCVKQ55iE0ZAa4tWfXhqLiMb5rrXZ2EiSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CRcSSKz6 reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CRcSSKz6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeSWb3050194
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 22:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XU1FwuBtbti
	AGCfwU3DbkpmUGr7mhTNOJFzOVECWXN8=; b=CRcSSKz6Pqy58Lp3Vj/L9fQVdUq
	EP7/yunVuNbUiVLU15CY32lmeulKu4ri8uVgOwb+Mmt145c714bjvGrVASV2Xjy7
	s9MMILeVVl9tbLGXtmVG52D1lWx7gA6DcweLW7tx6unn7/OQ5BucGFfWDgT4vUs2
	MsBYXzy5Kl5bKFzesYVm5mEB+QTTXJdE0TaQ0C2hY7HOug5UVFKvObhrwRQ5QJNN
	tut3zyAQ+0CghyXtfvKI95Ejxm5sAI3BVY2tM+ABnyV4NeEgtcJsag/G6rQmKxVa
	IHvUYrHQPLe/qciIrPg57u6a3d8vLhooiBn4SBXqmRrB9c8qKzjVZe9mENA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xc5317c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:40:21 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91961d4b31bso64508996d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:40:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326420; x=1791931220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XU1FwuBtbtiAGCfwU3DbkpmUGr7mhTNOJFzOVECWXN8=;
        b=gjf6Li2dqjLL8iD8PJJeW9m2ovsmlaOHq4vpo5fuuuwt2sj9hJPiSJ40Bdo0tx7Lrv
         jLCRKt/GkLNYkoP6/w1QuFFMkpDm5vhKd8xee80WqAyI1TxSkYbbfu00RxAivLVzB4ZJ
         gQtGxR0ym/FQTDQZp/lbMuYZLEW92l6sNZ40h/+QZYM8fHd8ZfOhyI/YaVt4rsmZGgXI
         vNNDSDiyBUvprONbTt6961PHzNXO09PxEt9sMAdfalMirnnGW+JHVsCOReOLULhRxVaW
         gASRUkF95MN1ILBDjvRd56tlk8jOsSLoA+Knq04FeudZH12E8+h0/bsVlSoDQSHXK6eC
         Fnjg==
X-Forwarded-Encrypted: i=1; AKwUvBzb0v5owgItt+R7FviVVESURY8WU8Rn6DLjZ/SKH65KlhjWlWD6vqwR2xDbZn5BR5LK9PGNarsks5KDjeY=@vger.kernel.org
X-Gm-Message-State: AFuF++nFJJSzuTqXCRVr0gyd+dykOnrmg8NoS/BbNDwvbbghMLOUSiAP
	Z0UVSJvZGGziJCyqAGpoTyCzTCtbmuu0qoueqaRioLowodwEJYdF9M35JOf9DYU/zODwbzuuaMj
	S5opzbuTe8yLOvGB+dGn4yKgjyHg2ROJyMzCfvYlJAwlm7xXQFm5Xdpxhx6GLa+afRrs=
X-Gm-Gg: AYBFou1Lh/II7WcCJ+af0XVFmgh5KDyB5Ca6WmoPDMHYO/q2ec2W02pI1K71puanGkk
	scaovspFEAvoP4NXUYYAKb8hHSFX5cy1sezmmAMUMUkL7IoszkYvquhlq2aRRigS5WsHUqhYT4y
	3XNEe9e2pmepwWLleQGWjnxGmp68NvwktPSZqwG28OS+4UXPSMyx5iC4r/cquJv+kbmEJ0YXjFF
	LBwrOM+UL4HI90rp8hzfeM/Vfxjr4gJZMS6eFBNZ6qY8EvKjOW4zaNweSo3oCXhCuxCZO0qz7Y0
	czoaTcJjyJLQu1idAoPS2uwEsdvpu0H0Hf4tG7SwTaTTcPiHnB5Nl/5toXY=
X-Received: by 2002:a05:620a:4550:b0:93a:2d15:f84 with SMTP id af79cd13be357-93e9b7cc40amr75369885a.33.1791326420155;
        Tue, 06 Oct 2026 15:40:20 -0700 (PDT)
X-Received: by 2002:a05:620a:4550:b0:93a:2d15:f84 with SMTP id af79cd13be357-93e9b7cc40amr75365185a.33.1791326419732;
        Tue, 06 Oct 2026 15:40:19 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:40:18 -0700 (PDT)
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
Subject: [PATCH 03/45] media: qcom: camss: report probe failures
Date: Wed,  7 Oct 2026 01:39:11 +0300
Message-Id: <20261006223953.3382273-4-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=X5THu2Te c=1 sm=1 tr=0 ts=6ac578d5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=_ke9eFR7E5bWC9if0q4A:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfXzoYapckY6VDF
 LPeIVkFdA+FRNls682/bXc8VvoO1bAnHDxjRIpFkgdzsb5/V4cyK22GxBdXNvJALSvL1VQdJIf0
 qt1OqiiPDFQFX6Trour+X4N/C0Zjs+E=
X-Proofpoint-GUID: EqZPDVK0RJaBhsaEJY-HCrpu3ezYS6rM
X-Proofpoint-ORIG-GUID: EqZPDVK0RJaBhsaEJY-HCrpu3ezYS6rM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX84dm/S3fySAA
 CukJ79j0xawO5cXWBMa81GLwRTeGDi5nsdvMwSJXMmXOJWBlNVDACDhx9ZfANZ30Rpk2PD+rrCo
 nvBU6AMUl5VSAE7hbzLcUCd6k0K4B2Um2ktYvz/7Ue4F2+UMMia4+rNKo9HNfkRO0B+xnVyTdkG
 L97/88tbyg0qQZd4mXPMa+TC0evKYO0nuGYzz7CgiLOVfePrvRayHQ3cldovMgw2S8NrGpkKI+d
 C3rjZ3K4inUgXzEXGqPJcPpJLgXgoxaaAp10YfCr2/wt/8bOCfxWStyZQsquYEex96tmBfAbUQM
 rIbB3ZMKEzSLg5UpTnlyxk/Tz6fp75qf3BKxSCPmdnC2rbsISjJry0m2dYyg04yhALkG4Lmlt8p
 ddyQH0fuQwAlvElLpRUzjJzA2+vKfY8PndOtzkQgSQBwABen7W4SgGjP+x//rQ5djUvPdKs/pGl
 Lx0xsF5wjzINxeXG2xg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060090

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Report errors returned by interconnect, DMA and firmware setup.

This makes early probe failures visible in the kernel log.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 9bfb0290395b..1f662b1caf5a 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5418,8 +5418,10 @@ static int camss_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	ret = camss_icc_get(camss);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_err(dev, "Failed to configure ICC: %d\n", ret);
 		return ret;
+	}
 
 	ret = camss_configure_pd(camss);
 	if (ret < 0) {
@@ -5432,8 +5434,10 @@ static int camss_probe(struct platform_device *pdev)
 		goto err_genpd_cleanup;
 
 	ret = dma_set_mask_and_coherent(dev, 0xffffffff);
-	if (ret)
+	if (ret) {
+		dev_err(dev, "Failed to configure DMA coherent: %d\n", ret);
 		goto err_genpd_cleanup;
+	}
 
 	camss->media_dev.dev = camss->dev;
 	strscpy(camss->media_dev.model, "Qualcomm Camera Subsystem",
@@ -5453,8 +5457,10 @@ static int camss_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 
 	ret = camss_parse_ports(camss);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_err(dev, "Failed to parse ports: %d\n", ret);
 		goto err_v4l2_device_unregister;
+	}
 
 	ret = camss_register_entities(camss);
 	if (ret < 0)
-- 
2.34.1

