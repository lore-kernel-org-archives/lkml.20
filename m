Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B784AD4B2
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378488; cv=none; b=dh4GMURDSm6NZj2dvhCefIwtjy1/D0KALZZMKiAmIxJJ3q29o8MLDiJDixOuHRLYhbjWCNZvCOJjp6d3RQfK6UgphofI6Uq/63iBRd8NT7qrDS45VEzjUZmLxpFkFZ5AtJEUw75OTZGnv88PkGCr3JEVb3crgLdmaINSjhDLULw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378488; c=relaxed/simple;
	bh=iWKIF7+y19GlLp2q+iIL/tUlrDkr3t3S4Xnk27aRzvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BemVEt0MKrsmK0mKqChaO5Egu2IsjpUN+eh9EjJaQeMe6eoL5PHSsHpsG15d4i/GTDNnUKnZwdqjOB6qWULQx4ptPamji375/JIUWNxJfEnTJ8HYbDuvC4K+9dQJ14/ic/GA+bOV+ofFskrHYCY/DMZtkZoDCAC4jOBMFonnpLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XZfDsFMQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VDj0Oxe1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XZfDsFMQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VDj0Oxe1"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hrwoo2731243
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 19:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UtK0az9ffiV
	XS6BRi5p/C8bg4TVrBl5o4jttOM3T124=; b=XZfDsFMQqWKPwwNisCMcFzhWbMh
	cMMlLP2SXc6oZeqUlSphC4aNvVn5HxnDY+qnLQzj+c/ciSqd5OwsX/XbBNJy/nce
	1QW9Z8S8S3h8cm4gkfVKfSzmLDw9EyPBq8wYcqSPpTrWraB1fFvCqUzHdKFjVUtB
	6H+ZWesSh8fVV4y3PPpAgvNL1kvs4YrUJAi+oIScv1iA88zyXG2yfkXMycQwIFRt
	4jfMK/TqgzY2edkyBGmyLJddVUVpXpmEdZfmJMyIiSvjeJfSx85zFipdFybgJ7Oa
	BfiGIN5eDO3jkjU254xZSsJ8lADx3uxnlRdKhvFXM1vDZUwYLYvbIIRGblQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geguy2pwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 19:47:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3968dfff779so320667a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378476; x=1788983276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UtK0az9ffiVXS6BRi5p/C8bg4TVrBl5o4jttOM3T124=;
        b=VDj0Oxe142mkoD6sREKujLtGmaVsAL9llZ7TisJBWiK/npzY5slGK3rv5vw0SuYLd0
         SzOFReGjn/Q6INIZGN+nXBuryLazL4Y2xzqSYpZuvrvl32CKNFct+RbqmuKC3I5yOatS
         FVRdbHvbOJ0cqJ53APquOsaktDnJW19uRjqID/swduVbQhVa0Ip8G9c5YLvs/GXdzm2j
         X+Tr4fw0xiXRfEesFU0MBXoZ48EI+DJnCY8/PzbOMbBr54KFiIr8+Y7LIgdOQjDjEZpG
         NKpV+QD27b9+i0I9GzTAvuE1DYMkfUOdZod/ukyDGzCNFOK0BSPpIjspH7K+NDNl6cXr
         NQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378476; x=1788983276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UtK0az9ffiVXS6BRi5p/C8bg4TVrBl5o4jttOM3T124=;
        b=LByndNifL+zOMECAfLyJp6DF5wuad/+95HeylU5gXAlrOJKVPiR+Mf9Dz3ebf97+3S
         P6RBXsr8xWZHe9lQMZ8eHtC4EPwqMX19bP+pwCmu7uQKAjhMqa600OVTtP96Kdv5HIL6
         1YN+jNX9juX6G6f8MuJL7BhFH3xTfTAfP7julEr75NHUdlR1qnPfh8i5QQ9Zib7weLLM
         WqwWNqbD+UPGPrWlGDiFEqSIp+BNwFXbmPfhCyFKMBDb+rG1pixhIwxyxYRsnxzf+Cqd
         vj42W9batm8PV/Ve3WJII/8RjGfl45h2UftA0W2YEmvrR7ptrBHGf7b1DzEo5X4GWxUa
         mn/w==
X-Forwarded-Encrypted: i=1; AKwUvBzXDFx/1J3i/RxeFEy1vgtRhD+S3HD6rI5V29xoEwVfi2CkGqdgrg0z4MwR6vYjQOu2XwFlZVkRu+fVll0=@vger.kernel.org
X-Gm-Message-State: AFuF++loe9NC/GVgpMOAaGjq/KaguaGAlNgfD0ewaX24KvWUGf3JdYRD
	82sIdN95ca6baGjrwxZx72yrD3upc1sRuti8Sc19ry3IBkrazAQduNETyhD1m/EH7vwxw3b2v9F
	qp/rZqG7NqDib1O3k0na/ejWvkVuR8reket3lwNgmqNQiqDPviqAH5WDeScRUgJ/KZGg=
X-Gm-Gg: AYBFou0yGpnafjZkPNskWL9gFa+moNq4B6E4LL6YoIn43KTr3TqSBzVPMIHFXN2lkNu
	isDFzUZDmrYduPkLB45KwBkCYMVXwvZRTXIlChR2R2AflnP0X/+MNrVgorjj7LbkjG7fPHm9y42
	w3Hjygx9Idy6dtz5Gnc7EpBMOfmCsyNGbxWSPGu6Av7SZIGbGazgHvtJd5X93duxBPnbFljljY7
	0Xi8aBxBPielcA+8DNAoKbOZYfhJ7tFKTtL5DE9JjLF0O3ucq+b5NWfHaM91QE2EhFdMpFPY1g2
	HsG7IqGvwXmYw4gEuf8k8Ldg9IRcpJqtq6AM3iM00wyK5ukQC2GWEQ000jxc3Jb6BLTJbvss04H
	Wae67pLo7uDSVf6QvL87ScQYy2S8=
X-Received: by 2002:a17:90a:d446:b0:395:c3f7:2895 with SMTP id 98e67ed59e1d1-39b07f2f50amr1517706a91.7.1788378475668;
        Wed, 02 Sep 2026 12:47:55 -0700 (PDT)
X-Received: by 2002:a17:90a:d446:b0:395:c3f7:2895 with SMTP id 98e67ed59e1d1-39b07f2f50amr1517655a91.7.1788378475146;
        Wed, 02 Sep 2026 12:47:55 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:47:54 -0700 (PDT)
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
Subject: [PATCH v2 4/12] ASoC: mediatek: mt8189: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:04 +0530
Message-ID: <20260902194712.2003414-5-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=UZthjqSN c=1 sm=1 tr=0 ts=6a987d6c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vpwXisbvDR7QvT6TCt8A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 88OPoex3SU4o2EvQYnibE5pTFP3wqyuY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX9viFQ026foxL
 cZZY+I2FjFK15Lu0r2kKA+Tj1dG6jI0RqJnkr7mdQiqvYA8PEqu92DoPKuk6vzKaGyL61ki1i98
 scJgTn3X8XXUy0vRVwawHXvTIriGOfo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX4Ujfo15tlh1d
 uL9Y8k/F78GedYAHxsK6I+ewXfWVVgoot7oDtTRXhtRBwLjVWlB4CxMjIWt7J8wkwOeZU5lCB74
 LQ/JhuGZ2kHVDW0Nx5SIXGtbM9jdCx43I6XyLQDkQNsAiOOcpUJ5B7blknmEnmbTRLn+9FdANvF
 in14pYmJBceSV2OWm3fA/QT5svszJM89EeeykwWplqLHvdnClbny1+Bf3ZJbWvdh5YOOsf88M6D
 AhoEXSpAZJDgMaqzCO5r+IsUrElXNK7SS7asbPtwBXStI8jNPzDLwcOzvasi2OENtfqDRxxRquA
 bDr8gqYT9y549Keu5V9Tbphsv1GP2+nhrvAaWN4gVBi0Aya7EtKKxZUDxZi1CSLqx13aYLa43zw
 Zb5Wu1pePorBad3SFcMiFly4j0DC/0y7PNCc+O5G2ajceVjC0NjfNxiKsMs+XwDHoD1FHLgPvmg
 uH3J5V9nT6R3cu+oucA==
X-Proofpoint-ORIG-GUID: 88OPoex3SU4o2EvQYnibE5pTFP3wqyuY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020175

Replace the hand-rolled devm wrapper (mt8189_afe_release_reserved_mem +
devm_add_action_or_reset) with the standard
devm_of_reserved_mem_device_init(), letting the device resource manager
handle cleanup automatically.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index 77cf2b604f6c..04baf7d9132a 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2421,11 +2421,6 @@ static const struct reg_sequence mt8189_cg_patch[] = {
 	{ AUDIO_TOP_CON4, 0x361c },
 };
 
-static void mt8189_afe_release_reserved_mem(void *data)
-{
-	of_reserved_mem_device_release(data);
-}
-
 static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	int ret, i;
@@ -2439,16 +2434,9 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = of_reserved_mem_device_init(dev);
-	if (ret) {
+	ret = devm_of_reserved_mem_device_init(dev);
+	if (ret)
 		dev_warn(dev, "failed to assign memory region: %d\n", ret);
-	} else {
-		ret = devm_add_action_or_reset(dev,
-					       mt8189_afe_release_reserved_mem,
-					       dev);
-		if (ret)
-			return ret;
-	}
 
 	afe = devm_kzalloc(dev, sizeof(*afe), GFP_KERNEL);
 	if (!afe)
-- 
2.55.0

