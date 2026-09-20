Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A50358399
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 05:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880575; cv=none; b=n03YwXJr/Rc54xoRXHkZRita+ccOvZ3pXvHfWhug/DbIcV95XONRr0sa/3q3CxS+05ILazpkYJ/VM20Cm7Jz4h+YC5zGOrSQgJmjVomF3h+JffnfTWQS6/vmOFddoYvN5roJ78Cr3jdku3M2WAFMEBWzG/OqktX6KQJUNSSXo1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880575; c=relaxed/simple;
	bh=RNQmpC2r6qpR7Bc1aDSuS7BJ12p1mR1rNyt5i8UpQwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FmWSVpjdwABUREHaV+TybwdQkRfDCoRwcjROcBHZwQgqNr/so9Xm2yJ5+o/sUtc7rK/PZaUgCq9W54/8m0FfSWUx/fo3QjAMV9R2521bi8li9/peVmdO+0ZMJn0PLbs3I/RZLgHFQM4U3HgAaRncFwevA5gUdv07E9JoKDw4LWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AY4zCvw9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AY4zCvw9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B08F61F000FF;
	Sun, 20 Sep 2026 05:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789880574;
	bh=wiGcf8f13yaP1zm0T6jJI4g/SWgvg/LRApQuiTeqk+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AY4zCvw9Yw3PdoM8GOId/DdTqUbAW1XhT3bdOiqIF67eb8PZsoAcaJC9hZbY8gjYX
	 qZXUG/tEKB6Gslb2vScdVkeqxogzsDNKXxsxhWCXCAKYjiCaiP2U/Ev9sj6hMutHH3
	 jOUU4fNll8n2USolP55M8xoZGenPDSc9Negz7ZQY=
Date: Sun, 20 Sep 2026 06:00:56 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Hui Peng <benquike@gmail.com>
Cc: arve@android.com, tkjos@android.com, brauner@kernel.org,
	cmllamas@google.com, aliceryhl@google.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] binder: fix sender fd 0 close and file refcount leak on
 TF_UPDATE_TXN
Message-ID: <2026092016-sphinx-turkey-1be6@gregkh>
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

Please delete all LLM-generated changelog text and rewrite it in your
own words to explain the problem and why this patch is needed (same for
your other 6 patches).  Also, how were these all tested?

thanks,

greg k-h
