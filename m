Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C82279DB1
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791809117; cv=none; b=T2mpXEJyRT1nakp9P+pZ2BffNOq8vhWJ9biUr+G/RFbCxVyBfchm5D8rRsKNmSjkBOtBo0MakjlHgZPWFjfrNFF5vZcodMmKsDjAIfMCao+quVtP08Iycfsd6ulFFOYgls71VeVv4Hypm0rIXjPwSgw6NSBT1sRJQIRk6cn4Hpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791809117; c=relaxed/simple;
	bh=Bvm8tSdfsJWIwE5zHlPE8PH2QA6rnOT5LTtUAz4GQ9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=akwhG+qOA790nQybvKbpAFASlEthOHcD8gJX6eojN1pIZcDCyM8ppHK3tq4xxES/LG5rmixDgwDmNZ9xmn3IytNWwAmnMeSxTsMXjWkr8JbRiMXYqb040YTNlj9hJ3AIfteTmU4L2yiWIBVWGNfadCTResHbFRE9GCc/7jDPH1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VEfMtRMp; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VEfMtRMp"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48af27fe287so1584973f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791809110; x=1792413910; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pxDcCA7hpgDYYxgdhqPc+1ZwblatM2CFgvbhhZn3Nj4=;
        b=VEfMtRMpsggQy3puOiUSX0dKP35vsg1vWFgbvvyS8sDLdRba+W6UkvZxLrVufPWojG
         eSpcAmc6NKmZa9KHx5mPBW8IZ9XWrV0zS+S+IHVs72hqDeuAuAAKBRdaU1O8DIa8SleZ
         D+fanidesGpX+dghqX7aHfz7DvlUzxUiRDLsyF3bV6tlM+dwyB54qqQWtmzR+PnZx9+x
         GTg5M47zesywqSbDi1CAPJFJnC+mN3AgTNfAdya/S33R2Tn00X9EB/TjoU/FIFu/mY8K
         K0a+t5d7Zp/vlyNHr6DvX9MjUibmqcNe6SkJT3mSAsN2emPCiKGfufcjJ9OCwpKCvyzJ
         T70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791809110; x=1792413910;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pxDcCA7hpgDYYxgdhqPc+1ZwblatM2CFgvbhhZn3Nj4=;
        b=0MWPQ9X9a3GD+10lDf9WKPEr9aES128oJsJrTZNw6BM7GHBCdkE6Ct32mLfA8njDWd
         KjEFBumqHKXRhXk1I0QuDR39U6pOaf8SYte2MN+qN3n1b7mDhSez7iOirVcfpEMYNEeD
         nKeAScxWPj7ShVgVX59ChYBRMIUS0IKZ9BAn5O1Z1Si/C9lQ3b/T/EAPlL6huYoLPOW+
         WZRqM6IMnmmwfeXR4gcRF9HoLd5HUgJjzOHsitqYhenbAwYT8IvKg8nKSW6k5hR/Od0A
         8ObU5i0nut+9HMBGE7FJtbg3bqqPAP0cmnnKflppDJDDDnHEHgCzdSn+DbfG98NdIhI0
         LtuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrFQU/er3cuBWzY8NVwKHLehzATgTWVOUNysNNrE//5DXWJCWyHEGu1jJ5h7zaJ4CSrtkDZWHVUgo/mUE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJV4re9X3ruH0hthou/dLoeWLVtylhkSXWPOxnybdI0XE+1EaXt
	ImHjV3OaY3riuEpQ825iUOxL99jFhM3M9sPlGLTrvVSCXb7Ere1jIuyP+ZPwStUEV7ZBJUZ6NcV
	BiSThO6U=
X-Gm-Gg: AYBFou0XP8OgI0F/8UujMkImxUkH1YusqN6cnHVlj5lkPdDBrb0y09EkKug7OYPZOaJ
	e+wWP+a7YMRct9eWKMDgHz5MW2/ZhhPNTh92nf2QpPTE1GNf1id0q6IwhRfKM7BIcNpl9w2qXPj
	DIz4oUs8cIGwqtOc2t/f1jTEAmi+eTvuLcmJgufsp/k6dPxAho8jU/PiWHtm6t8FCgUrrFKo1Pd
	h3N7lD41DrCXAAVje33ewT+3R3qFYEFgKeiwVnU71w9RIZWtlJdxqNZ6Lgiuq13JeSPlVFlYHpZ
	Mmte427mzTd6vHxuLv+Dn5s8rlPnXk/z9WkeGHEiT6saR2FJxVTBiEy5N66Rz0ZjP9bYa0/QAfB
	iKsqpaNPxaBwl1e5l5nrHSaopPG581+9LeC0NQ/Dwovy+Q7uYQ+3VA7QR0qgwnDerE+jsMekK2i
	CwePeRMbVqUqpSRc01ju/re4PZsjWKWBeIRlFKMW/Jyr79nygmVDMiu12NKRJhY4E6ON5M0MDgx
	A==
X-Received: by 2002:a05:6000:160e:b0:487:27f9:842 with SMTP id ffacd0b85a97d-48dbace9d4fmr11992821f8f.55.1791809110413;
        Mon, 12 Oct 2026 05:45:10 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ac02cfsm18344889f8f.39.2026.10.12.05.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:45:09 -0700 (PDT)
Date: Mon, 12 Oct 2026 14:45:07 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Shuah Khan <shuah@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Amir Goldstein <amir73il@gmail.com>, "T.J. Mercier" <tjmercier@google.com>, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] selftests/cgroup: free the paths returned by cg_control()
Message-ID: <20261012-grumbling-spearman-3a313ae31198@there>
References: <20261011223358.2327625-10-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lgnee3ewncxbl2us"
Content-Disposition: inline
In-Reply-To: <20261011223358.2327625-10-sashal@kernel.org>


--lgnee3ewncxbl2us
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] selftests/cgroup: free the paths returned by cg_control()
MIME-Version: 1.0

On Sun, Oct 11, 2026 at 06:33:38PM -0400, Sasha Levin <sashal@kernel.org> w=
rote:
> cg_control() returns a path allocated with malloc(). The two callers
> that pass it straight to inotify_add_watch() never free it, and pass
> NULL to it if the allocation fails.
>=20
> Keep the path in a local variable, check it, and free it when done.
>=20
> Fixes: 5313bfe425c8a ("kselftests: cgroup: add freezer controller self-te=
sts")
> Fixes: 2de27980e1d46 ("selftests: memcg: Add tests for IN_DELETE_SELF and=
 IN_IGNORED")
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  tools/testing/selftests/cgroup/lib/cgroup_util.c | 13 ++++++++++---
>  tools/testing/selftests/cgroup/test_memcontrol.c |  9 +++++++--
>  2 files changed, 17 insertions(+), 5 deletions(-)

Thanks,
Acked-by: Michal Koutn=FD <mkoutny@suse.com>

--lgnee3ewncxbl2us
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaszWTxsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AjYAgD8C3rg4DsOngu0tGcoEsvc
5NuTbUsIxMtIYR1QnuiqLKoA/2ZVZusoTfiU4S96kRaXYt4cG9+dSPS3Il16Cshr
GREF
=nNP1
-----END PGP SIGNATURE-----

--lgnee3ewncxbl2us--
