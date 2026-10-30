Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793380178;
	b=tFXGm0Ix1iPA6Jpo/tQpShqkAXHSjiReCfl30d1C8100aG5436P+0gQaN3dlSyV16YwQ
	 J8V+LFJu+awMYxr2UGEyxN0B3GH7cQ7v9V2h42aXD+W/a5ip6PWdCix7zZ7/HRKhg6bZp
	 bPhiQE6LPeQFad9onQEQ6ABXm4VqIFBhqCTLX46uCcEIv4cGMBH4YXMCMMLN2Y7e6Tvdy
	 sqmMljccyHG6yoKMZrwwWmY4OBybV3ynCU0mGEb7zFExDwRY83W7xsOyLqPZJ/sYfcsF6
	 UOw/bOsaKmBqV6RA74nhfqXEZxQnF23pBPsa8/En8+wI/jddWpNgIXvFj3Ok7mm9H6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380178;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VP8eLV61So8nBgWsMjbR1aGqDYSp4VOFYMS/WdXn87I=;
	b=IEL9KK/YBZIFCM1lG2/7WScqxf4bGUdG4Tc7gNIIOK0hP7Pf85q1k1xZtBng20iUvbVh
	 sIsOCCfCf9zNlgwNv2AQb6rwniJ+yE2F1effeLpIt32TehTQRaV4d1aCxDI3EGygVT62m
	 fyjjlR7OfQoZ8Y6g+rGU6VnJlCDkRugIxPSTr1ugc6YK1Iy5aLmni4JCGUOR+EIApjthd
	 T8pvVbEuw/99BsrmLxEv0/PM/QfZr+4gUqEJ217IHqe7WiYRCAuFaysDziz45+4HhUdfE
	 BZVN/QyQjh4+tp4nJTJHGs7MApPiiyvg8dX7DXKbd45X7i9D2oJ/vBvHJJzPQLEID7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hQ6yPost;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mj+EBaII;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8346E606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:09:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8346E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hQ6yPost;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mj+EBaII
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERuR61953891
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:09:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VP8eLV61So8nBgWsMjbR1a
	GqDYSp4VOFYMS/WdXn87I=; b=hQ6yPostG/53jXQeHXhlQ2jxbbS+k9rtUEk5rD
	iDKomjV74zA67Y7J+EdBUiRq6DDkDqSURJb6018DbbTYuqC+7Go7ixNYA6MErWEF
	fCeqhkOEcuTAOs1PusODRWB9skMIM1HrDpdL+ep67mr5P9ptWlu6o5VbO2u6vVMn
	GImFyO9F3vOnwiHA5nFnSIqZge8vKiZUvodLTNwLXZnKKv33ne1mRUFw0q02Gz3b
	URPV6NAEfT+JFEWXOpFBHJOoU5FeUBHNH4pLDx/xGXU9bR32ssBacf2jcBm6fpfC
	wzhFYBiLc6I3MtlAsp7jIBMclDMxDndGHOg5FG3pUNTEjAjg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pm5ay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:09:37 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1a5005fd0f8so1552159c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793380177; x=1793984977; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VP8eLV61So8nBgWsMjbR1aGqDYSp4VOFYMS/WdXn87I=;
        b=Mj+EBaIIhqXOlMlc3WLl06zp7y6LodBPSN5OAxinEE7uiZq5Nfo6bzrlnQF4nKg0wx
         X6CwOLVV5HZ6PGvTzIOA26ohieBm471viYfRLi+WbCoLGRJ+1AWpDb6rVRldqWDgmCIY
         8EJoiuh+ZcI4ufA4UcUosK1PB9A+lzi6sO5qY9ZDROvdh/kdrB2CrKV/OXYq5abpdzst
         HXiyvbpBhrQh/1+CFAiSRGzUyG8FPaKNO7ftarcLpMlfvfHiPG2W7MQKR0E/KZZ+3sj1
         dJlvPOoyFN8sqSgA+yF5loPfLtouc4dvi79jHK7AruyFzspdZhcgQaefAw+8IiX9PJ4e
         yiiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793380177; x=1793984977;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VP8eLV61So8nBgWsMjbR1aGqDYSp4VOFYMS/WdXn87I=;
        b=A/6z26zxYSKQEmXL2mR0HWao3616x7IdNlf6CYeTFf+EmvEmr8kT3HnjcG8UcHlfN2
         kFQh50SiYhYkFgqRacDgfF5j5gkwr6A5xroiyaqah8dsA/UNzPiq7Ij7GG4/QKjot1Ah
         RNe6MJH73HV1Aa3SmhhqjGHYkjtQGHv21EvKRp1LQQ7R4WlvfZc4RNSpwis4pi6H3DYs
         NNnDaEkKTOdOtZYnicp+b3GbyHzXCk/6gIlZykumPUv8COgUzGf23F2eKcs1Zr0ltnKE
         6pnNF+RtjDhdawRfo8nUymALhVzKh7Tdpu7shvvSJQh9aP9ECxcQ9aCYvibzGg5WWYFV
         F/cw==
X-Forwarded-Encrypted: i=1; AKwUvBzJ3ZrVTPDzYWMt0ILiU8RJkZBuyr6Dc7ZsUf2xvvH+ali3OZQ+ytZjmeLQ/6dDtCHUCbf6c85TBLfu3nA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHXXk+wsrvC1nKZztYMPe/FAmGm5y/+FKxj9GMRuckRwtKh18G
	rcP1pQeX3UJU8bXgFuftAM8mKBeZV+qgI//b9927wniBO0+ydY8iBZFoMJ0LscSra9gzbZbR1+f
	YomUJ8X19Dxi2/XvnZtxN3/nfswErEb474w3aLOlAKW2ICUWPhfpGu5yUM0Oo04pqYd4=
X-Gm-Gg: AYBFou2y62OiajNmmmw9V7oU5kxIwPkQOkxrsMCodg0PUvcMZAZ8dDlFZiQAXd6GyP2
	HKsUbG49TztgvnOjj74nY/mjn9g67s/mSj1/eRw6b3XDqqeSdMPSIadhGDpO78Z8XaLEhuTL3Ba
	2MuuK3XOgcOEU00IBfmthBPUCYiQlHzrqen+6UxdfmtrbKrBW1WndsgRtfaDMS++MY0tO8va4yr
	x9gsLI78RfzKKmYthLZCiSNRfbMcQBV+mADfQzr4uKigR6aEHeeWUzebjQVVyG/htUhaEPIIlau
	kXO9fZvpL2WKeDK21GvpUOM7RKWODg28h3kVudrGJbfCPI2LWkFIQNaM+NLrrA+z65cX7IJ0MKy
	CgrCNQUCkqTzwJZ8yMjm6iub1lNlAFbePj2413VA7bzPv6mBt5nj7of+OiUShx7fBa1eATN97QA
	==
X-Received: by 2002:a05:7022:f517:b0:193:9aa3:4758 with SMTP id a92af1059eb24-1ac55968b07mr3895992c88.4.1793380176710;
        Fri, 30 Oct 2026 10:09:36 -0700 (PDT)
X-Received: by 2002:a05:7022:f517:b0:193:9aa3:4758 with SMTP id a92af1059eb24-1ac55968b07mr3895937c88.4.1793380175908;
        Fri, 30 Oct 2026 10:09:35 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac194b5437sm9481168c88.13.2026.10.30.10.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:09:35 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v2 0/8] drm/msm: Attach a driver to GMU
Date: Fri, 30 Oct 2026 22:39:21 +0530
Message-Id: <20261030-gmu-sync-state-fix-v2-0-89d3082d97af@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAEHP5GoC/22OQQqDMBBFryKz7kgSW2td9R7FRdRRA1VrJooi3
 r1Ru+xm4H/4780KTNYQQxqsYGkybPrOB3UJoGh0VxOa0mdQQsXiJiXW7Yi8dAWy046wMjPmRZy
 rMhGP6C7BDz+WfH1AX9mZLQ2jZ7uzhFwzYdG3rXFp0NHscOdLoRLYB41h19vleGqSx+Lnj/75J
 4kCY4oiirV+5Nfq2TOHw6jfuyL0B7Jt277gzQVD7AAAAA==
X-Change-ID: 20260511-gmu-sync-state-fix-bc6b2d809371
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akisaira <akisaira@outlook.com>,
        Vladyslav Tymoshchuk <tvlad744@gmail.com>,
        Val Packett <val@packett.cool>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Haitao Xu <haitao.xu@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793380168; l=3358;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=Q9tVKdJvoMzo7EPCNlzx65XdhsylbcAoFd4MRTjQvW8=;
 b=dWXKocWqFzhBRmsCyaJEBbCB1rtkNgZCNVQq/3Dgyxw3wk03nQOeT1ZnBWHVP7HQ9tLJn1Vvl
 cyKpkVaYhVUCR1C52MZON3ApOXmQECW//2iGPb242hgvNK0K7UXN1Nu
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfX4qjUrLMVuvXN
 sPHu4SxgT5zP6QZHj7WZm82eZbTo1r6UH9OXCJOzziWgHQxc4b881fGTHIM7LLeRAUy5pOIbFlB
 mPkVBad3pW7x0vYP7cWcPOvqu29Ek0fECiVSG3acXdvuan5lNybx9cMaCMP+phG6KeTZcXm4C5g
 G+gkQ7l6bCOf9cd+1WPw342p/e6YIkPi2XFu2IZcJ21LTW7hTMc78U2WKVrQF0tWQvCu1KBbrfj
 FfeR+5+1BdQ+o8kGJuGpNbHEemIFE9Svf2EevZUDze2bzsjwdO/JEmndr5Sxz06bcpQid5bqQmd
 u+FfF9p1k9lE/zFE+u+JNg6Sz6ejOJxgCVHDXXWI+72tfQyrmDckPj/hfUlMHkupXnV0UIA6glO
 jMOTib4/4ao586Nbfh3eeXk/QrFCCRssPtCo5mpBMbZyhLg2fRP+v0aib06JHMWiWsVpCdGvjwv
 /7av1Mv0FgyYVuWly0A==
X-Proofpoint-ORIG-GUID: 0zEO9eSui32XRmYig7J1nbCvrrr-QNMJ
X-Proofpoint-GUID: 0zEO9eSui32XRmYig7J1nbCvrrr-QNMJ
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae4cf51 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ef3994DOcC-j_uFHgC8A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfX+D9lskc2cHX2
 TmwT6h+P3o94drHN3V5bhfl2aOdMkel19C6irM+18N5xzagSaOA+S4le2iQX6+DdxSJbeO/KGFW
 JXtHC7tosIhvJEHjIFxoRStLZxv+Ako=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300068

With the introduction of sync_state in the genpd framework, any consumer
device of GCC and GPUCC which is not bound to a driver will result in
bootup warnings like below:

[   24.362666] gcc-kaanapali 100000.clock-controller: sync_state() pending due to 3d37000.gmu
[   24.371210] gxclkctl-kaanapali 3d64000.clock-controller: sync_state() pending due to 3d37000.gmu
[   24.380268] gpucc-kaanapali 3d90000.clock-controller: sync_state() pending due to 3d37000.gmu

To silence these warnings and also to have a proper state in driver core,
attach a driver to the GMU and set it up as a component device for the drm
master device.

The first few patches are preparatory fixes. And the later patches
introduces a driver for GMU device and a couple of minor refactors.

I have ignored most of the T-b/R-b tags as there is significant code
churn in v2 when compared to v1.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v2:
- Reorder patches to move fixes to the front (Dmitry)
- New patch to remove unused gpu_ops paramer (Dmitry)
- New patch to consolidate msm_gpu_probe into msm_drv_probe
- Drop patch#2 in the v1 series as it doesn't make sense after rebase
- A new patch to pass around DRM private data via devres
- Retrieve GPU data from master's private data during GMU bind
- Move devfreq initialiation post GPU/GMU bind to avoid handling thermal
  mitigation while GMU device is not bound to the driver.
- Ensure GPU is queicent before GMU unbind.
- Link to v1: https://lore.kernel.org/r/20260513-gmu-sync-state-fix-v1-0-6e33e6aa9b4f@oss.qualcomm.com

---
Akhil P Oommen (6):
      drm/msm/adreno: Fix invalid drvdata typecast in adreno_remove()
      drm/msm/adreno/a6xx: Mark cxpd device_link as stateless
      drm/msm: Keep DRM private data separate from GPU drvdata
      drm/msm/adreno: Simplify adreno_probe()
      drm/msm: Always use component model for standalone GPU
      drm/msm: Attach a driver to the GMU

Haitao Xu (2):
      drm/msm: Remove dead gpu_ops parameter from msm_drm_init/uninit
      drm/msm: Consolidate msm_gpu_probe into msm_drv_probe

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 117 +++++++++++++++++++---------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  19 +----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |   3 -
 drivers/gpu/drm/msm/adreno/adreno_device.c |  40 ++++++----
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c    |   8 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c   |   3 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c   |   9 +--
 drivers/gpu/drm/msm/dp/dp_display.c        |   4 +-
 drivers/gpu/drm/msm/dsi/dsi.c              |   4 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c            |   4 +-
 drivers/gpu/drm/msm/msm_drv.c              | 119 +++++++++++++++--------------
 drivers/gpu/drm/msm/msm_drv.h              |   9 ++-
 drivers/gpu/drm/msm/msm_gpu.c              |   3 -
 drivers/gpu/drm/msm/msm_gpu.h              |   1 +
 drivers/gpu/drm/msm/msm_gpu_devfreq.c      |   5 ++
 drivers/gpu/drm/msm/msm_kms.c              |  17 ++---
 17 files changed, 205 insertions(+), 162 deletions(-)
---
base-commit: 5fed66a6fde4dcc6a63ecec6f32e1a331dc4e1a4
change-id: 20260511-gmu-sync-state-fix-bc6b2d809371

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

