Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561D4431E68
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 20:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788812680; cv=none; b=q80VeaPt6dY7lgJnyMoMVVBp8MjKGA75kLOFrLgcjT0/qwoWJwGZC9bcsquGElxD6NT0bpntJQ7cj0zpwvmH4USxGGp8UomdqMQHpw6kSa/sZaKC2YFF46BWM/FF1czV55pI/di8B+xSmgocmdcpbvDgbj0oE/MahOkMoawB3YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788812680; c=relaxed/simple;
	bh=OvmGJXWTrtFVyiq8kkMO2myxFyrf9kt4/dp6hHNffZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AUibJhbMWkMAaSdRifbMyCc4KNVL94FnVaVcfidjquwx1u2rijFREjaihvI79ToUoXvQuSSG2OIU9fnL1j8hJAtGqVwIgDA24k+isHAnkdsYaZkttB+4uDY3FVpajemKXA5cYxKVGZOyvBUp4dTOnWgRGqpI69S8FNbs8aCq1yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AI5J/Xub; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NValjlwZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AI5J/Xub";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NValjlwZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687HWTWR565741
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 20:24:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+HYeP9I0GCFZQ5ANdwKliPovJIbIMV4i61aW+Ci2/bg=; b=AI5J/XubM63NeOJ3
	Q0bl4Hg1WHZkUSuOSn8ZBIYajlndQ972eHqh4oLnplJDTzTB0jiFrdTRBjwWFKs8
	2sC/wg6jfndPfvJhPSLsXWpKIA+E2Tx96s6QwcewE4roBSavGwIHxXsRd3+BjiDE
	ayrmAyYnFn2vsH25i5YtTmz4PYGNQU4sTHkgCDkqELzHOYsEKK+q6x+b4nHhrkw6
	ioeeJ31U1m/qXh3F7/3Sx5Jh9IBiBCFX1XSuEYIMt+qCS7/8fiWGHvkL+17UdBqf
	CV40sUX4mdlZ+dTFwaWjHgTV3uOw054aEcVSHkFrEVcHw0uZTEzcXO9B9TzdAdfU
	le6LkQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj1rrgetf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 20:24:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbf293831so8012893a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788812676; x=1789417476; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+HYeP9I0GCFZQ5ANdwKliPovJIbIMV4i61aW+Ci2/bg=;
        b=NValjlwZXROs6gl0LVzpx09KIxUxhc3vi76jkHenTRvIY8GlBMhXoQRNjXJWzvzd9s
         ymanEv4LWfybwamYdrZf6Gpdv5EyjAwoLrK9lOgozNhl/iFuiqvhO8+3hnks32jmzFF/
         BUgYt7Ae1u27HBOQGtS+a13oG0WWOOcnhtzdbdghRNLDujSHu0EiWRv2HJm//GhvuwZp
         +p5xRWzx5idHD6nNuISsNFHZF6n5+y2QVn/FX8Fc5IQr3m9klQHZN1RUZSdT37PS7Vai
         rpQ/VDWA3SAB5zYm9GWiz0Tc5bUAIoQPcg+LBS0GBYZjNk8krw/O5wUMQtIAT7FI2Guc
         AXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788812676; x=1789417476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+HYeP9I0GCFZQ5ANdwKliPovJIbIMV4i61aW+Ci2/bg=;
        b=AR5pJmT5XiguHX+Z0NCBrapfJfPKGBD3TjzVnsshc0sQ8rwVT+iLDSC8JDYkAYJTDE
         v4WBJ2ClmMtjhDXrLqsJ6iSILxQlHOuR3guSzrtHhcc6Op81Ej+wwBqN5VlFW9etrOEb
         NCiA3giaEXiVnFDwdj18A+kUPa1mTjG2GrlQR9y619sryGVTI2CHyZ4B10jPcUHLRtMz
         NBw1gcCJAcIaIqltrJq8rPuE2acwxqmrAVUX47a06ltTWhtabIRkZGK0MYOkUqgd2DI7
         XeyOUl/n75H+GDM33u78/BooRKL/YhtiL4eUmSj9KGkdAgMLrcVKBJ4/+Q7HIPe6QYPq
         hthQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmVGUDImSSJNz47k2M2Q1c+mbHxkrPGDwwEoLcs34NDiMCDQryknx6aRpuMzlOU6450ioyUKD6LoF3juo=@vger.kernel.org
X-Gm-Message-State: AFuF++kRgRakUMqZIOBHe1mvkwFVFVC/rW6bkporoRWF2RINciK9k5WM
	11kjv7gfzJ66miPThhxRWWCaTz6am5HdeOUJ0FnrcRvdqI1upPO2jDMzqFo7tc1WT+svk4Ypidr
	kEbhAz+EtwDNZwG5mG1sTEMIaUXXxvNWcEYhwQFopkMDyH59JiOmDOl3qJdk87dVzY3Y=
X-Gm-Gg: AYBFou322ZTjvUSg/Uj+dUq3Yidz3cT8q1hMbcAhtpiN72uDpiUaHnfYGocT4BfyxS+
	Em5fRAzfXbuGXDbCfeVLDkJweXpix3s5V1ZlN4xIWmmqC5KIdwDWzEEuFzL6qDZmrrhVFCVSE8U
	1gOQs1SjmfBqbFIF2T0Xq8uZYlNUqTR1M4TcD/fHFv8yZLpD1QcXyRFzHn6gcowcOSOnJXpPuu8
	u1beYTt0DLYf5Wdf/kxPo6bpxZqwkmh/1X5+vAlWcCPiVQMQ+lrb9Wk+eoFc6/rePk1bRqvCRze
	lHVQy6YqVbBJcr/6/QS1s9W58EWT+95pD5wEyPQpotI60nc6XyfFkYgSGzjMgfXSYzh6oWYKxMA
	mnsDaFlQzPXMZ83TtlClNBzid/NWZGw==
X-Received: by 2002:a17:90b:268d:b0:398:bdb0:adb7 with SMTP id 98e67ed59e1d1-39b261e1beemr40352047a91.16.1788812675469;
        Mon, 07 Sep 2026 13:24:35 -0700 (PDT)
X-Received: by 2002:a17:90b:268d:b0:398:bdb0:adb7 with SMTP id 98e67ed59e1d1-39b261e1beemr40351940a91.16.1788812675029;
        Mon, 07 Sep 2026 13:24:35 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm30482259eec.19.2026.09.07.13.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:24:34 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 01:53:18 +0530
Subject: [PATCH net-next v2 6/9] net: stmmac: qcom-ethqos: warn about
 legacy RGMII PHY modes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-shikra_ethernet-v2-6-bbe3389d0652@oss.qualcomm.com>
References: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
In-Reply-To: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788812616; l=1435;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=OvmGJXWTrtFVyiq8kkMO2myxFyrf9kt4/dp6hHNffZ4=;
 b=gZT/4dzpGgbBKDcmTineyWKwhP2SiV3nr0psphFKz3N/i048ZPv6oxaDasRhwQFJ5SZTNwxcI
 osJt7ozA19pDbpIWJx+1zSZf5asWNRUm1a7D4FQHFRm3p+DbT2ldB4N
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX1o9pb3+TC2LF
 eAYl6nrmCdm4TPTuiG/1a7AxRIqJpn5T0a115THyd66B2kZ0wJj6ZZO0MKmILxQj2r3uM+sdiR/
 XR1RTSytlYf32Qskbo/7qWAr4K8tMZQ=
X-Proofpoint-GUID: Llqku5J5TU-pd-nm6JncyQBtOe76M9AF
X-Authority-Analysis: v=2.4 cv=NsjhtcdJ c=1 sm=1 tr=0 ts=6a9f1d84 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VSm8jR0bnqFplKljzc0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfXyAU8TcYpi1Ve
 DFzcvmPiSiVvwFUF+cGuRkxiNuwd5IhdWGTanAe/9/CgVocxJlzy8IYpd0DAgO5yQCf9FgPZ1KZ
 A8iV0qfk2e6Yy/tUz+aRKgKa8uHkrqHrbnfioPRiTmCtEGEy7dsj/4hOHno/lsMBPtazKeuL8Zl
 aSKlJvd47C/Pn8GJUrIAvjJhnkrhYcXfEI10q/GoyOuHuI07m5MG7VjHpaoiw4fIMel3NzhdN6p
 d6p1Sr4EKFFHqoN74R+l4OkPOfmXRRGEMdqfEuEbdj6uE1fqelqrWIFhTrOeqidIrCpLEUU3kGU
 2RfOBGQokZ0SZAp0hIgg911koN85ycShreec0zT138pXU/FvuERf5ZAMOSTWxPyYu5/DCd4IRwp
 c8YEwee2iwuhDghYeCav3dLHWW4MgpQ1fhyXlbxVe7ib7CT8w57PWz2EcNIsEl/XiYs6FAc6xTo
 ejxcKArW8gaTr7pdBHg==
X-Proofpoint-ORIG-GUID: Llqku5J5TU-pd-nm6JncyQBtOe76M9AF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070224

The qcom-ethqos driver is moving towards using "rgmii-id" together
with PHY-provided delays. However, existing DTBs use "rgmii" and
"rgmii-txid" and must remain supported for backwards compatibility.

Warn when either of these legacy PHY modes is used to encourage users
to migrate to updated DTBs using "rgmii-id".

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 53fb9de4d92c7f1b3c51c183064024f06150444d..a92bf4a6a2dbd987893bd4a3890df770bb7a7e56 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -764,9 +764,11 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->phy_mode = plat_dat->phy_interface;
 	switch (ethqos->phy_mode) {
 	case PHY_INTERFACE_MODE_RGMII:
-	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
+		dev_warn(dev, "legacy RGMII phy-mode detected; consider upgrading to a newer DTB\n");
+		fallthrough;
+	case PHY_INTERFACE_MODE_RGMII_ID:
 		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_rgmii;
 		break;
 	case PHY_INTERFACE_MODE_2500BASEX:

-- 
2.34.1

