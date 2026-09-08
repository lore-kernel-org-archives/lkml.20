Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F93E52B1F2
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 18:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788891938; cv=pass; b=j7xUrZxT6FwfaoB00gZjxX7YbqSPcgWLCuI1iGdHDyxYgj25wjU7aGbgqUja5iWICEhes3sEysvgueb/kFq+RAq4OzC4zXTjQDsu0Ch7yUWPGZ/TZwd62x50eqXk51plgRV9WdYHIVJ2IRAUZG3ZuPvqwKZ9geKOLc6EQQqLSGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788891938; c=relaxed/simple;
	bh=Fo5vpFXYIMQu4J3d9fc1+n3/aUquxBEYnQnPOpOyUO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V77/oBB1VhZ0KBx+j5QvtRUswzFZvfdeDSCDRAMs9tDINc4XkFFCX+1PeWInFgiRNF3rgkgI4icitLZ21p+VAIo/erIw7voc6TpQQpmGoBr//TamxVWcBryixVYh8Sc3GxSa2oZ97Os6Z+Tvaa7ECIWfbe0OpMDg41oOtAgsXZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uNzVKPT4; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uNzVKPT4"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a613a6bcd8so28582a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:25:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788891935; cv=none;
        d=google.com; s=arc-20260327;
        b=kWATLq+CugWcimOH1YTuzSgHlVP9Kjs5AvPjEEb06LiPZEROHuE/WRIlcEFSMVU71W
         ch/E2aOXIKdPSyAHJEVyQ+GYQLKw3S2rEcjf1vsJK+NFi2uzUyNb7rKytuXFjnXvLLow
         C09ipHqw7eDZJYzD9LVXKSLU8zIFQ0NJwE0/lIxUvVi2TgMhqomBZvI15Xt4slgmhP2P
         RFuTIT4nzzA/1JVJ49FFQB9fMzhiI22TUx1SwvI1UVHAQv+RUwTPTg9oXg8EW5ZlFAUT
         qf9g2BPdF3Jnq2Xr+a1nprTsQyhfS/vHr/E/hasvDfDsqTsAnQzyakCVjsN+Je6lBzV4
         BaPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vlAXk1dx4a4vhEo3knYZKcpN8ltnqo1rsaaM81SSUDQ=;
        fh=sOLmfpDQ7pYzKZLCs2hPgk/rq7IDW4LHlB4XZ8bKvuk=;
        b=Bi227fV/mNiqW4DVS8GWkfJCVi+hYns+t349IeFCs0qUmHz+DiyCpySUfhCc5NF1WM
         yncEaR0RXJbVfgw2daxstb33S0so5Sn0y4xEXvlbfEnovPUVEwI8lrSNN21kb5ejs/br
         +htYI+b4ZajYl3a6SQzk0o3Mc0Jd5eFkz19B4yLRqi4eEn+tHZ5+QLqgPyDFj2m/tIFP
         Qmee6NbHwd4JrK9Zl4TeMw5vHJeqRwJe61Hwt1rwJtzdwV2v8XpP+jwcup3069QrRbXE
         Ff4R4dC62lGd5l2afxOJ8MvS2vu1vHl1ca/x2wpWDOUyzvgKAKEMMgo/CGP3AaVyEWjU
         AWQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788891935; x=1789496735; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vlAXk1dx4a4vhEo3knYZKcpN8ltnqo1rsaaM81SSUDQ=;
        b=uNzVKPT4rIAzBqnqfBWJKrI93MnFLUYInbv/XDlpDUSKAct7//PbdJ47/7cXijjU7X
         qNp6pp+61uA+cRgo6uOpfETinWgHV0SA+JktIr3LXOdM17jr82335BEb8PmbLg1+FiJG
         J46Aolbd9Nf5bByla0B/tNEsud18EdXP/bspos8/QvokWNKJvckBntywRszZE6N466nA
         Qg48zT0rBwOHrPN1HWWGDnp0Hl/TESfJm6AujLXvLmgFklgxdh6YOqV12HFPK0d6Cf0o
         RY4ZoAmPQCRGnraUi+yQiNfnN8SvL0cmV6syn997z944+bFfoI7iC4KvwsM1pOj2ixaC
         1jeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788891935; x=1789496735;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vlAXk1dx4a4vhEo3knYZKcpN8ltnqo1rsaaM81SSUDQ=;
        b=kj3j5+qeq6FYg3xTfKKmuuyCpsVhCF5YIo7OjYImDHTVSPbBUrLETal8epvc21DtBs
         Sb4FqX88WgsDjOKGkTgN7U4N4jsIItsAN/p5kuysglxb33m80vvyZK1SDxloCb5hSGhA
         6AJOx/T+go+r1e6u55mXEvrLIVDaWe92gOTXRyIB5QA5l2ZuUlSnQ5hIHA1KGQdzKaC2
         RRhK3m9mh4Jg/htqHNNN488JxXq0WhY+po95LJTrctIlRNWt8uqSImt3XIe5qFUUMvtU
         ACpLVSC7ety0CEXyA9RwPqHtr2WD79vWwYlgkUY84cES0AGPFeiv075nM7TU8xAYo5bR
         fvAg==
X-Forwarded-Encrypted: i=1; AKwUvBxHOA3Vs3bj99eCuaUytRva1f8wPkk/v5uTDH5JjmD3Kg8f7nCZC5E7g7GJjQt00dDWJYAm44LM1Uz7dzQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nPZIYdvklv/qKPQ0bvSe1XswVPkMi6EFeZYa8N9qHLOy71SM6H
	JtEoJlPEfXkmTYsyCXqLFCJJRuPJr4i/U4+MDRb/utRMv+hTiteTv+S3grjpUojBobzsuGwf21o
	Tg4TDp/vbjdBosbnbysXLFQL4eo07C3u0ArRB+HDl
X-Gm-Gg: AYBFou0JATqluSAxK0HCW5Iee4ydPmn+bC8/uID1AQeYK9oPOwwtQzAy4u2OrTIYeRE
	TlWrH/ibdctubGJhDDuN/3TcYYZ50c6kqU5YvruiTX8zRgUnRxIAuIQlzAnF8phluSa2PlzIr9v
	/rn+tik8n/JFb8DQmnEkHx86Gkc2xJpwLCSWWe/nL4EaH6QUxSWxUOBH41y6PQ65TCIv8Qwa8DE
	Sh5mc1/aYB7y/7PUaQ5WBtCreF238FLpyMo5piJ0ikSZ7TH+NdTujsx3bc9olOdfbPHtpvplkeb
	3GXugMRCShV35QF7xtfkRKPuPfA6ixjrLZtIMREiOS21Lcpnj9h2TaGHEPYa8TU4Rz2Jjyw8/jc
	=
X-Received: by 2002:aa7:c1c6:0:b0:6a6:32f6:2841 with SMTP id
 4fb4d7f45d1cf-6a98e9ff984mr3388a12.14.1788891933827; Tue, 08 Sep 2026
 11:25:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908043115.216613-1-uqbarz@gmail.com> <aqBFxdzPnFmW36_J@devvm7509.cco0.facebook.com>
In-Reply-To: <aqBFxdzPnFmW36_J@devvm7509.cco0.facebook.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 8 Sep 2026 11:25:22 -0700
X-Gm-Features: AcwNN1W39uxFDm9cyF_8jA3mpGnLFaOnCNLKidH6XGuYqh_wdJmi2nBtVLRMCOQ
Message-ID: <CAHS8izPN6P4=CKFZkowo+t2tx=nu5Q8JjVdZ=_c3eMrMG=9LxA@mail.gmail.com>
Subject: Re: [BUG] net: devmem: TX dma-buf binding UAF on netdev-genl socket close
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: Hengbin Zhang <uqbarz@gmail.com>, netdev@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Taehee Yoo <ap420073@gmail.com>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 10:35=E2=80=AFAM Stanislav Fomichev <sdf.kernel@gmai=
l.com> wrote:
>
> On 09/08, Hengbin Zhang wrote:
> > Hi all,
> >
> > Up front: I'm not a kernel developer, just someone who reads net code o=
n
> > the side, so please bear with me if I get some terminology or conventio=
ns
> > wrong.  I found this issue while looking at the netmem/devmem code, and
> > with some help from AI tooling I managed to reproduce it in QEMU and
> > manually confirm the crash =E2=80=94 I do believe it's a real bug.  Sti=
ll, treat
> > the analysis below as my best guess rather than a certainty.  Thanks a =
lot
> > for taking the time to review this!
> >
> > One-line summary
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > A TX (DMA_TO_DEVICE) dma-buf binding created with NETDEV_CMD_BIND_TX st=
ores
> > binding->dev without taking a netdev reference and never registers itse=
lf
> > with any RX queue of the device.  When the bound device is unregistered=
 and
> > freed while the owning netlink socket is still open, closing the socket
> > makes netdev_nl_sock_priv_destroy() call netdev_hold()/netdev_lock() on=
 the
> > already freed net_device -> use-after-free.  Confirmed with KASAN and b=
y a
> > real page fault / kernel panic on the same code path (log below).
> >
> > Environment
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > - Kernel: v7.3.0-rc1-00515-g9f0346dcbea3 (commit 9f0346dcbea3), x86_64,
> >   with KASAN enabled; relevant config knobs are in the reproducer READM=
E
> >   (link below).
> > - Test setup: QEMU (TCG) guest, initramfs only.  The kernel image has o=
ne
> >   local, test-only addition: a small stub PCI driver (source in the
> >   reproducer link below).  No core net code was modified.
> >
> > Steps to reproduce
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > I reproduced this in a QEMU guest.  QEMU cannot emulate any of the in-t=
ree
> > NETMEM_TX_DMA devices (bnxt/mlx5/gve/fbnic are real NICs), so I wrote a
> > tiny test-only stub PCI driver (source in the reproducer link below) th=
at
> > provides the same device-side properties: a net_device with
> > netmem_tx =3D NETMEM_TX_DMA and a DMA-capable parent.  The bug lives in=
 core
> > net code, not in the driver, so this scenario should equally apply to r=
eal
> > hardware =E2=80=94 e.g. binding TX on a real netmem-TX NIC, then removi=
ng/unbinding
> > that NIC while the netlink socket stays open.
> >
> > 1. Build the stub driver from the gist into the kernel (CONFIG_STUBNET=
=3Dy)
> >    or as a module, boot the guest with "-device edu".
> > 2. Boot with the static "init" program from the gist (repro.c, run as
> >    PID 1 in an initramfs).  It performs, in order:
> >    a. DMA_HEAP_IOCTL_ALLOC on /dev/dma_heap/system -> dmabuf fd;
> >    b. NETDEV_CMD_BIND_TX on the stub device (ifindex + dmabuf fd) and k=
eeps
> >       the netlink socket open; BIND_TX succeeds and returns a dmabuf id=
;
> >    c. writes "1" to /sys/bus/pci/devices/<bdf>/remove, i.e. unregisters=
 and
> >       FREES the stub net_device (refcount drops to 1 in netdev_run_todo=
);
> >    d. closes the netlink socket.
> > 3. Expected: closing the socket cleanly tears the binding down.
> >    Actual: use-after-free, see log below.  On a kernel without KASAN th=
e
> >    same path takes a page fault and panics (second log excerpt below), =
so
> >    this is not a KASAN-only artifact.
> >
> > KASAN log
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> >   stub0 ifindex =3D 2
> >   dmabuf fd =3D 4
> >   netdev family id=3D20 version=3D1
> >   nl got: type=3D20 ... genl cmd=3D15 plen=3D8      <- BIND_TX ok (dmab=
uf id)
> >   writing 1 to /sys/bus/pci/devices/0000:00:04.0/remove
> >   stub0 gone (unregistered); net_device should now be freed
> >   =3D=3D=3D CLOSING NETLINK SOCKET (expect UAF in netdev_hold) =3D=3D=
=3D
> >   [   43.895794] BUG: KASAN: slab-use-after-free in
> >              netdev_nl_sock_priv_destroy+0x196/0x1c0
> >   [   43.896434] Read of size 8 at addr ffff888002f06580 by task init/1
> >   Call Trace:
> >    netdev_nl_sock_priv_destroy+0x196/0x1c0
> >    genl_release+0xee/0x190
> >    netlink_release+0x715/0x13a0
> >    __sock_release+0xa1/0x260
> >    sock_close+0x10/0x20
> >    __x64_sys_close+0x78/0xd0
> >   Allocated by task 1:
> >    __kvmalloc_node_noprof+0x202/0x5b0
> >    alloc_netdev_mqs+0x7e/0x1270
> >    stubnet_probe+0x120/0x3c0
> >   Freed by task 1:
> >    kfree+0x127/0x3b0
> >    device_release+0xc8/0x240
> >    kobject_put+0x101/0x1e0
> >    netdev_run_todo+0x5a5/0xd70
> >    unregister_netdev+0x104/0x180
> >    stubnet_remove+0x3f/0x60
> >    pci_device_remove+0xa6/0x180
> >    remove_store+0xcc/0xe0
> >   The buggy address belongs to the object ... which belongs to the cach=
e
> >   kmalloc-4k of size 4096; freed 4096-byte region [ffff888002f06000,
> >   ffff888002f07000).
> >
> > The kernel then continued in the same function and faulted for real:
> >
> >   [   43.905270] BUG: unable to handle page fault for address: ffff8880=
b0ef9000
> >   [   43.927189] RIP: 0010:netdev_nl_sock_priv_destroy+0xad/0x1c0
> >   ...
> >   [   43.938987] Kernel panic - not syncing: Fatal exception
> >
> > Analysis
> > =3D=3D=3D=3D=3D=3D=3D=3D
> >
> > The flaw is a four-step chain: BIND_TX stores a raw net_device pointer
> > without taking a reference; TX bindings never populate bound_rxqs; the
> > unregister cleanup that clears binding->dev only matches RX queues; so =
when
> > the socket is closed after the device was unregistered and freed,
> > netdev_nl_sock_priv_destroy() runs netdev_hold()/netdev_lock() on the f=
reed
> > net_device.
> >
> > 1) Binding creation - raw pointer, no reference (net/core/devmem.c,
> >    net_devmem_bind_dmabuf(), DMA_TO_DEVICE =3D TX path):
> >
> >     binding->dev =3D dev;              // raw store, NO netdev_hold()
> >     xa_init_flags(&binding->bound_rxqs, XA_FLAGS_ALLOC);
> >     // TX path never calls net_devmem_bind_dmabuf_to_queue()
> >     // -> bound_rxqs stays EMPTY; the unregister cleanup (which matches
> >     //    queues) cannot see this binding
> >
> > 2) Device unregister - the only binding->dev clearing point is RX-only:
> >
> >     // net/core/dev.c:12395 dev_memory_provider_uninstall()
> >     for (i =3D 0; i < dev->real_num_rx_queues; i++)
> >             __netif_mp_uninstall_rxq(&dev->_rx[i], &dev->_rx[i].mp_para=
ms);
> >             // scans the device's OWN RX queues only -> TX binding invi=
sible
> >
> >     // net/core/devmem.c:537 mp_dmabuf_devmem_uninstall() - the ONLY pl=
ace
> >     // that clears binding->dev:
> >     WRITE_ONCE(binding->dev, NULL);  // reached only when a bound queue=
 is
> >                                      // uninstalled (RX-only); never fi=
res
> >                                      // for TX bindings
> >
> > 3) Free - the binding contributes zero references (net/core/dev.c):
> >
> >     // netdev_wait_allrefs_any()/netdev_run_todo()
> >     if (netdev_refcnt_read(dev) =3D=3D 1)    // no holder left; the bin=
ding holds
> >                                          // no reference either
> >             free_netdev(dev);            // net_device freed while the =
socket
> >                                          // and its binding are still a=
live
> >
> > 4) Socket close - teardown on freed memory (net/core/netdev-genl.c:1445=
,
> >    netdev_nl_sock_priv_destroy()):
> >
> >     dev =3D binding->dev;              // RX: NULL (cleared in step 2);
> >                                      // TX: dangling
> >     if (!dev) { unbind; continue; }  // safe branch - never taken for T=
X
> >     netdev_hold(dev, ...);           // UAF #1: refcount/tracker increm=
ent on
> >                                      // the freed net_device
> >     netdev_lock(dev);                // UAF #2: mutex on freed memory
> >
> > Full reproducer materials (stub driver source, trigger program, build/r=
un
> > README and the complete serial log):
> > https://gist.github.com/hharryz/119f067937448ac6e30eb31e7f08dc5a
> >
> > I'd be happy to keep testing, digging deeper into the analysis, and try=
ing
> > to put together a possible fix if that helps.  Thanks a lot for your ti=
me!
>
> Hmm, this looks legit, I don't think we have a proper test for this
> condition :-/ I can try to take a stab unless someone else volunteers.

Yes I'll volunteer to clean up my mess :P

My pet LLM suggested this not-yet-tested change:
https://termbin.com/e4d2. It's trying to detect if there is a tx
binding attached to the netdev at unregister time and clears it.

Let me try to understand the bug report and try to repro + verify it
etc, but Hengbin, thank you for the report and if it's easy for you to
test this fix please try to. Thanks!

--=20
Thanks,
Mina
