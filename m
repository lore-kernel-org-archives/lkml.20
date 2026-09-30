Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04294DDB27
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775429; cv=none; b=MXH4GiWO64wMSO4aYMbpeW16lQqkBvmALWVvIjh0woXQ6PON7oJFrNWYMDNxseEBFlys54epq9+jet8owWYW3We31EIqFokjpwBnrE3KFCJDMDjWsfcxsQweBGbnT17SQSmqnx8yEYwhyfpl12lHOkyWfoS8/e9KbN3O9teOxAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775429; c=relaxed/simple;
	bh=cvRrPOLxLPbCTpWLiVr6CL+JUOrTZCa+HknyxlPt9Xc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tpZWWr1KmyBGZ0gA+OyFC4F0Ry1bOqrGewldsMxl9IQqSETDsYxdXlIloUa7c/lp/QRTsTp+niBnKsBwNxU7Fr/Hw7x83xopSFbuUOmN+DxmzwIWQxdIEkeCJNq2prI/1ugAcoxhDFV4y/9AMuCK/FZ8qonKrsP/RS31QdimL7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BuQrfCSB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kBwqzKFh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BuQrfCSB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kBwqzKFh"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7OG82019461
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:36:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+vn8HrnSp9wF2lXt9UhWS6MvVRq28DGOOCapdNx+WUc=; b=BuQrfCSBZt4SvqDy
	a+BDpxlTxbHYuVE/PkqoKYxrX0Xf3E1gTSCs2dvXukXSYZFdx0mW1HcSdQ+lU+xq
	8pYRiGtvdHYKzqbbhEdww/Kf/NvRkOJU56SLb1uKwKza1a5iwgEdl//wBJmBgCLW
	b4mLYSThm8DFj+fwGfQmYxibHcVa1/wFYrOTtUDtKa6WeOxx3O2tkl7H2oXnMs3n
	0oGaTuylmBpYgbR93eGeCWq+3qdamTqVdZXwo6B2tJGrmEjzrj0icHRkp+kdH6VA
	OSabRVojqI9IooLdS5FkyU86C2Srntxvip1L0YU065oyHjVivbAE6pXgsp43dXPM
	9geQ5g==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x1c1k62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:36:54 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98909a978b9so22018241.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790775413; x=1791380213; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+vn8HrnSp9wF2lXt9UhWS6MvVRq28DGOOCapdNx+WUc=;
        b=kBwqzKFhdrmDSQctNYeANnniUsfA3LbqWcLupQXaYh5iToT8HrQlIm/BT6jffo9NSF
         hmeIHxp1Jyxx9QjqMihVzwOMRWDfuptsXxnyV/7OjKzOYobxCWWyBpvePC/ArOqBMNaT
         Z7PkdQ4MMDRuAAFWKJRChzgsGxtrCq0S7NRh+1VDyQOy39+6cSlknQPelLGoDNu8yVkp
         C2izyxLctdBwWNqRVYfeMdBZQff4epB51kcH4qFhZm47LEi6e83YZ1kvk730v583WcFa
         urIL+jqVSMJhavNVTiRDA6/V6Y1Mq7qPOV0X/LJ+hOnLI3oLJsY0m6E5pT0ye/YEyJJj
         gzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775413; x=1791380213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+vn8HrnSp9wF2lXt9UhWS6MvVRq28DGOOCapdNx+WUc=;
        b=QPy4guL17mordqAkdrhdsXIyc6pbQ8wfQU+VCkfi7MEVOnlX7Dfpv+r7unuJz+EXG4
         oUuAjf+1KBlTkijl9tpCjJjx5VyDfnErN13CCVhVbz4L1Z/qMjQxBvvKHR3bRrc8L8Wy
         29kYLvpb7e/XR1QAQX2s+0SbXL3YT0zDv26I7L4Axoqk+CsjOMC85l3VfwDvgtUBLHQ9
         TjpHSl5q1xGZY0xFA2r+GC6Nwe4ZDKNSHEKlI8J1oJ0YA/TEKZOlLGnK1HWTYyH9XSLu
         +6rSS4k2t6vDT3j7Hwpn3dqjchkArxf3Yi+g4tQQJgi3n8yKTnPOb3KC0FJSXANsydEY
         R+sg==
X-Forwarded-Encrypted: i=1; AKwUvBwrK/itEs3bqvdDMm0VDPUO0MPfTm1/WTN8xbwSZbJgKUMOQwZscC8VDJWynwAhZhW29Y4p19QzLkxYqk0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKPfikbGTl/jtAdwwk9nxtbrZNPDZiT3vP2tzCMWKUzOK+gfCC
	LnvRiEIS4gtKceSWsD5Pz7SO8KZCV+CvJ1QdybtoP3BavARPiYanzW/Hc7VYPw3f02l7Pn+rP46
	C73//yUSRfS43SUqvDG0sHVBZyrZY9Pb9RsrcN6YCIJXAV9qQSgeH5X7oc57oI6z5K8g=
X-Gm-Gg: AYBFou0PTMRNQkoJsbbesyEI2t5YK26ZjjrUv0yovfCpt7tGvedbHTBxFOM3kEXWq4E
	ecPsEUdKhS09Jo2JfRpbuuRVKvou0NdovFPXtDqV3n4ID/TgGsBs1y5BfemOeApRNGggNC/iLAC
	IBa/lJ5Yt7RjkQTDvOaCp7YHHeH7UjA0ZEOU8J4eqRvrk4U/M2QestaMhQHQrKot9jdhYU7cA6B
	3hlVNXsm9ypRdZGIRw6T1jI26B5YgLj/j3ZUka27qeqWjBu7LD0A3AUqvK1K3Y6BiVDnZ7vfohX
	CFgjp6AxOJAW7yBGHUQdvnyhrHxsZZQxwnstA8sp9L01DFhuG16DTAiRzIt+LcuhAIwzNMRY1BE
	T9d8Cn0Ox4SKqVwWyo0WBq1n3vJfiGu+JqOi4d7byXndOQRDooHCMPhhY8ZRVD3YX6Cm2cCcwGO
	SULxPIdkUlhvep
X-Received: by 2002:a05:6102:26c2:b0:7af:8729:9f3d with SMTP id ada2fe7eead31-7be727ae2c8mr269371137.11.1790775413500;
        Wed, 30 Sep 2026 06:36:53 -0700 (PDT)
X-Received: by 2002:a05:6102:26c2:b0:7af:8729:9f3d with SMTP id ada2fe7eead31-7be727ae2c8mr269352137.11.1790775412651;
        Wed, 30 Sep 2026 06:36:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba3fbfb582sm356731e87.57.2026.09.30.06.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:36:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 16:36:47 +0300
Subject: [PATCH v2 2/3] drm/msm/a3xx: Add hangcheck progress detection
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-adreno-progress-v2-2-3882f0fcd7b4@oss.qualcomm.com>
References: <20260930-adreno-progress-v2-0-3882f0fcd7b4@oss.qualcomm.com>
In-Reply-To: <20260930-adreno-progress-v2-0-3882f0fcd7b4@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2134;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cvRrPOLxLPbCTpWLiVr6CL+JUOrTZCa+HknyxlPt9Xc=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9Zegfzupx1qVRLJW73ri2e0NLdYsa4RtehkUc/PDb9ZU
 bhGJaeT0ZiFgZGLQVZMkcWnoGVqzKbksA87ptbDDGJlApnCwMUpABOZWMTBsDptz4l9LDt9/+i2
 qDBFvUqxPl3Bo3dSQ/lxf8aka4zu6Yv3Pf/Aac892+WycBZ/mah60Ie0JSplnzQM2C9v4d0v7Db
 /oj7T25+2hpm2z43dBb42uchkp174z1pis53vz8ebq6ff27P71ouI36Gi7yT+x9279ilmhmDh11
 MMNQ1/1gVk/zeZ5hs5qcFnm8FUGVZu6erLWQbmKz/YbTrl/L3qoMaqNzbW5Rw/q4oMLnl/VmjQ1
 RRuuu81z0C+cp7Hv4sMEXqLVvD4+FqHuaUf9K66pPb0rOiruXesVmi9EC+oinJiPTpFrvZS57ZD
 fxd3Cr0KW5XkfinZyz63Zd+TCSKe7HsOzkiY3B7UWuEPAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1NCBTYWx0ZWRfX4dwmqOU6WpXa
 7HsxYJ2b3Fha9wYHeK6k7+tPMUEQsEtOpmUEwVc3n1DPIIJDd4JZgs7cVHkDuHfKelWMQL0h9Sx
 Ir5TPGfe0QmSBGKZR0jcmothch1V85k=
X-Proofpoint-ORIG-GUID: MkJpdeEC8hFaHSQgttnol0vTkvHNJvRF
X-Authority-Analysis: v=2.4 cv=VrC2kO2n c=1 sm=1 tr=0 ts=6abd1076 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=hoswt1gEA0YReVsPuVoA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: MkJpdeEC8hFaHSQgttnol0vTkvHNJvRF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1NCBTYWx0ZWRfX5PCiFB0f1rsP
 eZh/5crdMaWACiTDZz+j8299/UV84m8Kw4QvqjTtBjjYM03UM8RVDkG0COyRgPlWABoObSylOsP
 chxwGTv/t7WrM8+mgFLDfWk5GVU2fe7GpJBVgBtywCJCVgRfLE4Mh9zBSEwPb4/wERSK/blLj8s
 5rLbpr14569cB5DGDQTIaWQC4bJUZqupdkrj/raX4oC8QMjmsduK0GWUH40NF3QHCl9l0j20r7O
 3IJmFtMNvkvC1k/NvtGNkh9x67gPuof/6SGbHzPNOp2YPoWTAy1M6XUfyddVpmyhNUhq1ohxG+u
 i073+uDJqxhaDqUDIQ8eTsFDLjKEqZFLW9fQe4i4aTUM2/7re5f6g5GsIyK6Bl+tKhhOULabrGD
 PvD3Q77ge48nPnv3HbEYKbukTcddEN0DA5kogkT8nFYcYMEzqJh4WpTHfpXvNndBmwueMnVTbWi
 rqYeNKaDG7tYTBnF1Fg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300054

A3xx has no progress callback, so the hangcheck declares a lockup as soon
as a submit is still running when the timer expires, no matter whether
the CP is advancing. On A306 a piglit tex-miplevel-selection run is a
single submit of about 58k draws that takes 1.2-1.3 s to complete, and it
gets reset partway through on every run. With the hangcheck period raised
to 10 s the same runs pass without a hang.

Compare the CP IB1/IB2 base and remaining size between timer expirations,
like a6xx does. On A306 these move on every 20 ms sample while such a
submit executes and read zero when idle. The prefetch queues are small
(32 and 64 for IB1 and IB2), so buffered data does not hide progress for
long.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index 0259e60b8011..c95bbb4bcf47 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -536,6 +536,23 @@ static u32 a3xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	return ring->memptrs->rptr;
 }
 
+static bool a3xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
+{
+	struct msm_cp_state cp_state = {
+		.ib1_base = gpu_read(gpu, REG_AXXX_CP_IB1_BASE),
+		.ib2_base = gpu_read(gpu, REG_AXXX_CP_IB2_BASE),
+		.ib1_rem  = gpu_read(gpu, REG_AXXX_CP_IB1_BUFSZ),
+		.ib2_rem  = gpu_read(gpu, REG_AXXX_CP_IB2_BUFSZ),
+	};
+	bool progress;
+
+	progress = !!memcmp(&cp_state, &ring->last_cp_state, sizeof(cp_state));
+
+	ring->last_cp_state = cp_state;
+
+	return progress;
+}
+
 static struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
 {
 	struct a3xx_gpu *a3xx_gpu = NULL;
@@ -630,6 +647,7 @@ const struct adreno_gpu_funcs a3xx_gpu_funcs = {
 		.gpu_state_put = adreno_gpu_state_put,
 		.create_vm = adreno_create_vm,
 		.get_rptr = a3xx_get_rptr,
+		.progress = a3xx_progress,
 	},
 	.init = a3xx_gpu_init,
 };

-- 
2.47.3

