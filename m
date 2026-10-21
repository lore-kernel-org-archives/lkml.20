Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.215
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792549204;
	b=A21cO5DeZFU1TdjbjxY12l2bAteN2AM+N+GFTlOsItm3l7rFGK+Sv2orBOsnmtAIy+iq
	 X+W77BSoh9oAQI0mb5WKJjNcITq+wUiv+rYVGKgoooovF8o/WX5JtRXN95qe5raTKn0i4
	 gPZY1+L2LKdsOnEXz3TsiZ5dksi9nItagZ2tR/xHv8NLcs1m4UhgpxqIc1C+0DgQZAZ5Q
	 LbR4W5weIRDZuZ0dum76TDm2OCRuoMUIbDN3BejIlpw3WLPYxkFsd5/+6LuKMdbotkwwO
	 41gI3IhgFRaPl+SgEyKph4C92K1eJJceOVf2OWxmXcuDvphwmAU6jSb06G1uPdR74dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792549204;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=IS3HzQsVTkIeTc0iaBJwnuHykywhycd2wsPXhFDZrhY=;
	b=WKlWlWzxhEiQ0v5zhxlWPcWl3G9xX2gqth3rdM3KdiPgfyXmr8T/u9LVwmwwGJP2uQb3
	 3chClNLQ9hTEVIaiTWqWBVZZbhCY1DQT0afR0Lm2U6ecFgt7fPiOdOTya0qxWS372km8p
	 aLxvU5hxLBtd/JZg/vCZVSin8gKQX6p0bxcNZQSBVaQU000EgTdI/aXFWnPXKe9LntVuL
	 05p2zLmBPT37NJze7YPJB0rCosaAOj2AkHF6RiUrKnmWbUw25n3wqPryjqZ+VRHicNbcF
	 LIZNMmNqqCzlZ0tki6UsBiO7/HasmUa+kshmi+yzpJhZLFwFCqvpHItpi6XzcwvL16g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GYS4s55V;
	arc=none smtp.remote-ip=95.215.58.215
Received: from mta1.migadu.com (out-215.mta1.migadu.com [95.215.58.215])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132B0606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 132B0606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GYS4s55V
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=IS3HzQsVTkIeTc0iaBJwnuHykywhycd2wsPXhFDZrhY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792549200; v=1; x=1793154000;
 b=GYS4s55VQLaoQUG/KpL7pbvqjQmifo0gLWl24dsJ9TUXfA+g30YxBwMZh19NZDzqvU40ORqw
 eltzGZOCvbCQ57eBYyDWFiyRbuOkMN23lQn6rC7o8JF+PggGWrXet1GfG6zhoryqGMDhrXoXZSr
 ehWktsa+vgY+QvClxHGcuJcM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id beee1f0f72299f54;
	Wed, 21 Oct 2026 02:19:59 +0000
X-Mizu-Trace-ID: beee1f0f72299f54
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
Subject: Re: [PATCH v2] mm/memcontrol: publish null pointer before dropping
 css reference
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261021010051.1529261-1-joshua.hahnjy@gmail.com>
Date: Wed, 21 Oct 2026 10:19:42 +0800
Cc: Johannes Weiner <hannes@cmpxchg.org>,
 Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 cgroups@vger.kernel.org,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 kernel-team@meta.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <20A5D936-030D-4080-B585-1200BDE164A9@linux.dev>
References: <20261021010051.1529261-1-joshua.hahnjy@gmail.com>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 21, 2026, at 09:00, Joshua Hahn <joshua.hahnjy@gmail.com> =
wrote:
>=20
> struct memcg_stock_pcp hold references to cgroups that it tracks to =
make
> sure that the memcg never gets freed with unaccounted charges still
> living in the stock. When the cached stock goes to 0 for a memcg, its
> reference is dropped and the cached memcg pointer is set to NULL.
>=20
> If that was the last reference, the css_put would free the associated
> cgroup before publishing the NULL pointer, which can be racy on=20
> PREEMPT_RT. To summarize Shakeel Butt's analysis in [2],
>=20
> CPU 1 CPU 2
> local_trylock() takes a per-CPU
> spinlock, which is an rcu read
> lock along with migrate_disable
>=20
> drain_stock
> css_put drops the last reference
> release work is queued
>=20
> kworker runs css_release_work_fn()
> call_rcu() starts grace period G
> which waits for the refill task.
>=20
> <preempt>
> drain_all_stock
> is_memcg_drain_needed()
> enters rcu_read_lock(), but
> grace period G does not wait
> since it started after G did
>=20
> <prempt>
>=20
> stock->cached[i] is cleared and
> unlocks. Grace period G ends,
> old is freed
>=20
> mem_cgroup_is_descendant() reads
> old->css.cgroup which has just
> been freed.
>=20
> To close this gap on PREEMPT_RT, switch the order of the referene drop
> and the publishing so that we publish the NULL pointer before dropping
> the reference. Note that this can only happen from drain_stock who can
> hold the last reference, but not on consume_stock since another
> reference will always be held. But fix this in both sites to maintain
> consistency.=20
>=20
> This is based on a report from Sashiko, who found this pre-existing
> issue in my page_counter_stock series [1].
>=20
> [1] =
https://sashiko.dev/#/patchset/20260928192349.3432886-1-joshua.hahnjy%40gm=
ail.com
> [2] https://lore.kernel.org/all/atfMngq7nyZpt4u-@linux.dev/
>=20
> Fixes: e1a366be5cb4 ("mm: memcontrol: switch to rcu protection in =
drain_all_stock()")
> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.

