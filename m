Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3271511E64;
	Mon,  7 Sep 2026 16:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788797357; cv=none; b=T8GiO42BOgKeg51r0Oal0+arnGwrjvp7TuaaBlT+F2EpxQjCxx6mHtrPcFB7uDZNpGtidjJjeyt26fcq2Ge3OsoJ/P440s7NCphEekD88PKAv/orErE4Fe+Gs36OU9W6VrN0PhtgVq7CS0CDINNHKkNDF86JIsvvzp1a6eF0TDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788797357; c=relaxed/simple;
	bh=FQk1qflooDTc9IyeYbUP6lJJEX0Q/x/3M++RyKRSDyY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ryyPpoesURYSPLdMcaN8nH5spk18EfQd1GRccW0lBJh+ugRA6QNi3jNIHVVadpVbN31+rT1WBwhI+lVHM4QE8pBOTZXMyd+3sCfRJclFsWJsWGiMRd8pinmJOjJaNjGBShjuTLTdIhaDCMNlJXttQB29oetwg/Rhhhk0b1THQDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cEiQkVdU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cEiQkVdU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF0D1F00A3A;
	Mon,  7 Sep 2026 16:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788797354;
	bh=O21OXkT+CO7kqHAIkqKNXoWsWUnuD40f1pEYCtLNhCo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=cEiQkVdU3k2uimP58cQap5UFd+2E9hqvHmiPVuJwfNEU5UvTqgMzyHYZsn0UDnwab
	 kN0BhXkeg/iHcOkcZ+sGQ2fFUTx1H4HDhOnoVlwPbuMCdPnJA8hoRu7PhWwY+qnZCU
	 y6Xumq4PL1Rf8qukmZ8FWTbF8FmtdwkktGy/Bprd5czk3PV1JURDY4HBqSuhzpzxcQ
	 zK0vuKOEB+FdeQU39MmAfxvLDEgpWTvj0yLMjlTE2eabdO+Wa32GCz18B850nplZid
	 qmfDpn7XgByUQok2hEInOTRaMsLh23W1crnCVhGv8yaB8rP1KfXd+Ud+w6ZnpR6gAB
	 Qn3rXNpNPjfeA==
From: Thomas Gleixner <tglx@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Dmitry Ilvokhin <d@ilvokhin.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Dmitry Vyukov <dvyukov@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] rseq: defer time slice extension yield for sys_futex_wakey
In-Reply-To: <ap66R7QTdVyMqcG9@google.com>
References: <20260831-sys-futex-wake-time-slice-v1-1-814bb95cc339@google.com>
 <87ld9ha8wu.ffs@fw13> <aprNcgTON1V7Tr1W@shell.ilvokhin.com>
 <87cxur5ux4.ffs@fw13> <ap66R7QTdVyMqcG9@google.com>
Date: Mon, 07 Sep 2026 18:09:11 +0200
Message-ID: <87fqzl2gd4.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Sep 07 2026 at 13:21, Alice Ryhl wrote:
> On Sat, Sep 05, 2026 at 10:01:59PM +0200, Thomas Gleixner wrote:
>> What is the actual problem you are trying to solve?
>
> Basically in Tokio we have a bunch of critical regions that look like
> this:
>
> 	mutex_lock();
> 	list_add_tail(&my_list, new_item);
> 	mutex_unlock();
>
> and this:
>
> 	mutex_lock();
> 	next_job = list_first_entry(&my_list);
> 	list_del(&next_job);
> 	mutex_unlock();
>
> except in Rust.
>
> People are reporting bugs to me saying that this particular list in
> Tokio is causing significant contention for real-world workloads in
> production. The context here is backend/web servers.
>
> Thus, I am looking at various solutions to improving contention here.

Have you looked at lockless lists or queues? The above use case looks
more like a queue than a list. I'm sure there is some Rust
implementation by now.

Thanks,

        tglx

