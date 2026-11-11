Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794408078;
	b=djV2ypVFNImKNatIPBLEyEi/P6CX/XNtcFp2igCbtetswAk47c6hsSrQzNBg5sIH1UZl
	 wPvSqI+nd1Et5q2qriTbXjjtAiXl/ITiT2JSxvkXdDuo1kUXvmhD2sc6T/Ee331le0GH9
	 cgZn6AbjTFjlJcIcNNatWEE59dcgr+Z3j91rCq7ZZkilmy5iWf7a4KgHH5OwerbUu/lg+
	 Pf9Ao9fDkGExXmGXMuvkbB8E8ZPEPuzf82+2WfqyapljqtStxchd8Qtu9QsNByl2x/64A
	 cbcWI1JQ5U+DiabVR/r75/dtCt9WvHbhKpyDqcVGQ4Jn1rho0cVowhTnAo/iHBTSWCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794408078;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=gf6vsaNc8fLTLRFyw9X6KKKM36sBkQi5DtInmnt5je8=;
	b=t0Pb6IAj5QKZe40P5bdav031Y5nofi8COOdUDGvGyvWaHKz23dJpkp7uHtJ1CpFnhQnv
	 Ol01dymAC0hEOxgxRyV68B6pVY+s+Xm/nWDpSzqNDLsl5LXDUBdm0nGKXoqT0CfZHi02v
	 gtxu31t+ZDxmwgHYwag7Wbk+IHwNnNdlzd788BcasfEsgVKw/Iog+qOMDbzD8cH/vM0p2
	 NKCJ5t7if1dtIR74ukasMrXCGmmJZCYWX2NWgae8EiRPla7WBKolkfARw9v3bxm+lgwvS
	 fk9G9czuRe8Nhyk9VO1Oufs+0z0nYSPrH8SRJaFGTetik6I1HBaNWme06PiXHHGpYoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K5IyRJ25;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A910A606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K5IyRJ25
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 020BC1F00A0A;
	Wed, 11 Nov 2026 14:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794408078;
	bh=gf6vsaNc8fLTLRFyw9X6KKKM36sBkQi5DtInmnt5je8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K5IyRJ25vo4nb12Q8uzlsNASYrY1p2crHbrg4Js2WyiEZzUozkl7W6rGDwd002o8q
	 LUPIbzT2zCO7YlUav1cN6rg8XMtAIlLkmmUoyA2c1B4tSNVt8Kp1H4vfx3FFGrBglA
	 J8v4jmws3VZGWIFkhqzvjQZtC9jt3/IDRnWTIqkG35ydqry9tlQXSUH/Qz1RrlFURW
	 UAFZ4cqOMz0ZYC/sD5DnH43vZAPr7Yc79PIJzXDzOfuXttcxCZRlOWsYN7b2dq9oqs
	 81ZjQNLUq13sC9oitOzYKjvqXf9hSs7+wMzAVp1BJbcAx4tpMxN9GCnL5HTS0APqoW
	 FdzXvSREL9vGQ==
Date: Wed, 11 Nov 2026 15:41:11 +0100
From: Thorsten Blum <blum@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Juergen Gross <jgross@suse.com>,
	Sean Christopherson <seanjc@google.com>,
	Wangyang Guo <wangyang.guo@intel.com>,
	Krzysztof Piecuch <piecuch@protonmail.com>,
	Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/tsc: Fix early boot crash with bare tsc_early_khz
 parameter
Message-ID: <avR-h8GxJPauXE_C@kernel.org>
References: <20261110150523.187164-3-blum@kernel.org>
 <720cfc7d-69a7-4fc6-aaba-e9d89f3a1055@intel.com>
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
In-Reply-To: <720cfc7d-69a7-4fc6-aaba-e9d89f3a1055@intel.com>

On Tue, Nov 10, 2026 at 11:44:55AM -0800, Dave Hansen wrote:
> On 11/10/26 07:05, Thorsten Blum wrote:
> >  static int __init tsc_early_khz_setup(char *buf)
> >  {
> > +	if (!buf)
> > +		return -EINVAL;
> > +
> >  	return kstrtouint(buf, 0, &tsc_early_khz);
> >  }
> 
> This _seems_ like the kind of thing that should ideally just be done in
> kstrtouint().
> 
> Is there a reason we can't just do what kstrtobool() does when handed
> buf=NULL?

I don't see a technical reason why we couldn't, but that would
potentially change the behavior of every kstrto*() caller and be a
broader change than this fix.

Here NULL is expected (for params without the '=' separator), so I kept
the check local to match other early_param handlers that use kstrto*(),
e.g., set_corruption_check(), set_corruption_check_period(), and
parse_mtrr_spare_reg().
