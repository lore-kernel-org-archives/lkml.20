Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492917;
	b=iu/jS4zi2y0sG4heyOZy4vjufug3kDAxwhVrzgv4cs+tAWgSiSntvSWyT2GR8IM2G38Z
	 HFF9zzYE/GUoysYGHGv84gDTK2PegT3x7NZAdyN2ok//hnXJJQG7izpH6i5DeZE3nA7lH
	 Ui+dG6coY+WMulbhix+GEm7tVZVHxz4MIwepmHpo+eXQidc/jzUJLh8c+YKU4rpZaooP5
	 7dViDDjXplg2SycC91ZEaA6pIlKc/1V2osxZ74Sq3gF+q7YVVIu0FB/9H3XRLoTGmnRrU
	 PGA9F5wQ4ADY04VNQ/saSkMj93Vyoo3g9IxUBKprxzk2J8QJ8eiS6sqjRu3jLu9AG3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492917;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SdzKsKboJ1nKu6ffEUUVZbS50qlQdBB0ZRDwPBZAHCs=;
	b=isT3UCjE07uEhXMmfeox1gKnsxb5DO+zcqtua0Ib+J+teAt5IdC+Z70scqKoIw5PPo48
	 TBxfkrBCMb2j5nJuEYO2P5Y+/K9o/Q4A6J+1VLr06d8/gosyiv4IU7DLK9cwBmHSXkpyx
	 FBunVJZlyGEgNDRVM/x0ccy1Yk1aV6vzIBjE2HFZLyJol6NZDilmwLjrWQqJaQuyVvCAH
	 XpWfKf+rC9cff6OHlBHzcPABoYer4+jE9CbXKMzkNd98Ja76EXnBHs56qVpHGu212E9hA
	 65BzwsW3SN6oo6GGaoqjDX7xX9dCbpwITRTVLtRdaVCR0UC+sfaQjZHYQYpCr4TA5ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ywyxyWBO;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77331606A88C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:15:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77331606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ywyxyWBO
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e96502e447so35990555ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794492917; x=1795097717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SdzKsKboJ1nKu6ffEUUVZbS50qlQdBB0ZRDwPBZAHCs=;
        b=ywyxyWBO8MjWAs0MW22KgKnEtNv/PryWIWvRMxiqMsbuZXVaveYFgLspnmfT+gJ/Fx
         eFrxW08rt3WXAqQVC5qkdpz3III46fwBEO4dGINoX31arkCbDMBgzh8eeAqY54SDhrkg
         3ZxCMfJXfzBdMhtyjm+F9XVN/WV0X77PFz3yfuoJ5GTN7VgWlx+BHoCXu4c/KTBcIU7L
         Eof/QpdJFGCdNf5gREU/FQbCMuvpfBK97+w69I4gQVJFMJGQN3Geq69F5gULHTLGl8yY
         VKeNgggEwtbsusUjg5AcHaL4uV8UBAbFH/llpzCQ5K0g5vP4y4YkeaUVsXK2/CE+LHRX
         ikZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794492917; x=1795097717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SdzKsKboJ1nKu6ffEUUVZbS50qlQdBB0ZRDwPBZAHCs=;
        b=FlSYeL/qcfHG3BR2z9xOwqxNNgOqsGyCq9Ph+lZqLrJmKTwcunfesVyGrYIoWy3UFQ
         76s6alAtV2f/Q8glYAKfPzctjP+pBnX9PVhhxR9w2L31sjlzRpvAdhMeAGaOXD1SpTJP
         Xg3Oz0JZjcX+1Wx8SKaDYsBcx7ut1dNnE6grsq8/YG2MuB/PZjEEENmBAdxSa/ZKfsbW
         LC83VnBhSEEu1dFIku+qjuXRfPcvMteNyUooxXBXfV49Y5Q3Og4W4VXaFnkE5KTZtlEZ
         NByoABKxyct5fHqtEoPiC6HuaPC6YyQaLLUSu3j9iixPN3xRNSUtM8M2Niep1zKlDRzt
         +Psw==
X-Forwarded-Encrypted: i=1; AL+hErFk0aG1PIcLoZjHd7hwWWN65zGGj5nHaaLhcfnfgsd9C1cBipedAV9AO2S4ONtIVwnbO+Na91p/PprEolA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4YN7FFZI5KIyLPr4Cg46Pfgv6iPMb8WmU6ateQ0a7gvR+exmZ
	Pph/thWlsijItPzZCK06/MYPuTCDicGMXa1x6wypQgWxYXIf/eYhJVJQ
X-Gm-Gg: AYBFou2iRrOXkf3IzplV+XOEle+fBEsZxQ0lw/OY6v9P8oo17w2FEb8aUUkxEadqNhE
	Jc3+039EFPZYSi6x0rga6ls0ApVSUMf1UFufkqDBI3XRc0d0YZQDMVWk4Q7zP+hwooPkJoBrsoj
	dpZwqJ2iSqW8/2oCJQT26i4Nbr2narlORVg5Ww0eBGKNVexDjrthWfmIXdEQ2CaalmodbZPnENe
	X989tRQNhsEBtP7TPrGs5UpXfdU0Raqqy+fhxSVMgWe5sdFSzUUxFvaDL/kwZbxT7YFGCT5mcwK
	WsmcE2FLRrM6pq3Xl4R7jR7vj44B8H+MV8wvU7zqlzWf5+py/2hA431MiwGrwUok9VuXV/H7VdV
	54er/v4NO2m77P0RNIGz12lJPuZT5NicSloTuObQn8y1UJeIXIaczTNvV5IflwRh/vPcxeW1ZxZ
	xKncSo3CRM8g+pMqBThe7C1vEEM5to03DJRHzFPedTFMJJ76AuBmAwA9x0/qQ7kD3rXCSSVMWBz
	OtA0wu0uoDDrPfUqaz/xiCyAgq7m3VAWebgG1fW6kEhXcHkS+ImHrIVMoPURvb4bfYu36zF/xQg
	2tJ/InpObzWoDgF3qXHasMxFhfYNXC9ZABXRckNDBA==
X-Received: by 2002:a17:903:3bd0:b0:2dd:9b53:f9ba with SMTP id d9443c01a7336-2edd7454b33mr59399605ad.1.1794492916433;
        Thu, 12 Nov 2026 06:15:16 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([180.67.33.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d7eafbsm34612105ad.36.2026.11.12.06.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:15:15 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org
Cc: aiyengar1990@gmail.com,
	mathias.nyman@intel.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: dwc3: tell xHCI that it lost its state when the core is powered off
Date: Thu, 12 Nov 2026 23:15:11 +0900
Message-ID: <20261112141512.1840-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
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

dwc3_suspend_common() powers the core off for system suspend
(dwc3_core_exit()) in OTG mode (DWC3_GCTL_PRTCAP_OTG), and in host mode
when the controller may not wake the system or needs a full re-init. The
xHCI registers and the state saved with the Controller Save State
command are gone then, but nothing tells xhci-plat: xhci_resume() takes
the "state intact" path, writes the saved registers back and asks the
controller to restore its state (CRS).

xhci-plat has a flag for exactly this, power_lost (commit 668cc6bc1178
("usb: host: xhci-plat: allow upper layers to signal power loss"), used
by cdns3), but dwc3 never sets it.

On a Lenovo Y700 Gen 5 (TB323FU, SM8850; DWC3 + eUSB2 PHY) with a USB
2.0 hub, a USB 3 flash drive and a Billboard device attached, and USB
wakeup disabled, s2idle then broke the host controller on resume: either
the controller wrote to an address that was not mapped

  arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402,
    iova=0xd85e7c300, fsynr=0x3d0011, cbfrsynra=0x40, cb=13
  xhci-hcd xhci-hcd.2.auto: WARNING: Host System Error
  usb 1-1: hub failed to enable device, error -108

or its command ring would not stop

  xhci-hcd xhci-hcd.2.auto: Abort failed to stop command ring: -110
  xhci-hcd xhci-hcd.2.auto: xHCI host controller not responding, assume dead
  xhci-hcd xhci-hcd.2.auto: HC died; cleaning up
  usb 1-1: PM: **** DPM device timeout ****
  Kernel panic - not syncing: usb 1-1: unrecoverable failure

With wakeup enabled (the core stays powered) the same setup survived
every cycle.

Record that the core was powered off and pass this to xhci-plat as
power_lost from a resume_quirk, so that xhci_resume() resets the
controller and the devices are re-enumerated. Unlike a static
XHCI_RESET_ON_RESUME this only applies to the resumes that follow a
power-off; resumes with the core kept powered (host mode with wakeup
enabled) and runtime resume keep the restore path. Clear the flag once
xhci-plat has read it, so that a later system suspend that fails before
the dwc3 core is suspended does not reset the controller.

Fixes: c4a5153e87fd ("usb: dwc3: core: Power-off core/PHYs on system_suspend in host mode")
Fixes: f09cc79b4b33 ("usb: dwc3: add dual role support using OTG block")
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
v2:
- Also set the flag when the core is powered off in OTG mode with the
  host role active (Sashiko [1])
- Clear the flag once xhci-plat has read it (Sashiko [1]), instead of in
  the host branch that keeps the core powered
- Drop the comment above the resume quirk
- Add a Fixes tag for the OTG branch
- Rebased on next-20261111

Testing, 30 s RTC s2idle with wakeup disabled on the setup above:
without this change 1/1 cycles lost the controller; with this version
3/3 cycles reset the controller and re-enumerated all devices.
OTG mode (DWC3_GCTL_PRTCAP_OTG) is not tested; this board switches
roles through usb-role-switch and never uses it.

host.c now includes xhci.h for hcd_to_xhci_priv().

v1: https://lore.kernel.org/all/20260929130252.869-1-26rote@gmail.com/
RESEND: https://lore.kernel.org/all/20261112114053.412-1-26rote@gmail.com/
[1] https://lore.kernel.org/all/sashiko-outbox-211064@kernel.org/

 drivers/usb/dwc3/core.c |  3 +++
 drivers/usb/dwc3/core.h |  3 +++
 drivers/usb/dwc3/host.c | 15 ++++++++++++---
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 372737f47..1ddd860e1 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2572,6 +2572,7 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
 		if (!PMSG_IS_AUTO(msg) &&
 		    (!device_may_wakeup(dwc->dev) || dwc->needs_full_reinit)) {
 			dwc3_core_exit(dwc);
+			dwc->xhci_power_lost = 1;
 			break;
 		}
 
@@ -2608,6 +2609,8 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
 
 		dwc3_otg_exit(dwc);
 		dwc3_core_exit(dwc);
+		if (dwc->current_otg_role == DWC3_OTG_ROLE_HOST)
+			dwc->xhci_power_lost = 1;
 		break;
 	default:
 		/* do nothing */
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 267c922ca..4bc94bb07 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1185,6 +1185,8 @@ struct dwc3_glue_ops {
  * @suspended: set to track suspend event due to U3/L2.
  * @susphy_state: state of DWC3_GUSB2PHYCFG_SUSPHY + DWC3_GUSB3PIPECTL_SUSPHY
  *		  before PM suspend.
+ * @xhci_power_lost: the core was powered off for system suspend; xHCI
+ *		     must not try to restore its state on resume
  * @imod_interval: set the interrupt moderation interval in 250ns
  *			increments or 0 to disable.
  * @max_cfg_eps: current max number of IN eps used across all USB configs.
@@ -1440,6 +1442,7 @@ struct dwc3 {
 	unsigned		wakeup_configured:1;
 	unsigned		suspended:1;
 	unsigned		susphy_state:1;
+	unsigned		xhci_power_lost:1;
 
 	u16			imod_interval;
 
diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index c5674161b..0cb6e64d1 100644
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
 
@@ -78,7 +76,18 @@ static void dwc3_xhci_plat_start(struct usb_hcd *hcd)
 	dwc3_enable_susphy(dwc, true);
 }
 
+static int dwc3_xhci_resume_quirk(struct usb_hcd *hcd)
+{
+	struct dwc3 *dwc = dev_get_drvdata(hcd->self.controller->parent);
+
+	hcd_to_xhci_priv(hcd)->power_lost = dwc->xhci_power_lost;
+	dwc->xhci_power_lost = 0;
+
+	return 0;
+}
+
 static const struct xhci_plat_priv dwc3_xhci_plat_quirk = {
+	.resume_quirk = dwc3_xhci_resume_quirk,
 	.plat_start = dwc3_xhci_plat_start,
 };
 

base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
-- 
2.53.0

