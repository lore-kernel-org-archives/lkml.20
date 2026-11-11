Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794417262;
	b=GXBAxXxxXFKxwjvTMuJpsVwcajs4yi1MxJIpAjdVOavHJDs1qmGelqwgQvRxU7IZ9PQI
	 Voyexjh0RS41QF3honoJ58lTKDv6idHSJPmnvq1EOlBMMJIHHadU7vuf5mkLZv+VOaIZH
	 9wbOF2QJijpAbSd7Snyv3r/uwUoExsYIiW1NW0sDCx2P1z01PWex7Ceq31D7XYVsJupYw
	 jjSEOtJ0RH9QAs2/PBB/1Nj9NpIovftRMhV1iwZ8GXmW0XzasCuX7sXAC0SmEi350PDwk
	 EOd7Mn71AKdIElBK5YSRnar9fnmfM6YAfMp4i/UdF+Yzjo9/ndgLJgG8rTXNpsfkCMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417262;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/wofSj9aHPA9D3MGeEg1Jb27L1jT6JF34ZU9QKgLdoM=;
	b=TKmxW4dtiQweNV91WL4aaIhCTBe5DoLNPFRJ1igdcTMYQqH+mD3kjx5Jer+l2yVNZOws
	 tkCZQIvs96qDBv4yXFLhcZFFAy7ple4ePCtsTFl9YyhHZGtsGZSE1k7fbN8++/6xzcTHl
	 B/2QG5RIhh19Ax2Xw+M70bu/lkARiLsGhjJbANGTGcJFNELNmJGnE8GXEuZijz/8o7RXU
	 MC6u4voOAC5l8ioUvihR7+se7P6ojaDzBFWy8x11nPuQCn81MYrOJVjotzPO6yTEwHkTn
	 3jEQkJBI9f2a9I1Y2Dco4NAVJ7GvSuMzBWuGNHztK5EL9BvH3fGZuim8v5liJItKpJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XInsIKDv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VVzdtrZJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E62A606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:14:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E62A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XInsIKDv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VVzdtrZJ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0Mgx2665050
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/wofSj9aHPA9D3MGeEg1Jb27L1jT6JF34ZU
	9QKgLdoM=; b=XInsIKDv6Kvmyy59js7k0guJDqGZv/3GaSfRNpGavdN5zPn9yD2
	3ryesp77XMZIxNa2Y8RezwFpV/Vt5M8xAvZ8DPE/X0YyWNwEhd5SSCuo9hHhW0NC
	t8Q6pML2a3Npno4kOQkdMxwyNIku8jXnnaGQS8dyQhooU81cIRd8rxUvvcUL8eeQ
	DVE1zNrWWqT8N9tHebPBclWgx/Ar9hDm1jtFYVzuNc3P2yQxkmf+4mw5LxQ47Nla
	w7gnQbr4s+rA6k+pw8dn/aLJc1aT3mJf51zjFlfV7F/0s0ACmuPMNMvibu94qaJx
	5fpKthivPUpmvrLHEILwCXu02inuRtReMDQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdjxf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:14:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e8dd9b9743so38369915ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794417261; x=1795022061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/wofSj9aHPA9D3MGeEg1Jb27L1jT6JF34ZU9QKgLdoM=;
        b=VVzdtrZJYM2YnDziq573eO88rdKz+kV2sU7i3arrogkTHTkWMXDowfJZTZmNH1o5P4
         HmrFuWQY2ioKbx/k3CYSuSvmNkJBEkTSgjvTZ7j3Egt/If2U710K3JWKbJCNVomb6+Kh
         UC2su1zfjvZzRV8MACl66Oh0GW/m5h5ErXT9spZlaqxL9EXdmlP8HyFrV996ESOCpvCi
         0EzFXwHfmexkUqqrH1/R+QfL+NYR3GqcdIUA9JSgnumtA2Dl71XgHCmwi/EuhQm04DNn
         DmUkat9tWG7yTHaSEDS7j/EFtyBf3EXvYZappBQJ33dUOM+M+RZZf3Dnw+dw7IrO7jYu
         d9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794417261; x=1795022061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/wofSj9aHPA9D3MGeEg1Jb27L1jT6JF34ZU9QKgLdoM=;
        b=R/T+Yfa6/KFyQMm6seKwLBwlBYfbnl6J46z1LQ9p8to4MaLqI5cNT9m1GUBfdHECph
         30PDKk0/FlaMeza8NxV/2SYFLJL6gjphBBPWU3cx9M9Ley/uYKfpSUZfJHcdHWEbGc9v
         1i/gcRI+2DT0BtEr/GYtwJNulMj7hJbWSA3fLa/TxXgp6EkeSUEBIz6fXvJc/D3Y/k+5
         Nq78M7i+M8ALwW6fVZ4B1Vzq4Onw38RbEamA4iAts3Rzdlh2RokZx3FuB2IBUY5oy2Un
         +2EMG+r/mLPPYa+ADiHVqQEc+hNQxmY3PC15vp2DzRG3j8YiQGG/guHTrdrrQ8kiUn4t
         R5Qw==
X-Forwarded-Encrypted: i=1; AL+hErEzOto9JpNCSPV9IdO0dWCnRYvyszCY30JTgFGAqf812LxmGlTTQV7W7N3DhAfbnRrfai0A/p34xHu15Tg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SSdYwIePrcZbtZEjMV3UuIzh4L2+0slbvRx0cKKtcDJ1AbqJB
	GofHMl3SMtEyqcBD7Uf2tYvj0K76RNMQdxxgqcG5PjihGwz5T+WWItH+n1BP2/dNx2WTEiMbp5n
	VRrOjyMgRBPu1X3XIW90zYtU+f0BOkubwptXCcPL1ZfOArtkWjeKaC7HMB7aeYYVp19s=
X-Gm-Gg: AYBFou2unHnDnu8WlmhxZ/5tuPSwwQ1DPaNRVZt91XNAreGwbhqay+mSB6BE5Nt6crR
	2lKFixUNH8VSR7ILIfszt4DlUNYlulQhbyf9J4TQ7tA0ZiAIxgf7CaVJufyidGb/ImKZVOd72Id
	iIw17+p3mVLpmPacxf/Jn0b8Zhmaf4dBpSptvKJ6LXuRNSKM8Q/MJPFe3m903RBrFWeSYGPBBYd
	w+eQDYUmbvV/+7LmL4bHuXGuihwdnbuiIg0TwneDygVKPOpF5LjtDcS7NWyvBP9lXsNJQzQiUDM
	IqG0aXOZxy8FRv6bAZH5yaGU8hPYcpxUK7SowDJZjfuM/2FXGL7by007Uct2Rb02WKQe+F6GIRA
	dlE06lCR5dXTwoigOVnPV63eV7IWZU1Iu1bbgBmBGJ3gcMuJdSpa0gNk4Uwwtd3zvjtW/A/PrL8
	ws38DzyK4CpV6mfAMe0CPfdS+d2gEksNcNGYnyUu6Jp+AX7KJGXNxEq109+0OJeg==
X-Received: by 2002:a17:903:17c6:b0:2ed:379:158d with SMTP id d9443c01a7336-2edd76d251amr34944325ad.9.1794417260842;
        Wed, 11 Nov 2026 09:14:20 -0800 (PST)
X-Received: by 2002:a17:903:17c6:b0:2ed:379:158d with SMTP id d9443c01a7336-2edd76d251amr34944115ad.9.1794417260379;
        Wed, 11 Nov 2026 09:14:20 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4d78bsm23272985ad.24.2026.11.11.09.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:14:20 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/adreno: Improve AHB error messages
Date: Wed, 11 Nov 2026 09:14:16 -0800
Message-ID: <20261111171417.249152-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
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
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af4a26d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=WBtBlQOfHxcDcTM_9MQA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: BWWlaKJxRI49vsftuLjMo0Z99wOoKpMO
X-Proofpoint-GUID: BWWlaKJxRI49vsftuLjMo0Z99wOoKpMO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2OCBTYWx0ZWRfXzD2Mtn3v/7wJ
 x97p7y732JlK8foZZ5OZveallyp/bY2ReGfvzKzUipfdg9Y+lKnFAobg6/rSvQCT3Ny7hcdOVRx
 0+HCbRoBjcRj1QWeBr4rAwwIr6US7WjkUe+FDWO0r7ayDld+afon5+wsnlVGQsKo3QWEquOyHMG
 qs4YHBWECP4lTcxwRE+YVU83DVmK+1byEOLSx7iaGDIW7gR4dKXzROSH5yNfJCU54tXexqymuDo
 iSm9OOThEZyQmZuohpGuzH3rs4GALKeJbK4Z29gPQBh7NrzSN3Qc3XhRxxoVPjf874UCvgAsXFH
 mQ3ku4nMhORXySKkZ+1XEYOS0ciXgLkSbxhnG12SwrGUH+F8OFfKZqL8r2XigEuhOqVDGbl1BjN
 Jjl+h8jg0io22Bbo3nsgg2MZ5LXgfEIWM9qibwa9dY7DZRMTVfPQUV4X0tAj+vXl7LmSBgFTg/a
 VzHgS0BH4O3SzZGqGqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2OCBTYWx0ZWRfX3zKND2LWMKWK
 5qI0vsIINuzFLdlX3eDo3aD1qoJHxskMTQgnOCm6twWjaxcfzaTrdadBqvTKe7qywnCWHcisyHj
 /n41yXZgPbSh46kam+YVO/h7d79lml4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110068

On a7xx/a8xx we can get some details out of the CP_RL_ERROR_DETAILS
registers.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 20 +++++++++++++++++--
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c         | 10 ++++++++--
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 11 +++++++++-
 3 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index a93e9c960d88..484a78dbc804 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1957,8 +1957,24 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
 	if (status & A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT)
 		a6xx_fault_detect_irq(gpu);
 
-	if (status & A6XX_RBBM_INT_0_MASK_CP_AHB_ERROR)
-		dev_err_ratelimited(&gpu->pdev->dev, "CP | AHB bus error\n");
+	if (status & A6XX_RBBM_INT_0_MASK_CP_AHB_ERROR) {
+		if (adreno_is_a7xx(to_adreno_gpu(gpu))) {
+			u32 rl0, rl1, addr;
+			const char *mode;
+
+			rl0 = gpu_read(gpu, REG_A7XX_CP_RL_ERROR_DETAILS_0);
+			rl1 = gpu_read(gpu, REG_A7XX_CP_RL_ERROR_DETAILS_1);
+
+			addr = FIELD(rl0, A7XX_CP_RL_ERROR_DETAILS_0_ADDR);
+			mode = (rl0 & A7XX_CP_RL_ERROR_DETAILS_0_WRITE) ? "write" : "read";
+
+			dev_err_ratelimited(&gpu->pdev->dev,
+				"CP | AHB bus error RL_ERROR_0: %x (addr: 0x%05x, %s), RL_ERROR_1: %x\n",
+				rl0, addr, mode, rl1);
+		} else {
+			dev_err_ratelimited(&gpu->pdev->dev, "CP | AHB bus error\n");
+		}
+	}
 
 	if (status & A6XX_RBBM_INT_0_MASK_CP_HW_ERROR)
 		a6xx_cp_hw_err_irq(gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index f6afa5b3b0bb..bbf5ca4fb6fc 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -1248,12 +1248,18 @@ irqreturn_t a8xx_irq(struct msm_gpu *gpu)
 		a8xx_fault_detect_irq(gpu);
 
 	if (status & A6XX_RBBM_INT_0_MASK_CP_AHB_ERROR) {
-		u32 rl0, rl1;
+		u32 rl0, rl1, addr;
+		const char *mode;
 
 		rl0 = gpu_read(gpu, REG_A8XX_CP_RL_ERROR_DETAILS_0);
 		rl1 = gpu_read(gpu, REG_A8XX_CP_RL_ERROR_DETAILS_1);
+
+		addr = FIELD(rl0, A8XX_CP_RL_ERROR_DETAILS_0_ADDR);
+		mode = (rl0 & A8XX_CP_RL_ERROR_DETAILS_0_WRITE) ? "write" : "read";
+
 		dev_err_ratelimited(&gpu->pdev->dev,
-				"CP | AHB bus error RL_ERROR_0: %x, RL_ERROR_1: %x\n", rl0, rl1);
+			"CP | AHB bus error RL_ERROR_0: %x (addr: 0x%05x, %s), RL_ERROR_1: %x\n",
+			rl0, addr, mode, rl1);
 	}
 
 	if (status & A6XX_RBBM_INT_0_MASK_CP_HW_ERROR)
diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index b1e7dd26e98a..8d33d9285007 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -193,7 +193,16 @@ by a particular renderpass/blit.
 		<reg32 offset="0x0" name="REG"/>
 	</array>
 
-	<reg32 offset="0x0840" name="CP_RL_ERROR_DETAILS_0" variants="A8XX-"/>
+	<reg32 offset="0x09b4" name="CP_RL_ERROR_DETAILS_0" variants="A7XX">
+		<bitfield name="ADDR" low="0" high="19"/>
+		<bitfield name="WRITE" pos="28" type="boolean"/>
+	</reg32>
+	<reg32 offset="0x09cf" name="CP_RL_ERROR_DETAILS_1" variants="A7XX"/>
+
+	<reg32 offset="0x0840" name="CP_RL_ERROR_DETAILS_0" variants="A8XX-">
+		<bitfield name="ADDR" low="0" high="19"/>
+		<bitfield name="WRITE" pos="28" type="boolean"/>
+	</reg32>
 	<reg32 offset="0x0841" name="CP_RL_ERROR_DETAILS_1" variants="A8XX-"/>
 
 	<reg64 offset="0x0830" name="CP_SQE_INSTR_BASE" variants="A6XX-A7XX"/>
-- 
2.56.0

