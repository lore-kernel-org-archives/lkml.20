Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6B34AEBED
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789643622; cv=none; b=pdebQyNTTuimIGHCeg6vR9FJni0zctm/c3y43WF5Z86+Tu/yLjolpAxwIyOElchv8XnCR1bC9ZyR03w4Y4PNuRU+T9tkVZOVDCeKWJ52FpJlbLD6Fc6P6Gc0S+oCin+DEnpB3ALKsW5qXIqA2FwETd568som2JT3T4wB/LvK9x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789643622; c=relaxed/simple;
	bh=QUu5ITDtHc8Ii7Zs3ZplM0M3E2yE5hAdCQIs0YkDlsQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IQWdU4aPCl9zGb9WQAuS08SpXWZ9+Biw6Hd4AKNr6g/aSCRp3xwvQ+lVhIf6oXuaChPNBjy+rUrB3Z39aYTCuQi7xLvyt6e7hL+ifknaiIV0zBFWsZzMrg7byjaiinvRJTLJsHFzog69Q5YQY1VAu43K9p1HCp3dkSN2uekclw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jiZuv3Gk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c79q8dNX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jiZuv3Gk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c79q8dNX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZtoO1390178
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9kQCeIkddaHgKq5hDHusu9
	orA0+/BEWygd1EJCMNODA=; b=jiZuv3Gkxfxn6l9/udf1beliF9IoaVJ2ySCaiM
	ZmLTF21E0AjOMnmQBvIry9I87Nup5uDCxbOVsbjpp33WLTKTowfNlSbUDKy2SSAP
	TvwkULPtSWq5VmBPl59g3TNJ2BPoM0B+xdCqWcZgCphnMelLvpXNGLElxVWcBa1t
	WS/f89xEUEX3vhgwhNMNfSM5ulQv30t6bgBcbAaQ29VuVrDtTQYOyivXTSwVjPKB
	R6ZwhClSDS7ZuXOSQZ5hqnTkdIbFyPevpMlOWTfQyLgCjMlX2lPVaKZ+FkWhtLGH
	2vpil7lZ8KusYQfsIidOBQXnpDv63R2oSPQxeeiKyhr4d1vQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy2d436x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:13:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6f80c76e6so14870735ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789643615; x=1790248415; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9kQCeIkddaHgKq5hDHusu9orA0+/BEWygd1EJCMNODA=;
        b=c79q8dNXVczzs/cVikO3yVrZ6YzoPyOMXIOBDyS1j64J75gnHUEBWVa3DiObroLE91
         I1Kan9Ab/n6gVV8LERK+UO/wBmAYSAI1BmoDw7P35o/VBO6vMpKWeUT9hjoHdIko+U5v
         bt6eP18kVXGyTijBC03hNfPCLlC5q+CN8oLbuDcc6yaCmEV8zO02LS9KhjXQz19dZ+W5
         2RWh3qIAfrleD980dUyx5cRk5sRcHH/QI1l3RRlyik4227fXOmIc2UC6pkzytfXyvM0E
         6IBeJIXLKVzTNIPTNlrjTIK6UhbX3eI0HgPpV4NGupc0I22+Wx0Ci9zwHDjZgQaUtQXw
         7Law==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789643615; x=1790248415;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9kQCeIkddaHgKq5hDHusu9orA0+/BEWygd1EJCMNODA=;
        b=wCxyW/hVQBie0BHO0D8gCYrWM5lhjFVor6GIrXnDO94X91URIzyBzVs9iItg9Zk4R+
         iO95okzZB2nGlE2oeSyynO8MHQsNtL4hUI1BInMqjSninc6aGxqM5ByV0ETrLnmy7aIr
         cqSZ4Sr0mPtlaxqrGsto/p/uI30C2OxKerRjEdI4w06aTdFEqgPEWiYnAxGPYykosgd8
         PLjP1Gy+Vp4YrF8EM1AmIh6nTDzdK4xw3oCFHnMm3UsoKNyyic20NFsvkYSY8dyyJmQN
         wOVCjLPWRH0+oWvOkOWAcLzl41y1vjmplFVtsqdYkxN515F64qp0rK0nL5d0GRHZHMFD
         kmFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwVLcRYAARMAba1ihtgx3fyjZXBw9JQIl13N9FXLTbFiDOz+Qjtdz1eUn/BLkRSpUXKoxQfUQSj0oSErw=@vger.kernel.org
X-Gm-Message-State: AFuF++nkezoMK6OhQw+P8ftbpIBL+Hyv+GaEUNOZjfiE/FBzdvllWes3
	J7fLP6+rWbvFv4xTU/lXnOx4+xY19aJa/JQoynMy9x2bDdOwiVujSvYqTmZA2tIMfWgjusE7Eoj
	tK28K4nwiVA1sEJKmLLcYe16TWLJvn6oV2AnsatyOizMU8su/y7qbR1Cuw82JIwSgR9c=
X-Gm-Gg: AYBFou3L3TuPVCOZWGGUti+iKqcZkc4FWz5fopUWPAeUIPZzv0pJmzOliZIffhBJLXW
	lAp4j8EKiKfxaHeW1Pe503ciTd4q2qIjt+n/25ARKnkwpHod/r+CnQ0vkSBHrhUdE4qqbq4lns+
	IWiOFD2Z+szeX3kjRhmTUZd6JFRUhx+Fqtc4/ljq+qtCk8I3nDQ1xX0VI/9JIi0AJ6WWRcEfHNY
	9e3ZhaU6V7Z8OSWALItWuHXP46mbfXsdQbYXxTerP6EYcM8sHxnlMiwUVObBrQ0j0rUiemAF+P2
	Tgon9Uqm7cgTsdGrigbiJgL4BGMsC/WpHQNeYcVfyyC2RHYS3LNHLOP+vpuw3BuLELIidATxOj4
	Bez7cF5EUzSeOgyHEmw==
X-Received: by 2002:a17:90b:3bc8:b0:398:dcfe:968e with SMTP id 98e67ed59e1d1-39e1e504f3fmr21894845a91.20.1789643615493;
        Thu, 17 Sep 2026 04:13:35 -0700 (PDT)
X-Received: by 2002:a17:90b:3bc8:b0:398:dcfe:968e with SMTP id 98e67ed59e1d1-39e1e504f3fmr21894761a91.20.1789643615076;
        Thu, 17 Sep 2026 04:13:35 -0700 (PDT)
Received: from [10.213.102.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c13f09408sm4182617eec.7.2026.09.17.04.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:13:34 -0700 (PDT)
From: Ayiluri Naga Rashmi <ayiluri.rashmi@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 16:43:28 +0530
Subject: [PATCH] PCI: qcom: Skip DWC MSI host initialization when msi-map
 is present
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-skipmsi_forlpi-v1-1-14a4932a4311@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFfLq2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0Nz3eLszILc4sz4tPyinIJM3RTLZBMLs0TDRAOTZCWgpoKi1LTMCrC
 B0bG1tQCYK7EmYAAAAA==
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>,
        Rama Krishna <rama.krishna@oss.qualcomm.com>,
        Nitesh Gupta <nitesh.gupta@oss.qualcomm.com>,
        Ayiluri Naga Rashmi <ayiluri.rashmi@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789643610; l=1576;
 i=ayiluri.rashmi@oss.qualcomm.com; s=20260908; h=from:subject:message-id;
 bh=QUu5ITDtHc8Ii7Zs3ZplM0M3E2yE5hAdCQIs0YkDlsQ=;
 b=n1CKNuBfoJyw5Axyahxof66zhzd8kkbyMzZSmkxQqn7DCBRSmNLfmijtb0TZmurHit2D/AgQF
 +eMSursPvKtAMaMmtzuYUAnH4eUwOHVp29FDnYJuNG4Xq65TfDWgNrZ
X-Developer-Key: i=ayiluri.rashmi@oss.qualcomm.com; a=ed25519;
 pk=1QirVYY/Jr5yksouJ2UVoj8WgvFV0DslFw8IxhxBIIQ=
X-Proofpoint-ORIG-GUID: WyLGhgcL5MAAA8howKBCJWoBwg_WAMo1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE1NSBTYWx0ZWRfXx4hKfwdZ49lL
 gc2Wp0IabmRqcb/zQa/wWLr9bpf80ow2t1IzsGGBDuL2k92S+r+3+rEYNY3PjsqG7QLLhpDfd8S
 RkXMafIaX/AQlq59JOaBDdBByqMOi7g=
X-Authority-Analysis: v=2.4 cv=HbeB3SE8 c=1 sm=1 tr=0 ts=6aabcb60 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=dUMTi_qJSBHAiAAREwIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: WyLGhgcL5MAAA8howKBCJWoBwg_WAMo1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE1NSBTYWx0ZWRfX8Y8xj+N1GJQ1
 SxA/SyxeNlZ3YVh4Bbe9EWtsh6gNVMgnvHZlC3g/sXv/HgiGW1u/AxaX+7J2poszgvGeMMqagDS
 R2L9QO0/dgY8smvgYiu2opwbu43M7XipOTG6ywCUXxnSsc6KPYlQGPVGLlmxbcwzS8SBje2/IQl
 q/bXQL7nj8Vto3X2OPFZe+No9li/GIkvmI/iwW+nadbEMMiG950vzofbZeqo75cW2nz2Zm2ayJg
 ifnMH+NRgxhgUoNXgZE3lkw5jJ80QPkLCTLKPx1a9HLbe0JohO60eLc00jZVXW1pRCirpq9oqUh
 xuLuFNXM/igXhSM5LVybzMfRs5eLrMmHOwRG3ZzmisdAOp9hMEygVWF7dPYwKyde/lq5y6Wi48a
 xobIR6CRgbwMvoyDqJAJb5NG4hqqkNa0MEhGWCgOfLYEHZKPMOiLV1SXzSbhQ6zh5mqqDugUXmD
 /G4hW88SOVGU5CnEHBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1011 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170155

qcom_pcie_ecam_host_init() unconditionally initializes the DesignWare
internal MSI controller and sets use_imsi_rx, irrespective of whether an
external MSI controller is described for the host bridge. When an msi-map
property is present, MSI interrupts are handled by the mapped external
MSI controller. Initializing the internal iMSI-RX domain in this case is
unnecessary.

Set use_imsi_rx based on the presence of msi-map and initialize the
DesignWare MSI host only when iMSI-RX is required.

Signed-off-by: Ayiluri Naga Rashmi <ayiluri.rashmi@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index ee63a6ec99de..b65852c32a55 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1981,11 +1981,13 @@ static int qcom_pcie_ecam_host_init(struct pci_config_window *cfg)
 	 */
 	raw_spin_lock_init(&pp->lock);
 
-	ret = dw_pcie_msi_host_init(pp);
-	if (ret)
-		return ret;
+	pp->use_imsi_rx = !pci_host_of_has_msi_map(dev);
+	if (pp->use_imsi_rx) {
+		ret = dw_pcie_msi_host_init(pp);
+		if (ret)
+			return ret;
+	}
 
-	pp->use_imsi_rx = true;
 	dw_pcie_msi_init(pp);
 
 	return devm_add_action_or_reset(dev, qcom_pci_free_msi, pp);

---
base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
change-id: 20260917-skipmsi_forlpi-d9c486a1a04c

Best regards,
-- 
Ayiluri Naga Rashmi <ayiluri.rashmi@oss.qualcomm.com>

