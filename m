Received: from mta0.migadu.com (out-152.mta0.migadu.com [91.218.175.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7162A4B829D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886033; cv=none; b=HeVJGsabIsgR2yMR8WpMOQsPSVthgNyibqDYYU4T3V1JSbobvZ0YN4FX82hX6lMn3j1eT7/wvb/vwWvmkxmEL4/mllZTsk5u+hcdV/NIV070M2PQ4x4N+uJ2ok6U5blastdncd86nx27fHjTIzvIen9oSkhlsQiPVPzw5+sQozk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886033; c=relaxed/simple;
	bh=19GLy3aq4B6Z6bUMOpryhrMAzIgxJ66Kmju5Caaif9s=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=PQjy1Ttv66JuDvSQiwVLg4aa4onnHK2y3UGXTCmP0vVfiVpg7PibH5wJyNOoZeVJqa4ZFGJ963giYRk44vOxQRh/f4mCVcZuR848QPC/0YVS6f75EbpGC6hzJWbU4yFLZslLGpMuIzau70w9X1rMo1Jx4JGPCORrIVPGPUwrMC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JbHWWL4b; arc=none smtp.client-ip=91.218.175.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JbHWWL4b"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=19GLy3aq4B6Z6bUMOpryhrMAzIgxJ66Kmju5Caaif9s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791886028; v=1; x=1792490828;
 b=JbHWWL4bkVmD+IVquRhgSsCk5oHEZk3IOOiQitNJq6CEoEaI+nvbou+NxfP861+c3fismtS0
 /xOeg2yF3UMtLc8cpjaeneuguC/a9+zLpiL0A9sqWPHSaLQVbjWjU9V0R8htRbCR6w1MTMSiD57
 ptBQGIy4yeRW56QPplt+GpzU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9e66ce19328045b4;
	Tue, 13 Oct 2026 10:07:08 +0000
X-Mizu-Trace-ID: 9e66ce19328045b4
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH v2 0/3] memblock: Remove unused exact nid allocation API
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <179188501773.4183299.8247277870365097333.b4-ty@b4>
Date: Tue, 13 Oct 2026 18:06:49 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 Kaitao Cheng <kaitao.cheng@linux.dev>,
 Priyanshu Kumar <priyanshukumarpu@gmail.com>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <35057B7F-9E89-447B-AF4F-92A78B45F8E2@linux.dev>
References: <20260919135327.74089-1-kaitao.cheng@linux.dev>
 <179188501773.4183299.8247277870365097333.b4-ty@b4>
To: Mike Rapoport <rppt@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 13, 2026, at 17:50, Mike Rapoport <rppt@kernel.org> wrote:
> 
> On Sat, 19 Sep 2026 21:53:24 +0800, Kaitao Cheng wrote:
>> memblock: Remove unused exact nid allocation API
>> 
>> Commit ffe55393137c ("mm/sparse: remove sparse buffer pre-allocation
>> mechanism") removed the only memmap_alloc() caller that requested an
>> allocation from an exact NUMA node. All remaining callers allow fallback
>> to other nodes, leaving the exact_nid argument unused.
>> 
>> [...]
> 
> Applied to for-next branch of memblock.git tree, thanks!
> 
> [1/3] mm: Remove unused exact_nid parameter from memmap_alloc()
>      commit: 063b5e8bbd216c27e885f45e29e23d053aa565fc
> [2/3] memblock tests: Move exact nid tests to memblock_alloc_range_nid()
>      commit: fba3e86fb848f79c4573243affcd7d79d378958d
> [3/3] memblock: Remove unused memblock_alloc_exact_nid_raw()
>      commit: ea27be9f7ce90a05e779d20b60969ce2a9834f77
> 
> tree: https://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock
> branch: for-next

Hi Mike,

Just a heads-up, the tree has moved to:

	https://git.kernel.org/pub/scm/linux/kernel/git/mm/memblock

Might want to update it next time.

Cheers,
Muchun

> 
> --
> Sincerely yours,
> Mike.
> 
> 

