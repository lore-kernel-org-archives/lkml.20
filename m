Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793740241;
	b=FPFigC2D3amtLeX65Qc3ZgmhboloOmM191Z6mAdGYaAavTiVKEhZ21J8Qw75jnJlyarU
	 3qHPRxow4sdxO7Xr/PWCb0qdBjGaLRy/e04fWGIZrMyyrxBuG57qkjYX/FW/BQwCA78yz
	 twOlLJOSWC+aSkx0yUeHpXQgSzEydVINQg6EyV2JU3lDgZZZSXfdZb7OopMLJ7N2kqVOP
	 OlSXViiN8IYdK04sGM9MYJvB4m7qVL9AqNptfeBJlMhT3cliAlKM47EIvo+8+814L66ah
	 XHaYEwGUCDnMJk9SqvB5HcUR25/noBwHDWdfqzCaEyakrvsVufJEmKlo5m0rwBtHDFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=QfgVica9FpZIxusF6VHYk1fj5PRdNjO2VJQ+laDQ2b8=;
	b=FJ3Z3UM9g2T6pQ3yd7DdCMygjtDxGbVq6loVMLSNH3HjVWfFcs4nQUSdr/Cvl+CdagnV
	 i+uJ6bq/kRNzCWnn+2Sr+15vpuKvzAf+AVsthkbcEC1qKpbTp33vjARI+7GfbLjlrexTY
	 ji6WwVFw3CHGms6//1mj9HYsbzLUJ9824U0LEXKOG5OnJjpejs5yKx6Em2ZW6hPvFLn8k
	 7HV6pc5k/pAPJuUQmaFA/foUwAGlhTSSQDCSUOJCK1z7MEKKaOzBtKa7L0f1/27E6TIMk
	 aCpFgQ6c0tWhPh9PUQZxCR+3Y3idUraJBRXhVYT/Yk/J4M+WLtyvvs1yJ7+twP4tVsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=QkJKllbe;
	arc=none smtp.remote-ip=209.85.128.100
Received: from mail-wm1-f100.google.com (mail-wm1-f100.google.com [209.85.128.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B977606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:10:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B977606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=QkJKllbe
Received: by mail-wm1-f100.google.com with SMTP id 5b1f17b1804b1-4a56e05568aso18808265e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793740239; x=1794345039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QfgVica9FpZIxusF6VHYk1fj5PRdNjO2VJQ+laDQ2b8=;
        b=QkJKllbemhONEWEC5HcRlBbpO7Y32P5htwNpi1buSuukJVQOsy9/hHG+stM7ACb/Od
         6AvnEkh0xnSKRN8LfHc/jHNmWcYbZHMrlzPp6yLNGc7mJSDzD1MshYACbMrDgNvleeUT
         uV6Iqqezs5JT3G7niZw2MtzUc2enV8ifcSx54psUgm6hDHn2UsGfmU3COAZkbx3nHHHS
         FEZ7XE4ivuyjOQCJYwVvKJQnV9iWI1IwN1FmkycEUTfc3qZnndrNaRk5LgRgy8U7dnTM
         CANkpxQiegxfQe2qf0vy9C2wrSE/hvG1Ddx8+nYYMSP9wLaK7lggjIlAObOtVNOuRKgT
         pkIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793740239; x=1794345039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QfgVica9FpZIxusF6VHYk1fj5PRdNjO2VJQ+laDQ2b8=;
        b=RieA64icb62/hOa5TlTI0BdW8bq5OV3fCfWkARPqFddglk5bNwPI5sRDbpxq003XTH
         Ny3p3OUSLxOl3lqwvN1UsC/MpvRN6Van94qy6OkLiWoqCxIcXafxpJzn+ct5Y5K7928w
         c3TTixbb1K4Oi52EZEA/cQnOt3JRoN+HtVdApwzTQ/634Yosic77XjEBjMpDvh9RHz+C
         fNg8pkguiIk6VUJyJ3nhmDZrPlIZB7CEus5sEmOIaCc+HfhEID/NwC+wvO6fYKBJjJwq
         Vp8XldDMOI1BFQMLKu02IBBO8n83iU2SjvJ9pq/to7I/nOrn+6CYg3Arhgwxnpn1WIMp
         1r7g==
X-Forwarded-Encrypted: i=1; AKwUvBy0PE7QIQZG32CRP+E382IjhbHOn/vpx0Str7IXn+htHErMptvaqHT9mfnB9bZUmXcxTemW2vfZLYXQulc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sdbHOTG40ihED9Z6nrGFnQ0H+kJaXUSfe34EyZfi3wIxs2VKf
	l5X4UFhSkLjN4hu6l0HLisD61tpa4WI3Nxjj68FRrTZlysT6L1wzl/+87nnpQjiBvQ4WfvgxD5L
	CLBTyKY+6LzIY8UPGoLHwC0AQkip6arOw3UwMOcYaQrhw/E7iSbq9
X-Gm-Gg: AYBFou28WUAy4b7c9TecQVO6/OuHaSg16lPtVF/FaoDAHiZ8a1anJJqC2SJoJLst3VG
	Nky68xf+Zd+Ttlcba6MnlqQgtIbFz8BYwLIZzhYSKR2NXqEglMLCGwLEfcwSfaIT4iMfizvDc9Y
	W6+h9hab6+QXGqqxJokpPXfC+BIPNDxA57tywlBa19jL0GZINFeB++olJEQ7KC4TXuzRv5ntQ+g
	mu27MmK9rZkFb1N4UAVfURqrpTuTJ0cpa8Zj3HGieWltUPDhXU3N5rYg+YWvI4izNt7In6CcdYI
	Aix+w2RmqPLrcj1J67XWy3/NeVmhHji5hgF/moZMp1+mkWapGv+aDONIa3R8qdzLIo0CdWw6ktb
	Fhp2Xeq5gPoJfJpW5
X-Received: by 2002:a7b:ce0d:0:b0:4a1:715d:1913 with SMTP id 5b1f17b1804b1-4ac177538c5mr250973455e9.1.1793740238663;
        Tue, 03 Nov 2026 13:10:38 -0800 (PST)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id 5b1f17b1804b1-4b43cff40a1sm86955e9.9.2026.11.03.13.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:10:38 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.17.2.4])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 499ED402A2;
	Tue,  3 Nov 2026 14:10:36 -0700 (MST)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 3DD15E40437; Tue,  3 Nov 2026 14:10:36 -0700 (MST)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 0/4] io_uring: improve alloc_cache branch prediction
Date: Tue,  3 Nov 2026 14:10:27 -0700
Message-ID: <20261103211031.592745-1-csander@purestorage.com>
X-Mailer: git-send-email 2.56.0
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

A call to io_uring_alloc_async_data() that provides a struct io_alloc_cache
currently has 2 unnecessary NULL checks in the fast path:
- Of the struct io_alloc_cache *, even though it points to a struct io_ring_ctx
  field
- Of the void * entry popped from the cache, even though all cache entries are
  non-NULL
The compiler also incorrectly assumes the success path in io_alloc_cache_get()
is the unlikely one because it's written as an early return.

Avoid the first NULL check by splitting io_uring_alloc_async_data()'s cache
logic to a separate function io_uring_alloc_cached_async_data() that uses the
cache unconditionally. Avoid the second by returning a separate success bool
from io_cache_alloc() instead of checking the NULL-ness of the returned entry.
Also mark io_alloc_cache_get() and io_alloc_cache_put()'s success paths as
likely so the compiler can avoid jumps in the fast path.

The final commit is a small code simplification in io_futex_wait() noticed while
touching the neighboring io_cache_alloc() call.

Caleb Sander Mateos (4):
  io_uring: split io_uring_alloc_async_data()
  io_uring/alloc_cache: mark cache success paths as likely
  io_uring/alloc_cache: assume io_alloc_cache_get() doesn't return NULL
  io_uring/futex: avoid ifd NULL check in io_futex_wait()

 io_uring/alloc_cache.c |  2 +-
 io_uring/alloc_cache.h | 25 ++++++++++++------------
 io_uring/filetable.c   |  3 +--
 io_uring/futex.c       | 13 +++++--------
 io_uring/io_uring.h    | 24 ++++++++++++++---------
 io_uring/net.c         |  8 ++++----
 io_uring/poll.c        | 13 ++++++++-----
 io_uring/rsrc.c        | 43 +++++++++++++++++++++---------------------
 io_uring/rsrc.h        |  3 ++-
 io_uring/rw.c          |  4 ++--
 io_uring/timeout.c     |  2 +-
 io_uring/uring_cmd.c   |  4 ++--
 io_uring/waitid.c      |  2 +-
 13 files changed, 76 insertions(+), 70 deletions(-)

-- 
2.56.0

