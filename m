Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F37E390CB2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427249; cv=none; b=XqStAjW3Vx9Ouj0Z6aMCbtu54oxMcfW9/IDnQlAhiGmTwQB2Kc15WXkymr3+aMGUMX6mVr/lAkb6zzbYFQre1qXCWvfu8eH0AKQmnBJ/crnfsuEHqRavFtAzJw0N9LJjpG6Q5E5cezWRhZRjLDFavZ7d/ZZOgKQWmVE9W1KVKLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427249; c=relaxed/simple;
	bh=dSMtB+TCP92OMxOvFhinH8K+kZciQlEBHBVLratOMzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hv78INWlUE7F/2ZwNJWcKhykIs6+8lD3Pqk9blFp8ykPbANg+z6RCU2raHooB96Pr4bkx/BS4k11uO9xy5QrWUTCIP3qQoJDq/lhn9gFJN4OkE74o6MmnCnvsdEMFvK1UWcTB0mIFYs6kyBA0HdwBo5NuW5K1yrhRW+cWPmRIs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NeXteBq7; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NeXteBq7"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-482f2ee53e7so1307741f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 02:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788427245; x=1789032045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vFqwbaUO8ajLlDZU7UCQW1v3q9ppgqy2c66ladFQ9yc=;
        b=NeXteBq7ivObf53sXpZX4e/Ql+rY7ABMYD1CKmQXPuGBDsJX5cHl1X2MPVaEm/FVC2
         4qPCksVcfZQAydVEwCv9lI9NwQiJFcTdyoMBXxaDF55j8E8rPxqlqOmzMejzfshUJjD8
         5umvTyvimnfBYne7+Bv20fKhO2fb/uZL8elTXybzTymnm2NcNmSVrWSv0gwoOuVqLw0v
         RXAZ3ZIwGHQqcu0NGao+JALOpkX3oXatUelNRat1CKzfklkClvfc/1wCKc0r2MyfXRZF
         9d+fY5jQB9p9yLNEUvNLDykPyhWICKN7cb2NCSGBR3ZeN3M9pbiE9Li4CkFM0IBJCQLu
         i1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427245; x=1789032045;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vFqwbaUO8ajLlDZU7UCQW1v3q9ppgqy2c66ladFQ9yc=;
        b=bXhWSqCMNC+F7Qgcl61VMItGcj6fq2rFsXzadhh+jyoINJ61TAbtA4K82Z3tMBr1bv
         41Uvj/Fa5lPalOkBKlc/ByuISUCdNkFBF4RwV3tmjVVSb1woGTwr5/T6Rex5mUJaHCNi
         wUZh+uoODTTKzxflJlrlqLMpYUhIIlt0o1Dn0beX1Edc+1KDyIWOBvDyn6QvR6YboJ85
         BRDK/OztrEbYFYBcTN2YYpysen9Do0MoWsqxS2Qo6pJMBdQUIzCa7WT4xPyg7YGU+HUz
         mPRZYqEZ390xtm8uak8pGZcTCiWYOfr92QrzJtUBynjGulqHBphguOy5tbDRDPV9y18f
         Z0pw==
X-Forwarded-Encrypted: i=1; AKwUvBxL1qHcXCt4kumJYVfnSSFEWK0PMUqr31lMNO9o9ispMSnXJoqk8j6ijRFsizoIncbLuU/GYZFyAfovwCw=@vger.kernel.org
X-Gm-Message-State: AFuF++ktyocH8diGvGelLG7+y9Zprypk8bbYyXjMEG7d4cz1ww3cAktA
	yXJYfji6a6rm+DDxQ32IgePiliQmo/BJkjPVDDh3gSgvFLswE0Y0A/TFKce4J0p7H2s=
X-Gm-Gg: AYBFou22ThO6I2F1T5Ze8AKKL5rgRbd7EnF4sUJDaPKvd9CS0WgXnQOBfoQztk8HE2R
	a6N7Wj5KFoWvwK6SSb1vmrJaD6hRNd28bZWyfjUbV4Gn3Nn/O0KH3u2yVeKgEVjC6/5K+r1poZh
	DNXT2/ytZtTLD73P5eQQWbEKwpP4wUNpszg/2lw5ZAahKWb+M5bJM5QYFP6aMBKssfQeLP7KWYl
	EEGlUH0SkIhQRAOGVq0UfSbgXRIMgGS8Yqg8ocl/XJQJptQ+VZ8+WgADgfIyAaC7ZSaI05cTQWL
	edce+llx0HK3Va+0wf1sG1+bt80aTZbCd5t6WIxSSR4hJ6ZXzBUf6Ef9lRWk+bMlNkS2dNq3ztZ
	xOp3QE2pagchyzqXtZqcKc4SFY9QiYdAQRAxzYprLjnblJJfTy58DKnA9wqxqjD4y5wR9UhsESv
	Mda/8OUu60joaQA0sITHwhGHo2fjUbpp/P1tPGoy9i215dz/qI43ZFa7JKEK1MGZE=
X-Received: by 2002:a05:6000:2c0a:b0:482:d94e:f33b with SMTP id ffacd0b85a97d-4847b620f94mr20317856f8f.0.1788427245506;
        Thu, 03 Sep 2026 02:20:45 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e800cfsm12140789f8f.12.2026.09.03.02.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:20:45 -0700 (PDT)
Date: Thu, 3 Sep 2026 11:20:43 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Qinyun Tan <qinyuntan@linux.alibaba.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Lance Yang <lance.yang@linux.dev>, Qi Zheng <qi.zheng@linux.dev>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Dave Chinner <david@fromorbit.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	David Hildenbrand <david@kernel.org>, Xunlei Pang <xlpang@linux.alibaba.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/list_lru: don't copy stale shrinker id from
 non-memcg-aware shrinkers
Message-ID: <apktMn_hwvZwsRUG@localhost.localdomain>
References: <20260901115104.2944996-1-qinyuntan@linux.alibaba.com>
 <aphXPCn8isUVV87k@localhost.localdomain>
 <0c5aba0f-137a-4aaf-bddc-060118322602@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="alzhxiaviugnzwzs"
Content-Disposition: inline
In-Reply-To: <0c5aba0f-137a-4aaf-bddc-060118322602@linux.alibaba.com>


--alzhxiaviugnzwzs
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] mm/list_lru: don't copy stale shrinker id from
 non-memcg-aware shrinkers
MIME-Version: 1.0

On Thu, Sep 03, 2026 at 12:06:53PM +0800, Qinyun Tan <qinyuntan@linux.aliba=
ba.com> wrote:
> You're right, that sentence is imprecise - SHRINKER_NONSLAB shrinkers
> do register per-memcg under nokmem.  What I meant is that on a system
> where no NONSLAB shrinker happens to register, shrinker_nr_max stays 0.

And ideally, with cgroup.memory=3Dnokmem no slab-based code should call
set_shrinker_bit() with whatever shrinker_id.

> That said, I see the flag restoration and this patch as complementary
> rather than either-or:=20

Yes, it fixes your immediate issue and it is a prudent approach in
list_lru_init(). OTOH, with this fixup, we won't be able to learn about
shrinkers that are missing SHRINKER_NONSLAB.


> other MEMCG_AWARE-but-not-NONSLAB shrinkers
> (superblock, workingset shadow nodes) still take the fallback path
> under nokmem by design, and __list_lru_init() copying an unassigned
> id there is a landmine independent of the deferred split case.  So I
> think this patch is still wanted as the generic fix, with the flag
> restoration on top for THP.
>=20
> (zswap might deserve the same NONSLAB treatment as THP, btw - its
> entries resolve the memcg from the folio's objcg, which is available
> regardless of nokmem.)

_That_ is an important point.
So that would need a fix too, and likely Fixes: b5ba474f3f518 ("zswap:
shrink zswap pool based on memory pressure").

(I'd have preferred if there weren't Fixes: 03375203e1da8 which honors
the SHRINKER_NONSLAB semantics and it only uncovered pre-existing
missing flags. Or keep that Fixes: but explain the relation to the other
commits. (To make it clear to backporters.))

> Would you like me to send a separate patch restoring SHRINKER_NONSLAB
> in thp_shrinker_init() (Fixes: fafaeceb89a5e)?  Happy to do so if
> that works for you.

SHRINKER_MEMCG_AWARE are due to be checked for correct marking with
SHRINKER_NONSLAB. I can see that it is missing in: thp-deferred_split,
zswap-shrinker in the v7.3-rc1. (The shrinkers in nfs42xattr.c seem to
be slab-based so they're correct.)

The shrinkers mentioned in your original commit message:  workingset
shadow nodes, superblock lrus are both slab-based, so systemd with only
those shouldn't be affected by this bug.

Thanks,
Michal

--alzhxiaviugnzwzs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCapk75xsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AjkfgD/alsyn9uZiiCPsdyNhqYv
Yn9T8TQGEeq86BTyrTIkQ4sA/1ZoY1P6ugpHG19ZGQ2G7ElBR1IKYhR/43jXdA3B
XEkK
=g9WI
-----END PGP SIGNATURE-----

--alzhxiaviugnzwzs--
