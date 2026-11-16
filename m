Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835101;
	b=pB2crE1F5ASLW+NCLhTG7sU0r+P20eh90oVCDUe7iQ8VNu4oyT4w5PZlh8ZViF1yu3zQ
	 gcuGZyP/2ztWVSRYho3fDDT8/+mdvLoI2bPz76g2qyV9XWZb5fmdh3U4UkfXs8eOqjol4
	 dOASAJQRjNvt8gKO1ue4P3pvQn8n6jA/Wv34i8lHmsK/wryt+ydfovV7UwmMX33M5jTVN
	 XrEApem2tl9gyy43mdKJ1tvjJuSPNgqY4Q00gYt4xEd1nMcFBYbr97YLLdAsFeEKXs6Uq
	 9PDxKW3wqhu8Sx9VOuQYE0NA6VAApicdSHqHvOcFkkkD/ryqhKfkCUtAZ9QPsRyIl1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835101;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=eiucA+wtjzHIfQz9RvwaXxBQzP8Dhf3ByqiqoY+aurM=;
	b=W/Qz6j0fxmKUw1/v+YzXHL2q3vpvt6MoKgqV07HOlB4it3OrfnoND1FmUqFIiXLaBxgj
	 YaT5Qzc1l7y7Vst+wIVZS6Z/vJyVo31VmekVWtGsoJSGe5rYQCjtl03Lx/DaizulJ0kZo
	 gu28eIEgylALepLK7EFhSuULtp5Kf4wHH46GwPe6AY+ZvBB1caKWmTCkgmQSpLkotmuhb
	 2AzyICwsPoRAFsL+B2RmYkbhJFWkmM0DaSqyLE+TQUcoATQx25l21Lk3By9X229PtXv6v
	 zHihrPuwQ9VyN+DoLB56A99TRftI5zz4zCcaglr7DSs2cxvgMOkuJAxDFetg/H7kLfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V0tPSJ6P;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XzaKo140;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F3C606A330
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9F3C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V0tPSJ6P;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XzaKo140
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC10Ng4069499
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:18:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eiucA+wtjzHIfQz9RvwaXxBQzP8Dhf3ByqiqoY+aurM=; b=V0tPSJ6PVwrpjHtZ
	Zi3tJ/BSazgFYTmvRqQdk9TSdWokZLmDiLT90OIxED+9p57GGOD3U08rHm/qmUbq
	utNEDf4rSsqp7PuU/t0Z2ichhhuQ2ipjAzQm2ht05MTwZ/tz6S9za4Yi3cCYj7rR
	r6rsEEy7S33hlrbO1axgP235Un0U52/PvBNAQS192Q5iMD47cm4c8n1gFdnN8uAc
	RgKpRgJsGzr88ApI1peasgiYfrdoHK5LLsTB+7A6Lpvopf2/YHMJdQxmberQ9tKW
	uZ5o4INsXMDSszEtSW7tBRTlperwt+Q+uVguZfP1uvIWHu1JXH7HBUJaFEKOAB69
	b+yGIg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmcehtr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:18:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1f2fafeaso459636985a.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794835099; x=1795439899; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eiucA+wtjzHIfQz9RvwaXxBQzP8Dhf3ByqiqoY+aurM=;
        b=XzaKo140ticZp2E/PdGzh0yUQYwZzTMVgBNA/DRkbmgeAipynYUXaVUOvrjjI4RMIN
         Ojj4DpyRCzXxoV1z8+/rUn6ZKfPw7+HRrtvI4+tu+67nUHWoViUX9DBjtl+1YbRHha3h
         deE5OIiADaaCP6NEjOHARcl/aDoWs7eniOhlyqv0W4ljpc7bMRIsDjBwHanC4sMJ+fzt
         dceS6gC7MJp6fF31MD2Tpbudgu2x2larYDcF4wR2rrs1nGuOvr+yVz9jHabu98nFWZgK
         UpIjBCSn6bVEAgEH/kr0JjFLZyPdyKp6ALo14bo2tohhajUYxFUku9HpW6dpKYodGwpl
         +WeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835099; x=1795439899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eiucA+wtjzHIfQz9RvwaXxBQzP8Dhf3ByqiqoY+aurM=;
        b=1HJq/0Fo9c1m6siqT0KcR/2tUE15iEDW6E2CTWZz9BCSO+TQOB3c8o+wjCwu4perxy
         5wBJagZNhIhXYrF6MKPx7YWbxxQtKfQn9qDRl239rOBpHypWUjvSKfTqTj875rr7KCst
         rMf+udgfQUjBdhblR9ELCGq7HjLBF+FtXxwkwWsoRM0n2Ia3warljPOP65dANibDYrMB
         FgIVx2GJmEAlQb9u3oI4LWLhPTZ3fva4wQhrMYs7AqF8ZVlVdmqq/Ein4eYHPkW2K7/N
         7wZQpST3iNBK0ijy3xA+LFJBL9mNJ2Slyh9GTkSgX8ZUUdbGKn8Tz47w26K6dxhVBjOR
         yEFg==
X-Forwarded-Encrypted: i=1; AL+hErHA+SusLw3MBQ8vie0kVj4epL6xX3hXmVa/nu970SddRiUf9anEJlAlfCqLiiD5oTuMaZt48m2KyXJw4y8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RF3SKM1Cjc9deY7hXuHyABnUXPTgAIZH0Gtfc1nrGe9W2+zyZ
	1wyarObwhN44ZJ2yKpB2PMJUZDJvRWf3OcQlZRdPLPl9Xr0IcDrN9ZjMD/vYy6QPZfU5dIPTuLI
	tc39aGwVaKzqdkBjDcN2ZE4yhptPYDPXOmzpUczNihlENpZcldAIBGeCanB8DAi5YBn8=
X-Gm-Gg: AYBFou3sTo6TeA76UjAWivva6YdgYZvzY/+uadqv1IgXCBAI9iFmIjrJMnAd7EZTOCI
	XgaPjrlf9wAqYcoUyWQsbO14xD/WiiQRTY34Uvzgm2fY8935HIrr8W2y7lOJDpom/9YVM7OGM00
	Ztz5sFv1ZVw+5D2mivHqeitmgcW5JX3i6vaSNpWjuhneK2zCD6FSUtx+FuTCTqxlF55GiCRk9cQ
	dnGJ2tisQqaJKrlPybDjTHX5jFLQw4I7iJvhl/ImSfOlB/3BHuIq0tQOVAlu85COLtyBpETwh0k
	3a5Dqp5MMOmRr0amP5ul9KDSYz6YBpOoFMAZzpdK0NM/rFutF2bXppfIuYPQDX+wNwImB0NwKvw
	7lC1BNAxF5U8fUHCJdRAyNmomdkQvucqfdcZxtOshEar1u6uqGLEpzq5k6uMAZk1v0V+0bna+le
	N4
X-Received: by 2002:a05:620a:2709:b0:944:d79:c02 with SMTP id af79cd13be357-9494ba55576mr1456186485a.10.1794835098951;
        Mon, 16 Nov 2026 05:18:18 -0800 (PST)
X-Received: by 2002:a05:620a:2709:b0:944:d79:c02 with SMTP id af79cd13be357-9494ba55576mr1456179385a.10.1794835098475;
        Mon, 16 Nov 2026 05:18:18 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8e1c94sm843927285a.39.2026.11.16.05.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:18:18 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 18:46:46 +0530
Subject: [PATCH v3 07/11] drm/msm: mdss: Add support for MDSS on Nord
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
Message-Id: <20261116-nord-drv-dt-v3-7-e3d3bf0e2c49@oss.qualcomm.com>
References: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
In-Reply-To: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794835013; l=978;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=cUv9ygkqVGKsKi0AqbVOUesQJiSTwCdwgeTcXPt+zc0=;
 b=feVgYY8v1OmtMYZhR56xObEddH4ZfXk+7alnHhbbpkFAvGzUXeze73NFNgFXi7LWeLUnEunZb
 K9td4X7BvYFCOuLLmWeFhM3EL6B86ftpqGoAb+5luNQDk3Pj6p2k7jJ
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfXwIjcSQ/3eLV6
 7J2eeSX8lMh2Z64S0k4sNb1YsZEjhjw2zDHXe/BpFPEEmFoSCKMho8IqwPAprhL6G3a0OuA7M1j
 c9Q+SpNT1ci7w5pY6jcnp0xA0V1sIII=
X-Proofpoint-ORIG-GUID: zgNzqSSMOebj4xMCRH3RtJTbYeEImdvq
X-Proofpoint-GUID: zgNzqSSMOebj4xMCRH3RtJTbYeEImdvq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfX8jgh3/CJKqQz
 EcsWkfWh7f/Txyi6MiKfDyGToPOsVTnzk/qc1JVVJt2rQUy21U701zDFSagrIVcL8oKVSmsxCsS
 InLQeFXMn1i8GXFaa+v9A+635SouLvSSmwQPnurH9UcaRwPaFzGy8OkF/P98JRaPm2LQ3HGkssl
 CiBIeUT4wZYSrL2g6UqDMZSo7IEuK5zj1rVOtWUUYKB7uThClXndEUSOm8XzwF+L7BaXF0gvxRB
 YtB4wlVlHjh/DvtVLAbyc9NQtR/23haDHcbT4N8Lwk4/nMZdP8rxGwq8QJEpF83CO/H1gvs5DO1
 X1m/USR+tGPO9Lz4ye85hW4wuMRWh10wPPo6WccrnC3A+cI1JEPk+NL4UPaluCPUw7lsLqPBLmw
 yJPzOsyuJEeHjVnrWDraa9aGo/dGAB9xZMZl60v1FbFjTObkDqRA3uQus1k9E3CKI+MUuVgEZfR
 2tVVHsDAmAVZ4m/EANw==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6afb029b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ikCT10dxFQO67KJDykEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160052

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Add Mobile Display Subsystem (MDSS) support for the Nord
platform.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 9087c4b290db..90bcc8c28dc2 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -531,6 +531,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,kaanapali-mdss", .data = &data_57k },
 	{ .compatible = "qcom,milos-mdss", .data = &data_14k },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,nord-mdss", .data = &data_57k },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcs8300-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sa8775p-mdss", .data = &data_74k },

-- 
2.34.1

