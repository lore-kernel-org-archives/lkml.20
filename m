Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794295005;
	b=1Gmri5ZIyPy86BCIB2bCO29R0v25NwbAxBKSDw7k1nBUuZSrL5mR55vZ5OxM8zQ+ZCg/
	 pqI5sQ9hOrkh7NX2fV7Dn3d0/csM5uefZAKshOXa7UwuqnBbGadErChkZUK95zplLdU1J
	 UD5x4RJNYts8x+p2ZaNQ2gvPbOLxfJtvtIuM5Ld/ts7ahmbDmLSr1sVqy0OxeoYxpUYc8
	 rs7xlsfm6gGVsBroegrPZrHEeFZi2vpHMS3UAJIKbLOUqMgxLz8xnbwPInqRdbqDLszSt
	 aBajD+Offpfhr6inCdKV5CyTEvk7X0c/jiSyBTf+1U5TkgDWj2kgEQ/t593BMJbUSEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794295005;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=yXxNrCHfwjr8WEY0gNkW5D7EqpDExicWd9HhJ7Cqeos=;
	b=ArqxGfsClpg1adSbOkkKGrimC6V4Iyc6yQ0cAwFwP1bFtYDROU8f/V+Os4KC3Op7bexY
	 vTscR+OtcFqILEzPzOEPyUf3NRWixVe0n8zDldtlGowxtG/NasKQaRyQqjM6Wzf5YaVyQ
	 YYx8joyCy4kIb4wsfO8/g8y7Ru7zKMJWEltZ6jLKg98tNShF70fk1Ehdw+P7ecz8LLPtT
	 TVE77jE04xEZSvuOf/hD7E2E0dQjmmmeyXAQzNlxST8iSuQpIb6tvj6PacZSF4kEIUT6u
	 8UU0YSDhwviGKadFrIw9cuG0GEJBQyzDUoeLooG715oSIiBQ9qxuF1bdctRVrwaccnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="neJ6k+/8";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF35D606A33A;
	Tue, 10 Nov 2026 07:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=neJ6k+/8
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295004;
	b=OjRwbqq4/wW51KClTJ43z6xqYYs/B3+Tl52nio2mwyLvrGM0QZgPi+DgFqtX5UP6ZVIF
	 ibGZC7+rDfVLSIkIgzwsrqg1MQJDRX1vEUdoQeDNiUTsDKV9YjDdlQG8CNEugIEIdaKMh
	 pW0IvlFl28yW2vsHxfqQXXGy+Mk5SHqbFg30NmgCqYoC7Al9R8xq88F14Dmj418tWMqZk
	 1s7qGVjp0G6rQewjQGdZPzqBTs5Aa37LMmCcqyFsbx+zBuPK/9a1bprlmnxAn/6VQ2dwz
	 Mt6xLqbIctZkIV7gFepnnr2ap5NaQ04+8VoBdEeCFlDF6+hW4nd/L+xznZcqTBBqBMQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295004;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=yXxNrCHfwjr8WEY0gNkW5D7EqpDExicWd9HhJ7Cqeos=;
	b=cZ9j1vvfYhvQe1ecSb9NjxZxo7EjCFHDLxCxrvbRFtzAEq/yOI7443t1Qq4P3P6jmHTO
	 3A5+ioZ0urAkRD7sXry5yTWHYVRyEtvg9wW1hhtN0SDvH2jpuZ0Xj/yXkQBL12C3YD2FG
	 DmGvN177qPl11JlSVkJCT+EBtJxCrMwNFt4O6CoMs3DKvxOCbmT+xRR5ZGu7cwaf6k/sG
	 enFFcLFImWmGS4NHGbiwd7Ml+HZz2kle66nGEbp0xK5REzlPcEC9S+gHopXnLJSzQp4vU
	 JzbZNYOICN9FH3TiV+rtSnZjQD7nyq/YqcFKfj+yr2PZM+b3OWgpGLJ986TiXRYCoeA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A8B8D1F008A5;
	Tue, 10 Nov 2026 07:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295004;
	bh=yXxNrCHfwjr8WEY0gNkW5D7EqpDExicWd9HhJ7Cqeos=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=neJ6k+/8iBd+hlnJHV/r6slVBWpUH/eq9Nd3bxZQl03t77chm0lfqoL5q8XePoaxR
	 vkAhEW0SZvNqS2GK8O9yVjQww3X0Di0GqEnkQRloSIvITWyOqAxGRjOQWpAhcj+nI/
	 Fs9McQWVuzuaNMp95I9oK+iADa3MWR9fQTdad1UEGgfqGiTTxykMJ31BYh2lyYmYHF
	 NShnRnSlj8S55OmMIUdA0l8xMf3TRKzEpFTYAvTDwr1CCH0LIch4+Wp6jxsM/gVfUo
	 ofT93hguOmqlL/xvC54kk31kxqTTI3PsPkd0lEP/huUUqWTBK1lO1qaloEP51DLBLm
	 rrOQR2vjERIiw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 32C4F48968;
	Tue, 10 Nov 2026 07:16:43 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:16:44 +0000
Subject: [PATCH 2/2] usb: dwc3: Keep the host bus suspended, not torn down,
 across suspend-to-idle
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
Message-Id: <20261110-dwc3-s2idle-v1-2-2ef4cc3f8130@gmail.com>
References: <20261110-dwc3-s2idle-v1-0-2ef4cc3f8130@gmail.com>
In-Reply-To: <20261110-dwc3-s2idle-v1-0-2ef4cc3f8130@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295002; l=5932;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=J1DeHoU20E94V2QoYi9YYNTeO6RS3bz2Z9Caw1Dfcr0=;
 b=UbARYFnp1nNsbylhG+SH1Sf3r7h/o6kzujVH7XHg8zvBsphzuSXxaKgFjtKn5LmcZ3eMS+a5a
 tm0t7nGLRkwB7iDg7eXNwBnKxbKsh1TutFhL7AevkWGC3l9lm8qGRxv
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
expect to keep their power session, as the USB specification requires
of a suspended bus (Documentation/driver-api/usb/persist.rst).
Resetting the core ends all of them. On resume xhci-plat finds a reset
controller ("root hub lost power or was reset") and the USB core has
to reset-resume every device, which only works for devices that come
back within the 2 s that usb_port_resume() waits for a connection.

Devices that are cut off in U3 do not necessarily come back that fast.
On an Orange Pi 5 (RK3588S) the root port of the Type-A USB3 host is
back in Polling 110 ms after resume, but a SanDisk Extreme drive that
was suspended on it does not answer: the link goes to SS.Inactive
after ~1.1 s, the drive drops its terminations at ~2.4 s and only
connects again after ~3 s. A card reader behind a USB3 hub on the
other controller loses VBUS when the hub is reset as part of its
reset-resume and needs ~2.35 s. Both are disconnected and enumerated
again on every resume, which kills a filesystem mounted on them. With
the bus kept suspended they resume from U3 in milliseconds.

Suspend-to-idle does not power anything down behind the drivers'
back, so there is no reason to end the power sessions there. Keep the
core, its PHYs and the suspended ports, as is already done for wakeup,
and mark the device as being on the awake path so that a power domain
with GENPD_FLAG_ACTIVE_WAKEUP stays on as well. This matches what PCI
xHCI controllers do in any system sleep state that keeps auxiliary
power. Suspend-to-RAM, hibernation and controllers that need a full
reinit (needs_full_reinit) still tear the core down.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/usb/dwc3/core.c | 40 ++++++++++++++++++++++++++++++++++++----
 drivers/usb/dwc3/core.h |  2 ++
 2 files changed, 38 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 2b31f146e43f..8b335ba7cde4 100644
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
@@ -2539,6 +2540,29 @@ static int dwc3_core_init_for_resume(struct dwc3 *dwc)
 	return ret;
 }
 
+/*
+ * In host mode, system suspend suspends the bus: xhci-plat puts the root ports
+ * and with them every attached device into U3/suspend, and the USB core
+ * expects them to keep that power session (see
+ * Documentation/driver-api/usb/persist.rst). Tearing the core down here ends
+ * all power sessions: the devices then have to go through a reset-resume, and
+ * a device that takes longer than the USB core allows to come back (it has to
+ * recover its link from scratch, a hub behind the port is reset and switches
+ * its own ports off) is disconnected, e.g. with a mounted filesystem.
+ *
+ * Only do that when the core will lose its state anyway or the system goes
+ * into a state that powers it down: keep it for wakeup, and for
+ * suspend-to-idle, where nothing is powered off behind the drivers' back.
+ */
+static bool dwc3_host_core_exit_needed(struct dwc3 *dwc)
+{
+	if (dwc->needs_full_reinit)
+		return true;
+	if (device_may_wakeup(dwc->dev))
+		return false;
+	return pm_suspend_target_state != PM_SUSPEND_TO_IDLE;
+}
+
 static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
 {
 	u32 reg;
@@ -2569,12 +2593,20 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
 		dwc3_core_exit(dwc);
 		break;
 	case DWC3_GCTL_PRTCAP_HOST:
-		if (!PMSG_IS_AUTO(msg) &&
-		    (!device_may_wakeup(dwc->dev) || dwc->needs_full_reinit)) {
+		dwc->host_core_exited = false;
+		if (!PMSG_IS_AUTO(msg) && dwc3_host_core_exit_needed(dwc)) {
 			dwc3_core_exit(dwc);
+			dwc->host_core_exited = true;
 			break;
 		}
 
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
@@ -2633,8 +2665,8 @@ static int dwc3_resume_common(struct dwc3 *dwc, pm_message_t msg)
 		dwc3_gadget_resume(dwc);
 		break;
 	case DWC3_GCTL_PRTCAP_HOST:
-		if (!PMSG_IS_AUTO(msg) &&
-		    (!device_may_wakeup(dwc->dev) || dwc->needs_full_reinit)) {
+		if (!PMSG_IS_AUTO(msg) && dwc->host_core_exited) {
+			dwc->host_core_exited = false;
 			ret = dwc3_core_init_for_resume(dwc);
 			if (ret)
 				return ret;
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 862818e081af..c5de3c7ee7ec 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1133,6 +1133,7 @@ struct dwc3_glue_ops {
  * @usb3_lpm_capable: set if hadrware supports Link Power Management
  * @usb2_lpm_disable: set to disable usb2 lpm for host
  * @usb2_gadget_lpm_disable: set to disable usb2 lpm for gadget
+ * @host_core_exited: the host-mode core was torn down in system suspend
  * @needs_full_reinit: set to indicate the core may lose power and need full
  *			initialization during system pm
  * @disable_scramble_quirk: set if we enable the disable scramble quirk
@@ -1403,6 +1404,7 @@ struct dwc3 {
 	unsigned		usb2_lpm_disable:1;
 	unsigned		usb2_gadget_lpm_disable:1;
 	unsigned		needs_full_reinit:1;
+	unsigned		host_core_exited:1;
 
 	unsigned		disable_scramble_quirk:1;
 	unsigned		u2exit_lfps_quirk:1;

-- 
2.55.0


