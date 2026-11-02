Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619633;
	b=xgpw3gJrP0QXa+jnlf24Sqa+JJvieWvKIr8vYU6+vXmqcbqM9+DwC1FJCgWY/mqQzXjX
	 lxRfe9zhD31RT5fjI6VHvD+IEZIEoL24prulWx3ui7ixrrA8+eRMUtuM9tIqIqbVYX5Mv
	 vMvUEI4HxMkAfHyR0cZAGoUoAAFwHeAbAOuyixt0Eu7fjpIYUvHZONQiB/vj1MVAzDzs3
	 Y7Ak3CfLrKZdllw3azt4VZqSorw/Taf7UkrNfRLZn3ZLQrQdUaIDOamGgP1fquYwVs/uS
	 Ph5Wq96RqZ+H3EON0XWxmWGPCbuQYZw4uAhH2BInuTL/heV5KnZ5nGYv2BwAexzu7jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619633;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:User-Agent:
	 Date:From:To:Cc:Subject;
	bh=mH4Cba3MrCM+fKYM1a6EB5vLcCxZP0ArJcgu8m4LCPc=;
	b=F8hbV6d+EJJ9Sp4r7/8X+EZCGQRKW3I3P+AMSfXN1yTFApmJSSHDOVOOoZWCMOvJfTBY
	 QKp249XkLrHI7SY3GhUzcAtxr0mrpB1S2uOiJzQQnLtz5bfLPhJy3wL++mdo3cwleFEc5
	 RC7y50STwZsmDxbAmcvbaQdg3JzAMSe5OdVl7a/+F7cSm6JQErlIIS+CyU2fzIqhId4tW
	 QWi5p9smNsfeFenIdyGYJh6Yqj/u8MNviRHpl3iPIdntumR3etQAGCtnbNv7wOu4qmV+F
	 UUaH8CtJkSlcBChAZW6ePIvQIATBvklzBFzhsoplxig+RJGh38IjEmHWCgPIGu52Anw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=f7xJ0iqh;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D18606A32F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3D18606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=f7xJ0iqh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Subject:Cc:To:From:Date:Message-ID:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=mH4Cba3MrCM+fKYM1a6EB5vLcCxZP0ArJcgu8m4LCPc=; b=f7xJ0iqhjXXHKmXojOAG8ykmFC
	j6RsEn1TQp2YLPBAXv/p1PsrO793rGOczZ8vYGgjoTOfG8egYRwmM1LMOy65wm65sURHVHxaT4URx
	dLXNZ4TRQthZ8V2d2wZvUQpwmJURSfqnfp8VKumy16lkYUJl1Qa1zDyqAxbUSin7YlbJc2p1SFyx5
	9tp2tVb7jluessiF+rDF01ShNCoj0Km6YwDp11kv+hha8rdQqIVDPb/gKdAuZwjaoUF5dD12y7f45
	lacD2l61YYwTgM38eo1jgwssI54tkf3N6JgBAEUWY/3caT6+E4n5LVE+hw9QMf5XHebHp38DcxgIM
	SbhnLTQA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqOn-00000002SDw-2Xhi;
	Mon, 02 Nov 2026 11:40:30 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 6FC8C300322; Mon, 02 Nov 2026 12:40:24 +0100 (CET)
Message-ID: <20261102112549.714541309@infradead.org>
User-Agent: quilt/0.68
Date: Mon, 02 Nov 2026 12:25:49 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 jpoimboe@kernel.org,
 leitao@debian.org,
 keescook@chromium.org,
 hpa@zytor.com
Subject: [PATCH 0/6] x86: Harden syscall dispatch
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Hi!

These few patches harden the syscall dispatch by making -fno-jump-table
unconditional for x86_64 and then having all SYSCALL*() macros mark the actual
syscall entry points with __noendbr.

Notably, we already have -fno-jump-table for KERNEL_IBT || RETPOLINE, which
means effectively everybody already has this. However, making this
unconditional has the nice side effect that the compilers must never generate
array accesses and it is safe to remove array_index_nospec().

Additionally, since dispatch is now forced to be a binary decision tree with
direct (tail) calls, there are no valid indirect calls to any of the syscall
functions and they can be marked __noendbr.

This means anything trying to use the sys_call_table[] will fail (on hardware
sporting IBT).

All this makes the normal system call hijack a lot more difficult.

Patches also at:

  git://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/syscall

---
 arch/x86/Kconfig                       |  4 +---
 arch/x86/Makefile                      | 27 +++++++---------------
 arch/x86/entry/calling.h               |  1 -
 arch/x86/entry/common.c                |  2 +-
 arch/x86/entry/entry_64.S              |  2 +-
 arch/x86/entry/entry_64_compat.S       |  6 ++---
 arch/x86/entry/entry_fred.c            |  6 ++---
 arch/x86/entry/syscall_32.c            | 20 ++++++++++-------
 arch/x86/entry/syscall_64.c            | 24 +++++++++++++-------
 arch/x86/include/asm/entry-common.h    |  2 +-
 arch/x86/include/asm/fred.h            |  6 ++---
 arch/x86/include/asm/syscall.h         | 10 ++++-----
 arch/x86/include/asm/syscall_wrapper.h | 23 ++++++++++---------
 arch/x86/lib/clear_page_64.S           |  1 -
 arch/x86/lib/copy_user_64.S            |  1 -
 arch/x86/lib/copy_user_uncached_64.S   |  1 -
 arch/x86/lib/getuser.S                 |  4 ----
 arch/x86/lib/hweight.S                 |  3 ---
 arch/x86/lib/putuser.S                 |  4 ----
 include/linux/annotate.h               |  1 +
 include/linux/instrumentation.h        | 17 ++++++++++++++
 include/linux/objtool_types.h          |  1 +
 tools/include/linux/objtool_types.h    |  1 +
 tools/objtool/check.c                  | 41 ++++++++++++++++++++++++++--------
 24 files changed, 118 insertions(+), 90 deletions(-)

