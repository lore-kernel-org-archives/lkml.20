Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631086;
	b=wNxKzApS0jdNkRgTsaV5VWFbrMmHEusC0tjmNG4u+sqTQ742UbQI8NOYIlBH0jpzFlri
	 WD75iE0qg7+00G/xFTa/GFIsbv8Ogk914uqy4iG7eI8Q/EKGvQlvslvBiXWL1CavtF/xS
	 8JvEvotoCVcVFtrjI1iu4an6i/WhPPvcQWZo5wFs3qz8W6t18j4byAvbJ76gPz2ivqS9k
	 7j27VyGmF+XC/ccebtfPdHUODEOTFrfz2/PVgKDtWv6IMtyjZfxd3Kv1bTYzp7w/7Epjs
	 ahKzDhoDGCOj5P6UdA5ORaGQBWy70AdH/zSFDT0rqA2I40UY4ST/Uoypt545jrCwIdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631086;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=1gA7AykdGNs+13YD8Htv7yTQMWHoAZLwgWLmdn7QAcA=;
	b=P4f0Z93/6eXTJc1DW/IVamHhXgBcY2iqFfzd19Hzf71i6F+ORINJ5DRnrT3E4sdM253F
	 8hY4B2YUkaE3Kpo9F+oEf8VOfXxC5MxqDPtP3CkRb2ggZEOsnSvMw4hNgkowTA40AO3eN
	 nB4bEGhz/4fkyyiU81HSeT9QM6IZFCHh5v/UMUP5tnJkCziyx5QsmtLnwtHnZjURPaciO
	 HYIgerlUWrmUoMLA5NA33p5dEFaINFuEDbEekWFAXgnHzSjR59f21JQS/G6A1PT6XMC3Z
	 0BRYu2ShtI6LKgYY5MprRCM/6Moz6KSQIKIW3OakvtqSvk2I37It5X7SQqrPqYbEGnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=LEjBpVl8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A861D607670F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=LEjBpVl8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D846B1F00A16;
	Mon,  2 Nov 2026 14:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793631085;
	bh=1gA7AykdGNs+13YD8Htv7yTQMWHoAZLwgWLmdn7QAcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LEjBpVl8xNYm+lF+L0gSZoo2Nr2LeacNy0TIYqaxOmxjDc5I8s7vmMgRtsYttCwzD
	 DxJFWZuucWdORpbmYChiER40eTrRpxEHMA3xApsTMLiPxnfAF5qraMVF6IhXhyiOMT
	 wv2J/aSEUTh70v7WcCG/aebtxHmLR115+yu4KfCc=
Date: Mon, 2 Nov 2026 15:51:18 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Linus 7.4-rc1
Message-ID: <2026110241-yarn-tweak-084d@gregkh>
References: <CAHk-=whOCnAwXz-FMRdQEDJQ+9b2YXh9M=GHgRay0o4cxSmPVg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHk-=whOCnAwXz-FMRdQEDJQ+9b2YXh9M=GHgRay0o4cxSmPVg@mail.gmail.com>

On Sun, Nov 01, 2026 at 02:08:46PM -0800, Linus Torvalds wrote:
> That said, a small part of the "this is a big merge window" may also
> be that people are expecting 7.4 to be the next LTS release, which is
> another independent reason why some releases tend larger than others.
> So it may not *just* be the flood of AI patches.

To be clear, I had assumed that 7.4 would be released the first week of
January if we had had a 3 week -rc1 cycle, so am planning on 7.3 to be
the next LTS kernel, which would have put the 7.4.0 release on the 27th
if everything had gone "well".

But now the scripts say:
	current status: 7.4-rc1
	---
	7.4 window open : 2026-10-19
	7.4 window close: 2026-11-01
	7.4 rc1         : 2026-11-01  <-- you are here
	7.4 final       : 2026-12-20
	---

That being said, if people are trying to "force" stuff into 7.4 that's
the best possible reason to NOT have it be the next LTS release as we
have had this happen in the past and suffered greatly for it.

So let's just count on 7.3.y to be the next LTS unless something really
crazy comes up with it that would prevent that from happening.

thanks,

greg k-h



> 
> Whatever the reason(s) for a big release, it's huge both in commits -
> almost 20k commits vs the more common ~15k - and as a diff. Although
> the diff is large partly for the other traditional reason: yet another
> AMD hardware register dump into huge headers. A full third of the
> patch is just AMD GPU register offsets and bit masks. We've been here
> before, and I'm sure we'll see it many times again in the future. Just
> ignore the noise.
> 
> And if you *do* ignore that noise, it all looks fairly normal. Large,
> and full of fixes for issues found by AI (and more and more the
> patches have been suggested by AI too, although they often get
> rewritten). But not otherwise looking very strange. About half drivers
> (again, ignoring the AMD GPU headers - if you don't, it's more like
> 2/3rds drivers), with the rest being spread all over, and in the usual
> places. Architecrture updates, filesystems (both core vfs layer and
> individual low-level filesystems), tooling (mainly perf, and also a
> lot of selftest updates). and core kernel (networking, rust, bpf, mm:
> a little bit of everything).
> 
> And even more than usual, you don't want to see the shortlog. Being a
> large merge window means that just the "shortlog" is 24k lines and
> 1.2MB total. So below is my usual merge summary, which will act as a
> kind of high-level overview of the areas that have changed. You'll
> need to get the git tree for full details (or more likely, to then
> look at the particular areas you are interested in).
> 
>                   Linus
> 
> ---
> 
> Alex Williamson (1):
>     VFIO updates
> 
> Alexandre Belloni (2):
>     I3C updates
>     RTC updates
> 
> Alexei Starovoitov (2):
>     bpf updates
>     bpf fixes
> 
> Alison Schofield (1):
>     NVDIMM and DAX updates
> 
> Amir Goldstein (1):
>     overlayfs fixes
> 
> Andi Shyti (2):
>     i2c updates
>     more i2c updates
> 
> Andreas Gruenbacher (1):
>     gfs2 updates
> 
> Andrew Morton (3):
>     MM updates
>     non-MM updates
>     more MM updates
> 
> Andy Shevchenko (1):
>     auxdisplay updates
> 
> Anna Schumaker (1):
>     nfs client updates
> 
> Ard Biesheuvel (1):
>     EFI updates
> 
> Arnaldo Carvalho de Melo (1):
>     perf tool updates
> 
> Arnd Bergmann (4):
>     SoC devicetree updates
>     SoC driver updates
>     SoC defconfig updates
>     ARM SoC board file updates
> 
> Bartosz Golaszewski (3):
>     power sequencing updates
>     gpio updates
>     gpio fixes
> 
> Bjorn Andersson (2):
>     remoteproc updates
>     rpmsg updates
> 
> Bjorn Helgaas (1):
>     PCI updates
> 
> Borislav Petkov (10):
>     EDAC updates
>     x86 asm update
>     x86 CPU speculation updates
>     x86 resource control updates
>     x86 cleanups
>     x86 cpu feature updates
>     x86 FPU state updates
>     x86 platform updates
>     x86 SEV updates
>     x86 boot updates
> 
> Breno Leitao (1):
>     configfs updates
> 
> Carlos Maiolino (1):
>     xfs updates
> 
> Catalin Marinas (2):
>     arm64 updates
>     arm64 fixes
> 
> Christian Brauner (21):
>     ipc fix
>     namespace updates
>     signal handling updates
>     bfs removal
>     buffer_head updates
>     binfmt updates
>     close_range updates
>     coredump updates
>     file table updates
>     vfs idmap constification
>     iomap updates
>     kernfs updates
>     path lookup updates
>     misc vfs updates
>     mount updates
>     netfs updates
>     pidfd updates
>     superblock updates
>     file closing updates
>     vfs keyring updates
>     vfs fixes
> 
> Chuck Lever (1):
>     nfsd updates
> 
> Daniel Thompson (1):
>     kgdb updates
> 
> Danilo Krummrich (3):
>     driver core updates
>     driver core fixes
>     more driver core fixes
> 
> Dave Airlie (2):
>     drm updates
>     drm fixes
> 
> Dave Hansen (4):
>     x86 kdump update
>     x86 microcode loader update
>     x86 mm updates
>     x86 TDX updates
> 
> Dave Jiang (1):
>     CXL updates
> 
> David Hildenbrand (1):
>     core memory management updates
> 
> David Sterba (3):
>     btrfs updates
>     affs updates
>     more btrfs updates
> 
> David Teigland (1):
>     dlm updates
> 
> Dinh Nguyen (1):
>     NIOS2 update
> 
> Dipen Patel (1):
>     hte updates
> 
> Dmitry Torokhov (1):
>     input updates
> 
> Eric Biggers (5):
>     crypto library updates
>     fscrypt updates
>     fsverity updates
>     fscrypt fixes
>     fsverity fixes
> 
> Fan Wu (1):
>     IPE updates
> 
> Frederic Weisbecker (1):
>     kthread fix
> 
> Gao Xiang (2):
>     erofs updates
>     erofs fixes
> 
> Geert Uytterhoeven (1):
>     m68k updates
> 
> Greg KH (4):
>     staging driver updates
>     tty / serial driver updates
>     USB / Thunderbolt update
>     Char/Misc/IIO/others driver updates
> 
> Greg Ungerer (1):
>     m68knommu updates
> 
> Guenter Roeck (2):
>     watchdog updates
>     hwmon updates
> 
> Harry Yoo (1):
>     slab updates
> 
> Heiko Carstens (1):
>     s390 updates
> 
> Helge Deller (3):
>     fbdev updates
>     parisc updates
>     more fbdev updates
> 
> Herbert Xu (1):
>     crypto updates
> 
> Huacai Chen (1):
>     LoongArch updates
> 
> Ilpo Järvinen (1):
>     x86 platform driver updates
> 
> Ilya Dryomov (1):
>     ceph updates
> 
> Ingo Molnar (12):
>     scheduler updates
>     locking updates
>     objtool updates
>     perf events updates
>     kexec / irq fix
>     perf events fixes
>     scheduler fixes
>     timer fixes
>     x86 fix
>     misc irqchip fixes
>     timer fixes
>     scheduler fix
> 
> Jaegeuk Kim (1):
>     f2fs updates
> 
> Jakub Kicinski (1):
>     networking fixes
> 
> James Bottomley (2):
>     SCSI updates
>     more SCSI updates
> 
> Jan Kara (2):
>     fsnotify updates
>     ext2, isofs, udf and quota updates
> 
> Jarkko Sakkinen (2):
>     keys updates
>     TPM updates
> 
> Jason Gunthorpe (4):
>     TSM update
>     iommufd updates
>     rdma updates
>     fwctl update
> 
> Jassi Brar (1):
>     mailbox updates
> 
> Jens Axboe (5):
>     io_uring updates
>     block updates
>     io_uring dma-buf support
>     io_uring fixes
>     more block updates
> 
> Jiri Kosina (1):
>     HID updates
> 
> Joel Granados (1):
>     sysctl updates
> 
> Joerg Roedel (1):
>     IOMMU updates
> 
> Johannes Berg (1):
>     UML updates
> 
> John Johansen (1):
>     AppArmor fixes
> 
> John Paul Adrian Glaubitz (1):
>     sh updates
> 
> Jonathan Corbet (2):
>     documentation updates
>     more documentation updates
> 
> Juergen Gross (1):
>     xen updates
> 
> Kees Cook (3):
>     pstore updates
>     seccomp updates
>     hardening updates
> 
> Konstantin Komarov (1):
>     ntfs3 updates
> 
> Lee Jones (3):
>     MFD updates
>     LED updates
>     backlight updates
> 
> Len Brown (1):
>     x86 power utilities updates
> 
> Linus Walleij (1):
>     pin control updates
> 
> Madhavan Srinivasan (1):
>     powerpc updates
> 
> Magnus Lindholm (1):
>     alpha updates
> 
> Marco Elver (1):
>     KCSAN updates
> 
> Marek Szyprowski (1):
>     dma-mapping updates
> 
> Mark Brown (6):
>     regulator updates
>     spi updates
>     regmap updates
>     regmap fix
>     regulator fix
>     spi fixes
> 
> Masami Hiramatsu (3):
>     probes updates
>     bootconfig updates
>     bootconfig fix
> 
> Matt Turner (1):
>     alpha floating point emulation fix
> 
> Mauro Carvalho Chehab (2):
>     media updates
>     media update
> 
> Max Filippov (1):
>     xtensa updates
> 
> Michael Tsirkin (1):
>     vhost,virtio updates
> 
> Michal Simek (1):
>     arch/microblaze updates
> 
> Mickaël Salaün (1):
>     Landlock update
> 
> Miguel Ojeda (2):
>     Rust updates
>     Rust fixes
> 
> Mike Marshall (1):
>     orangefs updates
> 
> Mike Rapoport (3):
>     memblock updates
>     kexec updates
>     liveupdate updates
> 
> Miklos Szeredi (1):
>     fuse updates
> 
> Mikulas Patocka (1):
>     device mapper updates
> 
> Mimi Zohar (1):
>     IMA updates
> 
> Miquel Raynal (1):
>     MTD updates
> 
> Namjae Jeon (4):
>     smb server updates
>     exfat updates
>     ntfs updates
>     smb server fixes
> 
> Nathan Chancellor (2):
>     Kbuild / Kconfig updates
>     Kbuild fixes
> 
> Niklas Cassel (1):
>     ata updates
> 
> Paolo Abeni (1):
>     networking updates
> 
> Paolo Bonzini (2):
>     KVM updates
>     more KVM updates
> 
> Paul McKenney (3):
>     two-byte cmpxchg emulation
>     RCU updates
>     CSD lock updates
> 
> Paul Moore (3):
>     audit updates
>     selinux updates
>     lsm updates
> 
> Paul Walmsley (1):
>     RISC-V updates
> 
> Paulo Alcantara (2):
>     smb client updates
>     smb client fixes
> 
> Petr Mladek (2):
>     printk updates
>     livepatching updates
> 
> Petr Pavlu (1):
>     module updates
> 
> Rafael Wysocki (6):
>     ACPI support updates
>     power management updates
>     thermal control updates
>     ACPI support fixes
>     power management fixes
>     thermal control fixes
> 
> Rob Herring (1):
>     devicetree updates
> 
> Russell King (1):
>     ARM updates
> 
> Sebastian Reichel (1):
>     power supply and reset updates
> 
> Shuah Khan (2):
>     kselftest updates
>     kunit update
> 
> Stephen Boyd (1):
>     clk updates
> 
> Steven Rostedt (6):
>     runtime verifier updates
>     RTLA tooling updates
>     ftrace updates
>     ring-buffer updates
>     tracing updates
>     ktest updates
> 
> Takashi Iwai (2):
>     sound updates
>     sound fixes
> 
> Takashi Sakamoto (1):
>     firewire updates
> 
> Ted Ts'o (1):
>     ext4 updates
> 
> Tejun Heo (5):
>     workqueue updates
>     cgroup updates
>     sched_ext updates
>     cgroup fixes
>     sched_ext fixes
> 
> Thomas Bogendoerfer (1):
>     MIPS updates
> 
> Thomas Gleixner (6):
>     irq updates
>     irq chip driver updates
>     clocksource updates
>     timer core updates
>     NOHZ updates
>     VDSO updates
> 
> Thomas Weißschuh (1):
>     nolibc updates
> 
> Tzung-Bi Shih (2):
>     chrome platform updates
>     chrome platform firmware loader updates
> 
> Ulf Hansson (2):
>     MMC updates
>     pmdomain updates
> 
> Uwe Kleine-König (1):
>     pwm updates
> 
> Viacheslav Dubeyko (2):
>     nilfs2 updates
>     hfs/hfsplus updates
> 
> Vinod Koul (3):
>     soundwire updates
>     phy updates
>     dmaengine updates
> 
> Wei Liu (1):
>     hyperv updates
> 
> Yury Norov (1):
>     bitmap updates
> 
