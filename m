Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C98D3E639D
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 22:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789253598; cv=none; b=LWTmcaTnVE8VfGVU3ykF33elIVRP8BKqAMgIdT5kW/RDRJf9UT8aqRd3mgRr5PkkM+CcrvApSXc1fpnkHJ+0WYIxCw6X/BV6Q0ZFD2QffSf3VR0aGQ7E9HFTsbWIaYIM+GnTNBrdxvL1VNkNqIYUHgugTjdveeIR8RjRcofhE0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789253598; c=relaxed/simple;
	bh=tEDXH/Mz1x1xgdKZ0nHNJm+M2OVWIRMxRtOBeC2FqJ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VbtibpXGLE4St7j69VxZ8/HR6URRd1GKjHhNQdakNux31RWxfrLv75nE2fHXHELmyZydSdHHNFZ5/z8TzhTZr7v/JWQOwP82MknWlt5HB/BWjHwMzHIvBHSfcFgQ89P8/S4uZQc5e0oDHdxk3IBOBpEA2Wwz0NjsBmx3qDNXN4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WvRViK84; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jbWow06R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WvRViK84";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jbWow06R"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CMdiNT1180209
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 22:53:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=othrSyv0peg
	1Up4pt50lIvgoy2rt2hUJYdDjAxQKDcU=; b=WvRViK8449yN8wrD2DALt0xVL+7
	/ZzcUbsqdPskpOnFsxzIs+u3QUkLGS21N6TLUb02yWX0QThspoRmRtTbbUfCqSew
	4zEFAd2MeazbriG0c5Dtm6le0ZJ9FiatVdyQoUaS1CgEYwcG4utq3ZqcZg3v12qb
	8qvC4XfOyKk8xjhLX0h0mfkLWfKHCycfCR91Tso6J930ZQE64+n6sLlDuveYmiat
	/15G99GrK7oryRAfwv8lbBauojaSzCYNmUKO3AaywM0I8W5xUx2q2LzydrhtdLGx
	e8xHWeVva2kh94zx7/f/osbIsR6GjkdWu1UOjA5gmXJ+/BT/mDOkq29Z5YA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cj2rj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 22:53:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so4176107a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789253592; x=1789858392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=othrSyv0peg1Up4pt50lIvgoy2rt2hUJYdDjAxQKDcU=;
        b=jbWow06RjhD/fc8Tkz11IfTDzY9NrjExq2CSia8OVtK88Aqrz+G+GfpfNojVf5W8u6
         jEaOG+HgVV0WloSoztFX951gpdTYVvqZbvLNsE//SaXafi0UIzxlfFdLPfjxEWDhgQKy
         Q4p2YVIZTxVXUzu3NrJK/a4O+jl7kwZqxSF9omJ7zBLvQ+gvOA6aRWnzos2vN1q+5crw
         jSACQmz5SoZMDubhK6nNKax5LxafqXGjU7A/xJJQtI/IKGzKrhBpFdilyyoccKdwgNPO
         Aw8EY6ocH0MYPbgRPoFvyyCAgffYCZIltzvJl2pkO6tQdylnngWfSYFhhOOhsC1I2llP
         THDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789253592; x=1789858392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=othrSyv0peg1Up4pt50lIvgoy2rt2hUJYdDjAxQKDcU=;
        b=q9SjbbmlQ8qmqkKlaANlRNOFQs7uhPkDgvGAbtJPK7bV7Y5OgioThPGzvPLeJqatfK
         PHVsRFm4dnwTkHsf8Hd6YkH9Mq/GtPa9yh8ao5mjPciHA01iBLrDpnQpI947XZ/FkLZF
         aGrzUX4MtvhZ/dixc4d0uUE1sgzNf2GlRomK/pYbdvkG5vpjz11Y5oXare97lrPhmX4n
         O7rZSSneGUkzU/5y/DCdlrlJvIbh8l1CLxI0QG+Scqjm56H0LPKwS+VOFebzH8K2KoS2
         sg5klPvwqmXA7GDFi3haOn7box8fPqxskZcBhhverucovltULs4U+s/JkdKVmvz0C1cd
         QvVw==
X-Forwarded-Encrypted: i=1; AKwUvBzWGqxUXQh2220wYaOwpVfC9QdornYKlfbMPLXV2cJ1YMYvhuYtdAjQ5rkYcxeYRfS0N14kLg0jykUTbIU=@vger.kernel.org
X-Gm-Message-State: AFuF++lAQmpfb2tcJQqucIKE4vBV6oI4fvxYpj/t59CPwzoG8RRVNZ/8
	Qm8QcXyc4swpThHx6FykJLiAuoyuSgb/52Uwc5WMv2N+73HmVYSVwf5a/8Cj5cXZ2ZtrGxEsa8l
	kNappb//sqXvySzaCBlOAIKcPFFqUXVy/Fz5PAoi+uXbqhdLuRdvWSFDZ2QAuJvvSLNs=
X-Gm-Gg: AYBFou1VFLEH0ISV2EH0pGSWclDJ45dtny5o+2cOUAlDrDfN5tK/bLeX93TT8PRD/03
	noWvtRQC7giAFwYSBm8v4+FrM1svo3yo2+Ka0W9ziUfCr6rlftJ16JoYJ/7e9ckuHSX5xDEW/oL
	D5H/C1EwuOdHJd23DjOEh8VMKGGmo5gE1FriwR/O6f44tuAjbSJfYluPuqrXp5T+R44X6I6a4rs
	qDa6avH+Hd+EcoGqhcaNZvtGel9oSimcjB9eB83E+YYi9IIgohu0eQvw7GugYSl6FiLwCdm1ZRy
	lDuloM4aQKK7BDCOySIr8PW9mmOuQXtBrVx5XfOWqUOnlLAheTdQtnCYR9I1J2qsth8Em83yEPe
	jQAsCmA5D2NF6OAOouC8GEG4JZGo58r/FxI1JPLqpxEdBQIhBdd+VDw==
X-Received: by 2002:a17:90b:1f91:b0:398:9bd5:4910 with SMTP id 98e67ed59e1d1-39dbc7205aemr8913968a91.23.1789253592021;
        Sat, 12 Sep 2026 15:53:12 -0700 (PDT)
X-Received: by 2002:a17:90b:1f91:b0:398:9bd5:4910 with SMTP id 98e67ed59e1d1-39dbc7205aemr8913953a91.23.1789253591626;
        Sat, 12 Sep 2026 15:53:11 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f5833fsm19741555eec.23.2026.09.12.15.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 15:53:10 -0700 (PDT)
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
Subject: [PATCH v8 6/8] usb: misc: qcom_eud: add role-based EUD control
Date: Sat, 12 Sep 2026 15:52:59 -0700
Message-Id: <20260912225301.3396556-7-elson.serrao@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDMzNCBTYWx0ZWRfX6auyUsb7bADC
 nJYP0acpM10vQaAbP/9QO3/ynIQ59XWAf5E5HYqEpCvxK49j3B0RinsNJifH+jJHs7KOYXAzfW9
 VQMNmF2oHkY83R0EcLiKJSm3CAFY25ANxURu7NkFps0A0D2G8gZXpW68mpzsg/a+vR98fz8smly
 g7qthDWBCbUo3cs4u/R/JN3FMvqNlDMgQ898O07o/NuWjA99hnzfxSgfrAlDqg1sYU1BvGEeonO
 FAPYpE8KmPOWFQEB+flJXOUDIzTiD7QPl6G2pNZgwfYSSeN8Ay0CVPjCoUlvmQdx4W0chxsaV6q
 UuiXfJY43aJl1Iz3uIgGlRIvHAAOmKwXSnDBXIE9aC7ysQAIJlFjFE/+hHyQGd1vboxxe8VEfDT
 QrjoS9LrheZl8d6UNbNU5lRIeg7pmvW4rjVaYd3UC6gSz+a95wBNDHweyiBjv5uULV8G1419UjD
 I0j3TseLuZGTtv+VxbA==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa5d7d8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=YKK-c5bBAu3nLoGgrlsA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDMzNCBTYWx0ZWRfX0pHEe6r1DBLt
 PNIFYe68gvFGBPIXmDFV2tcqEqrfoeIkdCEvkyP+2uD8xiGzZn/oqeLEut7+QPpPfv/rJvjAVNl
 116kVYEckXqeHIHhtBsZKq89RaiXWcU=
X-Proofpoint-GUID: RnrLb6OmDYySywjpCbygoOUr32iMq-0Q
X-Proofpoint-ORIG-GUID: RnrLb6OmDYySywjpCbygoOUr32iMq-0Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120334

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
 drivers/usb/misc/qcom_eud.c | 60 +++++++++++++++++++++++++++++++++++--
 1 file changed, 58 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index d280628370e4..353c45dfd328 100644
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
@@ -55,6 +56,8 @@ struct eud_chip {
 	struct device			*dev;
 	void __iomem			*base;
 	struct eud_path			*paths[EUD_MAX_PORTS];
+	/* serializes EUD control operations */
+	struct mutex			state_lock;
 	phys_addr_t			mode_mgr;
 	unsigned int			int_status;
 	int				irq;
@@ -156,17 +159,33 @@ static ssize_t enable_store(struct device *dev,
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
@@ -204,6 +223,8 @@ static ssize_t port_store(struct device *dev, struct device_attribute *attr,
 	if (port < 0)
 		return port;
 
+	guard(mutex)(&chip->state_lock);
+
 	/* Check if the corresponding path is available */
 	if (!chip->paths[port])
 		return -EOPNOTSUPP;
@@ -285,8 +306,13 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 	struct eud_path *path;
 	int ret;
 
+	guard(mutex)(&chip->state_lock);
+
 	path = chip->paths[chip->port_idx];
 
+	if (!chip->enabled || path->curr_role != USB_ROLE_DEVICE)
+		goto out;
+
 	if (chip->usb_attached)
 		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
 	else
@@ -294,6 +320,7 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 	if (ret)
 		dev_err(chip->dev, "failed to set role switch\n");
 
+out:
 	/* set and clear vbus_int_clr[0] to clear interrupt */
 	writel(BIT(0), chip->base + EUD_REG_VBUS_INT_CLR);
 	writel(0, chip->base + EUD_REG_VBUS_INT_CLR);
@@ -304,7 +331,30 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
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
@@ -434,6 +484,8 @@ static int eud_probe(struct platform_device *pdev)
 
 	chip->dev = &pdev->dev;
 
+	mutex_init(&chip->state_lock);
+
 	chip->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(chip->base))
 		return PTR_ERR(chip->base);
@@ -473,8 +525,12 @@ static void eud_remove(struct platform_device *pdev)
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

