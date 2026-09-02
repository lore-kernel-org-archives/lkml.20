Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B97C3DA7D6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 17:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788369453; cv=none; b=MY64Bynh5kZ3p5r5+J95GNyM3N4ZVqSTKAMdrFRNaFwAnfhajQ6ryX/m7GFl98lsjZ54H8SMX64yDzQpIqegejNmnuu/UqiYmn1Xk2ScrV3WRg9UEet7IYcpX6DAbFZujJctMdKeXKNkCNeEvyTDkRmBOGaMzN/XoFwRPcIYFaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788369453; c=relaxed/simple;
	bh=uUY40fzXDsOjxmveQ5LycP1AAWERj75mXf8gm2w3bQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IHsReanhEqAGfCtQJCVDfxy3K5bDDl6jiDQC77SV/+mSkt2Fy40/tBgP4ErTwzCUtfE/ggAl91L1OgmcYeo21szTLNpLJnUINqxHr6GljcGQrqgRnf+dgJ/xPYIjK3Ddn9l9RbxJK4pPC/VQeHkC47JuqkRt0Ii1vDJoUe2kj+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fK/Ih8DO; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fK/Ih8DO"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48433e9562bso256584f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 10:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788369450; x=1788974250; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L+uQOUfDo+TK+k3hTP6A5HxoVxFH7C/0s0ldwdZGHuc=;
        b=fK/Ih8DO2jUglgD6CiRq2zGCDf+V3W174qRnsiF98mvkLu7ess1uuox1wq4CxPT7/N
         6T48Ebe33/Xz1KYQekFsGcyQ9YAsMhLZoYC5YSoM6spK+QdY0EOiVBbCKGcgCKLzp12N
         9Z7apRRYPat8yE1WLF4GpreHxRCz86QCN3bgMezIpJedNjH+KVO5EiwZSR3HfkE3lFqW
         Tg7srOnwX+jzNCiBkNwXa127kPtWmZS9tDWybGxVd2Y2XtCDGpPQJISdtF1jGbm489y6
         sTysP/gBXKxDyB41sqCyBmvAj47PvGKFGryNtMfsmEyQW4Gu9wF0nc2h0CtlowID8vym
         /9AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788369450; x=1788974250;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L+uQOUfDo+TK+k3hTP6A5HxoVxFH7C/0s0ldwdZGHuc=;
        b=UNL9Q2G5Omq0K9kVi2PiSUE/svPdomsWEpdj6brqLxOaPWOoElh7DHGl9sHF99kwGx
         Y6GKq3aPTS/GucSJ1np2VhUdH/ABwQO+QrvTK0Ddo4XbBQdq6Gv1T2Npi01IGCm6R4Iu
         DypNAXpnSUd7wimlAZeUlvy+J2+z4hmkkoGMJvxgNc5qe4d1L1r85zgKnILirrh83yIM
         XL/W2sX27vKNLDtS11YM/zoXFOLLBCpzAqJ6XitqnqkUyUW41XqnilmSnqaIM3x3ETeE
         4GGopB7UaJg/P14+3eN1OOgFsdKexoN1dkK+IDOuWMRrkqzkIYpaLHhsQRI2bXZ7VSDI
         rFDw==
X-Forwarded-Encrypted: i=1; AKwUvBz+d1/z+HzdHsrJBaeUiGd82yd3X9m89XpFShnvpmIoaolgsfDh4K37sSg1Oxzg2mF83RJirc9UY//UcEo=@vger.kernel.org
X-Gm-Message-State: AFuF++nJCjVY7dJ3hxM3SI4gWdT7/iqX1cHYQkkqTxuWE5XexWv1ziqG
	xet/FifrxbsBO1Ikd0S+nj60lNQgMEI3pqfhZZXprEPj65biqm+K5MZ8G7L1PyAEPsw=
X-Gm-Gg: AYBFou3pW3/AcamOzLNevR+liZBgONpvNtFdg2bAL/jBMIZh5+bV3kyPqzi8YGf2gcM
	ev7V+kyPdSxKWJ9dh8SUcWjCBfTuqE99FfvCvpDwN27dFsklIe+x4qeyx4L+EbsIsQ33O1/kpd8
	kIsP3V9urg5Ua32SZsy7hgAZPk0PGN+2MxR5d06VuDNRqLZSg69C3q35Xnr0MSQs5Y2gbVXuuT+
	Saet0+GjJ4w0hFFnMJmob4E6hPXv2YQIpTpW7qR6lQpI49hUnmZJxnOfhOWWYvCNhR5f53+FaNB
	GFmBNkTLRSvNfdy7+NEzcFhDnpHgJPkqIy5Dn/pTFWtw3WyJeMPNHVovQ7vs9XrbCG0q+EUzyvY
	Zb1bduhV1f7OGzWdDXu0iFjk9DchPlEFbeuYf56Wo65ihNH34DVzEjyzyVZk/1XQItGimifTONs
	Qr0i5vEF3xCvn6pdZnxJk8SKBq7fZeBRVvmeYmPoY6JkOdXQvQ/hvUmfk8EvKngvY=
X-Received: by 2002:a05:6000:208a:b0:484:3310:f394 with SMTP id ffacd0b85a97d-48488f20c54mr10977496f8f.23.1788369449677;
        Wed, 02 Sep 2026 10:17:29 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eea5b4sm7848460f8f.27.2026.09.02.10.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 10:17:29 -0700 (PDT)
Date: Wed, 2 Sep 2026 19:17:27 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Qinyun Tan <qinyuntan@linux.alibaba.com>, 
	Johannes Weiner <hannes@cmpxchg.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Lance Yang <lance.yang@linux.dev>, Qi Zheng <qi.zheng@linux.dev>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Dave Chinner <david@fromorbit.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	David Hildenbrand <david@kernel.org>, Xunlei Pang <xlpang@linux.alibaba.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/list_lru: don't copy stale shrinker id from
 non-memcg-aware shrinkers
Message-ID: <aphXPCn8isUVV87k@localhost.localdomain>
References: <20260901115104.2944996-1-qinyuntan@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dutiu445lzpgkhp4"
Content-Disposition: inline
In-Reply-To: <20260901115104.2944996-1-qinyuntan@linux.alibaba.com>


--dutiu445lzpgkhp4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] mm/list_lru: don't copy stale shrinker id from
 non-memcg-aware shrinkers
MIME-Version: 1.0

Hello Qinyun.

On Tue, Sep 01, 2026 at 07:51:04PM +0800, Qinyun Tan <qinyuntan@linux.aliba=
ba.com> wrote:
> With cgroup.memory=3Dnokmem, shrinker_memcg_alloc() fails with -ENOSYS
> for shrinkers without SHRINKER_NONSLAB, and shrinker_alloc() falls
> back to a non-memcg-aware shrinker.  On this fallback path,
> shrinker->id is never assigned and keeps 0 from kzalloc(), which is a
> valid id belonging to whichever memcg-aware shrinker registers first.
>=20
> __list_lru_init() copies shrinker->id unconditionally, so every
> list_lru backed by such a fallback shrinker (thp-deferred_split,
> zswap-shrinker, workingset shadow nodes, superblock lrus, ...) ends
> up with lru->shrinker_id =3D=3D 0 instead of -1.

<del>thp-deferred_split shrinek has SHRINKER_NONSLAB so, the id should be
assigned (at least I see it in thp_shrinker_init()).</del> I was looking
at 6.12 kernel.

> Under nokmem the list_lru collapses to the shared per-node lists, but
> __list_lru_add() still calls set_shrinker_bit() against the memcg of
> the added object.  Most list_lru users are unaffected because their
> objects resolve to a NULL memcg without kmem accounting, but the THP
> deferred split queue holds user folios, which are charged regardless
> of nokmem.  Since no memcg-aware shrinker can register under nokmem,

Not sure I understand here, the SHRINKER_NONSLAB are excluded and should
still register for per-memcg info.

> shrinker_nr_max stays 0 and every memcg's shrinker_info has
> map_nr_max =3D=3D 0, so the first folio added by khugepaged triggers on
> every boot:
>=20
>   WARNING: mm/shrinker.c:212 at set_shrinker_bit+0x99/0xa0
>=20
> On systems where a SHRINKER_NONSLAB shrinker (btrfs, xfs) did register
> and expand the maps, there is no warning; instead bit 0 is set
> spuriously for an unrelated shrinker.

Could it be that you see this issue because of a shrinker which isn't
marked as SHRINKER_NONSLAB?

I'd even go as far as pointing at
fafaeceb89a5e ("mm: switch deferred split shrinker to list_lru")
which removed the flag from the the thp-deferred_split shrinker.

IOW, the proper fix should be addition of SHRINKER_NONSLAB so that
per-memcg maps are properly allocated.

Thanks,
Michal

--dutiu445lzpgkhp4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaphaIhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AjwxQD/f1S0abo/AyOAeW4+/VMQ
3+TWP2Ib8ZUBGnI7zXfsbJUA/jJ726jOpW+PD/iuyLKMLOLJKQniOor6aBrBChcp
74cL
=fIDH
-----END PGP SIGNATURE-----

--dutiu445lzpgkhp4--
