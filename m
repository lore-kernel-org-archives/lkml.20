Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793307546;
	b=X0ufJ8RkEJUWPVLeNgKaea+3q5QTz/ITbwTekxZFDOAYqY++Fs4ME1Iy8zcoGlfDa/qR
	 izGRSNEdVZ69qmlihizqY6h1HwT8Ce8rcQjIN6kD8r7sRgQCPU81wWN/ru24Kn7NcKx/J
	 xwdqXgderDUvAtCCE9NJRPeb9eQ2VjJ2g4F/MuCdTAJKfJ7bs3v74ozz+te6R9kwF7Q57
	 A4riiCsr+3qAsNAc98+yuDvbvZhfEkAauCH60VqrejoTmg174qzwwqbdALUYdey1IyyC1
	 7GiwXBkwcWF7Leykyy70a16nrnWzPdlGJBcDoerjf5rf4z/u9wg7rAbCYEoRsqCHh1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793307546;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Wrz5dmAaDurZZfTeBzHlm9n0015a8frVXDMMr6vuISA=;
	b=F1SpxUOiMVqHvrMvq63Hb7xUkF48uFUYEgSAQP8vhT9UN4OXwaewjt3h/3XTGgLxgYGF
	 m+Y946M/LrTYmWCiGewqw1hn/h+akprjGVfo/CIpMX41QTv6MfFWvOM2OXJ+IkQ8gw5+a
	 jNNFroYcJXvpVPXBJt3Z2wpLctcUiRFIFPy/kmoF7NxYWJRKQZPXVuXQsdbh3LRfZRNlj
	 CIDIErCRtO4PZdXmWs8B78aIMRoMeSZhZvVnC7ST9Hf4cCzEZy0x0DW8AiIKcaSRtjWvp
	 cj6R24F9nY0pWc3UkNONHlqCiwYQQYpHRVRXjg9BsgiUFtCYWJofxb2DAo7v+5SXktw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="jmxfRq/W";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741B4606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jmxfRq/W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08EE91F01816;
	Thu, 29 Oct 2026 20:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793307545;
	bh=Wrz5dmAaDurZZfTeBzHlm9n0015a8frVXDMMr6vuISA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jmxfRq/Www1yiDpn1schwv1eOjCzvV1jdqrAyTBwFUbhooyCD9Hh09WufuAsXVa5w
	 2gyuAiZnG7ESQFGJzF11UBQMnd8J0p74JWspKeGENsEVpJEX5jetL3DCtMNwdYSVIc
	 5IdDa+uG2IooRd9FXP+RPZD/d6I9Yfz6raCyjitjjNhnl94fCA1TBdbgYhdHO6d1s4
	 GyoBJopzSOIUBXoWb60wacVfwCK1V633BD/zZYTQ+Vgz6gpufUsateRPDwcP0KqrSp
	 RCNNVjSLhTz+zXEcOdqLLB7KtEgqLNrUkvqpYwSRuMnL5ng0GDVbJWK0+tDXqkusrJ
	 Cm7nwAEAnTynQ==
From: "Harry Yoo (Meta)" <harry@kernel.org>
To: Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: kernel-team@meta.com,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mempool: fix min_nr exceeding the elements array after concurrent resizes
Date: Thu, 29 Oct 2026 20:59:01 +0000
Message-ID: <179330739525.606664.13318485044610934477.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261016132510.789715-1-nickolai@csail.mit.edu>
References: <20261016132510.789715-1-nickolai@csail.mit.edu>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 16 Oct 2026 09:25:10 -0400, Nickolai Zeldovich wrote:
> mempool_resize() shrinks a pool by dropping pool->lock around every
> free_fn() call and, once the pool holds no more than new_min_nr
> elements, stores new_min_nr into pool->min_nr.  new_min_nr was only
> compared against pool->min_nr before the lock was first dropped, so that
> store assumes nothing changed meanwhile.  The kernel-doc allows
> mempool_alloc()/mempool_free() to run while a resize is in progress and
> the grow path also copes with concurrent resizes ("Raced, other resize
> will do our work"), but the shrink path does not: while its lock is
> dropped another resize may shrink the pool below new_min_nr and a third
> one may grow it again to a size between the two, replacing
> pool->elements with an array of exactly that size.  Storing the stale
> new_min_nr afterwards leaves pool->min_nr larger than the elements
> array.
> 
> [...]

Applied to mm/slab.git slab/for-next-fixes, thanks!

[1/1] mempool: fix min_nr exceeding the elements array after concurrent resizes
      commit: 8dde7b06d2d819422c736dad7efb9635b6673cc2

-- 
Cheers,
Harry / Hyeonggon

