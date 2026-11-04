Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.198.212.57
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793772395;
	b=heBIOJ2j4gyvgGthhytzlBDZiBmr2oerB5RS3cLeMLlBUogaEMQxLtbvWSqQ1U3suNsj
	 n/aXl0yuHQDfBHgsTMzPdrKUYBgn8rlK7sQ9C5a+dG8aaga1WB9Fp02q+k1Pi0LTfKqrk
	 JF1rHaitnLFQ25i/wxTY/zlZLNQ1fVvmmwQHalW4tJIKQI044o6rfyQXUkDRI543PnVUB
	 jTCgcfzuIlhYPD7bYsQarN0ICymk9MpAyxZV7RS5Zp9u60nPoD8/d9PXFjItnn5tnysqa
	 kIS7rhVA9j6sLAdtddsOHzfZDdSlgCcpx9IIJ7iRYe3dzD3BKP6Uggtm4SUkdv7bjTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793772395;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:MIME-Version:Content-Type:Content-Disposition:Sender:
	 X-SA-Exim-Connect-IP;
	bh=yLLLuTM3wXid61Vzg0o0cfpDiZWBka4KCVHeQ1ECfBI=;
	b=xm4j1mkdvNx1ka70slz2eAPTaDykCDpY+qJrzSwOPrK3+NoAp9ZQdAMup6R5UowS27e5
	 Oc55u3KeskKvRSjbA1P8T6FvU1r6rTgXJf8CG4j9W3PyJdgksXjlC3NNSpubhw08TjOyz
	 cgghDeEAkISBf6m+mrt/hbM9FJ9zTKgnLahb6bEGGGdfwP9fS3s/DevPN+r+vKF9cT/YE
	 Gw/HDe/hTmQhPoeA42cGg+aZ6dsyeJnedt63HUcLuInLt+ZpsP5ArBSRW6xJMHqVpzbfR
	 SBrcchqhjIGpMmrMbdywKkZ3TWoy6cZWamZOdzJQ97akFbSl91thu7FVs2qW7jSFTHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.hr;
	spf=pass smtp.mailfrom=griffin.linux.hr;
	dkim=pass header.d=griffin.linux.hr header.i=@griffin.linux.hr header.a=rsa-sha256 header.s=20261029 header.b="OTZR//tO";
	arc=none smtp.remote-ip=193.198.212.57
Received: from griffin.linux.hr (griffin.linux.hr [193.198.212.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732B8606A31B;
	Wed,  4 Nov 2026 06:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 732B8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=griffin.linux.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=griffin.linux.hr header.i=@griffin.linux.hr header.a=rsa-sha256 header.s=20261029 header.b=OTZR//tO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=griffin.linux.hr; s=20261029; h=Sender:Content-Type:MIME-Version:Message-ID
	:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yLLLuTM3wXid61Vzg0o0cfpDiZWBka4KCVHeQ1ECfBI=; b=OTZR//tOE8pI44FvyeAB5QncRJ
	L/fpakmzuNdCKVlHYgRlDf0iyjxuX/GNg/q2iULMUHrewEe57nnEQOD70+it5Lt3bTofnv/WLpR5r
	WrEfV4rR0wtYtcMfdnVDEPaUIW10FsOPocIrmQOFfBJxyLIXimfMlz4NGg8EevLeBBHX4RM9ZTNa6
	GFHU4a2Vj6uwAk/vW9wfjde2Zf9TXrVSpMakAqrUG4NNUNTSIF0+6RPWdOhN096ZF9Y7n4sGh6RY2
	WRn3fDKgqhoo9NHkgVErbFSRGdbTbK0TqWXvf0eBAMFjsqlJwF7qhjH5EziVEgSrkVxFY8D+esih3
	SG9hqGJg==;
Received: from vkosturj by griffin.linux.hr with local (Exim 4.96)
	(envelope-from <vkosturj@griffin.linux.hr>)
	id 1xOU8a-0000D8-0g;
	Wed, 04 Nov 2026 07:06:20 +0100
Date: Wed, 4 Nov 2026 07:06:20 +0100
From: Vlatko Kosturjak <kost@linux.hr>
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hongren Zheng <i@zenithal.me>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usbip: vhci: do not give back URBs with an unchecked
 actual_length
Message-ID: <aurLXADfuLjs-dm-@griffin.linux.hr>
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
into the URB before usbip_recv_xbuff() checks it. When the server reports
more data than the URB's transfer buffer holds, usbip_recv_xbuff() rejects
the reply and shuts the connection down, but the URB is still given back
with the oversized actual_length (and status -EPROTO).

Completion handlers trust actual_length. usbfs copies that many bytes from
the transfer buffer to user space in copy_urb_data_to_user(), whatever the
URB status, so the kernel reads past the kmalloc()ed buffer. With
CONFIG_HARDENED_USERCOPY this is a BUG in the context of the process
reaping the URB:

  usb 1-1: recv xbuf, 0
  usercopy: Kernel memory exposure attempt detected from SLUB object 'kmalloc-rnd-05-16' (offset 0, size 22)!
  kernel BUG at mm/usercopy.c:102!
  RIP: 0010:usercopy_abort+0x6c/0x80
  Call Trace:
   copy_urb_data_to_user+0x122/0x160
   processcompl+0xe3/0x160
   usbdev_do_ioctl+0x14d/0x1900

Without it, the adjacent heap contents are copied to user space.

This was hit with a buggy user-space USB/IP device implementation (it
answered an IN URB with more data than requested) while pcscd read from
the device; any server, buggy or malicious, can trigger it.

Do not trust actual_length when the transfer buffer could not be
received: give the URB back with actual_length 0. A short read leaves the
buffer partly unfilled too, so this covers both failure cases.

Fixes: b348d7dddb6c ("USB: usbip: fix potential out-of-bounds write")
Cc: stable@vger.kernel.org
Signed-off-by: Vlatko Kosturjak <kost@linux.hr>
---
Tested on host 7.0 (Ubuntu 7.0.0-34-generic) in QEMU with a small reproducer: a
user-space program that attaches a fake device to vhci_hcd through a Unix
socketpair (no network or usbip tools needed), answers a 16-byte bulk IN
URB with actual_length 22, and reaps the URB through usbfs:

  unpatched, CONFIG_HARDENED_USERCOPY=y:  the BUG above
  unpatched, hardened_usercopy=off:       reaped actual_length 22 for a 16-byte
                                          buffer; with 200 extra bytes, 200 bytes
                                          of adjacent heap reach user space
  patched:                                reaped status -EPROTO, actual_length 0

The vhci_rx.c hunk is the same in v7.0 and in mainline. Happy to send the
reproducer (about 300 lines of C plus a QEMU script) if useful.

The 2026 hardening of RET_SUBMIT (number_of_packets, iso frame lengths)
does not cover this path; it is the non-isochronous actual_length.

 drivers/usb/usbip/vhci_rx.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/usbip/vhci_rx.c b/drivers/usb/usbip/vhci_rx.c
index a678e7c89..720dafa72 100644
--- a/drivers/usb/usbip/vhci_rx.c
+++ b/drivers/usb/usbip/vhci_rx.c
@@ -78,6 +78,14 @@ static void vhci_recv_ret_submit(struct vhci_device *vdev,
 
 	/* recv transfer buffer */
 	if (usbip_recv_xbuff(ud, urb) < 0) {
+		/*
+		 * The transfer buffer was not filled: either a short read or
+		 * an actual_length larger than transfer_buffer_length, which
+		 * usbip_recv_xbuff() rejects. Do not give the URB back with
+		 * that actual_length: completion handlers trust it, e.g.
+		 * usbfs copies actual_length bytes out of transfer_buffer.
+		 */
+		urb->actual_length = 0;
 		urb->status = -EPROTO;
 		goto error;
 	}

base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
