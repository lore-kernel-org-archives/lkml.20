Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F894DEC3B
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791546778; cv=none; b=gdJaAz7UdBl/xtmbwWOX4EvZv9iFOs/WRQQf758T4/mOWKctH+YVj49S/fR/Oja6GJLgSE4/vDbLdvnOidBOKMw8AM3K8NtEXbKzgxneskFhM2O/tc1Xr5MrPle7Kz7kwkP6XGjm6SztT83mtZ+LFxiP9O8xghns+LA0dXPajks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791546778; c=relaxed/simple;
	bh=MPaxLapLIH/2EyNGK1S6Kb5H2+5cvD20ZEOmkko0hkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h7hhrjZXh5Djr3eI7UPsQjco6nbVgCiuJDSP3gVlk4a+VVL3OxkBCCVtGikeWZDbzcwoUdmmvbBDkLvTPnzfmTnW7IEBFsHABRlTTLrKKjR3bKq3hGoSWxieZusWRwRPPfQGKpnotNl5W+HbsfPsUvhUlRIZNKLSxDuQmEBdTy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EmmMOlTu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EmmMOlTu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D24A1F000FF;
	Fri,  9 Oct 2026 11:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791546768;
	bh=MPaxLapLIH/2EyNGK1S6Kb5H2+5cvD20ZEOmkko0hkA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EmmMOlTuplEeuow4t4xT6vfDJs++UDA+9Iy3DZRwR/KKje4t4byk3Is7Wuf7f9y0i
	 AhQfbE2HtbpAby4CLjECGQjpZUOqavTotVpsRRPVQmkKj2Q53FauYRAvjcpwcMvpSn
	 f0pp1MR/dxefBD0cDo7mkpkQIID03DjVhXDxJwt3lxy6n0RsjioFcvXPPVgdEFSrlp
	 aQ1zsm2o63O3JSFtdNCUCJ79fA4aN61tex2rnJ+6uF7BZ62Xb4BqsVgDOVM7q8JG9i
	 KX3TU1JnBAax+VugXLxZxKa1fD+Jy+AMbxaLmniuXMCmlanA21ucKPi7HbeOsXbk2M
	 w1E7vTentQszg==
Date: Fri, 9 Oct 2026 12:52:43 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Li Zhe <lizhe.67@bytedance.com>, 
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>, akpm@linux-foundation.org, muchun.song@linux.dev, 
	osalvador@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/hugetlb: avoid recursive i_mmap_rwsem in PMD sharing
Message-ID: <asjVUa6XBZ8ti-0_@gremlin>
References: <20260930064308.58159-1-lizhe.67@bytedance.com>
 <arzVaC2IYkqSb0_U@gmail.com>
 <9a7c026e-f5f2-40e0-84aa-919c988cc136@bytedance.com>
 <2b4571c5-8e51-4c91-9d88-11929f200875@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b4571c5-8e51-4c91-9d88-11929f200875@kernel.org>

On Mon, Oct 05, 2026 at 11:25:01AM +0200, David Hildenbrand (Arm) wrote:
> > David mentioned that Oscar was planning to send a proper fix for this
> > issue, so I will wait for that patch instead of moving forward with this
> > trylock fallback approach.
> @Lorenzo, if Oscar is too busy, I guess we can paste the overall idea for the
> fix here as well (publicly)?

Yeah I don't see why not! I don't think there's anything that needs to be
private here.

--
Cheers, Lorenzo
