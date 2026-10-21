Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792616006;
	b=xbEnVP48oWmxlwp4diD7xr1mSKP0ZIH5gllQjJuPKIIAIzlcEv895hO379CfSvVb/Xkv
	 n+I332X0Fw5evOmxeGPfM0YEmiI4JgByjgwHuE/5mF0T8/FU72h7DLjlRFoZdqbKGyHUk
	 MzrWwsxG5RMpdLlHJseqMXBY0OMplY+TliUH9k4K6hYg4pYiJgMPZ5nQDpHR4eRejNexI
	 r86P8Wr5OnKIGfXTZ2/jKMKi0cW1bfPRxrigkPbOxx3aQ0Bdeh6kQGIawIo8hDv+0HFtd
	 oyn1tVa/Bz2z0fR8W73YAHQ75lfAEwihu6JG1tbWKW/UvkhjpGMJcij/AhYhnd6i1bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792616006;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QK2V0ULW7LP9ugrR40QAJ25MXENJhXs4M1ySCOtIhX0=;
	b=wo3mSktKCzPkz3D+jCwbdVGCdkmSiS8aliLAXxqGueKbgFAMvDvRR5ZyGuAU+C4d9kpS
	 InPd9oPgW89FN4UZmca82c/62BaVNI1diX0KXEXYpkY0xnrHOvvJ58PsUWaDqofAaG/NI
	 GRRBa/DjlLf+z+t51PmUry6bHIURG21lhcFcel9RWduDEz+xaJggFMM1zAfdTfno0+qjY
	 0In8LoHlMYi2SQp94L1lh5XcPBQJ9uqn97+OsPzWnCSdoHwDqqHAI+BY09QAK1LLz0w7k
	 /IplbAZpniLqx2w/sC+INQ+e1A+e/SimQdJMhedSf+nJdlz0fQXQ3F1+l6tuPFNfUig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UvNujxgL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=erJI83Kh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E328606A33F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E328606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UvNujxgL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=erJI83Kh
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LKeFqq2160475
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QK2V0ULW7LP
	9ugrR40QAJ25MXENJhXs4M1ySCOtIhX0=; b=UvNujxgLvFS7OZHEHS/tp8x8vkl
	UislSsxNnOGPq2zcODAMF7YPKDdeZVMJvA0fXFaRm1ewx4gASulnNLwrS0fdTq+G
	FNsJXsFV6JGiJq0afZJA7QJVjV4/DpMXAPYn4i6PLX50RTHLl/07c/t9JnfsBwE9
	fRNAaJTM9P4msrElJate3F7gIy88xLLiy5v+qmFG6xLmG3U0QOGjUR6kmZbZWaYc
	Y6zgu95lycOK7toV3WzN3XXDyTy0oM4VRfT/ZS71gP+JMFoJs+gPi/XJImT3hLFf
	qgpmeK2QW6DoVdpQmW4vhXo+ppC+PbToaFkPH8QWrSH6ozX0NbIZFeM2tYA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf1u3gps0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:53:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e95f8543c9so9052415ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792616003; x=1793220803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QK2V0ULW7LP9ugrR40QAJ25MXENJhXs4M1ySCOtIhX0=;
        b=erJI83KhGIMMCMAXIfu/boQZSizyJWcLmQ/5r6v0WzCfgE+wTlOIxf8EXsPT/yjSL6
         7YFBk3y+zwC3y/gK386wELpjQbeaNECWJf16BMPUpl2R2+PFWtoSTx38hn1qaX1aOM5m
         r4VJ++K2og4Esb5mh+qF8fkMguEbpX6u+QKRb0SwDgZW1lNCyjN+M46RCcYu8Oxxh/oM
         KVXC/enqtGg66o8t+ZnNZWrxJY2G8rVmtdh4ZmaUQnVjJEPyjs1dr57WBvwY3/Ivhoaq
         YpLOBu4qE+CcqSWHQ/l7M0pJoHmurlBRlGyH1u4Ywc0xA6mOoizB3j/gnmkdYdlBaBtL
         hcKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792616003; x=1793220803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QK2V0ULW7LP9ugrR40QAJ25MXENJhXs4M1ySCOtIhX0=;
        b=Va06/q/s76OyC3BSpuEewbHSHTbKuAnhzwFsPPGcoUuAqdsu13qSFJyYPv8ItWgDgM
         cakUBiV3poiPFkrPtmkqXm0Om+PC6ENK/B8dAD+ugPPKiYLv3wCBdqWM2E030qvWFvOu
         eKH4rXmvsyFPo0QOsQkm+fRgshr6hdwi1vDogNIxaoPfA4v65DxR//qFTwZU7zxGsUJn
         putp29xV9B48Xy4UEz8c03Eu2cn8CMxG9qVymsRro8PVx9GXfw8i6tRMBGmJqiX8XCaz
         tLbldum1w4D7ChOQ7bP9PsRWnGq8ombUuJZxW8REa25XdyH1CFR6qOryvcn5ZmeE8vnq
         9ADA==
X-Forwarded-Encrypted: i=1; AKwUvByIIkKwiqQLmxiHx7E6cx2FZUiqQUWceQ42WBNrPa7D5SaFXK2HS+l13ugvWDzHDyEtvf+pwvf38CciFnY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzbNKpMgc6u8iHxPx2YtKQSq5/rVhpOT15f3zkasY8prxT4d9X
	cUTb7XICC1SM/pvFncH7kHVqaOn9SXtZfy6mFDaqGzKe7NDkweZfdJMGGTEIBfwb6sv9ZwbsusW
	T3W5ZGwkho3WdUzNuOhp+HDzkBYdjTg5XDdt+hKnHH7GiRbxjzZC/j3PLLXW356hUtEM=
X-Gm-Gg: AYBFou0V5B8n1RBH0vjueU8GEF08zqz9FpilMidKVdSepLEh5mj13PzMRQ9Q0gVnRbS
	M1MWI1h23LKzpZMMbx+r0buoQv+HN3H5MzoOq7Tfi3eChzO+YoHs6WAsZ/Hh+MycPpdvIGTLU05
	mGLJcrN6NPDLc9WmbpjnrKMhKFHogOICmEa6VtkPbCBYXGOe/IeMUdP0zESSxmfUFIlAZDfL7gS
	6b1PHybUP61lAmPZWusgBqRHF95GLN4gAfK2bQVcb6CE8l6OckGQI0maAuvfl8V9cRMxvalyLQu
	qSuePcDG97ASWzogFoOqi4r9P1KX1g8UtpNMkE2Zwgtdgo6neC2Q/M73111FBqY+XsqYswPVqCI
	t17CmW6EYUQgN6K1UUz19iBGBogpxSgVIObg/6/jlLEEGK4K30g==
X-Received: by 2002:a17:902:c948:b0:2e9:6b5b:3db6 with SMTP id d9443c01a7336-2ea43c0c306mr22232295ad.30.1792616003382;
        Wed, 21 Oct 2026 13:53:23 -0700 (PDT)
X-Received: by 2002:a17:902:c948:b0:2e9:6b5b:3db6 with SMTP id d9443c01a7336-2ea43c0c306mr22232105ad.30.1792616002917;
        Wed, 21 Oct 2026 13:53:22 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b48866bsm15910495ad.65.2026.10.21.13.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 13:53:21 -0700 (PDT)
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
Subject: [PATCH v2 14/14] drm/msm/adreno: Remove temporary __maybe_unused
Date: Wed, 21 Oct 2026 13:41:39 -0700
Message-ID: <20261021204244.67160-15-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=S8ZMU4sP c=1 sm=1 tr=0 ts=6ad92644 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=SI4bJWXHUBEfUJKjJlYA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 9xmyyqWbyriD-GO-Ht4glPl_0QUEp4rI
X-Proofpoint-GUID: 9xmyyqWbyriD-GO-Ht4glPl_0QUEp4rI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfX2nnpRpW9AA7f
 y/GSNhjlwW5nK9/pqXwnhLOuHAolyQezhVaQyIC4hXM9Ayx1A5bozdyw+YXPaa6z5sCafQW3fpN
 eetrtt40z+szHDwyCUEfGt74WLb5H6Sag1dyfUTvsod+lJdq7LP0w9y9WEc9WHuJRz79vcXisj1
 DXgYW4hn6F5SRPmXN4siBCa9mpsMmLcgGX1JhvU2S4Mbe3eQpetSHHAVoskWaHnVcNxo+qf71FE
 dBT5j8Ea3NXGvfi7KJyzEkISD/PTm1sXHpbicmpg8Lgr/6mw9oHJrgaWUfdfjiZYWdKjZ0GXGMW
 ushnXv9zhq9kbPWNpaCE3aZPVumK4Ie6ZcUHdgxa6dOzuPYq9LaFshxHTfE3QhP0uYRIbjH0wlz
 /M1Sr8aEzxPIeu2B6RdDw2wljQrbVPL3kgTI0KspCJ+0Em3ccDGmB215EVXg0yO9L7vWd+hhVrg
 3P4nUWwETK0vK95WjyQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfX1IKISo5evNQN
 LN7ItgkfdRhWlxSod4FHSme+7pU5oJC58V9M0mfmPWlhCSM2q4nIaOiBfxHiU37FJYbugxnwNkQ
 EQazKpmk82s4sKU0/yjd9o5tOdc2KlI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210083

Now that is unneeded.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index ed83dd927b54..3ef3ac2d86f9 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -170,7 +170,7 @@ struct adreno_protect {
 };
 
 #define DECLARE_ADRENO_PROTECT(name, __count_max)	\
-static const struct adreno_protect name __maybe_unused = {		\
+static const struct adreno_protect name = {		\
 	.regs = name ## _regs,				\
 	.count = ARRAY_SIZE(name ## _regs),		\
 	.count_max = __count_max,			\
-- 
2.56.0

