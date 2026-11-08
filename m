Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794101285;
	b=P8FksRf5B2DSr3EQoUNaJXn+eGHjGCas0RzN3KiciffZ8sypqZBwa0zbFOINdru88l5s
	 Z9mTQECZZtHRkJYy6Sv5Mdh8elCcOkVFTHrxebymRxM46SamLe/YUNZq6XXdYhbe4AXrJ
	 sGPkTBVDTZtun2HMzXpUQTGUO8ziR2cA7lpZRvCDs+ABRtI7793gmB5nwjYd/1Mkf4Xjv
	 wlK7nchC2PQuwr5SHdm63uSb3L/aQm4zLzcjow/JBbzVFSJJXsj+E10iP4IbiPBN37E4t
	 UVWbkksNlJywFUyoyBSU5VeF5GPcL2lzxIWxhY0HPBqNKwyXjM3pjeTtQxtN3acsghQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794101285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wMbLBbMUq3a2Z8kRaW3om6dtlh6fobvmaapCy+PWFA4=;
	b=f+KrsF8Yg/HRD6GuRmGPBcdYJXJrmDp3ABAkad3Lky1k7wedHl9nOtS32LbpnqrIsEJj
	 Jl43VzkXbKzoHZYxbUQkTzYBNXCIs+ngYOs9Tv4/VfKGjxOwfJL4W5Nsczh9ST+p3RETw
	 gmS/pvGBQXTzNmj3aHnAdpQM7TFDMM7eU72HDcQB28FTNYY7nvZ+g3jEnfHkGv0w4UnOd
	 fjJIX0aUpSZh5gyt+kuw06t1NNCksHybG7Z4Z/r1T7aoFIV8NXeYFxBAB1GELpKiNDErk
	 3ZicuAGByaSQyMrBvJZOOqd9zHxhA3bW2q2sZSx9Gxol/NlE3lgE4/1j01gYRhFXDWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=euZVLVZS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21C5606A326
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 01:28:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C21C5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=euZVLVZS
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be47aa555cso114504e87.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 17:28:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794101282; cv=none;
        d=google.com; s=arc-20260327;
        b=mgY5WksMPuqp8B98AVGD8bKkwAQIDTV5QRuB1uckRaTeV5pi2XeUR4984p7wAqV27O
         qm0Q+cz7LZDAxnoD19AEc06uSqacRjFe6zPKYllDyCFvhjhG2fRw4FjxpCN/1NAzHVx/
         xllvv8HyeegdUrz9BNddXFIhj0Rurx8YftdE+hqyfzjs8MqC6EVKcN1Frl1MDz6tY25H
         zEp87z7GLT1ceHzdU5XaYSml7JEDGfWjDRKNYUYiKcFjRHhRRSrrsBjg4KiE9i6dQi9H
         v6ne5fdgfTLI89wGNrPJ8o1xbmI3PaX5PaGYLLaRt05NKWu5fjAxjZ2sLSkBqC2FFfxX
         nc7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wMbLBbMUq3a2Z8kRaW3om6dtlh6fobvmaapCy+PWFA4=;
        fh=Pu7dmEiyK2SRZkDCz51ifjq79ltjMJhmUdgy2T9MK9Y=;
        b=SwZDLZrrOezwQjd8tT/lTtGNk3JksthRPKGNrhrxX53jUfYh0EfGmAy4gZ9SdgwVhA
         yrpZTRsD/fBGy0GE1osX9pvf7Uum/AOrfZXByRhXgkZ09yy+7IyP20m7yQ5iA34iwqjs
         GbgV+SgCbh3M/CtuwYI/FhpWQEuBp+isY8cJDH89muXLv7Ngf0a6e4eZ2DkAEXCMPuHg
         +Bo+iQgt+/2vyGrwpUNw3Hw8twiO9h0XQivu0h85w1Jg6yrz7dl2sju2ccv7AafFEEHU
         M6YE23nmdMTTmGD2BpJiRPyCyD6PgtOlitl63F9F4p8w3giYn3rEutX8awnmNqTGoDjB
         8b2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794101282; x=1794706082; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wMbLBbMUq3a2Z8kRaW3om6dtlh6fobvmaapCy+PWFA4=;
        b=euZVLVZSZaxlQa/7flfrkbUQ41+wC4d8KEG4jaBzKFOzmYXQJJfDjZZbG9jHLGPNBm
         qC1RSEhnqu5tRhxKG0hOEgif/ujZWRhO6UrbsR3DfQXn8UHlztsVrwGI5jND7Hsbd6cu
         bhxOtdxE4SZBaCUp0TKFgGY0QMHjh9y0y4dHJQIn1TR7kgZjSFTvdeqnsVL6pMGrnJWG
         JBWkRj4wQyCxgCdbKf+Jnnt4ogYHs60m1vLW+1o6oy1BWJKQ1BidyOTm5Wib/d6hJmI4
         gSAK1BIuWPDw85AkMRFCbOQ+lg6OonD/WWHApNSIWK8U1u7AqrvMVdYiRWN43R/3U06J
         ptyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794101282; x=1794706082;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wMbLBbMUq3a2Z8kRaW3om6dtlh6fobvmaapCy+PWFA4=;
        b=LnPZzY+C0eK1vaOItQKXL6VlEUJ+c0Ba/dsoTlxgi0ybrdRUvQtqH7IROzVstz3R+i
         HJz8/4yGapNCPochMRhGo4xiJBuE+FTuyB7y21HDh/rd4Q8lBJNBNfuwElkJDb3t4jn0
         gx3ca69/i0gHFdXK5DlYUBcOnxrIe4clwPKGpNtyQhZj6CVkmIL31FXuX8nFCiEGnAiJ
         EbR5m+f/Gz0CR/ogaS9sBgvz4gMyrwhmYAFVrILJGiabsL9Qr63ygrmg1Q5jdbYcRWfD
         6QivdRZFJn98m8FKRnxyUFcUxJGGj0SxoGbvImRqh8/kM2EVZIMzVGua21s1B9A/f+Wi
         39IQ==
X-Forwarded-Encrypted: i=1; AL+hErGZb9sjt98MozUc7pN2+IH4BJNsW8HKORR7REwdHhuISLu8gTNe8rSZHWSRzLZVzJfjKtq2y3sw3lc94tQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SL7rDEQwjddd4azGLIx2YEhD9TpiLjd1ilW5IB3tko7ooUCFK
	WL91k4HlVPvTCA1rsLrBb9MuP7DiBFVUAasEZrduZBo67uNeDy1tBXFXCj6lgILUZY3j4427snA
	hcpJQHeb6CgWIGV32Va96+EQ3uGcpQrA=
X-Gm-Gg: AYBFou1yZ721hXpli9WsLgMU8G+61kZfFEuqVQ+0IiKAx72RZx788di5rSRyWIrmxx9
	5wj2OzOZ9QUnv81vlRKFYC0NBqKBnSoEsPqRluhie/lg7Fon4dSb69cIYrPImzW8UERYC9vhHPS
	i/U5aT+GvxihHwhMBp5lM17G8GgPQmQoHrN/bQmWP0/OXOPB2zF0XvlL1/d9+GzDxtPJUD3+DsO
	EWeZIpW9SHNLrXlTTkIAFa7xkr1AZdemWU1b/CMgmIN41Vz5aDRNvbD0nGgGAI0qkw6HgPJxmRL
	eG848UGMu/Nm0zDSPfp430dboLsy4WFkJPoAsED6KNTxVUExqpa/XyXaMb4g2X9TsYqjMFt9BXg
	ZGBf6Nr3bS+WH8XIgyv0NOAgSDLDLQ/Pe0K1CVg==
X-Received: by 2002:ac2:4f10:0:b0:5c1:49b1:f358 with SMTP id
 2adb3069b0e04-5c14c03a16fmr42913e87.52.1794101282157; Sat, 07 Nov 2026
 17:28:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107030708.1031977-1-graypanda.inzag@gmail.com>
 <c243e6ab-3eb9-471c-9b6e-91064528ce82@kernel.org> <CAO7ntTQGLNtHiu3SY+6HaRZi5gimqjbmw_FoeTSRYpqi1EbnbQ@mail.gmail.com>
 <c15e171b-d0c2-4808-8d42-e5a650b03150@kernel.org>
In-Reply-To: <c15e171b-d0c2-4808-8d42-e5a650b03150@kernel.org>
From: Junyoung Jang <graypanda.inzag@gmail.com>
Date: Sun, 8 Nov 2026 10:27:50 +0900
X-Gm-Features: AclHuK_tFec7OnAi1IvLafTkKS8WjQtkcFaEWLcZl_l-XC8Zv7JX2ViIcQ8LNUY
Message-ID: <CAO7ntTSd_riGK4gVAcO1Tr3eUMgYwGFDJ4m9CRN7J-k22ouQxA@mail.gmail.com>
Subject: Re: mm/mremap: F_SEAL_FUTURE_WRITE can be bypassed via mremap() VMA expansion/duplication
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Hugh Dickins <hughd@google.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thank you for the detailed explanation!

You are not missing anything=E2=80=94as I briefly noted in my initial repor=
t,
ordinary expansion with old_len=3Dpage indeed gives the exact same result. =
I
only highlighted old_len=3D0 in my previous reply because the mremap(2)
wording ("creating a new mapping") overlapped with the F_ADD_SEALS(2const)
wording ("create a new writable mapping").

Your explanation makes the design philosophy completely clear:

1. F_SEAL_FUTURE_WRITE is meant to block new writable file mappings rather
   than restrict page/folio ranges within an already-mapped file. Since the
   process already holds a pre-seal writable VMA, modifying or expanding
   that existing VMA via mremap() is expected to work.
2. In contrast, fresh mmap() or pwrite() calls only take an fd, so allowing
   them for a process that already holds a writable mapping would require
   scanning existing VMAs=E2=80=94which is unnecessary overhead and complex=
ity, so
   they are simply rejected outright.

That clears up my confusion completely. Thank you very much for taking the
time to clarify this!

Best regards,
Junyoung Jang <graypanda.inzag@gmail.com>

On Sun, Nov 8, 2026 at 3:16=E2=80=AFAM David Hildenbrand (Arm) <david@kerne=
l.org> wrote:
>
> On 11/7/26 16:19, Junyoung Jang wrote:
> > On 11/7/26 04:07, ... wrote:
> >> On 11/7/26 04:07, Junyoung Jang wrote:
> >>> Hello,
> >>
> >> Hi,
> >>
> >>>
> >>> I found a reproducible F_SEAL_FUTURE_WRITE seal-policy bypass. A proc=
ess
> >>> holding a one-page shared writable memfd mapping created before the s=
eal can
> >>> use mremap() after the seal to gain writable access to additional fil=
e pages.
> >>
> >> F_SEAL_FUTURE_WRITE is not really range-aware. What makes you believe =
that it
> >> would be?
> >>
> >> I'd say it's expected that if someone has write access to the memfd, i=
t has
> >> write access to the whole thing, not just some subset that was obtaine=
d through
> >> the initial mmap.
> >>
> >> Any documentation that made you believe that it works that way?
> >
> > Hi,
>
> Hi :)
>
> >
> > Thank you for the quick feedback.
> >
> > My understanding came from the following documentation and commit histo=
ry:
> >
> > 1. Linux man-pages: F_ADD_SEALS(2const) / fcntl(2) (under "File Sealing=
" ->
> >    "F_SEAL_FUTURE_WRITE"):
> >
> >    "The effect of this seal is similar to F_SEAL_WRITE, but the content=
s
> >     of the file can still be modified via shared writable mappings that
> >     were created prior to the seal being set. Any attempt to create a n=
ew
> >     writable mapping on the file via mmap(2) will fail with EPERM.
> >     Similarly, an attempt to write to the file via write(2) will fail
> >     with EPERM."
>
> Note that "mapping" here means "file mapping" not "folio/page mapping".
>
> >
> >    (Reference: https://man7.org/linux/man-pages/man2/F_ADD_SEALS.2const=
.html)
> >
> > 2. The original commit introducing F_SEAL_FUTURE_WRITE, commit ab3948f5=
8ff8
> >    ("mm/memfd: add an F_SEAL_FUTURE_WRITE seal to memfd"), which states
> >    that the seal:
> >
> >    "...prevents any future mmap and write syscalls from succeeding whil=
e
> >     keeping the existing mmap active."
>
> Right. The thing is that somebody that didn't have write access to the fi=
le
> before (through an existing mmap()) won't be able to gain write access (t=
hrough
> a new mmap/write) later.
>
> Expanding mmap() or mremap() modify an *existing* mapping, they don't cre=
ate a
> new one. I think we don't guarantee that expanding mmap works, but mremap=
() must
> work.
>
> >
> >    (Reference: https://git.kernel.org/linus/ab3948f58ff8)
> >
> > 3. Linux man-pages: mremap(2) (man2/mremap.2, regarding old_size =3D=3D=
 0)
> >    and the comment in mm/mremap.c:check_prep_vma():
> >
> >    mremap(2) documents that when old_size is 0 on a shareable mapping,
> >    it behaves by "creating a new mapping". Similarly, check_prep_vma()
> >    notes that "!old_len is a special case where an attempt is made to
> >    'duplicate' the existing mapping".
>
> Right, the relevant part here is:
>
>         old =3D mmap(NULL, page, PROT_READ | PROT_WRITE, MAP_SHARED, fd, =
0);
>
> and later (after sealing):
>
>         expanded =3D mremap(old, 0, 2 * page, MREMAP_MAYMOVE);
>
> With your reproducer:
>
> $ sudo ./memfd_future_write_mremap_poc
> writer uid=3D10001; mmap=3DEPERM; pwrite=3DEPERM; mremap write=3DZ; resul=
t=3D63
> owner uid=3D10002; file page 2=3DZ; size=3D8192; result=3D255
>
> Assuming I specify instead
>
>         expanded =3D mremap(old, page, 2 * page, MREMAP_MAYMOVE);$
>
> $ sudo ./memfd_future_write_mremap_poc
> writer uid=3D10001; mmap=3DEPERM; pwrite=3DEPERM; mremap write=3DZ; resul=
t=3D63
> owner uid=3D10002; file page 2=3DZ; size=3D8192; result=3D255
>
> So same result. What am I missing?
>
> >
> >    (Reference: https://man7.org/linux/man-pages/man2/mremap.2.html)
> > > Combining these references, I interpreted the intended invariant to b=
e that
> > post-seal writes are restricted to the pre-existing mapping itself, rat=
her
> > than granting the process blanket write access to the entire memfd.
>
> Again, mapping talks about "file mapping", not "page/folio page-table map=
ping".
>
> >
> > In particular, two behaviors seemed inconsistent with the idea that the
> > process simply has whole-file write access:
> >
> > - Even when holding a pre-seal writable mapping on page 1, the same pro=
cess
> >   cannot call pwrite(2) or a fresh mmap(2) with PROT_WRITE on page 2 (b=
oth
> >   fail with -EPERM).
>
> Right, but the main challenge here is rather figuring out whether the pro=
cess
> already had access. We'd have to scan existing VMAs which is just unwarra=
nted
> complexity for something nobody really needs ;)
>
> > - Calling mremap(2) with old_len=3D0 creates a brand new VMA covering p=
age 2,
> >   which appears to bypass the restriction against creating a new writab=
le
> >   mapping after the seal.
> >
> > However, if the intended design in mm is strictly an mmap()-time check=
=E2=80=94where
> > any pre-existing VM_MAYWRITE VMA implicitly retains the right to be
> > duplicated or expanded over unmapped file ranges via mremap(2)=E2=80=94=
then I
> > understand why this is considered expected behavior. If that is the cas=
e,
> > perhaps clarifying this in the F_ADD_SEALS(2const) man page would be he=
lpful.
>
> Correct me if I'm wrong, the only confusion is about the mremap() doc say=
ing
> "old_len=3D0 creates a brand new VMA covering page 2".
>
> And you seem to assume that "new VMA" implies "must be rejected", whereby=
 we
> already have a writable VMA there and there is not really a reason to rej=
ect it.
>
> --
> Cheers,
>
> David
