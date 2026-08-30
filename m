Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE2C184540
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 22:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788127560; cv=none; b=qQfGYFFueueUKTidqrwiX6FjIYhVDfTymWBjTcjxFLejH/493hOMfuX9x75g6rA3mYHiK0I/n9ncPMstNjDfQk69t1Fm3tRsnU+ybWD22pbhJ3IQc52hiPLKkToepicPt0V3yJPEL2OdIpLMhA4buUYxyu6lQOlPA400UYgpgmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788127560; c=relaxed/simple;
	bh=yg0YIFQWWoTzMxH5VP0SrkrdLgBRbjLUSg+jirwYxK8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=O7DalEvomit8mh/kQQ6LuM3U4wNzkiFibfA01UI6YdKfFAzCs9Qb+or57DJC8YSKcMkBE/D+Kqp+eikBf/fVcQyhqydasCWDb+gtGQSH3S5FfVrb/eEvDas3n9M2Gl2hxqHU69j1pfvxYHnGEallIKwugVU8aMPIqv9GHbSLQuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=V3dcagLd; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="V3dcagLd"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2020421077so426010766b.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 15:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788127556; x=1788732356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3GN4RGJsJq6wjlUSRnp3gh6wHugssuscZPgLbZeLcBE=;
        b=V3dcagLdszouJEf8KP6HIkUFus/HE6NOuep+Bi8HVgZ+UOc1wQ+hJVIVlzSs+hxos/
         VAMdUe700yYhsRHFc3SG5UtcZiHfiVWX/YCipbsgpqaFjY1a497Qq/ch++w5M71p0MUf
         RY0EPnLuLz0u+IHvfZmi3+2tFAYZIeRPGNJcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788127556; x=1788732356;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3GN4RGJsJq6wjlUSRnp3gh6wHugssuscZPgLbZeLcBE=;
        b=Sqh3efaWXLVshGGdGHujhO3G7Uv9BvAG5Dz2wIMT65LXnrYEkhr0HI2PachjgACny9
         J5lT9PLozwvVQ+SrRZDk1mLFPg9J+I1SqJ7LfS+EqTzt31l5ksuhTpKFwUOGkHuu3Hj3
         81orEQVbtRpt2SEuaFdRDawX5cFhyoRY6w0yAO+YGd7dYO/y2B2nlmw2BlZZJ9QSmIb7
         qw3TcJKvqYvw7lUJdByahqQKU4xfE4FMktfgk/pkP1riH6PFshvWUF4503xTzFqEh0L1
         Fii3bIFqQIWbm31s5CfJaNB6Zo0gwOIumad+MA4kLBsq5OhUW2Pj75tgvm2U1zkFJ0m4
         5BPA==
X-Gm-Message-State: AFuF++kph0yIh2s6/YDJnIW4drD9vnprIyZom68i+Ep4kLDtyJy68kTE
	Z0uiW9V4+PirS3DMWNrp3R6ge/im7ij7RaFLo39NZEEDzkLnyL/IG6Xp+mmvF6m0HfSRN3g53Wy
	uGp0IOg0=
X-Gm-Gg: AR+sD13/cdffc4rpE9TRpDJrwK/kIt19JmDj7pWgAo4hUc7Nt/ESzWQi3FkQeWhT8cf
	iMGgsZhyPgYsPc7n7e52ykNq23oULhitqyaI4OkETHY7qZ57vWEuP8qoOLLiz+j0kNm9b+B100R
	7IyqfYqL3u0Z06d8m9TAfjxmZgHhoulSleYHmubHzYmBbcwZtTJPcyXoQlvv0A5krFD1v9sVeLY
	oze1pjKmm6fg+PI2PKzsJtUka3peAZ3LKSpTJybRI3K7mvJbvdIypeWZxLpc1gfmkuqSt6mx0Vv
	lbS5UKCjRx+DGOmgkv6HxcEAQehChhYVXarRNlgtlCTJNccYUaft/z0cm5ghSJ+OBtDpuNmwGA1
	EAwVWZQdp6dx2wOHuXU1UWojxzJ9Qktp1yrIi/MEiEeKL/zPLk3XvtLpiLotbR5vaxKW1+Nop2r
	XJ071qbrfgzHTYpQKGQEF80IsZuPvPhgOIn26FOEneoHLi8uVPbOcamO+11UIatwMOY1AHXuRoA
	4I5TYtxBhma7F2HmkjbCc7Uh5WYQYvZQkh4NIqXzKYdfFbB
X-Received: by 2002:a17:906:fe02:b0:c25:833d:383e with SMTP id a640c23a62f3a-c25833d3abdmr604309166b.13.1788127555658;
        Sun, 30 Aug 2026 15:05:55 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee09eb6sm350533566b.10.2026.08.30.15.05.55
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 15:05:55 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-69f7fa1c548so4323564a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 15:05:55 -0700 (PDT)
X-Received: by 2002:a05:6402:3812:b0:6a3:6d83:ba44 with SMTP id
 4fb4d7f45d1cf-6a60d2f3663mr13678260a12.2.1788127554704; Sun, 30 Aug 2026
 15:05:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 30 Aug 2026 15:05:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjpN3XkKU+JX6zoh_bzJXr1aPYN4FY14UX0z7yCidosPQ@mail.gmail.com>
X-Gm-Features: AcwNN1UPpUsoAN4gDNhtODEphuSk6KzYoVwvGIkJ-YvBAz9tO0ks7hpZmcpzgBw
Message-ID: <CAHk-=wjpN3XkKU+JX6zoh_bzJXr1aPYN4FY14UX0z7yCidosPQ@mail.gmail.com>
Subject: Linux 7.3-rc1
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Two weeks have passed, it's Sunday afternoon, and the merge window has clos=
ed.

Nothing really stands out - except for the fact that it's big. It's
not the biggest rc1 we've ever had, but it's certainly up there, at
least in number of commits.

And I don't think that surprises anybody any more. It's all the same
pattern we've been seeing for a while now.

It's also big as an actual diff, and the reason for *that* is not
surprising either: this is yet another one of those releases with a
big AMD GPU register dump. This time it's the AMD DCN6 register
headers. They're huge. As usual. That's what you get when you dump all
the hardware definitions as C header #defines. There's also the
accompanying code for the new gen. All in all, that AMD GPU code and
header dump accounts for about a third of the whole rc1 patch.

But if you just mask out that big chunk, things look pretty normal,
and this merge window didn't feel that different from most of them
despite being large. I made it unnecessarily hard for myself by being
a grade A nincompoop and doing a system upgrade in the middle, and
then having to chase down an issue that caused, but that was entirely
on me. I knew I shouldn't have done it, but I just naively went
"nothing will go wrong". And hey, it was all good in the end, I just
made this merge window harder for myself than I should have.

Let's hope the rest of this release will go smoothly. And be small and
uneventful. But who am I kidding? It almost certainly won't be small,
but I can always hope.

                Linus

---

Alex Williamson (1):
    VFIO updates

Alexandre Belloni (2):
    I3C updates
    RTC updates

Alison Schofield (1):
    NVDIMM and DAX updates

Andi Shyti (3):
    i2c updates
    more i2c updates
    i2c fixes

Andreas Gruenbacher (1):
    gfs2 updates

Andreas Hindborg (1):
    configfs update

Andrew Morton (4):
    MM updates
    hotfixes
    non-MM updates
    more MM updates

Andy Shevchenko (1):
    auxdisplay updates

Ard Biesheuvel (1):
    EFI updates

Arnd Bergmann (4):
    SoC devicetree updates
    SoC driver updates
    SoC defconfig updates
    ARM SoC platform updates

Bartosz Golaszewski (3):
    power sequencing updates
    gpio updates
    another power sequencing update

Bjorn Andersson (3):
    remoteproc updates
    rpmsg updates
    hwspinlock updates

Bjorn Helgaas (1):
    PCI updates

Borislav Petkov (5):
    x86 MCE update
    x86 alternatives update
    x86 resource control updates
    x86 cleanups
    x86 cpuid updates

Carlos Maiolino (1):
    xfs updates

Casey Schaufler (1):
    smack updates

Christian Brauner (15):
    misc ipc and core updates
    binfmt updates
    efs and freevxfs removal
    failfs filesystem
    FAT update
    iomap updates
    vfs bpf access updates
    kthread vfs updates
    vfs lookup updates
    misc vfs updates
    mount updates
    cachefiles ondemand removal
    overlayfs updates
    vfs superblock updates
    vfs writeback updates

Chuck Lever (1):
    nfsd updates

Corey Minyard (1):
    ipmi updates

Damien Le Moal (1):
    ata updates

Daniel Borkmann (1):
    bpf updates

Danilo Krummrich (1):
    driver core updates

Dave Airlie (2):
    drm updates
    more drm updates

Dave Hansen (4):
    x86 entry update
    misc x86 updates
    x86 TDX updates
    x86 mm updates

Dave Jiang (1):
    CXL updates

David Sterba (1):
    btrfs updates

Dmitry Torokhov (1):
    input updates

Eric Biggers (3):
    fscrypt updates
    crypto library updates
    crypto library test updates

Gabriel Krisman Bertazi (1):
    unicode updates

Gao Xiang (2):
    erofs updates
    more erofs updates

Geert Uytterhoeven (1):
    m68k updates

Greg KH (4):
    char/misc/IIO/etc driver updates
    staging driver updates
    USB / Thunderbolt updates
    TTY / serial driver updates

Greg Ungerer (1):
    m68knommu updates

Guenter Roeck (2):
    watchdog updates
    hwmon updates

Guo Ren (1):
    csky update

Helge Deller (2):
    fbdev updates
    parisc architecture updates

Herbert Xu (2):
    crypto update
    crypto fix

Huacai Chen (1):
    LoongArch updates

Ilpo J=C3=A4rvinen (1):
    x86 platform driver updates

Ilya Dryomov (1):
    ceph updates

Ingo Molnar (15):
    objtool updates
    performance events updates
    locking updates
    scheduler updates
    x86 MSR updates
    x86 boot updates
    x86 build update
    x86 core updates
    x86 documentation updates
    timer fixes
    irqchip driver fixes
    futex fixes
    scheduler fixes
    locking fix
    timer fix

Jaegeuk Kim (1):
    f2fs updates

Jakub Kicinski (2):
    networking updates
    networking fixes

James Bottomley (1):
    SCSI updates

Jan Kara (2):
    fsnotify updates
    ext2, udf, isofs, and quota updates

Jarkko Sakkinen (2):
    TPM update
    TPM updates

Jason Gunthorpe (3):
    iommufd updates
    fwctl updates
    RDMA updates

Jassi Brar (1):
    mailbox updates

Jens Axboe (3):
    io_uring update
    block updates
    io_uring fixes

Jiri Kosina (1):
    HID updates

Joel Granados (1):
    sysctl updates

Joerg Roedel (1):
    iommu updates

John Johansen (1):
    AppArmor updates

Jonathan Corbet (2):
    documentation updates
    more documentation updates

Juergen Gross (1):
    xen updates

Julia Lawall (1):
    Coccinelle updates

Kees Cook (1):
    execve update

Konstantin Komarov (1):
    ntfs3 updates

Lee Jones (3):
    MFD updates
    LED updates
    backlight updates

Linus Walleij (1):
    pin control updates

Madhavan Srinivasan (1):
    powerpc updates

Magnus Lindholm (1):
    alpha updates

Marco Elver (1):
    Kernel Concurrency Sanitizer (KCSAN) update

Marek Szyprowski (2):
    dma-mapping updates
    dma-mapping fix

Mark Brown (5):
    regmap updates
    regulator updates
    spi updates
    regulator fix
    spi fixes

Martin Petersen (1):
    more SCSI updates

Masami Hiramatsu (2):
    probes updates
    bootconfig updates

Mauro Carvalho Chehab (1):
    media updates

Max Filippov (1):
    Xtensa updates

Michael Tsirkin (1):
    vhost,vdpa,virtio updates

Micka=C3=ABl Sala=C3=BCn (1):
    Landlock update

Miguel Ojeda (2):
    Rust updates
    Rust fixes

Mike Marshall (1):
    orangefs updates

Mike Rapoport (4):
    memblock updates
    kexec updates
    liveupdate updates
    more liveupdate updates

Miklos Szeredi (1):
    fuse updates

Mikulas Patocka (1):
    device mapper updates

Mimi Zohar (1):
    integrity updates

Miquel Raynal (1):
    mtd updates

Namhyung Kim (1):
    perf tools updates

Namjae Jeon (3):
    exfat updates
    smb server updates
    ntfs updates

Nicolas Schier (1):
    Kbuild/Kconfig updates

Paolo Bonzini (1):
    kvm updates

Paul McKenney (2):
    RCU updates
    smp_call_function() torture-test updates

Paul Moore (3):
    audit updates
    selinux updates
    LSM updates

Paul Walmsley
 (1):
    RISC-V updates

Paulo Alcantara (2):
    cifs maintainer update
    smb client updates

Petr Mladek (2):
    printk updates
    livepatching updates

Petr Pavlu (1):
    module updates

Rafael Wysocki (7):
    ACPI support updates
    power management updates
    thermal control updates
    more ACPI support updates
    more power management updates
    more thermal control updates
    ACPI support fix

Richard Weinberger (1):
    UBI and UBIFS updates

Rob Herring (2):
    devicetree updates
    devicetree fixes

Russell King (1):
    arm updates

Sebastian Reichel (2):
    HSI updates
    power supply and reset updates

Serge Hallyn (1):
    capabilities update

Shuah Khan (2):
    kunit updates
    kselftest update

Stafford Horne (1):
    OpenRISC updates

Stephen Boyd (1):
    clk updates

Steven Rostedt (8):
    Real-time Verifier updates
    RTLA updates
    ftrace updates
    tracing updates
    tracefs updates
    ring-buffer updates
    runtime verification fix
    tracing fixes

Takashi Iwai (2):
    sound updates
    sound fixes

Takashi Sakamoto (1):
    firewire updates

Ted Ts'o (1):
    ext4 updates

Tejun Heo (3):
    workqueue updates
    cgroup updates
    sched_ext updates

Thomas Bogendoerfer (1):
    MIPS updates

Thomas Gleixner (10):
    generic entry code updates
    rseq updates
    generic interrupt subsystem updates
    interrupt chip driver updates
    futex updates
    SMP core updates
    treewide timer related cleanups
    clocksource/event driver updates
    timer and timekeeping core updates
    VDSO updates

Thomas Wei=C3=9Fschuh (1):
    nolibc updates

Trond Myklebust (1):
    NFS client updates

Tyler Hicks (1):
    eCryptfs updates

Tzung-Bi Shih (2):
    chrome platform updates
    chrome platform firmware updates

Ulf Hansson (2):
    pmdomain updates
    MMC updates

Uwe Kleine-K=C3=B6nig (1):
    pwm updates

Vasily Gorbik (1):
    s390 updates

Viacheslav Dubeyko (2):
    HFS updates
    nilfs2 updates

Vinod Koul (3):
    soundwire updates
    phy updates
    dmaengine updates

Vlastimil Babka (1):
    slab updates

Wei Liu (1):
    hyperv updates

Will Deacon (2):
    arm64 updates
    arm64 fixes

Yury Norov (1):
    bitmap updates
