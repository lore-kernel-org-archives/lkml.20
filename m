Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972694;
	b=4tWX1NMs0ZPV911kA3ofx3Cj8NOSqHH/KHVsdGick2lSXDPxWaBtuZpsm5d+rVKmT8My
	 UsSLN9Z0DbDAuRnHCuZDMPYzrFaRv2s5NmBDu7sH/7L4jfju2TfvfdRlWreT/D/hsvvOT
	 3cnDKoGv10fULEdXpC2cGzZxQrHrJ28A5KBjamEo5do7SAJ58QzCnd7BsJ82GR0eyJnFs
	 DCxLlD9D4veHi0nJDqDmOvC2CzYZ2IlSKakKbE6R7Lo6HCDUsbhYKE7R9sJ3C0fzIURTt
	 JrRRKr766wGWDl3hmY3T31U427jp/B70eAiKz7VCvmDIkHdqngjsJpdP8Ffd7f4P9Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972694;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KFMOrkADVP+8BGFWWz5DwK17BKn+/vVaPVTQ4G5cEjo=;
	b=uuvX5S+n65Ikl5pI44r4uU6OAsTp7Rw7wHti5riPYKYf21ho2sX00uPa+BqHVPRebr8D
	 ClF3EPnuoLCS5nOfUx8PHP/G/LkvJtWlXozG3tsePA1WBChmnEBaapxXUBnTXhM0O5WaD
	 dkb0nwJ6VmBpUz4nTkconQ8oGH2Kvl67nGTFO0xyh6UvL79gYHUVnj56ZBVPLZl0DllaC
	 RQR8clDpljedUz9TWXxItZ6I1ML9/ajDfA2vvGVNGwLKaZi6yyZbeKEJlhh9ns7Q0nrgM
	 TX+Zb7jhZyrL7OajparCkFn6Q6eowfH/OdvdTWAg5/TeWzGTGyQT+HYFioYyjQAQ+kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kWjrqTBg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kpCzZmLT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DE66082BCF
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:44:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26DE66082BCF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kWjrqTBg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kpCzZmLT
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APBgl444196
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 13:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KFMOrkADVP+8BGFWWz5DwK17BKn+/vVaPVTQ4G5cEjo=; b=kWjrqTBgogdaHeUL
	sEZfG7dvzXh3zIWl1p/IilIITI1lE7uLTWgz38momuwDYjDjNXzWWyCPDeSp+AOk
	lQvLWzgGYr3ZJW1UidMfrHgtGODYKv+R7WxX+Y7yqAfDuZtEk5wI8Vp8cz0bPL59
	wDP0h/W0QGeiTO9KWVskOGjQxdP8obWIhc9g2tNK+Wq91BEPCbljudWYvwPKyU9H
	kHAG6nBiVx9/oeVnBbJJsxpk2aaBn0jOmLBsjXEvkrj4uPcVE0f35UF45jELtkhh
	pxpDZKp5xFZI6aaqyvbXInPncRgbseb2YszsBVse7pPGRTnkNCYjEuy+AOOHVqhw
	UcdvFA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9u1h6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 13:44:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1f2fafeaso97037985a.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793972692; x=1794577492; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KFMOrkADVP+8BGFWWz5DwK17BKn+/vVaPVTQ4G5cEjo=;
        b=kpCzZmLTcJNB+IF4LjI039vZdAf73BhTIyGUNd+m/BAvdrP0og+G2uE0FSMK5M0lmE
         HX0utoBDaGQ40mCgC91fDlRyGGzTslVE23+MkWRPL9bwmKRwP+Vc9YOZ+SzpSEfSPCHE
         2NwGbE5lJHsA5Ij4v1oHsnf3cl9gr+ATFxMcv+qTlHk3OUfgOeYP4qXGLpWlsigKYb32
         CtwIC5ZqJGJlTsEphRw+3cP2ky5DhXcsf8YcgkX3zTpV1qJkYrYOeCRTtwAXwR+Bs0c1
         CtMycyw5LDiLqvDe3C0WPiSm5J15hV5UnN0IDE+Siaj1f+t68zTnQdb3wu1V9O+a7Ak5
         D1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793972692; x=1794577492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KFMOrkADVP+8BGFWWz5DwK17BKn+/vVaPVTQ4G5cEjo=;
        b=XK4DaMxo1bEymLhXObIZWPmJKvhd2cqXTCL+8utF790aQcfnccD6glSmJVt4u1zXDn
         oAb2oay5GEz9l8vBOm8L6YGXQGcearzcFOV7F5Ao+SzJcnQ8mstijJSkcdjX8QZuFZW2
         wQYfKrKfcG99c/x3w5GQsBHvluro1hiZAXZcAzWVw1hbbzQVroxByG7PsPTYjezGhAkg
         jaPFmQ0JE8QIKL6EbSjCAxzsnQFBcatEDmuvzrrZX/5vQ1zAT/lAh3LtK0DrB5IQ1jjl
         9illhwsZ3gfvw85VXMgr88E/RsKOEWjwpzypq66PiEhSXHGCoNngnfOJ291gw3lIUx8N
         F5hQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4gGapgJABIq0Jo0wAe3uPLdRvF95n2fhVjgN9D5F0tMzG4EZHJ5128bUe50KnxDrUZgOw6iynYkfEk7E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vVvByQOkidKJ/bOUp6VG4LjuWy1RfTLGQtVA0JR4kFcX6Err+
	qZAgOqVwWqywxBVImMgXKuYxLnRKAE4TaFaUT2bPB/bFnfs0s7LWMC4X3jcxlXAJZvW8W/h6cyj
	8/lxk4JDTr8X/zA0axQqzKNyRm7AhXqYDpFeuS6eC29CTx1sHoQze/542eupBehDozO8=
X-Gm-Gg: AYBFou3gBJBaSzFpF3dPu+f5cYGhXAuLQMqnqqxBfzg9OtwBKUIZlYwFa7jpRzaWfsI
	8yDjqq9vtZgES92lcCn6SxLBUi8mRRgYJ66jFU41MPGh6rKXWJTGVezxHDvNwrzYbmBe+6Jg3bu
	8K9DNRe8j2bx40Xsq5yioqNaO/Etd5QVCKNirei16jUlPTeCfubG1afDWYPP8LxU0Wz84IzRgSt
	El5+hZib1SPwM5h/sg72fjCTWWr5VOgyTXDGcHaE9XPXEfiDClFkK6RGT7a1Oap4D3caShxwyAc
	9/FEJenDR2O/C+ygvMQcIUyXgxIhmpUOHRtFXsyRsGQcAzCtKyz/AIZBttGxAstPOfZKPHoc/5a
	sOFoE2ytGtpTN755wS8Lw7FYh2qUn/C1ZGBnC5JIVWKKlEixpJ3Ata1VhJsKATwr+mXwvIiCKuJ
	fH4rKa/avW6hQ/PzJfotXO2I4ZAY01TyS3VYcNWXjzN2VPJPPTxAlzWliePyWXDA==
X-Received: by 2002:a05:620a:4107:b0:93e:d364:c9ee with SMTP id af79cd13be357-945f35650e8mr365626885a.74.1793972692536;
        Fri, 06 Nov 2026 05:44:52 -0800 (PST)
X-Received: by 2002:a05:620a:4107:b0:93e:d364:c9ee with SMTP id af79cd13be357-945f35650e8mr365622185a.74.1793972692010;
        Fri, 06 Nov 2026 05:44:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c003055a5csm382747e87.13.2026.11.06.05.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:44:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 15:44:14 +0200
Subject: [PATCH v2 8/8] media: qcom: iris: describe QC10C as P030 (TP10)
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
Message-Id: <20261106-ubwc-format-docs-v2-8-82949f88f030@oss.qualcomm.com>
References: <20261106-ubwc-format-docs-v2-0-82949f88f030@oss.qualcomm.com>
In-Reply-To: <20261106-ubwc-format-docs-v2-0-82949f88f030@oss.qualcomm.com>
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
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>, linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Robert Mader <robert.mader@collabora.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1055;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=iqfuEamj2XlYNE5hnAH8AT8Abj9VyJ9jbobRw0cnh4U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq7dm+CuAs9qhMdIEzhgPgtp3QrLIHoNoaQQRqo
 5AS3EfM2waJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCau3ZvgAKCRCLPIo+Aiko
 1dACB/9wA5t9MLN7WDxdbjgtqULBKGm0SpbExAmy9p6mSMbiTO8Le6urnKTjbKIOZ7ASp+GT6Xb
 9tp9oF3nSmHKUuPJVN62rnCYy/aCCQf6kQNRbs+DGOtdl2JYO5oAz2be+16k2a4HQ4jYknMmt6d
 jWUmU94ZXRhvL+VmecHbdAomLNoe0edTG1B2hGpkrdCqOjliSumqwgR3VnadosCpLd5yUZRsHfB
 QDmfQpLALm+DQiBohVvSnl3WAKBEoE/uzWuUzeQqwKaAh5ST8z5n92RMp49LL+feneDBClJ0+F3
 H6QXQd0qaxqniymZG2q+iw8NRfjarePkUshiri/P0SLz5Rtu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NCBTYWx0ZWRfX6z5Cys9tUIoz
 0aBjnPtl6GlgoQI9txwsNBPYLx5IY1ldbmRnEeHkgUxp/hAYYLAYt8AApRwNb5jD3mMGYlCBnp3
 e1CITvpoJyBTD4GmuZVNdSzR9Byb87c=
X-Proofpoint-GUID: PijG3LQiKyzOMCC41YtYHCf1Z7inHELo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NCBTYWx0ZWRfX0d8zIMtBObuo
 2EvmRTeRd9MviQs05/epgvTfxs9PtuoY8YN39mfIGuAJTNpRfCkc6s1UrvuOAENfeS+lSTOA/Pz
 mBOrrIn2QmBWf3of0P6EPJW22KDGxKU2bmrhxIgCC2sITu/T6uHM7UI9bsAyEr9hK8qtNfxdHcN
 +DfxbDBzwShHz4ImKPzh4BFXzZbR/v+0AxPrpVM+F8WkhOZH27N/8kU47e8jFpv3eK7xz+y6QP+
 dJ0Or1wy9ZQaKvnezC88MFyU4dY9WHGVg9HcQi9QEdOzehblSwUAf8yOL7bKbN0UkwobZeu8f5U
 86u9MFtcfgRSMw/91swP67kXA1WIJ67kivJwNwhUguT1DZgKxvrdyUt/lQQNATOSdgAJqyO/NXq
 aS6SGzLW3jn5JGXTFfzJROPPD6B6z924JiwUcHeBBDzn4iTGvLjFPRv9+IW0cCfO113dOwGNHiA
 /ZaM+SddNonKRKGN/bg==
X-Proofpoint-ORIG-GUID: PijG3LQiKyzOMCC41YtYHCf1Z7inHELo
X-Authority-Analysis: v=2.4 cv=ZIZCCn7b c=1 sm=1 tr=0 ts=6aedd9d5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=w2mF-G9HTFYObF59u-MA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060054

The comment describing the QC10C buffer layout calls it a compressed
P010. It is not: P010 stores each sample in 16 bits, QC10C packs three
10-bit samples in each 32-bit word, which is P030 (TP10) and what the
stride computed below (width * 4 / 3) assumes. Name the format correctly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index eb8de60c1177..19a984d2ff3b 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -266,7 +266,7 @@ static u32 iris_yuv_buffer_size_qc08c(struct iris_inst *inst)
 
 /*
  * QC10C:
- * UBWC-compressed format for P010.
+ * UBWC-compressed P030 (TP10), YUV 4:2:0, three 10 bit samples in 32 bits.
  * Contains 4 planes in the following order -
  * (A) Y_Meta_Plane
  * (B) Y_UBWC_Plane

-- 
2.47.3

