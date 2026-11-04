Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810203;
	b=PFeJ+5d4V+RFpAEO2ZVDw0CfY7W38V3EKiU7LQC/ZWBEkZGVRGl/YrjGTdA/6MFw6IbJ
	 pohm/29rVAU/j1NLHM3vb6d1YndzR7YamyCIiVZTuDyyp9lz26X0h4q7QemL13WczgmRJ
	 SCUfpthEezy244ktWojIlj3Z9mZGyjnaLG8zXClLTJ0QdXd93uiEynZv1lL5iuWLUC9yN
	 zyf/wJmi8pt4mVqcP+nKnxdL4Ncjd5VT9hem3HsKoYVkFlChW7iqRLNIqGbPqZKR524pO
	 +ue2oXHObKHLkUMPZbpcQTm9pA36TtzHylIVP1A5YxYWkcJQ1NZMg8CMzPZZBIr0B+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810203;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ux2INFN8CyiFYeuZ7exzPWUq7g3zN6LyU1Ff8oDXkFQ=;
	b=AMqaIYT7CA8/qc87TxlIj4Me2ah8Bcn79a1jUZzdZKSJkutWCeAHuoH9aXhAugxsuyFC
	 SutUnUqKCU6mPD1//8C1L/wO9MBdDSNdS4IHj5r3ssbxOMdzAyFWByaFntyCADrI1PoKa
	 pXto36BWYi6v7Evw/Z27711blfmB5NKgb8dfPaJTvj1l5dQD5W5k6/ntcs2fs3BlIYKN8
	 7HybNgtZvr4ShlqLC53rqn22kDTlAcwFJ1BwJuJ13FbpqWsKr55F73TLXVrQ31vSmtbyx
	 6a6RX+65D1qPidQ+6KTZntwU92snjMl5wdAhszNtz5DCPYARsv6L/ffZnr/rsMik9Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WT2CMDWh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JhJWHzdd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647996083604
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 647996083604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WT2CMDWh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JhJWHzdd
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Fj77K1692382
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 16:36:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ux2INFN8CyiFYeuZ7exzPWUq7g3zN6LyU1Ff8oDXkFQ=; b=WT2CMDWhY2Op9Xyh
	IiUxdKXgoQeqXjqsxA/EomAxX0dwvRY0fyZYEQrHhtGs6x8tKgVZbQre95stg7MA
	yjaPm2n3CpdorQEaCBmXwmpY+pUZBsXQ1xhLF+GvVJZZiDK4mYW5UPSxRTqCbvkc
	ScygtmVdO8SZRqrc4f2oJG8Xoc++EzXKhJzZDoeK0Ca52IGdq18FIvuaqaxASb8U
	c4Rx6yIWT1ZYFuNHkmxP202s4pDUzIqr0zq5qxVG6EW2w7C7FMSfMdqinAUjdzFA
	/X5usHRUKG1JxXpGPMig1PU7hcggIRO8w5haRGTxnOkR/AhDl+5L6p/7LHy4o9+K
	cqREaw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6br0jkw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:36:42 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91e81083140so9795586d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793810202; x=1794415002; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ux2INFN8CyiFYeuZ7exzPWUq7g3zN6LyU1Ff8oDXkFQ=;
        b=JhJWHzddBWqzkjmyp2ATBWIejRJ0r21m3t6WS0Gz0O2uEInaPjnMRQqndGRQyG6R/g
         V0//2r8O3Najy9VECSbK9QX/lzGBjBb8x3Pe7CuPQgl4Hp5/f4dRS9RCFa/44mR+sfWh
         lXxn6JBM4CHnPKczfrYZwUf51lRcdV4YLlxoQNCADAQO9UiR3DspCow77Bj/JPiAZier
         wa93dbfV3y5xlyO0naaDumW6U/yPf/pqfxWNMevO7yYUxripIW3jdHdEVPZimVMYwY0c
         MSCxJJ8h+zzntG8KSymzD5UJw+PkZ7UqX4N73Bk0WEAlW6mdefOeOKLeFNTEYkxCp3xe
         hZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810202; x=1794415002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ux2INFN8CyiFYeuZ7exzPWUq7g3zN6LyU1Ff8oDXkFQ=;
        b=Ljaa5xZTZJNOFxqmHTSvJaPMx0MyysBawhpagJxCGAj9DMiCEHhU3Wg/1T+JEsDZxQ
         OVgAMeh2V8t4E844iqxqyFl9qX12+nFbJQXRkGmqwj8seAz0JfMVlCuDXBlUEnkDBZTE
         KCGxihdynf0iHhHnBbxj+tvqudQGe4PoJXa8bBCvmrqp88GzE2mXVNwFBitn0gQ61LJb
         +5WKayrGT7bq1eBCfHqHiIiSJvEh2yMiIy6o7v8ZA+lLKbYXEaO/wXTeY61Ikz+i1wR2
         F5yxiyimEYenv47PnEp6k039TR5UXei5jI1pnItqvFGOY1SHffWQNI30HxQztGlUqLif
         ittg==
X-Forwarded-Encrypted: i=1; AKwUvBzIQ97kFxkI8pSe866b7Xjb1pHybvIKWozXnIljR7n8SyiNcyN3aZSLV6bqe4lu2EWZ+I2HwvcYf8Wrmxs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cltFyIHvbKElmIt2SVyknwdI+h7Ry3R4VhZQyrGzKVDxEWuVp
	UHSWslpD/NBnMVglqdfG+7f5qEcFKKYFJEhqKtXcZtN5loepgeu3eHft+W3TlMFnBhj/zn8NUQr
	WleuifXmc1ajfEwES2AK9razLOi052DsNN95rpJ/GlBIvWpGvCmgZw7YBYK9QLhuvO3M=
X-Gm-Gg: AYBFou2iSYMGho0/1GXQ5qTYWsYZDosNTcS982rF//+b9yyFmaGPK5VD7Jh0QLJXuuD
	38NDcMUchybQXHY67UUclVwsSzVy/IgJ8E/fcfEGTCgCx4thV7NmD17Z49PwdpPnj74PfhVgimV
	xjDz5J6/EYeozpYG4e8eqr+l4Vai44miyp9+aoQ8N5TQfLs6bmWJ2vfT8jeR004LlnH0I1tTu24
	25IL+l8LP/yCfrx1/1KpDVcwXxHn+4AwBTgMYcWhl8NxPysO8kxHj1/26jejSSPaaE2voQ9DxL4
	R0INpcO4MqyGZbobET5EQo97WE4Inevj7QN5CvD4Uo91lNySvPTu8FAeC1dUmyrLn+RsbZlv1rm
	jZV28Mh0hjb4B3/asMapI6rrtRKaAAVpQ7EkPqXTiEGbAlLb+lYEQABugj37UbeSYgWwmeKrGZl
	8WJSEpE7H8c8g//5KPB3ggTOAQzG3wqUNfK+547SgQKtriaZ1ds+EYn91ay1GlXw==
X-Received: by 2002:a05:620a:6484:b0:93e:bbda:dd06 with SMTP id af79cd13be357-944213d6502mr2696743885a.0.1793810201631;
        Wed, 04 Nov 2026 08:36:41 -0800 (PST)
X-Received: by 2002:a05:620a:6484:b0:93e:bbda:dd06 with SMTP id af79cd13be357-944213d6502mr2696737285a.0.1793810200934;
        Wed, 04 Nov 2026 08:36:40 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc6bed64sm5267191fa.7.2026.11.04.08.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:36:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 18:36:11 +0200
Subject: [PATCH 7/7] media: qcom: iris: describe QC10C as TP10
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-ubwc-format-docs-v1-7-389044012b4e@oss.qualcomm.com>
References: <20261104-ubwc-format-docs-v1-0-389044012b4e@oss.qualcomm.com>
In-Reply-To: <20261104-ubwc-format-docs-v1-0-389044012b4e@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Bryan O'Donoghue <bod@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>, linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Robert Mader <robert.mader@collabora.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1043;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SvZh5CRN0P2j/QuhEyRL6uJjDqO3uIDgSWZSsRrj4Y0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq618J4cdRibKnf+VJdjtS1BHyTFVpV1dzNELR2
 sAszpWufteJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCautfCQAKCRCLPIo+Aiko
 1el+CACvzc2zdVgKhNCjubf5o6mOt8oT+ot2JHTQ/URq2MH+m54KiYmLnQO8taUoZ5mmLRhQCS4
 eEQFd2jgxfjAWgH9V0fKM2K3N22ASgSAERYgUzcNOgQpsj8yZviB2vJyXTnCcvEfoo6eLTpcWNV
 lUPQUDoQWJZJhMIkukDJA7hG/h0bcab+y7lXWI4g+dzEzhsgNV0HEtUvG8w4JsgVjqNCgbcGwVn
 ah2I2cNbktErN4rBGlNJKMojexlV1JetVHM4SBnMYNXGdqubKJz27mp6WJ+EJUnVGPr6vrD8vnX
 Q1HH568jwfqpcxDrkdVBw1coCUUX/FiQw561xu5hJ9IAP2YZ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2NiBTYWx0ZWRfX8ojzXLSDJmyF
 dXZl5vfV7reNoRWTVISXJIeq5wDyfUYMgUXff8+hzVJVJ4OT/ZNxiTlZiSb3ocSWIICCb7u204Z
 jXSd36xBnGTNd9hnHMg6RcdE5yqO/ZzyJniECZt6KVYuPyxgFQtnqShi1iIEZGHFNhS8D4IGn0k
 BR66FWncxTVL1rUmgt/hEozWGRsfY9Mhg2pTGhH7uiqYBLQfvqccNMiwwK+gkwv3oh/4nQ9+AIy
 hl8fFmzzu2oTFLmMefEvcY8wixEPy1gFjlc86m7nw46If6pMXX3OfVogtnUQTTn9Tha91Z/2gZX
 Kf1oV8QxC9SVtMX/koWe+xITotcr9IQgKWz4GUXwrClhhqkk4TxHrsBiy16s3U1ummMGiH5O9YW
 F/lk391qgsNKFHRG1zZ9LGoigxSuKyg9D5ZjhptyFJqzBXHvUfJABQHixlmT+6lHm2xIC+yx4l5
 MGOxaxQ+RJImKGSGjdg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2NiBTYWx0ZWRfX/ZML12VXjS8b
 w/NDuj2vJpz+0jQxjXi3XP9FS1/uINAW5OjQZTpAeZ/ytlEwT/D5g96NrkgvJ8zSoSjS8wOoOTL
 /ohcUNUdAmOhL5si0o62tPRtI6JZlZU=
X-Proofpoint-GUID: 1MB963wIWP6f2zk72YDHzX1If9B0RnLF
X-Proofpoint-ORIG-GUID: 1MB963wIWP6f2zk72YDHzX1If9B0RnLF
X-Authority-Analysis: v=2.4 cv=futJ914f c=1 sm=1 tr=0 ts=6aeb5f1a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=w2mF-G9HTFYObF59u-MA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040066

The comment describing the QC10C buffer layout calls it a compressed
P010. It is not: P010 stores each sample in 16 bits, QC10C packs three
10-bit samples in each 32-bit word, which is what the stride computed
below (width * 4 / 3) assumes. Name the format correctly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index eb8de60c1177..ec2bf2a2d953 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -266,7 +266,7 @@ static u32 iris_yuv_buffer_size_qc08c(struct iris_inst *inst)
 
 /*
  * QC10C:
- * UBWC-compressed format for P010.
+ * UBWC-compressed TP10, YUV 4:2:0 with three 10 bit samples packed in 32 bits.
  * Contains 4 planes in the following order -
  * (A) Y_Meta_Plane
  * (B) Y_UBWC_Plane

-- 
2.47.3

