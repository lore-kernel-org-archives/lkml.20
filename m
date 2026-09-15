Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865F7483BC6
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467023; cv=none; b=YEVyDJaaWY3UTYJu5S6F5LDlZ17rIP2xB5olHr/8ucyu+gVc/gBA5gN1+02AVtkLZHtKgETcuNFj+Ze6e3lmWno03GZ4j1vVneCOc/KIEFXYGbIs2L7CBwVQ5ZLRHhq0eZBh5iLothkHW241TyQcbhllrzntteWHsKJ5pu+41jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467023; c=relaxed/simple;
	bh=k7+wjSAGjpR22f7rKksM9nAh3MeACrWaJ5KFpnnayHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FvMz5/kvuKm0y5J44U9WqOQrMMKN14cyONQAkplmCrZXS3J6905KctGmvAGGd5XZ2qAoLgqlSJfUyllibg8ELjUDh38/EMHxaLVWvwmVKKC+nUYMOGLdYjuyL4iPF7PHA9lTHIdjhqa2+9SO9f4eg7WmeSY271ItGnCWiyQ/Ol8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W9Z1Y4+j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=keCNWTfs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W9Z1Y4+j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="keCNWTfs"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9h02b3415582
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:10:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YCTW4H5IPL7VDi+PNSnrXV87F875dEo/Q9jyiNIcq6k=; b=W9Z1Y4+jErut6rkx
	FQMuirTrHTIFb2BVCwyp9iljBGJ5GyD/sCZ23wS+dxXwWBLxXObNgAzUPZV+R5b7
	u3Kebg/wHaCPP9BtwLGxslY8RtodK8uSgNVu0whN0/bU24qa+qssHhU1CLOi/S7w
	ZlxckzHVynKQo+fSjnjNWYYMBW0sM4MXIe6RAil1VexsWk+spPZF/4oaAlg6wSYd
	sWw/bQULZ5yWdKS6oKPUwF24t4AntVHo0mnWKQRiwxHMxFE6GXZ7mt+1f8NXPYQa
	ODrL3pSYswhJ30BWFxSb0n3gemocCZEGBnb+KRxmWcIDvibSkr+zxI9/Fr2OiLBt
	fEPZOQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3hc05u7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:10:18 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1b8088202so3790925a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789467018; x=1790071818; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YCTW4H5IPL7VDi+PNSnrXV87F875dEo/Q9jyiNIcq6k=;
        b=keCNWTfsRGrpjXO/rBC1gxA7ukzzAynGsGAOjwDhNSZ5K7AjuYltVZqLNOpYQgas/T
         vYtAAxKGAzxW7sZLOiIKTJncBw2jkEWLs5rAgJMH5E2lMCI+VjL9ByEq3Vy55suQcSxM
         ip+Mv4WwFffEmu2mLpuT6A0/x/clUl4yWznGEMbeln2qhFrk0EyZP/L4pUDoASs0swO1
         ib+9BcdDiEvHJdJevgf2tGJv008y9JvxK2cxNwrkGWYTSq6vxi7BzeuH4yR3XIKj5hm6
         Y2u2E+HrbVMGs4UC+bWpc1nzOgiqZUROxTfDpoNn+HoXBfb2tBx2rSnuCcR0NSSv4mcT
         LuPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789467018; x=1790071818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YCTW4H5IPL7VDi+PNSnrXV87F875dEo/Q9jyiNIcq6k=;
        b=HNaK44Gqg88GjaykhDZmBrwHKS4wH7qiWzZCNLIN9vndg6azOXDjmiSWKhcxvKM/QM
         jKJzvnB+2QeCCPtUIxUZJqyUBpOWfzv3yOKWwokQp1pg+URSUpEhYGZgv8GxyaUu6tf/
         rprCjgbAzx2xg2rfuZRo0ncSexVuaWt37qbSUPCrxxH4jRbUFKL9kjU0XGcjWzytSW9/
         DSFBEMG0EBySgjUmidX95eeUBz2Rdc1qtqjpnq9IZgijDZHI3f1ZiSQt0wjR9aYK/rlR
         7nelamZ4ajZbV+86j87cLT+cyDfUfGvoIi+qmJis6/zTvBUa1wg3FDVz8YPMsj4OgUdp
         fLuA==
X-Forwarded-Encrypted: i=1; AKwUvByKUA010rBEW//MgbTOKGWnjHOsFnrzPs10fTL054E5NENmKKQi6wTTDfTGGnt7gKAzvrw3wIxbwNfUCkI=@vger.kernel.org
X-Gm-Message-State: AFuF++nMCDqeVHonMWeGoKtDdwgv4R11gPtOxopOcg0yUzif6oIxVKe0
	dcLs0N/32M0WMY5zdPzAJ5mWYL3ZZUYtQeLn2x6hE64IUoRGqGHFecHMbt/XVrmfGHOaHpvMrR9
	AwEELLXH8Q9WQTmlsEfPeZ4IUy+NhR01KM8eSbkFl5Nz74gglBjCdXKFIYdoQU/k7+zg=
X-Gm-Gg: AYBFou0edawwHtTpkbBonnq5w7Q+s1GRiUptgYGUDG8W5lNO9GgTBCxcsfPlg+wPRlK
	CU0m7GGUr351jtlz2l9Gw6f4XTsfohO0txeRyxOjw9Lk2Q3/hrDyxHmwvdiBGiSjAW1VqJBZBzl
	lBeKmRSI4Y45muw6UEwYLF0lh5RR+l783C7TrbKKPpL95IVrAH1Armm2unIoyvGERfZ88yDvInD
	z3UZSZ4JBts43lZXB4biNaWGJyd06p8JUZKqxm4e5c/Dk03mq9ACxDcQ8xHJS9tefCho2mF5lbf
	2iSPaqXDW7uuMgK3Yc8ZpUpajgwZOsm+qHEewBhkmakVpAbloi8dce2jFTpM5D1+aETB7RM1GP6
	+khvWbgNL3Oyl9zua2uAwzfCjvN21fBoInekjkNjaKXhJPTj0WWVArt57oq3r14ZkYsWIsoZAZu
	4ndDFjoHxp2zQ=
X-Received: by 2002:a05:6a21:3383:b0:3c3:875d:7053 with SMTP id adf61e73a8af0-3db4049d144mr17326089637.8.1789467018087;
        Tue, 15 Sep 2026 03:10:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:3383:b0:3c3:875d:7053 with SMTP id adf61e73a8af0-3db4049d144mr17326024637.8.1789467017652;
        Tue, 15 Sep 2026 03:10:17 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14382741839sm14244091c88.6.2026.09.15.03.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:10:17 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:09:59 -0700
Subject: [PATCH v16 04/11] phy: qcom-mipi-csi2: Parametrise the common
 status register offset
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-kaanapali-camss-v16-4-c9f3f6f4180c@oss.qualcomm.com>
References: <20260915-kaanapali-camss-v16-0-c9f3f6f4180c@oss.qualcomm.com>
In-Reply-To: <20260915-kaanapali-camss-v16-0-c9f3f6f4180c@oss.qualcomm.com>
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
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: wRl4FWXZp0NoDWe_NTZ4eALw_KiNb1l-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0NiBTYWx0ZWRfX1hC0KUbSt1oT
 UNhX0mzDhC1sGyiXlQl30UBQAFdR7tp0L70iDTyYFHNXODNRXcQ8RjsZtyPLu6YiV0uA8X7ELgC
 L5VFn1IpGww5At5DminAyfAL3JOtAZM=
X-Authority-Analysis: v=2.4 cv=dcUVTnXe c=1 sm=1 tr=0 ts=6aa9198a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=P6Xs4Y00w1yHQXPR5eoA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0NiBTYWx0ZWRfX10roC2AIo27C
 FuZjZLnjULvJiKyTcZNKWeIj2Hq9Wc+/RtRLDQRbnNJDNALC8gDkMY51zmSTGXQth1MyoWn2T1l
 z3UunUJe/5ZOMX38h+qQXQz2KMcPoenBmq2XXkZPAfHN+oH1FM35vvxzV9RVhNTHTCHuJlZWaVO
 +4Z89qjo7bpPGnsKAqEANIPsM6cUuHEgArDPTayuxNDiYjDrQqD/gymwEHoSjnY4vgNr4faXABr
 mWVOY+tUYSYDeUZGLmf6g4OAcBglGKNRAilSrUhqabqNbNYYlMHfB9We7Kb3zKcCN6cUaRch9wm
 eqGl9FhuhEnN0TiRfRFzRjYXAi5BT8OlgJodsqSfr9+S//RxLqFYnEmfsTgw/4co4aijunqF+dV
 pV7igrST+E1mx214/TIziuB8uCYm/jt+7COLAMvdZqzNmL+D6vXbHf/6htDVZDX2FuEfjeDzmth
 hmqJRxZoU7/Oz5BnNDg==
X-Proofpoint-GUID: wRl4FWXZp0NoDWe_NTZ4eALw_KiNb1l-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150146

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

