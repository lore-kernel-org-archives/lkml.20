Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.164.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793861808;
	b=1gMkG/H61I2lhPc38j9Qouu8+VRwXwoLlsJ8moNJbMtrpSk5IjFS4XXOXnEjX24oGyBP
	 dr4LPPR9zq30YSHp4dZDKwCcR2f4tLKjCj5n1vlpVXvcyNRUnWppEkO0p7YfV+L4BFV0h
	 q1LI181TbbkejCAPQqS71Zu4LJUbzfOk1NVWuxO4uCMtVjS7gwW+4qoFdVX4+Uqt4In0M
	 nRfqLduZupncGG23dz+VOi13fBS1ENYcN9WIIMmikg5Kc8Tx8B9ofRpc0vryOOwPs2kYa
	 yb+OqYh11oJ/odYtpUQwLa0uq/4DC6MhaSpkvMMNfvQZSESMq2vkY/mBeeOmHsLmviw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793861808;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=Yp3RTYjbx/Vi7+f/9tTe8EdXwmMowWw6/3/L+wapJBc=;
	b=rue31FtbZhaUflkQQ3IzjI1AM/QqUgxMtzbadJXSezJiYlM1R2PEaCWbRCBMV45tL1me
	 2EkF05f+Gf4yudc9NJpoOmvH8Uhbg8LVRYW8Rl88B8PJp93QCBXb8Zd8x/eoR8QMS/C8A
	 IRPtlviL/Xgah/wfj7ys4ogEfHFpS2Ei7IGeixoM9rlLOBdyxaseZWwlnXYnlZTz4DLiv
	 9tUOGMV8P7b1l1ChPynI3YEZdrwGBXovFX/B6TCxgjMxPj6tBNH+JpUC7Nm4yi9lUmVht
	 SnmNjkD+7XGwcMrFEW9pTcse8RQ7KFoOANqtjWorG8Aq3sqC3tKHu3s/FYehfv5gXfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=stu.xidian.edu.cn;
	spf=pass smtp.mailfrom=stu.xidian.edu.cn;
	arc=none smtp.remote-ip=162.243.164.118
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FEFC606A31B;
	Thu,  5 Nov 2026 06:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FEFC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.xidian.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.xidian.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.xidian.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=Yp3RTYjbx/Vi7+f/9tTe8EdXwmMowWw6/3
	/L+wapJBc=; b=M4lmlAMu1BHoqEMl2dkVv+0IdEn6IDQ80lAB9AqRUfgclTT2KP
	bQZlSvZQLqyl8dQCWJj7nZVnZbBbL708opeIu6laqeswi+BVeCAVyrhdYC2CdNJ9
	FgFkLf3bCPTGCwzFP0Kf87An4TW2U0UhZPEh8/9zj2yDf4VIBIFasO+4o=
Received: from user-virtual-machine.localdomain (unknown [113.200.174.59])
	by hzbj-edu-front-4.icoremail.net (Coremail) with UTF8SMTPA id BrQMCkA2XAKcKOxqWKYpAQ--.52689S2;
	Thu, 05 Nov 2026 14:56:29 +0800 (CST)
From: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] usb: usbfs: Require claiming a hub interface for hub class requests
Date: Thu,  5 Nov 2026 14:56:27 +0800
Message-Id: <20261105065627.5626-1-25031212351@stu.xidian.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105054333.7811-25031212351@stu.xidian.edu.cn>
References: <20261105054333.7811-25031212351@stu.xidian.edu.cn>
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
X-CM-TRANSID:BrQMCkA2XAKcKOxqWKYpAQ--.52689S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Xw4fZF1DuFyktw4xAr1rCrg_yoW3Ww45pF
	W7ta9IkrWDGr17ury3AFWUZayrCw4xAa4akFyft3yY9wnxJrW5AFyrKryYgw47Cr4rWFyj
	yF45K398W34DGrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9vb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq
	07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r
	18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vI
	r41lc7CjxVAaw2AFwI0_JF0_Jw1lc2xSY4AK67AK6r47MxAIw28IcxkI7VAKI48JMxC20s
	026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
	JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
	v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xva
	j40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JV
	W8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUYjXd7UUUUU==
X-CM-SenderInfo: ysvqjiysrsjkur6v33wo0lvxldqovvfxof0/1tbiAgUID2rrTMSepQAAsy

check_ctrlrecip() requires the matching interface to be claimed for
requests addressed to an interface or an endpoint, but requests
addressed to the device or to a port are passed through without any
check.  For a hub that means userspace can send hub class requests
through usbfs without claiming the hub interface, while the hub driver
owns the ports.  Port requests use USB_RT_PORT, whose recipient is
USB_RECIP_OTHER, and SetPortFeature(PORT_SUSPEND) is one of them.

That is more than a policy question.  The request goes to the HCD, and
it can run concurrently with userspace releasing the hub interface
through USBDEVFS_DISCONNECT_CLAIM, which unbinds the hub driver and
disconnects the devices behind it.  xhci_hcd tracks the device behind
each port and issues stop endpoint commands for it in its port suspend
path, and it ended up reading a freed xhci_virt_device.

Require the interface the hub driver uses to be claimed for every
non-GET request to a hub.  Hubs match the driver by device class or by
interface class, so look up the interface instead of testing
bDeviceClass.  A port claimed with USBDEVFS_CLAIM_PORT belongs to the
caller and the hub driver does not connect devices to it, so requests
for such a port stay allowed; that is what the ioctl is for.

Tools that manipulate ports of a hub under control of the hub driver,
without claiming the port or the interface, now fail with -EBUSY.

Signed-off-by: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
---
Hi Alan,

v3.  v2 had two problems, both pointed out after it went out:

 - a hub in a composite device matches the hub driver by interface
   class, not by device class, so testing bDeviceClass alone missed it.
   The check now looks up the interface the hub driver uses, whichever
   way the device matched.
 - USBDEVFS_CLAIM_PORT hands userspace a single port while the hub
   driver stays bound; that is what the ioctl is for, and v2 made it
   unusable by requiring the whole interface.  Requests for a port owned
   by the caller are allowed now.  That needs a small helper in hub.c to
   test ownership, which is why this touches three files.

On whether this closes the window completely: it does not serialize the
transfer, and it is not meant to.  check_ctrlrecip() runs under the
device lock and do_proc_control() drops that lock before
usbfs_start_wait_urb(), so an in-flight request is not ordered against a
claim being released.  What the check gives us is that whenever a
request is allowed, the hub driver is bound, so the port has no device
for xhci_free_dev() to free.  The memory safety itself comes from the
xhci hunk in the other thread.

To your question: yes, that is exactly the sequence - one thread sends
SET_FEATURE(PORT_SUSPEND) to the root hub without claiming interface 0,
and another one releases the hub interface through usbfs.

With the port owner exception above, tools like uhubctl that send
SET_FEATURE(PORT_POWER) to a hub without claiming either the port or the
interface will still get -EBUSY.  Do you want an exception while
privileges have not been dropped, or is losing that use case the point?

Whether this should be marked for stable is your call.  The missing
check goes back to the initial git import (1da177e4c3f4) and the ioctl
that can race with it arrived with 0837e7e5270b, so I did not add a
Fixes: tag; I also left out Cc: stable because this changes behaviour
for userspace.  The stable candidate is the xhci_hcd fix in the other
thread.  If you would rather see this backported, tell me which commit
you want named and I will resend with the tags.

YuanZhe

 drivers/usb/core/devio.c | 43 ++++++++++++++++++++++++++++++++++++++++
 drivers/usb/core/hub.c   | 14 +++++++++++++
 drivers/usb/core/usb.h   |  2 ++
 3 files changed, 59 insertions(+)

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index 486ced74405e..7dc179108a31 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -878,10 +878,36 @@ static int findintfep(struct usb_device *dev, unsigned int ep)
 	return -ENOENT;
 }
 
+/*
+ * Return the interface number through which the hub driver drives this
+ * device, or -1 if it is not a hub.  Hubs match the driver by device class
+ * or by interface class, and a hub embedded in a composite device uses the
+ * latter.
+ */
+static int hub_interface_number(struct usb_device *dev)
+{
+	struct usb_host_config *config = dev->actconfig;
+	int i;
+
+	if (dev->descriptor.bDeviceClass == USB_CLASS_HUB)
+		return 0;
+	if (!config)
+		return -1;
+	for (i = 0; i < config->desc.bNumInterfaces; i++) {
+		struct usb_interface *intf = config->interface[i];
+
+		if (intf && intf->cur_altsetting &&
+		    intf->cur_altsetting->desc.bInterfaceClass == USB_CLASS_HUB)
+			return i;
+	}
+	return -1;
+}
+
 static int check_ctrlrecip(struct usb_dev_state *ps, unsigned int requesttype,
 			   unsigned int request, unsigned int index)
 {
 	int ret = 0;
+	int hub_ifnum;
 	struct usb_host_interface *alt_setting;
 
 	if (ps->dev->state != USB_STATE_UNAUTHENTICATED
@@ -891,6 +917,23 @@ static int check_ctrlrecip(struct usb_dev_state *ps, unsigned int requesttype,
 	if (USB_TYPE_VENDOR == (USB_TYPE_MASK & requesttype))
 		return 0;
 
+	/*
+	 * A hub driver owns the ports and the devices behind them.  Letting
+	 * userspace change hub or port state behind its back, for example
+	 * with a SET_FEATURE(PORT_SUSPEND) request while the hub interface is
+	 * being released, is not safe: the request is passed down to the HCD,
+	 * which may walk per-device state that is being torn down at the same
+	 * time.  Port requests use USB_RECIP_OTHER, hub-wide ones use
+	 * USB_RECIP_DEVICE.  A port claimed with USBDEVFS_CLAIM_PORT belongs to
+	 * the caller though, and the hub driver leaves devices on such a port
+	 * alone, so requests for it are allowed.
+	 */
+	hub_ifnum = hub_interface_number(ps->dev);
+	if (hub_ifnum >= 0 && (requesttype & USB_DIR_IN) == 0 &&
+	    !((requesttype & USB_RECIP_MASK) == USB_RECIP_OTHER &&
+	      usb_hub_port_is_owned(ps->dev, index & 0xff, ps)))
+		return checkintf(ps, hub_ifnum);
+
 	/*
 	 * check for the special corner case 'get_device_id' in the printer
 	 * class specification, which we always want to allow as it is used
diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index b119f5b6065c..16dbcb59dae5 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -2107,6 +2107,20 @@ int usb_hub_release_port(struct usb_device *hdev, unsigned port1,
 }
 EXPORT_SYMBOL_GPL(usb_hub_release_port);
 
+/*
+ * Returns true if @owner has claimed port @port1 through usbfs.  The caller
+ * must hold the device lock.
+ */
+bool usb_hub_port_is_owned(struct usb_device *hdev, unsigned int port1,
+			       struct usb_dev_state *owner)
+{
+	struct usb_hub *hub = usb_hub_to_struct_hub(hdev);
+
+	if (!hub || port1 == 0 || port1 > hdev->maxchild)
+		return false;
+	return hub->ports[port1 - 1]->port_owner == owner;
+}
+
 void usb_hub_release_all_ports(struct usb_device *hdev, struct usb_dev_state *owner)
 {
 	struct usb_hub *hub = usb_hub_to_struct_hub(hdev);
diff --git a/drivers/usb/core/usb.h b/drivers/usb/core/usb.h
index a9b37aeb515b..012c110ac4e9 100644
--- a/drivers/usb/core/usb.h
+++ b/drivers/usb/core/usb.h
@@ -82,6 +82,8 @@ extern void usb_unbind_and_rebind_marked_interfaces(struct usb_device *udev);
 extern void usb_hub_release_all_ports(struct usb_device *hdev,
 		struct usb_dev_state *owner);
 extern bool usb_device_is_owned(struct usb_device *udev);
+extern bool usb_hub_port_is_owned(struct usb_device *hdev, unsigned int port1,
+				     struct usb_dev_state *owner);
 
 extern int  usb_hub_init(void);
 extern void usb_hub_cleanup(void);
-- 
2.34.1

