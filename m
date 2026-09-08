Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84285616D2
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788884234; cv=none; b=r0sYukA8qyXZktRi6unuxzLGrSCIWwyMk+O/h1XhcsSxE80N6gMIv8x8reVCdgZl5QABgINC8yoSb0wdqGiczAWxw0Oc7lvJuYJkmo4S2KkMd625/shz5PixIlmgdlcpiy90N0HlyZCArQOnkhyczLjhhLwiIBC+nB6I6rhSXI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788884234; c=relaxed/simple;
	bh=biebLiR5oHGYPmQPO3uT20qG8Uw3pA9q7i4FEjIutYc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LQZBcdJ8sOfKSILIAkF2WaCeMESSFQHbTwjPDUDXl+lJIMQbxenl06WLuhPh+WGLL2zkrxnSyr8FlMq+MmRgCOfNxpARR0xhvqQonYG6ii90B01fFhaqFhlwKOuFh2IseRTJfa1lBqDS+vDIMqqAKlNv30VbDut/TGrxXvxudrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N+56EXQe; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=o8jZIIZP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N+56EXQe";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="o8jZIIZP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788884231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=biebLiR5oHGYPmQPO3uT20qG8Uw3pA9q7i4FEjIutYc=;
	b=N+56EXQe4v8OdEw+LCtYioMwybp2wESB9AL08dzmOKI3CTRDfw+nKFukqiAmQ4ecP8b11e
	L3PYwNORgNORcmiHHo2CCJgm/vjaJzvDPWPqKaqUfOu8prm+G1BTzglMizyfVzNA1b5nnw
	GM6Z05OHJDSZmnJYTt23q6TMYEn5l18=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-wilKklS4O0qnbxyGVWyfwQ-1; Tue, 08 Sep 2026 12:17:10 -0400
X-MC-Unique: wilKklS4O0qnbxyGVWyfwQ-1
X-Mimecast-MFC-AGG-ID: wilKklS4O0qnbxyGVWyfwQ_1788884230
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-66cf1803125so6023148d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788884230; x=1789489030; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=biebLiR5oHGYPmQPO3uT20qG8Uw3pA9q7i4FEjIutYc=;
        b=o8jZIIZPRWrBSxnkA8WMAH81JD0kzuqJ+uCMVdpPwuAj3ZGQ4SkwgBdDt1RidZtwhi
         CX2QPytgH+uZhS5IuQe+bK7G4N8f2gzWzZlIdYFCZrxFUgJETmCRpG5hW0sje48E27eq
         MpbtYoSdVEdLuiRS4mXDSnFsv6+3uVrNctP5XLEV6vHqB7eMIyHlFoTB4z/zTO/B/ShQ
         qohXspEdCgNY2I291YDDs7LQleQSFQhizqEiquxHogpxaNJE+wngqljSdt1rleWiznuU
         TYGjEkDl4Wlftzrd/Uo6ycY95rOkh1ht8FuIPE09KK6Di/upOJKkelL+NCNOxld3CVxs
         Wk+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788884230; x=1789489030;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=biebLiR5oHGYPmQPO3uT20qG8Uw3pA9q7i4FEjIutYc=;
        b=rkqMYxHYJX3AWOJ8GMKStTPWTP9lXAv/y0m6PFaW9t6/3OwJ80p6bUIp58PJKBK6xC
         w4yWSIP7U6kXFMQJx4kUW9CZzuahcL/HxflA+GyBFAf4kAvpwyaJ4kYoPRaihWWWORnu
         spgXyySRqSm34ieAgf4kq3yFPzh2TRbT/lW4aby4mVOlwrtSZVls/EIMsPmu0lCYNo1o
         gJI4Nk+rb0wny1r02dPSi+KTx8rOek9Tl/ISB04sK1jtNCn0xrRkcUnGgMwLn2wy521W
         TYPC9xeBqiunFdbCgkGKeMrqZvR2p+HT0X5i02PFwT0ajGtb7KupY7PKWzLVUM7nuwfH
         rM1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwLP7Hm48wwZiS2GJQ2Eb//GKRzIzBIWN9shcDKs5oy5Rzdoa6bCCuvdy9MjhobsrLFpIWP4W0jKs4tQ4g=@vger.kernel.org
X-Gm-Message-State: AFuF++me2NUyjYipbmBMaYky4+L2zz5RxErgH2mhbSyjEzAEuhZq9Zq9
	jDsZaW/5WBva5uUl65lLvUR0DPfRchU90FUMRv1ZlR0fFZjedq7F+crWzRg7WLH0Pb4gsijVqWp
	mw9ordSq5jr+uOhAG5e/GTRk9Pu8uhsiNkud7U/K/Z+ZAXh9FkuYvONNz2xKVBTaCng==
X-Gm-Gg: AYBFou3MPCvwEMLHGuNFJEWDodgF2nVsil5/kj1F9bFL6T8Fywsy/8aooIZd/3uW7Vh
	SuIyX0yr6Xou6G/TRiOXXLxIq8I52xSjPiQ42cZuHVTfQMR1I3U9FDpKVGinYHL7uxxa4DD5GtJ
	Hu58/A8Evbf7WCvyG/Gt7XlMpBva+ue1K2JhAya+Bw0kq0+HUOelw+hhJyYMrbc9Qkw+ewwzNeH
	GoUY+FtrdsASXbFhYnV4nR2jE4MLhVUFVJiNPxYRE4QT2KL9NWZauzOtwmYluisD2Q5kd/cdj/c
	0/9jz3rG2QZyVFpsmtU9dGj0LCTA2km4iC2eZsyTJ6fB40VyJVN/38aiGuDdNW89W8+mpUehMHP
	CnFYp7qHjZRzlqC9fqpWpvjmxOIcJBEggw/nvB5uFpwpXOX/iGgXs3gbOKcWseaNpuZ9RqV1J0f
	IBkrdg8+OYsBp0kVB4Zao4
X-Received: by 2002:a53:c086:0:b0:66f:c1bc:c09b with SMTP id 956f58d0204a3-66fc1bcc6ddmr4966027d50.99.1788884229548;
        Tue, 08 Sep 2026 09:17:09 -0700 (PDT)
X-Received: by 2002:a53:c086:0:b0:66f:c1bc:c09b with SMTP id 956f58d0204a3-66fc1bcc6ddmr4965972d50.99.1788884228782;
        Tue, 08 Sep 2026 09:17:08 -0700 (PDT)
Received: from chaithco-thinkpadp16vgen1.rmtusco.csb (184-96-189-144.hlrn.qwest.net. [184.96.189.144])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040663a87sm123734166d6.19.2026.09.08.09.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:17:07 -0700 (PDT)
Message-ID: <0f3340facc968f1d911c637ef0d305c9282044e0.camel@redhat.com>
Subject: Re: [PATCH 0/2] mm/hugetlb Try to respect mempolicy when
 calculating surplus huge pages
From: "chaithco@redhat.com" <chaithco@redhat.com>
To: muchun.song@linux.dev, osalvador@suse.de, akpm@linux-foundation.org
Cc: david@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	arozansk@redhat.com
Date: Tue, 08 Sep 2026 10:17:05 -0600
In-Reply-To: <20260707182900.483757-1-chaithco@redhat.com>
References: <20260707182900.483757-1-chaithco@redhat.com>
Autocrypt: addr=chaithco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEapCVehYJKwYBBAHaRw8BAQdAORXHCioh8sg4JScf3G8JrmX1nUt+teTWsqlbk67dr
 va0NkNoYXJsZXMgSGFpdGhjb2NrIChXb3JrIEdQRyBLZXkpIDxjaGFpdGhjb0ByZWRoYXQuY29tPo
 iTBBMWCgA7FiEEoln/+dhdP2hiiZGQ86/NNaAhFjYFAmqQlXoCGwMFCwkIBwICIgIGFQoJCAsCBBY
 CAwECHgcCF4AACgkQ86/NNaAhFjbm1gEA9t0Iaxr6IkGONOjD7eB10PjTYyDGVd4QdJYPohP8xRsA
 /0OETJIGSr5rxRqG23AGUdlnUfzFlgm3QuyfNpGHcv0C
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-CmIuoRvvvnKZ0ZKUUcy9"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-CmIuoRvvvnKZ0ZKUUcy9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-07-07 at 12:28 -0600, Charles Haithcock wrote:
> Presently, when calculating how many huge pages are needed when
> reserving surplus huge pages, the global count of free huge pages
> is used. When reserving with a mempolicy, the global count of free
> huge
> pages is used even if some/all of those free huge pages are on numa
> nodes outside of the mempolicy.
>=20
> Reserving surplus huge pages is ultimately best effort even without a
> mempolicy. Restrictions from cpusets and mempolicies further
> complicate
> calculating correct numbers of surplus huge pages to reserve and=20
> maintaining which nodes those reservations belong to (see the comment
> in
> `hugetlb_acct_memory`).
>=20
> However, we can do a little better when reserving surplus huge pages
> with a mempolicy. This patch changes how to calculate the necessary
> amount of surplus huge pages to reserve by considering the max of
> either
> the amount of free huge pages on nodes in the mempolicy or the global
> amount of free huge pages. We may still attempt to reserve huge pages
> outside the mempolicy, however, we end up being more likely to
> reserve
> from nodes in the mempolicy.
>=20
> - v1: Modified `needed` calculation to use `allowed_mems_nr(h)` in
> order
> =C2=A0 to consider free hugetlb pages in our mempolicy.
> - v2: Folded in Joshua Hahn's recommendation [1] to further modify
> =C2=A0 `needed` calculation to take the max of either the available
> hugetlb
> =C2=A0 pages in the mempolicy or the globally available hugetlb pages.
> Allows
> =C2=A0 allocations to prioritize nodes in the mempolicy but can still fal=
l
> =C2=A0 back to offnode allocations. Also added selftests to check only fo=
r
> =C2=A0 the edgecase which caused this to initially be reported and sanity
> =C2=A0 checks.
> - v3: Split the change and tests into separate patches and clean up
> code
> =C2=A0 to better align with kernel style guidelines. Likewise, fold in
> Usama
> =C2=A0 Arif's correction [2].
>=20
> [1]
> https://lore.kernel.org/all/20260602152022.2673803-1-joshua.hahnjy@gmail.=
com/
> [2]
> https://lore.kernel.org/linux-mm/20260624144600.8159-1-usama.arif@linux.d=
ev/
>=20
> Charles Haithcock (2):
> =C2=A0 mm/hugetlb: Prefer mempolicy nodes for calcuating surplus hugepage
> =C2=A0=C2=A0=C2=A0 reservation
> =C2=A0 selftests/mm: add surplus hugetlb mempolicy reservation tests
>=20
> =C2=A0mm/hugetlb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 42 +-
> =C2=A0tools/testing/selftests/mm/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +
> =C2=A0.../selftests/mm/hugetlb_surplus_mempolicy.c=C2=A0 | 491
> ++++++++++++++++++
> =C2=A0tools/testing/selftests/mm/run_vmtests.sh=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 1 +
> =C2=A04 files changed, 517 insertions(+), 20 deletions(-)
> =C2=A0create mode 100644
> tools/testing/selftests/mm/hugetlb_surplus_mempolicy.c

Any followups on this? Please do let me know if I need to do anything
else to help this patch along! :)

--=-CmIuoRvvvnKZ0ZKUUcy9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSiWf/52F0/aGKJkZDzr801oCEWNgUCaqA1AQAKCRDzr801oCEW
Nh2dAP0RhTUkLY/ZXEagxLRS3qw+NmM/NsgO63pwcBk6CqLfwgEAuV6RgVQFNBd7
xyJ4ZSiOAN4LL3qxSB2uJu7LCTUwFQk=
=WurH
-----END PGP SIGNATURE-----

--=-CmIuoRvvvnKZ0ZKUUcy9--

