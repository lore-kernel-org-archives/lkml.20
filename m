Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720499;
	b=NNJw8TluZTF6BiFewSSu3thUa3KAqpoEp3dQLqtuAWpfyZHUs16Oy4Hn32yqbIrZBjaw
	 8vPtKJaBqLRJWMv87RIgqVBzha7WBX4cKCCMCMBA+fGkJUI/H6qfGeXWiGDRdjeAU8DAT
	 MTcbe+alggnldzY1YdPJRn4qCnLFx41s6lAXb7JZoOIJrnF897ozy1ljVwblKCP9b1qly
	 /eRG8JJWoRXGeqCXBDkJce3G0nkvU6pjKwRVlQ9oZMekjXDwRfOhy5CAYF1X47Ahw5NgG
	 YgpL3Ygl6q072uVArlDMQAZcOFEi98VgSqK5hCfLFo7XXmChALK3rNxq/QRb6OWYi3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720499;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fBYaimw2G3W1oorhLO1ay3uPHjszKa+u/YOPI7uQA9w=;
	b=yt/TCqMdyi0goSyKn39MjHvBm1o9RSqzNd6f+CytIYmMLDRJDrPvTxrTeGzq6nPKfpql
	 Dsoo4G2kVSSnjyHf0ta3Y19c5lhmtKnybm98mSjT25oXu3XMFEDIZPrE15Ifedww5VFb9
	 0yuta7HdtQYZvjaGZ7KcSAJ6M3Phmwy1DKfnVjRud1F5opsAUTbszMRPE6YDcCK465cQU
	 EGujkwziIVmxfCKoK0utyjD4froQ66cX9AaV4nSALc17SSY6mAKZMfyfMF2PLlefaLfQP
	 kZJ5/49gCg9q92cWd/tEzWu3wsZPnItQX2o/mjVLFlSFo6G6V2NxLM9ZzYTYeFmNzzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VzgvX4zd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bth6zxMS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A4D606A33E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9A4D606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VzgvX4zd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bth6zxMS
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E9wYR3657502
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 15:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fBYaimw2G3W1oorhLO1ay3uPHjszKa+u/YOPI7uQA9w=; b=VzgvX4zdxFM3t12w
	D0D7EKS5e+tBo/A4kyqnnJP2nYgUtp1AWEOEFJmPmihfTv6/wzyHhezWeYvv1XNS
	+Z6J6LO1rTXCsW8C5RUVmQY213aokslJfOfUp1VtUxx4TzaW7JzrA2sgW4sz24ZJ
	a5FOqH2+kojRpr6c1qVy8WmMLobsU/a4RzPl3Er4Qh/eRl8jz/WUEvJmomQ6H2My
	it8IE8i9Dbodacbguigdj4TPeJkqPEnIpg2xYVFmxizcxTl4l+9sMaKSA4fc58w3
	zem5sI40CNG+acBpOfefwyViMNR/K4j8Xc1bl3n7+aHZvUiWUSZCcrUM63+sLpFu
	2DijnQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq94ctfpv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:41:37 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1a71dd190b0so2574248c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793720497; x=1794325297; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fBYaimw2G3W1oorhLO1ay3uPHjszKa+u/YOPI7uQA9w=;
        b=Bth6zxMSqizhwcBjUDw8Ph0Hou1DdBwyIjsJLYEASUV9ZsgiJRGOlAg2/C364zpb/6
         GsSHEtxyWfvV0uW38b/TtPe853b26EGn1PWKuL+VGAQRlGjtMUdMsRqX8g37Viowg8k7
         2do5HpOUi/hnYaMUnDzt3lEw7A3fC7dhYV1OxG2yCn7fGNuSrFgwe/knqaje3e1K9Yuc
         +K5IHgICk5YOv1+nIRK6K+K3+tIB3YI2KqPCek0K7SmRmR6JhkS2bGTOd9F46/TNXuak
         Q6A7uP9OV0ee8/4Hln2zZjOSlY94W5jJQ2TzPMb+AwVLrFdSdJ7T2K8Jjrm2L3D/+DvB
         I7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793720497; x=1794325297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fBYaimw2G3W1oorhLO1ay3uPHjszKa+u/YOPI7uQA9w=;
        b=RiTT6gW9OU5hfizXbWnKtgfHiPKWLZgNwnT398qeByrxSRYLIa24BgGoI/wd/DxVhr
         nA60dEBrx9woDsElUTzFm9fM0NVhXbKiRd0z/bZFnLus5YQ0M8mEBcwOTjr9HQLgNoT6
         s1oBpFd0NsGuRL3RbnEQFJbDy5sr/NVF2GJK0ZGOvYYPpJNczVACmUDafd/2X9B4Yiau
         PZEg4/SFRr4sB/I4xOBI+hnKzGo9fVb8VrqcU4sfnDmxN+s5ybPWi+6kEDzXh+LHdJdc
         bD2a7b+25u7qjxpUNZcAlPRIfT0mkhkY/4/B+vLkkszBd5Q2z9VMstwsFkwidOdR5QV7
         nhbA==
X-Forwarded-Encrypted: i=1; AKwUvBz62i08vfZCxwSxly2V31H7X1d/ncK/0vGjSTg1pEiAqyXsOwfKII/BkHqFcR0u/Wym3PI8Pcpz6C/JyJM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mDriARTdybBLHRZW+dD18SjxwkcHDNK5MZIk49+L5wMFgMw2Z
	R8YwrUTAT6qTCVw23CiVNjii2UBmlsskg+tpkNwc9jK+Nx6dl+Sd/Jmg3XSq1D02Tv+h5kbFvRe
	i4LyCbUZ7VVZnfe9qpeGH4Rt2baYFY3bTbPsxcJHF58ExBKkvuJZKW8aAdCjJod6dCiMr3+Yhvp
	k=
X-Gm-Gg: AYBFou1dD/Xlqn2Z8+8ShS87Q+BXWIU9ec1HTGvrZD4k9gtkvIVifH4hpDX0kRCDrTP
	bZAg0wqK5cMXU+VKEYg2pGFX62ZcCpzIO0qCyHKdyi9IBogElkEVwqAgNrCpzOJ5m0LroN5Otxj
	RjC5PvsAjuQ6JVKjaGFuhwYILzHl35ttPZpye1XEBkeIN8udW9269bBr4JzH0LcJ8kA0JAIOgek
	6J5GhzxAQZohFwPAYIlrh7yleth2jdbwwaqINLWuUtaS4Rec9UzI/dqmp/mDu6PZJijYFSMBx21
	sCXyiOZgCBAHrhB36lb1GPA4nH4gFNN/QcduXbQMaZZIkxrz/2YoSgCr0hFXJ3/Fm3qDR7mnHV6
	M7uOkxJ3VNWd6VXi9YZAFC4moTi2eSPPj8T3WQwlQNfsZVb2rIUzaKv9XfCgVO0ruPAHTXoL4an
	5JkLaIOPbg
X-Received: by 2002:a05:7022:eb55:10b0:168:3243:c90c with SMTP id a92af1059eb24-1ac59dd356cmr21583411c88.15.1793720496417;
        Tue, 03 Nov 2026 07:41:36 -0800 (PST)
X-Received: by 2002:a05:7022:eb55:10b0:168:3243:c90c with SMTP id a92af1059eb24-1ac59dd356cmr21583346c88.15.1793720495744;
        Tue, 03 Nov 2026 07:41:35 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4b08bsm50072823c88.16.2026.11.03.07.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:41:35 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:10:35 +0530
Subject: [PATCH v6 04/12] media: iris: Add non-pixel and pixel context bank
 devices
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-vpu_iommu_iova_handling-v6-4-e4b6ad864f8f@oss.qualcomm.com>
References: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
In-Reply-To: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793720462; l=5699;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=PdoRGd1QM+T1q4UwRSS6CzpQGx+PNAIoeUckk4ow7rw=;
 b=Up3/bFrCEEtJNkBFbO5sUOu/bdyZblDZX6Hm/8rFVZwQ3XDG1AsibxXyJCv5vvISPo5X3aCZk
 d6f9ZTLIId+AJXpxsD0GyCUmiv2sPNCl4vrrtNuFtm2Z8Gytesu1gjA
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=O+KsLx9W c=1 sm=1 tr=0 ts=6aea00b1 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=tKxYv9Er3uJaL0Xx8MgA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 1szStevkjeY2P0HWNZHaRpB7i-9V8fzY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfX1wYgiL1luabs
 QjkOb8dQ4M5GsxD6Kwqiz3fKZGG0OjcVuDulyMT98vsk4KZD8fpF9QnpnZD8RhZRh16KNTXNCtd
 J8HIJ5i93tfEY4JsFXShUQK2QBPP8oYaNaJbO/DuhxWZPHB9gqc4BNGtPxQ8egRMYReJS0cdUbk
 gVwR5OSzuXXbdvZvDuo7qFZ0XcjS8pdEhSe+0TCmjpl4j2PZS1dRAJ7M46ZQkmztRsVYxQ5/YHM
 B1aCyWPJ0pMYCqsT45auJtCZn5zmGVM/r3w1626sj/TYeTLWTsiB+WMvrvaNbV3cvntlm0jSdLH
 kC1spR0jdsA1NZ8HWXjy4v/S6C/NRtFp05pom7Jafx8VisGNQWg/cB3jx0sGBgfminSDO3byDuj
 rQeXk0kMYu/Afx85b8CXdHegCGEK5eYNartmI3oAiUkK0qWRVg1VRnMa7dgm3X5IR/v2Yw1Y70o
 K6YtsvpqcFVk4iPzryw==
X-Proofpoint-GUID: 1szStevkjeY2P0HWNZHaRpB7i-9V8fzY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfX6G4QOlbsDsLC
 I0U/gxMLJn1Vuez7tRF/sj+hBiIV41RDJm/Nu+ne2nSuuT35Xg9hf+m2mxEoFejeCPyqe+GdogC
 tEuKQODIXA/sGsvMu/VLxkbuPB/dqWQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030062

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
 drivers/media/platform/qcom/iris/iris_probe.c | 66 +++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 3e4cf652bf39a7ef44f5c94ce91d0ba9c109e178..2f14d80d25899244028cad1e6c16e595edcb1493 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -40,6 +40,8 @@ struct qcom_ubwc_cfg_data;
  * struct iris_core - holds core parameters valid for all instances
  *
  * @dev: reference to device structure
+ * @np_dev: reference to non-pixel device structure
+ * @p_dev: reference to pixel device structure
  * @reg_base: IO memory base address
  * @irq: iris irq
  * @v4l2_dev: a holder for v4l2 device structure
@@ -86,6 +88,8 @@ struct qcom_ubwc_cfg_data;
 
 struct iris_core {
 	struct device				*dev;
+	struct device				*np_dev;
+	struct device				*p_dev;
 	void __iomem				*reg_base;
 	int					irq;
 	struct v4l2_device			v4l2_dev;
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 25876957381b97f7ebf141bc87a7895cacff84b5..e659461716ba46c84d616b41f477b6250d46bd81 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -201,6 +201,67 @@ static int iris_reserve_iova_region(struct device *dev, struct dma_iova_state **
 	return ret;
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
@@ -247,6 +308,7 @@ static void iris_core_release(struct v4l2_device *v4l2_dev)
 {
 	struct iris_core *core = container_of(v4l2_dev, struct iris_core, v4l2_dev);
 
+	iris_deinit_cb_devs(core);
 	mutex_destroy(&core->lock);
 	put_device(core->dev);
 	kfree(core);
@@ -351,6 +413,10 @@ static int iris_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_put_core;
 
+	ret = iris_init_cb_devs(core);
+	if (ret)
+		goto err_put_core;
+
 	ret = v4l2_device_register(dev, &core->v4l2_dev);
 	if (ret)
 		goto err_unresv_iova_region;

-- 
2.34.1

