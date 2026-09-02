Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D253AC0C6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377638; cv=none; b=YHN5PvqS1GfEXSukz/IBVbS771kG5WdcrHbhIk2coTomGZ/yZx1bqyD3u/W6FV0P6mbq3qMSZMwiqCUSkEK3iwPN4liMM4N02pIX7oRwojB+nsRechCQiV2LCs5KyndYb7HBt0t4wPaUkVycui6I7VSJB4DBWSCqHuMZnVgy7f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377638; c=relaxed/simple;
	bh=rm8DC9QOlfM5daLVRMrheq5OPY/pvJdQBbcXPHpZh14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MScI+Q19OnMi57yNbfyf5QpheuFWA5MaWJBXLlASZra2vExBWHJs/CgPyTnmtWUJwla9lA0b1wdY32svIy7KaCksISWhPCcWENAotjXnHtynRiSL2kLeR5l96qipVXyoCIGxvxf9R/Xcjdm7MFH93VzoLg4+bcBSl4HNtQ/6rB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QgD99kG0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WcgjieD4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QgD99kG0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WcgjieD4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hqsbf1650590
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 19:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cozdIoP5Yma
	6q/pF6floHEABg0dCfb++OItRBaIe7/w=; b=QgD99kG0wNh+lPLXjVw0AF8oQHC
	bbrXfNjcM36t7K13gEgas+IHgz/ipLijzu7HwowfH0fez9Uy+9ZbNZf8hmitV5ZV
	4DtmTL4/rV3Y0lsK9gitYztOl6b+6zozAqCjcA0lccusbv8QwBwdczkzFf5NPUcq
	TayVFZVN7X5UuqBkswz0f35DIUFfFjVCdyrO4pmbKxIXiZbOo2FiJZWiBaKouhUl
	Ez+Qq2/BNBOqOTxKHrRvY7IUphHTanNYkgvzfpAUJ5gzGLcv763/YiPPsmdOKCi9
	/zovSKs3FM8OymU9PjQEJsVlrZdAnYceZXH0JZcj2S523Y1xhe2wh+zJQxQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemj4sm6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 19:33:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39512608fb1so3465163a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788377626; x=1788982426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cozdIoP5Yma6q/pF6floHEABg0dCfb++OItRBaIe7/w=;
        b=WcgjieD4/ekUEpqHOTGIC6TDiM54AHHFTQVpTLJCGKrLX4oIYKlf9ZYM/dfYPoTmvc
         OHYlF3RlsLMZNcCDrWrVbqdtVW1J0E1M0C/QjtMwv545btjHRZ5esHFAbtFCiKuJD20I
         e6nERJy9w7qVSQHYJZRSwjmQ6aNlWwlOFVIkm814bYWCYvkryo04KuBwkm2XGD58C2Nl
         esvtaTY2EmlORhpop0emZMeHmhCL66v2QuM05NPDcnyJXZUkPUUyn9z3xL5g/G/GnrTa
         XQzMKioeksHEdi29KAPFT2QDQm95LeT8gJlwc2esDCFo/yIiFrLC4brsSBRuVf5Mk8Bm
         hOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377626; x=1788982426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cozdIoP5Yma6q/pF6floHEABg0dCfb++OItRBaIe7/w=;
        b=oxhk8WggB2EjRBPVqVOCutlMN8d3F48vdcFtjRhMWlyhaYK+a9lwbSDaE1KoLD4p3G
         wOkshqc8m6Qit6la5f6IOKb+bhMeLPqJoLH4GnJ52B/RGtiF2yoBXYNEo2y1OlIvvcNG
         B9//oy3pD4Xlrmbw3lkeuIuvyqRc1cIhTOoNxQtBTkwuiaoFaZqIcA+RT9ZBGGWmapV9
         BvhqxNnWVeUIGje4GMloQsm33HzwpF+HbHer4GjYSQpSHy5EukoANYklkamH9MHmraZa
         qAenwUFrpTJ1Q/wXB2NFEXC55Mj/XKNblShbLyMpZXsyeXP/TwQuh9BQCF+YRQZeAz7n
         s+Qg==
X-Forwarded-Encrypted: i=1; AKwUvBxLDb2UuAsQNSK0qSC7uAlDKGX+Yy5+hM4u+W9RX5Qzhz9IU+uZLnza5Whi0txP/Y5WfOLbZEYgILUpOYM=@vger.kernel.org
X-Gm-Message-State: AFuF++nDJ/QcqzyngTm7ELgrw8+s0/XzFTO7U9aPhpV1Pv55ffR3Z+nd
	NxkZwPHVvb+KYPAQhLM3+aloaDp5hm18iVxBv5Bi4SxtltmTILLjCf5/IcBsZ2DxAizhbr5Hd5g
	5mP3bn2aFcI4FHUCVKK00kkmDqzm9iPXYw5MhqdIasGW0JCTb4BIGMcxSKDePTTz2uXA=
X-Gm-Gg: AYBFou2WUlEyBGqrnta4phgcBVoT5DXkvK0vBaKWD4nGt0T/spG8RtFklSHIoulrj3q
	9O8ZK/LgRzevzrX3efTGGILf9WPmVyVK53CyZCuacmGf7VCTpTKQZ1RfVSJ4AbMX1SnLMXHN+WG
	nzYatpv4SAZ8TzGXnMwzwuZ4ccBHsPjFnXfWwrnzhUb9UBZBs3DGc9CYHOiMVVXzJPdO5E6x68c
	iVGieslRiEbMVlsByHihUC7o+WnNQ0GxSDbT5Tw57ABMaweclgrtNAwiWdc5NPhSIcpslXqGmLe
	W0aKroonM5/60GTOZMtWs41NplmtjJrw0HxPrTDzbv4XAwb6FmwjHqOd3o+hiYSKEQAIv1t7Tua
	KDFhstd90uqf/MpSK299MqkK1GRs=
X-Received: by 2002:a17:90b:2785:b0:398:9be5:b41e with SMTP id 98e67ed59e1d1-39aee285570mr11809913a91.25.1788377625936;
        Wed, 02 Sep 2026 12:33:45 -0700 (PDT)
X-Received: by 2002:a17:90b:2785:b0:398:9be5:b41e with SMTP id 98e67ed59e1d1-39aee285570mr11809857a91.25.1788377625511;
        Wed, 02 Sep 2026 12:33:45 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-332501e5447sm518103eec.0.2026.09.02.12.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:33:45 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 4/5] remoteproc: mtk_scp: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:03:17 +0530
Message-ID: <20260902193318.1996827-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902193318.1996827-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902193318.1996827-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfX6t8yC7VwG215
 L7Ib4TwnooMGdID7N4zhQbVAv4O5nkPjPvBYO2DptaAgt9ccPVN2LNkkZok1/rA/3mNgNAYUfvy
 4/w8KrO7u9Lge4lHYw6NZ48Tgpazqu8o0g4BfkcUx+If7wL6KZDPD42VWrNdjKHQv6a/vPsIOMd
 szrefAEJAcYOxikzoF8HA1Y5YwxeGpTD6JzAGaeVTYJ8WmjzFLWibYk8nHT5WWfLUsPHjWvMKEo
 37H1fmhPZ7A38fhxVKXa/gD5GlfaZvMBhbMrtubN33Lp/Tf6oY5K/+zSQK0imWwPVDr5agGWuvN
 qLg+xLif568al/JNS5MFlYQZqSpe5DDQb8hE5fpNLXdzPHxUGVd5D925xgF4OZ9Qdmz9Tan+vdl
 QJCA9jgYrQT39wHse87PhG/yZ/Lm7sdjBkSfQXX2KtULSCShQGTyxic7f9NLkYWakoAb2BhPro8
 UeklC1hZC4+u4RjbICQ==
X-Proofpoint-ORIG-GUID: J7YbFx8IiG2ehQORlFxE4RxGGXdZKy5B
X-Authority-Analysis: v=2.4 cv=MdhcfZ/f c=1 sm=1 tr=0 ts=6a987a1a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=PC9_zsTzMDnykp_yU_MA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: J7YbFx8IiG2ehQORlFxE4RxGGXdZKy5B
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfXwXjmlP87IUdk
 97uW60k69upZwUk5YVDoGYe26sw74wjPPhIiIUMW/n9m92WVIHhfozwpeD1vhHtwXML0yuNHrkf
 J1Oq/y/OML27KpPwBGZex+BQNAbDsHQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020173

Switch to devm_of_reserved_mem_device_init() so the reserved memory
region is released automatically when the device is unbound. Remove
the explicit of_reserved_mem_device_release() call from
scp_unmap_memory_region(). The DMA coherent buffer is still freed
explicitly there before devres releases the reserved memory region,
preserving the correct teardown order.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/mtk_scp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 9751acc2bf83..2a6c286b86a7 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1034,7 +1034,7 @@ static int scp_map_memory_region(struct mtk_scp *scp)
 	int ret;
 	const struct mtk_scp_sizes_data *scp_sizes;
 
-	ret = of_reserved_mem_device_init(scp->dev);
+	ret = devm_of_reserved_mem_device_init(scp->dev);
 
 	/* reserved memory is optional. */
 	if (ret == -ENODEV) {
@@ -1067,7 +1067,6 @@ static void scp_unmap_memory_region(struct mtk_scp *scp)
 
 	dma_free_coherent(scp->dev, scp_sizes->max_dram_size, scp->cpu_addr,
 			  scp->dma_addr);
-	of_reserved_mem_device_release(scp->dev);
 }
 
 static int scp_register_ipi(struct platform_device *pdev, u32 id,
-- 
2.55.0

