Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68947499F2F
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791817744; cv=none; b=UrIHzEgTGy7+Zx2CbsGwRJg1X1nFycxmpGJqCj9TNZVomwcPCCmSFaSJJTJI6CwgNUJneiy18PZ95Ku7GagNlSoY3MKCyDviLB77EUGhmUbhsF0DU7PActvcROHgw+70O+oXbfpjJI/FsHH54y1gk+lvhotNETbAdmHZlpBjnq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791817744; c=relaxed/simple;
	bh=5SZLk/T5PDFY+4H5FHpx+y4HQ24NoRDFrqv4tXSsrv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o2ratfyt7pCWS21zAiu/CxRtI+9bUUaLn5+bC6Ebp9zuBEmunSzgrayAAeGbgvn0x8Llb2HU1oF0TKJDsq2kKD52pbXTmhBi6+GyIIF7UQxzh0rVL05/OwlJapjm+AePRomlr3SD2jRgnCvj8q3SXb9fgQL7LYzgU2cp8QcodZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cPpYf6O9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cPpYf6O9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DB841F008A5
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791817743;
	bh=7BBLP7D5VQ4ig7xnqoWkBX2bQpNScQ1ThBFCaNMPFU4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cPpYf6O9F3/To/aLYR0Fc8OhbJ2LSTgF2efcWyJV4t78sAbeQzuH+VCDPAS6YJG7L
	 SJGEZt5CbTp1CNozBdI4RjgpEYJsswib5oIRlnv6XKwPxjlo6v8enE1VZaEjDQtM8t
	 HKaZx2BpyOvtaQxFj0BoKo6+h2zsE+R68jyYmF9SnhfDnUESdOM3UpDNDaeURzCsgs
	 zNer0C4hxuw1rkNL5syAyqaRVoHvA8xh3spkmXMnQ7wiEd8BzcbdKLId0mdErQC6IB
	 z5ivxE+4Jl7d+Th3NjngnTntVma67blN1ieX71B4nxQHVBa8ft41kV/e+2gN/LdXnR
	 wnvSlxp9vi4DA==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c20ce3c118aso192669466b.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:09:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw1GPb+/dP3U7raOXQLPuKhiOUdEL5Np5KE2BYLxbKLE3f59hf80lrYI4pRbZOeAnYx9k9MD4zGZisMZ1U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJnTZOVK8KVlRrv6BKufmTWvLBIVzIaQBs3PCbG/OgPX5pEU9Q
	Qs9iiU95f5oMDlCVt/Rgkn+CUwQ2OhdqymT8MCgcxwhhLq3hdBzwYu2Ku76E6eT7sgFEAcwhNN1
	eFsE6guoxs3BsXxw1CUw9en3+mGliVyQ=
X-Received: by 2002:a17:906:f58d:b0:c2e:4397:7c82 with SMTP id
 a640c23a62f3a-c31a9d1074emr1078878566b.6.1791817742188; Mon, 12 Oct 2026
 08:09:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007153915.53429-1-alex@ghiti.fr>
In-Reply-To: <20261007153915.53429-1-alex@ghiti.fr>
From: Yosry Ahmed <yosry@kernel.org>
Date: Mon, 12 Oct 2026 08:08:49 -0700
X-Gmail-Original-Message-ID: <CAO9r8zNF=OBGcTU7hGfBz-UOm-fv8BDn-yQzH23e=rC4MX1-Uw@mail.gmail.com>
X-Gm-Features: AclHuK_EARe5wJ3XZ38HWc8GNMx8o66_Dm5CG7tcDTb_VWTs7YmeYdTiYMGwQzc
Message-ID: <CAO9r8zNF=OBGcTU7hGfBz-UOm-fv8BDn-yQzH23e=rC4MX1-Uw@mail.gmail.com>
Subject: Re: [PATCH v3] mm: bypass swap readahead for zswap
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, nphamcs@gmail.com, 
	shikemeng@huaweicloud.com, baoquan.he@linux.dev, youngjun.park@lge.com, 
	chengming.zhou@linux.dev, david@kernel.org, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, kasong@tencent.com, ryncsn@gmail.com, chrisl@kernel.org, 
	baohua@kernel.org, usama.arif@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 8:39=E2=80=AFAM Alexandre Ghiti <alex@ghiti.fr> wrot=
e:
>
> Commit 0bcac06f27d7 ("mm, swap: skip swapcache for swapin of synchronous
> device") made SWP_SYNCHRONOUS_IO devices (e.g. zram) skip swap readahead.
>
> zswap is the same kind of in-memory, synchronous backend as zram, not a
> swap device flagged SWP_SYNCHRONOUS_IO so it still goes through
> swapin_readahead().
>
> Here are the results from bypassing readahead for zswap too: it was
> measured with a kernel build (make -j16) in a memcg, zswap=3Dzstd, shrink=
er
> off, on Sapphire Rapids and 3 iterations.
>
>   768M memcg (sustained swap thrash):
>     metric                 mm-new    + bypass    delta
>     build time (s)          405.0       341.7    -15.6%
>     zswap-in (GB)            79.5        53.0     -33%
>     zswap-out (GB)          144.8       115.6     -20%
>     swap readahead (pages)  6.79M       0.45M     -93%
>     swap_ra hit (%)          72.1        89.9     +18pp
>
>   1G memcg (light pressure, build not memory-bound):
>     metric                 mm-new    + bypass    delta
>     build time (s)          177.7       176.0    ~same (no regression)
>     zswap-in (GB)            10.2         7.5     -26%
>     zswap-out (GB)           27.7        25.1      -9%
>     swap readahead (pages)  1.07M       0.08M     -93%
>     swap_ra hit (%)          68.6        87.2     +19pp
>
> Similar gains were observed on an AMD EPYC 7D13 host.
>
> The gain is from no longer prefetching pages that are pointless for an
> in-memory backend: readahead inflates anon residency and thrashes the
> page cache (file pages get evicted and re-read), lengthens each fault by
> synchronously (de)compressing a cluster of neighbours, and adds
> compression traffic when those extra pages are reclaimed.
>
> Bypassing swap readahead for zswap therefore makes sense.
>
> Suggested-by: Usama Arif <usama.arif@linux.dev>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>

Acked-by: Yosry Ahmed <yosry@kernel.org>
