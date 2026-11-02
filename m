Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793635206;
	b=RrlaeLrL4lN8zQ/pWwNsZU6v9+qblHYu2mipEHUdp4TgynVdLqunmPSgXZbm6h4qatJX
	 53e9V1G8TKmIn4VeoQldJkXDiw92cx6m/xxNIYOie/TmNq8odFzVFHSUD7o3jOzSp5eOG
	 zREHl1ONlq2a4FFLPmREsMrfcLMl/fzkE/MnyNUHaxPdM+5L90OPyPrunyP2o4M50QjsQ
	 X55Pigmtt7XhckMFLDsxo5czqh6w3U/RKEFePqkH96QYv0mQfjmOHDg7VBLo5n1DyvSjE
	 FUc4q2L02u7BmY+BisnvfHFyoyp6KPSYBiYXwzkIQanJmL9RWKh0DVV1eUvw3ePgAZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=q1PFYcNh+ALcjEaWQ1I52rEchwgKWiSa+Wd1iC2vUUU=;
	b=GoNrwEe6wrp77GVVt51UQktquarKNoFK2VcTQrXXeicIbM4CQC3TV37nP1Q7jXaKnUKZ
	 +o1qY9ex1fKTt6AWpoThBhN0QWVGjJKDhk0GzDKBQdIO6axLjsj7H9W7Q7oXCBicF/PPr
	 rd0AN/0mFnPP7GnqcP/rDsF+UEnbn175teFhIGj4UfPxewr06eMJjFVeIenjzqEZpPKpX
	 LbMLhJuR5Jcu18Nzca79xKFQJdZOI4gbLfC7KhOcTdf2IHyVH/+AFy/Ys3Vi+2B0NVI6L
	 h4SAllkWT2xhGgqy8lH1AQhzHQJmBAtUie9Z8pEECw8WY9ACCW8s4d8Au1CEYLuP0kA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UnqrwGlI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87671606F3EF
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:00:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87671606F3EF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UnqrwGlI
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-54492d8a988so454771cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:00:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793635205; cv=none;
        d=google.com; s=arc-20260327;
        b=Cn7OzmiAQuAUZ471aNdjf+mzQrTFF6FT5XI3hxGEV6jGsBHp5qz4QSewIBhXM4KBdz
         yuXaXBHUceSdMXFGyvGKEyT4XddsVUTDrVgiP+mf373nfKarRW+Eld/12Mq5r6TgQo/p
         F3aA/5uB1m1shVq10ErsRj5sQ6d73iSbEligGSXiKoF5wpgDVcl5MVuy7v2SRPHz0e6Q
         TVwf/UHJpKcBIRt7ZepyPBsDpJkkguf0tJjPCY5QiEMop23yQ7ATzIVV+ppIlT0oprcq
         fJmCRtPgSWfNvMRACkXi6a2znPPhGMNxRNgt3aFVWLbhAYcIL0YvUOUNv2GNBVVPAMI5
         rSpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q1PFYcNh+ALcjEaWQ1I52rEchwgKWiSa+Wd1iC2vUUU=;
        fh=q4T+nekpn6LjicExZwm1b0HUjccth1zLEx0eYliRJxU=;
        b=R8ed3SgKQpHH5D1K7OOTXdTeVBLmoZ1tz4Ry++EWm0zRajZOp9QpcOyYVHwYRpQTfy
         PasSdeRuDNv87ef7wOSXil9pL4lz23qgf580oHe5g+FfVN5774IPd3JNv9JZStwY5PsF
         k4DBE0U5sjfDOgaN5r2sN9JMrZSS1fdErg/hi9vKbcmZADjPyblEcKe4OoETcWkYDfZ1
         1A6fQrAj3NV45mAdyb/S2kIB+vNKh6h+sj9GRGuz/sQ8dOcw3IjpsHVE1qedi9cogCfz
         REN2Toby+eKWt//o/LFoc1inZTl5TvgFtxymW41jxZFEfdBzvWZMuLjwqN2+Qpac7n4M
         RLQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793635205; x=1794240005; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q1PFYcNh+ALcjEaWQ1I52rEchwgKWiSa+Wd1iC2vUUU=;
        b=UnqrwGlIFFgsUvYnNj2zvDtkyBQ5jAcUU0RuqXandS12fSr6+pnsADsXdINiz3xY3R
         k/1fSW+/uvd65O9PPAQRdXb0AyHnVIQzD3WrxoElEPCU5eRcrIk2PdyGHvVTtEIcBOJo
         HPB6oKwAOWZ5smEdE2uo3fZJKCM+xroy0CWvh+iy/Gd2E+7pVGY48n1QwhoekUyGhF+t
         wmI/rff4Tr/e3kguX+q5sHEv4DqLMm6ILoCQGsTHEXLzqXkbyqLhf7ba/CZP8rNYFNfJ
         zvbnY12QELh5J06ldbFoIakjsxASsEAiuO65V9V1dsD07LvrzFk+83uSViYKwjL9GDmJ
         YYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793635205; x=1794240005;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q1PFYcNh+ALcjEaWQ1I52rEchwgKWiSa+Wd1iC2vUUU=;
        b=MsGFPQ9y/DgOU37V2avZwRIevdPg+PcUkWcqmAN6hLX2DE92aho5tHyZzJ5bxgFlso
         mZPFH6h/wcD8N67wy8kzJklwhy3F+EqPBUYgmrDGzRzJR6pWjKTCNSXJHnMVy6ykHPle
         kwC3kkIWcJ+J2h7yLSs34tsopReX3s3pdCFzcpDOKvbbqfn2I4QlPhnWKQz++LwHI8Dj
         0hykuFHsXavokoTUGf2AhR1SUD4NgYutI3Pld0EgfXyr91I6NAaD38teigUZPhw7M8fh
         IjW30jwprZDSW29iLYOWAC0G7QUPnb+/W6pIVYWdX8ol2ePSSHc/uBs0UKXgv0EYARBa
         3FjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfY9P7tvTEZ3EC664Um2Yiqw+Nlrwz3QJ3CsUN4ZfYhY57melYxRoVMm2sBYREZV+KP7fCTdv2PgA7MNs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iHexNOfq0y+VolhnkWlUUWm1dELEfdeDEfYIa0fU4CbTRyge4
	Nq9FsZ0LF+F7X396eyg/gakAgiSDleJHT0IKa8uBEshjC8Rl9zLCu1faIEhncyNcN1bgPeKaRFT
	YBsgFPUGwh/k9ZVNc6YYzmtaYlv05H0Sb2y5c+Xw2
X-Gm-Gg: AYBFou1d4Tzi3ljz1p9dwAglhrNWPuk3FYKNR9LS9kJdXuoMfpgdoF7ZVvBgO2gXGNe
	s0Z+Q4lnqUBLoy1EsGDR9DtLat3I8Ormg4VFH9oYDg93avQAeaMyTzvENdO0M/XWf1TEYxHtIpu
	auXonsxkhfnNSjenVzrRfjEd/HyEieoh2u5wWWBPlEveH85FvmToYjt3Sjm5HWC6lgtL+cpymVV
	PsoLyeV6zJfkACLW0IzP0k6Gw5mDINwx020rWxk4istOPUlYWsoOK/tyeMcETAkjXE6H6EyQck7
	t2j6SPN3/YDW8+4ekBg1qqblQN6NmKLNhTDoOLpxYYM9yEfVkHnunH24HHGqBvPz+mlZb4iW4qM
	jVk3l6kjbI1Z3bQeFBveUm9Behq7MulMvlO1A
X-Received: by 2002:a05:622a:400d:b0:536:35e0:4f97 with SMTP id
 d75a77b69052e-5414e8ec151mr81444421cf.11.1793635204453; Mon, 02 Nov 2026
 08:00:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101154503.3203036-1-surenb@google.com> <auiMK6ynztyF1-MM@pedro-suse.tail5790ac.ts.net>
In-Reply-To: <auiMK6ynztyF1-MM@pedro-suse.tail5790ac.ts.net>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 2 Nov 2026 07:59:51 -0800
X-Gm-Features: AclHuK_cZDbtd_0ueJf6rRfK2iXBf9dKhq_tkrnJpLDfq54hZvQR7vC1PP9A1x8
Message-ID: <CAJuCfpEbhjE2V57ekoFfOjoDf5j6LvtcsrzneGCAWy2d+pQW5w@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] selftests/proc: use RSS in /proc/pid/smaps_rollup
 tearing tests
To: Pedro Falcato <pfalcato@suse.de>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	jannh@google.com, liam@infradead.org, willy@infradead.org, paulmck@kernel.org, 
	usama.arif@linux.dev, vbabka@kernel.org, linux-fsdevel@vger.kernel.org, 
	yi1.lai@intel.com, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 5:26=E2=80=AFAM Pedro Falcato <pfalcato@suse.de> wro=
te:
>
> On Sun, Nov 01, 2026 at 07:45:03AM -0800, Suren Baghdasaryan wrote:
> > Pss metrics can be affected by map count even if VMA tree stays unchang=
ed,
> > therefore tests checking VMA tree integrity can't use them. Use Rss ins=
tead
> > and pre-populate the VMAs so that Rss changes if a VMA gets skipped or
> > double-counted.
> >
> > To ensure all test VMAs are populated with anonymous pages, remain
> > mergeable across VMA operations, and do not have their Rss changed by
> > memory reclaim:
> > - Toggle PROT_EXEC instead of PROT_WRITE between adjacent test VMAs so
> >   all test VMAs remain writable and MAP_POPULATE faults in anonymous pa=
ges
> >   (rather than the shared zero page, which is not accounted in Rss).
> > - Use mprotect() instead of mmap(..., MAP_FIXED) in split_vma() and
> >   merge_vma() so the first page of the split VMA stays resident.
> >   mprotect(..., PROT_NONE) splits the VMA without unmapping the first p=
age
> >   (pte_present() remains true for PAGE_NONE PTEs), and
> >   mprotect(..., self->mod_info->prot) merges it back. Both parts of the
> >   split VMA retain their non-zero Rss.
> > - Lock all present pages in the child with mlockall(MCL_CURRENT |
> >   MCL_FUTURE | MCL_ONFAULT) so memory pressure cannot reclaim pages and
> >   alter Rss during the test.
>
> FWIW, I was wondering if it would remain constant in face of compaction (=
page
> migration). It seems so, from looking at the code the migration entry sho=
uld
> make it count the RSS. But is it always the case? I'm not super familiar =
with
> the migration logic.

I'll double-check, but it seems logical to me that page migration
should not affect RSS.

>
> --
> Pedro
