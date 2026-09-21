Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7044F4968EC
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988339; cv=none; b=TQJgA12/dVtuqWa+Y+WGvDdSN6WyXYCrU8wl9EFBatzN35ecbtEMUaa667mxkwxy+bSNei2NhiF+U0z88iNqXOCbEpku6WvXZTE6WxGFo/8A3lYRoyodtpQW9FXBTZS3BYMjcGbKAc7OSU8Q0u8ErMuxUJisp7N1KIuuxituuB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988339; c=relaxed/simple;
	bh=KZNT5gsQg/XmkABF1JqGQnfDNfLXSsEH0jm5Y2AXDHU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hE8AD9L+wMeqGsZvItOBr8iJKaG4XM3s7QawL2Dd8YhpDtemiQqavNRU1QCoULYjDEj39ziEafqCEU0bxE57Q+ssW/HrOIWOZ5EvXbNoplTI5UG6+utZ35dT/LGSAZdV4RvaxtTglg1WaiGWr8KkzBDumAu1pp0m3xiYunRVjZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aVBQule3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GcSdwhKm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aVBQule3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GcSdwhKm"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdsRJ1217803
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hsewHEvUZj6/jgMhxVC1D2uYQR86gXMPhAyfrZVSSvU=; b=aVBQule3ToplSUEG
	ecTs0F+WdQzz7NFu4Jax+2KnoNt+IgiR3C+rIb0cw+N9YOJdwlgK3WBXRVF4Ix+A
	hCiGcLXO90f99vV40qOi8kT1wJxOnCO8vD3ijOS6/zzWqTXWwC0gEX+trGLfbzUS
	0ddw1KMO77759pFCKAmirfB1jIeHpK7NE3muO7EzC7slg0sWeocMX7or1YB9/pCI
	A09/RR/GZUbULbor4Vt9fXxVAkUV8A1O7ipIYGo/kowY64SfaokZHzPoQVZyvJ2H
	KxDXrH5f8c8WQYYG5qcyps2p4Y3zDxQU7K0FpsgVefcJL/wb3cgenp8z7CEEj5gz
	5yxQaw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0118vy5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:58:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d7443e0f0bso54727145ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789988335; x=1790593135; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hsewHEvUZj6/jgMhxVC1D2uYQR86gXMPhAyfrZVSSvU=;
        b=GcSdwhKmTSMrgL8gt72APRiTzAv8Niqa0TpDXB1BXSX0DSSIHIxuS+LdXZZMuDIzTv
         xjVkk34v+gRH6KZs+YZ4/p67bRqZEgRGHUDE9wCZZ93KR5P6/M8FCs0MawU1FBQErqC6
         9kje0CtrDzwbvQXYR7wv8WmhkMu3LkFP+2YNxsbOeAGxvkce1/id/qmgC6HAeuzMPqCE
         bY2CuNRNyy/cmrosanImqLsDO73kT8tStyBmEjOqjIvccQybIBPRGgub8WU4YtJ6V3RX
         OHWOZWujRtruFmQ2tcj6UusJ78lPNkFiIBJ34+z0Fa/fRGEUcEPAD0+0gDdz8kKmPAks
         /dlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988335; x=1790593135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hsewHEvUZj6/jgMhxVC1D2uYQR86gXMPhAyfrZVSSvU=;
        b=BEfXM9IDRPCBFOLZvWxvZMCSSJvcNrbL9e/4Y9t3vnShbBMpCW8PPCidFLauWt5AHm
         i6Ci8HzpI1AOYG+qKgG42G4pSKLDTjx9y83cU4G3XIyKDeBRgCPkY/M5ssXabVmPosY0
         N4ZFlZaupW/kH3bsl/IPfuXLLbZwTw7K0I/ivIbnfNgGJv8172u2i7DEmSlybVRl6TPI
         LNR1lO6knseYMYfMu/UD497tgTFltuoXCzWq+Vo3kL2s+Efxk8fJ1jx5gPma5yLyyRlO
         CjZrwGHY1A41B8ShWpQH7fkKuFJDAVzhBtKQto9Q5grgI1PZxJEa/VDKJ8coBc6Kuw+I
         MMXw==
X-Forwarded-Encrypted: i=1; AKwUvBydLGsSBkwYqetKzwEUA/Eu6nV5gSdgWxiGI5V5n0f4l0Rl2b0xbiXKHZbjeyvpeEQX9obNCfywmLreBuQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lNYZ7p4maae9EHUWNiGHLT1wOYgM9EQQLFsg/kuRaFKtDEOhTD
	HuuRuhk6AS/YFXxPWcdvGFtWPoOYQSPEpMm+VcaIs1UD/wtFNoBvkAnUfSPpW9Alxkmnrb/sWF5
	/t7P+4OakTcpkfF8ebQZC3BxbmM2jCCkqc3f5BFJx9VCHr6624BG/h6Sh6AzXIRZ54Bw=
X-Gm-Gg: AYBFou00zexz/XTiwZT5U4NsEGj//uE+Ux3kSHrg2Z27YkavM87K8QJAgU+AuLEEJg1
	0raZnTJivLcZBg4vY+CN9+mDh73u9CYv4tubvklt+UoiIVLer7Vpug/4a8uehodSVe04oHXgWp+
	7XsR8yLNW7zEBe5d/KccyB7Dqp/LmerbO13PxmrWgZNgEuhxRLeo2iqYbAv+WISoL2092RkB3Ud
	qDfnpY7TjhTFHLJqWQJseLs9E39ktLOXTECtaKvnJClg/3yYb2CPGjRj24LJT9XtJhKtlx4T9dZ
	tx1NRy+AFAIPQU4bMo6KkDlvJeqMJ5SJEgzH2tnNUeq51SpYekHzQIC9+w9T27zLkVTgOo2lbKV
	Y9mYI76nGllmWzxkkqVLNCmfaOX0pG+D/Cw==
X-Received: by 2002:a17:902:fe97:b0:2dd:c053:a6f4 with SMTP id d9443c01a7336-2ddc053a77dmr66909895ad.38.1789988335087;
        Mon, 21 Sep 2026 03:58:55 -0700 (PDT)
X-Received: by 2002:a17:902:fe97:b0:2dd:c053:a6f4 with SMTP id d9443c01a7336-2ddc053a77dmr66909605ad.38.1789988334620;
        Mon, 21 Sep 2026 03:58:54 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d55cfsm23544128eec.30.2026.09.21.03.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:58:54 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 16:28:15 +0530
Subject: [PATCH 4/6] PCI: qcom-ep: Set initial interconnect bandwidth
 before enabling clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-monaco_ep-v1-4-63c5282fb0db@oss.qualcomm.com>
References: <20260921-monaco_ep-v1-0-63c5282fb0db@oss.qualcomm.com>
In-Reply-To: <20260921-monaco_ep-v1-0-63c5282fb0db@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789988304; l=2353;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=KZNT5gsQg/XmkABF1JqGQnfDNfLXSsEH0jm5Y2AXDHU=;
 b=m4OH4ZgVmJ/VwWnMlB7XiWpD7mGR3rBa5IvvsplPV4v/TnJDRhwkuOnWQykVOe+fkkKvsy456
 YlojbEg98ijAERfCjhqnsonRdngUkXQRPyPAiMdOUzMHN2XzoBE9F8N
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: XQbDnibXJ3A5ixz65pyN5VyxDNlgK8OC
X-Authority-Analysis: v=2.4 cv=dPczC+Zb c=1 sm=1 tr=0 ts=6ab10df0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=kXhGf0cxdCgfIYue-YsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE1NyBTYWx0ZWRfX1sQe1erer2nn
 01q7tr9S2tbo62e9tMSHH2lan6tCdX8fzjIqdsbAPiungt9oOs8ICHwUAQ1DNrkByD3D6zgjwAd
 kB5hkURHCkf5m8PToujIYZJIfdOMYujgu+7exrRIyhszhuSjzS4CFDiGYMfzRUnKiDSktaKDeMn
 DpEsXE8JuXh/xe3BHE8oLkVwiwauo4caogsdN0F8VdI55NAvQZPrUEGxQktKgjLwkK4x5GxlkCT
 iGjNvZDcB3j+ohNEj+/D/kQ5bJKzm3exxNB86mf1GQ7RsQ1f64IqNCt+p3+zmZy1YBgLmwGmMna
 Hx2luqikos2hYl3oIXfUnUfak5WxhayufAsiS6Z5EC745u08kuVWBUidjtcgvHF1ZzmaRy+uVSt
 3RE5Izq3+d5nvoSF5dLR97lBDVzodr70nnje0nDmN7x0tK+n0O2Nw1GsbeNZtzhriDDvB6FcXZ7
 bxD+rSWwzFp9qcJVTPA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE1NyBTYWx0ZWRfX05KODtdScrfd
 2cqBOH4THjkSZnFSgtX1YhHC1bUPq9Pqb/EBHHag5y+PRci5YbgO9MKmlrjRLqvkduZt3xUX4Ms
 VOOf7vVbflR/tSuCmjz7mYu/OgRFTuA=
X-Proofpoint-ORIG-GUID: XQbDnibXJ3A5ixz65pyN5VyxDNlgK8OC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210157

Some Qualcomm platforms require the interconnect bandwidth constraints
to be set before enabling the interconnect clocks, otherwise some
clocks get stuck in the off state.

Move the icc_set_bw() call before clk_bulk_prepare_enable() so the
bandwidth vote is in place first.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 34 +++++++++++++++----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 56184e6ca6e6..0b23d7181539 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -331,9 +331,23 @@ static int qcom_pcie_enable_resources(struct qcom_pcie_ep *pcie_ep)
 	struct dw_pcie *pci = &pcie_ep->pci;
 	int ret;
 
+	/*
+	 * Some Qualcomm platforms require interconnect bandwidth constraints
+	 * to be set before enabling interconnect clocks.
+	 *
+	 * Set an initial peak bandwidth corresponding to single-lane Gen 1
+	 * for the pcie-mem path.
+	 */
+	ret = icc_set_bw(pcie_ep->icc_mem, 0, QCOM_PCIE_LINK_SPEED_TO_BW(1));
+	if (ret) {
+		dev_err(pci->dev, "failed to set interconnect bandwidth: %d\n",
+			ret);
+		return ret;
+	}
+
 	ret = clk_bulk_prepare_enable(pcie_ep->num_clks, pcie_ep->clks);
 	if (ret)
-		return ret;
+		goto err_disable_icc;
 
 	ret = qcom_pcie_ep_core_reset(pcie_ep);
 	if (ret)
@@ -351,28 +365,14 @@ static int qcom_pcie_enable_resources(struct qcom_pcie_ep *pcie_ep)
 	if (ret)
 		goto err_phy_exit;
 
-	/*
-	 * Some Qualcomm platforms require interconnect bandwidth constraints
-	 * to be set before enabling interconnect clocks.
-	 *
-	 * Set an initial peak bandwidth corresponding to single-lane Gen 1
-	 * for the pcie-mem path.
-	 */
-	ret = icc_set_bw(pcie_ep->icc_mem, 0, QCOM_PCIE_LINK_SPEED_TO_BW(1));
-	if (ret) {
-		dev_err(pci->dev, "failed to set interconnect bandwidth: %d\n",
-			ret);
-		goto err_phy_off;
-	}
-
 	return 0;
 
-err_phy_off:
-	phy_power_off(pcie_ep->phy);
 err_phy_exit:
 	phy_exit(pcie_ep->phy);
 err_disable_clk:
 	clk_bulk_disable_unprepare(pcie_ep->num_clks, pcie_ep->clks);
+err_disable_icc:
+	icc_set_bw(pcie_ep->icc_mem, 0, 0);
 
 	return ret;
 }

-- 
2.34.1

