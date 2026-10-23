Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797602;
	b=Sh5ZPiiCJIy4qgRuz1+jjlRFY4+k/o0C6YljrVYJ/N4mm/8LsBAYAc1xj6Yr6P4e1bYL
	 sPf8QBRotmIG5d3WyOgPw7Z7cubZ6pkHgAG5YTmU3i6srPTYRyQQIvNeeprgOEEamioGZ
	 UxZx697UMenmofOw42CKOd+m5JD1qtdy1LxEuyNeDKJ6LTOBD3Xep14ARPhrK3BbyBrhS
	 VqX2iKd75Y2V5SbkD3w9GAgVzwL7pz0sJGJPnjEVy5jzy1lVLs6fx8GnnD/TLVYlSwrhR
	 DUw1PH0oEk2Tbm8/8z6EqjKrRigfHLxaykaky3iYl6G13pFNCUWpYvv674tD/OcB+Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797602;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+fZhaZ82V4/5KLW1sTiPxhoM8r1KKvfY9E07z+Fr920=;
	b=uXnfpG2v1dNBMeXH1fpUBzEEHMnhS9Ppzm48oNbbXLn35MEzRjj3VLei20ff/odYNghU
	 c1SHt+J45ndJppTFT3/5OMdA6c4YH8rWBU53pO4sWtoBBQ6DnNpNhqlnS1KYHMdqln+jw
	 roJ5C58cnk+FWQLhqpOrY6wEafGBRe5qsKHXsQyxzZx09a812lKGQeyso0xm4uhbzu/cp
	 GM6w6hFW9kBEDsnbX9Z3UVoQ3tH/3+dJOLdopiW9mFk+PstQVIpOtbElOeKpaM+7Y0yrQ
	 HWZntRjnhgrQbHAjgrCsw/5QwBu+1+gbN9GpmZ+nG4EbHtqZrtW9FieOhz2uxPBEunw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Aluv/iyv";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Hhb/S5+5";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A171C606A325
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A171C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Aluv/iyv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hhb/S5+5
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvAHl4006316
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+fZhaZ82V4/5KLW1sTiPxhoM8r1KKvfY9E07z+Fr920=; b=Aluv/iyvrrIKRl+1
	/5SyUn54dDWT63KmrMF9ijQNx6s2cvN/L7S1Sihz9adCoj42OovdjAwWoKjR1538
	DJvuIQ6LyvhBp0hPCouGkkhy2mJ5he0yVM24Yda67h+Ycn/VIX1h+leBnoL/1c6W
	SRqgZR9+0iDYvsBiRf5dQjgum44a9DxSK74C02icYswxvC3P0uXnHKrqtqt+QZfn
	BQcfLEM/Se0ZqWy6GRCkZW2E8PVteDSzRcJKentGOcj535F4EWpSDtM3Uy8a5AR6
	JcZfGyabaYdfGK2wWb1hv804/B8v36UfMpDWJrNnl5lfu40Z81x6LSx1OzRfZCYN
	+UR6Iw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7cn25x0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f568dee56so54682985a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797600; x=1793402400; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+fZhaZ82V4/5KLW1sTiPxhoM8r1KKvfY9E07z+Fr920=;
        b=Hhb/S5+54NlgsFJtgUaZa5w2A3wcr0n0X8dGiYiHeTFMLUuKtG0MT4s7vW7XDU6WtS
         7w/dIOZTwJmyJYnU2ppNJF08JCrHzOY8dcfrQXow4Ol9jpGIZJnz7kW3lzX9VYjaebSL
         8EjzZTep8ar7NruAaGf4lIKXu8KWeJL3fgThmc/3zxGsiKfN0arrtE2OlR7sZIRfLMAH
         RM7yfB97gijUt79ZK3e8iFh09tQubf6QopZvgVCRFpTFsRedYc137J8b7nGk26a3iTYc
         8IaD2UIubmSLMCUZBjjV0fvKOLxfHs9Xs6Y5hKZbEeoyb85aC3FJO4PpG26XfXSBVhOa
         HywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797600; x=1793402400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+fZhaZ82V4/5KLW1sTiPxhoM8r1KKvfY9E07z+Fr920=;
        b=NlqhH4F9sH3UMwnaLc0StFo+dS5/hnEWtW4iQsu9pxNNt/US/2/+4TdKz0rtlZTfzD
         uhVOZ+/qgp6A8imqE3h+b/x26zQz1uchXLGqNzQrQMCVnN53BIbcO8/UZBY51nwb3i5x
         8w+CUL8w0KQLfwLvL26xEP10Waj1eC/CTZbm0BoHLGcWVro5p+V044vRrdNAm7bb2eCS
         n3FWom0txqscBKONeWOxqqYmFY7yOY0B9w1Ka3q6W772DhhXSTAt6127nhsS5T6uI/5q
         Sxdqn8W2BukDIEXF36VlvaVnmDCbCqoEzaMzeIt+n1yFjKbMAhDz07wBNGWsAmq3efNT
         d9OA==
X-Forwarded-Encrypted: i=1; AKwUvByeAiOJVpVWZYYVHajlRG5ay0pmQYdDm0xtZ4ALDzPnAhC71Z39bc6NEwgqG46T50s1sddejW/ZZBmq2Bs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvYN55gJ7aqYHAVbCfUjSbhFpSJkBbF8FFr1sz8Oh9T8+3W4BD
	22gBmVMuQAAsSnjIl+1ARQeuIgi64NdNnCn/3HGXYvqji3RjkAhbdHdaZ/Qsy2dt9vrZGs8PK/U
	A+DUyrq6Byw/W+qztmFnoJ5TZ07B/w+bfbzOD/brlBl9covili8h2HZ1CNqUNKEk0EH0=
X-Gm-Gg: AYBFou3hCZN+RkuE9J8En7KiOr86xnmeZW1XZUP8ep19vRVtq96Uqt5AbV5xX4yYuhd
	fB+KL6ifL4f8ebZnajf7Zt2/BHsBVRV04IR1K/k3KAiN+ZUCzQ2C/xkXspIk3W4X6L1eXX5sQfi
	NLhpWancS0al9WFpgjfITJLb/WacOtlAD+kFxcuN9Hj/TiRTAswO6v4OqAjaWXE7AndY+P2xd8n
	iJA8KOYSp9uHCJkW0K1Bw9clNsMw994APmFGEK1VJfqx6A2tjAsR+/ftpFGJFnPfU+HQuZEAQm3
	HuE0GtAXSIOkVYvEJ4nO5kYy7/z4Rrd81Ht9YOx59HMHU7d7Iq3S3eW4oTUUQtwz+81f+f6eq0p
	1pZRn0ofSI2TLjcDGc84JJhrkRC4s57s951a7888nA7Ma3L/Pkp+wa7qn707HoLls9LsC9BuqkN
	E28dp66E76ES/U
X-Received: by 2002:a05:620a:4008:b0:93e:d7f0:497a with SMTP id af79cd13be357-940ef8bea57mr86709085a.16.1792797599849;
        Fri, 23 Oct 2026 16:19:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4008:b0:93e:d7f0:497a with SMTP id af79cd13be357-940ef8bea57mr86707085a.16.1792797599390;
        Fri, 23 Oct 2026 16:19:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709f3a58sm863811fa.24.2026.10.23.16.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:19:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:19:34 +0300
Subject: [PATCH v3 01/14] drm/msm: fail the snapshot init when its worker
 cannot be created
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
Message-Id: <20261024-msm-kms-destroy-fixes-v3-1-66a30120a5ea@oss.qualcomm.com>
References: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
In-Reply-To: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1898;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=WsQ21XZW4TA3F25Pv6HWJIhCOEkArUvMa6B6iciNKmk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+uNWzv5sWeJLMJrumC5ZpaqGpCgFn6aRBMY1
 Z7whunSVnOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvrjQAKCRCLPIo+Aiko
 1bAfB/0SiCwjML8FgRX7IJ9T+KYMFwwrg5nOqeAVTruHFCS6kMOf5truYmZeGWkt4jYs5xnCpIt
 6yVo2HP8aGa1yzqRHRfa6kCF9fij9rqA6QbmviKkFYFNDYwDl9w9lp79bdjSEsyhlURLUTWF91L
 h32BmF4jDdXrsGNjFCZiSojmJWcPv7Q38MJF2gKbDvWFj3p7GDmiQAQJkEwv8A+No/oIAe0gnZr
 HEkhBmym7QZ0ZY1DSl5rdKx6v8cP1GI9t90Pk8s8zqinebLsgs1QrxZKSIkncE+90R72dfaxgpr
 2ZCM6g+Ie/Qp0Yi5QohmEWzEbmeIYmmzK7IT0EI8i4v/HGAa
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX5CQMi+qSl4fc
 U+y5+JTW+dN/bQ6OJflKdcIftbgQsSS1sSunkh3JCuHa6EBmnCKekdBslh2OlhcLyD/LgAvI3l7
 Ixg3o7QFN+psE7TblAjamsllWt/N64GH2aK4Lr8f+lU7qBMvHYLZWA3UTOPqZIOL7mQvONt86ZS
 vlhCQwfZWjhSa2CJ9iQzI/yGMEEPNnVPwqr+31o+yO/FMqJXgQ1J7k0gG6VqHcx632ttzqNJhs1
 F+sp859XJdN5NZvAWWN/KYCipTDXryF2nLTod/k3QOjrPpwTmuuLklmzux0a9JiEMV+GQR2eSlM
 hsTxRgXwcYiQE9fRLF0JDzpQKoQeQS7Y1T4feexpOVZFNO6FdF5Aqt02QNPfP0o1pj5EJUPurHC
 20/oyFskfRrEdNl5ZIC/DVNn05dgzccT2fTL2k1I1rVF+3DbRo7GFtLzzfHM0GA3GKv3+2+iWyc
 8DH492L3Ygwi+iWrg4w==
X-Proofpoint-GUID: NJKl5wf0Lhb6QaKZo4lGQjuQrw95_erm
X-Authority-Analysis: v=2.4 cv=a9mlZkSF c=1 sm=1 tr=0 ts=6adbeba0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=D-zmcGmn4BrKCB6hg70A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: NJKl5wf0Lhb6QaKZo4lGQjuQrw95_erm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX/RHvUbAuWY+X
 PYeSIsQaonvYwFRv6JZqqyesHJFoMmNe05t0ISd0F5KL5sEZtcMobiduur/aqJVwq85xkd7/lvU
 r8tHAaoKfFLChwSIIh/u9OWrbMUWSy4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230092

msm_disp_snapshot_init() only logs a failure of kthread_run_worker() and
returns success, leaving the error pointer in kms->dump_worker.  Both of
its users then dereference it: msm_disp_snapshot_state() queues the dump
work on it on the first display error, and msm_disp_snapshot_destroy()
only checks the pointer for NULL before passing it to
kthread_destroy_worker().

Clear the pointer and return the error instead, so that the KMS init
fails rather than leaving a snapshot facility which crashes when used.

Fixes: 98659487b845 ("drm/msm: add support to take dpu snapshot")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
index d99771684728..d1b10656e41a 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
@@ -98,6 +98,7 @@ int msm_disp_snapshot_init(struct drm_device *drm_dev)
 {
 	struct msm_drm_private *priv;
 	struct msm_kms *kms;
+	int ret;
 
 	if (!drm_dev) {
 		DRM_ERROR("invalid params\n");
@@ -110,12 +111,21 @@ int msm_disp_snapshot_init(struct drm_device *drm_dev)
 	mutex_init(&kms->dump_mutex);
 
 	kms->dump_worker = kthread_run_worker(0, "%s", "disp_snapshot");
-	if (IS_ERR(kms->dump_worker))
+	if (IS_ERR(kms->dump_worker)) {
+		ret = PTR_ERR(kms->dump_worker);
 		DRM_ERROR("failed to create disp state task\n");
+		goto err_destroy_mutex;
+	}
 
 	kthread_init_work(&kms->dump_work, _msm_disp_snapshot_work);
 
 	return 0;
+
+err_destroy_mutex:
+	kms->dump_worker = NULL;
+	mutex_destroy(&kms->dump_mutex);
+
+	return ret;
 }
 
 void msm_disp_snapshot_destroy(struct drm_device *drm_dev)

-- 
2.47.3

