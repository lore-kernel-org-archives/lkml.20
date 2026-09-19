Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D306A199FB0
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 00:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789778932; cv=none; b=YeS8r2ZOAggepHhVGCTGT96SI6+rnQfb1Bm7YkbiOhUwtAdckwwrE/qC6YOpZNrtI+49syIif+0sqQm7CPkHNjfxW9LIMwAm3QI2symsR1XgMXahMT8sbCU7x1ovPz/NhdL6mwGvlD8Unjl+6yaRHFhx6Onq3NsvQqN0eQO4MiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789778932; c=relaxed/simple;
	bh=aplyFlzLOY0x0RFJ7FwTf+yiQ+mBUa3wBc2JeAeoi7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a5rMxLT9bYli/RVSPzVNw57I68JMwh90wTp0kLHMJWV7SolhrfLFSBxKY9lMv1s37ok0eO/UWnjrl1fQBWlZcvS/dKa3rDkQn68FC870dVb8khWZVS7djVRIN7K6jNfTs+WS5Gn9raVHwaIPNsBTGxP1lzI+NiL51qpy/Z0eSOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L+pS3UQG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L+pS3UQG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA2D31F000FF;
	Sat, 19 Sep 2026 00:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789778920;
	bh=ZbvHpq3rRQao+6B+WCd17X6MEA3IqdvdmjyHc+s+Fjk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=L+pS3UQGRU0NBDuFFFnKco6mwe7nk92sCxn80IkjG0FpROgRtIiOvtUSUi/ryt6TV
	 6DRz6tz2R6/HerFUZCnbReYFR6vdpuC75qq12ImULwhtutj8AWHAk1HF4RNKYyA9hD
	 2ea+3q0xWg3swO6+mGxD384Bxx0dNEM/QiPrNdXU5/TGOuUYjEO0v9JGU5t66yQ57k
	 tD5QABx1O47yOULqmje4qs9lUpBoQ2INzfLxTekZNuTP8VeEAOPvB5TrueFUg2qNOn
	 1vN2vIDd5N+8DtM85uRib0QHtyyl/SeQF2lv5Rt2OSrEXo/BM2IbBc82F7u/aHE5Ho
	 bhaHpcyfgnbKw==
From: SJ Park <sj@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: SJ Park <sj@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH 1/3] MAINTAINERS: split up MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION
Date: Fri, 18 Sep 2026 17:48:32 -0700
Message-ID: <20260919004832.87058-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918-maintainers-mempolicy-v1-1-9a94cac6d135@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 18 Sep 2026 18:34:24 +0200 "David Hildenbrand (Arm)" <david@kernel.org> wrote:

> Let's split it up into MIGRATION and NUMA PLACEMENT. The latter is a
> better fitting description for mempolicy.c.
> 
> Make a best guess about which pieces existing reviewers are interested
> in. Move the split sections to keep alphabetical order.

Makes sense to me.

> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
