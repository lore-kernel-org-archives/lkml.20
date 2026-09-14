Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEF62EEE75
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789353809; cv=none; b=afEeyrGHnEOXGypaKEX+VwJ8gA6okHbiFYrPnx3c//85U1e+VJ+IpqoCFcuO/1tkau2LoOW9NJfuMsqhzdStFZHeoiC4dexAHsGcDzdsoS+rnqwvGV+A5ijXWAEoi05JywyrhZQ60XUGKGFHzrdWN8V9EsN6Ybm979qpX8ygRtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789353809; c=relaxed/simple;
	bh=Ly1tX6a/BiOq+G71holJtfrb8RdWu7WLKrWpabKfoHM=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=PlzD8e+cb3MJRCmBIbZtgO82yGGRD3ee6bPlUbxcE0Lttd5ND4vFWU3mgxuJIz9MJI+ziqjpg2iKCGQksu8xudwZG3WXAIj//xXsP5YRPkfq0N873t7okyGxeBMJyVPcgjuxlvGJOZfRVOd7OPiA4Ufb038gf6jNWGWMlqVwxfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=mZGrVUx3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="mZGrVUx3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7CCA1F000FF;
	Mon, 14 Sep 2026 02:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789353808;
	bh=GPlyuX4J8yVFynRki86eS8wk2g+3emdQ6rxuxVS462s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=mZGrVUx3DEBnxNLMA2Y+MW04SIp2tP/blTyUA/uLcUt4gRgO2HXiwHIwtT7CAV1wd
	 JcNAjtANaSLbKoycdA2J/acacoXg0TXN8MxrqEgjdbq86A+KsrIW3YxOgJUxADMdXz
	 08Ssf3Vulb9ZpmV5GeHKclrnsPhxNGuiSs8Qqr6A=
Date: Sun, 13 Sep 2026 19:43:27 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: hughd@google.com, david@kernel.org, ziy@nvidia.com, liam@infradead.org,
 nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com,
 baohua@kernel.org, lance.yang@linux.dev, usama.arif@linux.dev,
 kas@kernel.org, ljs@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm: shmem: ignore sysfs configs for shmem forced
 collapse
Message-Id: <20260913194327.019b3db96ea9b0719fc147f7@linux-foundation.org>
In-Reply-To: <063f655b4d6c4234f3aa27ed6ecab10283ecb880.1789351825.git.baolin.wang@linux.alibaba.com>
References: <063f655b4d6c4234f3aa27ed6ecab10283ecb880.1789351825.git.baolin.wang@linux.alibaba.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Sep 2026 10:12:41 +0800 Baolin Wang <baolin.wang@linux.alibaba.com> wrote:

> According to Documentation/mm/transhuge.rst, MADV_COLLAPSE is expected to
> ignore any THP or mTHP interface settings.
> 
> However, after commit 26c7d8413aaf ("mm: thp: support "THPeligible" semantics
> for mTHP with anonymous shmem"), performing MADV_COLLAPSE on shmem will
> depend on /sys/.../hugepages-2048kB/shmem_enabled being set to "inherit"
> (although that is the default), which can cause MADV_COLLAPSE to fail
> unexpectedly.

Userspace-visible runtime regression?

> Fix this by returning the result of shmem_huge_global_enabled() directly
> when MADV_COLLAPSE is requested, allowing PMD-order collapse while ignoring
> shmem THP/mTHP settings.
> 
> Fixes: 26c7d8413aaf ("mm: thp: support "THPeligible" semantics for mTHP with anonymous shmem")

Should we backport?


