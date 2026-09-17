Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F6949A3CF
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789686850; cv=none; b=Q0ksTfbTHTrxG/799S/X/A8XpxTdQ4hYtyj402HbQdA1xlWOHrSQnu+81rgC64C0pQ2zGYMv4OuTtLSIjmyGbtMm/cdLe1k1G6qKrWp4P8IA6ArWoemJZH6olLqN1o5vujZTDvKV+GFqCnwo914D5osszbmAgDCJi7UIvFbh26g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789686850; c=relaxed/simple;
	bh=z34N2ZlQhY33Rv6+Y3OTmb4UNAVDkbysxsja59RWCqc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=joq4G+9G3AA2UqVt9Lq4GHhhfq/YCiYE/smQ7yxhSIoVJngW1KulZZ8NXSrnQXB5X/90+AzcQuHndCiSiKxsZzae1wNztddgCead5UQaJtvsgZhftwOu04Ufue1uQC8/hAyIsJzuHL3RPPCfWYsPcFp1mqsbrwrUHqQ1OoxxZ3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=qyewUY1B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="qyewUY1B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF3901F000FF;
	Thu, 17 Sep 2026 23:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789686840;
	bh=z7m4fIbqwauaPPsY8aeZIO/6ssj+ZXat6vWwGibVsmE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=qyewUY1BWDTVEh/eLaYU+YaAnj7+6FrLDS94TFgAec978llcfygL0m44OnWkUHiIc
	 Us/4PEZKjfMShDGMv/6BS3Sgrob/jchWKHFt3wTIupsHnVbh4AZc8UEoproOrioiyI
	 BqUvKibF6GCOX3qcvslKTixmiKNREzhEbdes0y9k=
Date: Thu, 17 Sep 2026 16:13:59 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Lance Yang <lance.yang@linux.dev>
Cc: david@kernel.org, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 liam@infradead.org, nico.pache@linux.dev, ryan.roberts@arm.com,
 dev.jain@arm.com, baohua@kernel.org, usama.arif@linux.dev, kas@kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] mm/huge_memory: simplify pgtable deposit
 detection
Message-Id: <20260917161359.9ba88d2bcab42db8111130e1@linux-foundation.org>
In-Reply-To: <20260917054015.23553-1-lance.yang@linux.dev>
References: <20260917054015.23553-1-lance.yang@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 17 Sep 2026 13:40:15 +0800 Lance Yang <lance.yang@linux.dev> wrote:

> Whether a PMD has a deposited PTE page table only depends on whether the
> architecture requires deposits or the VMA is anonymous.
> 
> Implement this rule directly in vma_has_deposited_pgtable(), avoiding
> mistaking a non-anonymous raw PFN PMD for one with a deposit and attempting
> to withdraw a page table that was never deposited.

A large part of my life is asking $LLM "what are the userspace-visible
runtime effects of this bug".  Because NOBODY EVER TELLS ME!!!

This time it says "Processes using PMD-sized raw PFN mappings can
trigger a kernel NULL-pointer dereference when the mapping is torn
down", which sounds kinda important if true.

Help me out here?

Also, thanks ;)
