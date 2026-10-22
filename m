Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792632082;
	b=dmpn80jbhxec4QQx7LMEf06sH5VTRyZPvORwIrNQWVDtCWc2incoKtz8Tk8o9huTKuxY
	 S/oWvSGy8Rlmcy9mlqk59ahMGXzO8X3aauu3TGi0ayvW+pFC5GKZ/YVMZ78qn2ImPbjic
	 HlR03W0s6ZND22Ogk6ingtzwrN9igkcnZ1XzqrJIKpHD518k/QGIJE9FpGtPQsva6+wkh
	 WBRdoS6RjYAFFv5vRkcJso6T2Xw0h5PDkYG15WEEiUCGwrVFMBYjPCNUmwlkwjcdHKcXQ
	 doftErT84u380znk26lsfg+D/uSB6nxCXvUC3YvSd2Yh9MFHsiYPfG1APqtHmJGOSjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792632082;
	h=DMARC-Filter:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-ID:X-B4-Tracking:
	 X-Change-ID:To:CC:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Dn3/jAL6v6ghW9rsuVgKy3lfCm6I490PGsSIGAlPjMw=;
	b=odIAu+dqpsi3JDcGjcF0Um86NoJ4q472NLD9VB0pKhMKo7NFylpYuhES7/Wx1JcuRTFp
	 1RvR6oYa0p2e9IE364DHMs+9b8anAe3YvmF/kATFqsGx7+JAzta2Ecc58KkCQ+DsEVfy0
	 XpCtSX1a7exlIkPjYDfDLj2n1NRxvDrZ9Ob6pJctwYPilxJwVQvinHa6OcgyEFV6b0+5b
	 N/P2O8MFoFK+9hUWuHYAzD9Rir+f6NnSxYEdjc0WMo+T9r/lcxyRft0AfCofJDxXttOWr
	 pfDjSBjx1n9j6cP+XCvX5Jt93lFmSMyaCZLGczUB53DIIC54qEBvQYU7Mu0VZpjaPDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aspeedtech.com;
	spf=pass smtp.mailfrom=aspeedtech.com;
	arc=none smtp.remote-ip=211.20.114.72
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C14606A31B;
	Thu, 22 Oct 2026 01:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57C14606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 22 Oct
 2026 09:21:12 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 22 Oct 2026 09:21:12 +0800
From: Joe Wang <joe_wang@aspeedtech.com>
Date: Thu, 22 Oct 2026 09:21:11 +0800
Subject: [PATCH v2] usb: ehci: Quiesce controller before halting it on
 shutdown
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
Content-Transfer-Encoding: 7bit
Message-ID: <20261022-upstream_ehci_aspeed_shutdown-v2-1-62712169bc07@aspeedtech.com>
X-B4-Tracking: v=1; b=H4sIAAZl2WoC/42NQQ6CMBBFr0K6toapQNSV9zCElOlgZwFt2oIaw
 t2teAGX7+Xn/VVECkxRXItVBFo4spsyqEMh0OrpQZJNZqFK1UAJjZx9TIH02JFF7nT0RKaLdk7
 GPSd5QRwGMr3SgCI3fKCBX3v/3ma2HJML7/1uga/9t7yABHmuqhLh1NdNrW6/RSK0R3SjaLdt+
 wCn7KqPzwAAAA==
X-Change-ID: 20261016-upstream_ehci_aspeed_shutdown-9ccffedb2a1c
To: Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: <linux-aspeed@lists.ozlabs.org>, <linux-usb@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Joe Wang <joe_wang@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792632072; l=3828;
 i=joe_wang@aspeedtech.com; s=20261016; h=from:subject:message-id;
 bh=OSAHWQ2UPz1PWu1SvvyU1LUnKZDP/P2ec1W7JWtFSBo=;
 b=svrsK9ZFUVBKji/t0Ki3qDbxFdI4aYYT1JuV+EeEYxpDLqB0I1HcFjXMdICGnpyvIwvJqjRbx
 HeYEGyEIgy9DGDrNrRkDBP7RrpmEy05txsGEPrINz7oP9rbvqVGSMs/
X-Developer-Key: i=joe_wang@aspeedtech.com; a=ed25519;
 pk=veYVypCO3h8GrodKXAGdE/+hudGfq/xO12Y1lhyRIV0=

ehci_shutdown() runs from the .shutdown callback during reboot,
poweroff and kexec, for example when LinuxBoot firmware boots the
final OS. The HCD is not removed in that path, so ehci_stop() is not
called and the controller may still be running. ehci_shutdown() then
halts it without first turning off the schedules, leaving a DMA master
running while the system shuts down.

On ASPEED EHCI controllers, clearing USBCMD.RS while both the periodic
and asynchronous schedules are enabled may also leave the controller
unable to halt. If an asynchronous transaction runs past the end of
the micro-frame after RS is cleared, the controller walks the periodic
schedule with a cleared internal buffer, reads from address 0x0 and
never sets USBSTS.HCHalted.

If the controller was running, call ehci_quiesce() before halting it,
as ehci_stop() and ehci_bus_suspend() already do. Do this after
rh_state is set to EHCI_RH_STOPPING, so that URB submissions and
hrtimer events cannot re-enable the schedules, and let ehci_quiesce()
accept that state: like EHCI_RH_RUNNING, it means the controller may
still be doing DMA. The controller-death path in ehci_irq() also sets
EHCI_RH_STOPPING, but it has already cleared CMD_RUN, CMD_ASE and
CMD_PSE, so a quiesce there cannot re-enable anything.

Signed-off-by: Joe Wang <joe_wang@aspeedtech.com>
---
This issue was observed on a customer host platform using the AST2700
PCIe EHCI (ehci-pci), and the root cause was confirmed by the ASPEED
hardware team in RTL simulation. The stop sequence used here (clear
PSE/ASE, wait for PSS/ASS to clear, then clear RS) is their
recommended workaround and was confirmed to resolve the issue on that
platform.

When the controller is running, the added delay at shutdown is bounded
by the two existing 16-uframe handshakes in ehci_quiesce().

Tested on AST2700 (ehci-platform): reboot with a hub and USB mass
storage under load, ehci_shutdown() on already halted controllers,
and unbind/bind (ehci_stop()); no regressions.
---
Changes in v2:
- Apply to all EHCI controllers, not only ASPEED (Alan)
- Quiesce only if the controller was running (Alan)
- Link to v1: https://lore.kernel.org/r/20261016-upstream_ehci_aspeed_shutdown-v1-1-8440c13b5652@aspeedtech.com
---
 drivers/usb/host/ehci-hcd.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
index 3c46bb18c7f3..d9d816eedc66 100644
--- a/drivers/usb/host/ehci-hcd.c
+++ b/drivers/usb/host/ehci-hcd.c
@@ -274,7 +274,7 @@ static void ehci_quiesce (struct ehci_hcd *ehci)
 {
 	u32	temp;
 
-	if (ehci->rh_state != EHCI_RH_RUNNING)
+	if (ehci->rh_state < EHCI_RH_RUNNING)
 		return;
 
 	/* wait for any schedule enables/disables to take effect */
@@ -356,6 +356,7 @@ static void ehci_silence_controller(struct ehci_hcd *ehci)
 static void ehci_shutdown(struct usb_hcd *hcd)
 {
 	struct ehci_hcd	*ehci = hcd_to_ehci(hcd);
+	bool		was_running;
 
 	/**
 	 * Protect the system from crashing at system shutdown in cases where
@@ -367,11 +368,19 @@ static void ehci_shutdown(struct usb_hcd *hcd)
 		return;
 
 	spin_lock_irq(&ehci->lock);
+	was_running = ehci->rh_state == EHCI_RH_RUNNING;
 	ehci->shutdown = true;
 	ehci->rh_state = EHCI_RH_STOPPING;
 	ehci->enabled_hrtimer_events = 0;
 	spin_unlock_irq(&ehci->lock);
 
+	/*
+	 * Turn off the schedules before halting. rh_state is STOPPING now,
+	 * so they cannot be re-enabled.
+	 */
+	if (was_running)
+		ehci_quiesce(ehci);
+
 	ehci_silence_controller(ehci);
 
 	hrtimer_cancel(&ehci->hrtimer);

---
base-commit: 2f2f7eeef8b0a1a9b9ca998231419873ccae8d4e
change-id: 20261016-upstream_ehci_aspeed_shutdown-9ccffedb2a1c

Best regards,
-- 
Joe Wang <joe_wang@aspeedtech.com>

