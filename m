Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD34F48CD71
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 18:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788375408; cv=none; b=kXvO3pRC+LciL4HXHRVvxhwn3DBKKMngjVIZAt9nn2WPCjJwFUFJIA53ZbpJ1v7A/GjoBTbZGx/Vqv3TnmFLRTYmb+W0Nk4ZaX607590PIZPy40JaSbgGELFwYvaZblSdBVdOgGSESnt7yVUdf2XADQllsY70vvg80zMqMb/TYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788375408; c=relaxed/simple;
	bh=Bl6Z+yhon446XPiSec64jLZfYGcpfzZ7kRoEQk6o8wY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vAbRT5z74JMt1WsF6xNcXUn6lEwOzm0kj4I0XaPVroFEO1J3KYwRNzm3Z82AXs/ZNLac5Mi8hUA0sELYDekvOK/ZK+Z/mRRiJuc3gY0a8uvzqyMNoX2JXEZt5UKGUkPtLd2wPTXnpW+Log9kquuUeT4wv/nN2/lvnXBGrg3zvuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cOQBfnTl; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cOQBfnTl"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-485538d3499so1026169f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 11:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788375405; x=1788980205; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ce9zziXevwzztTUtUBuzSZewu7sUb5iK8933/ZqFADI=;
        b=cOQBfnTlbQ9OfuOLJJcn435IH5QOTVq0jNGYIVjOUXKTRxSWgBjM4dMxjFlOj1DpFr
         JHnCG5UepMh99Y4Xy9jlXrs3zuHi/FtdlLBMrlpIidVgtUOrl+Biq2McrTueYgCeyOjS
         XjdkU4CW8CYtXVTnu4N/PLe+UdXnelB1reDrxVy8BPnLeqcFDr5Euy0AhJjd2zOMzqLG
         LOYg3vyUdKXX+vRhFrg+JoE3hHp4IdCAGMaYeM4fzv9vjYmidr6sGo3MWPt7phnLIV9B
         p+m0q27SQ9GP/VnLhUHhsPR6ueN12+mfkgdfpQ8/9Kk03fY00GLVp6VvahWAot8P8ulO
         ohAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788375405; x=1788980205;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ce9zziXevwzztTUtUBuzSZewu7sUb5iK8933/ZqFADI=;
        b=H/0QROnK+xTzJeGG7lvUVcoBkc+gDMFv8kJMex5SogqKhwZTm7hGhO5NITH9lp+m1p
         Wt1UL6bV8b4kgG9wYRo5ujoFNQkqIkW6jMh4u67niK/r3G4nY/zEEYRl6GtTtjXzxnwj
         breR6IKwg57FGszrLISts9tW4Lmf4+wCIQRtTsaeFkLr53TmZPnMl5OWACwoCzHo9OkS
         FeF6soQE/9mCFQJx43Zm37XohBQreCVEo32rMCSHiLXJKo0lboOFV9RTPOfjvEPYghqf
         7iFgDlMX3fUIm/XAAGssuoydMPNmvPKuSeStHo/3N8gTEbozoI5Qy5Glx7PQKsbDplbP
         jULw==
X-Forwarded-Encrypted: i=1; AKwUvBynwQdLbZuGr5namBhqS++EB2Kk9zguy3kqgnopBPbpy9ywhe1+JHygL7EkwwLlojm7eumfOEI01mve468=@vger.kernel.org
X-Gm-Message-State: AFuF++loo3WofDqT99UcFlFEUDNOJW5GMaNg0F1GAZIonC2ucgciCDUu
	F0w9sewPsHkBQC9mWy4YMx2qekor3ynxSSIoCxh6Y3vslzzvUj1hJEaqf3xT08GJpEk=
X-Gm-Gg: AYBFou2XqSmq5Nr82ujtn+CNRAtrsYDOyzYSIoaWkPb5BsiEkHiKxPTXZ9BD5AOnzka
	RKui2sm8VzRR+ktlsSX7O76I0OUoFHiR1LdQYAi9A02JvvK81n+Da+utJ/ro18Efxy96NCJ3MS0
	ZVQuIw72vtxsAo0HIc5ve6O3i9yqvw6VGQua6XHL79Lm09wucZbuLobZIG/fn1tzOJUVDzNuIW8
	ktNsIRUH0soRgyPOkfY4XWMp2m9VnYAbIa+Vlwbh1BD712Qw3pNljfwlViRa4Khz/bdN3BUdNxx
	tJgQ9Ss33AHh55HrKpJ2T/hytlluJZ4Bx4cZvRZQxXgmH4sPnCGkwjNkilnGwbMzIRNo/+6YLd4
	ypjm75Wd7HU/52bHGOwxBWKpvYEpw16RaFxy3rbgoYhrQL4GH1rlo6b93b/2ciV8p50lYmkMrLc
	7yhWZehbWImyas3DmaXutMhJG9qa6UMBD+gOGqZGSm8yHSONwp8HPQ7qn+kCDT/Cw=
X-Received: by 2002:a05:6000:27db:10b0:484:f26c:b9f3 with SMTP id ffacd0b85a97d-484f26cbc06mr9882672f8f.28.1788375404776;
        Wed, 02 Sep 2026 11:56:44 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed3716sm8647593f8f.22.2026.09.02.11.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 11:56:44 -0700 (PDT)
Date: Wed, 2 Sep 2026 20:56:42 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Shaojie Sun <sunshaojie@kylinos.cn>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Christian Brauner <christian@brauner.io>, Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
Subject: Re: [PATCH] cgroup: namespace: replace BUG_ON() in copy_cgroup_ns()
 with WARN_ON_ONCE()
Message-ID: <aphwXq5bEQwKhqx2@localhost.localdomain>
References: <20260902101856.225493-1-sunshaojie@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ybus6cnw3pbkpvuz"
Content-Disposition: inline
In-Reply-To: <20260902101856.225493-1-sunshaojie@kylinos.cn>


--ybus6cnw3pbkpvuz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] cgroup: namespace: replace BUG_ON() in copy_cgroup_ns()
 with WARN_ON_ONCE()
MIME-Version: 1.0

Hi Shaojie.


On Wed, Sep 02, 2026 at 06:18:56PM +0800, Shaojie Sun <sunshaojie@kylinos.c=
n> wrote:
> copy_cgroup_ns() uses BUG_ON() to guard against a NULL old_ns. The
> condition cannot currently be triggered by any caller, and the sole
> caller, create_new_namespaces(), already checks the return value with
> IS_ERR() and unwinds correctly.
>=20
> Replace the BUG_ON() with WARN_ON_ONCE() and return -EINVAL instead,
> consistent with the policy of not killing the whole machine for a
> recoverable programming error.

Do you plan to tackle other namespaces too? (Adding their guys to Cc:)

It'd be good to have some consistency across them if this is going to be
touched. (I see that some simply don't care whereas others have the same
BUG_ON(). I might personally prefer the former)

Regards,
Michal


>=20
> Signed-off-by: Shaojie Sun <sunshaojie@kylinos.cn>
> ---
>  kernel/cgroup/namespace.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/kernel/cgroup/namespace.c b/kernel/cgroup/namespace.c
> index ea4ee13936be..13930955c254 100644
> --- a/kernel/cgroup/namespace.c
> +++ b/kernel/cgroup/namespace.c
> @@ -53,7 +53,8 @@ struct cgroup_namespace *copy_cgroup_ns(u64 flags,
>  	struct ucounts *ucounts;
>  	struct css_set *cset;
> =20
> -	BUG_ON(!old_ns);
> +	if (WARN_ON_ONCE(!old_ns))
> +		return ERR_PTR(-EINVAL);
> =20
>  	if (!(flags & CLONE_NEWCGROUP)) {
>  		get_cgroup_ns(old_ns);
> --=20
> 2.50.1
>=20

--ybus6cnw3pbkpvuz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaphxZxsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+Aj71gEAiXb5ZRIcP6X8Mw+2xR1l
CoKcPIu+bFvoeVnYWEwuERIA/26K3m+2Kyeo61hpHTBgSt3V2OeB8wHqvgGpCIFM
pVoB
=09pG
-----END PGP SIGNATURE-----

--ybus6cnw3pbkpvuz--
