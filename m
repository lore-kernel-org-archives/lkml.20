Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDB24F474C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 21:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788471842; cv=none; b=J2QxA8ioH5UG3daVe2alH/JqTocRqkiQQw+eIdebZ89Sb3G4eo3jj2kvsasoRLYFNTsK3TcaBCI9/voMSgn+ZgNYyzneFhaIEr45hjTDEGybichqCizbJjGHeW7vhParf8VRD5Kl9dg9I3JIK/NELF9SL6Dj/ojosHJGR92kHk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788471842; c=relaxed/simple;
	bh=F3jOHh+snqMsGLak2PpEkbeCpwY6HsbPB4pwFgYJvVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=izgYiIo3RSRXdCHUxuxenbx1gsGdBCSidTVU3bj1BbftSeR6XuVh/e351YvmN5dJ5P8vLvyHItTV+oR4vAAwPUScpkuZ7tNyAw1B4a7TRifwu6kf/ndUTYiUZ3Lz0QS+OByuerxym7dEhHRFUx9Z/cZiBdu/yMiV1fQ+gXjQvqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IEN4+Lqe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IEN4+Lqe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788471839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F3jOHh+snqMsGLak2PpEkbeCpwY6HsbPB4pwFgYJvVo=;
	b=IEN4+LqeMdTM2+9uDjlcCqiZReQjCalT3KimSerzb+JNl3bJlcyM/8OZAoMDzcp/zOji6a
	pGqFd+roD4ZZu6OHkqKfClEf5RaK6hJUXV7noO4J/u6TvQS6rN5QGHlrk4X/G5ds8SMRE0
	C2/pzwMn9h/MExSabgiJ94ZJM3GrbvQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-257-E472_1DMN2K9UdbHXXDiBQ-1; Thu,
 03 Sep 2026 17:43:54 -0400
X-MC-Unique: E472_1DMN2K9UdbHXXDiBQ-1
X-Mimecast-MFC-AGG-ID: E472_1DMN2K9UdbHXXDiBQ_1788471833
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9F074195605E;
	Thu,  3 Sep 2026 21:43:52 +0000 (UTC)
Received: from fedora (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 867C31800669;
	Thu,  3 Sep 2026 21:43:50 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Thu,  3 Sep 2026 23:43:52 +0200 (CEST)
Date: Thu, 3 Sep 2026 23:43:49 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] super: remember whether freeze holds writer rwsems
Message-ID: <apnqFe3aZdSM6lsy@redhat.com>
References: <20260903060855.4610-1-kmehltretter@gmail.com>
 <aplro1ObQ5YNZT6R@redhat.com>
 <apnKz_3xD-zbw0dM@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apnKz_3xD-zbw0dM@gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 09/03, Karl Mehltretter wrote:
>
> On Thu, Sep 03, 2026 at 02:44:19PM +0100, Oleg Nesterov wrote:
> > > Tested with a test-only KUnit case in x86_64 QEMU on linux-next
> > > 32b6ef9a5d0e (next-20260902). It freezes a writable ramfs, sets SB_RDONLY,
> > > thaws it, and calls sb_start_write_trylock(). The call fails without this
> > > patch and succeeds with it.
> >
> > But I am curious, how exactly did you test this?
> >
> > ramfs_ops doesn't have ->freeze_fs or ->freeze_super, so
> > ioctl_fsfreeze() should fail?
> >
> > And how it is possible to remount with -ro, reconfigure_super() should
> > see sb->s_writers.frozen != SB_UNFROZEN ?
> >
> Hi Oleg,
>
> Thank you for the review!
>
> The original test called freeze_super() directly, changed SB_RDONLY,
> and called thaw_super().

Thanks, but this doesn't answer my questions...

How exactly this original test "called freeze_super() directly" ?
Could you show this test-case ?

IOW, how can we actually hit the problems described in the changelog?

Let me repeat, you can safely ignore me, I don't understand fs/,
I am just curious.

Oleg.

