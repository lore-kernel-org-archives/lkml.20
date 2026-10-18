Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113CF3911DD
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792341019; cv=none; b=ogKgxo34cLR5pq9K7Yj0UZMfykR41B6uGLxn/ETibb8aS+Xt/iLLLSr0KYF58NOkj8/nu3Ur16CXj5XPD4HT68BoOFDZyZ+qeABWanovYVNw3hzERhFMHAsBNMndHFFERj9e92oaE+C/8FICLF45aTKt4eWvbahYM52vEbWsep0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792341019; c=relaxed/simple;
	bh=egDuwz+c6QZTiEigSy/Vivmjz+JH8n3CcFNOntbrRao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lIjuBXEnLHIC3NOZP6GrfBClOKLkXNUqmzEZBLeHxj6kMlS4MgUmtE+tngutNhNXuhb944MZCPdPvoX1Ng+j1B32xmHUCGuVSftiDaXuFPUVN20IrMeqtOGQGjvvRE6e8WOKTkeM1nMA12u1fm3prgs8IognTfBycc7yEKfTbEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D+c1zlM6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D+c1zlM6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792341015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2apKFlSMwGmrVpCk2uicJf2pR/mccD0dUIhx18BmZHc=;
	b=D+c1zlM6u5u0K8tt5wOgWZpbk1tzBLduPiqz2kW4LUe9Dny9XINyLKt2WZx1fJaAFKe81e
	UZkJQoSo/qkqt+i9N2qAZ6xKcnuEODUm7yRiN3u/cqycazgRCUmV0tUiz7lXzOdLJJxwFi
	NT5kCjEjM+FYGGGO/DGnriZmGel2yrA=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-102-toLNcrWeNhqB3NmBsGw_1Q-1; Sun,
 18 Oct 2026 16:30:11 +0000
X-MC-Unique: toLNcrWeNhqB3NmBsGw_1Q-1
X-Mimecast-MFC-AGG-ID: toLNcrWeNhqB3NmBsGw_1Q_1792341010
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 39E0D1955E97;
	Sun, 18 Oct 2026 16:30:10 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 4C3F81956042;
	Sun, 18 Oct 2026 16:30:08 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Sun, 18 Oct 2026 18:30:09 +0200 (CEST)
Date: Sun, 18 Oct 2026 18:30:07 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: fujo <hooyan2024@gmail.com>
Cc: linux-fsdevel@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] pidfs: don't report autoreaped tasks readable before
 exit info exists
Message-ID: <atT0D2l9iqMJHL3s@redhat.com>
References: <20261017054356.7874-1-hooyan2024@gmail.com>
 <179226499044.847.6888435030853836469@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179226499044.847.6888435030853836469@gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 10/17, fujo wrote:
>
> Your POLLHUP remark resolves it: PIDFD_INFO_EXIT is published before the
> task linkage is removed, so POLLHUP is the right condition to wait for.
...
> I will withdraw the kernel patch and send a selftests-only v2.

Good ;)

> Do you
> think the CLONE_AUTOREAP cover letter or some KAPI comment should also
> say explicitly that POLLHUP, not POLLIN, guarantees that
> PIDFD_INFO_EXIT is available?  The "poll the pidfd and retrieve the exit
> status via PIDFD_GET_INFO" wording is what led me there.

Well, I'm not quite sure which documentation you are referring to, but
of course it always makes sense to fix or improve the unclear doc.

Oleg.

