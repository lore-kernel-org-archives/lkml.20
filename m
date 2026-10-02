Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C16494820
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 11:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790942357; cv=none; b=i1e9m/EgvMgJfVqHD38JxJFPgiqavjxhczRD4ZDjZkGz/VUFAFQtEa3/dOqkuEePyLEwyG4N90LvIugzkZ9XMIM31KiAnUtyIlgHNIBHUIqBZ+HDfIBdtRlnguSVvwi6/Q1CLJkmqsnBAvGhmETTF7hAFxoz8nUW96URYfBQErQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790942357; c=relaxed/simple;
	bh=h6MgIV5uFF71vfuEX15zHF5eUzWPt5ZV0RfVUrka374=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVmLsAaVqKTy3ZIMg4Jwa8BLuYK9QIsdG09d6grOOJhSTMw78vAp5CtTTWsRh/IiVOcVx5y9aWOF/Nyt3UaDZyyWXSfQb4SvDqje2T9hAPaDfrusJU8JydYegSTDlD8stInvwcZ2or4wqS3OlQ5krdl/5MuwiRaSCIAMYrJJqBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gC1arjmH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gC1arjmH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790942354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1pDAAGucGbD7dq9uU5/BnPZ475OniWWegBsCwJxkyqo=;
	b=gC1arjmH5WpDe+uvCom4DLKfRB3CDe/lNBfwZ/hS4YQstewknKY9FpV2Z0tFT6YIFLftuN
	xEhcBxtxs+XLUosrz0ioWGLeLi09bHOGz4nUWvZb6L901mPwrPtz6eSUA+2U191GhgHcq4
	1wYWDoGOJv5qPLzro3EIi64QFEGueek=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-668-tRpH1CW2M-mxDRa8HS7v6w-1; Fri,
 02 Oct 2026 07:59:11 -0400
X-MC-Unique: tRpH1CW2M-mxDRa8HS7v6w-1
X-Mimecast-MFC-AGG-ID: tRpH1CW2M-mxDRa8HS7v6w_1790942350
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BE2931800366;
	Fri,  2 Oct 2026 11:59:09 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 96534214;
	Fri,  2 Oct 2026 11:59:07 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Fri,  2 Oct 2026 13:59:09 +0200 (CEST)
Date: Fri, 2 Oct 2026 13:59:06 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Babanpreet Singh <bbnpreetsingh@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	syzbot+c382ee653fd70f5cf1bb@syzkaller.appspotmail.com
Subject: Re: [PATCH] pid: use READ_ONCE() in pid_alive()
Message-ID: <ar-cijUnCr1L8urs@redhat.com>
References: <20261002012141.7-1-bbnpreetsingh@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002012141.7-1-bbnpreetsingh@gmail.com>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

On 10/02, Babanpreet Singh wrote:
>
> --- a/include/linux/pid.h
> +++ b/include/linux/pid.h
> @@ -264,7 +264,7 @@ static inline pid_t task_tgid_nr(struct task_struct *tsk)
>   */
>  static inline int pid_alive(const struct task_struct *p)
>  {
> -	return p->thread_pid != NULL;
> +	return READ_ONCE(p->thread_pid) != NULL;
>  }
>
>  static inline pid_t task_pgrp_nr_ns(struct task_struct *tsk, struct pid_namespace *ns)
> diff --git a/kernel/pid.c b/kernel/pid.c
> index 95b8ccfa82690..adf7216067684 100644
> --- a/kernel/pid.c
> +++ b/kernel/pid.c
> @@ -411,7 +411,7 @@ static void __change_pid(struct pid **pids, struct task_struct *task,
>  	pid = *pid_ptr;
>
>  	hlist_del_rcu(&task->pid_links[type]);
> -	*pid_ptr = new;
> +	WRITE_ONCE(*pid_ptr, new);

Acked-by: Oleg Nesterov <oleg@redhat.com>

