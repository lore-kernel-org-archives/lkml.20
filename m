Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792445957;
	b=0IWa1/3PpXusruxUnj9+F/qOFKyOydpob3pHvpsyIEpCOujClj8U0jmShOppea25gxET
	 QDyPAJYGU9t7X2bc2xktWBmfxUwY9cI93SVwOb+C7nBESwbEptJHfG55JX0kl2qDXa/cW
	 9HGvpi/XJCAtNyQlmU329iZJhPo9dw7dtc08RKvlc2fJYGlOFGpJczUe1TWHQ3DyxC/7y
	 qmUocwJOhOe7/6YavbYOkcOdKXDYLuqfWqmscBcEpM0jOwMchd90VM3/iSKi717c+chbU
	 b50iiM2w4eGYE+Z/giHv9kK8HQS2jeUD0hDPG5u+/Rmgn/K6PYpneujOkoX+LHDPPQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WJzhe4nxpWYjnS1kUIijOLZjXGk5ZESjjcBmYE0t6m4=;
	b=JWrgceqlwDENUfLNMiNcV6Ok8y38OHIPxIB0p4w5A8RkMourNb4yS6FpH5uXO26micP7
	 jeaU1S2ORsuSMYD8/9x+v0OLAHVTbUl6iz7566mgy/GlZe7f48IMBssyxc4DGND5rUbZJ
	 0Jw6D+7xHGAqzrpOpa946j7thQ7p8lxdbxlvnuHz4UXzqfglPBS85vrWSpx8KZFV/bDEV
	 nNx+QReFQQkCGQeFWEfaWIuCsccByw9ZyP1UWhQGv+WlUsUL0aZx3LV+K2nrg8lS78bw1
	 NiLK0NTHyG5AO+VZB4FpaLEhaW+SqRtwdG7vOlHhEaMg0ZM761Y7BiK5Ael7NMeD+Gw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DeTPO67h;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D1B606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9D1B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DeTPO67h
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a01933b584so18379595e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:39:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792445955; cv=none;
        d=google.com; s=arc-20260327;
        b=PlccPZiKzXSKPwAsRljKxqIwU35Lwuti16ibAq2vMDtbuuXQysr6zyb2rVAAwYngLT
         rE/xh2EKkkjlxXtn5K8uuysMrMAM2xLSxMWF6yD7D84GG2A62/VS4pmXtdY8UTiNoqkD
         OAXKTbxbs2Tz+8mIwN+hOdyTYswhshOMx44ctT+weONxOfYjotiJ/BwQBS68rzBYFH7o
         +B/Rg27cnbS4gMZjZsA90YHUMkqTHLFXASSMes2Kj4Gtl93e7a/Net21VDimgE7iRPK8
         5lePyCtQFEmx04CryHYf0rE2uMMl6MC2LWmvpLydjBjuo+NXIfEUHqd/AN7h2kHxVaU+
         S6SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WJzhe4nxpWYjnS1kUIijOLZjXGk5ZESjjcBmYE0t6m4=;
        fh=q8K1CnIy3M9/bnTaCNOxxRdjRjnjw/73Dja/NhwXdwY=;
        b=JO/tDiTkCUwu4LO1Dip5eOxUHoBQyAuT4y9/tY/PwL/UK5W37jrsJo4kDnhCm/Jv+5
         tA5OVnEF229jTNPnom8qYEfEcGatxvMAbBr31KyV+0OFJJToJ7kNNScJaO5hKb5pX3Q3
         ZrBAiQK7sx6cIKBejlCi8L4UT/s/yo/Ub8yU0F7mub06e4oXmfvwehWWyF59n5TXi8z0
         c+DCjmEexo/M2TylhAoOaOv1hbb3m6HRFX9E1n23IdpP9xzCHtpbOAvWzfZUBc4TmWMS
         W3PykSl0//63lHJW7szh+jccyVBVawiPlDCpVfE76HyxQLiv9qJp1/0Yw4nigyWaXXYu
         qEyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792445955; x=1793050755; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WJzhe4nxpWYjnS1kUIijOLZjXGk5ZESjjcBmYE0t6m4=;
        b=DeTPO67hgWXSAlnvq5pSB/+zKMVXzy2sG45j/onNSX2K6mWnUO97CaRPVvW4JMxZjJ
         8YqUK73uYTMCLD9LcKtzxAKSbi6b9cjns2T5V1IXRJJqWH4+ngAKtOhgD/RHAkIInpLJ
         tOBm6RxCxysUxYMhi8d2cBQm3rsR58dVBKI2+J2RM1kjLHW/I9SltscNVSfxDZg+L9nC
         aQa0JFzYVgHSI99MC32D/OJ2DuUrqXRk68HJuU9D1fWOWKrhrZzwWwjIsX2zT/oKtUv7
         uBRN7qnXkti+1KUWQcJqeWQzILR1R8fZ9z/qs0hYiqQgeD8BYjg0YCysaHed2kvnaRQG
         6dfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792445955; x=1793050755;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WJzhe4nxpWYjnS1kUIijOLZjXGk5ZESjjcBmYE0t6m4=;
        b=JMz5QwY6l5DVAJ89Av0koHQUOW/RPHu0wANnkS2CxXf7lKPq2iApbOO8WQzFaWVDG1
         knvq8K3ew1qwHa/QrOFWxZfYCL/+fuOnMOCkYoETXIdfPDpZjzKCfCnO3rvwsiAVpHF0
         toHSOQIvEGfYnfPwLE/QFakmL/OLSASAX70wmdCvfuelfURIni65fM3jY4w9LO/Jy7bq
         7dcxlbP1IPXernLslff+Zyu9mIFKrops7KP0Cvb3pFGSaddVpr0f3QvAiUOAJ7ZWDr0A
         skoMcZCi2lauef4UkNl1o0U3Jkoryh+TTWko0aW8Q8H9eGeQOjtuOGa1zzYtsk4u0gg9
         xsww==
X-Forwarded-Encrypted: i=1; AKwUvBxmZi/EsAig3HHVa2Kgw0z+VcBna3o/Kio5PK1RtbFvXVyXFCe6WLHwVta+2SI9Xvh/0FZAef1MU8cZB48=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkxdOZ0RQnLVKh4dUa5n/NNVBZONz1IfwfeihCejbzpg9IVHoH
	HMfNLrxTvV6xSLO5NnY6PVyS2t2pv9AKnp9xMOvOR7bGHJBZBbnbNLP12c/YPtCIIX/MIRqQGni
	JCjQklPmKga0CyHEJ+G+V8o1C+ep2Q4KzgucP
X-Gm-Gg: AYBFou0olsB9QEjZmk4Ex65mImjwiLMeCgoAeTJnXN9MWh5k23+8qQbx2EQze+YIOOS
	YS6jCwYQFd+8geXKebCcFlPcfknRd8Nx1r4n4HSu6voH5ClvZ/3M+gSxCF42b5mL4/uWBHQDckV
	XIWM5VcGx31TK9Dpr4aOoUIjrMtQoUCog0856SwISLPLxHHR/HvVYoRRKEK/4W+agA+ZXjbCO+i
	Rpo8nlXOX8280UmDlLsudljU3TmSnC7Cc88wYeJJNugnmxFc7K7oErDBB0/Km0VU7jGOoYwi/Ay
	2Ao3rXfIZkWI9rrNpC+l1vQ6wBKNr+dBASAkrufoRHXb3uQ9nUcv34P7Fqh38G8k2F2/Qh2JTDP
	Kv/3bVtUuqdnfOM455sbqIGyXli2N3l2hVW9MKw==
X-Received: by 2002:a05:600c:1395:b0:4a1:d73d:4137 with SMTP id
 5b1f17b1804b1-4a1d760f94dmr205124495e9.28.1792445955038; Mon, 19 Oct 2026
 14:39:15 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017004555.2890038-1-joannelkoong@gmail.com>
 <19d5b7cc-782f-44b1-8ec9-a1764484f10f@linux.dev> <CAGsJ_4yME1gdFCq4jXCK7tYiQKiV-CsRMLM7vz9L_69OkMaZ0w@mail.gmail.com>
In-Reply-To: <CAGsJ_4yME1gdFCq4jXCK7tYiQKiV-CsRMLM7vz9L_69OkMaZ0w@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 19 Oct 2026 14:39:02 -0700
X-Gm-Features: AclHuK8aR4AtoU9dfoB9QBTZ-6L98biucHkBCR_qOSkgIeSz2RTpj2-_dZ9c85I
Message-ID: <CAJnrk1at_8WWjyc5FXcZ_DbSn4-V7CAYEs4GOH+8Lrws0iE0CQ@mail.gmail.com>
Subject: Re: [PATCH v2] mm: unqueue deferred split folios outside the lruvec lock
To: Barry Song <baohua@kernel.org>
Cc: Lance Yang <lance.yang@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Usama Arif <usama.arif@linux.dev>, Hugh Dickins <hughd@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 10:56=E2=80=AFPM Barry Song <baohua@kernel.org> wro=
te:
>
> On Mon, Oct 19, 2026 at 1:38=E2=80=AFPM Lance Yang <lance.yang@linux.dev>=
 wrote:
> >
> >
> >
> > On 2026/10/17 08:45, Joanne Koong wrote:
> > > move_folios_to_lru(), folio_batch_move_lru() and folios_put_refs() ca=
ll
> > > folio_unqueue_deferred_split() on folios where the refcount has dropp=
ed
> > > to zero. In these paths, folio_unqueue_deferred_split() is called wit=
h
> > > the lruvec lock often held (move_folios_to_lru() always holds it and
> > > folio_batch_move_lru()/folios_put_refs() usually hold it for every fo=
lio
> > > in the batch except the first). However, it's not needed to hold the
> > > lruvec lock.
> > >
> > > The lruvec lock protects folio->lru and the reclaim LRU lists whereas
> > > the deferred split queue lives on folio->_deferred_list in
> > > deferred_split_lru. The deferred_split_lru is a list_lru with its own
> > > per-memcg per-node lock.
> > >
> > > There are already other existing callers that call
> > > folio_unqueue_deferred_split() without holding the lruvec lock (eg
> > > __folio_put(), shrink_folio_list(), __folio_migrate_mapping(), ...).
> > >
> > > Add folio_batch_unqueue_deferred_split() and use it in
> > > move_folios_to_lru(), folio_batch_move_lru(), and folios_put_refs() t=
o
> > > unqueue each batch of zero-refcount folios from the deferred split li=
st
> > > after the lruvec lock is released and before
> > > mem_cgroup_uncharge_folios(). This helps shorten the lruvec lock's
> > > critical sections, which run with IRQs disabled and are highly
> > > contended.
> > >
> > > Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> > > ---
> > > This patch came out of a discussion about splitting underused mTHP fo=
lios [1],
> > > where queueing small mTHP folios on the deferred split list was found=
 to
> > > regress Barry's fault microbenchmark. The cost turned out to be the u=
nqueue
> > > running under the lruvec lock rather than contention on the deferred =
split
> > > queue itself. Testing this patch on top of the series in [1] with the=
 same
> > > microbenchmark, queueing every 16k folio went from a 15% runtime cost=
 to
> > > noise, with lruvec lock wait dropping from 491 seconds to 38 seconds =
(most of
> > > that contention then moves to the deferred split list_lru lock, but r=
untime
> > > still drops back to the unqueued baseline).
> >
> > Looks great :) Could you also keep the benchmark results above the '---=
'?
> > They'd be useful to have in the changelog, along with the test setup.
>
> +1. I guess Joanne didn't include it in the changelog because the benchma=
rk
> depends on her patchset, which hasn't been merged into mainline yet. But =
it
> should be fine to include the relevant details in the changelog since the=
re
> is already a link to Joanne's patchset.
>
> Joanne, could you also link your patchset and explain which patchset you
> used to collect the data?

Thanks for taking a look at this patch, Lance and Barry!

I will move this whole paragraph up into the commit message along with
the link to that discussion thread.

The benchmarks were for the scenario where any folio down to 16k was
queued onto the deferred split list to stress the unqueue path, but
this will not be what happens in actuality (there will be an enforced
minimum folio size of >=3D 2 MB for queueing folios onto the deferred
split list).

Thanks,
Joanne
>
> >
> > With that, LGTM!
> >
> > Reviewed-by: Lance Yang <lance.yang@linux.dev>
