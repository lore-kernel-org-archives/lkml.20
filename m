Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794414155;
	b=vEKji/6NI/UknE5ehcWIGPeobxeA0kioGQvqvphIq/scOwGU7e7j6rrZau9iuOIkv9da
	 lQ7idiYpwcfYGFf6sAGLVvY/SA2znO4nWkAjirT6YqXw3/geZA+ToZOW09q3qLWpqLSze
	 uJ4dov9CQqRM+62M1emX4bnRkJBwapYiJpeoJ/jy4fdLRXjXyfK9dCIs/G84FUdhegoeg
	 WU55B9n1kcCrS84qrJQaoJrtuUw5yR4QcuQhjUZtuG97ScCCsQIZyShENbmVhB9CANW8r
	 Y1Qg2uAhL0BpojFFkIHBlpDWhtYgfk8t+bzPBDfAgx/clG666lvS0qF0Vib41yq/NRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794414155;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=nv6HzmQJ6ffBOeBC0ENaz/z3V2SP4tEu9Ud+hByKmro=;
	b=IVtgtVse+dgfBgUhY/9DVpUEf0OlwNI9cED3vNigiHWhcoc8B18lyE0qE6A3E6xi4huw
	 Id+hg8yk6trCeDh9Ml3OkdeHqUPiSYlHNjdhCdNcO2FkhGP8LG2QsslpvZPA3Cauc4RPG
	 SqE3DhR/ExlPZ1i3nDvvuZjiycSGIYJki8rEx+WpUNXyagfcpfOYzTIGdqcXrWOeBfIfP
	 IpI7M5SshdYg190cZV+kRG/q21S2V6XRwNvyb7rwR/p1AcFJ8pf6+ZqKqQs1EQpVBcVxd
	 y+G7CxfN9WkYtztQZlAv4Kn12dKtB85xQOhyR3eU1J/rej/vGsBMfO7wsFdO+CUPOFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ik2DNhn4;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BB6606A88A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:22:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19BB6606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ik2DNhn4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794414154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nv6HzmQJ6ffBOeBC0ENaz/z3V2SP4tEu9Ud+hByKmro=;
	b=ik2DNhn4jAaRKyyB0KtdXyCqryirSD6ROlfZIodv9+MVapkKcoHP4HWKbOIbdY70l3+RZl
	YyHC9dsVyHlDjjlV2jUZprrev67xQ7+U+moe/5hiE/7bKCflV/byeY+9IgN/C0WlCuOkU5
	jntzjEuowiLGzmHURqwYXcvzhh+Q5fU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-82-tlKkUhGdN9SfGZz4Z9S6Qw-1; Wed,
 11 Nov 2026 11:22:31 -0500
X-MC-Unique: tlKkUhGdN9SfGZz4Z9S6Qw-1
X-Mimecast-MFC-AGG-ID: tlKkUhGdN9SfGZz4Z9S6Qw_1794414150
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D5BBF1977699;
	Wed, 11 Nov 2026 16:22:29 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 73D161800546;
	Wed, 11 Nov 2026 16:22:27 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Wed, 11 Nov 2026 17:22:29 +0100 (CET)
Date: Wed, 11 Nov 2026 17:22:26 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: brauner@kernel.org, linux-kernel@vger.kernel.org,
	syzbot+0f4d5234b6cb5e479e5d@syzkaller.appspotmail.com
Subject: Re: [PATCH] signal: Preserve the ptrace stop code for SIGCHLD
 notification
Message-ID: <avSWQsTI1KZaHFIr@redhat.com>
References: <20261111084310.81013-1-zhujun2@cmss.chinamobile.com>
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
In-Reply-To: <20261111084310.81013-1-zhujun2@cmss.chinamobile.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 11/11, Zhu Jun wrote:
>
> After ptrace_stop() drops siglock, the tracer can consume the stop with
> waitpid() and clear the tracee's exit_code. do_notify_parent_cldstop()
> then rereads that field without siglock and can report CLD_TRAPPED with
> a zero si_status instead of the stop signal.
>
> Pass the stop code saved in ptrace_stop() to the notification helper.
> The other notification reasons continue to obtain their status from
> the existing group-stop and continuation state.

But how the "correct" .si_status can actually help debugger if it has
already consumed tsk->exit_code? Why do we want this change?

> Fixes: 1da177e4c3f41 ("Linux-2.6.12-rc2")

Yes, this logic is very old. And unlikely useful.

I don't think userspace actually uses the siginfo which comes with SIGCHLD.
If nothing else, SIGCHLD doesn't queue, so si_code/si_status is not necessary
uptodate even if parent/debugger has a single child/tracee.

>  static void do_notify_parent_cldstop(struct task_struct *tsk,
> -				     bool for_ptracer, int why)
> +				     bool for_ptracer, int why, int exit_code)
>  {
>  	struct kernel_siginfo info;
>  	unsigned long flags;
> @@ -2394,7 +2395,7 @@ static void do_notify_parent_cldstop(struct task_struct *tsk,
>   		info.si_status = tsk->signal->group_exit_code & 0x7f;
>   		break;
>   	case CLD_TRAPPED:
> - 		info.si_status = tsk->exit_code & 0x7f;
> +		info.si_status = exit_code & 0x7f;

Note that tsk->signal->group_exit_code can be cleared by waitpid() the same way,
even if tsk is not traced, so this change is incomplete.

Again, I personally think we don't care.. Perhaps something like this patch makes
sense just to make this code look more correct, but then please consider the
CLD_STOPPED case as well.

Oleg.

