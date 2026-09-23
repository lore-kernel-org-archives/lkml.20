Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CB5244687
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790172692; cv=none; b=P3Y+EbJJMHiJ5ksZmeeU6PrJDjpVyIohF6lJDUbU8+5sJtDF1oG91bCHIwrXm4Uoiit/6971l59RAIEQ0oNE9iaK8B/LdIagIAnT3B2pFcM80bFxHIZ1yQRPT3c8rCp6liGpRfo9LnIxTDwUF9Um4R7xoDrySZHQ79QCm2zyik8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790172692; c=relaxed/simple;
	bh=69jidcAtM1YFZanlNL98DsZwBlPwfCk4+ebC9+KWGIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fry3m1rESQfme6Dgf5dNcRhdzzIuhCfW7mOuvQegD+Mwo48Owt0u6acRqFIWriojRpuAznBHE3I5acz2LNDIYcrzbGzuAw90ZJS9a3uoVI7rOmGYQ5x1SZ1kyhWAH7G7Urn4RIybXWbEXGKJIn7f4/gualWaxvh54YJHrlKK46s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c9vukZgD; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c9vukZgD"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d3931so7215875e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790172689; x=1790777489; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Eb/HgMl+NhiWb/6B9RK+EF0vsqiiLDmd1MrEvTDfOeI=;
        b=c9vukZgD7bG+5KAUmdlUypL1Ln7wHpu+I38fGp78DzMGngiOSFQptLJyVkkvV9mJw2
         z8flpUpHj1exGih+i50bYpEApHMcquWINa60kdC2xNSiJOsNqFhmrxa3s0C6YOpJO/PK
         oB9VUu5lEYgSWq2L5nxrLoVtcIgEbJ68Fa9U6uYe0SC3IL9fDuMSWHC1il/eWWxK9nS8
         B+9d/C1yeYpD1EWydVjDlRDW5f0gNE5V+07epl2B2cx4/rOhPmuW70BLSkCgS0WkwtLr
         NVXb5W1hr6A65bAv/dSqU6ZpgLkHZjbotlxrOINHXsFZ2gFW0h0YYOpCEg42MCCzj9/7
         0X5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790172689; x=1790777489;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Eb/HgMl+NhiWb/6B9RK+EF0vsqiiLDmd1MrEvTDfOeI=;
        b=2NPpqeR7RNkyHwL3xm8QRPW/4Smv3zITwL5KIShlkykTzINHt+CXBMYBPNuCD5B3bp
         sEHopZpfXvH1Bl+/itywmPFfW888DhpTC4kC8Y+sRIpt0B7VBPAFvW69OuDL69knJ9iE
         IhUHmQX2iJ2s+2ZdW8Fd7KmmGDOGIU0kJVQo4gRyVRi1JnafkCTY29oYDwrYeia/DLjn
         sO6jLzL5R8XGwSAsxk2m6rwxD7jrXXvmmuK9I/cNca+ReFl4bmKka2h7NufCBpdFcfvE
         SLTy1Hg5FGrX8TysVfe7zTtxQ02SUnhEyxhirvlKwVJ1plin82s66cQaN1Dk1X37rjbl
         XQCA==
X-Forwarded-Encrypted: i=1; AKwUvBwHvBli4h71G/axCJNji1QuG45ceUSnrR1WSPnUrduSqY5tsWsPLBF6DNhVhznOKjEQu5cilBiZWK5Vvv8=@vger.kernel.org
X-Gm-Message-State: AFuF++k5zBHRxEUGUipU1tiZxAfCtGdVwrb7UPsp3mH9QpMh83UoXSV5
	V02gdJPSbmgzv9BKAv5s2oJlJrnckxB7GnvyukrD21iFNk5Du13Yka+PZkH8iIvu3Q==
X-Gm-Gg: AYBFou3Ny0u6gXWuwlS1Q1xTIabLaceAO1H5TsKDftcztult6NIqnywIJWK+Z7klfmf
	+HwFS/cuzSJRewzEycbgEk4cvMlDNwQPmBz1PVQ/zxc6HRqr+TwbIj1JlxXpHK8fR4jTkrOSJbq
	79G1E8Rz6gnOlBgCgFBn+DSUFdqu/LyhUxSOY6CP3jvj1NhIOUzntcGZ5fDCm3ZoCQUSDNnuBCx
	Vn4VCNKjGCHyVYyUpRMZlrecvqf6dBX8ltqQLvYH1RJ9XrOskukqYAOmIr8RA2DdGpQX2aEZeo/
	WGW0NJidxpf88S7BPeLbDDI/rSaTTbq6aKMJQp856oW1NkGPmbiNl8qmRkA3XZ/97rf7sq5lBxJ
	m/WF2udhCsJgRoCG0vaRZZmvaKAVJbGr0wvA5Bkwposy9FS2EjNe+Y2akeRQipMdho657It3Hfb
	mZvQj745N9Wym6B9lOrJ8Oi+5otFL324ma06wpcZ5CKW43mEkNq+nQXNx0N9EsYBy8XoGdrGdtD
	OzcrV6GyEEGp+HhXyKTd4jRFbYp3g==
X-Received: by 2002:a05:600c:1908:b0:49e:8184:f63b with SMTP id 5b1f17b1804b1-49fdf12a2c6mr35858125e9.16.1790172688081;
        Wed, 23 Sep 2026 07:11:28 -0700 (PDT)
Received: from google.com ([2a00:79e0:288a:8:c20f:9e7a:eeee:1b06])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1a0e00sm68608725e9.10.2026.09.23.07.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:11:27 -0700 (PDT)
Date: Wed, 23 Sep 2026 16:11:21 +0200
From: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>
To: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc: Christopher Lusk <clusk@northecho.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: landlock: clarify TTY signal scoping
Message-ID: <arPeCRLPD3WxStgU@google.com>
References: <20260916152336.1589383-1-clusk@northecho.dev>
 <aqq3yY8SKIBGUZ8v@google.com>
 <20260923.oyohBie1Jeen@digikod.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260923.oyohBie1Jeen@digikod.net>

On Wed, Sep 23, 2026 at 12:14:01PM +0200, Mickaël Salaün wrote:
> This looks good, much simpler.  Could you please send the (new) test
> with the v3 of this series?
> 
> On Wed, Sep 16, 2026 at 05:37:45PM +0200, Günther Noack wrote:
> > On Wed, Sep 16, 2026 at 11:23:36AM -0400, Christopher Lusk wrote:
> > > The LANDLOCK_SCOPE_SIGNAL documentation does not describe how TTY-driven
> > > signals interact with signal scoping.  Holding a PTY master file descriptor
> > > is a separate capability: its holder can cause the TTY layer to signal
> > > processes running under that terminal, even across a Landlock domain
> > > boundary.
> > > 
> > > Add a concise clarification to the userspace API guide and the UAPI header.
> > > This records the capability boundary identified during review of the
> > > TIOCSIG discussion without enumerating individual TTY signal paths.
> > > 
> > > The documentation text and changelog were drafted with assistance from
> > > Codex (gpt-5.6-sol).
> > > 
> > > The userspace API documentation builds successfully with the kernel-pinned
> > > Sphinx dependencies.  The patch introduces no new warnings; the existing
> > > missing-graphviz and undefined-label warnings are unchanged.
> > 
> > Minor nit: Last two paragraphs of the commit message would have been
> > fine to drop for conciseness (the Assisted-by line already lists Codex
> > and the other paragraph talks about things that didn't change).
> > 
> > But really just very minor, and probably not worth changing unless we
> > unexpectedly need a V3.
> > 
> > > 
> > > Link: https://lore.kernel.org/r/aqqJAZfG9FC7PgMW@google.com
> > > Suggested-by: Günther Noack <gnoack@google.com>
> > > Assisted-by: Codex:gpt-5.6-sol
> > > Signed-off-by: Christopher Lusk <clusk@northecho.dev>
> > > ---
> > >  Documentation/userspace-api/landlock.rst | 3 +++
> > >  include/uapi/linux/landlock.h            | 2 ++
> > >  2 files changed, 5 insertions(+)
> > > 
> > > diff --git a/Documentation/userspace-api/landlock.rst b/Documentation/userspace-api/landlock.rst
> > > index 84cb7bf6b3ed..33a514ebc615 100644
> > > --- a/Documentation/userspace-api/landlock.rst
> > > +++ b/Documentation/userspace-api/landlock.rst
> > > @@ -430,6 +430,9 @@ The operations which can be scoped are:
> > >      This limits the sending of signals to target processes which run within the
> > >      same or a nested Landlock domain.
> > >  
> > > +    Holding a PTY master FD still grants the capability to issue signals through
> > > +    that PTY to the processes running under that terminal.
> 
> It would be more complete to quickly explain that a master TTY FD should
> be considered at least as privileged as the processes using/trusting the
> slave side.  See
> https://lore.kernel.org/all/20260923.eehieph7UaX1@digikod.net/
> 
> So, this paragraph should really be short.
> 
> > > +
> > >  ``LANDLOCK_SCOPE_ABSTRACT_UNIX_SOCKET``
> > >      This limits the set of abstract :manpage:`unix(7)` sockets to which we can
> > >      :manpage:`connect(2)` to socket addresses which were created by a process in
> > > diff --git a/include/uapi/linux/landlock.h b/include/uapi/linux/landlock.h
> > > index cceda3b3b961..6485af37dd25 100644
> > > --- a/include/uapi/linux/landlock.h
> > > +++ b/include/uapi/linux/landlock.h
> > > @@ -501,6 +501,8 @@ struct landlock_net_port_attr {
> > >   *   related Landlock domain (e.g., a parent domain or a non-sandboxed process).
> > >   * - %LANDLOCK_SCOPE_SIGNAL: Restrict a sandboxed process from sending a signal
> > >   *   to another process outside the domain.
> > > + *   Holding a PTY master FD still grants the capability to issue signals
> > > + *   through that PTY to the processes running under that terminal.
> 
> What about rewording the LANDLOCK_SCOPE_SIGNAL description to say that
> it is about signaling *arbitrary* processes (which is not the case with
> the TTY master FD)?  This way we would not have to specifically re-talk
> about the TTY case.

In "Restrict a sandboxed process from sending a signal to another process
outside the domain", I think it is already implicit that this applies
to all (arbitrary) processes.

How about this:

   Restrict a sandboxed process from sending a signal to another
   process outside the domain, unless it is done through a controlled
   indirection mechanism (e.g. a PTY master FD).

I think it's worth mentioning the PTY explicitly here.  This is the
interface description for what these LANDLOCK_* constants mean, and
for documentation clarity, it would be good to be specific about the
cases that we know.

—Günther
