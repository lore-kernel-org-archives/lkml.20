Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B473AF65B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788145316; cv=none; b=oTJJ0km1MEMU37nOrBmPWEUJ+ISzSGWxcD6gQ0OusouwbH7lWRm966B47tLN+h+AFQSpvY14F3SAFB232QZG5tV3tMKpPn0IG9FRzuatHs74YkWvCVqUqC/rIo7fZUIXgJiZWPpm1HJ9d6yl3ANeW5z3ARAfde6NLBY2HOvdC68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788145316; c=relaxed/simple;
	bh=OleKFQ3nFPTvbQVvEfoYRzbPaXY2iSygWgPBtMcL4gU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JNckDC0YLZvhlUmCo7zloXoehb8GNNEKBAFdVXOaGevs+KEUpwvfAfi3UCTZtE9BelG+NZkOcLUrNyCaogLMcD7R/PIEJd+XHNB8Ui79S1LN3NnkoX2+aAN+bybiwlORnNWX+yPjZUYYNFlxLjQ/2EaLIVdu9wPXlUm+SZkPpWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KxOtVUOv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X5/kDv4K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KxOtVUOv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X5/kDv4K"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V1bUOh2819936
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XSONNlxqzGS
	nred13ZjZPjtjOkQ6ypl/A3ljwR4Mbqw=; b=KxOtVUOvJECthAKRZIVk8sLYms9
	01p29ABE33ZuZ/Xwsb0D3UrkLp1d2PvFZy1fMRsMA5e9gon/AXYWh3Vb5wzhR/o2
	ixG+BlWbHLz94uaDI+6DSanhDmZ+b6ji0+YK4SDHjlioUjvQe6bu0PgltqwF1nIA
	Agqp1FHLK3D91IP+dE+qKMLkXrnXlTj+KrnBaHvfhrfELrc3bOfbxZVikR7gQLs7
	gT3irkK0B8XtbGhAANPNW1k+hnK5ecLOsXdwY4kAv+YtToAWJ25tEknkvAhw/Rtt
	Y7S1fCIvhwmn6tfVb/xdSK+NkTWFQnayqWj41+QmFW3LcPo5TP0dHk8dEHg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqdfma47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:01:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6f80c76e6so48519595ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 20:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788145313; x=1788750113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XSONNlxqzGSnred13ZjZPjtjOkQ6ypl/A3ljwR4Mbqw=;
        b=X5/kDv4KnYd0XwYbae+pwEuQvJjCbS+o/bTKxA49LOxycvbXL0FtR4LKXDk0RWHnkF
         U8iLHp0vH8F4ZCU294CJJ+jq4I7JYfk4zXbPRqAI2vXSW06MrNAsmDy3SXLnIv+LrRW7
         7+yMyfh+EcjUG3Frwe/20P+UfZd7wCNiyVbhgTN7ag6tkKGFvv5ttB06ia8sZH6+3WWl
         zF53qZJ2MQe3yVjaAp1/GhrCDB6tMnVuy4tMhFd4ScdyDC0kWtkG+mO/YHfXYSJ4be3O
         7feEsAmj8YIp3kG8ChYf7fAmQltF8lxEXs35SCaJRE9BpuvuNm//jHInS0qb1sYzVjKA
         nEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788145313; x=1788750113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XSONNlxqzGSnred13ZjZPjtjOkQ6ypl/A3ljwR4Mbqw=;
        b=CXH3j4dA8PlELpJaXZMlgM3oDWZDdv4fcpZ13DxLOMBunNb2tpU3EaLqRwpNziQB0K
         xAT2BnT7aGWNX365cnzqGW5SfAQkBHpEEZAzB4y7vjzPHBmfGEPqsVQP0EfW0IRycasJ
         ttGzbroL+hv2H61gWJz5WC5Qg5QS7w3cY8TfptzCE+1hgX6t7mVZbg4SLgJiSQmigAec
         eidFZymJnvrsKh8aYLlVuDaXu+WeJEVSq4CDw8KeYFbzyLudZEIhN8vP6Xmi8XVav/k2
         XkHNuliDYFl4rzq/oNibkDbVc6nyGaAYrXGFrBQs3byr45KIPNhn2YVybvY6ybgZdAcE
         Q6ew==
X-Forwarded-Encrypted: i=1; AKwUvBxxLdFWpeH34DSOfV25mUoVKLFiOmadSLfci+3jhMESoPAoLDT3CZZ6rQ/kSSaQm53EOwvbhOmJyvqZSLY=@vger.kernel.org
X-Gm-Message-State: AFuF++mkgxDxsPIU/d2mCxa/rAOQb+p14IF8iPebEfIFprrqiHgMKsa3
	PE04TM+7LWqw/aO2DeB7mB6uuWbEZZ5Q3461XmefPuTEo6QdySjGTIC5jgRwMzTIoStDlZ1j1Rw
	T9AhXyIMJ9wmJqULaUvAVmCwGTI+RvDRXbirGYqBOea9rz3j8IDp2c7jIKh4lJ6QnlX4=
X-Gm-Gg: AYBFou1vdCtQZwm5BPKi/peH5FqAls3bQf01uyFh+zrvY4x5NzXSi1jfFM5u9oqzmsS
	fr2fiDxZuJlBjtP++JI6ZweFtZ9tbajiFMWPmmYuHzpik62xaqbHK/wmdccKekfoZ2I12DBtPq0
	KouFpZfS41cI61LHvud/pMkOvH9C2QyrAxw7sC7CHfyZhI0iQw+LHGP6+9kOAOjfa1COMzH6eQq
	G1uUW6SK5xs94Ky7ybGtM4t4wGPxjMh6MYNyB/NMWjQDGOR4S42ANQ0tiIqAtW0BKZebzP3kg+7
	Wgb9iJ5lgWF6fluAEuzDjSU5JEO326zL3Txq8DCj6Ot+yhxoyfdGgGcIatIbcH6YiSAEI+jtqyT
	pmKTjbMQvOTypRyYNVikRC4CwoC7kReDceZZb/FmDkQv055hoZH0EtA==
X-Received: by 2002:a17:902:c40b:b0:2d9:123c:8c49 with SMTP id d9443c01a7336-2d93fa0c365mr4501975ad.14.1788145313387;
        Sun, 30 Aug 2026 20:01:53 -0700 (PDT)
X-Received: by 2002:a17:902:c40b:b0:2d9:123c:8c49 with SMTP id d9443c01a7336-2d93fa0c365mr4501265ad.14.1788145312899;
        Sun, 30 Aug 2026 20:01:52 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bc825sm30011973eec.9.2026.08.30.20.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 20:01:52 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>
Subject: [PATCH v7 4/8] usb: misc: qcom_eud: add per-path role switch support
Date: Sun, 30 Aug 2026 20:01:43 -0700
Message-Id: <20260831030147.1500616-5-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260831030147.1500616-1-elson.serrao@oss.qualcomm.com>
References: <20260831030147.1500616-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAyNCBTYWx0ZWRfX24zoKCdHj3ik
 jg7InSehDrUyWV/er9zzFvbshwz0BimhhwzepAyJ0+A6pyf3y4PNO0WrxBxSZzKpMiUp1P3inG0
 q2GcOBh+YGNSeIW4lhGwa7iBJ0A3Hq0/CvFnjE+tcLyhLf/PoXKCk0wNh/QDIuj6CXyiRXS74g/
 GKvcmVk5kPzHZU3GuTarskcsboNFis4nOtItSBcdUSpTCyurc0UIQbZBypze+GumxFa9f7fVK6i
 Dq+elK/3JmWFgHPGWPwYY2SdwHg9oJPazCAHIcHMwBDvFKW3XwDAhxUvJCkhlOwkSu1FTL/vt1f
 IG3tYQnS8QAdwUBA7CO3ALofvgL1CjHgLXgLapzMxZjkZhK/pt6LhDl4V13ZkwrJ3nyiYlReLPE
 Of83aNuNepFv75N0ZngARAKj8IFRUurZUDjozsH0/uhtUIja594fAG/SQLHKHdSNpuzKHcfZUa8
 6It5E6jmn/P9lto62Ow==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAyNCBTYWx0ZWRfX9UicD0wINa+y
 boSXuy1fiDxVOd9Mvevb+FlppK6jFvNt42red8KbpiDcLUk0P3uZ3L0PGN7pA3tk9Y07uJugkuM
 ptKq9KKCQSytFqnit55BglOGNLIjnaI=
X-Authority-Analysis: v=2.4 cv=B7eJFutM c=1 sm=1 tr=0 ts=6a94eea2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7LOY1QleUuiESi-gyjEA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: FS3Ln6P0jizAsr3ZiV_lh6t2n2Cp96-q
X-Proofpoint-ORIG-GUID: FS3Ln6P0jizAsr3ZiV_lh6t2n2Cp96-q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310024

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
 drivers/usb/misc/qcom_eud.c | 102 +++++++++++++++++++++++++++++-------
 1 file changed, 83 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 03d1c200658c..45c90d9f3b1f 100644
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
 
@@ -286,17 +292,39 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static void eud_role_switch_release(void *data)
+static int eud_role_switch_set(struct usb_role_switch *sw, enum usb_role role)
 {
-	struct eud_chip *chip = data;
+	struct eud_path *path = usb_role_switch_get_drvdata(sw);
+	int ret;
+
+	/* Forward the role request to the USB controller */
+	ret = usb_role_switch_set_role(path->controller_sw, role);
+	if (ret) {
+		dev_err(path->chip->dev, "failed to set role %s for port %u: %d\n",
+			usb_role_string(role), path->num, ret);
+		return ret;
+	}
+
+	path->curr_role = role;
 
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
 
@@ -327,14 +355,59 @@ static int eud_init_path(struct eud_chip *chip, struct device_node *np)
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
 
@@ -361,15 +434,6 @@ static int eud_probe(struct platform_device *pdev)
 	if (!chip->paths[0])
 		return dev_err_probe(chip->dev, -ENODEV, "primary path not found\n");
 
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

