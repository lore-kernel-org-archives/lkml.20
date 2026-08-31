Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917C93AEF2E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788145316; cv=none; b=JIOa2waO8ApS6xwlVGkHnUmDbBOs0NdSR9149R9VxuOAqXJRSvfi2/8X3FH8Yk3jV+SDindcpKdCSBzMGmYjflROyWpIIOW6fIZc2m+bVfLb1NQ2Iv43AkvGCjCrJFe+9mhCZXQ3hzEVwqWp/jEf7k6GNBrKl99BUO9ni1u2VT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788145316; c=relaxed/simple;
	bh=R8KpCF/tj/saJ0e6s22Xksl17Y7JkdV0utje1Ij4Vt4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bTmo8QDxUOQMoy3LfSbWiq6znl6Obdccv8P3Z6RUwnXAO7inF2m9uaf8Lf7CX2WI2gMvDvblxOJ4ywsTO43exeKPsKKmMcWt/9ni9db7081TKS227LlJD/JR4rmbV3Y+0K9V9ztdi0ay3DLKLXFirSng6WfbxRkN3JjfnJ8DVpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W35J9VtX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eCwug3c1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W35J9VtX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eCwug3c1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V1bfM61010202
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:01:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7Ohy3u/9WSj
	jm8gEuubT6LFGULSlHd1rzPN3gs8pn8s=; b=W35J9VtX8C+IEF6/eThwpIOrULt
	uVSs6BOuJAbp74TUjdwkdZi+Y2G1BqQg/Oy5XfIKUwEoakvVezyUlKd2av6LzAfx
	I7UY81zVqoXBcNoZrVC10IopmU1A4Uo4TY1KePL0ze0ea1z3CMgCd+MoSZaJPlm9
	wcicv0vsJz9v3T2kaFU+r9BvNyX1Ik15Cr27sP2r/Ku4CVjRtJ2EIUD7uhtgvSDm
	FAvHXB1df6LMJrazuRSkbti2QepVhIzENzQzUDQ0p28J/SxCdBPBO9BiCYWxudyG
	tg6v8jzbmlbW+nxfhF7kkP9nnUU+hgJUiDrARbVYoM2xxppotd84miZ84Fw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrkgv4gt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:01:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3968dfff779so2805355a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 20:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788145313; x=1788750113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Ohy3u/9WSjjm8gEuubT6LFGULSlHd1rzPN3gs8pn8s=;
        b=eCwug3c1/mLue6D3SqnrOLzuIIC1N/ttIaHLrIcW9p8DddGugp7I/VjaXVhg+92D5e
         xwFle86wWA80Jc0GioGPzb/P7fIoMGWkKHsUUgr6+8xP7izHOQcDLV6RLU7+y3LEdYhA
         TvyR41tD2AzXQthGAlcIqw2/Rw9h+oopLSVX9dqGVobJ/f8iFa/h+YRNncnaLSDUM0BP
         Ek0mXFfUC5Y72r/gGwlubRAreO7F11UJCiPetnx9R2VY/wkWaUEb68IkdSqIT5/Fdixh
         evh/4IVdsn+LP2hl2r9mK7yrIng2XO3WrjNny4ehjDuMr1GDXUf1EHEyio3AJ1x3OOS3
         UuiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788145313; x=1788750113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Ohy3u/9WSjjm8gEuubT6LFGULSlHd1rzPN3gs8pn8s=;
        b=SuIZ6ErEawgWZPQac0pFAbe47F8nNMRYszmb+yMOCIV3HeUSPtzMTq8UHxdcSzidCt
         txBxWP4k0xaUpjsxJJHikZxupOfuHzPtfAoJxu5oUMkTABDIu9kW+cG7v9fLiT/7Ow80
         h+pFlfOpfwl7O2IxJ4UTiDBJ8SysG5z9Bt4YG0sYrz8b7C+X5JoiGqqq9XWM+rq8+5l3
         6u8NkiZo8FdKxaQxhWhoa4J1eUM97B3VF4lcMbhlt7l5EZL71Es/bqqCJWS2jCdO5JrY
         4RCjpMGV5lQmhodwNWqO13LN5IzvO5PzPa6F6afVp+EP085s5fm9VYoGA3qd7mDh/oc0
         /Fjw==
X-Forwarded-Encrypted: i=1; AKwUvBxBu05lPXTyxJDTfPi9efTel6FxqDRdq6CpubEgaA6bzXFvimnP8bCChjfRwBuepDWPhY0DDDibFlL+THE=@vger.kernel.org
X-Gm-Message-State: AFuF++k1iPQppn1Yq9QMiHzu0/zAjN9j3L/uSP3EFaacp8ghqXYXzs9R
	qx9OERekTI1SYjWUMv+w5/adczwu7WhpglXjeyhrFsZzci4mqtBuJZwov7IemqoxI2d5yT2k1N9
	NfSTGqFUGVMGSqJ8S6VpfTPc5Qov+7pOG4Fx0JkqUpHyfUh7yv/M8BHah9A5/ty3fQn4=
X-Gm-Gg: AYBFou2ISNXoyugRBhSNbLJc/FwDqFH8ow+3Dt9Tj0JUVQkbvaDDwJNC4AqKSrMcWRN
	ZUYHoTvAFR7/FUrcRBsqlhQSfQbW6DhH+BNK9NsbG83YqqQuZIgxGVKCb9tsPMzVC+q6RlQ+dTe
	rhXW7GqmgdmqRUptxnC5KFgq/Nte1Tq+IjBzkJW6TCMA8bHXDHUCBQy7EUO/fHZlAETLJexUPn1
	1hyLv5d5VW15xJninrwyNgpazZ2YHSI08aO+ERXvN+EqIR0MoA18HpWT7pTAdARu2zIwLvU6PnD
	qvepdF9ZKHHkuBiQGGvti8+I4GLYSo+xB1qPpifpU9m7lwRV2gAtqiaUANBo1b3XezsT/OHqbyL
	luS3kl9cqI9Rra4GugC3toq1gIqWy/FmSFHjb17e9OGcjgXpbIVBtPw==
X-Received: by 2002:a17:90b:3c8d:b0:395:c3f7:2895 with SMTP id 98e67ed59e1d1-398da5fcb72mr4875840a91.7.1788145312752;
        Sun, 30 Aug 2026 20:01:52 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8d:b0:395:c3f7:2895 with SMTP id 98e67ed59e1d1-398da5fcb72mr4875748a91.7.1788145312012;
        Sun, 30 Aug 2026 20:01:52 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bc825sm30011973eec.9.2026.08.30.20.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 20:01:51 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v7 3/8] usb: misc: qcom_eud: add per-path High-Speed PHY control
Date: Sun, 30 Aug 2026 20:01:42 -0700
Message-Id: <20260831030147.1500616-4-elson.serrao@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAyNCBTYWx0ZWRfX3WoOIGVuGDkR
 /2amWYigg4Rh1AzrEewN6e5OkEWutM+t5IxFkoaZG9vUG3EgYpjN1uVWjsVgocVxtyHNxKORNNh
 5Psm4jod2GNxNDDaVOMvUne/em6fa7zRVPZBAEyMLywStytnqZ83sjStTLrccROhTwDmuVn7Tll
 GGskL9YEzAm4jvf+eDP7WqbpboyLUXMN1NjNBuc/T5Om5Kai8HSHfDCBeyMmfEcXYvntEYsjrRs
 JRvggJPG3iLSKuh4rcKF+juasOMuV1rJ6IZlJXqBtFI6VAO6c2Uyekp8vaz/8CKxilKEFxhtxaF
 ed3O2F2NYvEfcp5ytGmQfhmS+eXZCWHnHPMuVcPlJ/rIfAnrwh/SW8wlZnPkznmZ6c13Nx+UsiE
 vxe/0tS2U0h3TFNXTdQ1KuTspXNKZcmJoKB1xOgfyAr9xV2rLiUBE7MtSrbj4q2D/o0l472w5Rs
 lApDS22Aru+VXRSeGig==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAyNCBTYWx0ZWRfX1vK0rQqHk5pI
 XiltNoQbYNT9X5sB9vmBUXNqjrOYQrzk0GyDU5lDP+FWvq8mveop3ZojiB5PqsYaTwFzZWv6iGZ
 GWMk5xKpLZCP0XCc+fN6ZsYRjhcPAFs=
X-Proofpoint-ORIG-GUID: zg3rykfwuXRlnE6vBcA_nH2UA59vKEVz
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a94eea1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=OKkk4dbWoaB1VCfbt-4A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: zg3rykfwuXRlnE6vBcA_nH2UA59vKEVz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310024

EUD hardware can support multiple High-Speed USB paths, each routed
through its own PHY. The active path is selected in hardware via the
EUD_PORT_SEL register. As a High-Speed hub, EUD requires access to
the High-Speed PHY associated with the active path. To support this
multi-path capability, the driver must manage PHY resources on a
per-path basis, ensuring that the PHY for the currently selected
path is properly initialized and powered.

This patch restructures the driver to implement per-path PHY management.
The driver now powers the appropriate PHY based on the selected and
enabled UTMI path, ensuring correct operation when EUD is enabled.

Historically, EUD appeared to work on single-path systems because the
USB controller kept the PHY initialized. However, EUD is designed to
operate independently of the USB controller and therefore requires
explicit PHY control for proper operation.

Reviewed-by: Peter Chen <peter.chen@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 Documentation/ABI/testing/sysfs-driver-eud |   3 +-
 drivers/usb/misc/qcom_eud.c                | 124 ++++++++++++++++++++-
 2 files changed, 125 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-eud b/Documentation/ABI/testing/sysfs-driver-eud
index fb927a003596..f20b82b5a38a 100644
--- a/Documentation/ABI/testing/sysfs-driver-eud
+++ b/Documentation/ABI/testing/sysfs-driver-eud
@@ -20,7 +20,8 @@ Description:
 		  primary   - Primary USB port
 		  secondary - Secondary USB port
 
-		Writing any other value returns -EINVAL.
+		Writing any other value returns -EINVAL. Writing a port
+		not supported on the current platform returns -EOPNOTSUPP.
 
 		The attribute is writable only while EUD is disabled.
 		Writing it while EUD is enabled returns -EBUSY. Reading
diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 25a6a8f110ec..03d1c200658c 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -11,6 +11,8 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/sysfs.h>
@@ -39,26 +41,84 @@ static const char * const eud_port_names[] = {
 	"secondary",
 };
 
+struct eud_path {
+	struct eud_chip		*chip;
+	struct phy		*phy;
+	u8			num;
+};
+
 struct eud_chip {
 	struct device			*dev;
 	struct usb_role_switch		*role_sw;
 	void __iomem			*base;
+	struct eud_path			*paths[EUD_MAX_PORTS];
 	phys_addr_t			mode_mgr;
 	unsigned int			int_status;
 	int				irq;
 	bool				enabled;
 	bool				usb_attached;
+	bool				phy_enabled;
 	u8				port_idx;
 };
 
+static int eud_phy_enable(struct eud_chip *chip)
+{
+	struct phy *phy;
+	int ret;
+
+	if (chip->phy_enabled)
+		return 0;
+
+	phy = chip->paths[chip->port_idx]->phy;
+
+	ret = phy_init(phy);
+	if (ret) {
+		dev_err(chip->dev, "Failed to initialize USB2 PHY for port %u: %d\n",
+			chip->port_idx, ret);
+		return ret;
+	}
+
+	ret = phy_power_on(phy);
+	if (ret) {
+		dev_err(chip->dev, "Failed to power on USB2 PHY for port %u: %d\n",
+			chip->port_idx, ret);
+		phy_exit(phy);
+		return ret;
+	}
+
+	chip->phy_enabled = true;
+
+	return 0;
+}
+
+static void eud_phy_disable(struct eud_chip *chip)
+{
+	struct phy *phy;
+
+	if (!chip->phy_enabled)
+		return;
+
+	phy = chip->paths[chip->port_idx]->phy;
+
+	phy_power_off(phy);
+	phy_exit(phy);
+	chip->phy_enabled = false;
+}
+
 static int enable_eud(struct eud_chip *priv)
 {
 	int ret;
 
-	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
+	ret = eud_phy_enable(priv);
 	if (ret)
 		return ret;
 
+	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
+	if (ret) {
+		eud_phy_disable(priv);
+		return ret;
+	}
+
 	writel(EUD_ENABLE, priv->base + EUD_REG_CSR_EUD_EN);
 	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
 			priv->base + EUD_REG_INT1_EN_MASK);
@@ -75,6 +135,8 @@ static int disable_eud(struct eud_chip *priv)
 		return ret;
 
 	writel(0, priv->base + EUD_REG_CSR_EUD_EN);
+	eud_phy_disable(priv);
+
 	return 0;
 }
 
@@ -130,6 +192,10 @@ static ssize_t port_store(struct device *dev, struct device_attribute *attr,
 	if (port < 0)
 		return port;
 
+	/* Check if the corresponding path is available */
+	if (!chip->paths[port])
+		return -EOPNOTSUPP;
+
 	/* Port selection must be done before enabling EUD */
 	if (chip->enabled)
 		return -EBUSY;
@@ -227,8 +293,54 @@ static void eud_role_switch_release(void *data)
 	usb_role_switch_put(chip->role_sw);
 }
 
+static int eud_init_path(struct eud_chip *chip, struct device_node *np)
+{
+	struct device_node *controller_node;
+	struct eud_path *path;
+	u32 path_num;
+	int ret;
+
+	ret = of_property_read_u32(np, "reg", &path_num);
+	if (ret) {
+		/* Legacy DT uses 'ports' node without 'reg' property; treat as path 0 */
+		if (of_node_name_eq(np, "ports"))
+			path_num = 0;
+		else
+			return dev_err_probe(chip->dev, ret, "unexpected child node '%s'\n",
+					     np->name);
+	}
+
+	if (path_num >= EUD_MAX_PORTS)
+		return dev_err_probe(chip->dev, -EINVAL, "invalid path number: %u (max %d)\n",
+				     path_num, EUD_MAX_PORTS - 1);
+
+	path = devm_kzalloc(chip->dev, sizeof(*path), GFP_KERNEL);
+	if (!path)
+		return -ENOMEM;
+
+	path->chip = chip;
+	path->num = path_num;
+
+	controller_node = of_graph_get_remote_node(np, 0, -1);
+	if (!controller_node)
+		return dev_err_probe(chip->dev, -ENODEV,
+				     "failed to get controller node for path %u\n", path_num);
+
+	path->phy = devm_of_phy_get_by_index(chip->dev, controller_node, 0);
+	of_node_put(controller_node);
+
+	if (IS_ERR(path->phy))
+		return dev_err_probe(chip->dev, PTR_ERR(path->phy),
+				     "failed to get PHY for path %d\n", path_num);
+
+	chip->paths[path_num] = path;
+
+	return 0;
+}
+
 static int eud_probe(struct platform_device *pdev)
 {
+	struct device_node *np = pdev->dev.of_node;
 	struct eud_chip *chip;
 	struct resource *res;
 	int ret;
@@ -239,6 +351,16 @@ static int eud_probe(struct platform_device *pdev)
 
 	chip->dev = &pdev->dev;
 
+	for_each_child_of_node_scoped(np, child) {
+		ret = eud_init_path(chip, child);
+		if (ret)
+			return ret;
+	}
+
+	/* Primary path is mandatory. Secondary is optional */
+	if (!chip->paths[0])
+		return dev_err_probe(chip->dev, -ENODEV, "primary path not found\n");
+
 	chip->role_sw = usb_role_switch_get(&pdev->dev);
 	if (IS_ERR(chip->role_sw))
 		return dev_err_probe(chip->dev, PTR_ERR(chip->role_sw),
-- 
2.34.1

