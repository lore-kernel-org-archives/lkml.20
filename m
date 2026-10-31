Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463137;
	b=dWByr9edoiplVdNp5OUXZrU9L10198W1hi7AmyaKQTinp0PE/wRIi3pcZJyUjBC9BQVP
	 1rsMmk5d2v6WqpTcmVs7JTVjAEaG1ryPqGFY5LtWuWJp3XVP42DRMOqH4xCqUwTr6X7fq
	 7OA1E34r9945t35LeIzMLuUEblHdXG9vLQSU6jmLSBTjyfDOtUV6yyzVI6Fyj0aZ66B5C
	 kPjZnBkoXG4G/fyqoORAjPAPUtRtDePvmtP1T4zOa5BGrMpuoKGBatEONJXNmLoD0Kb04
	 keIwF6YiiUa+5AJ91YxCdJCuJpGnR3K6i8+hhOP+D/4wI/nTOZDdkKVRa/hDrBL2Lhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463137;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oWsw72PImj46weT9Ua70XV9rOd6NJxdtlKsXv4Qx7Ck=;
	b=BnviNJ5MjqSQaNDqtqE338IaiN/1HxgOcEY8476Jfbx0PDG7F40rTA6wgPmKDwRlALh3
	 +vUQtXYZemBHEx8s1VqwH3/E+rztJa63lMMFD16KM70zcQwZi4Jtx27zFPz4SgG3/Ocji
	 KJT7cSpRws9mmZ0U7aYpmG2zzKt9OIRvjYlvCh7s1ZEz4vNs6urUKGHmQ/1VXvzwtugC5
	 9E79iRP/ss4gnSSybEoNtOdurydeL22lq2vlqD/WZLAVwXKW3iTE/ziI9/y1Ri5xRvroH
	 tNgHDypgxNPaM4mfU867heGCI+vAp4j+48NoC1cp1rkFnFfSmb4//cLZ+EL1EACwvMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lr35K+LE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DEAmTvxK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52A7606A334
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:12:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B52A7606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lr35K+LE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DEAmTvxK
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD0OcT1126444
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:12:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oWsw72PImj46weT9Ua70XV9rOd6NJxdtlKsXv4Qx7Ck=; b=Lr35K+LER+4iVlQo
	9PNjD//6jwTlV4c8LtjGdhf4fvJU1LGsq1qBBgR+Ro4LHsgmGVJ3xcp2PkbRKlvl
	bolSG/CSTCs8e/26iHcwjFJRwCXLsSStJKTQ942sJfetv4cZMQHf0iUH0rhULHz+
	N4IjKJy7Y/gp9xVVc0zy+UqYXoKQEAQGIyEHtJIdfarX3dMARgcoJj5FY8/1p+GX
	XvH9xJeX9zS3Cf7XidRiW64Lk0V7JfULZZO9rnSRJ+gu9xmQCSEBJxW7VExBTuT9
	XWXeNlntpRRh1QzHBV15S36Tc+5gcFfWgDV2qAZyuoM/i7SQqj1qMdsd4esGX25R
	jGXANQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8q7sejy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:12:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ecdc701a2so197584385a.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793463135; x=1794067935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oWsw72PImj46weT9Ua70XV9rOd6NJxdtlKsXv4Qx7Ck=;
        b=DEAmTvxKQMXv64VHT7UuLML6yC7chTtO9ZdJch66Ds1QvcCGdyQhTcFPyHBj0WYwVH
         ykEIlbQNQ3Fu29gQ5G6hIgPAC3dBQjMkg5ct+4LjX0aQs/7vevS5bv5EIP8ZpLuzby7l
         ZsoWX9rzTdOzCG+wsiybDEapy+Kd6ZOKJ76wuKhvV9N2INlRv6k5SpLtf0N2xiETtQP2
         dmUICUOmE+lgtslIyiHAOdb7IokTpwiRktBVydDEk2+KRFEg5hG1BIPh4dskqLLRNs1G
         SG6QqaZDrxE9Uvdj4bWZm16yBDccd+1PVPMdAg5kkZu4hw7mJORR4pndgpdDm/aoqn+t
         jztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463135; x=1794067935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oWsw72PImj46weT9Ua70XV9rOd6NJxdtlKsXv4Qx7Ck=;
        b=z0acQ+i6anHTEIpT1cjlo+T5JKHd0AEPgMHgT1tw1WSfezHGm12MLh06divddQflRw
         /yYXIsTOESwqlF5AT/WsjMzt6b0CvmtrQGjrb6BrXAPCLVdMSNzb4FvVaJFrBS4OZzNv
         vOK872/uAaH5MLsVsLYAoOg4IZZVC90z/f9S1XcJIKrKE4yGoUpCUBo5WFaHa3MzeMd2
         4TVAj2RtZrtgYuMWl79L25HV8asspSJGvpJ3nG+6wRdm/UBTh7aUijgOgfqWr63X6uFh
         F3jlaC4V1aQr+UrCpHXekXlVacWlcCB9jfFDzGcsN/S+E25lipKOyKzNVfwd5mdHHRRV
         nWNw==
X-Forwarded-Encrypted: i=1; AKwUvBwpVHwkuhTrIbNIc8G8LDn6G6sFr7XNJyYzwXIduljbEvW99HSXFbJBstBD+4ymBzwBoo0z/WbB5mr4PkM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2qOmNJXxwqGQ0tf0qXITJqR74tQFQ87twyE/z/mPvKbnxH6yI
	6O2qwQ6KxoJYFnaoZ/YAH5fl4ZSTn6G2bFGOFstEe47IrobQvkupMXPOHo+6Yj0Md09+i8sDPia
	9TGZBSKE8JNVLi2EbQC1FZ4YttLX6/OB+3KO0CEIreVrcIfsbD41AFX3zXUNqA4VI6ts=
X-Gm-Gg: AYBFou0V11FKh3X8oWvQ/AqJoMqdz3hl3vx2TkuBSyNbv/NGpk7Hx01HWDcGj7WmOU6
	df4MF5alpBn28Ol7uwc84X4Jns/lSGFV77otytVwF3B5/iB0I4xFFumzha4HZpsogeUi4XwPtrB
	ygYK30/BjOySBjSU9e3GoXqjnt4PwJK/TobhipXg+Lv6OpZqXmQUI1/+jv4QOkZkiqEWAMuyTHf
	FgBtJol2PSwcuBXIFVF5BogqyJwAa4j/Ay1441sN1YomaYmd8AyPkMXtXSY+7z9Me+IX1bYxqOY
	8246l/XpnFOcvhDTRfVIrWQvlyPLDUkkhXlubTpZQDu985UaunfPkVYR5f6pmbYvSDByByXndYC
	VVlB1NFL45hRQpmt4353Viv8iswOIHJtNcYghU9EyVep6+njjmHmPj0yOEU9ptN5rYTT1SHegbU
	k+5+Lz6CPN80OqvoHNJ8UH4RR8G9hxiIjZGMgqDtE2Lwvm6Th1w9IvLKR7XSFlIw==
X-Received: by 2002:a05:620a:44d5:b0:93b:d7a2:dd2b with SMTP id af79cd13be357-9442175e4bamr928061485a.59.1793463135037;
        Sat, 31 Oct 2026 09:12:15 -0700 (PDT)
X-Received: by 2002:a05:620a:44d5:b0:93b:d7a2:dd2b with SMTP id af79cd13be357-9442175e4bamr928055985a.59.1793463134377;
        Sat, 31 Oct 2026 09:12:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe0720e3csm666666e87.28.2026.10.31.09.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:12:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 18:11:53 +0200
Subject: [PATCH v2 3/4] drm/msm/a5xx: keep the timestamp offset
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
Message-Id: <20261031-b4-adreno-timestamp-v2-3-0836856b228f@oss.qualcomm.com>
References: <20261031-b4-adreno-timestamp-v2-0-0836856b228f@oss.qualcomm.com>
In-Reply-To: <20261031-b4-adreno-timestamp-v2-0-0836856b228f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2357;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lYY/hrbAKLPfEA/li7VCmu5NLk90bGLkzx4vpVBQR7w=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9Yz4aAClUs9BUlbdRZzb0vMYk65UTjd1mrmXbNd8dkzt
 F6GvFHpZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEBK+y/+FhNkhtZvOz+H4y
 NUaVo/pXC9OaCp/kS3amD6ts5zsx1Ksp3Ps93+3LOsGp1+fZFlww5vZrnyPy38zO+FNozpaPxm1
 RZ4pMjD9vWDrPR7tL40dkcHRFaFZrwdGdsxwnMsY/yDjVcFRta/FyCWX9umQGoaWSD5vPfJKPbu
 E6LCG4sFchU2a2XpuleYPwYutJzXx9q+8+iGlqtV946l5GfaK2bsn0YiPrMuk5H544HVJqMuNzC
 FaXl8g7WV0s8Hy5jmGzxz1JMcUdT9sCGfmP8fwoPCmfKXuZ3dhutkx8t8bixGT+XeG7lrRnMJ9e
 92hlv26os1zS2wXrT3tf5xL0tFbrPvjbZ52dvtH1VQA=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 1kgka8_nUW82UfeycRz8UrLcUer9F1GU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA2NCBTYWx0ZWRfX5UMDuPxa+rNR
 /TBBRE9lm10p2toTWocY+FyiKK2YhvkrlgkzQGNEtD3hAYmEPyBqV3/YdKPy9INzi7yoIopKV+/
 Wyrb6wN71Pq8yvIlyii0bbju3tse2kk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA2NCBTYWx0ZWRfX0h3pWzD02jNo
 Jn0GALCpEAvX+TQvZm6AY6VIpZrdRxWlG+MD4hl0WK6Pdsba7baMuWx6JTd17qU63fYQtbLOxgn
 U8X3AMQnqhDLdA77fvpwB7OgIApinDo6rd/uLOlyEvWCXqhsMfz3kdJo4N+TSrEEd7krLksCFNA
 amDox5Kc0RR7oMIP1zT7Cyj+DREgz1hBoftzBGyzJ1puWLSsYt5zbNnqk5kYuR7sO6ECfLpaPlL
 dgo30EKnt7Mi29R17wHGFR6JJcqU2LBwD7b3aVGR2z/MpLhb1sD3Qk59unRUNh+R1k5r3AsQ0IH
 JR4bb6Zk7v5BOhn8jPazEYuiN6aVpSVHINVTg8tM+H8zhmAYw2SwoofhVjwVzDniQDqBAqDd046
 R0pOR5U+mG2RiWdsiXXQ4Ds6sep3Ppwdg4LdDK5dXieFgptM9r9hEC3hTlSxb6Rfeg+TD7zXMrb
 tuTD2mv8OqZV80d/XtQ==
X-Proofpoint-GUID: 1kgka8_nUW82UfeycRz8UrLcUer9F1GU
X-Authority-Analysis: v=2.4 cv=PucG/AM3 c=1 sm=1 tr=0 ts=6ae6135f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=G0ktpma277rnjfAblZIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310064

The always-on counter of a5xx is in the GPU power domain and restarts on
every runtime resume and on recovery.

Save the counter before the GPU powers down or is reset, and restore the
offset once it is back up, before it runs anything.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 16c7335c4b1f..fbb92cadf94f 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1025,6 +1025,8 @@ static void a5xx_recover(struct msm_gpu *gpu)
 	if (hang_debug)
 		a5xx_dump(gpu);
 
+	adreno_timestamp_save(gpu);
+
 	gpu_write(gpu, REG_A5XX_RBBM_SW_RESET_CMD, 1);
 	gpu_read(gpu, REG_A5XX_RBBM_SW_RESET_CMD);
 	gpu_write(gpu, REG_A5XX_RBBM_SW_RESET_CMD, 0);
@@ -1374,6 +1376,7 @@ static int a5xx_pm_resume(struct msm_gpu *gpu)
 		a5xx_set_hwcg(gpu, true);
 		/* Turn on sp_input_clk at HM level */
 		gpu_rmw(gpu, REG_A5XX_RBBM_CLOCK_CNTL, 0xff, 0);
+		adreno_timestamp_restore(gpu);
 		return 0;
 	}
 
@@ -1399,6 +1402,8 @@ static int a5xx_pm_resume(struct msm_gpu *gpu)
 	if (ret)
 		DRM_ERROR("%s: timeout waiting for SP GDSC enable\n",
 			gpu->name);
+	else
+		adreno_timestamp_restore(gpu);
 
 	return ret;
 }
@@ -1415,6 +1420,8 @@ static int a5xx_pm_suspend(struct msm_gpu *gpu)
 	    adreno_is_a508(adreno_gpu) || adreno_is_a510(adreno_gpu))
 		mask = 0x7;
 
+	adreno_timestamp_save(gpu);
+
 	/* Clear the VBIF pipe before shutting down */
 	gpu_write(gpu, REG_A5XX_VBIF_XIN_HALT_CTRL0, mask);
 	spin_until((gpu_read(gpu, REG_A5XX_VBIF_XIN_HALT_CTRL1) &
@@ -1432,8 +1439,10 @@ static int a5xx_pm_suspend(struct msm_gpu *gpu)
 	}
 
 	ret = msm_gpu_pm_suspend(gpu);
-	if (ret)
+	if (ret) {
+		adreno_timestamp_restore(gpu);
 		return ret;
+	}
 
 	if (a5xx_gpu->has_whereami)
 		for (i = 0; i < gpu->nr_rings; i++)
@@ -1824,6 +1833,8 @@ static struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 		return ERR_PTR(ret);
 	}
 
+	adreno_timestamp_init(gpu);
+
 	/* Set the speedbin value that is passed to userspace */
 	if (adreno_read_speedbin(&pdev->dev, &speedbin) || !speedbin)
 		speedbin = 0xffff;

-- 
2.47.3

