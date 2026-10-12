Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621EE3644A3
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791785694; cv=none; b=W8WpXsk2pq9LQSLMugumIbtnnLZTEDOsaXiZRVgThDZ0oJx8kmv/F7JqD3Zdw32wZ6yjm1bMH9HIjH98twyxVAyPW4sn/5TBpDFxtFRIwjhNAOY7ZKlsvh93MH9fY0jlWdEtgK/PpwG2yudl0NNKCtvhqorB9fWrnAJkUTtN1dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791785694; c=relaxed/simple;
	bh=G22C94oTbSJwGYSY+VHiYfvEgAPdAmWxwlXJwiG4YNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tk+cVL0cIog2YBaOJx4T4NBhHVLYz7ZDrh1JFmTo4rUu7aZq3hdbkVzOdrr7WoFQ64wtTgb2+EmgPhUbTuawcQ6sSpjJmgGAx6ns8xKq875XtPx8oK+/+SogBomEWtosaMHdk2fjieGai5oK7WD5EZE9zF5d0MCBkNnoty4HgWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TzStd9kx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TzStd9kx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85F5D1F0089B;
	Mon, 12 Oct 2026 06:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791785693;
	bh=uzpLCjeSvq3Sz+diFEUtjnzN+l2ZSZZQ86fGDFdee6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TzStd9kx8dVJRsNAE3Iu/jxwPyUT19wBTfNP2acRe6FOMq1gxvwOJsQwiIpx2E7eM
	 Qz2Avpcbs/fT9ANWoTnkUDVYZh5SI2Ddui/KS0ySyUPaK+Gg9iyihUivWVlF2uFlk1
	 7ELlYu+ma9n4E+Z8bYHUiJdpyUb5S6tp6igDanMg=
Date: Mon, 12 Oct 2026 08:14:50 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <christian@brauner.io>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org,
	stable <stable@kernel.org>
Subject: Re: [PATCH 7.2.y] rust_binder: reschedule node refcount update on
 thread exit
Message-ID: <2026101240-waffle-outboard-97db@gregkh>
References: <20261011163608.48622-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261011163608.48622-1-ojeda@kernel.org>

On Sun, Oct 11, 2026 at 06:36:08PM +0200, Miguel Ojeda wrote:
> From: Alice Ryhl <aliceryhl@google.com>
> 
> commit 2a74ccd1bcc170e66525f34e9de8652b57e2cf3d upstream.
> 
> When a thread exits via BINDER_THREAD_EXIT, its pending work items are
> cancelled. If a thread exits while holding a pending node refcount
> increment (e.g. pushed as deferred work to that thread), the refcount
> increment was previously dropped because Node::cancel() and
> NodeWrapper::cancel() were no-ops.
> 
> Dropping the refcount update leaves the node's delivery state and count
> state desynchronized, and userspace will not receive the notification,
> which can cause the node to never be freed from the process's nodes tree
> when all external references are dropped.
> 
> Fix this by implementing DeliverToRead::cancel() for Node and NodeWrapper
> to move the pending refcount update to the process's work queue on thread
> exit so another thread can deliver it to userspace.
> 
> Cc: stable <stable@kernel.org>
> Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> Link: https://patch.msgid.link/20260903-binder-thread-exit-node-v1-1-be09ff14f6a4@google.com
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> [ Dropped first argument in calls to `push_work()` to adjust to the
>   existing form without mainline commit dbb17c9ea756 ("rust_binder: move
>   (e)poll wait queue to Process"). - Miguel ]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  drivers/android/binder/node.rs         | 20 ++++++++++++---
>  drivers/android/binder/node/wrapper.rs | 34 +++++++++++++++++++++++++-
>  2 files changed, 50 insertions(+), 4 deletions(-)
> 

Both now queued up, thanks.

greg k-h
