Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794355747;
	b=3TUhpbQ2my9cQV5JJ1DkX+te4ic0wntpLjye/7eXsdLd6QOP+5IFuEPrTFwSACgMei0x
	 tzUVelgyPnbJ0Pj8lZKmvUgypdH0n99cUwT+y8qq8ToP5ZJvEHeMRy6HtvOfuYFJyH96u
	 FSRwItsYSU7jJ2SOUsK0heQArqNrcyF12Uzuxg7uGddsEeWQR8yo8B/hoiTBtBedvllDv
	 ql4UN/ogUUWzt/4ysrooZLyM5B7/e/e1+0tGIcr6hkBrioc6ah0kIsE+qFBG3i6HaBnXS
	 WfF47J0VieOklUN/2eOwKn7tDn1N54ait/xv/GPBvgchV4kj27gPX0Wqf8RZ21/jFQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794355747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ejVE7bv+O6VL91N0JFJsoLHNOj9By5Og1w6pSTBM3gw=;
	b=Khdk194UsJpLBAtKk0seQbXxICpCfzuaZvygWstNWyNW49D++lJH4+nmILs1XLy01pD6
	 hNPHLx8DWWVYdFKzUOuvGyabPD6UtKYDnyACO/wcM/jpkelNzmtzvKv/W2URFG0aBHLz5
	 dlksTnGt8XmvB+9H15UPv75Fn+4+gZz0UvwOnbkhMuuyHBhEQWrOKSrGPK4aCjm7XBwnE
	 xRtE7FYl2pipafB8DAeYx/XO3fi1SHeVZ7X7i5ttHC85KPUGRQEWMxR9mrIImeNJ9cv+Y
	 UAMwXelkn/PdNhL3lM3Q/ynyaGc9actMAfX14Gt1WR7rELIkDUlfL039qH00S7jAd7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="OHv+JSu/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C049606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:09:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C049606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OHv+JSu/
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so32684155e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:09:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794355745; cv=none;
        d=google.com; s=arc-20260327;
        b=hJGHjNp9g5w7Lm0MKqitRuWabbWI2+ieSaOwmh8ra+z2FoUcDXsPaF4jWdZm3Cf5mt
         eHiYgwfwrTkkbJdwxwTEWTtvpkQJLcBR5binHFFtlBdvKuBkeqfV2L+CBsO1ONxB9MhR
         lxoZkT49qgWy9B5etsm5GpooZqYCfNYnPnoSe3+4gp0yLdKRLVl9W3PFHYGIl58gh09X
         xRKYyhsIeJsamUalP0qK3XfIxTdSe8s2HwjCo6PLwN8ctVhMOne/tVlXaS8KxBUSdduj
         dzmbxZ4WfYAx6qcajRJvBxMqm2yy9ykKIxyL5hS0mowstmdtcRprky3Fz42lUpz7O0La
         M8ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ejVE7bv+O6VL91N0JFJsoLHNOj9By5Og1w6pSTBM3gw=;
        fh=6Y1x7Ybcfeu9V4yXdamiW22VXyW7mf2k/lky6myhZfU=;
        b=nhqT7Cwo2Prv5QH5UQHSve4hY8rF53K0vjXnu+xf915fCjIlJfrGMegai3GGPiKGw0
         QEAFbAZchNDyYaVff23AmGailAEDgHUFMHHfB0AosUXaxxuLLRdsqF5NNtRncoej1ySj
         tMaCxNPAhmQNh2TCMzVUQ9UDAsrsvhIFrJm8HgAs0IVQ8EeRv+Ty1XMZ4h2DoCwUQp9b
         0D5/lrA7QGAcciH9UNoo6xd+7rqnpym2OdwnY69xnRaIes/sUjciS3MJi8QkyFzTX//E
         SKGkaujKyLDIm8P2F0tm19gh+7xlVCjn/QE/xgLDbJKzRKaiIe0ZCrleO0bZws4xyLBX
         W9/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794355745; x=1794960545; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ejVE7bv+O6VL91N0JFJsoLHNOj9By5Og1w6pSTBM3gw=;
        b=OHv+JSu/P7fmfOhr1sfVIOXUSqXw/NsYzKSPAMrlX3VOs4sCfv/4JkLnsu228aT4W8
         oq6PZXN4jiRlyQstLZUqjNqE/jmqKO2Z6qA0z6jK5FfRArwxf4oHDxX8TJK/uFDxDnuu
         V0zCCcNTQlUt2KUFgjXBpQY2fvDWvXFD/0SKKOmdNH3gKEATVcFKjYLxVyJhBMr05vAe
         k9gaHncNowV7ZNcWU1sq1yElKNC+J8t28Y+dIA+dwj/Rd7/9DlawXPaR3CJQLEMQCOOW
         JraLfvikk8/M6f21erNLdQyI1vnK4LoH5qwtfiC7ZR+ZZx1mkjSPS3KpQ4Ma+gAnbKl6
         osfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794355745; x=1794960545;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ejVE7bv+O6VL91N0JFJsoLHNOj9By5Og1w6pSTBM3gw=;
        b=023wC2HCX9tDwz2wHwyS9Kd+SjSDQ7qISHVkZAXsSH0pg7qz+9kuGILjGi+ekuK60/
         rvZ4X8PJBuFPtMW+8qwU0VhUYsoj9CPe1mgcbrQHUhar5k6BTemeXB/e6jd82CJ4KLja
         RQejFxBymsBUC5/Ltwj8TxmOeMI8K1B/JxL4YzV9NhfGRHlkrR4GT+I1vwkFMEq3iIay
         9EvfrPK6rHhzYw/xqsj9v3+aGn+6hrOBH3QNZoY8+1WWj4lJ7Qrrmklw6aSaSR9mP4J1
         ZrEGBQw5YMrDHjEwhR/vxZluZiLqWIqCVRlpqFVjOLU8rNmsgL/6N+YVOHk5TnhasFaI
         Z16Q==
X-Forwarded-Encrypted: i=1; AL+hErHuewjHhZHTqv5eY88zEVIzoplD+0F+86P1jXM/rTjvkc4kbCTK7ZvFzLAa1uKmtT3nTz7W9QGiH+kkhGk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MXXWzljqR9MGY1GC2JBk+x2rtjTQ1uSNWlxrxOyOlJ6+kf1n8
	YVoacJmY2T73vGUFHcq+1O3dPnDuPwImRSchvsF2TBkp+7fwErzwmZReIgSJHLPu2wX5BRCeIBY
	P5nnOkwgVZ7o2mGcQVQ/9WARE+3rAMrM=
X-Gm-Gg: AYBFou0SxU3ROgLtcbNV54tb79nJo2k2tq+8EuOtFwtM5TW+LldrvUsBl3vAjNQX29R
	oockudr6xsHPHoZ0vLRG14dDGo/8C5l7FhY+gO9zMNqYFEsVRacPCCgnGDLT/95LeZzBF9Np1wQ
	ZcyXaldo/O6VoBUSmggNZ2t/z0FCP5WXOnJeM8oM73AOQm9KKaXMmLgc2VzSejrhlgpIBBGJJxG
	SnSP0Iun+1y3nXWDXae2jPvAotAjflkjL8A49aXxVQbU5X4TwTf/9hPQULEvfUDrF9FPStwnyPH
	FE3UyEIc8iUrAm078i5uDadSq4tM4GZgqIPwwO9MYWR1VfD2oUII0Topl3ueNN5fARZ+Ov9qqs1
	Ok5if390nBvjZEefWI75ENpLovovZ2GOQRH1MkzLD3Qqp5hqe6SA/A+EgcE37k6bAzdzox47va3
	meJXvj5g1NSWV+d2CuOtA=
X-Received: by 2002:a05:600c:4883:b0:4a1:d45a:3ae9 with SMTP id
 5b1f17b1804b1-4ba08e1775cmr9777125e9.15.1794355745545; Tue, 10 Nov 2026
 16:09:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260813-migrate-rmap-batch-v2-0-3c5424c555c7@amd.com>
In-Reply-To: <20260813-migrate-rmap-batch-v2-0-3c5424c555c7@amd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 10 Nov 2026 16:08:53 -0800
X-Gm-Features: AclHuK_RO65Q781zBaAcWpIFEOI4qG6DgWehJFHz4qnMtFOJAAdAQXrDnpqCAyE
Message-ID: <CAJnrk1ZkhvyGLUyZrf_gA3XBv1XTfHArGOMgqr=5XbSCBJHz4Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] mm: batch rmap walks during large folio migration
To: Shivank Garg <shivankg@amd.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Rik van Riel <riel@surriel.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
	Jann Horn <jannh@google.com>, Lance Yang <lance.yang@linux.dev>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>, 
	Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
	Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, 
	Karim Manaouil <kmanaouil.dev@gmail.com>, Frank van der Linden <fvdl@google.com>, 
	Kinsey Ho <kinseyho@google.com>, Wei Xu <weixugc@google.com>, 
	Bharata B Rao <bharata@amd.com>, David Rientjes <rientjes@google.com>, Dev Jain <dev.jain@arm.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Usama Arif <usama.arif@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 9:24=E2=80=AFPM Shivank Garg <shivankg@amd.com> wro=
te:
>
> Migrating a PTE-mapped large folio currently walks the folio's rmap
> one page at a time. It does so twice per migration:
> 1. try_to_migrate_one(): Replace present PTEs with migration entries
> 2. remove_migration_pte(): Restore migration entries to working PTEs.
>
> For a folio with N contiguous PTEs, each walk repeats page_vma_mapped_wal=
k()
> and the associated operation per subpage of the folio. (256 iterations
> for 1M folio).
>
> This series enables both walks to process a batch of consecutive PTEs
> that map the same large folio and do some refactoring and clean up on
> the way.
>
> Performance:
>
> AMD EPYC ZEN 3, 2-socket system (1 node per socket).
> move_pages() migrating 1 GB from node 0 -> node 1, throughput
> in GB/s:
>                        batch-         batch-restore
> folio     vanilla       restore-only   + unmap         restore%   restore=
+unmap%
> 4K        2.96=C2=B10.15     3.02=C2=B10.14      2.99=C2=B10.17         +=
2.2%    +1.0%
> 64K       5.99=C2=B10.10     6.12=C2=B10.08      7.65=C2=B10.16         +=
2.2%   +27.7%
> 256K      6.48=C2=B10.09     6.67=C2=B10.08      9.23=C2=B10.14         +=
2.9%   +42.4%
> 1M        6.76=C2=B10.10     6.98=C2=B10.10      9.74=C2=B10.19         +=
3.1%   +44.0%
> 2M       10.50=C2=B10.20    10.44=C2=B10.16     10.67=C2=B10.21         -=
0.5%    +1.6%
>
> In plain migration, the folio copy itself dominates the cost, so these rm=
ap walk
> savings are only partly visible end-to-end.
>
> When the folio copy is batched-copy and offloaded to DMA engine [1], the =
copy is
> no longer the bottleneck and rmap-walk batching translates into much larg=
er gains:
>
> This series + [1], DMA Offload on PTDMA (DCBM), 16 channels:
>
>                     batch-copy                      dcbm+restore
> folio    vanilla    -offload(dcbm)  dcbm+restore    +unmap          (rmap=
 batch impact)
> 4K       3.05=C2=B10.13   2.76=C2=B10.11       2.77=C2=B10.12        2.74=
=C2=B10.09
> 64K      5.85=C2=B10.11  10.66=C2=B10.27      11.56=C2=B11.45       17.55=
=C2=B10.56
> 256K     6.26=C2=B10.08  13.64=C2=B12.73      13.68=C2=B10.16       34.76=
=C2=B10.57       (2.54x)
> 1M       6.58=C2=B10.08  14.25=C2=B10.07      15.27=C2=B10.77       44.28=
=C2=B10.27       (3.11x)
> 2M      10.61=C2=B10.24  65.26=C2=B10.96      65.25=C2=B11.65       65.66=
=C2=B10.87
>

Hi Shivank,

Are you planning to send a v3 of this series? My reason for asking is
because batching the unmap also fixes an existing issue where when
try_to_migrate_one() unmaps a PTE-mapped anon mTHP one PTE at a time,
the folio looks partially mapped partway through and gets flagged for
deferred split. My mTHP underused shrinker series [1] makes this more
common since every underused mTHP split will now go through this path,
which makes this bug a blocker for the series. More context can be
found in [2], which was my attempt to fix this bug, but then David
suggested we fix it in a better way by batching, and Zi pointed me to
this series.

Thanks,
Joanne

[1] https://lore.kernel.org/linux-mm/20261103212004.1356327-1-joannelkoong@=
gmail.com/
[2] https://lore.kernel.org/linux-mm/20261109220958.2071687-1-joannelkoong@=
gmail.com/
