Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6653AFD10
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378523; cv=none; b=UA6SzuktC1QuEYtVjQ+fNhoRW8iGv3qZW2Vk4gvPq+3yp14zG0UHAdKpEjCn0/IfxCwodXKNMVDAkLlt9H5vumuBh1DxaTXaoDL9ctms9+yNl6AhHAShHs7hUW3BKMqQnKgOGfJDWfOCrTNeAXA2mQ4YL2bWo6KkQO0vln31rkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378523; c=relaxed/simple;
	bh=1QjMBio5tyeLY8XuQmgxMCoeC6yf5RuHxxyG7CG6bFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ES4xSV+1hfcWK2ZyqEdlRxukrky9F0vcy9qZCthbNnTo4sHXeyvRq42w3BYMaTso4bbeXlb+/oT4Tkx4bU8uwy6EQuPsUSfrCGcYMYTu7pwnk5QjsXbx1lsBghHfPbVSoC+Kv1N1GLI+SpqrlU6+/sFiCnH0FO+wD6gUms+po7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ETKoXRVh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LSbSpi+E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ETKoXRVh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LSbSpi+E"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HqvKC1071972
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 19:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gCAbiQWo2ly
	p5N5aXBBod99zFdzxpccudIxmZh2QJ6A=; b=ETKoXRVhyGlZ7FSeYvMx5cgXRNB
	WqQbi89Xz6B6oNYmiWvwW6ZuHw9tz+UGxqyAOqtC8N3NHzZ5X48vlr68HYScqyav
	XWBvmFFBIjiifDXHAfhHsKtXe0VqEYwm+cPCWjDwmsgXLIRKWPcmqs5rCrvJ7qSq
	bpnLfc+S8z+HHPQ3Tx68AidbKngkkBHbye76ETr2t9S1Qs0jsncs7rw+4GTcYUol
	phdh+AGV6ks6n/f9jo3HWZ6Q4b5wRhnSCwyt/YB7sktxxcP1rpBk7wSsg5MEJ4a/
	9DYFvXF/pz6anNSb6fLzkkYkvYBaX5zS8a+LMGsAlcawlsY8Q7EpxgI9u+g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemja1q0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 19:48:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d9336581a2so25017855ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378513; x=1788983313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gCAbiQWo2lyp5N5aXBBod99zFdzxpccudIxmZh2QJ6A=;
        b=LSbSpi+EoccMlSE7IDQOD9+syq0NdZcu+0F9SfVzYs7yE5q6sy6Ly2MX8EC0BMWxZW
         L/dOgohNMGXOCju0G9yulhgLzTtKi1lkqJYOQBoV42Gh5weYWwDV7X3XUcYFUe2SXMGr
         0s83tNkJ21E8NrcrgzbGcH1KT6N9JEBAkqU2gwfXXoYf8vE45IOSZnmwQONEP9vyWUsk
         h2sEKKtgbjLtcgqvSxk2EWRBa/PqVnEQbfc5vfYOqWRvLa2lQwBts6PQXe1kOzumyfHw
         bkK8dpERsvqtnqmcaViWEXm3PkTwHw46CrCxS56DFq7+BNur8QwCIxt19712FCHIV9Hn
         jJ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378513; x=1788983313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gCAbiQWo2lyp5N5aXBBod99zFdzxpccudIxmZh2QJ6A=;
        b=pO5UwUXNyiyec3lgIbTqxRMWff0hrNss9cS5xRwyxmOrFDf/0fhQnXNZSGdxL945FR
         CKF3ZZ57lMUTFQAnHpZ9++I2O8htc6qFy9duDN9RYYPNQSSL4MYYRTglxpeV9EXGEEIE
         pdEpRstDpXrTSB5edzjjCvZ/EDE6a4qh9KdE9q3QH9vSEA95PDAnHHGhVklIxr0RR7tp
         92xb4sRAg7y8TbRQOYmjso2A/1lQTjFmgThRuhSLyEFmeWvDh9r1dgdt39y+6MOnOCP8
         GEaMnCZUop2C/Oa5480GPDWDnKQ0GAZ+do/5lvsxFXTQEFaBM60R/rAE3OFXmf05QZ5z
         gJ3g==
X-Forwarded-Encrypted: i=1; AKwUvBzoJWQbrouHmrvTI8FleLjeXQUq9gS3wx9DSoE8PEYpmhWiJgxJ8IaVL6GWtsA8PO5SQSyH9+PiTwgMl6s=@vger.kernel.org
X-Gm-Message-State: AFuF++lajBU8+hHHxP7t0IwNeK12qPdvyXkhzxxTB6cZvOsWM01VlQmI
	ApkC0WV4LuT1FO/YpMS+kRMj2tXkucLysIERnE+mMQ2NrRWRTGzJa2UJFRKsbsFx5gYXRXHo/86
	dKv5CG8aU/oIfRKZ93QdL2rNfwdg7hpZntdvseKpOeQKGmyQQwlY2sG45+Wl/SESrEuw=
X-Gm-Gg: AYBFou2wpKT/BvI76QTddulCnagtgQcYBpFgtKWU3THilzJIgBleh1Pgd82Gv2ZYu9c
	cScWX47s5KDM0fiw7tGrqGi/kCe690BAg6e+do65/D1kfDFNMYyBzz1UK01RE14Y3oV+ly2UYha
	bg2RuXKFlJqMuf/AHljsQ/a8L+V+rZyvtk8CiDfTkLaUxLJI7Ku1pE9vzq5XxjddRpT7+58PnWe
	ebEabCiu6BSHQGK92knFNnVeKwu20BC45Cw5KTiteV/O085Z4l5FU3+BxgXFdfIQcJtiS2cTo3N
	xJkw36rp+iHvAshnrFK1WN9YtWHkZbuQ8XlmE65uvTRED2KEOx8Qoq0l8cvF2c8PIMT8n6Z7NZ2
	xvRFQo+RTfYQ8K95EShZUY0KZI/c=
X-Received: by 2002:a17:903:11cf:b0:2d6:fed1:7127 with SMTP id d9443c01a7336-2daec42ea99mr84258195ad.0.1788378512834;
        Wed, 02 Sep 2026 12:48:32 -0700 (PDT)
X-Received: by 2002:a17:903:11cf:b0:2d6:fed1:7127 with SMTP id d9443c01a7336-2daec42ea99mr84257705ad.0.1788378512363;
        Wed, 02 Sep 2026 12:48:32 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:48:32 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Gary Yang <gary.yang@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        sound-open-firmware@alsa-project.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 9/12] ASoC: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:09 +0530
Message-ID: <20260902194712.2003414-10-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jVAP0br6Rjmdyu0HbqQwATH9QU-rLe9J
X-Authority-Analysis: v=2.4 cv=FeAHAp+6 c=1 sm=1 tr=0 ts=6a987d91 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=FVZLpNCcgjzkSGVc8gUA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX3EB5d9tYQo/A
 Ia/LsArNHGv11NqBy+1KOaJA4dO8K4A1S/g4qfnI9QP6+iaIXM3Zz7Fp2wMkuSpKHuMB0UHDPu6
 gBYawxkpbBzEzDUEyTaEXM2qfekmKoo=
X-Proofpoint-ORIG-GUID: jVAP0br6Rjmdyu0HbqQwATH9QU-rLe9J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX4710ZwjvKiSL
 RO9B52BLz1ze/bx2zFE6Jwekf8LDvOXG9EqAWBpZTcdKZjoAwI4EfffG7e41I/bhfF4GtEJlZoR
 hRkfHznLj7WRMjfXGK7Eq6G8wwn/Nbf6ckQw3sNppQxYLzsujD/9eYfDvtmyYfkfqTgGoEn/uvh
 LR/TTMVPjKRBBb+clFLjiJvBNjP8G0byfAIHNDj51I6GBbmULf/z2zbuSPSpaHiIAjKk48aETkg
 PgBWYMr0HgLW2JrE5HAKORoB2mZmu12Us7u1KL0XQ9s6Krn8c4PIH80OP6dMcBkw3pelZgtRZHU
 l+JKND3YtbpEGDHLwgtsfTEFzCV4oMmwQxJDi9TVuOM05q7ufujYqZJlxmno5ezR37yRV03kDhC
 xyo+Dv3aTr5V9OH5bMfrX2hNLl1BH3HU1RndS+Vtm3CqKUEbGvk2VPlpFGV4c+7NUI+MiUJaMRF
 EkRzdVN12tiFUBPBTHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020175

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index bc0a63457cd7..52c3381e6766 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3013,7 +3013,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	struct reset_control *rstc;
 	int i, irq_id, ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to assign memory region\n");
 
-- 
2.55.0

