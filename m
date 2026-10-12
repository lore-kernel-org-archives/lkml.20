Received: from mta0.migadu.com (out-164.mta0.migadu.com [91.218.175.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95A4190473
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791774373; cv=none; b=D6dYVpfxfzvoDLT15BQ41ve/Z61n3GTuLs8aPHnsKuAY+taNSDfrWYufrPVPDMOiHXqypETU6bfE4ZSuVCjfBVDS0V3UbZMWZRqS+wCLtNNPvICpCD5suXLIA4IGR5h7Y4TE9qzAavnQsGgoU4iCNDfSr1elJrJAHereSIV9nSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791774373; c=relaxed/simple;
	bh=ZqahB6iGbcSAawApacCpm+EpH54wUNgYNo/E9F0GBaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UM7kc40jVr4434jTX7Ov++vWfAhNdDobtawGdnCUC/tKTMPsBs8Mu9fwhk6Ae4liG8xj8zwDnW19yj6rwL0den0iwqC0jusghlrjF4o5Ge5aMegQW/kdFBABLdA3i+a5K75oZPzvjk7RUkiIJ0oBgkDDX0FBmC86kWoex4vv9gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=A1fBpdhy; arc=none smtp.client-ip=91.218.175.164
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="A1fBpdhy"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZqahB6iGbcSAawApacCpm+EpH54wUNgYNo/E9F0GBaU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791774366; v=1; x=1792379166;
 b=A1fBpdhyodD5ZOjJG0Uc3TeSP+ncgokW2bZygbQZvM4i5frfBal7a6NTZMA4pYmcTAmR7B6G
 PWp439SvcjpUTGWYZcz1WvgTCDJkljX2R8eFfDpwjmZpew07YkLm+NffGO01RQbYxwkI6V/HLC+
 c+v1HBKPjCEpmBk3iVyg9a5Y=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 5dbb87babb859b87;
	Mon, 12 Oct 2026 03:06:06 +0000
X-Mizu-Trace-ID: 5dbb87babb859b87
X-Migadu-Flow: FLOW_OUT
Message-ID: <4f0e115f-0826-4139-a6a2-30e4520f33bc@linux.dev>
Date: Mon, 12 Oct 2026 11:06:01 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] memblock: Remove unused exact nid allocation API
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka
 <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
 Priyanshu Kumar <priyanshukumarpu@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Muchun Song <muchun.song@linux.dev>
References: <20260919135327.74089-1-kaitao.cheng@linux.dev>
 <179023613121.508753.1739135911194499722.b4-review@b4>
From: Kaitao Cheng <kaitao.cheng@linux.dev>
In-Reply-To: <179023613121.508753.1739135911194499722.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/9/24 15:48, Mike Rapoport 写道:
> Hi,
> 
>> Commit ffe55393137c ("mm/sparse: remove sparse buffer pre-allocation
>> mechanism") removed the only memmap_alloc() caller that requested an
>> allocation from an exact NUMA node. All remaining callers allow fallback
>> to other nodes, leaving the exact_nid argument unused.
> 
> Overall this looks good to me. There's is an issue though that mentioning 
> commit in mm-unstable in the changelog does not really work because the
> commit sha may change.

Commit ffe55393137c was already merged into Linus's tree on June 19,
via a552c81ff4a1, so its SHA is stable.

> Andrew, how do you suggest to deal with it?
> 

-- 
Thanks
Kaitao Cheng

