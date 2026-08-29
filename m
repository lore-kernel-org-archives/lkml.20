Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79C92248B3
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 01:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787965822; cv=pass; b=rjpyHehLCFCtHf8yIDEp072/q7lamhJ5oyJrTnELkw2fSxDc2lXb6kt0cfG8snrS1nLfGteNOXpm9ZHeXxwppfmv/vzlQmdxzMA6vx0EfjEj6QGNN/kNyvXdt+vWiEW3DZK1eqv+BhYqq2x02hlKumNK9udrVSCHg5y/aC6SHHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787965822; c=relaxed/simple;
	bh=1mrl5vfsxPOcxX49j/Nr+QxRQPhhznHCQB+r9IYmE4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XANpKM44I7Kfehzdqb9kCBaj5Mqb4+6fVHNH79NBuQuTG/8KaECRgcK2MTDhD+fURUtsFdGTFSKgcHaOKTemjthTryBgeDGQnFh2s0VipvGDeIevD2vDY438T3YIpUwYAkvxt50JrVOrioZSUm1ufQB0IjrkQi8aOO614KNG/dY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sKdAwxe+; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sKdAwxe+"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a623987d32so868883a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:10:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787965817; cv=none;
        d=google.com; s=arc-20260327;
        b=ZJ8G2ASAuNeiM1QH6B3XNiKZKk3Ti/xJJsDn1Ds8SOJzKDM7cQl66ExPA7wMUSO7j4
         JWaodqtOHRKZ1gIaqh0YM3gNO99pmTv7yNN1xlJevDkH7sLaN0fqK2mh5vdHvL55fX2O
         Yhp05OiVqSHwXkGPUS9uaXde2SzUYdQzeSPN/azRW+ZJYZnli/GwDuhEchDSUO3oHzAz
         M6px+U0ULpMz5KXaHKQW/liMyWByYxrwsg53ULXxtkhEzVmocXo3jv9zdf8Jv1bvfe6/
         gZmzQ7WRw2TIvAWVNqZ6jHCRNQheljEcITRxgf0lZ9xuj69NFidCZu+hmChC6x9Gf3c2
         9s6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LDkUuQMIHGGiLSZiYVg4s5IjnV+PlGExO2xnMcJB/98=;
        fh=6X6EsUaBAcxiT84uQPs3Pfg6suUHTiGMYMbDHHXqwBs=;
        b=Ph9fqki+VnYqruChCZfOVWssMtzjp/dnqLzRrWlgLUSwVZpi4qu8bHLdKdybj6/QfV
         O3/jxXnt3VRN67/XCnR/d27Wo09tb10H8aaPbr89echGNfrNX+oA6KtJVEOllTORJwyH
         H61WjJvRVbgZ36F8JN9c3V5bFA1mFgaalZuAOlXbcj+7uyzRQuLb9jgf+R+8VaRp086d
         F7zAGpmtcA4Ssl9FzL8PLznDadssph/Nhp1oN+O4jQqFbmfNCGWsevZqugY1XqzQcSl+
         ORao/S09Y/MMEjmoWYVv/qXukrqyd437dqh0INeNOxUkTpIPVLBU7MsbO0O214U3pa7e
         p6WQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787965817; x=1788570617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LDkUuQMIHGGiLSZiYVg4s5IjnV+PlGExO2xnMcJB/98=;
        b=sKdAwxe+TdDSUVtnEMTy34PjYuYffS21Gj1+W31yG6GX2bVQxLnJuEiAGvz8+QlL7h
         gDaRTGAxgD9odwoshYI5pQOS4wOv+bG/u9uAMckdXwEmSt/rP4qomh0jT0SlzhMmduh9
         5Vl1GP1v4srPUFBZlwNuA/okJPQDdVM523TJjPQtUELhc5QBAVlPmStuYcrL3NIfPG3L
         hPLo7wxOQ61536+Nr/buUYmj7LXAoCj+WWL9r+UR/AaY8Ts5YBvOsXTa9Rdpa8CUCKWh
         eZpIJJ6NPukZ4qlZd7C2Hzs8bMLoVa31L/NnOpqWyAtq3h3i8u/akFztvDj3mfIAlA1E
         h77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787965817; x=1788570617;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LDkUuQMIHGGiLSZiYVg4s5IjnV+PlGExO2xnMcJB/98=;
        b=BO2L9FEPpQk3u54DJhhdyQLzYCbjxVAsGy0l6fUIXe6IIVDQdQH8UYPSGG3mcftxbg
         e21+xorXzIp783sQHsgT4PoNzlo1nEL0UjyGSMHJ4N1TLMkvF/Cu4si1EdP6Grl7vGVn
         ns6ibutmJLiT0/QYToR3//eVQLk41FlBAl/SS8GZBAP2YInTCWTUw5gA37e6cfMKAbYz
         /j01BFvKBSA7lOt3ycTcOXyIGPpe1tbdJl0wg1+t0rIR4thvmb2Gfw1SkAYAMlGKDNyu
         aifbQwQh+FgFiI7uYPDrBZJZlS7EDEEgn0bpuK3oqm6g6v41B0rOlPNfutEwxWG9tH5y
         /XqA==
X-Forwarded-Encrypted: i=1; AHgh+Rqvu5WyPCzoE4Q6XTYYBNjdJZ5cEQMVaWgB9r+JcDgz4x0hinAyWqtnlJW23pomovBh906i993YYloAJkU=@vger.kernel.org
X-Gm-Message-State: AFuF++mH6c4Oxp7fJSDpbmC1e88OVtmy0CjQ1LsR90b8Xjd4FawvnlMM
	ndipdMtzZfypigBMTODOcr5Q7HA3iRsQxP3rfpB3KmIjOCB+3onPP7S4S3TZweCeICbITColfUA
	Tqi8bHTh00xkNO8bmd8ebG5+nZsL5A2GmLI1Gah1j
X-Gm-Gg: AR+sD11/T/hWCyYPbHNrkYrTavb/SVguwdupPVEytkeZNipf+AO4msJU60zVknBYcbu
	dg2xtekIl26H6uzl8AmLq3Gj8uicWy6IPqGzaTD4V6FmxvZpHy0wiPz1NeE48sPx2UGtwN+BoYA
	GBoMc6cQhn+3lsSCKALEL57ITY61XBOo9SU69HsbsS8H6k/1zB64+yhs9Z5oLuK/Dz4VHYWMnsb
	Fxh9lT3u26SIWxZJTujdeyy/i3lyzDTnMTqBdZDSzZ2tfb3ItpNZEdURPxjRznN8CDegd8GFvfe
	xJ2IOwI21FnBii8UTw22XZQxg7OjKz0XS4vQHzF4auc+O3dSDt4ibgD4HHsPPdULGTKE5wDMiRE
	+lKRYOYWlYm9cR9IDolflY+rvaBJGxAv6wja8Ta04cQTSpITVXnxH34iDvdM6gZGhezhHEpy1Mm
	pHfuGSOnLZbOgj
X-Received: by 2002:a17:906:f592:b0:c25:d03:6794 with SMTP id
 a640c23a62f3a-c2557416218mr792240166b.16.1787965816803; Fri, 28 Aug 2026
 18:10:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828222640.1638457-1-jthoughton@google.com> <20260828173302.29778f1bf802a1db932778ad@linux-foundation.org>
In-Reply-To: <20260828173302.29778f1bf802a1db932778ad@linux-foundation.org>
From: James Houghton <jthoughton@google.com>
Date: Fri, 28 Aug 2026 18:09:39 -0700
X-Gm-Features: AcwNN1UYXr9aSh6ZJb7y7EO3U_vx_4UVQ4qPVOOoPdPKw3zhEMSrjR8DApQcQpU
Message-ID: <CADrL8HVzfEXgE9OQfULhe6wh1kMMOALsYuCNOUkgBqtzk_LUVg@mail.gmail.com>
Subject: Re: [PATCH v2] mm/khugepaged: Don't install PMDs in
 uffd-minor-registered VMAs
To: Andrew Morton <akpm@linux-foundation.org>, Lance Yang <lance.yang@linux.dev>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, liam@infradead.org, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Usama Arif <usama.arif@linux.dev>, Yang Shi <shy828301@gmail.com>, 
	zokeefe@google.com, hughd@google.com, Kiryl Shutsemau <kas@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 5:33=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Fri, 28 Aug 2026 22:26:40 +0000 James Houghton <jthoughton@google.com>=
 wrote:
>
> > Userfaultfd minor faults provides userspace with the ability to manuall=
y
> > install PTEs with UFFDIO_CONTINUE. Right now, khugepaged collapse can
> > map holes in the VMA when a naturally-aligned THP is present without
> > explicit action from userspace.
> >
> > This is a problem, as it bypasses userfaultfd minor faults that
> > userspace is expecting to handle.
> >
> > If userspace implements post-copy live migration using userfaultfd mino=
r
> > faults, this situation is currently possible:
> > 1. The VMA for guest memory is userfaultfd-minor-registered and nothing
> >    is mapped in the page tables.
> > 2. A stale copy of a page is present in a naturally-aligned THP (from
> >    pre-copy live migration).
> > 3. khugepaged collapses the mapping of the THP, installs a PMD.
> > 4. The VM now has access to the stale contents =3D> VM is broken.
> > 5. After installing the correct contents, userspace attempts to map the
> >    page with UFFDIO_CONTINUE; it gets EEXIST, indicating that something
> >    unexpectedly mapped the page.
>
> Did I read somewhere that this it biting you in a real-life scenario?
> That would use useful info to spell out.
>
> Or is this a theoretical thing?

So far it is only theoretical (but please do keep reading). I caught
this while debugging a related, real problem.

The real problem was that userspace was doing MADV_COLLAPSE (*without*
userfaultfd registered) and assuming that page tables wouldn't be
created. This is of course incorrect, but for some reason we only
started hitting this after moving from a 6.6-based kernel to a
6.18-based kernel. I don't know what change caused this (most likely a
downstream change), but the real fix was for userspace to instead do
something like:
1. MADV_COLLAPSE (let's assume this must be done)
2. UFFD_REGISTER_MODE_MINOR
3. MADV_DONTNEED
and we're good to go, right? Wrong, in fact!

I noticed that there was indeed a circumstance where khugepaged could
create PMDs even when userfaultfd *was* registered, making the
userspace fix technically incomplete. That's what this patch fixes.

I haven't yet seen this in our production environment (as far as I am
aware, hence "theoretical"); we don't actually have that many VMs
running a userfaultfd-based live migration stack anymore though (maybe
tens of thousands).

I hope that extra context is helpful.

> > The naturally-aligned THP case is the only case where this is a problem=
.
> > khugepaged otherwise requires all PTEs to be present for
> > userfaultfd-registered VMAs (i.e., max none PTEs is 0), which is
> > correct. This check is essentially bypassed for naturally-aligned THPs.
> >
> > No changes are needed for file_backed_vma_is_retractable(), as zapping
> > PTEs is safe. Userspace must already handle cases where PTEs are zapped
> > without explicit action (e.g. due to reclaim).
> >
> > Fixes: 58ac9a8993a1 ("mm/khugepaged: attempt to map file/shmem-backed p=
te-mapped THPs by pmds")
> > Cc: <stable@vger.kernel.org> # 6.1
>
> From the changelog it isn't clear why a -stable backport is proposed?
> I assume the userspace-visible runtime effect is a rare and bogus
> -EEXIST from UFFDIO_CONTINUE?

Although this bug is likely pretty inconsequential (I'm not sure how
many users of userfaultfd minor faults there are), but rarely getting
EEXIST back when UFFDIO_CONTINUE is a userspace-visible bug that
doesn't really have a great workaround.

Because this bug essentially breaks userfaultfd minor faults,
*technically* live migration implemented with it can sometimes corrupt
guest memory, and the hypervisor (like QEMU, but QEMU doesn't use
minor faults) only learns about it after the fact, after we get EEXIST
back. IMO this is enough to backport the patch to stable. But if
others disagree, I don't really mind.

>
> > Suggested-by: Lance Yang <lance.yang@linux.dev>
> > Tested-by: Lance Yang <lance.yang@linux.dev>
>
> Wondering what Lance tested.  Was he able to reproduce the bug?

I assume he just re-ran my repro, but yeah I'm not sure, heh. Lance,
what did you test?

> Sashiko might have found another race in there:
>
>         https://sashiko.dev/#/patchset/20260828222640.1638457-1-jthoughto=
n@google.com

Let me get back to you on this. Best case, I'll send another
(separate) patch. :)
