Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793305078;
	b=Z0cVpBnWzZ0oTztZ5YKJLpUPUCXeLJ6BKo5ba6RaCza9cC4Sn+suedD4kt3eX+LAPqeL
	 B6qIpxfFcq5XXZONqNZEnUbPnOX5nDzQ3Z1HQ7WZcXYLwj+G4II4aRqFjwOHgJYgPGffo
	 9m/WH0TDv7g7d3F7C8nVXMI3uTSSaiqL4Hgbw9Tf05j8CGA7ZZS+lYVMZGxxnBR82h+2U
	 wHYuM0mCj9KuTwgIGLGpDrJOVeKk0z4jDyKx9qsKQsN/EHvSU8/yp/fG3+sLz/aLy+Buy
	 q1jR0ZMc8r1g6c/5B8M6nEsenA5tAZxjbfpM6CiyMreVpVh4Z1hvVw4nKh36K8n0o3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793305078;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yTsteG5a3IaJO/lb122nv9JtPhW2mkEDubQMWm/3wXI=;
	b=fLgZkPix/5ASChVDD6FAkN+zhavJ0CvLOb+RPpiklMPafYV30vfaQS43quX2oZxqdbi0
	 gTzYGzMvaskpfRrI9G7ogiiXCZuA/TYAphq6ZCBVkeMIoq96J0EVSUHrdFWSz4j/2JF6b
	 JmSiiG2JLtXEOTZbLaK/ZSPS3nVNnv3GvRH5WCh6sXSfAOVd9SnoCgNgNwJbWFKc4HuHA
	 X2XnWvXfJWMx4yfT99sqKbqtWiB3vPc2jnd936RgHskLSrVgOsHC/HvpqRPH/JSw64eEI
	 KCDin7WQ/5cRagoOywUrrU8vBlXE0oR7LJKVclTOYeP2MVm88SDlM87F8BKvUHyp94w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VA1PesVq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XuzV5IPq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBEA606A339
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:17:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CBEA606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VA1PesVq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XuzV5IPq
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TJkIYL3718814
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yTsteG5a3Ia
	JO/lb122nv9JtPhW2mkEDubQMWm/3wXI=; b=VA1PesVq2urWe65w2PmaqXdjLxb
	p2iVzsPBZpEMkXpV/C3taM1Rj6CMYHclPnntq3FejbeWQGklnSBUsQq25KQ119MF
	nolz8Hzb8cK0a/0ZEG3a81noVr3ARSK2HXXDZxNGWfXMN5nYAIpQS1Q/bp9OTUVW
	FMXcCcUuCdcJ3Q5finPQL0btGxGAXVXLGOJ+DqncC4vRWpuZpxzQitWeAgr4ggqP
	oCuX2mqfMwU4HEI5ZyTiqf+H7reAR7YEzVIQF+wwjapNDl34rvflgRrs0yORA6In
	IDZCblL1xcaHmysbcGWnhizTHd7VjF1ZfggEvtcYdITrRY0b7sH8QCUJLdw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm31b2xsu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:17:57 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e95f8543c9so190425ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793305077; x=1793909877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yTsteG5a3IaJO/lb122nv9JtPhW2mkEDubQMWm/3wXI=;
        b=XuzV5IPqqg+456cEzd1Zhg58JXX9XsJbv8dJvDk9zdvL8SoaByNkqLwRO5RtTMY7YS
         s9eEEMLmHO3zcyZnOFvMAh2cvdBBLR4lLk7EAB2TVOSIBMAHB1eXOck9sr1qtYWH/azu
         vfRsnjhQsfN1g9fGaCuVanbWutAzJzzQ3cJ8qmDF8Tjg6jhZnncCMKWMxgH8KrnbIcs9
         NWTfVg6c2LoceTELs/rghWhKweGoBGzkas51lw1s36pkSSFPfNn4K8RP04RdnAhWRO1N
         /hi9kzWOzFInJN8g/gcQzh68eEqpFPNi9fHH1N7TY2Jc3rcnod3oNUoXge9vyxBaLxH3
         mE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793305077; x=1793909877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yTsteG5a3IaJO/lb122nv9JtPhW2mkEDubQMWm/3wXI=;
        b=0B6O27yMtsZgDv5IohBnc9G+YPCbc2d8o/BU7wPBf49UGL4HWxKSAe/5QHnqsE4RNk
         3lrObNpxkHviTW7k7tcvuZPupY9b9DL5CdiQylRCz5RMukxL/TZRiRoQnK88kWLfGU1N
         eY2wiPpxN1jxZnJmdkRaREymDdmFGv8FcVm7wln9X9svD3iuUSy5Hy0CgMqthZT+1kHd
         PpoEESxA7rdIKd0I4GgsLEQJjhDZZlMksZHM9gxkJqZTwhsi2SPyMQrpnOIYLAHn1fdr
         axHOwpl5/q6jpb+9ymMROxsgqeFRdZdojpgvsO64Q8XegIjxmI/9cwqELjQt+uUgxqsv
         bC6w==
X-Forwarded-Encrypted: i=1; AKwUvBxF7l20hCJ8vINdwwbRS89EpfwzL/CdScceEKHyv+oM5T9IQeRhgnWzr8tULeqqW7/U2ygO4TouvoBhSGg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgPfkpdWHzWbZ2n9CtxDhr0WHP4H0IEM4GWz48j21gelAnPiUb
	B2wIcEgNMJZnKjyhZgSOeKd4D4UohrE52hAXoyH95TkhEQRYoWN7QRAXfR2oIuhly4rCtRi4qO4
	JmZd/egmN+EOjxv7D6sRlRdppza3FIJ9e+X1ZfMuCy390zIJcDQxMvkD2xz4THXdtBeY=
X-Gm-Gg: AYBFou3CDL5FiyG9ekw8qLEzxCSNmw9BnMIThlnP+PFBxhDBx57vYReKdqyqaGu772f
	nvRaKlgdLekXWVLe7uZzMsQX9V4EyKb0wh5wAozqo/cdgFDi05wNt/XgTgCSg63XXItZPEGHRrQ
	e865zGByTMlzTouuK/J1F1KCbEWRXAO7BJXK62xFoQSQQ1ihH1hmurhJ32VP22+N6uaDoxpUDg4
	lUQCng7tiEU+gHg54ltOQ0vUsRLddc+lnFRvpLD5re/8MesfOkXBgUoHC7CGwRN2PDVDKiqi/2R
	HrHXwjkqVRbLa5fPHeAqw5hUFl0peRBaks3MS86QPT2Vj08azXIvuuaHZbZC/W4ASmdlY14Wwf1
	6Y25wg9WluSETdtDpq8RhAfD6p8lo/jWJpM+jcJgEsxhMxL/3D6qGHjppwj60nj4ZaG20jTKbwY
	Lngi85/IPpqe+u7YT/7uHanqk=
X-Received: by 2002:a17:903:41c9:b0:2e8:2d05:9780 with SMTP id d9443c01a7336-2eb36414e25mr5294025ad.8.1793305077223;
        Thu, 29 Oct 2026 13:17:57 -0700 (PDT)
X-Received: by 2002:a17:903:41c9:b0:2e8:2d05:9780 with SMTP id d9443c01a7336-2eb36414e25mr5293905ad.8.1793305076784;
        Thu, 29 Oct 2026 13:17:56 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3694e20csm567305ad.53.2026.10.29.13.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 13:17:55 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 06/16] drm/msm/a8xx: Allow nonctx reglist to include GMU regs
Date: Thu, 29 Oct 2026 13:16:16 -0700
Message-ID: <20261029201730.151754-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
References: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfX7yhEFi6s99HH
 EUq32Ks0VfZgkltrvRN+66MYdHuPtI1ndSkjSSthbVTyXQXVWBRusBua0XNyX3bZpu6aKxxqXPb
 iqG8LevQqyN3hRHUA76OOLUYiSJxoRw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfX8FsSIZA4gY5b
 ELmIqEpprdj7alfdhTkeHQHyVI+YyCA5JaKGCdXcsRvkc0yKsAjTIGpyImAkEoBUdjKPvynJKsu
 OFOsKPqlgYnLLmHmFlOf58uyibXpikLqfHHeXCBTWWfpE2cf4vCMQNiPYQb2TCSduJ3n/If4YFV
 PRYsgZ3tXcuyVAHmHll7Nyh3VHY661JAh9/3JjAGP1ire+5KgAQfg3zO+JsBRq176QL81buRvER
 73NVxPDU+/4ciXONy6Yz5zx2ZXgMaYYnnWNIi5LJuAJ75PdouOgy17m2fH1FODUibA0GRosl3Db
 YdVOASLZrmxJ4ujnt9XLj2Rq8tu9Q0DwFMTMH0PVcUgI88dRr1q1REH8M8rdtImmNtvO37XWY5P
 iy0zqt0Xb+nzx/CSSIuu6Yd266Dt+AaFKQUVmIE5tfL0C/r8MLUREdDG6HA/WERvhrNln7i8S+I
 UclIOkjvJi/TWvL2Ytw==
X-Authority-Analysis: v=2.4 cv=A8T5rKWG c=1 sm=1 tr=0 ts=6ae3a9f5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=cg0wMmP-TNBUvudz7-YA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: wmAq5gyNnHXXEw_1sAa4A4Ldl9GivyEp
X-Proofpoint-ORIG-GUID: wmAq5gyNnHXXEw_1sAa4A4Ldl9GivyEp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290079

From hw PoV, it's all part of the GPU.  But from dt perspective it is
it's own device with a separate io space.  So we need to detect this and
direct writes to the correct place.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 8e91edf16ec2..795c16d88f45 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -370,6 +370,7 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gmu *gmu = &to_a6xx_gpu(adreno_gpu)->gmu;
 	const struct a6xx_info *info = adreno_gpu->info->a6xx;
 	const struct adreno_reglist_pipe *regs = info->nonctxt_reglist;
 	unsigned int pipe_id, i;
@@ -389,7 +390,11 @@ static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
 			if (regs[i].offset == REG_A8XX_RB_GC_GMEM_PROTECT)
 				*gmem_protect = regs[i].value;
 
-			gpu_write(gpu, regs[i].offset, regs[i].value);
+			if ((regs[i].offset << 2) >= gmu->mmio_offset) {
+				gmu_write(gmu, regs[i].offset, regs[i].value);
+			} else {
+				gpu_write(gpu, regs[i].offset, regs[i].value);
+			}
 		}
 
 		a8xx_aperture_release(gpu, flags);
-- 
2.56.0

