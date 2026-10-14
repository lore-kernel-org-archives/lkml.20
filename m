Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A374FDE67
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791975961; cv=pass; b=lD1Ty8Fve4SBjuigaJiRAmM25gNUuuSjLshzaIwCxzFhBmfcZHmmy5shRvpTvWzDGFK+bWeeqybnfi2/cUr+sfLs5fwTK93UrT7KnnxNhTWLMkGg8HewgFVbIUN3pjfoZDYa6hnevAdYjY1LXexfRsn95sIODwVrzcKicjmiZwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791975961; c=relaxed/simple;
	bh=oKg3O/9qWwL0S/n8isR5H6f1yss4N5Cz6zPMHFWqGP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CKWMzCEDlfyBo7Mmg97c52RJjmUPPEQL/lW6CIw8ZHWQaIMBjLedc4iP544yM9NjlorRo/8uDIsKgeJ4dQLQl2+MWS3XWasRn5bffviGUoiNndecFxvig+SSbsmvh5+9lpAozYzEiv3S8mHM1UP37r1Uiaw+RV60UkViC4pkpDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YJ3g7cjH; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YJ3g7cjH"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2db33db4de9so212885ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:05:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791975956; cv=none;
        d=google.com; s=arc-20260327;
        b=MUuEWyR7a0ljdDgKS3AvMdINFIqskeNCHTGXBFehTAL2EQLnI+LcXg4/5zC90b11+s
         dhNNCODqS4OYTqOGq5QULOuLSKidnHF1r+YRjz7MObtb58LzHz/8RW9oD4zvVje8ikfz
         0GdWzWLVwexZkzkrAfejgEjzpzPp34j+1OCn6EXBlz7gAfUwcampEyfjrME5AJYMJhkx
         P4BDpZ/OsVynq0oUW8MXFcTysa7bo+yDMxc8GXD7dpDCgSd1RK/BmFnXrG6Fn1RRIW3Q
         qml1jfXfpWCP4Xq8HUUpTXrD5Jsse71kxwk/6kyjZFg0CH2X9v9q2AxJ8KFrum2Ep1t9
         hp/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oKg3O/9qWwL0S/n8isR5H6f1yss4N5Cz6zPMHFWqGP4=;
        fh=bUSewioSxq1EyucAAni/xcXPi0xCaep3lGJyLuNcwg8=;
        b=TVdyDip0HQB39eG8l5WNJp7DakNBCXbynyBb2wy/OIKxroeHrllqXAPblmlouke1Rp
         QLkiM8aXMQbGofq0rRC2cYTyYV1/bBF974AgBJBhxhd1cMMuEQJi3Lq7kZUCczdmIAY9
         qDaKwo0nlZLggyZqJEizXy+6svwf4IaEjsnqIEoZwYQVQamM3GZ5X74/+kOrDIGw6Lfl
         jhZKvamZx1TaHODpi3WOyoPEZNzkwA6MyLNSu+1LvI4nEbMhL0h6rGXxykpA2A9L0/Le
         qb5Gvb7reIrQ5w1oLQFk1sxEGvaTXskPkYjoDjk/zJHgzoaRYp9aqqwUZgY9bTF/nVmy
         etvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791975956; x=1792580756; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oKg3O/9qWwL0S/n8isR5H6f1yss4N5Cz6zPMHFWqGP4=;
        b=YJ3g7cjHMpm7TU8HvtpzJwSEN8H+q5OGe6ySUTtM/H6A5nduWlRHZJ/SoYWbknr+oR
         WxXylTt012xWuCK43avh36CpAlVfVM6XDBxYX6A/UiyHUWj/onilcDN02WyBWqGR/0LS
         wjto/T9bbfmolLeCoL7fKfNIvcgGp9bnyGaRh4bDWRIulY4qtm+Ao241Awqxve9VsSDB
         X4bq0qbqIAFVwVOLKmcgnLrqp1H9qRdoL0RT/fv3cseDN/64Zy4hhpvjccBUSeJmLjh8
         NVF16ZbmlIzEmI8pWK2ESTshLeWphtqx7OLEINl26D25miLzIV9jyp0gQdRfPeqAbv4G
         8Y+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791975956; x=1792580756;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oKg3O/9qWwL0S/n8isR5H6f1yss4N5Cz6zPMHFWqGP4=;
        b=yyagmoJDL0mys7L8+LYFwgRcAU7sonBNZP6j1hzjpLlM63+z9Ekf4TeakbFtSI1lHR
         iCItBMa2yq5V+FDK5zoBmQXMrQa9FmXGHqwTU9BXmX/tkDwI/VZADwue/3jeOYXLsGgU
         D+7fDqmJ6YtncrCbyeAqvWWngxJpS5Bux8PVmpFWPqKVhkNHy8CgI2CluqUslp9dpDof
         y8NnmU0iQrf9jqdGPeUGNEWRxrYjuD2TSF4pefTMi9VqCMboJoMhWwomcFTZyMHT/faO
         TGwOAR6AzTQC0EqSKRlll00pIGU+OspBDgfa1hVFk6wLkmOj94/Xh8eEuVdxTNhgtF/1
         RCXw==
X-Forwarded-Encrypted: i=1; AKwUvBzIW0swUmtgusO/QCSx7c231SQ1vNxtKA8ctIyCHOiy3/7SXNOQPdVwTdB3mnNrs+vegP6uf4plIhmIOlA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIJDhudCYdutHEvv5vJYpuaXB9iXFN/scNRLpWmjKJ//aJqRsZ
	X1Gpo10VhgJb8FI/BoJ6n1BBoPq1mgpEzraNSFFxhjLik8xD9peX/h40hwZAWPsUBTuXo4SswnK
	Sm+lp6gY3yIZItCm5gWR1WlKEO3nfWREk13e1/h0x
X-Gm-Gg: AYBFou3hdhJuOmAJrArMYcS9255C/T+SGTy+Y6G7dOapPsKj4/38uvH+/xD8P6i4BMM
	dC72AJRKY9SOWGmp4lDWVhnnEBfPY+WLFGFT8yuq+tPvpc4PoRY7iFA/LLdnYwUfKaSIrhDzlZi
	6Wg66AnwPrnugoUYLvVoUxWzDRbmBz0mBlF23iC0R3KjUK/Lq9sJBSPBkCnifVzLJw+fzOxbwzl
	xraP72r58GQ15LNbYTgNYrHufAIZi1uWA/5mCEgnHoP6IZOwoPk0TDQZ1e2A8aNeI54eDWTJWAJ
	U1hTVLTmx9/R52uuwj/sJewM4klKlFrs+H3WtZqVY8i4CY0M7moBHIzV
X-Received: by 2002:a17:903:1a2b:b0:2c6:99be:9dd with SMTP id
 d9443c01a7336-2e939d0f5c2mr3033515ad.12.1791975955291; Wed, 14 Oct 2026
 04:05:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003212241.3432303-1-lrizzo@google.com> <0cc1cac1-a500-489b-9c1b-b49598b5550b@kernel.org>
 <CAMOZA0JaiKsRgDdjHkL_N+MshhcyLSv+cT9SzEbNsC_sumHvOw@mail.gmail.com>
 <b31efcd5-149c-4edf-81a2-1744d363c390@kernel.org> <4fda41ed-741b-4c5f-ae83-e3ea5a447441@arm.com>
 <75c229ef-ae41-4072-9c90-98d4779c52bf@kernel.org>
In-Reply-To: <75c229ef-ae41-4072-9c90-98d4779c52bf@kernel.org>
From: Luigi Rizzo <lrizzo@google.com>
Date: Wed, 14 Oct 2026 13:05:18 +0200
X-Gm-Features: AclHuK8XP34mfrE8lQUslMQMNc1nPr8ujKpQNMaoAI_u53qDQl4REr9J8L8QdAk
Message-ID: <CAMOZA0L6hWd=PYLF2PkYwMG11JCson6Wp4Fy9B3k3VC0Vt2R0w@mail.gmail.com>
Subject: Re: [RFC: DMA_PMD 00/22] DMA_PMD: PMD_SIZE-backed IO buffer pools
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Luigi Rizzo <rizzo.unipi@gmail.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Willem de Bruijn <willemb@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Joshua Washington <joshwash@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Michael Chan <michael.chan@broadcom.com>, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, iommu@lists.linux.dev, netdev@vger.kernel.org, 
	linux-mm@kvack.org, driver-core@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 12:48=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 10/13/26 12:42, Robin Murphy wrote:
> > On 12/10/2026 8:43 pm, David Hildenbrand (Arm) wrote:
> >> On 10/12/26 16:45, Luigi Rizzo wrote:
> >>> On Mon, Oct 12, 2026 at 3:51=E2=80=AFPM David Hildenbrand (Arm)
> >>> <david@kernel.org> wrote:
> >>>
> >>> I had to call it something... an earlier prototype used the name IOMM=
U_2M,
> >>> but I didn't want to suggest that the design was limited to 2M (it is=
 not).
> >>>
> >>> Aside from the name, the _current_ prototype restricts to 2M allocati=
ons,
> >>> exactly because too large units are expensive and wasteful.
> >>>
> >>> In the code, decoupling the allocation size from the PMD size is triv=
ial.
> >>
> >> Yeah, we should do that.
> >>
> >> We should probably just find a way to describe that this is a POOL tha=
t focuses
> >> on physical contiguity in some configured granularity.
> > And since it's intended for DMA we could call it dma_pool and oh look i=
t already
> > exists...
>
> Heh, I did have "DMA_POOL" in mind when writing my reply.

which confirms that naming is one of the hardest problems in CS...
Let's try to figure out a good name before renaming everything.


> > Sure the current implementation is capped at PAGE_SIZE for allocation (=
and thus
> > mapping too), but I don't see why that couldn't just be made more flexi=
ble.
>
> That intuitively sounds like the right direction.

Point taken, I will decouple the allocaiton size from PMD_SIZE this in
the next iteration.

I have also followed up on most of Pranjal's feedback (stricter error check=
ing,
compact IOVA ranges, opt-in per destination on the tx path...) .

I am also looking at reducing some inefficiencies (e.g. pagepool already ca=
ches,
and allocations of new pages are relatively rare, so there is not much
of a point
of having a dma_pmd_pool per queue; and on the tx side, something similar t=
o the
percpu page cache to reduce locking costs when a page is allocated on one C=
PU
and freed on a different one)

cheers
luigi
