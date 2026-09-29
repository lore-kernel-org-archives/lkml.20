Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B3F4EF13C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790717729; cv=none; b=cEd+QnSjnprQkFud1qn2xFdSXhl7ZLkD+qHoEzTmzDjfBGYlewgc7HdO3nzPixOZ99ibFpAorrlAmAQpS+QrxiUV9BCQVl4zFTp9fixNgu7mS+YhUNm3SlpTEXFsIxNIOg423uXDnkLi6r4P7YtkMgzY0PUT/MyldPIFHrS86Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790717729; c=relaxed/simple;
	bh=N4mHNfsnlyveA0/4qNZh7sd+pIptRFkHByxL8A5CUFI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rlD/MrXOut6xKc7oMvHwoAKlTNBsvW0+x0TdAEtHeHE+FIb2LGTLA2wZ7TAPAyKRaw7U1PK31pgpzcUABibpDSavuCmN60lnHpGrZ15LH1FNASEF62WJVM7OGYOI1pyOmHPiNKStmuK8Z6VTV8kbVB2FGOXoeXXwxGVTuJR35G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E5qihwiz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bH+fH+vG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E5qihwiz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bH+fH+vG"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68THfeJh3300964
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:35:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Y5woa8COobc
	bxZAHY254heLz5elKvaTjIHSo9KyCdzM=; b=E5qihwizlF09QVi1hoGCSitpd2J
	IGCDxP0EN+XkkWIkW/xb2PV8S1a1P1XmAP7GqEbza3tN/KzpuxP71qW+BH0Uf467
	nQJ5/Ui6mc3eiNCYPzTvUDa5+w/3T6FQhgd7FCwBkpYqHKAKH+T6+vFafTrkGGKn
	VNz7lcG437XwOPvl5Eg39wqC7TtvLsRd9yR89oZTA4SoIkqymUId8m6T/Ag9MZh3
	XJACjiWk0qemyCT6ji+PphJRo1Sr5AXZ9imInQjonOmeDEs83fKVqeBc7G1eM3Wo
	HTDAVSQ/HDNJtQ0dmQlmB8yOKh15Kj/kM2cRfspz0yEdCW9m+JjynvnuwIA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0dsx28rt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:35:25 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30f1b904861so6390339eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790717724; x=1791322524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y5woa8COobcbxZAHY254heLz5elKvaTjIHSo9KyCdzM=;
        b=bH+fH+vGZtwWJ8MJ7xGBbPrmDJ/cMBwLrgF0Ou8IRr0rwPjkVcztxeTQijnF7iUplQ
         +13n9P5kHRpDTx6TCfzeplmxcepqpc0jtbCFK5lMX3g+qR6OuiNbqHhwZinSJ/BowLY6
         E/X+ZaEFEVyVn/oNDqSA9XvHWBzWjRMvXdcejEOLxDWJZ6GnymznyhJXI4Qk1IwIYEPT
         7BmqzbSKP0gJlP2M+i/y9xAAl0J82LjrafiM6imWDWY4xM37Akdjdg2Nl2kGezenuxtB
         u+W5HLbQoWzEnL7/Sbu5volo3smXhcKqYuLqUcVPCyAysUosMhNwtbkKpBnxAUjK2fbp
         SFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790717724; x=1791322524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y5woa8COobcbxZAHY254heLz5elKvaTjIHSo9KyCdzM=;
        b=aKvcsshfIVSI8d5eiLNw8gCgs9dOFBnakOBsrApWJcTBjq9mjepueXmz51zrnkmniQ
         vXze5j5urifgczdGenWSqYkU4xXirXCqhs7IHP+NAukVdth4jQPOoaS0mhIA+23zxpT3
         aNlNUa2DQUd3MNBAX74+SwcaZKoMn4u8bNzxBakOz+XWuG5geD41QaLIqoIW89+tsrwu
         0Otse7sVXPF01LprW47fnVo1KAqxju6zVWRY5c2qqMG/i6dQsCUzFfUk/pI7bTQvN8WD
         +URdl+a+hXUSh3iL6W5ejkHFxtJ21oTq7DEUK1gzFcM4g+5WsxJIk5eOhNoQn3cfQBd1
         o6MQ==
X-Forwarded-Encrypted: i=1; AKwUvBzv8qu3zy+CKCyd3U6qwaqPfl/VowlLv6IyxrQDJFxPTTKbVNGxEa9919qz5dZ6PG41CB+Et4zsSDD3Oo8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJegU0ZeY/ovVNB7Syhp2QxCkCx3Y5atrryvjUGSvvgJGJngJIk
	3XhFUnq4mJUf7w5FRLGbddTISwzhyF6BAYn7kzRbI9aOliQDCWFnKYhvir5f07g5P1Vo5Z2nihl
	D34Ox6wCOnnzL+/OkkFjhbAyHh97ifuLLLAptKOV4Ag7J8JLjzsWV4zhzn2+yjipXPZw=
X-Gm-Gg: AYBFou1eVcUWrYoHRrYvQxAV8rarSOFcZPVIWW/SwEytTN/6GqTHUf9SfA47q1ej3L0
	+fkuaHuKmtea3QdL8+NDZyA26LzRRHtIzOsWbesPl9rHhjvuzKjqFPDYpnvu0UtX+lPyMBXy0Aj
	CXcMr4c7klhVVYw28iXdRppb8BJtkbctc4+ILMVhbwbxTqlq567JevLXI/VnrYY5amKNvuTzvce
	EmQNY/Im5cAOcevHMsNXT5i/wH5kwdoOG4i0TMprfSEAvUG//KDJhTCyT97/63xZKUuY751u/50
	C7UIVcDNVWyKiG1j0iVMRE3rIhp4ujBvFoH061Il9cSksyLqtU9NGcz9ehDdZNLzoXLNOOdgYyh
	w6JES/vYZBZ+axLJump1zPx6vv4UgIAq5Wwwwaz5fFXBo0GANUhzQ
X-Received: by 2002:a05:7300:b08a:b0:328:3944:ee53 with SMTP id 5a478bee46e88-34c63321e69mr739467eec.2.1790717724058;
        Tue, 29 Sep 2026 14:35:24 -0700 (PDT)
X-Received: by 2002:a05:7300:b08a:b0:328:3944:ee53 with SMTP id 5a478bee46e88-34c63321e69mr739409eec.2.1790717723065;
        Tue, 29 Sep 2026 14:35:23 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c391e25e1sm1512570eec.30.2026.09.29.14.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 14:35:22 -0700 (PDT)
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
Subject: [PATCH v9 6/8] usb: misc: qcom_eud: add role-based EUD control
Date: Tue, 29 Sep 2026 14:35:11 -0700
Message-Id: <20260929213513.2401005-7-elson.serrao@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4NiBTYWx0ZWRfX7zekP3xhtYqL
 TFtOD0pNGd4UB8b4r4mcVQViWWilYX8vs1uPZ3XfZ+kMWyPKghQcyib8fIn/NSFTscbBpNJsMGa
 2jIL73t4VZC1GKGevNEn7msUgQLp+d09rBEjp8czotEoBvWg1D+P2705KfOAZKSSJ5rUC74QqlO
 mm4NdAaUes0RVgKBSJsZ/1qUhAlDBEPcpm91k/qijuC43b4fZ39GICmdulY1ynOgB7xP1LtvSyl
 arcfH0STludHnvlZB4h+hF0sAolVZ7n1QJOo9STqobrb2hJoyWUjZiOJ+gbtcohQ2uqvFLuRwpr
 oZhkYbfFx+rtHyO7TMwxpoohXfhKce9EBEi+HT2iidby8LOZ17RSN1ofS+f+lU25lHd4zvhb6uR
 dVRLFYj+nU3oJdTNXSy/HNWTpiZnPjOpUNLZ+Gu27UbHW1/c4NouQ3Py+YGmXQSU/G1GhChJ774
 iZJN0AjNftDL7pQ8NwA==
X-Proofpoint-ORIG-GUID: d3SBjoHPQGffhs22fHcDybAf93WUWsAB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4NiBTYWx0ZWRfXwjv5vmyUXfH3
 RSC5K6uNkgvz+7XS8VdZEdoTgsehmCCB6GLcAzFFkEQV9Z47WQfmKnFVqaKgjY5Uhis+fTE4MFq
 R49Hi+Y+g10N3lEwhLsjsfe/dUYWSy4=
X-Proofpoint-GUID: d3SBjoHPQGffhs22fHcDybAf93WUWsAB
X-Authority-Analysis: v=2.4 cv=DqvDa2/+ c=1 sm=1 tr=0 ts=6abc2f1d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=YKK-c5bBAu3nLoGgrlsA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290086

EUD functions by presenting itself as a USB device to the host PC and is
therefore only applicable when the port operates in device role. Keeping
EUD enabled in other roles provides no benefit and unnecessarily keeps
the associated PHY resources enabled. Furthermore, enabling EUD in host
role can cause the USB controller to misbehave because the EUD hub
supports only a single upstream-facing port.

Address this by treating EUD as usable only in device role. The
role-switch callback enables or disables EUD as the port enters or
leaves device role. A sysfs enable request made outside device role is
recorded and honored when the port subsequently switches to device role.
Additionally, synchronize EUD state management across different paths to
avoid races and maintain consistent hardware state.

Reviewed-by: Peter Chen <peter.chen@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 70 ++++++++++++++++++++++++++++++++-----
 1 file changed, 62 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index e227d05cfecd..5a21a2dd0b0c 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -15,6 +15,7 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/sysfs.h>
 #include <linux/usb/role.h>
 #include <linux/firmware/qcom/qcom_scm.h>
@@ -57,6 +58,8 @@ struct eud_chip {
 	struct device			*dev;
 	void __iomem			*base;
 	struct eud_path			*paths[EUD_MAX_PORTS];
+	/* serializes EUD control operations */
+	struct mutex			state_lock;
 	phys_addr_t			mode_mgr;
 	unsigned int			int_status;
 	int				irq;
@@ -158,17 +161,33 @@ static ssize_t enable_store(struct device *dev,
 		const char *buf, size_t count)
 {
 	struct eud_chip *chip = dev_get_drvdata(dev);
+	struct eud_path *path;
 	bool enable;
 	int ret;
 
 	if (kstrtobool(buf, &enable))
 		return -EINVAL;
 
+	guard(mutex)(&chip->state_lock);
+
 	/* Skip operation if already in desired state */
 	if (chip->enabled == enable)
 		return count;
 
 	if (enable) {
+		path = chip->paths[chip->port_idx];
+
+		/*
+		 * If not yet in device role, honor the userspace request and defer
+		 * EUD enablement until the port transitions to device role in the
+		 * set_role callback.
+		 */
+		if (path->curr_role != USB_ROLE_DEVICE) {
+			dev_info(chip->dev, "Deferring EUD enable until port enters device mode\n");
+			chip->enabled = enable;
+			return count;
+		}
+
 		ret = enable_eud(chip);
 		if (ret) {
 			dev_err(chip->dev, "failed to enable eud\n");
@@ -206,6 +225,8 @@ static ssize_t port_store(struct device *dev, struct device_attribute *attr,
 	if (port < 0)
 		return port;
 
+	guard(mutex)(&chip->state_lock);
+
 	/* Check if the corresponding path is available */
 	if (!chip->paths[port])
 		return -EOPNOTSUPP;
@@ -287,14 +308,18 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 	struct eud_path *path;
 	int ret;
 
+	guard(mutex)(&chip->state_lock);
+
 	path = chip->paths[chip->port_idx];
 
-	if (chip->usb_attached)
-		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
-	else
-		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_HOST);
-	if (ret)
-		dev_err(chip->dev, "failed to set role switch\n");
+	if (chip->enabled && path->curr_role == USB_ROLE_DEVICE) {
+		if (chip->usb_attached)
+			ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
+		else
+			ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_HOST);
+		if (ret)
+			dev_err(chip->dev, "failed to set role switch\n");
+	}
 
 	/* set and clear vbus_int_clr[0] to clear interrupt */
 	writel(BIT(0), chip->base + EUD_REG_VBUS_INT_CLR);
@@ -306,7 +331,30 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 static int eud_role_switch_set(struct usb_role_switch *sw, enum usb_role role)
 {
 	struct eud_path *path = usb_role_switch_get_drvdata(sw);
-	int ret;
+	struct eud_chip *chip = path->chip;
+	int ret = 0;
+
+	guard(mutex)(&chip->state_lock);
+
+	/*
+	 * EUD is usable only in device role. Power it down for every other
+	 * role to avoid keeping an unusable module 'ON'. chip->enabled
+	 * preserves user's sysfs configuration and is not modified across
+	 * role transitions.
+	 */
+	if (chip->enabled && path->num == chip->port_idx && role != path->curr_role) {
+		if (role == USB_ROLE_DEVICE)
+			ret = enable_eud(chip);
+		else if (path->curr_role == USB_ROLE_DEVICE)
+			ret = disable_eud(chip);
+
+		if (ret) {
+			dev_err(chip->dev, "failed to %s EUD for role %s: %d\n",
+				str_enable_disable(role == USB_ROLE_DEVICE),
+				usb_role_string(role), ret);
+			return ret;
+		}
+	}
 
 	/* curr_role tracks the role from EUD's point of view */
 	path->curr_role = role;
@@ -439,6 +487,8 @@ static int eud_probe(struct platform_device *pdev)
 
 	chip->dev = &pdev->dev;
 
+	mutex_init(&chip->state_lock);
+
 	chip->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(chip->base))
 		return PTR_ERR(chip->base);
@@ -485,8 +535,12 @@ static void eud_remove(struct platform_device *pdev)
 {
 	struct eud_chip *chip = platform_get_drvdata(pdev);
 
-	if (chip->enabled)
+	mutex_lock(&chip->state_lock);
+	if (chip->enabled) {
 		disable_eud(chip);
+		chip->enabled = false;
+	}
+	mutex_unlock(&chip->state_lock);
 
 	device_init_wakeup(&pdev->dev, false);
 	disable_irq_wake(chip->irq);
-- 
2.34.1

