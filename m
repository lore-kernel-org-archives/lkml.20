Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793236503;
	b=Fnr2XoCXotycwXHV8POfXVeXDclAWkvqCsPN7+i6xoSMQonU8cT19vW+qA4izzG3qMto
	 ++ZJ+VOrqzx5Bth7M3cFHG2ZuyVVlH8AHDf2SLzTrpEll8JFGX3hI2f3RQkQVjJcFjreU
	 fPEOEVg1SHadUrXiV1JF7KLgaO9Mo1ZUUo9CvzD43skCKiXagiIyZ9fMbMmHn5v9NX/ic
	 yjRT9a7WDnlDQcSwkvHMNXBlIMhwELhrXXpU7pka/JCR5vF7Jlp14kKYv8jpoxLh9q9cQ
	 bK/p/9mmOOKUf607IuholiPkX+HDuuzEvnMhXT3iOeLi8tdKB2fKoGB9/Gxfrwjsz/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793236503;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=psRnZRmXcSPUYzIvnDLyWv/V7ARdJRdKCSZxEWa0wz4=;
	b=G1N6+SohSocL0pbAPaAAGWTZBkMSZN2krOx/mtuO6v1KeFvH+qDd+E6dmPXW42FQJ1SZ
	 erHu08exmNbH4Q3cWJ4PErcjXKi6uY1j+cF2wdbkkQm9jGousOGXs+HDAMrO+7rOJc5j8
	 gVG/IrmlevebUousAUitjM+kqPlCGUjR3r9p/cO+ssMOrRO/9vhN2Ar5hfA/6rjpLjjqU
	 3CZ1D8b7t3flfRTCjKIzOB+XaBUcHRtiN+iwYhJVFity/Uwsz2T+hZTjtapW9jAN1sIe5
	 LQxQpM3vn6gcfjvxlkWA52iwtIMzK327oB7oe6KtIBru0bdl8U6iyRgHNVFkC1FJSog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b="RtuA0J/D";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CD1606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=RtuA0J/D
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90B1D1F01825;
	Thu, 29 Oct 2026 01:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1793236502;
	bh=psRnZRmXcSPUYzIvnDLyWv/V7ARdJRdKCSZxEWa0wz4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=RtuA0J/DXolDkVe//VTihPn0dm0kNovREavyI3bmFl9bxavCTWQM3kWJ8tsOBgfwI
	 +WN3Rh2qpmSDNz2CO4rCSlDTJblFgra6M/iDq0Z5IPyZ5DAYnTV3RtvUbxrrpivd9O
	 JkbarbxFknigIOuzFQvSZJqxslKLugVqZEofKbco=
Date: Wed, 28 Oct 2026 18:15:02 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: david.laight.linux@gmail.com
Cc: linux-kernel@vger.kernel.org, Manfred Spraul <manfred@colorfullife.com>,
 Davidlohr Bueso <dave@stgolabs.net>
Subject: Re: [PATCH 05/44] ipc/msg: Fix saturation of percpu counts in
 msgctl_info()
Message-Id: <20261028181502.484379c56878a872899c0f94@linux-foundation.org>
In-Reply-To: <20251119224140.8616-6-david.laight.linux@gmail.com>
References: <20251119224140.8616-1-david.laight.linux@gmail.com>
	<20251119224140.8616-6-david.laight.linux@gmail.com>
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

> On Wed, 19 Nov 2025 22:41:01 +0000 david.laight.linux@gmail.com wrote:

It seems but yesterday.

> While the percpu_counter_sum() values are unlikely to be large the code
> tries to saturate them using min_t(int, percpu_counter_sum(), INT_MAX)
> This just doesn't work since the high bits are all masked and then the
> (possibly negative) value assigned.
> 
> Replace the min_t() with a plain min().
> 
> Fixes: 72d1e611082ed ("ipc/msg: mitigate the lock contention with percpu counter")
> Signed-off-by: David Laight <david.laight.linux@gmail.com>
> ---
>  ipc/msg.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/ipc/msg.c b/ipc/msg.c
> index ee6af4fe52bf..34e607add006 100644
> --- a/ipc/msg.c
> +++ b/ipc/msg.c
> @@ -501,11 +501,9 @@ static int msgctl_info(struct ipc_namespace *ns, int msqid,
>  	max_idx = ipc_get_maxidx(&msg_ids(ns));
>  	up_read(&msg_ids(ns).rwsem);
>  	if (cmd == MSG_INFO) {
> -		msginfo->msgmap = min_t(int,
> -				     percpu_counter_sum(&ns->percpu_msg_hdrs),
> +		msginfo->msgmap = min(percpu_counter_sum(&ns->percpu_msg_hdrs),
>  				     INT_MAX);
> -		msginfo->msgtql = min_t(int,
> -		                     percpu_counter_sum(&ns->percpu_msg_bytes),
> +		msginfo->msgtql = min(percpu_counter_sum(&ns->percpu_msg_bytes),
>  				     INT_MAX);
>  	} else {
>  		msginfo->msgmap = MSGMAP;

Added, thanks.

As always, bug fixes should include a clear description of the
worst-case userspace-visible runtime effects.  LLM said:

: When aggregate System V message queue usage exceeds INT_MAX, MSG_INFO
: returns wrapped statistics instead of saturating them.  At 2 GiB of
: queued data the byte count becomes negative, and at 4 GiB it becomes
: zero.  Consequently, ipcs -q -u can display an enormous used-space
: value or report no queued data despite substantial usage.  Monitoring
: programs using this interface can therefore substantially underreport
: or overreport resource consumption.  The bug affects statistics; it
: does not corrupt queued messages or alter queue-limit enforcement.

So I'll add a cc:stable to this.
