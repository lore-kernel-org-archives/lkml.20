Received: from mta0.migadu.com (out-21.mta0.migadu.com [91.218.175.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521CB1FF5E3
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789701561; cv=none; b=F7fm9yMxMmJrPRtDlQh/MEWUAHapp3d94cyYPs9W6421rrQimIYMAf9e97DKyaIx8i6aQufys45n1sfUtWG/gOHPtZxcmQzYIfv5MeQZ+DEQVa1cQcfAOiJACqmSKCntPE/UwHvo9vMm+jvlRq4V3eQuOUfD2kxaeUg70hYdwQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789701561; c=relaxed/simple;
	bh=j2Lw8GZEQcOr2+soUoWbEZu1bj00nT++axnccGw8S08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d1jv8q+uR2XOVe3xsVeBCBnwiKdsnh3miw87wJKb0SeVTT8u3+1Bj6xDTx6P4v5+M6xwe1/oUKqjnYxjzRq8zWTNfl3kO0HTnXFiEX4IjuiaQFxwGk9RXbbMFit2gR/2ZlJdsV7cXGVmnZTIrpbJezHVy+CGYuDoF80kn1XsH4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rNPZfB+m; arc=none smtp.client-ip=91.218.175.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rNPZfB+m"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=j2Lw8GZEQcOr2+soUoWbEZu1bj00nT++axnccGw8S08=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789701555; v=1; x=1790306355;
 b=rNPZfB+mFrG02kcVRXctAqSTPXGWU4QTkdnvSrN9tbnLbAk5yQ/IB6dodLVwRK5krObz4GSk
 hW4wO7sD/BgZLzP31rbGAjU876ThbGJFDVf3UWXHnS6K+rXFg7ON1PZ3QtFMKpNaJybzwCATRx3
 NgE2BBJAahV5xB3PChgxFDQI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a4960d5e0aaf2f40;
	Fri, 18 Sep 2026 03:19:15 +0000
X-Mizu-Trace-ID: a4960d5e0aaf2f40
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: akpm@linux-foundation.org
Cc: lance.yang@linux.dev,
	david@kernel.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	usama.arif@linux.dev,
	kas@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] mm/huge_memory: simplify pgtable deposit detection
Date: Fri, 18 Sep 2026 11:19:05 +0800
Message-ID: <20260918031905.92493-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260917161359.9ba88d2bcab42db8111130e1@linux-foundation.org>
References: <20260917161359.9ba88d2bcab42db8111130e1@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Thu, Sep 17, 2026 at 04:13:59PM -0700, Andrew Morton wrote:
>On Thu, 17 Sep 2026 13:40:15 +0800 Lance Yang <lance.yang@linux.dev> wrote:
>
>> Whether a PMD has a deposited PTE page table only depends on whether the
>> architecture requires deposits or the VMA is anonymous.
>> 
>> Implement this rule directly in vma_has_deposited_pgtable(), avoiding
>> mistaking a non-anonymous raw PFN PMD for one with a deposit and attempting
>> to withdraw a page table that was never deposited.
>
>A large part of my life is asking $LLM "what are the userspace-visible
>runtime effects of this bug".  Because NOBODY EVER TELLS ME!!!

That's on me ... I trimmed too much from v1.

>This time it says "Processes using PMD-sized raw PFN mappings can
>trigger a kernel NULL-pointer dereference when the mapping is torn
>down", which sounds kinda important if true.

There is no known in-tree workload that triggers it, though. Mostly a
defensive/simplifying change.

>Help me out here?
>
>Also, thanks ;)

Thanks!
