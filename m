Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5906C53E2E1;
	Thu, 15 Oct 2026 15:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078216; cv=none; b=uCbWfu2tb05wbn8Bfw4LwOsz6KZUDZyhHpeV/gRKZ0dKXnniWn6lu0od46/QcxgC6Rr0W4b70R7+jZNJ0a3QDcWfs5pe7yDNl9K/NbUb3OYrmWJbvVcpPWkMpSfMcLJK3xemdFnSDwufXppTotBHn8jOSg1xGw8Sotzyl3yakN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078216; c=relaxed/simple;
	bh=MXm8xmx2oMO8C0dAOcD9FN35YhOSw7ovaFDoiw9YjMg=;
	h=From:To:Cc:Date:Message-ID:Subject:In-Reply-To:References; b=VHtcZ/YWjKTwBc2wVaQfp0eHOQT/v5wFkqxssMM3sN1u5ChZwjmkm5dr6fIVEtKkUavPJGQztFvNVDb9YWLB5nrD/PY7IyzifzRlRU6st9kgqzXuF5o+pApUqct7XFWd37vRAXxk/9x/+1728RdFNUOJdHZh6xXHO2tUwLZxHxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=qRvm65UN; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="qRvm65UN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Date:Message-ID:Subject; bh=rEkIjp8z7NcrfDe
	UgPV0lYAs6wvmTaDmlgd7nTyV3p0=; b=qRvm65UNx5JBib1gu8n//NUsJcOLEr4
	+V0wYGhlfwhledyzFEokX5S8G+LM4tnVEQqxdlNicpG9qlJL0fxuavgLNB5mOLQl
	j+k4N/b13cZl0gVW036Cov4IuwmK42qI+oqUdOrjdptg819EcHOXh1cz17T3rsPp
	qD9xjsFoaNIk=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3XyRN8dBqhgIYAA--.7277S2;
	Thu, 15 Oct 2026 23:29:17 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: Marco Elver <elver@google.com>
Cc: dvyukov@google.com,
	kasan-dev@googlegroups.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Fri, 16 Oct 2026 00:27:05 +0900
Message-ID: <179207802520.771660.5931695730876285158@163.com>
Subject: Re: [RFC PATCH 1/4] kcsan: add targeted watchpoint matching
In-Reply-To: <CANpmjNN0_EX8Tug6UFp=sap_Zv3QH1PnEn4GPGSKSHEU72W6zg@mail.gmail.com>
References: <20261014095238.2132580-2-sh_def@163.com>
	<CANpmjNN0_EX8Tug6UFp=sap_Zv3QH1PnEn4GPGSKSHEU72W6zg@mail.gmail.com>
X-CM-TRANSID:_____wD3XyRN8dBqhgIYAA--.7277S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr4UuF1UXw1xCw15CF1xKrg_yoW8Zr1Dpw
	1DXrWrJr1DWF4F9ryxJr4fG3yxtws5J348Zr4DKr13Aa98CrnIqFWFg3WF9FnrXw1vgw47
	ZFs3ur4fZFn8JFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UYPfdUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6Q5evWrQ8U6E9wAA3y
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

> How does this change the generate asm (say on x86-64) of the fast
> path? (E.g. take a look at __tsan_read8 disasm.)
> We tried hard to e.g. avoid stack spills in the fast path, and if that
> affects fast path codegen negatively, that'd be not so nice.

Thanks, I checked this directly on x86-64, comparing baseline
4056b3c9d3c92ea45955641dbafeb9b960e146ef with patch 1
661e5012b2fd928a32b563c4337db3af9a71c743.

With GCC 15.2.0 and the exact RFC .config, __tsan_read8 has no new calls,
stack spills, stack-frame adjustment, or callee-saved register saves.
The relevant sequence from the linked image with the static key disabled is:

        baseline (__tsan_read8):
        +0xc5: cmp BYTE PTR [rax+0x10],0x0
        +0xc9: jne ...
        +0xcb: mov rdx,0xffffffffffffffff
        +0xd2: xadd QWORD PTR gs:[...],rdx

        patch 1, target disabled:
        +0xc5: cmp BYTE PTR [rax+0x10],0x0
        +0xc9: jne ...
        +0xcb: 66 90  xchg ax,ax
        +0xcd: mov rdx,0xffffffffffffffff
        +0xd4: xadd QWORD PTR gs:[...],rdx

The original instruction stream is shifted by two bytes to make room for
the jump-label NOP. The target matcher is out of line on the cold branch.
In core.o, the symbol grows from 270 to 302 bytes, including that matcher.

For the Clang 21.1.8 comparison I used the same normalized .config for
both baseline and patch 1. This differs from the original RFC Clang build
by three Kconfig normalization changes. The paired __tsan_read8 comparison
likewise has no new calls, spills, stack-frame adjustment, or callee-saved
register saves. The disabled site is at +0x108 in core.o. The linked RFC
Clang image also has the 66 90 site. __tsan_read8 grows from 387 to 415
bytes in core.o due to the cold matcher.

I also checked __tsan_read1/2/4/16 and __tsan_write8; none gained calls
or spills. GCC's __tsan_write8 already has a push %rbx/pop sequence, which
is unchanged.

So I don't see a disabled-fast-path codegen regression from patch 1 in
either compiler build.

