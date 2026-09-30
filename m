Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BBA51614A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790786860; cv=none; b=sPj0wYojUsyjq7n2PLwAkNDJ6+Zwj2E3PYIddFsJ/Ng7GATe514k3TAS1GebITlesar9SU8Erl4FByk/mJs9eE55wWW62dS5ESWGUQ/fB34+my4mDTKYNYe5ybghkL/BITZOM66uv2vXe2Ka7F+ygZz7gYHvh9fwKNCcG9IfMjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790786860; c=relaxed/simple;
	bh=zwHqa1rFlwCe3gK+qKBo9qF4+nxZnwJiB+NeIrJyLKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZJIBbFFHsud6+ERQ7RcxH3FlRbqGMrdxMxo8YF4JfGm/C6yFJwBk1W5dvhPaW5IkaevqTW95jV+1y+CNbrW/zh5d/tV4yby7hwVigJB9ZbxJNXI0zHAgIm9H0kPybvmFElhHCWeX8o3UURxty2yOrXDROxceTArkB5V0mP6WRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dbkZ26y6; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dbkZ26y6"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912df756so43353985e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790786857; x=1791391657; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YdGluDAiZZvmXUx+j5S5zQRKfLbr15gOi/P0wOvXHu4=;
        b=dbkZ26y6B0N0zNyZ0fHBScG+TKZr14DgeFIDmCRwswih+a1nGBwfN/BzVZAHKMSUX2
         CL6MYUOiQXA4Ix3DyQc217f8UEVZsA47i8Ec1LFxU4BNQpEqpGwddp3phW5lEtUvub37
         aPuj/C62Z1dxIUtMfj7g142V3qyiAXkTP6sEmYm73lKKsDjjoonbTzillGVH2fxcoV4g
         S2EBaEejq/dqagMKXWw709ChKJmtDO3uj/dqdyNFVB5XnlCwxoi5BPJfp8/mSlT+Jy4p
         S2CVKKpBsOOLm0WUEq5ucZ2+fJqHVWu8JXG02uPkSVwNG90zEDS3bvHyUib0OMr1NOZN
         kVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790786857; x=1791391657;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YdGluDAiZZvmXUx+j5S5zQRKfLbr15gOi/P0wOvXHu4=;
        b=KDGMBpfC0qHmhWmiu6uHJkIfY3WdpZBzYjPPpvkIHAu0ynWC5+fIdCRWEv6KMJnkXu
         wFBWnnbZF/FI9xZm6OkY4xE0wwTOPsvNOngABkIIMWy2CABYG21g7+VW+JwvmI7oEt66
         LvGpesCBZ/ckpkUKpkE6SIkDLqJGfqYb+TYSIdpY6xUg7QMJGylSJRgpxNiN9xK0b/oM
         2fYfN9Y+er7CZoBe8hG1u/SLcKhAjqOvuxwjEKsA0WMZ/2cjdbHnQyL2e4zAJIxh9W5r
         NPuTVfMvF+tvwJo3KReT29mdp7otT1xE90BK6QsW+FCBLnsYoq4i/BRwg48Hn/3bVT1Q
         CLwg==
X-Forwarded-Encrypted: i=1; AKwUvBy06NFBHq58SGx8JBf0u8p2/AMgD9te1LtNXJQ4bBLySSAw3KHuGt94m985RSyzRYPiw5HcRDaS7g8UXCk=@vger.kernel.org
X-Gm-Message-State: AFuF++nJnVuW1vNj1XqVOw3nvsiV8DvUaJhFgQJrD0rFiAJfJLmFqiT5
	F/4PwxyOXutY9upCFhbHQeXLekdXCIc8orWLtZbfS4HHZ1smSMx1nbGeZbXxSMYpDzbIvp5YGpf
	xs5lIgJw=
X-Gm-Gg: AYBFou2XpLYwb/Jz2+ZUoBGOE7a8KZiAXczIcXge496z9U6XzIUK11uMFwFheX1Ida6
	vgQJweaG7J4QgzXZ1PMidS4qlVThqsZu4OZnFnJSsmqbz25CDWgubY2cmof3RdOqKRb5Ih/qMDd
	XbUP0Cw0YxlhAL3P0BZjNIasOBen2R1PtcfYX4T8X5mkTRog7WjBAmUbeMSXTo0O6eQiCgaNIZb
	hDW+7vUa93dGtyD8lJheWtQLNShMdIw1l8qn9jDmaOvvD/VQv9kfbfBpU3mP7ueaEnW2KCSwdxc
	0fLVx811N7badcQZOSjVBO1WvlseVWBucgk5Ne1oTWKyY0FOg/OcoCNz1qZYOdWo3s0F8PRvynr
	6V2D7k2+SWGMuHBw3MaU3BqX1VLxEwnHOuSn47Syc8CFhJMFidbfvtP1/bfjJ+R3PRQrqqLTUrm
	3uh2PfdTLkbhGbnI77v3rf/zY6W9c7e+9VWtM/Ghax6TGfYiKxjal7LHJX+i78cSuunzT8OoNIC
	w==
X-Received: by 2002:a05:600c:4f45:b0:4a0:194e:5bcf with SMTP id 5b1f17b1804b1-4a01b1306bamr38895765e9.30.1790786856723;
        Wed, 30 Sep 2026 09:47:36 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01eb717acsm3717295e9.8.2026.09.30.09.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 09:47:36 -0700 (PDT)
Date: Wed, 30 Sep 2026 18:47:34 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Waiman Long <longman@redhat.com>
Cc: Ridong Chen <ridong.chen@linux.dev>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Peter Zijlstra <peterz@infradead.org>, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andrea Righi <arighi@nvidia.com>
Subject: Re: [PATCH] cgroup/cpuset: Use cpuset_v2() in cpuset_num_cpus()
Message-ID: <20260930-absentee-cytoplasm-b5cdb153077d@there>
References: <20260930154800.698360-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2h2orh63tmomnlho"
Content-Disposition: inline
In-Reply-To: <20260930154800.698360-1-longman@redhat.com>


--2h2orh63tmomnlho
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] cgroup/cpuset: Use cpuset_v2() in cpuset_num_cpus()
MIME-Version: 1.0

On Wed, Sep 30, 2026 at 11:48:00AM -0400, Waiman Long <longman@redhat.com> =
wrote:
> The cpuset code has 2 different helpers for determining if it is in a
> v1 or v2 working environment - cpuset_v2() and is_in_v2_mode().
>=20
> cpuset_v2() checks the binding of the cpuset subsystem is on a v1
> or v2 hierarchy. It can also help to optimize out v1 specific code
> if CONFIG_CPUSETS_V1 isn't defined.
>=20
> is_in_v2_mode() layers on top of cpuset_v2() and returns true if it is in
> a v2 hierarchy or in a v1 hierarchy with "cpuset_v2_mode" mount option
> enabled to make "cpuset.cpus" and "cpuset.mems" behave in a way similar
> to their v2 counterparts. However the cpuset hierarchy may still be a
> standalone one separated from the other cgroup hierarchies.
>=20
> Commit 90ac22ffef48 ("sched/fair: Add cgroup_mode: max") adds a new
> cpuset_num_cpus() helper to return the number of effective CPUs in a given
> cgroup. It is part of the "sched: Flatten the pick" patch series to help
> flatten the cpu cgroup runqueue hierachies. cpuset_num_cpus() currently
> uses is_in_v2_mode() to determine if it is in a v2 environment. However
> is_in_v2_mode() can be true in a v1 environment where the cpuset and cpu
> cgroup subsystems can be in two separate hierachies. The current use
> case [1] for cpuset_num_cpus() assumes that it can return the number
> of effective CPUs present in the current cpu cgroup which may not be
> the case.
>=20
> Fix that by switching to use cpuset_v2() which signifies that it is in
> a unified hierarchy where both cpuset and cpu cgroup subsystems share
> the same cgroup hierarchy if it returns true.
>=20
> [1] https://lore.kernel.org/lkml/20260930081125.GF88198@noisy.programming=
=2Ekicks-ass.net
>=20
> Fixes: 90ac22ffef48 ("sched/fair: Add cgroup_mode: max")
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>  kernel/cgroup/cpuset.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks!
Reviewed-by: Michal Koutn=FD <mkoutny@suse.com>

--2h2orh63tmomnlho
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCar09IhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+Ah5uQEAjUgqxpms3ne1X0nO7Vid
O46Rv72hNw5ax30V3twwaakBALRLar4UXTEpJj+RLm81oVD0s0UAlpEhGh7E/rTX
QwsG
=kfn0
-----END PGP SIGNATURE-----

--2h2orh63tmomnlho--
