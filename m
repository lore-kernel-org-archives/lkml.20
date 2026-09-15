Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8772540B11C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473493; cv=none; b=FEJe9rGDqFgpCO5uDSzIdzJnwJX7wKSy/k2R0FYHX2YkyHgG+k9VzLXY6JpzgZpqQq4IN1NRUTH98YA6yD9ntMNXxQxXFp5a41ZAL9qKxWPP8mOab5C159PNFOjs4L4SBDPrExbauoSjaBFldPburRL8cgmPWKhMEbj/87DYDio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473493; c=relaxed/simple;
	bh=8g5Sd3uFifK3ZVwdy+TGQIZh+jmWxcGuzGLJlv4ed50=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T0ij8QCGrQK3xbhotIKctEtJhqSqxjMJgp+wykof7+YYW6bWLpMGh5sGLo9GEl2RTzVDkfLRvxUONN5nNahRu5PxMrVdx3dKKT3Uqp9v7PJJCvEle7EiPVoX8weauk25Atsd4Iwl4ksMJlkZUEyoFq3dKxCNn2kIKod608qe7rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJOgV5xm; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJOgV5xm"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea48edcso2146898a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789473492; x=1790078292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BrGTdKyYWPDzcFJDUsLHUxteyx4n5jj5bbwXZChmZq4=;
        b=UJOgV5xmpcexrx8WPOzF9+dgeAnoI4fLkiJQBwICqMb4rqapGLQSNET7cz+2SLajNI
         WDg+PsecXJMOVrUsub/T31Ol1fpThGMqBdexgwxa0hsnCSEWa8QCmlPmE12vyDDeVMD/
         +7RHE2w+yrWIcffX13f3zwkHpnz+99yldeqfXvPvNDa6ckxAxOVmUTCBmuST1RfdOW8C
         0XAE6rKzw+0JtIAzqwUytVkFRSvh1htg7Ow00kMDHACP87Dfq5JscoWCAMZAMCmHyMZB
         fmBQAmcIO+DypvpTOLciOnZADrXzLR00iIyQOgPR4Y8eYQx93Lo483onOkYrYZvXCWUg
         G55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789473492; x=1790078292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BrGTdKyYWPDzcFJDUsLHUxteyx4n5jj5bbwXZChmZq4=;
        b=tR+GmPP7YWEpMK5AzK2HLuj8POAA+VAq8hMzYzQ+v2QpiNeCbIhPx+N/onhRfHiUEW
         PpWgYDvOx7tWGIuGI9/cEpoDfTWXquBy6x9ZohbXpQtUROGrhmgwKG56goU1B5SC9k4/
         +SXhCgI0wEV5fYFAjpiO2ZI3iiWlSrLOnG8l4hPONU67sB5NqaNO5rbbOwTcQVh17By9
         y26eJ4LiwiTtQCsPARuzyZTuBJ9Fy94xiE3GmQKT6nUZKla6rmLbhLt82ByzbmcBEXMS
         i/f9jeKCxsFA5NODITNAIr/1m59NJ6slWp2TxbZzToRdEu9nmFLgtCNP1lttP2cYA7L7
         kVCA==
X-Forwarded-Encrypted: i=1; AKwUvBzqe5P6Q5YBjPhTkzKFe3zk5RCvdveLLxj+HuSRVYEElOimM2xeMD8N/CFkonBHTXH2xe8vwbdVlv1ppz0=@vger.kernel.org
X-Gm-Message-State: AFuF++lPExMoy4HrRKJUA4DWAXjPphjfzl1JOHcgAo13VaGR/pe2Izz1
	NlDawGbSWVHUDAEtoFj9kPM79ml5wTD3I89s4k4qoti+c6uAijOzIn3f
X-Gm-Gg: AYBFou1O0q14VU5aw2tN0QhDcftk6X2zq5tuNMnjVfhQN7Sr/995Q0s9PiYqacSjML+
	W0gq6QqkaCPWqUHh9CMFGCMOXOfGvnvcOkrnmoHhtEtTiJG/WF+m91movnrcz9My6cgVArX0VF+
	P/DH4z8ggrgeTpGxBCdRpsEOGb81VgpUeE7KD3biV8gc+rCOaWqbnnD2/PYSiOBMUke6ohbIf4l
	iPsobf+I0fD3FhhCVeLHV0RG0xh5rrO7U/My0kwl3JFDcnElH9taK0b9rRnCR0Tfz9SZChtw+rR
	gmlMRTz6aRUCuJ52uILz1OfAQ0uab8VC3ReMUssSEMlaUFdPBCCIjjCXT4KTl09nYvDKJPqx6qb
	kCDRtx4lZ5ZmjVwP09tZLk1hsQTEOcdpfNO0g3dvTGVxnv7AlefmE9o6U5dy0lVY0NazHB5Wgi1
	emKw/YN9c7YXxVOqv9dYHzejI8Mv+fmbyK5Cgsw/nSFtOL591dY8bjsg==
X-Received: by 2002:a17:90a:d648:b0:39d:cbb1:c96f with SMTP id 98e67ed59e1d1-39dec09a779mr13558544a91.18.1789473491565;
        Tue, 15 Sep 2026 04:58:11 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdacba6bsm4953697a91.14.2026.09.15.04.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 04:58:10 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Fei Shao <fshao@chromium.org>,
	Kees Cook <kees@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Steve Cho <stevecho@chromium.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH] media: mediatek: vcodec: destroy core workqueue on remove
Date: Tue, 15 Sep 2026 19:57:53 +0800
Message-ID: <20260915115753.2411047-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The decoder probe allocates core_workqueue for latency-based decoder
architectures. The probe failure paths destroy the workqueue, but the
normal remove path only destroys decode_workqueue.

As a result, removing a latency-based decoder leaves core_workqueue
allocated after the device lifetime has ended.

Destroy core_workqueue during remove for latency-based decoder
architectures, matching the cleanup performed by the probe failure
paths.

This issue was found by manual code inspection.

Fixes: 365e4ba01df4 ("media: mtk-vcodec: Add work queue for core hardware decode")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 .../media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
index e936ed8dffba..426d060d937c 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -570,6 +570,8 @@ static void mtk_vcodec_dec_remove(struct platform_device *pdev)
 	struct mtk_vcodec_dec_dev *dev = platform_get_drvdata(pdev);
 
 	destroy_workqueue(dev->decode_workqueue);
+	if (IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch))
+		destroy_workqueue(dev->core_workqueue);
 
 	if (media_devnode_is_registered(dev->mdev_dec.devnode)) {
 		media_device_unregister(&dev->mdev_dec);
-- 
2.43.0

