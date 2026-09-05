Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1365311592
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 00:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788569356; cv=none; b=JhrZm8H3RJofQXakZYYMjBkk97XHWZ+7+oqZnglQDMxVHoJNo2riQ1QQqzR5nzhJJ5DIElw2OK7ejq6iBNtmAbPrcnjx42wATX5NoHBwcibfTX3jkcp393vYir6CqR9YcdFOne+UbuZACsS1rSam6B18C3cfjOJA4QJkAYAjDM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788569356; c=relaxed/simple;
	bh=PvQXCFikz7+VcAqvA6t2Ujka4N7pKImpgFaj/e/tCBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IcdGKGTOXsrTB45xlFu/2HqOeTmVfBul4OhL1B9PG98/WvSbp5Wh7hMWDji6Kkzo+G7NXLeidu/236tw9G/9d76Vi4qW72XB2h8etehI7Ix08QmicTSS4iBRK1n5nhyQdvuyBN+gCHb/9g99iFXxuJ6wRVgKrzGSrcHfH4kYvzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ASedEVdE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IlKM4z1Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ASedEVdE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IlKM4z1Y"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684KbU7m347609
	for <linux-kernel@vger.kernel.org>; Sat, 5 Sep 2026 00:49:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Md8xapU073VDnkdcz3pCROBsNDKkTMi0kEel5VMy/bo=; b=ASedEVdE0zSIDYaB
	+DgOrxXAq5errKEo0SFT2hcz+H5yEHTfqdcx7PpP5ZbOsReYKxhCt1mBO3HmzTvM
	cNA6ZNFhlZOmx6HQmQchrU9bZsqz7UjgkUw18AvON5hECETz3tXjED6ZatE9Eb0Z
	pgnQLh7FnT5yM0oEURelsW53XVTOljuWxusqbLBT3i2M5f19CoGuDvBaIKf10Xqt
	8+x9U8BqW1NqBAG4IPWOL3Z8yb+dHPtMSbpvY3GuTA5A+TvwNc588Zi7RtCSD7e8
	gOPitHFPJmqQO00dH7iPYLsNVkyU8r2XMnesu5GfUxn6Ey1Niib/mXp1Gw5rnAHa
	21ZArA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg0122yx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 00:49:13 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso2210142a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 17:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788569352; x=1789174152; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Md8xapU073VDnkdcz3pCROBsNDKkTMi0kEel5VMy/bo=;
        b=IlKM4z1Yj2OOib7S4kKtRtj6jCuzpAcwyZTtFUqAEa2DrB2KoAt04uxsqutHH3Y+df
         Qb2MYf1X519CERU9OgjogMH0y01XWB3cE+bIOE3uHQfmxQuwq2kfWYrvV/Sf5SAM5uI5
         7IzKwl4Lw2Uqk8NKNofNrNj68J9qfRWvUwPQXSfANCjzckp7my3Fo7awvBEEmmjd76Op
         858JvlcShNb+noT81rK9phfRrnUKvCIqKdH4mqT19cUnEH9jW8EDtfWCyFAHeiWbMaB/
         tU+/EDYfm/Xz15e6iNMwnMOiq5G7mpFDWWfASd1kh9OTfY61f9435OU0PYggDY38dNHO
         taPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788569352; x=1789174152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Md8xapU073VDnkdcz3pCROBsNDKkTMi0kEel5VMy/bo=;
        b=fx1xF31C6rDZvaXKSAmNkMJErCEx1z0gkYC3/mut8xzptsraemQ0+tZh0CqMPdAIDu
         XWPBESebDTfyGFIpQYEy6qWwOGgQoyD6AxZCZfbayjmH9BNe8+vZ8Aa0gvZrlPV56HED
         a/zWnW0G5jiAfMCnCwndut90htU1/Ut+Eg95b1kugiUisEvCYClDrLc1eFJ0PsoEHpRQ
         Nw+9vUSRfajGsFmExHO+OkjuxlFnnUt0lvTocnLjybIlXLVY8zLpgum4Lcz4yhh7nkTE
         sdZs2K8bD3BlI1no3in+Ll1KRUjrsRVT7CKPavYCeODQUytqK7r8F8vlto7gLUOzcyAE
         k7mQ==
X-Forwarded-Encrypted: i=1; AKwUvByd6POaSf8ewGctUq0jevNqJPThIaubCMF3+GdHx+CtvCX/hjY97f33tFQ1qg295oHA7lNVtxwar1l6d5o=@vger.kernel.org
X-Gm-Message-State: AFuF++kzBuunlUDhRXZ/hV4QKvnrqkRLwZvGhzGcQ09Rw99pp75yJLtn
	lzHQ+cKqysqwRXVasbDMTIpq7CH/YquhfGWj0ujauoeb9fHqTuOQipY1GgAwC2nwo+jDnmvXe6z
	vABwTL2UnF0FS3TKlJBooF9QbEMeoHFfP7cnRmsKUplQ5P+45BrYtonmyC2Dc04rSUGU=
X-Gm-Gg: AYBFou0PSj+sr1dgyPWBD/WQlLmuKZ1JA8v2ooDiBDRWk/j6SKEf/q5QigK4fDzr0Gm
	QeIQ95Z7iir863ybm2Na5c2MWrS8AsANn5EejBx0/CNfgsynk95YKoA8CQo7f5hqrhPZSXejFWQ
	RKfgypnTZw9hFeYjTnPp9dPVPHitBmq2pGX5gKNNyJXa7Jx3irVn6nHBNj9FUpZt6rGITqIG/bY
	CuApa4A1+HgGxygD0AuiGphEv0IFjDKvjmgQlPna66v2VZP1vpztpTpgzHfSgbQjlodAcSA/0Z8
	VvXaUSC5B3fQ5Ou+uDNfZsqkIGQsUWOpd6pntb/u959y2V/N42LIrUg+46Kgsf0rvl2lzolD+HZ
	Ro0vjmsvtnTjogS1YinyAERP4f1jlNTS+coI=
X-Received: by 2002:a17:90b:534e:b0:398:ba0e:96f6 with SMTP id 98e67ed59e1d1-39b2624f0f4mr13817685a91.23.1788569352335;
        Fri, 04 Sep 2026 17:49:12 -0700 (PDT)
X-Received: by 2002:a17:90b:534e:b0:398:ba0e:96f6 with SMTP id 98e67ed59e1d1-39b2624f0f4mr13817649a91.23.1788569351908;
        Fri, 04 Sep 2026 17:49:11 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm10843907c88.15.2026.09.04.17.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 17:49:11 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 05 Sep 2026 06:18:50 +0530
Subject: [PATCH v5 3/3] PCI: qcom: Implement shutdown() callback
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-shutdown-v5-3-f0c6bafa1d4f@oss.qualcomm.com>
References: <20260905-shutdown-v5-0-f0c6bafa1d4f@oss.qualcomm.com>
In-Reply-To: <20260905-shutdown-v5-0-f0c6bafa1d4f@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: konrad.dybcio@oss.qualcomm.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788569335; l=2931;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=X9pEskPcIL//ByohSRkzhW7Fg5XmyuSC5RVulFPk/RI=;
 b=pJ23BNDibNBii90irb9rRFMgg7dcmuKxLM4wLglTXh/j7Gci2L6JJTysrMIAX+oWLsr6Lkj2S
 5s1I/A2ydQmAO6bUH7dy9OhNP0JiViY7pA3Y9hbpGS1smQBpDSgJv4X
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=dfSwG3Xe c=1 sm=1 tr=0 ts=6a9b6709 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=kXhGf0cxdCgfIYue-YsA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDAwNCBTYWx0ZWRfXyyn9L8xm9LW7
 Z94EXJcOesJD4Oyp2jrFTAleNKoY4tFX5JJv5kUHfNtJesvOtXI8mceBkQk7E6vQ390Z0PXD/JY
 9jeNAEnH6sCYQV9UWfE/HBeefA/jMZgNdW1NOmuuAiuFAidBOb7XQrlJrZO+JULmpGxkdbn3LFb
 tfh9ICSYfP3aR+Fkqm1sM+WPQqqjnqdMwJDU3mKA+/0KAN3pfBfi3hDfoIGsluRCvvxEcOjkVhs
 Zj7WJvvQhUc4ewf8FgMaTRC0f88nU4ypm3qbSRMqLmnxMQDTb5ox1/+72WKSzruyMjGZlDDibAd
 Z4BExj/QrNmmjwqXzADblE/mEJa2BZhZSTezkA0nTfLnnCwRuYATPoq7DnP3bnkeJpZMbf4CODz
 FClnqS9lHjzphSLMu71n88WG173fJPWmtSbDvLzeOril7gsmTlVi2W0VqbumLW82feTXhnYrWrz
 n6qW/R4LU9asfLmeowA==
X-Proofpoint-GUID: DdIPMiZGqOXoHbzKdt12ELXVIzja_nw5
X-Proofpoint-ORIG-GUID: DdIPMiZGqOXoHbzKdt12ELXVIzja_nw5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDAwNCBTYWx0ZWRfX3TqJH8VHxry/
 TN3nqyaFVlO1TbjePEbmLcInsznrfdExa796KfAbkSl6X7G/D98MDUbLiYczUdKfjXL5CwYyD3I
 243exrHF0kKFKkV936PSMpjU5S47mrQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_06,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609050004

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
 drivers/pci/controller/dwc/pcie-qcom.c | 38 ++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index b58a607b713f..38801830fb70 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1924,6 +1924,9 @@ static int qcom_pcie_ecam_host_init(struct pci_config_window *cfg)
 	pp->use_imsi_rx = true;
 	dw_pcie_msi_init(pp);
 
+	/* Stash pci so qcom_pcie_shutdown() can mask the MSI IRQ(s) later */
+	platform_set_drvdata(to_platform_device(dev), pci);
+
 	return devm_add_action_or_reset(dev, qcom_pci_free_msi, pp);
 }
 
@@ -2337,6 +2340,40 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static void qcom_pcie_shutdown(struct platform_device *pdev)
+{
+	const struct qcom_pcie_cfg *pcie_cfg = of_device_get_match_data(&pdev->dev);
+	struct qcom_pcie *pcie;
+
+	if (pcie_cfg && pcie_cfg->firmware_managed) {
+		/*
+		 * Firmware owns the link teardown and clock/PHY shutdown in
+		 * this mode; Linux only owns the chained MSI IRQ(s), which
+		 * still need to be masked off before shutdown proceeds.
+		 */
+		struct dw_pcie *pci = platform_get_drvdata(pdev);
+
+		if (pci->pp.use_imsi_rx)
+			dw_pcie_free_msi(&pci->pp);
+		return;
+	}
+
+	pcie = platform_get_drvdata(pdev);
+	if (pcie) {
+		if (pcie->pci->pp.use_imsi_rx)
+			dw_pcie_free_msi(&pcie->pci->pp);
+
+		if (pcie->global_irq)
+			disable_irq(pcie->global_irq);
+
+		pcie->pci->pp.force_d3cold = true;
+		dw_pcie_suspend_noirq(pcie->pci);
+	}
+
+	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+}
+
 static int qcom_pcie_suspend_noirq(struct device *dev)
 {
 	struct qcom_pcie *pcie;
@@ -2519,5 +2556,6 @@ static struct platform_driver qcom_pcie_driver = {
 		.pm = &qcom_pcie_pm_ops,
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
+	.shutdown = qcom_pcie_shutdown,
 };
 builtin_platform_driver(qcom_pcie_driver);

-- 
2.34.1

