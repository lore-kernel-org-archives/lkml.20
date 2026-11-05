Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.164.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793857434;
	b=nJbUsjqZaUlV2/siLc3WiBQ1vbpolrNWHCEonZ6AAHQA29zceuu60qlIbimNcEnZMfD4
	 w5pFMUIRChRbIrAmJdijQDpqjAdV0OMxQIH4ElWZB4O0KSPYy6ILFufMt7T+o0ZMABw14
	 4TvxCs919Cd47u2xIOPiuhqFNbE5TCQKcZ7oMtf6Ck6hlsdvhVgIfd0RHJUiOPcJnVlPL
	 jujh7uYurRyaNgoj2GQEtn16405uCXtrBARPPMgFjXA5MxU5RDNGw5kxD3cIiHGv+fV06
	 iIER2wyU8hJbAAbPlDLjejmM9ElWFQ2gjDf5SkkEk2YM/rbDqZn5YW/FdbO2tW1IeBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793857434;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=iQ0ks1fAdnbL9YniuLvzzH+q9/ADCHiEgeX/Tm8mGms=;
	b=hxtinqvuY7edvhXCC1W1ma1pyDDYr6Rne5SrqtxiL9ZKjC3tp0G0N//nwUegkX6yP4jX
	 Fyd+CKlZjM4Ni13ZMhNl6Q1c4UzNYP4r2VUfH2YoPhBQbVBkkHDDWeNVh68g4yrcJTnWb
	 BVlXsD6jjQhPmQP3qmtTlJY6nzkbHHC56xwgSSmk48wn+32IDTX/5mckRrdYhyqr+byR1
	 f5AZByrfhz6UNE0VF1JgxPpCh7OoFOyQozQRTzXouIYX8nLlDyDKma4jsT7kGD2fNA7Mu
	 Jitq4WDrWMTQZbYkYmNNGcmVRy34zcTH7K8uj5yynvmd7XWWbK2Yy0w4j4aQxnaJpxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=stu.xidian.edu.cn;
	spf=pass smtp.mailfrom=stu.xidian.edu.cn;
	arc=none smtp.remote-ip=162.243.164.118
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23FD4606A31B;
	Thu,  5 Nov 2026 05:43:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23FD4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.xidian.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.xidian.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.xidian.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=iQ0ks1fAdnbL9YniuLvzzH+q9/ADCHiEge
	X/Tm8mGms=; b=qE0fQE0Ct0YShgUUKh6do0FQMmjt/lx2+lNk2cI4fagp0cZhn0
	o91XaSv3MzD6B3ImXlavMJthkn7bJPECV73G34T9KFmKu/tWGgXJyqO+wVTaI24R
	q+hqYtXwQ/HT95R5CT3DQ5ujBiUiW/tTokd2YGyfbq5D5MPF7Ue/fpqVk=
Received: from user-virtual-machine.localdomain (unknown [113.200.174.104])
	by hzbj-edu-front-4.icoremail.net (Coremail) with UTF8SMTPA id BrQMCkAGLAKFF+xqWxUpAQ--.51686S2;
	Thu, 05 Nov 2026 13:43:34 +0800 (CST)
From: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: usbfs: Require claiming a hub interface for hub class requests
Date: Thu,  5 Nov 2026 13:43:33 +0800
Message-Id: <20261105054333.7811-1-25031212351@stu.xidian.edu.cn>
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
X-CM-TRANSID:BrQMCkAGLAKFF+xqWxUpAQ--.51686S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXFy5Gw4UKF1kWFykCF18Grg_yoWrAF1fpF
	ZIqFW2kryDGr1aywn3tayUua4rGwsxCa1jkFyrt345Cw45JrZ7Zry5K343WanrCFn3Ja4I
	yrZ0gwnxu3yDGFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9vb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq
	07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r
	15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vI
	r41lc7CjxVAaw2AFwI0_JF0_Jw1lc2xSY4AK67AK6r4rMxAIw28IcxkI7VAKI48JMxC20s
	026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
	JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
	v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xva
	j40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JV
	W8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU5Qdb7UUUUU==
X-CM-SenderInfo: ysvqjiysrsjkur6v33wo0lvxldqovvfxof0/1tbiAgUID2rrTMSRvQAAsl

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

Require interface 0 to be claimed for every non-GET request to a hub
device.  A hub has a single interface, so hub-wide and port requests
are covered by the same check.  Tools that manipulate ports of a hub
under control of the hub driver now fail with -EBUSY unless they first
disconnect the hub driver.

Signed-off-by: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
---

Hi Alan,

v2.  v1 was wrong: I required USB_RECIP_DEVICE, but port requests are
sent as USB_RT_PORT, whose recipient is USB_RECIP_OTHER, and
check_ctrlrecip() has no case for that recipient at all.  v1 would not
have stopped the SET_FEATURE(PORT_SUSPEND) request this started from.
The test is now on the direction only, which is what you asked for, and
since a hub has a single interface, hub-wide and port requests both end
up checking interface 0.

To your question: yes, that is exactly the sequence - one thread sends
SET_FEATURE(PORT_SUSPEND) to the root hub without claiming interface 0,
and another one releases the hub interface through usbfs.  Once a claim
is required, the request either fails with -EBUSY while the hub driver
is bound, or the claim itself is what unbinds the driver and disconnects
the children, after which the port has no slot left to suspend.

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

 drivers/usb/core/devio.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index 486ced74405e..943f0f7f6b64 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -891,6 +891,19 @@ static int check_ctrlrecip(struct usb_dev_state *ps, unsigned int requesttype,
 	if (USB_TYPE_VENDOR == (USB_TYPE_MASK & requesttype))
 		return 0;
 
+	/*
+	 * A hub driver owns the ports and the devices behind them.  Letting
+	 * userspace change port state behind its back, for example with a
+	 * SET_FEATURE(PORT_SUSPEND) request while the hub interface is being
+	 * released, is not safe: the request is passed down to the HCD, which
+	 * may walk per-device state that is being torn down at the same time.
+	 * Port requests use USB_RECIP_OTHER and hub-wide ones USB_RECIP_DEVICE,
+	 * and a hub has a single interface, so check interface 0 for both.
+	 */
+	if (ps->dev->descriptor.bDeviceClass == USB_CLASS_HUB &&
+	    (requesttype & USB_DIR_IN) == 0)
+		return checkintf(ps, 0);
+
 	/*
 	 * check for the special corner case 'get_device_id' in the printer
 	 * class specification, which we always want to allow as it is used
-- 
2.34.1

