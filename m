Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1855E3E008F
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 22:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789253597; cv=none; b=DGIuPuoNdfFiRHscr5+PlZfbiP6CCg7rdGEUdEODMFG4BmGhnABWTOV6u35n3f883GacERHsS6QpX8pw8zg28AMKIDF8EKMtsKqKpjQ9kJyVxmb/qcRdY8J1lzwwrVuB1jYxIWNj0EE1+hAwiNy0xPYIYrawCRMTcR5Wh8awgew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789253597; c=relaxed/simple;
	bh=Juz/dj/HsawOZiARwrkb5JL2xT5tPmr5s7r7g6se4cE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qgvB8M5t4cnHmSW9mFxeeaWuofmxUVY6ALGV3ClChKGY99MRSsByWqMWhZj/3M4RApaiGuYI17YROaVZpfKQF1lpb7uG/gogkcJBnY2OPqMvLsB23Q6zJqk6kKb+wrrv6VXRxArxBq2eWk0bi2RvZ+lW3wwRR7coBxf6BFGnFIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bt1skkw2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q55Iz9rU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bt1skkw2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q55Iz9rU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CLnXCX2945324
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 22:53:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=U01oEf9Jomm
	cGM9nob9JiPSs71KM3XNLbec2UNPsGh0=; b=Bt1skkw2KiSTNh/FgKP8ROXiP0S
	GylrCmnJ7ZSYHaATTLG3B2NPxbF5QBi1OX7TxRfKSq1FX/zibANSmzBXWmGRdkx2
	8pvOenQZasE1VAihAoaiBTYifQOm3v9ZvLUl967BolE0lSnmV6gSGgAN4tYNhYSE
	4d2nhcSGB2g/xvB1ZO2F5rVqKTfyEE/Rmt82cHwjV7esSJMSuo7EE/aOTbtqw9iC
	3ktfMQC8eNqy1aBsKvnqhxCvJN4VJx+ijivoIUVU6HNNzu1cFXAgh/wMHiS/0xua
	pCelBzEjyDowdVtu5Rpvxy1tl/xcp54jg11ThuMuIX0LT43yxDsg4NdgPwQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmywh1ybv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 22:53:10 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso2798479a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789253590; x=1789858390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U01oEf9JommcGM9nob9JiPSs71KM3XNLbec2UNPsGh0=;
        b=Q55Iz9rU9tMYZ6qxycLs4hhwHw/2hv1EVLOAvsdNbOgA3x+LyEpaEzaXSi3YJRdj85
         pJMCNR2zPj30Ob72A+QHfkC0eJ/lziAtE/lQa9fDENSRqoTVyoj1kryyBS/efb50tDEH
         /PCWk3uoD11eLp3ioXUTOouigeQeO+AXFPQxFFUxs1F2vHC/3RjWdTRTVAVEfknBMjWM
         Ql3EQb+sjUKiEX03O/qFCzkTSJXu8HH9/yJIBP41IlbQwfopWUqpuGHhZox5ZocApktM
         d9EOHY8Ey8AHoOvIDKabEZv3qK57m5jKc+1el+BMNL5GHMnKqqLuE8e5LmOrM47KZ6mq
         6Dsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789253590; x=1789858390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U01oEf9JommcGM9nob9JiPSs71KM3XNLbec2UNPsGh0=;
        b=RdKChzIVklb51uJbIqYawS3+RgOADRHbc8nH3JAJT38X5GXrFWJZGVmMwC2c/gu71K
         aVMN8u5OOH8zIOlOxgm1Z5uuIsgnWh4YFrqseD8EO39nKMbNpih80JhRq6ZE186ecvw5
         AAVFY3NP8OCNSH6VnwIScF3whR4NvFra9vEkX5ixVmckIDtdkFFbJ1izZxI3MHt4ArOE
         VZvssLEmZWtdAUVzoHbwVxRtDJ8PRRCqQ+fDvs7Zvb6UmxsHuYvn9+1UIDcNnZCLLOVl
         0U/+pZfrpD6owa4yUlUJ+jPxddUGHV7Xttd0yOCO2Bn0MiBqenqM+ChVqAvRdLeBu1fX
         ZC9A==
X-Forwarded-Encrypted: i=1; AKwUvBzmMCbR0w6l75adeSEXX4FcpVfj05BLzGxpZdMCsAEo9cV58xZje7ZjWPLhJK5+e+NtNUSlSjChHyWpRwg=@vger.kernel.org
X-Gm-Message-State: AFuF++kVuoxeeyNyOnfwz3CQ+49LFMIuuKwcSCWB3IU+xXc1GQcon7zO
	uQhiFD2xSz1TWZK8H27Ebf9mvW1JL9VVrLr6kJ2iclZQs1CK5SUqh5cBLfd7HXRXhsof6/UeasX
	/RJHH2RndiqtPb5ZdeOX7+qGXKCmZo203alwiMFxYjxtTwScF2MCQhlNpzWjwXs09uXA=
X-Gm-Gg: AYBFou3lzOMPYBQlCrGL2gH7v4HIkWEadbLBkSVekmcUC6IFCXKyRjABlIzQjZ5w51I
	paiNApwfvDHDMX4jGrPsb+mmLr3m3T5Sqc01qRl1ngjtfTiVl+P0SQZTf6qwfjrKnH5CfX1qbJN
	YOmJQu9+auBICIyC/jzEYKU3mDvWGSB2Y4uG2oO9r5pJuFF7FJwId1dozWroE0sItBzhzAaHJ32
	3IyvySo/JLaguLtDJZ4caEa0N+5SMHWOtsqSLEtb0UdWW10X++/ahnBac4oXbbsdCcicgbNwlRM
	x54pPJ7puFfFcw79IVopeXNLbLuFUEDl+LTGjRPPYKTMrg6fnnmJdbKLx5wWtJq456QWger7BQH
	YJ8UpwjX7pIcza4SU70B6EI8yG4nledKU+9ma9mdinkDBmSro+1WwDA==
X-Received: by 2002:a17:90b:1a92:b0:398:ba0e:96f6 with SMTP id 98e67ed59e1d1-39dbc6f0686mr8355552a91.23.1789253589573;
        Sat, 12 Sep 2026 15:53:09 -0700 (PDT)
X-Received: by 2002:a17:90b:1a92:b0:398:ba0e:96f6 with SMTP id 98e67ed59e1d1-39dbc6f0686mr8355527a91.23.1789253589169;
        Sat, 12 Sep 2026 15:53:09 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f5833fsm19741555eec.23.2026.09.12.15.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 15:53:08 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>
Subject: [PATCH v8 4/8] usb: misc: qcom_eud: add per-path role switch support
Date: Sat, 12 Sep 2026 15:52:57 -0700
Message-Id: <20260912225301.3396556-5-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260912225301.3396556-1-elson.serrao@oss.qualcomm.com>
References: <20260912225301.3396556-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DuqInmvOxvaTKTmKJxkaUvEK9lyaRnlx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDMzNCBTYWx0ZWRfXw0tzByGgvayT
 xjETFbp+f8kFtE26TIm+qeEC8/hJoaxsF23xa2sxncOUY3cucYxoAEd3oHfPF9PpZgALiFdDt+y
 cPvaRzN/ERHMro22bBsB+2OiD3lCbC9vvhSi1hfVeyEqSz5RbWi2XbIpijdDL7mz8FiFj1tJCKw
 wlkmToQ3yeL7xNgbiGTwGqO5kc04xwB4435ZDEqGru19Y/M//LJYA0CpKAetb8s9r8pIcGa+9na
 bWfjzOFP9R5ASM/bN74C7IJ3R48uypMwVGoPWP6vGnjl7Z6DiRTJIHLYwPWmBWB7+bd0IIGg53R
 ybw7LvikKNdb4CsSnvLbDInOCofiSR3MZXsn+CCarno1uNdSbL6e4/h7ej5c69W5tPwC+qPpy3p
 iuPkC1qPiYriPNVy7xlIk2nPXSf2KgIACPES1VlQNyOPd93LH+IoN9j13yFfYcuJbbDRNvTmIOK
 cyFgZMmXLb/D+qA35jg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDMzNCBTYWx0ZWRfX4qi35LoWFiuw
 JSXcquw+05CPiwzcc6zGZhr6azO5vn2OEb15g7Aq0X50zQve1liD77IU1HOiVDgPJrA6Rzgq/8r
 Ib7VK2Fyo6AOyYpjCSeosGwPYZLdK5U=
X-Proofpoint-ORIG-GUID: DuqInmvOxvaTKTmKJxkaUvEK9lyaRnlx
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6aa5d7d6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7LOY1QleUuiESi-gyjEA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120334

The EUD hardware can support multiple High-Speed USB paths, each connected
to different USB controllers. The current implementation uses a single
chip-level role switch, which cannot properly handle multi-path
configurations where each path needs independent role management. Since
EUD is physically present between the USB connector and the controller,
it should also relay the role change requests from the connector.

Restructure the driver to support per-path role switches and remove the
chip-level role switch. Additionally, as EUD need not modify the USB
role upon enabling, remove the unnecessary role switch call from
enable_eud().

Reviewed-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 103 +++++++++++++++++++++++++++++-------
 1 file changed, 84 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 70915af40ebe..e2694c6109ba 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -44,12 +44,15 @@ static const char * const eud_port_names[] = {
 struct eud_path {
 	struct eud_chip		*chip;
 	struct phy		*phy;
+	struct usb_role_switch	*controller_sw;
+	struct usb_role_switch	*eud_sw;
+	enum usb_role		curr_role;
+	char			name[16];
 	u8			num;
 };
 
 struct eud_chip {
 	struct device			*dev;
-	struct usb_role_switch		*role_sw;
 	void __iomem			*base;
 	struct eud_path			*paths[EUD_MAX_PORTS];
 	phys_addr_t			mode_mgr;
@@ -123,7 +126,7 @@ static int enable_eud(struct eud_chip *priv)
 	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
 			priv->base + EUD_REG_INT1_EN_MASK);
 
-	return usb_role_switch_set_role(priv->role_sw, USB_ROLE_DEVICE);
+	return 0;
 }
 
 static int disable_eud(struct eud_chip *priv)
@@ -270,12 +273,15 @@ static irqreturn_t handle_eud_irq(int irq, void *data)
 static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 {
 	struct eud_chip *chip = data;
+	struct eud_path *path;
 	int ret;
 
+	path = chip->paths[chip->port_idx];
+
 	if (chip->usb_attached)
-		ret = usb_role_switch_set_role(chip->role_sw, USB_ROLE_DEVICE);
+		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
 	else
-		ret = usb_role_switch_set_role(chip->role_sw, USB_ROLE_HOST);
+		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_HOST);
 	if (ret)
 		dev_err(chip->dev, "failed to set role switch\n");
 
@@ -286,17 +292,40 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static void eud_role_switch_release(void *data)
+static int eud_role_switch_set(struct usb_role_switch *sw, enum usb_role role)
 {
-	struct eud_chip *chip = data;
+	struct eud_path *path = usb_role_switch_get_drvdata(sw);
+	int ret;
+
+	/* curr_role tracks the role from EUD's point of view */
+	path->curr_role = role;
+
+	/* Forward the role request to the USB controller */
+	ret = usb_role_switch_set_role(path->controller_sw, role);
+	if (ret) {
+		dev_err(path->chip->dev, "failed to set role %s for port %u: %d\n",
+			usb_role_string(role), path->num, ret);
+		return ret;
+	}
 
-	usb_role_switch_put(chip->role_sw);
+	return 0;
+}
+
+static void eud_path_role_switch_release(void *data)
+{
+	struct eud_path *path = data;
+
+	usb_role_switch_unregister(path->eud_sw);
+	usb_role_switch_put(path->controller_sw);
 }
 
 static int eud_init_path(struct eud_chip *chip, struct device_node *np)
 {
+	struct usb_role_switch_desc role_sw_desc = {NULL};
+	struct usb_role_switch *sw;
 	struct device_node *controller_node;
 	struct eud_path *path;
+	const char *dr_mode = "";
 	u32 path_num;
 	int ret;
 
@@ -327,14 +356,59 @@ static int eud_init_path(struct eud_chip *chip, struct device_node *np)
 				     "failed to get controller node for path %u\n", path_num);
 
 	path->phy = devm_of_phy_get_by_index(chip->dev, controller_node, 0);
-	of_node_put(controller_node);
-
-	if (IS_ERR(path->phy))
+	if (IS_ERR(path->phy)) {
+		of_node_put(controller_node);
 		return dev_err_probe(chip->dev, PTR_ERR(path->phy),
 				     "failed to get PHY for path %d\n", path_num);
+	}
 
 	chip->paths[path_num] = path;
 
+	of_property_read_string(controller_node, "dr_mode", &dr_mode);
+
+	/* No role switch needed for fixed role controllers */
+	if (!strcmp(dr_mode, "host")) {
+		path->curr_role = USB_ROLE_HOST;
+		of_node_put(controller_node);
+		return 0;
+	}
+
+	if (!strcmp(dr_mode, "peripheral")) {
+		path->curr_role = USB_ROLE_DEVICE;
+		of_node_put(controller_node);
+		return 0;
+	}
+
+	path->curr_role = USB_ROLE_NONE;
+
+	sw = usb_role_switch_find_by_fwnode(of_fwnode_handle(controller_node));
+	if (!sw) {
+		of_node_put(controller_node);
+		return dev_err_probe(chip->dev, -EPROBE_DEFER,
+				     "Failed to get controller role switch for path %d\n",
+				     path_num);
+	}
+	path->controller_sw = sw;
+
+	of_node_put(controller_node);
+
+	role_sw_desc.fwnode = of_fwnode_handle(np);
+	role_sw_desc.set = eud_role_switch_set;
+	role_sw_desc.driver_data = path;
+	snprintf(path->name, sizeof(path->name), "eud-path%u", path_num);
+	role_sw_desc.name = path->name;
+
+	path->eud_sw = usb_role_switch_register(chip->dev, &role_sw_desc);
+	if (IS_ERR(path->eud_sw)) {
+		usb_role_switch_put(path->controller_sw);
+		return dev_err_probe(chip->dev, PTR_ERR(path->eud_sw),
+				     "Failed to register EUD role switch for path %d\n", path_num);
+	}
+
+	ret = devm_add_action_or_reset(chip->dev, eud_path_role_switch_release, path);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
@@ -351,15 +425,6 @@ static int eud_probe(struct platform_device *pdev)
 
 	chip->dev = &pdev->dev;
 
-	chip->role_sw = usb_role_switch_get(&pdev->dev);
-	if (IS_ERR(chip->role_sw))
-		return dev_err_probe(chip->dev, PTR_ERR(chip->role_sw),
-					"failed to get role switch\n");
-
-	ret = devm_add_action_or_reset(chip->dev, eud_role_switch_release, chip);
-	if (ret)
-		return ret;
-
 	chip->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(chip->base))
 		return PTR_ERR(chip->base);
-- 
2.34.1

