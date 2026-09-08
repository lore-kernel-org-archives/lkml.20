Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC3339AD5E;
	Tue,  8 Sep 2026 07:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788853226; cv=none; b=V5MlvFWX279L4n2W2VR+VQLYu3RaZIDlo1WZkWR7mYKMRORkqi83aRW9Qlf7TnPTbsz9Jqp+Js8OziT2LTwlYKpVpK/PJFdt6xbsInHUlozSw78S3OdzK3ZXc84+LJ0twadoKVAF29NQup2pTC7MoXJCyhs92kZhzNX+ekx1i3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788853226; c=relaxed/simple;
	bh=ZtFakq1jv5kY3gc+C31c5UpPcSkh4Cx4U7/nyTG5QSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y4dYyGkiF/XAmTLbXToJPaTcSCrTXKDZ77kJApX4juyAqnOXKjgMtOkbkdX55EDUQvULrJqr6HLY30KBosK5vuqU+OFVg/xg9bEDDx52ixxotx6FLgFQ8K2bN4D5AUqfgvacOoIXtgNATlm35ozr/ahtAdeKrCi/5GWat/XMt4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iVpMzVBV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iVpMzVBV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81FCE1F00A3A;
	Tue,  8 Sep 2026 07:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788853225;
	bh=dW0Bt6wVwx6uYNJdG4bnYanuxC0mWdhwlxmUwvkpPtI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iVpMzVBVDpbbjmSmLjf9/u1y3Rr+zfuCTrDmGqoJwDmagIYgicropXMGIej4xSaxg
	 6cLeStx2+JupYI5v46SFH93vN1pLOaqi+71OxT+0bOJXF46WT8TIADUbfXr6wM0X6y
	 j1wQEMfYEqkJp0+VVHTg+hRXEBocWl2PZ2Gxdqa96QFMigsr2ZMs+aOiSh09Bl9Nce
	 OQjSjvU/RbtJveqJElRlq/Pv63+Uov2SfEkKZ+0O2mOCeEHPy0le7Mc8q36JU8dfL3
	 taQ9sUCphHLYu4/BTPtAXLlD5cjXs4iaTH5w84MhhGeyR7IHE6ys0J1mEfDUQfC1JJ
	 3Xxl0cUO8U+Uw==
Date: Tue, 8 Sep 2026 10:40:16 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
	sudeep.holla@kernel.org, jenswi@kernel.org, robh@kernel.org,
	mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org,
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 01/10] memblock: Introduce MEMBLOCK_LLMAP
Message-ID: <ap-74AkHSGXbFCF_@kernel.org>
References: <20260902104712.2399797-1-vdonnefort@google.com>
 <20260902104712.2399797-2-vdonnefort@google.com>
 <ap2_926WXr7uAYVX@kernel.org>
 <ap6I1FN_2ylRzFXH@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap6I1FN_2ylRzFXH@google.com>

On Mon, Sep 07, 2026 at 10:50:12AM +0100, Vincent Donnefort wrote:
> On Sun, Sep 06, 2026 at 10:33:11PM +0300, Mike Rapoport wrote:
> > On Wed, Sep 02, 2026 at 11:47:03AM +0100, Vincent Donnefort wrote:
> > > Keeping last-level mappings is interesting on some architectures as it
> > > allows mapping/unmapping pages from the kernel direct map without the
> > > risk of splitting blocks which, under the break-before-make rule, may
> > > trigger page-faults the kernel can't handle.
> > > 
> > > However, mapping the entire direct map at PTE-level is costly. So
> > > instead, create a new memblock flag MEMBLOCK_LLMAP to enable the system
> > 
> > I believe MEMBLOCK_PTE_MAP sounds more descriptive.
> 
> The idea was to have something close from NOMAP, to emphasis it is one or the
> other. But PTE_MAP sounds good too.

Could be PTEMAP if you prefer.
My point was that unlike PTE, "LL" is not perceived as last-level, it
should be looked up.
 
> > > to decide which region must be covered by mappings up to the last-level.
> > > 
> > > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
>
> -- 
> Vincent

-- 
Sincerely yours,
Mike.
