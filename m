Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792615968;
	b=gQDvQA2TBIwRWxy8szN0qwonv4lP/8Kz8fjhsyVx/0lmWCiOTJ2OyNwGcLrMQgFcyiRH
	 JHGBM++ta+ppwM5+MQFmdSVYaptYnesk7moZmJdBbRDPEz67cWheqDwo75NAH9P/OCZDS
	 0d794oPRKS4bPeMJuSrx1k3dAZDCfmhs/+jBu03fhYYTEp8850kntn4UyRBQYde4yrLwm
	 r49Ne7PuTfjY+S7WbvrwjGoZdF1heK77vVwUUv2hhEvjA3liRNn2QkoHLiR8KCitdBlMG
	 +mjefhG25VZO6f4MrPuQ0nEN+13xOQ7j1bINpXVGjxby7wbz4LShTkNxZWqvcu3Ss6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792615968;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RbVliwpgUGUKqfTEQkEhVFK/hlI4aw9ogH4W5n+tkqs=;
	b=2onQsomMnsyM55jQWhqO0rMTw9obcRZFhz9/fPYa0M6JRujKUYSXCEvAZ4FG2JiT5Bsc
	 uDVieksgy+DDSktlVUYtqhtX4QOb/5lAXJeOgWVOVnqxGNzPlJZHm54R77TFM52lu9nJw
	 7QkIeBJaHJL+vbzaPe0TfeYK+xbnyRTEVdnqKgQqwJ4tDrD81VXHfRgjZDcAtJDRHtdPc
	 i4h5XlExjMT1zf5QpvLUq7vYaHdM7cDcYZqWCgWoabXMtOytFvASzaVkQ8mDIGYbNNOPQ
	 HpxNxFWEs2boPk/Zh1AXkcuqZB1C8FgOS5AKHcKWl/iym2OZy8nwrqZAcAGnJfRkZ3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jHr21vnf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B0t5cxAi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5876D606A321
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:52:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5876D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jHr21vnf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B0t5cxAi
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LKelgU643414
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RbVliwpgUGU
	KqfTEQkEhVFK/hlI4aw9ogH4W5n+tkqs=; b=jHr21vnfls6HnxHhomsDGQAfWvz
	MPSayghRdrQ+kCCgKAA+Eq2uBEIPLZlY62T60NyDlRlUPqWuZ3Zkz3CQchrx4Fh2
	2K0dqL+OQcMcdv6L0GaZiqIJESKymYSYLomcd61kU8D1/QuGvPegNic1bG/DGzIm
	FEi3bf3NgjME69crZ+7IJ18iX8AoDmVMpXKyc6/5TH4aU0zk3FGByxq3zoLwTAMS
	MAhBR+OtPwgXp3GaOMdH9rWl1rrnnGcNGXMhRKaUC+rE8ltXdQc15g2WI4WGZeIA
	EHZ+hT7rHZzaj0wRBv6pCXSVFJb7otUxogSs1s0PukqpnXQEnCzA4wnQ1lQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex5q9tv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:52:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so139025a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792615966; x=1793220766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RbVliwpgUGUKqfTEQkEhVFK/hlI4aw9ogH4W5n+tkqs=;
        b=B0t5cxAi3AJ4+k5F55J9Qpn68rG0sfiUU6lB42ujllD7x11j+TxT8+ScM4ow31tjH3
         d//t80CHepBRKsziRv25LGlb5c4mXturFtozYy1Stjz8EbVViNjhtedyFWeo4kxA8ist
         waIYO4D/XypogwzDh9LoqoGf+/IrpyYdTOehe0T4c5VKL8FgmYjCKvyrQVE6O510Ybd5
         P5i3HbDjbJbBVy3nmpX5kbDmKs1a7wfmEJrnMExaIg955HevhPFMOCECT1eW1wca2OAT
         +gRWxfFiZkpVdt+HjYRY/kmyb8GxsAZBCk7XdpiRpDoFC/BgM/fChS3rj5t/KokMDhti
         +1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792615966; x=1793220766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RbVliwpgUGUKqfTEQkEhVFK/hlI4aw9ogH4W5n+tkqs=;
        b=KQBRT6xwrI57mHK2/8ZXwldhPfpwKvuZEHrPsc0Kv877E7iIVrG864iEpJ/TIbbb/T
         TJVjqdXyi+OxzeR4gfj0htfr2F+kaufrUt03iSUjTz5T1ii9wUuFL9KxCDbmxFWRS9Ld
         jmp9V0bjTZJzgsvmHf4ciHxPLw2YFaa6N30wzkRUMEdFoju0bpbOucwN+SnjtsMXIxqH
         13GOvnC6VfPWfE+ndMYgdj4gyCCtCm0qR+u1XKXY9DwMT/Ut56jtbapmMidl2NuiyQK5
         RgWDn+2PQrMswe4nizIY1P5sDoOXeF3IRxwSan1liuZgiHb7FvB18H3M/ijwxg57qvhV
         njNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDNKcaTHwzvXRIAQ8XlVclu7j49jcpUYPyFGM2ngHWdoUrzH9g74uAeS3dUxebXZ1ttnfw59ELDNVGxjM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfNRo5Bmh3pNvqjaOq4K5JyN48zHnHvzpSz4nx3TK3+MpHNaRK
	/24lQn2ERIQn3y5scgajprLPEfJXBfpOccu0cRTbURQ+Pmo7fOEUaYI05v6gVxjFdyGvwEqDWbZ
	845cXMKca17uPLbEq00drJi2xB0VHyq2ZW0s4rGIXcqdh8V+8U12gsg5qpxt97ZMuzN0=
X-Gm-Gg: AYBFou0+aQazK/nsIQDgkqGgvJsR8T8UzqwBlX8IwyX+Ib7gzPH82BiAqF92VW2Mv++
	m2Ge6AuqpMsrQNVPuZrUuhw8IY/r3sBKUB9MAx08GrqetkDN8UcIiSxCOdV/WsA9A8eZeemFm+i
	36xrA6D4snacx6E43qUugkjdzAAo1EQtxrCv+t3TFZ0QJdTIYiE8hDpWGIQt4kx7wIClyu4cOee
	kk/trjdvAwKUXSe5EtGJH7PA7+A9uO/ogWBpfG7oASqYSXSw0Jxp2pRrGeMERY1XCKRvGkCu6rQ
	9VTVA/KyqpFRFyLP26Yq/4Ekxtg7FgTpr5E/ZGqTUxhgbe5blelQq4AFR7B3WElzwTQ+b5wmmhO
	B50JgcPOYyVg+4GSBhJP/ulj5Zd3nZ8aBK7Yg6qkcScXipZ9n
X-Received: by 2002:a17:90b:4b0e:b0:3a7:9045:fe29 with SMTP id 98e67ed59e1d1-3ad86b0c3e1mr2570035a91.4.1792615966043;
        Wed, 21 Oct 2026 13:52:46 -0700 (PDT)
X-Received: by 2002:a17:90b:4b0e:b0:3a7:9045:fe29 with SMTP id 98e67ed59e1d1-3ad86b0c3e1mr2570012a91.4.1792615965535;
        Wed, 21 Oct 2026 13:52:45 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4933d16sm962668a91.13.2026.10.21.13.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 13:52:44 -0700 (PDT)
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
Subject: [PATCH v2 06/14] drm/msm/a8xx: Allow nonctx reglist to include GMU regs
Date: Wed, 21 Oct 2026 13:41:31 -0700
Message-ID: <20261021204244.67160-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
References: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfX9aaStfkIYFg6
 kIUdL24Tyrkhv33RYU5Pdn4f0DT1hvqt/25P8Z7ds/CrL/uXmx+L1CD0W4r1FxZTmQhZ3NLrFuM
 Gdrz7WcAD4sNucYsKKgoz6errICL978=
X-Authority-Analysis: v=2.4 cv=eJaGH3p1 c=1 sm=1 tr=0 ts=6ad9261f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=cg0wMmP-TNBUvudz7-YA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 5Hk0NHe-zAYyuzL_LfUb7OJDwU06v3yQ
X-Proofpoint-ORIG-GUID: 5Hk0NHe-zAYyuzL_LfUb7OJDwU06v3yQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfX6Z1ov/4gwCQe
 rhSFwI2x/tlPnWBQbXQ/MLoKAfee6sdrDh5WN52nwzbYTPAy7ErTAmGCcF0PbzECfcikQKqG1mH
 28sZzO8fQ6DSws/ACEpDe++vAJ9zuSpbPh2wyhFAUwZlHGbJT3ruaxW7EZxJ8xlqx9VNsM/bJrM
 k+fbPS0jiNme4r7M/RgWLjUYJDKdB+Bws0ZohkaEq5a1+Uc8gOS0ts4rRx1DlJB4EjrE3wfKS1m
 eZT3Zd+U8EGa6M03dAVx/42PR0dgG047DiwMKm7i7ctmj4d4eU59isQ5zD6hQsWe6YAtcvzWeq+
 lTMoJU1+7MYpFefI91RSNbaFNU5IDj3yEqzT/hpMXjLFJ4vXzO87BukSdLPrqwyr1mTbrV4gdsz
 ZdVOEfXj9/XnA29ZuNYMFgFF3EMVVXO2G5+73gX1kmYubPPqAw0YRBQZ8eB46Qo4uGaEsa202Ts
 PByc2oWYD0A/eBLeURQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210083

From hw PoV, it's all part of the GPU.  But from dt perspective it is
it's own device with a separate io space.  So we need to detect this and
direct writes to the correct place.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

