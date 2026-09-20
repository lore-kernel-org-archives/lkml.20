Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580FB19CD0A
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 05:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880537; cv=none; b=hjmPgaM1gxrqUV6gQrPVvn4KPYyQrKggXu5frH56hIuGEwQ3IghoOLX5Aqmb6xGCW+qCT94lR+H/84IzGKdlvfRsiPV/+aNLSV5l49Q2ZE7BNdCI8F5DIMQMSpOolCQtGL74fHGE9uZ0OSlLSQPkcLVz4C0nkQJXH+gAX1ZSTog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880537; c=relaxed/simple;
	bh=p1pFH9Rsa6fo05912jWcJrgxg0GMpSJNmChgTCkre4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ltcVVVf0w4Ewln+2WWNTPt8XD3KjIbBpl9iv2tUHO1JeoapJikXRyGQixkK3krmKjI8MMyJY+AH3n7JGU9vvuLgta02+YSYvL3JhM8GKiGxqn/7PZfpWUmEYaduMBnaVz+q+J5tgag93FgWp54NMCrOKEywYlKWjjJqSlEzS/4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lbqj7cTE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lbqj7cTE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37B321F000FF;
	Sun, 20 Sep 2026 05:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789880522;
	bh=Yv3YgZjAaC1TXq8/RRpVIkFxT1BQJM0XPVQLC3Y0x7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lbqj7cTE0TperEQxL63L6soPnXULLthRw3hozCXZThQC9WYjL+Cvc0IceP7qShN6b
	 k+dBd2zNLtOlSn9wzj4dLjtTeW8jBIpp6Om50aMJ/iZCIlA12RpHNHdPhqktVpYNfE
	 Q0KDtlBsdFjdoisEYKCk+MsXXy69sl3Tx9S6akmU=
Date: Sun, 20 Sep 2026 06:00:04 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Hui Peng <benquike@gmail.com>
Cc: arve@android.com, tkjos@android.com, brauner@kernel.org,
	cmllamas@google.com, aliceryhl@google.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] binder: fix sender fd 0 close and file refcount leak on
 TF_UPDATE_TXN
Message-ID: <2026092022-wad-vertigo-3361@gregkh>
References: <20260919213648.3316566-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919213648.3316566-1-benquike@gmail.com>

On Sat, Sep 19, 2026 at 09:36:48PM +0000, Hui Peng wrote:
> In `binder_proc_transaction()`, when a oneway transaction with
> `TF_UPDATE_TXN` supersedes an outdated pending transaction
> (`t_outdated`), the driver calls `binder_release_entire_buffer(proc,
> NULL, buffer, false)` and `kfree(t_outdated)`.
> 
> Passing `is_failure = false` while `buffer->transaction` has already
> been set to `NULL` causes two bugs when `t_outdated` contained
> `BINDER_TYPE_FDA` or `BINDER_TYPE_FD` objects:
> 
> 1. For `BINDER_TYPE_FDA`, `binder_translate_fd_array()` never wrote
>    recipient file descriptors into the buffer (it only appended `struct
>    file *` entries to `t_outdated->fd_fixups`), so the FD array in
>    `buffer` still contains zeros (or sender-supplied offsets). Because
>    `is_failure` is `false`, `binder_transaction_buffer_release()`
>    executes the `!is_failure` branch on `BINDER_TYPE_FDA` and calls
>    `binder_deferred_fd_close(fd)` (closing `fd 0` in `current->files`,
>    which is the **sender** process!).
> 2. `t_outdated` is freed via `kfree(t_outdated)` without calling
>    `binder_free_txn_fixups(t_outdated)`, permanently leaking every
>    translated `struct file` reference in `t_outdated->fd_fixups`.
> 
> Pass `is_failure = true` to `binder_release_entire_buffer()` and call
> `binder_free_txn_fixups(t_outdated)` before freeing `t_outdated`.
> 
> Fixes: 9864bb480133 ("Binder: add TF_UPDATE_TXN to replace outdated txn")
> Fixes: bdc1c5fac982 ("binder: fix UAF caused by faulty buffer cleanup")
> Assisted-by: LLM
> Signed-off-by: Hui Peng <benquike@gmail.com>


Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You sent multiple patches, yet no indication of which ones should be
  applied in which order.  Greg could just guess, but if you are
  receiving this email, he guessed wrong and the patches didn't apply.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for a
  description of how to do this so that Greg has a chance to apply these
  correctly.

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
