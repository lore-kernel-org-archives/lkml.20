Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D8E391E74
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790404511; cv=none; b=WrkoJgCoIav6AhH7CoWTLzV3U8t5QmlLQ3dnv3UfPx3YCa89TYXUx0dVySZBriWMuL0NbcrIp9gCZ4mJxafAe6Ugv9FUjST5w43Bxl416ClEU5ozx67MLHaf0KQ0oW6UqY4x4esyIvf0GEE+pOlYZx9TV5TXptYHGWtcsmi5ckg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790404511; c=relaxed/simple;
	bh=foRnImGSZ75lU1r/edBBVgqmVHY1e0szEa/Z/AKAvQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mSBqKpE0DxeSM4qhxy4oAqaHTeQIk7AZduOj2Kz6Z9C3E0MalUdmjAPCKSOzSdJPp3BJz+8FtqNt5kecS1zGzjo/7XUqrf9KUKP4tDWJKxOoakQ4bRE7xzJ/3HpclcAZW74/xljwqMPUL+P4WoWiaJyn2+0sk5K37/PDpiXTJa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zr2McvhF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RXHMKXVB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zr2McvhF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RXHMKXVB"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68Q6P7hA3746470
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:35:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dbz2UkA+ppLqVOobr/nxngPFs17FSqKR9v4iZOMb5x0=; b=Zr2McvhFtDTZyCti
	tSxfK6z+ga3CiHMFXOgvRmYoBYUHG3Qq9wBWlkcHWkpQ5C1uQ/huma3BttG9X1Cc
	ZGx2VaTUweSZ+hzPFoxCWzJjMxA6bnZGGMH7nBFhD8PPcHJ90gXMCd03OBCeQCB4
	ZrfYl4PjK5DCyw01w2BC4irSB4vArensd9N86QwqeRI2zKnfCXs2/QlMVQiS0rYY
	yXlMiykpzd4LX8ugQitilszfI0nkPBAKJs/OIhEVPAfSiVjh+/8kxar69zC7i2G6
	0iFNcdXsCt4SXhVN3spxcgAIsqBag13D74gu620i0nFGrwS91OMUiKZPZvR8BBX4
	Bwf7Mw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx526geae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:35:08 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-142f4306744so4710625c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 23:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790404507; x=1791009307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dbz2UkA+ppLqVOobr/nxngPFs17FSqKR9v4iZOMb5x0=;
        b=RXHMKXVBiB4SqxESiLGsu5gNTpvMo7uwHaNuuBHgQrBjHBJ8iA2QMemdZWGPVBmlsh
         ztLrdTsPlBNSpVGSY2U6V2eTJIS9How/DFmcMtbjcToovscMtzSUNOLK58jlFIg5xdWr
         MrRiYYfYN5CNfspznbs4VfG0u6meD2hY0lt3dS4fcfr1t+aDOqnHTSF/EmLnE7ewlQR4
         NAzt5DfDqNh/bcBdxbNJG2EX1lAmC2Z+qSkPHj2Cn397cTt7Kv2zTn/PnVwa7CS9fcud
         hr5p8ErF51YWPVFJT9edbyU/CIjQNm768dj7EDs1GJuO8J8vymteh/cY22iHGynQcbRy
         Hy8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790404507; x=1791009307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dbz2UkA+ppLqVOobr/nxngPFs17FSqKR9v4iZOMb5x0=;
        b=rA+QHGelZV776JQQSOGcnCBp+aRqzo/pKo/i3bdSM0H1bruqxATTYvexPwl8dEJNay
         E4qecFnefKmrd5cs7q23arNWg+S6mXSUowOYpxNLtZZRJOkV71kYKleiQ8fdx2HCJzkz
         zR4n9pPdIh0ao3hi2UkDjT6Gi8SnHdEA/HFutHl+acOMXoV+VMoYaAhWhrNCiy2qoqpA
         PkmWBJamZRLLPqkpIZ5EtqDnDhEMMOn0GKGqhuEzNIbE/SwKSdtiXFOG/pzd9ZhiCQZB
         3tEwlHlw/IGTJcLjrUt7V0cnQk+KLrs3REZXf2nda+JFlUffktp7VUl6QI88ZI5O1sCN
         Nu9Q==
X-Forwarded-Encrypted: i=1; AKwUvBz6jg8izWYX5OL/cRJdYxLtOJXS3awDGZ5wVQZovFd4VR+cB7I3l4sID7LYu3oDWbDi1CFv5BK+3x87jyM=@vger.kernel.org
X-Gm-Message-State: AFuF++nrsz91hQPAjtK5NKJYqK7YzKElzude6vsdaYgXYLG6FCQnlDpE
	OFceN51jyQ6OMcsoP2AGZoRNafOgKomfrTZ4npV/pML4mXc7BSE9dLuXYGWA/nNYGGEO8j4hi6/
	qTVSeyEqnfyX4Wsjv3toDGh9uKv58i4ZSHU8I92RT8dpM4lZO+hGd3Pg5D/pqxQqXerE=
X-Gm-Gg: AYBFou3VSCR1Y1dePE41BwQhW9eWJIc6jI7v/X1+0F933aAb+tT52sbeyWBt60rUtyV
	fQ60X46lKLSp7HAXcNLqQEPlBa3vo1pxcNHNBuNrvHXkbPwuA5tN9q6EOkLyDTMWLiBFPFYsY/x
	v10+Edn60RDpL6A/OuNrqGAbWEi4VmK44BTfVeneAoIDtjv7393Bx6sDVGOEIQqsnbrhVGre7k/
	pTXbR6VEiDeAGYt/Bz35YerN4KT5ovD5j9u2F9s6BRW6HVCnGU7WHskGq1t750wgF8je5WHX7p6
	AO+3XYmOM5gvK2/DpAFGmEHYeIe1CAyuYwIDay7GXNAbHcHkopif/r/kM+Se/WmAwP6zakVY3n4
	ughI0v/nBzjpgipgi+/xmcjCM1ZmNGO1rUg==
X-Received: by 2002:a05:701b:2059:10b0:143:298f:33b8 with SMTP id a92af1059eb24-146d0f32cacmr2209722c88.44.1790404506885;
        Fri, 25 Sep 2026 23:35:06 -0700 (PDT)
X-Received: by 2002:a05:701b:2059:10b0:143:298f:33b8 with SMTP id a92af1059eb24-146d0f32cacmr2209689c88.44.1790404506275;
        Fri, 25 Sep 2026 23:35:06 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc45f03sm9700691c88.7.2026.09.25.23.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 23:35:05 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 12:04:04 +0530
Subject: [PATCH v5 05/13] media: iris: Add non-pixel and pixel context bank
 devices
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-vpu_iommu_iova_handling-v5-5-0322ca5dc10c@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790404457; l=6003;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=foRnImGSZ75lU1r/edBBVgqmVHY1e0szEa/Z/AKAvQU=;
 b=gSHDOwu5njS7et+ZfzmWbDotSvCOQ5fANphwBG97+btRnV3vBXuCytxIcpe4XgbQIyHMuH4Ek
 dZ91Xwp2Z3QBEVIvrm1EZPqUxKoHlpeHV7/H6U6lFMmauy27qSurmJA
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=VvS2kO2n c=1 sm=1 tr=0 ts=6ab7679c cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=UWePQM47DRlDhC0KtsoA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: HFbfCyyJZ5o7ts0MFaZYwNqKlSMeQOqY
X-Proofpoint-ORIG-GUID: HFbfCyyJZ5o7ts0MFaZYwNqKlSMeQOqY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDAyNiBTYWx0ZWRfX8lfPwg9lXzJm
 NVIxSYdjeImItZvKka35fBEGhoeRe5lwnkCX5AUtEoA5AQrkf1RTamxv0mCyAA1VhFnUDznUsJy
 mxrg3yyIbSMPzsc2K9mGK0/Q8lWA5g7C3NL3YQeKGV77Y4U3dUSBfW389zim261cnHelZMvvN93
 23jj4h59W+pHVPT172Im0rUQYQjz8u445L1fpNM81ezmYoLWxRZlcKOmcjaqBelTXU4woYiETM4
 EqcoW6ZLbfowCHDPB8Rw96jKqLy+rHV5ixRvOKaiMXYXztJOi4Q0VAghAsQEPqfR00S97MNW0gG
 7yGM84+qCUpRJlSVYULLmrZOMZWPPSaLTg7Pmo7VMHktzZ9q0NPBzdKUc+Tc0UmQQHxnwjaHLpb
 0pJzRjrak0HQJ+TC4E7hf0FwzF77iXPTbXp/RkOBhYXgqRkPsmHvSNoV37ueknkKfPq4jiNPyka
 Sys/QdEr3d+2ZLH9+Iw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDAyNiBTYWx0ZWRfX7d8RLeOlJG39
 Tb3X3YPVppIHnLM5IWE6JBazRSk9rOdg0sXgWwC7MDSAz8xQM0VdKKDlFPqdo92xXEV2hPsZi36
 mSd68j6YEaQuA7lVsXDRmgPpmw8gEOI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260026

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

