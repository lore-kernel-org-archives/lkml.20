Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.198.212.57
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866256;
	b=RCz1NfU8srsepxmWNGeWUp0slXwebZRqV6echsfEqnNpbFdvnia+JtLM5pxXBcEjqpWv
	 k8BgknKjfEny5WmVABxKjEQdxLNtQPdFDTuYdWnjYLGWJzs+09AGK6x/mDRHxZyPROqfE
	 Jj4c7gb3GNkxwT6VHFmkCT14gSRrGGuYyNvpR/mLoCq2NQrHJ7PziFG+GwO4Cj+quqVRy
	 EaVWztuiswxbM21nx2oBJCyYHTXGwuYJwI55AD8NIjXF4+btoKrbQmgl9Kuyg6r3QD8UJ
	 Ectzaokupe/BVjr7sE4YB99lEDiZTPhFFAieAxkLCLYVe8ZodWDtb0te287Lkg8k2jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866256;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:MIME-Version:Content-Type:Content-Disposition:Sender:
	 X-SA-Exim-Connect-IP;
	bh=zKBUSJdtNbuk/fkR4ic+AJ+yrZrj+7qr4UCMMPbUWy4=;
	b=ZckAc9OFwNDc6IrvRFwsDO/T7NMYdMKM+QLL4cJ0B/VqAqvIC4W+KLwu5ILTwXHbUMox
	 xNoTMeUG+VjLLzjCpBEgxOQYtpObzYVDoWjb3N7eGShS+4lfEMyUvyrHX17/Sd62Y2kFc
	 cnCkfyN0NSSDmRXxC5A2W2zQ8WbYNgWqQtOfrnhN3UMUh2Pg9D0jTy5+UnGIZwZBiNt2E
	 TOsl6BzjOl+WFt/ATSnTTEjzbi4Gvd/1HD4wkuGVg9tckRZ3T9Nt2RtA42nmzSbHEadmX
	 z0gYwl6Wa5rncFYBWRzVO/CF3lcEK6fzYIgQ+h5/NdwFz1e3kvlCe6nr/tOawrBnyzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.hr;
	spf=pass smtp.mailfrom=griffin.linux.hr;
	dkim=pass header.d=griffin.linux.hr header.i=@griffin.linux.hr header.a=rsa-sha256 header.s=20261029 header.b=NgECczP4;
	arc=none smtp.remote-ip=193.198.212.57
Received: from griffin.linux.hr (griffin.linux.hr [193.198.212.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1D3606A32D;
	Thu,  5 Nov 2026 08:10:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A1D3606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=griffin.linux.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=griffin.linux.hr header.i=@griffin.linux.hr header.a=rsa-sha256 header.s=20261029 header.b=NgECczP4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=griffin.linux.hr; s=20261029; h=Sender:Content-Type:MIME-Version:Message-ID
	:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zKBUSJdtNbuk/fkR4ic+AJ+yrZrj+7qr4UCMMPbUWy4=; b=NgECczP4bOjq/hwfXD0q/9iWwW
	H20o+Ib0pd4FhmVr3pvQoGG9deRR4k5ncsC89L5vA0XrbYg8Z+EGQoHzLMgPRMekVPpeNYqeTSEVA
	hmzF8nOkV/3CuA6Y+ExXa9blcvnjPbWhWdHwXLyg/Ec+XA8uGSaopqyGRnhJv5u9MDzYoReCf/qJC
	YtvykfeE+BidMYUSpIfmgyvezSyLL3IOoyWti+sY1hLTvoS9EUVc/BUxunlgrmhS2tAqM4746CNdS
	e/qRkMclxPSZu8XRMEw9WWuZho1VJ/2CU6BpzRz4GtD3AYiQA+bFJDmW0waqvgIJFgRYwswk21Z5W
	hkcdFYhw==;
Received: from vkosturj by griffin.linux.hr with local (Exim 4.96)
	(envelope-from <vkosturj@griffin.linux.hr>)
	id 1xOsYQ-0006rQ-31;
	Thu, 05 Nov 2026 09:10:38 +0100
Date: Thu, 5 Nov 2026 09:10:38 +0100
From: Vlatko Kosturjak <kost@linux.hr>
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hongren Zheng <i@zenithal.me>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usbip: vhci: do not give back URBs with an unchecked
 actual_length
Message-ID: <auw5_lMRbGU97IKx@griffin.linux.hr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Vlatko Kosturjak <vkosturj@griffin.linux.hr>
X-SA-Exim-Connect-IP: <locally generated>

vhci_recv_ret_submit() copies actual_length from the RET_SUBMIT header
into the URB, and only usbip_recv_xbuff() looks at it. That check is not
enough:

 - an IN reply longer than transfer_buffer_length is rejected and the
   connection shut down, but the URB is still given back with the
   oversized actual_length (and status -EPROTO);
 - a negative actual_length (urb->actual_length is a u32) is not
   "> 0", so usbip_recv_xbuff() returns 0 without checking it and the
   URB is given back with status 0;
 - for OUT URBs usbip_recv_xbuff() returns 0 straight away, so any
   actual_length is given back.

Completion handlers trust actual_length. usbfs copies that many bytes
from the transfer buffer to user space in copy_urb_data_to_user(),
whatever the URB status, so the kernel reads past the kmalloc()ed
buffer. With CONFIG_HARDENED_USERCOPY this is a BUG in the context of
the process reaping the URB, here for a 22 byte reply to a 16 byte
URB:

  usb 1-1: recv xbuf, 0
  usercopy: Kernel memory exposure attempt detected from SLUB object 'kmalloc-rnd-05-16' (offset 0, size 22)!
  kernel BUG at mm/usercopy.c:102!
  RIP: 0010:usercopy_abort+0x6c/0x80
  Call Trace:
   copy_urb_data_to_user+0x122/0x160
   processcompl+0xe3/0x160
   usbdev_do_ioctl+0x14d/0x1900

Without it, the adjacent heap contents are copied to user space. A
negative actual_length does the same on a URB that usbfs splits into
scatterlist chunks: the last, shorter chunk is over-read by up to 16 KiB.

This was hit with a buggy user-space USB/IP device implementation (it
answered an IN URB with more data than requested) while pcscd read from
the device; any server, buggy or malicious, can trigger it.

Check actual_length against transfer_buffer_length right after
unpacking the header, for IN and OUT URBs: the u32 comparison also
catches negative values. On failure give the URB back with
actual_length 0 and status -EPROTO and shut the connection down, as
usbip_recv_xbuff() does, since any payload was not read. Also give the
URB back with actual_length 0 when receiving the transfer buffer fails
(a short read), as the buffer was not filled.

Fixes: b348d7dddb6c ("USB: usbip: fix potential out-of-bounds write")
Cc: stable@vger.kernel.org
Signed-off-by: Vlatko Kosturjak <kost@linux.hr>
---
Changes in v2:
 - Check actual_length before usbip_recv_xbuff() instead of only zeroing
   it when usbip_recv_xbuff() fails. v1 missed a negative actual_length
   (usbip_recv_xbuff() skips it, so the URB was given back with status 0)
   and OUT URBs (never checked). Pointed out by the Sashiko AI review.
 - Shut the connection down on that error, as usbip_recv_xbuff() does.
 - Tested on mainline 7.4-rc1 as well.

v1: https://lore.kernel.org/linux-usb/aurLXADfuLjs-dm-@griffin.linux.hr/

Tested in QEMU on mainline 7.4-rc1 (05441d697f7f, x86_64 defconfig +
kvm_guest.config + USBIP_VHCI_HCD=m, HARDENED_USERCOPY=y) and on 7.0
(Ubuntu 7.0.0-34-generic), with the same results on both. The reproducer
is a user-space program that attaches a fake device to vhci_hcd through
a Unix socketpair (no network or usbip tools needed), answers a bulk URB
with a bad actual_length, and reaps the URB through usbfs:

  reply                         unpatched / v1              v2
  IN 16 bytes, length 22        BUG (v1: -EPROTO, length 0) -EPROTO, length 0
  IN 16 bytes, length -22       WARN in check_copy_size(),  -EPROTO, length 0
                                REAPURB fails with EFAULT
  IN 16400 bytes, length -22    BUG; with hardened_usercopy -EPROTO, length 0
  (two usbfs sg chunks)         =off status 0 and 16 KiB
                                of heap reach user space
  OUT 16 bytes, length 22       status 0, length 22         -EPROTO, length 0

With hardened_usercopy=off the leaked heap bytes include kernel
pointers. Legitimate replies are unaffected: device enumeration over the
same connection works as before.

Happy to send the reproducer (about 350 lines of C plus a QEMU script)
if useful.

The 2026 hardening of RET_SUBMIT (number_of_packets, iso frame lengths)
does not cover this path; it is the non-isochronous actual_length.

 drivers/usb/usbip/vhci_rx.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/usb/usbip/vhci_rx.c b/drivers/usb/usbip/vhci_rx.c
index a678e7c898..3180dc3018 100644
--- a/drivers/usb/usbip/vhci_rx.c
+++ b/drivers/usb/usbip/vhci_rx.c
@@ -76,8 +76,27 @@ static void vhci_recv_ret_submit(struct vhci_device *vdev,
 	/* unpack the pdu to a urb */
 	usbip_pack_pdu(pdu, urb, USBIP_RET_SUBMIT, 0);
 
+	/*
+	 * actual_length comes from the server, and completion handlers
+	 * trust it: usbfs copies actual_length bytes out of transfer_buffer.
+	 * Reject a negative one (it is a u32 in the URB) or one larger than
+	 * the buffer, for IN and OUT URBs alike. Any payload was not read,
+	 * so the stream is out of sync: drop the connection.
+	 */
+	if (urb->actual_length > urb->transfer_buffer_length) {
+		dev_err(&urb->dev->dev, "ret_submit: actual_length %d exceeds buffer %u\n",
+			pdu->u.ret_submit.actual_length,
+			urb->transfer_buffer_length);
+		urb->actual_length = 0;
+		urb->status = -EPROTO;
+		usbip_event_add(ud, VDEV_EVENT_ERROR_TCP);
+		goto error;
+	}
+
 	/* recv transfer buffer */
 	if (usbip_recv_xbuff(ud, urb) < 0) {
+		/* short read: the buffer was not filled */
+		urb->actual_length = 0;
 		urb->status = -EPROTO;
 		goto error;
 	}

base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
