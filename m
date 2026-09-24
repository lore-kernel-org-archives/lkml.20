Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0515F438466
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790236141; cv=none; b=NYTk+N/jcb/kMYQAltoeGnjuCSakTFAizbz+80SXbS5vfbYe2H172PHxCkW8d4ccbRwNnZbDGf5zqT5XF5btgFLQYNrGWlI/v3PMEHLjEnQEs2ZNuOGSbGrWPPqH23XIXod9SUDorcQfU+Icn1Vi5phlimxaxKyxwD0u42GQrTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790236141; c=relaxed/simple;
	bh=QUQFFI70zUm9WbZ7McadDkB3szE7h30iS5Qzq6qPlvI=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=rvKaXoGH7zgSJzgOLqcxjg8EJjop6mQ5zMSwAy3B/5d9QxDDuzJOzGAdocNqG5gTKl9VLamctwcGZUYGWJJTNctCWoI7pjj+sPwD8z2MV2MNaZtC6ZZvjmaHcPtxygObOHOctL71oGVfacUkT4fp8xtL1BUGeSL8MDljG759ku4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mqappBXw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mqappBXw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE51F1F000FF;
	Thu, 24 Sep 2026 07:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790236139;
	bh=yNBlSGVmSCSWwIU1WW3NDbT3EzEMRJzohOzgWwxr15w=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=mqappBXwD7fCFpxjpMnFJ4+xezpwCQG4pGBeiONihPyf1CZF8NCC4jZG4mUIaI8ut
	 tcK/3Q6N7qG2efqEmCNvLBpnXwoUM6zwex0JQ7Basuucwg8NGvRFLgP9i5VTScCUVo
	 sHD60uYM4iJ2qCrRIJa04U/TvfQrkY6pzaA9dI8b1yRBUXZyQKlp5cako6GPLpEshw
	 wQqNyqg/Bj9RaWpUy/5EFpDlfSXQzulZq4oFmI+FZOqd3buMGk9a1WqIvV/OWs6hD3
	 L7ip6oQxlN0VnIyCjJ6pYxMyEo2cIZ2QpAY6mhQ2FE4WNsW1G0/ljMvkyFOSc27uZC
	 GtSHNr0n3ATvw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 0/3] memblock: Remove unused exact nid allocation
 API
From: Mike Rapoport <rppt@kernel.org>
To: Kaitao Cheng <kaitao.cheng@linux.dev>
Cc: Mike Rapoport <rppt@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R . Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>, 
 Priyanshu Kumar <priyanshukumarpu@gmail.com>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260919135327.74089-1-kaitao.cheng@linux.dev>
References: <20260919135327.74089-1-kaitao.cheng@linux.dev>
Date: Thu, 24 Sep 2026 10:48:51 +0300
Message-Id: <179023613121.508753.1739135911194499722.b4-review@b4>
X-Mailer: b4 0.16.1-dev

Hi,

> Commit ffe55393137c ("mm/sparse: remove sparse buffer pre-allocation
> mechanism") removed the only memmap_alloc() caller that requested an
> allocation from an exact NUMA node. All remaining callers allow fallback
> to other nodes, leaving the exact_nid argument unused.

Overall this looks good to me. There's is an issue though that mentioning 
commit in mm-unstable in the changelog does not really work because the
commit sha may change.

Andrew, how do you suggest to deal with it?

-- 
Sincerely yours,
Mike.

