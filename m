Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657078;
	b=FE3lnRpgxpPl6qzv6Cy1CO6qHXaFk/wgZduVYwIs8pPLAHHywfnvYoBot+nqNvWVvWHX
	 TLf478JLw7Os7HW19tcMPxpaq4ULolClTiZkFGytI7rlWwjhrM6B15wWTS6NGLCzi0IJr
	 WgFZrrvuxLlK5v6KbI7VM7OO1vZrEc9Z2Fp6YV5gQRKauso6NBYxO/ILw2qHxZzIz7Qpm
	 SIugUyeZuF3mC8uMjZB1NwWL/HuOSw+CUXhyxvbGobdeRWJrVfFT0fnfZ/SnKm1GjtnhT
	 zwOy7sHRnmpbtLy750uc6qxUunpjzZDt314C/nhSg+MhM0x1p5IpNZOebws8SkrIzfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657078;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=m6mM3IDpZjo328CSxZDXpZGEcjx2e36tzzcU3Aq+/14=;
	b=4dncNV9G4wOyGTxor8gPfeFd1Ob9DtK56qApN6fUGKgu5OTIKCjo794uZjamd+seApGU
	 igxa67Cw1Ypq9hhpWXi+7ZxNpJYLEbgcsEc2z0kGzQeLeycN6zmclAGNRNdQ5hDHFeL3d
	 8oCJ/Kf6x6t94sVGKeyYtwj9f/3pRWecAVzUqf2opEBkLs7HPN5jAW9OwytBPDvl7pQfv
	 iGQ6ZvQvFHvRdV7tDWZuQsSTEE/wbsEnvMwojA8kn+JZzPv38sBxwySH7wwi1uSJSWUls
	 l1G21oDInmubdRGESAn8fNd7Ew/JDtbxZETl55lfDfWboVubmF8Iz0x+xNijPX9+wFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NR28QxSj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LdWJHwFf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005B5606A338
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 005B5606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NR28QxSj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LdWJHwFf
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K61gs1696465
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 22:04:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=m6mM3IDpZjo
	328CSxZDXpZGEcjx2e36tzzcU3Aq+/14=; b=NR28QxSjwj2j9QZaPCOLLFBTzPk
	CuizNoLQiTbu+BxXd8M7I6MwsfWY5n7gfoddjLEPkD4J+GQ8813kpleoC89gZJnF
	xoVh9WnAhQzP9x9IZVbGD8riBtDKli6OGgm4v7izL+XMcbe6GN0pEDLPrtey2MLo
	nPLOyE3xjKazNwbVE5OAFxq2kwVDNhz0G4gxhkAjbXaDcpZeQG67rBcOk+uyT1sE
	4Rkd44Nj/ACt/JJjh5WMERXVtgSRhIELweDNzjB6FAbWcXmcGHQd8Rkaq2HrW5Lc
	HY00AgUJSIX4MF+CLpgiaqun/RErZY/c9CfLiORchZkryaG6Su0MBDbh94w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1uy0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:04:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so3135731a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793657075; x=1794261875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m6mM3IDpZjo328CSxZDXpZGEcjx2e36tzzcU3Aq+/14=;
        b=LdWJHwFfAy137Fzd5ty/lB++RleNKb7Zedo+3GGDFi3pejIKFZuk+GmBfqGgOAAY4U
         oKPT9CK0SO7t6G1DMITvdUMphp9bmqZ0mL5ijKYKum8+t+pvMuZgQmu88xK4IUHF415G
         ca5osZ7vzPro1EGzw2cQw/9yulHrAjLg5zqfIXqmyqOQI7lxlXGj/Ab2E75GIfSIi/ay
         JoPqN1KIvZamYYFf3e9nAu5x8t9Du8SHVZ9bDy8SF92QTlECm3GRMXKritWGp+PFEBM9
         k7C/Z6PAOz6gw10kWbIuvlVv71J/pNcVGvd7eDLuX5hfJzAZKzVi0IAp6rHqBBhIO/68
         JjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657075; x=1794261875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m6mM3IDpZjo328CSxZDXpZGEcjx2e36tzzcU3Aq+/14=;
        b=WHB/TzKRFMOrIkPGb2fw7TlLJsIWwmm5ZUqlEV3KZB+H14bgfzyzYuj+pIDbcghwK4
         LJ+S3QXREhPprDzfqCVgkUGIhkjytjxldGFyUPGUZMFi0HULX1wvKtBpBDKasWyNZGpE
         OOgy9O9CQX8sq33yoPOrusiEMdVjNQ4ukjmo53geXvdSQgKbkYsrAEVy+MOy3vKXmMLn
         deKO2XW4DS+8IpvoTnjtPNMKXPgto4b9s5RBFrGm/i3vTE78j2HbPRwUuWfYiUUSfAFs
         mULtx5knoM7h9Om2JtQxJZjuUAPvPcAYO1fuOUIWJc2Z6IcxgZsG9zxxG8OEUnUCkz/4
         q5mA==
X-Forwarded-Encrypted: i=1; AKwUvBx15xIn3gOQtwgtsub0hQOkK1cDt5TuO7lqOp81iZ78jm2jXMvKEAZisnvSS+GKxHqVSmPjpdkTrRm0WFA=@vger.kernel.org
X-Gm-Message-State: APuU4Z99vBPFxPu+OppQhgOYRdRCLTC9N+jpkrgN3zZ+s17IaPc1JRpS
	gXq7HhYgOOd+iOBybTw1uTLRCdD9rBJh5ic0WUJmNC73J3SjLix4rCFLMQz+9uXc0LL7TzY6109
	mKDnhMB4d5BsGqKferTftiCGYtNLV7kfqzmm6P2ncJaE47WtoZg6yGIBs7WARGB3cEtY=
X-Gm-Gg: AYBFou1KIm1vtdVvQlUlnEZlMYv1zz/ItIrS1ZMktEyVYrobfOMuAZ1Np9ktjTLatJu
	9gjepsz+XPPkgnrblE7orpJDow7KE/6cEmT6Ug7qa1aLvUsyO9gR+P/HBbyRh50q2km2TiqbJOd
	24P38Xw0HCNif+1rVhmlwlU9cH/fB17PBL1fMKZid3c5Gg2NUd6XijyC+kvbjA/2lraV0+ySbFn
	BUa/+gCciRNWwURbUg/6S+ujTrQWwJcgdCKzDJBx4cP5NIJl7rbZc2Euu3BUXdek5TllFID/v9a
	Jjo0LfQxKK/xMIfXtS7BethaArwkBP5zZtZnMnQVQ6aZQcM569P0ry0tuuVscZ+jRgzc+fjmt4d
	m+ipsy7kr6R1DLqRXiUWJlObbwD1GCTpAOOJM5GGJoC7IoAPjkxBYFnKD+3JgxFoejskyMd7nZg
	hIZCZo6R8k+fQfCrKYAAti1A==
X-Received: by 2002:a17:90b:1d44:b0:3ab:c80:936f with SMTP id 98e67ed59e1d1-3ae896f852cmr8159931a91.16.1793657074719;
        Mon, 02 Nov 2026 14:04:34 -0800 (PST)
X-Received: by 2002:a17:90b:1d44:b0:3ab:c80:936f with SMTP id 98e67ed59e1d1-3ae896f852cmr8159901a91.16.1793657074272;
        Mon, 02 Nov 2026 14:04:34 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae87f5dcc3sm9501074a91.3.2026.11.02.14.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:04:33 -0800 (PST)
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
Subject: [PATCH v5 08/15] drm/msm/adreno: Fix PROTECT span length
Date: Mon,  2 Nov 2026 14:02:52 -0800
Message-ID: <20261102220405.30730-9-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102220405.30730-1-robin.clark@oss.qualcomm.com>
References: <20261102220405.30730-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: w9KNO0S5xtqgZqfRrVaS8rL7Z6o3V4hM
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae908f3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=MJDCpJTP__1aPQla-tsA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX9qcfCXI4G6wY
 pOR0ksTmkgK0NCBRDuMld/FTH8Nd7oHLH5LgfalEHZyv4Wesg+rgxn3o5s6vjaV2qeTG9tlfU1B
 amZB933Mz8fm5kFOksO7QGhRnQH8BaPz96J0ByL8Hn5QxMfnqcRK10RSi6/Xw+ZY0UriqpXCpuG
 TfdxOZWNY8ApjzOR3Kwxw2vJv7FNQwMXpWJ6FJz3bU7E22tJ+aIcUZTazuBvjqRBQ+5LSN8LGji
 5iKbZ1xCXgyG+6dnHDptsUROvV7+OwN359hnloArZXRLA77keXDIecbvJ+XC+GZPFbYasEdXPj8
 Ff8mCecy5GR5PxsQcD0QELPLsoCoWGWCsYtVfvnucirI21vhaXdMD+XYq39uq8rFrA8y4MOTY7K
 cBXvfWCNHc0NXXA7Ja7GBaSZfFCoPQ37d4mj+UwSnNLkBEPqy9h59wZRc97VGT1YquZmAnD8hZO
 2l8EwePfOpVjrWilsSQ==
X-Proofpoint-GUID: w9KNO0S5xtqgZqfRrVaS8rL7Z6o3V4hM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfXx6xRXMHNp+Ju
 LxUI6OLaYOJt1apnac0ALVSoEQr8GhopcM9cKC/Pll5o1TPPvzGomUPH+CsaCV4MaNLbsg+H7kn
 txgOIYeH9Sn8lDJ3nCCnHEOHhrUiyME=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020087

Don't let the length bleed into b31.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index f8b9ceb588dd..6c28ba1c011b 100644
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

