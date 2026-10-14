Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121592D7DD8;
	Wed, 14 Oct 2026 21:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792011739; cv=none; b=cI815943EYJCKGvtUZi90Ma5rlnnTZ0jO6iBOdQpxbH/bvNOer3YNzpUSG9Ld/0al1B/OhP75bOmXMTW8kU7TbtaIjWvRRnp1OGljNvdjz9GZ0Z4OXFBg+wSNzoRSCkSMzBIO7GKwR4YDPQU1halParJaVzA6rFBLlLyt3xIVPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792011739; c=relaxed/simple;
	bh=Hlb9UtGdumk2gu//WKEEDYxGfUvd9mVis1VHkFgRLAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hJJtCQ6orbweKwCt4wE8xBhC9nQj/C+rryo/YzLOWBQXFt66m1dxaSyls8DcXGgg+QUnA69pcl5gcQdxdQKrWD6FztuGkhlVXvm/1QFhombRzYY1zJCDKrzbtB/ENI2DXX5mjCEB4/OFeweLjoEVt9F8LKhfE+kVTusYuz7FM+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cpDVUOoJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cpDVUOoJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id ADD15C2BCC7;
	Wed, 14 Oct 2026 21:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792011738;
	bh=Hlb9UtGdumk2gu//WKEEDYxGfUvd9mVis1VHkFgRLAg=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=cpDVUOoJLO1QLLVbTUaWyw5XHIpyW+8BeQogrgqIrC+LzcKjxwehaAUA5Sqk/cK8r
	 y6MrbHYqg+/3Z5bjw72uslvdBypO/wzyACdfGfHbMdWMfVL5w16zfSoir43aoPuIfK
	 Ii7U0NYTb3sodeY2PYbSbno8cfQQYX+CmFTQimZllXzd0VerlB+4VOa2WeD4DV72ZS
	 N3PnZW7DxyWI8BxBRe33z6/FwI7NqZLVwTM+CoAgRCx7Mk7pGkmW85fZkgYetM6kzb
	 9tSGmaUPa6Ss3IEQy7lO1ELqw/uD9UoxSwX/Qt/xUYabad6n+XXaWjF82N6eiyMdj0
	 Mbel8Aay8hFYA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8806ACC6B2E;
	Wed, 14 Oct 2026 21:02:18 +0000 (UTC)
From: Joe Finzel via B4 Relay <devnull+joe.sudmix.de@kernel.org>
Date: Wed, 14 Oct 2026 23:01:51 +0200
Subject: [PATCH v2] usb: core: sysfs: show product, manufacturer and serial
 without the device lock
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-usb-string-attrs-v2-1-c5cacdad7094@sudmix.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBBFr0Jm7ZhOEUFX3sOwaEuFWVhIpxAM4
 e5WDuDyveS/v4H4yF7gXmwQ/cLCY8igTwW4wYTeI3eZQSt9JUWEs1iUFDn0aFKKgvXFWOcaq+h
 WQZ5N0b94PZLPNvPAksb4OR4W+tk/sYWQsCGnyKqy0mX9kLl783ruPLT7vn8BThVuPbAAAAA=
X-Change-ID: 20261011-usb-string-attrs-74abcc8b0195
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joe Finzel <joe@sudmix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792011738; l=3955;
 i=joe@sudmix.de; s=default; h=from:subject:message-id;
 bh=xGWgOW0mEnxsmyuuNhzAZkLt1RaYcvKh0xa0wpy+ZCo=;
 b=mjGucgwPap770BF8dUURjavBFA5LzbhiB9LDcGVwrtmQ9LwHiS47pydm0st/SRsqEgeCXex6N
 coCToF/61u4CYUByAMPBdgoNRep9CnA8j6jNdOQ27iMhl1DVm+hAzF3
X-Developer-Key: i=joe@sudmix.de; a=ed25519;
 pk=vaX11uVm57me/1N8otNmzMMnsE+f0U3/Hi9TCPbnvZM=
X-Endpoint-Received: by B4 Relay for joe@sudmix.de/default with
 auth_id=1151
X-Original-From: Joe Finzel <joe@sudmix.de>
Reply-To: joe@sudmix.de

From: Joe Finzel <joe@sudmix.de>

Reading the product, manufacturer or serial attribute of a USB device
takes the device lock. A hub holds its lock in hub_event() while it
enumerates all of its ports, including the debounce and reset delays of
every child, so a reader of the hub's strings waits until the last port
is done -- seconds on a hub with several devices.

udev reads these strings for every USB device (the usb_id builtin, run
from 50-udev-default.rules). Its worker blocks SIGTERM, so when systemd
stops udevd in the initrd before switching root, it waits for that
worker. On a desktop with a few hubs this delays every boot:

  i7-13700K, ASUS ROG STRIX Z790-F, four hubs with HID devices behind
  them: udevd took 1.7 s to stop, while the hubs were still enumerating.

  QEMU, qemu-xhci with 8 usb-hubs of 8 HID devices each, second boot,
  three runs: udevd stops in 2.55-2.58 s (switch-root at 5.56-5.59 s);
  with this patch in 11-12 ms (switch-root at 3.02 s). Without usb_id in
  the udev rules, it stops in 9 ms as well.

  -device qemu-xhci,id=xhci,p2=8,p3=8
  -device usb-hub,bus=xhci.0,port=N       (N = 1..8)
  -device usb-kbd,bus=xhci.0,port=N.M   (M = 1..8; also mouse, tablet)

The lock is not needed: usb_enumerate_device() sets the strings once,
before device_add() makes the attributes visible, and usb_release_dev()
frees them only after the attributes are gone. Nothing changes them in
between: authorizing or deauthorizing a device no longer touches them
since Wireless USB, for which they could appear and disappear, was
removed.

Andy Whitcroft reported the same boot stall in 2010 ("khubd -- switch
USB product/manufacturer/serial handling to RCU"); back then the strings
could still change under Wireless USB.

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Joe Finzel <joe@sudmix.de>
---
Found while looking into a 1.7 s stall at the end of the initrd on a
desktop with several USB hubs; reproducible in QEMU (see the commit
message). Tested on 7.2.9 with the QEMU reproduction; applies to
usb-next.

Changes in v2:
- Drop the claim that dev_string_attrs_are_visible() reads the strings
  unlocked from the commit message and the comment; it only reads the
  pointers (Alan Stern). No functional change.
- Add Alan's Reviewed-by.
- Rebase onto current usb-next.
- Link to v1: https://lore.kernel.org/r/20261011-usb-string-attrs-v1-1-81c01b035237@sudmix.de
---
 drivers/usb/core/sysfs.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/core/sysfs.c b/drivers/usb/core/sysfs.c
index d22dc78457d..07865eb1f3b 100644
--- a/drivers/usb/core/sysfs.c
+++ b/drivers/usb/core/sysfs.c
@@ -120,21 +120,19 @@ static ssize_t devspec_show(struct device *dev, struct device_attribute *attr,
 static DEVICE_ATTR_RO(devspec);
 #endif
 
-/* String fields */
+/*
+ * String fields. usb_enumerate_device() reads them once, before the device
+ * is added, and they are freed only when it is released, so showing them
+ * needs no lock. The device lock would make readers wait while a hub holds
+ * it to enumerate all of its ports.
+ */
 #define usb_string_attr(name)						\
 static ssize_t  name##_show(struct device *dev,				\
 		struct device_attribute *attr, char *buf)		\
 {									\
-	struct usb_device *udev;					\
-	int retval;							\
+	struct usb_device *udev = to_usb_device(dev);			\
 									\
-	udev = to_usb_device(dev);					\
-	retval = usb_lock_device_interruptible(udev);			\
-	if (retval < 0)							\
-		return -EINTR;						\
-	retval = sysfs_emit(buf, "%s\n", udev->name);			\
-	usb_unlock_device(udev);					\
-	return retval;							\
+	return sysfs_emit(buf, "%s\n", udev->name);			\
 }									\
 static DEVICE_ATTR_RO(name)
 

---
base-commit: bbf6b99a57b2479bf51c3c8ad0946f4b8c33ed69
change-id: 20261011-usb-string-attrs-74abcc8b0195

Best regards,
-- 
Joe Finzel <joe@sudmix.de>


