Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793633499;
	b=IgjNgy6hLwpixhcG+CvGqFxsBa/dBvdCvk76IqBK+XbdR7obSypz8rXbAt8R916AMrzA
	 xwpJ98skEOj41PdbLCRLrlxtC99cF7On1UKdoKsG3xAlyttIQIrpp5lyNC9gGw6/cvqRn
	 Qj5WIdgzYAdtVMNuWlG71dE89e+9tlZ5v3Uf/NSHoStG5X+bFj+OyiFyVI3S59YykAg1o
	 lMQUeoCOgn4fZceca+WSYLJ55lCtXGAQ+fBoYGeWj5O3rOoROmkwF2ZxItJhVCzaIsImj
	 ZqIJ5JIR3xTVU1okJT4NpOwNLY0FehwJEJm8pY8FTFhghgcv+qg5JfUmUdqze+4BZTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633499;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TeCP4ZpYTq9SpZp3YEhJ5WlDwv4/mZ+EDEcMFOS7pT8=;
	b=FnNL9Ls8OiMvcEv/tpdBeSzEkanj2tIf00OuNv/JRHVwU6Zzt1TJDL2Sl7blxHGTT3I2
	 sOr7rehfgRVKC8kbMHBuhvsclzgPJS3U0Wi5eDkOi7DQthLoM6T+52c7iUKt5jPf7EeUd
	 1DfcGpMMLGvaKj278LD0YPKQGu7RnsWTivudUEKfPNBfrCHmkYqaySE8PNLMlJP6VKrx5
	 faf8M9jO7R6NKw0+IZaZodKbuWjK0yMOvAak24wSDj/RNI70IkKH3Bmgdb+PfOXWE5T1N
	 LyR42ZNQYNGppM9eEB+etjiawSQGC9cqOzIuYbJOXO0xMef/ZdYFg8nkPYEz7KF6dFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JzE5DHuT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86603607229E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:31:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86603607229E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JzE5DHuT
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-535f598d126so435221cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:31:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793633498; cv=none;
        d=google.com; s=arc-20260327;
        b=DKM3V5P2OGKa88eKgGiutEooQo4l1mYSjoQ6xCzlvbSzeD7fxSgghCfcFrDO3e46hj
         osFM45jdnCum6rzTUcM1ASQGJRMuoEG1nrI+HnTut6V5QicfYfY5N9bTR8VyKdsPE/sb
         WV1xO/itiLBeBz13htPGNqtHr4iBWPesSLQH3zBCeZCjxinfEeIOpajbENMDMqJec0RW
         8VRE7KxQVn5VqnVOogRsahHP0Vv4EAN+tmJ49P/FVXnOlytM01hDNpbSn28cNUk3sW5S
         s7jeFuuT9qsQ6ZooxChXHyxxxbAUHjsJyI0ImQQ2IhalC2Bi7qPUo8PbAoZNby9S+XN0
         JNwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TeCP4ZpYTq9SpZp3YEhJ5WlDwv4/mZ+EDEcMFOS7pT8=;
        fh=aQhFpWqVvldBpFeSytEkzY2hkZzA+oG+Pwbgj+7g1mE=;
        b=cdgDsMKg2gjJHJWeI27BDlXGWqLRBpjeqwO7oG2Hj4nk9IMTfnxCG34G7kCoVf35so
         yW8I4gFrkjkd3uGjGLUedl0V8D7jasgUoEyJCrUWuEg+KVGBuV/rg+8y0125yoP6x63J
         I/oJjjY3rjbGMus9UCX5yQdcztWK++a+hSRmzvxK91PuotFlk6DkEuD/A0AP3o4RNfqY
         XyxQfktOsFfipGA/EPW8ZrPyLdeC6d+S4n1aeZf3/VjeEdNKp8KxHBCT5zjxalAuC+YZ
         AjcUuQqGVPrMYB10DIJWPH1Hg+by2Ria4FUNkW6g7jKvIKiacE7kzVx6sm4bBBqB1c3g
         DRXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793633498; x=1794238298; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TeCP4ZpYTq9SpZp3YEhJ5WlDwv4/mZ+EDEcMFOS7pT8=;
        b=JzE5DHuT5aaq22JXaK1iUqMuzYfAzGdmYBwWBh6J7gvE08Qvbo6Un7yrOaupbCyHSt
         I6fPKC+93UXcSHPPMQmZp5sbVfe8IhtZ21qujbFBGn1tVWc99641ki+KATmNiht89sSB
         bbQXCalC7axyCIseaVwJ6r7303sSBcKDrLkrJW5EAiDkMeKMtwbI+mg1pjQFgqRI9Phz
         VEj3wMJ+t+4YAl7qiRybJ/3KVNmqFpYf4TidS/u1HAch403zmsn2xOmwM0ZCYKxSgARi
         ayDwMFWPfNzHSpZ592ls1cVqzjcNUSgr5lOuqwY6jOkd8D5YQDyWmgJaj3j1KhfTs9/Q
         jguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633498; x=1794238298;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TeCP4ZpYTq9SpZp3YEhJ5WlDwv4/mZ+EDEcMFOS7pT8=;
        b=TBB59zyCyzGJFM6YoE8MkwJd6UqjilMrmTTSrXODwnVS/ek9KyhyjwyvMZ6X3adsdU
         hwtwkHPfJUviAUFe7xKQYQdN+CIQpRTSGwnSPFIPRrCJdKQs3VOciRH9PwucJbrLkf07
         yd6Bbhb6FR6tYR0DdRZZzbR8fU+jA9ckAfdcBjZGTNdV99oGoSuiUq6aWbPyRCD1XQrR
         GGWp1f/K+uu7tHMbsnILlL2qaP8HOcTvVlC95wP5rCKlbhfstamjtb8L7e7FtvGlszRs
         koo3okpHQGW+9fEYxWcjKrEW3vr0NXEvwpPm85nJPIqTnRlicrs8LIj6ec6HeiGEi826
         RGgg==
X-Forwarded-Encrypted: i=1; AKwUvBzrD9zhBNzgHdJVyBUU981Cy6WT3bEirOSuBWyJdemZjUJbmPTQbfEpxTSPz1rl/66GbP6evoXYNOqIk/g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+guShVc1pBo2GHz6SYSeEINsI+gQALugruUkAwxmP019UirVai
	VM9GvkKn2SW7iYKuYR31DxSVyHMh+flxDuU4+HFosCdJvyzi3xDyuVZyRY/iEdVPYyXcKPMqsM8
	wTR1+H1XH7tzWydv26Wm5cVPYHo/Th3jJwyZvK97Q
X-Gm-Gg: AYBFou30PF7m5haEcyo2oZSocI/dwr69+qOquUySUKwfPqHw8LVUfRITyddlUnRvIeW
	8iu4I8e0yW6eyVHowlj9pAdEzwNLzB8CJ0AVN8EpA7rtXjwAfhJbuIXL0AdSOG16aaYwmbOIFzD
	RZvZz00ZdIa6A/bCxgLYKWE89dmZ7PluaQRRtJd1621xJk26gyYnrSkgkupo6kigyQQYnr0/Iff
	L55eaOKwcYVxRgsoKeSkcgj/caMotw0/kncxrOm6pA5xwlH1H9r3wa/gJZMk2TOGPssYGvFy2ml
	uaakQUYYvYDBfCM6O1RphhlWjdf6vLd9t30b2l3a51ojLaKwiNtfkU/2rWGN89RzKsijE2zPXCn
	Id4frR0Z1YUMw6L4eQqGa7v8alqHKtfLV15Q++7RKCsMfc/PlGpxpellZ
X-Received: by 2002:a05:622a:4886:b0:530:e00f:7768 with SMTP id
 d75a77b69052e-54125fa7a8dmr88444051cf.0.1793633497692; Mon, 02 Nov 2026
 07:31:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101154503.3203036-1-surenb@google.com> <20261101110100.90796bf33ef50307a7698dca@linux-foundation.org>
 <auiKq8zbQTMyY2tG@pedro-suse.tail5790ac.ts.net>
In-Reply-To: <auiKq8zbQTMyY2tG@pedro-suse.tail5790ac.ts.net>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 2 Nov 2026 07:31:24 -0800
X-Gm-Features: AclHuK9TnI7YVwGqKzYt9UR1HPgu0Gc7xrmAN4U7UIU0R4mvvXL1rE30jKEZSis
Message-ID: <CAJuCfpEcpYxEcje_f17bZ08ngMsDxtDUqNr9p5W+V_PRWOE6-g@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] selftests/proc: use RSS in /proc/pid/smaps_rollup
 tearing tests
To: Pedro Falcato <pfalcato@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@kernel.org, ljs@kernel.org, 
	jannh@google.com, liam@infradead.org, willy@infradead.org, paulmck@kernel.org, 
	usama.arif@linux.dev, vbabka@kernel.org, linux-fsdevel@vger.kernel.org, 
	yi1.lai@intel.com, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 5:08=E2=80=AFAM Pedro Falcato <pfalcato@suse.de> wro=
te:
>
> On Sun, Nov 01, 2026 at 11:01:00AM -0800, Andrew Morton wrote:
> > On Sun,  1 Nov 2026 07:45:03 -0800 Suren Baghdasaryan <surenb@google.co=
m> wrote:
> >
> > > Pss metrics can be affected by map count even if VMA tree stays uncha=
nged,
> > > therefore tests checking VMA tree integrity can't use them. Use Rss i=
nstead
> > > and pre-populate the VMAs so that Rss changes if a VMA gets skipped o=
r
> > > double-counted.
> > >
> > > To ensure all test VMAs are populated with anonymous pages, remain
> > > mergeable across VMA operations, and do not have their Rss changed by
> > > memory reclaim:
> > > - Toggle PROT_EXEC instead of PROT_WRITE between adjacent test VMAs s=
o
> > >   all test VMAs remain writable and MAP_POPULATE faults in anonymous =
pages
> > >   (rather than the shared zero page, which is not accounted in Rss).
> > > - Use mprotect() instead of mmap(..., MAP_FIXED) in split_vma() and
> > >   merge_vma() so the first page of the split VMA stays resident.
> > >   mprotect(..., PROT_NONE) splits the VMA without unmapping the first=
 page
> > >   (pte_present() remains true for PAGE_NONE PTEs), and
> > >   mprotect(..., self->mod_info->prot) merges it back. Both parts of t=
he
> > >   split VMA retain their non-zero Rss.
> > > - Lock all present pages in the child with mlockall(MCL_CURRENT |
> > >   MCL_FUTURE | MCL_ONFAULT) so memory pressure cannot reclaim pages a=
nd
> > >   alter Rss during the test.
> > > - In remap_vma(), unlock next_addr before mremap(..., MREMAP_DONTUNMA=
P)
> > >   so next_addr is not split, use mmap(..., MAP_FIXED) in patch_vma() =
to
> > >   merge the middle VMA back into addr, and exclude smaps_rollup tests
> > >   from test_maps_tearing_from_remap since remapping moves and unmaps =
the
> > >   page from next_addr.
> >
> > Thanks.  This is proving tricky.
> >
> > My evolving reviewbot still isn't happy:
> >
> > : This fixes the v1 RSS issues, but two things remain.
> > :
> > : Alternating PROT_EXEC breaks with READ_IMPLIES_EXEC: both mappings
>
> This is nonsense btw. Not sure we'll ever support random personality()
> flags being set on selftests.

Yeah, handling different personality() cases on a selftest sounds like
a stretch. Is this case realistic and do we need to handle it?

>
> --
> Pedro
