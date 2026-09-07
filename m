Received: from out-93wp-a21.jellyfish.systems (out-93wp-a21.jellyfish.systems [104.207.68.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E540B25A2DD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 01:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.207.68.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788744062; cv=none; b=IlRO7BbQ+De4y4SxySb96w+S7TmYGb+i/YbhU4Sy0nkSCR3WRECd3UipsxQ5j+2cd8psrqDimGRYoI082IV4ywUjW12nuHxKJwtuOz5kfOXgMXMnf8L9kGYYzxTpASwMOfFG+IvGvmrk3njfRFw+378tnsjfxC2UMOKZK7G/2iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788744062; c=relaxed/simple;
	bh=GkjOJ8d9UxyvE5Qfn/krUAerwaGWls6tFKcLFeq5Vko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OJdyX5q8IRSrf8o5sDiMxdV4t0xoAMsZYbHem60PesgCemkT8zl3LZLd88bi9EPavIQQjPQ97lZ4Noa2WeHCCIXUU0beX6RptOX/6hvaixZXAUxU3a1VgFMRze0GauB4zXJjo2L/R+7o8ABOOfvqvSMiWy0Dn606k6w+UguNEm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tychen.cc; spf=pass smtp.mailfrom=tychen.cc; dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b=geXed73b; arc=none smtp.client-ip=104.207.68.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b="geXed73b"
Received: from 192.168.5.3 (unknown [69.5.53.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hdTm04Gnxz8sYC;
	Mon, 07 Sep 2026 01:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1788744051;
	bh=GkjOJ8d9UxyvE5Qfn/krUAerwaGWls6tFKcLFeq5Vko=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=geXed73bo5RZf7V0hiBSN9VVo8tY/wf6LuU6zJMz4AorzrH+hKKc+eJJBA73RKjpJ
	 bQMuBMPDDfXfkoPpNh4xqcA3/TtZxU0RqKf2Bd8ogRPnjoEmKGE0VllSsMrkiLZ2y6
	 7aIzum3Xk0vyUXZ88z5b01fKUHRP3nJgmYaADPL/Wa/KEAL7sBYeM/1Dqgn0AvvTKS
	 5h+zgpjMoI3xeyHoXvRzFBk2EjmCgJmap65SWNyqBOU35nvYjxiKUAd9ZahJ9WKFMH
	 FFLoZ80+mGOYUfnFFn8BvY8h0RAGvO7YeQfXT+B9v2On+xgbsYNDtH7B9LVsiXYupr
	 Y+lBKM3/umCaA==
From: Tianyi Chen <hi@tychen.cc>
To: rppt@kernel.org
Cc: Tianyi Chen <hi@tychen.cc>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] memblock tests: model the low allocation limit within dummy memory
Date: Mon,  7 Sep 2026 09:20:46 +0800
Message-ID: <178874362960.1415955.6166620868270535729.memblock-review-reply@tychen.cc>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <ap3LTQlKTpDbAEJZ@kernel.org>
References: <20260906144011.848898-1-hi@tychen.cc> <ap3LTQlKTpDbAEJZ@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Envelope-From: hi@tychen.cc

Hi Mike,

Thank you for reviewing both patches. I have addressed the attribution
and wording in v2:
https://lore.kernel.org/r/178874362959.1415955.18132997964995947947.memblock-v2-0@tychen.cc

> Shouldn't this be PHYS_MEM_SIZE?

MEM_SIZE is intentional here. setup_memblock() registers only MEM_SIZE
(32 KiB), although malloc() allocates a PHYS_MEM_SIZE (16 MiB) backing
buffer. Splitting the registered range leaves usable memory on both sides
of the limit. PHYS_MEM_SIZE / 2 would put the limit above all registered
memory. The comment, README and commit message now explain this.

On the alignment question in patch 2: the registered base is the malloc()
result, which is not guaranteed to have SMP_CACHE_BYTES alignment
(32 bytes in this simulator). ALIGN() also matches the allocator's
round_up(this_start, align) in __memblock_find_range_bottom_up(); it is
harmless when the base is already aligned.

By "exclusive limit" I meant the first address an allocation must not
use. region_end() is base + size, so equality with the limit is valid.
I have replaced that wording with the allocation's last byte being
immediately below the limit.

You are also right about the reserved-memory comment: reserving low
memory succeeds; the subsequent low-memory allocation must fail. I have
corrected that description. Both patches now use Assisted-by: Codex:GPT-6.

The five configuration combinations described in the cover letter passed
with ASan/UBSan, movable-node mode enabled and disabled, and both allocation
directions. The cover also records the separate, pre-existing BUILD=32
basic_api assertion failure.

Thanks,
Tianyi
