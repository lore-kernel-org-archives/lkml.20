Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794164377;
	b=4wmn/1NlTqqZS+nPIQGCj/XfiioJ+xKTzQFvf5FV/14yUdPQQFI8BkOS8cES9wQONL9Z
	 W0dtSvozEODEdOkyFZ3bKQAm0RKtsl3C9CGXTLnMYUTZAFhgh+qkHRiOYeQeaEXwir8zn
	 VKbd+rFsSHClvlPTPOXsm7rev7RotNLp1Aw/zPx2JYnSxxvI/hirV+hBZPP1PsGA7p/gb
	 dz59XHaNqhqkapj4sFgT6hxidDPBoPhrV29amBA5Da0jGNiO6PH9LJpMQpWz9ZZ+byVZo
	 vqp04JSDwyVqDuGb7bQa6mo7ifdC/5acPvGwo7VC3oPMNxoPGEOlYkz+cvYudShxR0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794164377;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=E3IORXjrOnxGaCWVGBDQ5fUa9toRWTCY+ybXEtyL0Pk=;
	b=wtMF7qXJeXTbIKHYSu1a6tgVOmj7ObdaDtAo7YAMGPLjBjairA4KX5gDO1WxaJT7cJBx
	 1fm91+YA1epnmZTBVb0yVqgsHac+YH+s3B0ys6zcMOIucJ/oCOWQONAnd64boK/G3/bO1
	 xzalJDYStUwN4wYvLg3oDIAUZLFqcnVt4OGwBDu39HPTIMJwGPD9I9kHh0i7+vmO0VbN/
	 2p1PpaHoQCgPGipKP6P/a2mkE0zDu3OJjUiEp/d9ogwY98bQ603oQc1B9mdWwHH5oNFEs
	 vpw++3oC2+/v/NdsSBXSLKbIttLu1EYMQm4Y/JBO3ompe5/AWg0wA4p8wtrD1cF+T4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="BuTK7F/a";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F25C606A326
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 18:59:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F25C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BuTK7F/a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794164376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E3IORXjrOnxGaCWVGBDQ5fUa9toRWTCY+ybXEtyL0Pk=;
	b=BuTK7F/aijFRDZCz+xaOMQrB0z38xD3gfdx9jgMBROyYGHkzHJBY+qQq7T5GcKoHeDBXBn
	23JC6qjwFB+TQogyIcfUBz8i10VfEMUy2JhyMp7d6pCyQDxOP2Pnu8bgMAnj5F1KWZV18t
	VniKz4c3JE2XiIlHoUZz3XneTG4lke8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-52-chj8T669OIKhpmW1HkkHPw-1; Sun,
 08 Nov 2026 13:59:32 -0500
X-MC-Unique: chj8T669OIKhpmW1HkkHPw-1
X-Mimecast-MFC-AGG-ID: chj8T669OIKhpmW1HkkHPw_1794164370
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BD24D1956094;
	Sun,  8 Nov 2026 18:59:29 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id D7BB31956041;
	Sun,  8 Nov 2026 18:59:26 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Sun,  8 Nov 2026 19:59:29 +0100 (CET)
Date: Sun, 8 Nov 2026 19:59:25 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Zhao Gongyi <zhaogongyi@bytedance.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
	ruanjinjie@huawei.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: ptrace: don't warn on missing siginfo in a
 group-stop
Message-ID: <avDGjYYR6Tj1sVgP@redhat.com>
References: <20261105113051.97810-1-zhaogongyi@bytedance.com>
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
In-Reply-To: <20261105113051.97810-1-zhaogongyi@bytedance.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 11/05, Zhao Gongyi wrote:
>
> --- a/arch/arm64/kernel/ptrace.c
> +++ b/arch/arm64/kernel/ptrace.c
> @@ -573,8 +573,8 @@ static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
>  	if (regs->syscallno == NO_SYSCALL)
>  		return;
>
> -	/* We should only be called when target is in a ptrace stop */
> -	if (WARN_ON_ONCE(!info))
> +	/* Non-seized group-stops do not provide siginfo (see do_jobctl_trap()). */
> +	if (!info)
>  		return;

First of all, FWIW

Acked-by: Oleg Nesterov <oleg@redhat.com>

This change is "obviously good" and doesn't change the current behaviour.



----------------------------------------------------------------------------
But can't resist... The old comment was obviously wrong, the new one doesn't
look clear to me. It correctly explains why info can be NULL, but not why we
should not update orig_x0 in this case. May be it should just say that exit-stop
always comes with info != NULL?

Nevermind, I leave this to you, Catalin, and Will.

And I see another email from Will, I'll try to reply tomorrow.

In any case, let me repeat, the patch looks fine to me.

Oleg.

