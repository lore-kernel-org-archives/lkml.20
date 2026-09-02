Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383023921CC
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378541; cv=none; b=NRFLYstA37xEzywU6RQuubRWZINYyD4wcPOaKVR6WzmDzOnpoWBwm1hvFMXcaCM7r+gV9mOVftnhGp+FiLvqGMu0C4LNpAPtlu6A3QOJDMofHUHeQNWrGARR2hW43c3j8NGSHmF3btvzEOVfb7u8TnZ60RTR4y/YKfXcwV0acl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378541; c=relaxed/simple;
	bh=QfgD5dr4Sgz3AcIlqMCaBb6PWPYYeamXrxUGbqzwgVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aWZZssPxxNPhtWR9ym9qpyKLAxddCkFbkOmpzIZDaRagFbrTux8ddrgqoixSdkH21b7X/KGbIz9BkEU+5MDd3BcmSJcnE0Vwo9vrVxYazkGbbonOni3X537SAFBmq6YYNDqOLnm4b0iu1DDRzzYIXL47XhBSXlHH2wwJXa9utDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iibPWs1o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f/NjKUK2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iibPWs1o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f/NjKUK2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HqmX21586055
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 19:48:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B5crfQ1fkgmtA3YNNUWd6gdEOR5AI7ZJhz/ELPkdJtU=; b=iibPWs1oYO8ySV2H
	BvqcsytuLzFuPGHZrCg7Lng8YPrn/x2N89uT5G62qWM7kDo/zwgOFA4nHwbZnxLU
	v+PKwZLJFyV1KFt2eqYlSe187NXUulXrvC3okDckIc1BLyojN1eebK8oltyBWmR+
	Pw6VP9xmDjAMcp4yKnwXNvScT/ZOUHbAhnKzFFbJ74ebZ0+LO0bYgP284LA4VEGn
	Wr7962Scslr+O5Xe4X06r2jVjqJ+k/VzakffHMehG54l3VOLHTe+TIskcyXkeoXz
	YAFzGVOx0+6Rd/oPJRfT1iajV69lqNM9x6qTvGyf0ISlaqmaz83QIB5tvjkerm8x
	dZpwaA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemb01tky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 19:48:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cee1ec30f2so18785975ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378535; x=1788983335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B5crfQ1fkgmtA3YNNUWd6gdEOR5AI7ZJhz/ELPkdJtU=;
        b=f/NjKUK2RybrQmlQJt1AgppLfwGNJiyMZqmAlu0SBkBSFPGByJCexERAvaT7tMGtRd
         r9SY2XxcjQK+lKFh/CAdCxqtiXXPqx9g1wou1oloGB4qn7r5JB4wXMyTcA3iV1RHIcOp
         Q2YGxf3CeoJGis+a9enxEavWWGroKE5HOFKicBrwipvidk7umTDCP9QqIWGCRwhiBSOM
         pG2ZZdEkE04MWKgCxoq3O2WZ/ZkoQp2iyV/J5NIxSfzJnQp+cZLjVAiVVyAVvUMySYyn
         wm/+1aETRg+bDGWbykosLuu0/BNWlxxAkiL5klsoSqeI/P4wEzQ4uHHmDBFGPoDN7VoS
         klLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378535; x=1788983335;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B5crfQ1fkgmtA3YNNUWd6gdEOR5AI7ZJhz/ELPkdJtU=;
        b=BKIDe+SrpVsYDjHOGZWrN/i5Jy5udZ0YCPt+KBGiB8MLfKCCAwo7MA8NlC2x9yJ+lu
         1lZ3gyKqjAFzJ5eGY//LREBUyu1OBopxyAw2Q0mc2z3jVqrZCPjtsFkxyhVtCA04FvEm
         Z5B+38Pzjpngzmkdaa6j0fwG6m/UoaKRUuhiuzdMPGfiz4nigRoVd+AS/+ZGxKE94JYS
         4okWVEoL99a+1Uz+RcVS1zfPd7UXLymdIqjTOackjz+Gkpga4X7CBdXNID47CHtMjFDp
         C3j3RLvqk9+vLcwUDbX2vOhWgZ6mvCYAbecH9DF93jAM1nojslePhWqBBdJI6Ndtux8/
         iONg==
X-Forwarded-Encrypted: i=1; AKwUvByZ9U/Uuyt9FMxL6XBvgffuMsxxzaTzBdmhTkWF2Tr+1PLcej0WQFMOy+bVWfe896CpBSvE82fd4hcdp9w=@vger.kernel.org
X-Gm-Message-State: AFuF++mkMv7axig1tZFpwHnwaU2V2AF51Ne6OByA/0nd27bjY6mZBpsW
	6vMWt924zqoHtnVZfYnvOW5cD0az8g9NzPLfMcEg62eF13GLcVvK/PoANYkGy8c4L+zthis6eGp
	TDS1lFraQYjO14dkQde2U92aSlnVaML2TkX6meeVBt7YhsmFUapiM6triORBaP1VlcAI=
X-Gm-Gg: AYBFou0aZDu6apB3AsIRooDJwOH0W1pfQZ8sUzyai96iIYR3rT4rxiX4ouP7cPI2aQw
	XjhtfzncC6RC9mjS2WUzHvUV9QdYcaTlyo3dH7ZcMDK9UMCPrFLcI8n6+SJzkA/u2mZjOPtZqXM
	+AAV3O7Y5OZnsZIGKtA+tu070dSeCg1toqzJAPhSiDGGZFc8Gfdds17a1bTSfQo6QfTwSmZrTnI
	bSgExV/zTAGFoSLQ6LMVlwJIbnwDjqOyqBSywZFoJ4ndC6jwE5HbTk/tLq2oIeSWEdKV63FCba+
	/2DBXfDml6jCJo4+tRIFjbNebRz0mDWi6JNrb3dk+LTfLR+9Z4ZIePHshjq2H9lxCvPgtZyU9hU
	EA4Xo/qTKBwYSM9sHjOTKQQ11t8U=
X-Received: by 2002:a17:902:e78f:b0:2d9:56dd:f804 with SMTP id d9443c01a7336-2daec71e483mr105040715ad.13.1788378535157;
        Wed, 02 Sep 2026 12:48:55 -0700 (PDT)
X-Received: by 2002:a17:902:e78f:b0:2d9:56dd:f804 with SMTP id d9443c01a7336-2daec71e483mr105040185ad.13.1788378534670;
        Wed, 02 Sep 2026 12:48:54 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:48:54 -0700 (PDT)
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
Subject: [PATCH v2 12/12] ASoC: sprd: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:12 +0530
Message-ID: <20260902194712.2003414-13-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -OyTRAcH80EfpuZZJrdQeEuo_G1Ci4wq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfXx+LIpJTgOD0L
 +HmbL8LLxzeJRcZDD2q+c+Eu6jWIxTLXyCPP8adEzlFYg32NsrrgaJ6LfyLtkrD3ZcZFdr8/4NJ
 cZU6VVjC/bE79ZaWc9lQ3smdLgSTFQaBuULvAFUjvOQpvqf1hkUS+a3J3ysUiYKrEM21k4otAbP
 zXtm1Ai3A78eG9rgOQl3lJOwj78YL+vtBTiGr5FWK4ttCLVersWKr9RdYmqt7F92tmyVny3ZPAl
 LoeMIXXo3vjrCMaO0ZfF5DYGrdAmr6/xIGmc8PohGmCkx6/Xcb/mF+wUuUX1vpAhU+/hG2YAynP
 P5JYOjIlTUJGxNTqa2rHH8nbMiR+hmWxV921xHBE/Xh//05dagOSFqhkTReif4BCqtDmrfeY7Hx
 CAcposiVUG0IayWZHr4jSxQY7m01F/kPLt85JNnfADeVy3ARcPePt9XNW1ceRiWUrtUCtoSejvl
 dU6xEfbojMRl9pGLM8Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX+ezCLwu3fRbh
 5W8kHUHmOygOpfGS8wuLMrXeSGeO2AEljs9IUEAWgr47z7Uno+LoAOaC53mO0ONMELdALnUUlhc
 bWJKszaMIbipflDR0vKwGb7pEKbXPDA=
X-Authority-Analysis: v=2.4 cv=EuPiaycA c=1 sm=1 tr=0 ts=6a987da7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=99hAX-h0IAisWkWT3OgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: -OyTRAcH80EfpuZZJrdQeEuo_G1Ci4wq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020175

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup — the driver has no remove function. Also drop the
now-unused local variable np.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/sprd/sprd-pcm-dma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/sprd/sprd-pcm-dma.c b/sound/soc/sprd/sprd-pcm-dma.c
index f509a4601de2..2d5ffbe17e81 100644
--- a/sound/soc/sprd/sprd-pcm-dma.c
+++ b/sound/soc/sprd/sprd-pcm-dma.c
@@ -459,10 +459,9 @@ static const struct snd_soc_component_driver sprd_soc_component = {
 
 static int sprd_soc_platform_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	int ret;
 
-	ret = of_reserved_mem_device_init_by_idx(&pdev->dev, np, 0);
+	ret = devm_of_reserved_mem_device_init(&pdev->dev);
 	if (ret)
 		dev_warn(&pdev->dev,
 			 "no reserved DMA memory for audio platform device\n");
-- 
2.55.0

