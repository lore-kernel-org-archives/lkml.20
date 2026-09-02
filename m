Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5B04ACC7C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788376506; cv=pass; b=FNKpVMHXCbGFjZ95wn82EYVOfRCgJV9lWtvzDm+kWIT8/CZ62RtIv8r9kQEQOtndOrNqcrpP5qsXtKGBieMKfc28tpy1YXQaVXDIe3+bHPLsb9AfQct8s+2CjVGVTOXYO7qnII9ht3h69l0uHQVzbSGD9rviaIiVdKOCFLX19ho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788376506; c=relaxed/simple;
	bh=JLV8Ofox8i3452kiplk76hZfUPxaEK+vxS1pmKYEFNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gAteXFwbHyoyLRa4iYdaRjqRoPbTXI0QHHcX32jBtVtGFkr4GDoEUksu5JsUgSfx0qIlExL53UBOtB7OMK3TKgj98RgoaGsAc4mUmSinFl75Wp8WytwjT1Pf8udj5WBCT07KLmly1D+X5MiNppi+4jJ1kNzsSAdPS1G+GPOFRQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Witbb4Sk; arc=pass smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Witbb4Sk"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-46adf49ff3dso833600fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:15:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788376499; cv=none;
        d=google.com; s=arc-20260327;
        b=rXaQIIsAETCKAi2WCrCIYpKaZTr7o6vQINW1zoYf3IHlXDfi1KUddDW6Vb+39n63VZ
         kZxl94qCKiyAltS7fLJZP23Gx12iqCzKMA568nwYARi0RVt1+SMDTD57Xr2AZY7701ca
         /z9J17CvoSqjXUJ4Uy065nTpLXAY0HYZq0htWS7sM6O6Rl0BCJlnqnjVEOnjzKmo7cdW
         3QwgkYJPNGOSCM2+KTGVD4lFGsQafIBu27T1MS9nQbOyHMwCijwsx6eOCPyU/Hb+PI28
         LySXAD1pgTEIYIvRAqh1puyvFrPzw5dyXlwGpvu91ZzXhhq9lLePZEPRyG1erEDnkexf
         2MIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fhVgVDsfplRoO6QIS0+PaSfH5QyM7tCi3PZGVPNp3Fk=;
        fh=dGzMAJENHiGpRO4eUxEPbbk9ozUGyBKysqvK4YOU5V8=;
        b=ObnF5TfhWtZdmwfkBcAUed3LZ+b0+DefwNd1Da4jzZ8uA3s/nRH07xFv0RRhMllzHq
         qeq2Q2LRtRXil/uov9Qgykdom9nmR8GsB/soySSVuu6m3x1xzwOXBA7vT36eCa26YSZ4
         iVDq4jXOMQrgfT1QqVHQEAXiNFKmYoHKFjs2WwXeNO04P9sKDW5kP0sK+5ywHmOnhnP2
         thi0A44p3s3d1QknolGHiUjC8lC/cV3c2NE5FG7nmIoqSS+5nE51RraUvPmt/YazG/op
         G6lNbgPCph7BkcDhTZ9jaOvAN2vqzubkXj/hnk9+oZyhCgi+p1osoVKoEa8yxsYsLKcW
         766w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788376499; x=1788981299; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fhVgVDsfplRoO6QIS0+PaSfH5QyM7tCi3PZGVPNp3Fk=;
        b=Witbb4Skocb5WQRQSOcB/3AErxnQrFz23C5G/uqNu3pwzdauX5St7OloyoaM36jF7v
         xpwcjnXpXvgbPm/QqMMxe20sfjzKtRICJtUxf/PoZ/AqFBR6no97U2+8dtujOL4KiTjq
         Ld40Tgjo73QX7jLRnMwlbfXgFvSxJ/E7bObYULtmYt4uX1yrU8qnT67twjAkOzDhgoMp
         IvSGNVOm2VMzSLJu6tBQm8/w8IiBxMuV1OjEtsZjoe7VNYuyjxDa8lZ21NvsdmTtMBAZ
         eQKjBMoG3MBCqyedLKrQBEwkKW5z0NYnXhpPgXyTD9jCE9IO+GkvcaR+4Rb6PPK0ARzl
         tl2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788376499; x=1788981299;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fhVgVDsfplRoO6QIS0+PaSfH5QyM7tCi3PZGVPNp3Fk=;
        b=OVwYPWgEvtWLRIV/I0oa1JD4xMzBuSaTRvYUwOEzOaPtCMUh/T9JCuEG9TY6Zi2Iqf
         7NwNgoZQeJwO5eA7OOT1+zXl9khXdsLDFIyvZHhI4mxC76L9s/f5aPo/MPkZsPIPdIA3
         dV/ZkEZOHTRSoqtPMMkAl4XsxvTZvtZHDABWaZoeiVXY0Yr4IEx1FQpiymJb9vFLzj6A
         XisY4LrkQVFEhOfSs+MOZ2NzO4OonfMcOEkjCtGCxlPZW4BrdtGOW9+2UaIt1tStWBBO
         4cZGu9d7RPGBzMiGJmHKfG58/up4TuEnlV1UPnbhXeyQJf9MRiwWc2lYQdy9HhVm/IMi
         APdg==
X-Forwarded-Encrypted: i=1; AKwUvByCOM3mho9rV52IWC7DY7IakuaryfMvCfpp5ihzsMHzLvvDWv5l6JCKCKVj/KCmpPuOpEkk99rkSk6ai2M=@vger.kernel.org
X-Gm-Message-State: AFuF++no/VzicjfcFXd3ZX4NMPNN6pxEz4QUo3xwLpaBAFvg21eRMvH6
	aFlug2YwjrtTi00fNFCvpXLdYAISRIqB9n64h35gNGlnTNLxY/70OkFV8HF/KEhsZcrYOKzhuzN
	mg6nwbW99DJauhQ5WlF9JaCJWnCcV91E=
X-Gm-Gg: AYBFou25oEg2IoBSaiULOx0WIth7lE2+PpnZOfFWI6CJ2lEA2EJMvgLmvIDBGvCNSUU
	w4Zusvb3InfY+VvZyQIX+ZiTDPnTDlaCqgI+SgzQ8UFDMKv29/LsPoENGSUWTGBmNBXFI8Rr325
	Oq2sK7UduDIG/0Q6Ae7UT3bDYd0nb+shwuvU8R8T/idr7UdLwaHDd82AJZ2hmuVxgBnF3bemtTB
	bQBfH7c0d7+BwizJ3AuOOXR8PWsTwx50DmMxE/quIpeIV4TRYaL68Ftfjd21lmZcvKy9SFdZIl9
	ldNFKjSFyochI7ReutknJ0BMJJPWqttrJ83X3pLBQUhGInaM8iwjlHhuhgOenvymyLequ54hxI+
	7/a6LeKQ+vLejiVuDLejTHaopTAHj2QTFyIr1ZNYJmlQTf3EC31ZVXzNelu85V8Mf6SovmnWYmq
	zwvk6wrPlZYxlvlsWl2DHAG0Oe9Ghho4frEFOmsLqk
X-Received: by 2002:a05:6870:270:b0:46a:e87f:a7f3 with SMTP id
 586e51a60fabf-46f88507af1mr6165405fac.2.1788376499042; Wed, 02 Sep 2026
 12:14:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALAyJWrn7OQyQMd5OPoifn_3qe6iWNf1+xSSg_six-+po9kpvQ@mail.gmail.com>
 <aphXfTJicnEde3R4@google.com>
In-Reply-To: <aphXfTJicnEde3R4@google.com>
From: Andrew Wilson <wizlonex@gmail.com>
Date: Wed, 2 Sep 2026 15:14:48 -0400
X-Gm-Features: AcwNN1UJNnt-8ayL0xjmSoouIWQ2GFKkS-vOs8cL869hId8ajPvh2JfxnCOJoF8
Message-ID: <CALAyJWqXT=LFr2wAi4egPPQX57=NRK5tXJh_t4nOKqrJbfga3A@mail.gmail.com>
Subject: Re: [REGRESSION] [6.12.y] crypto: ccp - Move SEV/SNP Platform
 initialization to KVM breaks SEV-ES VM launch
To: Sean Christopherson <seanjc@google.com>
Cc: ashish.kalra@amd.com, aik@amd.com, herbert@gondor.apana.org.au, 
	stable@vger.kernel.org, regressions@lists.linux.dev, thomas.lendacky@amd.com, 
	john.allen@amd.com, davem@davemloft.net, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 1145026@bugs.debian.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sean, Salvatore,

Tested-by: Andrew Wilson <your.email@address.com>

(With strong assistance from Gemini guiding me through builds, module
DKMS rebuilds, and interpreting logs!)

I can confirm that commit 6b748c39d18e completely resolves the issue,
and SEV, SEV-ES, AND SEV-SNP are fully functional on official Debian
packages (tested on EPYC Rome and EPYC Milan servers).

Here are the test results from bare-metal hardware:

1. Upstream v6.12.104 (Source build) on AMD EPYC (Rome):
   * Tested SEV-ES: Functional, VMs launch cleanly.

2. Debian 6.12.107-1 (linux-image-6.12.107+deb13-amd64) on AMD EPYC (Rome):
   * Tested SEV & SEV-ES: Functional.
   [    3.676036] kvm_amd: SEV enabled (ASIDs 16 - 253)
   [    3.690542] kvm_amd: SEV-ES enabled (ASIDs 1 - 15)
   [    3.735896] ccp 0000:26:00.1: SEV API:0.24 build:22

3. Debian 6.12.107-1 (linux-image-6.12.107+deb13-amd64) on AMD EPYC (Milan)=
:
   * Tested SEV-SNP: Fully functional!
   * Host log:
     [    4.678767] kvm_amd: SEV enabled (ASIDs 256 - 509)
     [    4.684694] kvm_amd: SEV-ES enabled (ASIDs 1 - 255)
     [    4.690563] kvm_amd: SEV-SNP enabled (ASIDs 1 - 255)
     [    6.212275] ccp 0000:47:00.1: SEV-SNP API:1.58 build:2
   * Guest dmesg:
     [    0.908804] Memory Encryption Features active: AMD SEV SEV-ES SEV-S=
NP
     [    0.908820] SEV: Status: SEV SEV-ES SEV-SNP
     [    2.109524] SEV: SNP running at VMPL0.
     [    3.439649] sev-guest sev-guest: Initialized SEV guest driver
(using VMPCK0 communication key)

Because Debian builds KVM as a module (CONFIG_KVM_AMD=3Dm), we avoid the
built-in CONFIG_KVM_AMD=3Dy SNP race on 6.12.y, so both SEV-ES and
SEV-SNP are completely working out-of-the-box on 6.12.107-1.

Salvatore: Debian bug #1145026 can be marked fully resolved by
linux-image-6.12.107-1.

Thank you all very much!

Very Respectfully,

Andrew Wilson

On Wed, Sep 2, 2026 at 1:06=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Wed, Sep 02, 2026, Andrew Wilson wrote:
> > #regzbot introduced: 3f8f0133a5fc9b32d0c308530320c3f2430ba5ab
> >
> > Hi all,
> >
> > I am writing to report a regression affecting AMD SEV-ES VM launches
> > on the 6.12 stable branch (first noticed in 6.12.97+ / 6.12.101).
> >
> > I completed a git bisect between working and failing kernels, which poi=
nted to:
> >
> > Commit: bb1c84647025 ("crypto: ccp - Move SEV/SNP Platform
> > initialization to KVM")
> > Upstream commit: 3f8f0133a5fc9b32d0c308530320c3f2430ba5ab
> >
> > ### Bisect & Verification Details:
> > * Last Known Working: 8a599f4f74d4
> > * First Broken Commit: bb1c84647025
> > * Tested on 6.12.101: Cleanly reverting bb1c84647025 immediately
> > resolves the issue and allows SEV-ES guests to boot normally.
>
> Can you try v6.12.104 or later?  I'm pretty sure this is fixed by commit
> 6b748c39d18e ("KVM: SVM: Add support to initialize SEV/SNP functionality =
in KVM"),
> i.e. is the same thing as:
> https://lore.kernel.org/all/20260814100652.225499-1-jinpu.wang@ionos.com
>
> Note, SNP is still buggered on 6.12.y if CONFIG_KVM_AMD=3Dy, I'll try and=
 send a
> backport for that soonish.
> https://lore.kernel.org/all/521b22fa-ef09-4449-909f-0120edfc4b24@oracle.c=
om
>
> > ### Failure Description:
> > With commit bb1c84647025 applied, `sev_platform_init(&args)` is
> > removed from `sev_pci_init()`, assuming KVM handles on-demand
> > initialization.
> >
> > On bare metal, the PSP firmware appears to remain uninitialized (does
> > not reach SEV_STATE_INIT at probe time). When QEMU initializes KVM and
> > queries host SEV-ES capabilities, the ioctl fails with -EPERM:
> >
> >   qemu-system-x86_64: -accel kvm: sev_common_kvm_init: guest policy
> > requires SEV-ES, but host SEV-ES support unavailable
> >   qemu-system-x86_64: -accel kvm: failed to initialize kvm: Operation
> > not permitted
> >
> > ### Hardware & Environment:
> > * Tested on: AMD EPYC (Rome / Milan) Supermicro platforms
> > * Kernel: Linux 6.12.101
> > * Hypervisor: QEMU / KVM
> >
> > I have access to Naples, Rome, and Milan test hardware and am happy to
> > test any patches, provide dmesg traces, or assist with debugging.  I
> > am not a tech-expert of any kind, but I have time to do some testing
> > if it helps.  THANK YOU for the great work.
> >
> > Original Debian bug reference:
> > https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1145026
