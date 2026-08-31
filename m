Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3A13CF201
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164194; cv=none; b=pMDVkMftsA8RTUFrqFmBxmIEgdVMTXylswh2gZQbvCW9Mx4LugelkuHep6QW75/LcIKEQqHLSdAw5daacxIWkkLskQZzpkJ//u1RIKAznhUt3gwNY347B+5ibXqs8yJqwaoNRebP7LtY/DcAn6vdJ5w/9Z8y/Cu836xhfXQ8Xrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164194; c=relaxed/simple;
	bh=4do77Gw18YKEY3Zt4AjmYvzFk1XnFp9PzWEgF9lVaD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s9DnhRSH8YDYq4m5T29m1e231OKB3seMRXRKhJ1w5hjqKI5JhVR2efLXq+jLpgTn3VT/aays1ZsAyu+OQ6VigrZcgIDCVBCwEIxuyRMmt6c7BD2nThzOs+VC7OndC7/VEARGlzrwufr4OCa2SDAT64OSElQo6Yw2I1zDlSUQXRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UJhAH6MQ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UJhAH6MQ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4956869750eso20040625e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788164190; x=1788768990; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Smb1ij3q4+j2lPcpl8bavnYQJRKETN9XFOWwaz+YXv8=;
        b=UJhAH6MQbE9RcG7WreJ/MrezFzNONU5syvUjUMbUyqo0EjV/mD+XcbG0e62o0F88lf
         aGYDmgHBqMshu6nLgMQa7/UGmethwl4/WSw0lL+y4MpIhf4adR4y5pZZrcWMMKWX2jJy
         RTkxGeack1iTjugyGCWZRXNJLoFNO85yso907mxE7WcowR9WuO/AlsfKfYw2kU9Ko78w
         /otRFwsn76Q6GtFH02jv4zX+05gQi1tGr6eQGy18ZBdMxZuo/+G8vgEOvLxBvSsdDwNw
         MWoEzLVKTBKVUG+ype6ExurXvH9oP6AXVLfK/gPLX45xSXfYB71ppsJGk415kXuxv2Yv
         B6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164190; x=1788768990;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Smb1ij3q4+j2lPcpl8bavnYQJRKETN9XFOWwaz+YXv8=;
        b=nRH5r4mQQ2HexDx+KODBRp0GRSpKonLmF/ofr2PjemKoXqd5HG4YhL2p80ognAP8bH
         ztEJrO8pxlAlTv/fr91DzZRh06y+gKceu1V8BKag2WPPQjexI4A5vV3IBSr5yG5aReiC
         GrwYn0AvqBBPCJ5X+ZMRuq3MBay43ORlLB6bZ9EJTv/FKDcjY4r3arhUNebBVR9Dphgt
         hQOgo2nHaFeDmjC3BXyXwdmNV4C3RMf1T31Q6IHiRsDC6p/+Xz4oK2U9raRXSTupfeWC
         /I++L+eKA4Q/XsepBgJoBlF/TIXUNbOHz4ipkyyQ5ansKHwYTd5NjWIjZY1uy+e8Axpm
         QFqQ==
X-Forwarded-Encrypted: i=1; AHgh+RrLcaGLSR+vmT9erdo0Ez3j2lwpeShLJZF15r28yifCe83uAfnUU806pB/ULh6+QU3eGNS4HSrIRXlMMBE=@vger.kernel.org
X-Gm-Message-State: AFuF++mvgZlFY6hSdbdt0e5l6lrRRkpQ7D9nSQpY4hUG4azsZXXZ/fgT
	5N5fAwyrFG5LnUkbYSOVpdOtZRKTExhFBkuYJjWsxcu7PgZazd7OLiBPMSq8SO3agayasXZjPlx
	KDlz1Hsc=
X-Gm-Gg: AR+sD12dH7OGHtQpRA06z/E5NEP5AexV+pukxdvTSL+2K0KBLX33vjttco9MHKUD0WT
	OTBz1xnDLc75VZ4lKmxoEXLHASPmp6Jx2A45559e8xtroiiMs8B8tnBWVuhv7lWXKcs1Kf5e3fm
	fmMF6IAtDLpThXyWJI5ZoAdPqEIIQRV8Q+dXMY0zT7iWi80BWUhgboKDrJJzf7ZYqcUYt0yZ6+f
	uV53KzPQIdYJ4xgV1s722xRLIupAomAyP8Ui60BpL3f6Ysvg8iuxQhHNrqhNTjYo/aKurIRGOsE
	V4jrBeDD1ozJiSottIk4TNW/t0+vi0S4rsDW4fLvE/pLQhCPOeZ65iN2exoKBh1Kmjh5HjgsyLz
	9uwqea7vCH4G47OhlDY2mrAhnr79jLUsRdYqUTgahkDp7U/gA1myoU0rulKtuNEJZJgx6+aXxoi
	sm3xQhRnuZwt5tSEoCIcF/aUZ0E8+14CUZ0AL0BhK/GeLogNGC4+9e8w8Dbl9trP4=
X-Received: by 2002:a05:600c:4692:b0:49b:d03:8d3a with SMTP id 5b1f17b1804b1-49b91c3e5fdmr343784295e9.11.1788164189622;
        Mon, 31 Aug 2026 01:16:29 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd775dae8sm101979645e9.9.2026.08.31.01.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:16:29 -0700 (PDT)
Date: Mon, 31 Aug 2026 10:16:27 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Junnan Zhang <zhangjn_dev@163.com>
Cc: tj@kernel.org, hannes@cmpxchg.org, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Junnan Zhang <zhangjn11@chinatelecom.cn>, 
	Shouxin Sun <sunshx@chinatelecom.cn>
Subject: Re: [PATCH v3] cgroup: avoid flushing global workqueue in
 cgroup1_pidlist_destroy_all
Message-ID: <apU1sXYP_QhsQFcB@localhost.localdomain>
References: <20260814084016.123741-1-zhangjn_dev@163.com>
 <20260814102052.147408-1-zhangjn_dev@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="thvg4hnokvctgthd"
Content-Disposition: inline
In-Reply-To: <20260814102052.147408-1-zhangjn_dev@163.com>


--thvg4hnokvctgthd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] cgroup: avoid flushing global workqueue in
 cgroup1_pidlist_destroy_all
MIME-Version: 1.0

Hi Junnan.

(Sorry for late response, I sketched some notes and then didn't get down
to sent them. Now they're below.)

On Fri, Aug 14, 2026 at 06:20:52PM +0800, Junnan Zhang <zhangjn_dev@163.com=
> wrote:
> From: Junnan Zhang <zhangjn11@chinatelecom.cn>
>=20
> cgroup1_pidlist_destroy_all() flushes the global
> cgroup_pidlist_destroy_wq while destroying a cgroup. Because all cgroup
> v1 pidlist destruction work items are queued on the same shared workqueue,
> a single slow or stuck work item (e.g. waiting for pidlist_mutex held by a
> user-space reader) blocks every concurrent cgroup destruction path.
>=20
> This can lead to kworker tasks stuck in flush_workqueue() for over
> hung_task_timeout seconds, as observed on busy systems running Docker or
> Kubernetes workloads.

Since the cgroup_pidlist_destroy_wq is already a dedicated workqueue (no
other conteders), the pursuit of pidlist_mutex holder is a feasible
theory. However, that would also mean:
a) a single reader taking more than hung_task_timeout_secs (that'd be
   a softlockup earlier),
b) starvation of cgroup1_pidlist_destroy_all() by many (queued)
   cgroup_pidlist_start() callers which goes against the second-long
   caching of pidlists,
c) there is large number of nr_cgroups * nr_pidnses which makes the
   caching ineffective

>=20
>   INFO: task kworker/0:1:1438499 blocked for more than 120 seconds.
>   "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this messag=
e.
>   kworker/0:1 D 0 1438499 2 0x80000080
>   Workqueue: cgroup_destroy css_free_rwork_fn
>   ? __schedule+0x296/0x900
>   schedule+0x28/0x80
>   schedule_timeout+0x1ee/0x3a0
>   ? kvm_sched_clock_read+0xd/0x20
>   wait_for_completion+0x12c/0x190
>   ? wake_up_q+0x70/0x70
>   flush_workqueue+0x132/0x430
>   ? cgroup1_pidlist_destroy_all+0x7c/0xa0
>   cgroup1_pidlist_destroy_all+0x7c/0xa0
>   css_free_rwork_fn+0xb5/0x390
>   process_one_work+0x195/0x3e0
>   worker_thread+0x30/0x390
>   ? process_one_work+0x3e0/0x3e0
>   kthread+0x113/0x130
>   ? kthread_create_worker_on_cpu+0x70/0x70
>   ret_from_fork+0x1f/0x40
>=20
> Fix it by moving the cgroup's pidlists to a local orphan list under
> pidlist_mutex, clearing their ->owner pointer, and then cancelling each
> pidlist's delayed work outside the lock. The destroy work function now
> checks ->owner and skips freeing orphaned pidlists, so
> cgroup1_pidlist_destroy_all() can free them safely without flushing the
> whole shared workqueue.

What's the point of the workqueue after this change? (Mainly the
expiration + having process context for the handler.)

The flushing isn't necessary if there's a way how to ensure pidlists
head won't be used after cgrp removal, which the fix should achieve.


So I'd say, the narrow-focused cancellation may work, no need to wait
for other cgroups. OTOH, I'm surprised this v1-issue popped up only now
and whether such a long contention can happen over pidlist_mutex as your
commit message implies. What nr_cgroups, nr_pidnses could cause this in
your theory?

Thanks,
Michal


--thvg4hnokvctgthd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCapU4VxsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AhlLAEA/qNyYbrCVp9B9CabysVu
B8NRO6qES4f5FwPVH7Um04IA+wTl4Fh/STnr4oIuQRBq2TrjwXZeZplRKT47BJZ7
q10K
=sP26
-----END PGP SIGNATURE-----

--thvg4hnokvctgthd--
