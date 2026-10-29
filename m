Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263932;
	b=Em9ir9C9lvg4Hv2s/EDKvCJ8T+PlcYqqYZMXqnAro77kz8PKgk2N/o+Dr5xsx/E9AGmj
	 NqsP4VNSBEHMy9OSAcgq6UElSO+iji3nm+fxyat17+O9XlyrcmL16vGFOunZ22O4Oze9+
	 cMPHjUJaUorr/YZpKUzTY/2PynWwc/uodHmT8XcoWWMCzmmld3aes+MedRC4ZzMVJqPf5
	 bBl/UpY1BFHr16jqqy02Q301kkRdDL1xoYVQoQqobIODO/IaHEz7hEerZBYY4WmSswNb2
	 cppNE2DgYAAHiuqcnNxpgRrZk0x4Fl8TF/GLjyzBp+JRDSTn9I7W6bWPQaDDisbKJbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263932;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Ypsz/sPgTiFRwWNK/VexZWZyAZZy8PadU15pG/sRIZQ=;
	b=LyfkT6yDMhfV/nI0gvQrkcHCAZ0YlX6wtlwGDoBPc8HNHDti6eitvfp+arPbNxkKlm1C
	 AbqVdXAVtPCC1SoBPpH12FPEBXVOEh2JVDAztsdUOXUqlCH6fTA4S7XDEmI3XLQ6ewVgP
	 mw22vxF4Pi2eYOQ2g2XRVMiPolM3R/tIV5ghdYDgDAPSRdVcgpymPGTpva56h+0GN+Vwx
	 5OzC/Xt85I9PwcvyL3E1vorJ0N198mkPw4YKTUuD8Mb34eyPd0/1A82uMRZrnGXt50LJ+
	 BDs403NeICHNfn4lE8U+OfhTHP+dZNTz5wa6j1jM28MC1dhUV/hOBcWQ+W0rIdRICTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T4Pm7pI4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285E4606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T4Pm7pI4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A32E1F01825;
	Thu, 29 Oct 2026 08:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793263931;
	bh=Ypsz/sPgTiFRwWNK/VexZWZyAZZy8PadU15pG/sRIZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T4Pm7pI4GJAQ3ZydAHSI3T3oxrqmvJ7OuI13RnTZNRgMyFKnNsWcFStKqL3xWHT+N
	 nE0GsdRnCMyNmNM7rVz7LGLfHOVTJ09piHhF2zL/4tU4kechuYBepeLvdvlFBKSC84
	 nqb2GVfJ5Lhgzj4k7hUcYNMMsYcEGBT2+HmMTIaZKSlg27Cjoe2xWpONzORpM+KOCv
	 zsq0AOaAk3dg6yMa+iC5gviydILFU1B4OhnzSYQXPfD8dZSloVZT+MBTntXKku/ZrR
	 xOBvh6RoqIgKNcIAHd2Tjd/8UBFmnaINCcwe9+RfqJSrxMW2uKdcVExrgYZg8AyBbF
	 jioS0PPkyzQjQ==
Date: Thu, 29 Oct 2026 09:52:08 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: yaolu@kylinos.cn, jani.nikula@linux.intel.com, rodrigo.vivi@intel.com, 
	tursulin@ursulin.net, simona@ffwll.ch, chris@chris-wilson.co.uk, 
	lionel.g.landwerlin@intel.com, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915/gem: Reset err for each fence entry
Message-ID: <auMIzDFYibxlsFcv@zenone.zhora.eu>
References: <20261027072832.726435-1-yaolu@kylinos.cn>
 <auHeqGZ-hm2lS7Nk@zenone.zhora.eu>
 <179325911095.16507.8295053984620715316@jlahtine-mobl>
 <auMDxbKZ-XmRbaUH@zenone.zhora.eu>
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
In-Reply-To: <auMDxbKZ-XmRbaUH@zenone.zhora.eu>

Hi Joonas,

On Thu, Oct 29, 2026 at 09:36:05AM +0100, Andi Shyti wrote:
> Hi Joonas,
> 
> On Thu, Oct 29, 2026 at 09:31:50AM +0200, Joonas Lahtinen wrote:
> > Quoting Andi Shyti (2026-10-28 13:39:14)
> > > Hi Lu,
> > > 
> > > On Tue, Oct 27, 2026 at 03:28:32PM +0800, yaolu@kylinos.cn wrote:
> > > > From: Lu Yao <yaolu@kylinos.cn>
> > > > 
> > > > If dma_fence_chain_find_seqno() failed once, 'err' will store val in
> > > > the following loop. May causing returns '-EINVAL' even though that
> > > > entry never called dma_fence_chain_find_seqno() at all.
> > > > 
> > > > Fixes: 13149e8bafc4 ("drm/i915: add syncobj timeline support")
> > > > Signed-off-by: Lu Yao <yaolu@kylinos.cn>
> > > 
> > > pushed to drm-intel-gt-next.
> > 
> > This was pushed without any R-b, DIM should have given you a warning
> > when applying the patch.
> 
> I forgot to add it, or rather, I remembered it too late. Since
> it's a simple and straightforward patch (most likely LLM
> generated), I didn't want to make a fuss about it.
> 
> > I've reverted it for now, please use DIM and check the warnings before
> > merging stuff.
> 
> I used dim and apparently dim is not enforcing it.
> 
> I'll push it again with my r-b.

Now it's pushed with my r-b.

Thanks, Joonas for looking into this.

Andi
