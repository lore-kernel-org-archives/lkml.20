Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626713C583A
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 19:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792351673; cv=none; b=jvBTWxiZ4Q6eK4rTNpDcv7Cfj7ZLdHIgItfFoTf5klOokq+/rFz+6XHFOSwfHuyOAa8u5/PzO93g/5uZicdjOfr+BXdSm7feH+8WhI08pe9pGt8BAM/79k4ylJ5l/+AWpJdOpbwW+CoUThdY7Vz/bedDVYQcmVLyynonVJVhYuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792351673; c=relaxed/simple;
	bh=SAzMxbNS4EwXS5RkVSho6HiwU0K67Z7Priv55NAes5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F9mtSmsLPFg9Ll2ptTkQuGszgZV+w9Y8YiUhTX+DjiCuO48NGtF7uZtxN958cuotJ/5tNrztSIWzJTrVBdJs8DjqcLUZaSuvR3Pf0/XoI+VwRqcHbtH/Y2oB0RNL4urM7tCVsug9nqTJwXWLQGmG8N5zHhOz9gPzvJLlKmAXQBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JgvXLxZn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JgvXLxZn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792351671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X5tPeYbL88LTw9knZAdzXx+IWSsv8JJVjSwkmt/STvQ=;
	b=JgvXLxZnYPLQp4YDbGzbX12oFGGXJTJra/qqSI3E5OAihc9PMQLQ4NG5zbHpZj6rijuB+F
	0nt/OQpI+qPQLdVjKGC7cZ9zCB6EnckM2Qvevg/igx+CiTaZE7VPLNn5a+FVrQ+5SqNNBU
	fvbsMfeTmUjYe0Sw8kAllKoL79CJIxw=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-531-eDeYx03vO-mjeUqe3Ejrjw-1; Sun,
 18 Oct 2026 19:27:47 +0000
X-MC-Unique: eDeYx03vO-mjeUqe3Ejrjw-1
X-Mimecast-MFC-AGG-ID: eDeYx03vO-mjeUqe3Ejrjw_1792351666
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5C3FD1800605;
	Sun, 18 Oct 2026 19:27:46 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 7056A1956087;
	Sun, 18 Oct 2026 19:27:44 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Sun, 18 Oct 2026 21:27:46 +0200 (CEST)
Date: Sun, 18 Oct 2026 21:27:43 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: fujo <hooyan2024@gmail.com>
Cc: linux-fsdevel@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests/pidfd: wait for POLLHUP before reading exit
 info
Message-ID: <atUdr2A9iJwl0Hbw@redhat.com>
References: <20261017054356.7874-1-hooyan2024@gmail.com>
 <179226499044.847.17334319321039510150@gmail.com>
 <atTy6LziL5fdGTkn@redhat.com>
 <179234213014.649.13402722495876323247@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179234213014.649.13402722495876323247@gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 10/18, fujo wrote:
>
> You are right, thanks.  That poll() is a liveness check, not an
> exit-info wait, so v3 keeps POLLIN there and only switches the polls
> that are followed by PIDFD_GET_INFO.

Great, I'll try to review V3 tomorrow.

> About the documentation: there is no in-tree KAPI file for this; the
> wording I referred to is the CLONE_AUTOREAP series description ("poll
> the child's exit via poll() and retrieve exit status via
> PIDFD_GET_INFO").  If you or Christian think a clarifying sentence
> belongs somewhere in the tree, I'm happy to send it, but I didn't want
> to guess where.

So it seems that (please correct me if I am wrong) you were confused by
some wording in a changelog or cover letter. If yes, too late to fix it.

But perhaps you can check (and possibly fix/improve) the man page(s) ?
Though, to be honest, I have no idea where all of this is documented...
But surely it must be documented somewhere, right ? ;)

Thanks,

Oleg.

