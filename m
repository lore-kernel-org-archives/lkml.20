Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896934;
	b=139ZwKHIJ6SxzC7BD7TecvUp12jlcdQ9QD6DitORU9/mxmQPhm1ZULWBjOoZgqn/4mmb
	 QGnbtDJ3bJ/BMSw8wAHEWM47wVwHJmnlZf5jeuD7UJrkyE2CetIPiC+O1IdNF1mS+PSTA
	 g1akhHskuseoCTc7XJakQ2zIDSAhoepUVkedjMUmEHceXCzIHVOo67iVC5p/DlN/ZqxuK
	 6+inwLPIzl1QpmRbbekF0XmgsVyEOc0WoQ94BJySo+wKTHqtjw/UXAP6Cw6neoY2a53pH
	 836/KPKzDwxivpC977/c6itec/apTHsWY13S8/6ugpPC2MFBVuecu0K76983UBczeZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896934;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ioes65rnfp85b6fEnzRJDMNqj/Hc3qhj+ZAMKqnw94Y=;
	b=be7YolczK9h/3RXODBXjDA32hMdiwYpYy1BKDcQCOyD8JU4k2hHaxcHMocDKp4fuGdaY
	 rxXqozVuhUMZJP3mDZeV3FpXhUWe430UjbfaWx6mv+xHPaXU5cfFauHNhbE2CtFKj+kk/
	 Bzb49TzxBoEkKqx+zpvxV9EZQx2Emvcnvv37QeJqC9NrUfzkuUQxOajjkTGnqqJ5f03ox
	 niRNCC7O2AxOWxdGDiBSFC0iU4W8D0OwfTw9yQxUjbuudrl2sFKRLT4kfPJx1Pl03sgz/
	 mxu+7p+/jCqJF2o4lM2Ze/I9Uw2Ohjngbsk8yN1EdgBYzDJCxwZpWw5PfNn9dnKCNAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dkN50QIs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DNYy3sQJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18B0606EEA9
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C18B0606EEA9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dkN50QIs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DNYy3sQJ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQGcM2004538
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 16:42:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ioes65rnfp8
	5b6fEnzRJDMNqj/Hc3qhj+ZAMKqnw94Y=; b=dkN50QIs8Rqv6MLkEcYPaicy7Bj
	b3MLYjvVMoBoR2Ephi8W+2+8dYc0IDpPH/McXkw+gPGYvnuXkgOuqzrantsYat1k
	yvtVR74hDDQvTx5aZUP8hFkYXmu2mwGSxNK5biQKoANsdVbK3xHuyIlWa4SBvDX4
	R7pX/pVJiSKukgtYTAP1kC98jq/qQM7h1ngOkI9T9/Wcdsr8QFwRhIwIUIt5RZx8
	n7xWN7Smy+SkBK5e/VKVJspJ729UEubZzy1B7m+Xb3gYctjUGfpeTuw1UTNrEN3C
	q9eCNqs0Um2idqsLA1ge6yUOR86Ny/fowLP4H+KjlrM+s/qp1RLMY9AuGFQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqpd1py4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:42:13 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-89f9fdbabe1so2879997b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793896932; x=1794501732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ioes65rnfp85b6fEnzRJDMNqj/Hc3qhj+ZAMKqnw94Y=;
        b=DNYy3sQJ8r9S6flNRS0MZgTu7qd9z7KIQIcZ8Z4nlrTUVGW1REpGUpOqSMfYDq8iok
         yqK7oynj3p97jeOgtxOlx/AlfMFByyfIKy3sAZq3zKZ180PKu97IHuDf+q51mZ3b7Zsg
         TgcNQ1mxZgfu3eUtvfuIyxTHt8p7Gb1Eg9lGJXXV4HCEdsnj5jVVJ4vCxMkZ+bVTQPTQ
         cDAugLNWxiudD2qv4EzzYgCEX1ytzdtE9KLybAg5KQ5kKzVeDzaWZi2j/W2yQLwdsFA6
         aGmt8YhParoexJ54FzJyRkg/UXTQHcQVE8j/54N5685dzVGWTyy0OwTdcbTFDuJbFzWw
         gerg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793896932; x=1794501732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ioes65rnfp85b6fEnzRJDMNqj/Hc3qhj+ZAMKqnw94Y=;
        b=jKYJdEQtPzSGv/MUILX3oKls718Q3vsJG9glT7/YwOwAv5TG7lokB6GCZekc/etlaw
         Q2QTIm/VgpaZopYa+88FnHgrK5/BP8k8RnjzgrCP0MZ3vRosGfhSfag/JEKdIMGVFspC
         lokkqrSjQ5pXKvS3sGt+rK8iUvsEcFMSjfNCqbZvK+sLWG1+2RbrGTy2V2djviiO5/RF
         zJwqFTaOoHxNNkslJS8Iwa0MvOMV0uGjcu99y8PF2GVUCE55JgOP1id4sndSnkmX7Y4i
         OnnsVsF760SOO14mAZVYe+7Uc6w0gifbb3fEigmSCyJfbEzFUeAfalgginVvCbwafBx1
         pL8w==
X-Forwarded-Encrypted: i=1; AKwUvByBG1Ln+ms2zVQO8dGMiV7I3lKC9EsDUf80e4WghPZL0IHaOYORDBtfvsg1jay5cgdguiDLw7Fn4vBBhHk=@vger.kernel.org
X-Gm-Message-State: APuU4Z//kNkUI6FCpmp0JfDVs0eSKD2u4ZKvhQtWarxfgBga39B8PFB7
	SOuyQyYgaJnZv/eLehEl4XkNpIdFIrHEhqA29e8UbpBOixtLNeEDxFCTnJWxHGTpJGvYzIHKq1n
	HuwBfakbjZV3T3xfnQrQ7ssAFKXY1dgA00tST9R0WUMDARDnIlROZfnZNjXAplia9h/E=
X-Gm-Gg: AYBFou2wbDxLdd2r0GfOWGCUrvqr09dYiDU8ngnznrX9g5Lb4ZTwXyIepkaplP1+dCZ
	Y2VMmapyPl6f0i5EPALfRCvdFApWhbSCOf+6pHYuS7qH46ql84Y1mYo/oaGGPGeeiE3Y1CbVVkp
	7tm+LG2f4nN/nbs9pM0TiOVQseQLvHUPvEZtIPnJ556aIeRl7W+P/X/l4dA3ZyAilu+KhqaG2MA
	b8iHcr1tZ1sti6I8E8xYLDthJ8dcMgSjfk7EhrggIft2vSvDad0LJNGTyaRTEksuiFy+qoM3C7b
	bqLLv5lOHehOv779b1Nqt/eYF4ybRWt6piU1CHILiL5g8pp1On60dLujTr3HtoI+GCBHbfEAYzH
	P59fRjIufo/d+lymL9/Z4NfIG9S2Ph8+E69R7O1dh4E2RJGqy5uwaE2B9JRdlvV57eRKSgNBIKA
	kV2cUgYEFMRnb9J8QWck5OCE6ctmnLNonUh6v8VdW3x2s4QP2ZwwbB4JaxnpW4Tg==
X-Received: by 2002:a05:6a21:8889:b0:3e0:b71b:a8ed with SMTP id adf61e73a8af0-3ebb297fa62mr52173637.13.1793896932477;
        Thu, 05 Nov 2026 08:42:12 -0800 (PST)
X-Received: by 2002:a05:6a21:8889:b0:3e0:b71b:a8ed with SMTP id adf61e73a8af0-3ebb297fa62mr52152637.13.1793896932032;
        Thu, 05 Nov 2026 08:42:12 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09bb48410sm2289079b3a.46.2026.11.05.08.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:42:11 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 6/6] drm/msm: Inhibit IFPC for state snapshot
Date: Thu,  5 Nov 2026 08:41:53 -0800
Message-ID: <20261105164158.23263-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105164158.23263-1-robin.clark@oss.qualcomm.com>
References: <20261105164158.23263-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2NiBTYWx0ZWRfX6PKIrWpVpyrF
 Z8k9atvc+1yf8Dac9hbrOlFm6CKNYdMMERlYwqlHf0W+v2eHJQUIdGTbYVg/Bf/pcRgzgsMyhw7
 7Aen+VXjXtGNKc06oss/9TR6HkvEmEw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2NiBTYWx0ZWRfX5oAjliEiE//F
 imcRCXBVopNrqeAj72cRRLj0MDsASLegHl02mL4GgLgR7xCOPVDytkYOLHaFiP8eBeIN0/1dX9P
 Ui9Riw3MH8KTx8kjkJ5XwACe6+6IWk/FLvSoy3WJ0wDRFeOZrjkI/5ToAXPv5zo7Txq334Nl6Pg
 eVGmLwAQvXC9RVRYzxkdx9BJZ9zLAEvRCP4s9eWbXdS2WBXm+P0zWJrRx3f7Ary9GBFR7qVCTaR
 L11bHcoy+pi/znyxl+V1dmDoGTx2eodIM2Ba5fO06dqQmIL6RpneVZ5zEjEO5ZHa9XBRVw5iuS5
 NX8oJH/8Ho0vsBWp4C57LuYGS5+WuMNLB69/411I7VgYUk1WXwz6TkX5qb5mhZ0xoK7nA0IUKF7
 51Vf2pyUTRI+AiZiQuo03mAHw+HvwACbZC2Y47Q329Xg5TmyCVFAAaOVrqFnaqo7/XLoWgrFwYs
 01V9SvkdWQYmw27PAbQ==
X-Proofpoint-ORIG-GUID: 8RSQ-ZSnRmh_f9XoLcWGht_pSJfs3aQq
X-Proofpoint-GUID: 8RSQ-ZSnRmh_f9XoLcWGht_pSJfs3aQq
X-Authority-Analysis: v=2.4 cv=Y5JtIReN c=1 sm=1 tr=0 ts=6aecb1e5 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=eWlSUfSnBrBg5eVjM6UA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050066

We need the GPU to stay awake for this.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 98f67b7aab66..e6c872ed1a01 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -83,6 +83,7 @@ static int msm_gpu_open(struct inode *inode, struct file *file)
 	scoped_cond_guard (mutex_intr, return -EINTR, &gpu->lock) {
 		scoped_guard (pm_runtime_active, &gpu->pdev->dev) {
 			msm_gpu_hw_init(gpu);
+			guard(ifpc_disable)(gpu);
 			show_priv->state = gpu->funcs->gpu_state_get(gpu);
 		}
 	}
-- 
2.56.0

