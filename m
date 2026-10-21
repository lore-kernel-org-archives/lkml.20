Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792568172;
	b=WQvOqHgtNgP0Jxo+4BKAY6bs0ZsiCoLFWtWUZwh4SCBHEYNPvBKG8tm/PW8fKasUUVsc
	 788OkmBdzcFoVG37eSaTOUMcVU8742hAcPq5fiMZNs3cwQmfMgLKFjyymF3YuaDHWdgFI
	 8GLOSwKMMqxYVNCvTzkebcpY644nF+icgTtmMQa8nlKoLKrMv0tzUMZw4nYgBrUYylGYa
	 VcOhQntLwi+DzZXhvC5YX+YF9sTmGMHedJVr+ihgqHgoJYfNFMfIBzQC5KnB0ABYsVQ+f
	 RaXmGDjzH7JQXEZJszCFPtByXYKi07m56fflShsMLjeQfNSGtCf5DEhQO3LvX9AOWvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792568172;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=tSH1r9M+8L4bHYKhri3oj4xzwG7x+h1dMG66BLEyGEI=;
	b=4w9zR09PRGaR1y+7kVZUC+opuoiRFkryZtBQl/wxQ+IfFeg9G8edSJQewMczHr2cN+I9
	 x7jeG0XFO0AF3KIewQk7sDm2mXHXrmscdCaAQO+cbBpzw1JonabtVZllKUWHAl4KEReLS
	 8KOSi10xNJLFB8l6QDXqP/NePVqWeE6cVyJ5vgY6uFXaY5MwgkoRLv6GA+kIYCV8sTbHq
	 UrcMlPXkXmy0rUcQNR70pHRm44EaerNs6qmgzBbOLj3ak2m1KvHEOBO8SbFD2J8RsJe8B
	 MsYaZ/6ZAUj1LWUGfwvug2tmdZ1QRdXYYsoEYm8Rq6BEBHr55cNluGX5zCe6c1/zaBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a3NkqQYp;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47622606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:36:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47622606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a3NkqQYp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792568170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tSH1r9M+8L4bHYKhri3oj4xzwG7x+h1dMG66BLEyGEI=;
	b=a3NkqQYp7olTuNUWGA2I3qfdXZZcL8vuW/Yf7+Q7L8fjbGHUR5viE1hJ81sc6H678r2NVG
	otcraaX1kZXUaDOnB/P/nD5yvORT9F/wL9aUTbGF+wqM0Lt8KkFI5mSnw98m9dBHi7+x1B
	llg06i0KqvLNEgx4CSMwuGQOiTZky1k=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-692-JzWEAI2jOYWe2galHTihCg-1; Wed,
 21 Oct 2026 07:36:08 +0000
X-MC-Unique: JzWEAI2jOYWe2galHTihCg-1
X-Mimecast-MFC-AGG-ID: JzWEAI2jOYWe2galHTihCg_1792568166
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6D131195604D;
	Wed, 21 Oct 2026 07:36:06 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 66E7146C;
	Wed, 21 Oct 2026 07:36:04 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Wed, 21 Oct 2026 09:36:06 +0200 (CEST)
Date: Wed, 21 Oct 2026 09:36:03 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: fujo <hooyan2024@gmail.com>
Cc: linux-fsdevel@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] selftests/pidfd: wait for POLLHUP before reading exit
 info
Message-ID: <athrY3NE41WWDj8k@redhat.com>
References: <20261017054356.7874-1-hooyan2024@gmail.com>
 <179234213014.649.6368924662349703640@gmail.com>
 <atc59R5-oBnyOIb8@redhat.com>
 <179252551833.59967.12617794775210688694@gmail.com>
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
In-Reply-To: <179252551833.59967.12617794775210688694@gmail.com>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

On 10/20, fujo wrote:
>
> The CLONE_AUTOREAP tests poll for POLLIN and then immediately call
> PIDFD_GET_INFO with PIDFD_INFO_EXIT.  PIDFD_INFO_EXIT is only published
> from release_task() -> pidfs_exit(), which runs after the pidfd already
> reported POLLIN for the exited task.  A poller woken by
> do_notify_pidfd() can therefore read a mask without PIDFD_INFO_EXIT;
> under KASAN the autoreap_multithreaded case fails this way.
>
> POLLHUP is returned once the task linkage has been removed from
> struct pid, which happens after pidfs_exit() has published the exit
> information.  Wait for POLLHUP and check it in revents.
>
> The zero-timeout liveness check in autokill_pidfd_open_no_effect keeps
> POLLIN; it verifies that the child has not exited yet.
>
> With this change all tests pass ten consecutive runs on an unpatched
> kernel.
>
> Signed-off-by: fujo <hooyan2024@gmail.com>
> ---
>  .../selftests/pidfd/pidfd_autoreap_test.c     | 34 +++++++++----------
>  1 file changed, 17 insertions(+), 17 deletions(-)

Reviewed-by: Oleg Nesterov <oleg@redhat.com>

