Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794376617;
	b=1JtOl7U7U8kizSbBfl5zdZHvT6DmimYlmQSaLk07cPsnqQmuiLB5bx2AJ+eXemU6XBw4
	 QzYFDcQJ0Pac1y5LoBsG+ZnkZvKRHBW6FOMRwP7gKnV7IZEDFVOcn0UHB5x52r1/PPXxU
	 G64o11hzyCJexP9n+OTmu7yjIOaHzDLPW2s0kJDoS8+YZqHEWq+avRSlS09FzCpaNjp97
	 Tn580yHgAlhhmlsZvhNW+ea1APoWfq5QANwj1kzVLFeJpSOh1pYRqz0qVcduow7F5MWBr
	 B3x8VUlk8DPe5CCif2o75uv/m45PWyw/czIhpGtcoemqfiMU4nKfJROM4AiMhdkEOsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794376617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wgLXBfK3mriIsnjckvH1/2Owg0ftKnP2XxQGVwgqOa8=;
	b=ILIc0OA634yp6R7L2gxk9v2lhsMJWCdnmI/JWYYUoitZvgqfGKMfZFrePJiow3vzPcz0
	 M+gygV793H0X17tMbiLWLQpjphmPUhOkVirCsF8q74q9TjgjTMLMw6zelNWVedIRyAWaf
	 Jzbs1d+xXj+mhpGeCvfiimXamWeqO6Lwv5TeyIywOgsUgnp7Ja1Egnrnyu5j6r+fhNW2D
	 K1SysJNa9zT9uoQ5qPn9rU3cICjv4sfXp0ZhoimksFe+uwb+Mjgj2UXzSVTssXzg2kflD
	 fxS6RCYxTf/5F8q0+mlsdYGacTvFnm0gF4QsNSSoRZO9LHdcW9pWP41KFkRJVOIBfIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s7p6LXoq;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3824606A337
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:56:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3824606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s7p6LXoq
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso1590102a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794376616; x=1794981416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wgLXBfK3mriIsnjckvH1/2Owg0ftKnP2XxQGVwgqOa8=;
        b=s7p6LXoqe/ThZjIzTrULci1tFmURf2QJ1F7Cp2DPz1gy+h8ZzDQ6Izg0XEhHuQF85d
         dwqlQk9IMzuBM3/2x4toZSZLLPeL3wJcc52eO3ysRO1hca/h5s021ARPuYi+2Lii5R2T
         0b5ASTJgZfcwnvHChMc59AnHlHpFGJFz28aWQe1rsM37I9Gn0YKitqLY27VA4ra13CN5
         nagI4T4/S12xcHXGGFgGDYeevX66DtGxGtsLIKT18ljzzMbXsP2H6LP9W1KlWKTOJs5Q
         sVbtR4/tVJWqmtRyR9EGH/dKeHgX0K4uLaMjtm4M+cynlXs268kCZ4BBh+z15CDl7zZ2
         DBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794376616; x=1794981416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wgLXBfK3mriIsnjckvH1/2Owg0ftKnP2XxQGVwgqOa8=;
        b=Iohj12HK943gq34d5o6emJ8rE1B3jy/kbxWeEgvAPwBKCFdnfQcRCvZmFY9RqbpFvl
         tSDXJc3Wl9ydve3UOzKJCYe7LfXL4HGyH7evBh+3s0iraUU1Wk8ppiOP3zpL4PnMiNmv
         gJTrSfv2u5i/bTin4F5E6EP8kKYk3yLRMH4skaNUvQU4CHuZHp2m0x5xX3KFMV5LRlb4
         nT/gksNH9KAg56SlGAAFwU8WTMESFoz1TN1wUkrCKUWdaL8yPcHxqSd487Bnj1M/0oAq
         F1TB3GTS6w/QmZifIJa1wBKo8K0ylsG94Qj9xu/nkmzt/fHEIFdauloJC4ZTcrBJfWC0
         LS7A==
X-Forwarded-Encrypted: i=1; AL+hErEd3s4l4C3tLwv3wQD4H6b1qgCMYYKyuSSKXI8Vvq7XHkOEVAUQu3WAxQAGThO2SiHvQcZxmYoluaHkQlo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5bgWO+UP7cSTj6qzi8PvyyoJMswd2LytU80Ycg5oQm8Y5FR6o
	B3pRUIFwZri/+Pkua3quru4U6IeW/LrKVODD/q4Zfj/n6cvaIxtlTmZe/qLJPEkQ
X-Gm-Gg: AYBFou0ukq78KhTKHiTNNnq6e+SS1I55oL/4Ihffexna82mm/DpZp0aZAjjUikxCjKt
	KENg8wKeLiWNJr0NVVJ46cw6GKKE3nLOqusXZaoqcIh65bNYC6XPGcf0dEyDGm3uRLgze+BTBAZ
	diFlpaqDgV3E6WrqCdgTFZYnjbZRbQYL/q1DQf6b68sSFpORE5STd7VkViirWHqlo5uidtSTqFc
	dg+Mn95EGI6+oo5DuLAQDd5kFnPlAQrrPlTB1yEI8nB9gCk75URPDHDL+fulRexbIR+aJMHVJgd
	MqODzfoHT1XSefmjueLt9rx5loObGXqxNr4h0ILo+7VosPAaybw+w3R2TM7GggtmmmZiFAgLQRE
	eICnPchAeRs8vjB1VfVHSSc8HorkNmxzUBp16rstRTeCPvltXMp/+cgs/T6nLuS8LagjiMXAKXI
	I9OOM18bwocnRlr0g+I2xNug1iioEuniPgt4S+unnf9wK2YzFDzul3SeJV4sEM0w8cMvr2vp6Xq
	kn93ilFFzKDgGQBTQJK0DlgYd3V7EAuO6UxAU2ELCDzjNwoVH0qvXlZFb2k3g3cqWPW6Hfq+yOL
	9F8rGkHwyO2q8pZjqU2D6a0zNLo=
X-Received: by 2002:a17:90b:518b:b0:3b0:e388:d9da with SMTP id 98e67ed59e1d1-3b182f28620mr1651187a91.29.1794376616150;
        Tue, 10 Nov 2026 21:56:56 -0800 (PST)
Received: from localhost ([2001:19f0:8000:3bef:5400:6ff:fef9:667])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1846d5684sm744933a91.2.2026.11.10.21.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 21:56:55 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Felipe Balbi <balbi@ti.com>,
	Paul Zimmerman <paulz@synopsys.com>,
	Dinh Nguyen <dinguyen@opensource.altera.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 2/3] usb: dwc2: drd: Sync the generic PHY mode with role requests
Date: Wed, 11 Nov 2026 13:56:17 +0800
Message-ID: <20261111055628.183891-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111055628.183891-1-inochiama@gmail.com>
References: <20261111055628.183891-1-inochiama@gmail.com>
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

The USB DRD does not reply on a OTG phy, which means the controller
should not reply on the switch behavior from PHY. Instead, it should
sync the phy state to avoid a brolen role.

Set the generic PHY mode after resolving the default role and before
updating the controller. And disable the controller clock if there
is a failure and it is disabled.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/usb/dwc2/core.h     |  2 +-
 drivers/usb/dwc2/drd.c      | 46 +++++++++++++++++++++++++++++--------
 drivers/usb/dwc2/platform.c |  4 +++-
 3 files changed, 41 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 015a5fb7842d..298b418e6859 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -1400,7 +1400,7 @@ static inline int dwc2_is_device_mode(struct dwc2_hsotg *hsotg)
 
 int dwc2_drd_init(struct dwc2_hsotg *hsotg);
 void dwc2_drd_suspend(struct dwc2_hsotg *hsotg);
-void dwc2_drd_resume(struct dwc2_hsotg *hsotg);
+int dwc2_drd_resume(struct dwc2_hsotg *hsotg);
 void dwc2_drd_exit(struct dwc2_hsotg *hsotg);
 
 /*
diff --git a/drivers/usb/dwc2/drd.c b/drivers/usb/dwc2/drd.c
index 1ad8fa3f862a..3dc194657e82 100644
--- a/drivers/usb/dwc2/drd.c
+++ b/drivers/usb/dwc2/drd.c
@@ -9,6 +9,7 @@
 
 #include <linux/clk.h>
 #include <linux/iopoll.h>
+#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/usb/role.h>
 #include "core.h"
@@ -88,6 +89,7 @@ static int dwc2_drd_role_sw_set(struct usb_role_switch *sw, enum usb_role role)
 	struct dwc2_hsotg *hsotg = usb_role_switch_get_drvdata(sw);
 	unsigned long flags;
 	int already = 0;
+	int ret = 0;
 
 	/* Skip session not in line with dr_mode */
 	if ((role == USB_ROLE_DEVICE && hsotg->dr_mode == USB_DR_MODE_HOST) ||
@@ -111,14 +113,11 @@ static int dwc2_drd_role_sw_set(struct usb_role_switch *sw, enum usb_role role)
 	 * mode and sessions. It is the case if cable is plugged at boot.
 	 */
 	if (!hsotg->ll_hw_enabled && hsotg->clk) {
-		int ret = clk_prepare_enable(hsotg->clk);
-
+		ret = clk_prepare_enable(hsotg->clk);
 		if (ret)
 			return ret;
 	}
 
-	spin_lock_irqsave(&hsotg->lock, flags);
-
 	if (role == USB_ROLE_NONE) {
 		/* default operation mode when usb role is USB_ROLE_NONE */
 		if (hsotg->role_sw_default_mode == USB_DR_MODE_HOST)
@@ -127,6 +126,13 @@ static int dwc2_drd_role_sw_set(struct usb_role_switch *sw, enum usb_role role)
 			role = USB_ROLE_DEVICE;
 	}
 
+	ret = phy_set_mode(hsotg->phy, role == USB_ROLE_HOST ?
+				PHY_MODE_USB_HOST : PHY_MODE_USB_DEVICE);
+	if (ret)
+		goto out_clk;
+
+	spin_lock_irqsave(&hsotg->lock, flags);
+
 	if ((IS_ENABLED(CONFIG_USB_DWC2_PERIPHERAL) ||
 	     IS_ENABLED(CONFIG_USB_DWC2_DUAL_ROLE)) &&
 	     dwc2_is_device_mode(hsotg) &&
@@ -160,26 +166,40 @@ static int dwc2_drd_role_sw_set(struct usb_role_switch *sw, enum usb_role role)
 		/* This will raise a Connector ID Status Change Interrupt */
 		dwc2_force_mode(hsotg, role == USB_ROLE_HOST);
 
-	if (!hsotg->ll_hw_enabled && hsotg->clk)
-		clk_disable_unprepare(hsotg->clk);
-
 	dev_dbg(hsotg->dev, "%s-session valid\n",
 		role == USB_ROLE_NONE ? "No" :
 		role == USB_ROLE_HOST ? "A" : "B");
 
-	return 0;
+out_clk:
+	if (!hsotg->ll_hw_enabled && hsotg->clk)
+		clk_disable_unprepare(hsotg->clk);
+
+	return ret;
 }
 
 int dwc2_drd_init(struct dwc2_hsotg *hsotg)
 {
 	struct usb_role_switch_desc role_sw_desc = {0};
 	struct usb_role_switch *role_sw;
+	bool is_host;
 	int ret;
 
 	if (!device_property_read_bool(hsotg->dev, "usb-role-switch"))
 		return 0;
 
 	hsotg->role_sw_default_mode = usb_get_role_switch_default_mode(hsotg->dev);
+
+	if (hsotg->role_sw_default_mode != USB_DR_MODE_UNKNOWN)
+		is_host = hsotg->role_sw_default_mode == USB_DR_MODE_HOST;
+	else
+		is_host = hsotg->dr_mode == USB_DR_MODE_HOST;
+
+	ret = phy_set_mode(hsotg->phy,
+			   is_host ? PHY_MODE_USB_HOST : PHY_MODE_USB_DEVICE);
+	if (ret)
+		return dev_err_probe(hsotg->dev, ret,
+				     "failed to set default PHY mode\n");
+
 	role_sw_desc.driver_data = hsotg;
 	role_sw_desc.fwnode = dev_fwnode(hsotg->dev);
 	role_sw_desc.set = dwc2_drd_role_sw_set;
@@ -214,10 +234,11 @@ void dwc2_drd_suspend(struct dwc2_hsotg *hsotg)
 	}
 }
 
-void dwc2_drd_resume(struct dwc2_hsotg *hsotg)
+int dwc2_drd_resume(struct dwc2_hsotg *hsotg)
 {
 	u32 gintsts, gintmsk;
 	enum usb_role role;
+	int ret;
 
 	if (hsotg->role_sw) {
 		/* get last known role (as the get ops isn't implemented by this driver) */
@@ -230,6 +251,11 @@ void dwc2_drd_resume(struct dwc2_hsotg *hsotg)
 				role = USB_ROLE_DEVICE;
 		}
 
+		ret = phy_set_mode(hsotg->phy, role == USB_ROLE_HOST ?
+				   PHY_MODE_USB_HOST : PHY_MODE_USB_DEVICE);
+		if (ret)
+			return ret;
+
 		/* restore last role that may have been lost */
 		if (role == USB_ROLE_HOST)
 			dwc2_ovr_avalid(hsotg, true);
@@ -250,6 +276,8 @@ void dwc2_drd_resume(struct dwc2_hsotg *hsotg)
 		gintmsk |= GINTSTS_CONIDSTSCHNG;
 		dwc2_writel(hsotg, gintmsk, GINTMSK);
 	}
+
+	return 0;
 }
 
 void dwc2_drd_exit(struct dwc2_hsotg *hsotg)
diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index ef0d73077034..ab39d6b36b19 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -783,7 +783,9 @@ static int __maybe_unused dwc2_resume(struct device *dev)
 		/* Need to restore FORCEDEVMODE/FORCEHOSTMODE */
 		dwc2_force_dr_mode(dwc2);
 	} else {
-		dwc2_drd_resume(dwc2);
+		ret = dwc2_drd_resume(dwc2);
+		if (ret)
+			return ret;
 	}
 
 	if (dwc2_is_device_mode(dwc2))
-- 
2.56.0

