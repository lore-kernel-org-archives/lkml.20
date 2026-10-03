Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DB0191F93
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987238; cv=none; b=fgCf3UjiUBgS9pfll9aT5U2GTbRr64jTEkRA/WxLQGDGYWKUrSORNKVQqsBA+AkSpG7tVsViJi8H0nrGJyb/z35ALvO4z78DRvvHfDDjQbSrYg5CHDwvdTicRsm01T7R2rimBVagVz1JRHtRxO+Ne8qySjz8igE0lj7LKk/+CKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987238; c=relaxed/simple;
	bh=8vBOKHWuLr/9BOjuKKDaDSg8Rie4eNeOOmctMKqw2iE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YQ7q+RBAszo2fG8I51AF/Qbps3CP7U/omaX8hZqMjARJF/6Cpu9N3EOvOmMDn/wHwWKrwrey4zuLtlsKobeUV/CzwUcBszbck2/r97vJOZBVWb/xC7zvWXoRuFyQAEtlgnymz2H5pUi4cB1qnU6z6nmhs+iM5tg+g1TR7SFK+ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d84gb3nL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M+v3gzeJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d84gb3nL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M+v3gzeJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692NeCXc3884489
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 00:27:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6I+4tIDQ+8/sqCH9j4z8H5
	jdVNNAL5C2YjWEtdn/+rk=; b=d84gb3nLh7RyFzY18RBY9hRmmdhYrhAEBFZLe8
	Q1QhBphkwsu9q3rWol+3Zvt//4zcrlim7knGYAxnRl+Rev/Z0CBLyaqyLa9BpGjp
	EQjXC/q+deqYEeRYSmwbDbv5VlLi1mgGCD+yLvGGvxccZlfYXkC8z3NIbh7jCeav
	ZPu5wfwTkYNw2Hnssjjmn0aHAifXqIc+QoUiUiNXCXL+R8cx/SOYALKAAn2il+KU
	s8/Yvv0U+9QoiNg6rnTiSHSL5/OC57RLeuJYYZlCmfwu6MNw9s920v2PtTKFGT4a
	gULcKztyg8cigDyMS17nSyrJAfCfxiLbC9BrD/0ahDKHdmvA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h26bp40j9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 00:27:16 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917bab67568so9122186d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790987235; x=1791592035; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6I+4tIDQ+8/sqCH9j4z8H5jdVNNAL5C2YjWEtdn/+rk=;
        b=M+v3gzeJYbRh/Ge/o9qwQG+kgK2ri9q7HVzK0hs2cVsg5cTYCOqBwbT/jenwc583yB
         /AlQa0PdNdGtR36fLSCQK35gn9p0fryHHgZs2qGZDct8QphVeDBEtZnXYCVxYoZydssw
         A7oAf3Jv/9ScIpZ9KbHsiAv8oaK6qPdaDgj6/V6VTUrvfHkiXBUOz+xlCDuileafPqS9
         Pk267FZNez4VoR3Z9mmSL6zHkluxYm92Lm6y+d8bo1uZdgAN9My6qT/zdCTzjmeawbf8
         uoGVFYP0pyahJWNb+FgKVgTg9VtF4NdGm+6FoShihm0MMYLBK5YRalj0Q88nxG/es8AU
         hXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790987235; x=1791592035;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6I+4tIDQ+8/sqCH9j4z8H5jdVNNAL5C2YjWEtdn/+rk=;
        b=qJp2LOGo/F7QyvgFtY5jf0WouqbKu+7LEAtrbN0hm4Z1kGdFPgWLALzjPEWhNFI3iG
         l/GhJoRDVEQz93t62vmC5UQYPSro10cw2v4kRaQFsMs2mdKRgcZwUo5ARnrMfRKSCF89
         tJtFQYGIFloSOjZInTJRIn4Mqz3Z5iUiqhoPeAmbp3IwhUcSemY2KEPjIiHeLiD9csSd
         4NVymgsGD0DZrW6cXh+CqxG++8Dpg+YwKRACLU2sfgaMR5tBMivBYNn+dWckl3I03Qws
         Yn41wgsCPcW3Tc1jp2so4IiuiEeFQfToViDRx3n+rf6UeRmV5jtojJOj9oHxjInw80jM
         6IcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhk6B9R9aaoJ2k86EfmHAPcKNu48xRoPUAcWvdUKs+HjeiPacSV7PUH/4NSE9tAjnGm7Dq5RfBSP1UaS0=@vger.kernel.org
X-Gm-Message-State: AFuF++k0gVfAJmjUBh1iR7LVOAQOfxUIqekz4V1oP6i4XO3AdQUCXaVV
	dguI3YPSUnpS1PWNhT/VsOOM6bYTz6BzRaDuw+l/USU2809QJfW2IV++XVEHb2pIaKmdcvkB9W5
	jgjOajBYvvfEjyZ61LTfxzHUL9Y39CvYohuoOy2K3LlKUyGu5EEVfe1NHTW6idrSM6TE=
X-Gm-Gg: AYBFou13/B3h/YGLZLbB2wr7xelHGcjdd+wTWarF0DI3f5Ccdc1EeSir5a2TnkHuWRs
	ynO2RHq06VTVaKNaDEboCUvi5qFBrs6COLQu92yFXRqxf1dcd2fU3WINc52Eus911LblC/l2CyR
	YgcGhsLzwfIKtRx9y68/SYclHDtQberbNakmFnf6GQPtNCKuwpZKVRRUUeJRL2nIFCJJrmWIPVW
	+VJ3uFBnm3YjI8GUPJK1x53aZzHit82qWnaSxxLqCKEpgZ22xke0fHImFyiPBeWVlth6tpqJmGT
	R3rKB29nmlYaxI3efsu5KfQ+1F8r4Uzh11xw5bU8CiLgd6jPpOfPn/JQmfFhyaiFNblMvettmc2
	UcxYPANYkzRahAhgSpZH/cadKIMybkLw8klgjrmWliFOj89uWQiqV7TYyP3ifC3yuiCjTlVmpLh
	xTP/7RLHEtPCRp
X-Received: by 2002:a05:620a:2855:b0:93b:c350:a31e with SMTP id af79cd13be357-93cf19d7c43mr902504585a.38.1790987235380;
        Fri, 02 Oct 2026 17:27:15 -0700 (PDT)
X-Received: by 2002:a05:620a:2855:b0:93b:c350:a31e with SMTP id af79cd13be357-93cf19d7c43mr902500585a.38.1790987234860;
        Fri, 02 Oct 2026 17:27:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb86e68806sm1120705e87.4.2026.10.02.17.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:27:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 00/11] drm/msm: fix the error handling of the KMS init
Date: Sat, 03 Oct 2026 03:27:08 +0300
Message-Id: <20261003-msm-kms-destroy-fixes-v1-0-e062b7dae77f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN1LwGoC/yXMQQqDQAyF4atI1gaiI6V6leLCcaKNMlomtiji3
 R3r8uPxvx2Ug7BClewQ+Ccq8xSRpQm072bqGcVFQ075g0pD6NXj6BUd6xLmDTtZWZE6KmzmTGm
 fBmL7CfwfYvqqb+vXDtwu1xkcxwk9hNgLeQAAAA==
X-Change-ID: 20260930-msm-kms-destroy-fixes-0f04b1d39b83
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3900;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8vBOKHWuLr/9BOjuKKDaDSg8Rie4eNeOOmctMKqw2iE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqwEvfDIFRGGnsvtZ1Y8MrI6hNIc0fOjZ0bJdd3
 tX4wY12xCOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCasBL3wAKCRCLPIo+Aiko
 1bBoB/9X0dEj3+Z0pCYjxTrjNGwtZm7lDy2WloyGD0DgIF5gjJasJxHB9OS8UrB0nkTgtZsC3rr
 rbzyMH36e+IEB9fvX67mBV7WMYI+wzQqOGYLf2yYsJHR265zX8VD0s8H88NYAtOGZQNNyAwitVL
 HvjgVOugSFWaexbE/lmV9ZANR6erix4H0lzYptc41bWZnRmPdFVAJXoTSUReZnJE8T1lXPaCuV2
 zIbnpaJ3fVyefXmJYscbcvNBA8B2nurbxnl/0pfhaK/SeZNHX5DXeRAugDImyn1Av6FnAAu6/1S
 MILUeJg/CVPZWWBdpUdTcIHPft7M7/U1yDAuzP5tehP+JPWx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=OMqyTiaB c=1 sm=1 tr=0 ts=6ac04be4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=w1plCvtmiwo6cpt_-wcA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: RlcmLqJBkExIeMqtlG2VS_Fdlb41IYnD
X-Proofpoint-ORIG-GUID: RlcmLqJBkExIeMqtlG2VS_Fdlb41IYnD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfX2sB6SOdGPrDL
 w8Ac0/UBEhnWQGxTr+zbTs2mXbvizTYBMh1LjUka5AyzJ3ycvKWvVXMQDuJBQPF94F4uViMg+0P
 CaliUAu0/PfPF7ggc4l7LONqm8uHrB0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfX3ygmLaR/O/9H
 GcL9Dap5Bzonfy+H5fV3yt+y9NCtdWYFVLzdneYAiPh6AQuFs4w+k1Zp4pOvSG8IooyumW4ZrD+
 iydpFP1/6dgRTxBflG5S7Xi7/TwJNcb1x3Q2qQ8czt+S44hgzIdyBMSDY3U2HQoYZg/OAJOcjcf
 oDbvDShoEXAxo9W2J2s9qR5WKph5EI3gPdWkcVFKPu9ewLducjX1KVYBIIO8GZaf9WrhlBeOwYH
 OFKJsZSEm4iidSmTTNi2UjjrEcZ7gxoIjIrdYb9QyC3YQG88uGCJfeV/5f3dd4Lo47/DGVEM9KP
 I6tPhfueab5Lw3uPOgfDGOnHbxRA9xdmn53mAa7FYm7wKH/v53CgHNu+vFsbIlwNdgPq3wPF+my
 lryaxxId222lXvxcgTOW56mGCF6Rz/kscLOnpvNMAe0jPqo+CQ8d7aQ8/n/5m0MjhXb2RHAMXzg
 vM93KpZAkFlGpnbJubA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030001

When setting up the KMS fails, msm_drm_kms_init() cleans up by calling
the ->destroy() callback of the kms driver. That makes ->destroy()
responsible for tearing down a KMS in any state, from "not initialised at
all" to "fully initialised", and the drivers get it wrong in several
ways:

 - dpu_kms_hw_init() and mdp5_init() already clean up after their own
   failures, and ->destroy() then finalises the global state object a
   second time;

 - mdp4_destroy() dereferences mdp4_kms->dev, which isn't set yet when
   mdp_kms_init() fails;

 - msm_kms_init() leaves a NULL workqueue behind when it fails to
   allocate it, which msm_kms_destroy() passes to destroy_workqueue();

 - msm_drm_kms_init() hands a half initialised KMS to the full teardown
   of msm_drm_kms_uninit(), and the snapshot init ignores the failure to
   create its worker.

Most of these were pointed out by Sashiko while reviewing the "drm/msm:
fix SMMU fault dumps" series, which has been carrying the first fixes.
Rather than teaching ->destroy() about ever more partial states, this
series switches the KMS init to the usual kernel convention: every init
function undoes its own steps when it fails, and ->destroy() only ever
tears down a KMS which was initialised successfully. This reverses the
approach of commit 93c125e4ea98 ("drm/msm: don't tear down KMS twice when
KMS init fails"), which moved all of the cleanup into ->destroy().

To keep every step safe and bisectable, the drivers are converted one at
a time: a temporary flag tells msm_drm_kms_init() that a driver cleans up
its own failures, and both the flag and ->hw_init(), which gets folded
into the drivers' kms_init(), are removed once all the drivers have been
converted. The last patches are follow-ups which the new rules allow:
unwinding the DPU hardware setup step by step, disabling the MDP4 vdd
regulator on teardown, and dropping the runtime PM flags which
->destroy() no longer needs.

Tested on DB820c (MSM8996) with both the MDP5 and the DPU drivers, with
failures injected into the msm_kms_init(), the MDP5 kms_init(), the DPU
hardware setup and after a successful kms_init(): each of them now fails
the bind cleanly, without warnings. MDP4 is build-tested only.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (11):
      drm/msm: fail the snapshot init when its worker cannot be created
      drm/msm: unwind msm_drm_kms_init() on failure
      drm/msm: clean up after a failed msm_kms_init()
      drm/msm: let the kms drivers clean up a failed kms_init()
      drm/msm/mdp5: unwind a failed mdp5_kms_init()
      drm/msm/mdp4: unwind a failed mdp4_kms_init()
      drm/msm/dpu: don't tear down a failed hw_init twice
      drm/msm: tear down only a successfully initialised KMS
      drm/msm/dpu: unwind a failed dpu_kms_hw_init() step by step
      drm/msm/mdp4: disable the vdd regulator on teardown
      drm/msm: drop the runtime PM flags from the KMS teardown

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c      | 55 ++++++++++++------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h      |  1 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c     | 63 +++++++++++++++++-----------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h     |  2 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c     | 47 +++++++++++----------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h     |  2 -
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c | 12 +++++-
 drivers/gpu/drm/msm/msm_drv.c                | 27 +++++++++---
 drivers/gpu/drm/msm/msm_kms.c                | 43 ++++++++++---------
 drivers/gpu/drm/msm/msm_kms.h                | 17 +++++---
 10 files changed, 159 insertions(+), 110 deletions(-)
---
base-commit: a15fac810c76397ec9f62a6fc26c4d7ab6e238a7
change-id: 20260930-msm-kms-destroy-fixes-0f04b1d39b83

Best regards,
--  
With best wishes
Dmitry

