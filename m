Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794621670;
	b=TP0xVJV2kARNt7/kgc9qLXsP5zb5QkyVqY9tar6uIFQPfC09EmSiT8GF9HBL0jzARI77
	 SxeHhTkJPoPdLDoKsTw1ScU5Gd3NC7H+rdnSY0acg8BTX7gOk8n3ac+4BKqwibOlAF84X
	 5Oucd1IRkpSroK/3mR8KDtOMfgHNeT6TAkqT0AnCVMUeZAIQ9FSIy+xCO+7TlBJqPT/8N
	 7djV11xQVBsxCVzSts7H19Oqn16KC5E8uTRvY2GsvDxkbwXljVcW0Ib5jGwzWnP1Zv5Us
	 BAS8eYuc9AEuN2bj93nwDwSaycUKMffw+RbmBa8RqM+RbqTYTqqUfHO1VzXvOYrvSlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794621670;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RmakcOIEjNauQl1koJdcjemBDCllm0Kztf8XnpO48fs=;
	b=Q5S/RdhK41yStT4hr1jZlYTwmjzUr2TdrQOckgoqYOvRzcethN+EmJ/zD4UFM5hvJRw+
	 462MSPdwww3w2g7m5y6YvWBXNf5I9RY270nROlffqqgkiZK7Se5UV3CfHQ1musJWmAqqm
	 xi8I4rLpah9RePO0jDGYV4WSP9rcX/1UK1ZwEYlzsKhpK/6lh3sNwh1cN92JxoiiF6sM2
	 D66vHVq4T6zFjvVfLOpdfAtQijeQl8Jy2DVClB40T7b5KDIP/B0qDUHLZqjPa9i+6ThvI
	 RvUcoiYzql584JnLwJus9zZOg/ZVJUm0TlReicHX5h8lK98vbRVKiWF8/1CApz41+Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UejrRufn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TA0YMhvk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7FC60A3821
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C7FC60A3821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UejrRufn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TA0YMhvk
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE1xxcW2174702
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RmakcOIEjNauQl1koJdcjemBDCllm0Kztf8XnpO48fs=; b=UejrRufnMaf0GcJk
	Uzr6Mpu3azVPEzTMXdHMgJcYg6WWZ8+MG8ijnapS8tu7TvE5Mt+syZzqVjRuM5OY
	Nc602b6RSZQ3tq1KoerSQX9gP8ccAZxmruwk9AD/eQ5OFRI3WJhLnlwFseenxVrb
	irD8Zy7UQjrCCCQvVRUZQr5qr/MC6XlIikyGGlm2WJhQjwpjaEEWd7g+gwrANKYr
	omsHFsKrk/Uvpicf8HG6/+pJhPTiiA4/kwz9dDqmDBdcz2pDn9zfEnkeDfQs0uXm
	5m97J1iQPXjgOX/XwS86n5bc/1q0jinl4+74WNS5lhH30kfWo8X4mM6gP8iSeDe3
	ClxtyA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxdwwg2hc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:01:09 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-370230d93efso6906889eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794621668; x=1795226468; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RmakcOIEjNauQl1koJdcjemBDCllm0Kztf8XnpO48fs=;
        b=TA0YMhvkFFd00zAZTV215BMDcIUMbvBv7tC1lNibvUAob5f7QHtJOmYoOdYEDkEwmF
         jpOy0jJKMVDSRLTBv5jDPa25ASKvjjOoExb6YA1xqvHO5F5g8Tsx5OfYhJRp3gyjC0rP
         eZiMSoeIZiw+YsQUgC2pOMa01p3ZnwViPVHpyl+0OOoP46+k8HudM1W1bySVsMNrtwWb
         kbUPRiztrmA7B0EiZnkX/+72rllgRj8t1hytOIvlubhRdEo/WaW3qDIEMuXAMctDXlpo
         WARC2PFcyLbKshBgfZPVwfnpKosw4VgRG5FdVW5ZqpX4cotjL5E+CeGxW4La2G8yP5Vv
         Cq5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794621668; x=1795226468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RmakcOIEjNauQl1koJdcjemBDCllm0Kztf8XnpO48fs=;
        b=D/w2KInzxVeJ6BbCRLKX80KqcipbSCzkIfvSsD4nxwTD+6B163z4/vQ+cQvRwIJ0Nz
         KfqZhXR3TsVIjG41aQBtPxcjekP6vEehgW6V5TxMSzYwiOZmuTRr+pcyc0yMq0abJ4yU
         7+UrpfVaLCXbpPECmUpegtbrPb8b79lt7LIrVnImFarMMadgN3vhLhZvINhiSiKkMNdq
         hS2/lSQ58OTzzS7OQHG+dyNd3TBNshlbIsG8i9lPDbkBLfxE29w4tCQm3f450dRr3HtR
         diBM/1PJh4CjwuAf19Ns8G//ATRn3CFaiQ0ao7oo++Sj22jaQu2O5eHB0e2VzETwgTYJ
         mJOg==
X-Forwarded-Encrypted: i=1; AL+hErHfVL3JlNHTjedb1yrY4ThhR8yPYyfF2GmOtp0otr44e289zpUX+Vim3ki7SHX0gJoPJn1qD7LHX+qCO5U=@vger.kernel.org
X-Gm-Message-State: APuU4Z//u7qGIeWaMDSHHt+hJ+VKj5VD30j5ywhapk/V7KxTqDsYw0Ay
	PIJXv1d6e5vsLj8S9SV5KXDsHO3NghMaOh6a15I+5tk4uiNpnahIZIIjDcr0OK3cAs05H3LcdfT
	0oxXFjaoQBPIxKiBFbpKKsJIgEAL7yXju7nEEW64zpGMcHCyhYzPCitNHpfnXLfZDUhQ=
X-Gm-Gg: AYBFou11saX7RaOo0GHeqBjFORAZySWFicJnkq7CbMwtjIdzwwfOiQduw7Pehqfg205
	RQhN8gMVMnOKE4crYAX/LLfCnXQ/q3IoCzbO/mmxwAgNgURDElkyi35/MWz1DTNTmDc5xlZzOq3
	IXFkpvKn6oMBAZoWMa8SkS2oBj26dKc6PrU1b9LWTitl+On0Rs2pjQTxnACfvjd6oL/nDFRD9Wa
	eXnMm6rUoP1exxkAlT+Khg9JM5JzgIApLjL1pp3+DTrM8QGxiNU5pWQAUJ6NagqdS+dNfzPP2rA
	L8MKDcdEbb7lzWpSILOhBQ6iNtX8CISS9SQdEKZRRDKpEcoLL0g/Zo97Tg2BlXMibBEXux8iEET
	jae+hGlF/nuXMlRotvB6+wcbnpxxQ4dVqxeztjDnsjdwvVfHuScf7RLgJxaAY6FTCxPJgnue6vk
	cgzlJSwQNf
X-Received: by 2002:a05:7022:3a87:b0:18c:e014:6f1d with SMTP id a92af1059eb24-1b503068f8cmr4401163c88.1.1794621668047;
        Fri, 13 Nov 2026 18:01:08 -0800 (PST)
X-Received: by 2002:a05:7022:3a87:b0:18c:e014:6f1d with SMTP id a92af1059eb24-1b503068f8cmr4401135c88.1.1794621667378;
        Fri, 13 Nov 2026 18:01:07 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316d9c2sm9952742c88.7.2026.11.13.18.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 18:01:07 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 07:30:52 +0530
Subject: [PATCH v9 2/4] PCI: dwc: Force L2 link entry on shutdown/reboot
 without D3cold check
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
Message-Id: <20261114-shutdown-v9-2-5430c9f242ed@oss.qualcomm.com>
References: <20261114-shutdown-v9-0-5430c9f242ed@oss.qualcomm.com>
In-Reply-To: <20261114-shutdown-v9-0-5430c9f242ed@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: konrad.dybcio@oss.qualcomm.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794621655; l=8264;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=soL97KD69Sdc2M4FJlv8YZ37P82fCiiMjblCTbN0BDY=;
 b=p7FsgYPdA7fNw9Tbq4NKJWXcRZz799k1ycNUX1wBGirnTFFQHZlnFCfcVcShIn6lh//vLE5D6
 IgGGlW3ug3+Czg2CwqoIXSBFTNB/vYV3idSuDfyXTwLCZoyGcon+0Zm
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: kkulWife7Tyt0IkSME5fDm9BkK_7nycY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAwNyBTYWx0ZWRfX2VcdMzClCMLB
 r1sSHaol1fkaIPCrFV70NqLtwcTJY++hZJx3yGC6S6JN4nkTSoaxa5FiKIXB3jPdJ++AeyQuP3+
 o0Y688E4I854A6quZB0ocp6q0CQRWHQ=
X-Authority-Analysis: v=2.4 cv=eb+o7LEH c=1 sm=1 tr=0 ts=6af7c0e5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=-MHXjDPJGaOMKVajueQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: kkulWife7Tyt0IkSME5fDm9BkK_7nycY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAwNyBTYWx0ZWRfX1h9HXO+Ageo3
 EQ4gO/OrFVPc3zXNS6mKYKVo+YnhodIYn57ciEV3aVFRbQWcCwBHRYSMl0Ikd6HZCbzEidbBnS8
 gT89kBFrkrQ0MLK6zyovum0+E1JidLGsZoCvMZ29tr7x7c/jIImpWxIScsVdTh8HTaWiZ4GwySF
 aqq1y8+nF+sCjJuyUb3A1q/u2FFfWgerSATeBLzLTufq3XOjvQtkiXpuBcHOKHa3N1IVihK0o/U
 0pXbCdzNzrbiJ73LNSG4f9vN3mSL/XI/MDKvVDpw1Axh9b10LvkfjhyrbJLLNZGwbSFw9RaJBXo
 zj+TsZgJ1KS+ua3zKKUY0T1EtWWFBgOruiWfyEwAdSfSw4zqo9VBZTkrkaB4BruEOyz41jDh92u
 yb3rlhbV27xAbtDqQBxPspKbtBkRrcwUhPHixX04L6DsgeP40YC9R0izX2zSUr1mjkv953yWWbJ
 RZgk7wM1yr2oFVivgtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611140007

dw_pcie_suspend_noirq() normally calls pci_host_common_d3cold_possible()
to check whether every downstream endpoint can be put into D3cold before
bothering to move the link to L2. If no endpoint supports it, the
function returns early and leaves the link up.

Querying D3cold support during shutdown is actively harmful, not just
slow: pci_host_common_d3cold_possible() requires every active endpoint
to already be in PCI_D3hot, and returns false otherwise. If any endpoint
is still in D0 -- which is common, since endpoint drivers aren't
guaranteed to have suspended by the time the host's shutdown path runs
the check fails and dw_pcie_suspend_noirq() returns early without ever
moving the link to L2, leaving it up right up to the point where the
system cuts power/clocks to the controller.

Add a force parameter to dw_pcie_suspend_noirq() that callers set
explicitly to force this behavior, still call
pci_host_common_d3cold_possible() unconditionally, since it's also how
pme_capable gets set, but ignore its return value and force L2 entry
regardless when force is set.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pci-imx6.c             | 2 +-
 drivers/pci/controller/dwc/pci-layerscape.c       | 2 +-
 drivers/pci/controller/dwc/pcie-designware-host.c | 9 ++++-----
 drivers/pci/controller/dwc/pcie-designware.h      | 4 ++--
 drivers/pci/controller/dwc/pcie-eswin.c           | 2 +-
 drivers/pci/controller/dwc/pcie-nxp-s32g.c        | 2 +-
 drivers/pci/controller/dwc/pcie-qcom.c            | 2 +-
 drivers/pci/controller/dwc/pcie-rcar-gen4.c       | 2 +-
 drivers/pci/controller/dwc/pcie-stm32.c           | 2 +-
 drivers/pci/controller/dwc/pcie-ultrarisc.c       | 2 +-
 10 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 865438ffde87..5a410e89534f 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1788,7 +1788,7 @@ static int imx_pcie_suspend_noirq(struct device *dev)
 		imx_pcie_assert_perst(imx_pcie, true);
 		imx_pcie->drvdata->enable_ref_clk(imx_pcie, false);
 	} else {
-		return dw_pcie_suspend_noirq(imx_pcie->pci);
+		return dw_pcie_suspend_noirq(imx_pcie->pci, false);
 	}
 
 	return 0;
diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index 7c9fb3bef682..8481fe5a0bf0 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -370,7 +370,7 @@ static int ls_pcie_suspend_noirq(struct device *dev)
 	if (!pcie->drvdata->pm_support)
 		return 0;
 
-	return dw_pcie_suspend_noirq(pcie->pci);
+	return dw_pcie_suspend_noirq(pcie->pci, false);
 }
 
 static int ls_pcie_resume_noirq(struct device *dev)
diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index ab343ed53ba5..0837bb9e67e0 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -1229,23 +1229,22 @@ static int dw_pcie_pme_turn_off(struct dw_pcie *pci)
 	return 0;
 }
 
-int dw_pcie_suspend_noirq(struct dw_pcie *pci)
+int dw_pcie_suspend_noirq(struct dw_pcie *pci, bool force)
 {
-	bool d3cold, pme_capable = false;
+	bool d3cold_possible, pme_capable = false;
 	int ret = 0;
 	u32 val;
 
 	if (!dw_pcie_link_up(pci))
 		goto stop_link;
 
-	d3cold = pci_host_common_d3cold_possible(pci->pp.bridge, &pme_capable);
-
 	/*
 	 * Enter L2 if D3cold is possible, or if the platform loses RC power
 	 * during suspend (in which case L2 entry is required to notify
 	 * endpoints before power loss, regardless of D3cold support).
 	 */
-	if (!d3cold && !pci->pp.suspend_poweroff)
+	d3cold_possible = pci_host_common_d3cold_possible(pci->pp.bridge, &pme_capable);
+	if (!d3cold_possible && !force && !pci->pp.suspend_poweroff)
 		return 0;
 
 	if (pci->pp.ops->pme_turn_off) {
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 0ece9c433229..f774fc6d2a24 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -902,7 +902,7 @@ static inline enum dw_pcie_ltssm dw_pcie_get_ltssm(struct dw_pcie *pci)
 const char *dw_pcie_ltssm_status_string(enum dw_pcie_ltssm ltssm);
 
 #ifdef CONFIG_PCIE_DW_HOST
-int dw_pcie_suspend_noirq(struct dw_pcie *pci);
+int dw_pcie_suspend_noirq(struct dw_pcie *pci, bool force);
 int dw_pcie_resume_noirq(struct dw_pcie *pci);
 void dw_handle_msi_irq(struct dw_pcie_rp *pp);
 void dw_pcie_msi_init(struct dw_pcie_rp *pp);
@@ -915,7 +915,7 @@ int dw_pcie_allocate_msi_domains(struct dw_pcie_rp *pp);
 void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus, unsigned int devfn,
 				       int where);
 #else
-static inline int dw_pcie_suspend_noirq(struct dw_pcie *pci)
+static inline int dw_pcie_suspend_noirq(struct dw_pcie *pci, bool force)
 {
 	return 0;
 }
diff --git a/drivers/pci/controller/dwc/pcie-eswin.c b/drivers/pci/controller/dwc/pcie-eswin.c
index d08277e8cc69..04fe45e137b9 100644
--- a/drivers/pci/controller/dwc/pcie-eswin.c
+++ b/drivers/pci/controller/dwc/pcie-eswin.c
@@ -367,7 +367,7 @@ static int eswin_pcie_suspend_noirq(struct device *dev)
 {
 	struct eswin_pcie *pcie = dev_get_drvdata(dev);
 
-	return dw_pcie_suspend_noirq(&pcie->pci);
+	return dw_pcie_suspend_noirq(&pcie->pci, false);
 }
 
 static int eswin_pcie_resume_noirq(struct device *dev)
diff --git a/drivers/pci/controller/dwc/pcie-nxp-s32g.c b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
index 386e44dd0477..cb9cc9327d85 100644
--- a/drivers/pci/controller/dwc/pcie-nxp-s32g.c
+++ b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
@@ -365,7 +365,7 @@ static int s32g_pcie_suspend_noirq(struct device *dev)
 	struct s32g_pcie *s32g_pp = dev_get_drvdata(dev);
 	struct dw_pcie *pci = &s32g_pp->pci;
 
-	return dw_pcie_suspend_noirq(pci);
+	return dw_pcie_suspend_noirq(pci, false);
 }
 
 static int s32g_pcie_resume_noirq(struct device *dev)
diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index a6a0e3ecd921..532779295734 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -2480,7 +2480,7 @@ static int qcom_pcie_suspend_noirq(struct device *dev)
 	if (!pcie)
 		return 0;
 
-	ret = dw_pcie_suspend_noirq(pcie->pci);
+	ret = dw_pcie_suspend_noirq(pcie->pci, false);
 	if (ret)
 		return ret;
 
diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index ba8e6b297674..e3807da316c8 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -1071,7 +1071,7 @@ static int rcar_gen4_pcie_suspend_noirq(struct device *dev)
 	if (rcar->drvdata->mode != DW_PCIE_RC_TYPE)
 		return 0;
 
-	return dw_pcie_suspend_noirq(&rcar->dw);
+	return dw_pcie_suspend_noirq(&rcar->dw, false);
 }
 
 static int rcar_gen4_pcie_resume_noirq(struct device *dev)
diff --git a/drivers/pci/controller/dwc/pcie-stm32.c b/drivers/pci/controller/dwc/pcie-stm32.c
index 349618ea5b9c..7b3a8c1b04a4 100644
--- a/drivers/pci/controller/dwc/pcie-stm32.c
+++ b/drivers/pci/controller/dwc/pcie-stm32.c
@@ -78,7 +78,7 @@ static int stm32_pcie_suspend_noirq(struct device *dev)
 	struct stm32_pcie *stm32_pcie = dev_get_drvdata(dev);
 	int ret;
 
-	ret = dw_pcie_suspend_noirq(&stm32_pcie->pci);
+	ret = dw_pcie_suspend_noirq(&stm32_pcie->pci, false);
 	if (ret)
 		return ret;
 
diff --git a/drivers/pci/controller/dwc/pcie-ultrarisc.c b/drivers/pci/controller/dwc/pcie-ultrarisc.c
index 514e08a12b5a..8cf8b81a0de1 100644
--- a/drivers/pci/controller/dwc/pcie-ultrarisc.c
+++ b/drivers/pci/controller/dwc/pcie-ultrarisc.c
@@ -187,7 +187,7 @@ static int ultrarisc_pcie_suspend_noirq(struct device *dev)
 	if (pci->suspended)
 		return 0;
 
-	ret = dw_pcie_suspend_noirq(pci);
+	ret = dw_pcie_suspend_noirq(pci, false);
 	if (ret)
 		return ret;
 

-- 
2.34.1

