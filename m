Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F6D551997
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788956696; cv=none; b=XCiPh60lPIPl7ycJd+XCESd7QuRrayPbjh8HJEU2cjDfdLxFL+X1GmsTGQzB5tB0mRlrxJ5qrN5PYWQwccAI5bwTP9jCLCpnsrvT6FyGi5qCI26BEqI63GfKXj8arLnoCC0uwVPPiuI6PHaea4KWnOvpUTuEcCi0CUKFhsbfzYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788956696; c=relaxed/simple;
	bh=P30myDYvP5LX+sAmrDp2DePMK7hRN57B5V+jKtsyPLw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mxcWi7WwRnEVr0cEDHOhU57q9n9orUeNrqYTT0j+RZYJBaDJFNJYyF/mWxMj9vYSiT1poxoIo/E6I5YqQB5H0RGbAlts715fcQpA7t0Ab+zP0iXd0tmVmsVBEllqylMREtIFVvFENGKjh8EZJ4K+hoXJyv7d/pc3X4qnnH01L88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D/N3z850; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZOfLW08R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D/N3z850";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZOfLW08R"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BoUpp2698507
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 12:24:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M8GaWE6c1jzrI5CvT8ixvf1oulBT68ZVay2UogHBWSI=; b=D/N3z850gHEsJKLg
	CnFFHMr+TkoyI/KBq1WbGAWTaN7wGyElwqOjw31QW8x1z+Fes7yumpjsQyJbpKtS
	ng/geayQGPU13dvRym5S7y6Uk3HW9BA24KijixMb5pwP/lAO8oOi6nNZi6HWebS9
	I/APsOvQBlD1bz2TjXGSNVd+kGQdcKOX8UXU0iZjLaWaykiN2WUuik/1KzvodTX1
	FM8CzCwKdy6Twti60JpQ4EGywiW/4A+PY3PS3U8pO7k+CZx6OT4jaECehbQmZG+c
	8O4YdvJp4tEWYVFwDdfWsA8vQbX4x1E8HoFsp3LlIxd4oE5iW0IAW3h63VAftDwq
	V45Egg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk6xh03t4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:24:54 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbedb8673ceso5045260a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788956694; x=1789561494; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M8GaWE6c1jzrI5CvT8ixvf1oulBT68ZVay2UogHBWSI=;
        b=ZOfLW08RTrE+ECI0lbeW+rEIi967OpOqoytodt7i3O01hm6poIfFTE8Onb4VPbOuhr
         uHzJVWOCn2cuG7t6m24bNvhxo8kvq0w7e9uGCCs0B/3UqS1XFo0IYlqhezHvMT9VMnHj
         BqmfaIyQ+uLkfKj5KUoDJ5HgETRzCU42IXfucI6K7oM9Qtwzz/j2ijEDEsNCbkckFP8F
         pWSGkI/CRXlFdrTYTGGTWEwn3iQVlXHTqDrG+Fv7cjSHPT9MvmJabdiXGGDnJ0K/pXtJ
         gyxcs3jGQmY8vzcmNmf6ae39h4sW1LlTl3ZwIhfl2d4viLGhrUEmd3xe8VSyVFaSJilW
         NTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788956694; x=1789561494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M8GaWE6c1jzrI5CvT8ixvf1oulBT68ZVay2UogHBWSI=;
        b=RxXwM9u5DPpHneRvRBvTGN6AXb5+OaHsmBvK1g74Yzykq0/2PLij/w1rjRp1XZj+q2
         E7XCnNfANcQdFaW7tyFIHeaPrvW0e1Gbh0D3grRN/T5Ct8VEoOSym3LRhTbmVmcGX24k
         aoza83RDAd1E56DissnkGc8i5G0WA7jHC9CNRPFtlJfFpf7Cyy/zLoYUuzlZ9RtTJd+L
         fHgWvhY5/tKMOKBQxgmJ9ipn5iQ/HisWzS+7GqspGJjH+JJtlkVQIv5bzk/1YRb6THx0
         Euao8ygCa3EPuXYFNlcTpdzTxlVZGwcfrkYlDVFwIk6cbESeYhtyzodXzEwyWBeCa8Vs
         zRHA==
X-Forwarded-Encrypted: i=1; AKwUvBygXFsciJVgIT6mMrRVf/kkqvpmWCzWqTNcjxZrTizrOOv/Vapqn/AoJa2d7Jh0qbnKYwvlj3As/0Au1Jw=@vger.kernel.org
X-Gm-Message-State: AFuF++kvKy+I5wTLmFh1RoP+rI43kG7QWl+h8fH/HKqIVXwDV2BMK94P
	sa5/4zFzfafKLrJh9jFJ10b30Rd+zZQBDfDRt9cGhnhDapLGQdlc3jBDwaJt69CWg+aiqpKX6Sz
	obaq6Q3MiMT8qdydwocw2OMSog4FbxQXVYA2vRkGx30jDV71EPvBzdmyes4RzRcwsPVOMpXgzx7
	M=
X-Gm-Gg: AYBFou186F49lSSkSiknL1wXU8KamjZcH0GUK71GKS1rSsT63AWI8xNKuogF2mB9SDK
	r4IQPDELE0u7GO+bb71ZjzXoTi6cEBPVip9bK6ej4VPW/Zkhavayd5TfOrFI3YoHX3ykPXPpsBH
	lHW1uc3t/GE3jrKq36LrN4yrSsJr7U+Lb/cP0u05zGrfbmQm/aZs7TVweFQUXl0qs7D+ENJoHCv
	C2k/122BnIepkff+Da/0AbrqFIqs9R8haAAcKj1+g6Prc9YmlFkDJJuR03vgBPXzwIg9gZS/Gqf
	PoLJnEbVWGY2QqEIGrFHZeqlJfHTJQdzkhFH9hjSN6UzMefZUFpehqOssad8uC4rpIxvKBMOXDh
	dCUfOnYhh4/oVf4ALvi3q8Z2XPWBefAw20eg=
X-Received: by 2002:a17:90b:2f46:b0:398:9c39:520f with SMTP id 98e67ed59e1d1-39b261e763dmr53754218a91.15.1788956693652;
        Wed, 09 Sep 2026 05:24:53 -0700 (PDT)
X-Received: by 2002:a17:90b:2f46:b0:398:9c39:520f with SMTP id 98e67ed59e1d1-39b261e763dmr53754098a91.15.1788956692758;
        Wed, 09 Sep 2026 05:24:52 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324356931sm69372775c88.4.2026.09.09.05.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:24:52 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 17:54:30 +0530
Subject: [PATCH v6 3/3] PCI: qcom: Implement shutdown() callback
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-shutdown-v6-3-62b7bd123236@oss.qualcomm.com>
References: <20260909-shutdown-v6-0-62b7bd123236@oss.qualcomm.com>
In-Reply-To: <20260909-shutdown-v6-0-62b7bd123236@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: konrad.dybcio@oss.qualcomm.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788956676; l=2842;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=aT5LRuU59fQW6FpsU0j1/exCccGHutFWHFIlybqEqY4=;
 b=SXim4fm4RML0CyHLzIdAdMqinp3fDHLsPlUmSiUal1UHaT3FY5arh1pNVlXkwjOhjgAxwigrM
 dOGlSVQVyuDA2AFpAl2grLFAe3mgJJqzJyl5w572P/og5jGTzxvqDdq
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzNyBTYWx0ZWRfX0+O9BKImE7DV
 VGrDvb7Ca0hZZC7PE8Ms0WC00OYxDoILVxxqiCZWSSgbuJR6sJMdRA7l/yD5uNs0/kqzpx/I8Uz
 ulgQS6t0xdIcw0j/hrWG4Qzw4ad+32gTnJEsfhYPHkKTl3xTI3kPu/XiZf7xFOBXDlbFFi4gxcm
 lRG3LBXJOBXzENLEpCNNI27q1uRi4flPjyPp1dbGwx1oLDzAlRXY2hcA/HZELGEECVLKwgpJ435
 hjq4oJg0lUVICCSxFarWXPBFhc+7ICY7nzZYQ7z7CdO5rFlS4IYvpKUE8UQ+HALYPULUZrdc64j
 WGClzBcBycPhbCnSeLucMQ7iR4IXaB/5x1X06Z0T0mao0J5JrFSfqe8OoXqiM6ptCgCCTJDqNj3
 MEHxJ3F95QVqPVag4VZj6yBjKExgIvzBqtlIzmWDkvJuQ/rPHK3XqI5XA90mipBrVITIZvGhDjr
 0/APBFzpvLhoaRts+/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzNyBTYWx0ZWRfX1V4D+R7MixLS
 zCt8OiwwMEOVfdOogPVnPaIOXBsMchwCA0oGzQWsXOhCy45eQzw+cf4gOtrqXk4q6gJTcV0NDrJ
 Xvtsa0bu6kLdKtNNSCIAkgwScAEQTSs=
X-Proofpoint-GUID: 7_rMlMf5OitL7QRl0QYMtVn8wTKHpic5
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6aa15016 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=kXhGf0cxdCgfIYue-YsA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 7_rMlMf5OitL7QRl0QYMtVn8wTKHpic5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090137

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
index 2693a98d0b27..3133e2b2eda6 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1988,6 +1988,9 @@ static int qcom_pcie_ecam_host_init(struct pci_config_window *cfg)
 	pp->use_imsi_rx = true;
 	dw_pcie_msi_init(pp);
 
+	/* Stash pci so qcom_pcie_shutdown() can mask the MSI IRQ(s) later */
+	platform_set_drvdata(to_platform_device(dev), pci);
+
 	return devm_add_action_or_reset(dev, qcom_pci_free_msi, pp);
 }
 
@@ -2408,6 +2411,37 @@ static int qcom_pcie_probe(struct platform_device *pdev)
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
@@ -2598,5 +2632,6 @@ static struct platform_driver qcom_pcie_driver = {
 		.pm = &qcom_pcie_pm_ops,
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
+	.shutdown = qcom_pcie_shutdown,
 };
 builtin_platform_driver(qcom_pcie_driver);

-- 
2.34.1

