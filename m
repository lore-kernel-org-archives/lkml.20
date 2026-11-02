Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619090;
	b=wPQNkZ9iUPv1/CzzTJLIA9rx8327s1Fwo3j/DbfrGxh2JbkcCjjX9L7RWs/05+6Ly+kN
	 eMxHxYR9vLINv7Qv30ujKdhfkPgBXbUIYixFmGQMk7bBnla8awjvImTqS8DuQ8ERl+CVm
	 GVCE2fOESFhAw8lpDLY3b3N+3AQUPsYmq/Bjfa6y3VodvEGI+R47XkYrN9Ys0rYLvmisK
	 maIVwiAinWo0Ve2ap+Imae/74uFtxh0Jh+bDa9jLpXcHOL8QUId7b6zQaTh/segLDogrb
	 kNxLfXHNUTFbRV1GhBqnAwfHRM6OOHaRfGiX/lCpXGxybL80+ztlZjv7mqDiW0mPGhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619090;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=EqxU/QbNkW2B2od1CDNaCFGS/nDhfFKYC9a4Gqos2ac=;
	b=5arhxsIV8g1LI2V0oH9ZtiBfKruy6HXgSX9gdfY+plmjzzbWoH7c8rlhHmM6xL1Js9wW
	 DsmyAFeAmLA4Ps3dYG9K4QhKmQYW2HQu/RuHPZeimq11tbu589AGVjq3nvKLUPfRs2KQF
	 fzgtCOCwZU6ygQczaINW93oG4iPsCOXoYr3wtITTZzA0RSSvWZGdSWz2VdUNL1SAG2GrO
	 e2smV5a9m0Q7F5nOpfsXiO21pl4tbhP8NewK+LUq3bkDJwRPgw9qz1Um9MnwhVyUjtWgq
	 qEt5OzwgQYGFQh8kk+TUIPcCME76Feq0807gaxA+cXkMNhVNwt1HjxdsmN3HzXbUeaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cnhigwiT;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E47606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:31:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0E47606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cnhigwiT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793619088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EqxU/QbNkW2B2od1CDNaCFGS/nDhfFKYC9a4Gqos2ac=;
	b=cnhigwiTI4cJSy4m1dLfs1LpoErErSW4olOzBzMn0F+OStoD/mtLJtsA/FDFpfD1uOI6h1
	i/nndLZP0HUVc5OOwIjqFd0BghYVSezltIeCdkpxh9Kg9cvZenpY9Aw73kXeFTKvKarMiX
	FWcSCcDE/iN0TcOhPp1ZUPyx8RbaE6s=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-117-LLUmnpSFN423PNFgxNbHGw-1; Mon,
 02 Nov 2026 06:31:24 -0500
X-MC-Unique: LLUmnpSFN423PNFgxNbHGw-1
X-Mimecast-MFC-AGG-ID: LLUmnpSFN423PNFgxNbHGw_1793619083
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B9A32195FCC4;
	Mon,  2 Nov 2026 11:31:22 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 499BD410;
	Mon,  2 Nov 2026 11:31:19 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Mon,  2 Nov 2026 12:31:22 +0100 (CET)
Date: Mon, 2 Nov 2026 12:31:18 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Zhao Gongyi <zhaogongyi@bytedance.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>, will@kernel.org,
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: ptrace: don't warn on missing siginfo in a
 group-stop
Message-ID: <auh0hj3NRzExmgYs@redhat.com>
References: <20261023110710.10145-1-zhaogongyi@bytedance.com>
 <at-czRUYRPRxi9dy@arm.com>
 <d8aced38-fb7a-4359-b3ab-c625faae5023@huawei.com>
 <8028d335-c304-49de-81fa-07fd446cf9d0@bytedance.com>
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
In-Reply-To: <8028d335-c304-49de-81fa-07fd446cf9d0@bytedance.com>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

On 11/02, Zhao Gongyi wrote:
>
> Hi Jinjie,
>
>
> On 11/2/26 3:54 PM, Jinjie Ruan wrote:
> >
> > I think maybe we can refer to ptrace_get_syscall_info_op()?
> >
>
> Thanks for the suggestion.
>
> I checked ptrace_get_syscall_info_op(). It is currently static to
> kernel/ptrace.c and identifies a syscall stop only when
> last_siginfo->si_code is SIGTRAP | 0x80.
>
> The arm64 path here also needs to handle a syscall-exit-stop when the
> tracer has not enabled PTRACE_O_TRACESYSGOOD. In that case, the tested

Yes, PTRACE_GET_SYSCALL_INFO/etc depends on PTRACE_O_TRACESYSGOOD
by design, this is even documented in man 2 ptrace.

> For this patch, I think
> the local check of last_siginfo, with bit 0x80 masked and ptrace_message
> checked for PTRACE_EVENTMSG_SYSCALL_EXIT, is the smaller and safer change.

Agreed.

Oleg.

