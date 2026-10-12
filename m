Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DCB2371D1E
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791785647; cv=none; b=Zluyp9nZ+1Qk+DfjCreVznVNHDlzR8fMfG95v//bY4KMwisT+PLL/cqFQHQc/NdQ1sessI3joHhi7ArNaPz0z5xrFghFKt0ts4fVNqCYl56gyKNfTmhSsXc5aAaNF0s/ljOKN2lSqf5EG9aWxzJM5lwzNp57oLjG1tp+ZRd1D9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791785647; c=relaxed/simple;
	bh=uVnR4MPE16Rgbszkf4sDlKvI9WzIxticvq1LhqhOaX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EZ5B94rbPWHpCskduFgqOqQZ4gfv9oF9YphwKPh5AzC42xBb5/UEm13s/jVR1JVks/4tyw9J5T9QQD4X2RxVcSUtudb7g4O/NgPUT8aIROsMKi10dsnIcZ1QZeYZG1fTvzbbr1wgU4SUg5w9/aaKKt4/X2QWKyNa4kuZ1UAvm0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=SSJvN2bl; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="SSJvN2bl"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94C1C1655;
	Sun, 11 Oct 2026 23:14:00 -0700 (PDT)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C872E3F66F;
	Sun, 11 Oct 2026 23:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791785643; bh=uVnR4MPE16Rgbszkf4sDlKvI9WzIxticvq1LhqhOaX4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SSJvN2blVpRzvYTZwQHl5g3Tcxsa0FG0knR65KyNLoDmt2rD7Y37wengoRMOfkped
	 oRs5yVYH3eH1c4HYDc2ioq/IMvzt7IRQBVOB+c/tl/PqHdbxtnHsgi+iXwI127ylAk
	 ZCjPk+4I8kZyX1SIVa+qYM/NVYLcN0lIxQ4XjUaY=
Message-ID: <bbdf1f71-6b86-4951-b5b7-e1fcbe672476@arm.com>
Date: Mon, 12 Oct 2026 11:43:58 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: fix uffd move-pmd test crash on 64K base
 page systems
To: Zenghui Yu <zenghui.yu@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, rppt@kernel.org, peterx@redhat.com,
 david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
 surenb@google.com, mhocko@suse.com
References: <20261011163527.95988-1-zenghui.yu@linux.dev>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <20261011163527.95988-1-zenghui.yu@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Zenghui!

On 10/11/26 10:05 PM, Zenghui Yu wrote:
> From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
> 
> uffd_move_pmd_test()/uffd_move_test_common() splits the test area into
> chunks of chunk_size and moves them one by one.  On arm64 with 64K base
> pages the chunk_size (read_pmd_pagesize()) is 512MB, which is larger than
> the whole 32MB (UFFD_TEST_MEM_SIZE) test area:
> 
>   step_count = nr_pages / (chunk_size / page_size) == 0
> 
> Because chunk_size > page_size, the test then aligns both areas up to
> 512MB, which points far outside of the 32MB mappings, and decrements
> step_count, which underflows to ULONG_MAX.  The verification loop then
> runs away and the first dereference of area_src faults with a SIGSEGV.
> 
> Skip the test when a single chunk cannot fit into the test area.
> 
> Fixes: a2bf6a9ca805 ("selftests/mm: add UFFDIO_MOVE ioctl test")
> Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
> ---

I run the test on a 64k kernel. Before the patch, a segmentation fault
occurred, which was fixed by the patch. So:

Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>

Though Sashiko has a few nits [1] you might take a look at.

[1]
https://sashiko.dev/#/patchset/20261011163527.95988-1-zenghui.yu%40linux.dev
