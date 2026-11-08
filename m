Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.238
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794132550;
	b=xLLQxl39US/65nk1Se3fybM7xwNV8ba9/YJJ05ABKJvd2FoPyffFJVeqm7f6o2vPzYG+
	 rAYgAwlYKoj9B9ENbXYmUw5g4U2xAS0E+78YLim6mTKmrXaJh39pySJu9ithQB6vnkhGl
	 HA4Fa9WzWQx/8va6/ptOQSjgJM92hAPtfPNADJVvuohVed+vNLmuNnTCiaogVnQ1OTamX
	 wYZ09BLg0eDTgoqbEzKmgCzJBWhVlEV3Bbv8eGEKCNV52Ww4tDOHvpYvmlrynnrwHmyyc
	 IiRHMghXjqaGAHM9n3uIUucuFnvHo1M2XlQGpeyGnEaxcCJAZIofKDCPVANUYfUFzhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794132550;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=bMJlZTOTEJlmOuVWJz4GRAC6Q9ZXPrxhv+08R2sTA74=;
	b=duIVx0QWcbtvZ5iGfnu0W3hoDLn6bpkhRr26jWs4jYBPkV+QXgsGKmyIHkzRMo7ngiez
	 LwT6RhVKTvopNMFuiiTBMAM3oOWbaf4yufiwFUa0xm46Fvjj9GLSZMSdSJ0LMWS5FFRqJ
	 zApzz4XS4tDlpuT/Hsj2BpEXUO51nNuh1o+q1cxOrjwNJSeqX1iSKWQf0TzgvWZGiUM7p
	 xgcxqIoL7xLtqjOOSkH+iIg0wadZnLXpj6ZFK6/5+9uU1zGlEy9a1gyNblKA9uqRP72C4
	 daGovjw7yduuO6sXlyZ+J+Z5PtLQui3c/Uc7Ghwo8gY4Yk1VupqyHh5rZtuta/DG3lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oJi7KdRq;
	arc=none smtp.remote-ip=95.215.58.238
Received: from mta1.migadu.com (out-238.mta1.migadu.com [95.215.58.238])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62647606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 10:09:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62647606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oJi7KdRq
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=bMJlZTOTEJlmOuVWJz4GRAC6Q9ZXPrxhv+08R2sTA74=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794132547; v=1; x=1794737347;
 b=oJi7KdRqKwDGAFpr7Bmv9zJzxhR4ofd/6SKv8EmW8rADUsNX2np1y5SzvNmn5z4ppLwGdrb/
 KxVerOoFanoXU9/Vb9kHUjRBhpKKjfHm1sR0yFld2vc2O5vaimBScxbcCJH+/nS9tTBJnuoOJRb
 fiaWVOj6l7ZrFkwFxkVXDI68=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2d28383a0356ad5a;
	Sun, 08 Nov 2026 10:09:07 +0000
X-Mizu-Trace-ID: 2d28383a0356ad5a
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: david@kernel.org
Cc: hughd@google.com,
	baolin.wang@linux.alibaba.com,
	akpm@linux-foundation.org,
	david@readahead.eu,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	stable@vger.kernel.org,
	mason@kernel.org
Subject: Re: [PATCH 1/2] mm/memfd: handle GUP pins more reliably when write-sealing
Date: Sun,  8 Nov 2026 18:08:57 +0800
Message-ID: <20261108100857.94336-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261103-fixes_core_2-v1-1-f332954f1df4@kernel.org>
References: <20261103-fixes_core_2-v1-1-f332954f1df4@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Tue, Nov 03, 2026 at 07:31:44PM +0100, David Hildenbrand (Arm) wrote:
>memfd_wait_for_pins() detects GUP references by comparing a folio's
>actual refcount with its expected refcount. As spelled out by
>folio_expected_ref_count(), obtaining the expected refcount when there
>can be concurrent folio (un)mapping is racy.
>
>So it is possible that a changing folio mapcount can race with our
>check for GUP references, and F_SEAL_WRITE might succeed even if there
>are some, allowing file contents to be modified after sealing.
>
>For folios with a reliable pincount, detect FOLL_PIN references using
>folio_maybe_dma_pinned() before falling back to the refcount comparison.
>For small folios without that, the 1024 pinning BIAS makes it very hard
>(although not impossible) to misguide the refcount comparison.
>
>This improves FOLL_PIN detection for folios with a pincount. Handling
>FOLL_GET and small folios requires a more fundamental change.
>
>Fortunately, most interfaces that allow for GUP'ing such pages use
>FOLL_PIN, in particular interfaces using FOLL_LONGTERM. However, we
>still have some FOLL_GET leftovers ...
>
>Fixes: 05f65b5c7090 ("shm: wait for pins to be released when sealing")
>Cc: stable@vger.kernel.org
>Cc: Chris Mason <mason@kernel.org>
>Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
>---

Reviewed-by: Lance Yang <lance.yang@linux.dev>
