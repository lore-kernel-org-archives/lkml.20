Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.212
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792463347;
	b=qMm15aK9BH/RDO3T0AYxt46Oj3WNSS/pRjxVlXXK7D0MTReGeVT0zfrjMPzoil7dRsvj
	 455v6Ks+H7sPE1OKYXczzDZpotlPF6Hvzgg+tAniwstN5RHz8ptSm6gKWCUnkxItUunF0
	 /0nuAyQe4Gd5uyENmicfbHmp5bPUUIL/sMfjBCjyg2TTlJuVjp9SjK15IIPGvDF9xTKZ7
	 hj6VPpB/S87+vNBrsmjTuaoZP3F89eMZwkfT+GH1Yi07c1H7EClXP69FNRDrzHO0EXpb2
	 BWgl/KuM46M9zb3hl5kwP+wGu9dtc9AHLPGD/tco1i7xAnGCeTb3ecD0bkByMRukYAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792463347;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=TQXRxNel2NXPGE7cNmLoxbySMwttErvNQDqeGZaxUwE=;
	b=VryIRC46XD1CDHjKbsvQdX6zwERT0X6GnAONbkfBz28emjIhxWTE68GLpMPX5Ov5zBQk
	 LyTfwF8UjpW7sIP+mHHI5jhkz96k9GjakQGqablxsCJvtDlTq4o+s97uq7OH1JHFx6n0Y
	 dFqzbl+A+c0eeEU9uC8T2HJrSzBUeLbuoqt744ngIgJCz8GzCtLf8UB4mT/HfP0W/EN/v
	 9KoXosOdkqvqkZ++9JsqnxUG35e9QY8lkg/xIXPWMiKPlDrI8bb9QCa26q5EX8pECkygA
	 lWJ99qdqOSTIDM3IrHdm6L1t0mmFjQDtc4pbWELbatG+0TsOXS68twfddiHxLlxnLXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qUDJQ0nV;
	arc=none smtp.remote-ip=91.218.175.212
Received: from mta0.migadu.com (out-212.mta0.migadu.com [91.218.175.212])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92AB606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A92AB606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qUDJQ0nV
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=TQXRxNel2NXPGE7cNmLoxbySMwttErvNQDqeGZaxUwE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792463344; v=1; x=1793068144;
 b=qUDJQ0nVu66LxGsLtYCr/KVQJFS05FiWeAJBMMrJC3WaqrUDSH9uHHQvV9KYmdtuRY0+skGR
 tRK5Ibf7+XzfGK6IMfjrPeOQ6aqfvh55SY3rB+Gu7MMwMUgZaQjHoRVujLojDirG0ZKftgDcJB3
 G6RLNbf8n3EeO+FHXUWjzZ6s=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id d23a11d20bf69b7a;
	Tue, 20 Oct 2026 02:29:04 +0000
X-Mizu-Trace-ID: d23a11d20bf69b7a
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
Subject: Re: [PATCH v3] mm: unqueue deferred split folios outside the lruvec
 lock
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261019230646.3510790-1-joannelkoong@gmail.com>
Date: Tue, 20 Oct 2026 10:28:44 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Barry Song <baohua@kernel.org>,
 Usama Arif <usama.arif@linux.dev>,
 Lance Yang <lance.yang@linux.dev>,
 Hugh Dickins <hughd@google.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F1FD7E12-C456-4E0E-A604-FCFB45F125AA@linux.dev>
References: <20261019230646.3510790-1-joannelkoong@gmail.com>
To: Joanne Koong <joannelkoong@gmail.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 20, 2026, at 07:06, Joanne Koong <joannelkoong@gmail.com> =
wrote:
>=20
> move_folios_to_lru(), folio_batch_move_lru() and folios_put_refs() =
call
> folio_unqueue_deferred_split() on folios where the refcount has =
dropped
> to zero. In these paths, folio_unqueue_deferred_split() is called with
> the lruvec lock often held (move_folios_to_lru() always holds it and
> folio_batch_move_lru()/folios_put_refs() usually hold it for every =
folio
> in the batch except the first). However, it's not needed to hold the
> lruvec lock.
>=20
> The lruvec lock protects folio->lru and the reclaim LRU lists whereas
> the deferred split queue lives on folio->_deferred_list in
> deferred_split_lru. The deferred_split_lru is a list_lru with its own
> per-memcg per-node lock.
>=20
> There are already other existing callers that call
> folio_unqueue_deferred_split() without holding the lruvec lock (eg
> __folio_put(), shrink_folio_list(), __folio_migrate_mapping(), ...).
>=20
> Add folio_batch_unqueue_deferred_split() and use it in
> move_folios_to_lru(), folio_batch_move_lru(), and folios_put_refs() to
> unqueue each batch of zero-refcount folios from the deferred split =
list
> after the lruvec lock is released and before
> mem_cgroup_uncharge_folios(). This helps shorten the lruvec lock's
> critical sections, which run with IRQs disabled and are highly
> contended.
>=20
> This came out of the discussion on v2 of the mTHP shrinker series [1],
> where queueing small mTHP folios on the deferred split queue was found
> to regress Barry's fault microbenchmark. With [1] applied and
> khugepaged/max_ptes_none=3D0 so that every folio is queued, perf lock
> contention showed that the extra cost came from waiting on the lruvec
> lock in the free path.
>=20
> Test setup: 2-socket Intel Skylake, 40 cores / 80 threads, memory =
bound
> to node 0 so that all threads contend on one lruvec, with each of 80
> threads faulting in and unmapping 16 MB of anonymous memory 200 times.
> With only 16K mTHP enabled, this patch reduces the queueing cost from
> 15% runtime to noise, and lruvec lock wait time (summed across =
threads)
> drops from 491 seconds to 38 seconds. Most of the remaining contention
> moves to the deferred split list_lru lock, but runtime still drops =
back
> to the unqueued baseline. This test uses a worst-case configuration =
([1]
> is expected to only queue folios of 2M and larger).
>=20
> [1] =
https://lore.kernel.org/linux-mm/CAJnrk1a2PpUGTsCgS7jct2KET4K2zAL+_h+te8G1=
MaU9bXs99w@mail.gmail.com/
>=20
> Reviewed-by: Lance Yang <lance.yang@linux.dev>
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks.

