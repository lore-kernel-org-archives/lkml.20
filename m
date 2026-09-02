Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99604AF174
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378526; cv=none; b=WYzwclSe80NMp+VTJWwft6IxXE3B1KP3iQh+7j5o+MNFoeAG7MY3Z0CZufCJAsq+QR7yNGAwf8H3ye5Vn3DgZl4O4zfF0Ph+rtTtY4ombrAIvOqjNAx3MwDwhQunXunPmIu3qr8ITsxEJAO5HeDeXsNdWrcLvEsUFcpwm7pKpfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378526; c=relaxed/simple;
	bh=mV8wJOcvTvuJxHQRGgDhBEXdcKnu0/1DbCT89c/dmhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F5QqUUZO3XRYyIh1Z8sGLaDa2lPIIOfvXoHP6QMG2Oi6JZHGTVONG0RlRUYYrvAJcFdEOsashAPnsOsdY1LsdBKbGeyXYHtm2lUSOMlXpHnUa70zV7ju0VTPptDjxMX5lcueg+DIu2zIYGZk4Mfr/I94QfLHIPcW0izt/rNT0Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ex/mGCBu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YGRmThM8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ex/mGCBu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YGRmThM8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hr6MP1650757
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 19:48:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J0wX0NGvpX+
	d3fdXK5KeRZzZ45a/RXp3bjbTn4NhSmg=; b=ex/mGCBuQfGUfQ+I3WEvpht4tCf
	6cIPSR21rccSUNeLu9q5onnBeFdg8CG584sGjhoGdssDNxKtLgGQsO3zH3x/hH+U
	6nlBflB1cSTk+1qOicUF3KKKy7voDaY9jgycGYoEYImIn991GMZDHTpQg8761iuV
	GsqR54r9J87D4CivoNelQPGhJmbk/FsWODF4fWn88Jibbpqt0Hj9TBQaGYdQ9a/7
	yMFEBEkTSP4hN6bsQeQS3MQ/enzes0QL0yD+cjarQuSpus+loQpD724LqefxuzhJ
	Ih+0a3dCckghwKcSveSRhAA6+u8Pmszj44iQtybr+grBgcJ4t8cFP1JtWFA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemj4snjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 19:48:26 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d001671a54so25200495ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378505; x=1788983305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J0wX0NGvpX+d3fdXK5KeRZzZ45a/RXp3bjbTn4NhSmg=;
        b=YGRmThM8wzOh7dDBCd2ZDusIbBD0tXK0dxIrloT7gDp+B9iD2ogq2C8y2xPTkq6diW
         4ktFSxqrnfgTpl7Y8028eMkkCkkIfFPOMDrELrrsp0ditrQch+wYMYC4sAVuvRZ3AMmU
         qXh10leYVjeSmBeKqacHRVK1LYobiH3XX50u1D/vgPpkEYDoXdrFSa6niMqHTbphWv3R
         KyKCjYIoA9j8QBwtrxfWShmporteYEo6QyXdxl986E3RxIMXqCFKmRmySiQ249K91Cza
         6R1PIyAx1GkHbfB0Lwo90+gKUknjmD1B0vVTsRlFTiT/Db3HwQA/3RewnIidISW54o7b
         Wwsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378505; x=1788983305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J0wX0NGvpX+d3fdXK5KeRZzZ45a/RXp3bjbTn4NhSmg=;
        b=b9FNlkLWx/cWFlXHFV9igNSEJhE6tmvO4LIWfBmB4i3Fxb4COi+fOVxQEOHVeB2gIi
         UHjz6PUn0gr6jnZHTGIUy9AIxyXFql+DCU1u90lc3RycLzoKpvKvDxUpjx90H/NxO0Zk
         Fnn3LaRwBJyOA8ZKuYiiDLTRJ5TMfjcAhC3f9yi7HbwqhVqWZ3hmCqITEu+e2YSaw0my
         Iy0A8Mb0D9fLRWZRfan8l7Oc81xn+a65k93bq6lYXJ6j1WytxGBzaYDbxawyl1UoTr0x
         Gtzp275MxWyQWbIB9cMi2Pv5LepFHsRm/denXzEdDXOCHN8IxGP6ujT0z4NJp6vAWkpd
         SSbw==
X-Forwarded-Encrypted: i=1; AKwUvBwf3MZGZ0sz/FU29dep/o+27SkHjP2au/1WtMxY/T1+vBx8O8YPBN078spHgu+CGxJXGEyS1Zp26toXpMQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mqo4+XQXWJXGcmmBtnScBvfPOk7HhS/T81uJIouZ13oPE6E3zq
	7gXNbrjSio92jxR0AiwFIYKYfEOBsss0K2+41/88Vk8GNqOaXhQSG89AClEMQldSk2tZPdVxJP4
	UwTNUk6wAp+49Qa6Qrb0tSiVO5VFCF0BTEEJcwD81G+OTGAeSAbY48SrgoWc3ov3yLuM=
X-Gm-Gg: AYBFou1MNJi082ZNRDF/be0/Opssryt4WtAe7In9zV3GYyMiKpWtPfeoGocBaKxumfP
	CpPgadd1I/z6htB6cMOx5z2W+XGLF1QFFLJHQwAio/4jWUE4HSnBEKu2dV7BA/nuXrr/63eQBJ2
	BqZxwAy+lBYWhZrT/DMcZMu/Ite1Aq33ZsIL30fTjoB9DaBztYITAviBPddb/7HZ2Hch3WYkOCV
	3XllVLQkurFqRZdtFamRNWCsWgMueHbWSMFNpj2G2jNk8i8r7slt1St1JQm+sr1SO6Vd0VI1IkS
	XkrEHod7JK3sYnKndqZsJU3F4oef7u1fim17l0P+EBVk8S9x1+SIbuzwj0jI2uda/RK2HSuxFTQ
	DrQDkg/HHBn8UTiX2d/Pgr4yB2lE=
X-Received: by 2002:a17:903:37c8:b0:2d8:d4d0:7930 with SMTP id d9443c01a7336-2daec76298emr103553375ad.20.1788378505339;
        Wed, 02 Sep 2026 12:48:25 -0700 (PDT)
X-Received: by 2002:a17:903:37c8:b0:2d8:d4d0:7930 with SMTP id d9443c01a7336-2daec76298emr103552775ad.20.1788378504916;
        Wed, 02 Sep 2026 12:48:24 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:48:24 -0700 (PDT)
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
Subject: [PATCH v2 8/12] ASoC: mediatek: mt8188: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:08 +0530
Message-ID: <20260902194712.2003414-9-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX4CLMnJkYvfUH
 Ox0BxUJWgDQ9Tjf2xiEaVv7kHEc8PNJ5rJQfH7y0/rGhyqQX63LOHiaCT1AbdLRTcxsEAnOdsvP
 hPglTaHI75hqyx2zlwF6p+JeadJ7G2wiCScBpdKNkKpgI31+ZqUBFHa72kEchH2Vuyz33rybbHN
 onwLV75+QoXTbt0xtRRg/t6onYTs24+oWwtnfMi/TVaySIsOSJF0yBmwgkt9SjQnGJwgk4X13uO
 QQ++e8j8lZ5G4DXCyhsHhLhHyeITlmFIk21vZNxR/Kgn+KuDuiTaFvwei6XkVMdja6q8aNg+Ur1
 uHb/TP91Jxiucgx/dAitfVZTBagFYZXq4RiSMJZanfsEIh22NPXFp6MtLQGOPpqsf6R9CZte7TO
 e6dpDr+b//U74E8aB+9kdnG++J+GwaM8WbJgB4Aqe6eQ7q5gxTVyu7Id6s0cPxuswXxE06BpYg1
 8E5oXj6alnnnJDX/Tsg==
X-Proofpoint-ORIG-GUID: qQPL_-4ayhRfBPlASeOjLEZTVXBp4m_f
X-Authority-Analysis: v=2.4 cv=MdhcfZ/f c=1 sm=1 tr=0 ts=6a987d8a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=n3t7IOQx-iCxt-lDHrwA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: qQPL_-4ayhRfBPlASeOjLEZTVXBp4m_f
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX5NoD8JOKNqi4
 HzZ1sXNQeMgLRLkg12mZdVx9ootK9rZq8OmpIv8LqaCCrMrmnGxCF6oRoWPaOsFVrPG0OTDSgPA
 xEsNko9GmJYLzDtMAFa+yERYs640qfg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020175

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index 7b1f5d05f4d6..ab4ce5e86b9d 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -3199,7 +3199,7 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 	struct regmap *infra_ao;
 	int i, irq_id, ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret)
 		dev_dbg(dev, "failed to assign memory region: %d\n", ret);
 
-- 
2.55.0

