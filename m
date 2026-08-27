Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271723803F7
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787851192; cv=pass; b=XVpRXvXk91gCUEC+jUm2G4RBRIvbi/QZzXuUtyqZjhJlLTA8ARvK6Z8e3HK9oYJujeno/skoOlJ7Gw2RPUi13gjcZChVy79BEQoJOxuUZSThoSOvU29lVmnpaKSfv9Ah5IqDb6/a/+ewCLuy6A4l08qhdCMOrTPvlEnteTDC0nk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787851192; c=relaxed/simple;
	bh=5QX/7QSeUpnT+0W6jR9lg3PUubOUWe2QDRST1lil774=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gqXMqrtbQWXtrrr9DHaf5O9YgH6spxjYHqlBseaB5Kw6EM61kBrwz7YfSse0OJy8e1wdx/Vijf+El249o0+op1dnamV4o9xDAgtTlFeq4/o2VmzgB47tzBVqZ3mGDKRWqiSY+JRNr6cV6MCCY1Rr7Gna+OPK4OYuk+tqHTuSOq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SqpG1EQI; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SqpG1EQI"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c2055573c8cso10031966b.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:19:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787851189; cv=none;
        d=google.com; s=arc-20260327;
        b=J0CqPraHFCm2NYhn5PPnniUwhrZ8R2O9/MMcGY+w8c6xGIFI2vyYEy3/llCHEY9XhL
         AWmpmUgN6JAI1gmKRqQDVrXhViiyQ915/OxrEQ7c6owYw2N6DT/vTjC2V6h0BSh7g+98
         vCnNMO3nil1/Ci/cjE1XutWWT8o3JzVHl/jI0nwV8nsD2hRHqb3pjVpBU/puEQArSY5F
         6myU4qyYkF9atUGw0giIRXQy/De3mGyKbptxlqsB57H0oSFc5gYD4heX7jp63kF/sapZ
         nzPy1UJxbtMefYydRjvf89Sha+A04B3/E7ok4YvzMI0NaHre70VxWUGJwL7Lp9twmCLT
         7xxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4O9IcA+RxZYf7jVM0MLLyxrl/FRrYRl3dstOxuMvo4w=;
        fh=nCJASxFizSudH8288YIL9uXZyggFA85YTMK6PE4lF3s=;
        b=OnwU67kb3fnwfYNhO4qVkET62zxfTwHmrfQlhy2od7kdsw0D58WD308F2Z563no74X
         9Uecfj4O1uJ5rh1pmUeAmvkg/ptKnZthQAz4PxHCvscSoG3x3H4292NyGEtusqxbuNoL
         lF0pRUZbziz7nLYfzazyPF+e/ihEAO4loAIx81O4nKwSX8Dy8xNAx8byYWZoaxlHM/FX
         hSTi/xyGlgzDpTkj2wxOZtFu3lFrpP3qC6tJSt4qRMSBjmsl5gL3k/AKlNGNYGm0LV1n
         3CRqdic0GkztHuMnzJL1DoBnubM8CN1YrXzkp8dbXXVqGeiBuO8Nj+eDoJGQYtVNcfJM
         sZWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787851189; x=1788455989; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4O9IcA+RxZYf7jVM0MLLyxrl/FRrYRl3dstOxuMvo4w=;
        b=SqpG1EQIMCdVzB16TftQGBIzanVNcYa9015/3ANpYtcRBi+WfP1QeN1aGm3mIHY5tB
         joMVrxpHdIMLIdg1Iv6qzE5v7GyyBHFtxHCNvSqKW4857+w1JemKolRc5jEShriEBU9h
         VEzNdrTikSEz8j8z+ttIQOKT1GHJJM0UCiWtRRDm9UH7Kp5FbVI+zoUGWXl/sPPz78Oj
         m7b5sBZ0Ipytnvw6oiEPbJhqyaOyHhUf8QvzHBuUlDH3mfGAq78cFqAH61L3Bv8HYXBT
         LX5dEMOjVJFKkL64OU9HFv+FwVBqM4b8MbpWbqrLlNRz+F25F1NPLgNSUvIYHVUji7QV
         UWAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787851189; x=1788455989;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4O9IcA+RxZYf7jVM0MLLyxrl/FRrYRl3dstOxuMvo4w=;
        b=L32jOxkVCTVeV79XTT+k8IM2tLQv59fojbiEg/dnuTN7XZgNxhpqQ7wUIsM5EFt8Sq
         UAsdJzIxqIoGhRIBa7exqJ78aN2IjtAkiCD0mLYCxeVOYrVBVF1l3z+c1Ys+f/A0NaVP
         AZN/wF9U15jvw6+uWKCKiGZquNoT95uTPGvDdtJhOHxBSiwxN2sGbU0MBHxu8Xfurvhh
         2b3CkPwMVcFHgav0lrYDwYrBEAP3Jm/SZT7+ZU82aix3rd4fHkabpfNedHbOlC7qm2xB
         mPrHu77GZh1qX7cSs8bB0F5jWNcGq5krYvNI7z/BAtVLN7LOcit4xSjQQgkh1TnWVq4o
         icog==
X-Forwarded-Encrypted: i=1; AHgh+RrobkEIY6DV3xvmEw4A6BPakaoUsoYyvJ+/I5TNHdnLq8rCAuZ0OGfT+/K/09G0UvK/PFkj+utKKzutL60=@vger.kernel.org
X-Gm-Message-State: AFuF++nX6iCoV6nTcd+dmcgZvNyTRh9FYCxzLOqQlAdv4FMgRlmVdO7I
	z/x0QkcVl1P82aryuJt1fyTznM3CqxBGz6f+DBLhKpCRlo0wULSuCY3FrOy1tMBL1WO/Nptel8L
	xrl/c3vzcScU2kiBiTGTE4Hfnr2AaCrU=
X-Gm-Gg: AR+sD12tofGPLPN8b++XLJTf6e4eDNb0yxph26kknJYbUdbir78t/qq4FKDmnnUeXPV
	BL0m+V92+1FWgkg0pWo6ZTHhLVIGajEj3FhNvg4BQ1AKg+P7eoXsZOHAH5/ymWhjdHOk4cxGZzZ
	eMZJLMNN4Gib1dlY5dV5vreQ+wTv3yqCCHj5l9bzQn/SNHSE42+2c31tPVx+DmC8bg+k6i6l+xU
	obsv/Qg8xTOannw1DGeu3FIxFihjrgHCbAaXm7ChDkd92KGweAAIGRSARPfWzZIAod8vqrEQb0x
	WTUjyugzZMpfrmt0PQzw5hehhPpVqoKcO09kWV1gQlnJ1zxpEc/qctqYce43uQOGQnpQNLi+7K2
	V
X-Received: by 2002:a17:907:7ba6:b0:c24:6445:d19 with SMTP id
 a640c23a62f3a-c25571647aemr14714566b.17.1787851189141; Thu, 27 Aug 2026
 10:19:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821-swap-thp-cleanup-v3-0-9b43f5163238@tencent.com>
 <20260821-swap-thp-cleanup-v3-4-9b43f5163238@tencent.com> <apBPFRdRdJqODHzQ@thinkstation>
In-Reply-To: <apBPFRdRdJqODHzQ@thinkstation>
From: Kairui Song <ryncsn@gmail.com>
Date: Fri, 28 Aug 2026 01:19:12 +0800
X-Gm-Features: AcwNN1WoulzeIyaT3RTpl3G3_l_jAJkDnLWzSfKxi-G_ggWvUMoeiqZPfqQzfgU
Message-ID: <CAMgjq7DmO=L5ajYCKE4w_quM19jTiT4utM62EL-eDhCb0-vmag@mail.gmail.com>
Subject: Re: [PATCH v3 04/18] mm/huge_memory: split the routine for splitting
 anon and file folio
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, Shivam Kalra <shivamkalra98@zohomail.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 10:58=E2=80=AFPM Kiryl Shutsemau <kirill@shutemov.n=
ame> wrote:
>
> On Fri, Aug 21, 2026 at 02:55:17AM +0800, Kairui Song via B4 Relay wrote:
> > @@ -4064,7 +4095,6 @@ static int __folio_freeze_and_split_unmapped(stru=
ct folio *folio, unsigned int n
> >               folio_put_refs(new_folio, nr_pages);
> >       }
> >
> > -     zone_device_private_split_cb(folio, NULL);
> >       /*
> >        * Unfreeze @folio only after all page cache entries, which
> >        * used to point to it, have been updated with new folios.
>
> This gave me a pause.
>
> I don't know much about the zone device private thing and I had to dig
> to check if such folios are always anon. They are. But it is not obvious
> to me why this limitation could not be lifted tomorrow. Nothing in "not
> directly addressable by the CPU" implies anon-only.
>
> I would appreciate some explanation in the commit message and maybe
> VM_WARN_ON_ONCE_FOLIO(folio_is_device_private(folio), folio) in the file
> path to flag surprises.

Right, good idea. A sanity check and some comments are better, will add the=
se.

Currently device private folios are always anon and never even in
swapcache, many comments and sanity checks in migrate_device.c implies
that.
