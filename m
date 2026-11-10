Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794295004;
	b=DyYxsduzjfgsqTHU1dAR4zwbFneIacSMY21WrDWpIkN7AlXa+tpIrAeKNwEj/IXwYvWo
	 tTdV2HLs1AHgWpfs9fLpkGTZtO3P0jfK5JB/+j5qQfRLct8KeODQdToUHm5VfOWFFiTH4
	 ovu227U3F1ymlUVXBonhLrYeqd/usmHzfyl/u9Q6V1WBZiDDgGvfs3MXBtKiyjCOFtiR5
	 ptljA7YSBhd1JNYHC4R3iQCRcEc8C6x5LAqXJ8f5SWMyICa8QDg+1/wfVzqrryEz/I/qI
	 TrTtq/W8sxkuNTxHgudV4wydZGS84vmCmarw/AXj2t/xtWLoP0k1nptsFEVsQ86OPbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794295004;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=qpV0pz12woDsNWDVu0NdvtRfQjvhuOSbkbw+V52/SDk=;
	b=5p1L8agv6kzsAPXykovhJZV2bpozz8yDNUd8j1425/cJHEa5h+h2ugRo780cMLOi9dQI
	 AB0aPOGl2FSvCOnTgPP8Mx+xk3EUvTeA/6lMq+KIDZmQ/3fmV457XlE9iU2kyk1T6kSKW
	 83yotwzvbiYDiHCnF/BfIlJLWS0Uqm33rfGMgJ/F1n/ThnV1WJ3jRRQibLoiLTIWfaNIq
	 EF9ARttoagygAC6u9zlpdSd6e+hTxAxeLm+72rdli+1BUCfStU1JeP8/bRSLkCTMj5I4S
	 /wmtpbngKI1zhBZWnHB7GWNRSYAquChc6A6ueZuizJNx1Warf4WimK7Pp+AKhzi9Ykg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TSvCxfym;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EEF606A333;
	Tue, 10 Nov 2026 07:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TSvCxfym
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295004;
	b=z0HD/eRyvB+kYN+nSiyRqfZ5CR2nRYaYNh3n44E8YI797n/U1yAjuI6ZCUijr7gasaeB
	 YaTLzqnuz4HZGyZ+/JLgBfDKCvljVc4avbSIqUpPROmd/R00rBnv6Q1/w3uhy2VZ7jqfK
	 YGMLwCDEb00Bfms7NnCnf8xeE52e4f3urFJHqvsAdkTnb0fwOYolPcR82Bg2r2BdaFSo/
	 j8E1hWOjLn91hXnH+WoY4pPpSijxZSA1LjkujM8N8QNl4iRUlwgNXz3znKUKbWMhGeeNR
	 CfZfXtQOtuMVR+WyQXvwU64UYOeTbRiK0GFuMQh9S5ITZh8J5eTM9BacUApVHUUDm0w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295004;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=qpV0pz12woDsNWDVu0NdvtRfQjvhuOSbkbw+V52/SDk=;
	b=LC56TaLZUUzzxEdHiy9NX+TuBg3MQNP86aE2Or9w9XBxK3RpIwidsyhw/DQh8XjGku6P
	 nNs3PZEEkC9bk0zC7aDcQnmuTv9SSDmh4GWrZf7ijF+DXyaMRYrGLY22TiPydEfIGB+9+
	 8ceEHOkp7taLdGpTfFZ6qJyrgkYaf+bSlT43aKWuVGjTrSM/IqUZoqpKQcL9VzhLsGsQZ
	 r2Wuov1b7NEMwrwm8dujvFStUuqYcndFgoPbfKFmaeB7VQqwnfqXR1W+F/NZQ8esNTmkz
	 g0NAm6kwPyn2L2KUqcYAKpjAkfjFQDQVaPvNg79Cmr8JdqcZ5TeiXe6KVbpfULHjmog==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 903061F008A4;
	Tue, 10 Nov 2026 07:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295004;
	bh=qpV0pz12woDsNWDVu0NdvtRfQjvhuOSbkbw+V52/SDk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=TSvCxfymhRBWkpFI9HPE9tTwdqpZ1/vfoRTA1sIc8ClnALR6eD04BgKnecxjtSxG2
	 s/5Bm0c/Y9OfJfbtIME/Q2j3snWXcW/r7ltj7KzJSKzWRAx902r2Wcu4xxRmMg+7ug
	 IZBtgwby3OjJJUvU/1LiCuNBhcgP+Q4pJeZ9ISlaKgcqAR3w0eyw7GlF26D6uiJ8D9
	 cZXdbMEk8K6zlvfsPQU5QFX4ZP4jesS4teLZIvAwbZDwMWtanEYxhoxf3PpfLACHqt
	 WZg+PtdnVPLdsIi8cMDhV8aw8s07RQfkYCUsToNF6S3FGBCPCNpccbvFfidmUJLf/s
	 TSUwAkk8nilkw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1E23348964;
	Tue, 10 Nov 2026 07:16:43 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:16:43 +0000
Subject: [PATCH 1/2] usb: dwc3: Tell xhci-plat when the core lost its state
 on resume
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-dwc3-s2idle-v1-1-2ef4cc3f8130@gmail.com>
References: <20261110-dwc3-s2idle-v1-0-2ef4cc3f8130@gmail.com>
In-Reply-To: <20261110-dwc3-s2idle-v1-0-2ef4cc3f8130@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295002; l=4289;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=jNMsntzexEFNYfvDvDfuJ1KLAm+5KZPCiIvtScpupXE=;
 b=QO7vX1Lcl0MQX0fO7sobHVSzRC745nTiR5dLX9At9xSg2WDjOEM4+yKaJ2RVG8AoRUEBSUUlK
 irImipT+BBlDEFN6RazPmOo407/JtCyBE7WnpvmM6+TVM3bv01C+t0b
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

In host mode without wakeup, dwc3_suspend_common() tears the core down
with dwc3_core_exit() and dwc3_resume_common() initialises it again, so
the xHCI registers are back at their reset values when xhci-plat resumes.
xhci_resume() is not told about this: it writes the saved operational
registers back and asks the controller to restore its internal state
(USBCMD.CRS), which cannot work on a freshly reset core. It fails with
USBSTS.SRE, and xhci_resume() only then falls back to a full reset:

  xhci-hcd xhci-hcd.1.auto: xHC error in resume, USBSTS 0x401, Reinit

xhci-plat already has a way for the glue to report this:
xhci_plat_priv.power_lost, which cdns3 sets the same way. Set it from
dwc3_resume_common() whenever the core was re-initialised (and clear it
when it was kept running for wakeup), so xhci_resume() goes straight to
the reset and re-init path.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/usb/dwc3/core.c |  3 +++
 drivers/usb/dwc3/core.h |  3 +++
 drivers/usb/dwc3/host.c | 29 ++++++++++++++++++++++++++---
 3 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index fd5c2cd36c59..2b31f146e43f 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2639,8 +2639,10 @@ static int dwc3_resume_common(struct dwc3 *dwc, pm_message_t msg)
 			if (ret)
 				return ret;
 			dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_HOST, true);
+			dwc3_host_resume(dwc, true);
 			break;
 		}
+		dwc3_host_resume(dwc, false);
 		/* Restore GUSB2PHYCFG bits that were modified in suspend */
 		for (i = 0; i < dwc->num_usb2_ports; i++) {
 			reg = dwc3_readl(dwc, DWC3_GUSB2PHYCFG(i));
@@ -2672,6 +2674,7 @@ static int dwc3_resume_common(struct dwc3 *dwc, pm_message_t msg)
 		dwc3_otg_init(dwc);
 		if (dwc->current_otg_role == DWC3_OTG_ROLE_HOST) {
 			dwc3_otg_host_init(dwc);
+			dwc3_host_resume(dwc, true);
 		} else if (dwc->current_otg_role == DWC3_OTG_ROLE_DEVICE) {
 			dwc3_gadget_resume(dwc);
 		}
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index f3dabb37f806..862818e081af 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1677,11 +1677,14 @@ static inline void dwc3_pre_run_stop(struct dwc3 *dwc, bool is_on)
 #if IS_ENABLED(CONFIG_USB_DWC3_HOST) || IS_ENABLED(CONFIG_USB_DWC3_DUAL_ROLE)
 int dwc3_host_init(struct dwc3 *dwc);
 void dwc3_host_exit(struct dwc3 *dwc);
+void dwc3_host_resume(struct dwc3 *dwc, bool power_lost);
 #else
 static inline int dwc3_host_init(struct dwc3 *dwc)
 { return 0; }
 static inline void dwc3_host_exit(struct dwc3 *dwc)
 { }
+static inline void dwc3_host_resume(struct dwc3 *dwc, bool power_lost)
+{ }
 #endif
 
 #if IS_ENABLED(CONFIG_USB_DWC3_GADGET) || IS_ENABLED(CONFIG_USB_DWC3_DUAL_ROLE)
diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index c5674161b2b0..fb09b4f58414 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -14,9 +14,7 @@
 #include <linux/usb/hcd.h>
 #include <linux/bitfield.h>
 
-#include "../host/xhci-port.h"
-#include "../host/xhci-ext-caps.h"
-#include "../host/xhci-caps.h"
+#include "../host/xhci.h"
 #include "../host/xhci-plat.h"
 #include "core.h"
 
@@ -223,6 +221,31 @@ int dwc3_host_init(struct dwc3 *dwc)
 }
 EXPORT_SYMBOL_GPL(dwc3_host_init);
 
+/**
+ * dwc3_host_resume - tell xhci-plat whether the controller lost its state
+ * @dwc: pointer to our controller context structure
+ * @power_lost: true if the core was re-initialised during system resume
+ *
+ * When the core is torn down in system suspend (dwc3_core_exit()) and
+ * initialised again on resume, the xHCI registers are back at their reset
+ * values. xhci_resume() must then reset and re-initialise the host instead
+ * of trying to restore its saved register state with CRS, which fails
+ * (USBSTS.SRE) on a freshly reset controller.
+ */
+void dwc3_host_resume(struct dwc3 *dwc, bool power_lost)
+{
+	struct usb_hcd *hcd;
+
+	if (!dwc->xhci)
+		return;
+
+	hcd = platform_get_drvdata(dwc->xhci);
+	if (!hcd)
+		return;
+
+	hcd_to_xhci_priv(hcd)->power_lost = power_lost;
+}
+
 void dwc3_host_exit(struct dwc3 *dwc)
 {
 	if (dwc->sys_wakeup)

-- 
2.55.0


