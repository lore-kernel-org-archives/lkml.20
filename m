Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4BD4A2065
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819587; cv=none; b=hlZWTczQ14uao9KmY8nEl8Js+DD4YLtyDfW5ZJUIbBie/+y4r2qFSzxEULctS52EZ7cnWOdBa+PB0IFeCUOJFhI4qETCmQedJdd9Pm6HsR7JhATpfiWIO+WyqY5qutZCkWyE8402dkM+gZqRu+tt/s7wi3BzvwaMeTsVjD3boaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819587; c=relaxed/simple;
	bh=2l2DLVa1PeXlyHJE1c7nWN3mmaGpOwkWkxtVnG11bXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KhWUjgk9LPwLzHPyfySxwZzLOTyKV4bEGxNdT7/a9MzWdP94wrxiPUNp5cW7H9eSd90raSqCtxWfDr4cqkLnWg9n+Xtfks6RNeYcZbYwM/+frLfOjUXD6EkpyDSAn/cFU1VL1TCQHGKwsXP8leI1mN9SPZrC4Jotwnpf3QX9eeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cEiqM03s; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cEiqM03s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791819585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yypxGPlx55QH0pYdP+VfNSAu253l74EUWhcjDK+UzYs=;
	b=cEiqM03sKcZZ7YENDx6/+DlGG3Rq3WBGwp0G0/hoObP5iZ2E33uozy+uF4rIQeU5g8AD2n
	U+RDn2/fDTDPNdvTKCBmzpg4JBvzpfO18MuwpG9zafLqiTyG7idxpbtse2tfPnKmwl9rQD
	3thZvVf+Xf+wym4tik/VktoWQCAAoPU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-686-PQrBu5JWOXG9XuxiLztMdQ-1; Mon,
 12 Oct 2026 15:39:40 +0000
X-MC-Unique: PQrBu5JWOXG9XuxiLztMdQ-1
X-Mimecast-MFC-AGG-ID: PQrBu5JWOXG9XuxiLztMdQ_1791819579
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7244118021F6;
	Mon, 12 Oct 2026 15:39:38 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 93A3D1956053;
	Mon, 12 Oct 2026 15:39:35 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Mon, 12 Oct 2026 17:39:38 +0200 (CEST)
Date: Mon, 12 Oct 2026 17:39:34 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Mingyu Wang <25181214217@stu.xidian.edu.cn>
Cc: w15303746062@163.com, David Laight <david.laight.linux@gmail.com>,
	jlayton@kernel.org, chuck.lever@oracle.com, viro@zeniv.linux.org.uk,
	brauner@kernel.org, alex.aring@gmail.com, jack@suse.cz,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] fs/fcntl: fix SOFTIRQ-unsafe lock order in fasync
 signaling
Message-ID: <asz_NnX9_KaJdaf_@redhat.com>
References: <d15a25fe784b5d4449c7ce4e56f1428d7ff28885.camel@kernel.org>
 <20260523135210.590928-1-w15303746062@163.com>
 <asI5Fn87_SoEd4G5@redhat.com>
 <asuxzwl4iWjjEjRD@redhat.com>
 <437297ff-1bb4-49a7-a979-abccdd1814f8@stu.xidian.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <437297ff-1bb4-49a7-a979-abccdd1814f8@stu.xidian.edu.cn>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Hi Mingyu,

On 10/12, Mingyu Wang wrote:
>
> In the original report, the task triggering the warning was in process
> context, through a TTY ioctl. Here are the relevant excerpts; omissions
> are marked with [...].

Thanks... so according to lockdep we have the

	&dev->event_lock --> &f_owner->lock --> tasklist_lock

chain. At first glance this suggests that kill_fasync()->send_sigio() can
be called under input_dev->event_lock. But I know nothing about drivers/input,
so I can't find who does this...

And,

> input_inject_event+0xa4/0x3b0 drivers/input/input.c:419
...
> kbd_bh+0x23c/0x310 drivers/tty/vt/keyboard.c:1244
> tasklet_action_common+0x25c/0x3d0 kernel/softirq.c:925

means that ->event_lock can be acquired in softirq context.

That is all I can understand right now. Can you can send the full full
report without omissions? Not that I think this will help, at least to me ;)

Perhaps something like:

read_lock(tasklist)	lock(event_lock)
						write_lock(tasklist)
<Interrupt>
lock(event_lock)	// send_sigio()
			// ...
			read_lock(tasklist)
			
Oleg.

