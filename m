Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79502E2DDD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 23:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788306432; cv=none; b=SJbx9CtgQSL87b6kqj7zfOC63M/XFgrUwA7ZLxFFRSvCBk8vW+Mmwj67nHZTSEE6Qdc9ajFdFJPBRlBdD9ae0FDzDbBQ0GjlxovDekYaUkzt0yENaylFpcd42Sh2TCDEhKMZFoxIAWrBgyntD0+ZXI+GcMr9Umy3nHITkQPvcKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788306432; c=relaxed/simple;
	bh=H2Fvv3qKAPhexEokyQp/eQXdRktDEgK267SFHNDClfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=isC8H2puN9rE8pRb7mduNo81EUb3yakPOuSh0QXkte/TpdGvVfyR1pCdSx2HplvBvRUT3HPuZk0cBc1l4H+a4b5Qq+l1znP8/SqjF8xGOTarIc3MDa7Rcy00ygTdlNm50MinVjAAK9T9nHgOFSxGNGFHu74fpb0xVXSUL8DYY/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iLJZt+zN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iLJZt+zN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82D6D1F000E9;
	Tue,  1 Sep 2026 23:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788306431;
	bh=vJuDdqkWF1P5fFo6jrZpffm7C7MyWG8mq2JufqWa7+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iLJZt+zNEoTCjyXLe5c4L+gqBY/KpUonQQbZMIBdJUz9k7LR+NSRXomUHhEiwNgV7
	 uaz7OfGqASTbhLnnIF6qwNja3UDBYj5RSOO3L/WntavpEEM+IdmToqEYld8m7t5TW0
	 CgRVkwDw5XBvszBngnoO9lz8DNdukDKWF4JDdEtgXki3Xym5dSrRLCt2ZhGQAomZ+W
	 Uwv0fBxfGyuRCUFZwGALYB4gdjBccl8XfVG3fCldqQqtu9qV2xj6mMLdjBWkNmLH4I
	 BJnndCgbWwrWJVVorYUui9Qay7OI891Ern8xENBKEEmYhRz3YQIZiOJr/A94SegVY6
	 oRp/dTafUHPmw==
Date: Tue, 1 Sep 2026 13:47:10 -1000
From: Tejun Heo <tj@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@kernel.org, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] sched: Remove sched_class::balance()
Message-ID: <apdj_iMZ8Rl7wsXK@slm.duckdns.org>
References: <20260828101659.812011872@infradead.org>
 <20260828104018.996963405@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828104018.996963405@infradead.org>

On Fri, Aug 28, 2026 at 12:17:06PM +0200, Peter Zijlstra wrote:
>  kernel/sched/core.c      |   23 -----------------------
>  kernel/sched/deadline.c  |   10 ++++++----
>  kernel/sched/fair.c      |   47 +++++++++++++----------------------------------

diffstat has fair.c

>  kernel/sched/idle.c      |    7 -------
>  kernel/sched/rt.c        |   14 ++++++--------
>  kernel/sched/sched.h     |    5 -----
>  kernel/sched/stop_task.c |    7 -------
>  7 files changed, 25 insertions(+), 88 deletions(-)

but the patch body doesn't have any fair.c changes.

Thanks.

-- 
tejun
