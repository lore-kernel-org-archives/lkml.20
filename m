Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913764B7A59
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 15:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791472766; cv=none; b=oaTmJQ2qH1f7EimmzcFggEcsotC6FLV01bKyz1ZfXlJTt2sGyHnRW+rh2CqiTSbK3u98iBM6B+fXyjctYGRQ+vLA3Ia9r2/3G1iDQb56G1D+JBSA3Co/EP7Dty6IKyJ01zGc+Tt7dTCCFLiwtpjtN6ktSFH89su6wBwI5qYzXmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791472766; c=relaxed/simple;
	bh=UdmR1mYrdZml/gh1G8VUY9j2TPafpP25lNlynxHewVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mRxV6WiqcoVsOuR11R5UBTV0uMNUwasX32xzAUOTdqhhJAiCf6a3v1h9pRGMBR6EuFIZuZ7NMh7DwQNRdC1fQXOkQtiCshY934Fa4NApoVzfXW7NnuduMwQGNvdbbcsA56g5QL1jlqbc0CtMOClh2ucWS7FmAB0k0JkX0OUJ8PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VaSSgG/e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VaSSgG/e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 630CB1F000FF;
	Thu,  8 Oct 2026 15:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791472758;
	bh=FWzAyf83sJMqlpcdExg7TKJ622UXmHtaI+HggcOSlVw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VaSSgG/e1OFEOZeoSjyLzNDhrgxw/efV48ECagVYuF+B+AwcGwD/iOuhbngCe8xKs
	 RbCzaFH3yZc1hT6N9KR9NOkQiGJR1VOfRLsGic46eV6Q5OPgrw0ZdqqBwXZHFX1SAU
	 5pL8i42Dv/GJ1sRFL4tHw50cXg3tLdwm+XwQVmUs8ITyUg0AI2UGOA++UEv0u0yQxG
	 oGaIpg4cn+xAnLJnB6llSH+YRYICMZMdB7L+/Wsw7vP76zgC8MgnolanOyEjhM18nV
	 flGH8PsR3kZYSYbLJhfq1BK8SIsDpcPpz4K+H3/S1zUx7enXkG00FEDnEHM0r7A9Ap
	 JZ5oqB8EPzbiQ==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Karl Mehltretter <kmehltretter@gmail.com>
Cc: mark.rutland@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: irq: exclude the softirq stack switch from KCOV
Date: Thu,  8 Oct 2026 16:19:10 +0100
Message-ID: <179136595191.1063015.6426776896396499376.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260926191325.79047-1-kmehltretter@gmail.com>
References: <20260926191325.79047-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 26 Sep 2026 21:13:25 +0200, Karl Mehltretter wrote:
> On IRQ exit, __irq_exit_rcu() drops HARDIRQ_OFFSET before calling
> invoke_softirq(). The arm64 do_softirq_own_stack() wrapper and its
> ____do_softirq() trampoline run before __do_softirq() establishes
> softirq context, so KCOV records their PCs in the interrupted task's
> coverage buffer. They also run outside softirq accounting when
> local_bh_enable() reaches do_softirq().
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: irq: exclude the softirq stack switch from KCOV
      https://git.kernel.org/arm64/c/a9cd14bfb0c1

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
