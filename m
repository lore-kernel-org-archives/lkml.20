Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AEF282F17
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790204070; cv=none; b=p0hCcy+OzhnALi3QiKJgjJSddmiIox4vyX0WKgb9eU7uykz4+xQclEhjtZwdKghGXg12L+qRqSO9CbCy5Y9DHofoMDIicneqTxhJwLaWW542v/sHDxjj/ZrMH7hFn7cCDC4usbW4jNNQI8uNTFt+WvIR0xM12t1mhmItRNhDqb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790204070; c=relaxed/simple;
	bh=hX3qESofkGbfcMB0aO/C43Z9G/OxRBEysJ+CQQxqCUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CNQ7gA2cHUWcVzhAOADffEdby2f79ky9JvOs0gyvB7Bv9zY3iYDhSdR8lfb6YjYS7H+7X7lThQNrDxYBus58L0baSrTpCXa6XMjFQxMH8h/6+pV7BFq9HU3Eu+DEFDFZpZ8KPzpyNnF4NOX29FTON3UnJnddKgcUvxXIti/eqIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iTWuKxnN; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iTWuKxnN"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d8facae850so30435ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790204067; x=1790808867; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rMDo+X/2MzjzEhVRArA5N0lIO2nb8Pwu0OsXI9nu1sA=;
        b=iTWuKxnN+3i5jfJ4GnfCj/ycKMCAasVV4KwWxG8/9jd3ZW1tMJQnmcjmrV0hzzVTqr
         cd039laAh2yc64b5upzUJQdF9Qj7pGB0lUbWeJerk3uVYv2xatbXsk66Q4QxBf+ew8sK
         UcYwGteKAFAJ9ucE8Q3rlLleipN44BDuHt1Ih4ONZJv3AaebHaDQDpj1D0YzxS72XJ5I
         dA0udeI8DtC9uM04oM6wTFKKS3Y9rtbJ7BmOvAdU5mRPiHKy6VK4Lw1CWPWwtwe6hIDi
         DUgzbiGMdNKkGIsUAtSOmiSl8pYxJNpq7rDWg5gmIu4izeqjOq8l3RC08SisN12s5Ojg
         zhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790204067; x=1790808867;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rMDo+X/2MzjzEhVRArA5N0lIO2nb8Pwu0OsXI9nu1sA=;
        b=ApDQdMDlnfZpwZLkqD576oCog4zojBwCvUr1I+w71TLugObaf+xQAUlRsw6oiYHTeI
         eld9uSmgHRJQvcczcafpGWl1rky6hxqNBVUMSSwc+O4rSiwJy1oDLyZGz//eDcFFkbhT
         cLl7OFvHU3Fp9p81vreItXcPYyJgbUSFJyoUcxx73MxryuD8sqRzVmUR7Q/XxXclZ00f
         dT0ExK8EpzRJgOgnOz6qZlWGYaeHWgnJ4h8trFeeaAXMhF9ljHH665SgOyxjbrnCoLp3
         /oK71oev2l6WBci4rW1T+2wNr3/QYXST98MI8J1VZ59rGhJMLAHhJ7QHwDc5aO/6ObBj
         85fA==
X-Forwarded-Encrypted: i=1; AKwUvBydspvP1BCPuDrAkrUa5ciY3L+nzGZNaaCR48efiJZPS/LXgmw8qqv1ph8/VyoCpmlPuTrsbj+n9fQuIe0=@vger.kernel.org
X-Gm-Message-State: AFuF++ldoHgISD2LLWDLDLxM1/1yG9pUqcAfSu1mHiHa33liQahp8OeN
	9zokz2w5SoXKasQd/yz++BR3g2NmEyPgWuZlXz7zgkrT9LLkJIJWz77dwF9LQdwAwhq8i4qgvgv
	VMcvkBg==
X-Gm-Gg: AYBFou2yEehyf2/PBH3OB/4Whl1pde1u600vRr86XS6hE8TMN4K1G3kjvwWQiSmCqbL
	c+7st5ez2TFYXmF0msgjNflGoq51tnYn6qPEKvdCqCdEYAXhXuD5BRLGtt3YOGCVxMxSOL+i57E
	1wWzuoSIvcGOVEmSNx4YQqZKRvF3kX4Vrj5BjAb3U+kd1g7ut4d4yU7BunhMTWu2wM/hBiA6k17
	HTqcqctIpevNMSrCk+UP0Q3XciOMkrFY5ZkLAlLgC7NrssrMcOOrJupuyjpDFwHZtxXCRgwwx73
	C6qmcOFhdf3a3s88DcC9MuqAocmXO4eqmy4hxywIX35XtGk3IcQ3GOwvJvlpBb6AceftewkB6qK
	C0BgR7Jq6qIY57DdksmI36UUjYAgGxv0ctECurEDES1Usv48gGtrKc36kUsa+nIGwV7QTkQ89tZ
	zINgG01ruGyklraxIPgE12qYW2pw8pvgDSHhsp1z8W+ClkehpgBynKvCe8tNQA2ymd8M64ienbN
	KKa0gORC5PZfUyNtQQb4gyXvXD+3cawasqdrblAOcmoNV18REZNpF5HC7fD56GTQbaM1FD2hHaf
	P9sroVMeiWFJVAv+6ot1LYBUeG4Rm6GxBMrF94ua5t6LMqw=
X-Received: by 2002:a17:902:e950:b0:2d7:1cc3:a69c with SMTP id d9443c01a7336-2df7bbd7994mr2742075ad.7.1790204066750;
        Wed, 23 Sep 2026 15:54:26 -0700 (PDT)
Received: from google.com (99.95.125.34.bc.googleusercontent.com. [34.125.95.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0974ec711sm1113572a91.6.2026.09.23.15.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:54:26 -0700 (PDT)
Date: Wed, 23 Sep 2026 22:54:22 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Hui Peng <benquike@gmail.com>
Cc: gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com,
	brauner@kernel.org, aliceryhl@google.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] binder: fix buffer/node leak and premature fd_install on
 read -EFAULT
Message-ID: <arRYnh6kMWPIKiAn@google.com>
References: <20260919213650.3316812-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919213650.3316812-1-benquike@gmail.com>

On Sat, Sep 19, 2026 at 09:36:49PM +0000, Hui Peng wrote:
> In `binder_thread_read()`, `binder_apply_fd_fixups()` installs
> translated file descriptors into `current->files` via `fd_install()`
> BEFORE `put_user()` and `copy_to_user()` copy the `BR_TRANSACTION` /
> `BR_REPLY` command and `binder_transaction_data` payload to userspace.
> 
> If `put_user()` or `copy_to_user()` returns `-EFAULT`:
> 
> 1. Any file descriptors in `t->fd_fixups` have already been installed
>    into the recipient process's file descriptor table and removed from
>    `t->fd_fixups`, even though the transaction failed and the sender
>    receives `BR_FAILED_REPLY`.
> 2. Unlike the `binder_apply_fd_fixups()` failure path immediately above
>    it, the `put_user()` and `copy_to_user()` failure paths call
>    `binder_cleanup_transaction()` without setting
>    `t->buffer->transaction = NULL` or calling `binder_free_buf(proc,
>    thread, buffer, true)`. Because `allow_user_free` is still `0`, the
>    `binder_buffer` and all translated `binder_node`/`binder_ref`
>    references inside it are permanently leaked, and for `TF_ONE_WAY`
>    transactions `node->has_async_transaction` remains `true` forever,
>    wedging all subsequent async transactions to that node.
> 
> Split `fd_install()` out of `binder_apply_fd_fixups()` into
> `binder_fd_fixups_install(t)` called only after `put_user()` and
> `copy_to_user()` succeed, and free `t->buffer` via
> `binder_free_buf(proc, thread, buffer, true)` on `-EFAULT`.
> 
> Fixes: 44d8047f1d87 ("binder: use standard functions to allocate fds")
> Assisted-by: LLM
> Signed-off-by: Hui Peng <benquike@gmail.com>
> 
> ---
>  drivers/android/binder.c | 30 +++++++++++++++++++++++-------
>  1 file changed, 23 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> index fb9ff072bd6c..efff59853752 100644
> --- a/drivers/android/binder.c
> +++ b/drivers/android/binder.c
> @@ -4705,7 +4705,7 @@ static int binder_wait_for_work(struct binder_thread *thread,
>  static int binder_apply_fd_fixups(struct binder_proc *proc,
>  				  struct binder_transaction *t)
>  {
> -	struct binder_txn_fd_fixup *fixup, *tmp;
> +	struct binder_txn_fd_fixup *fixup;
>  	int ret = 0;
>  
>  	list_for_each_entry(fixup, &t->fd_fixups, fixup_entry) {
> @@ -4730,19 +4730,25 @@ static int binder_apply_fd_fixups(struct binder_proc *proc,
>  			goto err;
>  		}
>  	}
> -	list_for_each_entry_safe(fixup, tmp, &t->fd_fixups, fixup_entry) {
> -		fd_install(fixup->target_fd, fixup->file);
> -		list_del(&fixup->fixup_entry);
> -		kfree(fixup);
> -	}
>  
> -	return ret;
> +	return 0;
>  
>  err:
>  	binder_free_txn_fixups(t);
>  	return ret;
>  }
>  
> +static void binder_fd_fixups_install(struct binder_transaction *t)
> +{
> +	struct binder_txn_fd_fixup *fixup, *tmp;
> +
> +	list_for_each_entry_safe(fixup, tmp, &t->fd_fixups, fixup_entry) {
> +		fd_install(fixup->target_fd, fixup->file);
> +		list_del(&fixup->fixup_entry);
> +		kfree(fixup);
> +	}
> +}
> +
>  static int binder_thread_read(struct binder_proc *proc,
>  			      struct binder_thread *thread,
>  			      binder_uintptr_t binder_buffer, size_t size,
> @@ -5121,26 +5127,36 @@ static int binder_thread_read(struct binder_proc *proc,
>  			trsize = sizeof(tr);
>  		}
>  		if (put_user(cmd, (uint32_t __user *)ptr)) {
> +			struct binder_buffer *buffer = t->buffer;
> +
>  			if (t_from)
>  				binder_thread_dec_tmpref(t_from);
>  
> +			buffer->transaction = NULL;
>  			binder_cleanup_transaction(t, "put_user failed",
>  						   BR_FAILED_REPLY);
> +			binder_free_buf(proc, thread, buffer, true);
>  
>  			return -EFAULT;
>  		}
>  		ptr += sizeof(uint32_t);
>  		if (copy_to_user(ptr, &tr, trsize)) {
> +			struct binder_buffer *buffer = t->buffer;
> +
>  			if (t_from)
>  				binder_thread_dec_tmpref(t_from);
>  
> +			buffer->transaction = NULL;
>  			binder_cleanup_transaction(t, "copy_to_user failed",
>  						   BR_FAILED_REPLY);
> +			binder_free_buf(proc, thread, buffer, true);
>  
>  			return -EFAULT;
>  		}
>  		ptr += trsize;
>  
> +		binder_fd_fixups_install(t);
> +
>  		trace_binder_transaction_received(t);
>  		binder_stat_br(proc, thread, cmd);
>  		binder_debug(BINDER_DEBUG_TRANSACTION,
> -- 
> 2.55.0.1082.g2b9226bbc0-goog
> 

This seems correct. Although I assume you'll be sending a new patchset
addressing Greg's feedback right? e.g.

https://lore.kernel.org/all/2026092022-wad-vertigo-3361@gregkh/
