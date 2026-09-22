Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC4D43F0B2
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066003; cv=none; b=RkqjgeMD6A0xeVTGyvIM9se3oVuYQXZ4UeI2zv7p5z3uneOkRo/BSPxwtcDIt7GID8rh5SvrdHJFlhgHMe+3ocRnWajD5JYPkbQm6bbBdTmnLUOmkVnDNHNPwkRhNOANS2EFv0qubu+yfJpJhlbQbJXOIWvfrrwx6I5Toz1Ob8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066003; c=relaxed/simple;
	bh=zEomBp/JAYre+ACaiHStIXFRKfBN3mk/YZOtMfOIzaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lL5xW76ecCn5sTDjJJV6pTDVXQW+YImWXKzXX5AKyzkGbtilnJRKnwjVQH9H6hsvBWTSgQGRg+IGp7j4KltzxL93/aZN2MmNTiPAkPNkJz7pqlMPAXGxUW5iLHGlVV7tipZWFEUammVWX9Flp5gAHcK7P+pYfETq2tJ1lPKbQBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=SDFVaqqZ; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="SDFVaqqZ"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so37263035e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790065998; x=1790670798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uU9EGsP0jhjlOuyY9ffTaiqx8NHl2A4tqCF5zEPkwzk=;
        b=SDFVaqqZfU84z5zv8A0dBFvjQ5ivbjNkUHmEJ7qXw4RP033lXmvKCIDV0XMZNXCfRB
         ui/pPwbTZABAxe3HFMjfc3b5p/QgarOU2p/jqEl4x5cmgAsvAXZZklTW3gw9MctW4B1w
         puOuBQA6N8M4qtoWTLlrbp3f7obYQIrRDVzCW/k8YGESOy49RuHBOzzkXtMA8z9VLPZr
         lh6zJXb11GaufjqWPGfATi+exGxn3U5GRs7jNkQNKNPc+A7Ukxr3e4UUTlTs6CseUm3r
         1yhGWo0otGrC67Y7qvaRzSed99ajmtn1bqBwcTF5aO4pohbI/xJBUDjj//vwpyALMepV
         U0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790065998; x=1790670798;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uU9EGsP0jhjlOuyY9ffTaiqx8NHl2A4tqCF5zEPkwzk=;
        b=atpy7qn6hoMQS0FOZFo6+7PX8wmHiehfM+b9AocKqDTjYXY28iFSwmM4Ocp7IMVOjt
         4mchu4tJcppjyJ/nflEHeLxbIed6zSG0XbltMgFe5QUjtXZdVovXR9QyaQ9vlGdKMHiO
         d+APVVbWp/pgjYKFxhz5M4U4cJYzldR61uGp4fQz0AuLPQ30wg+rfv5/MFjvR/NB8Zre
         WziL5GW3pI5BBmS+k8n7GsU/jXtjr4AzOyS4C/wiWN/K7/69nGFU+hzk5GPRinywce73
         E9krxO4ZymRhdDgDhk1SeZhkH5DGmGFF/NlREGOpKJxULrU/3jhrCFOhqOq8mzDP37+Z
         TUsw==
X-Forwarded-Encrypted: i=1; AKwUvBzBtoNLnTpZ4asDLBSxXG4KYT8YBNyjm/TO6sQV7p9C1jfB6m88XMPJct4LAEumEgwnZtBKKPvJqDaXpuE=@vger.kernel.org
X-Gm-Message-State: AFuF++kFcR9And3ioo5+x92WLasq/l/CErHzUQGCYzQRaciCO9jkOfdE
	JVdWGsJwSxcHH7nPPjupbQiOKVAU0nuM6jn1iAWjsn518ozH2/JZv5peJUvgTLqY578=
X-Gm-Gg: AYBFou2VenqyReH5oHGQ6ZLolYk2TVimzun05aU/e4koYdY1a8GiQdcJSkbEp1Z7jBp
	Mhi2RgD1TSRGZiNQxP9IiHbOJLuSztK5B68JDtqxyAo0Sj9O/0GhPqsNqmlBF+QC3BIVWmtAsRI
	J3OSz2Wys6PhgYcRXvlbOKRqJOU2XQIKuaY/6TqElXDIMpTefnc+k3T+Bgvjyr7/ufWqeBYuFxI
	CMvov2Nt+/CENYCB/LeGfivC0D+U8EY6NePIu3ZQnJmI5mnyNdhp07fvzW+YyjYdeMeZLRy374i
	Q7Lu2Jb4VQqsymdnR86I1aPrW6AYGpM4euSVvsahbHuAxZaVsNK7a86CBgwYvWgTHJn/Et2mg7M
	Sov8IXZfBvcrZ/5mQClDcu6Uh4uhe07W3FBZ5PUrwIB7lTOIIk3b6G2wyT1FeEdSHevxqkT/mP/
	3Xelk2oHjgJ+IW9dQGXjaQuBjkDiqx5qIxKCyaHB+QUc6LKa37qyyWD67ZQOMI3X6JZWRHU+HKS
	pH4XteqW5tavzAhr0/fuD6PamSFL1x9OUwgacxJxFsZgsKUHrJxFyZJFiziIg==
X-Received: by 2002:a05:600d:6503:20b0:49f:d087:6526 with SMTP id 5b1f17b1804b1-49fd0876705mr70277975e9.34.1790065997920;
        Tue, 22 Sep 2026 01:33:17 -0700 (PDT)
Received: from localhost (p200300f65f19a9041d0e57515b2ea4c8.dip0.t-ipconnect.de. [2003:f6:5f19:a904:1d0e:5751:5b2e:a4c8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49fdaaf0074sm32730825e9.3.2026.09.22.01.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:33:16 -0700 (PDT)
Date: Tue, 22 Sep 2026 10:33:16 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-pwm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] pwm: tegra: Check for match_data being NULL
Message-ID: <arI8vXaKTvEJi-Zd@monoceros>
References: <cover.1789741839.git.u.kleine-koenig@baylibre.com>
 <ed943d9be3b785514e0f65a5b8c13a78aba7a090.1789741839.git.u.kleine-koenig@baylibre.com>
 <arD7N6A6ncBNR1Jk@orome>
 <arE-s0zbTUn14aIr@monoceros>
 <arFYGka5NpcgJ8oQ@orome>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rspyuoriyu3xbsxg"
Content-Disposition: inline
In-Reply-To: <arFYGka5NpcgJ8oQ@orome>


--rspyuoriyu3xbsxg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 2/3] pwm: tegra: Check for match_data being NULL
MIME-Version: 1.0

Hello,

On Mon, Sep 21, 2026 at 06:24:39PM +0200, Thierry Reding wrote:
> You're probably not wrong about opt-in being the more natural choice,
> but looking at commit 3d713e0e382e ("driver core: platform: add device
> binding path 'driver_override'"), the intended use-cases are very
> generic, so it would probably lead to a continuous stream of patches
> needing to be added whenever a new device wants to be supported with
> vfio or something.

thinking a bit more about that: The use-case presented in that commit is
about

	echo vfio-platform > /sys/bus/platform/devices/fff51000.ethernet/driver_override

. If we had an opt-in mechanism on the driver side, it would only be
vfio* that would need it, wouldn't it? That sounds handleable.

Best regards
Uwe

--rspyuoriyu3xbsxg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqyPUoACgkQj4D7WH0S
/k75uggAjU66rIYhxOlgu7NhEO7xA565YwhTBJeloD4bUMm8+0W08iZNphhaGPvO
uXNwj8m6MCl1yFVzOCumzKhF8r2ixYGsKW+vmyn59m1b/DAoL0KnjJjPyjkwizOX
eyNlZMnvMwp4Y65HaziLW9s6eTtc0fNMmGsrCVKvAjtGlZDsrzBZbRnun/Hd2pg8
J/lYgKQVwTDYJZZnxauPn5Qyq7pZ8Acs5JDvOi7dBto3YRcG8w5OFbnRL6HYAhgr
neCLHai/wCMyehrQVakEyRkwfYJmyiAMIIv8g0/uUlUF/exQR6RKtaJpd88gX6vT
X539Y2bk5qA9iu35MHWrmN+RXfuKOQ==
=XDmF
-----END PGP SIGNATURE-----

--rspyuoriyu3xbsxg--
