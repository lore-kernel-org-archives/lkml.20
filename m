Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56554BCAAA
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 15:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791212633; cv=none; b=KRgpdIGcvQ10Ziru9jQAIRyo8P3HQs7cs4qIm6P1Tit2QeaDftiTrCQS+W9NgP1k1UD84bjUeNIDgdlviH58UQuyIH/ykeT58td0auiUmZGgcXi3E/fRhcpXQPcDEer/QrfjCxsqNObjk71hy8GbzvD1p1yONxZrDeS97i4bNto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791212633; c=relaxed/simple;
	bh=DJJC7xo6Wqpm1FS5tIxgN3nfFtq7/YdKYKemkEGoDQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rB51a+13yn3/9GtweG3tTcLnGT8p5fSH3nwaHy3r4AxLmvuVHEwxnqztjFkP0bJvTjtW8yPFq/R0s3zkNW7RMsgAL3TKf4RUTa8rp07oqtYcGchwcbv2vp+XnWsRquEaAQO4Nk1zylILorsgPWAZk4E2Jfew6meGpaZbrIoHaZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U+fbtoY7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U+fbtoY7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791212630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DJJC7xo6Wqpm1FS5tIxgN3nfFtq7/YdKYKemkEGoDQI=;
	b=U+fbtoY7t5g2jdlAx6iWRF9gwYv/0ciZ/PB0O/OChoqhtxu01HfRl3wzlkOrrXE7I4I5dC
	QC/5WpbOt/dKLfNb6oFfc/YnsRiGqz1dS7E5Lifjg2HY3YxeZ/eUSw3aA9GroSTFPEcc3d
	TzpBRxmUDtE3Tg/3eYoHRKKiPwam3WU=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-483-o3Dv-ALiOU6jmzioPiUS5Q-1; Mon,
 05 Oct 2026 11:03:47 -0400
X-MC-Unique: o3Dv-ALiOU6jmzioPiUS5Q-1
X-Mimecast-MFC-AGG-ID: o3Dv-ALiOU6jmzioPiUS5Q_1791212626
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A68321801320;
	Mon,  5 Oct 2026 15:03:45 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 91C421944CC0;
	Mon,  5 Oct 2026 15:03:43 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Mon,  5 Oct 2026 17:03:45 +0200 (CEST)
Date: Mon, 5 Oct 2026 17:03:42 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Babanpreet Singh <bbnpreetsingh@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	syzbot+c382ee653fd70f5cf1bb@syzkaller.appspotmail.com
Subject: Re: [PATCH] pid: use READ_ONCE() in pid_alive()
Message-ID: <asO8TiCfByNjBHWK@redhat.com>
References: <20261002012141.7-1-bbnpreetsingh@gmail.com>
 <20261003182224.2171b574@pumpkin>
 <asIwpkNr9bF6gk6Q@redhat.com>
 <20261004125118.7de53b47@pumpkin>
 <asJRMhSXz5XhljNi@redhat.com>
 <20261004143108.4b851713@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004143108.4b851713@pumpkin>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 10/04, David Laight wrote:
>
> I was wondering if the (partial) rcu protection of these lists was worth
> the trouble.

At the top of my head, probably not... At least right now. We can improve
this, say we can change attach_pid() to use hlist_add_behind_rcu(). This way
the lockless do_each_pid() won't "obviously race" with fork(). But this won't
solve other problems.

> If the 'add code' all the readers and have to hold the lock then does that
> leave anything other than task exit doing an rcu-delete.
> I wouldn't have though acquiring the lock in the task exit code would
> be noticeable.

Still can't understand. The exiting task does take tasklist when it calls
detach_pid().

> > I don't think it can. Say, __kill_pgrp_info() is a "typical" user of
> > do_each_pid_task(). What can it do if it detects that get_nulls_value()
> > doesn't match after the main loop? The signal was already sent.
>
> It would have to check each entry to ensure it was on the correct list.
> (That probably doesn't need the 'nulls' variant.)
> The problem is that the rescan will do things twice.
> This is ok for a search, but probably not for sending a signal.

Yes, exactly.

Oleg.

