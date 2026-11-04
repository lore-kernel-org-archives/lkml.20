Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793809864;
	b=i0dXry6ZW39iLlyKZiBgCagsM7wWB2Ku6yg4yOFPr3Qii8TejWeE1vVJgZlwWpbvdZdj
	 n3bJhs2LngGFEAs6HuEDY3aFFn5z+eO2u5RzRxgPCyhExKfFkIjcXLWwuYdN/vv4u2wL+
	 iEvXIYrtQwBAe/UYGUZEmIajucSLeL3qa2kfkq/RIZAh69VuJQmTHsFx/CTl7bPi4ShB4
	 dLLsDGulXFzGEwKiFge1+5FHiBpOeOT3hFv2hNqm0Stev6xNs8S+Tty0fvP5lb5j4HWeg
	 UYAOLDXah7Qk/haRClp3GX9M0CJgI6uRiQrVKZOneA5Y2zBkdtZpm6ntq4znT4jv9Vg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793809864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NyjRNFEeE3nmYhNk8vaSRwH7n51z01zX9N7rg1mXM0E=;
	b=n0l6cTk4bz7FothlQC9U7Io8lGtLVs3uuXX9qbroxufZblvrp4cEZ83yh4dq8mIuowqy
	 AgV/3NRx98fFnogOMV6Um51Dtfb76GO25o1u+Q+5bk6mfxW7ewiRyLRJtWzk66+8NNAmU
	 INhDA9gQTlzyRqRkfrWOuHfSj6vyPulo5/WRk+pZkX+fm2dQPwh+0tbOo572KU2YOZisO
	 x0FEm3AGGM4ACpfeDd5rc0BFMRMRlvFYz7GqFztsa8tdoB6TFP6TCyTA08bqvXUL1pm/1
	 ephCIj15/7L5iuZ3u62VEgw22/y+QNEer2otVRWarC9SdjGa/ata4sjHcV6YoiOkl9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OdxaJB4E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADAF606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:31:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ADAF606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OdxaJB4E
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b571a45a2aso4009a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:31:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793809862; cv=none;
        d=google.com; s=arc-20260327;
        b=DRI5MVp4UJXa/4xFX7uir7cXYKwDP8AY1vTAnQ1DL0MYZJenAnV9evx8bV29i7Q8oy
         uE5WbJTnbSkCkIkI6HbOHNtKmKZkHfopgOKAHLiDuDH9qpur21NC9029bDca3PPQ0qeU
         +l5dsIS/WqN55gSnvmAbfGu9qNxq89+SnWx7v3tQgIIuwh5+kPf1jTUcUx4AiHF+OrFJ
         kTzR9vQ2++yc7DPkzQ0eDsELIAytCjCfDIz/ReJe84jw46NJO0fGhgE2uajMR4n3Qz4g
         Uc9sKVrHXtGfwAhERn1Vr9RJLAV8/yG+dwEYEaUiH05NR27h1vBQKakZoARf9uEL6zac
         vkuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NyjRNFEeE3nmYhNk8vaSRwH7n51z01zX9N7rg1mXM0E=;
        fh=oArzrh1blI7PgmTE1+0EVyZwlP2chUuXM61V2y2tH9Q=;
        b=devWqF+HEIay3IcMUUX2ZOSK9TG99gaj1RvrC+CNdpjXiArZwOQybMoP/ujzD+tnAg
         Rf/QDqsLFYtFzE484FNY4cyXbwamcQdb+4V0oes2I5YLsG257QYyghTuqPvtz/Eu+/27
         DpJkkh2ZjdLX0HRR8MlCgOgkbzmJ49ZFv4AUgJS98NK28HD+M8TMl+MyCeXIX6pMA/eN
         qQYFK9YxTaH2hX8yCbTwq+IlNm2V3D1e0naKkcA2F0bjFi+AQ8ICzz4ErtrfPDzjkv9f
         3nH38ITcmQ3Uv5jLg09bYMhLVzuoN76F1UvtHQhflpRtUf6ntYhtu2wB4XU1jH9Q5YPL
         NFLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793809862; x=1794414662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NyjRNFEeE3nmYhNk8vaSRwH7n51z01zX9N7rg1mXM0E=;
        b=OdxaJB4EnDuV4Hidcru6kJitmdCqTBvMRu1+/AxM8mR29nxWHSzf1TGPtq08Q/FyeM
         BqiQ5UWsRtRzykRX9dHeDcMk+iJsYuP0Kdmb/FZTBnu31lJYAGiEwb2qv4bwAIm5qaGL
         IAHFIVaAlQ6RQHbPq3KVPxtIMj+aqGjGQz6ZxauYWKTClbyEeG1+dphKJcJLdKuhRKSF
         u+0Tycys46CnLNZ0EObmu0V61pUHh0NUS71EPx9l3Ys2ZgQT5SXC5pwkna3a5yBsZ+cn
         xLnBUt5xe4nNJKHPDJ61g3w9xSDjOZtQz1k8hoiXujknHw3C9rCYb8zZUkZTFkbh4cdD
         ADBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793809862; x=1794414662;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NyjRNFEeE3nmYhNk8vaSRwH7n51z01zX9N7rg1mXM0E=;
        b=dAGP7Ozju/9IOjkUeGxNdnlt6IPGq2Qe42syIK4YK6Q2bijsA+4RyzYoWnxBzvbDcI
         3P4eFmbID8v6Z8XWYmKFz4yBBx4TJrGfqfYNurr72hLwgs9gdbjuaBfA2sHfwjMt8HeL
         GDpDodguPounduSyGb21/WJD27cVtxJyxdt6Iifui3R93fnHqU2Ubn+JxxmDYk0sBgBD
         pmFbBPoNAbZ7PIbo7ox9Yog+RCM171xeyBLMCRzZFoNL4xaw81jurnIiUYOJN5v9OnLv
         rA2j7e6ol5uBvIh1GOeYf/gkkbaZ0ZxHObLM6WCOxPJpc7JbG9PUbRPJlmgKibWSMQcG
         QAMA==
X-Forwarded-Encrypted: i=1; AKwUvByRjzy1sXskZInpMDvOHos3ozccORFhk34ZbnfennzmPIkye8kLT03t/ZJ0uZ79FszB8BCQp4uAYJ3heko=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AYdPQGibTBnlx21cTR8r5zfexDt9LJjl7Sk99Xb+nBgxUy0Lv
	ytIXjbjZBr9VP24LUFWrBhORxEXMvJzMnpVUejsdbpSY/VQ5LZXHzFJ/taVllJ20yJ4Nrd7ebcK
	Y8wiu0aEZ14+Vlg+XJt3DlP7dW3YWEBIebHiun5EB
X-Gm-Gg: AYBFou18z00qtrfW5y4zGTC2rdioJy466QkbLKgWscreGindlU5byktpuX1nSBfgdmy
	OZ0migzI7vDy8fo2co4ZDIaGtA1JZO0sp2vYsGhFDZngSHMqPLXM3y5RXqsXeQdn6u2Jmq7LiLV
	aMCGjj8o8ejjyvOICicjiC5YtigFjiLMbWBM3n8me5e1QzGH4gooatvWhSIV2eO4T9NF7/8O6io
	CUzwY1YZF4NvDwjroGM+CBAMm0kvHmYg9f1qmuQpDuL/jDH5q4n8VbZa+gRYWcDO6X19B808kbk
	vM+FLX15fW1OjqRTMBUaZicN0WAqoAK+x/unT4Uwu+kO3I/1EUz1Nr21smFeXU3NUtS7mRDAG8P
	/9OFhk2jikRTdF7xFP5XcnnGJxS3bY6VvnKw5Cof97mt/W5xztBcYahT3UHeliu0bzg==
X-Received: by 2002:aa7:d647:0:b0:6b4:629a:6352 with SMTP id
 4fb4d7f45d1cf-6b556219774mr85656a12.5.1793809861709; Wed, 04 Nov 2026
 08:31:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102230445.3993629-1-almasrymina@google.com>
 <20261102230445.3993629-4-almasrymina@google.com> <20261103102721.5d76c471@shazbot.org>
In-Reply-To: <20261103102721.5d76c471@shazbot.org>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 4 Nov 2026 08:30:50 -0800
X-Gm-Features: AclHuK-9GylVYqo-TMtSosiXb5Ui2K5HFBRmFtb7498f4BCUrjDMBqO1v8NJ_60
Message-ID: <CAHS8izPfFpNQWLFW4Xgf_=vF5j37_Z7XDcuPMJXHj-KQzo=8jQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] vfio: selftests: Test BAR write faults after clear_refs
To: Alex Williamson <alex@shazbot.org>
Cc: Peter Xu <peterx@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, Shuah Khan <shuah@kernel.org>, 
	Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Raghavendra Rao Ananta <rananta@google.com>, Vipin Sharma <vipinsh@google.com>, Alex Mastro <amastro@fb.com>, 
	Matt Evans <matt@ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 9:27=E2=80=AFAM Alex Williamson <alex@shazbot.org> w=
rote:
>
> On Mon,  2 Nov 2026 23:04:45 +0000
> Mina Almasry <almasrymina@google.com> wrote:
>
> > Add a regression test in vfio_pci_device_test to verify that huge_fault
> > on writable MAP_SHARED VFIO PCI BAR mappings handles write faults after
> > soft-dirty tracking clears VM_SOFTDIRTY and downgrades vma->vm_page_pro=
t
> > to read-only via /proc/self/clear_refs ("4").
> >
> > Use vfio_pci_find_mem_bar() to locate a memory-backed BAR of at least
> > 2 MiB that is safe to read and write, and zap existing BAR mappings via
> > PCI_COMMAND_MEMORY before each sub-test to verify both:
> >
> > 1. Read-then-write fault sequence after clear_refs, exercising in-place
> >    huge PMD/PUD write-protection upgrade via wp_huge_pmd()/wp_huge_pud(=
).
> > 2. Direct initial write fault on an unpopulated BAR VMA after clear_ref=
s,
> >    exercising vmf_insert_pfn_pmd()/vmf_insert_pfn_pud() with
> >    FAULT_FLAG_WRITE set.
> >
> > Skip gracefully when the device has no known memory-backed BAR >=3D 2 M=
iB
> > or when /proc/self/clear_refs soft-dirty tracking (CONFIG_MEM_SOFT_DIRT=
Y)
> > is unavailable.
> >
> > Suggested-by: Alex Williamson <alex@shazbot.org>
> > Cc: David Matlack <dmatlack@google.com>
> > Cc: Matt Evans <matt@ozlabs.org>
> > Signed-off-by: Mina Almasry <almasrymina@google.com>
> > ---
> >  .../selftests/vfio/vfio_pci_device_test.c     | 65 +++++++++++++++++++
> >  1 file changed, 65 insertions(+)
> >
> > diff --git a/tools/testing/selftests/vfio/vfio_pci_device_test.c b/tool=
s/testing/selftests/vfio/vfio_pci_device_test.c
> > index 93c11fd5e081..323a316f59e7 100644
> > --- a/tools/testing/selftests/vfio/vfio_pci_device_test.c
> > +++ b/tools/testing/selftests/vfio/vfio_pci_device_test.c
> > @@ -1,10 +1,13 @@
> >  // SPDX-License-Identifier: GPL-2.0-only
> > +#include <errno.h>
> >  #include <fcntl.h>
> >  #include <stdlib.h>
> > +#include <unistd.h>
> >
> >  #include <sys/ioctl.h>
> >  #include <sys/mman.h>
> >
> > +#include <linux/compiler.h>
> >  #include <linux/limits.h>
> >  #include <linux/pci_regs.h>
> >  #include <linux/sizes.h>
> > @@ -102,6 +105,68 @@ TEST_F(vfio_pci_device_test, validate_bars)
> >       }
> >  }
> >
> > +static void zap_bar_mappings(struct vfio_pci_device *device)
> > +{
> > +     vfio_pci_cmd_clear(device, PCI_COMMAND_MEMORY);
> > +     vfio_pci_cmd_set(device, PCI_COMMAND_MEMORY);
> > +}
> > +
> > +static int clear_soft_dirty_refs(void)
> > +{
> > +     ssize_t ret;
> > +     int fd;
> > +
> > +     fd =3D open("/proc/self/clear_refs", O_WRONLY);
> > +     if (fd < 0)
> > +             return -errno;
> > +
> > +     ret =3D write(fd, "4\n", 2);
> > +     if (ret < 0)
> > +             ret =3D -errno;
> > +     else
> > +             VFIO_ASSERT_EQ(ret, 2);
> > +
> > +     VFIO_ASSERT_EQ(close(fd), 0);
> > +     return ret < 0 ? ret : 0;
> > +}
> > +
> > +TEST_F(vfio_pci_device_test, bar_write_fault_after_clear_refs)
> > +{
> > +     struct vfio_pci_mem_bar mem_bar;
> > +     int ret;
> > +     u32 val;
> > +
> > +     if (!vfio_pci_find_mem_bar(self->device, SZ_2M, &mem_bar))
> > +             SKIP(return, "No memory-backed BAR >=3D 2M on %s\n", devi=
ce_bdf);
> > +
> > +     zap_bar_mappings(self->device);
> > +
> > +     ret =3D clear_soft_dirty_refs();
> > +     if (ret =3D=3D -ENOENT || ret =3D=3D -EINVAL)
> > +             SKIP(return, "soft-dirty clear_refs unsupported (%d)\n", =
ret);
>
> My comment on v2 that this doesn't accurately test whether soft-dirty
> is supported, potentially leading to a false pass still stands.
>
> Please also have the courtesy to give reasonable time for review before
> a respin.  Personally I would expect self review and testing to take
> longer than the 80 minutes between David's feedback and v3.  Thanks,
>

Ack, my apologies. Will do.

--=20
Thanks,
Mina
