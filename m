Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.164.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793899440;
	b=mrGhimrUECR06yv2v79AXELA3TMlcZ3ZpL21ETdpylvEnW5EMoDdS/3GkkqyBaXRjaMK
	 TwSdkeoEbOEF9bFXzHOXBeiWnGsh61DMAV91I2i1sYqPX0FeCS2rT/4kapuvY5vNhBckL
	 lrcprY4aZhkH+/QNpnL/pN2Vf0PwX2jmb+FAztj9u6iE3k2yweegesBJEEfAlHlZCvWVB
	 ohOKUoqqrcCWF755Tte1oQr31G45NIul1oEXCEbdcRZONehLSxiUA6yBb2I45ols7X8on
	 SSmTJ0337klq8GsU36i90JKHyv/YVqfwGU4Ib9uQupODGL3y3an7IfAtUrt6J6H2FNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793899440;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=Y+KU0t8yH8L49Ae5tGtPjcpKb+9AbI+zsPh+lBW6TKQ=;
	b=DWepqbsBjugcnRmFWnyJhR11uLYoNSppbjGLiS4Xt0IFHPADPSgTVU9ahNPhLEb0/ljy
	 LAODB/izFvGx2UongTKLxHxBPUW72a3HdQZof4Gg2kxqrAddSQyvBbQYtPLudPYsdkM1v
	 pOSxIWppvRdVzAfT8ejtjb/0J9sT8xCDoJXwWzV+4bgCKyVoHPLVyB0lsEDVOI/xpEC+r
	 HI8ql2gg3fITCTsO82/5+QO2ECrjs2LZoHqWOfYmeT4dXpk8b3kAvPW3Jp1rzk6kLEgri
	 DtJAXZBs29Wf8rq6joH9fy5iAlYP/MpQ73T6ci6Nl2SGvoSPpGM+XSfwMAwyrvYuKcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=stu.xidian.edu.cn;
	spf=pass smtp.mailfrom=stu.xidian.edu.cn;
	arc=none smtp.remote-ip=162.243.164.118
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24741606A33D;
	Thu,  5 Nov 2026 17:23:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24741606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.xidian.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.xidian.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.xidian.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=Y+KU0t8yH8L49Ae5tGtPjcpKb+9AbI+zsP
	h+lBW6TKQ=; b=6iJjFlfASi2EU6OCeiWTk/HH1tRMH+10xqYHoObq1df89s/mLU
	WehxBfsLfNk73Cdf6IZ3LaybGwi3ghfVD6ZhEez198vb0vEf/cYwROR89wAMLK4A
	5y5zl8CvQK+H6xiH29Aa6ojYLdDBz4qhKVuShFtDtMYpZyoIDev0OHegw=
Received: from user-virtual-machine.localdomain (unknown [223.160.172.231])
	by hzbj-edu-front-4.icoremail.net (Coremail) with UTF8SMTPA id BrQMCkD2HAOYu+xq1pUuAQ--.15898S2;
	Fri, 06 Nov 2026 01:23:37 +0800 (CST)
From: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] usb: usbfs: Require claiming a hub interface for hub class requests
Date: Fri,  6 Nov 2026 01:23:36 +0800
Message-Id: <20261105172336.26307-1-25031212351@stu.xidian.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105065627.5626-1-25031212351@stu.xidian.edu.cn>
References: <20261105065627.5626-1-25031212351@stu.xidian.edu.cn>
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
X-CM-TRANSID:BrQMCkD2HAOYu+xq1pUuAQ--.15898S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXFy5Gw4UKF1kWry8Jr1UKFg_yoWruFyxpF
	WUKFWYkr4DJr13Jr1SyF48ua4ruws7Ca1akFyfJ3s0kwn8JrWfZryrKry5Zws7CFn5XFyY
	yry5Kws8WayDJrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Fb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Jr0_Gr1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28I
	cVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx
	0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY
	1x0262kKe7AKxVWUAVWUtwCY02Avz4vE14v_GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
	WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcS
	sGvfC2KfnxnUUI43ZEXa7IUYYL9UUUUUU==
X-CM-SenderInfo: ysvqjiysrsjkur6v33wo0lvxldqovvfxof0/1tbiAgUID2rsnkQWVwAAsd

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

Require interface 0 to be claimed for every non-GET request to a hub.
The hub driver matches devices by device class or by interface class,
but a hub has a single interface either way, and that is the one the
driver holds.

Userspace can no longer change port settings while the hub driver is
bound.  USBDEVFS_CLAIM_PORT hands over the device behind a port, not the
port itself, so a request that pokes port state is not safe for a
claimed port either.  Programs that used to do this have to unbind the
hub driver first.

Signed-off-by: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
---
Hi Alan,

v4 drops the port owner exception.  You are right that
USBDEVFS_CLAIM_PORT hands over the device behind the port, not the port
itself: the device is driven and suspended through its own fd, so
letting a request poke port state on behalf of a claimed port does not
buy anything.  With the exception gone the helper in hub.c and the
declaration in usb.h go away too, and this is a single file patch again.

I kept the interface class test.  I agree it should not matter for a
device that follows the spec, but it costs nothing and it keeps the
check in line with the two entries in hub_id_table.

Then the -EBUSY for tools that switch port power without unbinding the
hub driver is intended, as you said.

No Fixes: tag and no Cc: stable, following your recommendation.

You mentioned that usb_hub_release_port() and usb_hub_release_all_ports()
should synchronize with outstanding URBs sent to the device on the port:
kill the current ones and keep new ones from being submitted.  I would
like to write that as a separate patch.  Should I send it now, on top of
this one, or wait until this one is settled?

YuanZhe

 drivers/usb/core/devio.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index 486ced74405e..d39ef9a80ec2 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -878,6 +878,23 @@ static int findintfep(struct usb_device *dev, unsigned int ep)
 	return -ENOENT;
 }
 
+/*
+ * Return true if @dev is a hub.  The hub driver matches devices by device
+ * class or by interface class, and a hub has a single interface either way.
+ */
+static bool is_hub(struct usb_device *dev)
+{
+	struct usb_host_config *config = dev->actconfig;
+
+	if (dev->descriptor.bDeviceClass == USB_CLASS_HUB)
+		return true;
+	if (!config || config->desc.bNumInterfaces < 1)
+		return false;
+	return config->interface[0] && config->interface[0]->cur_altsetting &&
+	       config->interface[0]->cur_altsetting->desc.bInterfaceClass ==
+			USB_CLASS_HUB;
+}
+
 static int check_ctrlrecip(struct usb_dev_state *ps, unsigned int requesttype,
 			   unsigned int request, unsigned int index)
 {
@@ -891,6 +908,18 @@ static int check_ctrlrecip(struct usb_dev_state *ps, unsigned int requesttype,
 	if (USB_TYPE_VENDOR == (USB_TYPE_MASK & requesttype))
 		return 0;
 
+	/*
+	 * A hub driver owns the ports and the devices behind them.  Letting
+	 * userspace change hub or port state behind its back, for example
+	 * with a SET_FEATURE(PORT_SUSPEND) request while the hub interface is
+	 * being released, is not safe: the request is passed down to the HCD,
+	 * which may walk per-device state that is being torn down at the same
+	 * time.  Port requests use USB_RECIP_OTHER and hub-wide ones use
+	 * USB_RECIP_DEVICE; the hub driver owns both.
+	 */
+	if ((requesttype & USB_DIR_IN) == 0 && is_hub(ps->dev))
+		return checkintf(ps, 0);
+
 	/*
 	 * check for the special corner case 'get_device_id' in the printer
 	 * class specification, which we always want to allow as it is used
-- 
2.34.1

