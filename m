Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251741;
	b=1S30+nSFg0K0D85xvABOkKwHqa/pc7ZOWDB3UAAFayI/4azYDMXSTmJqhMYVOG9l2i/W
	 q3pQiIu92smnKD9V9dudPsd9yU1OR3aJXn1D8tAzNmIz00NoLINeiU6yZUo/6VDPeg/Eo
	 Xk08R53AHHRM3p3sMIIvBWg6gwfRPXGMN1CGFSs5r4YHayN7XidHm+LkFEz95SuVsL4mr
	 2X27ObTSJBIIHu4ftjUyLRwdwI8MTveSWuzUE6GFUP0zdR048R9hToATQeHM3ni8/qBUW
	 DPfrsomNuh/dS83X2qE7ChwyjHuCZe4L1schuw4kN2gZwJgXwMxO84W8UBR3w5qnZeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GrUZJVeF5sY/cVx8v9rGUseT6GRoFxsf2dttb4YQUgo=;
	b=KpkQ2qvMZX/1rJEi8Vrh+WxLOnLqXbN134UAoEqR+Oh+mVl4FDbNkNWcbi2+DM0gGzcI
	 rXFNbxyEbACul5k1rzXM0WjzR7Dl6L7w+hUBI25qTtfZrv+e5Zjaz/sMwvesS3J7KDUza
	 WFt3YQaVyJTKpfbiMr7GtaSkXIIfHsbrZCjpGuWfesusVKCvEDmtSzYCRfXBfqUYhyoq4
	 yNYVLfjmBopZfSNRV4ZAMSFx8sfskuDtcQHIBaFOiYZOby8BL58tN8sty1mJZYiKJGOrs
	 5mGjMBJLlZ9t/ZQaDMcnIxv1B9nzrhqmpa9CUS6Qe9DuEs0u1w1KneD1MNdwPfwUwFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b62pqDy1;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B737B606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B737B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b62pqDy1
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e9f6a16afcso6865ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794251740; x=1794856540; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GrUZJVeF5sY/cVx8v9rGUseT6GRoFxsf2dttb4YQUgo=;
        b=b62pqDy14TCopaQGk/31fAvQW+KtHpoxHJYVFGmy4VkgmFW22BQfHeqxcaHnOvTP/7
         DLyXJKDQNu9FZTmJz37+rIhB6QrbnmmWWvlWmKCl8coLZ3G1pTDu7OArewcQn8E5msyp
         8HAKr3kzn0sLvBxZXiDcp8hevGxqyLPW5Qe9ckWIc8RG4mVwhWl5eA7oYqF3lBy3Z01Z
         NLTxAnu0DdgAjHzNxkt9MuFiIx1e6TvsIZJgRHvCp1aPyOQAsBpLdZh1yPt7IwejWOFA
         Z/dxDOda403RAJA7zfZKVKKtOqtLkwC7ZRyrWEvEP4Vquu0j2qwb9qBYjYflyF+Q8KCP
         7vcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794251740; x=1794856540;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GrUZJVeF5sY/cVx8v9rGUseT6GRoFxsf2dttb4YQUgo=;
        b=Rm+O1H6ZAK/t65gUiIo+Ap3A+b6nt2YQ7vbKD8pUpNgqKU7usZiCoPaS/Kew8cZcu5
         0C+HSTFajZmarFAE7mDvumV0m8jlCW0pY9OZHf8KROBsTFv6A0W98BIjHytVmGptQY7m
         iC0n9qA0vr0iOmCIALe4N+A1D2ynCcGzgCh2naMYAwIM8iuUxc7XBGbGxTSODsz7YCLW
         DKPnLH+rz7HjbkrzibP6q8Lvek2fjAvSvgqhNI+ZDFIP+j1nTnwrD7rNSwgw3EOaFF1I
         GoPNlT/HcKn4ft7JqkGpDh4+4E8Bx10FaYlaZu2OrIj1Ud1UcS+DNl9x0enptAOLj8YP
         KNfA==
X-Forwarded-Encrypted: i=1; AL+hErEwdAsvvOUkOM2oJ22u4PrXqg+0VyC7RK+S266m5cHbQitZUa1aE65GBZScJ4yb9e7hV/t1eyWdxHtEmmQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FDIQOpgtIC0I6CuCmogkjI6z2BkIIpomBdBPAehHTh8UQ6XRJ
	1LAqXoRWPeQROi15yvmRec0V7pEp2ilLShC8wflDkjKMnjIwQ7On6lc8pFKYmMsXyA==
X-Gm-Gg: AYBFou12bPBd64zW9TClERc/NZGz8Bf4EhTFrJViRGRh5NbwgEdTYwLLediPYdB2bYq
	Pj3QUNL2L/raT+DTVGQ0EiZYxaKAI+jydpYkcvS6MjnxcLmSa7xvMA39gEg7J+wF/9lFg6WyIxd
	ih0XrLKEasELDCgNb2ohC04HenBbvpUIf4z24iHfvgQGIxjBM7Cak8EvaANHoHi75mMcDQhaH6H
	KlcwYCswOuU+H0U93i979rYzRQ4oOQGZ37B7FFKpqVvzTowDWinnIzilgJ/AfOLXSfyhkIsw+iB
	pi/jGFwE+Tl2X2J5DulYNp/b3gkxwpsSymNE8YXa71P/Z+HkCXq8G1nIbiRfBHq2dixzXQEKMYz
	eqg+3LKo5T4Ns0RBUIFFmKl+j/jIoCGesGYU3mH3XEPzksTX/2CfkbzhDwtuILUfLKA7FlppUUR
	QT3pLNPAhsru+2XbUiPugkKLQVxDWpagvSPNshh0ENVSNwDUyIjKANTvDzvCPbWUMaJrQ0pK9c8
	myhun05Ddtqu5VopEzbHFPoVEXwwAZME7CG4Opmfd4k+UyuIr5KdioiDl0HiLiMCIFMpjIUJ1yI
	vaZQ35buay/PAmmDWOfhnmEgm4V7KAI39+5tjoXhVvbf1RnOlnad0mY0+S+xOQyWmdmsq1TpuQu
	zU7oBvGMR6XbBQWYxqNYgfH/6GjpQLbU4rH2+XOHMuVDs1bexFjDnAnXxCt9yPFZXSNWIxTVvJx
	XqYBv9RrKYQERNlYnCXh9MZ3nACLY9Vwg3qNTf9CDXXDTCe3S4QNGWoAadLilF6DiL
X-Received: by 2002:a17:902:e80d:b0:2d5:db38:8013 with SMTP id d9443c01a7336-2edb70335bemr923045ad.18.1794251739421;
        Mon, 09 Nov 2026 11:15:39 -0800 (PST)
Received: from google.com (25.229.125.34.bc.googleusercontent.com. [34.125.229.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaae3e9dasm35868b3a.34.2026.11.09.11.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:15:38 -0800 (PST)
Date: Mon, 9 Nov 2026 19:15:34 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Chris Wiseman <chriswiseman@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] rust_binder: reject sync transaction with pending
 sync work
Message-ID: <avIb1n3zk7KKdFfj@google.com>
References: <18e61a85b0d13e9c.3137322e32332e3235332e313736.9c152.0000sendgmr@google.com>
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
In-Reply-To: <18e61a85b0d13e9c.3137322e32332e3235332e313736.9c152.0000sendgmr@google.com>

On Sun, Nov 08, 2026 at 03:11:01PM +0000, Chris Wiseman wrote:
> When a thread replies to a transaction with TF_DEFER_COMPLETE, its
> BR_TRANSACTION_COMPLETE work item stays in inner.work_list while the
> next blocking read waits in Process.ready_threads. A new incoming
> synchronous transaction can then be queued behind that deferred
> completion in inner.work_list. If the thread's read buffer only has
> room for the deferred completion, the ioctl returns to userspace with
> inner.current_transaction cleared while the incoming synchronous
> transaction remains queued in inner.work_list.
> 
> If that thread sends an outgoing synchronous BC_TRANSACTION before
> draining its work queue, Thread::transaction_inner sets
> inner.current_transaction to Some(t_out), and the read phase of the
> same BINDER_WRITE_READ ioctl pops the pending incoming transaction and
> overwrites inner.current_transaction with Some(t_in). This orphans
> t_out from the sender's transaction stack so
> Thread::unwind_transaction_stack aborts on exit, leaving a permanent
> Arc<Thread> <-> DArc<Transaction> reference cycle that pins both
> Arc<Process> instances and their mapped ShrinkablePageRange pages
> after the processes exit.
> 
> Resolve the TODO in Thread::transaction_inner by rejecting outgoing
> synchronous transactions with EINVAL when inner.work_list contains any
> item where DeliverToRead::should_sync_wakeup() is true. Checking
> should_sync_wakeup() matches C Binder's BINDER_WORK_TRANSACTION check
> and ignores Node or NodeWrapper BR_INCREFS/BR_ACQUIRE items pushed
> onto inner.work_list when Transaction::new translates flat binder
> objects.
> 
> Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> Fixes: 8eb05e8e47f1 ("rust_binder: add TF_DEFER_COMPLETE flag for avoiding userspace roundtrip")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chris Wiseman <chriswiseman@google.com>
> ---
>  drivers/android/binder/thread.rs | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
> index f5965e838a96..3ca5c95695e4 100644
> --- a/drivers/android/binder/thread.rs
> +++ b/drivers/android/binder/thread.rs
> @@ -1393,8 +1393,6 @@ fn transaction_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResu
>          info.to_pid = node_ref.node.owner.task.pid();
>          info.to_node_debug_id = node_ref.node.debug_id;
>          security::binder_transaction(&self.process.cred, &node_ref.node.owner.cred)?;
> -        // TODO: We need to ensure that there isn't a pending transaction in the work queue. How
> -        // could this happen?
>          let top = self.top_of_transaction_stack()?;
>          let list_completion = DTRWrap::arc_try_new(DeliverCode::new(
>              BR_TRANSACTION_COMPLETE,
> @@ -1407,7 +1405,9 @@ fn transaction_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResu
>          // it with the new transaction.
>          {
>              let mut inner = self.inner.lock();
> -            if !transaction.is_stacked_on(&inner.current_transaction) {
> +            if inner.work_list.iter().any(|w| w.should_sync_wakeup())
> +                || !transaction.is_stacked_on(&inner.current_transaction)
> +            {
>                  binder_debug!(UserError, "got new transaction with bad transaction stack");
>                  return Err(EINVAL.into());
>              }
> -- 
> 2.56.0.317.g454f8302e1-goog
> 

If the issue happens when there is already a pending transaction, would
it be better to relocate the new check to top_of_transaction_stack(),
before we execute Transaction::new()? If possible, we can skip all the
unwinding associated with this. If not....

Reviewed-by: Carlos Llamas <cmllamas@google.com>

Thanks
--
Carlos Llamas
