Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C82F3A1B5
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790294751; cv=none; b=KZi4s+4UEfZlg1+a3jSBAo8EI6RMOjc6HCEfaZHbMApk0gv2SLC6S1UruUHDmoOhusZnhy79K0711T/bKwXUyXKe3DQ/jBOkP1xyEZ73n0svPkh+Nzb4oawUK22K8Q2sq9i5xHrXhziEOc6Mu9RRqIp84nCFFKlBVKYipJR05zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790294751; c=relaxed/simple;
	bh=LK8YbNkcz2rsO1Y8eYNkUqy/IjUVzqPhRsoF2ILmK9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QF6UiJU4Jc/ktfgwNOBHNeH8JI+xIjfCQJZmElKwnnoTAuDrUriGzX5K7MrHVk4m3ZzJjhiEFu47N1pDpReH/Yqi0x2tCiSDD6SQVXiAQwhY/LI/JPFi6IrbuM9XcJBxP9bvqf7pfixMYyWqCapi7X5jXKzaHFioffIlNOYkahw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zrwfn+N7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zrwfn+N7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB5E61F000FF;
	Fri, 25 Sep 2026 00:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790294749;
	bh=x9wmj+UF3ZBwNytHK13BfVarj9jHLB/ciTxE2Q6X0qw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zrwfn+N7i0gd+uW4UcPFxlywSNaic7UyQW+i3oiCbNdYV7D5TAvDozCn+YsKAXMgt
	 6F2Ye7K4QdkjIAdruy1A8gZuP0xAz5urEYYx5zpBnXq2bXYlusq27zJs+8xsUr8Z8T
	 LkFI45DWzmz9Yfb6Spv/u6LWiLHNe3LVmaHwYOoSUQRqHbngKlqDFPlm6zPTR5817k
	 hJ+G57s5yfhOaMRRb6y3EfyrZK2zT8T+cUwlQJO6Kgy+OslVXRpSxeoQSPr5UeANYI
	 dQWm8NR9AvSnrJagc+Eztowq1/Qjlw9f/F8izSlEwzmAevHKKROqgRujDQyks17ikC
	 q7AhLfjWWijGg==
Date: Thu, 24 Sep 2026 17:05:49 -0700
From: Kees Cook <kees@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
	oleg@redhat.com, luto@amacapital.net, wad@chromium.org,
	peterz@infradead.org, ada.coupriediaz@arm.com, linusw@kernel.org,
	yeoreum.yun@arm.com, kevin.brodsky@arm.com,
	anshuman.khandual@arm.com, james.morse@arm.com, thuth@redhat.com,
	vladimir.murzin@arm.com, tglx@kernel.org, broonie@kernel.org,
	liqiang01@kylinos.cn, ryan.roberts@arm.com, pengcan@kylinos.cn,
	kmehltretter@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v19 00/14] arm64: entry: Convert to Generic Entry
Message-ID: <202609241703.4AF69048@keescook>
References: <20260922035510.1090299-1-ruanjinjie@huawei.com>
 <202609221129.B5E13A7@keescook>
 <927d57a4-64ab-4420-9485-5336f2ec3fd5@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <927d57a4-64ab-4420-9485-5336f2ec3fd5@huawei.com>

On Thu, Sep 24, 2026 at 05:32:14PM +0800, Jinjie Ruan wrote:
> 在 2026/9/23 2:29, Kees Cook 写道:
> I tested the rr test cases on a Kunpeng HIP09 (with minor adaptations,
> since Kunpeng CPUs aren't supported by default), and the results showed
> no regressions.

Great! Thank you for getting that set up.

> 
> |               |    7.3-rc4 baseline     |   Patched                 |
> 
> |  ------------ |------------------------ | ------------------------- |
> |   result      |  87% passed, 190 failed |   88% passed, 186 failed  |
> 
> 
> | Failure Mode   | 7.3-rc4 baseline |   Patched  |
> | ------------   | ---------------- | ---------- |
> | TICK_MISMATCH  |         76       |   74       |
> | TIMEOUT        |         68       |   65       |
> | GDB_SCRIPT     |         34       |   37       |
> | PERF_EVENT_OPEN|         3        |   2        |
> |   OVERSHOOT    |         1        |   0        |
> |    OTHER       |         8        |   8        |
> | -------------- |  --------------- | ---------- |
> |  Total         |      190         |   186      |

GDB_SCRIPT failures went up? Are the tests just flaky?

> > - MTE: I didn't see MTE in the cover letter's test list, and it seems
> >   relevant since patch 13 puts _TIF_MTE_ASYNC_FAULT into
> >   ARCH_EXIT_TO_USER_MODE_WORK, so an async tag check fault lands
> >   on the reworked exit path. The MTE selftests showed no differences,
> >   but a third of them don't actually run for me under QEMU, so they'd
> >   be worth running on your hardware. (Testing MTE under QEMU saw
> 
> Turns out our arm64 machines don't support MTE; I was testing it on QEMU.

Ah, dang. I wonder if we can find anyone with MTE hardware to test this.
Any volunteers? :)

-Kees

-- 
Kees Cook
