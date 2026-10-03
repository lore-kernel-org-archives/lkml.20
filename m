Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F49C54774
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 09:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018157; cv=none; b=oNb1ho5NhgzNhrR/SZwkGUuGX8qONdscHTkWknOiDt13Dg5yZlO/iI1NlRU5p6kgO/Gl9otVVkIIOG2eeYVXFhZNmoThrZAe7Jv/TO9E0C/p7bccmCmQWwNRzBAlBT4tgJyel0Kv3vTQOKWbAA3oIUKKmwMD+D6fnpRr9RtHRvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018157; c=relaxed/simple;
	bh=k7+wjSAGjpR22f7rKksM9nAh3MeACrWaJ5KFpnnayHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QFz4uC4fRUAasgQBdhk3QGbpHYBlkP4IlU3EzNOmoTOesmEeFG7EvyFpLykygmMwW4DkOVUv4BtIA5A9/RqDilMkvjZv9Pj2p6DTKBgNewlXz+M/RmR94q3cWsOttLtGQMVGBiQYcnMqFtxxH0tUH3EvvR+Z2tOkQ6o/EgnzpXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B5WKjWIK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XHXeE3sr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B5WKjWIK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XHXeE3sr"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6933QE8w145978
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 09:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YCTW4H5IPL7VDi+PNSnrXV87F875dEo/Q9jyiNIcq6k=; b=B5WKjWIKfxcdjGu6
	tTcw/DayoxDJFpFG42l9y13TdTxdx4XkM2HRv3xZ4ldsDjc6OEXLOsXU9i+tQTxJ
	XsQoQE/M+b6KAqgzEyMb3zOdGzf3MaFxnEJmKM57I2vhdlLAHc4++zDmc/+GniqL
	0Wwb/D1YO36vajvthYxY3o38TU9zwEHgos+Tw0xQFACRli/GRmZFMCXlMS3SRpvW
	aY+/Ct9baDu0uEHfyE/zHf4MqBLpLHi4NmI9jqwO+eXNxB9l3JxA2zBfWunU2vm1
	+QosFTMDRciZohUqDkBWMvNPcu9S+nEfwBZH0VbibEugcR9KZ3g4A/JnHQRGzDzo
	RZv2QA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sssgg9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 09:02:34 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3510a481ae9so264269eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 02:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791018153; x=1791622953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YCTW4H5IPL7VDi+PNSnrXV87F875dEo/Q9jyiNIcq6k=;
        b=XHXeE3srdnYMyG3wVKj62ufSr80hKen765WSPzRpuihMKQokXplBkP4X3bp+cOMXrf
         a3O0uZPWDvGassoCdNgQThw8jvc5CsGCPWmat7Vmr3fkmYycRpOZl3ioAzN+SW0OmpZj
         jk0df+verZGFlvavPRb/zLWlkqYHpwSXPi/h6GxAk1dZzSaAH2d+M7M1e99a5r2+p1+X
         C0nLwBDZeGDTz1EjZNj/02MjQxYW7VFgCBsrC9OWNcXD9ZDUnYeImKRywKCNCjT5VbtT
         MbW+Q6oaZnvzjWVtA9qvROeH4OysQD7ou0mqjGQhvKTJmZLCtze0yI2KjxzMyKwxcPY0
         hSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791018153; x=1791622953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YCTW4H5IPL7VDi+PNSnrXV87F875dEo/Q9jyiNIcq6k=;
        b=jDK6r1P49091cyOEtpK+NzuKiurIqE8s96iqqv28lND4lH+rK3vl3ncZ4scgBfbq0p
         cP2ktIV6CDfGs49M41zPlCmxGojgNah8XqxgtCIJ6KMzWOEnRu1PCj1tU8WvYeYqAQGP
         EBYqO2YDxZSTiKE1Bvu/2BGPGRnZTiwNK19Rk8/ToaTPLhn/MJw8C7ife0cpPX7Ns/gD
         mCG2E7f8bPd0Cg54uAyi8nhVZTp6DleVtwNgC2sLMyialn9vFohp3z1UXe5jbVE99Fr0
         TtfB5GrzmimQenVLJmWIwMhyiVoUWzUeQqAEV4p06eXx1kqxoJwFrop4e70U9AetNstc
         CwlA==
X-Forwarded-Encrypted: i=1; AKwUvBwSpXfX5V0oMx1/F9bX9Fl83kvD63pY8EbevjxBij2vRsblYcPLwpHoNEDdQ4gbZdZ5d2XD+scon6uglvQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLosGfdqt5XMgQthxBlSHZVGrvNWvc20d/D2T1BATNLWZj0dA7n
	x2awSuIlYiMQRMsGqED1A7HoSEkZEY90tpzDFq/ae6ZFVRUjSTC8KOhe+wogptfI+8oadXiLbke
	nwrFhqktE+sV/t1Az2pfOogBaHT2ELdXRRZgPe4PYAtbxco//HEJw7Fxo3DSjzdV1iSg=
X-Gm-Gg: AYBFou3fIgEoq+z32hJivudh6pC6vLtvWUQl6h/lEZrHhj5wtgXFw8ops0wvScDTReh
	TfoYQXkQeGDwWAxXIZWx4+E1+sQzG1eHD2R3e/ioeYPrU4FKgR3IvTST4gMSqs0Z3NcdcGlqSId
	b3q/w8zcI5VKJazzTSPVDo0Tv/s3IMJagga60p+l19FmYBsyo019SGtYsjr9MR6XOOqPjK13GEz
	U8T4Pbk9mSxESCpRya1+KRK7kueJEvfCEy+lEPBvQOVdzo8IT+RTkXCjE31tOn5X/NmLcj7GMmA
	h0V3uZ4Rg2iJSUKA5Jp17tZuF5xOvZoSJWa9AxlHU19I9Q59gv/OF4kDs+OB1NjXMLeMeRrIyN1
	YJW5MmbRM/J7M+b6x7GfFzXTpDOFXH1mjYlJ9LiDuqTFFuOCHaeratnsmO9vDzSyMOn3oidInko
	2toUIjN8OQvQ==
X-Received: by 2002:a05:7300:dd0c:b0:34c:d018:f33f with SMTP id 5a478bee46e88-34f150aba7amr5407447eec.16.1791018153299;
        Sat, 03 Oct 2026 02:02:33 -0700 (PDT)
X-Received: by 2002:a05:7300:dd0c:b0:34c:d018:f33f with SMTP id 5a478bee46e88-34f150aba7amr5407401eec.16.1791018152432;
        Sat, 03 Oct 2026 02:02:32 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f9f2afsm29278695eec.18.2026.10.03.02.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 02:02:31 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 02:02:15 -0700
Subject: [PATCH v18 04/11] phy: qcom-mipi-csi2: Parametrise the common
 status register offset
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-kaanapali-camss-v18-4-87ba4ebe0db1@oss.qualcomm.com>
References: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
In-Reply-To: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAzNSBTYWx0ZWRfX1gyM06baj5sX
 Whx9PBS6wjsu56cLNtyv0f64vUl1gPAfj/vycrAYS0kHVyjcKI1CYZ4kxXwgilgF6cABFBjCqDc
 01NnMQ6cK5kQYoGxbibr/S/Yf0MT+SM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAzNSBTYWx0ZWRfX0l9XrhLmGl0N
 cRACgVEB3SOF6HkYGzoTdvsuSfYRWlXZYUUsoPZn/3WMZJ142jh7Y0F+HioqNlM5mVqjmtUnRuJ
 uuQr7l6cPWcmKRoJQkAdS2Vd9+F/gT3+rJJygizdIS/SCnkX2j3EXAxazsEJg+3UHTU6QVpdlEo
 UFssAQiAvSkblMKxyQEn1kGzWVi3+iBzEWXgGN1oboMVk18XXFOveh4GJd+xLYXSgqKg8jbFbh9
 gu5LpHPQhQVO5VeZNDdc0J8GcLMc+i9FEBTDx0U81LrRUHkuZqv5a9INwG48s+TyykijBOPWuqe
 d1k0voVtD99ucwTDG+r5MjAaNpjjaVoVFgWZd1cFSsP3qy64D5B5ixdjQBV1mfwnmwdwM8WBv8J
 Dkz0YYUHU19as6RPvidzZxtUrC1wULEzevCUIfCLU2F+b1eNTzZs/1IkPA4ueGPY4jvT9DVJm/r
 i5YRMPoxQN9SIBi6Ubw==
X-Proofpoint-GUID: Z-ylvlFdwskKDxXBgnBdEl1q7Szy68l9
X-Authority-Analysis: v=2.4 cv=HqjjiETS c=1 sm=1 tr=0 ts=6ac0c4aa cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=P6Xs4Y00w1yHQXPR5eoA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: Z-ylvlFdwskKDxXBgnBdEl1q7Szy68l9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030035

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

