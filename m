Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646034;
	b=N6PSVf8IHgMU6/+hXB9A505J771vl3nCZemWQ9hB7Vttq8ngtY3UKyxp0EBWpflH39mC
	 OTNomokBD1/wUO+lx1td4R1pNt5T/hoZKtZl9/emja4nSxBO/S7Vaz9ZzTjNDC2r1+iL+
	 MtpmF48GKfNG9u+KrX2Kw3rY4+bdAr16S3X9xEXjXbGB/NyZI44xN12ycC33Lb3AIS9B1
	 5gbhowswpcrBv17ZnS17M1YOhqZh4Ftf03T7ndxxbyvZxQvd/OWSGtABMeWCFsuv1DhVj
	 jX6JSwDQo0FQokL1QwB+Cr41hnljVki2IFg1SjB/FmLlcTGBqvVtRdE69UYImlYj8UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646034;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=M0wsEcVQYSmG7vhv4bdYrWC/tv1Ytps5T8yIjzxkQEE=;
	b=0um4a09ApW1DXWoTL1qmCSp0BmyHB3VA3XFK2fDYtUYPm8wcj/FEFgeSB1a1A+siCAxr
	 bCAl2G2Wv/QGS8voUIK/NqPVNxFYyFs1YjM9n1+dXMtwE1Xc7XDYHQvEONTxWBsmLyc36
	 V1Y75EiQv+Higp7Nk0uvbZA58/ikuDugWC+3IPf96oE2pqNlKl5LXFt4/uLbyRaLKIWcC
	 UL82D61pwweqiz8OZEvEqxQJRAX41t5I8S5Mul0aGPUGl6ls072aG9s/OESKC14INgF5J
	 3q/Y9LO8tVGeGKYKCdJjg7dnQ29n1TaFwfEiCekGwRPmqbRW5TefNR9L+5HY3EuLfVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UCPspQq9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Aq0TkDdq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8323606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:00:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8323606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UCPspQq9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Aq0TkDdq
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2HP3ne4000268
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 19:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=M0wsEcVQYSm
	G7vhv4bdYrWC/tv1Ytps5T8yIjzxkQEE=; b=UCPspQq9WRGf+6LSuAw2WP7GfYf
	CQy1YdX+2lSlPmHrsI1KeqfbInirubaJch5PH7IF4KCHhCC777rC8wyN9w/ABtK1
	UWDmej5qB/flXb8GyI61F85H6wKx3lQWI5j/kVqWkvc2Ca93kYSp0m4iEsSQIO0i
	EgI8J3yWHHnQPDWH3ybbNqFIHE3N6yJA2L4rigU2EHRk2hk6CL6ZAyMN2IGeIZ9w
	xqWGv6qDEtqNb+HX4whp/JQC+1yKNr9J+lv7T6sjDVfcXSdQAhL+xGqDQAEN3we6
	RigvNMKBIEM98ASaojojGaeyEZ7jj7j1TaxvdWYZKWGONLq8lBPA/qOsh3w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrjg2c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 19:00:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae73921fd1so2827227a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793646016; x=1794250816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M0wsEcVQYSmG7vhv4bdYrWC/tv1Ytps5T8yIjzxkQEE=;
        b=Aq0TkDdqnLMFPn8UVTBm7E5ch+iN5EBAgwSQV6ZgicAweiaIf+ABCIhjb3MOPRwA2e
         uZ2ZwBoFj6RndaxRYcO9Y1glcmiTZpSPp1HypavDRSa/LnhukE5VMQm8rrzL46Dtb7BT
         E4NSeH1YYU8nemFkA+oc81utq/Nn0fPN+rRKfT7vkfTXbtqKqEcWbPUt6pEUn1HTAjlq
         XZyp9dnEj3aT9BUWeUPu63eaiX8E4HuLdRY6NBSlM3WZvNyCY6mbPCGyRPNqx2mDp3z+
         xvTJCUM0aMsG4l6BGJq49/D9o/3fXryTDWkt2U2QkEyDzJ6zRfwy79yaHjc0b+GcCqDX
         rSrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793646016; x=1794250816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M0wsEcVQYSmG7vhv4bdYrWC/tv1Ytps5T8yIjzxkQEE=;
        b=AT239sRHVfufWzGFIPMlygV7xyGM/CPvnJ72G7I14ns3S8QPInZ1HLwW/Z5vioOEn6
         3zcMt4XFXuuVRpEgwqJILFbr4AkF4BMAnq1zerVwIROeQ8zPpDdgKy+f7WTteVFT0a3n
         ioikuYtrWq4tDNR7HH1C59w+aDNdGu39CUl3NvoReH+QWg7wYdKyljLwEETAWp7e357r
         miktn7PpVufkY1v16Wb32zLF9ys8Y2G63xq8sc7gzIUch1QK280WvAohT+PHfLKVuWZA
         k97Lt7KyQbrzljJ9TLpQ729VcwG+YeeX3F+bd3xlpyc4bVfGmwuaG/VhUBtBn1HlgIiw
         3kjA==
X-Forwarded-Encrypted: i=1; AKwUvByMPgKwWlrSs1riaZPPfJ0f46V8i7ljqAdxdUhG+g9WNscbAWOo7gydzKex6EJF0T/4zPSHkjQ2UxY5oIk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cnHi+QnIcgaAKGHf0UITDr0FY5iS0GtVgKYM5feg60rwPsLr6
	fmjq3NCWuIJJVOH5l0rKhjON1p0uyQo8KU+mpV+OEd713AjZJsyH94+dz0ldqSLQsMvdw3I2UwA
	ZwOJHgk9aclo7FcN2S+4ia02GfEGZQV2j6vHzCl+0JbrRAKijviXyd3eYWcLt4gnkBJM=
X-Gm-Gg: AYBFou0EUVCOVeMPLqn7r6Ry7Vc4Tim2jd7D6Vd6ZdAeVaKQumyH02Yo4S/hpGdh6XZ
	rLFCARXWqjbof9ByR3rkfRkEZiKtmKGQGy9FG84vDbwULtJKMfvpkj8Hl2P8WhlfAnNIgHoGsEl
	nC9vwcCkYW+5A0wvehpXQdCWRkgRZ6Q+DBZNIRLxNZPw9yVhnAHzaZzTAUuJfM3qvH5q+TeLIJy
	K4Uuiw0TbCfSlvt5V6ic1UnHbB64lEVWiQCxLFcr6yBMWR6zjwLKurPZY9vl73ey44X8ap81Mn+
	TEBo00S07CVKuAKXXemtFSJ8tUvJFSPmSkFKbzijL8/3pJJ4e+5jMVW7KWFhOsQzVKN/NYJmLaV
	JG3goiJ5MKaW1C5LdKBKdBNMYpOkANlJBlMflW2WNHO0rB9OQZS1Zq4ggNomulvYxVWsAbrc3gJ
	CmIpXroc2wLJmgdr5EZZq5xw==
X-Received: by 2002:a17:90b:5686:b0:3a4:9a7a:360 with SMTP id 98e67ed59e1d1-3ae897f6e7cmr9056105a91.29.1793646016035;
        Mon, 02 Nov 2026 11:00:16 -0800 (PST)
X-Received: by 2002:a17:90b:5686:b0:3a4:9a7a:360 with SMTP id 98e67ed59e1d1-3ae897f6e7cmr9056056a91.29.1793646015304;
        Mon, 02 Nov 2026 11:00:15 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6c4259sm446437a91.14.2026.11.02.11.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:00:14 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/4] drm/msm: Rework IFPC disable
Date: Mon,  2 Nov 2026 11:00:04 -0800
Message-ID: <20261102190010.720443-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102190010.720443-1-robin.clark@oss.qualcomm.com>
References: <20261102190010.720443-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae8ddc1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=kBZMXW1S6ahmPhhohEcA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: b22c0S14k2lzl6QDgJ46_hlPxflSusFW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA3NSBTYWx0ZWRfX/fue6CljRqSK
 F1lpgN24zeG3ojO8hKqMytJ5GH5KH8iCswvw2CnJY36FhdE4kfnhXaMioY7w3Sr9ma9mgbKx/Zh
 ZpTkUcGe2glhCQZqtHYzsSwc4NKldXI=
X-Proofpoint-ORIG-GUID: b22c0S14k2lzl6QDgJ46_hlPxflSusFW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA3NSBTYWx0ZWRfX5mdXEPVwxsHd
 eWWJ2H86UPnocmlbDvl4nJO0GQF3HnDr5PIPx0jNpsnUWxsevFz8A+ncTqRgRr9G2t3NouiED2z
 20B94awNy9cKrQCwki+mNpVa6CyAVUq/a37zhnNGx4jOWjsWHTOnpp6NwnBqsC4ciHGq9wW7IEF
 WiCmmBAMN1yJuwYCInyUOnGTDcZBiNi2+78Pgxn3x0jIOgNeNr0KMLOdafbwy7v38B2elR8ciCy
 BQpGnuyeEgAyqOqWYb0Fs99k/fAnPfYmNAJNT7ROj0yksjUxuryqV+lq5wWoMF9aH+7DdWGoYhx
 mRIQlx98n/FqXG0lTf1V6w5nlszVIbxU5ozwjQRLItEYQ5S50Ic2wT4uU9jwQShCNHjeo78S79B
 hO/87fRoUTjPmb9MlW4EFOTM5vBs/nlNS3Hj6STsyoYQHJS6hmSN8fhqGzlOtVATNXTRe+TSHHV
 WMwb9gy4AvG3Xn7Qq8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_05,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020075

Previously this was coupled to SYSPROF level, which made sense at the
time.  But there are other places that we need to inhibit IFPC.  So
decouple it from the sysprof refcount.

Now it has it's own refcount, so multiple threads can vote to inhibit
IFPC safely.  The renamed gpu->ifpc_update() simply applies the new
state by setting or clearing an OOB request.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 32 +++++++++++++++------------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 ++++------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  3 ++-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c |  6 +----
 drivers/gpu/drm/msm/msm_gpu.c         |  1 +
 drivers/gpu/drm/msm/msm_gpu.h         | 26 ++++++++++++++++++----
 drivers/gpu/drm/msm/msm_perfcntr.c    |  6 ++---
 drivers/gpu/drm/msm/msm_submitqueue.c | 10 +++++----
 8 files changed, 56 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 662f09bec9d5..bba5468db42e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -2128,29 +2128,33 @@ static int a6xx_gmu_get_irq(struct a6xx_gmu *gmu, struct platform_device *pdev,
 	return irq;
 }
 
-void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu, bool force_on)
+void a6xx_gmu_ifpc_update_locked(struct msm_gpu *gpu)
 {
-	bool sysprof = msm_gpu_sysprof_no_ifpc(gpu) || force_on;
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+	bool force_on = refcount_read(&gpu->ifpc_disable) > 1;
 
-	/* Nothing to do if GPU is suspended. We will handle this during GMU resume */
-	if (!pm_runtime_get_if_active(&gpu->pdev->dev))
-		return;
-
-	mutex_lock(&gmu->lock);
+	WARN_ON_ONCE(!mutex_is_locked(&gmu->lock));
 
-	/*
-	 * 'Perfcounter select' register values are lost during IFPC collapse. To avoid that,
-	 * use the currently unused perfcounter oob vote to block IFPC when sysprof is active
-	 */
-	if (sysprof && !test_and_set_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status))
+	if (force_on && !test_and_set_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status))
 		a6xx_gmu_set_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
-	else if (!sysprof && test_and_clear_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status))
+	else if (!force_on && test_and_clear_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status))
 		a6xx_gmu_clear_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
+}
 
-	mutex_unlock(&gmu->lock);
+void a6xx_gmu_ifpc_update(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+
+	/* Nothing to do if GPU is suspended. We will handle this during GMU resume */
+	if (pm_runtime_get_if_active(&gpu->pdev->dev) <= 0)
+		return;
+
+	scoped_guard (mutex, &gmu->lock)
+		a6xx_gmu_ifpc_update_locked(gpu);
 
 	pm_runtime_put(&gpu->pdev->dev);
 }
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 09d76cdf059f..bf71129e33a9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1565,11 +1565,7 @@ static int hw_init(struct msm_gpu *gpu)
 		a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_BOOT_SLUMBER);
 	}
 
-	if (!ret && msm_gpu_sysprof_no_ifpc(gpu)) {
-		ret = a6xx_gmu_set_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
-		if (!ret)
-			set_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status);
-	}
+	a6xx_gmu_ifpc_update_locked(gpu);
 
 	return ret;
 }
@@ -2851,7 +2847,7 @@ const struct adreno_gpu_funcs a6xx_gpu_funcs = {
 		.create_private_vm = a6xx_create_private_vm,
 		.get_rptr = a6xx_get_rptr,
 		.progress = a6xx_progress,
-		.sysprof_setup = a6xx_gmu_sysprof_setup,
+		.ifpc_update = a6xx_gmu_ifpc_update,
 		.perfcntr_configure = a6xx_perfcntr_configure,
 	},
 	.init = a6xx_gpu_init,
@@ -2922,7 +2918,7 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
 		.create_private_vm = a6xx_create_private_vm,
 		.get_rptr = a6xx_get_rptr,
 		.progress = a6xx_progress,
-		.sysprof_setup = a6xx_gmu_sysprof_setup,
+		.ifpc_update = a6xx_gmu_ifpc_update,
 		.perfcntr_configure = a6xx_perfcntr_configure,
 	},
 	.init = a6xx_gpu_init,
@@ -2953,7 +2949,7 @@ const struct adreno_gpu_funcs a8xx_gpu_funcs = {
 		.create_private_vm = a6xx_create_private_vm,
 		.get_rptr = a6xx_get_rptr,
 		.progress = a8xx_progress,
-		.sysprof_setup = a6xx_gmu_sysprof_setup,
+		.ifpc_update = a6xx_gmu_ifpc_update,
 		.perfcntr_configure = a6xx_perfcntr_configure,
 		.perfcntr_flush = a8xx_perfcntr_flush,
 	},
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 81d21acccea1..cb0ac27dacba 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -298,7 +298,8 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
 int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
 int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
 void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu);
-void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu, bool force_on);
+void a6xx_gmu_ifpc_update_locked(struct msm_gpu *gpu);
+void a6xx_gmu_ifpc_update(struct msm_gpu *gpu);
 
 void a6xx_preempt_init(struct msm_gpu *gpu);
 void a6xx_preempt_hw_init(struct msm_gpu *gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index e7d04c865968..ecf15a8f68de 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -846,11 +846,7 @@ static int hw_init(struct msm_gpu *gpu)
 	 */
 	a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
 
-	if (!ret && msm_gpu_sysprof_no_perfcntr_zap(gpu)) {
-		ret = a6xx_gmu_set_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
-		if (!ret)
-			set_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status);
-	}
+	a6xx_gmu_ifpc_update_locked(gpu);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index fb07803f5aba..37f9e93daa43 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -1012,6 +1012,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	gpu->nr_rings = nr_rings;
 
 	refcount_set(&gpu->sysprof_active, 1);
+	refcount_set(&gpu->ifpc_disable, 1);
 
 	mutex_init(&gpu->perfcntr_lock);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index d27d54bdb7a7..0334a0f604ac 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -93,7 +93,7 @@ struct msm_gpu_funcs {
 	 * for cmdstream that is buffered in this FIFO upstream of the CP fw.
 	 */
 	bool (*progress)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
-	void (*sysprof_setup)(struct msm_gpu *gpu, bool force_on);
+	void (*ifpc_update)(struct msm_gpu *gpu);
 
 	/* Configure perfcntr SELect regs: */
 	void (*perfcntr_configure)(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
@@ -186,6 +186,14 @@ struct msm_gpu {
 	 */
 	refcount_t sysprof_active;
 
+	/**
+	 * ifpc_disable:
+	 *
+	 * Count of votes to disable IFPC (1-based, values above 1 mean IFPC
+	 * is disabled).
+	 */
+	refcount_t ifpc_disable;
+
 	/**
 	 * lock:
 	 *
@@ -375,10 +383,20 @@ msm_gpu_sysprof_no_perfcntr_zap(struct msm_gpu *gpu)
 		(gpu->perfcntrs && READ_ONCE(gpu->perfcntrs->stream));
 }
 
-static inline bool
-msm_gpu_sysprof_no_ifpc(struct msm_gpu *gpu)
+static inline void
+msm_gpu_disable_ifpc_get(struct msm_gpu *gpu)
+{
+	refcount_inc(&gpu->ifpc_disable);
+	if (gpu->funcs->ifpc_update)
+		gpu->funcs->ifpc_update(gpu);
+}
+
+static inline void
+msm_gpu_disable_ifpc_put(struct msm_gpu *gpu)
 {
-	return refcount_read(&gpu->sysprof_active) > 1;
+	refcount_dec(&gpu->ifpc_disable);
+	if (gpu->funcs->ifpc_update)
+		gpu->funcs->ifpc_update(gpu);
 }
 
 /*
diff --git a/drivers/gpu/drm/msm/msm_perfcntr.c b/drivers/gpu/drm/msm/msm_perfcntr.c
index ce65b1160955..867dd476ed88 100644
--- a/drivers/gpu/drm/msm/msm_perfcntr.c
+++ b/drivers/gpu/drm/msm/msm_perfcntr.c
@@ -259,8 +259,7 @@ sample_worker(struct kthread_work *work)
 	}
 
 	/* Inhibit IFPC while accessing registers: */
-	if (gpu->funcs->sysprof_setup)
-		gpu->funcs->sysprof_setup(gpu, true);
+	msm_gpu_disable_ifpc_get(gpu);
 
 	if (gpu->funcs->perfcntr_flush)
 		gpu->funcs->perfcntr_flush(gpu);
@@ -297,8 +296,7 @@ sample_worker(struct kthread_work *work)
 	}
 
 	/* Re-enable IFPC: */
-	if (gpu->funcs->sysprof_setup)
-		gpu->funcs->sysprof_setup(gpu, false);
+	msm_gpu_disable_ifpc_put(gpu);
 
 	smp_store_release(&stream->fifo.head, head);
 	wake_up_all(&stream->poll_wq);
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index d307cdd17d90..8434a09319bc 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -24,7 +24,10 @@ int msm_context_set_sysprof(struct msm_context *ctx, struct msm_gpu *gpu, int sy
 		pm_runtime_get_sync(&gpu->pdev->dev);
 		fallthrough;
 	case 1:
+		/* Disable zapping perfcntrs on context switch: */
 		refcount_inc(&gpu->sysprof_active);
+		/* Disable IFPC: */
+		msm_gpu_disable_ifpc_get(gpu);
 		fallthrough;
 	case 0:
 		break;
@@ -36,16 +39,15 @@ int msm_context_set_sysprof(struct msm_context *ctx, struct msm_gpu *gpu, int sy
 		pm_runtime_put_autosuspend(&gpu->pdev->dev);
 		fallthrough;
 	case 1:
+		/* Drop our vote for inhibiting IFPC: */
+		msm_gpu_disable_ifpc_put(gpu);
+		/* Drop our vote for disabling perfcntr zapping: */
 		refcount_dec(&gpu->sysprof_active);
 		fallthrough;
 	case 0:
 		break;
 	}
 
-	/* Some gpu families require additional setup for sysprof */
-	if (gpu->funcs->sysprof_setup)
-		gpu->funcs->sysprof_setup(gpu, false);
-
 	ctx->sysprof = sysprof;
 
 	return 0;
-- 
2.56.0

