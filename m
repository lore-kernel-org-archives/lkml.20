Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792653823;
	b=UnMSIQQNysKaLbcK87zB7JDVDvHqynlQCcUIBoPlin7jwy/tY6hVnYYxKxFENMbDizJ0
	 07NmYqS61GmxTl5jI5NWRb79DpQyd541PoZOug3FqTmeJYjsTUoNCnmsj6yWOmuHR2xnT
	 rBW4HgNvX1pg0jT9qeHqTTAPDXJ+yN2pCUhqBpmDyQ2Bw1BgZPFapcqIcIaJY1JBoueTQ
	 P22WHI31LArIcmpfZoNhyLpgTLpaLLIufjkVGQAgHEc2Wx+rpkXcPpkai0hrKUAwYIY+B
	 6k7f6G59gGML1AGf5EU+pMWlzijIZBY8HRGVAfTSjM//KSZtqpA4icXwYcpfJez3vQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792653823;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=nxhw37Ts8JjVkeWnUUXvGcPNaHqWJWHYSG2L4Bkd61Q=;
	b=N06CMm9uvNJOz/GhbXlJbnvop8EEh8qt4G1+0nSNLXm8o+LwmWR7jTESbkr5Otc/qKrz
	 ynu+bVtNp9LAx4WqD7FoP3/h/hB6//nmr8b7m5Evtebqyz8OUO0n88KJn6eqw5XLeT3Yb
	 kZhRmvmgSLNYEYwHNcXTprdgEo2zkvrb6qMwDOlI2BqAPc36aF+I26aHhPpfP0VE0+wq7
	 XBI1FQe8WhxwmusKTqgYxeMbiS449h1NF4vRLHP8gZ1siji1Wpn4f4zV5qRfYM0y81ugx
	 /Ej28j/ebDxS+/ICDGZz4ili1jtB5ZkLdlazxIEFh/BdXry51yeUOuOeGYG+LQH0sQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="T/lTafwa";
	arc=none smtp.remote-ip=91.218.175.35
Received: from mta0.migadu.com (out-35.mta0.migadu.com [91.218.175.35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A892A606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A892A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=T/lTafwa
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=iMb60vufG01+4AZR+z8pGmBhQmm04VfW1fUB7oSscv8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792653820; v=1; x=1793258620;
 b=T/lTafwa65EQjI/GtYIBCe7AQBRuvqgyRLahgfzDvuKGIaOaB3DFUhz5dSLW7IXuO2QqUQ8j
 S/qh/jKzHOmbM0GHuIwfOhGFPo0hb2NzRYMvUEADqKdMrWktbH0gGgxy5rTpe/8EnGUFfgxFFTq
 +kwRSZLqQpq/Fpxk37KiTDtE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ab87abfd04d8baec;
	Thu, 22 Oct 2026 07:23:40 +0000
X-Mizu-Trace-ID: ab87abfd04d8baec
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: songmuchun@bytedance.com
Cc: osalvador@suse.de,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	qi.zheng@linux.dev,
	lance.yang@linux.dev,
	jthoughton@google.com,
	david@kernel.org,
	muchun.song@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/12] mm: hugetlb_vmemmap: simplify vmemmap head page handling
Date: Thu, 22 Oct 2026 15:23:29 +0800
Message-ID: <20261022072329.67561-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261020115824.823278-2-songmuchun@bytedance.com>
References: <20261020115824.823278-2-songmuchun@bytedance.com>
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


On Tue, Oct 20, 2026 at 07:58:15PM +0800, Muchun Song wrote:
[...]
>@@ -289,7 +290,6 @@ static int vmemmap_remap_split(unsigned long start, unsigned long end)
>  *		to remap.
>  * @end:	end address of the vmemmap virtual address range that we want to
>  *		remap.
>- * @vmemmap_head: the page to be installed as first in the vmemmap range
>  * @vmemmap_tail: the page to be installed as non-first in the vmemmap range
>  * @vmemmap_pages: list to deposit vmemmap pages to be freed.  It is callers
>  *		responsibility to free pages.
>@@ -298,7 +298,6 @@ static int vmemmap_remap_split(unsigned long start, unsigned long end)
>  * Return: %0 on success, negative error code otherwise.
>  */


/**
 * vmemmap_remap_free - remap the vmemmap virtual address range [@start, @end)
 *			to use @vmemmap_head/tail, then free vmemmap which
 *			the range are mapped to.

Nit: could you update the @vmemmap_head/tail comment too, now that the
head argument is gone?

Nothing jumped out at me, so

Reviewed-by: Lance Yang <lance.yang@linux.dev>
