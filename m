Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794293048;
	b=Xkhsg0IObzZhDaV8NJiC4fPp2wQh4FJb5Jl2UXMlmczGYBQR8OYMj8gjUAeje/T0872D
	 hJxCSLNgslVoN2F/6kl34ou2l333N2A+25UioX+kcBuMf2zVez7cxXvVUvzT6d/vCBMDl
	 7wRvLA18RYbXYqX8J8tW4MoiqCz5jQ0032dU6b8q73EgPqYylZ9eeD3wnAbzJ/q/sX6Fh
	 taSzbvrYrTOCI23h7PzVeovKN8zOEqLJ7sI7cbZlq0Jwvz3VlM+xPiXZQSR+zo+HGdoR/
	 2yfhj+lK0IUz4yjotmGPLIU88edN0qhamBfU+nqP0Va+OZZrVut8LXsBQ8TqxCBsUzg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=z3Hb/ilx/b4fjyZAOC7azdPBoN2aJE2v6bttuYM0sMY=;
	b=T38yG48keJ4obD8vusVEdnT5M8WnjUBp1yEg9NgskVKRO48XsRIpQ8Gf8qfsPFWzJkLJ
	 NU+EDb6bCi8h9jKsB3Zbwmq9NFZzP8Ho7bC8KualAfB9yegG4H5Up8cAiSTSy0bEm/E4I
	 fdYCiQ5kL7Rb3at5f30c4iHD5ezmpzWRCUY0N9pZbF1FxNQ9dQG9wcuaoA0qL5nygu8b2
	 ZcXNuDc65MxUk3+Bu1TTsVrveW8uFJcCPKx6EeqDUsmvne5NbjNqfZsqYt2tg62Y413EB
	 +Txcw1e/J+IhOMTy5s7S9yLlnUsj+SvmuY+lbuvgm7vfBrkSJ9Gwq0NW8LeXa79jpEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=multikernel.io;
	spf=pass smtp.mailfrom=multikernel.io;
	dkim=pass header.d=multikernel-io.20260707.gappssmtp.com header.i=@multikernel-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="t/BFrn86";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC065606B1C9
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:44:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC065606B1C9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=multikernel.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=multikernel.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=multikernel-io.20260707.gappssmtp.com header.i=@multikernel-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=t/BFrn86
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c49c32650adso56087966b.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 22:44:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794293046; cv=none;
        d=google.com; s=arc-20260327;
        b=CsY4SR9lrFZhHgutN2B6FS9REjHe8mLgKMHNXx3+YPaKTCeIiW+PckgHqAnhhmyRaR
         0b/XUWmbJFTKP/rMfS1reaSh7Ne+TJ9STr0Q7NV5EfQIpI+ILZqfujQYPF7jPu5Qfjfc
         OhZvYJYu49VFCudZ4u9hjb6N9bt4fuAr0/yR5ukog1+RyZnJBKKBwptAsmVfJHEK4lOd
         9jRE9rTpAfAWMiXai/0iDyzl2HKSPdoVDot8gxmKwI9Lm8Zx+hwE6xC1CQUuFja5vTrR
         QHLn153DkFt0MSyZaczl8lzlIoiZbVBzzN8oedjfHvjKpbeSdSBN4MqtUUcXQvmUM1xg
         uMzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z3Hb/ilx/b4fjyZAOC7azdPBoN2aJE2v6bttuYM0sMY=;
        fh=UYzNSGPEMRlgCzdHZNNDVRWda9HAMrhxs58X0CNKNSo=;
        b=ssmvk2/0pgojNmnsII9WQ6cJmAt2nNedtFUvkFaLW5Zm6C32jgBHjzFLhPny8PieDb
         7F1GgqJ7kPCLMABgRWsY8TMRsdvhXy8dAG/KieBk71wZOBdYlmRdQkB5To0nrrruazVz
         DLmQqPlh5W4UEDMDG03nLL9zSWzPBsLqT2O+gLa+of6d0+Xan0h0SMJC8ipCeAsaKvHI
         NrcxkfuX54MgSeXrzkFRuNHKrxafC5sxUJLnTPdqbdCTEuiObUEVXJo9dZP+c0DTh4J0
         6lq70z3/0nt6YhmO00ZDIVsan3N3GmWmYhzIasCzKmJ02nC9WHiP6oeXMN56FHbgfGXB
         hbqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=multikernel-io.20260707.gappssmtp.com; s=20260707; t=1794293046; x=1794897846; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z3Hb/ilx/b4fjyZAOC7azdPBoN2aJE2v6bttuYM0sMY=;
        b=t/BFrn86j79rbms++pNrVvFW05yP97geJUPq7XvRao6k0SgVld+XVgsu7rYRZ7WRRD
         Pribveij6LLn/PiQF9QcLZWVdLCBoFyz/P60ykvBnrKWRiLJCgxIh29p+R+f4pxYSKoW
         j/va5+4usxkLLGMYlTVWAQuak1v48TTgI8GBjaDOcMeja6CElt/d0jfZfYaDCAaSqGrJ
         iTng/c2y16lHtnZZ19Q7sgnmQbP26HGnfpTrjkVKbO/JnCNhWJV/gRX7F7y9IgA6gphD
         GFWcb+2F83e4QQwdkh/HDbx24obC2UpsKxfHGzil1tGaDSlgxFwsUyxGVEVKcfAWAIL5
         tL6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794293046; x=1794897846;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z3Hb/ilx/b4fjyZAOC7azdPBoN2aJE2v6bttuYM0sMY=;
        b=eKQKCmad5hFrrxU1xNCoW0+0tt8PZAdW0e+h77sdO3cebwdcHNwWgC3mABveHY31Lz
         FRRUKjMiD9xbDwx/g+x2WdtLrK2Iw38cltV/DS++WtPtU11xrp2J0PGS44bdemAA/qrp
         ssgJm8hek6ecEwog5CaMsjdNCWikBiHT76yre25XQWF/0EaPXRwFaFFD390uYSSmh1l4
         o5tyBN1a4oknoXaRHcL6sUIkua4tmpDyrhdhgK8YkDqRzc5kaGxXi/i75mgKgpRXYCOT
         o6NHe/LkcivG4ImjaaWRTU3sFUDH/Dq929dCBI1fq+XW8g1NFAT+VgyGsL4mimAMBLob
         40qQ==
X-Forwarded-Encrypted: i=1; AL+hErHs9omhqblT4pvKuaexkNsCxWbc6v/GVbGH923Eks9eoxX9a5C8aa7/vjmt+S4Qhlt1IHKSp/tcS3RmCP0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/utJ0zSAyuFlPSbKplSUOlEAFqSf4Uy/WHhPOL5jUnz/tCRFn
	VIY7wxdKHRHfyhZvgeLrdvdPfk9Lc2fLvahdOZFtLLCizixwDTR15eYUwd0YxVyJvZ9172mucJE
	5u2PCxcUh9XjPvaNrYkeoXGIaoVadIJ5nSETwRTC4bg==
X-Gm-Gg: AYBFou05VjqZZYxGpoD6aj7Erb5ULly/6OxqZ8FQj4Rjo8iuK4wyCCXSXY6uGXDqu9t
	wOX/xcGyER/dtUGZT2s6NDidF1GFYxqf3RWcNoYe8deTsB+oWSfUiyHL9eEfJUmUGqfaqWikEus
	gBleAbVZl5tcsnaLz39lDLJAR35xa6ZkWcde4wO3JfV0Y8W2bvMi768Jyq6mqJ/Ol4v3jvxC+oN
	MStPqvogt+nLQ73KsDFQx6ziZu094jozYyQvbG/rS36kO4ETg7MgJokuU2GxQRIbsch93hqwvaB
	F1ob+oiO2lB1ASI5BELCfx1pVpht1LHncJEuFKENKhFDAHC+qTfL1rRKYoHcQJ+FSg0MA5712xh
	+w7El4I9N4qWXQUS7EBpBHIpM/ZfmK3ww+idpq5WLN67q3qfbX8739T+DvHK8kaS9iXed1NG6jP
	h92GXgfb6BLI71JpHRgYj828v8xY0uFlajzXdlP/fnrnJ9AOI=
X-Received: by 2002:a17:907:3ea8:b0:c46:d837:b358 with SMTP id
 a640c23a62f3a-c504922a4demr124994466b.3.1794293046031; Mon, 09 Nov 2026
 22:44:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108004716.3828406-1-7z0423arsenova@proton.me>
In-Reply-To: <20261108004716.3828406-1-7z0423arsenova@proton.me>
From: Cong Wang <cwang@multikernel.io>
Date: Mon, 9 Nov 2026 22:43:53 -0800
X-Gm-Features: AclHuK84aRayHJ63zdxJTtuA3kZ57aahgNSGGmfmWS_Wu36kmtAL2yYbd74IWAk
Message-ID: <CAGHCLaRQDEELHFtJNzh-m3jhJGndBQgjGC=ZP0gye73Ch__WKg@mail.gmail.com>
Subject: Re: [kmorph] QEMU test report: takeover OK, a build break, two config traps
To: Yun Wang <7z0423arsenova@proton.me>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yun,

On Sat, Nov 7, 2026 at 4:49=E2=80=AFPM Yun Wang <7z0423arsenova@proton.me> =
wrote:
>
> Hi Cong,
>
> After your announcement [1] I tried multikernel + kmorph in a QEMU/KVM
> guest on x86_64. The takeover itself worked: 10 of 10 runs, with the
> predecessor crashed by sysrq-c. I also hit a build break and two
> configuration traps that the next tester will probably meet; details
> and a fix below.

Thanks for your tests and detailed report.

>
> Tested: multikernel/linux 57fd249 (7.0.0-mk4), kmorph 9ec046e,
> GCC 16.2.1, QEMU 11.1.3 (q35, KVM, 4 vCPUs, 4 GiB). The lines named
> below are unchanged on master (77a05a4), and kmorph main is still
> 9ec046e.
>
> 1) Build break: CONFIG_INTEL_IOMMU=3Dy with CONFIG_IRQ_REMAP=3Dn
>
>      drivers/iommu/intel/iommu.c:2806:35: error: 'struct intel_iommu'
>      has no member named 'ir_table'
>
>    intel_iommu_claim() uses iommu->ir_table unconditionally, but the
>    member only exists under CONFIG_IRQ_REMAP (iommu.h:733).
>    x86_64_defconfig + kvm_guest.config + the MULTIKERNEL options hits
>    it, and so does this one command after "make prepare" on that
>    config:
>
>      make O=3Dbuild drivers/iommu/intel/iommu.o
>
>    The patch below follows the intel_irq_remap_claim() pattern already
>    in iommu.h: a small helper in irq_remapping.c, a stub for
>    !CONFIG_IRQ_REMAP next to the existing one, and iommu.c calls only
>    the helper, so there is no #ifdef in the .c file. checkpatch
>    --strict is clean. With it, the config that failed above builds as
>    a full bzImage (0 errors, 0 warnings), drivers/iommu/intel/ also
>    builds with IRQ_REMAP on, and kmorph takeovers worked on the
>    patched IRQ_REMAP=3Dn kernel in QEMU (10 of 10). QEMU has no vIOMMU
>    here, so intel_iommu_claim() itself did not run. The three files are
>    identical on master (77a05a4), so it applies there as is.

Do you mind submitting a PR here https://github.com/multikernel/linux
for your patch?

(We are not upstream yet, so we still rely on GitHub for collaboration.
That would also reduce noises for upstream too.)


> 2) "kmorph arm" fails with ENOMEM on a 2 GiB x86_64 guest
>
>      Baseline: failed to allocate 132 MB on node -1: -12
>      kmorph: error: pool initialisation failed: Cannot allocate memory
>
>    mk_take_memory() only tries ZONE_MOVABLE and ZONE_NORMAL, and below
>    4 GiB x86_64 has neither: /proc/zoneinfo shows Normal and Movable
>    with present 0, everything is in DMA32. With -m 4G (2 GiB above the
>    PCI hole) "kmorph arm" takes 0.6 to 0.8 s. The README transcript
>    shows 2047 MB of RAM, so a clearer error or a README note would
>    help. I did not try movablecore=3D.

I created a Github issue to track this:
https://github.com/multikernel/kmorph/issues/6

>
> 3) A successor with no boot-time PCI device adopts no PCI function
>
>    Without devices=3D in kmorph.conf the takeover logs
>
>      Failed to move device 0000:00:1f.2: -1
>      kmorphd: adopted 0 devices: 0 reset, 0 quiesced
>
>    From reading the code: mk_pcifront_host_fenced() returns early when
>    the successor has no PCI bus, so mk_pcifront_direct_access stays
>    false and mk_pcifront_adopt_function() returns -EPERM
>    (pcifront.c:150-153 and 704). The same VM with
>    devices=3D0000:01:00.0 instead logs "Host fenced: config space is
>    reached directly through ECAM", adopts three functions, and the
>    e1000e comes up as eth1. Without devices=3D, kmorphd's network
>    restore also waits about 3 s per NIC that never shows up, so
>    panic -> TAKEN_OVER took 6.8 s instead of 0.9 s (7 runs). The
>    README lists devices=3D as optional. This one is also on the kmorph
>    tracker, with the log lines:
>
>      https://github.com/multikernel/kmorph/issues/2

I appreciate it. I fixed it earlier today.

>
> Timing with devices=3D set and the defaults (5 x 100 ms probes), n =3D 10=
,
> min / median / max in seconds on one host clock:
>
>    panic -> fence starts                 0.51 / 0.56 / 0.61
>    fence starts -> TAKEN_OVER            0.29 / 0.34 / 0.39
>    panic -> shell on successor console   0.93 / 0.97 / 1.04
>
> Two more sessions of 10 runs (the second on the patched kernel above)
> gave the same picture: median panic -> TAKEN_OVER 0.91 and 0.90 s.
> The series were run by scripts Claude generated; I also re-ran the
> README commands by hand once (10 of 10, median 0.91 s).
>
> This is a console-only image: no service, no traffic, no real
> hardware, no vIOMMU. It says nothing about the nginx figure.
>
> Two smaller things. kmorphd logs through one /dev/kmsg fd, which the
> kernel rate-limits to 10 lines per 5 s unless printk.devkmsg=3Don, so on
> a default command line "state TAKEN_OVER" never shows. Details:
>
>    https://github.com/multikernel/kmorph/issues/1

Ditto. Fixed.

>
> And the successor boots without a swiotlb ("No low mem": its 128 MB
> are above 4 GiB). I did not test a 32-bit-DMA device after a takeover,
> so that one is a question, not a bug.
>
> The QEMU rig, the logs and the exact commands are available if you
> want them.
>
> [1] https://lore.kernel.org/all/au5M_M_RzWfXLr0T@pop-os.localdomain/
>

Regards,
Cong
