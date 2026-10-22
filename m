Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792635517;
	b=fjgvOweQ9wcN6Kjm00AkGVadJ2IaCVhZWZLU+TjRYGWUhIpZ4VmOKvKOJya1UdZwN00F
	 FAuvtGNSaaSM/cSj/gurDNcoBolX9OTGjaH6jBjhJQJ84hQHOfiWs2LW0K6HhkkB87dno
	 QGmihfu7t7UftNuPQhXqhtRpFA1crXzz0vKbNImdXuQz5EilMLrvxNnv4z8rWERrE1Zke
	 T8lEhxtADaGzPYd0cpmrbItMOcMVnoJtSbYcSnz/fMjVDXaqU3MboIPdW/OpFMHuPJLN4
	 bLG1Lh7/ATELEs/TMbFvEorlnia87VJQNwWZNSW7R3wj/IUz5CvRpYZv7WW0SDZASUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792635517;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=5FdXvp0CpV6t+Cak3H9/hip6PpHzjqeJ2F/KsA5v8Bg=;
	b=bAPQKxwjVodIXFy/cpIzbglvJm5XF2iq9wnpXhTyqkMnjGmszN1FH/iRRrLF2w2n3PKP
	 ZLJ9/866ignv9yoSValtLFiLGZ3f/Rlrn3S7xvYM6JWXfJYJHma2jURH/IPWQp/TkKJDu
	 /xTNjKKPvC31G272Lni2Q6Om9ArAQjlYqZFL0V7CFBEmwO+KWt7CMkE7X0BNsg3EOwKND
	 um656LfnbXpX0nG93WJI111q0Q7xA/dBj/C1Yr8nAkSHB5LHJANENN5cjGArOoxxNcqyg
	 CmgfJYlX7KEm+tKORgKOxJEoruceS2LIpMbH4ctlvkpkSVj+dEVurCE9jj7IhUuj+Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IBxQWFNP;
	arc=none smtp.remote-ip=95.215.58.81
Received: from mta1.migadu.com (out-81.mta1.migadu.com [95.215.58.81])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EA3606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:18:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52EA3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IBxQWFNP
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=MPi9YymNFv5TIm/0npc+3JpMtggtpk/tzZ51y3ItgYU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792635514; v=1; x=1793240314;
 b=IBxQWFNPCvnFrgSk8wNrkI7Oi/n4lRyy9RW2H4ACiAxmQo+skmFBWY2sjZuCvAUumhz1cqSC
 D19c9ufAOOOr5StR1gJsNJPR3IXEVxdRLOYYRwKOIasZF9J/E9sLrfcmRQY0jjVEbKCnvaVJ231
 DA0VtRiikZiT5pSlcn2zXRsk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 4b7912ba18c63ef4;
	Thu, 22 Oct 2026 02:18:34 +0000
X-Mizu-Trace-ID: 4b7912ba18c63ef4
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH] mm/page_counter: use WRITE_ONCE() for emin/elow when
 parent is the root
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261021204818.3431099-1-shakeel.butt@linux.dev>
Date: Thu, 22 Oct 2026 10:18:17 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Chris Down <chris@chrisdown.name>,
 Meta kernel team <kernel-team@meta.com>,
 linux-mm@kvack.org,
 cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Sashiko <sashiko-bot@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <DE0BFDD2-1BE5-4FB1-AE66-1D4C7DFACA1F@linux.dev>
References: <20261021204818.3431099-1-shakeel.butt@linux.dev>
To: Shakeel Butt <shakeel.butt@linux.dev>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 22, 2026, at 04:48, Shakeel Butt <shakeel.butt@linux.dev> =
wrote:
>=20
> page_counter_calculate_protection() runs without locks. Several
> reclaimers can update the same counter's emin and elow at the same
> time, and readers such as mem_cgroup_below_min(), =
mem_cgroup_protection()
> and the dmem eviction code load them with READ_ONCE().
>=20
> Commit b3a7822e5e75 ("mm, memcg: prevent mem_cgroup_protected store
> tearing") made the main path store emin and elow with WRITE_ONCE(), =
but
> it missed the early return for a counter whose parent is the reclaim
> root. Those two stores are the only plain accesses to emin and elow
> left.
>=20
> With CONFIG_KCSAN_STRICT=3Dy, a few tasks writing to the same cgroup's
> memory.reclaim trigger reports like this within seconds:
>=20
>  BUG: KCSAN: data-race in page_counter_calculate_protection / =
shrink_node
>=20
>  read (marked) to 0xff1f91b146d40e40 of 8 bytes by task 163 on cpu 4:
>   shrink_node+0x57a/0x1210
>   do_try_to_free_pages+0x194/0x930
>   try_to_free_mem_cgroup_pages+0x204/0x3f0
>   user_proactive_reclaim+0x28a/0x4d0
>   memory_reclaim+0x35/0x50
>   ...
>=20
>  write to 0xff1f91b146d40e40 of 8 bytes by task 167 on cpu 6:
>   page_counter_calculate_protection+0x1fa/0x360
>   mem_cgroup_calculate_protection+0x4e/0x70
>   shrink_node+0x53e/0x1210
>   ...
>=20
> The default KCSAN config does not report it, because it treats aligned
> word-sized plain writes as atomic.
>=20
> Use WRITE_ONCE() for these two stores as well.
>=20
> There is no functional change. Readers already accept stale values, =
and
> compilers emit a single word-sized store either way: with GCC 14 the
> x86-64 object code is the same before and after this change.
>=20
> Fixes: b3a7822e5e75 ("mm, memcg: prevent mem_cgroup_protected store =
tearing")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.

