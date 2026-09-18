Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFC81E5B70
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789718306; cv=none; b=WjNRPDYS4WY5y+mSrjZVdkjNzsaruCH3IFr2RKnh4GsrDlsKkRwAnAWM9m8sXVie9MY8JSdjDf5BKI+iwR38O4KpahqW8Ev2GgyTs3pyN+Jg5OUF867uC5GN2qJHbHl6mLpNbCoGsS886F+S6u3qjPOqPNRXbpADYJSerzl61ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789718306; c=relaxed/simple;
	bh=/z2wgDgimcZIfi6KUkr3H28lBp+LYcX+PMuNB+uct+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n0/bfpUeMvD7rARsg/A6/sYGe+sKopOojfWbUbWR3VpU4CjEe4OHNW90iqLzI4LgKUHSF+uuq8N1ZeOv0lK4JKH0LNPFKbRXxxbuw2HsWYGw5hPv/MaxMtF5NIZMPjls1hDW6n0+ScZVDsvmoyOFwJmgyADcvYymXrrMTF4DGIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UuHrxIyg; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UuHrxIyg"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3920so3048515e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789718300; x=1790323100; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dV9H14tWbd96/qCJ/vqD0rQ8aDrl9j+AsefZpIAGXFA=;
        b=UuHrxIyg6as0maU3zb4v6jr/oDZfB76LnL3OcjULMKJ6KhJfBcvXHV3C/ksvhZdz0E
         MmWJrt5ZU8H4avTbBvdkRhzPHgHAttnn8CqbnxxzhCCmN2EMr6n9idBKwNyPvdd3J45M
         uX6oQJ3nX81gQ9xSNeEUMKdlzjSMg9HIIY7HSYH3Xi/bmdVJD67+aCjagDsrWYn5BnBr
         TJ+KUDfxVJOYKgWUNAjPCnqyy+JigD9JniR9boW5z+WwLSizYgxLSCNCnAalOizxvp/9
         yYWa1zg6G9car3hB6FAqvsTqffjNxH04hHK/UDasNzzeoqF8i9FQoY0fb1MRC/jLEs3f
         qMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789718300; x=1790323100;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dV9H14tWbd96/qCJ/vqD0rQ8aDrl9j+AsefZpIAGXFA=;
        b=ISl2U/retAzEJMpYEY5q4LYQbxflbONwK1k6SEtx2X+6Rt7U8hDr1bseIWQelAIw66
         KFEKQ1JsDnWn/vy8WTx4kO1YgwZcsO3fvTG/zkqWYF5HMAfKzcaDkxjisLlqLa8kuzEg
         0zUn0uLhIKIKIjU1DYsAHmVCCTGi7EbHOVCDTHkaAy6yi65SH2FR2HnqyOJEIVgr7C6W
         NgV3rjcyUo/9nqVAKHYmxsERpWk0QwcZqxz+TBOoxy838DeH56qPMT0oxu57CfWR5ra8
         V5qBy9ym8fJwkaisttGBXCFRH9hbMurFQhvLhpClPvwym0ceSbejjKvBqzrreSvs+loj
         glsQ==
X-Forwarded-Encrypted: i=1; AKwUvBw7bx4Gx/HZ/qYFJC3Cw595RxHOl0hFI7CF/kZ3RI0v+yMU1eVYPRs8KVXCMixplF6VrC2SyW8YNY8eaGw=@vger.kernel.org
X-Gm-Message-State: AFuF++lNtP2nopC8IM2oDy/EOlQgzMJg9NbwMfGCD4/HkXBRQLWp6tle
	HHVUVMiBEQe8F8et7cXU5d9rLKQGFrqe4jv1Rg0cSgb+dVDo5xtg6vn8DBRVW9MiffQ=
X-Gm-Gg: AYBFou35nCyhGDXWcY7Ps0CGzHP/cIkxv9NfnZ4drZgx1tvf4Z+9ktlmjL9/psLaZ8Q
	Y8nOQlLTRIyPRgfGeRyHkgVXSaNFtJJdk7jV05xBR+ZB60wXRl9kFvRGOnfO7CLe81NKp7IEEaI
	tovuuagi6a3Fh8gFpn/XU1QokGVSKH2gvKQkw6K+Kur1H/8axAGsn2FFW5X4Y1TZg4Q8Gyr/6+8
	FdxKWudmU03tyWkpsNYaee3CsXB9EKVRbFLsHM7zgMvtBSyjJWtSsh8b7iNcLk4t0zKrxpvzf2A
	PCKWu2W4dcBq3L+dyqsqhZmMdwyWqe0/iJnz4/1n2IHtxQVZUYOEJnrG3z4jBh/3WvpnyuY+6hD
	xu211qad4FyoQNY0PUdpZLsWQwh3ZTIMpm8kzUD9aiQ4gLEg0VTWcd9BoUeniQHm/VrIh/Ta5z0
	zeZOR5Q7Lg897CR+x+8odNaJW/Xev/dNRb1Gsw642vvrLcYXI9Bo2m49Wfubz60jlLapvvBqZIt
	0YVPQKXaj0V
X-Received: by 2002:a05:600c:8518:b0:49d:28c4:b304 with SMTP id 5b1f17b1804b1-49fc5741563mr18804255e9.29.1789718300499;
        Fri, 18 Sep 2026 00:58:20 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd204d89sm160372235e9.3.2026.09.18.00.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 00:58:19 -0700 (PDT)
Date: Fri, 18 Sep 2026 09:58:17 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Maarten Lankhorst <dev@lankhorst.se>, Maxime Ripard <mripard@kernel.org>, 
	Natalie Vock <nat@pixelcluster.dev>, Tejun Heo <tj@kernel.org>, Oscar Salvador <osalvador@suse.de>, 
	cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH v6 0/5] mm/page_counter: move stock from mem_cgroup to
 page_counter
Message-ID: <aqzulM8S63363Tr1@localhost.localdomain>
References: <20260916210552.891730-1-joshua.hahnjy@gmail.com>
 <20260917175701.2343946-1-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6tot43pwavmchhic"
Content-Disposition: inline
In-Reply-To: <20260917175701.2343946-1-joshua.hahnjy@gmail.com>


--6tot43pwavmchhic
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 0/5] mm/page_counter: move stock from mem_cgroup to
 page_counter
MIME-Version: 1.0

Hi.

On Thu, Sep 17, 2026 at 10:57:00AM -0700, Joshua Hahn <joshua.hahnjy@gmail.=
com> wrote:
>=20
> This is true, but this is already the behavior for vanilla memcg.
> In this series I'm hoping to preserve all existing semantics without
> changing behaviors, so I can fix this problem in a separate issue.
>=20
> Specifically, in vanilla try_charge_memcg:
>=20
> done_restock:
> 	if (batch > nr_pages)
> 		refill_stock(memcg, batch - nr_pages);
>=20
> ...
> 			current->memcg_nr_pages_over_high +=3D batch;
>=20
> So I've just preserved the exact semantics that we used to have before.

Kudos to you for the conservative approach.

>=20
> The problem isn't that big anyways though, it's a transient inflation
> in memcg_over_high and will be wiped on the next high handling run,
> and there is no effect on accounting or permanent inflations.

It reminds me [1] where stockage imprecision could even trigger OOM but
it was reportedly only visible in LTP.

HTH,
Michal

[1] https://lore.kernel.org/all/20250530151858.672391-1-mkoutny@suse.com/

--6tot43pwavmchhic
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaqzvFhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AiyGQEAxBEcNkVlUsFJunbUaXyj
fCr+UQ4r8t6S3GNeKJPgiYYA/3Gky8F7pWf3EmNRaSTu35DLuveVmYfJTnxV3o4s
qHYK
=tu6R
-----END PGP SIGNATURE-----

--6tot43pwavmchhic--
