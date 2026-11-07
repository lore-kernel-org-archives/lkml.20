Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794015961;
	b=A+Gga6sCbufbgCvgRMUQVGYoGkI5H4qsMy+24hk1dpC0J5fW717HgLB9UlHShpIXfZ/x
	 TGkFArQxzchbEBuB1+kJyosjXozn48SmR03dRCPMSFLj3oVWjtQtyJN+UYdzPIgJO7+nv
	 +3/y40RzPmt7c9gf/nc+/BPy9V75BsSLI7BuDupHRWEaX+79sSa3hQiR2ZfiBIQ6dVawf
	 9ozsqFBWb8+yLl2osDyoDw1yoUGGxCMBXFxidtXzejCGoGKGLAAIsnz9c6B2y4dP9zxev
	 58eRtWGnrBmhHqbn6NZVkIPkI09ISIBNZFegs/BYTcslLro4sF9hltXr5ZDVjezlxOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794015961;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KMNbb3rJ4gmMLXtZaN4598zNytchSh1teJ1n3udB1yM=;
	b=qouwRnvx9G4L8qOxr/ti0rkZYd+uAVeZLfG2QiZRK9hvuDBnIxrGSSz9KtxBfmvLWaNN
	 LLIGF288zv5VjttO4hz/4OpO3nAxnKdEezo7E7tZbfEOPl4vIA6anyJUU6I22dyThhTUv
	 Hg9RtnCV5Qr7r1iy7ypnqwGYfTTSEhKp65PLqph4l5W7n9oUWnC9PJ3s2wvTyNSBldlpx
	 enuJjMQehpt6v6+T8dbvudFJYX4MUJeR7LYNBstUAC0cWJW+Oy1zKZ/sdGRV+bDsbQAfc
	 nsl/WxlKQb4/8NXRx0UPg/vYS9IY+PtEi+FC6HNsKnTA/DOBZtscNYCTBDqJ7F/agJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZdJ3sFAb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eAPd3Sl8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0E4606D83D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 01:46:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA0E4606D83D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZdJ3sFAb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eAPd3Sl8
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6MnpPl148674
	for <linux-kernel@vger.kernel.org>; Sat, 7 Nov 2026 01:46:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KMNbb3rJ4gmMLXtZaN4598zNytchSh1teJ1n3udB1yM=; b=ZdJ3sFAbH3yC+84h
	70jmoOJGECZQUFi0TiJNg5baGsmFiZLPfPl2KQ+T8tMaCOD4tBatSh8ZeEox7E5X
	YkwP2Jd7z0B5LGYi+0zgiXhrSLf3LMA25b9CtArmh/lMjJ8YLs5n0TxMIKK/jGG4
	LkvzWRQF9a/cGBC/AOfTo9+UM8R1papwsi9puvvfPR7aIEz/v019FPyeyWf35JkJ
	xxBCQt5Pi+bOvC3lLoTlc4YYKlvMSP+Bt4uLTbaJ/yTtzzGT6YtBPKVujOrLBbz/
	XGk1Zh5HDca0itJpzifO0vcFnOCfX23PbLrrdNl4n+PSXHWoeXIx6ps93LjenZ1J
	/AfBCA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmyk134h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 01:46:00 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36d69ab3c2bso1609158eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 17:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794015959; x=1794620759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KMNbb3rJ4gmMLXtZaN4598zNytchSh1teJ1n3udB1yM=;
        b=eAPd3Sl87xiDD2KsA50PV7Ot6bjF8vzj4eqcPsWilMaA2rNVfAWLEhFiaShFnSIoM4
         1+pylxAJGOwkuguEZ8ee7uVWCJWBna12cVU6YNPEJjozH34xJiWJFSP/tKCw8jfHyMHx
         yO/KD/76+v511Dq+KP1WtuJLeZ2M+fMKkBcL1WTl6kJ4J/+uDEBLus9xKE9DI383iIHv
         YPuN2D2ET25Q9/DHt2vZcVYNBqvhAkz1jSMjAml6nY6+DYqyuZ5AADL1qmpgmOqcaLPR
         72tFrZ//KrU/BPfazcBKH9Teu+U+NjL72ULvoPwrl9x3j5x0R3lwOM+Xbb9nknqbM75V
         2jSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794015959; x=1794620759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KMNbb3rJ4gmMLXtZaN4598zNytchSh1teJ1n3udB1yM=;
        b=D7yMUADsmb+dja+wFbAD0WLNz31Moy56n7Yj5UPp9Ed+kmOT54YxMPeQYWti4Tt4mb
         SDbmItucD7LKLLcLXdr38OuVkUUeGZ/n6D4L6VP2kSe/w6ZDzFBwgA/Ul/ooJkkcMvjb
         8HOs8Y2qscX8Gvj0yp6xhRErDiKfSw2QZXlE3Bp+tJV4rxF0H7C+lV/vRBdykXLg6cWw
         f0ql0YcfamfOow/JZhJ7wMKQMWac3AAzF22xjWTdL/XZZpFKvnWT0KPCBxMmBIUfyvPa
         mVczwEvt36UrutS7NJmQlF3XYM4zvEis0FjIAKQEYCL0GTLMbA2g0LsaeLz2i95+yHSq
         3oug==
X-Forwarded-Encrypted: i=1; AL+hErErmg45l7op92vc7rjv393v+LJS6vdSKAo5IpPvnKkf26Qw9i1W8soePXcOhwpDg1p3nV11LQ7EWUCo8Es=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0ojZU3X9vv12dtR7pTQxqckebXQf8jvcgYi5nhvMiTWlqhSzy
	myEMVO+xoVMa1EOsaY/jpd5XhvojkKzrJyXRFhW2ZllQfK5U7rnlAb1bsqIVMHVM2dDl1H1g8V9
	1W0I4l857CAx7iCOykoXVJ2Dvbsnf61mCbfnk1UBmFGBVGBeiQ1kl70A+3wdtdeDKAUY=
X-Gm-Gg: AYBFou00hsoMdwEGeWGpVBWIbFBS/mtVWlVclTpGti7KEsUQ1H1MfizwBU1R/wUn3wp
	OTBIKtDQfwAi/1QYbtO39vHX8jIoGFSu+EBrIA4H7VIswDxQdkMmhW5N8PMkfGRowuiteS04FOL
	7AE0TotUavRzr/ToCHg6CK73HPstl6IuatLSlwMl/g1t2h30JpFRW4sTJLR/yUvlMUkcMf1HGry
	SZcT2+isOAwNLPacpYXFYP8K4Y7wjJKjOhZcSTPmALkkTvtSO94G8kv0g3SAadfnj17lram9c7L
	+xEdI00og8eZ2XQr9I3QJ/+WOJi9tCNmlSusga8LYPfYQ/0K7OOYoY+rAtuBruSoQWkKlB86T3O
	J6ztA9iQbE/NSUq3hUrsWqFaUueCTZk5w2Sm0kVCMeI4r7aRqroeQX69BFWgxjPDcn83lZEzH74
	PvbZ9LLwA=
X-Received: by 2002:a05:693c:8859:b0:35f:2bc:82d3 with SMTP id 5a478bee46e88-36f75a25e5bmr5793966eec.15.1794015959227;
        Fri, 06 Nov 2026 17:45:59 -0800 (PST)
X-Received: by 2002:a05:693c:8859:b0:35f:2bc:82d3 with SMTP id 5a478bee46e88-36f75a25e5bmr5793925eec.15.1794015958533;
        Fri, 06 Nov 2026 17:45:58 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651e6b1sm22861123eec.3.2026.11.06.17.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:45:56 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 07 Nov 2026 07:15:22 +0530
Subject: [PATCH v8 4/4] PCI: qcom: Implement shutdown() callback
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
Message-Id: <20261107-shutdown-v8-4-bf607c6429b0@oss.qualcomm.com>
References: <20261107-shutdown-v8-0-bf607c6429b0@oss.qualcomm.com>
In-Reply-To: <20261107-shutdown-v8-0-bf607c6429b0@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: konrad.dybcio@oss.qualcomm.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794015933; l=3339;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=JmdrJ94XKia0WQjg0e57QQB8kLzW3inNONqx8lGBXPc=;
 b=917PJjZ5B/jW1tBkcC6BNjr1EG7m78SUtwkcA81Uk1hI4MbokabZNcx45AgfwPErtQcumeFaD
 DSWeUH1OEOVD5G5MfLTxaJNVQmhsOzRuDc5841/SWIuJUbHw+HbEVAz
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: ZgJ8QgCaaoBhTR8wcgXqoa7e-ePHoZBN
X-Proofpoint-ORIG-GUID: ZgJ8QgCaaoBhTR8wcgXqoa7e-ePHoZBN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDAwNiBTYWx0ZWRfX5VTu12Ib+kV8
 uMmnpGnc3f+CoOOrRve8fMfqNDAl0k++TD8zbXBrMmEw+5/6dbxL3gPa9gcBOao9p9+pq363oWm
 Sxx2WjTeUbq+a1+8aI9M9dwHzqhjIoA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDAwNiBTYWx0ZWRfXwFXzMH5IqmMk
 /pu8XhIzbrfKIQKhLzm5L1li+8YWeVFh9XI2+8OeJp4mRqOn6nXkeigT4WuXqjg3bFs29TMC25W
 +fG76BjEeXCH+lNSFFika+26s4JqVG1bO+Y2bKc+4ezaPLGYIdOI61AIqXdzA9jNSiRVZOE8Iez
 XyzrO04s0qfNDSbLMywlylLIa6akHrUuYmbS9pkSIiZwjjl5DO8OQjTsYk0iX4outtwaxsOyekY
 mIf9XjsTpEyDYIhDh75pQwuU0T11cFlF6cHTo5qcQO7WKOTKBjyWFpIYHXL81CiH/GQ0N5JbJ9b
 7QPgcTnUBgWw70meV6GogfmvGXc2IMwMz5oL+cHvtJPT9QxIkteVGuxunZ8PVMGd3H+iRkxL6fZ
 J0zuNQPmVfbfbEgG3ydJ4vlcjwg9UUs/kDy3JhgseAVz9LjwGzYXZSQ/I6bABnuWd9qAahPh9sf
 H9FLsXWKV03VnWcJfCg==
X-Authority-Analysis: v=2.4 cv=I5Tw19gg c=1 sm=1 tr=0 ts=6aee82d8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gM652YqJFP5vwQx0TG8A:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611070006

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
reach a handler that touches now-unclocked PARF/DBI registers. Use
dw_pcie_mask_msi() rather than dw_pcie_free_msi() so the MSI IRQ domain
and the MSI mappings held by downstream devices (which device_shutdown()
does not remove) are left intact.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 41 ++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index d39753f0e724..c5b06db3b92a 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -2046,6 +2046,9 @@ static int qcom_pcie_ecam_host_init(struct pci_config_window *cfg)
 
 	dw_pcie_msi_init(pp);
 
+	/* Stash pci so qcom_pcie_shutdown() can mask the MSI IRQ(s) later */
+	platform_set_drvdata(to_platform_device(dev), pci);
+
 	return devm_add_action_or_reset(dev, qcom_pci_free_msi, pp);
 }
 
@@ -2466,6 +2469,43 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static void qcom_pcie_shutdown(struct platform_device *pdev)
+{
+	const struct qcom_pcie_cfg *pcie_cfg = of_device_get_match_data(&pdev->dev);
+	struct qcom_pcie *pcie = NULL;
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
+		dw_pcie_mask_msi(&pci->pp);
+
+	/*
+	 * In firmware-managed mode 'pcie' stays NULL and firmware owns the
+	 * link/clock teardown. Otherwise, skip if the controller is already
+	 * suspended (e.g. a prior resume failed), since dw_pcie_suspend_noirq()
+	 * would touch DBI registers with clocks/interconnects already off.
+	 */
+	if (pcie && !pcie->pci->suspended)
+		dw_pcie_suspend_noirq(pcie->pci, true);
+
+	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+}
+
 static int qcom_pcie_suspend_noirq(struct device *dev)
 {
 	struct qcom_pcie *pcie;
@@ -2657,5 +2697,6 @@ static struct platform_driver qcom_pcie_driver = {
 		.pm = &qcom_pcie_pm_ops,
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
+	.shutdown = qcom_pcie_shutdown,
 };
 builtin_platform_driver(qcom_pcie_driver);

-- 
2.34.1

