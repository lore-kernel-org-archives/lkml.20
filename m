Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794485790;
	b=ZgLne7An8exc9b4ZDvwrKCWgTUObAY3sAaQrJmvQ9xg+csKNuhfD73CYZ5cBdIb6C2xH
	 7IqDv425FkRwp+NFqdGNujfArgAkA7ywKTpcTlSemFsAJfJ51XjglcgYXOsLxrCMrj4g6
	 b/nmN+b/vXPLNTFLhMjRjDcJaRZansv7Zh11kwRoA+dCUcNBn4gJyYXdXS3VxEpDV2fwL
	 qdG42OhJk6mx6TbwiKxbPKgPIywSUBcjH49tCW/BB9yZCIpqswRLKONY5hcg0BslHrNBp
	 +q+xKFZggGYGndsQh0dEBFWazrPbNhptcX8jrn9IY/6mk4/k0BtXCmqOGlwnbj8HWDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794485790;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=DCibk3esbM9aP9RQ7ZoKH3SlkoeG0DaznIMSZGChnao=;
	b=AC2qKonJBxkiXPUu4LQ/EX6uJJOkWz5n4fyzuZ1UgVbkG2H2U7CTbsOmTgzXE8U1Gb4H
	 mmzEI95+tSVG4KT3OEFItkS92/iyy5l9PKM5dGE2pqH+QaAJLOFrujgjKF31k2XqGu8Lx
	 UsU94JXofHrmvPeUdn1To6s2cUTb5zj+mHnLyXpyBusBvZAAARV2KN/3F7YaaYRpG9qWR
	 VKWGZDM0MOIEPssBvBrw/jHy4aABp+93ZKxWTFFQob3a21e/vsjtzrEIyJG6UGmtEYpto
	 wb6mV99eQfyXHCZ9irsuhuImnDWGrB0gzvV/XJT/FSTDRmGviljEEHE8b2tP6DhfVKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=becholey.ch;
	spf=pass smtp.mailfrom=becholey.ch;
	arc=none smtp.remote-ip=185.70.43.97
Received: from mail-4397.protonmail.ch (mail-4397.protonmail.ch [185.70.43.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977AA606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 977AA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=becholey.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=becholey.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=becholey.ch;
	s=protonmail; t=1794485786; x=1794744986;
	bh=DCibk3esbM9aP9RQ7ZoKH3SlkoeG0DaznIMSZGChnao=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=mCaQ3qoSm+rFH/KLRwA7LURfaWqUZwGE7CtopOUZiRHMYuNNGGU3ZWEwdcxoPksOs
	 uAKDusQph1BkDvTn5OmO2Gyx3GVqIwgH6WC9FWr72GMTqZTWgZ5PtbAtsuSI1E4hNI
	 oDa15dHlXYBEAVy2/sNl+fFO8w8NiZlRRyuQ5lHqBuZS7EikEj4CLoKMyKXsNqoObE
	 1tv3EIrQQ39ikBaMOTbtOQmHubeAv3kBdcIohygsj64nq3b2iwlbdzrWcRr/07NWxT
	 ONC6zKX4uKYHQynwTki8xie6x1lMPR/cHuuFX//pVywr7Fk9g50kWplUQohvpTTkAa
	 Znc67iY3BZF4w==
Date: Thu, 12 Nov 2026 12:16:20 +0000
To: johannes@sipsolutions.net
From: Alexandre Becholey <alex@becholey.ch>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Becholey <alex@becholey.ch>, stable@vger.kernel.org
Subject: [PATCH] wifi: rsi: fix use-after-free of in-flight USB rx buffer
Message-ID: <20261112121524.96610-1-alex@becholey.ch>
Feedback-ID: 60743817:user:proton
X-Pm-Message-ID: af1b45cd88e1635e254e5e2ad6feabbfdd8f2597
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

When an rx URB completes successfully but the packet is rejected
(actual_length is 0 or larger than the skb, or the rx queue already
holds RSI_MAX_RX_PKTS skbs), rsi_rx_done_handler() jumps to the out
label with status still set to -EINVAL. There it first calls
rsi_rx_urb_submit(), which allocates a new skb, stores it in
rx_cb->rx_skb and resubmits the URB with that skb as transfer buffer,
and only then frees rx_cb->rx_skb because status is non-zero.

At that point rx_cb->rx_skb is the buffer of the URB that was just
submitted. The in-flight buffer is freed, the next packet received on
that endpoint is written into freed memory, and the skb of the
completed URB is leaked. A USB device bound to rsi_91x can trigger this
by sending a zero-length packet on a bulk IN endpoint right after
probe, followed by a normal packet. With dummy_hcd and KASAN on current
master this shows up as:

  BUG: KASAN: use-after-free in dummy_timer+0x95f/0x3360
  Write of size 2560 at addr ffff88800f5add40 by task swapper/1/0

The device chooses the contents and length of the data (up to about
2.9 KiB per packet in our tests) that end up in freed memory. In one
run the freed page had been reused for a kmalloc-4k slab and the write
went into a live object. Each zero-length packet also leaks one skb.

Commit b07e3c6ebc0c ("rsi: Fix use-after-free in rsi_rx_done_handler()")
made the handler bail out on the next completion, but the in-flight
buffer was still freed.

Free the skb of the completed URB before resubmitting, so that the
buffer of the newly submitted URB is left alone.

The bug was found by AI agents (Claude Mythos and Claude Opus models). The
analysis and the patch were reviewed by a human, who also reproduced the
bug on x86_64 and aarch64 with current master.

Fixes: a1854fae1414 ("rsi: improve RX packet handling in USB interface")
Cc: stable@vger.kernel.org
Signed-off-by: Alexandre Becholey <alex@becholey.ch>
---
Notes for reviewers (not part of the commit message):

Trigger: an emulated USB device (raw-gadget + dummy_hcd under QEMU)
with ID 1618:9113 that reports the firmware as already running
(FW_STATUS_REG bit 0), so no firmware file is needed. Right after
probe it sends a zero-length packet on bulk IN 0x81 and then a
2900-byte packet on the same endpoint. No action on the host is
needed. The reproducer is available to maintainers on request.

Trace from torvalds/master 067c5c24cef2 (x86_64, QEMU q35, KASAN):

  BUG: KASAN: use-after-free in dummy_timer (drivers/usb/gadget/udc/dummy_h=
cd.c:1411 (discriminator 18) drivers/usb/gadget/udc/dummy_hcd.c:1514 (discr=
iminator 18) drivers/usb/gadget/udc/dummy_hcd.c:2035 (discriminator 18))
  Write of size 2560 at addr ffff88800f5add40 by task swapper/1/0
 =20
  CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted 7.4.0-rc2-00092-g067c5c2=
4cef2 #1 PREEMPT(lazy)
  Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS Arch Linux 1.17.=
0-2-2 04/01/2014
  Call Trace:
   <IRQ>
   dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
   print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
   kasan_report (mm/kasan/report.c:595)
   kasan_check_range (mm/kasan/generic.c:186 mm/kasan/generic.c:200)
   __asan_memcpy (mm/kasan/shadow.c:106 (discriminator 1))
   dummy_timer (drivers/usb/gadget/udc/dummy_hcd.c:1411 (discriminator 18) =
drivers/usb/gadget/udc/dummy_hcd.c:1514 (discriminator 18) drivers/usb/gadg=
et/udc/dummy_hcd.c:2035 (discriminator 18))
   __hrtimer_run_queues (kernel/time/hrtimer.c:2079 kernel/time/hrtimer.c:2=
136)
   hrtimer_run_softirq (kernel/time/hrtimer.c:2153)
   handle_softirqs (kernel/softirq.c:669)
   __irq_exit_rcu (kernel/softirq.c:703 kernel/softirq.c:542 kernel/softirq=
.c:786)
   irq_exit_rcu (kernel/softirq.c:809)
   sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1062 (discrimin=
ator 37) arch/x86/kernel/apic/apic.c:1062 (discriminator 37))
   </IRQ>
 =20
  The buggy address belongs to the physical page:
  page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0xf5a

dummy_hcd is the emulated host controller copying the received packet
into the URB buffer that rsi_rx_done_handler() freed.

The same report reproduces on arm64 (QEMU virt), and on v7.3.1 as well
as master; rsi_91x_usb.c is identical in v7.3.1, v7.3.4 and 067c5c24cef2.

Testing on v7.3.1: with the patch the reproducer runs clean (10/10),
without it KASAN reports the use-after-free (2/2), and rx keeps working
after zero-length packets.
Testing on master 067c5c24cef2: with the patch clean (10/10 with
dummy_hcd), without it KASAN (3/3); rx keeps working after zero-length
packets (15/15 plugs), also on an emulated xHCI host (no KASAN report
there either way: the controller writes the freed buffer by DMA).

Thanks,
Alexandre Becholey

 drivers/net/wireless/rsi/rsi_91x_usb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/rsi/rsi_91x_usb.c b/drivers/net/wireless/=
rsi/rsi_91x_usb.c
index 8765cac6f875..bd049ca72919 100644
--- a/drivers/net/wireless/rsi/rsi_91x_usb.c
+++ b/drivers/net/wireless/rsi/rsi_91x_usb.c
@@ -295,13 +295,13 @@ static void rsi_rx_done_handler(struct urb *urb)
 =09status =3D 0;
=20
 out:
-=09if (rsi_rx_urb_submit(dev->priv, rx_cb->ep_num, GFP_ATOMIC))
-=09=09rsi_dbg(ERR_ZONE, "%s: Failed in urb submission", __func__);
-
 =09if (status) {
 =09=09dev_kfree_skb(rx_cb->rx_skb);
 =09=09rx_cb->rx_skb =3D NULL;
 =09}
+
+=09if (rsi_rx_urb_submit(dev->priv, rx_cb->ep_num, GFP_ATOMIC))
+=09=09rsi_dbg(ERR_ZONE, "%s: Failed in urb submission", __func__);
 }
=20
 static void rsi_rx_urb_kill(struct rsi_hw *adapter, u8 ep_num)
--=20
2.53.0


