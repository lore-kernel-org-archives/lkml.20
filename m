Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794859140;
	b=1cTNGMO1gYOA+Ra3ySZzOioJyCpOWIicyWfSWz0W4evVh+HdhyWHswz6rZ002/lYJB7f
	 Z1OluCJrb3CSLvSe9pFb03Wb6JSmlcTbTPwnYhL3WdG3oPm9vdXPtchXeQVa8YJ32K2jN
	 UnMI7m/FynjE/bec89F4mmi7DwvMA6M/I9unpZEBDNeYLKDtKQF2hXUsBn8K5uiSc0wVy
	 aaudOnOIy35nUxgvEDek8w/pZRCs09vlJZnhsmN/gPfWK+0t4/PhIo/esm2+/CV4OppSS
	 uBHoKagFgFKBx21ZlQKtWPRqGZXRU85IvjcIgTr74t8uGT4gfTrN3zQ7HhJNxjYZf5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859140;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=gZt9HQUyu/ePb4wk+5Ugjo2JcWeL+KRy5Jk36rElSuY=;
	b=EZez0B7TkcurSGnCFCjAmSTIPFw36TS7GmCUiUstaY7apY2BOQ9IfPc8KQYFwS+kTfps
	 Tq2Et62OJOOVZmOg0KYC0X8xvUOBou54ul/gWLoI9RwG3EM9yUIh8AFQTy10u3aKKLLix
	 1MSIk/vh1QywWDs4kGQXWWMAZkSf0cKKrYIDuG1kGl6LvZj449k8SnqzHsdMUoeGwcKbj
	 kBpTfEZG/Nuc2XNSDGkXI+AUWDHgHh5OkhKwmsqunBW7TeWicZ8imfgMccgVUl7kDKp3I
	 k8ceDV5wYwvHqBJtJhHk7kwNnTi7AjRJqxBBbjZyjL0E9nibMqpU8jAnIoDqDKKrVUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=FLrnUWe4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FD2606A31C;
	Mon, 16 Nov 2026 19:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=FLrnUWe4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A3681F000C4;
	Mon, 16 Nov 2026 19:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794859140;
	bh=gZt9HQUyu/ePb4wk+5Ugjo2JcWeL+KRy5Jk36rElSuY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=FLrnUWe43Gc6Lwk1AJRe8wYO32y4ZGfQ6+KSGXlVjrCqKuM0UxXfXZTACYz6UDv6U
	 ZBiRBY5j8cti5d1qhIHNmXTF+yv6Od8dllnI195pTIq0ONii8BHxy+06um0F66wsBF
	 mhJ9RJ9sLuF+mmYXgNDZ1NBVr4Kf2bg9W0MHJ010=
Date: Mon, 16 Nov 2026 11:58:59 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Willy Tarreau <w@1wt.eu>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Theodore Ts'o <tytso@mit.edu>,
 David Hildenbrand <david@kernel.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: submitting-patches: ask bug fixes for their
 user-visible impact
Message-Id: <20261116115859.0e89464677cf765681cf35d7@linux-foundation.org>
In-Reply-To: <20261116195205.335116-1-sashal@kernel.org>
References: <20261116191436.188098-1-sashal@kernel.org>
	<20261116113453.013103c694ad966c56ddeb31@linux-foundation.org>
	<20261116195205.335116-1-sashal@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 16 Nov 2026 14:52:05 -0500 Sasha Levin <sashal@kernel.org> wrote:

> 
> Willy pointed out the other side of this: ask an LLM for the worst case
> and it'll stack up every config option, module and USB emulator needed
> to get there, while for backports you also want to know whether
> innocent users are affected at all.
> 
> I think both fit if we ask about the two cases separately. Something
> like this on top?
> 
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -63,14 +63,26 @@ from upstream, so include anything that could help route your change
>  downstream: provoking circumstances, excerpts from dmesg, crash
>  descriptions, performance regressions, latency spikes, lockups, etc.
>  
> -For a bug fix, this means saying what the bug does to a running system:
> -the worst that a user can see, and what it takes to trigger it.  An
> -account of what the code does wrong is not a substitute, as it leaves
> -every reader to work the consequences out again.  If the bug was found
> -by review or by a tool and has never been seen to happen, say so.  If
> -it has no effect that a user could notice, say that too.  Maintainers
> -and the people looking after stable trees decide from this whether the
> -fix needs to be backported.
> +For a bug fix, this means saying what the bug does to a running system.
> +An account of what the code does wrong is not a substitute, as it leaves
> +every reader to work the consequences out again.  Cover two cases:
> +
> +- Users who are not looking for the bug.  Say what a normal workload is
> +  likely to run into, and separately what the worst case is and what it
> +  takes to get there: configuration, hardware, privileges, timing.  If
> +  the bug was found by review or by a tool and has never been seen to
> +  happen, say so.  If it has no effect that a user could notice, say
> +  that too.
> +
> +- Someone triggering the bug on purpose.  Say whether an unprivileged
> +  user could do it and what that would take.  A race that no normal
> +  workload loses can still be won by a program that retries it on every
> +  CPU for an hour.  If that makes the bug a vulnerability under
> +  Documentation/process/threat-model.rst, follow
> +  Documentation/process/security-bugs.rst.
> +
> +Maintainers and the people looking after stable trees decide from this
> +whether the fix needs to be backported.
>  
>  Quantify optimizations and trade-offs.  If you claim improvements in
>  performance, memory consumption, stack footprint, or binary size,
> 
> If that works for both of you I'll fold it into a v2.

Looks good, thanks.  Still
Acked-by: Andrew Morton <akpm@linux-foundation.org>

Of course we don't have to get this perfect.  Close enough is good
enough.  Deploy it, observe effects, fine-tune later.
