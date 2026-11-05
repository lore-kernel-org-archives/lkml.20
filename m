Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793919412;
	b=BaObsr2gN2K1ontbps17i3trAp+CYFJmBmGB7Ti5ufriI+jHpNxXuQy2r08WMDGnxjA0
	 jE+5RdCaTiQyybQi4LEsMhq3yBX9Lg8gUV71wYp8afPuO85cRfNEbMSpwFSN8c6zKFnW2
	 AfvsJlzzYtm3R3dlX6L2Vvk75VG6t+PRS3nj+Wxtrn72idTb/3KsUcCAMPZzkpl1zTV/Y
	 R8ua4dyLfld+H3F3btW4Yzm6ikVH5VUPubMDvvj+E6kz03UMrANbVVr0tBSVMzdI6M6mg
	 FYm/b4mP1aZ0thBk6hcfIf8Ifd3nkITbdrBlDoWZUsBeG+Ae9/z1sAsw0ydtvzlwjTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793919412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=beWRPlgAl/peRVZEkF/oGc+heGWLz/peIuKHHlXmZvg=;
	b=GkwgK0sKi3MEZA0tBbUK7hZPRhr2vfzVGSQcGDDMZz2rnMjqHkJvJw1NSXeDg/8RarGd
	 0KdRyTZZXVCkZZEOqgYHp0sFevi6TDUZFSDscu6XR2Kvk664Uo9PXHn5z/80FTmolMhAj
	 SXIALdxJGkCGDaeD29C8fOYBvuBKdkRFtaB+rZi9S90+qXk7X7uqjgu8rnRDe+08ZN61r
	 nb9MbswvRcBTnaRkRhDCzgr673MIYV8XW2BTTAv76n7VKHhL5dcY8C6skR0V6ue71NgLs
	 CUz4GSNG5sR2e1h4szs/d6msdl6tTAHW0zfTeUU2LGwBULy0cd8BdWmjEgKq1hbxJvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XwnFB3pE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC91606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 22:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FC91606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XwnFB3pE
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so4492766b.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 14:56:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793919410; cv=none;
        d=google.com; s=arc-20260327;
        b=Iu4Z5y89IHt9OoSSh4rk3CvH6dyxHnx7Q0Qk+YKB7aItp00UTNcx2/av0c6xU9N7eF
         eRiJH1i3G/D4ha/EUcu5feOVcIivByTtEs2IkArQC/vqAWSsmQsSvAzpyUHHeFmaJHqF
         KahU/8dILUDIUI03FQ//9HT05x97VVgvr5zp8hwwnTkBXhXJbL58qHihcLJ+k6sz/MSn
         +RmmLtG9toS1gwxHepqBYVD45Zc/NV6gGDl/Q9r+PYdJJEv4009P6SBKgIgRfn8DvrsL
         cQBkpS3Kba/og8TUatIZAV8ZQy4JD4S58HR+63x5wJq9CRGXZEUeXQoyBv/rtVPeu3LL
         lM3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=beWRPlgAl/peRVZEkF/oGc+heGWLz/peIuKHHlXmZvg=;
        fh=UZ+c8otrEx5wwF1SIo03HNRE0a5rVz7sXKuAa+16DWk=;
        b=inYXofXwWG1hJ28JzTHdjkC63V8MoVuTxN4gKcPHENJrseKWZxWjZg0TYQqvhMmrS0
         bFslFTplkqYu/uQYKxIJUuS/IVMt6qA8rwjFj3VBYyAWxwNFtHJpccalLNek24o6YI+J
         8qRraWLZ9Q6cZWTQQx3TKuyA3RE7YDPlPMrTkX3D7j+mroJx2jsuwjHB5T7CpJs9+Zyz
         34/bk9bk8VR7OOSW+9VQszAGBkUZxnhUvVzusYqHwsTzmQ4sSuONqZLN6lO9pE76mBcv
         TE+qZkU/agVbIVyhJxvDTBjwkl8Yno+mSQnlkzsVnkX1A0mg1XTmyaJBMEkW0KzuejMP
         BhfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793919410; x=1794524210; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=beWRPlgAl/peRVZEkF/oGc+heGWLz/peIuKHHlXmZvg=;
        b=XwnFB3pETFUMoUj/6KBzwkdVdkbnR/jrtLE29gyRh8FQEeJ3BBs0+EBi40SfVeS6Mr
         0BOcZcKLKfjoeZYIQqbPO5EX9XAqc4M7jznEVvkiRNLn34aP6iSY2gxHWZVswUhOJQlz
         1poM9X8uv0KXQIbJEt5Cwld+Zkm5mcQdxg3w6nyhOobhXtUC4/Sv819zuAqqVpYT3dg0
         CBe8O8GAB3xUDzHoU5YIXE+PoPjSgZZmjmpiU2F9OXCsze29bNMiFh0g28yX55wdVXNO
         jbEXQDpUkT12V9VnskV3kAY6RcxRqq6qCSFFWoERQ9LcHtXbhfcOCOR9tEZOoViKsxkg
         OHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793919410; x=1794524210;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=beWRPlgAl/peRVZEkF/oGc+heGWLz/peIuKHHlXmZvg=;
        b=fLu4Q3Mb7pL1nX/hhdmrT+VwcFMZon3IqRqJmS/obQMV3pSnmJYjo1x46qTstkjRZP
         ijo94on1ot+6OoUMKA4GT3eE5dokZ0PRyNOtaQBsXKcjjkFLYvraZnJSDr3Suu9KBKAr
         06tnRmKZywhbkYYdUfquluwK2euKmxyWvs+wdNQgikD7V6ASu1+6Fle5T+DLSzQ55SJV
         s3W15GzU5/AHZw7x351ya9/XjUHMjVmqKEIJLoE60dnqcD6hQxkNJzD/K6Tm4DXsQWOl
         6bGTzmznOJS6A8VdiG3snP5+9PeorFyFl9EPzH6Q9JfCxPBSL/vo7zJtTZk6+HAUXKjj
         aY+Q==
X-Forwarded-Encrypted: i=1; AKwUvByAMxgeyVFU5tNQUMm01heqrpf9qUFOLfWQf2Gz00we3Icfu7Yjco7thLO2icbw/GvbRyavfRA8VLFK+is=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LidRpKZ93yg6tlTD0JpOrlVS89RG2dpVNMBvhinpYVbX3v0tl
	l6jbzHuXIhekjqwCYjcXPxVJk+ws78CUI+Sb13Cafl1gBZgaCx8d3gSlEY8NyY9uoxcsMfrg0Lz
	omOkKg3pSE85UfpAC7XV9btdQ1rnMO8fQ00mCTaXQ
X-Gm-Gg: AYBFou1iInRkA2DgkNIA1/xYEM3uap6M85WppGku5bePCjBVA2aLVPMx0JS54bIrfAf
	r9kaekpSo6dGlbCT+UoC+6p0wfl7lE4fM14LqLUrsOkbrehv3CdB7sHkZ/QMiBBS/Lh7bTzl+Da
	OYMzmZpxNDSP/xjyvhMG2yWhyOIlYCOd/7IXJafdR6cCp0Hv/fPo462gsuJa34GBIx5uHC7Jicc
	OXzODcb0LGNCwDs5UpucjuO69Fbz+F73MZXxG09R4L7GALMvMTzqiz0p4x9kc+IbRGN0VLh+93E
	tQV0zwKc9nh5dOIHhJt919DDi1e2ugnejHf1d9X4UE0o70HOasIdjeuQF/aawtIr3t7cmT6aj+3
	I/mlMZ4n09r8qD04asaR65TsBkghPC4KyQwUMGQ==
X-Received: by 2002:a17:907:9811:b0:c40:36ca:9d1b with SMTP id
 a640c23a62f3a-c4d354fc327mr75827366b.40.1793919410007; Thu, 05 Nov 2026
 14:56:50 -0800 (PST)
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
 <20261102230445.3993629-3-almasrymina@google.com> <20261103115926.39e092b8@shazbot.org>
In-Reply-To: <20261103115926.39e092b8@shazbot.org>
From: David Matlack <dmatlack@google.com>
Date: Thu, 5 Nov 2026 14:56:22 -0800
X-Gm-Features: AclHuK8Ff2i-kZKWxjfqjpz2XvgyET4nKGr7VQwICZxEIxfoafnklYeCqUTiYZA
Message-ID: <CALzav=fXeOTXXhxmQKidmO+vrxZDDeecvg2qrPAs6KEWLWPA_Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] vfio: selftests: Add vfio_pci_find_mem_bar() helper
To: Alex Williamson <alex@shazbot.org>
Cc: Mina Almasry <almasrymina@google.com>, Peter Xu <peterx@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Shuah Khan <shuah@kernel.org>, Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Raghavendra Rao Ananta <rananta@google.com>, Vipin Sharma <vipinsh@google.com>, Alex Mastro <amastro@fb.com>, 
	Matt Evans <matt@ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 10:59=E2=80=AFAM Alex Williamson <alex@shazbot.org> =
wrote:
>
> On Mon,  2 Nov 2026 23:04:44 +0000
> Mina Almasry <almasrymina@google.com> wrote:
>
> > Add vfio_pci_find_mem_bar() to libvfio to locate a BAR (or range within
> > a BAR) of at least min_size bytes that behaves like ordinary memory and
> > can be safely read and written without device-specific side effects.
> >
> > Detection is backed by a table of known devices, starting with QEMU's
> > pci-testdev (1b36:0005) BAR 2 when configured with membar=3D<size> and
> > membar-backed=3Don.
>
> Should we test for this?
>
> We could toggle memory decode around writing a short, unique pattern
> with read-back verification.  This might be unnecessary for a physical
> device, but per the definition of this function it should also be
> harmless.  For the pci-testdev, which is our only match in this
> proposal, it validates the BAR is backed by real memory and not handled
> as an unimplemented memory range.
>
> For the use case in patch 3/ it doesn't matter, but for future use
> cases I'd rather see that we generate a skip or failure based on the
> test here rather than debug failures in the test case consumers.

Sounds good to me.
