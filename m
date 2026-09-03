Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E27B4A8A3B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439470; cv=none; b=Oav9iDT3os7PZpD7SDW/kZkaa7MgnxqwFtl1HOZ+ihWobsaVna/fgJ+e3o6Lj0+SdrssNYClS2T1E1P+fo5QImROKgTR8trtu2dZCnXvFjEApSl2pTgp+1GL+gsRgaEfvOeclcDYU076JH4U5g/CgwkO53Jgq5S7kHMwuNiofjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439470; c=relaxed/simple;
	bh=ISWcFeBBc16h2qdp2QnpfbgkRoT2z3JGpBb3QERwrMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DpBwdBOByrFGCTZW93lRzMvjslLvnx9sgbRhFCIdU7mOn6yiRUcJnIR+DNu8Qrho9VLJXei56XnkZFK1p7MKCqPy+xPHglxswda7Y+syouWgQ0dqAC8f9PXtBW5ozpOcJeheIiRdZ+rcYLc7v6vYVYjC6NoDfFbmPVqUjehy5V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AbDG5gb+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AbDG5gb+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788439468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ISWcFeBBc16h2qdp2QnpfbgkRoT2z3JGpBb3QERwrMo=;
	b=AbDG5gb+RKKUrWxWXD8MJ424Nz44+SAzCfM0DV1AZcXx4XpqjLlj9KGNa3jOVgU6b0qErS
	cTVb41RYzqwQ8wung/+JUOBfE2a3c8Bx7HbT53gfFVTM3ii0x7gzU8VMxxPQLBzdW5MAOs
	jnHgC1EFGN6r3/fnsnQ3Wg6r+gkN+1w=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-588-6fHV56k8OGCznqt6en4hwQ-1; Thu,
 03 Sep 2026 08:44:24 -0400
X-MC-Unique: 6fHV56k8OGCznqt6en4hwQ-1
X-Mimecast-MFC-AGG-ID: 6fHV56k8OGCznqt6en4hwQ_1788439463
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DC85B19540C1;
	Thu,  3 Sep 2026 12:44:22 +0000 (UTC)
Received: from fedora (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id C6F8618005BD;
	Thu,  3 Sep 2026 12:44:20 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Thu,  3 Sep 2026 14:44:22 +0200 (CEST)
Date: Thu, 3 Sep 2026 14:44:19 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] super: remember whether freeze holds writer rwsems
Message-ID: <aplro1ObQ5YNZT6R@redhat.com>
References: <20260903060855.4610-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903060855.4610-1-kmehltretter@gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 09/03, Karl Mehltretter wrote:
>
> Record whether a successful freeze acquired the writer rwsems and use that
> state during thaw instead of re-sampling SB_RDONLY.

Looks correct at first glance, but I leave this to other reviewers,
I don't understand fs/ enough.

> Tested with a test-only KUnit case in x86_64 QEMU on linux-next
> 32b6ef9a5d0e (next-20260902). It freezes a writable ramfs, sets SB_RDONLY,
> thaws it, and calls sb_start_write_trylock(). The call fails without this
> patch and succeeds with it.

But I am curious, how exactly did you test this?

ramfs_ops doesn't have ->freeze_fs or ->freeze_super, so
ioctl_fsfreeze() should fail?

And how it is possible to remount with -ro, reconfigure_super() should
see sb->s_writers.frozen != SB_UNFROZEN ?

Oleg.

