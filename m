Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837835;
	b=iEb42Vgbdi7RKRzfKl7MgX8g8O2av97rQo1otTe9/tcyDau3tefX20Iul9mRjm+XWg4F
	 N8Erw6UmApn5egI7CX9nm8etOq0S1ot5apNRAj4n4FpgBRgjM7b7/YJPLtOxeq3VruOYM
	 Rs6rhN/oACiHtOfjqEkIabrNp1BUFu35YttX6npLecELCWOZiCL+WHPXWZFh8ZUN5+AQ7
	 p1czFgzYwxJFlz+plo81Nq80ncETF3LQcHnA9w3rVCfCZlEEFUIYwcfgSPn8MbS09+VKH
	 agozT9hpkYt5oaOqn0NcxB0gr2lxD9Gk79WHJgLPqRBNkYMPsQlDpe0GgAO4bNOEY7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837835;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=KejH6EaczGR8Mx3WaNu+8KgTKth9EGIDXtNg5zc9zZM=;
	b=juYSvKv7iQdPBxmAb99G5NfNPvtmP8CcyzrywQ1vqO2RGpXsyw8HnJaoQ6IbVBmNYmvA
	 Q1573OtkbG0GDR2mcd59Gahnehtq9lgWNSvLumdTxJ/I9OCQKBtVM3J4Pn9Kwadt2SDEe
	 lPj2C3GHJKdAJucfrKMNfflMUEeeZtDu4PxuVaM6wLOS8mjFUDkTxnm7e/4J9kSiXWf1k
	 5YVaZJZuVhMeADiIeOs5bKH5ObM2p8knx/ufpt6Dn0J5DfnS/akNZQKli1nXNSZY5JXqP
	 uA2bnrKp1rlO89yo4enT1QRjZAd82ylU0IJ9Kh4mrudUmVHz3jNoewroWHlfwwkngRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MM6a+iam;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5933F606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:03:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5933F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MM6a+iam
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794837833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KejH6EaczGR8Mx3WaNu+8KgTKth9EGIDXtNg5zc9zZM=;
	b=MM6a+iamF7xckPQ5fDrskuJmOi1jgOP/1RoQ2LMotPABJXzZRXvxeRX/SYhRXki1wUPx7O
	4IxsoSBYoWhO9Snz+0UE8j98L8me0BKzR41VNcA9A6SQua4LvZ3knJT+L8VU/Xys6ZETcw
	wRah3KWhNtD2ph+33bWzc1HQBFnneUw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-438-fW6yAE7vOKCgn04yoT1flg-1; Mon,
 16 Nov 2026 09:03:48 -0500
X-MC-Unique: fW6yAE7vOKCgn04yoT1flg-1
X-Mimecast-MFC-AGG-ID: fW6yAE7vOKCgn04yoT1flg_1794837826
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DE040195D032;
	Mon, 16 Nov 2026 14:03:45 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 73F4D1956042;
	Mon, 16 Nov 2026 14:03:42 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Mon, 16 Nov 2026 15:03:45 +0100 (CET)
Date: Mon, 16 Nov 2026 15:03:41 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Renzo Davoli <renzo@cs.unibo.it>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	"Dmitry V . Levin" <ldv@strace.io>,
	Alexey Gladkov <legion@kernel.org>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Bradley Morgan <bradley.morgan@linux.dev>,
	Shuah Khan <shuah@kernel.org>, strace-devel@lists.strace.io,
	linux-api@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 1/2] ptrace: reject out of range error values in
 PTRACE_SET_SYSCALL_INFO
Message-ID: <avsNPc_E3W0K_uiL@redhat.com>
References: <20261116134050.505355-1-renzo@cs.unibo.it>
 <20261116134050.505355-2-renzo@cs.unibo.it>
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
In-Reply-To: <20261116134050.505355-2-renzo@cs.unibo.it>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 11/16, Renzo Davoli wrote:
>
> --- a/kernel/ptrace.c
> +++ b/kernel/ptrace.c
> @@ -1111,6 +1111,10 @@ ptrace_set_syscall_info_exit(struct task_struct *child, struct pt_regs *regs,
>  	if (rval != info->exit.rval)
>  		return -ERANGE;
>
> +	/* An error must be a negative errno value. */
> +	if (info->exit.is_error && !IS_ERR_VALUE(rval))
> +		return -ERANGE;

Reviewed-by: Oleg Nesterov <oleg@redhat.com>


(I think you can even drop the comment, IS_ERR_VALUE() is self-explanatory)

