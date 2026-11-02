Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793656291;
	b=s4HM//Pgt6UeDkOZd4la9n/XaJPr71M34XB+Hd73Smg4Ru835wTMAT32Ski8i+cymGGS
	 ltG2Pny1lXN5NBbt+azrK503ShFcRO259zsLjP30b37ETcV+iEtqvXZR465dODJYXsVel
	 12X2m1k85L6QwyyePsSOuiSqfIIUcRXQEm3E/v3DmLq88XOStZ3V/jdJXf3n2595/0Y5n
	 txTacb4PSRQwkldJVIjzUpBd2+VGZdZpsvJu32821GkCEVEBm4ijs/Qle2lJqPhJohdMz
	 2hMJDKmtS01O8ZMlKwarYx78HjwXxfDSeGW8R8IaQFa+KgcUs6hqW+oDblzf+6x8U/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793656291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vos1HFIVF/NJ4IuY/YpKJRZFV6pO0sGvErN9/wY0MOo=;
	b=HU/JkdL4yix16iSij7g4I+3ZFfa3lsROfCbEadovPrLp4ZEA321LsE4FoAdbOeymrgfF
	 LZqzowmfl86PHOF3Tl3JICSC3tM3Mlty/AoNKTRAoAocWJc7ayatj5GWWUu1wuv7BoNzf
	 TkWG3o6NX+we6ypzvWvDDCKCk7FU1pUuITbaKzRvwNJgAiGhonJ5CT92rDRfw6tVpLlUS
	 l0AP5nlmq+4s/52FYSL8VR4LCfNBoQzIy7/Tr1TQ2nQXlW4sbHsvoBvxpSkCr28o8tPOZ
	 pP3CaDQ1IjL7ahO93Y9aA3e8hitmSMF8Echy9UA4QwiXU533INFDmsIcevBmjbE43Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IUavopT0;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD16606D803
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AD16606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IUavopT0
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a3c08d6928so4273755c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793656290; x=1794261090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vos1HFIVF/NJ4IuY/YpKJRZFV6pO0sGvErN9/wY0MOo=;
        b=IUavopT0x503NEsOkhGnGymHqDmmPgz27hNvqsdOtI3N+qGn00lRolYd2sM1+LHouW
         LZLQOS84vA9kz4rPtRgOOOOI4jUkWQfIMZGJ3Xb+772nHh17/AYesdGZGbmZ2hrGB0WJ
         Fy0zD24IQzvj41hMTSNZAhHnbbSUjcogehhw65h7/gN06u7Al1bCHUggNcXfGCqdkXbR
         JgQs+kfGCML/PHFGJacckGMA/KVWTdZiQ9xCiujNa5PwiGAd4YrbzmtZ5O/GB1rhkFRW
         FzYhatafrVYGu8X4SuHaVZJVDq1hCH6LP7cJg/eI26IJRBtzpJj6JCRXjUBuuO+dc2ZC
         WkQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793656290; x=1794261090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vos1HFIVF/NJ4IuY/YpKJRZFV6pO0sGvErN9/wY0MOo=;
        b=iYVamjOkg23j0BMHk6S0k+IcyYqO1OwM0Kpu36qr0fOv2gOF5vo7oBxU4IURxxVTcI
         VtJnbemqY6mjvxpsYidI9PdVnYm77vOzyEAhBSNqANUf0piFuKbxrlJTQB6SaAf8AYiT
         BeqcvJUC7kqcx5vQfQpn7WzWXF1Rva1DAqqNUAV8dW5oCHiAB0KCtakIk9E59Lyp38rz
         fz0mi0Mn9rwx2f84bp+9Su+BZtaz0haSnYGGreFQoy5KZzoJvuDQrncVo2Ydde/WNpEK
         xqbH93NvM0aqnZz443fJ/RCr2bV38n+Yew4VOcdzxmKAKio9Jug6QpLqpBkAj27ZmZ6b
         l4OQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+iD5d+7GTTYk2ENvVP+KZArHuBThtdshW7iHM4Tbrjw5fVunYB8Yv1nQmwazQrjP8+hUmsOjtjfmjxz0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdqLAAnxbXWfmFEVTSEpknoT3VtcTM6cJhrfUid1WdPcNoHuYb
	bEIyhKw4pxID9313SnG9AvCctz2pyaOemo/t/OWBkovPvtNE+oFeEK9Y
X-Gm-Gg: AYBFou0+f5S1GtH0CbCYO5T1FNVt7Gc3Uzs4jDj1/SS0Xvo0AbBoK8/pMwg0L0KDw7K
	gfDwbyRgplkXk+xtoKDGr63eY4Qi33mZb348qGxCAfurtnImP5aL6/SMhJ/km/zBMGiEyQJ6cBD
	oBeJUdMa/ulDF86kiBpK4vR7AANBikKhPtuinEh/O1OWuhwuBA2WVTNcOrNCJPCvZnvTe31SAVx
	9iZm5/PE5MFy5eVUJ5qsO8oeKH3RSigCyD4M6AMDNx+vWCw6fXUQ8Cz3P0PzOGRcYM3s6/JLy/j
	viAdW3N9Dr30vdauzyERHijBLPQvhcmp3a0TjUTNWphQP5WM8Om0XAWEXuFVwLoF6YaTIaJ9Y4u
	5hH0ULLKqDXnRF4TqQhHJl6HuvaU2qAGOdYP8M/LRbu9c4aCyD/hnrmoeyzvL7Tu6I2wotpfhsB
	XzKx4BxsXPuJJEVfXjO7Eyd1uszGKRUe55mslN5nSS+hrtyUfXZpVEuJORu8qaNFYrAIaiu0DZM
	0IJuJPOtnUG3dIw0uH1uxqWqcegci/ZVyABrxp4ngNypBPR3hi6wMN980uU2RXWyd+jR17n4Q3K
	ewcGzZD+82jIE8MwRQsrzrx0sMKH8pVJunDJgs9UMsssjQ==
X-Received: by 2002:a05:701a:ca8a:b0:19a:e0eb:6916 with SMTP id a92af1059eb24-1ac5de540bbmr18334909c88.42.1793656290215;
        Mon, 02 Nov 2026 13:51:30 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm54710712eec.16.2026.11.02.13.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 13:51:29 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org
Cc: abelvesa@kernel.org,
	wesley.cheng@oss.qualcomm.com,
	krishna.kurapati@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	val@packett.cool,
	balaji.kalkonda@oss.qualcomm.com,
	tvlad744@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] usb: dwc3: qcom: Use the UTMI clock as PIPE clock in DisplayPort-only modes
Date: Tue,  3 Nov 2026 06:51:19 +0900
Message-ID: <20261102215121.738-3-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261102215121.738-1-26rote@gmail.com>
References: <20261102215121.738-1-26rote@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With DisplayPort pin assignment C or E the QMP USB3-DP combo PHY gives
all four lanes to DisplayPort and powers its USB PCS down, while the
controller can still run USB 2.0, e.g. for the hub of a USB-C monitor.
Keeping the pipe clock branch enabled, as commit f546912bcac6 ("phy:
qcom: qmp-combo: Move pipe_clk on/off to common") does, is not enough on
Kaanapali: the next xHCI reset in this mode times out ("Host halt
failed, -110") and USB stops working until the cable is replugged.

Register the glue as a Type-C mode switch when the node has the
"mode-switch" property, and select the UTMI clock as PIPE clock in
DP-only modes, as "qcom,select-utmi-as-pipe-clk" does statically.
typec_mux_set() calls the switches in connector endpoint order, and the
controller's HS endpoint precedes the PHY's SS endpoint, so the
controller switches before the PHY powers its USB side down.

Switch back to the PIPE clock only on a role change after the mux has
gone from the safe state to a USB state: on unplug the PHY stays in
DP-only mode while DisplayPort is powered, and the role and mux
notifications come from different pmic_glink services in no fixed
order.

Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 94 +++++++++++++++++++++++++++++++++---
 1 file changed, 86 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index ac68b4218b56..4919deae682d 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -19,6 +19,9 @@
 #include <linux/iopoll.h>
 #include <linux/usb/hcd.h>
 #include <linux/usb.h>
+#include <linux/usb/typec_altmode.h>
+#include <linux/usb/typec_dp.h>
+#include <linux/usb/typec_mux.h>
 #include "core.h"
 #include "glue.h"
 
@@ -85,6 +88,13 @@ struct dwc3_qcom {
 	struct icc_path		*icc_path_apps;
 
 	enum usb_role		current_role;
+	bool			ignore_pipe_clk;
+	bool			dp_active;
+	bool			dp_only;
+	bool			utmi_pipe_clk;
+	/* protects dp_active, dp_only and utmi_pipe_clk */
+	struct mutex		pipe_clk_lock;
+	struct typec_mux_dev	*mux;
 };
 
 #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
@@ -419,21 +429,77 @@ static irqreturn_t qcom_dwc3_resume_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static void dwc3_qcom_select_utmi_clk(struct dwc3_qcom *qcom)
+static void dwc3_qcom_select_utmi_clk(struct dwc3_qcom *qcom, bool utmi)
 {
-	/* Configure dwc3 to use UTMI clock as PIPE clock not present */
 	dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
 			  PIPE_UTMI_CLK_DIS);
 
 	usleep_range(100, 1000);
 
-	dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
-			  PIPE_UTMI_CLK_SEL | PIPE3_PHYSTATUS_SW);
+	if (utmi)
+		dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
+				  PIPE_UTMI_CLK_SEL | PIPE3_PHYSTATUS_SW);
+	else
+		dwc3_qcom_clrbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
+				  PIPE_UTMI_CLK_SEL | PIPE3_PHYSTATUS_SW);
 
 	usleep_range(100, 1000);
 
 	dwc3_qcom_clrbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
 			  PIPE_UTMI_CLK_DIS);
+
+	qcom->utmi_pipe_clk = utmi;
+}
+
+static void dwc3_qcom_update_pipe_clk(struct dwc3_qcom *qcom)
+{
+	if (qcom->ignore_pipe_clk || qcom->dp_only == qcom->utmi_pipe_clk)
+		return;
+
+	dwc3_qcom_select_utmi_clk(qcom, qcom->dp_only);
+}
+
+static int dwc3_qcom_mux_set(struct typec_mux_dev *mux,
+			     struct typec_mux_state *state)
+{
+	struct dwc3_qcom *qcom = typec_mux_get_drvdata(mux);
+
+	guard(mutex)(&qcom->pipe_clk_lock);
+
+	if (state->alt && state->alt->svid == USB_TYPEC_DP_SID) {
+		qcom->dp_active = true;
+		qcom->dp_only = state->mode == TYPEC_DP_STATE_C ||
+				state->mode == TYPEC_DP_STATE_E;
+	} else if (state->mode == TYPEC_STATE_SAFE) {
+		qcom->dp_active = false;
+	} else if (!qcom->dp_active) {
+		qcom->dp_only = false;
+	}
+
+	/* The PHY stops the PIPE clock right after this in DP-only mode */
+	if (!qcom->dp_only || pm_runtime_resume_and_get(qcom->dev))
+		return 0;
+
+	dwc3_qcom_update_pipe_clk(qcom);
+	pm_runtime_put_autosuspend(qcom->dev);
+
+	return 0;
+}
+
+static int dwc3_qcom_mux_register(struct dwc3_qcom *qcom)
+{
+	struct typec_mux_desc desc = {};
+
+	if (!device_property_present(qcom->dev, "mode-switch"))
+		return 0;
+
+	desc.drvdata = qcom;
+	desc.fwnode = dev_fwnode(qcom->dev);
+	desc.set = dwc3_qcom_mux_set;
+
+	qcom->mux = typec_mux_register(qcom->dev, &desc);
+
+	return PTR_ERR_OR_ZERO(qcom->mux);
 }
 
 static int dwc3_qcom_request_irq(struct dwc3_qcom *qcom, int irq,
@@ -570,6 +636,10 @@ static void dwc3_qcom_set_role_notifier(struct dwc3 *dwc, enum usb_role next_rol
 		return;
 	}
 
+	mutex_lock(&qcom->pipe_clk_lock);
+	dwc3_qcom_update_pipe_clk(qcom);
+	mutex_unlock(&qcom->pipe_clk_lock);
+
 	if (qcom->current_role == USB_ROLE_DEVICE)
 		dwc3_qcom_vbus_override_enable(qcom, false);
 	else if (qcom->current_role != USB_ROLE_DEVICE)
@@ -615,7 +685,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	struct resource		res;
 	struct resource		*r;
 	int			ret;
-	bool			ignore_pipe_clk;
 	bool			wakeup_source;
 
 	qcom = devm_kzalloc(&pdev->dev, sizeof(*qcom), GFP_KERNEL);
@@ -678,10 +747,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	 * Disable pipe_clk requirement if specified. Used when dwc3
 	 * operates without SSPHY and only HS/FS/LS modes are supported.
 	 */
-	ignore_pipe_clk = device_property_read_bool(dev,
+	qcom->ignore_pipe_clk = device_property_read_bool(dev,
 				"qcom,select-utmi-as-pipe-clk");
-	if (ignore_pipe_clk)
-		dwc3_qcom_select_utmi_clk(qcom);
+	if (qcom->ignore_pipe_clk)
+		dwc3_qcom_select_utmi_clk(qcom, true);
 
 	qcom->mode = usb_get_dr_mode(dev);
 
@@ -698,6 +767,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 			qcom->current_role = USB_ROLE_DEVICE;
 	}
 
+	mutex_init(&qcom->pipe_clk_lock);
 	qcom->dwc.glue_ops = &dwc3_qcom_glue_ops;
 
 	qcom->dwc.dev = dev;
@@ -715,6 +785,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (ret)
 		goto remove_core;
 
+	ret = dwc3_qcom_mux_register(qcom);
+	if (ret)
+		goto interconnect_exit;
+
 	wakeup_source = of_property_read_bool(dev->of_node, "wakeup-source");
 	device_init_wakeup(&pdev->dev, wakeup_source);
 
@@ -722,6 +796,8 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 
 	return 0;
 
+interconnect_exit:
+	dwc3_qcom_interconnect_exit(qcom);
 remove_core:
 	dwc3_core_remove(&qcom->dwc);
 clk_disable:
@@ -738,6 +814,8 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
 	if (pm_runtime_resume_and_get(qcom->dev) < 0)
 		return;
 
+	if (qcom->mux)
+		typec_mux_unregister(qcom->mux);
 	dwc3_core_remove(&qcom->dwc);
 	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
 	dwc3_qcom_interconnect_exit(qcom);
-- 
2.43.0

