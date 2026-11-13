Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588516;
	b=vCSS8h1v0ufE483up9eup6sQgGe5h5hQKQXRHX4XVPDDJS9rcX6cGwuz/qNoIW8kOofF
	 8eNfd1b6R4KJuCq65owtpoh5wvg5D5+7sc4qZYGidj77jb7kD+R+UaSgDs33bmk4HbTGh
	 fxOS7/MoNKG2Wtomh/Zi5RW/g0sYZxMw7RqFGp3tCc10CdV5oNOIC446y6E0WvBWT/TIY
	 UX0u/cNkEbNXcqqDSwi74OAVAvGDjSdof0413WPdzTQBLPznJPaJhwXJcSGFxpeAV6KtZ
	 7Jh7PG20C9xFCbWqLcKrgqfK1aJ/BoJRJaPaSczdJ1rPvLul8mIi/qakFp4BU/mRbHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588516;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zRTBPN00ennq6rQlp8MX60novBA/nnmfG2AteR92IcA=;
	b=yyoS1p1Hj7C0c/Z1/XrZPavE1TpOOEvJfGAHQmXEtOBzRN2MOqFV3FwcPug06aYZ+9u0
	 8h1AAaiZkvMe3Pa+NhE9vaZ1iM1XlX3+bAe7PpkbEh5f4fwM51IzEGYjc4Y2c8aKM2Plx
	 rLrFtvCXNoPT0/opDslp9TlhEKx/jet7/ZzisMQ5p0w6xQUfGN/Vbg4Lz2Zg3guwa7mk/
	 efssgv9CQ5y02kS7UpzqjCVhv1Q5goCDowV7b020drY3czpQfts+j8Pa2l6RubUr5HUSj
	 N5qHIBUNM8ztvCuxAtFhDZJaGuVRWJ49wjsTMYHRtTzDVJ/dXxeHRDGxHZDWzceuGng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="FpPY/s2D";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A33606A8AF
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FpPY/s2D
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 506491F000C4;
	Fri, 13 Nov 2026 16:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794588516;
	bh=zRTBPN00ennq6rQlp8MX60novBA/nnmfG2AteR92IcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FpPY/s2D3NbqEstY5RVQR88cqhbB1vi+TrBmf6gt9yQBvjdk1kdX79Xvl1+XZoNgP
	 We8ZE0Scqz1J5e+jRmeKHd3r9MyH+wzZG/gf2VfX3MB9h99FuPix6eQ5589EViffCx
	 Ubwndg+aZ0bBd/lYy8Hpxi0z/5Rg9cxEOYbYm5mAJMPPl2mf8NrxLFc8j9EyIIg8uy
	 bCSOUs8nVCF2N5Lh8JuH1JR8ntxIDG3lclrkhg3V3yQ6f+zQwZrU0+F5eocjc+t8uP
	 1kE9T4HbUn+FaMOe4+VmcSc/IW245EUQlUGUnqqIlCjKemThH6osIgFUKWmL1dFMit
	 F4tDoKQU8woiA==
Date: Fri, 13 Nov 2026 16:48:26 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Eliav Farber <farbere@amazon.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, 
	William Kucharski <william.kucharski@linux.dev>, Vishal Moola <vishal.moola@gmail.com>, 
	Alex Williamson <alex@shazbot.org>, Matthew Wilcox <willy@infradead.org>, 
	Peter Xu <peterx@redhat.com>, "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] mm: fixes for huge PFN mappings
Message-ID: <avc-GTPIpOZVzwvX@gremlin>
References: <20261112051440.16140-1-farbere@amazon.com>
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
In-Reply-To: <20261112051440.16140-1-farbere@amazon.com>

Hi Eliav,

Thanks for the report.

As discussed inline, I'm not confident that you have a deep enough
understanding of the relevant code, so I will take over the series.

--
Cheers, Lorenzo
