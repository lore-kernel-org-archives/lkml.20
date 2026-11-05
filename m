Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.164.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793856673;
	b=TKUsrWdRafqhCwHKDKNS3j+00qFcWK794u3GRQxgGMUKIh4p30R8jGNku0LzFL7EpgSC
	 5eyTLwzhrKFRbDQfKYAD/D2spUMcWoTm1wRk7GCO2ysGbtssyjhPX0c9+JvwL/jloXMRX
	 E130LYBev6LCur1Km1RpddRVaTysqXW5TyTEmCGoTUrHyLWfLKpqjkIBGIG6kfMAmoj3K
	 i5rm+FjO1047LV7coo4RRH70kB+pUzkg+4+frrlrKOe4QcbvtUXTsQkMFs4tQH7o8zvwT
	 xXB46giUX395msD+R1Ff+wkOoqJqB53oH1wsAGUsNbdoweOBU4Uea9LAjCbuBi59KdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793856673;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=Rt7NddFjTaihGhIW35sFykIUPE+dVwT+483FqeZHx1I=;
	b=1+QthWEj0vP3LJu24zt3+08MUccPMLucbAnYunNl6erdyuOWm+FD950FFcu/rz6YwYAD
	 E7EDsfrPlhbkMXAX8HugYGDTV32BN3WNicBvkiptC9isJq+IzRUac49BZNLZKhEShCoCi
	 eQ2t3NNmm0LvX0T84MJ2D61XHvZUBhD4T8rZzksXu9BESclY/adpUn16tS9i8tvfZLlk/
	 Cr9vBum0Mif2vZmPA4hCexDZCgPf8PxrVXCjwmIW+HtXgU3FReLBaT4xbH9jgwgKHcFqK
	 UNfCI3+2SFEGYzSRz0s3ZUgYJCoC4IHD7M9NosBAn79g/3r6pjHiPjo62ajCVxYQhCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=stu.xidian.edu.cn;
	spf=pass smtp.mailfrom=stu.xidian.edu.cn;
	arc=none smtp.remote-ip=162.243.164.118
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D08AB606A326;
	Thu,  5 Nov 2026 05:31:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D08AB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.xidian.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.xidian.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.xidian.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=Rt7NddFjTaihGhIW35sFykIUPE+dVwT+48
	3FqeZHx1I=; b=aI1NZ9vqmZsTZEyF3lTmpg4VZ5ZxAZ6GaG947/d6Xp38ZFUl/P
	IyjzH19qXN3C9gwXnO/yVFiQ1p6iHtHnxiQzLKzLOGycAzz//C/cPtFwU8p5NLKI
	OFJri0xBvzKMvfjTWutrIsmwgk+3gUenVUn7G0dlAQo/Mysw643sKgIHI=
Received: from user-virtual-machine.localdomain (unknown [113.200.174.104])
	by hzbj-edu-front-4.icoremail.net (Coremail) with UTF8SMTPA id BrQMCkCWuwGMFOxqYv4oAQ--.28220S2;
	Thu, 05 Nov 2026 13:30:54 +0800 (CST)
From: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: usbfs: Require claiming a hub interface for hub class requests
Date: Thu,  5 Nov 2026 13:30:50 +0800
Message-Id: <20261105053050.5245-1-25031212351@stu.xidian.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <82a746b7-4e87-4d46-88c3-bb881f11b8de@rowland.harvard.edu>
References: <82a746b7-4e87-4d46-88c3-bb881f11b8de@rowland.harvard.edu>
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
X-CM-TRANSID:BrQMCkCWuwGMFOxqYv4oAQ--.28220S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXFy5Gw4xJFyDXryxZF4ruFg_yoWrJryfpF
	ZrtFZFkr9rGryavw1ftayjga4rWwsxC3WYkryrJ3s8uwn8JrWrZry3K343Wanrur1xXFya
	yrZ8GwnxuayDGaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq
	07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r
	18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vI
	r41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvj
	DU0xZFpf9x07boE_iUUUUU=
X-CM-SenderInfo: ysvqjiysrsjkur6v33wo0lvxldqovvfxof0/1tbiAgUID2rrTMSPlgAAsQ

check_ctrlrecip() requires the matching interface to be claimed for
requests addressed to an interface or an endpoint, but requests
addressed to the device itself are passed through without any check.
For a hub that means userspace can send hub class requests, including
SET_FEATURE(PORT_SUSPEND), through usbfs without claiming the hub
interface, and while the hub driver owns the ports.

That is more than a policy question.  The request goes to the HCD, and
it can run concurrently with userspace releasing the hub interface
through USBDEVFS_DISCONNECT_CLAIM, which unbinds the hub driver and
disconnects the devices behind it.  xhci_hcd tracks the device behind
each port and issues stop endpoint commands for it in its port suspend
path, and it ended up reading a freed xhci_virt_device.

Require the interface to be claimed for non-GET device requests to a
hub, the same way interface requests are already handled.  Tools that
manipulate ports of a hub under control of the hub driver now fail
with -EBUSY unless they first disconnect the hub driver.

Signed-off-by: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
---

Hi Alan,

Yes, that is exactly the sequence: one thread sends
SET_FEATURE(PORT_SUSPEND) to the root hub without claiming interface 0,
and another one releases the hub interface through usbfs.  Once a claim
is required, the request either fails with -EBUSY while the hub driver
is bound, or the claim itself is what unbinds the driver and disconnects
the children, after which the port has no slot left to suspend.

Here is the patch.  Interface and endpoint recipients already go
through checkintf() further down, so I added the same requirement for
device recipients.

One thing to decide before this goes anywhere: tools that power-cycle
ports by sending SET_FEATURE(PORT_POWER) to a hub they have not claimed
(uhubctl is the usual one) will now get -EBUSY from checkintf(), because
the hub driver owns interface 0.  Do you want an exception while
privileges have not been dropped, or is losing that use case the point?

Whether this should be marked for stable is your call.  The missing
check goes back to the initial git import (1da177e4c3f4) and the ioctl
that can race with it arrived with 0837e7e5270b, so I did not add a
Fixes: tag; I also left out Cc: stable because this changes behaviour
for userspace.  The stable candidate is the xhci_hcd fix in the other
thread.  If you would rather see this backported, tell me which commit
you want named and I will resend with the tags.

YuanZhe

 drivers/usb/core/devio.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index 486ced74405e..cc6669743017 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -891,6 +891,18 @@ static int check_ctrlrecip(struct usb_dev_state *ps, unsigned int requesttype,
 	if (USB_TYPE_VENDOR == (USB_TYPE_MASK & requesttype))
 		return 0;
 
+	/*
+	 * A hub driver owns the ports and the devices behind them.  Letting
+	 * userspace change port state behind its back, for example with a
+	 * SET_FEATURE(PORT_SUSPEND) request while the hub interface is being
+	 * released, is not safe: the request is passed down to the HCD, which
+	 * may walk per-device state that is being torn down at the same time.
+	 */
+	if (ps->dev->descriptor.bDeviceClass == USB_CLASS_HUB &&
+	    (requesttype & USB_DIR_IN) == 0 &&
+	    (requesttype & USB_RECIP_MASK) == USB_RECIP_DEVICE)
+		return checkintf(ps, 0);
+
 	/*
 	 * check for the special corner case 'get_device_id' in the printer
 	 * class specification, which we always want to allow as it is used
-- 
2.34.1

