Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D294AE136
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378496; cv=none; b=pSdHNKs5MmRLeVo3ok0XhPxD13SQVSZAZrF9DlgmeXuEAFBnEgLEvC4M1Fio6K+WukbZPmb+H3Aqe/XGX5vSYP9c81mKlKmViuRrRxOebHHP9EHned63N7MY26Qn2cphDoGEXxQqVP9dP6kjEbTbXaKzQmTG73mgQudnG6N010E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378496; c=relaxed/simple;
	bh=Tp9ZbGaMeETB21dVEWW6WU9Uehfi/++4RqOXCa7Calc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WFXT4XC4VK8304NaVviWblnWP8x84/uP0C/QGCKa4FYhDL2iK4R32pbKMGiGivSbLEkQqr72q/LfQAM79GP3ygJjcX/HItjIGHXfSzG8G+owuZlImONm+beFH1x51srKFgd8k7tsb56zR0UQejbHlKmiC4BB8zA/xKrl/8A4N5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JtsacYbK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sqn/FOv8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JtsacYbK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sqn/FOv8"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HrglO2730686
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 19:48:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=32EdoVp2rW7
	rCpiVn+zEPU508NjDuMsP8in1gDPigAw=; b=JtsacYbKfJVs3Ni2QzCap4OTDNG
	/yHIFyKNw9eD8ooS9U6Byunnukn9ZAOAhbm4lVLXMNYCVWrxAAg6S72RE/LfntRI
	L1SJ+w6RfPMXInR9O5xSJOnxT0JzR6K6/QA/rEEyEYKnL43Bi6aEKrmik0Gxd5ak
	7eM4lhgrX/uufETpJNAMsedDd5V4j/dhF4/Cfd1RA978Hos6JzueVdJsdhZ+Tb5x
	+PGSrN/QBLOJOQIY3GJp0cAR+6qZvnTzf/MBhQJYkLA5S05owph0qHYfhi50VnBD
	BhhD3UleXckCepqAoLX5CtdpJka23y+XozayC28DcCW0pLU92wacZcAaKdA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geguy2px6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 19:48:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d9057fab9eso22779035ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378483; x=1788983283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=32EdoVp2rW7rCpiVn+zEPU508NjDuMsP8in1gDPigAw=;
        b=Sqn/FOv8dzRVdtYkVDzKhp52FhuElFFIDOf60hATVMXkkBMBrtXog/33ukERHlSskG
         jU7e4EODmqQMyVhkrSTvp+qK+gHNDWvdt41F9pPfoovMTxKC4au/QP+iHGJ1Hca5Ywtv
         RFrioOVYa/2QeBUgzLey0xmTnHaWWuiEojKVhNytEJU5OhalDIoLzHfbklAZCCusHkaD
         pBjd9o8WrNdsmcMme0pJpARI+cn8D1EIzukNvPCI5D2go0NIRSnOf3RSccSmyTAhIPHN
         B9f4+2Lltwm1cNMzWeyZOpYmfvB3UiYwFXK5lLHNIYxil4W9aeR5XdEtAIh2KwuqNwel
         kf1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378483; x=1788983283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=32EdoVp2rW7rCpiVn+zEPU508NjDuMsP8in1gDPigAw=;
        b=EmE7HrTX3MLoE8e8Eh+JAZ9ydosnQuz0KLNhu4vON0ym+liqdJFTuh0h1hc66480aX
         k8GVyoxhrWRVLYpZLqS6vIPp0vtOwP9aXaKllQpMRqptoulgiPF1ruMbUHqP9k4pZK0M
         Y2fUjrzDsPsArSwEfCjem7FyIJmBqSvpSyL8F9wH/saXmwm8YMPVXStklBLxVeEfhy+4
         t+x+5vsCPJvrAdVvf2gpKjJtP8NtNMKr+GYcdFHAsYf/hqeJDorz6itEHYJnroQT5hZn
         b//quqapjGxfaxRxDSFGts4nsCVTy8pUoxHpMPzW5oVvMNi7HhhhtzKklSir8Qt+7Ke3
         fzsg==
X-Forwarded-Encrypted: i=1; AKwUvBxE6B9kDXBMEK6C9cUlNzIygjiPfuInzNEAsx0kv717I58Qekog/bTgRAqkKYSY+D091Jm8MufcP/aTUio=@vger.kernel.org
X-Gm-Message-State: AFuF++m2NkpfKYzRYrjo/Z0B0DhrjKaI95YhaBfeRTm4fUxwnVlcgoLm
	lyxl5iBqGCvdYKRbqkG5HCqj/mc85oDx/USAu5Np9/02QDSWr/9lKU4r0xdLgVQy8Ctj4VEhsds
	uB/gTYjoAnMQSz3qNaKxn59va8z7LmVcXeoASLZtDAbyxNFoTE4VtpUJ3dHf1AkJBVWM=
X-Gm-Gg: AYBFou0BV4fy6w9dLGRc0M+43LlKV0vzA/r/KrR7jzYzdYR8KtSdInphR7KAtxnLKCZ
	Nk+LiIG1W+CaQ91uD8MyMXcJq7dMSC1vKc0GPV+TyyYcphRht/H1WTyip+Ztqq9opOy1D+6CIAm
	ZdUf/4FJsemeYwAcd25zycH6/JVz5+qf1D9VUfD4qsij3ekKqRx2DYGe93ZHMcYoNrf1GcD+RfZ
	2HYGAjGfSdFuiWA/BJvUbLJprlysFPriI9tdfSdeQsnCYJX7ZLOH5Sgc0pQioKfd5yZTtQh5YFm
	D99+rxPXTeHHpRwYpZ1lP0n51S+esIu1PFH/pgWgk/988FdXl8qHSVzLmABekcolRFsZWVwERaQ
	y7hZFdfV8dj8SkSQdOWGltg+w8GE=
X-Received: by 2002:a17:902:ce84:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2daec43ee8fmr88328385ad.0.1788378483030;
        Wed, 02 Sep 2026 12:48:03 -0700 (PDT)
X-Received: by 2002:a17:902:ce84:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2daec43ee8fmr88327845ad.0.1788378482601;
        Wed, 02 Sep 2026 12:48:02 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:48:02 -0700 (PDT)
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
Subject: [PATCH v2 5/12] ASoC: cix-ipbloq: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:05 +0530
Message-ID: <20260902194712.2003414-6-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=UZthjqSN c=1 sm=1 tr=0 ts=6a987d74 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=TAThrSAKAAAA:8 a=EUspDBNiAAAA:8 a=iqpFDo2SwQq5gjaSpEAA:9
 a=324X-CrmTo6CU4MGRt3R:22 a=8BaDVV8zVhUtoWX9exhy:22
X-Proofpoint-GUID: QP0V2GwCBspyEHVRt3vPz5R4DyobPWFp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX1i/Yl1c0qwrT
 ccYk4EmDL2MkKuRD1NHRkLPBrbXvN6tFHCr/+p+jutSz9I9ywdrvXh53AxijK4kH3QTE79L8Olz
 Ip2WS/5N4aesrg+DVyhcJPDlwJDyF2k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfXyoEGbGDazlIR
 KlqY1R+g3OF8ozH4OScj4FwcyZHRkAHI04KI8qmkSRsq1qlun8q93CmpHCBuqVfil0an9jsUiDi
 Ckv0ZNt9rw/BjO6mLK0q9asPRMfbKB6ZK+nErD0pn1KRYWrTCWaZtXIKLEdVVedCkmSju+xr6gb
 Vl3Vm1XkJuHj+N05v/7g7zcOIg6F4e20GeUo3yVw/EOxT9BqXkh5uFbp4QdZo8XHRdIfmyZRdeZ
 rR48YLTkSLasiy/XTXQoXr30MGqxF6pwPKdzP7mQNtqx86T2DMXHJpFYMY7onVAwpuY2oNoeW6W
 YcUTCZpGZIeQYtqGIAun7aMngdgkZIFzJR1/LhF83XtidGk4MDtlmjvzHe33fjpWwdgPa0GQvlR
 htU0Wci0I8k+rXUl5wJdasb+bc4LO3+eSOGsEMl54EK04X1BnAHWBzl3/rV/Ncf3g+GUK+moK4Z
 X+eVPFnbbrgW7e31FUQ==
X-Proofpoint-ORIG-GUID: QP0V2GwCBspyEHVRt3vPz5R4DyobPWFp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020175

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Acked-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Gary Yang <gary.yang@cixtech.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/hda/controllers/cix-ipbloq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/controllers/cix-ipbloq.c b/sound/hda/controllers/cix-ipbloq.c
index c1084a915c13..815932e5c58b 100644
--- a/sound/hda/controllers/cix-ipbloq.c
+++ b/sound/hda/controllers/cix-ipbloq.c
@@ -257,7 +257,7 @@ static int cix_ipbloq_hda_probe(struct platform_device *pdev)
 
 	dma_set_mask_and_coherent(hda->dev, DMA_BIT_MASK(32));
 
-	err = of_reserved_mem_device_init(hda->dev);
+	err = devm_of_reserved_mem_device_init(hda->dev);
 	if (err < 0 && err != -ENODEV) {
 		dev_err(hda->dev,
 			"failed to init reserved mem for DMA, err = %d\n", err);
-- 
2.55.0

