Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794007367;
	b=GKb5NNhio6QDjTuwo3bONiIrKTFC+75RKubR/apFkiNQEg2jODFHp9us4TMwWpmHuxyc
	 fUuuhIivSpdaMtnT9ghpZ2CeqI5U0CgX+pgiLttqtxPMo+zGYHGufOhZ99pTRl42aahxv
	 8kVEAaQShQARD1AGwW15A8JmSJG3uRiMUEKKiMDlI0PYZz8qeU7+D3J9CAjCTSwFgYn1g
	 v06EdtCEf8kACcUVFNsPeWKDF84Tyx7akQLWxbVZXF/jCHiRmzondJA5RsCl0qzTcc9/A
	 UrZGQ6ztLscXcy1VCxT1MgXiKPhV5XqjRm/ObsvbCHfdS8J4tKrM7xFC/+3iH+Ll10A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794007367;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PPgnV+/icpoFhI/kUPr3+TxF1BiCW4u9d+dKLSBISVI=;
	b=PxVesHuBqzqRdRFJwTCEyc0Wk2/YCseHFaWm7eKbgq3S6Xx/jGvL6Au0aLSkw4eZLtOg
	 0jn6I7e/V/1DWGrV0R3UKuwCiBdvvuiE1TiwvU1R5brea7DfIcN6pdNaNlOngXvxKfupA
	 a+1rgVcYKtT6YsS5kGUU6auXgfL0oXEcmWK6N+YB7X+5ck3QHTUMcwtwG0B9ZhSN400jc
	 VmvGKLEeX5m9DGsNWRA3s3+dXcuAxlB5Hg/Vg/peW9Yni9wwrfd60IgixtOOBMBuLEGKH
	 o0KMx9I+FnOM2E8sXg3NA1G3J/PqkC4ePFwaRgWx6yrjIkRMdil7rfX2hQVoLt4yz4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I6LOmRIZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AP5uw+QB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D171B606A335
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 23:22:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D171B606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I6LOmRIZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AP5uw+QB
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6MoPmq1733195
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 23:22:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PPgnV+/icpo
	FhI/kUPr3+TxF1BiCW4u9d+dKLSBISVI=; b=I6LOmRIZ58oRfznzvkRzyRiyMaZ
	WxMslWBgqRZMqsoHFQG0zoNErjGiDoXCKEgNCwuO+GY4JvhYPUOTw2ApqYbHPG2P
	M0KCSnyiFFIEhDw7ENkD2smjVCvj50Js0IQt1F2XOxHxdGn3UliX73SWnCU7+IuK
	/XQeBMtw0FuaDaQMZSS6itc2NoIJsFt4KdQiaT/IZsWq5f0leb2TrfMRYZvVo8en
	OnmusS7OaqnLeko2i9yfF5jfE7IDAAUl4O+PNWrcG79LSXsGDuPTPyDx14zljnrU
	BFAIuc4jYCj2/ygGD7W6H1lxKYqwgGyV8/adGkJIc49sYCS0Myjf66/Ew0Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsn0e0qp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 23:22:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad91787a1aso794750a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794007365; x=1794612165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PPgnV+/icpoFhI/kUPr3+TxF1BiCW4u9d+dKLSBISVI=;
        b=AP5uw+QBeE4qCaVFu2hcf6dpUEpUCVUcXra1ZB+iktyAa8xA6DsD6B2rMNnPn5vxFL
         68SoQL0eeqXX9Yv9CuVXi621j0EBSAFNQsNb/Mb7x3k0I+Cye/KO/GoPgDJgbSMnpKI5
         xjasxSrKwCBJfNHrMLtgZDmBv1GNIPMtny0wrTsXt6cHpUkx0vYNelG46xRWOEwxCojH
         zUBsh1xiGsMMdeFPtGDmZvFBq6XTqrd93EqQaj5bJtaHKbc+87WJJQIaUysYMdMH1lD4
         C390z+n4INeirTvuSE6mRAMcnzRiKMWD8xmzqVSJp01qNTFsvm62R5wM0JbJzBP3Hgo9
         Wkxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794007365; x=1794612165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PPgnV+/icpoFhI/kUPr3+TxF1BiCW4u9d+dKLSBISVI=;
        b=bEljLD48ZiwR/CYLt71VzpZd2TfK62XUfrT7+VcJH3dSvuw9NrkmNrtnwTvQrQlI1O
         19Fz8e4Vk1DwNJMDnQJxSjhp5O++EZm6QiKsqkRh9GCBfBezwsBeB+AOV/CkSrzAMUhA
         KPfoVIkI+wLx3IFjNQX3we2Uqq9IGpBXZG2nLb7JgTwIpILXqlr3312hKEJKYKfUVhHH
         IffMBO1s0bFD6hIIQfF3szzmDYauImtsHLSrB5OmIWhtHar0iZa+WP5OchcRT3CwVDEP
         X5feUhZC8CaOEJQj4/ML3KWes70dm6MX+24poLjU+Lv8L8DGkzTsHGSkLri/J1hFQOC3
         6FpA==
X-Forwarded-Encrypted: i=1; AL+hErGXlocFqU6Y6vg+Fur4w3MInjaKMPb5oVxBQ+udp1Fuhy1ejDQx6x0/PyJOnnGa3gOBe/PMhghTBpf7gRU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EtQI8oLon+dQb2CWXcGvXFo09FQiqk2uLu/NGPBsjKlkgzjIo
	a/Sc8j5aJPtfCg8f4J8/UTVTG6MzYUPRwtI8C+llCVpDQYNX2mU1NYU4mnKIrzGqnob2B8SX1z4
	0FbTxt0opy8eGQvV/nd/ORzo35DkkTWoX3Fig9PI5FkmfN0hMqBs/nvltFm2qekxBx/0=
X-Gm-Gg: AYBFou151t/AK6yi3+nNI0PVNa4jUjXQmlS0tnZFy9AU3oThxtVLKd5j9i7jd19H2ZZ
	/HFLEcQGJ5ZrCkQNGhkGEsXfGAAGFC1sI+gUbsXm6kJ+yIyeL7OyeybztTVWf/rZltOLpKvIz5C
	42alWpbaWajmilNGCZGNliCxn9905fXymK11akV+4UurIaBw7m7h0n30jOuedZO/G5oLdSah+dV
	58ZyOWJu32JAgqx2jwx5a561Z7V34v/od0A6cat5X2dcnklIUy/Ssvqz/MtPZUX7vhVr6bX1IWk
	qDHRPT85Dcl4BqwhvMSNUVW/zusvSHBHfgtyzo72yZZ4U0csvI5Ut3gV4SwEKLksIGEJqjOM1B6
	m0GS6MyNItZQpoWz26b7kaQAp1GM8Ilh4tjyAIMZFfCq0CkcbO3VPCr+TEUDMLJBOtTa+PVbbsL
	WVPvpeF0m0kg5tVbpq4D2lU7PGqtHWxYODqaW8Exdo49yRonS4sYVYnat7E8ge4g==
X-Received: by 2002:a17:90b:510f:b0:3a5:c08:4c41 with SMTP id 98e67ed59e1d1-3b0db724f88mr3658920a91.50.1794007364797;
        Fri, 06 Nov 2026 15:22:44 -0800 (PST)
X-Received: by 2002:a17:90b:510f:b0:3a5:c08:4c41 with SMTP id 98e67ed59e1d1-3b0db724f88mr3658892a91.50.1794007364325;
        Fri, 06 Nov 2026 15:22:44 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b10584b66bsm650571a91.14.2026.11.06.15.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:22:43 -0800 (PST)
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
Subject: [PATCH v7 05/15] drm/msm/a8xx: Add missing a850 ifpc reglist entries
Date: Fri,  6 Nov 2026 15:20:57 -0800
Message-ID: <20261106232220.47602-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106232220.47602-1-robin.clark@oss.qualcomm.com>
References: <20261106232220.47602-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: YUt3RrRwrOe9utJslZZ71McA4kGcNwoZ
X-Authority-Analysis: v=2.4 cv=ffA4WEQF c=1 sm=1 tr=0 ts=6aee6145 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=vdKEjRuvQ9rlgTdWijoA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfX5On7baOXMRRb
 5nMZ/KEB5YVyiF3l8eVsynVQ0vLJm2BTWPpG5HEkL+5dK7JLJGsMM9MmUxYxzm4z4TogxiKgICV
 9zLnE/TjAd9ffmb+VdSCWltoOHSqfYizqQ9BwRyOwO9fLdooI3Z23Jq54fDfj/fImwZX11wanpN
 YkufeOKCHCGMld1GxYK2uIJRUlGIW3r50ElSECs0znVRBDvQhvjqDKN6LH6cHhBgWBN1g5DG/Qb
 XhH60QlDy1qQ49gE3+Zu6NWYSxv34gDiavF1xdlRC2OQ6ftWu+UROEuVabE5/ORd40iKzXF/B23
 Yaov+31bPn/ptJAUG5nohpE6LMBkuHjqMYVLAIJsLXpg4kj84Zg9VknU+aP+0GyIM/hkbB8YOhv
 lZFwCAJEDP3LDVRITGHAiwmVy3M8dkAugRrFhndilYOoXzNRB+eWcTo42JPtPHBf/altUQOH27T
 Elmc3GJL4PjmelHp5rw==
X-Proofpoint-ORIG-GUID: YUt3RrRwrOe9utJslZZ71McA4kGcNwoZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfX2OBdCvSgHOpj
 WvBLHgosRJ/2vbeo6iZpF8/GqvT9RnKyZ6cOriHbjt35+qsNXC5HqFszi0PQOH+AW7ie2DJSCvA
 1k/Xc5Kmyazsn8+kCLcuG1t/q6qC2Fk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060093

We want to save/restore all of the CP_PROTECT regs across IFPC.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
index a3eab0307529..dd1a5ca91812 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
@@ -1393,6 +1393,13 @@ static const u32 a850_ifpc_reglist_regs[] = {
 	REG_A8XX_CP_PROTECT_GLOBAL(53),
 	REG_A8XX_CP_PROTECT_GLOBAL(54),
 	REG_A8XX_CP_PROTECT_GLOBAL(55),
+	REG_A8XX_CP_PROTECT_GLOBAL(56),
+	REG_A8XX_CP_PROTECT_GLOBAL(57),
+	REG_A8XX_CP_PROTECT_GLOBAL(58),
+	REG_A8XX_CP_PROTECT_GLOBAL(59),
+	REG_A8XX_CP_PROTECT_GLOBAL(60),
+	REG_A8XX_CP_PROTECT_GLOBAL(61),
+	REG_A8XX_CP_PROTECT_GLOBAL(62),
 	REG_A8XX_CP_PROTECT_GLOBAL(63),
 };
 DECLARE_ADRENO_REGLIST_LIST(a850_ifpc_reglist);
-- 
2.56.0

