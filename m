Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792529307;
	b=GQgN1IlziaVHaZwgKd17d8axx6bgbSwfjLgwwidh0pSo7J9I1u8y5l3zwmXH3k+X3+sC
	 ggLcGOPBu2WsLJPMtZ8m1HHhiTfMvi/9/uP38rfUgEXKYkFAFJ+z+NqQYzhxC70mQm1LN
	 AOOPfQ7d6SbQao8iQTwv3T6wVhnPcBccZDh8/sB0/tuAV/N/50UFss4E7TMauebqz4cjz
	 YLsbBaNem7N6SAt68S8IHMaXLQRESgwaIxNgT+3j+xyWwmSnVow1vEa8ebIB6Sl7T1BUX
	 15EklnmHqnJqpUpKC2YTDNwZKOLAnrmZBRMP0KbeQ1nagMEuFVD7oLQ5ZKtCD+2Ffrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792529307;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QK2V0ULW7LP9ugrR40QAJ25MXENJhXs4M1ySCOtIhX0=;
	b=So1ouzEmVW/1Y6RuhhxgWrsJUy95ZXoxxhkaXYMZWrEP4EmkRBdzoQ3pNGndeNcGdJDM
	 TTbU64YNGiKoXa5/BTWqOWNw0qutjdykpU82xHhIjAMRLFTXif2pdbGHd9AdprByxvggB
	 aHklTQ5oI+opk+v+lN86uPP+rknkWz6v+zcFHeYoU6XUAoa8h4tnnndSFYP3VLYl/34LA
	 3qQXknQX2V0HXyA4XyZGZ6u9l0RfnHQI0R9SJzxCgQ0lCKNBM2X4xtqq1s9ulzF2gL+Or
	 PIfYDHjvVRdJsg90gqQI5rIoYF5QK777Fyc6GXspHYyB1/UiOY11Ahq06s504jg3xgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cnE+5kp2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MyjdWglv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A302606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A302606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cnE+5kp2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MyjdWglv
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KGtWAP1375705
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QK2V0ULW7LP
	9ugrR40QAJ25MXENJhXs4M1ySCOtIhX0=; b=cnE+5kp2GlB9jWYZjlh4paoeraF
	j4etdh//n0v3cMi6jQx+qLrLTaERvglpUBh/mIkpKbcHPXtGSktQ+7kuZInamF0t
	lWBpA47PNfV3QuGrQBr6Cr/HADzXd+GcrCQlki54n9bEGjCz9wV3sLFGjbNJ10VI
	JLBbk5IpsFZw6k3trXQcAhrJUvJvMuQBwqYCWbBSVFUtnuBjitXmClDemyoVXpXz
	jB2sdjG5+vh0z47cDoqV0tq4+hd0kFTkmPn3lLWIdb1wygbOlBzpkpiFm8POxpbu
	ccLUpVe9UaBBRDOW5MHdGjCHxBv0bljs+Z7yt2YVsTCAeeac8GlYd2En0fw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd0wkj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:48:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3abfcf726dcso132856a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792529305; x=1793134105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QK2V0ULW7LP9ugrR40QAJ25MXENJhXs4M1ySCOtIhX0=;
        b=MyjdWglvpojNsu4aX4j+ZpLOGVG9luKMA7CkD5dOjWRxnwPK8uTVYgEL3UVYwr22Vs
         7pJak5N+YK1UMB4dpqvYejuSRQKEIv4fsvnUPMWFicyvGd6VhwZY/wQ73C/hHMDim9xV
         Gx00USf1oAAMTiY/LVppPjZaY9NQ6/9XS7yIOsuTlfOZ5J4b22AmJ74TY9y92L64ISnP
         X89aHlMFQR+ShQQOtAQY24rK4ooC+eFcTGv/ZLM0BND7hrwOLa/fMErgRshSYOketQgB
         K0WbbAhi9/FuMei3N1SAc/O+fN7ERoxFufl21sH4CxPHRXYCr0En1iYhbAOYU1JnDAJF
         D9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792529305; x=1793134105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QK2V0ULW7LP9ugrR40QAJ25MXENJhXs4M1ySCOtIhX0=;
        b=eZkfRRqwhmK05kMxe0YsBE1+KXQLvjqeGF+ZRZn8bu7ikPyAkOXcqeh5HIKmOQ5MQ2
         jC56a2T11z+0jL+y8SG8I1Kz/C4ZcFh9rhvwfMxVdyI57TT/cPOoMRI+uEUYd5WwQ0tV
         yVvB2onW50F0ewUuLu01jtnWPKHREDPHqT9qyxXCDNFHzGy5QNPBeVX2MTeVIvhaLoNK
         wUxM4qcpKnp55XnifBLHgB2hO6dv5CmSGIRp2xyOtKQvdE33ZOVfVhO1J8EomHruKFGu
         hgXwkT8vIPc0N3AiKb9wc+z1aoNVEEy5P2ONKwrGwzHmpDfHmxIO9N+uTfsM2DzeEIdN
         TqMA==
X-Forwarded-Encrypted: i=1; AKwUvBzxkyjuXutiUcwEvsRVxtWeaxu3Y0GZaOqKd0cHfoF2e6ZyBNqfHzHM/+lwCnlra/pvf0BznB0VuBcV7wE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLayeYWOWiTIKrOS6TOmK5WTFJc9oHLQi107jngdZx+L4p0ZXW/
	SZaDES8IIgA5QQfqZUkhs7Lfd1SMzxDDCerOCKh+ioaWooQBtNLC9dAvzDEm92uOqn5gPVw/fSr
	9ZmBadII86Ua7OTuSZDOhfgc83EZfglfMkIjB9raPWMGHG3dUcJYw4rSlQlFBO6eLAsM=
X-Gm-Gg: AYBFou3pPdsbbt+7c2o9zqxhspUDU2XCkRhP46G3psW4gwdU5Wzg8uI0UsgAgIHSEev
	x8L6h6FI/TbM4Y2TCOSbjf9sPUgSO0MZRnWzorAnCIxgfKe+qvbUQ/JJ1RUVC106BFYuDfQFcyj
	skhX5Wy7HePrNHcsNCNSeq9O027riOiPw6Zs2hrjbEjf90DdD3zaT5HQicgFX5rWQtEsElBy+iY
	AFtVFaG8qBjXEUaG4bo5LvlAD5++aWKlcGV7y7p/7y7DRc6AVeTRizlYP/mD5khIbaT+jG8bIdq
	5a4IZUsvSCdSF1hkFwMNkAC2Yj1ZIvBu4b2kVUNI8NX3/rOagMkkLTVTdiJ8V28BkiJCCJlCJYD
	dYpMV19n81IuuEOYn30k1AyWj5M3XB4XzuuCSldAUPfm6uGZq
X-Received: by 2002:a17:90b:17c5:b0:3ac:adce:60be with SMTP id 98e67ed59e1d1-3ad86f44ed6mr69641a91.21.1792529305252;
        Tue, 20 Oct 2026 13:48:25 -0700 (PDT)
X-Received: by 2002:a17:90b:17c5:b0:3ac:adce:60be with SMTP id 98e67ed59e1d1-3ad86f44ed6mr69611a91.21.1792529304739;
        Tue, 20 Oct 2026 13:48:24 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad80303302sm1045860a91.11.2026.10.20.13.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:48:24 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 12/12] drm/msm/adreno: Remove temporary __maybe_unused
Date: Tue, 20 Oct 2026 13:46:26 -0700
Message-ID: <20261020204728.28844-13-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020204728.28844-1-robin.clark@oss.qualcomm.com>
References: <20261020204728.28844-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfXx3TUXV9IlsvW
 nW5f/WGDNW9nZtTVSPoKuRH+wdsCvp51xuN0mwz/dAe8dy4CW3S3lAh+KLmUE1yBp9+lwMvW5+2
 +PUZDweajdwPhhRkhTNd5bgosobo+/SqAlJO4ZtBqcPYZdxfbL1Qacrlkj3WNwhMAF/h8HSW5SA
 UKA46F0Or30Y8tmSE6SdnCF5dW6GdZRm4VE+jGZoTcYoKOw/GhFcAbKsxEcHNo5jmsph5T2BtSW
 CEzZIZp9Le5YPipnYI9Wac9Q0DuuopYaG+6XSt7EmIK+Z+NUyhb1pdRsUucHI0t3DUDOF0rR2by
 dyy7UsotIW5fJNFg6EwCmVcm4CNfk4mpHgletA6TDsUrO/NqZJVj6cX8A6JOuGN5VkZaE9VTal/
 /jrnusISZtksf9DutdCW973rusxI1k+oUajUsVSl7CubgpQD7frqT4xyjZuRAa3do1lGxoN7BYj
 zph5E7Qp0KQHd315KlA==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad7d399 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=SI4bJWXHUBEfUJKjJlYA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 6F8hiD2rXP9uksFKD8L0UNEe67Q4ESz0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfXwUmBXHa5hNYu
 /F1z4DXKKHjJAQRIGZxKewInC4KxkGIV9PEGZ3Ae+CfoOzVWLuzLSGkVj7ykzietjgyMPv9LOn3
 +yaj1klYolNVDlvcHsUC/dHqYXA3HY0=
X-Proofpoint-GUID: 6F8hiD2rXP9uksFKD8L0UNEe67Q4ESz0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200082

Now that is unneeded.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index ed83dd927b54..3ef3ac2d86f9 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -170,7 +170,7 @@ struct adreno_protect {
 };
 
 #define DECLARE_ADRENO_PROTECT(name, __count_max)	\
-static const struct adreno_protect name __maybe_unused = {		\
+static const struct adreno_protect name = {		\
 	.regs = name ## _regs,				\
 	.count = ARRAY_SIZE(name ## _regs),		\
 	.count_max = __count_max,			\
-- 
2.56.0

