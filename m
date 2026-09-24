Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311AE4A1DEB
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790264377; cv=none; b=B/1L0CksrckRNaemsVRArZ/HhINmlzm+H9SAfTS+4MCoKArUH30e+4hjWFNjzMk9dJLCIXnb7fn4Jx5n+EcgfSPrNgKf80YqA5X3lorkzkVGA/ziJqrRT5bgRxjwv51LF77AQDgSnz2svX7o3Qt9XNDHoXWOzMiMHh92/3l6Ax0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790264377; c=relaxed/simple;
	bh=+yjZtFQ+3WurjjXxejKADaxRZkA2gvsQly6Eeh5HnCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G2rb+qau47TuIRMB6XEXYP2zy9c6wmXQVRF/02Jsl791EeNUvFtlF+FwH0S5EfgFfld8PdD2MDXODsJ/ll0ZbckZcE3xkMRgL6+zr7yBA7L9quZitp+Elhd7q1/ObCGn0NjDPNEzFh/fwrA4HAMQ1b4EyJtgHztgDieVywFqnUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HPY+OX1I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HPY+OX1I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A10B1F000FF;
	Thu, 24 Sep 2026 15:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790264375;
	bh=V/51A88+wcKZYh7YQiVLLkkIW6U8j3LDTQlEVBev4Eo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HPY+OX1IFUI5BVqOQkfPERmKSAn/n4y6s4BtNXRKq+mgnhKm7zWaY6EBmB9tR4a29
	 bHEb4an9nQPrscOJq0VKAD100xzvna1ePl9GVCYhOv4K7FmSLaeCF4qvOMVrnFysha
	 rWaH9SXY0O1+bUuDUIfMi3Wz75+mSGyeQ3djugLUJJORR09kB+mmq+tAoY4/0fG9rd
	 drwzcZrA0CF9+lq12RQnEe1kd+9Bf8hGiJ/apsKOCspHffkVEaVnuOMgdaWSIwN25+
	 tRAnATzo6ouSxDVx6LTlYzAMVQ3274V8vSXx/fCczcehWM+y6qiX68vMNp8UJtvAJx
	 szcjb8uHwnGFA==
Date: Thu, 24 Sep 2026 16:39:33 +0100
From: Harry Yoo <harry@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <conor@kernel.org>, 
	Damien Le Moal <damien.lemoal@opensource.wdc.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Kees Cook <kees@kernel.org>
Subject: Re: [PATCH RFC 2/8] mm, slab: introduce slab_debug=N
Message-ID: <arVB9DuVa28Pxz-a@thinkstation>
References: <20260923-slub_tiny_rework-v1-0-a0e66d536eb5@kernel.org>
 <20260923-slub_tiny_rework-v1-2-a0e66d536eb5@kernel.org>
 <arUx56ee_nkxYP_f@thinkstation>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arUx56ee_nkxYP_f@thinkstation>

On Thu, Sep 24, 2026 at 03:48:43PM +0100, Harry Yoo wrote:
> On Wed, Sep 23, 2026 at 05:45:07PM +0200, Vlastimil Babka (SUSE) wrote:
> > Enabling slab_debug has the side-effect of disabling all percpu caching
> > of objects (now via sheaves), which can be sometimes useful for saving
> > memory for e.g. kdump kernels. To make this possible without the
> > overhead (CPU or memory) of actual debugging options such as poisoning,
> > introduce a No-op debug option that only forces the debugging slow paths
> > and zero sheaf capacity.
> 
> Just to clarify, the intended behavior of slab_debug=- still
> does not change, right? (the name "No-op" could be confusing here I
> guess)
> 
> And My LLM flagged an issue here (that I reviewed)
> 
> Implementing it as debug flag has a few side effects:
> 
>   - pointer hashing will be disabled unless hash_pointers=always is
>     specified. [+Cc: Kees]
> 
>   - Disable slab merging. Since this does not affect object metadata
>     layout, this could be excluded.

excluded "from SLAB_NEVER_MERGE"
Obviously it should be still part of SLAB_MERGE_SAME though.
