Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556C9379C35
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790670157; cv=none; b=KhrPBuoWqbARgNd+VdQcKDSM+7VKi20SMSpIcVMIbYYXWkbB/7GaHIZJ7PdUi8I9IEiCHDOKK5FTsqVCIcP+LsAIsiZPrX7QGHgpydzpnbp2pbe4yHGwBs3tuggnkDYnm5n1SxtW+1OwJOdUGgXq2TuZiFmzRaHodRWTdmrQ9I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790670157; c=relaxed/simple;
	bh=xxToONBdMXP+sQAcFMni1Xsp9MTpztNPlXZGUQfNC94=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HVBHO1T85o1Hv+5sbJZhddK6ZDANPkUTE4HKN6iYY5XiaHnsZZmgpxM4cncOjz16TK6E36B/rcIyASdd/f5g8ap9xnG/IPR1p2nsLcCJg8LF3N5TRhDcOp35ItgnthvZ4c9CLWnG1mOW8HrpV33rrAmRan2cxddIra7r9XlYNVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lpwmUCK5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lpwmUCK5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D92231F000FF;
	Tue, 29 Sep 2026 08:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790670156;
	bh=HTTndInTl8yksiJFhCcVpCQ/4fHg+TLd3FozuAv6AaA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=lpwmUCK5oNbHHqii/0jy5xPhlRhchmakLYO0GeHojTZ0QRCzM5/wmVN/K6L3Gy4m3
	 Pw6oHY8C1NR4DnClCHtgc08ogxZbexSxXYuPCPnhXOeuFYpSdfZBEJ9ly8yVRtuJ2L
	 nGY+76bCjPPUGQBk77XlqEaAz/GBBbUbU8qH3kj1zrfhFQYH1D1n+my/trR5G9b6pM
	 2KbR08YMnHQ/QMyoGnHo6FA1VtFa2HQp3Uq9oShfGuAw74611HReVLunjMU4Q1+6IR
	 bZTZCFFzZGtjDXBr2viggJdhXGxNhyB/5XK8PWCReMuec7Jo/BDIPL2MeXhWd0flit
	 zBGToIpC4qoww==
From: Thomas Gleixner <tglx@kernel.org>
To: =?utf-8?Q?Andr=C3=A9?= Almeida <andrealmeid@igalia.com>,
 dave@stgolabs.net,
 dvhart@infradead.org, peterz@infradead.org, mingo@redhat.com,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com
Cc: =?utf-8?Q?Andr=C3=A9?= Almeida <andrealmeid@igalia.com>
Subject: Re: [PATCH] futex: Handle the correct robust list at
 compat_exit_robust_list()
In-Reply-To: <20260922005407.522060-1-andrealmeid@igalia.com>
References: <20260922005407.522060-1-andrealmeid@igalia.com>
Date: Tue, 29 Sep 2026 10:22:26 +0200
Message-ID: <87zex0ii0t.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21 2026 at 21:54, Andr=C3=A9 Almeida wrote:
> compat_exit_robust_list(), as exit_robust_list(), should handle the robust
> list from the task_struct from the function argument, not the current task
> running the function.
>
> Fixes: 2cb5251d3d64 ("futex: Provide UABI defines for robust list entry m=
odifiers")

It actually fixes nothing because *curr is always current.

I'd rather get rid of the argument alltogether because that's just a
source of confusion.

Thanks,

        tglx
