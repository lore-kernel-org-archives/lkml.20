Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACB83E49FE;
	Fri, 16 Oct 2026 08:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138301; cv=none; b=kycyRKi7KZUlcVpzLeoRAemt5HtO81AyoIaVoOyTNQXFVnPd5vsUjdRdtWS8xdTPtKQkjyyl77iDUXuogU1LVWVIhxi0V6gfgnqP/EpjJjFUfaD+pqEbR+1MlTXlMjmml6WgPxYQslWQ5qeSFpiAjBboTNd3qxFGNc6p+CxVqWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138301; c=relaxed/simple;
	bh=fJ7CvucKno65olNhbcWL4ZDFKdJHu9ghSScEyiyfRC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JRNF/Oe/c6mg6yvTm7vB2Ac/j1BcoE8V8LEcH0xYjAv8OxKIaUhIQPF9bFjiIk2ZmKnb8xXL87PFaT7ReERWNmPlQVYIUdHk/oNZwZl8q/Ylex5+z8GvB1+jfkEZdmvbvgqkZFyzorXf3QYkmZkBZOZuut9AEsIi4ogTlyYjFEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y9Qc3KBd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y9Qc3KBd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 886951F000C4;
	Fri, 16 Oct 2026 08:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792138300;
	bh=BBGAT7ue9VgHZMuu5dAb/6oFafAsXIvH9NDdySY61DU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y9Qc3KBdcZWgZjWsaAYnSgSER1uaz+BaIQ2eo8wOVW2XevFfSrviKphX0IpLqNOQU
	 J3rNGys0fEfxFxyjD6NGhqth8kxZet5yd4j+UsdTVoDsSdZuH5UcQuNWzG+QRh8swv
	 egdH5IAmn6eWndutGah39BCtH0vUezekNLRCZ/vEUFLRL0T+VyKxINBN8U8s7r7QoL
	 3wBKxEC7c6UUQPYd9jPvqWr8zcYJY9m+RumfPmgmejL/Q6Fnj+lTXXDJjsOwGOZJbn
	 jdxy1IRC7v4xAjsIrHPzHSTtR+yWxvhHddNJlK4RSEzryGAgYkHiU9392IxR1qvkkX
	 GGXM7I2+M3iDA==
Date: Fri, 16 Oct 2026 09:11:30 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nimrod Oren <noren@nvidia.com>, David Hildenbrand <david@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Brendan Jackman <brendan.jackman@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, David Laight <david.laight.linux@gmail.com>, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: stop recalculating min_free_kbytes once set by
 userspace
Message-ID: <atHcD0azFKNLvPN0@gremlin>
References: <20261014140859.1006967-1-noren@nvidia.com>
 <20261014144823.8c89da26c547fa95936a2fe5@linux-foundation.org>
 <26103c38-7b22-4176-8bc3-63e4b8fc6bbb@nvidia.com>
 <20261015173826.e7ffb7333fb84f5be927ae88@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015173826.e7ffb7333fb84f5be927ae88@linux-foundation.org>

On Thu, Oct 15, 2026 at 05:38:26PM -0700, Andrew Morton wrote:
> Do you (and others) feel that we should backport this?  Or is it just
> not applicable to real-world users of older kernels?
>
> If we expect there to be non-zero users of 64k-page kernels on older
> versions then I think "yes, our users will benefit from this".

This is a functional change, so I don't think a backport is appropriate. We add
useful stuff in newer kernel versions all the time :) users who wish to benefit
from them need to update their kernels.

--
Cheers, Lorenzo
