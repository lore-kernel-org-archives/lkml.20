Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911240;
	b=EzWKYZvrM917wyH3cWCmb+8e2kF/tIuDcnhjYicnl0+5IBFUsD3s7Dc41vdpf+e8WhvX
	 LEOhJ6kxXTdurZRSxPqUqxHYTSSH2L1983t67dOF8lTHviDgLB4q1lKDw3YAoUrSNk+Pj
	 HdhGeWAXm2CmzqHxGl7reAVhly9B4jHCbJn+GHCWQJ2wIJFUQBDj74RSI9IfaQGI1WRHM
	 oKf78pGabTCRTaEIGojJp4UYtLITLlapIxU7IgG8t6hbcwn/oarZ2UziQHlPc9Vz3rki0
	 bhZSokNQ+WnwQVwSSsA34nj6p6mU32E6g4XoQYPRMuFOXxz77SFPpL9Ija3RneAqOJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911240;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7RcgiEmf6cf8SNXnvgtdIUceJiAojVx8uS+VJgMrRdk=;
	b=0FJ0ti2AlhEYiw4t7vTeGW1ak2KErnZWaAQIkCr5N0ElZuvyK923vsNopgF4yHRo1DDY
	 h8exe59uPySWgy2C/GrqelmK1hkJQm6is4ogXQbumq6dDuvdJ0rqZrVkT3GVqd003PsXt
	 nxdP8a4Qx0TtKlxIy6fVi8fnmN6bG2AdBZrlVUBnTSkXlSSdWxZwCEjNlpsWh5otb9hqt
	 Ru8wP59xAB/xMLqm6AcGCJtICjdaUG6n31nSGHqMJhmAMw0ZViOJgpKF4cbNTbilVzh9y
	 jqn62lk+u9SWeXLNVFZrc8e6RWhAwolXuOx36WhcaZzPQAE8z7q/sj4HTl4vBhDFDKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SYsWmakc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ErsiPv7G;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1E06082BD2
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C1E06082BD2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SYsWmakc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ErsiPv7G
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeBFI2513446
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 20:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7RcgiEmf6cf
	8SNXnvgtdIUceJiAojVx8uS+VJgMrRdk=; b=SYsWmakcMBqJ2Yq6o2TkJobXwru
	cS6BQoDWyENFxrkTY6vaW32mosgwu7PPUXjV/FHgF4wCo4zN8zT/92KU5PcG689l
	JTs5EHo21iNu3P5EM/n5xE0M0kHTeI4S8Uh1ZzjbJ0J5KyJz7OH2N6vXPSREpx88
	DovaX1c5ILDoVoRThSFMe9bJSSP56VDS7owrWwzR+VC8CwZyQa+XOqAWHkf1tAAU
	BHWwjMqaixg6W1Zlx91XG1B1b+7ptj2WcgPmCsuSGt8SP8b5rXOkAFXppI8n1FDX
	1XIYx+8O1amZIAR+WBgjsmIoK8imzTOH6zhSfP2vRH5o0/GpEwl51XfMbCw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrraatkpa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:40:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ea71803effso24615295ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793911239; x=1794516039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7RcgiEmf6cf8SNXnvgtdIUceJiAojVx8uS+VJgMrRdk=;
        b=ErsiPv7GXoBHYjqEMcQ7d/3IkeehP8St/1RyJNZwtt13Dqkp3VoqEnXn90HmmhSYvY
         IbbFE8FCsmNyvlQj2GaYasGQGCrG+HATJSgogKvsXQlsQPGCbXQCFhh+VhjQ3tQV6ydm
         ffvOKoQUfxzB+uivo17aD/dpv3iUKXj0TkZq8SzWipuyE7Lvg4dkoR/EWwz2BKrEFH01
         AyoQEDxzLRS9my7apFXG5KXOJpmtQUpkuPvpCFSilw9pwOMPyHEMpuv1oV8Q5YbQ9Qmu
         Llm7ek5BAvazRd2C2K0EWcw6kH5oTbAOCZpKVdD+IY+6cxi/Aa+YwiAT46TvqFyDcWOg
         gixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911239; x=1794516039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7RcgiEmf6cf8SNXnvgtdIUceJiAojVx8uS+VJgMrRdk=;
        b=Tmb80zJfCAmbUfxBJcFCKELsB48WWg/ULdEJrmRHCGsBK5k3cVmycKn5s2RnX+Fham
         fPy9gvce/sS9K3HspXI7/lSxgCJ9AfNu3FbcP6uYQbnzjvPKxusFJIgpdxmzGFSL/BL0
         CCX69/5+hiW8Ptyegs8Cjw+VAs/a3+8WX+p77n5m6qgiHTfIlsq96Fn7xbHIHPbF66km
         GomDDqzbap/Etk6KhASFj8Upim23nxFjU0Wf2YIm7hXj2dP3JSP2OHFJGVHuTEnHcNGX
         Fz0NMiZ0OerH9qab78LaPjyKGA6rW9hulPHfeLN1icHmejiBmLC5rPuYPflb0PgC9NEO
         tmyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzm2R9bbMWB13TTJRnJUFRdeB2rw98faEdks4K0ADJuy/udhpO0r8HXfZej2zUtb0JlzxHSXyxC0Qnelhw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wQ/zOK0NrR5rA4BjKVAx2Lx7zQuyNbHn9ETCsSKT0fj4a5yx/
	fzwEcUF19i9YENFp9HUU6pPbrDgZXjFIiEf4d74crp0VCd7BsH3usVBNzC+59j9TRSmeIE/ev1X
	ajMe+lCr61dQeT1K9SeoJcqt9WZw5o4gm5Bh92Jzuyxb4MsFkw33GFLn3/F8WbTNFCEU=
X-Gm-Gg: AYBFou0SabKm3q99ELkn8KG4lJCHQrL8fpx0HOQ0HzyYtSlAK873rNrwJKZ+OLl5M93
	TVNMwqYPfiUPzVIhgnP5+EdoxzsSn/68+tryXfjrBpv3bToA5qboXjwqI2gbi5PFZN1uMNHVUx5
	Zj+dEGO+vzryo5ZFxqC5P4S8mRgfwowDQEa7qHJtLsWzT/PyTmaZmMVSrVegOx7KhYr6xLrTpX8
	PJ7dpctMvnBRsqLYQoxb25W/Afqmky2P7aZ+gETTdP5B+Mp2weCDpx8N3lLo83BN1T7DuAdeIig
	PWQP9Ik44FOJacEghMbeDUmgbZsUekzgncVpH6vCWn70wW1T4+LM4poA4yCrhaSnVUkmQAbAHxn
	U03gtU85H6JHMt95OzhMZ6s7kgzy0pvRXZ6r0DCU1AYHzRA4UywhEOfzrpWWdTfjiATCWkE8ihY
	QDWA5gCbUCYLtAhiyFwRoVtR5sJbk8GsxlhtKN9BnGNdESuaSnZNIwV5oMLGcnMA==
X-Received: by 2002:a17:903:185:b0:2e9:8794:8ce7 with SMTP id d9443c01a7336-2ed40c5165bmr7832865ad.43.1793911238835;
        Thu, 05 Nov 2026 12:40:38 -0800 (PST)
X-Received: by 2002:a17:903:185:b0:2e9:8794:8ce7 with SMTP id d9443c01a7336-2ed40c5165bmr7832475ad.43.1793911238375;
        Thu, 05 Nov 2026 12:40:38 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed0906c514sm21008975ad.29.2026.11.05.12.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:40:36 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 08/15] drm/msm/adreno: Fix PROTECT span length
Date: Thu,  5 Nov 2026 12:29:34 -0800
Message-ID: <20261105203057.66520-9-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
References: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX0pgsYHBPFEJX
 kc+NdvMg353fhm8AeEsqMCo+CdmYOqPb2nOybLXT8ABp0SiUQFbf+YoSs2yRkjWXBFRQb3l8Anm
 pYIPd32C79CdwxdG0BvuYNkFs3cBBJw=
X-Proofpoint-ORIG-GUID: T2kyJAdsbXESRDF7L32v58vPIzlVn8dU
X-Authority-Analysis: v=2.4 cv=U54Hnuru c=1 sm=1 tr=0 ts=6aece9c7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=MJDCpJTP__1aPQla-tsA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX+T0UYxv8+SFx
 2J61MU2QzA4IcLQXt2furU9DmrxU3ZOd2SxX7D8Hyp3Vc3L9884mZofh/j/Wn1hzNMbHz/TcspC
 6+mg/YVRkkDapQN6IEN5zHJu7aLo9UrqSY3pfpJLEyO+KulACNXaY+/MPYgDgpvgaog7zp+AVgT
 dwMTtx+l1XOC0nnWgnszpC2WaV2M3ezX8CHbgurhoQjKgQu4JqcJuURujXn4yk//CMK4f9+5G02
 xtVA+yhVfsdchuinySXpuTy0Bo/IAQHdxh388HNS18cf5rYJ2/0XFnesNBRlWvueIVqr114N/UQ
 7u00Z0N66oT3rphJiiYFSTC4BKBrPg5XgS2kyTFcDJaqaP4Lry9ccNDkC1OopVcc6leb6eB09pI
 oYFS+kEeBQl6d/kIHHMCTqzyvgkeNUPSpYXsXK5TMGDR7p4mipspt+H4I4MWbA+4aEHcJsyEzlB
 CWNI06k2bCyWGekkwuQ==
X-Proofpoint-GUID: T2kyJAdsbXESRDF7L32v58vPIzlVn8dU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050082

Don't let the length bleed into b31.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 4a3898e58aee..cfe7a3ed44c4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -244,7 +244,7 @@ struct a7xx_cp_smmu_info {
  */
 #define A6XX_PROTECT_NORDWR(_reg, _len) \
 	((1 << 31) | \
-	(((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))
+	(((_len) & 0x1FFF) << 18) | ((_reg) & 0x3FFFF))
 
 /*
  * Same as above, but allow reads over the range. For areas of mixed use (such
@@ -252,7 +252,7 @@ struct a7xx_cp_smmu_info {
  * single register
  */
 #define A6XX_PROTECT_RDONLY(_reg, _len) \
-	((((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))
+	((((_len) & 0x1FFF) << 18) | ((_reg) & 0x3FFFF))
 
 extern const struct adreno_gpu_funcs a6xx_gpu_funcs;
 extern const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs;
-- 
2.56.0

