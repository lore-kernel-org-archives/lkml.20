Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1CE1A239A
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 02:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788057481; cv=none; b=HByOwidXTniGkMuvPPJ0g5f6Ah3C8/cxEzgA6ye33JLlQmmfk+FRnl/MiB7fqzJ5dMtbA4oIgfRuSeBgoF8j9dVFnbbuzEsaWf9JazM9Qd3d4tavpeKk1U0DIC7H3gpZF6fu8SKGqJwx5TxRkqp48zNPx01CljkYUskTaNHA/8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788057481; c=relaxed/simple;
	bh=iHLqZ6BI2EbYbbHIR6gZMNzEGO/JCqKbD+o/FFREuh0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=PHlY639P9I8BK/zkg1sODf/Qgw/r3YQKUi9VNFgaKPGieArZUqRzHXb8OWuHlnnaB5MTyPUNEHnrqbuA+BVrMTPoiBz4z/CqMKwzwqj+wnGmOtqwtl7o+aIVGOA1ZQGAQhouidkxH3TdYWDWiqH4YiacPvyDVyeaQit12ctiKWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QVajQr8N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QVajQr8N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AC531F000E9;
	Sun, 30 Aug 2026 02:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788057479;
	bh=8JYy4cwxYHYB3SLpHqiVEkE1C6SYKPTNsf1PpaVEnwg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=QVajQr8NNF6WPo/YrfP06JWv6nBxuMXUVYkL4jV+k7kofGQyAqz7WQZ82AizCeFUZ
	 kAT3EfC07ssgCo3wsWRLa38WTRca6Bkg907opIQTsW6d1FYUAiYxWdnnhbzERCR/8a
	 erqZhgAOb21E3uccdcRdMiINp9YIOYLA7PNTvGX0=
Date: Sat, 29 Aug 2026 19:37:58 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Breno Leitao <leitao@debian.org>
Cc: Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi
 <nao.horiguchi@gmail.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, david@kernel.org, SJ Park <sj@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, kernel-team@meta.com
Subject: Re: [PATCH v2] tools/mm: add hwpoison-panic tool
Message-Id: <20260829193758.b251f3c89f8201bdc585a305@linux-foundation.org>
In-Reply-To: <20260803-memory_failure_rewrite_test-v2-1-ed020ce42129@debian.org>
References: <20260803-memory_failure_rewrite_test-v2-1-ed020ce42129@debian.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 03 Aug 2026 04:31:20 -0700 Breno Leitao <leitao@debian.org> wrote:

> Add a tool that enables the vm.panic_on_unrecoverable_memory_failure
> sysctl, picks a kernel-owned PFN and writes its physical address to
> hard_offline_page.  Three page kinds are selectable with -k: rodata
> (default), slab or pgtable. In all cases the host should panic.
> 
> Example:
> 
>         # ./hwpoison-panic -k slab --yes-panic-my-kernel
>         injecting hwpoison at phys 0x100032000 (pfn 0x100032, kind=slab)
>         expecting kernel panic: 'Memory failure: <pfn>: unrecoverable page'
> 
> In dmesg, you will see:
> 
>         Memory failure: 0x100032: unhandlable page.
>         Memory failure: 0x100032: recovery action for reserved kernel page: Ignored
>         Kernel panic - not syncing: Memory failure: 0x100032: unrecoverable page
> 
> This lives in tools/mm rather than selftests/mm because every successful
> run crashes the machine, which is not something to run from CI.

I wonder if we can fix this.  Add a knob which tells the kernel not to
panic/oops/crash/etc.  Instead it sends a message "i tried to crash but
you told me not to" and proceeds.

Set that knob around your hwpoison-panic tool and voila, it's now a
selftest.

Wondering if we can sneakily use fault-injection to do this.  Add a new
i_should_crash_now() and use fault-injection to make this function
"fail", by returning zero.  Or something else.

