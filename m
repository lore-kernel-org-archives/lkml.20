Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CDB4AA59D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 17:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788369703; cv=none; b=jdfWW63a8uLvhrU4MvuZ7jKX7dLAOb3lvsduOky66ZpT4ltrEgLIhwjoebLS4Hilbst4rCRASenneYgPY0Ujh4k1C/taXBXvLdyHKS6pg0k0XZrdxJuo6pi1PGfO7bvUIBISfI07LYFkzKFG/tlI7eh/dvPSS2ykhjY1ID8dW1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788369703; c=relaxed/simple;
	bh=m+JVflRfogZkAqD6QsXF3pZmp6uJr0RtWwe9UeEcILs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aLzxZ6gVvzruN8UgpO9GetngCwj/9Nx2C/CADak9JGwZ+9SPhubWUf1CTD3HYHlvKF9wkwnSd+Qmhxh+E/dDjEX/HRg8wItNc80oBC6D2eMAYD4sEy0fgFDEQjvIc69pIkA7kw6pLXkdgZPGEF9JrrWS3APmP3ylHHHyNuB73hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SXjFc8my; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SXjFc8my"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so14523995e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 10:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788369700; x=1788974500; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mbr8vDhDQK57otnRsW80mi/+agFd8G6T3W4N93pfIMo=;
        b=SXjFc8myRRa5xojHOKjeEhB6i/sBvtxJUJeidgzE3zQKvBcpPwhhj/M4U5r/ZFSO0r
         EfXwzCFKIPOCgfdXI2NFqY7pJIKRcugPakyfkFs5OwNFXVrQVqrGm+hDwMWBSsAuwXQf
         tC9TnMBgZlR5GaamYt71w3a+LpxeY9oR2CqFPJzyLwLg0Jl4MNKtbznLSKvu1qb+iBMX
         l9NmW1reQ4iDF5EsBLmQJS4Eu1lrfv0pucjjkNnWO3OZTdYIozFfFa53uQJQ0K6/8YVo
         YHM1D/v6OwpaPdYOb5zuyC8zD0wNPmBA5FM8OLkOW3HEAZyCYDEBlepEBuEUPzHXyfsR
         2/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788369700; x=1788974500;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mbr8vDhDQK57otnRsW80mi/+agFd8G6T3W4N93pfIMo=;
        b=pBpXFBdzAdHGZfv9sedghfWh0yc/pxjkOrFlQbzE0AFy9M68phEQsb0QREj0sl4K0c
         Lh3YxNCZE9zf3g1vnIYx3dv45rJmMrZATaZFbeVJl30z6qeaef6tMRdDNPEmkVKK+dWK
         AFabbcatlzAREA6xWs2XurVodEwhePedXA7brOy0fVZnfK+QhBKjc4lCwHaQEYpt746B
         aUKMeb+iue1r4AkK656l7IKLq+//hf5hkOUjt0KA+9pcMeCoknYR9V0kSNBwVVeYSYW3
         5jLAzoo8DzGl4+iSLXNGbc8dVAw+vCRFh6hLNFHnZozRAA0e91lfd+aN84Cdpvf/fjUi
         y0Tg==
X-Forwarded-Encrypted: i=1; AHgh+RoAD/UL+Pd17rW0mVRLwaDyD/z3SQE43PHtvmSTvy/51ocYyIChXTVal2e5Ub5LUeKDJcf2iP1STapgvy4=@vger.kernel.org
X-Gm-Message-State: AFuF++l0VEGwXby8cYx5UEsYmGkf+KDQn0RheHY/72hxDLo6Mm3SfwA4
	VIHT33GRuamVEKhRXuOHhOBdm+pl0XM7fUs1Fofmau1rqPcAXmBkORbIrG93HRRUcUw=
X-Gm-Gg: AR+sD13wg7wtrySXacMD22NFkQgbTcz9vexbl7XJmGBKAISmQhTQzAaCXk22UESN523
	6PGbdHSyx+AGE4WKTjIN/LZjPWg6JjxBgTjd8iPUO7fMlka/2bo/i5llC110aae1q7vqUJL6FWg
	wz2SU/CKBlDuHOKatxwSI9aTJXelGzr0i52IaqqLleMFaWmC6HFxS58eljNR4MXYlrsbF0ek4j6
	ZOvi5P/UgeOls1Bl2HEyZbqWvMlkvHmqlL8XX6QKF9vC2gV5vvq6EWF+gYdbSjirbRM/Qy5rcef
	/eeTxSDRQwI5FcpEW9R93ZFc/6hszmWwlkGwyn9IbKTKYhzMyxuvjTIMLvO0J1JFxqcZALxYzhw
	SxRdzoqlC6nk4GryzgPoSDZfmwsLPfIsi1yBv7qurfhPKXkO7PcMXkdx6R3eHMuJ/spb8u/J3Uv
	YY+OwbXBdEIepVfFV0PNETnkLy0r9BowX86um6ZQkMb+cD5+J4Y7zy+yV0kJkfSqE=
X-Received: by 2002:a05:600c:4592:b0:496:c1f3:e8f8 with SMTP id 5b1f17b1804b1-49ce5828104mr100735675e9.7.1788369699585;
        Wed, 02 Sep 2026 10:21:39 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce554d52esm46037545e9.3.2026.09.02.10.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 10:21:39 -0700 (PDT)
Date: Wed, 2 Sep 2026 19:21:37 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Wilson Felipe Pereira <wfelipe@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Tejun Heo <tj@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-mm@kvack.org, cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] selftests/cgroup: test_zswap: fix implicit
 unsigned promotion bug in test_no_kmem_bypass
Message-ID: <apha6cxiTEi9_FS7@localhost.localdomain>
References: <20260901052250.154532-1-wfelipe@google.com>
 <20260901052250.154532-3-wfelipe@google.com>
 <apaO1OHVQWJCuJDE@localhost.localdomain>
 <p9738q5kh9uc.fsf@wfelipe-west1.c.googlers.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="brfghnffrv7lgskx"
Content-Disposition: inline
In-Reply-To: <p9738q5kh9uc.fsf@wfelipe-west1.c.googlers.com>


--brfghnffrv7lgskx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 2/2] selftests/cgroup: test_zswap: fix implicit
 unsigned promotion bug in test_no_kmem_bypass
MIME-Version: 1.0

On Tue, Sep 01, 2026 at 10:42:51PM +0000, Wilson Felipe Pereira <wfelipe@go=
ogle.com> wrote:
> I like this option a), any thoughts on the sequence here?
>=20
> I thought the following steps:
> 1) Add cg_read_key_s64() here and make use of it;
> 2) In another patch (probably 3/3), replace all uses of cg_read_key_long
>    by cg_read_key_s64. There are 41 uses currently.

Sounds good to me.

Michal

--brfghnffrv7lgskx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaphbHRsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AgYRgEAp30olA9rJ2qhGFysO4s+
aIyThbEl72AZDl4Xoxzmfa0BAPTcX/yNIMQiLrmSpdmTPSJc835GqqqammL+Cq4q
NggI
=9Inn
-----END PGP SIGNATURE-----

--brfghnffrv7lgskx--
