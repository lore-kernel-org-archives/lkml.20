Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF1B36F90D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 20:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788379677; cv=none; b=oezjKkAuibd6vTgGCM/3yZzXuIOuKdLo6Je6hRDuP0IEQzOIkQZf8D7qXEjTdhAs9J1NlD6EgC7WvWY2YSR7AlMEU2CB4Z991DrloB7SATmSsUuHK9EH8LHJ+BC2Z1J+ZOQToMYE5rKSQJ3Ik5jnARrFz08wA9TzSDt5mJZPj44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788379677; c=relaxed/simple;
	bh=QGQ6whxqf+OX3FYh6lKdjsPxftUzslebmpalWNd/V/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tcClFmikwDGyhViXcC2eclEiA8FJ0Nyye4do/QOfxMvmyj1HZSS4OOemwtFjVzKm8tLgR77Xjip+qczFQoIoxiKKPOwEFjWNAQKljdENXYbm6JYw2iAsBBRP1SXKOBkVei7Uq1bsHjTT1KvKN8MVoI0n7evUoQTevYrr7yTC354=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RkLi7WnJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e05Qc82U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RkLi7WnJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e05Qc82U"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hr8NK1072343
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 20:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nNFPGVLFvx/
	AoejV7EuP46spvaHGIWdJXEE92/o9lnU=; b=RkLi7WnJT32eVWIHPuqGyOBqrKx
	lRcdCPBgHIjmgPf3yvBqtGbaQixnj6ftcYW0RJFHwL1GxlPgt8fDs7l5XahvDSXv
	GBzLzbnu6xQhFr9WEDKDxSv5ov5rp0a2WbO3TpWzXL2SluF/ACdKwDJ//vR0sczS
	dlp7itw01lxD0F0CYFvVxThG3wBhuSnbxhVD3HCV9DzZZwH9kFX9l0w2JiCQUvOh
	9B5OowQg2lXl+5sIheMW/+4e3m8E4zXF/O5piBworS15amrwo81Cl99TqwmFfXPT
	UxdW7ISqBefM7BMGUp2qga0M4hsnsK05gBLNm3AWfehEX8FVad/Q6GKSY9A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemja1s0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 20:07:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d94a158dc8so23346655ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 13:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379674; x=1788984474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nNFPGVLFvx/AoejV7EuP46spvaHGIWdJXEE92/o9lnU=;
        b=e05Qc82UDk5x62lqnblHwLLBwrBjcEp1h4bnKXAVHJCwZPhPRw/bqvPihDf56OP035
         7n782990WOypHFVzEf+5AcyQjrT67c7TMi4V64bJmy6nV9Jf7jp4am1RnRXFZ26hrikE
         PfzYnotbrSZi1vxVJrxq9FfNmvaj4xPQxO9qx7Kw61elrszKUlZadjHNYr6AbpruB36o
         Z1kzO38pTZj1wYbSwXYw3qZJ+iANC/oywT7Gn1qrpKg3jtmV6iprO6qKIYnvEHuSwjLK
         6gElHdiYafnVBIiyllK2OENkOxaHpLSES7kbvXJrnsW1yRSKPdjWSl12+8yKal06hr/H
         Rjsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379674; x=1788984474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nNFPGVLFvx/AoejV7EuP46spvaHGIWdJXEE92/o9lnU=;
        b=LdXj95tsbv//bueRnKlIyLvs4DjVwZZwuHLnJHwXa+PRDl8hQG/jm7/dhwPid13jbu
         V7REI1rT1mXXGo3fiA/FYXUsZ4oRIvdL4P+ak2LcvTvLh8WfKwa5WwMlLqjifs1ciUFJ
         8sR7DtDJcymSZ1u7peGpnBMZSxcIgNaZ6QAxPy2nOa0ooJIqvNUD0I5XfYcUVFrDuocD
         i9QuhZmw6NA6+LA7I9+wTv4+PyRis9kamauWa/KW3uyxXaCD3uG9w9ZWS5zSRP4ypR5G
         fKLEwF+xd2OAlf/lQYdmmgG85jlQ2f+VdTbZBvZ3RRrwwCM0zYLi+UnSdYv+IUg09wg3
         ugEg==
X-Forwarded-Encrypted: i=1; AKwUvBxNyv5srvw0Fbl7JxnS13P7zjmiBEBcUuvvovzrtT3Vgyf4AjPQJ99fgX42+yrUnGFxw87O6xTOhN3w72k=@vger.kernel.org
X-Gm-Message-State: AFuF++ni7CkJq6hzTeSrHvWh59+4Aa0dGtPR51D6oWQ4prHsihW3fz1S
	JUHS4CEVsemYEotqPgQniOFVznAVHX/aLZb+iWdGyHDyNRf+2vMHOxdBKOqQ2kmSZzpPe1k39Jo
	CMX0n1TCwSabLc4hjJQP2T3R6F60Rj0LNY7uEmfRSxfjr0los1aV7HS8tP9Csg2YxCJg=
X-Gm-Gg: AYBFou0CISKQItkABkcTTPsz7KzLi4w6+Iy8bk/9GF7VAq/TQwruU3XrDy48cFlL6Mo
	5ZuSWfVPHt0rCMW/o8WlycCEsOrE7BWBB7U0B3fl0Vx3y4I2lI6uAC3Vr/M6ViPpqc00aXibdYY
	hO9gIiiJIpcvW4oOdv1lX4B3V+yjDUmmxh+8GHyPf676P7MoSGnLQlN8wpNL4G/5HA5NHr0/AdT
	WxVTXbc47Ooe0NRPQGH+syws41VQBCinp7XB8zPXLsWFt+M/XbUVclr5v2qQxhP31ekaAArXwAx
	9ElTCY80ghYP3E/aOXqSyQvq5iQm4cNx2Rn0bGhPvcllj9vD91FvRyaeiKCfHupnj/+5b2CAst2
	mJM+2/php5pLBNiT/P3tTVtGdqRE=
X-Received: by 2002:a17:903:1a30:b0:2d9:2688:8be6 with SMTP id d9443c01a7336-2daec71ddddmr99505465ad.19.1788379673729;
        Wed, 02 Sep 2026 13:07:53 -0700 (PDT)
X-Received: by 2002:a17:903:1a30:b0:2d9:2688:8be6 with SMTP id d9443c01a7336-2daec71ddddmr99504475ad.19.1788379673206;
        Wed, 02 Sep 2026 13:07:53 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:07:52 -0700 (PDT)
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
Subject: [PATCH v2 3/6] media: nuvoton: npcm-video: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:37:00 +0530
Message-ID: <20260902200703.2016410-4-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-GUID: NHAKnFvKh-bLB1MXavc9KFlF1ECR2sSH
X-Authority-Analysis: v=2.4 cv=FeAHAp+6 c=1 sm=1 tr=0 ts=6a98821a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=iFm4xv_JmjgOdRhw77YA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX7AFd8azyb5iC
 xqXbqxs4utMOT+NTHXmD6f16kuj/jFto0Jwy8RaqWLXs4lurPpGmeNq2yxk1aIoo/+8Fmy6WJTN
 Tbyb4ou5xHeBLsdrHKhr7PGc4NJdkJ8=
X-Proofpoint-ORIG-GUID: NHAKnFvKh-bLB1MXavc9KFlF1ECR2sSH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX9cdgWJumIhnM
 YpPRNRDomCP7e8CKEjeBdd5NU0pyVJ84NA67qQ1fu2/nYl6FF7zMgXOWW6a9ivHSUueE+NG0vNx
 Y/nRTgOv0dVdyTGUJf62VN+ghlinhBPcKnqErV7E52yczoflrwY3aQtyRBCqjo96p7fWpw+Z7cZ
 nc0bKcfnhM2QWrh5BFm2+A6biLlBH+6LgWxFUQxCDUuFzpkjOJSk9aIL71y+ODqxmVMyljStq0K
 PcWO+FqAfb7TQvj3p91A0k3VGmqt5GkqEMWYQ1XFfUcsW8Mle/DmIy1Z2WkTQk6qBnW/0U2HQ9k
 mxRrEIrB8ECFWcUtRVX3cT16zkG9MU6vh9/qkvma561U1WvluAgvOIqjfjTs3PUW6RgZ4nvPVN+
 NYHoIyevhTaATE7pFi26qq+rPHuNU+/mEXLukevJpwkdjY4hCvRsXlpSSjSfrI4b48+Rr6iNezJ
 fKnRCJPjZVrbEoYwSTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020178

Switch to devm_of_reserved_mem_device_init() so the reserved memory
region is released automatically on probe failure or device removal.
Remove the four explicit of_reserved_mem_device_release() calls and
collapse the now-empty err_release_mem label into err_free.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/nuvoton/npcm-video.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 52505af35c08..6786736c8f07 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -1715,17 +1715,15 @@ static int npcm_video_init(struct npcm_video *video)
 		return rc;
 	}
 
-	of_reserved_mem_device_init(dev);
+	devm_of_reserved_mem_device_init(dev);
 	rc = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	if (rc) {
 		dev_err(dev, "Failed to set DMA mask\n");
-		of_reserved_mem_device_release(dev);
 		return rc;
 	}
 
 	rc = npcm_video_ece_init(video);
 	if (rc) {
-		of_reserved_mem_device_release(dev);
 		dev_err(dev, "Failed to initialize ECE\n");
 		return rc;
 	}
@@ -1789,13 +1787,11 @@ static int npcm_video_probe(struct platform_device *pdev)
 
 	rc = npcm_video_setup_video(video);
 	if (rc)
-		goto err_release_mem;
+		goto err_free;
 
 	dev_info(video->dev, "NPCM video driver probed\n");
 	return 0;
 
-err_release_mem:
-	of_reserved_mem_device_release(&pdev->dev);
 err_free:
 	kfree(video);
 	return rc;
@@ -1814,7 +1810,6 @@ static void npcm_video_remove(struct platform_device *pdev)
 	if (video->ece.enable)
 		npcm_video_ece_stop(video);
 	kfree(video);
-	of_reserved_mem_device_release(dev);
 }
 
 static const struct of_device_id npcm_video_match[] = {
-- 
2.55.0

