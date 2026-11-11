Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402338;
	b=olCjP0JWXduMu6LK1DGpbsmob9tCyVugyCEexAnGyCBMuyXrMHfndgCzi3ooiUp1ILlu
	 eTLTwYo+Oz1dY1zNz9xzUFvcMCdzi5J1HTgBOMNwy+N4r5VbDU9XdF9lfsPTZvif2qW8D
	 e8mvkwTbiN0D44NVk/t2X7PcJXKxyScKUimEicHf8hYvdIapxagIkgyI5UyTMwJiyVQzi
	 BqTlVdSplBkcY2ae0dQ5ROTWZVeSW+TwJx1UGCCI5KEYyOh3cjkLYmuhqihq9/vU7obL0
	 97Sr8ySu8P07JorY7eVDJ3Q9EIXXLZxfRVYRAPy+rCmEU11/+SkklzZhEzyRK5k5J3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402338;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=f0yLKNDnww3+SWei9W0wFF0Lyh5I9mQALCn1s9fx8XQ=;
	b=14qpwaEHpgQr/XhhgnhWhoGh/mGj+8FJHQKT81xYX+p2N4GgxsUUvxlJhEbj/8fGB4CG
	 QVqxW0tny8CIDTX9iiqoOUoCMaAFG7AmiAoiie3SGDKaZSOwrnI7q24u1zhDQPMdk0VPv
	 Q3tcPQkkKTYCT6vhJNd+Q1jsmZ8UVb0AbOXEgjyDBQn+q0LHEKyr84g9AacO+YErLtrV+
	 /f0vjqr2D/VPKB+Una30x0+PsRwKNZQ1oc5VZeTNV7SbvbudSQst6fdYDVRkHNkFUP8OH
	 lb6FLxepNTvkfikhqc5tonSKUR9bz54+VeUXYpgLAkJlNQkhyTNdwtxQyMgp6A0rPzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J69cEcXE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UTQhjtVD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D6B606A88D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:05:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37D6B606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J69cEcXE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UTQhjtVD
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCYoHv1358966
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:05:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f0yLKNDnww3+SWei9W0wFF0Lyh5I9mQALCn1s9fx8XQ=; b=J69cEcXEocePinNp
	ktr5ECqTOG0reESmo9WM3Mp/rDX9ndBwh+XcJwIdhZZMTURQ9j4KO9i8LtA0YoVx
	HzsyTJDImNCl1X1ntReEAD6SiYAp+3gI532HRqWiThEzNwxJIS5HHrrvGXh86hhY
	tJBKyDSRpnIh/E5Q/Jnc2j73MK8ATjspY4SE8KgBHh7AM2KH3GgcrEDHe/YuDtfz
	IoCoYXFoQWXXXKfEqiLrYQDYLKk+DfgGnIEiSi8EOZND/5P139+L4CgPSsE1EsMj
	eY0O+lNFZzhPtQSv0Z+NbR3p48su5ALQjsrU+wAibhkbOM/QzohCA4u7Fb+QYg/i
	NSzd3Q==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvk7psbus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:05:37 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eac2cf3905so658209e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794402336; x=1795007136; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f0yLKNDnww3+SWei9W0wFF0Lyh5I9mQALCn1s9fx8XQ=;
        b=UTQhjtVDiP+C5lJ0mpZ0p0HQE1MFYu+4YjvHWCyo3DnOf6AzSdK7ltYtGe/iEITqju
         H+r4Ace2mcI2Yib+QlrAw7g3ps+9WpYuYOa5odTfEObCY+5zUddcPukfX88NyJfUjW42
         ewf+G3BhdTtRojvWRlykMkIXVzxCHhHNcrVZABLktu7M5pCsQLiwXU9iK9tNjUa+Qzwa
         q9a7z/VfAAVZpMCsnVoMp49RYucp+b/oVISZvg4pBdaY3RPnewJsrKd81F1V84REbpVE
         zybVbI2Lkvk8SPb7Q59RFrx0W06/VL5Qy8uZ8ymeBJ2OvDf88nffLa6BQ7r0Ai4WqSix
         0RqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402336; x=1795007136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f0yLKNDnww3+SWei9W0wFF0Lyh5I9mQALCn1s9fx8XQ=;
        b=mSiKIir0d6Z4ZIjBCpwi8bjhoiQvLn8lBH16lDk7HHiCxjqNzyGrJo7Xo5UgsLTTGi
         DYw2R+NPFM9ZoeU3WhY8qgRu4vNCjgRn/S5b2ZeIuqQnJonkRa7t+RfbaNAUOY/idD+x
         szgcvKjDFNiwbXwFhPbUjFaRe6saVpynRaLsVE6mlfnruIw0gZf3a1GqGOVCsM+g7TAD
         B6na74HeeonkVW3TKNmOxnOW13KPWW8ZaugqnYFvphNzbZ1VsKjMHhaMpMRmDSLbaBWt
         aVFFUQ0rQ4O59V/1+/h+6w96XzC5QnP3A+F8wlRJYG6EriN8HVfFU5CuF9ctOJDij5y4
         969g==
X-Forwarded-Encrypted: i=1; AL+hErG0y2xMVJRzv/PG2gC8Y39pt1bB73BQ5WXdP5FccwuHbU/sUHRaOQuEHMw/GJHLVsNwR3ohE62aojdkFl4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6CvfTjjpjD/dBEoH/uPd03q+FaKWcf48skAFaDGCCscAB+cCH
	+fBUmqueP8OlI4gRTVFBOEG12Yt+DsE7AUdzNaCquS2K9F2y0/2jEDQajMuLfFxt5L1x/HSY4MS
	2hneenqb6HJOpFNe9wbLhmOWfLzxzPzI4RUmuFR4MsYSeDRYmvdlHdUbZvMn9Gb9r4NwR5gFEWo
	k=
X-Gm-Gg: AYBFou1U7Z4NY42PrGn7cY7nXU7nJ27jPaAEVhX8n2ZsR9iHsmcXqaAJ+W4axiqaMQ+
	y7XLOJguZXnOwk5H+F2MgBuY6ZsjkAjph8oGv6cl7UhxmmL3I4PZJFtgL9D8TspPZblZDqMOa9z
	g1ymXI3M0fRUzNVV//1gfHJmmkaQWhfymVK3l3r0LYA0ZQshlo1zo0ih84Wp45LA7msuvDw3aKs
	IjI9BB+giQp8eXg5rF81NvgY/R7btPdDTJVjwP272FWVfn5noxGCZWPpl0A8/B0evoihqOoiwlW
	xxh1d2RzPxvewXgrBBik8naIyj3z+h1krM50vK0ILQGOOFeIIjLet5W/OK7J4eKQchoiXS8Hk02
	CTBlB+I7r2fGqs7GrVSgPc8nP/aimRQrH2popKTQU2wbfGGyNjVsW9CnIjvSVuOJqop247zkBiw
	KJRmX1FJB4g2aAhluaEkOYeG1ARblMzCKXjQjfCcGduYZDepQ/UKMwBdlncqoyIQ==
X-Received: by 2002:a05:6122:1d12:b0:5ea:bfba:f540 with SMTP id 71dfb90a1353d-5ee1c2a6763mr633790e0c.1.1794402336468;
        Wed, 11 Nov 2026 05:05:36 -0800 (PST)
X-Received: by 2002:a05:6122:1d12:b0:5ea:bfba:f540 with SMTP id 71dfb90a1353d-5ee1c2a6763mr633735e0c.1.1794402335957;
        Wed, 11 Nov 2026 05:05:35 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c15d368e81sm391858e87.21.2026.11.11.05.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:05:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 15:05:15 +0200
Subject: [PATCH 2/3] drm/msm/a3xx: update the CP protected register ranges
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
Message-Id: <20261111-a3xx-fix-me-v1-2-d81f50f1ba1e@oss.qualcomm.com>
References: <20261111-a3xx-fix-me-v1-0-d81f50f1ba1e@oss.qualcomm.com>
In-Reply-To: <20261111-a3xx-fix-me-v1-0-d81f50f1ba1e@oss.qualcomm.com>
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
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2505;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=yYLTV1UC5d8C9jbVkPGq5PBTKlPR15ETUs1okUVkZbM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq9GgWL3UNkz7B8bvNeikBWcZLqWuj2MuVkKlUq
 fL7BIzn7zyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCavRoFgAKCRCLPIo+Aiko
 1UkLCAClAyTvcxSGuBX8eg0VNRKvnt3YdEdyJzN6NUH60tRNVAdUyU9FgVMmRmRqbgIG4kV2ef4
 9c17D+r+1qj2E2easVWI2qlxqUIAXCp5PAAWUROAQa8k8BiYn4a/rS3MWS81RSkSuoC9DsC34H7
 eWaX8U+rOmx54Xk0+/EkCv0NarrywElwyCYwn5063k1u/8NOYAc3j+PccwfAn2WESbXv9bUhi/f
 V6SaXrFfaZag3VrW2F/j59VNOtyybTFu6jaQVPGDHZG3L/8am6e6tUIxolhZrm93F7S9x2LL8wb
 idfW9vzevmBwKianIvP2Au1ZUpK0sF8kycpEL0MOCzaxkNY2
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfX53BbUXTZEaw0
 7FXCJzQ+Kczxgyg83BUr6Obidi1bNxA+5Z4azA/ReDqogy4AANaeHj9ksQhvGGs9jFs7VbRV5Ha
 lZ1UjxPb9ygw72ukruIs5qBO5+oP8nM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfXyh3ho8IQC2Yz
 rbADkP6dfv0pTYG0VK238lgPMCO8wXR5WVAtvzR67bZLBLUGBDKTqNNhuuYCwLF979mBWne757n
 fE8O8lU1W04hNW8Zfa5QMZ7N9g9gwx/IzJSpjI5Wpuy9X4ShmonFltA/Mz0Y/iGa3zL7uwZVfUP
 j1hKo8ETTe0n4YYfoBcXJCKCnk8Ekrxm+Woltw7EITKTZAMKMICvd26CFTGnjudcbL/f3gbu6gg
 tU4ub3XaQiMqAXHjJumHQwI3R+foQz6K+SNTMcD3rQ6w7fuqYsVj9tJEsPy+48D3OqXJpzWNXGT
 4u+6iwt2U3DeOc+Jer37Xn0QTPDILbbngLkoYy/xHvaaipKtXu458DaawwLFj9m4iXwQpmagaFk
 aCa4QEtWFncLel32DEE2RAP/9djr/30L2rSS/ohROuBA8Kw8McPEHsj9kKteGs7whlbkelY6F7/
 S/U0zhKJycZlhLrM2Wg==
X-Proofpoint-GUID: atmzuTpcYQuSj7J14o4T0M70Nf5XRrDR
X-Proofpoint-ORIG-GUID: atmzuTpcYQuSj7J14o4T0M70Nf5XRrDR
X-Authority-Analysis: v=2.4 cv=BpcIUoX5 c=1 sm=1 tr=0 ts=6af46821 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=GtkpO-_-v3sBSqm_DCAA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110052

The protected register table was taken from the msm-3.4 downstream
driver. Update it to the ranges of the msm-3.10 kgsl driver, keeping the
wider 0x100-0x13f RBBM range and also covering the VBIF QoS and AXI
registers at 0x3040-0x305f that the driver programs.

Fixes: 7198e6b03155 ("drm/msm: add a3xx gpu support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index 7e03b7305493..1de4277ebf9a 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -288,25 +288,28 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A3XX_CP_PROTECT_CTRL, 0x00000007);
 
 	/* RBBM registers */
-	gpu_write(gpu, REG_A3XX_CP_PROTECT(0), 0x63000040);
+	gpu_write(gpu, REG_A3XX_CP_PROTECT(0), 0x60000060);
 	gpu_write(gpu, REG_A3XX_CP_PROTECT(1), 0x62000080);
 	gpu_write(gpu, REG_A3XX_CP_PROTECT(2), 0x600000cc);
 	gpu_write(gpu, REG_A3XX_CP_PROTECT(3), 0x60000108);
 	gpu_write(gpu, REG_A3XX_CP_PROTECT(4), 0x64000140);
-	gpu_write(gpu, REG_A3XX_CP_PROTECT(5), 0x66000400);
+	gpu_write(gpu, REG_A3XX_CP_PROTECT(5), 0x6000018c);
+	gpu_write(gpu, REG_A3XX_CP_PROTECT(6), 0x66000400);
 
 	/* CP registers */
-	gpu_write(gpu, REG_A3XX_CP_PROTECT(6), 0x65000700);
-	gpu_write(gpu, REG_A3XX_CP_PROTECT(7), 0x610007d8);
-	gpu_write(gpu, REG_A3XX_CP_PROTECT(8), 0x620007e0);
-	gpu_write(gpu, REG_A3XX_CP_PROTECT(9), 0x61001178);
-	gpu_write(gpu, REG_A3XX_CP_PROTECT(10), 0x64001180);
+	gpu_write(gpu, REG_A3XX_CP_PROTECT(7), 0x65000700);
+	gpu_write(gpu, REG_A3XX_CP_PROTECT(8), 0x610007b0);
+	gpu_write(gpu, REG_A3XX_CP_PROTECT(9), 0x610007d8);
+	gpu_write(gpu, REG_A3XX_CP_PROTECT(10), 0x620007e0);
+	gpu_write(gpu, REG_A3XX_CP_PROTECT(11), 0x61001178);
+	gpu_write(gpu, REG_A3XX_CP_PROTECT(12), 0x64001180);
 
 	/* RB registers */
-	gpu_write(gpu, REG_A3XX_CP_PROTECT(11), 0x60003300);
+	gpu_write(gpu, REG_A3XX_CP_PROTECT(13), 0x60003300);
 
 	/* VBIF registers */
-	gpu_write(gpu, REG_A3XX_CP_PROTECT(12), 0x6b00c000);
+	gpu_write(gpu, REG_A3XX_CP_PROTECT(14), 0x6600c000);
+	gpu_write(gpu, REG_A3XX_CP_PROTECT(15), 0x6500c100);
 
 	/* NOTE: PM4/micro-engine firmware registers look to be the same
 	 * for a2xx and a3xx.. we could possibly push that part down to

-- 
2.47.3

