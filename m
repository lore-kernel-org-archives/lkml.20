Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE1352BE3A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790791076; cv=none; b=WXTNVC0Vatw+P8ZE2Z62nEKaf+mvjf8bNPw3+vobkPcHMtHr/YeaScRdJLRRTZ3PtUKUTw/iM8w6ZaN8hdHHZnEJkZZVakQdHpCbXJ2LrwnFJv0TnJsh5InTfrfwNUmWkRMLofP9Ah4CGXz19HDATTGFN5svEvyuYV7trMs8wHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790791076; c=relaxed/simple;
	bh=TEDQv8i1zZeBpGJQIMmmqZAa0WLbo55RWkJJZStpWZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ED0MRevsx/Z72IOlUL89eq/6H92IHaTVQpDNfn4JKpGNCU196tJzBeEbnr1YuWGAk/RXC25RWA+qi7FCX670p05NzBA/fKeUxWyVhEZi8MK/mAguDA4ebbJES9cUS6bVonts/U7oRsKqCHLepf0rE4vFzBTAUdTRJ/wKtUguXBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ABeQbkco; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ABeQbkco"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so35079895e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790791072; x=1791395872; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TEDQv8i1zZeBpGJQIMmmqZAa0WLbo55RWkJJZStpWZE=;
        b=ABeQbkcoyrKS8KPngYQ6bDoSIZ1vpUKXDTS7qAoW6HMo94WnLFrF3D8UQ6OB0FR+Bf
         ofQPGoyTI27agGmZWwGbI+I8zSYd+tsRi7EUNUU3g0vcQKavacJuzDj0CqlbETMmj7kt
         MIrjZmfVLDWKduIuYwcAmxy+Ul5rvJNiOqZkxYJXT3hrmTYWE0HkptLo9DkXluDoiflP
         F3ab8TD0pbai5Lu+sTftZBOAeeXkSoVqw24rincBABAOtT4k1l4NeuZ6hb4VYqTuM2D4
         +LInGfbtYZ8S/lY2aBoFeEqKYxwfP+uf+4zmeT/EHNDBu7D3YGcEGo4Kqj/8rDuHurl8
         TPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790791072; x=1791395872;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TEDQv8i1zZeBpGJQIMmmqZAa0WLbo55RWkJJZStpWZE=;
        b=FFdK8SMtWDqbZKQXm9cygxD3lGV3MytSMW+qeaH2ZCDsj0gqaSSrpr4REzs9MhCIXe
         Vpqma6BJVzccjSLiKG8pNGPS7aUII4p4ELWUQjz5hFkCwlu2Z5Qf0QDiSmaex4dTXUla
         fdxDrHFsctj7q71Eo9dGlbP/hxwi1b6NjGhgwcXudnSTCFV8/rKKIwBBbLkJfPQp5k+h
         WcBhasL4WcNZ6QC+cA9fvTBOtubQUljlA+Syg9obN+/v327HvzcYPjzq/PLT8w1dKSc4
         sNNKTWYVEUtLexauN+9Qcd/imYE9tz9Me+VJrdFPvifvkqgGZKd8ClxO3MGOdSLISkyk
         m8Pw==
X-Forwarded-Encrypted: i=1; AKwUvBz0Re27WysjGilH+65+l+jdl8mwA5IF5Rds5htazNxPHabb4u7bpHrAxmmPgq5A36dSxrNUF0O2qIEX/qM=@vger.kernel.org
X-Gm-Message-State: AFuF++n5bPx8UUQKycJN/x/VwcUWs3s6bWug5W4t/xGc1fcl6jGyq2aJ
	ndSxp99DbagI6Zs6jEWcfjEn9DlKKbKhwImBekR12LtjiZrG4HhiemZGtOal4K6j4RI=
X-Gm-Gg: AYBFou2hJtnDduo8hW2iA904UH6GHXuVqX+Cwyhz2ObBQ/0G2TYQxxF8NfyWI8WV19c
	ajGhVzoHCnMrVeM6bMUveGpWRSKzyQsAdMRR0FDuglptWdjk5IVCF16NGxYgUe0tuaA+vg5pDIC
	XNuGsDmOCq1jnjhlIgnDDnDa3AX7WB+uTPQRSZ83Cem7Zw12keO+5hCLBRqJBr0aNQywOi6MKRr
	rg+ZK6KUgnN9tbG3fu7u1HCPywkPUCahm08I7R6JopXGJPCOP91S3enJ9E079Voy/F6ICFWALV1
	U6ayXPJJmeOzkK1arX0U0X+1sDLuC1vz9f8KuDOvGKvFS8QopiA2EzykuCQrIbmRrSeyjdFF/ks
	bC3b6a26z4oZ2/5op6Ys+tB9xGQ9tq8yr7UOQtr9+6O5zb0DexJhhasPXZNJOeaxoD+t+pHoLVX
	hlaoVlMHwSbS5mGFA90qngmNurQZxOiLSJOWTbpovMBZEDd84Jgi1FoiEVNa4UvMALs43Df/L6H
	w==
X-Received: by 2002:a05:600c:4445:b0:4a0:1b14:e845 with SMTP id 5b1f17b1804b1-4a01b14e85dmr37856555e9.2.1790791072471;
        Wed, 30 Sep 2026 10:57:52 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01eb8372dsm9607045e9.14.2026.09.30.10.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 10:57:51 -0700 (PDT)
Date: Wed, 30 Sep 2026 19:57:50 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Waiman Long <longman@redhat.com>
Cc: Ridong Chen <ridong.chen@linux.dev>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andrea Righi <arighi@nvidia.com>
Subject: Re: [PATCH v2] cgroup/cpuset: Don't access cpuset_cgrp_subsys.root
 in is_in_v2_mode()
Message-ID: <20260930-marlin-roaming-0be876825765@there>
References: <20260930031833.660267-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="67ozboih2pymuqad"
Content-Disposition: inline
In-Reply-To: <20260930031833.660267-1-longman@redhat.com>


--67ozboih2pymuqad
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2] cgroup/cpuset: Don't access cpuset_cgrp_subsys.root
 in is_in_v2_mode()
MIME-Version: 1.0

On Tue, Sep 29, 2026 at 11:18:33PM -0400, Waiman Long <longman@redhat.com> wrote:
> After seeing the patch [1] to guard is_in_v2_mode() with RCU, it makes
> me realize that is_in_v2_mode() may be called in a context where a new
> cgroup filesystem is being rebound with stale cpuset_cgrp_subsys.root
> pointer.

add: which is a privileged operation.

> Avoid this potential UaF situation by adding a new cpuset_v2_mode
> flag which is set when the cpuset_v2_mode mount option is used. This
> flag is written into only when cpuset_bind() is being called with a
> stable cpuset_cgrp_subsys.root value. The is_in_v2_mode() helper is
> modified to read the new cpuset_v2_mode flag instead of accessing
> cpuset_cgrp_subsys.root directly.

You write about "potential" situation. But are there any such callers
(after the cpuset_v2() conversion in cpuset_num_cpus())?

> Fixes: b8d1b8ee93df ("cpuset: Allow v2 behavior in v1 cgroup")

I'd even consider (pruning to)
Fixes: d23b5c5777158 ("cgroup: Make operations on the cgroup root_list RCU safe")

(Admittedly, is_in_v2_mode() wasn't always called under cgroup_mutex, but
I'd argue (without comprehensive analysis) that predicate's callers were
synchronized via cpuset_mutex in cpuset_bind() (and cgroup_mutex)
anyways.)

The caching you proposed looks safe. (I'm mainly writing because of the
commit message wrt UaF.)

Michal

--67ozboih2pymuqad
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCar1NmhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+Agn0QD/Ys5S8WNqZm2/wRvcOmxa
B3l6WjTaKqXvj0JQJsZk0G0A/R3IYRhO5z8otfIlpYDTiVt8wTuxQsTR0nue3nyu
xxcM
=Auae
-----END PGP SIGNATURE-----

--67ozboih2pymuqad--
