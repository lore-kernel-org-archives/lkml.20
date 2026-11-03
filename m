Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793734257;
	b=VyUKuceNkCa6nfnb68dMiT1OnEZtJ1VR3thfNVSX5iDtpPTmmfPd3n+lAPPlWlKSEodl
	 T9ZB2vbFAyJ/HP6fslyUtMp6hukPaCnfMmftYN1QR8ZocKGhcPhrxedRni0sBF3x6Dpb/
	 usRe03J+UIJhrmukQFieYVAOmxihV6h/w2x2JhdtKSAzO9zeEYIOrYe0c0QedqHmHN4AQ
	 FXVyZPzYi7pkzjqPseqQJkWYjiMH3LEOnHyznq2nyga2PMcahUtplTcOtKxHEEcUaJjQV
	 mDFU2XgEfpK+5CBRxySoiC+9g+/KwfCQHqSSdjhS0U5rIazMIHXO+crqCMYtS2g4J2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793734257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ol+BxDvRemY6Ku0qA5WjxMZaCPkLClMzCXcMgSvJhxU=;
	b=wd5gIeUvoiNwe3qmfy7t9CYGOsxwQLc8L1DxXf2IWqAUErDE1v1tLwIG1m12mKc1z3b7
	 N9hQsc008eqS9Xpyq/OdR30XWJ/H3bvdnIXvyAXHFsBlSRUw/1jZ6ptokZVwU3O0f6Q5Y
	 J+TUUIMx552CI1ImsXAM4V6SEbudB+Bzge4PxBfyxKXHduYDJQeIabso8pMrR7aGi8tDs
	 oX73vnEjcRSqotjnuX9PcOdQiU55pFzH/TT1M50WGGYCKHvWFzt0245vzwQajlDaoHZBo
	 tU+jSQVP/qYgpSAiFErlnIX27fJqo0JLONwPxH2O6/heew9EQf6iVVZVyfxhTAED7Rw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M9xq1zQg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CABF606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CABF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M9xq1zQg
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6774639a8a4so37696d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:30:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793734255; cv=none;
        d=google.com; s=arc-20260327;
        b=ppE2+4s0u83k+rGEY760y4/CiBYK+rxkmVfJxr4vBOkur98Xwum1IQ0a3wMs2xbrFI
         NB2zC9PLfejEZZmCowLYWh3qFCHo478339J9SfHFhuSvcEvWgURrxKHWm8v8jOcb0N25
         nek+YQ5u3j/8d4u89gV1yp1hd5NDU/pD1ouvxD26dV4vjC52w6ZusLPKRsv9ISaG51r8
         LCIoAUR1HVCNMgeVSkfzjxBiA4hQ44rsobxzYMiC2Nd3hq09iV4kxKeImXgnDUXsJIiZ
         HqFXmKWG7fSBL6LGSCLJdfntnbgIJsCkJAPCTQXElcIhMrqHhUzRR8bjfePi0LuHTa+l
         YY3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ol+BxDvRemY6Ku0qA5WjxMZaCPkLClMzCXcMgSvJhxU=;
        fh=353kjxXT3keU8dO0bayOoHh2J8yyeQx6F7mTfLn6aag=;
        b=AG0RHkGI+rfX4voaHyF1stVvq5ZCQYpUuyzfN4G0DkvBzVkjCehwNrEK+v7kOgQ4+9
         zgvMPGWlqIcYGahr1xphvrZCM66sKJU+SeTQOQPJ9L5ir1fz3yI5dRkf1lg5VmjtCOrG
         TltM1O1CRw46xI9Kg41OC9cBb5wW9BRCvO9VO2RCnT1bb+/ep8UbEjhza9kmA40rzanQ
         xZH2EI/M5WGkJDeLs6V7CJC+xQX7E0sMxK94jgnUL1WZVHop00+CNker6etrRveFk0tz
         m/+nFe8CwpxhqsxplSauGDTtF3WvE33oPWMX4v9vco+I8GDnsw+k5B70ZGgrR6M9aDZW
         /PEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793734255; x=1794339055; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ol+BxDvRemY6Ku0qA5WjxMZaCPkLClMzCXcMgSvJhxU=;
        b=M9xq1zQgu4PKqV5wr62uBzvYvDmnLtSXAfpCTILYghLZImeklNeELm3fMTe/Q+uHNC
         bSaFtwY69vA8kP8K/rjJX64vIi6mzUzMt461eEstrqS2vRosE1E48fn+nza0+6xLIJeG
         1+IM8S3MPd/OvrqDOGOFoZR70vr4KKM3hWivMxXEL9IkghJuKl7jI3JA3D8O0Nn8zryk
         CZpkkFX5zEDMkqQVjfUBh0CmrlF/1ZUo4I0vk1eHvOVvGieI1mMBmAc5PYHT8xHgLI9b
         f4KKQ0nPghuozNfb408NpwXjW4mYv/mXz2xPiO+ufcW22h9Dhi5ZvznXIu7CzS3QnuyA
         IYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793734255; x=1794339055;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ol+BxDvRemY6Ku0qA5WjxMZaCPkLClMzCXcMgSvJhxU=;
        b=n9sweCVVa40gv6V8swju4wi2JgpQ3gUbkBmNsPJbYoExmiTcNIy5YcipWeEuouujLo
         UYg4kKnuxiJUlMAIRnaaGMNMP1mZ73iejd88BIvdt1eIAyudZMEYvnF1ChX4H8/FXnO2
         Drxno3isXIM9UvhA5UCu50l0mBlfXR04GiTUgncCaumqC8rTUnjXSW3l4UezPPNfpTOW
         4SCWnSE150t0cDdO3p8w6qVQLI5pKjiD+mDLP9qZyzfOCulp+QR7jMsgv4/WKIucnYES
         ReCzRGDLDUJsUz4cAmEgo8rNoA1tVLon/eo66weR/PZKIvqFGN5L7Fsf197P76HRaaZi
         V83g==
X-Forwarded-Encrypted: i=1; AKwUvByZWINWWSsjjAu63TB642NOrGpHGldnCCo4rE6Q2ykSW1V3NjjZQbZ9b1fDTtrx23Rx3drfuXclHEusz1o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fcf6/1WlL/Mgwu4Oc5OgP2hFuJa30DmXK2aamw4flfC3nTcuZ
	dd22F3lsfmbFKZZd2jD55n1QTG6T1RVE77J8AEaBY6Moh/ms0j7OhIK8K09OyCF44xVKcnQhCvS
	Ax545eUiWbYvHK8AAgct2hMgg87PnGxg=
X-Gm-Gg: AYBFou1y5Ssej0iEX6exyBrJcscfe7C6wnA3vjJ0c4XZ7w17jLce1rM5nG0S+08eg8T
	2inQnVWF6XQMhwp8NPM+SSwDi8K+P9zpoq31/F8tyOUf7Q6kUidOyB93OfEFEh5dQ5pcg/iCU+e
	i3OvxEzoV15hPMa1YITvFvS+Rwk1vCFKfTaKuL2bX11cyfnvEpIDcIaGASqSUKniPB3CRZTvKPV
	chtoySElWzXMB2VnkZhHnjoaclyHfDlvALL4lbB7IuS9jEBXBi6D5s4TlRNlG3+Yv09iwZ0CTKs
	p8Hy169XW/kbo9uymfNtUGJndxYdwA5no0JxzGOr32QcoFKXeW/b0gohzZhNVpqL0+cDBGYMq26
	Tf8Tz6xBjXwYPb8Yec4VoAaNFNaFAghO/9o8yMb9sOHmNQ/rT0IjH3v6N2aAmUcc1MbWwQd1HIA
	KvCWGNJ6c90k8PfJZX9dZpuaQD32Mj07EiKkXK84VPF10E0yNi5DvZ3/jsla+T2dZiLoJLmdW90
	PAEimGoE3xAvy00nujpSBy1rCh5Y2vTp8Ui
X-Received: by 2002:a53:ac8b:0:b0:679:c916:46f2 with SMTP id
 956f58d0204a3-67ba4ef187bmr7958790d50.31.1793734255454; Tue, 03 Nov 2026
 11:30:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAHk-=whOCnAwXz-FMRdQEDJQ+9b2YXh9M=GHgRay0o4cxSmPVg@mail.gmail.com>
 <2026110241-yarn-tweak-084d@gregkh>
In-Reply-To: <2026110241-yarn-tweak-084d@gregkh>
From: Luna Jernberg <droidbittin@gmail.com>
Date: Tue, 3 Nov 2026 20:30:42 +0100
X-Gm-Features: AclHuK-cAq8TcLRbYjIEPe4uGumedQGYLjtc0Z_M9dhufOxjqJUT1nGwtfZ793c
Message-ID: <CADo9pHhLA14Rmr-YyBbdxYUZQUe-ky0wOb35odqtniyVhjf01g@mail.gmail.com>
Subject: Re: Linus 7.4-rc1
To: Greg KH <gregkh@linuxfoundation.org>, Luna Jernberg <droidbittin@gmail.com>, 
	Mikael Eriksson <mikael_eriksson@miffe.org>, nefelim4ag@gmail.com, admin@ptr1337.dev, 
	archlinux@heusel.eu
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Cool thanks for the info and the packages

Den m=C3=A5n 2 nov. 2026 kl 19:46 skrev Greg KH <gregkh@linuxfoundation.org=
>:
>
> On Sun, Nov 01, 2026 at 02:08:46PM -0800, Linus Torvalds wrote:
> > That said, a small part of the "this is a big merge window" may also
> > be that people are expecting 7.4 to be the next LTS release, which is
> > another independent reason why some releases tend larger than others.
> > So it may not *just* be the flood of AI patches.
>
> To be clear, I had assumed that 7.4 would be released the first week of
> January if we had had a 3 week -rc1 cycle, so am planning on 7.3 to be
> the next LTS kernel, which would have put the 7.4.0 release on the 27th
> if everything had gone "well".
>
> But now the scripts say:
>         current status: 7.4-rc1
>         ---
>         7.4 window open : 2026-10-19
>         7.4 window close: 2026-11-01
>         7.4 rc1         : 2026-11-01  <-- you are here
>         7.4 final       : 2026-12-20
>         ---
>
> That being said, if people are trying to "force" stuff into 7.4 that's
> the best possible reason to NOT have it be the next LTS release as we
> have had this happen in the past and suffered greatly for it.
>
> So let's just count on 7.3.y to be the next LTS unless something really
> crazy comes up with it that would prevent that from happening.
>
> thanks,
>
> greg k-h
>
>
>
> >
> > Whatever the reason(s) for a big release, it's huge both in commits -
> > almost 20k commits vs the more common ~15k - and as a diff. Although
> > the diff is large partly for the other traditional reason: yet another
> > AMD hardware register dump into huge headers. A full third of the
> > patch is just AMD GPU register offsets and bit masks. We've been here
> > before, and I'm sure we'll see it many times again in the future. Just
> > ignore the noise.
> >
> > And if you *do* ignore that noise, it all looks fairly normal. Large,
> > and full of fixes for issues found by AI (and more and more the
> > patches have been suggested by AI too, although they often get
> > rewritten). But not otherwise looking very strange. About half drivers
> > (again, ignoring the AMD GPU headers - if you don't, it's more like
> > 2/3rds drivers), with the rest being spread all over, and in the usual
> > places. Architecrture updates, filesystems (both core vfs layer and
> > individual low-level filesystems), tooling (mainly perf, and also a
> > lot of selftest updates). and core kernel (networking, rust, bpf, mm:
> > a little bit of everything).
> >
> > And even more than usual, you don't want to see the shortlog. Being a
> > large merge window means that just the "shortlog" is 24k lines and
> > 1.2MB total. So below is my usual merge summary, which will act as a
> > kind of high-level overview of the areas that have changed. You'll
> > need to get the git tree for full details (or more likely, to then
> > look at the particular areas you are interested in).
> >
> >                   Linus
> >
> > ---
> >
> > Alex Williamson (1):
> >     VFIO updates
> >
> > Alexandre Belloni (2):
> >     I3C updates
> >     RTC updates
> >
> > Alexei Starovoitov (2):
> >     bpf updates
> >     bpf fixes
> >
> > Alison Schofield (1):
> >     NVDIMM and DAX updates
> >
> > Amir Goldstein (1):
> >     overlayfs fixes
> >
> > Andi Shyti (2):
> >     i2c updates
> >     more i2c updates
> >
> > Andreas Gruenbacher (1):
> >     gfs2 updates
> >
> > Andrew Morton (3):
> >     MM updates
> >     non-MM updates
> >     more MM updates
> >
> > Andy Shevchenko (1):
> >     auxdisplay updates
> >
> > Anna Schumaker (1):
> >     nfs client updates
> >
> > Ard Biesheuvel (1):
> >     EFI updates
> >
> > Arnaldo Carvalho de Melo (1):
> >     perf tool updates
> >
> > Arnd Bergmann (4):
> >     SoC devicetree updates
> >     SoC driver updates
> >     SoC defconfig updates
> >     ARM SoC board file updates
> >
> > Bartosz Golaszewski (3):
> >     power sequencing updates
> >     gpio updates
> >     gpio fixes
> >
> > Bjorn Andersson (2):
> >     remoteproc updates
> >     rpmsg updates
> >
> > Bjorn Helgaas (1):
> >     PCI updates
> >
> > Borislav Petkov (10):
> >     EDAC updates
> >     x86 asm update
> >     x86 CPU speculation updates
> >     x86 resource control updates
> >     x86 cleanups
> >     x86 cpu feature updates
> >     x86 FPU state updates
> >     x86 platform updates
> >     x86 SEV updates
> >     x86 boot updates
> >
> > Breno Leitao (1):
> >     configfs updates
> >
> > Carlos Maiolino (1):
> >     xfs updates
> >
> > Catalin Marinas (2):
> >     arm64 updates
> >     arm64 fixes
> >
> > Christian Brauner (21):
> >     ipc fix
> >     namespace updates
> >     signal handling updates
> >     bfs removal
> >     buffer_head updates
> >     binfmt updates
> >     close_range updates
> >     coredump updates
> >     file table updates
> >     vfs idmap constification
> >     iomap updates
> >     kernfs updates
> >     path lookup updates
> >     misc vfs updates
> >     mount updates
> >     netfs updates
> >     pidfd updates
> >     superblock updates
> >     file closing updates
> >     vfs keyring updates
> >     vfs fixes
> >
> > Chuck Lever (1):
> >     nfsd updates
> >
> > Daniel Thompson (1):
> >     kgdb updates
> >
> > Danilo Krummrich (3):
> >     driver core updates
> >     driver core fixes
> >     more driver core fixes
> >
> > Dave Airlie (2):
> >     drm updates
> >     drm fixes
> >
> > Dave Hansen (4):
> >     x86 kdump update
> >     x86 microcode loader update
> >     x86 mm updates
> >     x86 TDX updates
> >
> > Dave Jiang (1):
> >     CXL updates
> >
> > David Hildenbrand (1):
> >     core memory management updates
> >
> > David Sterba (3):
> >     btrfs updates
> >     affs updates
> >     more btrfs updates
> >
> > David Teigland (1):
> >     dlm updates
> >
> > Dinh Nguyen (1):
> >     NIOS2 update
> >
> > Dipen Patel (1):
> >     hte updates
> >
> > Dmitry Torokhov (1):
> >     input updates
> >
> > Eric Biggers (5):
> >     crypto library updates
> >     fscrypt updates
> >     fsverity updates
> >     fscrypt fixes
> >     fsverity fixes
> >
> > Fan Wu (1):
> >     IPE updates
> >
> > Frederic Weisbecker (1):
> >     kthread fix
> >
> > Gao Xiang (2):
> >     erofs updates
> >     erofs fixes
> >
> > Geert Uytterhoeven (1):
> >     m68k updates
> >
> > Greg KH (4):
> >     staging driver updates
> >     tty / serial driver updates
> >     USB / Thunderbolt update
> >     Char/Misc/IIO/others driver updates
> >
> > Greg Ungerer (1):
> >     m68knommu updates
> >
> > Guenter Roeck (2):
> >     watchdog updates
> >     hwmon updates
> >
> > Harry Yoo (1):
> >     slab updates
> >
> > Heiko Carstens (1):
> >     s390 updates
> >
> > Helge Deller (3):
> >     fbdev updates
> >     parisc updates
> >     more fbdev updates
> >
> > Herbert Xu (1):
> >     crypto updates
> >
> > Huacai Chen (1):
> >     LoongArch updates
> >
> > Ilpo J=C3=A4rvinen (1):
> >     x86 platform driver updates
> >
> > Ilya Dryomov (1):
> >     ceph updates
> >
> > Ingo Molnar (12):
> >     scheduler updates
> >     locking updates
> >     objtool updates
> >     perf events updates
> >     kexec / irq fix
> >     perf events fixes
> >     scheduler fixes
> >     timer fixes
> >     x86 fix
> >     misc irqchip fixes
> >     timer fixes
> >     scheduler fix
> >
> > Jaegeuk Kim (1):
> >     f2fs updates
> >
> > Jakub Kicinski (1):
> >     networking fixes
> >
> > James Bottomley (2):
> >     SCSI updates
> >     more SCSI updates
> >
> > Jan Kara (2):
> >     fsnotify updates
> >     ext2, isofs, udf and quota updates
> >
> > Jarkko Sakkinen (2):
> >     keys updates
> >     TPM updates
> >
> > Jason Gunthorpe (4):
> >     TSM update
> >     iommufd updates
> >     rdma updates
> >     fwctl update
> >
> > Jassi Brar (1):
> >     mailbox updates
> >
> > Jens Axboe (5):
> >     io_uring updates
> >     block updates
> >     io_uring dma-buf support
> >     io_uring fixes
> >     more block updates
> >
> > Jiri Kosina (1):
> >     HID updates
> >
> > Joel Granados (1):
> >     sysctl updates
> >
> > Joerg Roedel (1):
> >     IOMMU updates
> >
> > Johannes Berg (1):
> >     UML updates
> >
> > John Johansen (1):
> >     AppArmor fixes
> >
> > John Paul Adrian Glaubitz (1):
> >     sh updates
> >
> > Jonathan Corbet (2):
> >     documentation updates
> >     more documentation updates
> >
> > Juergen Gross (1):
> >     xen updates
> >
> > Kees Cook (3):
> >     pstore updates
> >     seccomp updates
> >     hardening updates
> >
> > Konstantin Komarov (1):
> >     ntfs3 updates
> >
> > Lee Jones (3):
> >     MFD updates
> >     LED updates
> >     backlight updates
> >
> > Len Brown (1):
> >     x86 power utilities updates
> >
> > Linus Walleij (1):
> >     pin control updates
> >
> > Madhavan Srinivasan (1):
> >     powerpc updates
> >
> > Magnus Lindholm (1):
> >     alpha updates
> >
> > Marco Elver (1):
> >     KCSAN updates
> >
> > Marek Szyprowski (1):
> >     dma-mapping updates
> >
> > Mark Brown (6):
> >     regulator updates
> >     spi updates
> >     regmap updates
> >     regmap fix
> >     regulator fix
> >     spi fixes
> >
> > Masami Hiramatsu (3):
> >     probes updates
> >     bootconfig updates
> >     bootconfig fix
> >
> > Matt Turner (1):
> >     alpha floating point emulation fix
> >
> > Mauro Carvalho Chehab (2):
> >     media updates
> >     media update
> >
> > Max Filippov (1):
> >     xtensa updates
> >
> > Michael Tsirkin (1):
> >     vhost,virtio updates
> >
> > Michal Simek (1):
> >     arch/microblaze updates
> >
> > Micka=C3=ABl Sala=C3=BCn (1):
> >     Landlock update
> >
> > Miguel Ojeda (2):
> >     Rust updates
> >     Rust fixes
> >
> > Mike Marshall (1):
> >     orangefs updates
> >
> > Mike Rapoport (3):
> >     memblock updates
> >     kexec updates
> >     liveupdate updates
> >
> > Miklos Szeredi (1):
> >     fuse updates
> >
> > Mikulas Patocka (1):
> >     device mapper updates
> >
> > Mimi Zohar (1):
> >     IMA updates
> >
> > Miquel Raynal (1):
> >     MTD updates
> >
> > Namjae Jeon (4):
> >     smb server updates
> >     exfat updates
> >     ntfs updates
> >     smb server fixes
> >
> > Nathan Chancellor (2):
> >     Kbuild / Kconfig updates
> >     Kbuild fixes
> >
> > Niklas Cassel (1):
> >     ata updates
> >
> > Paolo Abeni (1):
> >     networking updates
> >
> > Paolo Bonzini (2):
> >     KVM updates
> >     more KVM updates
> >
> > Paul McKenney (3):
> >     two-byte cmpxchg emulation
> >     RCU updates
> >     CSD lock updates
> >
> > Paul Moore (3):
> >     audit updates
> >     selinux updates
> >     lsm updates
> >
> > Paul Walmsley (1):
> >     RISC-V updates
> >
> > Paulo Alcantara (2):
> >     smb client updates
> >     smb client fixes
> >
> > Petr Mladek (2):
> >     printk updates
> >     livepatching updates
> >
> > Petr Pavlu (1):
> >     module updates
> >
> > Rafael Wysocki (6):
> >     ACPI support updates
> >     power management updates
> >     thermal control updates
> >     ACPI support fixes
> >     power management fixes
> >     thermal control fixes
> >
> > Rob Herring (1):
> >     devicetree updates
> >
> > Russell King (1):
> >     ARM updates
> >
> > Sebastian Reichel (1):
> >     power supply and reset updates
> >
> > Shuah Khan (2):
> >     kselftest updates
> >     kunit update
> >
> > Stephen Boyd (1):
> >     clk updates
> >
> > Steven Rostedt (6):
> >     runtime verifier updates
> >     RTLA tooling updates
> >     ftrace updates
> >     ring-buffer updates
> >     tracing updates
> >     ktest updates
> >
> > Takashi Iwai (2):
> >     sound updates
> >     sound fixes
> >
> > Takashi Sakamoto (1):
> >     firewire updates
> >
> > Ted Ts'o (1):
> >     ext4 updates
> >
> > Tejun Heo (5):
> >     workqueue updates
> >     cgroup updates
> >     sched_ext updates
> >     cgroup fixes
> >     sched_ext fixes
> >
> > Thomas Bogendoerfer (1):
> >     MIPS updates
> >
> > Thomas Gleixner (6):
> >     irq updates
> >     irq chip driver updates
> >     clocksource updates
> >     timer core updates
> >     NOHZ updates
> >     VDSO updates
> >
> > Thomas Wei=C3=9Fschuh (1):
> >     nolibc updates
> >
> > Tzung-Bi Shih (2):
> >     chrome platform updates
> >     chrome platform firmware loader updates
> >
> > Ulf Hansson (2):
> >     MMC updates
> >     pmdomain updates
> >
> > Uwe Kleine-K=C3=B6nig (1):
> >     pwm updates
> >
> > Viacheslav Dubeyko (2):
> >     nilfs2 updates
> >     hfs/hfsplus updates
> >
> > Vinod Koul (3):
> >     soundwire updates
> >     phy updates
> >     dmaengine updates
> >
> > Wei Liu (1):
> >     hyperv updates
> >
> > Yury Norov (1):
> >     bitmap updates
> >
>
