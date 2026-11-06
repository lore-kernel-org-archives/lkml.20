Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977746;
	b=Mi5oVhnhqHV0fsIMlXra842l1DirAKadYPIfHJOoHToP/fch5wdiL4N2mLdq8kLyiMqe
	 mKr6xwGWEQzmjOI35hSSUVTeMxkzBfdQxuE+oLZOHVL9F1UAOyVqL4VsnkjvzpzYCzkPQ
	 n0KFPUBz/xPvoWAIQhUEwanBDQ3/duiJnEBcViKOobKrc2vwWjYwM90jHmWh9BZKQ95I8
	 tYY9dz+rRRviS16adWVpjQrfbEJk1NBftKukS/QS6dzqXjwoWhg22KY+BPW9ofTOOIKUW
	 IpWsJ8KUA5MQIKcLadUPAXklLJA6KlQJR0aGdVrQUfTUlKhPjMPDNlCm7qSYCkHoI9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Sjb/CGptteVJ6mRSv5fy7p+QoZN56Caycv45okK6XdU=;
	b=W/PIf7mSCZFAVHzL6SueMTPPi1pUED9ADSMkIZSdhzbIaiZLy5Anr0SPL4SVZyp57EpO
	 jOAOYX57jQZufUzrO5MpzSatrC4xzezFmAnuBWr9fSPSuG5ELN9xhjDNKW6pTWxUpZ+XD
	 VxU2L7vYLNXEwTCUFCGhhDsGguVUseCEp6nKTJRrGdCjD+guZKBWCP77v0GcWTmjrho0n
	 3YT91Lyajllv7h8EsOj/InGq6CLR+Pz/hYwLxF7mtg+V47TjrtLGXxldDLQ4bMDvhkN51
	 s3/tmSsvAjJU7OLPMuFmIiZgvHSju2busBomD+SMEAtg3nZIWvDr/q0pMh9HwNH4sTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q0yE6xxJ;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692CE606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:09:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 692CE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q0yE6xxJ
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c3fd91337baso135764166b.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793977744; x=1794582544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sjb/CGptteVJ6mRSv5fy7p+QoZN56Caycv45okK6XdU=;
        b=q0yE6xxJJ+25x6raPIKoIHyImSKQ9wapgbso+E0vw9Z9iMX6w+PUBMdqZEB+7wm+kO
         tFNjn2xMQ0waXAWy3N1mrJroYIFU4jzUFYgBUlO2tp7koFePa4vaScUJgyYQLotwejkv
         hUIv6oDRKG7RXjFo2kJuuWzQo6RGQPXvVo0P/7/HqBCh73FiizkXNH4wKwmaDp7oegC1
         iqaiDItl6EOZN8h1dzIKJC8eaKUcr7K/4fUD6SoWMttOGc2ezrWOVqVL0dCYOUMpAVEr
         ZRXoRjwO2wmzN80Yx/3lYvDTbgH+spgR0QonF9zHojOwCqsGRYKYg3oWn4NBftllsvOY
         Og3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977744; x=1794582544;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sjb/CGptteVJ6mRSv5fy7p+QoZN56Caycv45okK6XdU=;
        b=vXcpjkAzSXPPBR/1AHUg3H4cyIuMOWRDMxY/E1IofA9I2f0i6XA1y//1xkrfiaewZ9
         mCKlK8MExEpgKNfZvlC7vpXq2ZnqcAnje+v1TktvP6jG8zX9u1Fyba9bbHQTJZQ5qcE8
         kdjOWjb76leEOBbmuA48Dn12u3wUa2hMHwDzA+sQHg4PlkoYPNHo2nk4FwlKZeM/LBfM
         3lqeYZIciyO3l2seKDVZzfeZCo1YIW/UOyzyhsQveRbsnk02qecwINJiQqQC55/8pAa4
         U6reJ/mlqayEYF7qpvn8Lwt1EzGcaEdKiOWaZQmdBS2tmgdF+g1tGnnzwCQmXJXTmq6z
         xC0w==
X-Forwarded-Encrypted: i=1; AKwUvBzCW+Duk/AuqlatIhcegM5MbwpJ6gfZRqu3OJHkNQ3Erkr7Q2Pc4oJJGX0Vn/ESyDRFS3r2Aa8TZTI9XbQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8C2k0ss54ftS1JbeZb6bPapwsv+A/c+aEhoi21Zqp9VRxISbOk
	fUnIKQAFujd5j6AlifBHjTumsAJ7n6h67CZZhI12NYxrf4nzIvnJ+/Ae
X-Gm-Gg: AYBFou2NAhhbkTnU+DKsqKg/YmWzSV76vDaEc1kcyO/KUggt4NNQ14ISobI8R6p4J3s
	HDbeye4ovX0oJQ3b1ubxr9MlKjXLtuhK9yVLY64h8emZCUK2ePzmk2mItRw5+OWHdZVeHXSvWsJ
	St/yj1arbl75NQgFvOB4Z4V3djfDh33/8ZGMbsFBEHLfqYKm5uNWIiQv9GOtm7wbVpdUe5x/S3Z
	bgZ6IPNt1uYcrPK+lMYRzGT4ud4fPY9nm6Eyh4apGHBug+e9LSX6XgKZmIqmOAcYqnV7IY1qF8u
	9NsfV/oOPxekokYj58bTd4KWLsFs+R5Ay82czlnuIuTSmuWXDkQ3sW45d5DUBY596EAwnndFDNs
	CV6Or6m9tCsDC02hVNSYdZdTYiUgkuDogoBDmY3Jhj6DZU3SybKtOgGV/kNSG2n6IPR9gKr5XmF
	A2aDj9mg87cKPI4igH5PUB2MgzB8F+t89+1x39kX85optltbhJbdvXjBWDD3gdYDtlrYTwx3N6i
	wrs9qFqbaGzE/l3PiE36t6uVbAWh7oeMxZ+yE/ZOBHHaku/tTKG7EFOV9DkC7y0NS4hw3W6n1Yq
	qesrCCDUiaemPtyQnsnb6aZosnUq5F0wNuweFPUTLaXRR7Isn10ZoHTuGM2IT60LytrTluleJC7
	YU4acTac7PcD3zLd7RIo6qbj1pGFhN0vFa/Ber2Xycc0WDZuWgm+z/HYUu7PZMNYZbI7ZhtnZof
	rQIW6h9ZfYc1AdW/CNx4R3uY/yMbytoYEO5bEJHQBuuTBl4OujRfFs/TEpt/xPu2Y=
X-Received: by 2002:a17:907:80a:b0:c49:ca4e:b978 with SMTP id a640c23a62f3a-c4d34d43ca7mr263019966b.49.1793977743633;
        Fri, 06 Nov 2026 07:09:03 -0800 (PST)
Received: from [192.168.100.100] (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d3567142fsm86548566b.34.2026.11.06.07.08.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 07:09:02 -0800 (PST)
Message-ID: <08037337-f8ac-4bca-b849-4c856d0bb68c@gmail.com>
Date: Fri, 6 Nov 2026 16:08:38 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [iommu?] memory leak in iommu_fwspec_init
To: syzbot <syzbot+fe84fc6a684e0beb86e2@syzkaller.appspotmail.com>,
 iommu@lists.linux.dev, jgg@ziepe.ca, joro@8bytes.org, kevin.tian@intel.com,
 linux-kernel@vger.kernel.org, robin.murphy@arm.com,
 syzkaller-bugs@googlegroups.com, will@kernel.org
References: <6ae402bb.0c1d3ab6.e3d48.006d.GAE@google.com>
Content-Language: en-US
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
In-Reply-To: <6ae402bb.0c1d3ab6.e3d48.006d.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/30/26 03:36, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    65ba8f34ec88 Merge tag 'xtensa-20261027' of https://github..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=15067d31580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=fbf447a1375a1948
> dashboard link: https://syzkaller.appspot.com/bug?extid=fe84fc6a684e0beb86e2
> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10b22a3c580000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/b4e738ce5f2b/disk-65ba8f34.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/1de9d1ecbbb6/vmlinux-65ba8f34.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/8a3d79b65181/bzImage-65ba8f34.xz
> 
> AI-generated root cause summary:
> A memory leak of `struct dev_iommu` occurs when `iommu_fwspec_init()` allocates
> `dev->iommu` via `dev_iommu_get()`, but subsequently fails on allocating the
> `iommu_fwspec` structure (e.g. via fault injection) and returns -ENOMEM without
> releasing `dev->iommu`. Furthermore, callers such as `iommu_mock_device_add()`
> do not invoke `dev_iommu_free()` on error from `iommu_fwspec_init()`. When
> device initialization fails and the device is released, `dev->iommu` remains
> allocated, causing an unreferenced object memory leak.
> 
> full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=fe84fc6a684e0beb86e2
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+fe84fc6a684e0beb86e2@syzkaller.appspotmail.com
> 
> BUG: memory leak
> unreferenced object 0xffff88812bad6bc0 (size 64):
>   comm "syz.0.26", pid 5965, jiffies 4294941985
>   hex dump (first 32 bytes):
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>   backtrace (crc 0):
>     kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
>     slab_post_alloc_hook mm/slub.c:4733 [inline]
>     slab_alloc_node mm/slub.c:5033 [inline]
>     __kmalloc_cache_noprof+0x35f/0x3f0 mm/slub.c:5676
>     _kmalloc_noprof include/linux/slab.h:991 [inline]
>     _kzalloc_noprof include/linux/slab.h:1312 [inline]
>     dev_iommu_get drivers/iommu/iommu.c:408 [inline]
>     dev_iommu_get drivers/iommu/iommu.c:399 [inline]
>     iommu_fwspec_init+0x20d/0x240 drivers/iommu/iommu.c:3086
>     iommu_mock_device_add+0x29/0x90 drivers/iommu/iommu.c:385
>     mock_dev_create drivers/iommu/iommufd/selftest.c:1026 [inline]
>     iommufd_test_mock_domain drivers/iommu/iommufd/selftest.c:1068 [inline]
>     iommufd_test+0x1a97/0x2ec0 drivers/iommu/iommufd/selftest.c:2104
>     iommufd_fops_ioctl+0x1ed/0x370 drivers/iommu/iommufd/main.c:556
>     vfs_ioctl fs/ioctl.c:51 [inline]
>     __do_sys_ioctl fs/ioctl.c:597 [inline]
>     __se_sys_ioctl fs/ioctl.c:583 [inline]
>     __x64_sys_ioctl+0xf4/0x140 fs/ioctl.c:583
>     do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
>     do_syscall_64+0xe9/0x530 arch/x86/entry/syscall_64.c:84
>     entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> connection error: failed to recv *flatrpc.ExecutorMessageRawT: EOF
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> 
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
> 
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
> 
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
> 
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
> 
> If you want to undo deduplication, reply with:
> #syz undup
Please move the fix out of iommu_fwspec_init() and into
iommu_mock_device_add(), and leave iommu_fwspec_init() unchanged. The
same core-level approach for this leak was already rejected by Robin
Murphy on 2026-11-02 [1]. iommu_fwspec_init() is designed to run
together with iommu_probe_device() or with a caller that cleans up after
a failure, as of_iommu_configure() does. The defect is the early return
in iommu_mock_device_add().

The leak happens because iommu_mock_device_add() returns the error of
iommu_fwspec_init() without freeing dev->iommu. iommu_fwspec_init() can
allocate dev->iommu with dev_iommu_get() and then fail to allocate the
fwspec. The mock device has not been added at that point, so no bus
notifier will ever call iommu_release_device() for it, and the
put_device() in mock_dev_create() frees only the mock device. When
iommu_fwspec_init() fails, iommu_mock_device_add() should call
dev_iommu_free() if dev->iommu is set. The check is needed because
iommu_fwspec_init() can also fail before it allocates anything, for
example when dev_iommu_get() itself fails. The existing dev_iommu_free()
on the device_add() failure path is correct and must stay. One error
label shared by both failure paths is a clean way to write it.

Please change the tag to:

  Fixes: 2a918911ed3d ("iommufd: Register iommufd mock devices with fwspec")

That commit added the early return that leaks. The current tag names
72acd9df18f1, a v5.7 change, so stable tooling would try to carry a core
change to trees that do not even have the mock helper, which only exists
since v6.18.

The commit message has to describe the new placement: name the early
return in iommu_mock_device_add() as the cause and explain why nothing
else frees dev->iommu for a mock device that was never added.

While rewriting the message, please also keep it short. From the
kmemleak report, the allocation chain (dev_iommu_get, iommu_fwspec_init
and iommu_mock_device_add with their source lines) is enough. The hex
dump, the object address, the comm line and the syscall entry frames can
go. Two or three short paragraphs are enough for this change.

[1] https://lore.kernel.org/all/7e209fb2-4bda-4207-9109-c67c8df41e05@arm.com/

-- 
Krystian Kaniewski
