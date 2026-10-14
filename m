Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E44638239A
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969718; cv=none; b=e6bE8mTSOD/Nt39S1OUD1SAPVr6at5y9uE0e4xWKekh2H9JYYmjNZ3/P+qQdMwEUXntP1xFmVS959VKRSPITQZiQ5dgZ9tYmG98xn/+yTW854ZmK9+ib8u1JmD03Ik9a14espxjh2vd9rnwq2TvypJFTmGmH4o/CiwxUWIM+NVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969718; c=relaxed/simple;
	bh=Zr56QpGyhFSV0lsKjyBraSoD3KqcQLW1A6q1M5i/ucs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j1aRqVmvEt+WVqCB//K6TGxlW2jkjmouZHLx5FeL7IjYakGh5q2TDQ5l9aaikQjYuK/EcFEgmSeXmSA15v16zBdC/dxCumVxiJpLchcrG3IaEenpaADPVQ9CLfhDZycm3tMM0YQpp00PG0HY4Kb1XGp2eYPe5fPlPsoyys+iCR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Uc1eTDtd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Uc1eTDtd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791969715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PuN2Pz09axpDCmN4eiB63h4W1zOCYS8wF6WgW3AxDWs=;
	b=Uc1eTDtdKlACrtLaXsNr6AQIbfXNh6xAiiL3gzsV1/tM/IcvEXCvYo/sAZNN7mM1de+ZHh
	TlW5ShUylod1ItAVPet2m22Ps6l7wliAM16fMuOPua1iZAssxl24XhObQb4S+IoLzPSm/t
	9Z6upS5Vf5M6qQkFr2C/ooQ5aCqUNmU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-425-GaxOQy18P8eTYjWfwnlNsw-1; Wed,
 14 Oct 2026 09:21:51 +0000
X-MC-Unique: GaxOQy18P8eTYjWfwnlNsw-1
X-Mimecast-MFC-AGG-ID: GaxOQy18P8eTYjWfwnlNsw_1791969710
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 25BE519560B9;
	Wed, 14 Oct 2026 09:21:50 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id AD7391800495;
	Wed, 14 Oct 2026 09:21:47 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Wed, 14 Oct 2026 11:21:49 +0200 (CEST)
Date: Wed, 14 Oct 2026 11:21:46 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: tglx@kernel.org, peterz@infradead.org, luto@kernel.org, kees@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] entry: Fix seccomp bypass after ptrace with TSYNC
Message-ID: <as9Jqi5BvSZWfxj8@redhat.com>
References: <20260713025712.416366-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713025712.416366-1-ruanjinjie@huawei.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 07/13, Jinjie Ruan wrote:
>
> Sashiko review pointed out the following issue.
>
> If a thread is stopped in syscall_trace_enter() for ptrace, another
> thread can install a seccomp filter with SECCOMP_FILTER_FLAG_TSYNC
> (e.g., via seccomp_attach_filter()). This will successfully set
> SYSCALL_WORK_SECCOMP on the stopped thread, but syscall_trace_enter()
> evaluates a cached 'work' variable sampled on entry. Consequently,
> the subsequent check for SYSCALL_WORK_SECCOMP misses the newly
> assigned flag, and the filter is silently bypassed.
>
> This race condition could allow an unprivileged process to execute
> a prohibited system call (e.g., execve) that the newly installed filter
> was intended to block, especially since the tracer might have modified
> the system call number during the ptrace stop.
>
> Fix this by re-reading the syscall_work flags after ptrace handling,
> so that any new SYSCALL_WORK_SECCOMP flag set by another thread via
> TSYNC during the ptrace stop is observed before the subsequent
> seccomp check.

I agree with this patch, but SECCOMP_FILTER_FLAG_TSYNC can also happen
after syscall_trace_enter() re-reads ->syscall_work ?

And this race is possible even without ptrace, SECCOMP_FILTER_FLAG_TSYNC
from another thread can happen after syscall_enter_from_user_mode_work()
reads ->syscall_work ?

I think we don't really care, but I don't understand the security concerns.
If debugger controls the process before it installs the seccomp filters, it
can simply nack sys_seccomp().

In short, does CVE-2026-89603 make real sense?

Oleg.

> --- a/include/linux/entry-common.h
> +++ b/include/linux/entry-common.h
> @@ -97,6 +97,9 @@ static __always_inline long syscall_trace_enter(struct pt_regs *regs, unsigned l
>  		if (!arch_ptrace_report_syscall_permit_entry(regs) ||
>  		    (work & SYSCALL_WORK_SYSCALL_EMU))
>  			return -1L;
> +
> +		/* ptrace might have changed work flags */
> +		work = READ_ONCE(current_thread_info()->syscall_work);
>  	}
>
>  	/* Do seccomp after ptrace, to catch any tracer changes. */
> --
> 2.34.1
>

