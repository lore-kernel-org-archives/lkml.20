Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677197;
	b=cdXBQ2pRLanX39anSQMvv1B2krZJzS7TV1WD0WA1z7p2T1iUBKZmUgfBJ0drlpd0911c
	 /h/JA66a019Oi58PIjmvFEnmV5ViDMQ+AWvaxdcbhm0oiBJjA3vVyernfpASOOimCqzW3
	 6sNfSde3y3QxxblNQ5M3oGaxYkr9yeIw55QzPI5fFSIDDnrWbNSiTam+AInxNODOXvXYG
	 1Tpr7eN0ScsKGrn9lTj+PKY1CD4izIQBKS3kWsbOg/qJvuD65gBYzDTcbMNoZ+vBoHgjx
	 pnWjD7/Hp18hs3Oti4KoJfvux2HJ9dwa2vR9Dxb6Kdrx4ISRcC6/4KBDrkLB50G6OZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677197;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=DzhR2L4XhC7bpp8sqzRhFdyulkY1Uuqge/MHzZq/OJ4=;
	b=rPNivdCGX/O3LZEY5J3XpwS5ioveWP+yp+dEvrwkTu6I86ce0zKNdugQpXxxBY0QmXqU
	 K4b2zOC0Hbqdy/9bt33Wn4c4T0ewFHTzz0CXraE7CFIdeGC7pP4MWjSk31d5qqM716l+G
	 1EOOI4PW2kfZD2SBdvOAtY4yQBPvo3xaMBRJ9Bu97rpSzr5OPtzS3f36C258dUFd3uyuM
	 3PbIB9vyijfvZizP1BZtS9eLmY05teIdNkgd5iY5TiFO+IBmPB56M+Xw9v3fuh8Mx+sF6
	 N4sxHJGMlYOcKU8Olk1s7nB/MZpHTwL6k7M5xn0W8NttGyIZmmQEs7oG90p2mNAbwBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=tFntqpmI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE7760A2600
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=tFntqpmI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D0F21F000CB;
	Thu, 22 Oct 2026 13:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792677197;
	bh=DzhR2L4XhC7bpp8sqzRhFdyulkY1Uuqge/MHzZq/OJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=tFntqpmIwOEH1lNPEzcQDlCmNy20wMHXjhKhlhqemjVR2Rh9Y9rfbYeSpA+sYfJOJ
	 vQdPEi3wVHXGRl9JGddJeTaPJzPrJDrp1LOS4foXVqt0qUGztsTuCp4U5I+8Zkz2LX
	 6GYZ0Jd9S+YDvsS7bLmgUwEPxIx9B/vObBxk9Jdk=
Date: Thu, 22 Oct 2026 15:52:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Eduard Zateev <hackerowskiy@gmail.com>
Cc: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	syzbot+61464b62b688791cc24c@syzkaller.appspotmail.com,
	syzbot+a2e50fb40695811c2dab@syzkaller.appspotmail.com
Subject: Re: [PATCH] greybus: operation: keep operation alive while arming
 timer
Message-ID: <2026102259-cucumber-clasp-a64a@gregkh>
References: <20261022134817.1703927-1-hackerowskiy@gmail.com>
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
Content-Disposition: inline
In-Reply-To: <20261022134817.1703927-1-hackerowskiy@gmail.com>

On Thu, Oct 22, 2026 at 03:48:17PM +0200, Eduard Zateev wrote:
> An operation can complete after gb_message_send() returns but before
> gb_operation_request_send() arms its timeout timer. The completion
> worker then sees no active timer, finishes the callback, and drops its
> operation reference. The request path may still arm the timer, so a later
> final put frees an operation with an active timer.
> 
> Take a temporary reference before sending and keep it through timer
> setup. After arming the timer, inspect the result under
> gb_operations_lock. If the operation has already completed,
> synchronously delete the timer before dropping the temporary reference.
> 
> OpenAI Codex assisted with the syzbot investigation, race analysis, patch,
> and changelog. The syzbot C reproducer drove Greybus ES2 under ARM64 QEMU
> but did not naturally trigger ODEBUG. In a test-only build, forcing
> completion work to finish before timer setup left the timer pending when
> the operation was destroyed before this change and inactive with this
> change.
> 
> Fixes: dbec27298b0d ("staging: greybus: operation: add generic timeout support")
> Reported-by: syzbot+61464b62b688791cc24c@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=61464b62b688791cc24c
> Reported-by: syzbot+a2e50fb40695811c2dab@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=a2e50fb40695811c2dab
> Signed-off-by: Eduard Zateev <hackerowskiy@gmail.com>
> ---
>  drivers/greybus/operation.c | 28 ++++++++++++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
> index 7e12ffb2dd6..5bfee8638c9 100644
> --- a/drivers/greybus/operation.c
> +++ b/drivers/greybus/operation.c
> @@ -188,6 +188,18 @@ int gb_operation_result(struct gb_operation *operation)
>  }
>  EXPORT_SYMBOL_GPL(gb_operation_result);
>  
> +static bool gb_operation_is_in_progress(struct gb_operation *operation)
> +{
> +	unsigned long flags;
> +	bool in_progress;
> +
> +	spin_lock_irqsave(&gb_operations_lock, flags);
> +	in_progress = operation->errno == -EINPROGRESS;
> +	spin_unlock_irqrestore(&gb_operations_lock, flags);
> +
> +	return in_progress;

What prevents this value from changing right after you unlock and
return?  This isn't how to handle locking at all, right?

And how is syzbot testing greybus code?  What userspace / device is it
attempting to emulate here?

thanks,

greg k-h
