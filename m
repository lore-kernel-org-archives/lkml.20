Received: from mta1.migadu.com (out-98.mta1.migadu.com [95.215.58.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2844503BDE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859455; cv=none; b=F7N7D4JZiqS/w8g8uQMH0i7RXCdggj0rkU5O7TRZjwecSTRmIbc+SJQBKlPVTpyY5JergwnRg3UtqbBIY7mOzrDAXLc2WmFo8LiumhQddG4arZb02/wBXWZxtrwh396UR/YbdbzN1btKrEYZAwnSvrlJdn9f0RoEhyt7FHtHHWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859455; c=relaxed/simple;
	bh=Lq4ARpMbanal89TxHuI1tA2YfFgMGpzO1BWcDeL62IM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RxxJNhENsTc2tvCcegJCdft+e4sHlvrALu7drDfZ2qXncIP0aRkI0tTmdR3Q/M3p2iCeW36hdWh/t3VdZsfTM6VjlGmFtZJtXErBe8LqKlRkuJDGMlN5fQNO+xdguYegMvKcd8iPlG8NfElc6JGxdmbtPy+MTHBDfA72TUT+m1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Wz/m6DiO; arc=none smtp.client-ip=95.215.58.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Wz/m6DiO"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Lq4ARpMbanal89TxHuI1tA2YfFgMGpzO1BWcDeL62IM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788859451; v=1; x=1789464251;
 b=Wz/m6DiOq1YxbsMtchpMqiWZFAFYeJZxnQsp0wNqfhJbnxHELIRL+4mNh+zOeEs0bxXQXyKD
 DOu1VjcosI8jmEOyMHOZKxr6nZBXbxfQt4fyOleU7LawF0ThwoQJTgrmQUARgtWMclAubvqIct9
 cJnlnFp7wy/2Y6OuZaoXWANM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 98e59e83dd11dcc5;
	Tue, 08 Sep 2026 09:24:01 +0000
X-Mizu-Trace-ID: 98e59e83dd11dcc5
X-Migadu-Flow: FLOW_OUT
Message-ID: <bb30518c-9046-418e-b190-9f3f1b542cbe@linux.dev>
Date: Tue, 8 Sep 2026 17:23:54 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] mm/sparse-vmemmap: drop unused
 section_nr_vmemmap_pages() arguments
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
 <20260908030335.96549-11-songmuchun@bytedance.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <20260908030335.96549-11-songmuchun@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/8/26 11:03 AM, Muchun Song wrote:
> section_nr_vmemmap_pages() no longer uses the altmap or pgmap
> arguments, so drop them from the helper and its callers.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   mm/sparse-vmemmap.c | 10 ++++------
>   mm/sparse.c         |  3 +--
>   mm/sparse.h         |  6 ++----
>   3 files changed, 7 insertions(+), 12 deletions(-)
> 

Acked-by: Qi Zheng <qi.zheng@linux.dev>

Thanks,
Qi

