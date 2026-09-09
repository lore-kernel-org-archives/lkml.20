Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06611568526
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965893; cv=none; b=XIJ9Xl8xDvxHgifnH1DoQYliJKcc/wUcqdlRomyk7fupC9JwU0nWy3xIagy3Kdm3doRw6myOWwJdgSlwMMGgADrJZo04XUOwqvU0hkHU2fR+DuwKH4orjAnl2q/9NRGzReDT0d5Os2D/u5jB50eUH5/1sa5MiRnOBlSgU0HcfN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965893; c=relaxed/simple;
	bh=2XMdrsIUb92+YcGk/72FitFJ4xeAJql1ugC0uKB/yVY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tVFUZNILUSt6HC3IDML16g5d8DERKVXCthougy0YFVKuxE5YbGWgTHnsFs1ECfXlCOIthcIjrTTEqp9jMvwNCheeRXVz9Gc+vT2FK6h4htLdg36FNnYN+t0JkF1eA2Ksi0ogvlnKxcndekZlcTK+zQxhhWxbIhnFXwKVQ7xtWwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TZlbeVFK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LGbSig/t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TZlbeVFK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LGbSig/t"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU1gs1810006
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 14:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M6iRa0ga0M+/AMP/mz6QHW7CHXaKEVGssFfyq7rC5RU=; b=TZlbeVFKU147Giq6
	ruFgCKqTD/lUSbHGFfhV3B+R9BznvoclYemXbORvHP3CE610gtDocXLtMlg0cwWY
	Sby9FkB8BjKbi/Qu+cmcmS+u03QGH+qnIBgYxlHSDolZWxaWTRFXLm0C6CoYbT6O
	b88WEl2nVwijp5x2gAjEuNcarV/8Iuhi9oNjXItr660rsyRnxk0eqWzaMpAbzRP9
	HUalkoMHxEJzwf8ONzAQyV3urGRzUrLrOVQP8Z5OcVpakFJJjDRaUhyZGUZSEAXt
	TAgJ+rfmjQuUcdfgsoOZe/bBapcV/IWdMUFlSTFSrycqQO1YP/7gGgrK6RiP79Do
	Fr1rJA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk4xj19eh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:58:10 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso7206096a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965890; x=1789570690; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M6iRa0ga0M+/AMP/mz6QHW7CHXaKEVGssFfyq7rC5RU=;
        b=LGbSig/tLxlq4sH5QlPH20WeUs2wqgwDlOfQbJP32/SOxPCsWmVdiQG/LzRclJrGOt
         +DNlpN1/fVVD54w3ALdy5ro5Q1CKK33SFlC9AgU/B1z6i5TIKxTWOxIx4d9AE8rhsZyZ
         KZytJdOXg1xX4+BwLf16peBnbTxF/sR7c4o1pAWB+Z2wEfDGHOLxfo15O9J3+Is+2dvp
         WwnjTeW6lNsjabhGuAct4yZp9BaDOXXfX2KfWSb+VDeOA9TmL4kKO8L5/7sLkWrBXe/+
         HxQQWAqyhkoW7dZ2lLslVI4iBOLxcRPTQJTMvyAZIqpVHtoCsk91w/3KJHiVe272vN/R
         mP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965890; x=1789570690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M6iRa0ga0M+/AMP/mz6QHW7CHXaKEVGssFfyq7rC5RU=;
        b=Z1mFvYYVtMh/MXNyoQrb9WDLiAnbKWtyVHqUOmN4E/5rFbfE8P/BLoCCnQrm1wBnko
         xitBHku/3JY1nHKh5QfptZS6yod8V51KDDxHdIs8zjvky3np8fiiqvLcOWHHSEd6kl1z
         I9RnMOB1u99XDrgtmOxveNvA8J+pxyKRQTbXAHUM09joA8XK+bmdkU+trR/bpNHCr6aV
         opaQkUTNJji8uqVB7dexoUywZ5QOM1bfJByeS6jeh86bDIMdYUZD+MMjiqL4vt+8R59J
         stiM1nodjHmhzVVz/Xb+1oGPhA8PYlyD/tjLF0VobukZ5+sOsHvY2EPRHUn61s/8AZe2
         KfCA==
X-Forwarded-Encrypted: i=1; AKwUvBwauDK8mxsiAqVXAA0Kv7U9p6C8GZr+CnzNzKKpbysYXJ06d3hTPRteUGMsLjE8vCBryb6UfLlCP4nPVWY=@vger.kernel.org
X-Gm-Message-State: AFuF++nh4q9ZaogL111UpDsM4ZN8/QTLINOqh9Y89rnvzUfdrnUqjk6I
	lw5lBcgR0AtRrfjrE+q1QMgdARLb/6SsBn4OSS91l2yOW/U1RJnHKn+xm0Kv8KmeTyqDvqT1VQN
	znLqy/f6xYlBfX3xHu0VdFMwTi4vSpkS52yXltgU8RUR+ASKjX49i6cS5Vc+S8oGHfQc=
X-Gm-Gg: AYBFou3mlQxdP7BRYta9Gb6tmEjtjZytQJQr0PxPDtL7Fbwxe7n936DlXVjvRGvxgnM
	JhuLzE/Uj5SC/t7QOoMMCZXV2kCxuLZQZCIUdxw3YW6a30IsxS57q/WaAFNAdm3FIrckwqJc5Hv
	9sGMPPBc+H4LKJj9JzYZ+PqTq5yqaoSb34sN5chHHBri+xJNIdYD2zbmwQ2EhgnTzBKkqtGQBCY
	AcPrjEH3tZ7WWDh5U70Z9+5WNRx9Jz+xiqG4zMoAXyYrbFXpGstpLeyS7cB8dyLlOtEinJcVmYA
	8FnSQI8AJTmh4koJm3QtNqJRRayT8yb8+aysD0Wm29qje4Jw+6evHQIslB7WPA253chPiYJGHwn
	X6HzYvrGt7qYwK0Xze3fTJM6gttvuE7zURSs=
X-Received: by 2002:a17:90b:4984:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-39b26104798mr48890785a91.6.1788965889539;
        Wed, 09 Sep 2026 07:58:09 -0700 (PDT)
X-Received: by 2002:a17:90b:4984:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-39b26104798mr48890710a91.6.1788965888914;
        Wed, 09 Sep 2026 07:58:08 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm51270766eec.21.2026.09.09.07.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:58:08 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 20:27:12 +0530
Subject: [PATCH v3 05/13] media: iris: Add non-pixel and pixel context bank
 devices
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-vpu_iommu_iova_handling-v3-5-2fe43ae45495@oss.qualcomm.com>
References: <20260909-vpu_iommu_iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com>
In-Reply-To: <20260909-vpu_iommu_iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788965840; l=6051;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=2XMdrsIUb92+YcGk/72FitFJ4xeAJql1ugC0uKB/yVY=;
 b=PHmoiKXPJxt91Cg6YlJTHp9NCdRleO9pPr7DdHc6zhNOm5coV98cXKfouPIM/UGrr5dUCYE++
 W6NnuOj29MoCciL7xysW4T2N83keBmtBUKQW4wyuWpWBJqjiHdmRA1w
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfX1Ow8GC0iqLhI
 znE/3RpQO7OR1D5cAOBzXPeHanmlk/Hi3guvzM0dtyA9xIjkVvRcbcajKVnZFpd1DxPL7WKEZD/
 soO15qqdExyJXuTO8F3eb4teEJWIXvM=
X-Authority-Analysis: v=2.4 cv=J52aKgnS c=1 sm=1 tr=0 ts=6aa17402 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=e5mUnYsNAAAA:8 a=t9ty7G3lAAAA:8 a=EUspDBNiAAAA:8 a=UWePQM47DRlDhC0KtsoA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-ORIG-GUID: vbQ2vqagG-Q50H2MWK8yAxyXqzzwep_A
X-Proofpoint-GUID: vbQ2vqagG-Q50H2MWK8yAxyXqzzwep_A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfX9eI2A1BTCm7B
 PE2mooxttAnBxB0T/TBg6OTX9SIS9RvznZRyoBZNrM8jz66K+xxhtUN3PU27+nIMkIjQeGGLgpM
 7oqXcAfPumNZ/GHCi0D1+9oLc06NHDCRkdHR+T7xiYzNdzfDJs16itmguBTXeZ7EddftMHdZUfu
 95o0+l314uumuCvEGjMOxZHFBj3bnSArt9tXQmXOWNlesg5xat1GFMnpH3QdW/11N64lv1FF//m
 8RH7zJfiikoM9QwIrSWsBmq66tqEBM8CHDoILzczeEOKLvYQICa5hj1P16dUaRgum4TmuOjiPRx
 hP0PPwmY+pqaiH6OlEXLOewQlZk2V0ICgXKAq4Rg7nSy5HFljTiyvQGE4SCkvwlb9hTcH7+1trG
 B+y1UaDsfriKJyduMltLI9EN0N5TV12OYgToPcgDfstZvHIioyupUFs3XHRnntj8ZI6pTLqZsy/
 ne2qr6/X7GY2y+D/t8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090167

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
cannot address the low 600MB of IOVA space, while the pixel stream can
address the full range:
    +-----------------------------------------------------------+
    | non-pixel stream addressable range (600 MB - 3.5 GB)      |
    | 0x25800000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | pixel stream addressable range (0 - 3.5 GB)               |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
A single "iommus" property on the video-codec node puts every stream in
one IOMMU domain sharing one IOVA allocator, so nothing restricts a
non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
that boundary the hardware faults, which shows up as unhandled SMMU page
faults and spontaneous reboots:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Now the device tree describes "non-pixel" and "pixel" as separate
context bank subnodes, each carrying its own "iommus" stream IDs.

Add helper functions to create and clean up devices from these DT
subnodes, and call them from iris_probe() and iris_remove(). This
applies to the common probe path as it is required for all platforms.

Set the context banks before v4l2_device_register() so the DMA plumbing
is in place before any video device is visible to userspace, and tear
them down on the probe error path and in iris_remove().

Tested-by: Daniel J Blueman <daniel@quora.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.h  |  4 ++
 drivers/media/platform/qcom/iris/iris_probe.c | 71 ++++++++++++++++++++++++++-
 2 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 24da60448cf24820af7947b85eb7208555ab7786..3c96f46cf567b2802148b2a7cedb8488b6b9468b 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -36,6 +36,8 @@ struct qcom_ubwc_cfg_data;
  * struct iris_core - holds core parameters valid for all instances
  *
  * @dev: reference to device structure
+ * @np_dev: reference to non-pixel device structure
+ * @p_dev: reference to pixel device structure
  * @reg_base: IO memory base address
  * @irq: iris irq
  * @v4l2_dev: a holder for v4l2 device structure
@@ -81,6 +83,8 @@ struct qcom_ubwc_cfg_data;
 
 struct iris_core {
 	struct device				*dev;
+	struct device				*np_dev;
+	struct device				*p_dev;
 	void __iomem				*reg_base;
 	int					irq;
 	struct v4l2_device			v4l2_dev;
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index e4acf4a74f944bcae83089ef5489f204d4b0078e..debd1f0e57038d7abf463e82fd80f887b67750e8 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -150,6 +150,67 @@ static int iris_init_resources(struct iris_core *core)
 	return iris_init_resets(core);
 }
 
+static struct device *iris_create_cb_dev(struct iris_core *core, const char *name)
+{
+	struct platform_device_info plat_dev_info = {};
+	struct device_node *child_of_node;
+	struct platform_device *pdev;
+
+	child_of_node = of_get_child_by_name(core->dev->of_node, name);
+	if (!child_of_node)
+		return NULL;
+
+	plat_dev_info.dma_mask = core->iris_platform_data->dma_mask;
+	plat_dev_info.fwnode = &child_of_node->fwnode;
+	plat_dev_info.name = child_of_node->name;
+	plat_dev_info.id = PLATFORM_DEVID_AUTO;
+	plat_dev_info.parent = core->dev;
+
+	pdev = platform_device_register_full(&plat_dev_info);
+	of_node_put(child_of_node);
+	if (IS_ERR(pdev))
+		return ERR_CAST(pdev);
+
+	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
+	dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));
+
+	return &pdev->dev;
+}
+
+static int iris_init_cb_devs(struct iris_core *core)
+{
+	struct device *dev;
+
+	dev = iris_create_cb_dev(core, "non-pixel");
+	if (IS_ERR(dev))
+		return PTR_ERR(dev);
+
+	core->np_dev = dev;
+
+	dev = iris_create_cb_dev(core, "pixel");
+	if (IS_ERR(dev))
+		goto unreg_np_dev;
+
+	core->p_dev = dev;
+
+	return 0;
+
+unreg_np_dev:
+	if (core->np_dev)
+		platform_device_unregister(to_platform_device(core->np_dev));
+	core->np_dev = NULL;
+
+	return PTR_ERR(dev);
+}
+
+static void iris_deinit_cb_devs(struct iris_core *core)
+{
+	if (core->p_dev)
+		platform_device_unregister(to_platform_device(core->p_dev));
+	if (core->np_dev)
+		platform_device_unregister(to_platform_device(core->np_dev));
+}
+
 static int iris_register_video_device(struct iris_core *core, enum domain_type type)
 {
 	struct video_device *vdev;
@@ -207,6 +268,8 @@ static void iris_remove(struct platform_device *pdev)
 
 	v4l2_device_unregister(&core->v4l2_dev);
 
+	iris_deinit_cb_devs(core);
+
 	mutex_destroy(&core->lock);
 }
 
@@ -269,10 +332,14 @@ static int iris_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = v4l2_device_register(dev, &core->v4l2_dev);
+	ret = iris_init_cb_devs(core);
 	if (ret)
 		return ret;
 
+	ret = v4l2_device_register(dev, &core->v4l2_dev);
+	if (ret)
+		goto err_cb_deinit;
+
 	ret = iris_register_video_device(core, DECODER);
 	if (ret)
 		goto err_v4l2_unreg;
@@ -306,6 +373,8 @@ static int iris_probe(struct platform_device *pdev)
 	video_unregister_device(core->vdev_dec);
 err_v4l2_unreg:
 	v4l2_device_unregister(&core->v4l2_dev);
+err_cb_deinit:
+	iris_deinit_cb_devs(core);
 
 	return ret;
 }

-- 
2.34.1

