Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792615975;
	b=PaovXH913KBzW0xcgPBs4HsDU1RuSzrRpMvOTB0FmA/Rhmp+nqDJd9i8pBTXisR60Iwn
	 xsiYPrHnYFucFJPsrumjFrZ2Mcbi6kbykxOkOPtf8HseBEUS6HLI9Qh6Cb0RRJpfHlhs7
	 CzKqGdC2j5IAVXf1qCXmxgHxf3Wra2BoULk6dLl5aitMo+suW/rQ/VSW1odkl9Mi9AYbD
	 34CJFU54+tcX3rQemRAERv/j+OiWeKpnRvF2zhVnjGLPhLbTQwoJxbl0aMdiWXqAd/7at
	 YnGr1NZZXIrm0zjGgZJPyRAhXZUFr9X1uMxDiQ+tN5wkLEYkK2BnZPRv5CqoVEEm1jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792615975;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ocDu9x7a94SWPcpzxK16LgiMD4smeVd0t/ViadjFsRc=;
	b=cCkPg4UbnK9D/H2MWwSU9nRxkgwZs6ZXcA9JY/TFbyrXCsxEefNJc6C83j9gOkAG+UR+
	 i50gfLeouF/Wq1N8w5zVSLjX2gJObSvBlboRHBajxUMQQnpgUnZ7c8yUrvOR/15E3Y4zM
	 dhhM11YE5XA7XII77IquibPVtpmLZm1VwMa6w0MrdLq9VdQ5cchWXS3upEMsLeK6R9f0T
	 rPxylkcF4Q+DJ16tBk3RCH8kv8EgzTzFgfAVFV89fxwbimsmN26gzwN84li809+KB7e6c
	 8m9bbysP3plpomlgNqv9g7l3ez/A+LRqWIGTH3HIb1hSauXqmxy6Ul2HLFYbwy8Q2mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kQoBWcJ3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AuECfbdQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B05606A322
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84B05606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kQoBWcJ3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AuECfbdQ
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LKeFN81669909
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:52:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ocDu9x7a94S
	WPcpzxK16LgiMD4smeVd0t/ViadjFsRc=; b=kQoBWcJ3ixHquOP36eUDlperjY2
	XVKR9jk/zqcD5LNmbGH9YgDhxdkkLEFfgzIlB54mYQfnmYo8UlHcHppMkBf+uFSA
	sSIdhanY++X5/WELlbKwU5jdbWAj6KzO2aolQkfCBtWO3my+c5HmX1jH0e8AZgkp
	hiR+GCPBlLYqE2oa86r7hVQZK19jiHbxldLieub9dmRSY64YRD3cY/QKbLe32WzH
	+iLGxiSgDSttwumnvbQHLBzl7dhyOBzd7lkNHxZfREWjHGFR2caVDTJd88x6UTZT
	IBHLXJCL1tN7w5afMj1XXYbW9EfTbRicXXeaMA6MSrj/8UHGyNFu3zC6jSg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf2cq0jbu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:52:53 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a4a0017549so3013847a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792615972; x=1793220772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ocDu9x7a94SWPcpzxK16LgiMD4smeVd0t/ViadjFsRc=;
        b=AuECfbdQDf7VR6Rrtgd5BtFSjWp+YDdDpcZAq9oGzxIfzpLVGS8rQXBiYsk3DlZNmA
         V8gBHQ9feLXQt87wXZ1/h8iSK4Mko0PWkb0tePRwpXXs95E52mugolvr5yw0l5MiwQ99
         K48BdGUR8G7hxXK3OI8NzBqCZrC6FqsFxMUl4893BUgPi7X/nbt5fVzL7cnOeLWSIfca
         LdheSbkWEp+FC6KBfpZwmYAyD/GB7Cg7HY1Kna9I+g8vkoi7zLLLPccqXj2ZPaVHcWDT
         3wPwjVhQqGSiDi2CkdxWbsgIda2cvbWi19QrFXgdSBq8Y7Gd2vtbA+RUS4svvtLkt+ZK
         NAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792615972; x=1793220772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ocDu9x7a94SWPcpzxK16LgiMD4smeVd0t/ViadjFsRc=;
        b=F1cLbsWRq3Vnv3874nubmwcBmnG13Go/vPMen6zL5Fe2ooZLcnaX/KPtqpyvfLRxvX
         HRCJ42B0Dxt31z6bct2LMZzYjWaRg5dC+jGqmdzYybUoTH9mYaXQHd6NfcCyhQp2cEdz
         i1pJwtaiaxyhuoc3XSG6+XYVH9JJ8YXl2HIxW/UCxh4MNH1Kw9pMbBjU3Z4XcOO52ir0
         KNvyvcj5OJEYKTJckkDVZ1vw5n+F5mFTHuUGj0dlCI2lfJsVIvo6lg62J3ayQ/308PsT
         sDfQ2hmCByU5lthoIKTu9bU8pv617IHQ9bZjvaq92QKctiRTt1NhN+/JJh/UrLygRbT6
         6Ygw==
X-Forwarded-Encrypted: i=1; AKwUvBz/JvVRd0t4PqrxF6kbSzaxCB12iOtcvc/ErWadsyoHwt9MfcOiCaMTpsoPd3GyIZIiJsw8HzAUFXQzmFQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLr0eQww4Xj05u+w9wboyvvtW8uHC+PXlgELr+X4yCsw9d3E5UA
	Evdc7cxhPa5Rnb9+afXqEB666mb4TKvahvJjFn12SwKzQGhRNLclF1zrkHGfE9Hr75H/F237ARw
	qHJYjHl1/HBr7EP1e5zxh0pi5TrmJZryZT0phJWJ+r94YLvnSYtN0alGGq8lIfvzpet8=
X-Gm-Gg: AYBFou1Vucbx0h9wiXLSpaecfPj5u2cwYToEhupuKDKo9+HzlkrpArWyhZj4BRpkFw/
	hnC+SKOsUXyconBh8tscwJFbbRJcoYYGu0WGc7g1TzUJ7vQVqeFxXb70gJXFUyTQlEo+zzjiM7v
	SgoWB+cNDKnkU6ye12eaDsv8CJ+/GoVWqjgg+XiM1s8EbY0Uag3qUL6YQ0DLbEmleg4SQRzIr8G
	bYyqksUYzau7o5hS8OvnIZH5/8WPgLqn0gL2qsIeDgkX1cQg9lpLZPW2RwA+oQhFEVbBQwt6pFp
	fve2M9Id3sbTLoMq6LAnR4vALUUG5lFjtVOkwnNmtx7dMy+a2GwHslRW9qXom+AODcPbzpaX0PT
	uByZHevf7VfOdC4EYQYtEQ1bItBO6BZvsb9F/meM0Z5vrtYhOfA==
X-Received: by 2002:a17:90b:1d45:b0:3ac:7556:8ee0 with SMTP id 98e67ed59e1d1-3ad86ee318amr2589073a91.19.1792615972582;
        Wed, 21 Oct 2026 13:52:52 -0700 (PDT)
X-Received: by 2002:a17:90b:1d45:b0:3ac:7556:8ee0 with SMTP id 98e67ed59e1d1-3ad86ee318amr2589052a91.19.1792615972140;
        Wed, 21 Oct 2026 13:52:52 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada48cc51dsm937500a91.17.2026.10.21.13.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 13:52:51 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 09/14] drm/msm/adreno: add temporary __maybe_unused
Date: Wed, 21 Oct 2026 13:41:34 -0700
Message-ID: <20261021204244.67160-10-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=HLhWhYtv c=1 sm=1 tr=0 ts=6ad92625 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=SI4bJWXHUBEfUJKjJlYA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 7LAhzXkCC0zW7UkyVk2VHdOO2AN6AaQu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfXzC02Owe7lT9s
 +LT9yNZdMahBGd14qeoP/xf38ZWMTn3Sx6pu98qVqrdUv8omToO4ZfsjPaDcm/8+Loy+dnZFUu9
 QE3cuqNyTlZ8W8ip3sEWRaYDVAEFUqA=
X-Proofpoint-ORIG-GUID: 7LAhzXkCC0zW7UkyVk2VHdOO2AN6AaQu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfX8EuONWlOdNet
 KRb1jPD+K1fL/yzTh4sNLm3yt7DVD0P3vGpEJSsHK5iJnSIKmLd5/zj540LENabHPKwL/Ji2+uL
 IpSX/Dlv8kYMZ/rqciwKH3U62Z5QRiYx95eP/pF6mbPU+BWRHLVomeB6GhCSAt2uRnl8lLw5jB0
 Mo8ld1aKLqYV7mbvehjgFLvaKlsV1YDTi2DHX+R9EFb7CiHrA6tiC1CpqSwR9f3FKUFBoz+n0JC
 6DqwZQNGzULvxLiIh1Q4ThiEzlqt00jvMhbV2mFn7cNlkfu+VkdV9apKpnvNSGbKPSfLVn/nziy
 YVX3p+t8QmbnEDNyL/c0kgKthTHtkRzr8g20Flxpf4MD158eX+opKez+Gm9h6kP5CCxZaUHkLsB
 hxX0HoGjroD5tOCPrJA9FaeptWTX5zLAJFBuXowiFR1dhWCj12kQUDzuJojaP5uND7nMkOGS27I
 7FrVIJ0itK+0UkfIvug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210083

To keep this series bisectable.  This will be removed once there maybe-
unused protect tables are gone.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 6d6e4c7cf919..c43efb85fde7 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -168,7 +168,7 @@ struct adreno_protect {
 };
 
 #define DECLARE_ADRENO_PROTECT(name, __count_max)	\
-static const struct adreno_protect name = {		\
+static const struct adreno_protect name __maybe_unused = {		\
 	.regs = name ## _regs,				\
 	.count = ARRAY_SIZE(name ## _regs),		\
 	.count_max = __count_max,			\
-- 
2.56.0

