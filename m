Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794514919;
	b=j5PSbihnvxGFwAW5CH+7GDeDtkrzdrUOvxosDx6pj3VCw9t9XyNG0f4AjzymwqvopWXl
	 Lz6PEkreWsc8yWzQ+z3weXgjtEyoyLCfSr5VAoRL764QZgZo5MI+IFlkGDpnRTYXSaJQI
	 nwdat8QHcGF6sU3WVlkmRV5RsTC1mRJTV/ms0nsaenspnXiDg7O/+hHlXsZYYH/92d7Ra
	 A3LjE+kifH9rSSvskva8v+SxpVqYb6z5/nrrtKHQfVDpCUeV3tfaN6KWU/yYssLSTl8Il
	 bIEsIFdkcmc7jvkuVyOOw0UQNdCBhUmQYE6uxD4ZtplMQXHNaOrwCrfipZHgj99T7XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794514919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=HLVKQ5q/RC7N1G6VFkxAy6YbPfLl1hH8SPJjv+91rpU=;
	b=MZH8CIjMORow1624Qb4e102a4+A62OCM0pMRLbG5TYuLy2Nuz9iytrwgzIZu4ArH/SmW
	 7e0AuFIZ3XXI/Hv+K3ugxgxzcr2BzkV4D2HDN5iB3ukIuasPKXXKElQQ1lnV0aT7/YRRZ
	 pGNwqcUqbddVQSkutKbsoZ2xIewBA3APQOnl6nysUmSf8J4VySieauls7R9ZFDsThoO8F
	 PRMZKEktOj1m6OAEKBRsp4ZaD6GpazBWQedmZ1TtT+YY6ND1wRNiPcT29hO52nS/naU/5
	 nnS4coDvdhHp7R1wNg0nq8rS4oBSKlmSuY1kJEGn5QopM4Pp7TOBeXSBanZF1dGNgIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QHu2CNIq;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437F8606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 437F8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QHu2CNIq
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e9f6a16afcso22285ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794514917; x=1795119717; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HLVKQ5q/RC7N1G6VFkxAy6YbPfLl1hH8SPJjv+91rpU=;
        b=QHu2CNIqST2nEYggP6ih40MK9P1PuDGS206mM+0PL3apX84hoqBNgLDi3Jw6FO3Rgd
         kZqoY35q0bwhxdt+Yw6Su0gbjn6teoE+Fc/8EjRRbF/qouzl/EZDYc/ipqz9ISA5R37k
         RpdfzbrE+4sEGl8p90XD754lUx7ohx3J5QCi7Y2OdU3F1qgyQe254//j2I/TxmYFYHjH
         8cOEDXY7yz2kJHa5+w9LBgkqpNj7Zg1evC3KHU/ntsm646f3SbPYO/tiol92QXWoNUm7
         Bkz1IEd6Zt66EjtSwvvsG+R1R0LjMgTzBSJFUKLtUr5LKR3fI0B1GdZYiuccBCivZZw0
         qltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794514917; x=1795119717;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HLVKQ5q/RC7N1G6VFkxAy6YbPfLl1hH8SPJjv+91rpU=;
        b=yGGkR66UK7Rj+yKa0a9XvrzQKfeSJCzTQjC7tqlUMxVbdevX161J4pUyWivcoUU2Ki
         NjtQJjLJwglAZMYLz/psnJGwOxzCgY3QZUJYtcXsXwZa5fq2gb02oruLR87ST4gpuEHj
         77eDyAjDg9PtYh8PTdlOURF4lJ1+id8Gh11ydAqYW9UI9buUzaZqmFpAy1iNto1cJEdR
         wZsUX+PAf1nM8AuuuKsHlFo530FFUtuKQ0Xw1YcqlAnmaEHzvEq0mqcAI1F1Gsvvkd3s
         AHk3Juvq4IQhQT31EVVWcYU7d7S+nHoWNnZ2kR3q0JG+y48NUz+DfTPXtuA3W1X4mRdq
         kT1g==
X-Forwarded-Encrypted: i=1; AL+hErFkxYG3zkNid/z8s8EEQKs4sSczu5EHM3tD6eqU64Mzc+6zio2NQYZccC8OGKPMicMzOJCOYCwgro6NnSM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IVXDA6gXzqiDVV1R5Ej403JOexx3FZiWo9bgDRLbGteF6UOX7
	5O0G1wc7Tl40I8IEYKhUR1fSX7IX2iEO/9r7904iGMoSaEcg86qylN1KfoF7xEL0Qw==
X-Gm-Gg: AYBFou3FwTiLTlN9sBR4+T+WMRUmG6I5wj/4v5tg4ZpUnQ9qemDX3m8QIXWhzr8LXFO
	dsYmwJiKfHBtkfESNUaycWQ2nGD9kNDR9JTTDzhOki2IQCcDjHip2AN10qReAx2/NtYL2omLKPl
	w3LptS0YE4W4bU7dXRH798ds7akNcehEzStdfG8ZfPw7oT5DzG5bhdYMgdk50BlS0RlwSf2Dusu
	4zxiznjl5sJIlS4Pks8X3J0jR80CnBlCXmJShAhgkGYpaOYOkbrQlkV2er58QZAmyd3KWTxA44b
	crlMYLoZCixx3uzlMgeys8FsmrvjCy5/4Eq7DBmpsbcb8y0zc+oD16/Lo+h1unwkyhz7yE/5msA
	RMQT79VfmQ8gxprlK52i1KTrGJtwDNkcLKK01/in7cef1TXhhbddlbSVHkksw0LkjZSrlIbBAes
	twRqb4+tNBEy7qNKfCj+S/Zy77rp3bhQL8S8KQ83TNmE2jjBWN6ujMAL+I/K7ZIBgfXln2bANbT
	tQm7rITTzzQR1XnixT9iGHeJBTSdHcd+XRMdesoqQyCxbcqe3RUWgCfFN3YRy4S6InyTA+VD35L
	Edb/wwQ2H1qbFxcigFes4u7JgCmDnajE16Dl4ti2IvmAjhJeD5tyUexDuTOn0LMbDFpNApC3Ofl
	i+ngLqlasrpWC33kNOyzOd+5IPKloHJJ8fHBjZhynInGm3xrKiHTvp1PbORBOerXzOa6ByaAlB6
	xu7ePjVWtSxjJft8aZ84dTvpT/KUbrC6PE9Xc0rMVf7XnjM9lejOpclspLrBtSpbK5SjsY
X-Received: by 2002:a17:903:2f91:b0:2d5:db38:8010 with SMTP id d9443c01a7336-2edf6d2417cmr6462905ad.15.1794514916908;
        Thu, 12 Nov 2026 12:21:56 -0800 (PST)
Received: from google.com (130.155.125.34.bc.googleusercontent.com. [34.125.155.130])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc1889960sm227016a12.15.2026.11.12.12.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 12:21:55 -0800 (PST)
Date: Thu, 12 Nov 2026 20:21:51 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Chris Wiseman <chriswiseman@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3 1/2] rust_binder: reject sync transaction with pending
 sync work
Message-ID: <avYf351-Z3Q2Cd9-@google.com>
References: <18e70d7c82c722e3.3137322e32332e3235332e313736.191fb9.0000sendgmr@google.com>
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
In-Reply-To: <18e70d7c82c722e3.3137322e32332e3235332e313736.191fb9.0000sendgmr@google.com>

On Wed, Nov 11, 2026 at 05:23:24PM +0000, Chris Wiseman wrote:
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
> synchronous transactions with EINVAL in Thread::top_of_transaction_stack
> when inner.work_list contains any item where
> DeliverToRead::should_sync_wakeup() is true. Checking
> should_sync_wakeup() in top_of_transaction_stack() fails fast before
> Transaction::new() allocates the target buffer or translates flat
> binder objects, and ignores non-transaction work items in
> inner.work_list.
> 
> Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> Fixes: 8eb05e8e47f1 ("rust_binder: add TF_DEFER_COMPLETE flag for avoiding userspace roundtrip")
> Cc: stable@vger.kernel.org
> Reviewed-by: Carlos Llamas <cmllamas@google.com>
> Signed-off-by: Chris Wiseman <chriswiseman@google.com>
> ---

Aside from the "patch threading" issue, this LGTM. Thanks!

Acked-by: Carlos Llamas <cmllamas@google.com>
