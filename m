Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792837877;
	b=32dYKpFLj9m4/OAmFKtr1uoHtKwl46PKTzgBvmgTK7mr8Lif8WTmREiqAVghYBYh3RWR
	 rB2pK+/yVnguchLCEI1SLrtrN4syjIeCZcA+j6CpOW0b5XlwNL0p1HZAte0DGUlC6l/Dp
	 WnSGWzTtknGOlkZ/EzhcXXi17sBmB9PjOE23qIZPspjdMrrOEpfB56MDQrE8m9uITxcsw
	 ulmd2bjigBvvZu8GrpRAk3B/otCniQlMuLoxTAl2U03Cqz+ggbnTmlavlBO/6T0PgOhzJ
	 ykxrFYs6y5vJUqgUBFMtdp4yECOLCYXOhg6xHvfy1mlMKUv3+VDRoxfhEQ9GwLbJLXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792837877;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yVmbznb/9DErXq4djUHi/SV9iaCO3GJadLn0oXVswrI=;
	b=iyRiXlXcIU9N2YH/Okqkym9XKM9ASl/N+0M4RTXCNl0UbLozLwuLkMML46/lx5rpABaw
	 T+DvthSrOtY5WA8pyboWzVdyQ9V4JogS1/XS4ngwsKddDd0lLJj5mgvk0kvWfG/eMg6IM
	 yD5ovfxF1zMEu135LFx7JSYJL0hzMZqdaC1QOo0R8reuHTUVdXwnWomslzVEPmyYpWYsx
	 y4IRGw1krkj9WRqKH6jMJRfmOunbuBs5hV1u+bXmKlXhnBZDzKQqOSSvwGOJiH39rEkYY
	 0QpLzkTuijxTpnmkp7dBq+yDzjSJ4ez3TiYdamE0Qaa+iJ0Ol5/Tj3c2h7i47xU3tig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=POaySfmr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Z/E/16Pk";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53988606A320
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 10:31:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53988606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=POaySfmr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z/E/16Pk
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O8o64j611223
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 10:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yVmbznb/9DErXq4djUHi/SV9iaCO3GJadLn0oXVswrI=; b=POaySfmr2zWvxh07
	3S0ZVpsfY7f8Y4FE06+L/2UfpZ+i8jSmmb49bIUm3JyBejnwgh2UXSHHzLITyyTN
	mgaa8TsVm77gV7XEcNCWJHYCsLqz3GQYjUteq7i4/aza/DgaIBbB3psihXKmKaEQ
	LxVJkp5Y4NXEBLlN27nfx6suryimr4Woma7c8NU6Mz3jkTa2LjDNEyECTTt022D6
	mQnUZgGS4wLJvtHJswPt4D0wV3P/xxNVwtRxr4QgDlaNyHNy5nfqy8Oq2j6lHmwn
	0b5ICZ0CbLmpjxpfCHbkEWwMBBijMoUM7QWCFYf0vCYzgClugx6+ahtaygWR4hIm
	rHU88A==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgnehgmu0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 10:31:16 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-151ba226e1bso3388987c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 03:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792837876; x=1793442676; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yVmbznb/9DErXq4djUHi/SV9iaCO3GJadLn0oXVswrI=;
        b=Z/E/16PkQReVFYDWeDqmK2UNsaHor02sSc3WnIUhldzdb4dIjTAdY2uB1mOVro9alp
         R3zSZjSj13SMPkgJSmgoh+OjwIl0OAauQ6PlZ8lJd70GhlSouunfbI33CXQoiMeSaTIe
         CjX2g/XHJlCFWOH65CNYF0t4z8SuaEmjWJEIZfKf4jKAx00elPneI8iwrJ60CBiagY1i
         DO6y3hEmflAp4vIg6JCnwY5INADG4BGbMKsBoTMOIfECMuZj0TdObJia4nGRMX4ZbpSI
         VRJhlDy1cO4xMUnEGCfMyQTJ5V+Tx9jzQEL5YZbTkuyCO56ly/6WlG+Y3ksMqX4ubr9u
         DyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792837876; x=1793442676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yVmbznb/9DErXq4djUHi/SV9iaCO3GJadLn0oXVswrI=;
        b=Sn/aAE2OFJV2PnJk+Vh/FVMX52nCc2sSDTjLUPoU6svteGilTTkvVd/wu2zf7jGFyh
         K7PcVL1eMFHmzdNq3PQKUTCQimOKBkdriavPq8FGejaPQQixbAfhojBBEezt23a8Dlsy
         25K3z3vD3w5d69Y2uSg6DrMwZNmwgwT3+f51PiEn7dxvwhUFDYQocktkbOrpqnQojfQN
         GWl4uwnF5D6Kcq5J957GOXbu8I7+qUK5ty02Nc1Dr9Ybx/PvonXgbfgnPN9NoYXFJxMO
         gP07AVPz8BkP6AzC/y5utcdpWa/SBOw5ci09WEC/Mq+JtWxcy9ODe+E+18Vm8E2zuLft
         gEwA==
X-Forwarded-Encrypted: i=1; AKwUvByY14ZQ5SSL6nSmQHlzGRqjAO4XUySD2Vks3CPRXYWbeaMmguQ+Ki105pWT024OEF9H2A8MwrnCu+6vc8A=@vger.kernel.org
X-Gm-Message-State: AFq9FYIj9Q+MOYYfny9PLAtHdRZwpRt07tzt0W/Y0YFYGVPAuep4nYBO
	SLDBu0IHDAvWH7HQ4m2C0lMEIsyfeNsxkfRnhRTrEWz3i5gGF2sQs6hHUn1qcpvPMT3rK8lr5IX
	JoyaM/nX/DxE6IxUJArnlMVAFYuGD3w+9uEGTJjPmB4p1DTDQyWZvdfuFsi6wAbEizps=
X-Gm-Gg: AYBFou1Bc8WDbMgy8ep87nTsbMe85LooccU5tSAT7l8vZw5LX5O2Z3FrCHnw71u3qeF
	GjOQPALhfGWxQm8qUhrf8KX1jtSBW+SRpg1nv/j+sBOwW2d+ZOLEyzVwicuAhxqJjBqLQ+AMftP
	ArR3QnIZ7V72k7uhAvibczbYuwIMdvWuJGz4JVYgWNnemepVV7djKhD0lWUj30Tyu2OW7gChoQ3
	mDCXRdFI+dsInzAd/3kxrzu2dvs3ICAVC6N/zNjZ7e4hiBlRWLtSXVNZI1VunjjEqh/3YP3xN8Y
	+N319u6JBRNbtGiFSj4jYfnj9RZnU1+/R/3EQ/sEkhGKgKvJAGmuvJtzhfDWnx+EwcvLR/HxNwk
	bHJ7RO/2usyHeUHYDAlH8uSE=
X-Received: by 2002:a05:701b:2311:b0:16a:8ffd:4977 with SMTP id a92af1059eb24-199363a356emr2026604c88.17.1792837875910;
        Sat, 24 Oct 2026 03:31:15 -0700 (PDT)
X-Received: by 2002:a05:701b:2311:b0:16a:8ffd:4977 with SMTP id a92af1059eb24-199363a356emr2026570c88.17.1792837875267;
        Sat, 24 Oct 2026 03:31:15 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d5a10csm6009441c88.1.2026.10.24.03.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 03:31:14 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 16:00:14 +0530
Subject: [PATCH 8/8] drm/msm/a8xx: Add AQE firmware to Adreno X2-90 GPU
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
Message-Id: <20261024-assorted-fixes-oct-v1-8-2977f974ddb7@oss.qualcomm.com>
References: <20261024-assorted-fixes-oct-v1-0-2977f974ddb7@oss.qualcomm.com>
In-Reply-To: <20261024-assorted-fixes-oct-v1-0-2977f974ddb7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Luben Tuikov <ltuikov89@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792837816; l=758;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=6jmsPstXRSfknq1XodxmYZvUhspzwwQE2hSVoneLg8I=;
 b=Hx/1/hc3l+NGbzYOE4B5IZ8a9HEQEd14sU4mikm18b12ltSKrCeyQdGfZiLcmnEkmV9KRmVWZ
 2nhiRi5Ya70DDbbG84Qw3t7aDbYMJye+XM6j65PhrewxK1J542MF3J8
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA0MSBTYWx0ZWRfX0YzMsgwfbYNz
 a4bXYYWrtOpLsUlzIYdL7XHXbNv7rhZLJkKJgXmfODRSP67NV2ZudNzT6KSjNfEoSo9Nlhg/dvD
 B0qLAvW/IBzf/Dx/cxUJudt4qfu682M=
X-Proofpoint-ORIG-GUID: pbDW5DTm5_Wf9oDM6915NfevycHfm3Lm
X-Authority-Analysis: v=2.4 cv=d5tgWhjE c=1 sm=1 tr=0 ts=6adc88f4 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Kvm9o7dbxh_Zzo95XxIA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA0MSBTYWx0ZWRfXxSt3GUavEZ08
 eEy5XDbegmZyYAVjGGctYLHm6i521/Uc/CrqTLp2zGycb10pZlOWbBA838fCdQkwlaKNmDxLYxw
 cvVFMT2YLLfTQe+VQieSf2H9zSoU15z0dF9KaHkfKn1uePtxZgxEXge6VpGYMgCl4EE1pFs9Fwr
 2ovBqfz4R6vi3nHsG0TU2B3cuSVO9ZtD0Rh11xnjoxJADzfPH2ZFg5alizR76YinM30fN9Bg3x4
 bhzbb9hSQNHfy7PTUGk01yB6KUqeafnwwEzZK7kJS7WWXAqCI9GewL3voOdW0Mmdkt5eyNIA49P
 waK1Oazojntam6yyj4tWdDLesCZNXUF/CXjYWcdLx5q4xyAlaYoXMhRlV9500Icoazj8RdYs/dJ
 efAnxoRD9eab0pWxENahYnEAnU8gI/ATVbwCl7FIH+TCxrccN3PcrbdqH8fYqVC5GZaEs2IvQzm
 7Z/mmYn1StlPoDwKdBw==
X-Proofpoint-GUID: pbDW5DTm5_Wf9oDM6915NfevycHfm3Lm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240041

Update the catalog to add AQE firmware to the Adreno X2-90 GPU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
index 55a805ab438c..775aca1964ee 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
@@ -1582,6 +1582,7 @@ static const struct adreno_info a8xx_gpus[] = {
 		.fw = {
 			[ADRENO_FW_SQE] = "gen80100_sqe.fw",
 			[ADRENO_FW_GMU] = "gen80100_gmu.bin",
+			[ADRENO_FW_AQE] = "gen80100_aqe.fw",
 		},
 		.gmem = 21 * SZ_1M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,

-- 
2.55.0

