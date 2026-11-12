Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794472557;
	b=nY2pkKVyOC16hCIG14sNQv8cPeC5++/4ols6RNqAXnn6BqPk3sigK/cFM+K/GF/WofHS
	 YjhUxVaMX4+grAKcWCOjW+vxyIAMmYp29snaJEU9Bg7LpoadVBFMf5yRfUkqfds4pK5nW
	 XYXiz47LTfOaBBo/y1aUV2GbS8yQV5KEBeWKw5Yk6rHN4vNAaYvpTAVA5LAoyomAv87gX
	 p78nlGjnfurNY1F7pSf5U9RWxzdQlbA86ALKLb2wFD8XeWGd3lNZ3m0URU01fQmwRMy2J
	 HGha2mOovAHsE0pWgBjoUrt/JHimB90odrzTw0oZAovIS39Y9iMfKBptHF+uLa/SWfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472557;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=o9Sb7j8unYocUYyfUbeIl2vU4wtbZrpzJhLkOGZjRmY=;
	b=tdDqZZniomVEgKvCxz2Pm9czTM2z6vSIPt7BYKQZ7IbkrOrRwOnC64LH+i4BEtndrAxy
	 grjzSE3qkstB4QSdmK9/9VUquHphUK9uwRHk9O5Sibt12wElAews7RkZA20vdwmCMZRwX
	 McvAyTBssvp+n42nR9/nnYo0hVP0I8mt/DTrmySbaBAH0U2mKepHBCGQqi8DjS8BOBy77
	 mP+SxSobQ91wGGniUWSwkRppo44CxLih75lYIWRVMwwWotvrnD+sVJVzG8WIb8JOldP2W
	 7HPNqLGXco/LaEHb6/2v9AjjA3SIOz17RseifdNd6ZC4nk6EV8gQvuFcoqSjPhCyYrQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bYzSwcK6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C66F606C836;
	Thu, 12 Nov 2026 08:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bYzSwcK6
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794472557;
	b=H6ma+6q5qaYRTPN1bQ3l+qFrPfgACDo/ILZ6OaNvHFvTRt9kK599euf7ZSKwAE2KIoLB
	 A24icgZSuilbuZT5xNPjjQKZ8i68QGkraXYROWHvKx0hPMilVgUqr6MDTfUvt7aLU4b4J
	 fPCZ5STkZAviMboBy1JO5fHTXZKrErbW9dnGPXiyuJ0RqQBRHaDIa7M8/NhT00XjTCVML
	 RmwSE7pJHuNca6OQu/HRdAZfcMoc4WMFf6bcHXWmvBiulqCP5Y8Hy5mKwFW1kUJZ6VAGp
	 +xhSnUBFselHF3P8e4Q47NPe/jbVQCZEoPP6DFm+3cut2AA5CM4/AuhP593aHrlls2w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794472557;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=o9Sb7j8unYocUYyfUbeIl2vU4wtbZrpzJhLkOGZjRmY=;
	b=fXWhPmal4AolzrXa+AMXONcwOW1lksh6ToqZXFcOGzFmQAxAO9xNCYbY2ZemkOTn6Hsp
	 nr2IiOdPVcUeEgTABDYxUPHUx4CD1kb0neYSroPZutnrTwd6GwRKzRwV3aXSGfDUGswUO
	 9x4Gs1Jgp4Ir6hdZxD0RXp+kQcC5xA6aFhjbF/dmhwEoUXOl5m77VSvwu90omh5ekYXyq
	 y8MEPHjDWQc+7Z09T5qkVSJdiasVYHOQt8LFcCZ4w8FogqvCx0m4vR/Ij4lAC82v2RRc1
	 HLU8BcScQ3oJm7krpAgC219OOdhscD6umMCf8nJUh02ZZVTbdWp1zxihgDfjE6+bjAA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BB5201F00A06;
	Thu, 12 Nov 2026 08:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794472556;
	bh=o9Sb7j8unYocUYyfUbeIl2vU4wtbZrpzJhLkOGZjRmY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=bYzSwcK6PfPirOFSoz4XSOX647eHePJSZSn9Ff0/KdIngYIQSHxzBk6woVGnBM/FB
	 YWTv1ejT6t0aNvY15rFAC2XHSZnrvqyJSk/4V0fevG9hXM6U/xOTUGBbjKB5+mhS4Q
	 WYbcJd81un5tcYIOe6RVrVvHOfrAakUznmmNh48WJ9bR5tq+7fOaIXxu+XZcF2xYp+
	 OkIsKphfTTcnq/SFI1f3DZwfTYeHerdAnBY2yFmN9UaQgkikCR5fcMGm2ENFlTl116
	 4JB38eVqVrmnY5x5fowr362WQ9FZnzscv974FRv0omEmjtrL5E068n5GiD+EBM90/k
	 9cwIJH7w3Q1Dg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3ED82493BE;
	Thu, 12 Nov 2026 08:35:55 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 08:35:55 +0000
Subject: [PATCH RFC 1/2] usb: dwc3: Let the glue keep the host bus
 suspended across suspend-to-idle
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
Message-Id: <20261112-dwc3-s2idle-optin-v1-1-842e3f8413d0@gmail.com>
References: <20261112-dwc3-s2idle-optin-v1-0-842e3f8413d0@gmail.com>
In-Reply-To: <20261112-dwc3-s2idle-optin-v1-0-842e3f8413d0@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Joonhoe Kim <26rote@gmail.com>, Vladyslav Tymoshchuk <tvlad744@gmail.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794472554; l=7514;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=GXZ6XCGRtnZ3mkCt6txb5zlLxRttrEmogA32LTQM6WQ=;
 b=MnPB2888GGLp8MeAl5mL2ZlPMYVRBJgpgv7aySIUB27BN1YAjsNTBOmVBqo6ncfyw40e9xeW9
 VyVxZSwg72mCsXUPGz26tO+ZZ7NWJfRZKo4rjTONRIqWARyZQX7Fkxc
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

In host mode, dwc3_suspend_common() tears the core down for system
suspend (dwc3_core_exit(): PHYs off, core reset) unless the controller
is a wakeup source. By then xhci-plat has already suspended the bus:
the root ports and every device behind them are in U3/suspend and
expect to keep their power session (Documentation/driver-api/usb/
persist.rst). Resetting the core ends all of them. On resume xhci-plat
finds a reset controller ("root hub lost power or was reset") and the
USB core has to reset-resume every device, which only works for devices
that come back within the 2 s that usb_port_resume() waits for a
connection.

Devices that are cut off in U3 do not necessarily come back that fast.
On an Orange Pi 5 (RK3588S) a SanDisk Extreme drive on the Type-A USB3
port only connects again ~3 s after resume, and a card reader behind a
USB3 hub loses VBUS when the hub is reset and needs ~2.35 s. Both are
disconnected and enumerated again on every resume, which kills a
filesystem mounted on them. With the bus kept suspended they resume
from U3 in milliseconds.

Whether the bus can be kept is a property of the platform, not of the
dwc3 core: in suspend-to-idle some glue drivers still assert resets or
switch off PHY supplies in their own suspend callbacks, some power
domains are switched off, and some platforms rely on the PHYs being
powered off to reach their low-power state (c4a5153e87fd ("usb: dwc3:
core: Power-off core/PHYs on system_suspend in host mode")). So make it
an opt-in: a glue driver whose platform keeps the controller, its PHYs
and its power domain powered across suspend-to-idle sets
keep_host_bus_in_s2idle in dwc3_properties, and only then does the core
keep the suspended bus in suspend-to-idle, as it does for wakeup. It
also marks the device as being on the awake path so that a power domain
with GENPD_FLAG_ACTIVE_WAKEUP stays on. Resume re-initialises the core
exactly when suspend tore it down, which xhci_power_lost now records.
Nothing changes for platforms that do not set the flag, nor for
suspend-to-RAM, hibernation and needs_full_reinit controllers.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/usb/dwc3/core.c | 41 +++++++++++++++++++++++++++++++++++++----
 drivers/usb/dwc3/core.h |  3 +++
 drivers/usb/dwc3/glue.h |  7 +++++++
 3 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index bc9ce8dce0c6..21746fc8624a 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -16,6 +16,7 @@
 #include <linux/spinlock.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/suspend.h>
 #include <linux/interrupt.h>
 #include <linux/ioport.h>
 #include <linux/io.h>
@@ -1694,6 +1695,9 @@ static void dwc3_get_software_properties(struct dwc3 *dwc,
 	if (properties->needs_full_reinit)
 		dwc->needs_full_reinit = true;
 
+	if (properties->keep_host_bus_in_s2idle)
+		dwc->keep_host_bus_in_s2idle = true;
+
 	dwc->gsbuscfg0_reqinfo = DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED;
 
 	if (properties->gsbuscfg0_reqinfo !=
@@ -2554,6 +2558,30 @@ static int dwc3_core_init_for_resume(struct dwc3 *dwc)
 	return ret;
 }
 
+/*
+ * In host mode, system suspend suspends the bus: xhci-plat puts the root ports
+ * and with them every attached device into U3/suspend, and the USB core
+ * expects them to keep that power session (see
+ * Documentation/driver-api/usb/persist.rst). Tearing the core down ends all of
+ * them: the devices then have to go through a reset-resume, and one that takes
+ * longer to come back than the USB core waits for is disconnected, e.g. with a
+ * mounted filesystem.
+ *
+ * The core is kept when it is a wakeup source, and in suspend-to-idle on
+ * platforms whose glue says that the controller, its PHYs and its power domain
+ * stay powered then (keep_host_bus_in_s2idle). Everywhere else it is torn down
+ * so the PHYs can be powered off.
+ */
+static bool dwc3_host_keep_core(struct dwc3 *dwc)
+{
+	if (dwc->needs_full_reinit)
+		return false;
+	if (device_may_wakeup(dwc->dev))
+		return true;
+	return dwc->keep_host_bus_in_s2idle &&
+	       pm_suspend_target_state == PM_SUSPEND_TO_IDLE;
+}
+
 static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
 {
 	u32 reg;
@@ -2584,14 +2612,20 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
 		dwc3_core_exit(dwc);
 		break;
 	case DWC3_GCTL_PRTCAP_HOST:
-		if (!PMSG_IS_AUTO(msg) &&
-		    (!device_may_wakeup(dwc->dev) || dwc->needs_full_reinit)) {
+		if (!PMSG_IS_AUTO(msg) && !dwc3_host_keep_core(dwc)) {
 			dwc3_core_exit(dwc);
 			dwc->xhci_power_lost = 1;
 			break;
 		}
 		dwc->xhci_power_lost = 0;
 
+		/*
+		 * The core and its PHYs stay powered to keep the suspended bus:
+		 * keep the power domain on as well.
+		 */
+		if (!PMSG_IS_AUTO(msg))
+			device_set_awake_path(dwc->dev);
+
 		/* Let controller to suspend HSPHY before PHY driver suspends */
 		if (dwc->dis_u2_susphy_quirk ||
 		    dwc->dis_enblslpm_quirk) {
@@ -2650,8 +2684,7 @@ static int dwc3_resume_common(struct dwc3 *dwc, pm_message_t msg)
 		dwc3_gadget_resume(dwc);
 		break;
 	case DWC3_GCTL_PRTCAP_HOST:
-		if (!PMSG_IS_AUTO(msg) &&
-		    (!device_may_wakeup(dwc->dev) || dwc->needs_full_reinit)) {
+		if (!PMSG_IS_AUTO(msg) && dwc->xhci_power_lost) {
 			ret = dwc3_core_init_for_resume(dwc);
 			if (ret)
 				return ret;
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 94408958e9a1..ee1afa0d106a 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1137,6 +1137,8 @@ struct dwc3_glue_ops {
  * @usb2_gadget_lpm_disable: set to disable usb2 lpm for gadget
  * @needs_full_reinit: set to indicate the core may lose power and need full
  *			initialization during system pm
+ * @keep_host_bus_in_s2idle: set if the platform keeps the controller powered
+ *			across suspend-to-idle, so the host bus stays suspended
  * @disable_scramble_quirk: set if we enable the disable scramble quirk
  * @u2exit_lfps_quirk: set if we enable u2exit lfps quirk
  * @u2ss_inp3_quirk: set if we enable P3 OK for U2/SS Inactive quirk
@@ -1407,6 +1409,7 @@ struct dwc3 {
 	unsigned		usb2_lpm_disable:1;
 	unsigned		usb2_gadget_lpm_disable:1;
 	unsigned		needs_full_reinit:1;
+	unsigned		keep_host_bus_in_s2idle:1;
 
 	unsigned		disable_scramble_quirk:1;
 	unsigned		u2exit_lfps_quirk:1;
diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
index d738e1739ae0..130c455d9c4e 100644
--- a/drivers/usb/dwc3/glue.h
+++ b/drivers/usb/dwc3/glue.h
@@ -14,10 +14,17 @@
  * @gsbuscfg0_reqinfo: Value to be programmed in the GSBUSCFG0.REQINFO field
  * @needs_full_reinit: indicate the controller may not remain power during system
  *			pm and need full initialization
+ * @keep_host_bus_in_s2idle: indicate the controller, its PHYs and its power
+ *			domain stay powered across suspend-to-idle when the core
+ *			keeps them on, so a suspended host bus can be kept
+ *			instead of being torn down. Set it only if the USB power
+ *			domain, if there is one, stays on in suspend-to-idle for
+ *			a device on the awake path (GENPD_FLAG_ACTIVE_WAKEUP)
  */
 struct dwc3_properties {
 	u32 gsbuscfg0_reqinfo;
 	unsigned needs_full_reinit:1;
+	unsigned keep_host_bus_in_s2idle:1;
 };
 
 #define DWC3_DEFAULT_PROPERTIES ((struct dwc3_properties){		\

-- 
2.55.0


