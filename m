Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539CF4A7CA7
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155454; cv=none; b=Cz1JFIv6W5j11tN3A7rtEBzQ4fyEtMoCe++NhXF7uQ5fBCBEXPl3hO17J4z4LLWIfhGO1dpl544T5zIDctJlLvTUGw/0VR6RcR2v74o4tCgVPJ5bTS5mMaqqyIzeRX7/rBS/Gx84izKLoKrTQxMl7s2IeDZZDxdZ/3y+iufIpX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155454; c=relaxed/simple;
	bh=ib8kN+zutpgyERC03fFok903wnLQJ2cn8/iqOzdazek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ML6kmSlUyL/1quvANTIqb5g5pcXon+9OmjhdsXUNFWbhYkN/d36Of48fyHsUoT+0U2jnDUwx5TSKwBeW77Tirq/f05mhr1+Poqr770zFGIQiYddKwTHNfJRQFJGQvxWG/ZuzVEsb7kFxdH7v/OTqIjsOyfKgOQ1EgWZlZEqMrXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bNdbZpNW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VUo1uhC9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bNdbZpNW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VUo1uhC9"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAAhbQ1648927
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ovxg1R8USPr9BWV1mSYFdl/aecC06ac6FLDeLyMSI/s=; b=bNdbZpNW/aqB+qbT
	v1cU1ijoRwt795WB9Yss/N9Ue1a2xoPVqOP2w/IiyQPT7TZFysJCd03nf403dvJW
	97HYlcIw9BXutDRXdl9llL733dy8M8NCN6udFMz/T5McNLS55EIO+mpgGF9+ylu3
	9hAMKI5TJ1/lwQoLDSS/2KJHdStShBQBwwKpZxeqDfuFqjbiZapu9gWLm7nrR6e0
	JiH2ki1fxje1wY9PofsfhZDTyX01ukaChV/uxgZQBsGlSVVwTPnHSix0jLHxGzl7
	QPLxklm8xYwVLzS7w1dsjXLFKSvQKm5Ctm//j/ILQzNNaTZJ/OELeWdzCoVFPAN2
	r811ug==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbhumrjrb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:57:32 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3425098ae4bso1409546eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792155451; x=1792760251; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ovxg1R8USPr9BWV1mSYFdl/aecC06ac6FLDeLyMSI/s=;
        b=VUo1uhC9pg+ga1APsc+VOU9o9P/6XmL8MAdjWa27TxMm4XsOMTEUmDFZjUq8sZRnxE
         pQvR5VUkEyJWZi24uph8CJl1+1Qd0iEN5iJQfts2bwi2hX+Ew5Qsn/qadML1lMikHOgk
         XjHGaUlbYhOTdp+70lWqEbjm6ENINtugybk4GeA/JVrjtWIUqBcwQkZmShSk7zBx3lRe
         1VMPA1rukK6FdcTCCrZ0KqFJOIblEF/6gVpUTOgpYfvSFC0xJhc0/M8VSsKyjPUsrjl8
         9+O+3kDkQS1rCCVNM4itCsCtJYr150uVLYEMsKRAtsKmZOxdfChLKkMDHMLKojcm20Sy
         gWJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792155451; x=1792760251;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ovxg1R8USPr9BWV1mSYFdl/aecC06ac6FLDeLyMSI/s=;
        b=SjuQlOEiJYoL2kfFPNANp+iDyou9CcAHFjwcoSDv54OU000cgDrCjAqHnT2uDMNoXt
         zoCaySpqmK2bNiAmefrthN8YpyLZLD6HJA9L5q1obE4mWNFygKDVNW5kMuGmP6DaSXJD
         lT0Xcl+aeD1y9E5uBDqa8fzs2vJkXUI+/U1zfdq9PcEFUoll+RRf4CgAsx8pkMjoew/1
         JJAINaRkkZ4Z3n6m5ibVaK1aInYuIZgFPBZnzWXNQ1xH9/dGyMa2vlsG8btFtYSTdIVs
         /+0gaCI/5peVRDAFE+PrwyzHhgEbEW/cccAj0EqA0zyHG/zCHG62Nj/ae6b31eWs8sY2
         iSZA==
X-Forwarded-Encrypted: i=1; AKwUvByoQnXC/DcOdejjSmbMnY0G5fQztGJmF7FLQd/WyipDsOnQOifXyXPSLz8+24v8rspnsHx0nCggza31WOM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK13i03H2nzEYwqeEuCBEyQAoL+GR3ECaV+Wl2IbaRhyCYRcIUH
	aRNZwXIuSvVVaZcL9pLJjYJNWVdxUqCojRUmzHv5ynXpLnbGelJDCd0CfZkyPdHRLqNfG4pZRhR
	b4ogtyXyNC6bnRvpwj0LAXHKAzo1I7ycwjvf9fPN1j4sGVwnWbm95IIuK0heU3nhXUPo=
X-Gm-Gg: AYBFou3+Y9Ik97pPmYLOu/HxUthtuTYfvd3QipM3IixLu4CGwqJlPPkyRRCZDvzPxU1
	XlapQjqscRYMMbWNkWKaEJS1WUwbxJ2rH2gBhTH7rWTNF84ZEb6a13Zj5JbpXWYxoxTQqs5qnfs
	kP+C8DycJBJbSX/kUA/pgEmb0UVdQwQfSA2IzxO/PPsGsMk4cptuJM22q5yZlErOdv1eDQlxPE4
	o3rhzzrJERw/tWG41WlOdb+ayJ0VT+WkH49emcQFZCCqXsSUcf3xZAZxO65Hf4J+DQ4Dj+h4A8w
	wT44kbGSz7rlskQqOwMzDhUSECqWAlJupFmdOlX4yadoCgwPBdq2AjAmB8eRuiomdfXuS45UdFE
	W+O1gv1QmiFJaBQyVJJIBBUlVCwRZZMUoEw==
X-Received: by 2002:a05:7022:e989:b0:146:5f73:d45b with SMTP id a92af1059eb24-1824fa8be63mr4450272c88.3.1792155450928;
        Fri, 16 Oct 2026 05:57:30 -0700 (PDT)
X-Received: by 2002:a05:7022:e989:b0:146:5f73:d45b with SMTP id a92af1059eb24-1824fa8be63mr4450239c88.3.1792155450109;
        Fri, 16 Oct 2026 05:57:30 -0700 (PDT)
Received: from hu-msarkar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831996071csm6188285c88.9.2026.10.16.05.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:57:29 -0700 (PDT)
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 18:27:19 +0530
Subject: [PATCH 1/2] PCI: qcom: Implement .reset_root_port() for
 firmware-managed controllers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-pcie-controller-reset-v1-1-51779736cf12@oss.qualcomm.com>
References: <20261016-pcie-controller-reset-v1-0-51779736cf12@oss.qualcomm.com>
In-Reply-To: <20261016-pcie-controller-reset-v1-0-51779736cf12@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rama Krishna <rama.krishna@oss.qualcomm.com>,
        Nitesh Gupta <nitesh.gupta@oss.qualcomm.com>,
        Ayiluri Naga Rashmi <ayiluri.rashmi@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792155441; l=2776;
 i=mrinmay.sarkar@oss.qualcomm.com; s=20250423; h=from:subject:message-id;
 bh=ib8kN+zutpgyERC03fFok903wnLQJ2cn8/iqOzdazek=;
 b=D60ip/GMyULXRdWpThlRxv2nYKGqS03EOplPh0LDWYmuSTEIPZ7dAH2Yv6MhZp9qutQgmgA4V
 nwMMy1qnhGjA1Y89dtPP5E9EzkYqY6SdGrEzp8duFJ0rmpmwW2xphDl
X-Developer-Key: i=mrinmay.sarkar@oss.qualcomm.com; a=ed25519;
 pk=5D8s0BEkJAotPyAnJ6/qmJBFhCjti/zUi2OMYoferv4=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1MSBTYWx0ZWRfX0jb4fNRMVHOC
 hrEgfTbMBwl07tUZyOLpN66XFWNPs5GKUmFoELPrM8QLWnT1x9rB670sMt2HocBPhd9mEuea7Em
 fXCvC75UQ1gZYH/XZrP11xw4xFAwxPY=
X-Authority-Analysis: v=2.4 cv=H+BOUOYi c=1 sm=1 tr=0 ts=6ad21f3c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_Z1ICBCpGxnOzRxCLNAA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: LRZJ1x4pwebGJQJ2l4CMQ26BqLoYagh6
X-Proofpoint-ORIG-GUID: LRZJ1x4pwebGJQJ2l4CMQ26BqLoYagh6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1MSBTYWx0ZWRfXyGTYi/9/cBQb
 zPlWHV+k2e5O3eWxM558cKDdmFp+BRuPmKIFgyDb/ez8Ug9wIpF5FyKnWmY2Klw+yd5adWuBF4Q
 yf4GIJIqeoGkDLSBUGku3NU1CgKGGj0CpNRX7yucwr+EJlu3VON6HKkMcawUB5qWwWGdpjCi5CO
 VF/Dpxq36unJmcWxSGqiUaBLbNCxKretIJQvR5Pu13Z7FGHSFZxsmHbn7nEilOC6FdNja1Wlbk7
 8+qsev/8IMhg1PQugP75VCuerl7oNywA/9Vf6oIerEDMhLsWxcCw0j/+9PrY0mlLd3mIoQgzD5W
 84BKahP3TR7MZ4LgLt6xIkqWWapFun2rgA68OfCsUUEr7DCGRDIU20P9oMxPRYHuHxZUnHE+WIz
 p6rcoLodLMTXkuQ3S+pC/+o8nZGBax5JYF0BguvuT5nAxelVICFpHGfNvMzMI5iS6VptE/q4HRp
 ZyI4HnqWSOtkm0C6Irg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160051

During PCIe recovery events, such as a fatal AER event or other
platform-specific PCIe failures, the controller may enter a state that
requires a full reset before normal link operation can be restored.

On firmware-managed PCIe controllers, Linux does not control the PHY,
clocks, resets, or LTSSM state directly. Instead, these resources are
managed by firmware through the power-domain framework.

Implement the reset_root_port() callback by performing a Runtime PM
power cycle of the controller. This allows firmware to reset and
reinitialize the hardware before bringing the controller back online.

Since controller state is lost across the power cycle, reinitialize the
DWC MSI configuration after resume.

This enables Root Port reset and recovery support for firmware-managed
controllers.

Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index d903f10211c2..744455ae90d4 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1855,6 +1855,35 @@ static int qcom_pcie_set_max_opp(struct device *dev)
 	return ret;
 }
 
+/*
+ * Reset for firmware-managed controllers: power-cycle via runtime PM and
+ * reprogram DWC MSI registers on resume.
+ */
+static int qcom_pcie_fw_reset_root_port(struct pci_host_bridge *bridge,
+					struct pci_dev *pdev)
+{
+	struct pci_config_window *cfg = bridge->sysdata;
+	struct device *dev = bridge->dev.parent;
+	struct dw_pcie_rp *pp = cfg->priv;
+	int ret;
+
+	ret = pm_runtime_force_suspend(dev);
+	if (ret) {
+		dev_err(dev, "Failed to force runtime suspend for reset: %d\n", ret);
+		return ret;
+	}
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret) {
+		dev_err(dev, "Failed to force runtime resume after reset: %d\n", ret);
+		return ret;
+	}
+
+	dw_pcie_msi_init(pp);
+
+	return 0;
+}
+
 /*
  * Qcom PCIe controllers only support one Root Port per controller instance. So
  * this function ignores the 'pci_dev' associated with the Root Port and just
@@ -2031,6 +2060,8 @@ static int qcom_pcie_ecam_host_init(struct pci_config_window *cfg)
 
 	dw_pcie_msi_init(pp);
 
+	cfg->priv = pp;
+
 	return devm_add_action_or_reset(dev, qcom_pci_free_msi, pp);
 }
 
@@ -2292,6 +2323,7 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 		bridge->sysdata = cfg;
 		bridge->ops = (struct pci_ops *)&pci_qcom_ecam_ops.pci_ops;
 		bridge->msi_domain = true;
+		bridge->reset_root_port = qcom_pcie_fw_reset_root_port;
 
 		ret = pci_host_probe(bridge);
 		if (ret)

-- 
2.43.0

