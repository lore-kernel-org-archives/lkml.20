Received: from mta0.migadu.com (out-133.mta0.migadu.com [91.218.175.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161924AA595
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859783; cv=none; b=HE/gwLLs1ClezXFIA2gDR7isAMNfitF08ilK2ccfJgoiHwuFR6jhF8aNlbUYRn+34au8K6t2pzinXwFQLwLV+5wokhLdEX168nbIBkgF2441V3/xXNCAS7WO98WVuecFfX4P2ZeamfLIncrVHW0n0Yf094PnUVoR4BFz7YnguTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859783; c=relaxed/simple;
	bh=15IOOyKa+ijGmMxg7kwu9CI1MNJx0YkgAkPki5J/TZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uRpBU5cs0p1JjN/WnaEMcnQcYsdRCEKqA9rtL8NqJt9COBBZWUBF1glk6qTzaNuLvt8SmgFgR6vZm3vlqlciwHy2IiKmwoaM1i7dlxtb2TfcKKEW8GaDpNqDcB7mSD4ghf2u03lJcLOmbcJSGcdqnEmoTGU5KYhfjlo/zuLhuI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NT4ngglp; arc=none smtp.client-ip=91.218.175.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NT4ngglp"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=15IOOyKa+ijGmMxg7kwu9CI1MNJx0YkgAkPki5J/TZI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788859780; v=1; x=1789464580;
 b=NT4ngglpu+P1qCAwMpvi5skJVqMX/UTGMoDC8wwv+T+PdUQBVVmjF2FUVhdYdbO9TwQ0CvzN
 VImV7aNtVlKFs6JVQGKU8UHxprvBNk0VJgiTliDg1qEsPoHzunKUJDVQVQimHC01jnyUp+VmXla
 n3/GnnhU8bFZ68YQHQVjMam0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c1b4dc536328070e;
	Tue, 08 Sep 2026 09:29:39 +0000
X-Mizu-Trace-ID: c1b4dc536328070e
X-Migadu-Flow: FLOW_OUT
Message-ID: <cc7003c6-9be6-430e-a37b-e43a08402825@linux.dev>
Date: Tue, 8 Sep 2026 17:29:34 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] Documentation/mm: update DAX vmemmap
 deduplication docs
To: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Muchun Song <muchun.song@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>, Randy Dunlap <rdunlap@infradead.org>
References: <20260908030335.96549-1-songmuchun@bytedance.com>
 <20260908030335.96549-12-songmuchun@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20260908030335.96549-12-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/8/26 11:03 AM, Muchun Song wrote:
> Device DAX now uses the common per-zone shared tail page for vmemmap
> deduplication. The old documentation still described a DAX-specific
> layout with a separately populated tail vmemmap page and half the HugeTLB
> savings.
> 
> Update the generic and powerpc documentation to describe the shared layout.
> In the powerpc document, keep the radix and 64K-specific details, drop the
> duplicated 4K PUD arithmetic, and replace the repeated device-dax diagrams
> with a single parameterized PMD/PUD diagram.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
> v2:
> - Clarify the commit message to state that the 4K PUD arithmetic is
>    intentionally dropped reported by Sashiko.
> ---
>   Documentation/arch/powerpc/vmemmap_dedup.rst | 90 ++++----------------
>   Documentation/mm/vmemmap_dedup.rst           | 32 +------
>   2 files changed, 21 insertions(+), 101 deletions(-)

Acked-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi

