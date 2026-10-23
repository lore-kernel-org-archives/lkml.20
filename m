Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769529;
	b=EzV6OwRydESpKpjtDvhUPtzViXv5OcXaIbtyFSx465koCpEIous7Wnua5jPBtEd5i8Sj
	 CzrDfeiJBXUyR8fP3bXLsrMLaTPJc4VhzT7V5VS98Ya9pzztVrk+Ry46eZufl0YPY6JZi
	 Jn0TBoeQSGOJAlvwPTcZlKKJ1kWpvBxbA4nj0im1CFG90M2i3uAgWHvanwpts1/MqWi7O
	 JxcPQyfjR+kUuehwq816VQ+rQLoeYjVDvrurSidxoJU/OzrFDxuZnDNgaWkJ/cKXCdkXe
	 Yq25/KtBW3iZukheM+2r0u6Agx61oYDCLvTd432TziQ6fsx7udRaMj0149Y59QwziEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769529;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DySIkjkLNzBjfm2iRDrOgfAGcklnPyicfzhINo2PUoU=;
	b=Sx9zL9dS3aBSMn5TYHhhzmzwK1SXUfRo5iWdNyaZ1YOWKJpsa050tvcHXmYgtmjf1lYm
	 52BP6nloi4Nupe0CMoiHlCvDUpVKdzVjnVTwlZM53QwUxXJX74uwoBLJ6lMmR8yZQIugi
	 mArcc+7oNMr0oxrQQKnPPxIWCAj6mnhqcCWulq4jkFouPu51sd96T1sRrRIdxlMR0F/Zn
	 iDYm8Qqb3W51J8AaJKP7XUl1B3ViUp9FE2KaKriHy3VOOOHXIze9tIEkxPRa8MTfsazse
	 4cDFG6LQPUImIVEwQAJjVc96O5McAtIJy9b2NxGd57jB3k8oOoShqnR58XvmWK6mADA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o3S3hmZG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="BquXG0L/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221A960A3828
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 221A960A3828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o3S3hmZG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BquXG0L/
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6AVj2974544
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:32:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DySIkjkLNzBjfm2iRDrOgfAGcklnPyicfzhINo2PUoU=; b=o3S3hmZGZz/xOtlI
	AbMn1pO+BIouwFtMYrp2W/LAJh6M/5zNGqrAu9JBHpv9DgdYup8OzzGs+HePK1R1
	+pk8Pl9RWqCbeOArSf1iWXgT4B+GerPJp566qg3NSBsZOiMotshLwCmtuRf6xD/X
	JTUielYyc4H8PwnLtPF2yKFZi1OAGTyq8ki5JKefeJStA8KXM+MaHJsF2rdMZsnG
	U1Y/RJQDPAmWpbADXc5Kyn8u07/0cGpfsGqVPlHM2dP7Yb3sCJPRp07hmthrv4OE
	sa0q/rWxrivWXiLnVuspZEh4koFLh62wwZZT2mQO+mmQ2A/WsnxI2STy9c9X4LA+
	HZYaQA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnyw4tb4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:32:08 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-990ca9607c3so644176241.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769527; x=1793374327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DySIkjkLNzBjfm2iRDrOgfAGcklnPyicfzhINo2PUoU=;
        b=BquXG0L/BtDF4sTD4kDihkXw8hDHxh6yNgfqYCKoGGYnG4Xv3VdtNFAb3SPBv3R65x
         e9XvwFPfyIqwKg9OQWUe7pS1a77IsBza67T8NV9Ih45+UiFj54cypZAX/b4xB8qvVfYQ
         Ap1MWznhG79gHd0TKR5WirsldmKvdo1NO1cV7AGu0Jd+nF00P+A0wLjFIwTY+Kr0cjHy
         f04r6XOtY90SQ8aaUEVYy5uoKaOVgxmVQvSuDnWUNHV9veOzBPx1sFk3H2FKuWBYN5D+
         E8jJ/VMmrG9dyEGP79NA5ertIOtUnxX2METGWtkKNLAED4B/4jHd8XWUZw/wvcAKzeu1
         jVJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769527; x=1793374327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DySIkjkLNzBjfm2iRDrOgfAGcklnPyicfzhINo2PUoU=;
        b=ZzTIt5faRe6Vh/9FE5gv0dwHsCCmRnwYSSNLLK/F3pzVYASsn+62EuZpigDNbFFRU5
         X9GzadGhT8J5Y8yC/G7yX5lY5M7nLH04/J+Ew6SNjW+/wuWOulw3akGnW0WEP8fDhbXj
         9WjMe/abyZxfSHcdLSHqrewgR0EhObxBK08XAITamPgs0u+jR4fdmCOirRqeQftb/XcK
         Utga/9KlSlgwHicyeCDK7htx8Or3CnOuIimQceBxJa065CSQuZwIJhDRFpdRBBR6bNkw
         nuyCuSJuxUt7GmKMHLONpWV1LhESUl2ziMCroEfAWK0zb1KLqOVbBXkqsqnBG21UJwnP
         k2mA==
X-Forwarded-Encrypted: i=1; AKwUvByRvTLNrxMGVubnu3J9rI7u5GguCOoMq3usOx1uOI/vIymIh8n9YhFb53gh3FyHPQqAZydtVoux1x37q6U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIaI3Z25uRFVuhqOwPPpIyl4QzRdioC7Tg6Bi6pcsTVaVN55AWT
	kzDvxsN6jOSDdwwD20k7y8trNXF18YS7/kHEmnEgHHRgJ+aMAILtspLWsquhj+GRho56g7DnMny
	Eev9J0dzkxNn2azAwM7gnPTfB4gLwRkpxnv35pGhWuNlZ54VZCPW868qVILq2AeW775g=
X-Gm-Gg: AYBFou2QSUTPd8r0YxS2448eCzzWhGTjtDmH1quVxpXdlmCgu5DEiheYMH36Ir+HGNM
	anO3tF1q4sEgYcmzbVy4/kQpVh3XjDdQlPeLbeQD6+/MWj50ORqL4ShbzgUnMfU1Ad+AFl4Z4Wz
	mKaDzpFopeOU49h2A33QvYnrKB8VqjGaYSSE7aAo9zZ/zrM+ba1oJcX41hEv1lMlcsXeOHl1nqA
	9eY1Xs6y1SmvcHB2B9/5RX4X9HNsaBhat+gQGHVTVY4aTTGRaKlD5Ks9qIvnIrPuRpZnyXyjiwt
	+Xyd+ywc5tWKIfEsEkSB/thEzCDxIfu/FyEs4XgR6133Wti1xK79h6dG+6YcCbWxCcUv4DqOKK3
	7tz+mHiOAOQc1qH63WOmLxTAnNHL3MSF1dhv3D1TMhAEoYG66Yu8nf+6nTNmCcRVGHvjuZKQ1FG
	frLntCgx0tfJdx
X-Received: by 2002:a05:6102:2d0d:b0:7af:fef2:8ecf with SMTP id ada2fe7eead31-7ccc328b76emr1082194137.8.1792769527401;
        Fri, 23 Oct 2026 08:32:07 -0700 (PDT)
X-Received: by 2002:a05:6102:2d0d:b0:7af:fef2:8ecf with SMTP id ada2fe7eead31-7ccc328b76emr1082167137.8.1792769526933;
        Fri, 23 Oct 2026 08:32:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb0288806sm478062e87.55.2026.10.23.08.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:32:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 18:31:28 +0300
Subject: [PATCH v2 13/14] drm/msm/mdp4: disable the vdd regulator on
 teardown
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
Message-Id: <20261023-msm-kms-destroy-fixes-v2-13-83727c122de7@oss.qualcomm.com>
References: <20261023-msm-kms-destroy-fixes-v2-0-83727c122de7@oss.qualcomm.com>
In-Reply-To: <20261023-msm-kms-destroy-fixes-v2-0-83727c122de7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1002;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ny7/Zl0/DVQbqPkZ96Ridz4UaSxsRZCEOGYlva8TgRQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq233bMA9BzPVdeqoEGTgsKKhlJ0wLn+wdbePVp
 1aNJY9MHh6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatt92wAKCRCLPIo+Aiko
 1SHpB/9DGqf99c9AycySqXMdvLfuK7hVVbU6usMJS0SzmqS8aK39KvanYnVyQED6qoGzjCchnec
 qHjrqra+WeSfVNLEiIlVvzdy/+yJnTLgGUdRbzIis8bA/OazqbcwTFW7hvbA3cuTyRkjz4iosHh
 iBbMSGc7GbKLLjYsA245H72wwUpXlIQvKh3zVo1HOcmd9Zw0zDukFlgjsxolo9kvYaO+Kgjgc0T
 5V+4t6ugzr/KbsCXaKgFnOx+u6KeCzu3FLyi1YXIjn7fcj/Lk8rv6p7wp9+dbh8xzW14dWdIXND
 nkyUaGEkubcsWA4z+LWTRw8eg9lF3FmW3DjOA0ZhA2nrwfqj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Tix5ieZ2yFF5pTBMgNt4vjwsrEqR7gBu
X-Proofpoint-ORIG-GUID: Tix5ieZ2yFF5pTBMgNt4vjwsrEqR7gBu
X-Authority-Analysis: v=2.4 cv=dphOmFg4 c=1 sm=1 tr=0 ts=6adb7df8 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=m8q_D-2G2n8EEWQKP4cA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX5f5DeUEV8dzK
 GxUUScFiP++Ee2uAAJiKinSLJKJ5UVnD3dvBMJ8bXXYqbYcifsm7QsEcGIIKWt81Bfv2Aj7T1w3
 89Y/WY8Lh1tI6GWJfk16jmXqcS3/PLQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfXw27d6FwURuPi
 Z68m47j4LBuy6/KCyjOSlXvA4i0WZxzm9nKOcqpbJoCyObf8aJaeO4lfb19ZO7ekv1DrSkbpg0I
 XlPbKvafdF6A8BdRJoWx8ktUzhkc7XizbWH+VkuucGFbfjiY5fmqID3vLUvswQSKn4vnuHq7jcT
 ddfHVjFX8Pjn+9efaWgo36xtPvV7+wThh4Y4yzkAhWG3UkDS+ZrvlQNfJuZhrd1iiNCB67Tgiva
 u9Ss4spyxdVdQ+TDyU9k8mvNDI8Da9c+ggENaUDy/qy/GBZ5qA2ehlRLr5u9TrRXPU7kSWUrO27
 nHxKD6aeiYovZRWwA9R+2aVJ/jZqhuNRZvN6dvknOyi3FL8j0n2ktXQQVs6j7d3zHxHpKFPcK9o
 JlUx8y+wxX8FLuf1FzkcxRivZShM6F8PF2ZHKYfUHoZZuplEu4VVyDrtymhflh3gz5/hP4AxxdO
 1BnMQ8uEHuX5mKF4j+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230060

mdp4_kms_init() enables the optional vdd regulator, but only its error
path disables it again: unbinding the display leaves it on, and the
regulator core warns when the devm-managed exclusive handle is released
while enabled.

Disable it again in mdp4_destroy().

Fixes: c8afe684c95c ("drm/msm: basic KMS driver for snapdragon")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index b6615427cebd..58a269cae31d 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -138,6 +138,9 @@ static void mdp4_destroy(struct msm_kms *kms)
 	if (mdp4_kms->rpm_enabled)
 		pm_runtime_disable(dev);
 
+	if (mdp4_kms->vdd)
+		regulator_disable(mdp4_kms->vdd);
+
 	mdp_kms_destroy(&mdp4_kms->base);
 }
 

-- 
2.47.3

