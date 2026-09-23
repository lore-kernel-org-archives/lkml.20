Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADF3331ED6
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790125716; cv=none; b=f7MPKD5cZ64Nn7Up7Ax3G7K4gwUg6Ec+Nrzvh+XSVwfN5pEU1oiNYXPrK9OLVwiLEkH6buvC/IR1oUDCaz4Fea/aQJx4rrWyojoRq31/TvTeCeLsZgs4iDuqSDo2proAOpFLFTzz7zfVt2n6MINiy1gdqSZvKgln6eTLAfwFiRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790125716; c=relaxed/simple;
	bh=vTpkG/qLTuJE+J7YjR6oDiP44e7ht3jSUR2yy/OPtwY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aWyeEvqHJg/ZkDRTzVs3KHbzRUVY/y4SHOUNuxkOg+bwLn9MW6Dhx2V79wXKHjauYU3+HcoPJp9LuGrwgnhuDwHh4Yb6v2/07S4wWyoXLw+/Kj7Ihrnd7O7ArXFNh6fzaZ5za28bNBHCenTMUhkjfK9CBhUzcD8FRKc5PMF9FRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jzpgNFTd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bb4S594n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jzpgNFTd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bb4S594n"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MIXNnd268287
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ITf6no6wB7oYYT53ITMZgl1OL+FCjLKzAM5fnbJXjDk=; b=jzpgNFTdU68jOBjK
	xDF8ju0tIID9eu/mXx4W6ha7GMJkCKuW6a1MJYfXDxPjGy0zaDrC7GueCdsLMA0k
	NOn+oSYyibSkNRqRJAhwQD+Pe+6A/krgZWcYMYrwwdut+ng3kAYvaWKrr8pBdhBD
	30IdMm7PLQptX7oIGMGveEBxD9JKBySxQKGuqLe9XytlDKGZ7uuukyCJb/NIInUh
	zVriGDl8/I2QkyBhj4V2BuXPsWN8yMsTVm8Y59cREvJ89IF/Q623O9u+7ue9JWp4
	6EdM7/WDI9ORdhGT8v5lR7H+lbwXCRWfRNcesVPnOqp52a7kQ/8vchRCRnKMjlqM
	KGZlKA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c1gyj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:08:33 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-14364a88479so82407c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790125712; x=1790730512; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ITf6no6wB7oYYT53ITMZgl1OL+FCjLKzAM5fnbJXjDk=;
        b=bb4S594nXlmDgl2eJUZY1NW0kjn95C1s930cpubeHPdUyUUKqRseQGv0ZhQColr/e9
         kgx7jCMcP65Xf0bbOmbZLYdVibWys472bwxy1rPqv8plCY9NzqJbL9/RZFaGxoszgrSE
         Cf4/t4rG+4B3KwpJxV4cTQt2lsSV0HSMqORQ1yPi7rKYEW4y+oXxZ0sELLC9cWYuBVfm
         fWCOT+n9Y5ZJ6Ys6/pVSvgHwOoXTEwszy1IB0NtGC/S6NyY32nHdlcgfYIaroD6ODAE/
         xX/PB092vrccjkWfuV1ChoeLHXSCLmfXwMFkj4ppoPgbjQbzZcrBPfvWKhnZTg6/SH8e
         GLZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790125712; x=1790730512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ITf6no6wB7oYYT53ITMZgl1OL+FCjLKzAM5fnbJXjDk=;
        b=JqjZQv5JP36HOuIYG5ATt510LRj2iKR9dt5gd2GoMhc7mSzHm1ZvsbxGiZ11I0gBrf
         6DvxZDAVlg0iqGicNz69wnVEuSjaAU+wiEMKs1iCre+oov78+ZeMsb5h4jtPTRD+yG/A
         wNnh3SN3fjFd7WyyC+4MAEILTZZFM3r+fe/00dKeGdQ+9nNodBuNSHnEP56lDvWnk1at
         /g6xxmVcf+rU8lBGlxbfZtoJ9IYvnn3z87lFTyyhZLXLby3Z5eYpmnBTYB/bOjXICM/I
         UawK6v46vVYMxa1xDvw7BHn/4+N0DqipaglHaqt50xtLv2TysEAD1eqcSuuMoH7ijVp+
         mgDg==
X-Forwarded-Encrypted: i=1; AKwUvBwsROw1ci8ETmOloC5dqnh6JGCqIBBcAaQFAclkIa+RSZSvvR5RQ/zyvAxf4hCe38NdyqS/nm7Tna7K3GE=@vger.kernel.org
X-Gm-Message-State: AFuF++mirVFh6+7w+ISQ3QbOlGZvLOZkkdy63z6Yq/I7fa/Z3+FkH7uh
	/1+HFz3ZaPUZncal0fdldS/Ur/0nMYHMwevdtHdkzViC/lo0OvD6jQ943KpxSwKC/NkhBOlE3ls
	g404dO943PCknVuRRbnG9OqywefDbCPRNrF/XmqAOS6fIiYrivN42hLW1VNKKXjPXocU=
X-Gm-Gg: AYBFou1TiCvaZzTQ1LgA6xVbY2xZSNLw7uirfkSTquta5eRvMxCUlANB0gSZa4E2nFn
	/TmpqL4N8U//Lg73g04Zh/57Xv86Gc1X7fRwmMPFWYXQbQOakARbSCIMfBR5UuZS6eatK9Wwwvl
	m+Hj64zMqCj+CmvG1mWb1VGOkmKF0rwaoqs/xAUNm2wp4FYLK9ANr2lzYzTYqpFm8qk9DBNCVc9
	L8m3gA7omQuxT+9wW5UurvcgHUvjmzmB3FSFKtv8GjSRR9+fv6+pbOI2t6DansR6k8UrqDu77Zg
	a2JrCzXJGUE2YhjRmL/VZ/8V+MiVXA6u+K5bJLM6zv0eURNOeqHej6sWmq+cH/whUuMXC/3Wa5x
	PwAgtGjbXRdoRCvenMleOH+7r7RPE
X-Received: by 2002:a05:701b:4184:20b0:143:6328:2a93 with SMTP id a92af1059eb24-144f8da1343mr1183127c88.10.1790125712077;
        Tue, 22 Sep 2026 18:08:32 -0700 (PDT)
X-Received: by 2002:a05:701b:4184:20b0:143:6328:2a93 with SMTP id a92af1059eb24-144f8da1343mr1183087c88.10.1790125711497;
        Tue, 22 Sep 2026 18:08:31 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98ca0edsm1651831c88.15.2026.09.22.18.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:08:31 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 06:37:29 +0530
Subject: [PATCH RFC net-next 3/9] net: pcs: xpcs: add custom platform
 register accessors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-qcom_xpcs_nord_emac-v1-3-4b1c682af70f@oss.qualcomm.com>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
In-Reply-To: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
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
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790125674; l=2649;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=vTpkG/qLTuJE+J7YjR6oDiP44e7ht3jSUR2yy/OPtwY=;
 b=qgcKAJR8ofneY0NWHELelT27YbbL+m9wsE/nUE+ou70S3/HbqNREQeX8dBZXH7l8lE0lM0FZk
 AfvkZMxnILNDRy9ZfoNRRuaWzPFygF2Ey5jyOZFwKgQyjr1wOs+4kqD
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: dW55tfeyL37FXjcXpAYwvLx6njX1PKZM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAwNCBTYWx0ZWRfX7LyNgvSFEuYu
 xfqa4xKlUIXQ7tam3gxC9Dxa75uM9aPxQ1K6idcVM/d3LbZEtaP58Cna0OL+efSUlbL/uJrU/aX
 9G/rKH8klZM3PCpfToFcIW3oAwy2Fn8=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab32691 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=vuQw3E1rjvSkk4ldrVgA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: dW55tfeyL37FXjcXpAYwvLx6njX1PKZM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAwNCBTYWx0ZWRfX5Z39Kk7ReVL+
 wMmhnQ/lZE+cv1lBNiPVCYnn+Wvl3PY9ZNjilec/2cOgjV3YZE4aMnWuhYSqGQmV4bxXnW6toA8
 +trE/hblTo+PUMtAsSHmbjvDetDAZsQW4fB+oFOsOv75LatZZEB0AwgLfxZ8O0wLhFrmbMjea0x
 LdSuTvMm8ONtCyI3B0FxcqZIngrBtoFZuLtposIpj4pBwyrOjX2dOY+z2RwwrxxoYRFFtqdU/hx
 Yif8lVsOYSrK/9vxayfpecFkKBfEkS3dB9HmB7EwqZnkyFd2cGHXenTcZt3rZ+3JA49oVUbJWOK
 IzYFt1T5tgSXUSAr/J3u4BsSqSCXJy+7wvjiz7+2Jv5adXEPrNhSUwysedgK/ATfuassdqOt+rn
 cKmfqG510RTnhibuS3F26Jht5uKBh8ZOtK9rS1TA3ZyVgqqnwG35q4n2pcEjsrtD3WUyp0rf5hJ
 haGrqQtHpunkPAv2ydg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230004

Some XPCS integrations do not expose the standard direct or indirect
register layout. Allow the platform driver to use optional register read
and write callbacks for both Clause 22 and Clause 45 accesses, while
retaining the existing access paths when no callbacks are supplied.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/pcs/pcs-xpcs-plat.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/net/pcs/pcs-xpcs-plat.c b/drivers/net/pcs/pcs-xpcs-plat.c
index e669a7b248ac4677aeb5cd1874108f5c87f837d2..e78a233fb198d940951064a71e8597c6c666bc9d 100644
--- a/drivers/net/pcs/pcs-xpcs-plat.c
+++ b/drivers/net/pcs/pcs-xpcs-plat.c
@@ -24,8 +24,16 @@
 /* Page select register for the indirect MMIO CSRs access */
 #define DW_VR_CSR_VIEWPORT		0xff
 
+struct dw_xpcs_plat_ops {
+	int (*reg_read)(struct platform_device *pdev, void __iomem *reg_base,
+			int dev, int reg);
+	int (*reg_write)(struct platform_device *pdev, void __iomem *reg_base,
+			 int dev, int reg, u16 val);
+};
+
 struct dw_xpcs_plat {
 	struct platform_device *pdev;
+	const struct dw_xpcs_plat_ops *ops;
 	struct mii_bus *bus;
 	bool reg_indir;
 	int reg_width;
@@ -169,6 +177,10 @@ static int xpcs_mmio_read_c22(struct mii_bus *bus, int addr, int reg)
 	if (addr != 0)
 		return -ENODEV;
 
+	if (pxpcs->ops)
+		return pxpcs->ops->reg_read(pxpcs->pdev, pxpcs->reg_base,
+					    MDIO_MMD_VEND2, reg);
+
 	if (pxpcs->reg_indir)
 		return xpcs_mmio_read_reg_indirect(pxpcs, MDIO_MMD_VEND2, reg);
 	else
@@ -182,6 +194,10 @@ static int xpcs_mmio_write_c22(struct mii_bus *bus, int addr, int reg, u16 val)
 	if (addr != 0)
 		return -ENODEV;
 
+	if (pxpcs->ops)
+		return pxpcs->ops->reg_write(pxpcs->pdev, pxpcs->reg_base,
+					     MDIO_MMD_VEND2, reg, val);
+
 	if (pxpcs->reg_indir)
 		return xpcs_mmio_write_reg_indirect(pxpcs, MDIO_MMD_VEND2, reg, val);
 	else
@@ -195,6 +211,10 @@ static int xpcs_mmio_read_c45(struct mii_bus *bus, int addr, int dev, int reg)
 	if (addr != 0)
 		return -ENODEV;
 
+	if (pxpcs->ops)
+		return pxpcs->ops->reg_read(pxpcs->pdev, pxpcs->reg_base,
+					    dev, reg);
+
 	if (pxpcs->reg_indir)
 		return xpcs_mmio_read_reg_indirect(pxpcs, dev, reg);
 	else
@@ -209,6 +229,10 @@ static int xpcs_mmio_write_c45(struct mii_bus *bus, int addr, int dev,
 	if (addr != 0)
 		return -ENODEV;
 
+	if (pxpcs->ops)
+		return pxpcs->ops->reg_write(pxpcs->pdev, pxpcs->reg_base,
+					     dev, reg, val);
+
 	if (pxpcs->reg_indir)
 		return xpcs_mmio_write_reg_indirect(pxpcs, dev, reg, val);
 	else

-- 
2.34.1

