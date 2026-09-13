Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E516B3FFF9D
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789325428; cv=none; b=a/4MADA35p4kGyo/IbRnyNCucpwofEuocs8sneYd6mOuBavvNAwQj/Vsf6b+Tu/iiZWwvFJSrYEy0wX4sLGSIuAzNUbnunUkZsY5MNe1v+kMluGWkXQPRseVZ8lqmhTbpq8HMSfd7ILHY4PY7vb+emhWyX+4u6CbDBSowq7fIWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789325428; c=relaxed/simple;
	bh=foRnImGSZ75lU1r/edBBVgqmVHY1e0szEa/Z/AKAvQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lEVzGOq9SbZc8SGVSaXjPwakvBmXevEWvz/JWu89Qkdxlzxwx5PB2P5Q0VZG6DL7D+lW+hPDrelflGjbAxEKQSVwDT+RiVCA2BhB8FOq2Ae6m7fXajc5mz17d3j6B8N+0o+5QJyzMMf6Y9NpBJiVpLF0ZxlV/t4qavxM4CILCAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MGBdtJNP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TI/cIjSA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MGBdtJNP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TI/cIjSA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DI2tbI1192990
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:50:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dbz2UkA+ppLqVOobr/nxngPFs17FSqKR9v4iZOMb5x0=; b=MGBdtJNPFvOe1AtS
	12hXAUcOzZBXY4Qyc1T/pshHpIljnYwW7/AWZ2OF/9UEKWzLFzmkBQn4FILS9QiM
	SUc4QnkKc37RGyJKKIKtSPDmZlrHkaQlydodVi7pNt6+4L4D12ehiFV+2atxC1gb
	p9YqRZH29zyrNtDZKabbLy++r/S/obfxFBINh/QIoeSkdOx16/VEb43RibLzAzS4
	mH38pAdz9WuacmhcWXT4M6Nkmdv7unvBxXowcgWeaEGWP3TYvpTkQVAL7ft5JSVF
	eM8/P9KNb/N9MfuPudYSDh2d8r3fCfoH78+2CBhfz+JbCe+J8FwBFH7f7T/XK/GQ
	E6FqDA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmywh3t8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:50:26 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1cade6b71so2137437a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 11:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789325425; x=1789930225; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dbz2UkA+ppLqVOobr/nxngPFs17FSqKR9v4iZOMb5x0=;
        b=TI/cIjSA4D7TbmH0CK6X57qJxkEZi8811a/PIsWeXmgCpFRfJRLF4FelzTkS9a/EVw
         Hd2DdwJz/ByKVSJYNOFF0a+CE3ShTpHJNvUKBuZ5QG3r+8S6LOOMpUeyQ6hhSCQE1jzb
         XQVOb+dts56MirgEj2ysbtucOZL8wcomb7J2KLSWneQ5AC4t+JeBnBwj5SQnNxXBcCx1
         ob+vxFuXAo/IRhJXtVg7bwZ8lQF/QF4BtGqi9HR0sPNnnPrEw/m+zs909gPRlvHI+4DG
         oOhN5J/N9zdLeHEQGZAfYnqzyRA0tBNbeJvkhd3wp0DXtQ/wo0NJ5ARlfA5d7/a1sypg
         uCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789325425; x=1789930225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dbz2UkA+ppLqVOobr/nxngPFs17FSqKR9v4iZOMb5x0=;
        b=NZ00OcVlcGLknwVtbYATBpPrmK1jSiAEnNTRBZhoA/YpthogAzluA9NrikeO90u6DF
         Mw2NbFlQC0Za97S4rVc9Y+u+0CJhF7T4YiIbR+60Tbf2LcYSbsF62Vfb4rXViTmEr9Gf
         T0ahew07pPF8jQ9Ex9jC3h0kmJh0mHiVHoLNmGAgy0epN0X5ToujOwxyb9rviyxxQyB8
         +2Pl4GbXFOsIEmE19H/5oB+zJU+aFTKeqiWRtRU2ilFy+2tTP66PVXmgcWZkcFenDkfW
         Jtt8G7gzX2HYMy2xXN5pdTHoSU+IH/VOxGf5s/zeibDHPcJ74Sr3XK1wNt2f3TRQdAqh
         WJGw==
X-Forwarded-Encrypted: i=1; AKwUvBwEQf82Wa74OpZRWigRE/y3X3UNokEBR3iYy3uolvV5OTSiupgKIP/f7eSJhKEbUQxjwRfwWQ6F7dTey2c=@vger.kernel.org
X-Gm-Message-State: AFuF++l2XBZz97hWIjAN0WWppqhmmxhGMwMrIepgP9tgnJZfpE9mRn3K
	caEPN6/SSpkdJApnJZYa4TaTmVXpIQPy3IzYl4Z3+WvQXquKrUrOv8OehVwEe793rFWGL2HaMPN
	8kALu1tlh350LcQhmINi6jRCYEFIXVjibXf38kAPphsfCfKZ4fNwOKyaJc/urrOHkOj0=
X-Gm-Gg: AYBFou3VO/xHKg9A8/SwlDjP/9tRNa0DgG7vccjSAyYk0UhjNh9LrkKn1sgPUvrKhG6
	ZQalwPgZotOil0UV8xn6FIiFWvyXJvuH5nIxCiqOYykon3nO2uEsVZ71m5e9Ff7W36njKxH1Ywn
	MOL71T2l56ZXiOc+1Nwml7DLkzw+51t+z/E4nBAK3nkOxxg3/FPCqBtUBHMGzBcblSvZBxGsImc
	S9Y2M9ntiFpv3EIF5uJEuiMM4QJqt/zsgzaXO0bLkGntp58qKINSwgbiWpdLHk6kI/WqjOIiC4I
	alvuQwHS94Dozmi1Lw0Sc7WgI5Pxs8B5iK28TarC8zDAcY6/zaAkTuanhfZeOBG9pnJRD9L4GOB
	dzW+//jUokQsx88GnrWV5Je0t8mBHDQeVAu8=
X-Received: by 2002:a05:6372:a703:b0:3bf:8a0e:dd99 with SMTP id adf61e73a8af0-3db26e544f2mr3652660637.17.1789325425525;
        Sun, 13 Sep 2026 11:50:25 -0700 (PDT)
X-Received: by 2002:a05:6372:a703:b0:3bf:8a0e:dd99 with SMTP id adf61e73a8af0-3db26e544f2mr3652619637.17.1789325425071;
        Sun, 13 Sep 2026 11:50:25 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm22473130eec.24.2026.09.13.11.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:50:24 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 00:19:22 +0530
Subject: [PATCH v4 05/13] media: iris: Add non-pixel and pixel context bank
 devices
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-vpu_iommu_iova_handling-v4-5-9b9074a73c41@oss.qualcomm.com>
References: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
In-Reply-To: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
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
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789325376; l=6003;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=foRnImGSZ75lU1r/edBBVgqmVHY1e0szEa/Z/AKAvQU=;
 b=7iP01YumWQ4RTSsHPLURYioMXAP6EhN2fZAqMRwVLVthIFnByJuGbB8kd6k8z/kAZ2LKZBP2D
 ir4fISCg+DDB251umHmR4xQxe0w8RSlJlZbbEg1YxtrQGe6VkofSTlw
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: aO2xwyF1jovS9uUxsHF_bu3wjuZaPWT4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfX0sYL9G7s6LBk
 6nr8v7ovwLaDznbKjRXqpEdcOVFXKY6ttUZ79/F6E8NxIW3jg9VQ8mIjnBLkrju951PL8asI6X3
 JK9g6BExgId52TCXijv12RZoeHUHo4Vi6Ml5YZH9Y/6REpgz//7iHFCfMtlN/KSSxOkyfJ/J/i6
 Dwjg8HY2idA0yqKjUwwcPJWFPGFCjb/981IQWkBA4tylcBlBtLhBIjGASUvnNl/o9VURyqhsnBK
 e/r2GZYM9nswBeGIpRhvQPUl8poCEoy2UiAoMGIAiVPyf8LjNS6RhZmLpYGVrcaYtq3jS7RBrQT
 iD7/0fnGOB6IAf9ZoOcYyar16i/1FZ1btJc5pMpV9e1LRkGF513PDcSmxjblEZyz41TJPPj/63o
 jmC+AXu3ILJrCBAevVBiAouawV613lejDBAqEdz0D2+AM4AdmdzPWaBGrPdnUfYyVR5ciNUtLId
 ImVCNL1KTA4fnx8EQWA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfXwnNf//CUPpr+
 O3byoaF4KsJSMgzQzG2Pz0kwKrTafGOVWDM7tXsYN+bPzNqIJLWrT2DYXRmVj9Ukgt+kmKqvvQT
 swCocQ3kn4QbmtIcTj3nvx3eBHiw4DE=
X-Proofpoint-ORIG-GUID: aO2xwyF1jovS9uUxsHF_bu3wjuZaPWT4
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6aa6f072 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=UWePQM47DRlDhC0KtsoA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130267

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

