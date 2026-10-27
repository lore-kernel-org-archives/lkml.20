Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098853;
	b=5PeYonApzV5SvB5+arssAvTCR1vznOx6zqEoL+RqaWO9uE7xLMUmu2r98X6EP3zZ/6JN
	 SVfXb3UwoVXOmGXbjjdZu07aVEknxeRq+W2iUY9FmEGkQpLlhQoppxsRyvXnUqcXCAEWE
	 IW7hdXzPHcpXP478GLIY0Cdfkqbvuun8kmjwH/PDeTwXOWRMtjfo6Esj+VLD0pqYZSkS+
	 enpFFXOGBr1aEk06IYF4MSj51uvA2tDuvaedXF/8ahmHeZO9+zusUmBvi77m1a+7amY8b
	 TiJD7c8vc0qA9up6f0KH7Exs3FMK/1cDHvwrxhiNtdWKTcRSxPfN34CBjT6ijLBn9vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098853;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=iYbvF08NWfCm8zT3/Z6YZVWDxLXQALtM59UBUKduNM8=;
	b=aNU8Fizn6BRLmQitNKFu+gD2B6WUDb8qJb866SPb8yC6kY0fy5eyLeQYRQDi07ZxNfAh
	 +Mp7PewUh2Zayzypq6XtJeZUIT+3jvKKVKpMMMf8nzWZc6fcx5z3gjXlMAuzslVp2N5aR
	 z1/hLPJTRrMKCtpUOgKFcGYEMa/5t2wSZR2cQ258zuhc5mpgHAMRDCi6C7+15hffwasDc
	 zoE2aq/29Aaaz0ml6FYwBakpFLeOO4ClLboI6RSqpXesaEpwjUi1peJY6Tc1g76zlLk+7
	 jLemATagO+5hksR2Lu+3jDlnQ4HpY10k3Eb9NEgsvAT77iBRNgMnJjL5Nz/qAvOATgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MXi70ByI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04DC606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MXi70ByI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A967D1F031E3;
	Tue, 27 Oct 2026 11:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793098852;
	bh=iYbvF08NWfCm8zT3/Z6YZVWDxLXQALtM59UBUKduNM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MXi70ByIYNx77IpBcMisOiA+9HTw5hMBbP5PnuL7cKbARfcX2YXFB3C0Nb8UcfqNa
	 W7Py7K5dxU+H/LWwf90HvhPlYti70w25ed3Bp0XXEM8yFJBsr4Jae0JcwB/LPddQBj
	 wbowNiyNG+uQUPwXlzw25efd1WcYa5K8q9TIwEwEjBufCI3hm8x35zsP5yMFHCjTNw
	 Fr+cX9g11qAge5j4vG2+CaxU+wLE5q0RxEbrRC3L0X1UUh32Yz8DPU0bfxHKZXbr42
	 cKcoCYG4Q+EvbNRoEihL7XrPdCrZ1C4s5HXW6eSRescu4f3xtYyjY8jB9a1Ud29OET
	 K3vcGXk5udPLA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.ams.internal (Postfix) with ESMTP id A87A5198003A;
	Tue, 27 Oct 2026 07:00:47 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 27 Oct 2026 07:00:50 -0400
X-ME-Sender: <xms:X4Tgak2R7XlAMxcuTmHRzIr7ez5GNzfvlc70VSppEbBPNEMAWKFcOg>
    <xme:X4TgavBMDxN8HAJYhYhfI8m4xF2uNV9ZSAzubmbB7aMp-_f92eJf20VVeRqptRDxU
    Cpa1N0lq_PxcAeagHDkZn-OkAixEYe-lWIifrOcDWbMx7lWKGKNDBQ>
X-ME-Received: <xmr:X4TgaoeA5PmS20bEiK9t_Jq2sJ-hY3OIDNV6rg_RAdKVzRC1nvYEofvM2TA>
X-ME-Proxy-Cause: dmFkZTEH5HcaTFB4/RSeaBPIM8m/gt3cZoCwfpNH3mXXlPR7GLTQw5jDkbvPewCqEOsVW5
    cFwyaWOhWKFVYwv12P22aj+aNYkue0yC9RBewdQlwm3Lh3/GIwjOvZCoQCwESE22iMt+rh
    K9T29xYowPMV6PoNNSwNRKOg9HnvGZjwlpo4yoYgKeM1P/BKABmzBZ2MncxxCS+Kn+QHVD
    dBW5I7Wpc5cjpsBHe18buzhlkBhbz+2tFZ1iv8sxotsh1H/xAtJfGKxmlZfoe23OAa8Bts
    +IUtsL4HURjwW3AnXk/HWNPAfrdT63zSAgtUeGNTW/U4jjGTdLpDA0lfnnJ6EyT9m//LeO
    F8OOJyjMwigGTLKPuE7tOzr4pBjRYCkn+ZhJJVjYQsYV47lnK3smN4lP1ypn0oDOxLSTnK
    dPobhxLCH5U+tXuBHS6r5KDsKTNQ9vOglz8aLeDlDh+ixB+GcC+6nYH7w50tei2rn9NTNP
    Um/BNOVL0QXu4E7SuGkf7ITb+dUbtQu3iJGcyFePnaTVSEFCMidZ1SSdQ8j4rfcf30IVjk
    cP93VEA6C2iukCpvePyZh7cMyIaxgTcJE+S0LkMyoAaHh16JtGDqUNiygiYlF3PYfSzH6C
    fyz/477qLwuIohL8Qp5Laa6y1CXUQBE0IPhVmjljA5bwOUsAMyfu2nqb0nFw
X-ME-Proxy: <xmx:X4TgaixYAJ0pnTaK9IF77X7UAhfUDhUA_P2PfnAlXTSilca0kERg9g>
    <xmx:X4Tgagm35jXAkw7DgzpwTcMJnAvzrFpPkF5Lsc7HdPrVpJphW6zocA>
    <xmx:X4TgajBizeJZjVL1GncyI3tnBYYKXr8HvhpRPyMqcMzn57rmeMFKog>
    <xmx:X4TgalcEF7WkatxqDIh4WEP5_y-l9lknxMulooU9hr75sog7f05sHw>
    <xmx:X4TgahogeNgFVcLmxeBz7YDbAUm6oVdAwlYmbmuIFIUe4VLDYP2oguiy>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Oct 2026 07:00:46 -0400 (EDT)
Date: Tue, 27 Oct 2026 11:00:45 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Dev Jain <dev.jain@arm.com>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Harry Yoo <harry@kernel.org>, Usama Arif <usama.arif@linux.dev>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH v3] mm: page_alloc: make defrag_mode retries follow the
 promoted order
Message-ID: <auCDnqJc7fsBpUW2@thinkstation>
References: <20261014202936.GC371161@cmpxchg.org>
 <78238103-3a7f-432c-b1df-bd14d7cf4bb1@kernel.org>
 <atDMN5MoGrwJNpAj@thinkstation>
 <4aa14b41-9b89-494c-8825-55fffd5a541c@arm.com>
 <atiCG2iPrHwDznSZ@thinkstation>
 <d2b8edf0-39ab-4a44-bd0d-58230dee2fad@arm.com>
 <ats7oFM-fsYdUS8y@thinkstation>
 <attOFXch_TchIfEv@thinkstation>
 <atty0n4UzTfI46eN@thinkstation>
 <0757f1b0-9af6-417c-a4cb-eff0b05ba277@arm.com>
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
In-Reply-To: <0757f1b0-9af6-417c-a4cb-eff0b05ba277@arm.com>

On Tue, Oct 27, 2026 at 12:42:12PM +0530, Dev Jain wrote:
> 
> 
> On 23/10/26 8:16 pm, Kiryl Shutsemau wrote:
> > On Fri, Oct 23, 2026 at 01:12:02PM +0100, Kiryl Shutsemau wrote:
> >> The diff below replaces the previous one. It needs cleanup and splitting
> >> before it goes upstream.
> > 
> > Proper patchset:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git page_alloc/nofrag-watermark-v1
> > 
> 
> Thanks! I applied the 3 commits on top and the results improved a lot. Your patches
> make sense to me.

Thanks for testing.

Can I use your Tested-by?

> But still, I see more compact_stalls and a worse compaction success:fail ratio. The
> limitation must be by definition I believe: we still won't be able to use 64K blocks
> from non-movable pageblocks.

Right, that is by design.

defrag_mode keeps the free space in unmovable and reclaimable blocks for
those allocations, so they don't spill into movable blocks. Your 64K
faults never take it.

The price is that defrag_mode needs more free memory for the same
workload. In return, the system does not fragment over time: huge page
availability stays steady instead of decaying under load.

The benchmark runs right at the edge: it fills 99% of MemAvailable and
then faults another 20% in 64K. defrag_mode=0 takes the 64K chunks it
finds in non-movable blocks without compacting. defrag_mode=1 has to
build them inside movable blocks, and with memory full there is little
free space there. So more compaction, and more of it fails.

The 64K fault count ends up close anyway: 20.1k vs 20.7k in my runs.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
