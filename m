Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0B4331EAB
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790330380; cv=none; b=DCG4aZayoEaTNz/YNXfiZuHAyGpzWoE6dZoALLXSF99Y31FsTRhlCrKgK31ugXaX/RW+hasCd5KjYGGKwSEb4b+5WNLeb/LxowoWUWCEUF0VmylnwBZbAct7ZMq5r7zRTGdsr/KUNwlK+fMZfNuaA23dRXJuMi8UmsdydoluMjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790330380; c=relaxed/simple;
	bh=3wuIbZJ8bFkmwk3yPngoJC5LLgfogAdH4lIaqG+juGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LHLiCgVEs2lrUatizZ8yxKV35Uq6Sm89+LoDoCOowCssDNIWH5uRjyG4aczPW9S4OySIq/Z1vM1UmJZfQkuK0sj50T379uA+a6iISGAlW9Uov7qX0bAl6n3My6cD89JI7okwzWZWLr4n1vaFTZpQGX5eCHCPW1JFMp+4sxh0NaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TaazaTwe; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TaazaTwe"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-482f63546c5so537116f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790330377; x=1790935177; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GrJoJ2ytny91PPyFUjjfr4sdS6p1y6Xpxf8VbUCYFbo=;
        b=TaazaTwepfO/Nn3RZjRxrk/PoRkBXrAQMWZj6y7Gl7+W4nQg8C2TCW26X1Nt7vOau1
         KfMHiALUAJh6n1MUHBOLQhw6Yi7J78CrzKXHNvKSLuWLacjdk8wV/E8nwOVdCQJiQYNA
         lE+bQyKGEctiyKpoGd24io6VpF+34sVyN1LAkzx+B8uPBA6VFimjuvdjnKsfTY8j2jZM
         w8MRtdn37Nr+rLVbufuAAnYCeybRMmkaiYftoPzRIBBbqMV5c3ymntn1QD555gIhnK8Z
         zDaLCmcyCsuP7/Y23tTAU8QbTwGYBBPKgIxdDPHsIa0XrMt58eFRVW7X3g7dTdJcyaqL
         utEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790330377; x=1790935177;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GrJoJ2ytny91PPyFUjjfr4sdS6p1y6Xpxf8VbUCYFbo=;
        b=eC8mKeahb4WRxW9N2XRVnxB8hKSZfoy1MSqMJj3YQYNd7L3yoDqdiiGdgkWji9YdqI
         dm2MAFOGpxOfp6jnSPGW26JmmecCQi09swRu4+4vvqjAsa+rTmvv4+xwvveq8VsR+UPW
         OHC5nXCXCE4UxDjvLU1aSYG0kihc05ezTEX+8XprBhk+yyXX12AhTEhCnnho4rwngq9S
         3OQgwuQDKKDoXWA+d0LvbP5Jvrm18/XUeuO7jewEa96sTbk6s1UjKpQhG0Jzbxzp98zm
         auYvCH8SgDMplP9ougfvv8dKHh3RaNk2fxEcAGXtISyAl52Cvnb3j805oHPrk+LOMsjM
         pfjg==
X-Forwarded-Encrypted: i=1; AKwUvBwj0jyYbH+BWyJMQczbvt5GJzIKdS3lcfnCLBeX9Tl8iQclBYREBLnsi2nezY9FN4n28C6kxr8pMMJCOzs=@vger.kernel.org
X-Gm-Message-State: AFuF++lEsRxxMhCH5rZGjkdjSQSidfm729s+FESJy55whZuMi+eNyTo8
	KNewXaBDleBudwKDIv9seFpjzX37cXSRhHc1sQrHU31HDJqvtpNY5cV1wrnkbs+fXC4=
X-Gm-Gg: AYBFou3bbQe+PHsJWYqzJ3v2koYPJlIEohc1/igrx73bY5973/+8nggkVCQDnLP5dnJ
	ZwZnQU+YV9Eyf/24GV1jU/1dsDXEM57zIGlTSHEClmOOJV77/hmK6WmvXyZZvFUZP1LrOzfWtQP
	Q+T2AMiyxYbvWB8YcJC6m+Lwaw25U7TcUpsetPjlzz6kA+Rh0GBkIoCicQ8iq1aPvcGgJkV4pFM
	QgIq9GdQPmI65yunstgeWYE6X97+1bGG9xqh4VIb6NhW+Kd3s5IC+50ohkXDOTXM61rD40yInvX
	g1+utHYc005Kg9SnzGLAfc8JUZHwqDagapWBy/x4aCMnb+hWqhCG08bcGK9ArBxaro8gkwO6xbY
	6Oesus9xxPOtfbm8WjZIppFYWx8yUWR5VPgknvhDHymbG/l8VikU26Xgp3218+57A5jibyn6KS3
	vntLrWM/AE8WcCezu43fFKC9jqwZGY8NUE6TKlZ4ie5yqxDIWv6Ufjsk26XLa+8UbljvNLH+Jq0
	lvnBDE8yf5sbg==
X-Received: by 2002:a05:6000:26d2:b0:488:5af8:eabc with SMTP id ffacd0b85a97d-4887175d8a4mr10728228f8f.26.1790330376886;
        Fri, 25 Sep 2026 02:59:36 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a2acb4dsm5878334f8f.0.2026.09.25.02.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 02:59:36 -0700 (PDT)
Date: Fri, 25 Sep 2026 11:59:34 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: peng yu <yupeng0921@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Chaitanya Kulkarni <kch@nvidia.com>, Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, 
	Maurizio Lombardi <mlombard@arkamax.eu>, cgroups@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] nvmet: add cgroup_path to charge namespace I/O to a
 cgroup
Message-ID: <arZFtIkV0vg_aQR7@localhost.localdomain>
References: <20260923152653.40953-1-yupeng0921@gmail.com>
 <arP0TmdK3FnNfbwH@localhost.localdomain>
 <CAG3TDc0bQJATmJR5dF5j9RoDp1ti-tbAiUkLRGq4zX2CYD3unQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4zjvtwofog4yq6f5"
Content-Disposition: inline
In-Reply-To: <CAG3TDc0bQJATmJR5dF5j9RoDp1ti-tbAiUkLRGq4zX2CYD3unQ@mail.gmail.com>


--4zjvtwofog4yq6f5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] nvmet: add cgroup_path to charge namespace I/O to a
 cgroup
MIME-Version: 1.0

On Wed, Sep 23, 2026 at 09:34:48PM -0700, peng yu <yupeng0921@gmail.com> wr=
ote:
> The LVMs are close to my real use case, so I mentioned them to explain why
> I need this feature.
> When I write the testing code, I try to demonstrate the usage in a
> simpler way, so
> I use RAM devices.
> Sorry for the inconsistency.

Understood.

> > > * The subsystems are exported to different users.
> > > * We should provide each user a specific iops/bps quota, thus a noisy
> > >   neighbor won't impact the performance of other logical volumes.
> >
> > Why cannot you place users into respective cgroups and configure
> > appropriate per-device limits?
>=20
> I export the devices to nvme target. Per my understanding, the IOs are
> controlled by kernel threads. The users are remote users, so I can't find
> a way to put them in a local cgroup.

I see, so the core of the issue is that local storage is exported
remotely as NVME (over TCP) and you want to regulate IO on the local
storage.

1) resembles loopback devices where original task's blkcg is transferred
   to the kthread issuing actual IO. Is there any userspace component
   fronting the clients? (whose cgroup the IO could be associated with.)

2) it also resembles FC app ids (blkcg_set_fc_appid()/blkcg_get_fc_appid())
   Could you look at that whether a common concept could be used? (I
   haven't looked into detail how the client side is handled [*].)

Thanks,
Michal

[*] And now when I'm thinking about it, I'm not sure one can trust any
    app ID that is sent over...

--4zjvtwofog4yq6f5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCarZGARsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AjBEAD/RgvrgWqx1vN7nwvnz6LZ
kUdSY5YucNYWhEz/l2B6FdIA+wdvKZi11fYFtWArfARj5k2swH2W5L9SKaCFbKx9
EhsJ
=C5Iy
-----END PGP SIGNATURE-----

--4zjvtwofog4yq6f5--
