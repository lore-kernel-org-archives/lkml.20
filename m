Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9C1471277
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788941474; cv=none; b=MoEuJu5OSkQSMeSxRO1gS2ORtJMy3TSMXKqoyr22IB86dDWU80ynGeoh8zHOaS7QnknUs41b/+fsW5FEDoPEvv27COCa/FOzAW4qfSt0+tTpcBcuS3DxmRuqVgdN2JZ0lCvNZV9U0hgNDIVjmXxY07lOnU9eXQtpSfh1pqFg+z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788941474; c=relaxed/simple;
	bh=OiTso1d5a58Y1BMzX2FIHCu1q6PNmdvVbYfzdRKL608=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PldADeSucLyAra5TYGgYHANhooeQrHsYZM1/+BARpCqXnUvJqyXcY+MvtShQQdC2lqOlkhfd4O7iHtKubbpbcPMYz6juuZyMnhipnLfYjBRBvik55TOJovNdzXxAaQ+KvR5SNlsSp2Q5D1OcwSrEAWMRUwvQVfadxBRYoqPMjtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=arj3Ow3k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="arj3Ow3k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E5A11F00A3A;
	Wed,  9 Sep 2026 08:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788941473;
	bh=OiTso1d5a58Y1BMzX2FIHCu1q6PNmdvVbYfzdRKL608=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=arj3Ow3kAty1BqGMjvTpCkbTDvgUeGMT4KF2b5tAhLBgV6EPSUv8VJjzEj9fZKQMw
	 iKMBHZgK7Dzpr+AdlIksnK2gHT0A5TQzoKFx4kKg4pTt67IZR9vbKAHZiD2yJ8oVQa
	 i0XBkxVaZAdepPbV3N24LR/9QgXbQHK2YH+3n6dHOCbaTr1B6GHD9/JTVpgUZmXOZ/
	 3osGpDunTaX+CB9aeIQ0CfUHm/Hbis+ZsasOIKv7xowuA/LwI8R+WrImnhlrdzSoLI
	 PEVR/4sHIpcLAV2Vu/0EMlclGNO9WQyN/mR0dpPZV827ii+i9L1Ln12GuMn9n6TTgz
	 OKi6/+j1RyVSw==
Date: Wed, 9 Sep 2026 09:11:04 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Zi Yan <ziy@nvidia.com>, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, 
	Nimrod Oren <noren@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Hugh Dickins <hughd@google.com>, Nirmoy Das <nirmoyd@nvidia.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mm: remove min_free_kbytes adjustment for THP
Message-ID: <aqEUdmYnnQQRC8yl@gremlin>
References: <20260901190123.3511535-1-noren@nvidia.com>
 <d202dcc3-d7d7-4e98-a9a5-3137cfbfd041@kernel.org>
 <DL9XL8T6UG93.1T1NSJMI8PISK@nvidia.com>
 <aqBiVp405v2srvSa@cmpxchg.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqBiVp405v2srvSa@cmpxchg.org>

On Tue, Sep 08, 2026 at 03:30:30PM -0400, Johannes Weiner wrote:
> On Tue, Sep 08, 2026 at 08:24:38AM -0400, Zi Yan wrote:
> > On Tue Sep 8, 2026 at 7:54 AM EDT, Vlastimil Babka (SUSE) wrote:
> > > Given neither of the patchset versions achieved universal acceptance, could
> > > we try just disabling all the automatic (re)calculations of min_free_kbytes
> > > the first moment the sysctl gets adjusted from userspace?
> >
> > Sounds good to me. Johannes, WDYT?
>
> +1 That sounds good to me as well.

Me also! :>)

--
Cheers, Lorenzo
