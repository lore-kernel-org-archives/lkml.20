Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893982F7EE4
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791809142; cv=none; b=CDpU6U14zNq2CewMv0xRym1zx0T7C4iVck/+h/GBDeWQwrZaQBgjen2DFvsDjCw4utsWJYUcag79uFBvWk0+vk1tdn0PQg+uVC2EWsJlKQqUwlDV8TiARqe9g3Ce5q7LVd+zxiIjZanBlhSI0pL6KeG5qUIp+ZbdWTNExEOTvJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791809142; c=relaxed/simple;
	bh=Gz/v8fFmjlJ/nOXeGfucNPqVrqLu004q7AExsn89kQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fp8LffZxBuOdQzzqLMeojZjQexuTO/MBEnEhTfhlLCVK65aSLIJ0jTSOWeKM1rh87kLK2ZNhyYERHZaGtHWcNgiUNvKvQHakiq584pZrilfnKLwFTq31iuRyQEM626fAGeYcfQuD8p5NRvuXr+zun5R26DMvj/CAdtCF6UIh7Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Dmur+PDC; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Dmur+PDC"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48b001cd92bso1045107f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791809138; x=1792413938; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=an/ERodSzuEqefgQ6URo9mMgAyarZVhVNb5a4ABoOvI=;
        b=Dmur+PDCAXMswbkxjMhtjFQm1aFi7pMxNACn3wDH2JT07Njj0pmsiLmnsuHYjF53UD
         zgqtitUtJu2v1DFYoFXqrhllVTcuApWCfXiBvcP++gdEdkqtxlgM1ytfb3+VP+VmNUy1
         afEd2XtqpXiKo1Q3Ak0E3n9uSi7qUYIsBkXH5TsGuHj/fL4zAzY801oicX1a370TOA11
         AeHezpmb4D9+Pe3vSDHf+X411dEAXXsNjXQ1A/vMsottUxY8VpqF7OpTfZ4XdJa9bg+b
         uM/vDsTe48k6inugRIaM3p6p1hNABm/TIjlsRyGCVWenVuLvgYCJuCHPaFf1L/d4bsiF
         r9Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791809138; x=1792413938;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=an/ERodSzuEqefgQ6URo9mMgAyarZVhVNb5a4ABoOvI=;
        b=XKM9h0eR/CoYtGU5VkyaqaLA+AkKwH0qXhogLri+lHREbXq9RJg3VxrC8CyXaRpweX
         RIPcJP6UyNrJj//fWVEj39a+13O0CW7MeK0pBts1/WZ5xA2qQ+LFYc3yc6NmJ2JxwEC2
         7U96rM3D0GrfYe8FR7QibwhdST07Hqt7Q5spzjZvNU+6eQhDMom8cmRsw+A/m8JU/YiR
         k6Jk6VR82I7DqgL5TrC5wDm9TNRTCY5RaM0CLPe9RGfFzjBo01Lfr4mRubAZ/Ngr3lEG
         mrJYHTyG2ozg9e7lPLWDW48UV2D5h2Ve5YKPI9dHqdOm+Xg0t1oWuUtvG29V+kXodXrg
         EgfA==
X-Forwarded-Encrypted: i=1; AKwUvBx7b+8n48UgLEWJN7XH4DTDyZXY5cpSSZ9+P3Kro+f+dMKxI0ubDuyzy88zr8vdzgJ69PaFMeUjumCtthQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEhzCjNxjv9pdsJuSVWMsadR9zQw+o5JDoVGKXkazVo7HIGH6i
	Hefbl2+og1h47ygj7nZUPC3/ogOucfvOUeR2aM6wVS7+roHehESKc/CjAMEvYklYnwk=
X-Gm-Gg: AYBFou1hlgGaEGZWgXByPJ7NXsTRi+iYAc28fkMVViFbJh9ZR6PneGrFR2B7OdpGa6W
	ZuL554N9AJCD0kLhm0EzZepy0gAKNEI4Ndk63MF33P6bzJebtjcMQl1PdE9df3cbwWCg/5eyWaN
	pjoYsycaLH+H9gCQ5G+z2qMpnlO3Odn+dQTrP7/fR94hgN9kKFMYKAL50jBEhLS6sgNTtjuDSoX
	70rXl+KmdrUfpXluIhblFa16Hr/FOJEfkhwBWLoJcfeiu3+/FiW6KUTLnQtpnQFqpMPNugy7r4L
	EN/lerZYESEjqLkP0mh9nCzJM+8PyUFMKdhqkHAC3vQXJWllX3wvBx+qNiNU8duOeD9VMHrXPKH
	jniG/22VDbvaA9eLPdYcg9BgDi649OjdjR2ZRAAN7G0SmIj2GNqIehKDARXH2RtfP9jVxjHJ++E
	7HDr9iTa16MjjAUIRv1bXZHA3Q5/NqXbqVCn8MNeL6l+AJjII2D9IlwK/jd5jhupsEuhm2oDdR0
	g==
X-Received: by 2002:a05:6000:298d:20b0:48c:43a4:37f2 with SMTP id ffacd0b85a97d-48dbaadb3f7mr12969989f8f.17.1791809137549;
        Mon, 12 Oct 2026 05:45:37 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aadf9bsm18884941f8f.29.2026.10.12.05.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:45:37 -0700 (PDT)
Date: Mon, 12 Oct 2026 14:45:35 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Tejun Heo <tj@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "T.J. Mercier" <tjmercier@google.com>, 
	Amir Goldstein <amir73il@gmail.com>, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: memcg: don't close an uninitialized fd
Message-ID: <20261012-clumsily-chivalry-c652481fc90a@there>
References: <20261011223358.2327625-9-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gylt5nk4uhld73ur"
Content-Disposition: inline
In-Reply-To: <20261011223358.2327625-9-sashal@kernel.org>


--gylt5nk4uhld73ur
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] selftests: memcg: don't close an uninitialized fd
MIME-Version: 1.0

On Sun, Oct 11, 2026 at 06:33:37PM -0400, Sasha Levin <sashal@kernel.org> w=
rote:
> test_memcg_inotify_delete_file() and test_memcg_inotify_delete_dir()
> jump to cleanup before the inotify fd is created when cg_name() or
> cg_create() fails, and cleanup then closes whatever fd holds:
>=20
>   test_memcontrol.c:1685:6: warning: variable 'fd' is used uninitialized =
whenever 'if' condition is true [-Wsometimes-uninitialized]
>=20
> Initialize fd to -1.
>=20
> Fixes: 2de27980e1d46 ("selftests: memcg: Add tests for IN_DELETE_SELF and=
 IN_IGNORED")
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  tools/testing/selftests/cgroup/test_memcontrol.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks too,
Acked-by: Michal Koutn=FD <mkoutny@suse.com>

--gylt5nk4uhld73ur
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaszWahsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AgD0wEAmh10oDQEWn7n0aEJYbBb
uaxG6lg1fY/9sjcEXSxbRKgA/Rt/e9OL/XTpEvxAx8DVCCsJgZnLdHG4SM+IuwrA
BLAB
=3bZl
-----END PGP SIGNATURE-----

--gylt5nk4uhld73ur--
