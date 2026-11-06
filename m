Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.164.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956264;
	b=ev6z6H0TbN67Ukjzr49hUo4VAJIuP7ozQ37zPaar6aeUOTRP+69umL8kpvR/j2HqcsE1
	 oEkLf+j/m1h7pLqf00PqgwbzD315lRqb7qOkwMEmPDgEv12kZuBMiEx89+ir2/y2Z7sR4
	 1X3GyNWiwQlBLR/Ndfu3Gg/7GSq//albwGl4zPtOVLNAiaGts33+Nas4HJIBolVkt/in+
	 EGuKtoYy/CNsaJetBGcTyrMsvg9jhq8gMyk7RI0Xx3Rp4jd0pU1XqC3F/C+13Ur/xu11l
	 S3NH/BEaCaTNJ8qKmGszOJlo92FhsgwIGUqkjr+ewWRRChNq2TZHoXIlb2ijGwf5Pmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956264;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=APZwWF4LKIRrX7OdKe26yS+WpeChCGLXSkelkpf1O1Y=;
	b=nlxHKvQM7i2JyP2hIukH5ykMz1PwjKfdlkUD2B+V9QErcstOq27vjXhc/8URvWfBaaEL
	 5hcTAfCDywY8sC2GZOlgJBmXYtEZEgopmWbbI6q601DfzklE7egqTyIW3JzBf06wp65sg
	 Xib2JzlZSTbi5UvZEWx71lJS70IXJ4XYjJpmuISq07hr74If7troZK3fDPi18nmhlY43m
	 TX1hC3Wkwy51HZdM+WjtEF/289vn1mhPfn0GAkv2AOqxcAia2pEEwFVsoyDc5CjgjIpKO
	 2VUX+dmqtx7pgaThCNEanUeNpPJp+cBOcGLQOER1wE3KXN1BJxjecc6JC6bAkXZI8Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=stu.xidian.edu.cn;
	spf=pass smtp.mailfrom=stu.xidian.edu.cn;
	arc=none smtp.remote-ip=162.243.164.118
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9A06606A329;
	Fri,  6 Nov 2026 09:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9A06606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.xidian.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.xidian.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.xidian.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=APZwWF4LKIRrX7OdKe26yS+WpeChCGLXSk
	elkpf1O1Y=; b=SvgH2BfKuzjZm82Xf3YDHWOGRccvHhKBY1ZMVdCeKqxSxcB4Zw
	pdfaJ86ThhXWSmWNMsbKZhk+YZVIFs/UipuxbZhzuIUVVBdycbYTLT/mVoO7hbxn
	v6jDXToKIQOMLCD+SIB+2xO0YtF0q12gtNTfCAIxasFiDJ8zHUL+HRhqE=
Received: from user-virtual-machine.localdomain (unknown [113.200.174.59])
	by hzbj-edu-front-4.icoremail.net (Coremail) with UTF8SMTPA id BrQMCkBWewGYme1qWI01AQ--.36101S2;
	Fri, 06 Nov 2026 17:10:49 +0800 (CST)
From: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5] usb: usbfs: Require claiming a hub interface for hub class requests
Date: Fri,  6 Nov 2026 17:10:48 +0800
Message-Id: <20261106091048.4056-1-25031212351@stu.xidian.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <0aa5c25e-465f-4168-8833-387acced222f@rowland.harvard.edu>
References: <0aa5c25e-465f-4168-8833-387acced222f@rowland.harvard.edu>
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
X-CM-TRANSID:BrQMCkBWewGYme1qWI01AQ--.36101S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXFy5Gw4UKF1kWry8Jr1UKFg_yoWrGrWxpF
	ZrGFWayr4DGF13trnayFW8ua4rCwn7C3WakFy3J3909w13JrWfZry8Kry3Zrs7Cr4rXFy7
	trs0gwn8W3yUGrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9vb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq
	07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r
	15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vI
	r41lc7CjxVAaw2AFwI0_JF0_Jw1lc2xSY4AK67AK6r4fMxAIw28IcxkI7VAKI48JMxC20s
	026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
	JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
	v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xva
	j40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JV
	W8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU5WKuUUUUUU==
X-CM-SenderInfo: ysvqjiysrsjkur6v33wo0lvxldqovvfxof0/1tbiAgUJD2rsnkR-DQABsu

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

v5 takes both points.  is_hub() is tested first, and the comment now says
that IN requests are safe because they do not affect the hub, while OUT
requests need the interface claimed, instead of talking about recipients.

I will hold the URB synchronization patch for usb_hub_release_port() until
this one is settled.

YuanZhe

 drivers/usb/core/devio.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index e191934623c7..6d69a993c0f1 100644
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
+	 * which may walk per-device state that is being torn down.  IN
+	 * requests are safe, they do not affect the hub, but OUT requests are
+	 * only allowed when the caller has claimed the hub interface.
+	 */
+	if (is_hub(ps->dev) && (requesttype & USB_DIR_IN) == 0)
+		return checkintf(ps, 0);
+
 	/*
 	 * check for the special corner case 'get_device_id' in the printer
 	 * class specification, which we always want to allow as it is used
-- 
2.34.1

