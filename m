Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793380192;
	b=0hp3UelwnwO/PWBku+rQ4mOmAOw639NKt1YTeBc/87I8CwxMkcJcD3RjQPxl/sw4jXTn
	 5BUYM6aaCtuCKONFHtSIEZURv9yshJA2RGWBaGX9+T/745qs4fNZ/OAUQFTQ2g+kMNZ9z
	 CXzvn26TzQ4AB1r4+eDje4E0207RBvuOelhRxYnhdFu/GjIpDaTSKaPhsjo1l/ZAQfKaa
	 duxK5zi2tFY/mGF7fT0xzdACLpJYZ1l9+mWa7KTdYgkbqW7NwJVFuDxZNrOyrg6G08fkI
	 9EFD+R7373kinDZ2VL/3bMyyoqPrz6U2WEsL5LTRiNJDV6Jr3xnbbCq4Gj1VFkCmDJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380192;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=viPmlgQ0jNGVSBO2/t9bsFtu5pNzCSof1faqWlhy4tU=;
	b=1TBGatkLy5cTTpPdfVTbngUrCe3qrxZ6VKnr4fvfN/cNGCA31pJm5Gtq7Q9QXh/sC3Qo
	 snJuVAW9BwSOuhaY61iEd4bNRMrmrWhPSrepduW8sneYCtwmQcjH6ws822g5Hv6tD5ZNh
	 Q04oWgDcnaYt/960YsfF1aNue1i/AbRoW3mq60QSm1oeGEqiNU7LdHFQ6FeAqZoEfN90n
	 wFF1kdXkbm4DtN6jAwHsxXliEzca9eUhozchtgcKYq4G9yRm7Bm2iN2VdwImWi8w4BL4N
	 ISGdZ6GbBZfdLTHr2PahY4i7M3hTWjRp/R3SZC31AMaq6tbLwLS3m9o7gtU3N4wgSVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Uz5WjJ9a;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eSNrsDQx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F99C606A330
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F99C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Uz5WjJ9a;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eSNrsDQx
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UER6GL346857
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:09:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	viPmlgQ0jNGVSBO2/t9bsFtu5pNzCSof1faqWlhy4tU=; b=Uz5WjJ9aDbXKwoY4
	vgYe15ESRy3fkoRkwEZhLJQJgW4b5lIyQnXJJPCWYUCRmthFVIMGqTnUY6s3mCE7
	yxGeKrCgKc838xh048smVH/YWUdUw6tcf44HVztBH3Z0bhm00tCZ6ReSgQp5seuy
	vEfW9gJmemAjgvA2sqtoehz3bCn2Z79Mg9PCFAKTFDskQT0YAZXzzyP09a260XA+
	oEYaHv1imnKOynMt7f/+FA9pBJNDjrTDOOlVZFwy2MsauqI3gHYDDR0LenV+myxb
	rMXSuokz+gT0aLpma1palrTixQpampGsFJRxJOFP6kOFbb4vTIPoNQm34+lrUYaE
	RZcurw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6rm8w5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:09:50 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-156b5338d4bso457007c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793380190; x=1793984990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=viPmlgQ0jNGVSBO2/t9bsFtu5pNzCSof1faqWlhy4tU=;
        b=eSNrsDQxXyKOf2nC6G4Pbhsxc7HX63OPoHfSD9WmXhhyeDboBwWnr0YgAgyrUaWIUr
         5+eATdXXJWPsmJuJUb+K6HJJt91/HU+T1HcRtKjFBz1mT9yCkJJxZbERDFxR92jVicVp
         Kme6HTjP9vFm8KYJgZAUC8S8uoh2Qyzsm8hr22xLPpaYsgBe9mcaEV2u54h1wZFYAOmB
         WYo1BarUInw2Y3R0utZ+g+HlUKFE9nxgvWqDpp+JeFKrI208eIP+XpEuvEBb+v0NjbQo
         TKHwxOpKf45aRUrX3sknzjc2HnAuLgSi8zTml4DVOmnTiOMVB3ZnY/D8schoMY/RhoOS
         ej5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793380190; x=1793984990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=viPmlgQ0jNGVSBO2/t9bsFtu5pNzCSof1faqWlhy4tU=;
        b=KGPp15Ysi4tpQRmzaTIjQPO8rarqIl3FDG+coooKKIyVQ0XcDCUX/CWyoGKBf1j5/L
         EEWa32exRssYJmF+yMc4z+JECp4C5NFGtsvJBJ70Yh+tsAeod28ogfWWyO/Dk/6WxgmM
         KQj8gKQD3rJAQ6zd5f0EZ1k/LpIEcpFaG2DCyQG7NuISkiISlzeMMGeG4O6RxFN6lwfi
         SbXc1nMfDG5fdkgtRO2G0hdL7hoqb1mgnTgXodomFkZsGlbudjfHHY/J7s9ZaDnCe7W/
         T1yHvGJ+RJyU5LIovI/SqUbsdP0E33yoSWakRAE7sgIf7S00yCkb1qm0v5LPGTqZO3kL
         BfvA==
X-Forwarded-Encrypted: i=1; AKwUvBw8nK8h7UolJAvNW/JVsUjCrOqxkggfJUJhQVCSQbclRJKtThCxU6MqCFUY+DWTDnKvi3gd3KSCnMGw+Wc=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3HllDZeVPlfF4H+55iAac9S0INq/zwyPUhfaMvK7dAXL6yZDl
	KM2dI7Xq5ADhiws2wzhI8wQcSdUa4NbC2qie49ZfY+x9EN2cvlHEYYHrF/Knu6QBVnifS2/9hwj
	eoEEsSLwUwbQp1gU0URRPEqsE9RVrI8+AV0HV/yr3ruIvEHzDlOLcjaDzre3DCZES98I=
X-Gm-Gg: AYBFou3I3vJNAcdH7mI4mn6kALUEyew6hfoEXl4HZGxhb7JrOoq0BEWOolRHTjzvrct
	c0xUPOea2cNjNxw03DoFX//pGimtdtHmkmaeb8qUH0K0Iwl1KnBGWDy+LBB8nmYBY+Hp31tnt0J
	Swk3ixRbFLOFWY4mPJBfT1xYBdpX0MKeDUTtO72bJfmHC/Cm7SyyuTKPDMNkLHRZ+DnHdzbLnaH
	XxMRKCZ2IiQ0PxtP5Z2Byblm6sFLjoSZ30UMclpJCtDUlVTfUKllUoOy2bCPQ8io0QqNeDkePX7
	li4esO4qqPBhL9wfasz2EYPTWRSKmQnrJzsSUkhoq76XBivQDT/WtqPYy6ueXb/sBHMRcar7rl7
	tU3f9ObM4YGrF5eg0Bh+BqHQ1K/EdGvCNx6lbOXDy9DtDE54dEq/I0GtoQB3EYxbfEGLJL289PQ
	==
X-Received: by 2002:a05:701b:2816:b0:144:e246:a0b2 with SMTP id a92af1059eb24-1ac6088a458mr3842294c88.44.1793380189798;
        Fri, 30 Oct 2026 10:09:49 -0700 (PDT)
X-Received: by 2002:a05:701b:2816:b0:144:e246:a0b2 with SMTP id a92af1059eb24-1ac6088a458mr3842242c88.44.1793380188962;
        Fri, 30 Oct 2026 10:09:48 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac194b5437sm9481168c88.13.2026.10.30.10.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:09:48 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 22:39:23 +0530
Subject: [PATCH v2 2/8] drm/msm/adreno/a6xx: Mark cxpd device_link as
 stateless
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
Message-Id: <20261030-gmu-sync-state-fix-v2-2-89d3082d97af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793380168; l=4089;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=gWi/hNKGHqX3nrtnTUpvlxMi6EWilTYIlUPxFnPEmi8=;
 b=s+xJNk2gDey/o7vQkpf5w6xvEZk3xV5QhVdWnKRQ7pX7+VQp5iSIy6Ty2289FF/hZmQrskKZo
 XECef/jDMOsBqb8VhYq8IsEBGK8WDwdVPxpFjPzTTmxxbk1WdKROdXY
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: 3WIMvpj9eCly7byFNS6lJZW_5Ys16gYM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfX5aDLSc5nTr4I
 SC+Bjc6/ScwK2dHurDEafJlgwgRdBJRYlaT5FQwLVaZeBQmnxio8edklFSAG8NjmDRjROO29jqO
 8AsxyeVg62VkZn03+i8p1Lc0X21RkMc=
X-Authority-Analysis: v=2.4 cv=PIqaavqC c=1 sm=1 tr=0 ts=6ae4cf5e cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=JUlh0KM8FqsLYbc_jwsA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfX8rBse5UQDs9a
 D1fffoF1XrqTBG5Co0NOASUQ2nQpt/dtyQqkBL4YtfbQ1Ep04QOstPAh3EsoHDVbHQ4SPsMaT0i
 7+3gP+xFsQiFYfYY6yroo1iTqmeJ2StsAm/O60AG530R0FP9trosJegso7/Tw82vMHSu/6ovJbT
 OdQO18qpFCXSP0GDtYX9ut+PAvmx5gx4tjC23L53Py8sGhF8O692KP5Hb6bI0FPk1G4Bnw5a0us
 Rvb8fh+VLV3E76VUgsNq6VjZ8fqIXBG6Do9Mh545z3TjQrl7XtC9QgHipF3bOY02aOtH0uH2yby
 n2C4Uycct3jTD749jkl4kQ5KwiIe2E5rbfH5iVgMP0XPtFE2WFAfrMPNJS4HgT78/DLEOWV3Aez
 xNgMBlybYJlPUZcnrBsjnNL5YQaw6qfdI7z7xUVMZtTvEF0ckt4eyMGO7nvBUxvrLqJcO6RQsvc
 56CxMKwF06I21j8s5rA==
X-Proofpoint-GUID: 3WIMvpj9eCly7byFNS6lJZW_5Ys16gYM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300068

Since the cxpd virtual device is a driverless device, it has no real
struct device_driver bound to it the way a normal platform device does. So,
the managed lifecycle doesn't map cleanly onto it. Since the lifecycle of
this device_link is managed by the msm driver, pass DL_FLAG_STATELESS
together with the existing DL_FLAG_PM_RUNTIME flag.

This fix is required to avoid the below splat when a driver is attached to
the GMU:

[    9.624509] WARNING: drivers/base/core.c:1383 at dvice_links_driver_bound+0x178/0x330, CPU#6: (udev-worker)/354e
[    9.781167] pc : device_links_driver_bound+0x178/0x330
[    9.786456] lr : device_links_driver_bound+0x158/0x330
[    9.798622] sp : ffff8000827bb820
[    9.802042] x29: ffff8000827bb820 x28: ffff000808915800 x27: 0000000000000044
[    9.809573] x26: ffffb7caf3f983d0 x25: 0000000000000003 x24: ffffb7caf41645a0
[    9.816920] x23: ffffb7caf3f982d8 x22: ffff000801239cb8 x21: ffff000801239c10
[    9.816921] x20: ffff00080b3a8c00 x19: ffff000801239c98 x18: 00000000ffffffff
[    9.816922] x17: 736d5b2073706f5f x16: ffffb7caf1eb5940 x15: ffff8001027bb3b7
[    9.816922] x14: 0000000000000026 x13: ffff00080084c110 x12: 0000000000000000
[    9.816923] x11: ffff0008004a5828 x10: ffff0008004a56d0 x9 : ffffb7caf2227870
[    9.816924] x8 : ffff0008004a56f8 x7 : 0000000000000001 x6 : 0000000000001000ocket.
[    9.816925] x5 : 00000000001a7fbf x4 : ffff0008004a56e8 x3 : ffff000801238cc8
[    9.816926] x2 : ffffb7caf4164000 x1 : ffff000801239c10 x0 : 0000000000000000
[    9.816927] Call trace:
[    9.816927]  device_links_driver_bound+0x178/0x330 (P)
[    9.893492]  driver_bound+0x7c/0xd0
[    9.893493]  really_probe+0x208/0x2a8
[    9.893495]  __driver_probe_device+0x88/0x170
[    9.893496]  driver_probe_device+0x44/0x178
[    9.909639]  __driver_attach+0x9c/0x1b8
[    9.913592]  bus_for_each_dev+0x7c/0xe8System Message Bus Socket.
[    9.925839]  driver_attach+0x2c/0x40
[    9.929733]  bus_add_driver+0xec/0x218
[    9.933609]  driver_register+0x68/0x138
[    9.937555]  __platform_driver_register+0x2c/0x40
[    9.937556]  adreno_gmu_register+0x2c/0x40 [msm]
[    9.947141]  adreno_register+0x3c/0x50 [msm]
[    9.951544]  msm_drm_register+0x50/0x78 [msm]for the API...
[    9.962813]  do_one_initcall+0x4c/0x3e0
[    9.966975]  do_init_module+0x60/0x280
[    9.970849]  load_module+0x1c70/0x1fa0
[    9.974708]  init_module_from_file+0xdc/0x100
[    9.979188]  __arm64_sys_finit_module+0x1c0/0x2e0
[    9.984026]  invoke_syscall+0x5c/0x120
[    9.987882]  el0_svc_common.constprop.0+0xd0/0xf8
[    9.992715]  do_el0_svc+0x28/0x40
[    9.995243] qcom_q6v5_pas 6800000.remoteproc: Handover signaled, but it already happened
[    9.996128]  el0_svc+0x38/0x148
[   10.007672]  el0t_64_sync_handler+0xa0/0xe8
[   10.011975]  el0t_64_sync+0x198/0x1a0

Fixes: ead5d3e5eb37 ("drm/msm/a6xx: Vote for cx gdsc from gpu driver")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 662f09bec9d5..5d96b55a624a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -2291,7 +2291,8 @@ int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 		goto err_mmio;
 	}
 
-	if (!device_link_add(gmu->dev, gmu->cxpd, DL_FLAG_PM_RUNTIME)) {
+	if (!device_link_add(gmu->dev, gmu->cxpd,
+			     DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS)) {
 		ret = -ENODEV;
 		goto detach_cxpd;
 	}
@@ -2478,7 +2479,8 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 		goto err_mmio;
 	}
 
-	cx_link = device_link_add(gmu->dev, gmu->cxpd, DL_FLAG_PM_RUNTIME);
+	cx_link = device_link_add(gmu->dev, gmu->cxpd,
+				  DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
 	if (!cx_link) {
 		ret = -ENODEV;
 		goto detach_cxpd;

-- 
2.55.0

