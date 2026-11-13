Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548039;
	b=XiMqrq0rhDmHT+oUc+U1Xdj/ou7XbpRp8eu9YYYvXdlJBe7X7s1oi5VwKAfu69+msnaG
	 P+InLBY8UaQZBb8kRN1/+TXyYmAgn6fmtNEGYKrsAUQt1gpyXuqUHjQJK4yJqveCR+8je
	 /tuI6ZWnUhV+H1j9gzeUCCX04m/LL+J+I1Y5T/c3LTZvwtlrlvqdn0SFlprZSqZpkKhgV
	 qcuNHtTvdJuCiJlkBBfi7i2qyntpnz6qt7hzlSpPzPyzvhmCP8Oc/kW9NBXWyK96wsDDU
	 P2k+xj4m1hDioxjKIP43hLOMOGmZ2F8tzNLzEqeNMhrOTh+rIbendRGIGV51LJB8Dqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548039;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=H8f8Mh3ZgS0m37ODmPprXsCON9gwMJBXEWv6on2qRfE=;
	b=xuqOHPLjVPaVtlvDtRsCHr6v5wbmtRUivDUBc6KEAPSmgfACuQP8GwlFsQ31ILlZwD7E
	 uPJwj/SxJEg1ftq96V+Ye0RIh9Ggqfl2yt8jVt0ratvvElTdwVbC9QN7peJz4UhuowHB5
	 c4igHefyt1/36nwc5J4s2HHzlZvv+BQYZ2/bDRCraPHxE4CVORIaQ+424dg3vd6XI9PEe
	 NE5gN96/RJipEL03Yi0xhTDTpCCMeRrNWDDW6pWTJhFoTzeS7CqBPPAVUcsBCXHYWbrft
	 S04l+XnpCOXoucz2gnyf8cu5hNKi5zDRPeH8apnCCmRHZCN7rR0V+NkstpmRcf0L71A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WuYHBI9X;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DKQ1ff28;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305C4606A8AC
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 305C4606A8AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WuYHBI9X;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DKQ1ff28
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD576gX073410
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:33:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H8f8Mh3ZgS0m37ODmPprXsCON9gwMJBXEWv6on2qRfE=; b=WuYHBI9XEhpt2lnr
	2y1TMGGndgF2QjENE2BFsgN2dVwQXAkj9QrOOZl4IzsKYq51OIB6vQE5cgKQ/lls
	L7TMizGYbVTEEKE4zM45KMp0ruIvgGGgyU43b+KduJxbnYfYycVkgYD/Xh6p++A5
	SrLtLZFc3Q1GC3Elrq9D6Tn8Qrs77ARnpQimudpkMopFKll2sbwZj9A0rXKirj8T
	oDMQ7m/KtTjNG1dLk01ERfijUVAFpsbSegFvt8WngajvHHL2tuOJSq2eZYihIhJ1
	uWIrOoRsUfa7KEsIbe2eb70dakLiAKa/cUYKo4/vrwt257bvLmP9cbXelHuBkZ+7
	bUhhQg==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbs03mda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:33:58 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-46a5954cdfcso629720fac.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794548037; x=1795152837; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H8f8Mh3ZgS0m37ODmPprXsCON9gwMJBXEWv6on2qRfE=;
        b=DKQ1ff28cGflMdIvt4Z99O9Z3HsjcEjCAU6qjL2GPBH2Kbdxx7Z+TgiUZTcd3m3k7J
         6VJzKaWgQzl6Pd5fZgBFL4cfIwxir5XkIuy1f8clOPOMiz8/IBrcJIbt+XuGRfTsuz9K
         YYQDZUJRyGGAQ7m8jjvMPnqp1E0jz9RETq0WQ58fY8eUUAP9hgun7RCkUqaoHDR7TosV
         KHV0Ta/JqEiq6IExVFd7axGJD2zfpPcdZNJ9Y1oEngP+WnCrjWmlKmCtMdFpqAQbPaVA
         PcEJLXQvHiH1lP69PECYqzbaRcx/hkX/b3bsO2AEXeMFeA7Y3InKdCm1lndIDEAw0izF
         CYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548037; x=1795152837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H8f8Mh3ZgS0m37ODmPprXsCON9gwMJBXEWv6on2qRfE=;
        b=kbw505GwONGWvZ9csZ/J3oMTT0cfpYH7xMrxjf98WTBGbl3Bv8FS+//c02w3CXYbHN
         jh+az1vusXYu/9I8Oi8ONOYeEV7yDGkeTGvEAj0+p9Z+oVe2h8j8F2QveFJweHnzFWxK
         gQSxZzseT5gSp0fAXGPoqXDhnbGGFsn0z2fPbyqnCbldm/bwQnDsVf7AqOeLSrN+tLR6
         JtTooUxt4fw9wE0GtdQfSXRQwu663ZR1jeadnb/s629jDajHR+d0wE/M18JpOZR1qHVH
         8nIyTy1tkLWqhLi2iH7g16fXU/LCr8dC2JXEaPHDTIWBRhJfsB6vF5VIQf8wJnezLGoz
         bArg==
X-Forwarded-Encrypted: i=1; AL+hErEnKiBaHvoageSj5U7NV0D+ihvqdfw6vqJapo/ZVCGj1SGWixK+fkz61NE+8wKvUsdJOVoCW/v+OOj9FTw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HQceMsm0n+tdk9r3qMB+OI6+fshaCix1DFfKJj41jXTAdcoM3
	PjquRA3Nihj3sKBaPI589qumpn5H4TBeBs3+LvEVwB1M/x0TDXuTUTSqUBpIUBgjHQAGaB0nR25
	+zse8P2m7g8F9Vt5ijLNMtfasML0a1FZbsZj5Y8F+Q+9DbpjBzEj9X+fCi9Nng3zAC8c=
X-Gm-Gg: AYBFou0p5jKCcz/7ZXMsH4Y9wp8M8tLI2GBE8d3pgptXIs5A1AO8n1O/GA2VTreAMPJ
	JPSyZ79KGX8qFvo8x/oEET1ZxilE8J8d6HLQ93j7QVXubeSIiJp4tgEpMvCXdreo7fI67n6vdXw
	D0q5NlMnEvLbxBpBAXdTgr8djk4/ndiL5kqitpduIOdUL8aIZZwPrhDO4FL6CrJN9gs0U+dIuXw
	WhyafqByQkr1Qk6wyWZ4E8lnDEG0VnyiP1SRURk9RYFv6UiXdFNvv2geLHQFHj/++Tr8qXfLmu4
	aOa1ZqWztOZ7TV+YaoI0ukNAhYActUdkp6kuGG/jbCgU9PxffxpMOh/gPjlYZsahlnlDO4kEPhT
	zX5EHkgIoHzVVh0y3aC7v6SNAsAlTVdK7UEx2qQEsX7LrCk4ZljQE07JxbJxF+mcJu97/EupKPQ
	eZo7pzyQiSe38jvdnRjMsKQ51rHof5VJuc/rX7qlgHakJmbqFlN7YpPW6HkC2T
X-Received: by 2002:a05:6870:9d97:b0:48f:e0e5:a1ee with SMTP id 586e51a60fabf-4afdf7ce18bmr1641978fac.51.1794548037314;
        Thu, 12 Nov 2026 21:33:57 -0800 (PST)
X-Received: by 2002:a05:6870:9d97:b0:48f:e0e5:a1ee with SMTP id 586e51a60fabf-4afdf7ce18bmr1641959fac.51.1794548036800;
        Thu, 12 Nov 2026 21:33:56 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe22576bfsm803252fac.7.2026.11.12.21.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:33:56 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 21:33:34 -0800
Subject: [PATCH v25 02/15] phy: qcom-mipi-csi2: Parametrise the common
 status register offset
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
Message-Id: <20261112-kaanapali-camss-v25-2-1d709f57f370@oss.qualcomm.com>
References: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
In-Reply-To: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
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
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX/SY/xvgfoZMi
 4SigPTbV+6NCZ1HCzqjgYGDfv2XEQGGyo7n1vov7V3lIxtLH4SzKQCEsJOf/1FDXpHwwXZ8tFxE
 TevRT9TPdU9FHg4LYcBRMo7FgJee2mWrJY3yCqXC0XdI9EshvIdgjUBnHe4a7PQWbn8AKslsy4+
 ryu0N5+I2zAeHUZv3TJ7U4jLAIn68YLLLA+QxkmVK9iILVRPBh3s2dqumaFRVzAuR8AvmdevoDL
 /AzmNMD2PsdQI6Y/d0A0FVstczVB6ufGAkxHYp/QnJuLdY7Nes61J+Of2VhjTNYcpAaWJY/u4/U
 +utbPBinqHftwwZxnYUDAYePN6Zj3hLvivtx2paAuOE2RFe6C/QjLHNrXidHpribnC9wZjqiSIA
 vkMpkkwAslmAJnxDqVy2c5djqFlMPQdmLeCQrRl1REziD5TwMnzVrXvDn7v9l6msjYMYWSlhfeb
 edaLFHK9q4HZ5LFLOvw==
X-Authority-Analysis: v=2.4 cv=AsF7T+9P c=1 sm=1 tr=0 ts=6af6a146 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=P6Xs4Y00w1yHQXPR5eoA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX6E7P6rIeUn15
 QUl/916T1TiDTQY6nGcO1iv2IVkdZ7JjhqAMHo6Gi8kHYb6gToF55tNaRPk1RfA0IkUELVbNm4N
 DXjIRc8lWINSiwXqJq8YRoTiJvIoVUY=
X-Proofpoint-GUID: YGpAjpBBf1M5TwlSMR2L4HN0B5a6-l6w
X-Proofpoint-ORIG-GUID: YGpAjpBBf1M5TwlSMR2L4HN0B5a6-l6w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130021

The CSI2 PHY common status registers are not at a fixed offset from the
common register block across SoCs: x1e80100 uses 0xb0 while other 3PH
v2.4.0 parts differ.

Replace the hard-coded 0xb0 in CSIPHY_3PH_CMN_CSI_COMMON_STATUSn() with
a per-SoC common_status_offset field in struct mipi_csi2phy_device_regs,
initialising x1e80100 to 0xb0 so behaviour is unchanged. This is a
no-functional-change preparation for describing other SoC offsets.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
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

