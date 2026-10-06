Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CCB3D953B
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 10:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791280884; cv=none; b=hA6chK/RfOobRi5IMMN323FddEOAb3+s1aki02h3dgZaI84VGW07taKqUxDw38lhL2sf48UU9ZIfTnJP6gG51sUXCCC3HdSFsElZ3ihaF/5VDRJNTB4qVd0SIYLNGAoWzuNYs6ELuNkzJOfOnyIKDXOoi5pmPuTzyeexNmp8ylU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791280884; c=relaxed/simple;
	bh=xb9BadNrirkgjB2m+/WAGwQERsZqdmLrvTMOF1yZroo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=UgOxEEGH9khT4oclIekk2KC0LEa7iqy+WKZ9gxxsheEPFyBqMEzUwKdc7ThDE0yU3uJwQshQAq9LiPeZ2PX5kcXkv1czPtHFRMjEhxXGjDlTY9o4ntalEowAzDk5GnzghqSJCrOz32Ff5i3L7QOp5bdeYhd6B20Uzu5knTqOpGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EjXlPFOE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EjXlPFOE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DE4D1F000FF;
	Tue,  6 Oct 2026 10:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791280883;
	bh=2huH6r9hm8xALagr4MmDphaNd66aij25JYGwX2G0xno=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=EjXlPFOEd74s7SqNN+oSaGeOmefuOe332qOu/nDqZZlUKfAUA3QVLbGIgXFrObCqG
	 RknNNTYRhSUrhIuAg/GB4j+A9JMf2oO37IEwQyIyUmKWw8SpIt1FvidPoz/sAGJ4OR
	 wUZ5VTmjgPmI5vh3UEuFYOSp2zzu8Iu0rb4UBfsnCHkv1x4UYqQBBPU+3rCD5VSKO3
	 12AF0vtP/lEdSW/STgRCowN9dUCGhHwsc/kgXjM5YzW2jkcWkVEa3mfVjf9qKfJ+gV
	 QAUI1/0lBd9e4ey+cV9nb6lFXvJeTTC5MmTyR6fwtTcp+BXUE9JmCILEJkWV8Mximr
	 9sITJuaVE3e5w==
Date: Tue, 6 Oct 2026 04:01:19 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Andy Chiu <tchiu@tenstorrent.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, andybnac@gmail.com, 
    dfustini@oss.tenstorrent.com, greentime.hu@sifive.com, 
    linux-kernel@vger.kernel.org, olof@lixom.net
Subject: Re: [PATCH v6 0/8] riscv: optimize mode switch latency for Vector
In-Reply-To: <20260918215154.2481482-1-tchiu@tenstorrent.com>
Message-ID: <25b31a4c-5034-6740-eef1-1c2a60748398@kernel.org>
References: <20260918215154.2481482-1-tchiu@tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 18 Sep 2026, Andy Chiu wrote:

> This series provide several optimizations targeting system call latency
> regarding vector context management. Before the series, the kernel
> handled user's vector context in an conservative way, where registers
> were null out and VS is tracked as DIRTY. This introduce excess context
> saving and restoring when there is a context swicth.  Also, the kernel
> turned off Vector at the exception entry, making all in-kernel vector
> usecase take the serialization cost, which includes context switch and
> user copies. The cost is not easy to hide as vector code are usually sit
> right after enabling V.
> 
> Since vector register are set to a known state at syscall exit, the
> series set VS to INIT at syscall entry and null out the vector register
> at the exit, skipping unnecessary saves and restores. The series also
> introduce riscv_novstateopt, when unset, enables vector in the kernel
> mode, and do not perform register nulling on the syscall fast path,
> where there is no context switch or kernel-mode vector during the
> syscall.
> 
> With the whole series, nginx request throughput vs base on a four-core
> Ascalon-S, by served page size (* = statistically distinct):
> 
>        86B     1KB     2KB     4KB     8KB     16KB    32KB
>   v5   +0.79%* +1.36%* +2.33%* +2.02%* +0.14%  +0.93%  +2.42%*
>   v6   +0.33%* -0.23%  +2.88%* +2.19%* +1.02%  +1.14%  +1.40%*
> 
> This series depends on [1], which is now queued in the KVM RISC-V tree
> [2]. For those who prefer git, the series is also available at [3].

Thanks.  Given the KVM fixes dependency, it's probably best to wait to 
merge most of these until v7.5.  But I think it's OK to pick up 1, 2, and 
3?  Will queue those for v7.4.


- Paul
