Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792691128;
	b=cDPHTQTeI7WAXSWsxg4/A+5ZXIIQIh1GnuTUUbD6Vo4usgMMRrXzl7AKMfmp9Dm+omtd
	 m861B7InHPdvW3yL9uq2vGVM7WzeLw34/BgckWqHvnp+9/Mn/c9dirEWcry9EEcv3hDK5
	 aIXW2/B9vc+9dVc88DF+AcCIS0vd9yL5HTvnjQyTHC0rSuY365X57GmQTwobK5rXTvKoC
	 DGhKJpRHEeKQFHe6NplWWyFNEgqihXywPQ+cyK+zUGcdkr7QeFfbGRCCTZvm6C2lOSIvw
	 baoqdBTKnq6kuN834gvkihygb3hVg5eeDNKAsEQAX6PAPjiBAkYbxkPw6OGx6PXov7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792691128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Q/kJZkRDh+A2dbcPNuvHi4UCiR28b887/rQN2752RCM=;
	b=WWNwp4kFmHLVWeXfz6k5zByVzucq/Yf0StyxQhTVOHYfqw2VOsa8/8P/CZo5XuQdJ32V
	 IX9RNMIIwnLKiU4wr4PZTQYlVYNmEuOVm1Fk5JoquWn+OO3qPgzSFtRqjplpUUkVjMfMR
	 pkhYX2O8u6zs7rWycRcyd5YjJJ3jaA0IhABdiEf5Z5y1CGkCzQQcsKCx2E4dCM3hrtdrG
	 cCYQXAj9+pW3brCe2dsjzl1Sj1NeCJlyMHNEWiptr8p/h4pqU+yABptM5a6X9rex898uK
	 6euedROfOGbZ7RAXncyTcMaKx7mNkHSjf0JoNE91Ma0oOhuQnNBbKQ7Q0yGaFJXH+xA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Ywu47o57;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E48C606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:45:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E48C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Ywu47o57
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b203527bceso3018482a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:45:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792691127; cv=none;
        d=google.com; s=arc-20260327;
        b=gt5FwFOv/GFVEMQlMCgmecDBlWg65f3a5d3JGAcFFNQWuPRuF+P2kJZbF470WW30Co
         izVto30uFUFwGmaP3ldYuhxQrUZdQFHpBP7Sn7FYMY7p7V0JlzeyXqOKxX8l2q8aM0wp
         3PWSUIiz8yaG6KvbrOuNcUhNEMF1nVg5WTvoYKedUQgjx/87KfmUNlEWPQMajuwlAIjJ
         kryeDDq/9pjYBB7D8CBhCqZFQoNb4OxZ++SMJsJIsA6B9ClvB4Odn17b6PoIGwYtEYZs
         JkRBSCagkL/cA3YL3KhIOG8Aj4vhQ9S1kLr8beuMTYjz5FGCXy4A8c/PsKPTjpgyc+zs
         06RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q/kJZkRDh+A2dbcPNuvHi4UCiR28b887/rQN2752RCM=;
        fh=8gcEWYLoDSug1oaD404au/09+NXiEtNFICJeYJptkwQ=;
        b=PW81waaZS2aZlbxWrGhGDdFQoiW4a6/DPHR9tVJHhX6otx0aH3pUj/vlvmMUOtUE35
         +aW3l/EZl+CaSYxujujt/rLkKEpl3S9c1qX+EzTaqgZhnuknRQq0LirQ8K+CFf1/ubHf
         oh/tlYJ1KZSagSwXuWmZ/9AXORHXCLTkF5zgeWxTZKhb9UP9ZbgXCBdrw3g4VhAijp5l
         IlvzDMtwXD7mFgrx2/c3noMAsjG2oNpovntTBjUy3jct6hK2AFpVp7BktQ+vg4yyOPys
         iIc+j602R2Wbp/+ZplbN7c+f8OTocSfKj33/wf7HCYf+tTY6w7R3jZ4SBaLb0dg4yuJw
         mB8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792691127; x=1793295927; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q/kJZkRDh+A2dbcPNuvHi4UCiR28b887/rQN2752RCM=;
        b=Ywu47o57STgOueJFJYZnS/DfG17FyI0QVCJlrhlBervrjKFBlBoGiV56Ui2N+pl36U
         DZptDHFgRh3PKLBa0wT7iWQAa8KeFJY6Rboxd7fBnj1Sv/iIId+K7IETi/He+a9EsVGV
         1tOL4rBQhohGc2sk3KER2z/TL87Xys2WRVISAu1OQ+WQ7pjXw7ZIiV7CnE+kF42dEE/l
         +BaQn+LVldT7kv9qc84nT0bOkmVJTPeb553Rs3UwQpz+HLJdqA499iAodbL6I/tR5u1l
         9fQjU8jqaYUDhQOlB79GJXdPxnanMa3BKfurACLZD6mJcKd2feCuExX5O6w5TfL7ovNM
         TTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792691127; x=1793295927;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q/kJZkRDh+A2dbcPNuvHi4UCiR28b887/rQN2752RCM=;
        b=IaUYCTjpabanzGSbu9qVN8mx1Z9rvyZy2nNoArM4Ad1TXn9WskCqXhsOM3vOzQYJSW
         0vppQaHRmiXfd8E9jjT9J9ieVBDTnWKezxpgGXJMmlf+ZJJhZVeWycYsy/TwoXBvv/d9
         aVKtImYzrwFbVnhiPAONzQ6m16b4K2Gl7aW/0mj85diAOo9pO4/avFS8XEWnIkG0Q0n/
         vD8eVWxa6hf8vs21Fm+vCMq7maSgBFG/30UrFCuz1UGzZ0wuSlpqCg2GdPazS13dpNw7
         5mDSkiPULzBIy9q9D+D6lXuSvjJg0vEm1f7595rruIOvPuQ8B5ge3EgI22STmykY+Cc1
         5UiQ==
X-Forwarded-Encrypted: i=1; AKwUvBwaqO/RJA+oljci0D1FW1AzYIK+/c8WXs1pYcf9C/WDQsMv6K2ZYQjixBuHiAoLPtE3HmvXMqMCkVkGMNk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKy82YL8+K57TH7ig/ebE50OxW3i3iVjDVx21G+HIsdDVKzdoVh
	UrX+fijXLY87wT5atWveNROZOojVbP3oKJ1k4IaSNg4oRD2pSeIQaGFy3quxNpOGom7DqkcG4UB
	8tWH1OOa/OFbPCWBFOT8qIOUtGi61+vdy7HwlkQtW
X-Gm-Gg: AYBFou2Je3rG85VzYY8iS9t7QBM+UIEps8lCpITv+am/4xSaDm13UpVM468hRqB15yu
	WcVldpUhSymmaNvr5nX0ugBvkL80Ms5zE1TP5DoqCnnQb0cu6ayV8F5i+WfwPglvO9mFge/juND
	Nsvt66ThiHcsfJ3a+yF6MgpML8xeF5N3RI7dwqdj0J4W0U/Fm6a9HRwoR/cnu9CpEqwpndUZu7k
	pUIzSWeGLvRYYQ5iuWfugXz4u+SfmMMFhCvZeGc4BzwU/GHS6LiIDiZrO1KIRCCJDDnbRnhNrsX
	7yyR3VqJlGfD5D5x4IURULeOghuRpsOMIT5S0vKA2PDmhQ3zrPkTJ1Xtkz0kvrPw8uH4JfUqYT4
	AIegKILmrx0QiTaK6v9cu6qUFADbG8j2GNE1hjAm6zn4lhOQSXhYR+KfqNq4UnpdvugILT3cAjr
	9+LiiFmwkk/RigosEGM72OIxQ/vhqzrDUZtAZFJb4dzQfdGF6ul7PnVEdY3hMGNReUsEAgpMYwE
	V9hQ7Kc
X-Received: by 2002:a17:906:d553:b0:c26:1649:47ad with SMTP id
 a640c23a62f3a-c467976e841mr649670766b.35.1792691126016; Thu, 22 Oct 2026
 10:45:26 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
 <20261003002123.505555-4-jthoughton@google.com> <B8A44041-1516-4405-976D-534AA2412A49@linux.dev>
 <CADrL8HUOJwEgjUzefxSUa=AZHj4JO7koonj2_-WYhcL8QcXPZA@mail.gmail.com> <440A9FCF-2B5D-43A9-9B02-C32F5955AC82@linux.dev>
In-Reply-To: <440A9FCF-2B5D-43A9-9B02-C32F5955AC82@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Thu, 22 Oct 2026 10:44:49 -0700
X-Gm-Features: AclHuK8OCQjsmkJ8ztkh2B9wQVyT8iKcOFLwut_LnlB7__hy8ym6E5QTYBptOqc
Message-ID: <CADrL8HWNaurYHGnpvC9qwr6bVU74YhhucCuhoVYcvqmSX+R6+Q@mail.gmail.com>
Subject: Re: [PATCH v2 03/20] hugetlb_vmemmap: Always flush TLB if needed upon
 PTE remapping
To: Muchun Song <muchun.song@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 2:18=E2=80=AFAM Muchun Song <muchun.song@linux.dev>=
 wrote:
>
> > On Oct 22, 2026, at 05:59, James Houghton <jthoughton@google.com> wrote=
:
> >
> > On Wed, Oct 21, 2026 at 2:54=E2=80=AFAM Muchun Song <muchun.song@linux.=
dev> wrote:
> >>
> >> Hi James,
> >>
> >>> On Oct 3, 2026, at 08:21, James Houghton <jthoughton@google.com> wrot=
e:
> >>>
> >>> vmemmap_remap_range() can potentially leave the vmemmap in a partiall=
y
> >>> optimized state. In this case, a TLB flush should be done if the walk
> >>> caller asked for it, even if the optimization was not fully applied.
> >>>
> >>> A follow-up patch will more completely deal with partially-optimized
> >>> folios.
> >>
> >> Why are we dealing with partial optimization cases right from
> >> the start?
> >>
> >> I know that in patch 12, you try cmpxchg 16 times, and if it
> >> fails, it leads to the partial optimization state. What I want
> >> to ask is, why do we limit the maximum number of attempts? Is
> >> it because during testing you found that this kind of failure
> >> is very common? If we did not limit the number of attempts,
> >> was it because during testing you found that the scheduling
> >> latency caused here is very large? Or is this just defensive
> >> programming? In my view, scenarios with such intense
> >> concurrent access to these struct page structures should be
> >> very rare.
> >
> > This was done defensively, yes. With 16 retries, I never hit this
> > without fault injection. (Perhaps I should try with no retries...)
> >
> >> If your testing did not find any problems, my suggestion is
> >> not to set an upper limit on the number of cmpxchg attempts.
> >> This should be able to simplify the design of the initial
> >> version of the code to a certain extent. If we want to
> >> determine whether an upper limit should be added in the
> >> future, I think we can add timing monitoring in the arm64
> >> try_update_vmemmap_pte function and trigger a warning when
> >> the measured time exceeds a certain threshold. If someone
> >> reports this kind of warning to the community in the future,
> >> then I think we can improve it at that time.
> >>
> >> What do you think?
> >
> > From userspace, you could use kpageflags or page_idle to continuously
> > access a single struct page over and over again. I think that's a
>
> page_idle does not support HugeTLB pages, right? We should only consider
> /proc/kpageflags; reading this file requires privilege =E2=80=94 unless a=
 privileged
> user intentionally creates malicious software.

Oh yeah, page_idle only uses LRU pages (which HugeTLB pages are not),
that's right.

For kpageflags (and kpagecount and kpagecgroup), I still think it is
"bad" to provide a mechanism that allows userspace, even privileged
userspace, to permanently freeze a CPU. Fuzzers could find it, for
example.

I wonder what Catalin thinks about my reasoning. :)

> > pretty good reason to have a bound. Also, the AF can be set even
> > without an architectural memory access (so a mispredicted branch can
> > still set AF, for example); that also makes me want to have a bound.
>
> However, I don't think this scenario would cause a significant amount of
> concurrent reads.

The fact that AF can be set without an architectural access means we
can't really reason about what may or may not set the AF. It
definitely seems implausible for the microarchitecture to continuously
attempt to set the AF for a generally-unused but valid PTE many times
in a row, but it isn't forbidden (as far as I can tell).

> >
> > Catalin also said wanted a bound here. See the bottom of this reply at =
[1].
>
> I see, but I'd still like to explain my reasoning and see what everyone
> thinks.

Thanks, yeah I'm curious what others think too. I can go either way really.

> >
> > So I think we should leave it in. The extra complexity is pretty much
> > entirely in patch #4[2], and I don't think it's too large of a change.
> > I hope you agree. :)
>
> Because I personally feel that having only part of the vmemmap optimized
> is a somewhat awkward intermediate state =E2=80=94 the all-or-nothing sem=
antics
> seems more natural to me. At least until a clear problem actually arises,
> I'd prefer not to consider it. At the same time, we can also keep the des=
ign
> simple.

Yeah that's fair. Thanks for your feedback, Muchun.
