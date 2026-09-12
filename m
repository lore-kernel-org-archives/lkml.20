Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D04B3F076F
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 22:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789253597; cv=none; b=cblzAzN+Yr7X7RtSPq0UsWgE8tASxwf/MPHulmGVDczjCavr/Qa90/WitmjKT0wxJbmTskAz+7q4U7Ur1+xqdm459LS+9uoLFboLuy286o01Jw6GzeX6mIuTMxYqDvzMz+PEgxB7Fg+6HlOgFb4l/XMpgip7ucBh1DAKVxIfHqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789253597; c=relaxed/simple;
	bh=rVdkz760Q8fXyAseABchn8U5vS/oKnuFm6WPsfdcnjw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b1i2UoPEZ3NpA2nmlyJaMp9RZ0mft1TAuCDjRJF/51TrwHI8d1ycmPXxGiWYM3ohsL9dxtOl831eo6aH5eKpsxXhvbO9Eb3cUhS7xFcYFuM7Ms3BcGy0z9CNPE4L0YxFReNhua6udKv9Kw4ltsI+S9f0zHY6gu9MBqtdGHMv99c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FjUhv9aM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YmLt1jfi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FjUhv9aM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YmLt1jfi"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CLnVsf4183768
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 22:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rDAPLYVM6TG
	uQkdtNKjVBPeoUGkbJB4PVCw18G3tQWo=; b=FjUhv9aMxUr3gJZRDsLyJBt0pFU
	njR8VLiwl3f63i0mSFYgxVcr5qL/H2Ho5yMdjCdmzVJPmcG+BI4fduJT/u/SozjD
	OYRF9EmOsRYBWZW/zxEzPwXJJbS8H/cDoI7qVGvHMLmnLm8huY8gjJoO6oZX+Pn9
	xZCQn4HaUoRojN1Mp78Ux2jlLagkAKdLytiJOh4BfNCzqnaaGSL2RBxpiknPb/jY
	KxYAws89cWMF67xJqNDVPxrj+gIVdbl0Ngt4fAmM0n2il3mzdrf7UtOShCOLni4P
	qhcuGaOw1AhtSL6lO1F4ghTOt0dJerix7VxuHSUqBxFichBsYbHBW+hUvMQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d22jf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 22:53:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso3634251a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789253588; x=1789858388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rDAPLYVM6TGuQkdtNKjVBPeoUGkbJB4PVCw18G3tQWo=;
        b=YmLt1jfiLIPdU8EpP9U9QUeG4ev/M/ORLzohNdXZwLHlqpScxhQT+l9DKddjwb1fuK
         2xPVe3eMvDFiJvjSqkuvaPuEayHUQ0SUbvzxbdoX/5IQF65IC25lnzubeCmsO9HdJMGq
         BlvaM/welgp0w4d/tViWeAoCMc5bQ2DIIDGdISfY3mhTyZBed6DGa1JAKpFcqDVFiTVO
         20YJ6PAefm6roXGpKfaXMM780dwn6BGB2hpjncNJ92iIv0RvZESHPyYl9gXuSErwt3Xa
         +qx7KhTrusvpjX3x2+mtZGs7K5tvEoXrtsXHh2JqAp4eyDrM8Z0DRXK04/2BGwiR9Ead
         uzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789253588; x=1789858388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rDAPLYVM6TGuQkdtNKjVBPeoUGkbJB4PVCw18G3tQWo=;
        b=qg9fZOl6+tgHoEu6yeIubfdt9xZI3eIj/KwwcCQh697ly1TLC8DThnW1+fqCuuqy4U
         nWfxIWnSzYn1yLqDnDvHPIG0nB1MhhdxfA3I25msoPPuF+kjCBY1e57y4J2Qa2YziEoI
         CwEH0j/1mTT8YiedAdarU1u4lf5Kc9D4V0wk4t8EGISNhKxNb5tGgKNr8bqLzwuEfEWC
         CD50Zw/4ajIfxpJ8vIL3Kh2Gtrtj6QIrJpc8k7nWkNHdfX/TQWVsgkodIxIqnb9DAAMj
         OZt8W2zp4RU3zicWfTtyvqpq0ZmFe2h7sAjE91U+z/GEi89OzTx3rz/NgUv6qwsuuXUO
         /9gg==
X-Forwarded-Encrypted: i=1; AKwUvBxTyivzBR+vKg1GEUrZTIuXmKlMO102CixnpcH9sXpSein9NCqwKoe93zYGpJ9jZqPNjYSH5VxauO5yQLA=@vger.kernel.org
X-Gm-Message-State: AFuF++mRnjKXr1/b/cOJKYHLGGiC5qOWZhmEszSqMvJdd594ub0ymVbu
	OWvFeS2ZeJVFyjuAIYbHWw8QWEbeNwPWCr42bcv1+nBxlbzAYCJpQWLm+aX0mWAgIIklSm/rK8F
	qbkupmiq96IqS+7GyiQRlwY46jzmVOu7ZYaFruBV+vyKnuY2l2jEoIie2cKGkCVDWapw=
X-Gm-Gg: AYBFou1dg9EWBe89y5gvVBmqlfwi+xWsOadn7BRHFWtilet38qBRPk70qPiZrRrzfiv
	E4H7a4SBPRncEa8tpI6cRDu1piXemrjpvBHlWEtcYi0MZTB0SjQoBiCoDS8E1BdH/N/gfGS8cnj
	Pf9EVVrvgUPCbDivzztJxJ5R74g1HiDc/lmldUjcWtatqdTn3yi2ctgWjuHWnfeluEaTST1HSzq
	uzNxZagAxh7OBRdE8iJtyGUevjinZTCQqSn83OMZUKHUo6IKKbJwQGVK+syiB0uo8cRYWOg7mU+
	SQ+GITy84PJNkZq8Ou+u4T1cqKq/v3z+hxyotwVFkLb/cC16IaRD2AMoAenxCKkINk1693OW4ab
	SCI7Cr3PQnkIXT5P4BgBkAhEyL/a76ELQhdSf95lD8EK1beZoxMk3IA==
X-Received: by 2002:a17:90b:5243:b0:398:c724:1bb1 with SMTP id 98e67ed59e1d1-39dbc0c3777mr9261917a91.8.1789253588200;
        Sat, 12 Sep 2026 15:53:08 -0700 (PDT)
X-Received: by 2002:a17:90b:5243:b0:398:c724:1bb1 with SMTP id 98e67ed59e1d1-39dbc0c3777mr9261887a91.8.1789253587789;
        Sat, 12 Sep 2026 15:53:07 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f5833fsm19741555eec.23.2026.09.12.15.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 15:53:07 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v8 3/8] usb: misc: qcom_eud: add per-path High-Speed PHY control
Date: Sat, 12 Sep 2026 15:52:56 -0700
Message-Id: <20260912225301.3396556-4-elson.serrao@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDMzNCBTYWx0ZWRfX+XSn9mIX6MOd
 PZ5rTod6CpyilwoFjHlXyN31S0/2rZ9kdqMcU0CNWHja/kYTeuQsSvS02LZdoO1byWD5WouVTlO
 P2qRhdVTcGSDwwEtpoMZkAC/RBhAgqM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDMzNCBTYWx0ZWRfXwlHs1yJmIveB
 5vfcNqIX0zJSfIrspX4JURXLzGguZ18xfUXOHEKEoOi/DqetFyl1yAV5RjIgvVG0Jl7tU4VbLpu
 mO3VFJX7Iylqw13HPEGJ6sPDk8GELMY2dQ9S3axPMhK3Xru8OKrfEejHsWl5Nl1bgO0v14Zj6Ps
 hWv/zjYsMDGxcXIxgr/8hKaaaDCUpT8HkpGTLXA7Cl4fxlGAgWMEXudjUo3N10e49id9ZzxmglY
 u/CwNgN1B3xpHOBa7NoMQvQ0PLE92nXMxdQBComlWYPr6dNVmd/5lTC3eQgkhKzwKOfkyI/aEKL
 +Ao57lDVckjpVc34E94zch4+tDfM6ri2Xs/y6CH66Mnibn6er/iYe+5L2Zc60KXPFNiHzxUOU4Q
 ewy/mvs+u89ujFCbhvzZ7/x9wUx9+VUXPXulmFpKqdbsv+GrqCFILmljFCb0zAOwVLK/GwgcMTu
 0TvFnWxlkkWyTusazKQ==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa5d7d4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=OKkk4dbWoaB1VCfbt-4A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: l30P-q6llHMeERhyf0IRWk1ksmGLu9ga
X-Proofpoint-GUID: l30P-q6llHMeERhyf0IRWk1ksmGLu9ga
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120334

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
index d32d382a311e..70915af40ebe 100644
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
@@ -257,6 +369,16 @@ static int eud_probe(struct platform_device *pdev)
 		return -ENODEV;
 	chip->mode_mgr = res->start;
 
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
 	chip->irq = platform_get_irq(pdev, 0);
 	if (chip->irq < 0)
 		return chip->irq;
-- 
2.34.1

