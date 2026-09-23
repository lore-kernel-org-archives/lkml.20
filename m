Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A07A26D4C3;
	Wed, 23 Sep 2026 07:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790148722; cv=none; b=qUIjiV/lITcwWqjAoDet76D0qhfzlTOHrGctLtB2QlkhyFVI1EkRtEI5zg6h4auQyyIjG489ivwK/lT6JsA2IaJbwqprNOj1OyMPW3w5sA3NvvJzDlLcwfjYQ5zxATzFVxzLuqBL3i8WbLZVCEOP6Uwqd/8cGmTAssYChvzekgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790148722; c=relaxed/simple;
	bh=hwZ+iuG+gOYcPfjkKMu0GPj8PJemUHOfKEBhvJCD2HE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=by36bxc0b2N62Y0wXpojW5pYQJjZessGPH0ZXnnlTgBvQQ27L0Z1WFzntwZ/Z0Ojza7XR8AHhqUZG1J89PLW+0o167+c+igjcHr9bT3b3dClSXaxkk4EIvvonjv9nNEOqw6cOlaOSTApuanZs/SmKZop1XH5oFc+T/YLlO8WNEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=c2Ll49yE; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=naxRGuHW; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="c2Ll49yE";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="naxRGuHW"
Date: Wed, 23 Sep 2026 09:31:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790148719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1HewFc6MQIu7MPmVmoGCv4hmfDIsZmxeragBM7LVQNM=;
	b=c2Ll49yEmOjnkc3mT7mNK2/xEO4RUm7q3nF1ucFPHldtb57zpVnoE91BzGwuP8hn1uPA+m
	aj2M9YCjNFJgr7D6Z+i0CCb306ppxKoO9MFVEfVMPLP4qGT+dvEvit/bMhR3uTVZqmL+oj
	ToggGaltCDcZ2iIQmFcsGjhp9aZCP2/KqvNeEVSvfiivXIWYkwZ8SloBDVipYlFceYp35Z
	0gZWLSqp4fFZoHzOAzKNcPHbWvzCVh+TGLOuHTroqE2HfbfD2rEQMkq3H/vn5tOSJeqHS2
	2j64fQoiO28qjJxUdKvU8+kusfI069gld4spl4q5muksJQWq7rMo49XcuY4QjQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790148719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1HewFc6MQIu7MPmVmoGCv4hmfDIsZmxeragBM7LVQNM=;
	b=naxRGuHWvvpxVQ6iufGBFJLSPDsyJ/AOtGtBsQu6fmudUHzWCCSnXmwwyYtzDHyffm5FIz
	AkQmMNYwcSe2xxBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Quchaosheng <quchaosheng000406@163.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] docs: kernel-parameters: fix a truncated sentence
 for preempt=lazy
Message-ID: <20260923073158.ik4UOBAo@linutronix.de>
References: <20260922083101.99685-1-quchaosheng000406@163.com>
 <20260922083101.99685-2-quchaosheng000406@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260922083101.99685-2-quchaosheng000406@163.com>

On 2026-09-22 16:31:01 [+0800], Quchaosheng wrote:
> The "lazy" entry ends with:
> 
>   One preemption is when the task returns to user space.
> 
> which is not a sentence.  It is a leftover from shortening "One such
> preemption is when the task returns to user space."
> 
> Writing it as "preemption point" reads better than restoring the missing
> word, so use that.
> 
> Fixes: f66e4a996582 ("sched/core: Update kernel boot parameters for LAZY preempt.")
> Assisted-by: LLM
> Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Quchaosheng <quchaosheng000406@163.com>

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian
