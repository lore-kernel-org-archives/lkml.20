Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792529353;
	b=YB3xZQwy7YLzNPv765b+VEfhj6UrdF9EiPwZdmYjKUrvCbMFgS/z5l7/pPS3XergUEHI
	 duyJL3VlhFnDC5kbPeOCJmE7jWenhjxbK1OTVKBD0WG1ryHXC/JnV6hnGsFJsbzLuK6A2
	 wvSkgFTEKtjZEq9JwD+5S2N4gmUNv63VQGSOF8YeH4MgoIBe9d17MMDPeVVmbRRbwQlfC
	 qTSAxjh5A/Kyl7iwFqHchoMi4tlIQi4Wldvrbn765EGRztFIdPuZqoHl/ehMTL44cas8E
	 pUkpvcNWpaz5F6lRJYiY3foejNR7Pqj6m7uMMlbEv9CCiCKjUVwWTsfwtS+2xwd9qFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792529353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1MHe8EqbKutlp8VC2MFVDV0PA6f7JPZmNraEYGReU1U=;
	b=kY8J6qvERarYCODGWdZ6tZPaxfwjCXiipVG0c7+JnqE7GKl2+Az4G008+iQI/En3faNG
	 elVVoCrFwfMC6fOkoNM5sFCwOJ1xIJyXZsI77YY2DQohM8vM3if92jtyYrAw6sqoMCJps
	 ag0RahVeLtyiBUblCts5qX8y+ZoB0r4cqOTYyEexpCA4EFQRmy3G5e9Bou5MFm6ftcMb7
	 C1esTJad96PbFs4rCc99HZFSsbNkvzfDmk3ExzLY3wr/ws39Vq8jIsWTDRQkWgR+70r9b
	 RH9SIVHRDeujwUNbuiRsiHXCPSxYD3FQrzL+oqMi9cMA4ygStyrGdMrVE51irru8HRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=KHNReH4T;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E305D606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E305D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=KHNReH4T
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-53667180af3so771261cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:49:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792529352; cv=none;
        d=google.com; s=arc-20260327;
        b=B/36qK3UzgtsYG5F0sMBAbrcmUXX/68HjQFZoXIYIJPPoeEki0nJjsD+FCnZx9tE3F
         cLT7Fc8GtS6GFUiEop6MRFTVz9QmSYuh1ErfmED/kYYTmQQtX1WfC/9KmmqEpzqXuoVA
         lLZeTXyBrV6+0DDy2ZYYpmQulwShFDB0P8U/lFL9MNZGcR3GX6nKN+swR0huc2P6d8ya
         WumCKQodArEyKTo/zvT1TRRQ2szMOWMI5DP9ccQWl3IH2i5DK98d4uuwaUGvfwk5Z7bv
         GYRiskucojU5ajA/HSL74uH4GGwapR2+Gj+zjdLThLyf2H59iP81qmR2kHDVkRkbqt8w
         fMKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1MHe8EqbKutlp8VC2MFVDV0PA6f7JPZmNraEYGReU1U=;
        fh=OuqKb3oa+oqKN4Mj8HMMin4NrpTPu7UINh1ehC9O+Cc=;
        b=PPqq+WPUOqJA+/+D6fEfZuH4d3hp71cDpEx+VEmK9v/cfyIWtk18IvenQXna6HkDpe
         19KtuD4orgFR2VwG9kgUb03gfsUB4WRs+KgU2ofP3oIgKEnOio+AIpN4Hd7t4cM0PA7Q
         JQEoexkNDqBSJIFW5jRb3rQ3hynV2Vh0CeC0P3Pnk27/vEAQXtVHK7tgPqrM9C/e7yMq
         eFBlGJ0rtZmDRfwDsB1Vc1NHuZ/lM8+dEyGladVnxbVCCfCQP52pNQcoF+yCOaWmPMvo
         pbIdYAWEy7dibeoO7RJ9xMXYV8EIkl3cOVTV5HYboZZe1r9eWwinvdToEoga/Fj1s0dO
         mt7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1792529352; x=1793134152; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1MHe8EqbKutlp8VC2MFVDV0PA6f7JPZmNraEYGReU1U=;
        b=KHNReH4TKzHvr4IF1t2FTvnbmv3a1kGmhIcZ7dQvhpBEfL4N0go1ECZ/A0FQiZJua1
         Ff+9aegiyOikdZmqI0SBboTXw2EjgQzbFbqmKB3Lj1jXwS0QwjOkoZfSDUJXDA8EmSkY
         jWf0o+pPmQ4PotBakH8NsCUCGXPGtH9x7bH7KXrcBklaxq4xDDGkNBIkdH301v3ZXchs
         S3a9vm520yDVLNoGBRdQwv4VZ0nfyyoDPwqdc0RcKnfer5RcHMRB7IZYw4BFrHbe2iy5
         Lxeyel1SXUUbeAt1YHvwGE5Px3B9u2Wcf5LZxZuWuJikYpxEMRqi507DKksFOCoRxUE/
         WoFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792529352; x=1793134152;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1MHe8EqbKutlp8VC2MFVDV0PA6f7JPZmNraEYGReU1U=;
        b=YlCLDIeUW83ZDO4qkzE0DWepbR400w/wMwoV9Pkm5mRUnXYCoud4vPkIWT3amm4QPr
         evMvnFM+kZXoTDq3LB+1ySRMOV6LRNEMDY4H9Imqbm7qnyiGmynlgFOS7lZEjwkK32xe
         4GWDTMf9gQMJqYwAHWTadTMg5Htr8y0/U/DDUw8ESWS8kmucrLYINn7zI9s/Ab8bLCrB
         4xEQtOsPudkNvv7gMVxEFN8vZ9sX0DfkaffAVxwvUvXs13/n+mbnA2Azy+TfMSsbuPAV
         tbSz15dM06Sqe9nnrdLjpONzeu3CS/BH9KgxdIKCToK08NKnHIWxywbCRUxtrFgOhHAB
         2Eqg==
X-Forwarded-Encrypted: i=1; AKwUvBwn3m6UNEd7WszgJhrb3pu5TkSg0Lm3UuRjt5xaPb9gZsDp+fj9cyL5ehnkJ1p8Yc5M7NH38fCDiijf7W4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL52yKaydIE6jPv/nsAQ0SCBlpbLWmREcpqijafIfeNIEgjzlW5
	z8NarFHglp0NUVOiCfD7pJFCc7EZoTugIKMnfA5qHCcj+wWhJZ2HO4Aa+lVaIGbOeyhcDYhyc/s
	b41hjeEHgi3RJi55tHvMIxX8PXx62BirTRyLqZxApJg==
X-Gm-Gg: AYBFou01JtXE8j/Vm4AdXjggvQ0mEfiwZViwcXMtWvLt/bjA60fpTcr+9ahp0zvampX
	ScdQ4eZyW0smRwUHjfWIv1TiPQPwarxgAfF6r7SmG3BJnXkFCKDTjqHf1VGCNgZgNqXEunEpxGN
	UYY5asUIWMCeF5QDD5xruI3TJsXKWuP0bqQOfG41rERnb7pXsY/shbFePFRlMtlvBRSN03QqgUN
	XDdsqElvG8vdZluPp6AZEwDD19AutU94Wu98UTDmN1dYxJlAABCW5KYth0L96ZQWmh7pz+CGMmL
	tICeOO90j0g/Q5ELBbgHtPQ4lj1WYgUbxQSL6t7LPKY9kT7nl5ZVznJH8FZSSFXbgg==
X-Received: by 2002:ac8:5e0d:0:b0:536:7dd:16b3 with SMTP id
 d75a77b69052e-536460fe7bbmr180159991cf.75.1792529351307; Tue, 20 Oct 2026
 13:49:11 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260922200718.3941465-1-sgogte@purestorage.com>
 <20260922200718.3941465-4-sgogte@purestorage.com> <atSzF3URmcpP2_i2@shinmob>
In-Reply-To: <atSzF3URmcpP2_i2@shinmob>
From: "Surabhi Gogte (she/her)" <sgogte@purestorage.com>
Date: Tue, 20 Oct 2026 13:48:33 -0700
X-Gm-Features: AclHuK8HnIWR43B83mn1rOX-ik0z2fMODrU0_UyKTgRbiVGURkvqnAvBk4LN8CE
Message-ID: <CAMof9cVxoNxM70uJa=N+a88YBMmh+EKfXrrckXz=N45U0EKQcg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] nvme-tcp: parallelize I/O queue allocation and startup
To: "Shin'ichiro Kawasaki" <shinichiro.kawasaki@wdc.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org, mkhalfella@purestorage.com, 
	randyj@purestorage.com, adailey@purestorage.com, 
	Hannes Reinecke <hare@kernel.org>, dwagner@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 5:26=E2=80=AFAM Shin'ichiro Kawasaki
<shinichiro.kawasaki@wdc.com> wrote:
>
> On Sep 22, 2026 / 14:07, Surabhi Gogte wrote:
>
> Recently, blktests-CI runs for the kernel at block/for-next branch starte=
d
> reporting failures of the test case nvme/004 (with tcp transport) and md/=
001.
> The kernel reported a WARN related to lock->magic, and it caused the fail=
ures.
> FYI, here I share the failure run log at md/001 [1] and dmesg at the fail=
ure.
>
>   The md/001 confirms a bug fix in md driver. The bug was triggered when =
a
>   nvme device with tcp transport is used as its backend. Then the test ca=
se
>   exercises the nvme-tcp driver, which this patch touches.
>
> I bisected and found that this commit is the trigger of the failures. Whe=
n I
> revert this commit from the block/for-next branch tip with git hash
> 34fbfb9d8d1f, the failure goes away.
>
> Surabhi, could you take a look in the failure?
>

Yes, there is a bug in commit 61b0ed3be81b ("nvme-tcp: parallelize I/O
queue allocation and startup").  To know the queue range before the
queues are set up, it moved the I/O tag set allocation ahead of I/O
queue allocation.  blk_mq_alloc_tag_set() calls
nvme_tcp_init_request() for every request, which takes pf_cache_lock
of the request's queue, but nvme_tcp_alloc_queue() only initializes
that mutex later:
  nvme_tcp_configure_io_queues()
    nvme_alloc_io_tag_set()
      blk_mq_alloc_tag_set()
        blk_mq_alloc_rqs()
          nvme_tcp_init_request()  mutex_lock(pf_cache_lock) <- WARN
    nvme_tcp_setup_io_queues()
      nvme_tcp_alloc_queue()   mutex_init(pf_cache_lock)

So with CONFIG_DEBUG_MUTEXES the first connect trips
DEBUG_LOCKS_WARN_ON(lock->magic !=3D lock) in __mutex_lock().
That matches the call trace in your dmesg.

Daniel Wagner posted a fix for this as patch 1 of [PATCH 0/5]
nvme-fabrics: fix connects with isolated CPUs and queue mapping bugs:
lore : https://lore.kernel.org/all/20261014-nvme-fabrics-isolcpu-v1-0-35515=
6be27b2@kernel.org

It initializes pf_cache_lock for all queues in nvme_tcp_alloc_ctrl(),
right after the queues array is allocated, and drops the
mutex_destroy() calls so the lock stays valid for the lifetime of the
controller.

I ran blktests with his fix on top of block/for-next (34fbfb9d8d1f, the
same tip you bisected on) and md/001 passes with no WARN related to
lock->magic.  Without the fix, the same tree and config fails md/001
with the WARN at kernel/locking/mutex.c:625.

With the fix : nvme-tcp: initialize pf_cache_lock when allocating the contr=
oller
lore : https://lore.kernel.org/all/20261014-nvme-fabrics-isolcpu-v1-1-35515=
6be27b2@kernel.org/

~/blktests$ sudo ./check md/001
md/001 (Raid with bitmap on tcp nvmet with opt-io-size over bitmap
size) [passed]
    runtime  1.779s  ...  1.814s

dmesg :
[  424.545232] run blktests md/001 at 2026-10-20 13:09:35.913402801
[  424.801620] brd: module loaded
[  425.003577] nvmet: adding nsid 1 to subsystem blktests-subsystem-1
[  425.022620] nvmet_tcp: enabling port 0 (127.0.0.1:4420)
[  425.096622] nvmet: Created nvm controller 1 for subsystem
blktests-subsystem-1 for NQN
nqn.2014-08.org.nvmexpress:uuid:0f01fb42-9f7f-4856-b0b3-51e60b8de349.
[  425.100018] nvme nvme0: creating 8 I/O queues.
[  425.100179] nvme nvme0: mapped 8/0/0 default/read/poll queues.
[  425.107350] nvme nvme0: new ctrl: NQN "blktests-subsystem-1", addr
127.0.0.1:4420, hostnqn:
nqn.2014-08.org.nvmexpress:uuid:0f01fb42-9f7f-4856-b0b3-51e60b8de349
[  425.280674] md: async del_gendisk mode will be removed in future,
please upgrade to mdadm-4.5+
[  425.280688] block device autoloading is deprecated and will be removed.
[  425.328822] md127: array will not be assembled in old kernels that
lack configurable LBS support (<=3D 6.18)
[  425.328835] md/raid1:md127: active with 1 out of 2 mirrors
[  425.330749] md127: detected capacity change from 0 to 2093056
[  425.486853] md127: detected capacity change from 2093056 to 0
[  425.486864] md: md127 stopped.
[  425.512755] nvme nvme0: Removing ctrl: NQN "blktests-subsystem-1"
[  426.367495] brd: module unloaded
[  615.773842] loop0: detected capacity change from 0 to 8
[  915.773735] loop0: detected capacity change from 0 to 8

Tested-by: Surabhi Gogte <sgogte@purestorage.com>



>
> [1] failure of md/001
>
> md/001 (Raid with bitmap on tcp nvmet with opt-io-size over bitmap size) =
[failed]
>     runtime  3.021s  ...  2.970s
>     something found in dmesg:
>     [   79.786635] [    T966] run blktests md/001 at 2026-10-18 20:35:29.=
594227680
>     [   80.157789] [    T984] brd: module loaded
>     [   80.566933] [   T1008] nvmet: adding nsid 1 to subsystem blktests-=
subsystem-1
>     [   80.637888] [   T1011] nvmet_tcp: enabling port 0 (127.0.0.1:4420)
>     [   80.925883] [    T312] nvmet: Created nvm controller 1 for subsyst=
em blktests-subsystem-1 for NQN nqn.2014-08.org.nvmexpress:uuid:0f01fb42-9f=
7f-4856-b0b3-51e60b8de349.
>     [   80.940866] [   T1018] nvme nvme5: creating 4 I/O queues.
>     [   80.942243] [   T1018] nvme nvme5: mapped 4/0/0 default/read/poll =
queues.
>     [   80.942689] [   T1018] ------------[ cut here ]------------
>     [   80.942879] [   T1018] DEBUG_LOCKS_WARN_ON(lock->magic !=3D lock)
>     [   80.942882] [   T1018] WARNING: kernel/locking/mutex.c:625 at __mu=
tex_lock+0x1008/0x2510, CPU#0: nvme/1018
>     ...
>     (See '/home/shin/Blktests/blktests/results/nodev/md/001.dmesg' for th=
e entire message)
>
>
> [2] dmesg during md/001
>
> 2026-10-17T22:40:06Z {detected_level=3D"unknown"} [ 2568.828164] run blkt=
ests md/001 at 2026-10-17 22:40:06.674885632
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.162185] brd: mod=
ule loaded
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.587993] nvmet: a=
dding nsid 1 to subsystem blktests-subsystem-1
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.629198] nvmet_tc=
p: enabling port 0 (127.0.0.1:4420)
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.848587] nvmet: C=
reated nvm controller 1 for subsystem blktests-subsystem-1 for NQN nqn.2014=
-08.org.nvmexpress:uuid:0f01fb42-9f7f-4856-b0b3-51e60b8de349.
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.875225] nvme nvm=
e2: creating 4 I/O queues.
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.878288] nvme nvm=
e2: mapped 4/0/0 default/read/poll queues.
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.883211] --------=
----[ cut here ]------------
> 2026-10-17T22:40:07Z {detected_level=3D"debug"}   [ 2569.883660] DEBUG_LO=
CKS_WARN_ON(lock->magic !=3D lock)
> 2026-10-17T22:40:07Z {detected_level=3D"warn"}    [ 2569.883666] WARNING:=
 kernel/locking/mutex.c:625 at __mutex_lock+0xb73/0x2350, CPU#2: nvme/55686
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.887533] Modules =
linked in: nvme_tcp(E) nvme_fabrics(E) nvmet_tcp(E) nvmet(E) brd(E) raid1(E=
) dm_dust(E) loop(E) xfs(E) tun(E) nvme(E) iTCO_wdt(E) intel_rapl_msr(E) in=
tel_pmc_bxt(E) intel_rapl_common(E) pcspkr(E) i2c_i801(E) i2c_smbus(E) nvme=
_core(E) nvme_keyring(E) virtio_balloon(E) nvme_auth(E) virtio_scsi(E) lpc_=
ich(E) bochs(E) serio_raw(E) qemu_fw_cfg(E) vmw_vsock_virtio_transport(E) v=
mw_vsock_virtio_transport_common(E) vsock(E)
> 2026-10-17T22:40:07Z {detected_level=3D"debug"}   [ 2569.887693] Unloaded=
 tainted modules: nvme_tcp(E):1 nvmet(E):63 nvme_fabrics(E):63 nvme_loop(E)=
:63 loop(E):14 ublk_drv(E):2 null_blk(E):37 scsi_debug(E):53 amd_atl(E):1 e=
dac_mce_amd(E):1 bpf_preload(E):1 [last unloaded: scsi_debug(E)]
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.899624] CPU: 2 U=
ID: 0 PID: 55686 Comm: nvme Tainted: G            E       7.3.0-rc7 #1 PREE=
MPT(lazy)
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.902229] Tainted:=
 [E]=3DUNSIGNED_MODULE
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.903507] Hardware=
 name: KubeVirt None/RHEL, BIOS 1.16.3-4.el9 04/01/2014
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.905532] RIP: 001=
0:__mutex_lock+0xb7a/0x2350
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.907336] Code: 38=
 d0 7c 08 84 d2 0f 85 52 17 00 00 44 8b 05 8d af 8d 02 45 85 c0 0f 85 0a f6=
 ff ff 48 8d 3d ad cc 8e 02 48 c7 c6 c0 fd 2f 85 <67> 48 0f b9 3a e9 f2 f5 =
ff ff 4d 8d a7 e0 0e 00 00 4c 89 e7 e8 3d
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.912320] RSP: 001=
8:ffff8881438c7370 EFLAGS: 00010246
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.914185] RAX: 000=
0000000000003 RBX: ffff8881face6460 RCX: 1ffffffff0f35008
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.916368] RDX: 000=
0000000000000 RSI: ffffffff852ffdc0 RDI: ffffffff879b9d70
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.918675] RBP: fff=
f8881438c74e0 R08: 0000000000000000 R09: fffffbfff0f35008
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.920803] R10: fff=
fffff879a8047 R11: ffff88812d120008 R12: 0000000000000000
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.923039] R13: 000=
0000000000000 R14: dffffc0000000000 R15: ffff88812d3a0000
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.925258] FS:  000=
07fd431b6b640(0000) GS:ffff8882ac2ea000(0000) knlGS:0000000000000000
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.927640] CS:  001=
0 DS: 0000 ES: 0000 CR0: 0000000080050033
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.929481] CR2: 000=
07f50088d0c1c CR3: 000000010d0d4006 CR4: 0000000000770ef0
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.932053] PKRU: 55=
555554
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.933507] Call Tra=
ce:
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.934813]  <TASK>
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.936625]  ? nvme_=
tcp_init_request+0xc8/0x300 [nvme_tcp]
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.938805]  ? srso_=
alias_return_thunk+0x5/0xfbef5
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.940675]  ? __all=
oc_frozen_pages_noprof+0x543/0x7c0
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.942464]  ? __pfx=
___mutex_lock+0x10/0x10
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.944123]  ? srso_=
alias_return_thunk+0x5/0xfbef5
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.945814]  ? alloc=
_pages_node_noprof+0xae/0x150
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.947474]  ? nvme_=
tcp_init_request+0xc8/0x300 [nvme_tcp]
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.949268]  nvme_tc=
p_init_request+0xc8/0x300 [nvme_tcp]
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.951141]  blk_mq_=
alloc_rqs+0x3fc/0x6f0
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.952747]  blk_mq_=
alloc_map_and_rqs+0x168/0x320
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.954450]  ? srso_=
alias_return_thunk+0x5/0xfbef5
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.956260]  blk_mq_=
alloc_set_map_and_rqs+0x1be/0x5a0
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.958088]  blk_mq_=
alloc_tag_set+0x59a/0xc40
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.959710]  ? srso_=
alias_return_thunk+0x5/0xfbef5
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.961321]  ? dev_p=
rintk_emit+0xbe/0xf3
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.962736]  nvme_al=
loc_io_tag_set+0x37d/0x6a0 [nvme_core]
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.964446]  ? __pfx=
_nvme_alloc_io_tag_set+0x10/0x10 [nvme_core]
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.966345]  ? percp=
u_ref_put_many.constprop.0+0x7f/0x1b0
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.968109]  ? __nvm=
e_submit_sync_cmd+0x1e2/0x320 [nvme_core]
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.970040]  ? srso_=
alias_return_thunk+0x5/0xfbef5
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.971714]  ? srso_=
alias_return_thunk+0x5/0xfbef5
> 2026-10-17T22:40:07Z {detected_level=3D"info"}    [ 2569.973339]  ? _dev_=
info+0xe6/0x11a
> 2026-10-17T22:40:07Z {detected_level=3D"info"}    [ 2569.974760]  ? __pfx=
__dev_info+0x10/0x10
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.976153]  ? __pfx=
_nvme_set_queue_count+0x10/0x10 [nvme_core]
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.977938]  ? lock_=
acquire.part.0+0xc7/0x240
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.979582]  nvme_tc=
p_configure_io_queues.cold+0x27f/0x8ee [nvme_tcp]
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.981436]  ? __pfx=
_nvme_enable_ctrl+0x10/0x10 [nvme_core]
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.983132]  ? lockd=
ep_hardirqs_on_prepare.part.0+0x9b/0x140
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.984762]  ? __pfx=
_nvme_tcp_configure_io_queues+0x10/0x10 [nvme_tcp]
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.986525]  nvme_tc=
p_setup_ctrl+0x281/0x5f0 [nvme_tcp]
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.988113]  ? srso_=
alias_return_thunk+0x5/0xfbef5
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.989665]  nvme_tc=
p_create_ctrl+0xf6/0x120 [nvme_tcp]
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.991236]  nvmf_cr=
eate_ctrl+0x34e/0x920 [nvme_fabrics]
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.992832]  nvmf_de=
v_write+0xd5/0x180 [nvme_fabrics]
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.994357]  vfs_wri=
te+0x1c7/0x1060
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.995622]  ? __pfx=
_vfs_write+0x10/0x10
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.996900]  ksys_wr=
ite+0xf9/0x1d0
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.998093]  ? __pfx=
_ksys_write+0x10/0x10
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2569.999349]  ? srso_=
alias_return_thunk+0x5/0xfbef5
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.000692]  ? lockd=
ep_hardirqs_on_prepare.part.0+0x9b/0x140
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.002249]  ? srso_=
alias_return_thunk+0x5/0xfbef5
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.003675]  ? trace=
_hardirqs_on+0x18/0x160
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.005046]  do_sysc=
all_64+0xef/0x5a0
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.006137]  ? kmem_=
cache_free+0x143/0x600
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.007405]  ? srso_=
alias_return_thunk+0x5/0xfbef5
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.008722]  ? do_sy=
s_openat2+0x107/0x180
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.009946]  ? __pfx=
_do_sys_openat2+0x10/0x10
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.011180]  ? srso_=
alias_return_thunk+0x5/0xfbef5
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.012539]  ? fput_=
close_sync+0xe5/0x1a0
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.013752]  ? __pfx=
_fput_close_sync+0x10/0x10
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.015062]  ? srso_=
alias_return_thunk+0x5/0xfbef5
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.016455]  ? __x64=
_sys_openat+0x108/0x1d0
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.017722]  ? __pfx=
___x64_sys_openat+0x10/0x10
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.019017]  ? trace=
_hardirqs_on_prepare+0x119/0x150
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.020393]  ? do_sy=
scall_64+0x1d7/0x5a0
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.021623]  ? do_sy=
scall_64+0x1b9/0x5a0
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.022876]  ? srso_=
alias_return_thunk+0x5/0xfbef5
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.024209]  ? trace=
_hardirqs_on_prepare+0x119/0x150
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.025581]  ? do_sy=
scall_64+0x1b9/0x5a0
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.026867]  ? srso_=
alias_return_thunk+0x5/0xfbef5
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.028225]  ? trace=
_hardirqs_on_prepare+0x119/0x150
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.029718]  ? srso_=
alias_return_thunk+0x5/0xfbef5
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.031169]  ? do_sy=
scall_64+0x1d7/0x5a0
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.032408]  ? do_sy=
scall_64+0x1b9/0x5a0
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.033704]  ? srso_=
alias_return_thunk+0x5/0xfbef5
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.035099]  ? trace=
_hardirqs_on_prepare+0x119/0x150
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.036605]  ? srso_=
alias_return_thunk+0x5/0xfbef5
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.037956]  ? do_sy=
scall_64+0x1d7/0x5a0
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.039181]  ? srso_=
alias_return_thunk+0x5/0xfbef5
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.040575]  ? __loc=
k_release.isra.0+0x5b/0x180
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.041947]  ? srso_=
alias_return_thunk+0x5/0xfbef5
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.043389]  ? do_us=
er_addr_fault+0x8d3/0xe80
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.044575]  ? irqen=
try_exit+0xb8/0x810
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.045690]  ? srso_=
alias_return_thunk+0x5/0xfbef5
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.046990]  ? do_sy=
scall_64+0x2d/0x5a0
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.048067]  ? srso_=
alias_return_thunk+0x5/0xfbef5
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.049302]  ? srso_=
alias_return_thunk+0x5/0xfbef5
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.050545]  ? do_sy=
scall_64+0x5c/0x5a0
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.051649]  entry_S=
YSCALL_64_after_hwframe+0x76/0x7e
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.052916] RIP: 003=
3:0x7fd431c3d56e
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.053948] Code: 4d=
 89 d8 e8 d4 bd 00 00 4c 8b 5d f8 41 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74=
 11 c9 c3 0f 1f 80 00 00 00 00 48 8b 45 10 0f 05 <c9> c3 83 e2 39 83 fa 08 =
75 e7 e8 03 ff ff ff 0f 1f 00 f3 0f 1e fa
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.057937] RSP: 002=
b:00007ffdaa469710 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.059733] RAX: fff=
fffffffffffda RBX: 00005609fa418740 RCX: 00007fd431c3d56e
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.061425] RDX: 000=
00000000000cf RSI: 00005609fa418740 RDI: 0000000000000003
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.063121] RBP: 000=
07ffdaa469720 R08: 0000000000000000 R09: 0000000000000000
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.064826] R10: 000=
0000000000000 R11: 0000000000000202 R12: 0000000000000003
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.066523] R13: 000=
05609fa4175b0 R14: 00000000000000cf R15: 00005609fa4175b0
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.068235]  </TASK>
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.069130] irq even=
t stamp: 11409
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.070225] hardirqs=
 last  enabled at (11409): [<ffffffff850e58f5>] _raw_spin_unlock_irqrestore=
+0x45/0x60
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.072350] hardirqs=
 last disabled at (11408): [<ffffffff817db728>] __raw_spin_lock_irqsave+0x5=
8/0x60
> 2026-10-17T22:40:07Z {detected_level=3D"unknown"} [ 2570.074391] softirqs=
 last  enabled at (11372): [<ffffffff815ffc88>] handle_softirqs+0x638/0x880
> 2026-10-17T22:40:08Z {detected_level=3D"unknown"} [ 2570.076357] softirqs=
 last disabled at (11365): [<ffffffff8160003f>] __irq_exit_rcu+0x15f/0x290
> 2026-10-17T22:40:08Z {detected_level=3D"unknown"} [ 2570.078305] ---[ end=
 trace 0000000000000000 ]---
> 2026-10-17T22:40:08Z {detected_level=3D"unknown"} [ 2570.084017] nvme nvm=
e2: new ctrl: NQN "blktests-subsystem-1", addr 127.0.0.1:4420, hostnqn: nqn=
.2014-08.org.nvmexpress:uuid:0f01fb42-9f7f-4856-b0b3-51e60b8de349
> 2026-10-17T22:40:08Z {detected_level=3D"unknown"} [ 2570.400433] md127: a=
rray will not be assembled in old kernels that lack configurable LBS suppor=
t (<=3D 6.18)
> 2026-10-17T22:40:08Z {detected_level=3D"unknown"} [ 2570.401014] md/raid1=
:md127: active with 1 out of 2 mirrors
> 2026-10-17T22:40:08Z {detected_level=3D"unknown"} [ 2570.404015] md127: d=
etected capacity change from 0 to 2093056
> 2026-10-17T22:40:08Z {detected_level=3D"unknown"} [ 2570.559964] md127: d=
etected capacity change from 2093056 to 0
> 2026-10-17T22:40:08Z {detected_level=3D"unknown"} [ 2570.560710] md: md12=
7 stopped.
> 2026-10-17T22:40:08Z {detected_level=3D"unknown"} [ 2570.632174] nvme nvm=
e2: Removing ctrl: NQN "blktests-subsystem-1"
> 2026-10-17T22:40:09Z {detected_level=3D"unknown"} [ 2571.118121] brd: mod=
ule unloaded
> 2026-10-17T22:40:09Z {detected_level=3D"debug"}   [ 2572.039779] scsi_deb=
ug:sdebug_driver_probe: scsi_debug: trim poll_queues to 0. poll_q/nr_hw =3D=
 (0/1)
> 2026-10-17T22:40:09Z {detected_level=3D"debug"}   [ 2572.040354] scsi hos=
t66: scsi_debug: version 0191 [20210520]
> 2026-10-17T22:40:09Z {detected_level=3D"unknown"} [ 2572.040354]   dev_si=
ze_mb=3D8, opts=3D0x0, submit_queues=3D1, statistics=3D0
> 2026-10-17T22:40:09Z {detected_level=3D"debug"}   [ 2572.046424] scsi 66:=
0:0:0: Direct-Access     Linux    scsi_debug       0191 PQ: 0 ANSI: 7
> 2026-10-17T22:40:09Z {detected_level=3D"unknown"} [ 2572.053271] scsi 66:=
0:0:0: Power-on or device reset occurred
> 2026-10-17T22:40:09Z {detected_level=3D"unknown"} [ 2572.063350] sd 66:0:=
0:0: [sda] 16384 512-byte logical blocks: (8.39 MB/8.00 MiB)
> 2026-10-17T22:40:09Z {detected_level=3D"unknown"} [ 2572.063603] sd 66:0:=
0:0: Attached scsi generic sg1 type 0
> 2026-10-17T22:40:09Z {detected_level=3D"unknown"} [ 2572.064965] sd 66:0:=
0:0: [sda] Write Protect is off
> 2026-10-17T22:40:09Z {detected_level=3D"unknown"} [ 2572.065470] sd 66:0:=
0:0: [sda] Mode Sense: 73 00 10 08
> 2026-10-17T22:40:09Z {detected_level=3D"unknown"} [ 2572.068116] sd 66:0:=
0:0: [sda] Write cache: enabled, read cache: enabled, supports DPO and FUA
> 2026-10-17T22:40:09Z {detected_level=3D"unknown"} [ 2572.075669] sd 66:0:=
0:0: [sda] permanent stream count =3D 5
> 2026-10-17T22:40:10Z {detected_level=3D"unknown"} [ 2572.080471] sd 66:0:=
0:0: [sda] Preferred minimum I/O size 512 bytes
> 2026-10-17T22:40:10Z {detected_level=3D"unknown"} [ 2572.082032] sd 66:0:=
0:0: [sda] Optimal transfer size 524288 bytes
> 2026-10-17T22:40:10Z {detected_level=3D"unknown"} [ 2572.131009] sd 66:0:=
0:0: [sda] Attached SCSI disk
