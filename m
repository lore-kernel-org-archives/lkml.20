Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17353389DEC
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789656489; cv=none; b=VNZeLyVlEORZxDbUCrGozdIJtSPoS9u2sdKlC6LdSg+vndt053zf5ylcZ6KEByx4Agoy7dQT0WG5bK1dtYlzLfX30NNVUsqjhduzH8rlFX+HcgRdEEYiu1f9gaoqh2+JTECRbL61K2uVuKgs8e1TpD6b++k2jWHILAu4QNgEs9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789656489; c=relaxed/simple;
	bh=8OKXsz9hzSBOLyRt6ZGiGqsj9o3YPba4rRlzGXKqqrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VrKFtnypz6ar1fx2zJ+HI5OzB/yHRODZjMHYRZJ0OqVu9Bmds3wf5T5lVYoDgrfCx4LCq0YYDhQ5O4bRBzFnD5C2gFeGMp9uYNfZ9RodR0ZOmtnZ1a03DmWtjlS0QxxNWdOVUP1hd52cyWv7yv671QlW2uDFuskRYtcA0qkeGTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aVOXONVU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aVOXONVU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68C921F000FF;
	Thu, 17 Sep 2026 14:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789656480;
	bh=qLYTs/uFA5ShSM0CB+bV1mMUjyWXMl17MTCOQCMWRos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aVOXONVUfCTCYLBS3TVoJ6MNC7sIoKwJIQMEBDFOwco9j7WXXkju9M25l8TZWnU2b
	 Z3n6/2GvxjhXIOCMD2Oaj4JC1L6/Au1rOhI337t6UvPqaPdhVfAkS8nxZI5BK+tD1T
	 UIFvBAkDoOz43Go74hfvWghH6mwfcPpKl9Ofd4hxa9ER+S2DxA48UUGopkW/JrjAPE
	 cAUzVf+xhpulX9NIO9ubr/sitzKvkQT+qlhZv/gNRf+LRYDSHwvQQSzble71aaIhqA
	 aKOfE8r7U2fz2UHmg7Qz32xRP7I5S6JksbwY/Vw6615SHR2oM/j/NUDHRjwgGM+zL7
	 jFhoB5pD6OrQw==
Date: Thu, 17 Sep 2026 16:47:57 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Quchaosheng <quchaosheng000406@163.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] kthread: Report cpumask allocation failure
 without warning
Message-ID: <aqv9nYRtwcTkJJ64@localhost.localdomain>
References: <20260915014222.13423-2-quchaosheng000406@163.com>
 <aqqR-up8wovbEsv7@localhost.localdomain>
 <20260917092116.388262-1-quchaosheng000406@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260917092116.388262-1-quchaosheng000406@163.com>

Le Thu, Sep 17, 2026 at 05:21:16PM +0800, Quchaosheng a écrit :
> Hi Frederic,
> 
> Thanks for looking at it.
> 
> You are right that pr_warn_once() is easy to miss, and that this matters
> least at boot under memory pressure. The case I was worried about is the
> WARN itself: __warn() taints the kernel and calls check_panic_on_warn(), so
> on a box running panic_on_warn=1 a recoverable allocation failure turns
> into a panic.

panic_on_warn=1 can be useful for debugging but I doubt it's ever a good
idea on production though.

> That said, the allocation is GFP_KERNEL on a path that runs
> once per thread and almost always at boot, so if you would rather keep the
> warning as it is, I am fine with that. It is your call and I will not push
> it further.
> 
> Two things I should mention, since you are the maintainer here:

Well I'm not exactly a kthread maintainer, though we all care about that file
and I can do a pull request when necessary, so I'm just giving my opinion here:
I would rather keep the warning because when that allocation fails, something
bad happens that is unrecoverable and that's what warnings are for.

> 
> 1. I am not going to re-send this. Waiman said the patch looked good to
>    him, but you are the one who would take it, and "mildly convinced" is
>    not an ack. If you want a revision with the message kept as WARN, say so
>    and I will send one; otherwise please just drop it.

I don't think it's a necessary change but let's see if others have different
opinions.

> 
> 2. This was prepared with an LLM coding assistant and should have carried
>    an "Assisted-by: LLM" tag per
>    Documentation/process/coding-assistants.rst. It did not, and I am adding
>    the tag on anything I send from now on.

Ah yes please! It's useful for us to know that when we review.

> Sorry for the extra round trip.

No problem, iterations is how we work :-)

Thanks.

-- 
Frederic Weisbecker
SUSE Labs
