Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793380218;
	b=g+yk9m2wtYeKzE9zt3E9GCIKeLhQ3ycbXtpO1h9X3992cooK4DfKdyzUew1j9pJoJUYD
	 oBHk/w/6gljVcbm8r+xB/9boN+hW1/Wi1+W2PBtNADzD8JQb2Bd/Cp2pl7nrjHUjUyFHa
	 bQUiEtXDiqMW2YlM8sW1uLKAO2afcxK6lYT4sGG/c0inFNGgibfpl9hKcIQzQxt1Wnicj
	 h0bboQ1SCIEMty78so/Q84co/QgGCz6j5UwIx2rx2GEQYfRtgUSKlc/hDSkwN04GjQlBZ
	 931wov1txACUU61cxduBHVLPO0GnhcCPgpQt+jGxMzXDN3pEbum/u51RPIg7tlAyZwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380218;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=U6LAJbKZCzVzGcsYQ+tDOx4DCLHibtlbK4Y4vfao4vI=;
	b=htHp/TwG4NsfpjhzjkT1zi1kixFMDfXYrG4H5bGNNnCMQ197/C520A5mo228L6hWvXtt
	 3KorFry5zQ6xrw9BwxhOs4CeVPHFgcDAATAUZBZDBtLo5HBrM1t5fHupJIGaqVl93YFE+
	 RiFH5k+L2vLu2vBnUO8Oge0TKkXLg/+NQdnFXI/Rcw7zENn68rxOpC28Oa21HhSoE/AAm
	 TedF4Oq01Wiy/l1ImMsTDRjvSKu6BEnTc1veaQRKXUboEhQWQGcbelY051u8seS8NrXYf
	 O01zS8ZKJ7Babyni54RN5T95mpF0BoADX4RPj2qw3D3qDVjM+faIE7Qw3qEX601twuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nMEPtl40;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T2K7FKGv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D2A606A320
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26D2A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nMEPtl40;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T2K7FKGv
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERKSa2968111
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U6LAJbKZCzVzGcsYQ+tDOx4DCLHibtlbK4Y4vfao4vI=; b=nMEPtl40R+5BU8+h
	Li64C34LWp1bZSP0CzlSjJNR+HgBRApGQePOk/ojPcI7VVzaPL6dffDkAMnnIU6l
	9V482oaPWOfTRxNijfD9OP2m/0DHa+juzGsekqwyE+AyHKDBE/xQ74B2urQvIaJT
	lj6ZnhMcj+3k8WRkVLGfm44fTVXZd82LWREx28ZrL4laekq6als9CgTh1cJD9/KK
	ICeI+zuZ1O+w/Jgdb1EhmfpTTND+B7JgeVCmSMoQ9GrS/fpSZBjTip4YZIthDJPV
	7tddw2dea2gHiKQPymW89IuxGImKKa+6SEjvKSDvVqYIG8eOX1ooyFOidYmuvtAu
	wmc+Xw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qm5qd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:10:17 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so2738662c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793380216; x=1793985016; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U6LAJbKZCzVzGcsYQ+tDOx4DCLHibtlbK4Y4vfao4vI=;
        b=T2K7FKGvhEMti/YiWyC6nRPeLt4T1L3ghtVkCjs5TUNpSyb2JlZ77yQRDNPEbtLXqv
         mZc+C4m/yI1TMl+urnFqKO3I2G8KeS3ODzDJGPBuiCvckqUnk/aXgJXZUIPHejH2m2O+
         g0SoB0nuBCZHzFehWSV07BzBQzJkHHjYqyZ7pgSVaEF5IEQOtcxMQPLVnku0qi5DsMn+
         UAmBf6IuXCR3sKnnX0AG0gK08cbFftFqGZlc+EQAR4XGX+7bhybL0WBFeAYl34bu2Uiq
         H/NtAxEOy+/vie2PZcsqq7NCQIvUFKTIlHVZocWKfuor6SuoSDvERvk+zohH4O4a265q
         0NdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793380216; x=1793985016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U6LAJbKZCzVzGcsYQ+tDOx4DCLHibtlbK4Y4vfao4vI=;
        b=AZjzXQr8V0AZP2eOjIg2BHSQHf/O54eQH1csxl/IedNeldfOMsf+u3Bbijvhse2cKs
         OZICoeZHnLBE4fnHZYzk09cYNwJYxv94SHgmqM36A7nZrgqVkLRoAh5mCFzvEHp307MZ
         w3KnEPt3e/fGF1RH5Y4dubtOrXvNinnEzJwjax9ZL9BNaXUfaiT1ehlNGR4Tbl2Etgac
         eOiy7yOyWsHcOajXyxPSvqvEjB5xMQdZFQiEOVa8pEvFjFu1aThJNLX31Ht4rTaGsq/T
         qwsaKvBSzhvH9PBAo6FUbbkveT2/P9kUNfkzNB70lRh7qtJojKk8X2TAwwceYd3njpIK
         lX8g==
X-Forwarded-Encrypted: i=1; AKwUvBx/twxV+G7u7qpuAs0aJT6zdMOdWfVM8XEma7+IGpCfTLsH2yepjwk0eC7rv+V/up31RJY1eqIc2pIVAg8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxqOz4XSMlHXxMMeygqIuIJ0RGeXU6maAjMEPhg+UCIQgFRKr8
	Vr6Gmox320N5rKil0IUWIRlbithYWQmadFrkKwe6lzY3mAGRskr7CCQIhBcWUBwdTxVd4jKBYci
	88AODHzG1ReoBki1Q7/0fZdNiBomFwjjbC/p4iMBxK6HsDy05RaTM39NgNo9iJU6PQRE=
X-Gm-Gg: AYBFou25hbIO9q8XFoS3QUmMsrUnwHzu+dsxDUkVJS1oV5FelzkHKV6PTG98uI7f6tu
	yVMbv6yTjnZo6diGAvNjqnPaqFPb9Ip5jRRQ2AqbGRKsLx4noCslM+fiP/T3Da5iC16gLKI/6RO
	QWXva/B+iQBCHSsIyfG5eUTfqlj+6xdmn2k/lWrnvPHLtugxhmbWkZ/uE4hjuJ+n+optSvGjew9
	5OTw4gP009PkpF0XxeUF9AKAx6YSfJiTmqB+dKJFI2kByAlNvBB6PXTFmxiCVpi1Pfdqpmcvbhg
	OVZ4fGmQSoudcj/7WhmCXodpI9xhtMHljkf7SjNCa0bTOLsZObaWP6CD5sFTKqvypaiMxEcnuPx
	wNMJQkkNZgyf7d/2RtjQKJaDeu3OloErnLMNbQrf1AR8iXZvzIXLa5uUpYLzTNUKKSgHvm+ifxg
	==
X-Received: by 2002:a05:701b:4182:20b0:1a5:52f6:db9a with SMTP id a92af1059eb24-1ac5ca23c29mr4160847c88.22.1793380216108;
        Fri, 30 Oct 2026 10:10:16 -0700 (PDT)
X-Received: by 2002:a05:701b:4182:20b0:1a5:52f6:db9a with SMTP id a92af1059eb24-1ac5ca23c29mr4160792c88.22.1793380215275;
        Fri, 30 Oct 2026 10:10:15 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac194b5437sm9481168c88.13.2026.10.30.10.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:10:14 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 22:39:27 +0530
Subject: [PATCH v2 6/8] drm/msm: Attach a driver to the GMU
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
Message-Id: <20261030-gmu-sync-state-fix-v2-6-89d3082d97af@oss.qualcomm.com>
References: <20261030-gmu-sync-state-fix-v2-0-89d3082d97af@oss.qualcomm.com>
In-Reply-To: <20261030-gmu-sync-state-fix-v2-0-89d3082d97af@oss.qualcomm.com>
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
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793380169; l=16989;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=hY40rpyUelTqz40+l5bUxibj2TSvu6UulNTRVfHw0sc=;
 b=XxiTEbXuiDp3tjTToAP0GcvgbGE7hSYSjbL0xgX6o0BtmGpqov7g+jXWpJCNS+mnxWtpvcCZG
 K8LH3tzDYkgCf375x5PoCUbLcn+RjLA9YcDCRGLk8YgZUElEJWjPyED
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfX939iInhH6iFd
 yBsG0ij6rnXSVQYMKlQajklIliX1xAwYjoimfmWu2vJIPoLgaO4C3g2zU1KZznGA3sru3aSBrqP
 f7q7k4d+kLm6+Y+syXyRmRAEJJt87vphmPuoQNKMZ1hLEGjpq3X3zsnbZ4CnJGuIPUsN+QjNUcd
 s8gpvwt6DXb72jHztEBgrPwZkpGG2ddnYqE4dYxHDcUWQXdFdzdDsewE4JFkWDrrn7tmI17Krqo
 AWsKUPr/uqBFIznqG3Cl0fgf4T2SC9w4XLUgRhRD+r7XaWLK1IHmouExZapWsPqYfwzWdQzVJrr
 dflKVNNY9GvCyiwB6DXBDbI6cvFDbf5gFen0N475WZLiDHmbh6sVgYHJN5B/UWdPC8TtsZAwOuH
 PwTXDdUz+Qe+NNCJO91Mk7ruMTXQBd0ZlWqRjaHtolI/hMnbjGwggDyvk9KTQ6rFCfvrgzOBWXO
 Hkpi8VrplK0BsZ6j95A==
X-Proofpoint-GUID: pnRAPd39F9vAw4H_yYF5UqLvx4ULrKWz
X-Proofpoint-ORIG-GUID: pnRAPd39F9vAw4H_yYF5UqLvx4ULrKWz
X-Authority-Analysis: v=2.4 cv=IumL47/g c=1 sm=1 tr=0 ts=6ae4cf79 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=xZiXXbYB8mlKH4gbesAA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfX1R52Xw8riWcM
 dNzy3xEtuhRfhPvXEXLYaWUlS8rBCGo2lUDRAY/5ffNqwC4dTaMONF/FxDkW2RqRiGpq1yIE1lZ
 kQ3+1YJzt3S40X3ANPITkDdGjGUXpw0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300068

With the introduction of sync_state in the genpd framework, any consumer
device of GCC and GPUCC which is not bound to a driver will result in
bootup warnings like below:

[   24.362666] gcc-kaanapali 100000.clock-controller: sync_state() pending due to 3d37000.gmu
[   24.371210] gxclkctl-kaanapali 3d64000.clock-controller: sync_state() pending due to 3d37000.gmu
[   24.380268] gpucc-kaanapali 3d90000.clock-controller: sync_state() pending due to 3d37000.gmu

To silence these warnings and also to have a proper state in driver core,
attach a driver to the GMU and set it up as a component device for the drm
master device.

Since both GPU and GMU should be bound to a driver before a
devfreq/thermal mitigation request can be handled, move the devfreq
registration to the bind call of the master device.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 111 ++++++++++++++++++++---------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  19 +----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |   3 -
 drivers/gpu/drm/msm/adreno/adreno_device.c |   5 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   2 +
 drivers/gpu/drm/msm/msm_drv.c              |  39 ++++++----
 drivers/gpu/drm/msm/msm_gpu.c              |   3 -
 drivers/gpu/drm/msm/msm_gpu.h              |   1 +
 drivers/gpu/drm/msm/msm_gpu_devfreq.c      |   5 ++
 9 files changed, 115 insertions(+), 73 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 5d96b55a624a..715d70a51004 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -5,7 +5,7 @@
 #include <linux/clk.h>
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/interconnect.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
@@ -2155,7 +2155,7 @@ void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu, bool force_on)
 	pm_runtime_put(&gpu->pdev->dev);
 }
 
-void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
+static void a6xx_gmu_destroy(struct a6xx_gpu *a6xx_gpu)
 {
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
@@ -2200,9 +2200,6 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 		free_irq(gmu->gmu_irq, gmu);
 		free_irq(gmu->hfi_irq, gmu);
 	}
-
-	/* Drop reference taken in of_find_device_by_node */
-	put_device(gmu->dev);
 }
 
 static int cxpd_notifier_cb(struct notifier_block *nb,
@@ -2238,9 +2235,9 @@ static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev, resource_si
 	return ret;
 }
 
-int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
+static int a6xx_gmu_wrapper_pdev_bind(struct a6xx_gpu *a6xx_gpu, struct device *dev)
 {
-	struct platform_device *pdev = of_find_device_by_node(node);
+	struct platform_device *pdev = to_platform_device(dev);
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	struct msm_gpu *gpu = &adreno_gpu->base;
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
@@ -2248,14 +2245,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	struct resource *res;
 	int ret;
 
-	if (!pdev)
-		return -ENODEV;
-
-	gmu->dev = &pdev->dev;
-
-	ret = of_dma_configure(gmu->dev, node, true);
-	if (ret)
-		return ret;
+	gmu->dev = dev;
 
 	pm_runtime_enable(gmu->dev);
 
@@ -2265,7 +2255,7 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	/* RGMU requires clocks */
 	ret = devm_clk_bulk_get_all(gmu->dev, &gmu->clocks);
 	if (ret < 0)
-		goto err_clk;
+		return ret;
 
 	gmu->nr_clocks = ret;
 
@@ -2308,6 +2298,8 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 		goto err_mmio;
 	}
 
+	mutex_init(&gmu->lock);
+
 	gmu->initialized = true;
 
 	return 0;
@@ -2318,16 +2310,12 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 err_mmio:
 	iounmap(gmu->mmio);
 
-err_clk:
-	/* Drop reference taken in of_find_device_by_node */
-	put_device(gmu->dev);
-
 	return ret;
 }
 
-int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
+static int a6xx_gmu_pdev_bind(struct a6xx_gpu *a6xx_gpu, struct device *dev)
 {
-	struct platform_device *pdev = of_find_device_by_node(node);
+	struct platform_device *pdev = to_platform_device(dev);
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	struct msm_gpu *gpu = &adreno_gpu->base;
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
@@ -2337,14 +2325,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	struct resource *res;
 	int ret;
 
-	if (!pdev)
-		return -ENODEV;
-
-	gmu->dev = &pdev->dev;
-
-	ret = of_dma_configure(gmu->dev, node, true);
-	if (ret)
-		return ret;
+	gmu->dev = dev;
 
 	/* Set GMU idle level */
 	gmu->idle_level = (adreno_gpu->info->quirks & ADRENO_QUIRK_IFPC) ?
@@ -2355,11 +2336,11 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	/* Get the list of clocks */
 	ret = a6xx_gmu_clocks_probe(gmu);
 	if (ret)
-		goto err_put_device;
+		return ret;
 
 	ret = a6xx_gmu_memory_probe(adreno_gpu->base.dev, gmu);
 	if (ret)
-		goto err_put_device;
+		return ret;
 
 
 	/* A660 now requires handling "prealloc requests" in GMU firmware
@@ -2531,6 +2512,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	/* Initialize RPMh */
 	a6xx_gmu_rpmh_init(gmu);
 
+	mutex_init(&gmu->lock);
 	gmu->initialized = true;
 
 	return 0;
@@ -2562,9 +2544,68 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 
 err_memory:
 	a6xx_gmu_memory_free(gmu);
-err_put_device:
-	/* Drop reference taken in of_find_device_by_node */
-	put_device(gmu->dev);
 
 	return ret;
 }
+
+static int a6xx_gmu_bind(struct device *dev, struct device *master, void *data)
+{
+	int (*bind)(struct a6xx_gpu *gpu, struct device *dev) = of_device_get_match_data(dev);
+	struct msm_drm_private *priv = msm_drm_get_priv(master);
+	struct msm_gpu *gpu = dev_to_gpu(&priv->gpu_pdev->dev);
+
+	if (WARN_ON(!gpu))
+		return -ENODEV;
+
+	return bind(to_a6xx_gpu(to_adreno_gpu(gpu)), dev);
+}
+
+static void a6xx_gmu_unbind(struct device *dev, struct device *master, void *data)
+{
+	struct msm_drm_private *priv = msm_drm_get_priv(master);
+	struct msm_gpu *gpu = dev_to_gpu(&priv->gpu_pdev->dev);
+
+	a6xx_gmu_destroy(to_a6xx_gpu(to_adreno_gpu(gpu)));
+}
+
+static const struct component_ops a6xx_gmu_bind_ops = {
+	.bind   = a6xx_gmu_bind,
+	.unbind = a6xx_gmu_unbind,
+};
+
+static int a6xx_gmu_probe(struct platform_device *pdev)
+{
+	return component_add(&pdev->dev, &a6xx_gmu_bind_ops);
+}
+
+static void a6xx_gmu_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &a6xx_gmu_bind_ops);
+}
+
+static const struct of_device_id a6xx_gmu_dt_match[] = {
+	{ .compatible = "qcom,adreno-gmu", .data = a6xx_gmu_pdev_bind },
+	{ .compatible = "qcom,adreno-rgmu", .data = a6xx_gmu_wrapper_pdev_bind },
+	{ .compatible = "qcom,adreno-gmu-wrapper", .data = a6xx_gmu_wrapper_pdev_bind },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, a6xx_gmu_dt_match);
+
+static struct platform_driver adreno_gmu_driver = {
+	.probe = a6xx_gmu_probe,
+	.remove = a6xx_gmu_remove,
+	.driver = {
+		.name = "adreno_gmu",
+		.of_match_table = a6xx_gmu_dt_match,
+	},
+};
+
+void __init adreno_gmu_register(void)
+{
+	platform_driver_register(&adreno_gmu_driver);
+}
+
+void __exit adreno_gmu_unregister(void)
+{
+	platform_driver_unregister(&adreno_gmu_driver);
+}
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 92e8c8abb86d..0bdab662dafa 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2327,8 +2327,6 @@ static void a6xx_destroy(struct msm_gpu *gpu)
 
 	a6xx_llc_slices_destroy(a6xx_gpu);
 
-	a6xx_gmu_remove(a6xx_gpu);
-
 	adreno_gpu_cleanup(adreno_gpu);
 
 	kfree(a6xx_gpu);
@@ -2705,7 +2703,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 		gpu->num_perfcntr_groups = a8xx_num_perfcntr_groups;
 	}
 
-	mutex_init(&a6xx_gpu->gmu.lock);
 	spin_lock_init(&a6xx_gpu->aperture_lock);
 
 	adreno_gpu->registers = NULL;
@@ -2713,10 +2710,9 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	/* Check if there is a GMU phandle and set it up */
 	struct device_node *node __free(device_node) =
 		of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
-	/* FIXME: How do we gracefully handle this? */
-	BUG_ON(!node);
-
-	adreno_gpu->gmu_is_wrapper = of_device_is_compatible(node, "qcom,adreno-gmu-wrapper");
+	WARN_ON(!node);
+	adreno_gpu->gmu_is_wrapper = of_device_is_compatible(node,
+							     "qcom,adreno-gmu-wrapper");
 
 	adreno_gpu->base.hw_apriv =
 		!!(info->quirks & ADRENO_QUIRK_HAS_HW_APRIV);
@@ -2769,15 +2765,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	if (adreno_is_a618(adreno_gpu) || adreno_is_7c3(adreno_gpu))
 		priv->gpu_clamp_to_idle = true;
 
-	if (adreno_has_gmu_wrapper(adreno_gpu) || adreno_has_rgmu(adreno_gpu))
-		ret = a6xx_gmu_wrapper_init(a6xx_gpu, node);
-	else
-		ret = a6xx_gmu_init(a6xx_gpu, node);
-	if (ret) {
-		a6xx_destroy(&(a6xx_gpu->base.base));
-		return ERR_PTR(ret);
-	}
-
 	adreno_gpu->uche_trap_base = 0x1fffffffff000ull;
 
 	msm_mmu_set_fault_handler(to_msm_vm(gpu->vm)->mmu, gpu,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 79912a33e17c..b308b5bbff80 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -295,9 +295,6 @@ bool a6xx_gmu_isidle(struct a6xx_gmu *gmu);
 int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
 void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
 
-int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
-int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
-void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu);
 void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu, bool force_on);
 
 void a6xx_preempt_init(struct msm_gpu *gpu);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 6b694b8bf8e3..7066be3b8e15 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -250,7 +250,6 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 	return 0;
 }
 
-static int adreno_system_suspend(struct device *dev);
 static void adreno_unbind(struct device *dev, struct device *master,
 		void *data)
 {
@@ -371,7 +370,7 @@ static void resume_scheduler(struct msm_gpu *gpu)
 	}
 }
 
-static int adreno_system_suspend(struct device *dev)
+int adreno_system_suspend(struct device *dev)
 {
 	struct msm_gpu *gpu = dev_to_gpu(dev);
 	int remaining, ret;
@@ -431,6 +430,7 @@ void __init adreno_register(void)
 		return;
 
 	platform_driver_register(&adreno_driver);
+	adreno_gmu_register();
 }
 
 void __exit adreno_unregister(void)
@@ -438,5 +438,6 @@ void __exit adreno_unregister(void)
 	if (skip_gpu)
 		return;
 
+	adreno_gmu_unregister();
 	platform_driver_unregister(&adreno_driver);
 }
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 4b2156825bdf..9e0d37ec9c15 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -678,6 +678,8 @@ int adreno_gpu_state_get(struct msm_gpu *gpu, struct msm_gpu_state *state);
 int adreno_gpu_state_put(struct msm_gpu_state *state);
 void adreno_show_object(struct drm_printer *p, void **ptr, int len,
 		bool *encoded);
+void adreno_gmu_register(void);
+void adreno_gmu_unregister(void);
 
 /*
  * Common helper function to initialize the default address space for arm-smmu
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index dbb6c70473bf..9ad2260f4971 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -5,6 +5,7 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/dma-mapping.h>
 #include <linux/fault-inject.h>
 #include <linux/debugfs.h>
@@ -172,6 +173,14 @@ static int msm_drm_uninit(struct device *dev, const struct component_ops *gpu_op
 	if (priv->kms)
 		msm_drm_kms_uninit(dev);
 
+	if (priv->gpu_pdev) {
+		struct device *gpu_dev = &priv->gpu_pdev->dev;
+
+		if (pm_runtime_enabled(gpu_dev))
+			WARN_ON_ONCE(adreno_system_suspend(gpu_dev));
+		msm_devfreq_cleanup(dev_to_gpu(gpu_dev));
+	}
+
 	if (gpu_ops)
 		gpu_ops->unbind(dev, dev, NULL);
 	else
@@ -237,6 +246,10 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv,
 	if (ret)
 		goto err_put_dev;
 
+	/* Devfreq callbacks require the GPU and GMU to be initialized. */
+	if (priv->gpu_pdev)
+		msm_devfreq_init(dev_to_gpu(&priv->gpu_pdev->dev));
+
 	ret = msm_gem_shrinker_init(ddev);
 	if (ret)
 		goto err_msm_uninit;
@@ -1103,18 +1116,20 @@ static const struct of_device_id msm_gpu_match[] = {
 };
 
 static int add_gpu_components(struct device *dev,
+			      struct device_node *gpu_np,
 			      struct component_match **matchptr)
 {
-	struct device_node *np;
+	struct device_node *np __free(device_node) = gpu_np ?
+		of_node_get(gpu_np) : of_find_matching_node(NULL, msm_gpu_match);
 
-	np = of_find_matching_node(NULL, msm_gpu_match);
-	if (!np)
+	if (!np || !msm_gpu_node_present(np))
 		return 0;
 
-	if (msm_gpu_node_present(np))
-		drm_of_component_match_add(dev, matchptr, component_compare_of, np);
+	drm_of_component_match_add(dev, matchptr, component_compare_of, np);
 
-	of_node_put(np);
+	struct device_node *gmu_np __free(device_node) = of_parse_phandle(np, "qcom,gmu", 0);
+	if (of_device_is_available(gmu_np))
+		drm_of_component_match_add(dev, matchptr, component_compare_of, gmu_np);
 
 	return 0;
 }
@@ -1163,7 +1178,7 @@ int msm_drv_probe(struct device *master_dev,
 	}
 
 	if (!msm_separate_gpu_kms_components()) {
-		ret = add_gpu_components(master_dev, &match);
+		ret = add_gpu_components(master_dev, NULL, &match);
 		if (ret)
 			return ret;
 	}
@@ -1216,13 +1231,9 @@ int msm_gpu_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	/*
-	 * The GPU pdev acts as both the component master and the sole
-	 * component (added by adreno_probe()). Future patches add the
-	 * GMU node as a second component on this same master.
-	 */
-	drm_of_component_match_add(&pdev->dev, &match,
-				   component_compare_of, pdev->dev.of_node);
+	ret = add_gpu_components(&pdev->dev, pdev->dev.of_node, &match);
+	if (ret)
+		return ret;
 
 	return component_master_add_with_match(&pdev->dev, &msm_gpu_drm_ops,
 					       match);
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 0c2c35636251..1b558777e241 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -968,8 +968,6 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 	platform_set_drvdata(pdev, &gpu->adreno_smmu);
 
-	msm_devfreq_init(gpu);
-
 	gpu->vm = gpu->funcs->create_vm(gpu, pdev);
 	if (IS_ERR(gpu->vm)) {
 		ret = PTR_ERR(gpu->vm);
@@ -1062,7 +1060,6 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
 		kthread_destroy_worker(gpu->worker);
 	}
 
-	msm_devfreq_cleanup(gpu);
 	msm_perfcntr_cleanup(gpu);
 
 	platform_set_drvdata(gpu->pdev, NULL);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index d27d54bdb7a7..d76aa17044ec 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -756,6 +756,7 @@ msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task,
 void msm_gpu_cleanup(struct msm_gpu *gpu);
 
 struct msm_gpu *adreno_load_gpu(struct drm_device *dev);
+int adreno_system_suspend(struct device *dev);
 bool adreno_has_gpu(struct device_node *node);
 void __init adreno_register(void);
 void __exit adreno_unregister(void);
diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 2e1d5c343272..025e608f45b4 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -221,8 +221,13 @@ void msm_devfreq_cleanup(struct msm_gpu *gpu)
 	if (!has_devfreq(gpu))
 		return;
 
+	cancel_idle_work(df);
+	cancel_boost_work(df);
+
 	devfreq_cooling_unregister(gpu->cooling);
 	dev_pm_qos_remove_request(&df->boost_freq);
+	devm_devfreq_remove_device(&gpu->pdev->dev, df->devfreq);
+	df->devfreq = NULL;
 }
 
 void msm_devfreq_resume(struct msm_gpu *gpu)

-- 
2.55.0

