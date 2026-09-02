Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41D44AF149
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378510; cv=none; b=s6cNr0VFXVYt9nfukMLWy4qXlQZg1jNOZ8du2/lrQmDfQZ6nCrCP+psGg85zzdSrGvU5RVSq6IoFpkPUuzLsKRWmw51/RpRHQO23OaQHwmE1RndUhxH4hs16kfjQsFQvZ/uGimEECd7ceCTvYKwWb3TPF695vzZgTgGGh4pehOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378510; c=relaxed/simple;
	bh=UCipgd/TO/vY2C7qqQPP6j1/jZMLJQlQaBZ9luI8+JI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g0mewGSjPZTSQqWGX9dyW5dATtIUHKsl90uYb4O+8kPDIDCW9VojjMjim25vyQTPXnH6qIOMTFOwsH1BsfY9OGJd55FIFAXf7uhO+Le6k53osGctrWnYYiMgeLUly0jezmOtLvn7QpaSy14rqphPpAMUjjDJDKzX8M329LHXuJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B7olY2gJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XN0Jo7OJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B7olY2gJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XN0Jo7OJ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hr0Dv2104806
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 19:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kbPay+R8Ceq
	eWwn1FICo6sBaCOUhXLnhdoFXPQxblH0=; b=B7olY2gJGSIpj2fDG7L2gIFqQ6e
	JT6tYIqewvY8P9NfqErInwKfDOxU65KUH9vNSJx5G2VaxyA9ypw3cZle1gWc6ULB
	gwBBO249bNezUJRRvS73dLg3cwzIdBznUDugkYJIFuI9xUmaMJEysCaimOoCaOek
	i0ifSlEgcSv1cZwp+veeS1PeFh1z86k+PgQArqsL5ZkhfBKZNd1cKiHW1OVacwWK
	dH8540V7hmM/Oy3PIQGTDkGKCxqZ8vjwXZDkMDzoANPs6Z4nlOmSjRO+TN1dmr99
	hdB2oGdoSz38s6Nbqu7u/0FJ9lrvOI9wXJ6XQQv1j8dh0B7Pp5mIduLIbrA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdsbm7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 19:48:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6f75c1219so29462945ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378498; x=1788983298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kbPay+R8CeqeWwn1FICo6sBaCOUhXLnhdoFXPQxblH0=;
        b=XN0Jo7OJ/EIzRm64N45MYVQIs/2LfCWmWE+2q1LnX+87Z350HMWMLZ1ndtDq+eiO9T
         WUGTDKPyEHV7Q543eqnfad76iLaZ5xwh0F1yCwMbrnedaSW26uURNrL+a+/EfnaOPPMZ
         n/TNKHaZsCnA0dQJO4VtLaM+l/L/lYbW+4g48/02yr0Pecjg80YyhPEgCZDbZotP9KQa
         smAxrdqqTLkHhavwP8ArehXa0pY6VHmIwf5voGGAjHDoQAiNoye9KXTsnAEGm2Xd4heC
         XJjSx2cSXOXLKkGkK2Gx0utd7VIbdHoek3JLCgLMyOMbGOkLMHtMHn9dKv+2OYUdgd/L
         ehsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378498; x=1788983298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kbPay+R8CeqeWwn1FICo6sBaCOUhXLnhdoFXPQxblH0=;
        b=M4tcDX7uoijGiXYai31TczqW9Q0/yf6ArbNooI7k8Td9gJyhHGbo4A45yiUCuCi129
         7CRfhlg8pZ50qAo0MTpi7C7tOp5nhdbs2CwyVE66+3Dy3Z49RWpqeGkZ9JFG1bw/xDvg
         7mhf57JzHggnQQdkvK9Gdv35mjFMoaWm8rJ5Rhw5L2vl1AHh1itqPfX6FtgTXo9WPG3/
         9V3Omka3cggT/kOKbDqlabubxzmYvFJCGSSh35iBRwc/AAHODeXbkGil21kZd0VQW8mP
         npG8yroNKItuqsNwjgXuta8bXrET7oCV4z59qQSqB3u+jXtLSeFHnsEHUv8//AiIz3DK
         OIzQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8mIyAgO7x+HL37T7HGRbOsHq5cNjesBD0SUf8qnoS+xzExIO/ExBCa5tLKfbCgEJqiV+aleFP5+TqgGs=@vger.kernel.org
X-Gm-Message-State: AFuF++nsCqgaYsn1r+KkLsHORaaZ0p+PdJh8TBcb6pBCRtX2KGAjVUg3
	MLnfTxuI+PblaGbQpEUjGjam26J+qS425pWdaUhcTKiyvyhFef41ZyuwDdILc2HOLcE4AoV0D1c
	/HKHAh1jrS64keCb+VJcnB/wNzuIBDdcyKL7LFJewAqLOseJbWbsa99wQdvCzTX4YuZg=
X-Gm-Gg: AYBFou0zpcAasxd6Av+NZmP2Zp3f1l5cnXfKWNxNXCp+Ox8+IRUo5tv6nd/3mM2iPkg
	HggeUVISe8bFqalulPQwjWpnEYMUTfZqsAbvYMi75ha0GEg1uzIoBnsZpKCmGROpBTVFSGr0lPZ
	zFi9m8+Q+lsj/7l8ZHiMFqI7utsq5tFyX4TNEJKelf7KJnBVPvxcbE+Ae+/gMj0eKzAuT0osyDN
	HkS8jwCEC90ZOpoX6QWGQUwQ/Sz1oDaJ/sea30OL6tFfCVueLSvlnRsof7wgHHXP9tR1Oqkp10e
	QA3iyYKBw9awBimEfsm83txmU9xHT905U+KxG/+gcWyZjy+oArpSA53Whr+bDen3ZK/wlfbrrP0
	qlJN549wsmhx6ZJSm/xIV7sTHHgY=
X-Received: by 2002:a17:902:cf41:b0:2d8:d4d2:dc9a with SMTP id d9443c01a7336-2daec78a390mr108998505ad.22.1788378497914;
        Wed, 02 Sep 2026 12:48:17 -0700 (PDT)
X-Received: by 2002:a17:902:cf41:b0:2d8:d4d2:dc9a with SMTP id d9443c01a7336-2daec78a390mr108997865ad.22.1788378497411;
        Wed, 02 Sep 2026 12:48:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:48:17 -0700 (PDT)
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
Subject: [PATCH v2 7/12] ASoC: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:07 +0530
Message-ID: <20260902194712.2003414-8-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a987d82 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: EQBRMRAGU2wFGd88J6Z3YvL_UELgPuUq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfXzL129Mfs/8NX
 JumX/tWBWdGCCYGFbBkWFule60RbuHY+iIVC3uauZZmhN+4ZV/HeDF3rdccdQZKgPXR5slGCEX0
 w3YDE7+MSgAw0p8xtUSEoXMOUNfj3xNGlShl4xDVi0PiFJT9Q5goJx8jkQJo6UqLWyKDtHUi8QX
 RqdD0Bc5nNXZ/dGFxac1/45hNCsZZtDE2vFO1ahGlyzTkNXmV4gSmiI22zF/u+H73MpGVfXPq8L
 dV2eET82V6pMk6JpKIf8Q72NVtZR0CaVGjcWC6tSYoM2/uy7DckSbXAdS9YQDIgmYHxnfkTEvxG
 OVLHKT9Ap/xcayu0+SK60ztdYi9/kRc6FN6VZIsKmdJZdLkqBKQ2quhaBvWKTdbwSzOtn3txApv
 OosXkezzLEJEzsnNzbQ6tkEQTuOke9+sqz3LC9aZq7zOJUBvoQdTcakFTPogAPcIwYHt6Z22kl8
 gMAXlsIXfF85PgBBIUA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX5KohNemzW4T6
 CPPyCqlpiWe6jV4sw0pLIpYOwARqKVMB7aLN/9+AOz8ZsR/qxgbeTAXS5iJrBBO4icVKxjNiv8X
 /Q80D/tkNDu5kvUTpV7SpeOJyWOMWBc=
X-Proofpoint-ORIG-GUID: EQBRMRAGU2wFGd88J6Z3YvL_UELgPuUq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020175

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index 44a521c3a610..60576f885acd 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -2836,7 +2836,7 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe_priv = afe->platform_priv;
 	afe->dev = &pdev->dev;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
-- 
2.55.0

