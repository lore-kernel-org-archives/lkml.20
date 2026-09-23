Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802C1483823
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159225; cv=none; b=W5mt+mAmaUndbggUPfGnfhpVIXzp2Ph+vx6TWgmOS9yW25v9xRDY52UGPhAqRkNKN9BJBiLibMQs7uqKV2QxYD3mMYmomo1inWRDeGzEXWO9id6cB4WOn9SQzJor3lc/pwwfwiDBXLIEb+82F/JGHvrvz3YeRnvd9MAB4w1QzWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159225; c=relaxed/simple;
	bh=kURPhCqwLXhWyHDPUC0FBQT0xU08pc7L+Itm6hSzjGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kD7+1xj8uYw9+kx8X0SEP3RMjAWz7w2XkpgH4Kaogz5206F5AqmbG/RMD8jo8dFIauqqqK8KhXeer8hVWij9h0kLLLjT5geaL+6Nz/olgNEz4rZQt0ofdRE8mwwz6QRJMS27IG0wVUu3NwtVI9wzZkOsE+gZcOLFBuISS7SSFTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RidMsegH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PoB6wZGD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RidMsegH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PoB6wZGD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2ecF2429373
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:26:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hueBpJZSI73Jt1u8OsHLGqyaejzw3nzZoOfdwbdMyx4=; b=RidMsegHyDJOlqMk
	e0uVv769jwlF7ICnDIZcPtOmO7KGPS/L9wxSzxRh7lMkdqYpe4b03W7R/ZVTKUhE
	0i64msJMx1guvPdHfI8uuQ4qfvGGg41orKEwAQP2DtZegZkzY1IBjBwjZymv2+Rl
	BgH2L7l9sZOPCUVVpb5/z4xoQ7aTtVngE6Awzv9PjLFF0dAanahlLwuDvlsl13XP
	lHvFt6C+doVSEZ4BDCW3IGtWzbok8bJ1sNWwLoO3FqWqsqDZzpPhK3TvdrDYth7T
	/GlwpQSYFVJFyPcrIo+mn5C76/3BYQ7bEpVvKdyEfRjtVfNQyNv7UpDjvu55tLe0
	J2U/zA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv9bqh231-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:26:50 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-144f706e063so543913c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790159209; x=1790764009; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hueBpJZSI73Jt1u8OsHLGqyaejzw3nzZoOfdwbdMyx4=;
        b=PoB6wZGD0ubfJtSY1TN+B2aToKfDZTLsJPM4EDuFA6w1mh4Cbj0rEG+XP8atBxfQrD
         JGSEnfE8rBSh1PP4pGTht5gEpn0eAAxege+y06a9KT1wOBUIFLleJoldhx6UTI3rPacL
         X5U+tvnw2WIlw/IYq3gETAY82UzRYnI/R+2Y+Hf4llzXvtqLndXs8ogMCYZfZB6zTiEv
         a+sCKeJzMCXEyP3pMy6JBrJP4fmJCxXIvyoem5s6icIv3frFui/Ys4iGuEdyjToVYSw4
         nfbhjAUxrEwdDNkQ5/ekr3T5lmZxCHPKn7Q53A2yzWsq1r9KH7d9oGa/RLeC3hZjcLZu
         u0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159209; x=1790764009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hueBpJZSI73Jt1u8OsHLGqyaejzw3nzZoOfdwbdMyx4=;
        b=wKgVotTmX+n31pCc63RI53aR30tj1kFu8W18mnAmKYNNEqaBhudjYOJdajksS/uhz+
         tdm4Lw0itvFHAP4LHojPUdpbZL/RhChCze+0wKv+iHf/87VcF96kLwnpGcnc4OY/t8hy
         y64hi0RNTnj9COYpkGnaQrMcqGFTEYxAyhe9XX7HJmZzCTHZUlevNNgoeZh6mdjFVQxI
         dcNzi5+A2fOsAU2+Ak0F4fMc/dnmvnINDIDCJjSjXM8qCPtjWIHSOsAmbhjXWDHzoLWk
         Sc20EEcqPHRxJXODd97GgRGtgfeARhPt8F7L9iec/Nl3jS35IuJC0a38Xut2tBRR6V76
         6/jA==
X-Forwarded-Encrypted: i=1; AKwUvByNQc1+K1WUr/dMWbnmuLgzXKXTs1NoGB3ORKXv608W6HkJa1VtDPY/A5/C0DhESYjR9gpX5n8LrxSseVc=@vger.kernel.org
X-Gm-Message-State: AFuF++n4pSDuHyiRCPaNTX6Je/N9eFJp1/FN0Ybu7NOZMVMzNMEnKRcl
	iexGdzHkekYjP8sFVuKwrxUZp0ZqmS6Tv53PGpJ/aJ9J20wlaZ49mt/PfVgCiN7SruEGJ6iZxqD
	nD1+f+GJdItf7zXx1BzrdZawVaXQ+svfUllclh4untIQc1wg9KHSUKmE3LlOXgCG9BfU=
X-Gm-Gg: AYBFou1eoR7wzkzdtfwxpcpt0LEh7kMy7K1LieskaqCuzJTT7KDj9VYs6mKTfwJbxL4
	v6dYBlMtOBpabILG3DP3Z9j5p6mD53ETtg/ykcu45LjZcb4CUQ7BddyYl8AzqhwMosxqcsAjb9m
	yO+CW3L1nK6Ok8DXB7XqJMy3q8XOEc0C3W2UfSOECxX27PjI1EugmhE4kUuXuHVVtKpSYopYKLl
	Y+MV4nW5dwP+VxVw7mAdqyKVn14akKJVT0Yi6vj3i7vKg6Ebt6AWQF1qTggROzF5brIDMhL4hAs
	E4nyFdUOwpPncUHo99jNYyIBN0FGK02QG2xHYLIwC/lBdRNp2MYjXF2Z0ORdPJ4WGqv45orQYG/
	qjh7+Mm3wR2u8fD/M2/VI/Vw=
X-Received: by 2002:a05:701b:4291:20b0:141:9d33:f1b8 with SMTP id a92af1059eb24-144ef0eca37mr2418621c88.12.1790159209246;
        Wed, 23 Sep 2026 03:26:49 -0700 (PDT)
X-Received: by 2002:a05:701b:4291:20b0:141:9d33:f1b8 with SMTP id a92af1059eb24-144ef0eca37mr2418598c88.12.1790159208743;
        Wed, 23 Sep 2026 03:26:48 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm8766646c88.13.2026.09.23.03.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:26:47 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:55:45 +0530
Subject: [PATCH 05/15] drm/msm/a6xx: Add BX rail support to GMU dependency
 votes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-gpu-v1-5-0c3c79a1a470@oss.qualcomm.com>
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790159163; l=2678;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=kURPhCqwLXhWyHDPUC0FBQT0xU08pc7L+Itm6hSzjGI=;
 b=NWMeHEh6JevxUszMhW2aEo9xuwPWpJ003QMf9bmjaSM7H2sFolE7OUzs3B5B7nYc1829Pvnxt
 hBq+lahzKu8CD86SybRsANUAVOYQXh0bSvQkzX1i/KG8rgr7cH+8kxm
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: smvzxLyfKT3ZrzhgVnuNnMpTsnjENu44
X-Proofpoint-ORIG-GUID: smvzxLyfKT3ZrzhgVnuNnMpTsnjENu44
X-Authority-Analysis: v=2.4 cv=WZuZ+EhX c=1 sm=1 tr=0 ts=6ab3a96a cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=55tSWijHQoufD_vR7dwA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX99SQ/3bR/Elz
 qb1pUJ11ArdHbrJ5hvp53MG+yTPm1t9+YlGProU/rjChxOWDbk8BsmrIe59kLE1i3DjbxOeomD1
 Q8Gnhr+FP3oOTX+AWoZqJiLsnkA2Q4k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX3Vza1Ga6kNqz
 fRP5v+M8m3RC36fR0AwkYbKyc2N6GBopcqVymHJgS8x01YoVdTq/J4LtQKtXpbrltnyOti2Ngmi
 QXUqSCuUmiRhf2gCvD+z1/eToSr5t14PMIei85v1CKbuIE9L6ppOm1GE72hGoU+V6bIMDiVzXmF
 6qBGEqohsxeSLJgLQaKS9kmqPGy/G/1tgOSSlyM+CkfTws6mu7cjfSRa5sZ3k7HgvlagTek9ZJJ
 ECjfC1iqpqQjBoIK/IyjJGQuNubOhwawI4bLP6IsT2JDNH8Zv6wu4niUdM0mwy94AhLJUGh0KDh
 iendQyqeDWvwqhIg+a6aI8+1NTYRbmgS65y5gc9bYmHbMdna1BYnP7TfgjM2TRw8wLUyxetFID4
 KzgF29sq+/7pu5gklLQNHCuIKguQPGYvXGrfYF5wjN0vXpunafERoIoYvQQRbfi3sbQsUDqlSkp
 wSJ1X3l6uB41VGMA1kQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230041

Some A8x targets have a third memory rail (BX) in addition to GX and MX.
On these targets the GMU dependency vote carries a per-corner BX vote in
bits 25:20, which otherwise default to all-ones (no BX constraint).
Prepare BX vote field to pass this new voltage recommendation to GMU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 37 +++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 0ed01ce1c5c5..2b66d6c7fd19 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1799,16 +1799,34 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
 	return 0;
 }
 
+#define GMU_BX_MASK	GENMASK(25, 20)
+
 static int a6xx_gmu_rpmh_dep_votes_init(struct device *dev, u32 *votes,
 		unsigned long *freqs, int freqs_count)
 {
-	const u16 *mx;
-	size_t count;
+	const u16 *mx, *gx = NULL, *gbx;
+	size_t count, gx_count = 0, gbx_count = 0;
 
 	mx = a6xx_gmu_rpmh_read_arc("mx.lvl", &count);
 	if (IS_ERR(mx))
 		return PTR_ERR(mx);
 
+	/*
+	 * Targets with a third memory rail (BX), in addition to GX and MX,
+	 * expect a per-corner BX vote packed into the dependency vote. Detect
+	 * such targets by the presence of the "gbx.lvl" RPMh resource. The BX
+	 * corner is matched against the Gx rail level, so the "gfx.lvl" corners
+	 * are needed as well.
+	 */
+	gbx = a6xx_gmu_rpmh_read_arc("gbx.lvl", &gbx_count);
+	if (IS_ERR(gbx)) {
+		gbx = NULL;
+	} else {
+		gx = a6xx_gmu_rpmh_read_arc("gfx.lvl", &gx_count);
+		if (IS_ERR(gx))
+			return PTR_ERR(gx);
+	}
+
 	/* Fix the vote for zero frequency */
 	votes[0] = 0xffffffff;
 
@@ -1816,12 +1834,27 @@ static int a6xx_gmu_rpmh_dep_votes_init(struct device *dev, u32 *votes,
 	for (int i = 1; i < freqs_count; i++) {
 		unsigned int level = a6xx_gmu_get_arc_level(dev, freqs[i]);
 		int index = a6xx_gmu_rpmh_arc_index(dev, mx, count, level, false);
+		int bx;
 
 		if (index < 0)
 			return index;
 
 		/* Construct the vote */
 		votes[i] = (0x3fff << 14) | (index << 8) | (0xff);
+
+		if (!gbx)
+			continue;
+
+		index = a6xx_gmu_rpmh_arc_index(dev, gx, gx_count, level, false);
+		if (index < 0)
+			return index;
+
+		/*
+		 * Find the BX corner that satisfies that Gx level, falling
+		 * back to the highest BX corner if none is high enough.
+		 */
+		bx = a6xx_gmu_rpmh_arc_index(dev, gbx, gbx_count, gx[index], true);
+		FIELD_MODIFY(GMU_BX_MASK, &votes[i], bx);
 	}
 
 	return 0;

-- 
2.55.0

