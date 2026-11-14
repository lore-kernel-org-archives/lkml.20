Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794620966;
	b=P4HEeALxAWx27LSMm23jD2CrxZfyXpXJQDrhatZLbwy++gC7b9a3exD/i+Hwg/sHdtaU
	 Horz3AVV1TfANJw1lnPI32HSM/xivwyAtSDXtwCRffUETwmiGvhcdiWWXwoN2K3OOPmwH
	 7DQzADD9TC1xFgkkYx34Z5klNQ8Alo/3z6xcf91gT6cmXEKjkV7pmu1ziqRwcTiv+AXhJ
	 sZZykqQgSa3ZlLFyyCX0vaB0DQ2bEzUYQublbvxR4zgPZP8ytelTD1rARYN6Xav0oczqR
	 WFPhQuQrHZCNM/nXbth61Z+Z/3a22zKZP14Gj9CX8Xa3rPEWCdf5ye/+jMunAx9X1Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794620966;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=uEA/O3KkpMmiRM8JdXggkU7r8GbFSfOA2tjkwk4bvLw=;
	b=nnYWPS6S0pwZ9APX/jTiGhs/mEh25GvQagxx2hs/y6bcl/0/VohkEe0m2Z4CZnWkEcis
	 t0fDCdpzXR21iSNCuPVTWOesbZkSrylHamA0Od7OCW4rfFvHDuuf5VDkR55TeEc/9cXVS
	 9Hz3x+njJMXjZ8ZZjS92BZXLY9hFgl46eKhg2z2YGjniioamcyTswQjz2uh5lWKGM1CIl
	 RM9UKwQpkmUE0AaligfWyiWiZ/jBEvMwvZOqEdGRiiikfYBca4CoY7XFgkp8p5ow1M7Vt
	 DTBWbzdKxni6EQjz6Sji2FK7JA8O7jE37Vq7/i3A+uGopGUUO268VuitysVNzl7dI1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=as+ZsFAa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73DB606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=as+ZsFAa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9E901F000C4;
	Sat, 14 Nov 2026 01:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794620965;
	bh=uEA/O3KkpMmiRM8JdXggkU7r8GbFSfOA2tjkwk4bvLw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=as+ZsFAaAa6jPW5pWt3mK5WGXEWGFaBAOvrPpOK9I/LIIb0sJMx9zk0N22j+zXFVN
	 aUK9GP8vlwBsQm/eb7zb9UTreprkDHszo8Mq5U2B+FX47k/g5Cv9kjCjRNLngR7sf0
	 nLS6JdlSG7zZuzBFs5EzgdJgVfLRIfK5hHC3cwuAoW1rcU0So+ZRVOXqP+uR6Kt8TZ
	 pMbVq43hZwg3UOZaz8JMtMAtZtt5vVdRKg3Vq3F7PR00triu8DudncS61QpUsGkWB+
	 xaFG6s2ivdcbfdyWjdgsyj5KASNA1UUAOQsy8ISldgdnkDvIfwZ84+DcuAe4u/MgHL
	 2nbvALK/Vr8lQ==
From: SJ Park <sj@kernel.org>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Zi Yan <ziy@nvidia.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH 3/3] mm/vmscan: consolidate promo vs. high watermark checks
Date: Fri, 13 Nov 2026 17:49:17 -0800
Message-ID: <20261114014917.86531-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261113235238.3595412-4-joshua.hahnjy@gmail.com>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 13 Nov 2026 15:52:36 -0800 Joshua Hahn <joshua.hahnjy@gmail.com> wrote:

> There are three sites which all check the watermark that kswapd reclaims
> zones up to, which is the promo watermark when NUMA balancing memory
> tiering is enabled, and the high watermark otherwise.
> 
> Consolidate the patern into a helper function. While at it, remove the

Nit of nit.  s/patern/pattern/ ?

> include for <linux/sched/sysctl.h> in mm/page_alloc.c now that the
> dependency on sysctl_numa_balancing_mode has been abstracted into
> vmscan code.
> 
> No functional changes intended.

Looks good to me.

> 
> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
