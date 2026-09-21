Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC55356771
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789969063; cv=none; b=N24hm+oJbydFXHDiplClWGzoVJ7UfX7tkaaxCyrCErKb6odupw32OC7jQTb1XevtlSADhSD31qLz2BoNsLs5Ag0o27IGYwcAf4ErHLHYpUAnefKWXjucqp4AkuVbujqt5Y2rG39N/f/N7nP8UfHDhPN88LNTrJ5o7DaVTdeyPEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789969063; c=relaxed/simple;
	bh=z+Ya1VcXykQjtc7MvWy5pcQNsDt9baIxgws/kJipBlQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nGL+IF7t8Osm2V+KTp2rQ+w29cI1/35SPLcfBpSWMZ9MLakt4qUBCQxBTptj+S4oe2OSD9YC7rEdQrq4CQLAlj8w9/Uo3uEh1k2NwqAQfDmdl31oj7jMHhOdklmlZ2aRFphONDXW+KCPOmedmw+/MMrojnLvyhFew9C0hnmCg2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M/l7wKnQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hMkHILqu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M/l7wKnQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hMkHILqu"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3YvmM1162082
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:37:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AjvDOtrhl3XR15sbKhhIi5BKrmoRXrS0m7WZhaoqXIw=; b=M/l7wKnQmup7wJWA
	HRzR6my0vJmjFlR/OQf2Z/Ll+6/XVmMv4YuXA5MwKN1lXgRkpzQk7weaMiQMKdOD
	++QIG/QsYvB24T01uHPSCx2Tld00yzCtgAIRdOlISGIvkyiDicFwccQ2vhfSTUOz
	KXGLlyJ0TMrWPZeCL6S5Fb1McxTN9qrmyMi/qBsMgeyy0YoxvqVEWgU0gFLfrygD
	sXNzrSyjcyyIauPmlm53iQE3oW6nwAX0Y1t+a285BwMlfp4x6akGrdBBw8fV21dO
	OzJAFRlWUd/TaJkEyq3bpgOUZFR4RhGZMeJ2As6FcPO2YCTkn2kC8R13CjFsrpDf
	LnHEMA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3wrrsc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:37:40 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39deda201bcso3290633a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 22:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789969060; x=1790573860; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AjvDOtrhl3XR15sbKhhIi5BKrmoRXrS0m7WZhaoqXIw=;
        b=hMkHILquKS+xsIUOOnL3XpyhzzsoVYfMGTCFur9mfdQ7XUGmyJHnxb5BxQ0+gbpaoM
         RIoczzBysHViaiOddlQpGOaqB9cb0YGpjS2mswUt+ZYL3+5dTxW+Ou4tD7z0MKFFdfo1
         MmCScAlNKlxY3ucpCNzZqssC99tcmLyMCLefaajk8d7wKDSXwSrI1FdrfFDTLmfI68qU
         aBuwkrTHtWAC9ojQkBJ3wkgz6KGfbeFwJHPfgTSsG5wXDabURrsVSN447fgKD+fwtVPg
         5V7bVXsCTawnkyvbi6SJPimO62sIBGmavGrF8Le7XaaN8FUDdYFk27Qi+h7HrsptQHyr
         IcVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789969060; x=1790573860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AjvDOtrhl3XR15sbKhhIi5BKrmoRXrS0m7WZhaoqXIw=;
        b=vPdhPctzV//2qw80nDjcY2xmmlqEYjVcH2v8/GBcr4WAsj1BvRGUkBt2DyPa9FN4AQ
         46xJyW6rDOxQ4YM4wWlvMijLnoxt3mqg3GovtY9VQcLyABvr/K1/UIV6Cs/7jg8jkOpA
         nkna23LyOwrtIcwayDLwZWPz/96zVjyeVLWlhUSQmh61mQB99lmAaQglk9F7Om19odbv
         V0tSMVjm64JjJgAcJbKE5Kq2+SggCc78CrZCQUTsbcUPIWcQyb3go+ev1ylaib9vEslw
         maUjS43ZY56pOB1h7KznP4qoc8Yf3BCFnPhg34gtstQVenI6herlyVTYG1OaYXuJ+3ef
         Gw0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwRM+izLg4yaOMk+Wh7u+oKh930Va3vO/TWKNQIQ3PeIxMT7zDGLAS8r+ABkh8i0bY73cCUmxIVTltUeBA=@vger.kernel.org
X-Gm-Message-State: AFuF++mS0nVj6z19dK+ndq07nzkYzbz1l5o4i7qiTLp7zz+zxAwMcOQg
	DBCe/8umnnaX/YKzGx7zwEcgzy6KZ7+BUQIspGrARAazzM3m8rerE5ohD6VOUtWU0YHwa/K6/Gx
	zLECv3rTTGYEMzV073czt22tGqOlQPtQn9cunnofWfFxXYa62tu0M3pAlbb5Ul2x22INVIMr5XT
	Q=
X-Gm-Gg: AYBFou3bFfdOdrVowJcBjP7ytdAaUC16xBliiXfR9qCg2uHRjA7BEXzQGBDNEk14+8O
	ixr+iMcgGpGcgLF3omKIvRnomD1AuAW5a7YhXRJTGmfoDi6QHWotEqh6EU25lLBx4kn/41lwI0q
	qszzvBiFKveYx1IIO/z13+d06x9hJiOm/wyjiBqKRe+t/1mwOLAMnBS8Otcq0KchAJxC7yzqS/u
	r77QgNumUII6uSLHgfSzU3KnwYJwrGRfkx7WapzjiCpGdCq88/5YyX0E5kpSl0FuTsWdVU9D7ZW
	kAbxCZGNe5scoeYfnppbGoWLyULwSppPcGsqNyDa+d9/jqHqiht0tKlepLE/oXGvjGlBNgMZ8GE
	1XHViRiHZleGSI26tfzxcCeDSIznoY/08Mw==
X-Received: by 2002:a17:90a:e7d1:b0:39d:f2a1:31 with SMTP id 98e67ed59e1d1-39e54e77eb2mr15959719a91.17.1789969059700;
        Sun, 20 Sep 2026 22:37:39 -0700 (PDT)
X-Received: by 2002:a17:90a:e7d1:b0:39d:f2a1:31 with SMTP id 98e67ed59e1d1-39e54e77eb2mr15959687a91.17.1789969059264;
        Sun, 20 Sep 2026 22:37:39 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55d45a6sm15054568c88.9.2026.09.20.22.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 22:37:38 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:07:11 +0530
Subject: [PATCH v4 3/6] PCI: qcom: Add Nord PCIe controller support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-nord-v4-3-ed05c6e09240@oss.qualcomm.com>
References: <20260921-nord-v4-0-ed05c6e09240@oss.qualcomm.com>
In-Reply-To: <20260921-nord-v4-0-ed05c6e09240@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        shengchao.guo@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789969033; l=2648;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=z+Ya1VcXykQjtc7MvWy5pcQNsDt9baIxgws/kJipBlQ=;
 b=5HjTg6Kz8BbxPfLUWjxTYnh1/eVS+81rNP1VesBI3jHBobY9c24kL1vXGbibvm6gjg7qHlKW/
 dMW8nLJOuOtD9WA4uV9bct7Fs7LSUNualsKxKSWTLIjndB/Re3IQY/Y
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA3OCBTYWx0ZWRfX3Lh9vZjdDgpt
 axUBpdYeqcOx04xb3/M+Cqzb9HF1XweXcKm7RgxVO4OQiR1TY65FNwVTesUqIz+u2pj3Ph4N+BZ
 pS48mPCGwB5xbtPhLQam4oLFTk2X1wzKIp0q9qzeOKgWn50ymzxISmwnNUQLQQniWpv3uMpdIyr
 SkcVMyZ3tMDhawrNEjSz/0nYobvSBX5hX+2A8h0OwqV/IZ/mmuCD6zTfY+/PVGxBkI4KluBbG/G
 bzUPh2Qn0EILJReHLYJxEX7CCymLIvJt6na6Ct0rak3TYkZaN+LhT5J10gQb3v7hihUDnJzrBgd
 qnT/e0aOkKSUYP4lGaidb6O8zsfbLRdjwsHaWlsz2uBdUdhAGk9vcyAmEyXfgpfedkIFliWh2td
 H61zFigXrTjlmxH0iuUpEIg45uD3nmcgfrVXjGQieeEPrKLCNIaYwqreZlPeQE5J+euuzezKGKW
 xieO3Vv1AHB9M+CSGkw==
X-Proofpoint-ORIG-GUID: 8DWbbXSc_y2tcIVMAC7O0-1t5GmJdwPh
X-Proofpoint-GUID: 8DWbbXSc_y2tcIVMAC7O0-1t5GmJdwPh
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6ab0c2a4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=fhppCylznReUS4Xj7DkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA3OCBTYWx0ZWRfX/Bi05OyyPtYa
 DE5qqCJQDSKoJCBGY07mdsrWaORWAc0QK/t68dYqHhpjxRxQ6rshaDI5BQC35y9k/M5tGAyrDKS
 3YT93oapVrgMULoTtVMWVRyIlBoTje4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210078

Add the Nord PCIe controller configuration and the platform-specific
settings required for correct operation.

Nord requires the NO_SNOOP override and L0s to be disabled. It also
requires a clock-gating-control (CGC) workaround to address a PCIe
power-domain timing-convergence issue. Set the CORE_CLK_CGC_DIS and
AUX_PWR_DET bits in PARF_SYS_CTRL after controller initialization.
The SLV_ACLK_CGC_DIS bit is already configured by hardware reset.

This behavior is documented in the private QCTDD11972446 erratum,
which is not publicly available.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index b58a607b713f..304628b57f33 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -281,6 +281,7 @@ struct qcom_pcie_cfg {
 	bool override_no_snoop;
 	bool firmware_managed;
 	bool no_l0s;
+	bool disable_cgc;
 };
 
 struct qcom_pcie_perst {
@@ -1097,11 +1098,18 @@ static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
 static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
 {
 	const struct qcom_pcie_cfg *pcie_cfg = pcie->cfg;
+	u32 val;
 
 	if (pcie_cfg->override_no_snoop)
 		writel(WR_NO_SNOOP_OVERRIDE_EN | RD_NO_SNOOP_OVERRIDE_EN,
 				pcie->parf + PARF_NO_SNOOP_OVERRIDE);
 
+	if (pcie_cfg->disable_cgc) {
+		val = readl(pcie->parf + PARF_SYS_CTRL);
+		val |= CORE_CLK_CGC_DIS | AUX_PWR_DET;
+		writel(val, pcie->parf + PARF_SYS_CTRL);
+	}
+
 	qcom_pcie_set_slot_cap(pcie->pci);
 
 	return 0;
@@ -1630,6 +1638,13 @@ static const struct qcom_pcie_cfg cfg_2_9_0 = {
 	.ops = &ops_2_9_0,
 };
 
+static const struct qcom_pcie_cfg cfg_nord = {
+	.ops = &ops_1_9_0,
+	.override_no_snoop = true,
+	.no_l0s = true,
+	.disable_cgc = true,
+};
+
 static const struct qcom_pcie_cfg cfg_sc8280xp = {
 	.ops = &ops_1_21_0,
 	.no_l0s = true,
@@ -2464,6 +2479,7 @@ static int qcom_pcie_resume_noirq(struct device *dev)
 
 static const struct of_device_id qcom_pcie_match[] = {
 	{ .compatible = "qcom,hawi-pcie", .data = &cfg_1_9_0 },
+	{ .compatible = "qcom,nord-pcie", .data = &cfg_nord },
 	{ .compatible = "qcom,pcie-apq8064", .data = &cfg_2_1_0 },
 	{ .compatible = "qcom,pcie-apq8084", .data = &cfg_1_0_0 },
 	{ .compatible = "qcom,pcie-ipq4019", .data = &cfg_2_4_0 },

-- 
2.34.1

