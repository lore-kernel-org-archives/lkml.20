Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075AD2DEA7B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155458; cv=none; b=AxcgLDgTVpmttBxzfFxvNrVa9S38sRvZOGI6UHHTU05NtUCjTaWVwkyN1gTybolzXo3/hQFl2dfmurjvDZFW6WMg4QlA6WNBYpK/T76J0+hS2NoD13Gg2+E4iEhC6u3zgrkLsxia/Y34CES0wa5k/NVZWnIpcCrG3QDHCna4Yts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155458; c=relaxed/simple;
	bh=cLOybjYHCQvvw5wwBKe6pH7jh6gVXSd5dIMqBdQIGhA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SvXDB7sWBc5eezMKcCjuxkw8FpNUAUhBNoQZppMouQOMp6K5MXZuQvora4p1S4gv9elRjHh/oUV0kdCPS3d/VrO13Q6pPGkRMRUt7FLdS1n2M0KwzB1qAkH+mXuTE6J2CEArm7ZD8kWLFzck/HQcjtnJevFK+fs16uqw1P+l+qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IoaqLazv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I+ybUU18; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IoaqLazv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I+ybUU18"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAAE6t1983359
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:57:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4BRKa4/qcmK5eNR5mJGC0017NtZsgVMDiU1xJ7wXN10=; b=IoaqLazvSatn5KXX
	jztR9O3qiCmUC9ThsRLZE2+JjTESQMwvAaF7EpoWqXNWFvu/L4P990T5WLC5n0IT
	pX1bp4A1oKFeNCWZR9BipKNK5bF26jSCCucNr73nEkvoqgWGpE+edlkQvXx0Ozx1
	OPJwkmItu8tavAXmjuvrGxXKpEKBmg135etRNz5GlVubB9azll5+8nbUDloz3Qqw
	LcKnIrg7E0c2xmgLTnX4VyS/3+s/p9LdNbjJIkVxNV5op1c6NH0MjNi1wWPKIu3O
	ayj2NOqCKdu68JaW1xqS5RTceCsr6OEZ9TtuAKl0dW12mG+S/ldD10y0n/zo/dhQ
	coGoEQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8a8aph2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:57:36 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-152d1363a29so22654890c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792155455; x=1792760255; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4BRKa4/qcmK5eNR5mJGC0017NtZsgVMDiU1xJ7wXN10=;
        b=I+ybUU18wt6nmXNMrQKGgB63QnjSGi07lD/x8Mha5tJMEsrGNdV9BNONH6Oy7oO2Og
         6u6ktJayJ2DhfAjV/8hFI8q64WliMQVeabY9h4ozV1977tBdR6ptC+5/wRDZbnl/qkgq
         6im6BEgOuGFJx6Rb8KCYivxlnAjQOxyDXzzXfoAwdt9q2Ht2K6Mytw8Lww1j/xg1AZMw
         0Cau4FPnVz6ahc1BjTlhR8kQqnVD0cJiVspik4R9NXiTmfwWGWxLqb07anYjUptSQanH
         7/hjQZ8qlFL7SMmyQ08EpAC4PwDUQiawUQOdfhMkcJLqM4/bdW8n5mERrPCu39JJRSsJ
         940w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792155455; x=1792760255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4BRKa4/qcmK5eNR5mJGC0017NtZsgVMDiU1xJ7wXN10=;
        b=yJ8ZEGhTcNNcSuY4+W8HYQhIq3EXWpL8ba4yLII+k15rqsRYSlClqs3VYZ4re5CPSS
         s4qh3uMhb2aFq0skOyj9SCkAg9x2CcwSQOf6UwBlm06xiY/ghlFi1ysv+ihNeywpgeDT
         xaFupT3irJCTFNd0tEPLf6JVUKrQgmdEZ9uig8MCXFHmtnN7S7koeGGE/BuM15oBq3le
         6TbcA5Ot32U1VJ+ITsE9l8eD0ZLBwXXWvk/E5WWS9Icn57u3f47OgcMqfWtMKzZ5BBRf
         CRLuSgsHk4HnCsBFKo9keUfzMkSU+eGVwSgLR2/JXawfw2h45Hw1/Ak3L3Mmnvh4UzBq
         IY6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzwGdbIswAc8znx+ry/1Y+qqfCjJyVyxFiI+R8U69+vHlnr4NDKmjjxCK/8vAeM+AibVPffizuWnR+pJ7Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIEDB7JcWTtO2DmKzmNgPjleD0Rxd2EoMxzigVjRheXcfLRtP84
	AK0hzjLuiS2zRstiPK/24ailS80jr/DhCTWTzMMjLCfF81UkExjSk02tMHZzhRQdgxZOOvjhntO
	U82B8/uNvvg4PFkogcw07hBmUjrL2VARUx47XhJmN5flJa+S/kyxa3Q57Ykh9K11/hY0=
X-Gm-Gg: AYBFou2b1ruATfW36UxYhPr6Kz2j78jFLLlaBgpL+/YCSyPjQT3I2d9srb5JMG4QUn6
	vyMzgrZrSFpT6FUzVAQHV1dybhNnXiELYfm4lA4Yj/8pjKt0q/I7O8uDnAwlA7tjMMLk1mN7CZz
	obEzPA6v0JiQWIhTZQJEl4O3lX8uCU1HUexNEgz0mPx8qf9OTSfmJDrgNONTY4sZ927to35NvEV
	BFdh36bIZ39ny1Bqb/uR0V68R/AymUBvxaW6Im1laRNTpwKjRhTNdcEzpfBZuN5EcuZjpog2j5p
	GPWqJC3UXUX4F9LGZm1hH5yXl5eNji0JU/CLdUIxylKEMb00rCYykdiA3r+VcmZgz/TgdOrZBSh
	4IQZXxrXOXYDtTXCkmAa3vtt3CzoX8izvhw==
X-Received: by 2002:a05:7022:29b:b0:15a:9834:73f2 with SMTP id a92af1059eb24-16a5fe7c16fmr32012264c88.38.1792155455285;
        Fri, 16 Oct 2026 05:57:35 -0700 (PDT)
X-Received: by 2002:a05:7022:29b:b0:15a:9834:73f2 with SMTP id a92af1059eb24-16a5fe7c16fmr32012229c88.38.1792155454681;
        Fri, 16 Oct 2026 05:57:34 -0700 (PDT)
Received: from hu-msarkar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831996071csm6188285c88.9.2026.10.16.05.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:57:34 -0700 (PDT)
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 18:27:20 +0530
Subject: [PATCH 2/2] PCI: qcom: Reinitialize MSI on resume for
 firmware-managed controllers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-pcie-controller-reset-v1-2-51779736cf12@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792155441; l=1653;
 i=mrinmay.sarkar@oss.qualcomm.com; s=20250423; h=from:subject:message-id;
 bh=cLOybjYHCQvvw5wwBKe6pH7jh6gVXSd5dIMqBdQIGhA=;
 b=u6CYb1nS3ZIWANu/Ndou484Xr1UDbc8DADXKWudJjpdWVOUhWgmB3rhPXIvoMs2A3PzL9pQ4q
 Llg1CZWl39cCsoODoA+EY9zMbsPAsjJBqd2HsBLmJnP5LC4TcStaH4k
X-Developer-Key: i=mrinmay.sarkar@oss.qualcomm.com; a=ed25519;
 pk=5D8s0BEkJAotPyAnJ6/qmJBFhCjti/zUi2OMYoferv4=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1MSBTYWx0ZWRfX5tB8DuKcu1d4
 WkOrjPBzo+9Sg6WJlawdE5RK609/SsAH6CT91uADK15jDeZYEzwHKJtHQ7WQhBl4cfxr1r4EHbn
 bdbkXlNyn3oHJHEqDz56b7cnyq4YydU=
X-Proofpoint-ORIG-GUID: HuF1_kRDWwA6jZEkQSZ9FuAf0dRrdRlA
X-Authority-Analysis: v=2.4 cv=GJadgeNK c=1 sm=1 tr=0 ts=6ad21f40 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VdY5-eERFFFFdNr3g4sA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1MSBTYWx0ZWRfXzCNh6EtJkMwY
 C+3SOXbdjaliYQfaC+WFIqIPpX+lf2EKKG1CYGTyWLdspEfG5Ct3hjh6nScqojHu9XXmSRWNKJC
 j3vmm3ja15Zcge6kHAWhOuztdMknNRaoQQT0I3XMg+/5DdaCImCBfQAmGt3//vt7UuJwrElRxsD
 74M5u+M8ArLH3YJf3dCwIgThGVoA87jDj/BJrskTKe3+mx+KDZD4+LYZL8n+EAzBbRgi5+XkO6t
 kpuPbNb9hZG0Ylrx7IgEmha6wQmzV/LmO4FkMR/iAK9CDYBoKiEmb+uOeq07OlwAU0gIkY+5BtL
 hNKkS26y9Bg/g+l23JeKCEwv901qhDxH6lTBwGUIj+qh6d+G1cCEwG9uV3W/CceVIA7DM23jhBo
 k/LysROCB3wrzQrI0v3dTq66KEtuERSQp76zmcBxz6QoaPbjxhQwV3fuFLGoPFcueUpzgkhVyZG
 AAzMEtkopCfN9xXAq8w==
X-Proofpoint-GUID: HuF1_kRDWwA6jZEkQSZ9FuAf0dRrdRlA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160051

On firmware-managed PCIe controllers, hardware context is lost across
system suspend. While firmware reinitializes the controller through the
power domain framework during resume, the DesignWare MSI registers are
not preserved across the power cycle and must be reprogrammed by the
driver.

Retrieve the DesignWare PCIe context and reinitialize MSI state during
the resume path for firmware-managed controllers to restore MSI
functionality after resume.

Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 744455ae90d4..116622843d2a 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -2324,6 +2324,7 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 		bridge->ops = (struct pci_ops *)&pci_qcom_ecam_ops.pci_ops;
 		bridge->msi_domain = true;
 		bridge->reset_root_port = qcom_pcie_fw_reset_root_port;
+		dev_set_drvdata(dev, cfg);
 
 		ret = pci_host_probe(bridge);
 		if (ret)
@@ -2551,8 +2552,14 @@ static int qcom_pcie_resume_noirq(struct device *dev)
 	int ret;
 	const struct qcom_pcie_cfg *pcie_cfg = of_device_get_match_data(dev);
 
-	if (pcie_cfg && pcie_cfg->firmware_managed)
+	if (pcie_cfg && pcie_cfg->firmware_managed) {
+		struct pci_config_window *cfg = dev_get_drvdata(dev);
+
+		if (cfg && cfg->priv)
+			dw_pcie_msi_init(cfg->priv);
+
 		return 0;
+	}
 
 	pcie = dev_get_drvdata(dev);
 	if (!pcie)

-- 
2.43.0

