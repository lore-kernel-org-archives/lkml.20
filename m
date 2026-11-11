Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371232;
	b=IQwHE15pWf7YRhFrnU9Hs2wUqxjuwsZbzqSxI8iwdDwmDhiYjIY8KrtpRVuqsOeRPX7x
	 5OkNB1Cbf1zXOuTHOlrP6vTYsQs98Sb+cfQaX7jIL7aNo5PV6ksfVcY8MAkEv+4oS6SnG
	 Ts/xg4lb65pHjsXaWaVbpxkyfERCxAO+YVVPWFRLYIHVOMSvIIQLeM45My9hOxU26mnKG
	 zPpamhCMCQOrwGaOgY+Q/x2cyAVaPVWdHwwzLxidPLxkuy7iNkTH4P9fdfaApVQu9uPq+
	 pgcPUDpb7xPnd2Hq01L+XaUEPMzA3jgI3VvQK4OpBUVQI2qu3KTJ4tmuVO8PtZi2dAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371232;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=LGqKmclckj3cfZIxtbWVIyau2dPaTHxKuUbkCNQn1Fg=;
	b=UT0HNeyViFO9HZr8DN5+VfSbkZEwndTz0za0ruFD+90C3IX1SeQIwQMaUqCbziFmuHP6
	 BU2T6c8Lcy3GwrGo3iTRWH+pLkM3S5lyhGenKtY0VG1/JaRgI6zGm1e+K0kFRaf5fNvx9
	 ohfTP3nLaH1TMhu8M3HjWtVgcUgY4c6wtiR8QHFL7yd91BCYX6DVewVOej2C4bKyMXDCZ
	 4gRqy5+qxJj4lWLQYUaVBdZLh5JghL12IUH60/uRewVOC+5Ickve5hktx76Kaia31+twP
	 uD3FfX82yPvguC7qksOIcwvF2sor0TIycUk/mKF0BE4F6xDNj72yYIIhvHiO2fU5+kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nYQp7BFU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B7A606A338
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nYQp7BFU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 248441F0089F;
	Wed, 11 Nov 2026 04:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794371231;
	bh=LGqKmclckj3cfZIxtbWVIyau2dPaTHxKuUbkCNQn1Fg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nYQp7BFUFIzdRgoawdyBqYZmI+w9TfSluiBVR+T8ogoyB0/FjHao6UO8D+4rOd2ci
	 rInDmEbH4riktfAPkqHMKA53yP2clFtZOWVfuagK2zxph/Lm9wqfDTihu1dY/X9h1Z
	 sKvn+NrYWiJjguH+lHFSqTWqB/eGpyeOUx5p4rFXKiyB799NPgv+SL7vItEsDXFFdw
	 7Ww+p06xe4YYbX+ogc6c2cFzymlHXpMizpxx9FtVlLBw/JPrEjoOK869nLQNsqlVnS
	 VTPpNwFoypMMYW8Agzr7KgCA+p21WQ0cGCcvWvfb6SUdSoAlXSt1pZ3F33okfSjvnN
	 EMf8X5Agqxekw==
Date: Tue, 10 Nov 2026 22:27:06 -0600
From: Nathan Chancellor <nathan@kernel.org>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Kees Cook <kees@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/smp: Handle of_property_count_u32_elems() error
 in parse_thread_groups()
Message-ID: <20261111042706.GA1385646@ax162>
References: <20261109-powerpc-smp-handle-count-err-v1-1-e777fde7f71a@kernel.org>
 <9da4b3b5-cc9d-4a55-9aba-b491f9b222e5@linux.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9da4b3b5-cc9d-4a55-9aba-b491f9b222e5@linux.ibm.com>

On Tue, Nov 10, 2026 at 02:58:32PM +0530, Shrikanth Hegde wrote:
> Looks fine to me.
> Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>

Thanks a lot for taking a look!

> Should the similar fix is needed here as well?
> 
> arch/powerpc/platforms/powernv/idle.c:
>         nr_idle_states = of_property_count_u32_elems(np,
>                                                 "ibm,cpu-idle-state-flags");
> 
>         pnv_idle_states = kzalloc_objs(*pnv_idle_states, nr_idle_states);
>         temp_u32 = kzalloc_objs(u32, nr_idle_states);
>         temp_u64 = kzalloc_objs(u64, nr_idle_states);
>         temp_string = kcalloc(nr_idle_states, sizeof(char *),  GFP_KERNEL);

More than likely. Maybe someone from IBM can validate and send a patch.

-- 
Cheers,
Nathan
