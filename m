Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792761865;
	b=f9aTlYBsZjqeO3JiQYZpjEGGXvxOblB+/SkyZ7HbS4cBWROSVEGMFymTCfWGWd6NbOf4
	 FPyi22TuPa5E2MoiHUPzqwVvO3lwX5UeW+fQ4o95xzRaAzb2pGvgrcl/7tpKNQnRJc2gx
	 vEy6qzTrI8EjOVFR312tdu5hhA4Z0G3hF62LV3MgC6qNhT46mWUV1UeS62lh/aee3Ixmp
	 1C1o1bY2VOQAE5dfolnbWWAR8SA+4hXO0hM/pG2VGluhePgyzevw1c6JTABRraf4I2Asp
	 Z0+/MhLT0KJFWXO5L6WW0YPqaPBipbox35Pi95jxvmAuRWPtukCIJpaMOPFOxd902nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792761865;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=9Nv2cVwW/OKu3NQl5AdnfBAI1iL/npttcokjjp7Sh3k=;
	b=5Sran2VWAqhcIuOzxAal2UwVhis9Pb9QelLr+eM1QeT8Enuiv9sID9PhN8kT0qXbqN2D
	 q0PJR4tPy/SSd3wEygnR0CpEATfF1QAA7m/QTdqQCAzdS+JWrLNqroTKJbjyCUWsSkZD9
	 1nZbrKr5RYtZ8A4jPiZWwz9Krb1u7Q4CmD/uEmABenhyIbEpiYBzDowcBD7LsRgJWFGx8
	 rMiikxZ3/bmrMvKCRCGiceAScFY41AUFvanCKWQcIzjwI18VF39v6Scb/o6f5PH6E/Ifu
	 PwSh3WP/kisuI3WAne7gBqr21pamTFSl4cKx0hdHxkJ3jNjkyx5LeY1THIDoo4jxxxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GXF0WGhU;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEA7606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFEA7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GXF0WGhU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792761864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9Nv2cVwW/OKu3NQl5AdnfBAI1iL/npttcokjjp7Sh3k=;
	b=GXF0WGhULgAphHcRKGch0nEG2KS7GkGdS5viJuSXkObppHnUVyh9W3P3KpLz81RUN8tX0z
	cv/qP1Qn8dbcSgEYINt6mZJSN5TKx+t/SHRGUXimhLhBnyC1iRg+ydPPoEr3Qk/r69KVBQ
	4DGL0tvpqP9Gvphx1EvPKdqPz7PFpl0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-497-6qAtnANiPbmUVI0GZIl8pw-1; Fri,
 23 Oct 2026 09:24:11 -0400
X-MC-Unique: 6qAtnANiPbmUVI0GZIl8pw-1
X-Mimecast-MFC-AGG-ID: 6qAtnANiPbmUVI0GZIl8pw_1792761849
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 20446195394D;
	Fri, 23 Oct 2026 13:24:08 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id BB84D195608C;
	Fri, 23 Oct 2026 13:24:05 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Fri, 23 Oct 2026 15:24:07 +0200 (CEST)
Date: Fri, 23 Oct 2026 15:24:04 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Zhao Gongyi <zhaogongyi@bytedance.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
	ruanjinjie@huawei.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: ptrace: don't warn on missing siginfo in a
 group-stop
Message-ID: <attf9KALBQyOGyco@redhat.com>
References: <20261023110710.10145-1-zhaogongyi@bytedance.com>
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
In-Reply-To: <20261023110710.10145-1-zhaogongyi@bytedance.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 10/23, Zhao Gongyi wrote:
>
> --- a/arch/arm64/kernel/ptrace.c
> +++ b/arch/arm64/kernel/ptrace.c
> @@ -573,10 +573,6 @@ static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
>  	if (regs->syscallno == NO_SYSCALL)
>  		return;
>
> -	/* We should only be called when target is in a ptrace stop */
> -	if (WARN_ON_ONCE(!info))
> -		return;
> -
>  	/*
>  	 * For compat tasks, orig_r0 is provided directly through GPR index
>  	 * 17.
> @@ -588,7 +584,7 @@ static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
>  	 * Don't update orig_x0 for a syscall-exit-stop, as x0 now contains the
>  	 * return value of the system call.
>  	 */
> -	if ((info->si_code & ~0x80) == SIGTRAP &&
> +	if (info && (info->si_code & ~0x80) == SIGTRAP &&
>  	    target->ptrace_message == PTRACE_EVENTMSG_SYSCALL_EXIT) {
>  		return;

LGTM, but I don't understand this arm-specific code.

And... Do we need to check target->last_siginfo at all?

ptrace_signal() -> ptrace_stop() path sets ->ptrace_message = 0.

In all other cases: if info != NULL, then .si_code == target->exit_code.
ptrace_event(event) users always use event != 0 and != 0x80.

So it seems that we can just do

	if ((target->exit_code & ~0x80) == SIGTRAP &&
	    target->ptrace_message == PTRACE_EVENTMSG_SYSCALL_EXIT)

?

I'll recheck... If I am right, perhaps it makes sense to simplify
ptrace_get_syscall_info_op().

Anyway, up to you.

Oleg.

