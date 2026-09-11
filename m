Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42B51891A9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789085858; cv=none; b=AbE+hCwgj0QF51STG3tjA0D32vnrieiPgqipEN2RAfDR48e4ooVtZcnTJ4tAtyd3tgpcFPr/8th9UYHl4jbGixCQ3/18G03Fkx8UzXGButpgtNaoOEEBcEPu+Y9uLEVM/9/evbYqqdP1m8YHvc8u5kTs6TpucAIz1eNrzEkTP2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789085858; c=relaxed/simple;
	bh=K8dUEw6Ljt4pjDXu1890Fx+WWl1zXPvoerR4L6viyNU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=rgftmfItttAuR5LIZLknJtD9ZHYh37s+nsQC6wnXAKEUvpzgiVONbyoXC6Z3niNurBMj8pofl9Pp/AmjjydT36YbbxlhbFceU7F5DJvPC586T1zkZcI9Kn3MmMGI1EiMTCA6+UU502pJf8fZYHbDKdsefvv9rONeW4IxK24x3iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=X22wITFU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="X22wITFU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2563A1F0089A;
	Fri, 11 Sep 2026 00:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789085857;
	bh=qGubHrOUaqKed99hLIWnPWqg+R/An1NQxE3VePdAsS8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=X22wITFUBnw2s1G3bTYYh6PPwLO2OObQAmukcHTIsN8nXzwTrmBf6GCes+Up9hgO5
	 gxB4OE/GB4hsLxPnHsmV5zK4McPstEAzFnGeyaFYN8Ao9sTBsze/3F98e1gx8Co96k
	 5H1YNkWaLQ8J5XSbEhmQWinEWSQO80KjGmCB/2P0=
Date: Thu, 10 Sep 2026 17:17:36 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kemeng Shi <shikemeng@huaweicloud.com>
Cc: chrisl@kernel.org, nphamcs@gmail.com, baoquan.he@linux.dev,
 baohua@kernel.org, youngjun.park@lge.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] mm, swap: Fix potential NULL dereference when
 trying a sleep table allocation
Message-Id: <20260910171736.02208c335ee41edd89a23809@linux-foundation.org>
In-Reply-To: <20260907091356.53026-2-shikemeng@huaweicloud.com>
References: <20260907091356.53026-1-shikemeng@huaweicloud.com>
	<20260907091356.53026-2-shikemeng@huaweicloud.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  7 Sep 2026 17:13:53 +0800 Kemeng Shi <shikemeng@huaweicloud.com> wrote:

> The root cause of this issue is because multi-tables are updated in non
> atomic context. To be more specific, the issue could be triggerred as
> following:
> 
> ...
> 
> Since memory order guarantee between ci->table, as well as between
> ci->table and ci->zero_bitmap, fix the issue by making tables
> visible at the end of swap_cluster_populate().
> 

Sashiko suggests this might be incomplete:
	https://sashiko.dev/#/patchset/20260907091356.53026-1-shikemeng@huaweicloud.com
