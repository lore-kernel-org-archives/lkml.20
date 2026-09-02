Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9DA4AF16E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378478; cv=none; b=JDzstactR8AizGtMf5yywy9KF0WBYyk8wMtrn7fCYk2FyN8zZlOacTReYxVmpJJ+FWWnl7Q+6hKA1MWrAqAZPImYFxFfNTBnIa7wlmNfOw1200m9cczTDmQy7tQZ3heZpKvKnfcLW5TMvChpE0rOCEKp90Yf3pIHpCiV5DAfk14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378478; c=relaxed/simple;
	bh=nGcHjT31ZEnbCTByzcgF9VflmsEvoi/2wRhOjGNlxNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d54coHUbjWc26zMW2CNsLsRNg4lQddECu58EqQntPQPbJ7aDGh/8VI5dnnSWnI47Y0C88IYhieCAWxciQuafcFFsnsE2bHLa7QOLsJilbM5GJWyUnQOT3WJzXnuTU1lat3AcKfPAmkjk6YTY/YNsvOaBnv1+m3qvasZO3RrpWHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IQTRtLTS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=htXQ6GuR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IQTRtLTS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="htXQ6GuR"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hqq1u1650546
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 19:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=h+DsXwsUWBu
	H+aojhy4/J4URgft5Yvx086IeNR/2cNQ=; b=IQTRtLTSYcEOn18VGO9wYHCZm4K
	ltU9fpBlsJtOTcLD7E7eB2BLQcA8mVbIQMpUqezCGdjQZVbHJPM4ZSk9462m/FNy
	5U3C1sdVh1Uj7f8YxEU9MQITdBhE+VeRNaGOoCLVquEVAa0tP/ghtDsaEIJNjtuj
	uh/Cno3i8JgYUWwRRhcJieqMH0tvbobM7AH6QubM1OwcgtaXzRXHYUYSrMErE6UU
	gHtOcSL0fE31QERVt2eoyT4UFCAdtPu7So0S01rUwc71RlyWO/7a5WR5u13yBPPQ
	HpoMvE64V5Myr3dkX794kkVZEo5XohURqsvN/6cPfkAUEd1WQFTImtDXJ1Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemj4sng9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 19:47:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d9057fab9eso22775485ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378468; x=1788983268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h+DsXwsUWBuH+aojhy4/J4URgft5Yvx086IeNR/2cNQ=;
        b=htXQ6GuRmAORVhuPcnW6mjnFyqxGx0bS8ihSIxjg7RSKLmUmjBdmjubnvgFaydauza
         sVtEPi7rub8k7JICbQ+EqV7kS696WAizQBghl5g4MXKFZadprJg+H/KjCSqalXWmsUC2
         CpK40BUgq5mNZQrKz7Zqry/JLdkymIx/lFaI5miIIJ+fKAut2t7cVdONajJ24jcobaj7
         8vz/q8dMgtf2IkHqtlvPc0DW8pwS3oANtHoIxkHXnxGFgJ1tDlbN4tEaPr5ZtKXgys2O
         C2H4k4LyBudDuPm00Sd3HOHrAZ5d7q0MnVhUNpKiEnnbTog+8GmhE6H+1wp4T7RFVuJW
         CdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378468; x=1788983268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h+DsXwsUWBuH+aojhy4/J4URgft5Yvx086IeNR/2cNQ=;
        b=IvLjHfGl1NDIBEuR3f4RI0tYHBRHwEwHFpzlv2aVOJ5rlzW0FjLSQpcako2LHD4Lp7
         yyNfE3rEXWB4nmK5td1fw5BKn3Xyz+/yt0DJiZ+mR98rrab3llDiTwTe7ngqumEmveOK
         RIEzRTEGiNdzdkNq/sJCZUbNLSf5BgYzjjOtFSwbkdTHck0lSKBbx+t9XnPMW6rpLHn5
         sYZCJvJzjiCufYw4G0vjWsgywwTaslqAjgAtlDEP07NKh8Cw81M9Z/tHvZyMkdHfu2T0
         cYJbddNqC/fArqc5zhx1ON4TEpeIF3hahMpkDTVLGb3mXu0qTkkdvECjVWMeVCOgcVT0
         PWmw==
X-Forwarded-Encrypted: i=1; AKwUvByf83Ed0fl+Byv++dXqMFfYh3jC/pCnTYQxlZKJPSnr4jppcZo2oetr0EoLGmxmSNenJTEKMSXvCqMTc0g=@vger.kernel.org
X-Gm-Message-State: AFuF++lss5l/hbii8KHT3JwBxpjS/ITlLwhnkigFQ+rlVNl3u2xgEESI
	ZQa6zxO/d8nB+sGvoblb10uYejuxa4uMR7mxaKgdowK4qMEvpnW7JtmCbMxyC1eHaFQNTQRzbu1
	SkFO05iF5/mnz+ev4yiX1o3Bt+Q2xzIUjodyLHV6iZihM7/gPl+zFh7nfiyUX07J6Gcw=
X-Gm-Gg: AYBFou0rvK4z1vNKJ4krn5LlYfy0MtFbf+nLNbK8+kNXhfIL9Bss0Npp3Hmtj/ZkBRq
	ozCErImwp0TRQYLh1pv2n5DZ2LrR7C884CmcNrdW49KSSwM2Pn2f0eDGO4/aY+BQgwb2aywHF58
	DDxm8pzmPCwJMKTfxvkkIpk9V9iwhoxkXbkIUyRbkotPukeOFjwrkyaFVxbSxyebCQHjJvxL9Xm
	cSBdJt6Sq8YWoI1thgubCKYOz5Ge9J2QoSJblk5A6wbmVwxoPa5Adf86HrClRvWlD2aht9+v+at
	fYXDlc7m8wj5d4BM3SxfYkjU4zvqOgfOJ5/dgVKgN3GsYZnzTcKHfiMax4tV0qGxycdfS9ifn9R
	4kdRgMgHv7qHEhmd8Erm0BQeGCQw=
X-Received: by 2002:a17:903:1b08:b0:2d8:d4cc:5bb1 with SMTP id d9443c01a7336-2daec75b6fcmr106240575ad.17.1788378468273;
        Wed, 02 Sep 2026 12:47:48 -0700 (PDT)
X-Received: by 2002:a17:903:1b08:b0:2d8:d4cc:5bb1 with SMTP id d9443c01a7336-2daec75b6fcmr106239845ad.17.1788378467791;
        Wed, 02 Sep 2026 12:47:47 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:47:47 -0700 (PDT)
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
Subject: [PATCH v2 3/12] ASoC: mediatek: mt8183: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:03 +0530
Message-ID: <20260902194712.2003414-4-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX7RtXATn+Aszg
 RLuPTqWW3Dw4YeLjagAJyOgiSCnq/nPMNY7B1eTU3T+GsPvumu6zX8DR/6hm2rM5xIYPMlBMqHN
 OcDKKr74mTvxhs4+eEbI/yvjJEq+JiAy58FWuMIEn6du60Yw0BfoeQzt62pAwaLN3H5wDb5/HuX
 QI8zMHwWF7PhwybA2KLmrsgEmlO+6x7MkExa+rxNqZZD5voW5zu7pOyNkRCNnqNIbH1D4kML1lF
 jV2pzCdKbBOJKvisqeCp9K7tHklr/GpUqJWczuNdELjMvXddiRj/d9D2/eqldV2k6tUjw7muz9N
 roS4TYPco6plL/kpFCZ58J5/R+/RfivMfWQo0qd422wjpsRYiK4LZDqAZ2u3q1oTvdbqmsO2ghS
 lLoz01w25t9X5i4dV2PmdftYBXVmbJmrL8DcfriA/SV2+5Nv8mF/EESVEIgY+5t/wnNEatzqxp4
 uiHT9dRNBzJwjqjZpjg==
X-Proofpoint-ORIG-GUID: NAOW2JskImSqgxUpCsYLY1ZJKlUAoekC
X-Authority-Analysis: v=2.4 cv=MdhcfZ/f c=1 sm=1 tr=0 ts=6a987d65 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5_2tDv0Uws32Dsz64S0A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: NAOW2JskImSqgxUpCsYLY1ZJKlUAoekC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX5ARNrCfBiRzs
 H4mlkaPHChwTArVMigCPsxn5+q8z0PFb8S4wNuYkGiuUaB/yYYQJmVqYOstFjw98iKYBFQwkr8E
 Od65Vcleogk+12yrhC1ZhehQXRfMjds=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020175

Replace the hand-rolled devm wrapper (mt8183_afe_release_reserved_mem +
devm_add_action_or_reset) with the standard
devm_of_reserved_mem_device_init(), letting the device resource manager
handle cleanup automatically.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 2634699534db..6ad396e3b10d 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -766,11 +766,6 @@ static const dai_register_cb dai_register_cbs[] = {
 	mt8183_dai_memif_register,
 };
 
-static void mt8183_afe_release_reserved_mem(void *data)
-{
-	of_reserved_mem_device_release(data);
-}
-
 static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe;
@@ -795,16 +790,10 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe_priv = afe->platform_priv;
 	afe->dev = dev;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
-	} else {
-		ret = devm_add_action_or_reset(dev,
-					       mt8183_afe_release_reserved_mem,
-					       dev);
-		if (ret)
-			return ret;
 	}
 
 	/* initial audio related clock */
-- 
2.55.0

