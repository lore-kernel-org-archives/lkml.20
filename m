Received: from mta1.migadu.com (out-191.mta1.migadu.com [95.215.58.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDAA3F9F30
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790052278; cv=none; b=T2lDhKtDmHfSUjMcB6Tyx6zeutL43SxE2RhY1gI8eXbTfm9z/KdAyEjimSFXLO7BbdTWls5E50yJ9YL9LkgInnFiKP0gyzgIDj4dWSrWIZKRS0r1LcEo4KWOUDGa6yEU4fFvF5VC9BSmvaw8pPjr6VJ4qPtzwijvFQ+j/nzW5do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790052278; c=relaxed/simple;
	bh=O9TtdOhD8pGjJ5szyUuOrZgrl+8A101U3MBnFYDvhY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fGA/cA7uyWzwwXzuhKIBUcOEV/e/LdA8e7cJYw3e2HrHb/HVOymRMlC5wVl9mtyfk+scf4PIki/NapqIr7+jpZ5yE4QbTwMb1eQjEJN4xkSLh+2RS2LKg8zoVYcXHHKELjOT2hRvTxk/na9UQ29GMYOqGIPzNoHug0rL+J6pqw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PSPTnB4z; arc=none smtp.client-ip=95.215.58.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PSPTnB4z"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=O9TtdOhD8pGjJ5szyUuOrZgrl+8A101U3MBnFYDvhY8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790052271; v=1; x=1790657071;
 b=PSPTnB4zSxw4Mu49Z0TQhV1FNPlOwzFXABfcbLftXqQKLWeNRNr6oL60cCkVQlc0FULpn0Yb
 +gYjqTpa1UfXszW/jk0eE40uHRK2besbBxrZ0EpN9YBsDdDiS7APJNSdXyp2cZlNpyokx+Do3Dr
 xWmwF19PBWWFEU81MNODolls=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 1c91c1c822023d95;
	Tue, 22 Sep 2026 04:44:31 +0000
X-Mizu-Trace-ID: 1c91c1c822023d95
X-Migadu-Flow: FLOW_OUT
Message-ID: <10159c57-091e-474a-a154-4f675a39dcc2@linux.dev>
Date: Tue, 22 Sep 2026 12:44:19 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] nvdimm/pmem: Remove test_and_clear_pmem_poison()
To: "Oscar Salvador (SUSE)" <osalvador@kernel.org>,
 David Hildenbrand <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Dan Williams <djbw@kernel.org>, Vishal Verma <vishal.l.verma@intel.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>, Ira Weiny
 <iweiny@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 linux-mm@kvack.org, nvdimm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Kaitao Cheng <chengkaitao@kylinos.cn>
References: <20260903053535.17611-1-kaitao.cheng@linux.dev>
 <20260903053535.17611-3-kaitao.cheng@linux.dev>
 <arIBvO3cFQ53ivG3@localhost.localdomain>
From: Kaitao Cheng <kaitao.cheng@linux.dev>
In-Reply-To: <arIBvO3cFQ53ivG3@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

在 2026/9/22 12:19, Oscar Salvador (SUSE) 写道:
> On Thu, Sep 03, 2026 at 01:35:35PM +0800, Kaitao Cheng wrote:
>> From: Kaitao Cheng <chengkaitao@kylinos.cn>
>>
>> TestClearPageHWPoison() is now defined regardless of whether
>> CONFIG_MEMORY_FAILURE is enabled, returning false when memory failure
>> handling is unavailable.
>>
>> The test_and_clear_pmem_poison() wrapper duplicates this configuration
>> handling and has no other pmem-specific behavior.
>>
>> Call TestClearPageHWPoison() directly and remove the redundant wrapper.
>> This also removes the need to include page-flags.h from pmem.h.
>>
>> No functional change is intended.
>>
>> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
> 
> Nice cleanup, but as David noted, please squash patch#1 into this one.

Although NVDIMM is currently the only external user of TestClearPageHWPoison,
I still consider it a generic declaration. Combining the two patches might
give the impression that TestClearPageHWPoison exists solely to serve a
specific driver.

That said, I’m not opposed to merging the two patches, as doing so would
make the submission more concise.

I think both approaches have their own advantages and disadvantages,
which is why I haven’t sent a v2 yet.

> Reviewed-by: Oscar Salvador <osalvador@suse.de>
> 
>  


-- 
Thanks
Kaitao Cheng

