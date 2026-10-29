Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793254257;
	b=hS+rEqBOvrqCsFsF3abKSTuoBPjXF0sYXxRFyY/Dd0QQqHvcLZZrHqLZR3hybJ+w+NVI
	 4IptPUUnutA7Cs2o4++pr74GwnAYwczb9CQIAE8r8+L0piRW9P+UFzNJkt94OczclmMZg
	 RyeQXf+wlm5+BeF1NzI+qJhCwBYAHdHZEZj4GioSiwvMIuWj5gdPrRbi/oaMS2zfG5fLn
	 VOS0xbLB4xOV7wulFRF5ymSCnm8TUT8fd3IlgZONPZOcbiaC3XWX84dGV2g/iMi3EikH3
	 fnzDWEWQWxLwut0WJa3U2Om/RD4ChOzYmWYVUEzVMcwML+pAPjNLuFc10qM1TT9KTfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793254257;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OqkXXGQXY2u3txgof/2HIibvpgoKdKYBIXMTYdCD0lg=;
	b=Yx95rehPzZxgntUTcGH4uuN4Cu134vEk5Zqodqt6bsd3m+6JHCwQRjSqZJknqoUysj5w
	 upOZ7IBS25gddA5u2wvGPDS5lRl92yNGBxUGdeIgHmV/dmaaNbYcBq66wSaJrTbLSuWHr
	 b+TZjJJHfDdgpCG5DDZg9B2PkIsX1XV4ugRJhsHaMFHeTyET3VjgiAFxxIfNSDMmG7tuz
	 RkD/5ipR2/0xIejCpEjnhjXpLUak5C/w4gb48ozyPP4v/mni7cI1wUZMmTQLKzkLzNPqB
	 fsNwNTz+Aq2qJXw7kwIgZM4/r4tX3WrMeGXeiGAk+Dw5SfkwLn0E3uaJ4stXDSUDH+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NVzaCnig;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kdno4uMt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14653606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14653606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NVzaCnig;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kdno4uMt
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5GmxL176698
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OqkXXGQXY2u3txgof/2HIibvpgoKdKYBIXMTYdCD0lg=; b=NVzaCnigFFTiqhbK
	TjBOXbFdu2y/w5TWJJIMGkE8KGyH0dqiKBL2PKDAQ31g9hvRhEhbC/fzR6iiqVL8
	156LSevJkcyUj2C8Jg9BEUPDKChFf0VLsQgXJo09S/nUC4MqrTjxlj2ChAfpy3Mj
	pWXn0RmK1Dz0kH1JwiDy6PUbPjMmvJ6I2dmLliGpYqw9ry7s+FUes9og3BQsbymw
	UdKwAVnn8wove3T/Ly0Cz6gvOikhSDNSXa5ZLChiZnArWAy68HR2FUW/fH+WJdwS
	bynmozBwb0Q+BqpLDpb7u7dQar/nOBOq02CAlhzsgFrw7Kvzc0GLlW5eYqhPzKTp
	D+mE2w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkkehu5wd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:10:56 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a3451ea93so499719eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 23:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793254256; x=1793859056; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OqkXXGQXY2u3txgof/2HIibvpgoKdKYBIXMTYdCD0lg=;
        b=kdno4uMtsv8ExUEcgvbpLX8rs4jO5NDo/8EyNSJUa5ySvgiy1LWxwhIXbgjf3/ZxMR
         qQcQRYrDuJl8bjMvLQAD03FbfjBwcKiJL5RgV8H1eXTxXKSKggxf+XXV3uZPInuYfiph
         Vz6lq8k4gEuToC6jgL211Vj4BJJOfUKaqkQOz2m5c2jgFYkD622JMn3mnvVenlqxgzX+
         7xwKT3XBsVE6LC0ywweXsMvtpnWBl7k8GNehdeNLSJPbBAFVxW6gTSISMEKt0UvS++r6
         K3KbBDQeRroai8ht2gk3d8wqwEFEPaMEj9/KeoyK4s60uv0W90ZuPenOUGMy+q6o0Rdm
         PPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793254256; x=1793859056;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OqkXXGQXY2u3txgof/2HIibvpgoKdKYBIXMTYdCD0lg=;
        b=NP8TqIC2OCQzSqKrcNggLiZevsFuvN16agBFh/03W6t4BVHHDAwAGnG5TjYp0CB0/x
         BBp+WbeA7x7QUFyPVEFAgY6QPLtp59RcFUgZgSLEF3055Wy8JKPEcke52MRybmCa4oth
         WcBtZLM60AkSKa3xrXOnOth6kLp3+1rYxz/ldBjA9OeAqYZiohYcTM6DNNCkbOP+TWZX
         u0Lj2a+tcMSg5crLr+qkSO3Rs5L+TsqNQYtVPmheXdZ7vfAMfMKN/kl3IAtDOzUU55KB
         XbYIc0iEQbOy3Iok47QphwxvGOLkWTWZhus0TrVWla84SY2UtrfIGHqPZiIGRHBTfGMM
         4sCA==
X-Forwarded-Encrypted: i=1; AKwUvBwtKezMPB+KrtVl13KWIjnR0eOo2bj0PFVTnudGnNQ0354izRW+Yo7tAFBrnCmlaK3PLpgx2kFRmciEfI4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqnO3+OtU/8t8Tga/o/Enyf4knTskS9mdeBdE6ojwTEJ6m7UUK
	WWv9n+Obow1RtgrBV5nqOLGcwbmnZFyMWAQA3OMznGnIFsESVd4YGyZsYNYH9oO5o7aGOMUNTgA
	NCTNwhp/BmQaFBfMBtQAXwRVjwYbZhsx6U6X08QKAaveAwgqx1FrUe7qDrz6S+vzb66We4SG7Ue
	Y=
X-Gm-Gg: AYBFou0XNYcGd7NtXdk7Y5UOghMoVmgUOfvmGugACYXQu5JhgqMb2M8vUasR/jw4OJg
	MSP3U1S8x3iOE6Tcy3l0iUDoE9ArdQyQk2hds2GK77LqfwdD4+OTM2S6cSwmyCX7mvnlN4Xhuy7
	jDQUlblN3gHnlKYnFC2o/xfw1TlGfDhPKplzhxAuhCzsZ7/J228rPbJ7HpgDuD1i0B2al96nWlb
	kZEpU67xQ9pN003Ww9X+XFnRC9xI8XgZbPNxCzb15YwsGfiQ98yBQLjDI02WLwXg3W+nLbizZeM
	2eeY8hrlpuWK+nzVOP3U7vZCVjdmCAf71QmgN89cKur3AXGb/DQF7VC9Zaqbvy7SKpKkVkbWJHx
	5bBov0d0XjttKcVtWfgPS3GBGQG2JLv65zSt4cSmpA0yKznnyNYdaTUjcdQVb47r2HpnKY6elEf
	T/nH3edsY=
X-Received: by 2002:a05:7301:618b:20b0:360:e2e6:f849 with SMTP id 5a478bee46e88-36a20138550mr6987939eec.28.1793254255564;
        Wed, 28 Oct 2026 23:10:55 -0700 (PDT)
X-Received: by 2002:a05:7301:618b:20b0:360:e2e6:f849 with SMTP id 5a478bee46e88-36a20138550mr6987923eec.28.1793254255044;
        Wed, 28 Oct 2026 23:10:55 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239a2e29sm14038935eec.26.2026.10.28.23.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 23:10:54 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 11:40:17 +0530
Subject: [PATCH v5 2/2] PCI: qcom: Add Nord PCIe controller support
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
Message-Id: <20261029-nord-v5-2-1a13c214e89d@oss.qualcomm.com>
References: <20261029-nord-v5-0-1a13c214e89d@oss.qualcomm.com>
In-Reply-To: <20261029-nord-v5-0-1a13c214e89d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793254236; l=2732;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Lw3570OqxcQHNzId2qfQIDjwIX3tpSz51KERraFXVRY=;
 b=q4A3SHVzw8pXcYpPKZ7EfYTFSjXX8WJ6IUqaPSCknJETuUzr1JZ94wS4sHh3iDD/HxZbR6arr
 dPjsM7cs6csAC4krwRmQ7lF7v0jApg4hzk5p3bmRMqMK+Q9fKHq1uHx
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: zgPWvR7lwFpMgK2B3TfuSLMOCpX9M0zo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAyMyBTYWx0ZWRfX1FWSllO7tTiY
 BhrU3Zw6l0/6qMFCLQ+epuBdN2XE5HlAqPlg9ub5dsed1DrAMufN4tSMmcAlmdehPy8ZvFQUaNG
 doWaSIKxgZL1+aUllvE0UlkgLnv3vEZd20UE/ijvGVbTkD66ZI/XefGrEqugBjNaRZhudioKcCl
 wP+vcOrz7IaHJRiRqOScF0241a85cbAZDT+ln8KU58VSot84Dz9zpcKqY+XWWWuweRiLNto5D7Z
 RrxkYyfnxJzE7YJRfuJBh6A2mKC65Sfpp4e7bLjMWRZbmqIhmGy9rv+nMCmsksp1mLn38pLNEVI
 mHnktakKJ+2D8p/VkHftosLHQzV0A1TBJ35kPbQx65RdhDki0vHGydC784lVsODNs9QPj7sBx21
 1uAU3jrWSYx+Q3NtVg8Cttx43kAjUP1MuGHXk4a2wiNmwnIMo9Jki0e8vUbxS8iwQD5ht3B1wAJ
 ff1F2nNZsUNTPtm7xFA==
X-Proofpoint-GUID: zgPWvR7lwFpMgK2B3TfuSLMOCpX9M0zo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAyMyBTYWx0ZWRfXxTQU1T75Flhy
 t2T+A9MI+/stikBmL2UHa7mTaG88Wyy3O1vOxaKGVzvBVsxAgn7mEZppRuYETRR6KaDWudvoVc8
 OVsrZIF6GuLvBGoTBb4NonoyauWuXns=
X-Authority-Analysis: v=2.4 cv=bYv+w+PB c=1 sm=1 tr=0 ts=6ae2e370 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=fhppCylznReUS4Xj7DkA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290023

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
Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index d903f10211c2..c62abfc7a446 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -300,6 +300,7 @@ struct qcom_pcie_cfg {
 	bool override_no_snoop;
 	bool firmware_managed;
 	bool no_l0s;
+	bool disable_cgc;
 };
 
 struct qcom_pcie_perst {
@@ -1138,11 +1139,18 @@ static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
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
 
 	qcom_pcie_init_outbound_blocker(pcie);
@@ -1725,6 +1733,13 @@ static const struct qcom_pcie_cfg cfg_2_9_0 = {
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
@@ -2586,6 +2601,7 @@ static int qcom_pcie_resume_noirq(struct device *dev)
 
 static const struct of_device_id qcom_pcie_match[] = {
 	{ .compatible = "qcom,hawi-pcie", .data = &cfg_1_9_0 },
+	{ .compatible = "qcom,nord-pcie", .data = &cfg_nord },
 	{ .compatible = "qcom,pcie-apq8064", .data = &cfg_2_1_0 },
 	{ .compatible = "qcom,pcie-apq8084", .data = &cfg_1_0_0 },
 	{ .compatible = "qcom,pcie-ipq4019", .data = &cfg_2_4_0 },

-- 
2.34.1

