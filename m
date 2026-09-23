Received: from va-1-113.ptr.blmpb.com (va-1-113.ptr.blmpb.com [209.127.230.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C8A481255
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160916; cv=none; b=rDZhaWcYT3vJY/dd6/D8Qp4h2gJfjyFQWGVYxSaHIifjv0x3siIX1c0TXd9qC6zi3PFO1E6Db3ZeWP4aG4ZNCKZ5wPHQ6lA3ybPTGgLfo1rhW/V2q/P8LdGCAoWLihXvUzC/OWYVu8vykkiO7VkMl2py74MOEAvGcpOxAXvw56k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160916; c=relaxed/simple;
	bh=pONCe+vryD+J7wT9UN7GEqgV2HlSYcNCPe4X1qbrM/E=;
	h=References:To:From:Subject:Message-Id:Cc:In-Reply-To:Content-Type:
	 Date:Mime-Version; b=nOkHaOyuUGZIq7N1Y2NeSomoBjdJPgD4hd5k2SmijJW1suFgnsIPzq0v6eMCgs0bsSvg3TiSLpauFc+C34H8mS2OHohubGRVkKWCotfyVgZQM/Uy1hFOGtMseecHmccV4GXTY2oNVli3ODw43SEKg3Z2X3pQJsk+XR630IgcKX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ZhiFIwzq; arc=none smtp.client-ip=209.127.230.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ZhiFIwzq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1790160898; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=BZiUM9h7Ce09u2QYdbPiXyMCFwJUV4rrQ57LrhBqTws=;
 b=ZhiFIwzq+Rt5F8lWdiUCeY0kD7HLAgDFKBkj+pKpkEiGwf5viOAmDCFt31o4Ei8wX0XeYw
 w7+dZFIH8OstG08+wjFzz6yMAMnftYt7OpOao5J9m+GggVK+1+3n7cy/y+iGRIYyYcXsyF
 HqQQpp/+cpLlTfnI96vrqYcGwxnAeGT903ykIxkC0j/l8soEWoG2QgRk1DdSlcraF/skIs
 BsO467kpeMQKety8x8aBCxrU+CPf7NDscill6mLlcg+n5imiZjD5UKXfS8SNBklW7XxF/9
 g6nstVCJi5eZ8EjDY/haO5/rayiNX4YgDvs41ipRAKGep7a352ZYXe2+n8zJtA==
X-Original-From: Chuyi Zhou <zhouchuyi@bytedance.com>
User-Agent: Mozilla Thunderbird
References: <20260921095359.3784458-1-zhouchuyi@bytedance.com> <20260921095359.3784458-5-zhouchuyi@bytedance.com> <20260923092819.OVgjJ9Gb@linutronix.de> <956efada-ac6a-413c-ac90-324eae428025@bytedance.com> <20260923105037.4wyE0RLj@linutronix.de>
To: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>
From: "Chuyi Zhou" <zhouchuyi@bytedance.com>
Subject: Re: [PATCH 4/5] x86/mm: Decouple kernel TLB flushes from flush_tlb_info
Message-Id: <73ce6c91-d654-4890-8497-11a8632205bf@bytedance.com>
Cc: <tglx@kernel.org>, <mingo@redhat.com>, <luto@kernel.org>, 
	<peterz@infradead.org>, <paulmck@kernel.org>, <muchun.song@linux.dev>, 
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <pbonzini@redhat.com>, 
	<clrkwllms@kernel.org>, <rostedt@goodmis.org>, <nadav.amit@gmail.com>, 
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20260923105037.4wyE0RLj@linutronix.de>
Content-Type: text/plain; charset=UTF-8
X-Lms-Return-Path: <lba+26ab3b000+23de6d+vger.kernel.org+zhouchuyi@bytedance.com>
Date: Wed, 23 Sep 2026 18:54:34 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit

On 2026-09-23 6:50 p.m., Sebastian Andrzej Siewior wrote:
> On 2026-09-23 18:43:55 [+0800], Chuyi Zhou wrote:
>> The ceiling check does not cover all possible inputs, though. For
>> example, with start = ULONG_MAX - PAGE_SIZE + 1 and end = TLB_FLUSH_ALL,
> 
> Well, due to the number of pages when it is considered to do a full
> flush. But "ULONG_MAX - PAGE_SIZE + 1"  isn't a valid start input, is
> it?

Correct. On x86-64 that address falls in the unused hole at the top
of the address space, so it does not represent the start of an actual
kernel mapping.

My example only illustrated a difference for arbitrary input values;
it did not demonstrate a valid use case that needs the explicit check.
I'll drop it.

> 
> Sebastian
