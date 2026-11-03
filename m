Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793743840;
	b=zdevFa1dsUimSR7cKkN0fzoVdKX7x9mO1aNoXR6vC0wEg9EPWKHi0osB+yQJ1e/04III
	 2+mBuwhcn+rgZ9IepBmYJH3pe5wfSOBlS1nEfNZq1CNbcU9566xgC+OZ1SKx1geMV5P8Z
	 KMvpBrVrizrcP2Hsl8c9tqUsPJ1sqq9Wuj6bt44YiPNDADbZf9vr81uwbtJBqGs88IxKy
	 IdJjCllhQOqIB6tYHb8aX/pYtqiVQ9hwBhKrcPyhpWT/HPTE/8tdq/Q8g84/tMHvOl8dI
	 CuErOMsLdGfvECahT1tmvGwx77KQnN69F9825hmNUQNLKwVnZQRViOhGt9Wnvu67sQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793743840;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Bq9q8ndWYXWdbsRd1Z+GWT3oVUYG9gG/fVSEYiW0F90=;
	b=T2wgZLgX9WtSb10jjtsNJjr8qj2QyNiSfh8axDLtzpK1Fi2Y69Jj8G4Gz0zUoM/We6oc
	 2/X26AETRycyxRhjLYnL/+8nc5xyu0vGLn5f+E2xqeKPOADlfwyLRRp+pTjZuV0GqRXZg
	 Mo+1wnhLtSPUWiFs8V3Az3YYv/NzR48t5SJb18eVrpHTAZ3aamCFFEks14U88soSC2cLg
	 lJeQSP2tq8HvDOf5AyVTq0f+m3yEqdfem9+CvhJj04yje6JJgbPDMmxSj8AKO5MTjkAIw
	 dK6xaNGAnGhND+30cQclQU8Qtj2skoFaChOrq+TYew4U5MPwCK1UdO2de70r6MBoXxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FQaOW+56;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qcs7M+Zu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3784606D82C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:10:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3784606D82C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FQaOW+56;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qcs7M+Zu
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LKlCa3065524
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 22:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Bq9q8ndWYXW
	dbsRd1Z+GWT3oVUYG9gG/fVSEYiW0F90=; b=FQaOW+563c4HsUkcfSoXlxl935i
	pmRLBcxWVsalSW7ggAyR//Xn1rfCBEs4bGK19uJzclpfjm3/FSmmTbN0Z9Oa8WHo
	IhZ7JcGjdKOhH1xjnmwofY65Yc8yE6bqM3sIpnS2YVa6ts9FGWLfZTEiOTED2/9Y
	27NEEWtKabSa2N6KcOS8s6YxjHsbpMVjeFoxfNmIBZAISpd2Fxskc1S2zQECUtO2
	3YQoMpTZkZMaYU14/ylp4Uu2wgtkr3kDppy7XfmiU2QMXLNQFqpCv4tJ8MMBqdYp
	3+VOaH0Z/5kPFw05UQL8qvLatsXe5Daj07zTQ2JAr7kJydKCFMI9RgTWgtg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2bt0je-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 22:10:33 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so408460c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793743833; x=1794348633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bq9q8ndWYXWdbsRd1Z+GWT3oVUYG9gG/fVSEYiW0F90=;
        b=Qcs7M+Zu/72tNDc8G4X6wTnmMVxleGFbW+v3LGeJhhFDtIi8Bz8OMlK5j0O1wG8P+Q
         pXQQrAD5g/6LqMFpHcEgZmqXDE/TxJsnfFYlEIlI6XuNNpDY0OGgAOh/vLQz+QGbsSXr
         RjKTgmlt02XoZetPolivlM/45DkgD+WSwxxW0F0cv4qivmVSob/toMR5gSzkRk81kjKj
         UVO84Tn9a2wKMzR1VYKhk31D9q/LGw3pLzs+YYrMEOJRBigdGCfJc0VKGG2cDNSDA6ZI
         v12R/v4lQBXOvh1jbfFPCrFL11WaxfEpjrxhX8+wyU2h6tGe3RgfZtEKNZBJmzVhbISn
         pSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793743833; x=1794348633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bq9q8ndWYXWdbsRd1Z+GWT3oVUYG9gG/fVSEYiW0F90=;
        b=IA+2Ov5iRNKEFcFS0ro9lagRWoUkVaF2qTnLUoD29xiNq+YjVXXXfxUMhg9UPnzmaL
         i6cooefBTfqNG+dd6VIxOmQ2wxYffApXzrJ4iJWADHg3J3QWa9J6Ln7Hl2CmsW596ueL
         t8gEje94VahEFDT0mIEtWVyjJOVvGT3cXeavDiHnoGGv5SXNiV5HWu3zePW+iZmuX2IY
         FF2789wampgvFfVUZVPuw36Adi1EdD2RUgMxkWu64Q9Sc/R/uREewYa+74v7+qTs5Qsi
         jcIraVfozWnoe3FsR5YgE8C4eYmjmZ0jg7dq8mRM9EiLIwfKI/GjuNWRzf0cNQl66mpr
         SqBg==
X-Forwarded-Encrypted: i=1; AKwUvBwEcACh/8t77qXQQmFQR7WT8pw0GlDzefDcvtuhV8ZEk2n+B9xtXO8Ifu0VMrbtZSkA6hKY6mBX1dxOkYQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZydXXllFRC4/N39QcyQMjG1nxVCcgCjkR2D4oFnL2DSFmBfQS
	ehFkPLF1W8yDd/eZevLS4c/bsd9B4/JuaYMq6brUvoTaSXK+gDXqjWx1wq3+2p5IP66aL9qZyoT
	AZxrzXuwBGZHPFP8CWB1yM5btYG9Nx39O5t72IAcQBFHxa+uYHAV3DTVHS5ozNOAEl+o=
X-Gm-Gg: AYBFou3Nu3MVIjbgfn0QgTrWobN+Hh+P2REE9b/wO4upFA0cCs8E3+A8Aqplb7UVbq9
	kzuQRUK5AP7+P4mGPdLzNobWnWY+bAMEOoINwB5LfKL94yjaBXhnUYotFthKNowDEpS8SQq6kF6
	wx/VbpGYej0fd1yzyt5XLZa7T5RFyLQQwCF98CqFYy4LkI+rBtTB6jUTkyZw3kDXG0C7W3JWx4d
	m/P+CjHf1eh5Ls5ntw24+R0gKTp6Fi+0ujCT0SH++D6bbvMapbNWHGRDyx0F0rnYU7baGiNvhVd
	akxAMZBb71MsDDrPNJQfODUoXXhuSURfmqtpc0pGBtNFrR2LvO5BXHgSKOJgNLNMOXz6IN2zQlQ
	+4ITqrIcsjF4od0hoKazSQwoKeRpoXvIAO7PzbJV0PNjv++QlkXUOCfV9Ugzl95rkz1rFPCOpVF
	Dn8/QTbZgC6w/4/ndFc7Bo6GR75vHu
X-Received: by 2002:a05:701b:4589:b0:19b:39f4:88c9 with SMTP id a92af1059eb24-1ac5bbb487bmr21042076c88.10.1793743833076;
        Tue, 03 Nov 2026 14:10:33 -0800 (PST)
X-Received: by 2002:a05:701b:4589:b0:19b:39f4:88c9 with SMTP id a92af1059eb24-1ac5bbb487bmr21042036c88.10.1793743832370;
        Tue, 03 Nov 2026 14:10:32 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4706bsm2137312c88.15.2026.11.03.14.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:10:31 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: qcom: kodiak: add CSI2 D-PHY common-phy providers
Date: Tue,  3 Nov 2026 14:10:26 -0800
Message-Id: <20261103221026.3662383-4-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103221026.3662383-1-anusha.nandi@oss.qualcomm.com>
References: <20261103221026.3662383-1-anusha.nandi@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4OCBTYWx0ZWRfX3DFSMzGuEQkn
 QGeFPVJ4/R9uqO30TkQ3FT17UFGd5EuWUrfVYmxAASoT7/ZbcdfO5tR4DlM7F9swwys4xb5PXxR
 60bY/FvzVCXjIr6qHZgzYiCrj8TwJX8=
X-Authority-Analysis: v=2.4 cv=AKV9GsJK c=1 sm=1 tr=0 ts=6aea5bd9 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=AEMvfOE69tE_Q1r2TxsA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: zjMEMrgXMRDbts2pEQ1ccz7vjq7p3Z0w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4OCBTYWx0ZWRfX7mgLZZjh3NsL
 cBBLg/DoNpMIudKxILeDZEHzAmHjQn5WdpB918M1eYmlinwxLMM1VmyQYwVaoBGBoHSc7Kdzyex
 o7A8iseblv6Sv2Dpe044jRLzJl4CglIHDGkNH1mi53ftAOLEDle/GUx5Zdl89tPCc/JOB86/UqC
 Ut0iOMzIRW68Lfen2+6bjVeOUkXnX5erZA/ezi89ReUBKF4mGweZSBnzr3mqVLCdcCEJ2CVNmmm
 WGlpdHWn/mDwiwIqO/TG/bWhz7qMcRFVR6TvjTrv9mdoCgEjspVnHVdEWb1hv3aD/tNDJwoiKAl
 J4d6EGifkeeVEMgWgP2mZkVMB/50+MBOgBOHXZvaqkBG6Qeada3OLb6R45VoZAvEzcJLK8CFRJG
 osTsSy9JtFFB6HBkdX+8vE8TFzlLKRSBCSLwgFRz/Yrcw8oiUq1h/pnX00eU3Yn6AOUhCFRqOMu
 U7FI64owj9wKFNpEDrw==
X-Proofpoint-GUID: zjMEMrgXMRDbts2pEQ1ccz7vjq7p3Z0w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030088

Expose SC7280's five CSIPHYs as standalone
qcom,sc7280-csi2-phy generic-PHY provider nodes (csiphy0..4) at their
existing register addresses, each with its own OF graph (port@0
sensor-facing, port@1 CAMSS-facing) so camss_detect_legacy_phy() picks
the non-legacy path once a board wires a sensor through one of them.
The camss node's own reg-names/clocks/interrupts for the CSIPHYs are
unchanged, so boards that don't use a provider still get the legacy
binding.

The provider nodes are disabled by default; a board or camera overlay
enables the one(s) it uses.

Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 172 +++++++++++++++++++++++++++
 1 file changed, 172 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 8c7523602d27..3f3a41cfaa00 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -5164,6 +5164,178 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		csiphy0: phy@ace0000 {
+			compatible = "qcom,sc7280-csi2-phy";
+			reg = <0x0 0x0ace0000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
+			clock-names = "core",
+				      "timer";
+
+			interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy1: phy@ace2000 {
+			compatible = "qcom,sc7280-csi2-phy";
+			reg = <0x0 0x0ace2000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>;
+			clock-names = "core",
+				      "timer";
+
+			interrupts = <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy2: phy@ace4000 {
+			compatible = "qcom,sc7280-csi2-phy";
+			reg = <0x0 0x0ace4000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>;
+			clock-names = "core",
+				      "timer";
+
+			interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy3: phy@ace6000 {
+			compatible = "qcom,sc7280-csi2-phy";
+			reg = <0x0 0x0ace6000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY3_CLK>,
+				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>;
+			clock-names = "core",
+				      "timer";
+
+			interrupts = <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy4: phy@ace8000 {
+			compatible = "qcom,sc7280-csi2-phy";
+			reg = <0x0 0x0ace8000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY4_CLK>,
+				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>;
+			clock-names = "core",
+				      "timer";
+
+			interrupts = <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy_opp_table: opp-table-csiphy {
+			compatible = "operating-points-v2";
+
+			opp-300000000 {
+				opp-hz = /bits/ 64 <300000000>;
+			};
+
+			opp-400000000 {
+				opp-hz = /bits/ 64 <400000000>;
+			};
+		};
+
 		camss: isp@acb3000 {
 			compatible = "qcom,sc7280-camss";
 
-- 
2.34.1

