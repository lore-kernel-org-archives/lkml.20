Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793389986;
	b=5r1h7K/hF3zbSpRm3qhSU2l7Ky1e+I+TwlBHGo3Z3lZxS7a1wZe0lwnpkmg9lLD8chgj
	 FUgQz+mv4wAv8QKPf3tE6IRnBLgRBwToPy7oScCZtlPBPjVGNZpAXXaYEWsQ+LVLQ7dLn
	 IskpQC079FESH6s71OVfn7plSc7PjYk1uDEF4SzzZA8Jc6gclELcmqwGE1TQL/n+F5znE
	 4AsWxMEBA5qVXcl08K+5347NC3hNpuZdbBptZz2tZBYbeaSMTvGYcYDMRYGUN5yru35qg
	 er1KV2gGGmwOqz7TLnkJOCWGTF7tZ5EcCb1whOkVepO4shWQxycMb0/uA77fnrQ2oWA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=M+BdM9WeGKtKZaWhqQx0TQqxdfo0Oqgz9BExV/rtU8c=;
	b=YgIE7gVIKdJ8ivRl1j1XOeKFRf6IQky4yIZMB9sma4/mqW7+MzOO4OcGsM/Ha5K3IKaO
	 uobDqFsObeIePj9+K3NAc4uqm/9YJa65CyXBuREazEgLtqtLRXAP1+jZwjt1TygsgSyAP
	 NZ52gAntPAIGpWfeR8qeBY7VGMEC/Nc56i13Ytj7K/ugRMkK9pY4m0SHxdCcavte0UInP
	 mBkQdu7aMHkhEXwUjMyJMRDs7hzoTGJaojrS3zlt9HsTONrTl8Vp4Iyw4l5NT2YfDu04c
	 bmi8H64+Z7AQU+N/08BVsLHXiQsIZHOBqzG9SCc8tygsmvQKW+PEu1mv4q+OEdKF/BA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="Qe/gAcEi";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0E1606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:53:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A0E1606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Qe/gAcEi
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5367cc15121so12737821cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:53:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793389980; cv=none;
        d=google.com; s=arc-20260327;
        b=gKrPnFJcnhyvDww9ociFEa2/HMd1r3Zoq475YYYccXBDUV/uyjMI2n4PQD84QgrLgA
         G2Y1WjFzUx3V4iaG68UNEbuzHZiNrvBEcUX72MIZc5Za7meu8A8qMW93R+qC0I5V32nP
         Jztw4Bt8jLupMb2U9pwQ0bbPtiE2SMU4Kr9fu0Bq1HAUkQnt3/dt1m0LD8Kn9Nilu3Zv
         MZmMIJ2mnvb/N4V5c+JZm3Fb6xr7M9Fs5IqYQo+elXaaGzBM+UFAXu+X4ZnA/1EIsoOQ
         UrWSzQhaKTUcahSCq7a9NA2fRpoPVjUulrNyFen5YVJhX2/CSjpKDyfg8mv7HdAOIPMD
         FmfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M+BdM9WeGKtKZaWhqQx0TQqxdfo0Oqgz9BExV/rtU8c=;
        fh=pPCoskY09IOBuiSzocJVHACwlzAoE0aiUZZ/28owLGk=;
        b=UpKm/tWkChfnVun2JhG/m0QZ35+lRSdZ+fp8O9u0UmBfkNCHoQ9pus1rAAnuz+NQoQ
         l5XWMLeuAAWuu+oRvpjObKI52HErewqMTajTFPXs7ITHAx6oFvZtUrd1ARxInyFvTxCZ
         Tm3/wmvOkL+HBeu1uDOQPmDqqsj/OtNmS3u0P7PnVAAEuB0LKOeLrSKdIk+GgsnzqrkD
         zxM1udQi5fSHuQ3owQkcPHcKp85du6EtQKgCl4/EdVzPfpJkAHY4TccFi/TT2ZYNePmv
         Hveht9YW4JENxb8r6DgU8QR0sQ3KgDvuK+8aaesM0vzfF72ZJMPoTrGxa74R1pSkvAyl
         Nw1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1793389980; x=1793994780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M+BdM9WeGKtKZaWhqQx0TQqxdfo0Oqgz9BExV/rtU8c=;
        b=Qe/gAcEi05CmazbVFGJG6MC2y/lEV7BIPbL2moKmqBCgaUI1F0umwaCz7ccXtSM3Nm
         E0Jlp77DRyMTuUTf82/ojtyzo+CDbCzVaywRB/kOgDeOdjojaKSMrwm8R4M1HZ+6y800
         65mX5dfPNYKxwGQLspt8lgAAXSkzCdzoJeYHJ0CmZAlzse46eVRnPq9toAwzBv6D0msf
         PGGRhbir0eSUeuhde/eAv8CsqKwzj8vcXXAUrqC7AsGUCmpxjaKI8BjRkdf6XLOjgJtO
         Xl8FNOUbs7wAtPKFLtgPn6BEquVGDezxdUaLdmxEOvsiOtzr6Aw80PTpSTYzYsLicEsX
         cD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793389980; x=1793994780;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M+BdM9WeGKtKZaWhqQx0TQqxdfo0Oqgz9BExV/rtU8c=;
        b=ko2hq94u/3qppSk5DqL+A3Jt9c9Jv7hreqHq8aTMwitk5ZYj0KuajFh83OiAxRn0bF
         BSyG3If++15n0Ar48LY7f/0AHp6VM9c7rcVRCERyYXX7fo6M1hogHXXATndkWXB9td5F
         CqEO/I25CYutXEkZnXWB2Qyaa4/6p8jKbN61rVJ7upUyK1WQtdL82rhjfTfDnmjh7UQH
         gsJ58d+cJCWvS1cSLX2LD7Y9sxaGAxHehG7MriIHCedd2vPlm3aIUepNtROPLnPYMgtD
         Eo95zBK5EZ9tEugGUolVI/2E12J8e7IWOoNbUeia1qNcAStWyW5vAk9MwX5zv1yFA/6S
         HsvQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIGVW37KwYb7A8v6ofxk672D1mxHHkuvo7p/DugTOnnv52frAIrH+fzewPRtBsn0nITMnYXniykxnmf3Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdEVSMd1W6sxVb8Pec2cPzwg6S/kWSteY7UaX3lnwQKp6cvIkZ
	Sg6hDwuuTWmFxUFHTTd7nYVZn55ufd1RFXWo/Mkc5EeKXuTHeiTRau1bP4qa3dLCKT9arhRqfPU
	lDBg56Rdww4zjqoLfy0QGGcFu3Kvv1zLeXKZZEjzl
X-Gm-Gg: AYBFou1zQBtEqBe4mN+wUWzW9dAQWSvf/jxWuRsc9RY97ZPQqa8msNm3Fi0PO9tI+UJ
	/Z0x3gvaNDmaP3oovwunBHmSKhjL1D0heR8qr8a36agVr6DV/tIv20cyLJMSD8VTed5jUckDNAg
	wSI7v7hm7OHU0v5iORIH9N2i+xAz8fNu9pNb/bmTdmYIugCCArSErFZvS74wH+yulSm9MV80u07
	kEH2c0RhARuc9DQgacZCzR9GX95lGb7GPHJEtq9WCoxaKs4b2BCa6+BW1i0ApsMUD/Xt7vg7CVP
	oOFdDvdvuAfGI+L0teN8WEb1ou/e66iOOxO7tfbW98tfGQINrPNaguqez2/5Xis1CS1JJ6rxpGL
	oWPL3QK5DTRCMNjSq6eTdYiF4YMbl50/2T9bbRol2y8BheojAzH6vn7E=
X-Received: by 2002:a05:622a:34e:b0:536:43d6:2a94 with SMTP id
 d75a77b69052e-542b7145036mr51380891cf.34.1793389980143; Fri, 30 Oct 2026
 12:53:00 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026220546.3114241-1-skhawaja@google.com> <CALCETrXNEWQNPjtuHnTfVFOafeJ7APXq288Cq16Q5adDNYx9+A@mail.gmail.com>
 <auEksxfAi9lHFXmT@google.com> <CALCETrXDY2e8x2kdr-FQvFLs-Y7FwNozXGDvqqM6yvVA7QLV3g@mail.gmail.com>
 <auPKfqh_YjRU9Ui3@google.com> <CALCETrUEyfvaEGxMHo=c0ia3CDgSxg-YW0_=Z7T31Ou+pvicuQ@mail.gmail.com>
 <CALCETrVpEP=HxVqdSP_AgA=U7ignwAgjz5Vi9+Z9dZsX5DXeLw@mail.gmail.com>
 <20261030121259.GC3889730@ziepe.ca> <CALCETrW6RUgTGFuqx+cxV0c+Oq4d-P5C8AQ2ja0ESMP_8JGpxg@mail.gmail.com>
In-Reply-To: <CALCETrW6RUgTGFuqx+cxV0c+Oq4d-P5C8AQ2ja0ESMP_8JGpxg@mail.gmail.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Fri, 30 Oct 2026 12:52:45 -0700
X-Gm-Features: AclHuK9sB5PkTPxFH6Td3Meg7Fy9jFpGf4zpslN407GFn3D8So9__FrNUMzsHq0
Message-ID: <CALCETrUGa4zE3Zx+5Dw_UYEFgMmgDYQUeCxvPKv_-u56hQ1W7A@mail.gmail.com>
Subject: Re: [PATCH 0/2] mm/memfd: add F_SEAL_PUNCH_HOLE
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Samiullah Khawaja <skhawaja@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Jeff Layton <jlayton@kernel.org>, Chuck Lever <cel@kernel.org>, 
	Alexander Aring <alex.aring@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Gerd Hoffmann <kraxel@redhat.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	Jeff Xu <jeffxu@google.com>, David Matlack <dmatlack@google.com>, 
	Pasha Tatashin <tatashin@google.com>, linux-mm@kvack.org, linux-api@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 7:54=E2=80=AFAM Andy Lutomirski <luto@amacapital.ne=
t> wrote:
>
> On Fri, Oct 30, 2026 at 5:13=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> wr=
ote:
> >
> > On Thu, Oct 29, 2026 at 07:11:25PM -0700, Andy Lutomirski wrote:
> >
> > > I can't shake the feeling that the problem here isn't so much that KH=
O
> > > + iommofd doesn't like this but that the behavior in question is
> > > nonsensical.
> >
> > It has been this way for ages, like David says if userspace shoot
> > itself in the foot it should not be surprised by this illogical
> > behavior..
> >
>
> I dunno, a couple weeks ago I tracked down a 20+-year-old bug, and now
> it's fixed :)
>
> > You can get the same nonsenscial thing with just mmap too, you don't
> > even need a memfd.
>
> I feel like there are multiple levels of footgun here.
>
> mmap anonymous (or MAP_PRIVATE), pin the pages, munmap: okay, mmap
> creates unnamed private memory, and munmapping is maybe like unlinking
> a file -- if someone else is still accessing it, it's still there.  In
> fact, you can mmap, fork, unmap, then mmap in the same location, and
> your child process still sees the original memory.  It's not clear to
> me that anything is wrong.
>
> mmap anonymous, pin, MADV_DONTNEED: okay, this one is starting to be a
> small footgun.  But at least it's pointed at *your own feet* (unless
> you've forked, which in which case maybe it's pointed at a related
> process' feet).  I would still argue that the kernel could notice that
> it's false that I "DON'T NEED" the memory and fail or ignore the
> request.  And the kernel's pages are still anonymous.
>
> mmap a named file or memfd, pin, truncate or punch hole: who says the
> footgun is even pointed at my own feet?  If I mmap a named file,
> SCM_RIGHTS it to you, and you mmap it too, and then I punch a hole,
> the rmap machinery had better invalidate your mapping along with mine
> (and get the TLB flush right!), and it would be an unambiguous and
> severe bug if this didn't happen correctly.  After all, what you have
> done is to assign a *logical range* within the file an address in your
> address space, and nothing I do should change that fact (except,
> sadly, truncate, which can give you a SIGBUS, but your vma still
> logically refers to the file).
>
> So why is the kernel exempt from keeping its own mappings coherent the
> way it keeps user mappings coherent?
>
> What if that memfd (or tmpfs file or whatever) is shared between
> multiple processes that don't trust each other?  One of them can cause
> it to become incoherent from the perspective of the other one's use of
> kernel APIs.
>
>

I'm contemplating what would be involved in fixing this for real.

First, there's a scary code path in shmem_replace_folio.  AFAICT
memfd_pin_folio() can race with swapout, so a pinned folio can be in
swap cache (obviously we won't *free* the folio if we do this).    If
we then decide to replace the folio when we swap it back in,
shmem_replace_folio() will not notice the pin and we become incoherent
and no one needs to hole-punch the file for this to happen.
Fortunately I haven't spotted a reason that shmem_should_replace_folio
would return true in a case where we care, but if someone does what
the comment suggests and makes it start respecting cpuset or NUMA
policy, this could easily change.

Other than that, I think that hole punch could be made to be fully
safe in one of a couple of not-horribly-invasive ways:

Choice A: Make hole punch work like migration.  Unmap from page
tables, do folio_ref_freeze(), and tolerate failure -- either just
abort the hole punch operation or zero the contents instead of
punching it out.  (And contemplate whether this could be made slightly
more permissive by tolerating a swap entry that still has a live folio
if the live folio has the expected number of references.)

Choice B: In addition to tracking references, mappings, and pins of a
folio, also track a new type of reference that keeps the folio from
dissociating with its mapping or changing its address within the
mapping.  Most code that pins a folio would be changed to take one of
these fancy new pins -- the main thing I'm thinking of that wouldn't
need to is writeback or perhaps non-long-term pins that are just
reading the contents.

Choice C: like B but instead of deciding per caller, treat exactly
paths that take long term pins as also pinning the folio into the
mapping.

For B and C, a big open question would be how this interacts with
truncate.  I think the idea behavior is that a mapping-pinned folio
that's past the end of a file would remain and if the file gets
extended then that folio would represent the portion of the file that
it covers again.

--=20
Andy Lutomirski
AMA Capital Management, LLC
