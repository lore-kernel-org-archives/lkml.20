Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793209912;
	b=sF8ToLEvOeK07l4j4JBdkJdXbLGzGiL4UwTgGKelh4NzPEfQwWWghiJG8gFsyvMLGVi0
	 tnO8w9ZQ4mSj86hdVd6AEKnWmL1klx9Z2OrnMbFNY4zg45LfLVpLAwHvQTRaBEm4jKl5k
	 1OiLw8ot3Ye+DIkXCkrWV9tRYBxkwWpKW3SeP+/oLErZH5wYKBVUN8AGZ+FwxcTq/Ztiu
	 MJXPKHMB/CPZwBc14uirlxXGQKWbwdbh7HFPZx/yI6IWoDsRnKxnb7oEYZeLvjNCUuVJj
	 zAq3eZATWXq9kTl3i4Kjcp5biuhPvx3uFM13Q/hPZm1mfTA8MenDfNLL2RCfuO1Ggsg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793209912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mF/L3R2/oy06ccOwt7FWjRMyAPem26+3IHOwef8ICXY=;
	b=NTx/oGs4+/yhw/QtBdDsuV3lI7uXMisjqHDsSABdWLiiP0CKPwIasTuNYwqggbyj7a43
	 jr/Uy2nGRMwgKQT1ERRMeQ70ylwxA4QVZAEIIhQR16aaworv5IuV2olSOnVXPzmjlIO3W
	 lgZeqTCf+rqwwIgayD0o7qOQjr0ap+BfnqIOjdwv/8/bPkPCZuHh1nCCd4n+VoHQtp8zQ
	 RjB4CvZb6/8DJDNVB59sHEofO0Kacmr8gEVQ8xxFKa8LMMkfckth6h9U4uftM+PU41wDn
	 SDjo/0Kvp1PecsOhMI7lyW/zlbbR4Pnb+5XG7B/i9JlHqXmVlI0HaWMj6H9ragnMgHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dLpqYEiU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B9760A2605
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80B9760A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dLpqYEiU
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-679965fb848so1442536d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:51:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793209911; cv=none;
        d=google.com; s=arc-20260327;
        b=NvSktzEKo/2R9VBJELaaog4P0bWaW4hBfCxQZuHKU5x3iFcy9/G6UncqaDI2tBaU4i
         zp850uXxq5owzydmTcqEJzj+OVbSSky8x2fj9swh45PKY5yysW8nUttHiZxqHB+nAESK
         sHEzo5z26nhWywj6z/id86UEAB4WM0aixJvYgk27Gr5wv4VWB9/LURPJrwWsEi6lzBNw
         InSIW/s3E6CynfBIY2j6ku15BaN8NR2f86KdlSo5Qg/vztnlF2CL/ysrGWRzCoqVt52s
         am2L9UHSC7zWzkz3fN2AqSMhSpQjoHxp9TtOpQ2b04786BRy4HKZp8sGExrLZcbzwQun
         Ckjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mF/L3R2/oy06ccOwt7FWjRMyAPem26+3IHOwef8ICXY=;
        fh=Uctx29UzWN6Aj4pfAk+2mxm92D3glzdt5mzsaFF6hbg=;
        b=q5D9MwwGZVxliB689u8m2ymbMD8OLJSfTUu2smbG0d2bV08OeM1X/c+ZepwETKBJUf
         Guy4Iz5+0kW6ZYchDNChlERgp7+ilNikapj1sXl0xaMApTwS8qFub8ZA983YxUh5GP1c
         8XAD4H9cZ+wOkZG+p+OJVuaim7Jnx+9Ao+BNhG6lm+Y4oD9FU4icdrKJZ2eC4pqWOfIb
         PGxVd4sodunOV1knaQ8R+w8fpMWtpK6ea+uq94bDLE14Usm90ozSWWJSO+0b6OLHbEe8
         mDQ0SmVGJVm7IiPvB5suFWyqnLg6UmnhfVCYbH32jJwtR/j7xfK4hoQppgJy9KQm8Tkc
         Wl/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793209911; x=1793814711; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mF/L3R2/oy06ccOwt7FWjRMyAPem26+3IHOwef8ICXY=;
        b=dLpqYEiUmUao/ZoYdAq03Ea5rDbKe9zrhace4Rp6ZrGivF4mN2NBbUY0IP8F15BVeg
         RcGUGMCc1DQePmOC5nkdwN0u3kWj+DA9cz0pGeLkQT/yf54oMIdbh/L1c4FQBVzsY9nY
         Qn9laBSZ204dSqB9tKgaQYDxwEA3RVuU6GAvSbL61WNGctqczMpNjTIoW7z87x6Uw8cz
         AdYAPqkhpBkJSXx3VWY36feJZQu8MAHoF8BCk0K3xnKkBhIL83WD66ZwrcRY4e+vzs1L
         jPGNazmzkr7lTh9uhZvTTqyehsnuSLxulGIjy0NYn3H0rsNGyWaWczJKMRmRhkDO8Jh1
         RkVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793209911; x=1793814711;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mF/L3R2/oy06ccOwt7FWjRMyAPem26+3IHOwef8ICXY=;
        b=wyjpSc9FCxtLM39WvSWNmaIoa7yuP9piR+IybiFvjByiymWh0TZIs0aWIPfSjVXqAj
         ztzn5cXF4Mtfyr+AAfFUzYhIzUf+aZmDef7G+o2vykXV+CiI1AfdNoM6WmXQKthI0l/X
         NKmGv6qqZwZv3CN4/e9ijfZAPwMjyLimD2qdIs5tiUux3GDBzZJK0Ry/VdWcrSZB/3l7
         +UZl69DUF4NY4HxoVrLMPMAbbUA1yieBNvpYd20jLP4mVyUDaO1i6lBw5Ynz/RXiA3ki
         oNzzJvn2FqGfKODZQLyvNVXjrWOsS7e/RK2eNJe/Z75waN/cbAD7fcGbDduhSK2Fq05/
         rZzw==
X-Forwarded-Encrypted: i=1; AKwUvBz6MC0LxuM6ep1SufTZyYCs97cuDHlNNdHzpGPs25Rn5wDnocHYn0kiJLY1GN+dWvVia+6UL4f8JjR0Ii4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwRLveD2geWqDokqChHClVkYkTyRCC7t8N47GRw4iP1WvSgYRs
	GJMTJYke1ZO3zBjC9nK3eyU9AlpTfs+iKha4zGLKCS5Uo5qqkS8tPtNix2mxwxdYl1paxrPpGJD
	z/9ZEy4t4jpZ31LY2qwQG3bOt7fLQ+4VwnEVK1chU
X-Gm-Gg: AYBFou1GY3onJQRI65gHS6xWNkV8kGl7Cy9Vuo9iqcYP0t8rG4fPDs53yZCQ9M2cxCT
	lS4IgQCJ0svcMzmC+i81m022pFQdJgDX7LUMSqry1JRwNPTU0TB1sRuhWx25XsUCGzGFgP7EfZi
	qJctOzMvQoDor+EqnDXFT4KnBgc1/5hRgS55fD/7mjiat2jqvvxJ7InYzCAV7AOQmRtvGq2f2A4
	tlFbDAidKlhNmzCAlwOCrhHQ/74UYuCNJwI+d+6mljmvdhg6hOSbPWsZSsZVq7JgzZYdjSG8Far
	2nMD+fDesamlFETGPRe/oYUelFUpfRQYol0gtIOXPvaWQVY7a90EK/jzRIkD+f3HHofZQfYBTIx
	oXDV8HoLjsVdiFoWK1DhPbDRrxB29UkGDKE3OD+K00Hdrh9TSbAELp9QwZRhgrkI7IQ==
X-Received: by 2002:a05:690c:c512:b0:89a:63da:fa8f with SMTP id
 00721157ae682-8b1b5d5b9a8mr19678387b3.74.1793209910194; Wed, 28 Oct 2026
 10:51:50 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027025616.1632690-1-kevinloughlin@google.com>
 <20261027051245-mutt-send-email-mst@kernel.org> <20261027163814-mutt-send-email-mst@kernel.org>
In-Reply-To: <20261027163814-mutt-send-email-mst@kernel.org>
From: Kevin Loughlin <kevinloughlin@google.com>
Date: Wed, 28 Oct 2026 10:51:39 -0700
X-Gm-Features: AclHuK9-u99s7D6HT09CfAyO9Ftn7vr_iH3z9UIt21N8WRT_BYsbqycnLIpHOb4
Message-ID: <CAGdbjm+f+b8bMBFMdqXavXx79NSnXzDFeJRUxZdEox_+dKV6tw@mail.gmail.com>
Subject: Re: [PATCH 00/13] virtio_balloon, efi/unaccepted: support memory
 ballooning and free page reporting in CoCo guests
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: David Hildenbrand <david@kernel.org>, Jason Wang <jasowangio@gmail.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Kiryl Shutsemau <kas@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Michael Roth <michael.roth@amd.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Alexander Duyck <alexanderduyck@fb.com>, virtualization@lists.linux.dev, 
	linux-coco@lists.linux.dev, linux-efi@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Sidharth Telang <sidtelang@google.com>, 
	Punit Salian <psalian@google.com>, Peter Gonda <pgonda@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Jacky Li <jackyli@google.com>, 
	Steve Rutherford <srutherford@google.com>, David Skidmore <davidskidmore@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 1:39=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Tue, Oct 27, 2026 at 06:29:35AM -0400, Michael S. Tsirkin wrote:
> > On Tue, Oct 27, 2026 at 02:56:03AM +0000, Kevin Loughlin wrote:
> > > This series enables virtio-balloon free page reporting and memory bal=
loon
> > > inflation/deflation in Confidential Computing (CoCo) guests, starting
> > > with architectural hooks implemented for AMD SEV variants, in order t=
o
> > > support dynamic CoCo guest resizing.
> > >
> > > Today, memory ballooning and free page reporting are essentially unus=
able
> > > in CoCo guests due to three main roadblocks:
> >
> >
> > For me, the bigger question is not whether we can, but whether we
> > should. Considerations I would like to see addressed:

Thanks for raising these. I will address all of them in more detail if
I send a v2, but here are a few shorter thoughts that I'd love your
input on. For brevity, I will ignore the inflate/deflate case for
CoCo, since I'm planning to drop that, and just focus on free page
reporting...

> > Security, e.g.: does knowing which memory is free leak information from
> > the guest? If no, why not?
> > Consider CONFIG_SHUFFLE_PAGE_ALLOCATOR, RANDSTRUCT, etc.

I think the min order we'd support for CoCo free page reporting is 2
MB (and tbh we might do 4 MB only for reasons I will mention in my
reply to David's comments in a bit here). On that note, I 100% agree
there would be some new direct leakage of "which 2MB or 4 MB regions
are recently-freed or recently re-used inside the guest", which may
present some side channels to infer other information.

Some related channels are already open in CoCo and don't seem to be
signficantly worsened at first glance (ex: for
CONFIG_SHUTTLE_PAGE_ALLOCATOR, the hypervisor can already induce
faults on any GPA at 4 KB granularity). However, there is of course
strictly-more information leaked by adding CoCo free page reporting.
My hope is that the coarseness is a reasonable tradeoff for some
guests, but I will follow up in more detail.

Aside: now that I'm looking at it, I think some aspects of upstream
page shuffling logic might actually skip the unaccepted pages even
today, so perhaps we should change this regardless of this series. I
admittedly don't have as much context here right now.

> > correctness, e.g.:  Linux has init on free (and default on windows), if
> > initialized pages are dropped and host can not be trusted, they have to=
 be
> > re-initialized. Is this handled? I don't see it in code.
> >
> > Also, performance, e.g.: How much does this re-initialization cost?

I think the existing accept_page() logic (which would re-run if we
fault a reported page back in) is wired up to
free_pages_prepare_init(), so I didn't introduce anything new here.
However, I'll verify this and call it out either way if there's a v2
of this series.

> >
> > Management: it was simple with balloon off unconditionally.
> > Now we are in murkier waters with various features offering
> > various performance/security tradeoffs.
> > What if some guests want the tradeoffs but others don't?
> >
> > Documentation: for all of the above.

100% agreed. I lean towards an opt-in policy for CoCo free page
reporting (ex: via guest kernel command line, which could be attested
as part of guest boot as one way to verify the setting matches
expectations), but please let me know if you have other thoughts.

> And to give this a bit more perspective, I present:
>
> commit ab676b7d6fbf4b294bf198fb27ade5b0e865c7ce
> Author: Kiryl Shutsemau <kas@kernel.org>
> Date:   Mon Mar 9 23:11:12 2015 +0200
>
>     pagemap: do not leak physical addresses to non-privileged userspace
>
>     As pointed by recent post[1] on exploiting DRAM physical imperfection=
,
>     /proc/PID/pagemap exposes sensitive information which can be used to =
do
>     attacks.
 [...]
> Leaking phys addresses to unpriveleged entities might not be wise.

Yeah, while the host already controls GPA -> HPA mappings, the free
page reporting would indeed likely give finer-grained timing control
of what 2 MB or 4 MB GPA regions map to which HPAs. So yes, another
potential case for "let's only support this if CoCo guest opts-in."
WDYT?

Thank you for taking the time to review, Michael!
