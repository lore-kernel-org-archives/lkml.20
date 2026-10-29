Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793247596;
	b=l3+OS3JjGLmTeH7M9WdAWDuugyw357mTyIVtoSWUH7R/9ISBVo3wQeAIG8aA62FqTwRp
	 bqj8hel2X7D/QRYbj1lOSzYpSKgJMaysjsAFVYRLGGHYwJA5w2zWhv/m6/knGI2GrZIXR
	 vZ+SB/yrZANLxU+MSVQVcnsvgilvDyro6VoqxVoDQmM7vek/Jo/V0JoBd1ZrDehrRxXCh
	 D4ll/y3tAo0jqCL+XCGWhN39Fdp30kMNsLVtOgspRLVDV0Vzqoj8rjQrvLbGVr0KlU7+2
	 ntxOcqSwV1VzI92SCvAYc/8pOV7yLTxJqEEbK8SwG+0w0Ve4pTbEIfvVNwVSsD8JVdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793247596;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=N0sE5Rrg7254a4JIqn8LaORoch9C7DlP93N+XE8pi0A=;
	b=R3muOCpF47/LA6fC3AfDZBv+IHK9F40WK4YB1SYsynXJb1SlmhI7wTsx47O74pa+0rLn
	 QDnl+xzXh055p8/pVRl16IXVv2RFE6OqTDHc+esDGwcD3aF2AAutOB6Q6bqIHGQ1cMIOi
	 dstEEzU0by6zcUhJgV4WCAHfpTx7FMQUaQ83ebZ6OZjp1hMfqk7094tDrX4F9fnCkiFKq
	 8SxGHlbdnOUglkKJsfCqLtvq0Y06AJ7Bzwv7BYfTUfT5t+vLfF1WWYnAkU3b7tQY5JiK1
	 8EjISiRY0AOUspyEcccaEFU7p5nyHZAi/Zb95GXOSnO4FwAtf8y0ZqnEgjZ6HJRz3XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=csRlgcFV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JJ2s7U3b;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC879606A33F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:19:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC879606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=csRlgcFV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JJ2s7U3b
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T1jMdx2886476
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N0sE5Rrg7254a4JIqn8LaORoch9C7DlP93N+XE8pi0A=; b=csRlgcFVp6oRCFUv
	ilpTZi6shOn/BYJJZxxaZQLzR7aFV7C2PHBHVBe4Uu8oAHzI5dYDKHZFJPjLdVJE
	8zL8iPsX9CH8EKRqoLAOnbu3jQDtwE3NZku5ozovw01/UNiVW27b4Wjt1fVMlDCd
	JI2zRFFePIBdhUC7jC3xBdw+lYy2mkkIRjpfg/8MVrA4smMsEDRdvOuxeo8ZQ54K
	dLHNhjz7Warf5l2tcgicfllaq+JNXRW+1typGM/Rm1s55g7XB4BiHsA1o0fbB1Ts
	/ReeSzUvgcfcaPwMT6z7HDCvFSZT3qzfna38hQNgaVK/qRnDxrDFM2o7XUzhY2y9
	olWL8g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkut3gmr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:19:55 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36637676140so2503283eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793247594; x=1793852394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N0sE5Rrg7254a4JIqn8LaORoch9C7DlP93N+XE8pi0A=;
        b=JJ2s7U3bBm5Y0i6SDhWKntjA9xDRAm+hgqmy1jG7lEOMYOOWIktCf9wfthujjtYc6S
         NbVCtFWlD32L/M3nW0OZMQBAaHqJdV5h7JRv28FvXpFXBlVCGjhmPYHjsVHenDBPpEQs
         mGjBSMt43/93Eb08BR8VMu2ED0NYpHDvNNgS/bmoMkxERPEiQHqA8A/vV1tlF3RfNWAU
         cPHI1JCn9RiI9rHuF21zA+9NAvFL3qgJirqxf5iu696rfbMMrztJsez/kp9SwOHqU87D
         MMCVC1tR6tHkmZdNV28vTM4EkthJQI48sOAJ76Ff3Bzar8DpeVBjO0tVwU8SBtyDVO5W
         NY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793247594; x=1793852394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N0sE5Rrg7254a4JIqn8LaORoch9C7DlP93N+XE8pi0A=;
        b=kbBnUeQIqFKk/oeI90CmgHl5Mnde3ZKU0pHwuQs4mMQGvl0dANQZQQ30mALY0vbsjA
         dUwWijcwJJcOUlSr1iOWaQlbledeIc1n9T7MyRfV3j7Kd6CbTp8oxx+BTHhEXPIwF5ie
         86V6Axji/749huSkS4iyTwfVM84Cn9RKO5dy8JJ37Vogxvlrtep+/IM42k0IdWg+mzjm
         k7C5G3T5FNEyohePa8ihiXHl2k898WO3N/k6usHOt4ar8HH65avWZ7E60a+vfLf4Mr1c
         j7XjZ1RGWoq77yeGv1+/zc/x9sfMHhdQ+LYbjZazuQNmcl7/unt8o1ktuZaYPsiQ1Qcx
         TbRA==
X-Forwarded-Encrypted: i=1; AKwUvBwSw+qF98EcK/X3J4x61Rioa4CY9mXZQ92KsyDwUk8ylQLpxL65B+hlxJERJO2FwbX1aPJUlCBHrMvO7b4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqBqmYXzGL+4fMckxwE6W0AOuJd0UzOoJecB1MwH/kdeouGc47
	n/vWo3nnfU/N7N4Z8BuUTboHGMVf+cq4VwCVE9Z6x+k2KERDauHI9yMxr7Xej+rmtv91XD1n+DJ
	Fwr3oMjpyU3010VWsMj615F7v2oaljbFDH6ImYqcpDu5vHxIckj8ytPs3ydtqIXm37Tg=
X-Gm-Gg: AYBFou11S3Xxhd7nwdUyTyEq8i9VDL44AtRi5Aj+/9jflE3cvZ4zOgl9pewvH5m5lKO
	vqaDunVkNvZW6kLopkSxzH9fcvQArSESRpSAF9Og16Ohzw5TOZ6sWFog2+by+irTM0fnQkq7h7y
	ZpWPoRnQm/oXi6xcdiHZYALRRGCOPvSmfGPxAPeBpwMVE10Yhyl3rUd5yEsGiALx86+Qc/nuJWg
	XIMJRri0ic6bsE/zCR/0lcxmWQNzoDwf+TpvrEsOgy4BlDRLQvvFlrZANc9RI2US+3CgZhGwHRy
	eWcIZce/AuLPtd1LbHOCaKBG1G9DYk4rK3ChkX4o1lE/uK8UGvwd6Tui7e6GAriVXI3+k96FREc
	g2fSpK8Lza4zP8Y38inKGrw2/OhZJpYcRwJ8l4SR67o+pb03XIrwQQgsemiRJV3jJLOGg3OZrtP
	xAJ8+NKy4=
X-Received: by 2002:a05:7300:fa19:b0:369:faa2:1fb2 with SMTP id 5a478bee46e88-36a2007c0c1mr6317761eec.8.1793247594419;
        Wed, 28 Oct 2026 21:19:54 -0700 (PDT)
X-Received: by 2002:a05:7300:fa19:b0:369:faa2:1fb2 with SMTP id 5a478bee46e88-36a2007c0c1mr6317722eec.8.1793247593833;
        Wed, 28 Oct 2026 21:19:53 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a237be80csm27504539eec.2.2026.10.28.21.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 21:19:53 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 09:49:29 +0530
Subject: [PATCH v7 3/3] PCI: qcom: Implement shutdown() callback
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
Message-Id: <20261029-shutdown-v7-3-3fd7a76a6991@oss.qualcomm.com>
References: <20261029-shutdown-v7-0-3fd7a76a6991@oss.qualcomm.com>
In-Reply-To: <20261029-shutdown-v7-0-3fd7a76a6991@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: konrad.dybcio@oss.qualcomm.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793247578; l=2818;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=oSqbVmWhiEtExXZiinyFNkHgOXlRYhi51p3ejlcaIAA=;
 b=Ts0eOFTto477uTOtC/lVVj0fCHhKCK2lG1oWhXLuQiuur3YKnTRyW9W94Tb0b+oipIN2FzzPY
 A82yGkUW/uhCoTKna1oPJFYIQaHDHu+UlTlst5qWKyKzvo1B3+3O4c2
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAxNiBTYWx0ZWRfX1oeUG4rRnBzo
 lhS+1nJfEnVPUfLNxnfFkxFilnCXMfzIwikbMy7xTTLWb7VR9p5d3OQ05q410L76dgvsFXGtbjy
 BAgWZ9eCbpAafpPrp0q11bs709WTpTA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAxNiBTYWx0ZWRfX6fKCQter67/C
 iVlkhvQcf+W3ihriM6it3gCTdqVQVE9EV7PloJ6JOSyZAaPKr3rE0EgXTqTH4roHGDeU3fH5Q0l
 jUIF6QKPg87fUYOoqyI+BFjXM+Qn6LR4G0KHxL/QhBrpMRYxIjgYoVw7GdH+8NZlbMbqf76dCNl
 RBgcY9ohl2B1ZW0cfBgCGTXaj+2ZjZ2GppLIv6dIuMz9Q/MBCcY0xNkSKgHx+Wv64piHXYqRgnP
 CYGFxnYEer6U/ejFiT5DxlYHs+1xhnPq8f/uCff0fv8FpAcBF05pBCWJS7pysy9ExUSgu70rKc2
 7Wz5a3mK1srxOweaxc/4e0Wno84wUPPawCX5urZA6CV0i967iln6irYvV6gfd5J0wouqtmJkG7w
 XqEAGcJt84hYInXiXekwyUa3hmXTEHfeNbwhWceLIBaN14nXfkNg4qTqvfTJ5iUIj009b5bqZoo
 /ROFDdE89J0GprggIvg==
X-Proofpoint-ORIG-GUID: DnKYnkAGf3H0EUcorwDBAmeZpkuDCAW1
X-Proofpoint-GUID: DnKYnkAGf3H0EUcorwDBAmeZpkuDCAW1
X-Authority-Analysis: v=2.4 cv=HYSB3SE8 c=1 sm=1 tr=0 ts=6ae2c96b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=kXhGf0cxdCgfIYue-YsA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290016

From: Manivannan Sadhasivam <mani@kernel.org>

PCIe host controllers should bring the link down cleanly before system
shutdown/reboot proceeds to remove power/clocks from the controller.
Without this, the link may still be up and endpoints still have
transactions in flight when power/clocks are cut, which can trip SMMU
translation faults or NoC protocol errors.

Reuse dw_pcie_suspend_noirq() in the shutdown path to force the link
into L2, putting it into D3cold.

device_shutdown() runs with interrupts enabled, unlike suspend_noirq().
Mask the chained MSI IRQ(s) and the Global IRQ before tearing down the
link and clocks/PHY, since a late/spurious interrupt could otherwise
reach a handler that touches now-unclocked PARF/DBI registers.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 35 ++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index a7835e8a51e0..423a90d6adfb 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -2031,6 +2031,9 @@ static int qcom_pcie_ecam_host_init(struct pci_config_window *cfg)
 
 	dw_pcie_msi_init(pp);
 
+	/* Stash pci so qcom_pcie_shutdown() can mask the MSI IRQ(s) later */
+	platform_set_drvdata(to_platform_device(dev), pci);
+
 	return devm_add_action_or_reset(dev, qcom_pci_free_msi, pp);
 }
 
@@ -2451,6 +2454,37 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static void qcom_pcie_shutdown(struct platform_device *pdev)
+{
+	const struct qcom_pcie_cfg *pcie_cfg = of_device_get_match_data(&pdev->dev);
+	struct qcom_pcie *pcie;
+	struct dw_pcie *pci;
+
+	if (pcie_cfg && pcie_cfg->firmware_managed) {
+		/*
+		 * Firmware owns the link teardown and clock/PHY shutdown in
+		 * this mode; Linux only owns the chained MSI IRQ(s), which
+		 * still need to be masked off before shutdown proceeds.
+		 */
+		pci = platform_get_drvdata(pdev);
+	} else {
+		pcie = platform_get_drvdata(pdev);
+		pci = pcie->pci;
+
+		if (pcie->global_irq)
+			disable_irq(pcie->global_irq);
+	}
+
+	if (pci->pp.use_imsi_rx)
+		dw_pcie_free_msi(&pci->pp);
+
+	if (pcie)
+		dw_pcie_suspend_noirq(pcie->pci, true);
+
+	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+}
+
 static int qcom_pcie_suspend_noirq(struct device *dev)
 {
 	struct qcom_pcie *pcie;
@@ -2641,5 +2675,6 @@ static struct platform_driver qcom_pcie_driver = {
 		.pm = &qcom_pcie_pm_ops,
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
+	.shutdown = qcom_pcie_shutdown,
 };
 builtin_platform_driver(qcom_pcie_driver);

-- 
2.34.1

