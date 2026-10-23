Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797635;
	b=nSYEOisLsTxzfeNuoLB3UAXrtpHT82nKds89XNqJexQW1CrqBCmxdVvqwTwLsGvfwf+a
	 civ9/VPSKij/vvvB+7i3ejS3xgOxkXuM22YBoBRRoIJaRMF/tYlPkSZYufKNc5YZljyRj
	 iKP9a8mj4Ij/F5PEJXMAoiLiGGJQsUuzFc5aFR3YjJLZCBTRfV7L0bp3EUCfSWdrQFOmf
	 16wjwJayMKar8TPZsNCMpnXzV+Dw8+2wAcqCTs3bAsY4Y51urfOpkBGl6GGebcq1Jz0Hx
	 QBzIdZqd6iBKgAiupmRqwOLslF0GGWlUj4QSZ7D4AtoJ3d3aBnvCMyeGHd0iZnkOO7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797635;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BHN0xNuoeyIHKTV1AFeaVEsWSbzhZXzn9ubdzSnUtM8=;
	b=dhldQbV0+zH4YNQWjtMi1KVVTVJYk4UUmQLl+mhGvPhDBOBqWF8iXVT35GCa21BeFCxs
	 VkvE3iAOIcKKS+zEchm3W1GAlG1CGhJ7VIcFdlabzl0a1AAbZo9eTNRF4hmD3Y1dcC36m
	 K7o2hnVd3UO8aSakYy7DgRyylCneMxc0U/vZFeh9SrxGLpJ+6hcaIF6ewdR45avq9j7Eb
	 +oTUr+SOde96qa66Z/ifkNTEDFP/9CydBsjr8WOhH7gwlQUEAFGyc96MWtTjvWjnXHjc3
	 JCntVK7mj3MzE29lajz3VBbuHkqK3KNYKBRvIdnHKCOs0FTTUpJ6vkilRTM0D1kDBHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kh4dMs1z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZuPtUGe7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92ACB606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92ACB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kh4dMs1z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZuPtUGe7
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvcT03471173
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BHN0xNuoeyIHKTV1AFeaVEsWSbzhZXzn9ubdzSnUtM8=; b=Kh4dMs1zmYjhuW6p
	sSbZp9cQgJM6bbX4p1fLHPrJtQTjxOK8qYHZTdfIYn3LkzeMm7Mcf27XzDzZFb4g
	S70/vhZi9KhJd1rCsOXLeWBWt1VJn3Y2Rlw+DC25MZxceDVuPxC7Z4wsHM19teBU
	mS4vOrMFIc69ixVSRd90T6Lxi/r0DTelYAG7poMgwHpXO6unKxEHJ0JtdhDR0sOp
	GUVpJF5VqEAcFJHrX8hc/142lVo3/3gulZg4cU7VrKoPZPc48F6mN7lj352OlYk1
	zboJrR6YY8sSzbP2TxmluLU4aZelPK2BesQ4fm/4d5SnKFsf8GmDcmBR6jDsIMzi
	E5sdRw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgcrugunv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ce7a85f04so280057885a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797633; x=1793402433; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BHN0xNuoeyIHKTV1AFeaVEsWSbzhZXzn9ubdzSnUtM8=;
        b=ZuPtUGe7E2pQeIUSXChbaAQpekItU86tFQKyWsygHiUyeDhbTltgugL79FE7347A7D
         m4v8b8YZqXj/b9eRifloNeApSGFOKuTH/AjMm8AMy577CWd4N6uCpVU5pCJG2VnTK1F7
         vE5CVIXevAOf5YVBM36PnBoOsCFbucQFmfxafkPy3EY0TzbtkkDSt7IHDEs0FNe8fQEs
         YP/rd1L0WhXgZJGXJ9vrPqaF4Vu8Odt8LmyH4jEaifsDcNFFgCq/OfYOsJ3MYDxwCMsr
         LQRoEmj398I6bNOk/2q8KdDmo3bdfLVmNtWbyZh9NWgUSaXxhwJtMcno4ATu07dVtdCh
         r2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797633; x=1793402433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BHN0xNuoeyIHKTV1AFeaVEsWSbzhZXzn9ubdzSnUtM8=;
        b=YwR/ycEFbK8zTNTzXXejPDtBVXIXPzg7vOCYT/sagtSKEjF7KWvGaMjhC9FD3kI8s5
         k5CJIzuM8ofNFU+P4vAHdUhPG5KKhHmhWeYnw3yxa9UaC2Gtw8fQJkrFlKmay9S8EChp
         2Y9vK1VLRKSePJ37qXmzsky3VyJySeY3Xxn43k6xiNwJ4kicuU0vvUqEQuoMKYrf0VbM
         1qEGsxVJJbcxH5CRBEZ3cMJFP1YfOAUlo22Q3r/Dt2BabMsjbf1gEuQmpwSXUJxY3VxG
         JPvnrxnNZQCDuanoqQmrXvykgg4LjZ7Lts1LoBLkOnzWGvf358w2+5XySOzY+J2xgnS9
         QhqA==
X-Forwarded-Encrypted: i=1; AKwUvBxhrlxoZJI0B0QrkthUxI2Lzjdaa75UL85L8YXDv7aHOMhb1tMY/rSmZjXhcAGekKfwKgQJKsHC3JSqrOM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrOVKVIl+iXmkih+cQZh6qAj5qIeTYDPqlWY81HR/wal2eyJad
	oJOtQlr7KI2dc2YaRyamx1mJXYkEqHhxvui9nVzEwvh8/KQ4vmdDCB+1seK+Rshvo9ZHF3AQ6XT
	3RVMWfMvEZ6TjWUtZZjwiIP0durEH5ukNzPU6H5XMp71GBzTq3yD+oVXaxvVW4ljDWyM=
X-Gm-Gg: AYBFou3NEEqD+toRkYsc45qpyGLpB9bjvuykDpVDsiiI/w5KoFkY7ndji7c2zA11pH+
	wE1XViayaZNpKZfMkQjlCWd6mvu3hH5med8kJJ2El5xTZhkciPtNSxOv/aY8UcNf4Qd/hxOd+O5
	Y6xtXO+V0cy+UuUD2/8BqvIdjTBs9Ez5Ilp4esQqwWZ2rwbFmlPc+eNXLdj7zORP5fEa1c+n1Px
	lY1kbfViX0kVQOnpIQFfNJy5OxRezrRTPSiBLnBvNzR5Tu0n23HTWwaqvc6Mtqg8qfDEUcYsDQG
	gJRCx2vgB23Bmb2mJvNgZU5GR61NtRVksu1BmBF/N+k+uFgNCO5+CXPiDZc3sH9IY/M0plIWBEn
	ecq2yhTan2QNA8Qt51GB1SSVI1+CwLz8JOHVzxkGVHQTkUL8wH55hT45Zngrik/FdL/A2Xf3p5i
	MAGrDB390AdwwO
X-Received: by 2002:a05:620a:400a:b0:93e:66db:69b9 with SMTP id af79cd13be357-940ef9727d2mr83269385a.55.1792797632637;
        Fri, 23 Oct 2026 16:20:32 -0700 (PDT)
X-Received: by 2002:a05:620a:400a:b0:93e:66db:69b9 with SMTP id af79cd13be357-940ef9727d2mr83265585a.55.1792797632128;
        Fri, 23 Oct 2026 16:20:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709f3a58sm863811fa.24.2026.10.23.16.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:20:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:19:44 +0300
Subject: [PATCH v3 11/14] drm/msm/dpu: clean up the self-refresh helpers on
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
Message-Id: <20261024-msm-kms-destroy-fixes-v3-11-66a30120a5ea@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2139;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=x7Um4Zh4cOtsynGFkbo/mRPO0qZY+PJocyHznMzNkZY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+uWjGtrz2xJsjk/AKcyyVz4BvaRFGZntwWMx
 U+SmgJEifSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvrlgAKCRCLPIo+Aiko
 1Qv3B/4vDAzTKH4or8FdWIFi2eL4ti0qrqm2sHPiWQRi4gcGYjcD2ig951J40wzGrQk1do1aXwN
 YLMtLK8xUwnwMVCWG3X1aQsi8tKC+6u6PW/rWDXurVIPwauoGxx8c1CUEFnRW+3Hc25Nlm/d6v+
 gAxLcq9k7xSqevWrMHw4OcopSaIjth3oMdCb8/8MxNg1swnXNw8xe8Pt0Vf16P3y9y612cZ0xdh
 IMMe4MYl6C6QnqEjgrr9dDPfz6bVgSOX50jKt8Qd5QIVk0yWwNBDrLCUOr/y7wF6Cc7wcujx29n
 iy4wQlhuCl+6EyxBBexlAPfvZjro4s+56lGeYO9g3vWflppb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfXxRw6nFSyx0TW
 vbqIpuPFyLO+b09DTCzTdLC83kzFhiCZB82jvRE+1vVsZUKmsEOf9lETvnvuwnMGkkgKPpL7afo
 sJJMcqPBur5a/TRzbK/pDsmZLe21Eh8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX2lqqIrkporxF
 yKRAy9oiwKvgN108hfa/sNB+xS6RJ7kwYVOjwYuNVfdlBGiVXQOvM5eG4lX+ddWAnE2m+Dwv5jh
 frqnBn3PDdiHaXVZXg47z9jwrgXAAKyPXAKA/VtolZ9xYEoeXVDOkMRD705iEcQMf+eIOI3Ecah
 8gk4kCvph/T4ONcshQhfn3GvwKZN/W6BOI1nCmNUTRa9vB5+lzG+Hp3poRMmy35da+2ij0Azbfc
 TYG3WMoAsY482x4xOZ1U2y9qMDow4bcWKcxZiGCgNACuZ6IyX40e1SsSrHCR16r6ih2LffWjsMU
 mR9/jbuah2aynFGS/snGtfE8s47lGckf+i9KQ//vEf+bF4T/D1YPMpkPAktEwon9irqpA0Hm53j
 1mypRBIQlFr9Bht0D0fePLHAwg+qGFdcH6t+UxWP0euf6Kj0fOm2TqPT9DgFGjt+2jTMq6xzVRG
 FaFWzQ0lloAbWvCiNqg==
X-Authority-Analysis: v=2.4 cv=Ju5kP84C c=1 sm=1 tr=0 ts=6adbebc1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=r-hXt3OJkovplFG2WMgA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: fcXj7eDhQezZqbEjYN0r9B6_uvl_tB0x
X-Proofpoint-ORIG-GUID: fcXj7eDhQezZqbEjYN0r9B6_uvl_tB0x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230092

Unbinding the display driver on MSM8996 with DPU oopses about a second
later:

  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000870
  pc : drm_atomic_commit_alloc+0x10/0x9c
  lr : drm_self_refresh_helper_entry_work+0x5c/0x1dc

dpu_crtc_init() sets up the self-refresh helper for each CRTC, but
nothing ever calls drm_self_refresh_helper_cleanup(). Every modeset
commit, including the one which shuts the display down on unbind, queues
the delayed entry work of the helper, which then runs after the CRTC
and the DRM device have been freed, and its data is leaked.

Clean the helpers up when tearing down the DPU hardware, which cancels
the pending work while the KMS is still intact. Doing it from a managed
action instead would not be enough: the DRM device, and its managed
resources with it, outlives the unbind as long as userspace holds it
open.

Fixes: 1122697810e5 ("drm/msm/disp/dpu: add PSR support for eDP interface in dpu driver")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 65ba8fa697e9..934ba47b2dae 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -17,6 +17,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_file.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_self_refresh_helper.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_writeback.h>
 
@@ -885,8 +886,18 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 	return 0;
 }
 
+static void dpu_kms_self_refresh_cleanup(struct dpu_kms *dpu_kms)
+{
+	struct drm_crtc *crtc;
+
+	drm_for_each_crtc(crtc, dpu_kms->dev)
+		drm_self_refresh_helper_cleanup(crtc);
+}
+
 static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
 {
+	dpu_kms_self_refresh_cleanup(dpu_kms);
+
 	dpu_kms->hw_intr = NULL;
 
 	/* safe to call these more than once during shutdown */

-- 
2.47.3

