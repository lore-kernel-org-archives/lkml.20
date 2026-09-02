Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB01E4AF16F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378541; cv=none; b=fff69iaPZVm9g2OVXVrpDbYJm6rWX96Nhvwob7fSDBKywjG4exvGg2mAFEKEHEPaMj0oVKU6DOgMrFVQtV72L5DPJlYrJLv38fVm9udtlag3beErXqjQiGjuTVEROPPDSONqwdmWWAvGRw4drif2bxZs8vqR3jk9muTdn5pFS9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378541; c=relaxed/simple;
	bh=hmEwY0m53nnwEkX4V3TwqPketDxcr8ME82w4ZWL8g6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q6PsKrWu81R0e6rljAzFT/ctaqEODXTkikn/cvXSOXB8c9z33UTuN/kBCeDaxKcLIXfIOGvVLo8lvcnDY2Xk2UIcXAgk6inlHURW8GrX/9CG8dyP0S09uVmjvlJJyA8SePj/WzJgNftfMWPqJTW+5rYI8kGXqUnTjrGwu3DhvP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SrARi4tM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gsLAd16w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SrARi4tM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gsLAd16w"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HqmkP2270347
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 19:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mSQ2wHhx839
	udlZk7WcsVOCsrQscw+jiuWWpRziMZZ4=; b=SrARi4tMGYt78Vw9iIalKH5PhfQ
	d47PzXnzCU/UuRGqYazjgueka+kdIHjj5YiZY16yem0fyH8wDOW4zgf+qATvlGlF
	RGdR4INSXrg+wZfUZZ9rO+Jloh5nDrYKke0VDt0LJxvCJc3OMvblSMJTlBH8qydz
	YVK+BAgvV3H68+2grhR8nGavPAg0q9RP231KFd4f6VovWkiVozDPLzSrJU1oa6xo
	vs+nx4v/Q0ckJgy469rSdDt6apzzy82ruQIx494vaolH3MBN0fxpjpEN5c/1d0k8
	pQAS+ofoSxareDrvTrXljVbHlUwkiVUSZ0b38y64aW6ZRRAnpZ0B9r7sZIQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gej2cae1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 19:48:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d52734fc41so27995195ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378528; x=1788983328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mSQ2wHhx839udlZk7WcsVOCsrQscw+jiuWWpRziMZZ4=;
        b=gsLAd16wW7JodS9RoUUEeJSGyRPkvPtOUnBuPsimoI6rk5G1WNBM9pJ1QKWlSw+1B/
         hnYNRwiXA9jGI6wfRktBncCZFIeRHfleNnE03CNemUWeybUDo6iqAhy+CTcoOSgshHWS
         Z84joyvR5oyCUQgYA0GunVeI+t5Ecd66TqxIWM41tqgBQJc3eljJ5nyzU6xzMoAXij00
         Y8f36AJfwtWnMX10+qs7nNiBPfoxtPQgkcKpvNtaqaPwDy6+sNT5bedL92UCTzC2R0KN
         H4Fh/ZKMsjCVkMRHdjIWdMNtQkW8U0bwWQ61lS562AuAqkzZTHu/QR3R1W9ZovcZpYsi
         eu6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378528; x=1788983328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mSQ2wHhx839udlZk7WcsVOCsrQscw+jiuWWpRziMZZ4=;
        b=svlM3vzBdu5XhLqJYkcyiqjFABHseh2IqtTnJPQdJktGSjjQTxl5ILm4gpTQFaFiy/
         yFBVaZhClCYnmLurYYxLJRflpRkNuPWBO6hEB1s5PfXjkAj+7HqlJmzFnKjqjjzPKcqC
         zEWdfitLO4ynWIRJI1lup7H+7q/yXGwJqQJKgTURzUtk9OtZ8Jb8MultTS9KqxfSrbNu
         PKelZpA5mv6t9T5lmLrUSza+9a/z+lERpY6aL6IYn0rUYQvp0olu/mkPG9zQ9xagPZnq
         b7DWv+Y24gPV5bYFq9rJKvkwNywebQxjyyoFtxXbOAiwAvVhcYRd3KL/Q997pCylzMXT
         RzzQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/N0hqOMaYirynDNwYXH2FLVQ8E8uZE7Ba3IcnkuPhIsK6IT/g7BeQZVNDnePfBI0P5wOoTXHrcDCnCOs=@vger.kernel.org
X-Gm-Message-State: AFuF++l9XqEyCjf+FCSQKoFJwRKn/y/iAbIdbdTBSefsP/QMopRRpWKs
	XmoMpn9KMiyn/jbnNLcI3JVnqThv8iDn+oga7Jpj1zwYE1Af2O98b0N9KNHVWkS9N6VDg7qyANl
	KJJYNwNT7cgorwbs4Q3QH6Sbe29xTOVNaT/qy0Q65gwTnVmDcW4UhklvkzadM1IEfFZU=
X-Gm-Gg: AYBFou221eNXEhgrbNooMt6lOCEJm0MwafJAoxbIxJNG91beqRtxUYJJYAYvtrqdA9H
	mZYCeCNt4ou20NBYIMIYrjJOHFIF3ix26hZ5E0dNcYC1NPgDY2J7m7fGHxI3vW+VSJM6oWB/83p
	9euMbqQ5/d36KqkDlzp7an0XqArEMVWWDv96p+3WALmqfGO9mde9W1PzEAHguKL5avuOC0R9o4W
	3FG0xBnm/XI/65KdxZnAetcL5pGkhjof+dwCIwCyEYWMJGlD/7l3iFmur3HSI02xt68jitAijYD
	WAixanvYSXbzOIBZKg29T5Iu772/iaQqqEZrTQltlZAsamIJD82LadT242BluI5zyPaVEYxvy0k
	HmqBVbm7Fyrr+elkcwffZT0cQfV8=
X-Received: by 2002:a17:903:3884:b0:2da:fa6a:b04f with SMTP id d9443c01a7336-2dafa6ab21cmr26712035ad.2.1788378527658;
        Wed, 02 Sep 2026 12:48:47 -0700 (PDT)
X-Received: by 2002:a17:903:3884:b0:2da:fa6a:b04f with SMTP id d9443c01a7336-2dafa6ab21cmr26711685ad.2.1788378527226;
        Wed, 02 Sep 2026 12:48:47 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:48:46 -0700 (PDT)
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
Subject: [PATCH v2 11/12] ASoC: SOF: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:11 +0530
Message-ID: <20260902194712.2003414-12-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfXzpPD9HGxdeM+
 FDuQ6ZYAT/rAJFaMJClXuVqGCs43ZDnqwzllkHr2ubZRMPjMjPycfbnxH7Ffdo11PPLRGIRdObH
 KEFHvS0262XsOuonXPS+r3trldM1I/w=
X-Authority-Analysis: v=2.4 cv=G+ss1dk5 c=1 sm=1 tr=0 ts=6a987da0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: C4ihFTtbyTy7IOYFezCrDab3jj8AMy3b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX2GhgiU0X0cYq
 WYzjXvlxXng2UwmZgkTmyhzk6Rh1fQL/74JzDmGnQLaUmGSe82bI0blsFswR+bvEiIPQOFjxfj1
 JqiAns+gH9PpXpvNPUVImbvGvXIZAcNi/7O7oDHfxSr9htNXwOFyfmaC3+SejkmIvVq1Ch2WkTN
 TcJ5bvMNYTA79mLbQwZjRDDeAgECPqksqbaMEqVSyQu3d7nZgq7x0B2mSIIlbGqFrVXQNDWGHKL
 pQnRIHg6qmODGHVE7hhdF8J9ZYkXc98IfnxoNsBMPheUHzT9NB8z3qN2OdkmRnr6G4iZkSi9C/y
 wlf4Zo6wNU1oS9tm6zAhfbks8MOrjL3c5EK2u9wV8QvpvnP7nJXceBb5CXoBvDoBZwuKybfqqCz
 Q1iNWvGOgaVw7nNGukanqVrIQR6QDcSyKPq2FnFvAjOB5lfK85lypCDArESA6vJTIjTZegIFq8i
 nLeBGStekwX8N0RGYzA==
X-Proofpoint-ORIG-GUID: C4ihFTtbyTy7IOYFezCrDab3jj8AMy3b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020175

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 4d6e9300a9c0..e4b6b6c18e02 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -49,7 +49,7 @@ static int platform_parse_resource(struct platform_device *pdev, void *data)
 	struct mtk_adsp_chip_info *adsp = data;
 	int ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_err(dev, "of_reserved_mem_device_init failed\n");
 		return ret;
-- 
2.55.0

