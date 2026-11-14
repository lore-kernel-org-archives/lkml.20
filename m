Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794619085;
	b=IEhZaQZFkNE0Kv8e7KdmVEUt4/I/VvTO74HtWVcP/V/tvSfCwy4sgbRbAodAGP8Y8cYY
	 sW9OiEK8Hqruds3Or/KkVPiJmep6vSOrCXpkVzRssyKylap0DzcimXWvcedAs/Y59oFo+
	 o85DPK1NBSVLQc/xr5tJDnOfvmiqLT1+iFKkmPNIekrXdudyMgQzga0DsD0wrIohfr9oX
	 l8g5iqN9pCUONnbqRIXw7oZK8UX3BZI9YWejhKyGVpt9DaurGjahzi7M1bYT4yJb/TiI+
	 Rt/mC7y06ZqjG00I/OfZmtND/Au4sxyaXGM/+oisihZV5CjlUToqAKFJALCST4B/Dag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794619085;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=KJQaaiL9a5cez/GFapJEhmZC9doVvzp8eiHm2EiP6qo=;
	b=g8IVZRh3n55marHKHdvEQnZYxPmPl6HJPwsS0+U6R0s5z245pzTEAJ/ItC50mQYVerC0
	 hqrXE1s6il49tr9yBA5Rf364LWqYSmxAICkJKNvrJ1uXGpzBQFUSEc7xIud9dp3DBTDE1
	 8x96pvK4OT8vNguTH8iIjOqHH4bMC14+7lKD7N3jhDweLYwBzhe57YGXXabwAKMdUeTuX
	 TZB2p0H4ND/ELtmeweryHx8xJWVUUGx/4bGSA6h2YN30UGBiN97wlCwZV7TV8p4uCfi2k
	 /RagNq0yiVbpfoGfgiFH0QcdopIPMMv95QTndwtR8qKBsA5DPyI23BIPJggfvSDzW9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IvXqZNSe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1C3606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IvXqZNSe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D3D01F000C5;
	Sat, 14 Nov 2026 01:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794619085;
	bh=KJQaaiL9a5cez/GFapJEhmZC9doVvzp8eiHm2EiP6qo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IvXqZNSeX8nxjzrACfxp+FnrpSBEvh5OU7CzrSeI+urhNrhd5pX7qzHR6PoJa9I81
	 Mczal/8JRwufxM7lB4260f3N3xGee3FROSb8oNZbYbLWRVlCrz/IpgU0aC0mdUe6/8
	 E49REOp1Gl2JUlH1Hd8mD6K88E3hOZlTwtXbRR4MPoAKNi0S6YVg+96OggAWn6D3TL
	 5lS1zkDf/CeavRnDUSQ+ay9ShCVTA1GDXKyCbg5Th0PtMUWwfZ4D1j/LQuU7BhiT/t
	 Al6uo+V2K2hwO/bGKdv5wRmGYoUaZzMW4GfMWgIn7r9HHShQPhJXNnSY3AIPv7JwhZ
	 LUCzNs4LM0mGg==
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
Subject: Re: [PATCH 1/3] mm/page_alloc: drop unused gfp_mask from zone_watermark_fast()
Date: Fri, 13 Nov 2026 17:17:56 -0800
Message-ID: <20261114011757.85670-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261113235238.3595412-2-joshua.hahnjy@gmail.com>
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

On Fri, 13 Nov 2026 15:52:34 -0800 Joshua Hahn <joshua.hahnjy@gmail.com> wrote:

> zone_watermark_fast() has not used its gfp_mask argument since commit
> 2973d8229b78 ("mm: discard __GFP_ATOMIC") switched the watermark boost
> check from __GFP_ATOMIC to ALLOC_MIN_RESERVE.
> 
> Remove the argument, no functional changes intended.

Looks clean to me.

> 
> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
