Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94E94E9C01
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790717726; cv=none; b=BKs4znyHtl066+CrA5NOI92C6hzFKRiBQ9sLQizV0Gx2Q+CZhOHjV6z8gQAgnW7CDarxIodXt/wjhEwREb4NQ2Ox3rUxPDfyhxdqGwaf2O8tFEHbcKULcrlMmBvGDL+d7zXUkyxciItGs3NvOJJonPdPuGxNJzAipfV+gAG7mcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790717726; c=relaxed/simple;
	bh=5F7fqXoheI+nQtZUtZ2lGyPnKx0eff5fmA+5h4iYtLc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MIoYP1NbbagmnISrIK7q7E9BhVp/8x5NhAgC0T6pL7v94/bf3eFsS3T/znIhCIZgbqBBLl3yocDnB3RxMyuSO4W1L58KWdGnH6xJ5AGmL2qmYZ+4G0KlAY1RCcP8poMDVxJGI61ZgFTJgMskJaAha8PaXKJaTLtbjK/pjolzeFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QeF84HyT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RJ2WGz4E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QeF84HyT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RJ2WGz4E"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68THdP5O858071
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:35:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iNTBdB7D+ki
	xYkp60HrocRPs7RXWgydmE5O05yA59CM=; b=QeF84HyTfJrF17WRN709rReMMMq
	WrPMB3pI0KM7RgBfa0eoRxAryfzy7uNtI6wNIYS7KVoR2TrUQKboTTj1pHlJk/Ze
	vUrQku/RT6JZ2IDAdLwrWP4O0hUeszrGFTRuhCHhSMJw0vrF2kcE9a7roI6drZ40
	711OXidwfdsZTf/+pPmQUJJXrNaNM//5I1r4nPwPzIeVrQYyxTNN/744U7v4G/YY
	oNDuoWGiIZYun+1hA5owcIzS0d09pFUqgeGYfa6MjGPUHJpQ5z99XrYySVcR6HS4
	7xpNhAdsIXuv2O92QLHHu8nN3yua1ITGO/VwBYVPC6gDza0iDBk/oIqLYMw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h08e0kr7r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:35:20 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso6907904eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790717720; x=1791322520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNTBdB7D+kixYkp60HrocRPs7RXWgydmE5O05yA59CM=;
        b=RJ2WGz4ErJXLuOdlrIm/FOm6NbBxrsvkXrJOEk9mlOgup4dS1SHkB9Y6CIxvsFi3tN
         fob2azMtVCBDxHcjvgZakYlPnvwpYO/oFj/1s55peLeSCSI1WA2fidVTAB4EnuF3SKey
         4i928GOoGko+6g7ezWpEPA2MEnqWjht4Q92m6U+Ip2ab1+xTHfXjpCBnXG+THx2qAcE0
         uxl5AaEej5anSAgYGuLN4lJqQPRgGWdb1/HzmON5em8a+LJRuoKp/F4hxd4KjjpUI7+4
         d5K03zoWT8qkGN8Ass7W3oIPZ1EZuReipg0uABwW8/QdKg0SKCcat6LgQvvykDH6q7f7
         LStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790717720; x=1791322520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iNTBdB7D+kixYkp60HrocRPs7RXWgydmE5O05yA59CM=;
        b=qCCij9uhb7+dQMP7j2NpxVphuvpGHO3RU81UyhK6AEBy/bCXDKiZtJ6cH1aMRAFI9Z
         oN+guHkia9v2lDdRRkZe3/dL7RN8apdGeDnYOhBiCDXQXLAcIQff+jHCOhSxYPvoII7Y
         u3UDWqbY4uvWLtCEF2kzMpEfPWKypMoO26Hp/BjuM5ReElDGWqXAPxYHi/QVQeKgVWFL
         A3Gig4XoDbrmBKnRMqKSV8EN16jpmb7vUgQVWrlSieCMobBeQxXavGucVr0OhL2lS46u
         STMMOx96KTsCh186eFUBD5daksp80Y+PCnKdv9VKHtXSNGWL6nPXl2owfmVu8dTU04ce
         N4ww==
X-Forwarded-Encrypted: i=1; AKwUvBxd4oYeBk8o+H0dP5WDHBROwKp4pJiM7izmw4hoaoX8qMDDpGEAt2dtEK5BUh4TWlIX17K5EL5gYbfk6XU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhLXKT6dByIpUj1ZDthONXy9tb0Amd9ZOnCreLfBiRvBb/bE0B
	P+psYLrRB3094WCCfY8NEu6oEwgqnA8WPwDIA3QHEcGE5Y37ajSEPsP3v+/5f3WDYFwvjdseilr
	TwdxnoZURnL+VreG1j2IZBtMMEX2EV7eUigUjLncCsX+jziuzXHshxedh7EfYwXBUX40LoSKv2D
	k=
X-Gm-Gg: AYBFou2+JfQPbbAdb7meh4bvnocoa3tw0+e26fmdmLTTOSj3fQCp/mHp8lmlYXkFIA2
	le5S2XaPnFhFG4CAsXO2jdffGt1yUo+OsTjsJWSP8I0wY1pd0hTdZPekNFCoTY8inSjR1KyEMEX
	oQRhsD8ihR6ixX0mFG4x+54Mj6F32ZzulZKg54hK869VsFErVkjwQXHk8PaYx0v1joyKJEsttus
	AysOTJo3Jbv/kPlFY8LrWE8cswboALpzADW+0uMuTSqno5pRR7nVwEPjmFdOR/5Sm9j0o9+sJGr
	hyt4JfxP41AjfmvyXNMQQ7sb0/+2pCkLggf2Vbx3Awoy2syCTQzQ42ZmWjnF2aRlWVBT2lwxAio
	1XCpILCkcFymcEJ1uvjN9bY4rh4oP3Oywt/nFbYXNL5ON6bAXd/1s
X-Received: by 2002:a05:7300:ae04:b0:33c:e61:e1e5 with SMTP id 5a478bee46e88-34c634268admr796017eec.21.1790717719871;
        Tue, 29 Sep 2026 14:35:19 -0700 (PDT)
X-Received: by 2002:a05:7300:ae04:b0:33c:e61:e1e5 with SMTP id 5a478bee46e88-34c634268admr795975eec.21.1790717719187;
        Tue, 29 Sep 2026 14:35:19 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c391e25e1sm1512570eec.30.2026.09.29.14.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 14:35:18 -0700 (PDT)
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
Subject: [PATCH v9 3/8] usb: misc: qcom_eud: add per-path High-Speed PHY control
Date: Tue, 29 Sep 2026 14:35:08 -0700
Message-Id: <20260929213513.2401005-4-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4NiBTYWx0ZWRfX/hOWPnbPVZI0
 LWNm+ehUixffcaG6YMQp0sEPlMyCf4QscCgTgIx0ikvmzX3KkhYsTr5PYaocaVIA/Ecop5qBB0/
 yPz03UdN9XCngal37AVpUL+FXWwer+8=
X-Proofpoint-ORIG-GUID: Zckhs-iJdvpM5Bpk10570zYa3RfEOsGA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4NiBTYWx0ZWRfXwsGjex8IGhNu
 LYDmMWX/a3ljez1N67NmDILxgv2JwY2x5zHG4vMCJuNlAnPZsXxtYi+72qhqTKbRDQftKnroHPV
 lz3WwinX7no9FG0Av7qLY8jUUUk1SUhC/Bhtd9JivXcjlWQbPxBX/yo4cP4ZwQcIFnQdbyZ0yUU
 jirDqSV82PC7FqDEqOSG82YM39XMGOI5lXaV5PxHptU+FDQyBSYxzd/FPPBwmwp5bTvZv9oNEEN
 XcHXttB1rl0Tb76XawqHQuVx1hZjb9CXSEhX6jFHlcZUt1tbfCrGXHMePCh2DA06SiQyyXJ5yI/
 atmSRwcWpwkcmA1yWXJw5607ITNv9mJX5nEAOOiAWaZiDsyLxrRINU6n2rRLN6a7Wrli8PuCYLm
 4AZXG6zq/gJ6oA/wZIWZZkXDIF/TnBMH19iYxnyuMy1l193OUhluM/t6vj5Tz8WvNb96W3SnOld
 2qeo10xD2Xg4zhGUEhg==
X-Authority-Analysis: v=2.4 cv=WJ7qzXsR c=1 sm=1 tr=0 ts=6abc2f19 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=OKkk4dbWoaB1VCfbt-4A:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: Zckhs-iJdvpM5Bpk10570zYa3RfEOsGA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290086

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
 drivers/usb/misc/qcom_eud.c                | 129 ++++++++++++++++++++-
 2 files changed, 130 insertions(+), 2 deletions(-)

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
index fa640e88c88b..a3afa3bb9348 100644
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
@@ -40,26 +42,84 @@ static const char * const eud_port_names[] = {
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
@@ -76,6 +136,8 @@ static int disable_eud(struct eud_chip *priv)
 		return ret;
 
 	writel(0, priv->base + EUD_REG_CSR_EUD_EN);
+	eud_phy_disable(priv);
+
 	return 0;
 }
 
@@ -131,6 +193,10 @@ static ssize_t port_store(struct device *dev, struct device_attribute *attr,
 	if (port < 0)
 		return port;
 
+	/* Check if the corresponding path is available */
+	if (!chip->paths[port])
+		return -EOPNOTSUPP;
+
 	/* Port selection must be done before enabling EUD */
 	if (chip->enabled)
 		return -EBUSY;
@@ -228,8 +294,54 @@ static void eud_role_switch_release(void *data)
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
@@ -258,7 +370,22 @@ static int eud_probe(struct platform_device *pdev)
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
 	chip->port_idx = readl(chip->base + EUD_REG_PORT_SEL) & EUD_PORT_SEL_MASK;
+	if (!chip->paths[chip->port_idx]) {
+		dev_info(chip->dev, "secondary path not available, falling back to primary\n");
+		chip->port_idx = 0;
+		writel(chip->port_idx, chip->base + EUD_REG_PORT_SEL);
+	}
 
 	chip->irq = platform_get_irq(pdev, 0);
 	if (chip->irq < 0)
-- 
2.34.1

