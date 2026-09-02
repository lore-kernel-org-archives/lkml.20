Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130DA39CCFB
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 20:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788379666; cv=none; b=mPo8eUVIi9nzR0yE44C5r5uSotq3FcB8M2jij4PO+SrsbS1fQu0Ok9/8z/BqWzqEAZAeH/8eQsXuPMdOt9xPNyZ2rXWcU9HgxpigCeRdi/PwrXp/UVZvRSzqv4QWeC9RKGH+w6Ybmmz4nKQpVkIUFcHG/BfQBje2KrQeJoOU0YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788379666; c=relaxed/simple;
	bh=edAqkzR2VHg8wkB7OCT1eoSkZr2X0FpnBQkzfDMc3IQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h5z4Bv1Q6JaY8L8Vfmp6LLRAhorBrJ5ubFOBYPGKuMI2MZxmg8GP97tKR3bN84yk6hyFABpi0MlMkunfzTRCCLKLuluJLpP5DtSwu83P9fuZO6zsZ/H2u0H6Xx3lKu5DcM9044jCWgg5hmNFy29jEmKxdw0ZGz6j2VZwhK0sqm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P64iHGeU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I8i/Vmk6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P64iHGeU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I8i/Vmk6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hqxw93377673
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 20:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J9W8P08UQPf
	Jw5C78sAv5RWAvY1aWehRnRIhk1Qi+vw=; b=P64iHGeU+wqitnO2yOTz85CPPMC
	Nh9EN3gs+0SkmrParjRLd3P0cOTDHlUIuwGLTuKjTJxj2CRNpFTYEG6MPoVkvEoN
	KRHTCcUMHiCjR48T3RBTIkIlHfwEfHUJn8w9LZX6cIPl6V72APy3F7KN8w5EZhOh
	JmIfKfn1M9o8qLLLslSCCHkih+JlFWsLs5eIut+RLMcZtwCohJ/vch0JdGhdKGlx
	05ci71hJL1xR4/y/O1dq2OyMXjVfwO3NqnxZVBv4QnG1GPIFy2RU34XcrhpbqbY2
	dqXpMxp8akRJCDdTl+S71BL///ZwoRsnXT5kuM5vJcaDjuDRWHNG9Ls4ndQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrnhfww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 20:07:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so2596589a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 13:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379664; x=1788984464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J9W8P08UQPfJw5C78sAv5RWAvY1aWehRnRIhk1Qi+vw=;
        b=I8i/Vmk6xtXlzdSBMcOe3SiNp0TRzU6J6tJ62ewpHvUVlzRz1oyCHU/SdHkTjBpLZC
         lqE0tSXr6wYc+GzByP4q4Dk0V2jRCcYjK4SPopzjGlLf04gX3H7ioU0OV5ZKaYimb2A+
         vwZsGYqHCOQqtHSt9UGnLjXoBLOacdkkFtj1CNsmk4aN3CNF050P+2m6TrVD0RfPxyKc
         SA7NVu+EDUdSQHUo4UnqnMCgmvUzgg8LO+7thPpd9gdXUvUdsSeKHNQ0jfs1p72+NClo
         T+1409gGOm+cUU32Hs7XpqbbeauLT0SiXWm7I4Yhm92tOqNYkqY3mRrWw/q0my/z98oQ
         2LdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379664; x=1788984464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J9W8P08UQPfJw5C78sAv5RWAvY1aWehRnRIhk1Qi+vw=;
        b=EM6+qsVu1ZouJf9Jt9nAq1kVGR5wd+arWtFh1KQJcAxXO7o8SHhsjggKZU7h8MoKKB
         Yoqw4w+Bs/GEOlGiMPamfeimS00vFSXHoa3VcvOvLVS1whc8Xpb1w1ylZnqeStmPBoZs
         q3MQiNkamFNrT4znWYJtVVb76TjluWs41Crm5jvQ/KVX1pUfndjbRpscj/fYPhNzDaZW
         Vgtr/6NJQfCqrRy1YCspAmV4zSnHT8F5h7CtNE4lQwXWGQlvNdecrcdWPCem4D5yVv8D
         fAbR7WujQfLPjE8mYAQbTHDkCrUVbziKg4UKsyJgA2wsbLYbBBOxSxz1W8IdiMDk5lo6
         kGNw==
X-Forwarded-Encrypted: i=1; AKwUvBxO05Fyaa8MfGpD4/IoMeik7MFr0shvvstooYu4Jtsgvpodq+e9BqS2HdCnlmK+LyaWjsTVIgzRhLMVdaA=@vger.kernel.org
X-Gm-Message-State: AFuF++kTescgQrv2J0nk3ccQaRjlHrqi9xECSyKHq/3JSt4DRT18NgkA
	rCkbEpF187nLZp9dCzFR9etIKMJpcKHCUbIksexuIBEGPBbiGyZpDgpzQOeY0NN06hKm1Xd175e
	bJG4Ivo6XAa8gLLSGnXVDI/GvqL0k5Xgdz1wEja00y9gJRZVo73ht4hFLWWRTajPYTY4=
X-Gm-Gg: AYBFou2KD1equHUgXiD62tUPHR2aZHx1jjpPAKUtvKuBZyXVZwEAw3BEF1ITKAF64et
	4vRglsjd6uqtQw6UvnYCfGP0EwvWjSEkzDm+4rNyAh8XqR1kdkEdmEQpEvHg1IoG4EIseOyd8i+
	LOhYZM5i4e9DiewdzegmKirU0kcloLyJ1BwlWPdYZ2D4N1k9s7mQIGbiNCajVDJLGmkrtQ41PpP
	AtacsH4VRsUwRQEyaSHu/uYKl3FlXtK/+NZxoDn8O6IFdcleHKOgMaor4JPXhHLRh39VF9jOdKB
	NCjvLkToIN9e2I2R9ZpJH3p0m6OBMkKjKdHgWYd0TsCwGofNOkApjVYvrZFT+5gBbRpyg19BUDP
	SxO1tPJhKyie20FmYRF/Rl56v6dA=
X-Received: by 2002:a17:90b:2644:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-39aedfbd99amr11639261a91.7.1788379663605;
        Wed, 02 Sep 2026 13:07:43 -0700 (PDT)
X-Received: by 2002:a17:90b:2644:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-39aedfbd99amr11639151a91.7.1788379662903;
        Wed, 02 Sep 2026 13:07:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:07:42 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 2/6] media: aspeed: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:36:59 +0530
Message-ID: <20260902200703.2016410-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JXvf2_cIvTvhSdCCFJn-5j22DMde80In
X-Proofpoint-ORIG-GUID: JXvf2_cIvTvhSdCCFJn-5j22DMde80In
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=6a988210 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=gFEuJ_os7HuwQwkCt6UA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX+PEHVGy2HsoE
 ZePYw9jUv7MoILj5/B+Aqrd0VmtVti4xsFrqOjW+xxXlePiIe03dIJ7HvpgbeI3/2kTd+RFRqCb
 B+fcMbwOnB7LsCFw+pnmlEGqeCI34X5k5PWtipmNXdCA710qmZ6qECAy3wsGCdbxZKjFruWvzif
 HxzttpaHjzbtbtmA0oruF5/QDtCes/3O/odXi00MpqVfUXCMgurWpQrPkeFTcK7qAAq0qO1fpop
 kzMWgGAd52uYnHlSqi+O7OjR1b4LTafQo0/UY4WwqVW0gTPTx/rcVeltNJjhRnNqD1Y73U97lFV
 RKK1lYeZiDNfaCTr14Yp9n9guMjf72RVUw5OioeLMcQHgybw7OapLebVcMcvlwPe06COwFBeRim
 0yY4gZjA1iJEvMT5WXiQjRnEZxXycIkAooFybw+zrrGmH1ktFIT7Lg5qh8GrFlOZ9fJbgsrX1sE
 QBGEv0J2ItdUh34YysA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX98SmV/a9kQad
 W+xRULWa+d6DkKjqA9eO2Gsa6qtPEZ6BwzWdSGoqIvkvLR4cfi3PiC7BKlpTYR+PyJyLEubqGG4
 +n66h82XI4Lm8gsUFZqIkW2ZwOGS2gk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020178

Switch to devm_of_reserved_mem_device_init() so the reserved memory
region is released automatically on probe failure or device removal.
Remove the three explicit of_reserved_mem_device_release() calls and
rename the error label from err_release_reserved_mem to
err_unprepare_vclk to reflect that it now only unwinds clock state.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/aspeed/aspeed-video.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
index a292275f6b7b..7ba9314fdbd2 100644
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -2267,19 +2267,19 @@ static int aspeed_video_init(struct aspeed_video *video)
 	if (rc)
 		goto err_unprepare_eclk;
 
-	of_reserved_mem_device_init(dev);
+	devm_of_reserved_mem_device_init(dev);
 
 	rc = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	if (rc) {
 		dev_err(dev, "Failed to set DMA mask\n");
-		goto err_release_reserved_mem;
+		goto err_unprepare_vclk;
 	}
 
 	if (!aspeed_video_alloc_buf(video, &video->jpeg,
 				    VE_JPEG_HEADER_SIZE)) {
 		dev_err(dev, "Failed to allocate DMA for JPEG header\n");
 		rc = -ENOMEM;
-		goto err_release_reserved_mem;
+		goto err_unprepare_vclk;
 	}
 	dev_info(video->dev, "alloc mem size(%d) at %pad for jpeg header\n",
 		 VE_JPEG_HEADER_SIZE, &video->jpeg.dma);
@@ -2288,8 +2288,7 @@ static int aspeed_video_init(struct aspeed_video *video)
 
 	return 0;
 
-err_release_reserved_mem:
-	of_reserved_mem_device_release(dev);
+err_unprepare_vclk:
 	clk_unprepare(video->vclk);
 err_unprepare_eclk:
 	clk_unprepare(video->eclk);
@@ -2343,7 +2342,6 @@ static int aspeed_video_probe(struct platform_device *pdev)
 	rc = aspeed_video_setup_video(video);
 	if (rc) {
 		aspeed_video_free_buf(video, &video->jpeg);
-		of_reserved_mem_device_release(&pdev->dev);
 		clk_unprepare(video->vclk);
 		clk_unprepare(video->eclk);
 		return rc;
@@ -2374,8 +2372,6 @@ static void aspeed_video_remove(struct platform_device *pdev)
 	v4l2_device_unregister(v4l2_dev);
 
 	aspeed_video_free_buf(video, &video->jpeg);
-
-	of_reserved_mem_device_release(dev);
 }
 
 static struct platform_driver aspeed_video_driver = {
-- 
2.55.0

