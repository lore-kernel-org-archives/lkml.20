Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84A94AD7C4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378486; cv=none; b=RPOZ5Se6Hwqjz229GPNTahJuDgMYRYjwt2q4CwNbeZmGpZcDvFgwimsgdsTAJnX1ttC7TSpzDkVz0rSOf3WGbZJk0kq4tZ6VNoAxICE5tF4yllEuZDbHKzjOsrbbzGhK614ah9skLkxRHYEU0sUGOIKBd3EoguT1HZt/leiW+Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378486; c=relaxed/simple;
	bh=dPPpn9wJlRyU9AKz4bmdQSQBWiSl9zCey5EwqA23oCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cM42aHi7dMWIfl7rO4In+Nt5Xmc5RLFpoxyHlGzh2uncWYC02z9jk/kSYmi2n+MOVo0BnOld1uyvR5UwaXGEgdNGL8cDRQrp0u0nye7xS9F8auVLgmHyBe8nyvV2u/VJFy7x4hMZGoujsT+22Qm7h4cPdID3ktUINg7NRXOzc0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZZiYhzPE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XylQdEWh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZZiYhzPE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XylQdEWh"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HqsXI2270672
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 19:47:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dJIDfPMkkp3
	4lRckWg9H+Qmx6WAEL2kiaibU5NHXnsM=; b=ZZiYhzPEh3cueO11Uk9yw3pog8z
	H93TvnrCSczc7ynU37V2tLuSwqtKdv60v7y+jdNrsmgPdVltqepXeXEzYjW26oqF
	ZeVDYRxDYszcG/nx1LOJyK5HM19DmBXiOPbx1soFK+9fgqoogiuUru9KTOZ5ySCX
	wHWg5Yj0kSk6Litwz5TnQ3bdApO4XGcPoi9Isj0fAD1RmFZkoTG9yiw+ykAkWOd2
	uhcgX2sBMoQvq6RcbS7LZrCnVgiROKQegrdZnIKQMKWRm5lYFX05raMQhhDh6mUn
	9pslF5pM65s4mqzd3u6M2dR3wI6q+r9VlWPo06XJwQaRPGVa8bQv/rp20xA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gej2cadwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 19:47:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-399311947f6so2679783a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378453; x=1788983253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dJIDfPMkkp34lRckWg9H+Qmx6WAEL2kiaibU5NHXnsM=;
        b=XylQdEWhdrlft5el21GFP4RQdWoLJEM1X06Or/VWCOJFDmPa4YO+CsAQfC3v8/K4I4
         VJ+ACwlaeZ7k8EossJTxsdpOGAf0ZBLjde5co3/OSfopYSlNonASl/acAK6si+wdMMZP
         R0dNJ3z8vBKzNZRWybtP7xWE2eWbBcuCnhAsNqvayVAhMRTkKYPrbG55TMGkqFZjR1lX
         70GlgDtxm9F4c6yNu0tVJheasIFXvj7oOISjmwdll3T9SQXiK0Bo6NXUoDpHWQXxjNN1
         fgx1x/geZVlOZmjPwkIOaGdJRmjR2zWfx86n5OZcw33HS4cQtqtZylWMQ4oGwcsYeERt
         IADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378454; x=1788983254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dJIDfPMkkp34lRckWg9H+Qmx6WAEL2kiaibU5NHXnsM=;
        b=X/4sQkJYpGx6xy5XwQg0VIy3rtGLOSre160im+P1khn2rc48+L6jBGTufraHw7IKtW
         +rwXsS4luMCQNs7mzFWkhMAodGv/3uGviyec0IhwnH4tSRVY+xbKbEUegV4X5nSFw59x
         JYLnjYDfj2OTymsEd2jt6JoSS39PBEsrgKhz0x057fbt1cxk+LXRpYFvgkfSZTzmm6VJ
         o5ObNkwQvSxh2QUIPU4T4ewVHxOQiyWz8Aee5RJ8fbjH79CLnJO3MhQn9qCRTrxEM1U6
         6kauQbSOZPKje5C5Cy0tmvbvNjHd6kp9QBEKPROsUZgBN62PIdVljl1TS+dtDwnIPbWn
         tLMA==
X-Forwarded-Encrypted: i=1; AKwUvBy+9XOVv4fZ1ULcUK9YDHnJUj0hLOjape1oKLlUo1/braZCa8WpwEsrIZY2N98pX0LrkBWARrQeSvX+xY8=@vger.kernel.org
X-Gm-Message-State: AFuF++mWc8h/ZhLrmBaetPH4XblV2bVDSO2kCgBqgjqO7LfNTkdqz6yH
	ECYLOGDz1Vsp/3hTxbyRW3DZrr2hXTFjRXXzmQL5PXvt7ep1FkMjrit73s8Ou0JN1qTjtG3g2Te
	ynzX+3qdpkcdZzIUwuz5IM+UTVjpSEAcRGS3YR3v+H2qG5eOtCT8G1LLZuCyXVwclhn8=
X-Gm-Gg: AYBFou3Rz1cD2SPaBCRxuSrYRDv6TiMQL8rkniRTMrXk4R0OiUMbhubObtgtbt9+ORW
	Dvw6GiVAHyaO2k80Th+qSNTg4njlFaBOo+U/RZCsSZG5ovoiPceScYJLDgjYURkuESeN9LQy/ST
	lfoW0kFRj/7NJ2IUMeyaplqvqb2VmxzBim5+EnhFgNitDDwaPtFR7avVAdiHNWrDuodsLtdT6E4
	EyG9Yvi4OazK1OeQ4SlEI21J7OWDwMHZBwvjwKIAU8WiyGrJIOjX8391lXOFVAepMgec5QO6d1L
	0MH3R/tYMJ688ZA1yOAJjPq0bqEbBqgLsKL6rl8gs4LPT+MFfH4Pb1a4cOTrvE3TKiQIBd15SJ7
	PCRVdaajDdoTX8DzWN4+lz2P6AzI=
X-Received: by 2002:a17:90b:5845:b0:398:cb56:e92 with SMTP id 98e67ed59e1d1-39aedf435b8mr11397006a91.11.1788378453531;
        Wed, 02 Sep 2026 12:47:33 -0700 (PDT)
X-Received: by 2002:a17:90b:5845:b0:398:cb56:e92 with SMTP id 98e67ed59e1d1-39aedf435b8mr11396923a91.11.1788378452969;
        Wed, 02 Sep 2026 12:47:32 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:47:32 -0700 (PDT)
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
Subject: [PATCH v2 1/12] ASoC: mediatek: mt8192: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:01 +0530
Message-ID: <20260902194712.2003414-2-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX4ieGKr9CTDyg
 wLrDr1lxviIwpCWC+qV1oIhnE771xrTVNZBOkDFpdxOCGcL9ro9ByiufKgqHTDSid+ewtRJcr2m
 jE2ZCT45gsRELXl7LbqJITt2U0FkBlE=
X-Authority-Analysis: v=2.4 cv=G+ss1dk5 c=1 sm=1 tr=0 ts=6a987d56 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Cg4emjn-6EWHYnEhqz4A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: HFoRxNmS7lze5ZjpQNkAYb21FwfQx6Va
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX65NFJkLbaAMf
 yAsChe3sae0Wu6YWVyKTyd2M9Mujj3zPOZWpcjY1pXptWgWR4AHOnq9EMSWIpKlkyhdfnYLS9fP
 vYh5U0SlX+GAzg1jE7+Dsfu6Y9BXAz5AsqVKw2vKiV7Dm7bEONgLQjItldkWIAymIad5glawXYU
 jJmmLvfYEWPtA8QKo9Aa/vklM0jwfbAu3/WVsl0LtNFV0ITdF3rC2UmeysakZ8IAxXA9hLwHMjX
 wWw8jkvxzlTHYlt/sneo1A6HVz4B4F9TJX6gD8hEpTvQiTghu6riPEwr6aVn9fs0jYs5htL8ax3
 OTaAuqZB+Kc1l3KAZVdWhpQwgXMUwcEQ8wrQhIvDJJEoeyaSg2jbKmj9jmpw5DgDcheJTudTDcB
 4wYlXU7guiz6nFkgA7Ql7x2omMObi742Ef3xj1s6xkGTMJtuJWSWmOC//kbnzbnL022s72Km9xS
 sWBbkmhECDFfHK6n67Q==
X-Proofpoint-ORIG-GUID: HFoRxNmS7lze5ZjpQNkAYb21FwfQx6Va
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020175

Replace the hand-rolled devm wrapper (mt8192_afe_release_reserved_mem +
devm_add_action_or_reset) with the standard
devm_of_reserved_mem_device_init(), letting the device resource manager
handle cleanup automatically.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index db0ae44a86af..e4ecd23df180 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -2155,11 +2155,6 @@ static const dai_register_cb dai_register_cbs[] = {
 	mt8192_dai_memif_register,
 };
 
-static void mt8192_afe_release_reserved_mem(void *data)
-{
-	of_reserved_mem_device_release(data);
-}
-
 static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe;
@@ -2185,14 +2180,10 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	afe->dev = dev;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
-	} else {
-		ret = devm_add_action_or_reset(dev, mt8192_afe_release_reserved_mem, dev);
-		if (ret)
-			return ret;
 	}
 
 	/* init audio related clock */
-- 
2.55.0

