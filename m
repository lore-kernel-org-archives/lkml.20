Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1474E4C10E2
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791836949; cv=none; b=cjOXDyRax/tW5dLk5jwQOkTwsEVl7MuEdjiGqhhEQLuxXeMFvjRQ/1b1UqhKqzb0/e/5IU0Qaie/oDWBu5e16S77+DgKxJTCEIWneXIsGfse1JkQWt/3E62/MWqWFUYqAB0qN8XshEMXciUCVSqm6InX1Bvu0TnWlws6YaCvs/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791836949; c=relaxed/simple;
	bh=iBClIc7e9xj/CyJduyjPPI4y80eu1r70RWo1DQ6VkrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=drRyiUILfz8XW2/AYEg7+Xrao7+FF1sfMNRdiFYcjO3fNoRRv3GGkeIhtxZEMMO0faRNREtR/dq+EwkrZu8/QVOLES1zFhwg6trUt8Z78FsaFWcOZYBv3FF3xjCv62rGb4WhEpMFCLWVVn0aSQqRapmrMmN8mgPLNl65WdBuZhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wx6hvP2q; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rCGTTLi9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wx6hvP2q";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rCGTTLi9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791836943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q7xPBIsF6msFjcBPFQV3z4MewG9jXZq7/+SDCBWWB/g=;
	b=Wx6hvP2qDnbUy27uhI/Y7ZTSifNGM1C8ASMQb2Vey3w5wKLCOckQ2u47g6DZkVg0JaGWui
	jFlLKQDOj/assuhTBM4MR3SpWcY1BqcvtDl8mNQQpg3fTxKCKPJljcjVneVf7dgl8QwFUp
	Xq+pV0ZaiyKkeYtWA45pp+95vXmr5YY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-d-KspraANH-hQVPzDzAMfQ-1; Mon, 12 Oct 2026 20:29:02 +0000
X-MC-Unique: d-KspraANH-hQVPzDzAMfQ-1
X-Mimecast-MFC-AGG-ID: d-KspraANH-hQVPzDzAMfQ_1791836941
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48af4046a3bso1778760f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791836941; x=1792441741; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q7xPBIsF6msFjcBPFQV3z4MewG9jXZq7/+SDCBWWB/g=;
        b=rCGTTLi9vTy2jV95WgfIUidK2a8bQGOMVh5sukioC79teg6yG2ol2Bg3LAZoTRd5ea
         vtBmeMHdhYeuKOB9FCK/ixq2vuMLJERc+YCjIlBVpATwnToyLej2ZCeZAolN//p68mr0
         /henwK9l4sI7LSGuPn910PFUsZO8veqzpUD99BP64S7A2fZlx8YAwi+uFi9FJwjf+Dej
         YU7iO+Y/Ip7IZ04L+WYEEWQs9YaXscgPved6btK07Otb16r1Asscu3vstv4BNDFHbYTu
         oyDzStbw1yBpuS1mD9O+r8rQX9TJo6LNWv40zPC20ihy8chbGfiTAujYTNcDTOhksAeG
         lHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791836941; x=1792441741;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q7xPBIsF6msFjcBPFQV3z4MewG9jXZq7/+SDCBWWB/g=;
        b=f63kCzHHzOZX3gd5JVKgQlsiYgZdVKGEB6E4Z1qng5Jhr76cqq/w7SR0808i22B0zj
         PtKlHTg1EFCl9HbyrqDbEsIJ4CqkE5Onn3bMwnZoQuYbewdxd5YR/mZXg6RQMDLCgbGB
         RI+3xAHwmed53JRR8i8wPeh0S6FFZDDQoD8sDnYJE3ksSXHRvXUhXeXhphuQEwx/QP1A
         QgxFBMeGHqu6A+v+peAXhaA3+j2a3t2NUidFlrNVPElRILeCjQU27kq92lzl4Xg9iHIb
         r0oUzz8BSQLZMcyuAwJz8XNNV3yPseISiRU4P37yZVryPbYkV0mszJ0ZRGrUN8cA5bvE
         m8lA==
X-Forwarded-Encrypted: i=1; AKwUvBxHcSDCVZLKe4YNhdrehYopcgfx9qDs/gOwyhEQEPceNo3A3UdCCGZK3qzPHv64fz5mECqkQmLLAX7rkbQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+ZaBNRqleCoeESbNiG5BsqNZEv3k3liC+olNWVTACUd+/jmCi
	ZyQvZ0Qy7SRZ4a+sSaqSbDcgJvNijlKxw1l4QOoms+8UR9fjjU8+XFbP1au8K+m6VPbITEH1lZm
	sL1riw3ZWcMV2Gb1Os1+DNDzNxFh2jaygrLdBuvQ3lrXgCE8Sb0kQHLYVHE5Flt1Gyw==
X-Gm-Gg: AYBFou3EKlzXWWNbNEkiHXDdQUw2moMkSy2YCRdhNxAwtyz0aZEeylTXaNvMv9IIhUI
	vyQVDpAHwbZUvDP+xEHPspEKErBND4tuy/zYhAqJ6xxqt6hfS3ixjSYKVDRTW0R5B4FVJ8xiy8D
	+cBZW4muCFSHVZ+N2w5l0kY0Dgemq8tF+vrUff4NFbAJxEM+AbGtXIRELC4TTx/K88lK0dUQOEJ
	W6j4JiF8Uh8mBORIq3cG9fHqJaSjL4tZUScEMeejRcDu+sYxCN1Yy1CeUnzy+FeskESNigiMWx+
	fw9WtoYcBWuRfenDN/WuQ2mFg2DIbgDIp/lU/Ni8bs1usFpcWWF5tjCQFDAoJM4hlMD/vg==
X-Received: by 2002:a05:6000:128b:b0:487:27f9:83d with SMTP id ffacd0b85a97d-48dbace43eemr14685523f8f.50.1791836940829;
        Mon, 12 Oct 2026 13:29:00 -0700 (PDT)
X-Received: by 2002:a05:6000:128b:b0:487:27f9:83d with SMTP id ffacd0b85a97d-48dbace43eemr14685501f8f.50.1791836940216;
        Mon, 12 Oct 2026 13:29:00 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab48a7sm1232865f8f.24.2026.10.12.13.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 13:28:58 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:28:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Abhin Parekadan Jose <abhinjoses@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Lukas Wunner <lukas@wunner.de>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>, Kees Cook <kees@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, linux-pci@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v4 0/5] PCI: pciehp: Report surprise removal during
 safe removal
Message-ID: <20261012162837-mutt-send-email-mst@kernel.org>
References: <20260927182017.938565-1-abhinjoses@gmail.com>
 <asxylqif72Lcldx1@home-desktop>
 <20261012022556-mutt-send-email-mst@kernel.org>
 <as0uFfzw83f9aPpn@home-desktop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as0uFfzw83f9aPpn@home-desktop>

On Mon, Oct 12, 2026 at 08:59:33PM +0200, Abhin Parekadan Jose wrote:
> On Mon, Oct 12, 2026 at 02:32:02AM -0400, Michael S. Tsirkin wrote:
> > On Mon, Oct 12, 2026 at 07:39:34AM +0200, Abhin Parekadan Jose wrote:
> > > Gentle ping on this RFC.
> > >
> > > Lukas, Bjorn, could you let me know whether the general direction is
> > > acceptable before I work on a non-RFC version? Any comments on the
> > > approach would help.
> > >
> > > Thanks,
> > > Abhin
> >
> > I'd say, complete the picture. acpi,shpc,polling...
> 
> Ok.
> 
> >
> > Maybe think about how this interacts with pci_ignore_hotplug
> > (seems to weirdly check presence then ignore)?
> 
> Yeah, the order is wrong in v4. The presence read should come after
> the `ignore_hotplug` check. Will fix.
> (Need to still find out why this was introduced. Looks like only the GPU drivers
> use it.)
> 
> >
> > And test with virtio not with edu.
> 
> Bjorn had asked me to keep this puerly PCI[1], So I had decoupled it from the
> virtio changes. I could post another series with those changes with a dependecy
> to this series.
> 
> [1] https://lore.kernel.org/all/20260826194815.GA1552818@bhelgaas/

yea sure.

> >
> > > On Sun, Sep 27, 2026 at 06:20:11PM +0000, Abhin Parekadan Jose wrote:
> > > > If a safe removal is already in progress when the device is surprise
> > > > removed, pciehp cannot report the disconnect [1]. The removal blocks
> > > > waiting on a device interrupt or status read, and pciehp's IRQ thread is
> > > > single-threaded and is itself executing that removal, so it never runs
> > > > again to report the device gone. The removal hangs indefinitely.
> > > >
> > > > pciehp_isr() does run while the IRQ thread is blocked, but pciehp_ist()
> > > > must ignore link and presence changes caused by Secondary Bus Reset or
> > > > DPC, and telling those apart takes seconds which cannot be spent in
> > > > hardirq.
> > > >
> > > > Patch 4 does not do that work in hardirq. pciehp_isr() only checks
> > > > whether the card is present or the link is active, and defers the rest
> > > > to a work item in process context. The work item does not need to know
> > > > why the link changed, only whether the card is gone: it waits for DPC
> > > > recovery or a Secondary Bus Reset in progress to complete, then checks
> > > > again under reset_lock, and if the card is absent and the link is down
> > > > marks the devices below disconnected, which schedules the driver's
> > > > disconnect work from patch 1. pciehp_ist() is unchanged and
> > > > remains the only consumer of the one-shot flags PCI_DPC_RECOVERED and
> > > > PCI_LINK_CHANGED, which tell it whether a link change can be ignored.
> > > >
> > > > Patches:
> > > >
> > > >   1/5 Michael's "PCI: Report surprise removal event" from his RFC v5,
> > > >       which adds disconnect_work_enable and pdev->disconnect_work.
> > > >       Changed to serialize disconnect_work_enable with a per-device
> > > >       spinlock.
> > > >
> > > >   2/5 Add pci_hp_wait_link_change(), which awaits a Secondary Bus Reset
> > > >       in progress without consuming PCI_LINK_CHANGED.
> > > >
> > > >   3/5 Add pci_dpc_wait_recovery(), which awaits DPC recovery without
> > > >       consuming PCI_DPC_RECOVERED.
> > > >
> > > >   4/5 The pciehp change. Adds disconnect_work to struct controller,
> > > >       scheduled from pciehp_isr() on PDC or DLLSC when neither Presence
> > > >       Detect State nor Data Link Layer Link Active indicates a card.
> >
> >
> > how about including the virtio patch? seems more relevant than
> > fooling around with edu.
> >
> > > >   5/5 A POC driver for the QEMU edu device that blocks in remove()
> > > >       waiting for an interrupt, standing in for del_gendisk() stuck in
> > > >       blk_mq_freeze_queue_wait(). Not for merge -- included so the
> > > >       hang can be reproduced.
> > > >
> > > > Changes since RFC v3 [5]:
> > > >
> > > >   - 5/5: Reinitialize the completion in remove() before requesting the
> > > >     delayed interrupt, so that an earlier completion cannot let remove()
> > > >     return while the interrupt is still pending. (Sashiko)
> > > >   - 1/5 to 4/5: No changes.
> > > >
> > > > Changes since RFC v2 [4]:
> > > >
> > > >   - 1/5: Protect disconnect_work_enable with a per-device spinlock, held
> > > >     while testing it and scheduling the work, instead of lockless
> > > >     accesses and barriers.  pci_dev_set_disconnected() could otherwise
> > > >     test the flag, get preempted, and queue the work while a newly bound
> > > >     driver re-initializes it.  With the lock, cancel_work_sync() is
> > > >     sufficient again, so go back to it from disable_work_sync().
> > > >     (Sashiko)
> > > >   - 2/5: Test PCI_LINK_CHANGING with test_bit_acquire(), so that the
> > > >     caller's subsequent accesses are ordered after the end of the code
> > > >     section even if wait_event() returns without sleeping. (Sashiko)
> > > >   - 3/5, 4/5, 5/5: No changes.
> > > >
> > > > Changes since RFC v1 [2]:
> > > >
> > > >   - 1/5: Use disable_work_sync() instead of cancel_work_sync() in
> > > >     pci_clear_disconnect_work(), so that a racing schedule_work() cannot
> > > >     queue the work after remove() has returned. (Sashiko)
> > > >   - 2/5, 3/5: New.
> > > >   - 4/5: Drop schedule_notification_work(); pci_dev_set_disconnected()
> > > >     schedules the driver's disconnect work for all callers again.
> > > >     (Michael)
> > > >   - 4/5: Don't consume PCI_DPC_RECOVERED and PCI_LINK_CHANGED in the
> > > >     work item.  In v1 it ran the same spurious link change test as
> > > >     pciehp_ist(), and whichever ran first took the flags, so pciehp_ist()
> > > >     could tear down a device that was only reset. (Sashiko)
> > > >   - 4/5: Check presence with pciehp_card_present_or_link_active() in
> > > >     both pciehp_isr() and the work item, as pciehp_ist() does, so that a
> > > >     port with Presence Detect State hardwired to zero is not mistaken
> > > >     for an empty slot.
> > > >   - 4/5: Return early from the work item if pciehp_ist() has already
> > > >     taken the pending events, and treat a read error of the presence
> > > >     check as "not present". (Sashiko)
> > > >   - 4/5: In pciehp_isr(), check presence before dropping the runtime PM
> > > >     reference on the port's parent.  In the work item, take a runtime PM
> > > >     reference and check presence under reset_lock, since a slot reset
> > > >     may make Presence Detect State and Link Active flap.
> > > >   - 5/5: Build only with CONFIG_EDU_SRPOC, which depends on PCI; don't
> > > >     claim the interrupt when the device reads all ones; clear bus
> > > >     mastering on teardown. (Sashiko)
> > > >
> > > > Testing
> > > >
> > > > Reproducing this needs QEMU changes, since neither device_del nor the
> > > > attention button produces a true surprise removal.  A branch with both
> > > > is here [3]:
> > > >
> > > >   - a delayed-IRQ register on the edu device (BAR0 0x30, write N ms)
> > > >   - a pcie_surprise_del monitor command that drops the device and
> > > >     generates PDC=1, DLLSC=1, PDS=0
> > > >
> > > > Both tests use:
> > > >
> > > >   ./qemu-system-aarch64 -machine virt,gic-version=3 -cpu cortex-a57 \
> > > >     -m 512 -smp 2 -kernel Image -initrd initramfs.cpio.gz \
> > > >     -device pcie-root-port,id=rp1,chassis=1,slot=1 \
> > > >     -device edu,bus=rp1,id=edu0 -append "console=ttyAMA0 rdinit=/init" \
> > > >     -nographic -monitor unix:/tmp/qemu-mon.sock,server,nowait
> > > >
> > > >   and need a guest kernel with CONFIG_EDU_SRPOC=y.
> > > >
> > > > Test 1 (Hang in remove() on a user thread, then surprise removal):
> > > >
> > > >   guest# echo 1 > /sys/bus/pci/devices/0000:01:00.0/remove &
> > > >   host$  echo "pcie_surprise_del edu0" | socat - unix-connect:/tmp/qemu-mon.sock
> > > >
> > > >   This is the case patch 1 solves on its own: pciehp's IRQ thread is
> > > >   free and handles the removal.
> > > >
> > > > Test 2 (Hang in remove() on pciehp's IRQ thread, then surprise removal):
> > > >
> > > >   guest# echo 0 > /sys/bus/pci/slots/1/power &
> > > >   host$  echo "pcie_surprise_del edu0" | socat - unix-connect:/tmp/qemu-mon.sock
> > > >
> > > >   Without patch 4 the safe removal does not return until the delayed
> > > >   interrupt fires 600 s later.  With it,
> > > >   pciehp_isr() schedules ctrl->disconnect_work, which marks the device
> > > >   disconnected; the POC driver's disconnect work completes the wait and
> > > >   remove() proceeds.
> > > >
> > > > Open questions
> > > >
> > > >   - Is this a viable approach?
> > > >
> > > > [1] https://lore.kernel.org/all/aHlZE18kPuHuDtTT@wunner.de/
> > > > [2] https://lore.kernel.org/all/20260905183905.997833-1-abhinjoses@gmail.com/
> > > > [3] https://gitlab.com/abhinkop/qemu/-/commits/suprise-removal
> > > > [4] https://lore.kernel.org/all/20260927165459.829900-1-abhinjoses@gmail.com/
> > > > [5] https://lore.kernel.org/all/20260927175203.928270-1-abhinjoses@gmail.com/
> > > >
> > > > Assisted-by: LLM
> > > >
> > > > Abhin Parekadan Jose (4):
> > > >   PCI: pciehp: Add pci_hp_wait_link_change()
> > > >   PCI/DPC: Add pci_dpc_wait_recovery()
> > > >   PCI: pciehp: Report surprise removal from pciehp_isr()
> > > >   misc: Add edu_srpoc surprise removal POC driver
> > > >
> > > > Michael S. Tsirkin (1):
> > > >   PCI: Report surprise removal event
> > > >
> > > >  drivers/misc/Kconfig                   |  11 ++
> > > >  drivers/misc/Makefile                  |   1 +
> > > >  drivers/misc/edu_srpoc.c               | 172 +++++++++++++++++++++++++
> > > >  drivers/pci/hotplug/pci_hotplug_core.c |  21 ++-
> > > >  drivers/pci/hotplug/pciehp.h           |   1 +
> > > >  drivers/pci/hotplug/pciehp_hpc.c       |  67 ++++++++++
> > > >  drivers/pci/pci.h                      |  10 ++
> > > >  drivers/pci/pcie/dpc.c                 |  54 ++++++--
> > > >  drivers/pci/probe.c                    |   1 +
> > > >  include/linux/pci.h                    |  57 ++++++++
> > > >  10 files changed, 381 insertions(+), 14 deletions(-)
> > > >  create mode 100644 drivers/misc/edu_srpoc.c
> > > >
> > > >
> > > > base-commit: fd179f8a05be3ccae366b9b96e176b51fbe54aab
> > > > --
> > > > 2.51.1
> > > >
> >

