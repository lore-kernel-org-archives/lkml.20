Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793990107;
	b=ToQaloUS6kbMUYgadzGeJ3Sl8UsDARCooeNmJcOsJHG0wbVplnwyLJ6T8xo32rdMOV7P
	 IURO1emJcy98A7FGEmpFu7J1yNakqvr3KdWzGwTbEiG/PP5Gq0sbTyBDHPW2pL9yGRHIt
	 ivcbIt74bGRLLUSgyIJ6qz4+YkioSz4N0NXEvMktzyFTXWtI8hGUa6IWR4/xtXW9WDscR
	 PvQHAjmtvdSeCsZn8QGC+u7Xy5/X1Art/neR0fA8N0nOKwy05YY0ANSMYy3m7aGj/5ONv
	 ZrxR5r/pjRW3LlpnmRK5sWP2MtcUvjXJ5d+nSr2R9pDa1DZfKkzVLGNK8navg7QfIUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=UH/Hta2lyoHkUcT4IvrcuLRLPnshJas/+Ow5OCaITFo=;
	b=ge2zJQGJ6bVifBuWjZpclkWqSCv5IoEQXBZeGDFzzi55rdDe5zxlDLGhlyak0tVvljjM
	 3AJ+DkzI7fmZWCB8NyxOGDzLnjA6/wFBnkc5+TTUu4NpgFvxXzPZjjF0P0nNmFSWEMCss
	 NIxHyiOS4uW1QB+FdYJLx03oEc2+LkcxZ36uDbnOhpq0MMn4Y4T8S5QVBqNj86w1x4NNB
	 PiQ1awvVtvxRSOs644mjXb8KgAotnTPhDTQf6rxAvwImHHWMnoVy/I6e8cGOq9Z8B4qq5
	 ljOBaC/v1BbpoxiOUaLSHNKSTcEJOD6A/NwFXkbMbtS++R7SmqfSuWxFYO+FowIXKCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RsWgrvhS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33180606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33180606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RsWgrvhS
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1ae18eb9b69so1200016c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:35:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793990106; cv=none;
        d=google.com; s=arc-20260327;
        b=nMtbtGK1Fxjwvg7T4N/lD8guJqRnBpJIj+phEk3r9YPdUj4lktTvHGFrKIT3QTS0Gs
         tqGrByluqyRqrRtu8SjE0z/Aky5g5lJvg7LALj8CPFSfLr1BiJMuiVnw49RZybCekNcR
         MLhILJXvqZnGcFjHa5JkNGGzMeWTX9e0HZTK5vK7GUrFo0X7bLK1XXB6/+XUL9+Oggs0
         tfEj7N5GfZpM6CqKRS6S4crY+q9bkXIzSnS74rH2V5URR+pgWfUV75kTOlzkqv+tHzfn
         ZbbDSBTsWhEPCprtOJvHAeHXGdOmvr3h+kD5cPssnAESehKDGer0BhkAeKRrABmggzuR
         pMeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UH/Hta2lyoHkUcT4IvrcuLRLPnshJas/+Ow5OCaITFo=;
        fh=W+r3xkmyinbCdkX5QGWIdcFmMJhPts1PIhIiKJjwiRo=;
        b=QqpLq4yCsfHHnAwHfVlgkGCmzPq3AP1g1WFDbORW9+6T1Bgd0Daq5m0jw2yMGhEGmD
         AAvAANlyxE4RlZIW4H4LPVL39luAUn91TrWiSWoTZ7p8eVeBIc9pCfZfE9Kxku5QPviF
         V/++gVlpHaZRyv4TKrdKL1/Cg0JLW8lzTqfRYMhwXm3LeKZKV63Ini531mfid3KCcjO8
         45orDdPaqJHddrEBGkUmg12iNTkgKcY3N6cjgtKlz1IKsHdkBA1e79ptbcxoqJUS3Pc5
         aak2Ik/bSKY9TTnADoLCVOJMbLnAZbH0prRjRcjHHaqyCwh02xE9fyv36BNXA6SiaXg0
         tJCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793990106; x=1794594906; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UH/Hta2lyoHkUcT4IvrcuLRLPnshJas/+Ow5OCaITFo=;
        b=RsWgrvhSnj84+ytZ7iEILE8CDOvT/Wr2ZN/c1VqXoZAC/o0kgcEgrsi8Jt6dpqykcj
         MdqXOjKrz+HuVTbKlH6GsTP8gxmwwtmgOz1HtSBbrf48mmecKYVqaE3GzEVkepTAjLDU
         nz61XEZzke9Ur10oKJQiPzKYIVpt0b/ZEmP9h5sL1dQ7tymRvwOAH/G6c+hsoZQwAoRt
         f1uILSgT11RfxU7Lb4rnC/AnyBgXyB/xxFWBy+NDysTelYMiFpQbOH2qkFO9hNvdBLzh
         ut9TDNMrQAEYFOcOwlG/8RzlFnsdlDkIP3OuU8OfG1j5IsqRMQTe+8cTKnH5LSieKPQK
         UZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990106; x=1794594906;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UH/Hta2lyoHkUcT4IvrcuLRLPnshJas/+Ow5OCaITFo=;
        b=WVJbshgFt6hMN+UspMEdSLYBalx0JWd8anNWM1xteFIAGSTgb18RRkQoaro1GbIOHu
         XCEarHZszId9eWQQy+ZLYb9su59gTnh0m+R6pdxiXvPMTR5nns7uSF4lLwvJsGivPY33
         s124NUC/DdTXcG2yLLhWvkiR6DUvJn5b0aYNURpNwAFsvf9URdoKaKp8764f0RkXU33S
         KJJLTXjgmiRjpu8E2O/ZQ7s5KnG4gfZFZVsRs1phrZ1XpX5MWNtiueW5c+Kamb1+dlF8
         dectc+lX7Q1cH9+/xJEX+0YO+keE3KW9R+C9I8CC51jcRswL/k891L+EwFLPUehnxNpN
         Mojw==
X-Forwarded-Encrypted: i=1; AKwUvByTDxw6CooCb9CeR1Iks5LkwwhHYZ0lyZcArn+RYH8lQZUZaG0TaitjRFt6EY9ELCFJiUJnxN6wHCVHEZk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Dhjhu/VqhKaTkgBfiB56u0XhWhKg6QGp2xLBASM91jaGT8KJi
	mL1I2pEuHX/EnenaWDv+ikCqH257ZK1wxx71OUCUTZ56vQlx3hWqReoqhw3NThMgJ/DBPdm1dpH
	lw3MgAK490EIgxmBiGu5nkx7A2XQ4Jt0vGwE51rOg
X-Gm-Gg: AYBFou1GDvllJuaDjs6aZpfMkoGZGkaXYHCV6YsMEBaz9NT9luO9CyTXZdyv14t8k0B
	Ckt1BjB2um5Zzbmo5/gUeteksmYcsp8xUp2ufPhvIXAINNKYp+AFm42diN3fW2sFgs/au1uKgmD
	YfCpVpa/AuRSirM8YwC7wm0cJiAl9LAO0u5qaaJyYw8bPKTQf0RybTZ9le4YhpSIYlDISwCPiOL
	vKlv0G0KkqxO5co2brmpZ7Co3SnzeS6bca7hbb8mVmWptbASLJp3hyHNvrdB16OTiNcIbHNbGVX
	rKF9kL4A0w7JO3YtOkkTEBds9plgHyG9gSxrq8F61po1S/ZQcamyjGU6dOcQGHVCYgFK8NgQ5bZ
	XQld59Wt30iD+yOKG6mYnns3yIE3aGZ3Tsqn6t0kYJvmMJxc27nAC9z25RwLWClEM8dEU
X-Received: by 2002:a05:701b:2506:b0:1a7:d426:6dd2 with SMTP id
 a92af1059eb24-1b25d322b55mr3491861c88.26.1793990105326; Fri, 06 Nov 2026
 10:35:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260908-stackdepot-trie-v2-0-1996d5cef732@cloudflare.com>
 <ateDvB145CN_R7CA@elver.google.com> <au24u-HWyVtBZME3@matt-Precision-5490>
In-Reply-To: <au24u-HWyVtBZME3@matt-Precision-5490>
From: Marco Elver <elver@google.com>
Date: Fri, 6 Nov 2026 19:34:27 +0100
X-Gm-Features: AclHuK_U2ZATam6HkOZCXfRZSs7AvPTdqKY_KXL2msL8epn5ZENB2X755bCf0HU
Message-ID: <CANpmjNMP=NdD8ZE9rPwikUBcLwc8V=J648X05YGPn41yAZ5hmw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 00/11] stackdepot: reduce memory use for persistent
 stack records with a trie
To: Matt Fleming <mfleming@cloudflare.com>
Cc: Caleb Kan <calebkan1106@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	Vlastimil Babka <vbabka@kernel.org>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Oscar Salvador <osalvador@suse.de>, Caleb Kan <ckan@cloudflare.com>, kernel-team@cloudflare.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Nov 2026 at 14:18, Matt Fleming <mfleming@cloudflare.com> wrote:
>
> (Sorry for the delay)
>
> On Tue, Oct 20, 2026 at 03:07:40PM +0000, 'Marco Elver' via kernel-team wrote:
> > On Tue, Sep 08, 2026 at 02:13PM +0100, Caleb Kan wrote:
> > > Hi,
> > >
> > > This series reduces the memory used by persistent stack depot records by
> > > sharing common frame prefixes in a path-compressed trie.
> > >
> > > Cloudflare runs KASAN on pre-production servers so allocation and free
> > > stack traces are available when diagnosing memory-safety bugs. On some of
> > > these servers, stack depot exhausted its pool budget even after we raised
> > > stack_depot_max_pools from 8,192 to 32,768. Once the depot is full, a new
> > > persistent trace returns no handle and a later KASAN report can lose the
> > > history needed to explain the bug.
> > >
> > > With 4 KiB pages, 32,768 order-2 pools allow 512 MiB of stack storage.
> > > Doubling the limit again would allow 1 GiB, but it would not change the
> > > linear growth: the hash backend shares identical complete traces, while
> > > two traces that differ by one frame are still stored independently.
> > >
> > > The trie is opt-in and disabled by default.
> >
> > Have you measured how much of the memory reduction comes simply from
> > storing 32-bit compressed frames (patch 9) directly inside the existing
> > hash-backed struct stack_record? That alone cuts frame storage by
> > ~40-45% across *all* callers (including page_owner and KASAN aux stacks)
> > with O(1) lookups and none of the trie/bitmap/RCU complexity.
>
> Yeah 40-45% is the right ballpark. In our measurements, using 32-bit
> frames gets us around 41.8% reduction in stack depot pool usage.
>
> > If prefix sharing is still needed on top of that, deduplicating
> > fixed-size (e.g. 4- or 8-frame) immutable segments from caller to
> > callee in the existing hash table (chained via parent_handle) would
> > avoid mutable child arrays, RCU retirement, and the bitmap allocator
> > entirely.
>
> That's an interesting idea. I'll take a look at that so we can compare
> numbers.
>
> In the meantime, should I send a series that just does the 32-bit
> compressed frames?

Yes, if you see it provides real benefits on its own. It's also a lot
simpler, and having that as an independent series might be a lot less
contentious.
