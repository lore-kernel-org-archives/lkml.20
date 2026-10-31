Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793413735;
	b=bMkHPNZYbR1DVNpRxKFzHvhUFt+/atk09uQ/ycBS+BoIkRO7Jy2QI8q8+F66knfjiPpU
	 ZmTgxIH7Sa9ziSByKMwIlLKuxkQrPBhrQp1fjpNO0cjx+lpM5CyKsPNchhsF7OzOpIhhl
	 NN3bQC54k7hTWFGAsjlzxFqWJrJsLDHuC2iMEaT1NaumD13i2wCpN6g7SfklyZUpiO/qu
	 ws4MdBP5ipCnYuy6YAirROu/fN/LdrKfX2FNDqNEhn795hpeyfE7+CkZrc2xPZbXz/m53
	 IsOQfvaLEYahXJyKbWPrLebRia4JiFsqwJeHOF8X7FYoXnWwBfCkK+/3H4GPG///LNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793413735;
	h=Received:DKIM-Signature:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=8ijKX8smPmxuhC+QaLmNw22D4zigH65OUdE1pOc03DI=;
	b=goNvbQkxVpqJmS8gESjQi5Z070oTFNTr7zRGvSLQRbkkyTlyuqUXIicYDLBwFjogepfv
	 mD3bKttKkCOJZI5LYGhbhNEcyQrQKGkV/V9XC1Q8tH3cRTCN7uTtDLJtsyfNnkwQhOlAn
	 rwkOnEraOFvT93qFtvg4696q+hUbzOF3JRtflI2tgJUbuKZLcu5HweMT8SnhNaZwM6F0R
	 TF07kOKNHhHLbTCacLoFaUHI0v3uVgJhhOc0yoHVaMjE2FVZpAKca1kVwAhd005xiIhME
	 FhCjvfW14r6zMIB/bK193Sl61SlwlvuHoKJobjnZ/7syIg5ZkQT6blgTHAfOkVBDSHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B4CqeUFG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886CD606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 02:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B4CqeUFG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB7241F000C1;
	Sat, 31 Oct 2026 02:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793413735;
	bh=8ijKX8smPmxuhC+QaLmNw22D4zigH65OUdE1pOc03DI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=B4CqeUFGTAjVvsLFYegU3aaiTk6SY/r/Mfhm21iO06smpf7OlDYQYQBYZE0+QO83u
	 d8FREHK1uOt1v5+LCIUDWrF+zPCzw9nv/he/4yIX/43rP6JpNkkUz6Ufkaa33kyIdL
	 fh1mTo/ncyXbxjwR5pnaf9yVSVURPSGeeV9tsvKuBUC9G/5eCgKQhk7YDCMgRvu4WX
	 qUdHp51aauXOZ/0/X5EmldSjM7yjTYEXBFtDGN1p+hHpoOa0O/0YvNPG35wkE7jKaT
	 xD8lFOaHYo9cfmf+IYf6m1j2RhlFCcCFnuW5W23lmtV49BC4qPVrFTUwbSFe0LwWFT
	 vgkchnr7p4juw==
Date: Fri, 30 Oct 2026 16:28:54 -1000
Message-ID: <36ce43428e53d1d6e47dddb43697ccf2@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Daehyeon Ko <4ncienth@gmail.com>, Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/autogroup: Fix task_group UAF during thread creation
In-Reply-To: <20261030154940.GW2668564@noisy.programming.kicks-ass.net>
References: <20261023013631.881730-1-4ncienth@gmail.com> <20261026115707.GF2668200@noisy.programming.kicks-ass.net> <20261030034540.2074077-1-4ncienth@gmail.com> <20261030154940.GW2668564@noisy.programming.kicks-ass.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello, Peter.

On Fri, Oct 30, 2026 at 04:49:40PM +0100, Peter Zijlstra wrote:
> Now, AUTOGROUP depends on CGROUP, so we can make autogroup_move_group()
> also use cgroup_threadgroup_rwsem, such that the autogroup and cgroup
> logic stays the same?

cgroup_threadgroup_rwsem is a global percpu rwsem and taking it for
write on a regular basis can be really expensive.

> I mean, yes we can move sched_core_fork() into the siglock region, but
> duplicating most of sched_cgroup_fork() in there just to fix an
> autogroup thingy seems weird and inconsistent.

Either way, AFAICS, autogroup doesn't need cgroup_threadgroup_rwsem. The
cgroup side has to be settled early in fork, but the autogroup side
doesn't. Can't we just move the autogroup assignment later in fork, to a
point where it can't race against setsid()?

Thanks.

--
tejun
