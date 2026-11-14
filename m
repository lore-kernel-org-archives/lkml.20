Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794649001;
	b=qRD1PCgQrTKhKD0WWOf4ePuC5FCPebfn9ru+CjMs7BlMBod85nnn6dRDJs35SNxAA8h2
	 +Lkzhme92rU+0rt3wHE7toFiV3D3bRFqnFdRwD+uUpoRKi7eF9wFnJOOC3YD9hOZqj7Xc
	 Eq8nfVBSKAHc16udv9wycz0LkPmsnrLt8SlYpbXMWNxTNzHTr7Togbz4IKo8As6CKdlit
	 K9oVYECJv9T7j6lCvOG+dRnXz4Pew0YJUPt8ElRr+eFxVSEYPspr4/M04D5Rn3hQUo09q
	 RcIxZvzgTWDG/bYCnA71UNPHH54qGrBDVEGX/8PKpVhlSFk+lNzmR3Npqscfh7OxbQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794649001;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=26oxNda2Jbu3cIX63Z4R9RMnAS+/vo2GCsCa7CBvDvE=;
	b=F4nZxSdRYePbruG33pHohWOjThKYSjAgcr/YuGVVMqa2t9AVUZk+PikkY+wXh16P/rwT
	 pD2d61p9rkuY1FPRv3CFx0bql6Qx/zBb+C6CacfE7qScknW94AjjeA+jOAFZuSIiZ6bd4
	 Pkvw0tZMiSNA9sOT2cWqC3e31OvZmZdJtHoDrzmng9ubhyfKrMZ5SjFvpL0/bTfb3QnO9
	 5n0Myr0kOJAUUaTrPa1ncEcOUszEzxiEybFpuZxq8vFx3NbJOYZ6sAqE/vSsX7/OBE6mA
	 k3Bc9/3PRHQ54TX1DPsqEEjA+qRvTvr9gu+rs7UZQgfiJVTld9euWOIwBT+rT/UIhHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=EP1ghp76;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=FDCDyhPL;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428B1606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 428B1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=EP1ghp76;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=FDCDyhPL
Date: Sat, 14 Nov 2026 10:36:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794648998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=26oxNda2Jbu3cIX63Z4R9RMnAS+/vo2GCsCa7CBvDvE=;
	b=EP1ghp76E7fkW7ZcMG/KnkpNGMrAXuNWemC6+/fjBeEOPtkBBpbC/RsqgCYyD3m5+E0p0B
	0HCIdgjMzCu04LnAnNlPli7q1Ah0LvU7J/ATYLdTQ1O/mfo8zu6V3m0OnG2pHzboIU0iqR
	bu00CUKO0qkgcrhKy/cnEYRw8zNDljEkyOBjA6rHIiibLQqJvDxIFR8brCnn8GgXu3jId3
	QNAZlYZhBSmcxqef8YxYbx2DeI2Blq04hhKqq4zIB3C8ASKgeew7kmCnX/rMCqvDIxsY0q
	oJOL8TqH2l8M2TufzbNq+WMk7W5O0/HBU4zOOQRmQ5JaWmsmQusBlHp5L1fkxQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794648998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=26oxNda2Jbu3cIX63Z4R9RMnAS+/vo2GCsCa7CBvDvE=;
	b=FDCDyhPL8YiXrkcibEM2ZGGZh0iOW1G4ezZonzYCx5ldQpmUFBsxOZqa7dyMF5/pzOkxG3
	o10umt1MWPiNC2Cw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: John Ogness <john.ogness@linutronix.de>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Kees Cook <kees+treewide@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH] powerpc/smp: parse_thread_groups() return error on
 missing property
Message-ID: <20261114093636.mDmlSOhU@linutronix.de>
References: <87mrrbrhf2.fsf@jogness.linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <87mrrbrhf2.fsf@jogness.linutronix.de>

+ Kees, Vlastimil

On 2026-11-14 08:44:57 [+0106], John Ogness wrote:
> parse_thread_groups() is supposed to return -EINVAL if the property
> does not exist and -ENODATA if property does not have a value.
> However, it is currently assuming it exists and blindly calling
> kzalloc_objs() with whatever of_property_count_u32_elems() returns.
>=20
> Since of_property_count_u32_elems() returns exactly these same error
> values in those cases, simply return with the returned error value.
>=20
> Signed-off-by: John Ogness <john.ogness@linutronix.de>

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Fixes: 0af298e62e5cf ("treewide: refresh kmalloc_obj() conversions")

But=E2=80=A6 The difference in the commit was:

|-       thread_group_array =3D kcalloc(count, sizeof(u32), GFP_KERNEL);
|+       thread_group_array =3D kzalloc_objs(u32, count);
|        if (!thread_group_array)
|                return -ENOMEM;

kcalloc() returned NULL on an overflow and did not continue with the
allocation. So the check below worked.

kzalloc_objs() on the other hand returns for the overflow SIZE_MAX and
passes this down to the allocator. We still get a NULL pointer but with
a warning (from ___kmalloc_large_node()).

Is the warning on purpose now?

Sebastian
