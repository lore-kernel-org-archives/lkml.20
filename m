Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5A949AA35
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789994191; cv=none; b=loaE4EDhrQXcJUmQA1GlK/DaWcFMmID1lbR//x1EE8KlV8hmfEcK2j7gbaipPHUTKLXjHwLspJmd9ZIvcgJvN8fjF5R2iRGTFmkv7P+4BoesQMIofLo0ofdnMO0gLSjcLXqdHKA4VVZ18413HtyFb/a4LN/jDTvT6cP13I9solw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789994191; c=relaxed/simple;
	bh=mUl42OlsR9wHyuKBipczgzwSK+FHsymbSpbRPh9e7Do=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PpkmtZeU0wkA/4daWQIzCGHaYErrMYLfOeRnciJGg92DnpA9RX+S028BF+D3lHQrYwXofx2w8zJqbJtwQ8F/LrMRF11UaMpYjczd+1V5Tvtk+lm3rTrjGP3RmBcA3L3vOZUrJsorjsL9wkhr2rxFJF+fJ7iUpOk4L/enG4zp3dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J4kZcT/a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J4kZcT/a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACCA11F0089B;
	Mon, 21 Sep 2026 12:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789994185;
	bh=gNbuG7YPUwGnu291NOoq4XdEL23SA/SC4CBEZ8BBaao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J4kZcT/agr85+vQTRPO233PzvBZdNcYdc9+PRXc22BN55hbaj489UjHHrfv7tn7/K
	 fAa2t+HMjrQ+dc3JOdsQHbVcASn0zUPBE2WYw5y9+6qPS+sSjV4ICZAGgksfeSfDxN
	 YNvCPHfUsB9MpPtHXui5NWmkzGUnFdhCSxZyvMhIXMjOGanY/Q3rphkD3arRuPREsP
	 Tk20IursSjtYecT5UGLnGDT1J5PPDN9cwqgPHvWQBegoeTfdU+VKwiln1DNLdHaLSn
	 MVRF7s5ToVYRBETbJfEFa/EzwL1ehQ5sawvhgK0XCLuD4SS/H+JLPs3akF1tZO+Gp1
	 Ibk6OwvVFwRTA==
Date: Mon, 21 Sep 2026 13:36:20 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Yuan-Hao Hsu <aa9736195201@gmail.com>
Cc: David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, liam@infradead.org, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Barry Song <baohua@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] mm/memory: reuse the whole exclusive large folio
 on a write fault
Message-ID: <arEkcIb7JQFd4zzI@gremlin>
References: <8cbbc303-59a5-49f6-bc14-28fbb58350f0@kernel.org>
 <20260919111843.656-1-aa9736195201@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919111843.656-1-aa9736195201@gmail.com>

On Sat, Sep 19, 2026 at 07:18:43PM +0800, Yuan-Hao Hsu wrote:
> On Sat, 19 Sep 2026 12:08:35 +0200, David Hildenbrand (Arm) wrote:
> > Please don't send out a new version
> >
> > * Unless a maintainer asked you to
> > * At least one week passed
>
> Understood, sorry about that.  I'll sit tight and wait for the review
> of this version.

Also, and I am struggling to believe I'm having to say this, don't
completely ignore feedback you've already received which told you about
multiple process fails?

https://lore.kernel.org/all/aq1CjdaPUg_Fos0t@gremlin/

--
Cheers, Lorenzo
