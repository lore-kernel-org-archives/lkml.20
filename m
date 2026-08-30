Received: from mta1.migadu.com (out-52.mta1.migadu.com [95.215.58.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1432772630
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 05:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788067124; cv=none; b=SxuEXO0m0up9U04OraxPWviVoVLiCfFyMH1N2Fdj5YzmAtpQ+DtpeOCSAy+6yb6KzR80giPvPcRPgsBBffcvrBjaiZftdLL7yITMxnr8SeS0QYia67zZqVEzue4nzVSHhGnlhkQObTxNmO60rgPB7DV/9pyVRvZJp8AjHPNt2FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788067124; c=relaxed/simple;
	bh=zpUnzyomNCkMBgYKtdeC/00VUtDf38xmo/shun73kSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jeQsFmsZcselUHLbyMCsurDoUPV2Xgk9r2LZrSOL57zEG38iP14l8D+MID5OzPmOz1KoxVQANjV/dal7ZABX/lKlLF1b/BhVZDUjcJMm+aT2D3ymLOGKmAZGGM8oatS4JcP8iQPtdytUHuPczUBbVtoXNYMHlVO4OgZNE1GbLZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OUfzD71g; arc=none smtp.client-ip=95.215.58.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OUfzD71g"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=zpUnzyomNCkMBgYKtdeC/00VUtDf38xmo/shun73kSE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788067119; v=1; x=1788671919;
 b=OUfzD71gsBHVbLwuzg5cFSUCjzA+5Tj79KnYt6pmfMxrAWGvYUREWb0H/MOx36qj3vQAeMOl
 NOKMbQLTZR1QIrElQM8y3bW2SpaDfdOPxgU0P3KjzcqO2nOPMW09WF5xYaMVrBa1CSlK10aqo+s
 g0GtYJTZa82USoSkMv7sFNDQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 82afb8ac5ccba36e;
	Sun, 30 Aug 2026 05:18:39 +0000
X-Mizu-Trace-ID: 82afb8ac5ccba36e
X-Migadu-Flow: FLOW_OUT
Message-ID: <c2577ec5-acf6-466b-ba66-0b3bcabbef7d@linux.dev>
Date: Sun, 30 Aug 2026 13:18:24 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] mm: reject zone device folios in more folio
 walkers
To: Andrew Morton <akpm@linux-foundation.org>
Cc: gourry@gourry.net, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 kernel-team@meta.com, david@kernel.org, ljs@kernel.org, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, liam@infradead.org, nico.pache@linux.dev,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 usama.arif@linux.dev, vbabka@kernel.org, jannh@google.com,
 matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com,
 byungchul@sk.com, ying.huang@linux.alibaba.com, apopple@nvidia.com,
 balbirs@nvidia.com
References: <20260817220810.1175596-1-gourry@gourry.net>
 <20260818043143.22297-1-lance.yang@linux.dev>
 <20260829171819.e1e8910e7e9a8a46b87c870f@linux-foundation.org>
Content-Language: en-US
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20260829171819.e1e8910e7e9a8a46b87c870f@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/8/30 08:18, Andrew Morton wrote:
> On Tue, 18 Aug 2026 12:31:43 +0800 Lance Yang <lance.yang@linux.dev> wrote:
> 
>>
>> On Mon, Aug 17, 2026 at 06:08:07PM -0400, Gregory Price wrote:
>>> Several LRU-oriented mm walkers resolve the folio backing a PMD entry
>>> (or a physical pfn) and then reclaim, age, migrate, or lazyfree it
>>> without ever checking for ZONE_DEVICE memory.
>>>
>>> This series adds missing folio_is_zone_device() rejections, matching
>>> the checks that comparable walkers already perform.
>>>
>>> - mm/huge_memory, mm/madvise: the !pmd_present branch above these sites
>>>   only filters device-private entries (which are non-present).
>>>
>>>   A present zone device PMD (e.g. device-coherent) would still reach the
>>>   folio and be lazyfreed / aged / paged out. Add an explicit check.
>>>
>>> - mm/mempolicy: queue_folios_pmd() can see a present zone device PMD
>>>   (e.g. device-coherent) and queue it for migration.
>>>
>>> No crash reproducer - this is a correctness/hardening cleanup found by
>>> inspection. All checks are placed after the folio is resolved and before
>>> it is acted upon, on paths that already hold the relevant page-table lock,
>>> so no locking or refcount changes are involved.
>>
>> Cool!
>>
>> Gave the whole series a spin on x86_64 QEMU with a PMD-mapped
>> device-coherent THP. Without these patches, partial MADV_FREE and
>> MADV_COLD reliably hit a kernel panic in remove_migration_pte(), while
>> mbind(MPOL_MF_MOVE | MPOL_MF_STRICT) returned -EIO.
>>
>> With v2, all three worked fine, PMD mapping stayed intact, and data
>> checked out :)
>>
>> Note that both kernels used the same small change to the in-kernel HMM
>> test driver, allowing its coherent device memory to be allocated as 2 MB
>> folios so the PMD-mapped test case could be exercised.
>>
>> Tested-by: Lance Yang <lance.yang@linux.dev>
> 
> Thanks Lance, you're so diligent.
> 
> I'm wondering what to do here.  Gregory told us
> 
> : No crash reproducer - this is a correctness/hardening cleanup found by
> : inspection. All checks are placed after the folio is resolved and before
> : it is acted upon, on paths that already hold the relevant page-table lock,
> : so no locking or refcount changes are involved.
> 
> And you had to tweak the hmm-test driver to reproduce the bug(s).
> 
> So when do we push this series out to -stable?  As a hair-on-fire
> hotfix, or as a leisurely next-merge-window thing?

Thanks, Andrew :) Yeah, I'd say next merge window should be fine :)

The crash is real once the mapping exists, but I had to tweak test_hmm
to create that PMD-mapped device-coherent folio, and I couldn't find
any in-tree production driver doing that today.

So no need to rush this one, I guess.

> 
> And Sashiko was clearly having a bad day, able to find only nine
> pre-existing things to shout about:
> 	https://sashiko.dev/#/patchset/20260817220810.1175596-1-gourry@gourry.net
> 

