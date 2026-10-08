Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CC922F388
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443681; cv=none; b=mNUDBY6a+cA9qng7JQC8XoNKwpQv02OSjCtAohzxFfytpqKHaHae1VqicVU4N2fAS+rY1AC6IZGaTa1CqVUOI2gF7LVjeNhEGjheDBlmXRfY9r0Izktxlu92QrwwrgQ/xKl2VS4WQuYDGiqFoFNeB5oJcTSOy4IZoarKvPBZf5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443681; c=relaxed/simple;
	bh=k7+wjSAGjpR22f7rKksM9nAh3MeACrWaJ5KFpnnayHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QKWPR066Y/xZ2Gv8vqaYMqEW4Uxi0COfePj1FoxxlLPB9ul5s83L8dS394UGpMcHVuXPpDXjIvimVq8V9z4OwFUsrEE7k8Z/ym6GIVX1AfOWnaIUHRn0l3R0P5YRsoG+p++9ZjLgwmOu0p2mm6PmLnfYhL/SjpHBSXzCnu4+fPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cRxzyENs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NtEUbJU8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cRxzyENs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NtEUbJU8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BUxP2895417
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 07:14:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YCTW4H5IPL7VDi+PNSnrXV87F875dEo/Q9jyiNIcq6k=; b=cRxzyENsYoEz/VGU
	A6lUGl2nNKIMvUTIw6sYvTQ0xo7YoFQbIo1xD3l4smvXWG1dvx6tWNfmEqDK50z3
	UPgC0qantw/+7J24qhLHeUFuHhvgfz5MhmLGPFPCyFgAkFaKWZEKNPhdc/FQNf+9
	NbjBdy/2SPH+7tBAJszejKOhIvwQn1UiNVbLR9B8/KDLXbTlHxUaUVlblCecb/Aj
	bGFlWli/FKOg9iW5tkOJBM79MNK44r/k0y3RpBg+ulIMedDh7TgTnAuL93rBO5U4
	ROgwSuBsFnZGxNDUb6gHni6rIcxiwM3oOMfxi5AR44wGuc7GyJN8jWveeSAXsON7
	BHhE/w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h60sg97et-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 07:14:39 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510d0baf63so10165390eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 00:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791443678; x=1792048478; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YCTW4H5IPL7VDi+PNSnrXV87F875dEo/Q9jyiNIcq6k=;
        b=NtEUbJU8V36+Iz59sSGJoe2izuDF6GkTBcSxVUls1dypGFg3s1bvCHp5QbT/nSanTU
         HJbpKFNz+pGEyJ2KgZtQr/4mxfwYruYgtgt/9YCupGDx+1cpWr/gMrG9lydLQnbCaeT5
         Xrtzysu3dFS1bvzn/Npo0cehyMeNwrp6IsI2/fqkqFhWDgMNuiiOPL65am8a637ZhTn5
         nx1fyWuhTzxrkGWMRqUMS5xmD5F5DJH0f4/Y4p7TC4enOXbkXwmkEPTLwqDdg23YJDAQ
         QK7D772W2pN6a4eoY2GHhD6QTV3j9wS/akv/ENIR2DvzWF9b3DFnoPNEnCYyTNO1oQ62
         cdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791443678; x=1792048478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YCTW4H5IPL7VDi+PNSnrXV87F875dEo/Q9jyiNIcq6k=;
        b=X50i5Xya8gYDOXeR4ME0C4inDxRZJfp9wNGHBqaxg9LGzuqYNtBnnSpcfM9YBzvZ+E
         1HNQKs1sjkVeyPf8rzj8L/Vn1M8SsrgDa3JhFfOynJaY9lGuUl1tNcIElpDm7SEfRVZb
         INNM9JV3qlZ0PQ/RiLFZanarOvw2bKzr/njeiGfpE8Pdf1CAAkvX5P1VuCTbTHzPh0SV
         74Z3k0Mi6DvhERGAnHNcpSQaDyOI6kMRhHeMnQNMhWSH3bslHzfUfdm4LyDuAyYv3H99
         Cspb6X6xwcRp98SW+VDpNaLubfyvTValvciuzfVVkW1PmorllsBN6qEQTMGMaBkUycps
         DzXg==
X-Forwarded-Encrypted: i=1; AKwUvBzyVDhq5YbZZXSyp8/PAabdfk0syCA0XiFA2M7eBVY7cxrO52TepGvWFO44R2hBTQdECdg6T6U92yf/JHQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nhaUhaS/tZs0VbcoaairTSlpcZW+LEwzxOgnTWxhV26uRZXrM2
	qPkEWKz3qY7AV7bCTEIycqxkFuNfepiNykNcg65fDmV0Rj5o/9QkhH4zaq8rVdVG7rNvrOjDSei
	nDNe636B9EZ6Sv5A/jxYG0shdbEv8wmm+dwcg09h8FfcC5g5o7E+qa3RoD8pbrdn6yIM=
X-Gm-Gg: AYBFou1vUabQILKajZnEnIMKZmSm+5n80e0ZLDptt4HsOedEHXc7D5J5vPn7HGXeiDl
	/Is3egb9MMfhOfPqUWqwxPXXJ490YAsSjQa5NzFd9gkM1ii5cYRIrY0/IIsq7+Z+oGQbXbw50KQ
	X5unhHTY/aK8Q7TDm+GJ/gRh/2Axl/eBnY3RRIiEjtZXT1LleaWTcJk802iTtciX1xIjnc3jXIE
	AJPXrhdb6RiHpJmbBJg0a+3xeV0T8+3coaL5kx0pLAcHQA9S29xPUY/PZkumNvu3yz9m4AwTMgt
	xuEp8UrnAL1v7PkKPbZv84MoItU9iWCEo0XK6Bs7eKPptwxQs/Fnw5KK66NX6qdEwjLvgXVMe0s
	TAk3GBabgR9Ro2tXtNTYtoigQR1yr6Yl9RVI3soGrJ3jt4wBEDqkz0rW/qo5TF35NvzE2Kt190I
	E3i6x5tLBfaA==
X-Received: by 2002:a05:7301:6709:b0:351:35b3:c5b6 with SMTP id 5a478bee46e88-3515df2fcb2mr7875497eec.27.1791443678373;
        Thu, 08 Oct 2026 00:14:38 -0700 (PDT)
X-Received: by 2002:a05:7301:6709:b0:351:35b3:c5b6 with SMTP id 5a478bee46e88-3515df2fcb2mr7875431eec.27.1791443677668;
        Thu, 08 Oct 2026 00:14:37 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515af155b5sm12251625eec.12.2026.10.08.00.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 00:14:37 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 00:14:32 -0700
Subject: [PATCH v19 02/12] phy: qcom-mipi-csi2: Parametrise the common
 status register offset
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-kaanapali-camss-v19-2-b2c583ef50e0@oss.qualcomm.com>
References: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com>
In-Reply-To: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-GUID: rzvUg1XNc4A-41tHreGf8u7Po0gRgaIA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyOCBTYWx0ZWRfX4KeQv2My+/9e
 nEON3dvuMBIfxwRMkmnul4Mvtu6NnGyhjCSONFgUfITOJyrf3wcnQVBRtiCyrYGsU1oeWAQmL42
 b7sG0pj/8oAVD+rtWjxV59gW3jmQyLs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyOCBTYWx0ZWRfXyPjMxJN4a6n/
 SPzDyRZjGo6iCfN0k3qQnqEsidxLN8YwlyHjAF58lr15qyeg8l7oUhxnL8SixfYDEdJZz4ZBLZy
 9ScmlYMIQeO85PZ2BnIAu48ujq3yIZqKvW4HN/L8zU0T1Aem6neBvQJXoE39pM24DyON5NfR13H
 CW6JCrShxPn9NCk77GWDL8GyngBn9a1ljb4jreU2wj19aRVBkTtWcJGOKRdpRqH4oR9oeZ3dRx3
 lCGmwfcbW0Rbondk3m+STZF88JGQbGUoqRKF2szjaqdsdTbpsOxdhhXXLoJM/MV2DipGyHtGbld
 h1SdOAUWqswflWLP2/GrYWOebylkcOBwfj5Td49e6v++GNCDxHeHPui5rqrvyCzecxGI5YmnJO8
 c2h3x7rfuGs4SATyf5xNMBViY960xJKrZmUsWrV9AFmehEujvgOeb5hrDTW5C0z0S6x+KTVQNlW
 a2MEXIJAXTJm3NIAi5A==
X-Authority-Analysis: v=2.4 cv=DfWCOftW c=1 sm=1 tr=0 ts=6ac742df cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=P6Xs4Y00w1yHQXPR5eoA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: rzvUg1XNc4A-41tHreGf8u7Po0gRgaIA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080028

The CSI2 PHY common status registers are not at a fixed offset from the
common register block across SoCs: x1e80100 uses 0xb0 while other 3PH
v2.4.0 parts differ.

Replace the hard-coded 0xb0 in CSIPHY_3PH_CMN_CSI_COMMON_STATUSn() with
a per-SoC common_status_offset field in struct mipi_csi2phy_device_regs,
initialising x1e80100 to 0xb0 so behaviour is unchanged. This is a
no-functional-change preparation for describing other SoC offsets.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 +++++++++++-----
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 966d79c98f9b..8cd331cfb4b3 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -19,7 +19,8 @@
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B	BIT(0)
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID	BIT(1)
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL10_IRQ_CLEAR_CMD	BIT(0)
-#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, n)	((offset) + 0xb0 + 0x4 * (n))
+#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, common_status_offset, n) \
+	((offset) + (common_status_offset) + 0x4 * (n))
 
 #define CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(n)		((0x200 * (n)) + 0x24)
 
@@ -176,19 +177,23 @@ static void phy_qcom_mipi_csi2_hw_version_read(struct mipi_csi2phy_device *csi2p
 	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 6));
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 12));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 12));
 	csi2phy->hw_version = tmp;
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 13));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 13));
 	csi2phy->hw_version |= (tmp << 8) & 0xFF00;
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 14));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 14));
 	csi2phy->hw_version |= (tmp << 16) & 0xFF0000;
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 15));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 15));
 	csi2phy->hw_version |= (tmp << 24) & 0xFF000000;
 
 	dev_dbg_once(csi2phy->dev, "CSIPHY 3PH HW Version = 0x%08x\n", csi2phy->hw_version);
@@ -375,6 +380,7 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
 		.init_seq = lane_regs_x1e80100,
 		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
 		.common_regs_offset = 0x1000,
+		.common_status_offset = 0xb0,
 	},
 	.supply_names = (const char **)x1e_supplies,
 	.num_supplies = ARRAY_SIZE(x1e_supplies),
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index 7e55ae007370..d6366f809e51 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -51,6 +51,7 @@ struct mipi_csi2phy_device_regs {
 	const struct mipi_csi2phy_lane_regs *init_seq;
 	const int lane_array_size;
 	const u32 common_regs_offset;
+	const u32 common_status_offset;
 };
 
 struct mipi_csi2_genpd {

-- 
2.34.1

