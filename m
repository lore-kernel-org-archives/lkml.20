Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140FC39A7F2
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 23:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790464820; cv=none; b=RJZDYETe7oRTNctVLX9/i1WHh4UMZw7jmFzU1TU5Yxdkn9lKqtoJP3dEAz9FLUXsNcdHCwa7ZpXUHI3sTGdJQsZVSd6UAyIRWD254hbSmlzi1sZJeA4neyxYN44sLMFCEHTw8siGJ1lP+uq1yXc+rpREPjiF9V8v4Gf8v8iZFp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790464820; c=relaxed/simple;
	bh=cvRrPOLxLPbCTpWLiVr6CL+JUOrTZCa+HknyxlPt9Xc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mdRAh1zfDX7OoVebg2nGYWLsxDRRUcg8s7lvZBFBz1iAizaMIgc1+DcjyHs234OEok+RkyNjfba7mlMKAnD/1LRT2SnaHEgw8vNuptvF75g3cJXxfO2mKXuPvRD4lOerPKcUpoKYGHaJ1X5dBbk1vbMp4DXj9V694+yERBFabh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CX1rw+2t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZAORrv5o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CX1rw+2t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZAORrv5o"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QH04sR880315
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 23:20:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+vn8HrnSp9wF2lXt9UhWS6MvVRq28DGOOCapdNx+WUc=; b=CX1rw+2twDjn+4VA
	HMb8y/B21mJoCrLzPHMocGYhIEebF2oRflUlWza2j7hKvw1zbHfWewAwpboddIwA
	4HJlYdW+YgI9kkUDhBBhpfflM4Xn1D1iZzbCqf9ess0lhvLxurxyILAtBx3nRP4k
	V7FNZuMcae+8m2BPDRxUPUDVaB1/PqX6WD2koZ5a62KMdFSBk5UNdSIY2CwR+D3K
	gMpIsOMadIyV6rT1AR/WnvnfhserKuuRFmqEAsbSL3hVtob+Y3WfLVfwICNK5ZYB
	Hl8uQEShMKggDX4dSh82EUEbkK015UyNmO5zaa5TBiKOMJWJvvNAmcde8iP8ojy/
	4OqM/Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx5mw9xp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 23:20:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5328dae1305so907711cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 16:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790464817; x=1791069617; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+vn8HrnSp9wF2lXt9UhWS6MvVRq28DGOOCapdNx+WUc=;
        b=ZAORrv5ohnNKRvfvd/DYZNLyxocU3y1vIaHorbvyf1sz/FaHBFg5i9CdWwrL8yeiWd
         dbqZb7N+DQcwRFI5TeJU/h22qEn+KmZU6/JGBlUEJcmb+ZPEdSnG1BIkra0duxPqKk4T
         PHwdVlyFr5rDFedz/YPTx3stpl2ynIZ7BdCHm+ns78FLZiFNeHrF4l5rSqAASzxtBGU+
         w/mm2gx1DkbRt5eACW+M3BQJrsb1Gwwvv6EGTvqwSC9nvXSGkcRIq0b8/ZWoWBwENrXS
         j9I1I1P7ml13ModMdRGihXNdDqU1/ugSH6M3tOm7R1s4llcTM06hfN9cAgp/Wr/q7gsW
         QKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790464817; x=1791069617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+vn8HrnSp9wF2lXt9UhWS6MvVRq28DGOOCapdNx+WUc=;
        b=NttXzmvbqSlKS/fvOEcb8db7LAAqA+9oJ0u0RBoqNaBwlLcHf9zsLgwMXCaSyTpA7P
         /XwVYgx9e/NCsxhyT2lN7LG6pyYS/zdaE/izFXmF//9A3jLEAV2HuxKOsl6ebKyvosMD
         P7iY8QR464QGnIAESroz6u8apg418ip8k6el/Rxbs5RkENwuF8XiJTVrTCfBlA++utGr
         qhtq7fsyf+iDiZ1LBgcnABxdZDT99eQ75l7RQ/JTOJEEW4YCF2r3Xdc9D5Bgtci4zHEL
         2AsBhGsqlQaexVPvNZl1Je5X+6RDK+F9OzDvhcciqAWoqKhn3Kn6iCjcyhhS7hbkJzLg
         VzWg==
X-Forwarded-Encrypted: i=1; AKwUvBx+Q6p+3c4davAioJ36y1ASBjWl/73tsSeaDOglf9eoyicevie+YPcwRZ81H7LdE9NCOk//L06bwZ2gZxk=@vger.kernel.org
X-Gm-Message-State: AFuF++kjrMoj0qLcf7WAj0+2ZTSecnaWsivsx8m8EFytFTgtJ8dK4jgK
	GO7ddzfnSXBlO1FFFGKlII/JUJI0UCycm71Mk4oDnbm7PZb/i5uWgAaPJWGM05wWkY6+pCHvP5T
	vO5dzwpswqycdpOp1CIGUC9BeWynQP8jNetsU/yTwVQSeHLP8WRIx28BxlJ5C/9Ck9KQ=
X-Gm-Gg: AYBFou0fslV7HGm6H8gihEYp3xDiZmLNomwKBwTIRQLXC15bnZuG/rNtdzvy+rqG6Fs
	dse8l3Z/xVK4E9vd88r5eDY5zPZYIgQ80F5ScVfb7fXf3/RNyh9hWlcnF4m0eZi8Gkjc33WWJIM
	UOe5x8nsOUJRFY3LIGVPW4pjO0Ik87RKXtzRpQINj82nk928egcHSRykSL5GGt5W4yApgNAxhrR
	WUtoLLuppHamb2p7rFrTiaPAo6SB1nG2bWyXH2J6SHy5HJuRYk47vw/9GQXH1VM2VkWS9igpfEM
	ysd/JVivSh7pUggPVY0HXN3L9t6+dOPpZQIU8XuzHVtlJZp181a4qQM9P3Ht5OcZOxE/zh07AI+
	z8cDVMdx6fP3XdLrhzWOYd6jtV0KWhJ23iKuvvuWp4+q6EwPObY2bwnb9SpC3uYG60dYYVPJ+Qa
	ah1sWnt5fnTCfc
X-Received: by 2002:ac8:598e:0:b0:530:f7aa:d424 with SMTP id d75a77b69052e-5330b5be659mr130434151cf.20.1790464817293;
        Sat, 26 Sep 2026 16:20:17 -0700 (PDT)
X-Received: by 2002:ac8:598e:0:b0:530:f7aa:d424 with SMTP id d75a77b69052e-5330b5be659mr130433741cf.20.1790464816848;
        Sat, 26 Sep 2026 16:20:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a64c3274fdsm17676311fa.38.2026.09.26.16.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 16:20:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 27 Sep 2026 02:20:07 +0300
Subject: [PATCH 1/2] drm/msm/a3xx: Add hangcheck progress detection
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-adreno-progress-v1-1-f0bbbd6a4ac7@oss.qualcomm.com>
References: <20260927-adreno-progress-v1-0-f0bbbd6a4ac7@oss.qualcomm.com>
In-Reply-To: <20260927-adreno-progress-v1-0-f0bbbd6a4ac7@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBquFMqymWBj5VCzId8GXSUAKRod0HeSa8C0cGnh
 1Wm/y7w7DWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCarhTKgAKCRCLPIo+Aiko
 1V1vB/4oYrU3pM0H1C4dBRlLIyf6TFEAJspyzf88AAtdev90tVgY/e7pl1BI+dviaRKVORWO08K
 4y+NvmwGnJwPZtPxSoYrbKESZD/wHhwkwkauvXy87SmNQlBho7XB7qQRif3+g246e+ssWD+IAV0
 06CKYGpG5/A99aWD2aPNRvWVbpzy+x67j8ToUePGFRgsbeH4bz0W8IP7T7KPxJIjlJY2fVq3khO
 iHf7aSqOguQTiqR3vLMHIYTeSAK3aTzsmJHz5BFNTA/COg+Qdi865yPxYJRy6bFvaRTNlE0+t1W
 yhT7M2zu4mBh0MxAsRoaKUiWlxZQ+oYjPPSmOf5jYC7of4qt
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: ymFbOwPsnnSaoR_ZxoWbN2xsuhZ7btOB
X-Authority-Analysis: v=2.4 cv=QvPLTlyd c=1 sm=1 tr=0 ts=6ab85331 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=hoswt1gEA0YReVsPuVoA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: ymFbOwPsnnSaoR_ZxoWbN2xsuhZ7btOB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA5MyBTYWx0ZWRfX05rh3T8nSTKq
 tkR8698Nqu1FO2GN4mdsI/TQgbh+XTHV0h1R+M5vEe8lw9+og7FMQqtJdMlWhwOnmTnOAPKhiWG
 pdDKxqXbzcelkN5jmhuebC2F1g9d0HghQNsjB+1Nggxilgga2w5e+RCK0ijcY9Q84pv6QWvpX3u
 hWu3shoHeJUeO6h0g693gj3lEFBvK8UbBD51pSlQMBUnHrocQLnGF+cTRacnUnSx+zPF0Vvskit
 2x7u9wOX8Fh3faATrzKwVVyFFMKe3e7nPqJIOnKyjxJxtJkZqLNaH/0fzGP1lhd3qp/IPXNQSvk
 M50qyQSQa9N1E8zY5Bb1tSoGsAMtFjUi2b7HWIIr1SQx1jPVb3ipNUHJd3iOKFoXBKW+7DIDoSb
 eF/R+03iiSqpHMkHxkJIISjFK4HZL+qRZSOT8oGzXTxoln+FvNq5mDJPN7ZvXFSOkyCt94jee4Z
 JU8/i/B2ut8EcHWMBGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDA5MyBTYWx0ZWRfX3eEGylUn2mD0
 lIMC36dfuhFAVEP8Rm7TABm6wUvIKXBeYWT/hjIR7HuQWyu89Lj0XHahR5Yy78MStGp8KMznL18
 z4ldR1v8oImGWoMznYTkriT+dV0fPk0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260093

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

