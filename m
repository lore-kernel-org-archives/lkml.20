Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C002D12EE
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790846972; cv=pass; b=OFXN5QvsHv9qi89BRDpzWYPaRWic0O280Emq4kSwJMgfoDYP/FBSZcYpjIOZAlMIkOj7PG08PV++FBqFm11KwFXUkIjSORlYo1d+X5yFApu4JMks/gUHc5SEis/gEELBYZKj3NnTsSk8QQ++P0zfCpnbYYhOfkS+zErDuQk54as=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790846972; c=relaxed/simple;
	bh=jZHzvLN+YWJv0sQisf4gerkQl2AupObKC2jZdQ8u92M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aZKdcqZbN18/aFVw2tNL0jG9ff9cGjZMmwyLUFdJbvn+JsjxlE2Le1FhFcBXF9xnIwSAA10OOw3VonA5TeuGSPqlqba4S3mKXZq8Q73rCurtW/Wr3LfK8OAl3BN9YSMhBJqOagbBeSr25YMPnjgJfYMaArcm9QEfnwJN33LEH5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NY1cCaLu; arc=pass smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NY1cCaLu"
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6acac47206aso4284422a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:29:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790846966; cv=none;
        d=google.com; s=arc-20260327;
        b=pcTpvdt1OqboxvUNbAa4BfSVviASYH49C6o9ZhgAqVs4LUbR5J8KtNsST7iBrMmOHm
         tSqx1aBe7Dc57rnlkujkcFykBVfqCEMf75JlI20dKSAUz5Gjz/dy634tlmOo9ag9Xp0D
         sbL7jOZbV1xd7OLMGHci8/NsaClO4HDx1qlxdkZEORwd7J7x29ia7m+bSZ7D138vlOJi
         gu6dJZNz6TLjvcwI/GSxAoK+Vn0IcAB6DLztYZ9kjHSljZO8J600aweqWXI/RcJdZVBn
         f9Ipz6KBmsKuwGWk+7lpEL9jSJJHZTsVvMsyVc9VjSvn3wP2iwd91qqwLb9vcuzqJghi
         gVBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HCpnUTDBQc5LkLCypwiLrWXTqJ0v8a+JvAdX+sHd2j4=;
        fh=iO06syFTFJUIRRDq+9++XYh0OHsxuQB/+WKtbaLDQTs=;
        b=KW08ffQSAhQAHWzUuvhU33S8fFFMoW7msn0K5NE1y6do/5KKn/wpob9QnPIUB+lFxc
         fQBbiMljTCjTadUfSLlHj8nU+ymTjTQ0eoLXxxDOHYpVeLnSAs1aw7/TIgx8Gj34Tkhp
         BGkKXATpYxn8Mwd+GNwnBU3oR6BNQHeEWK/HTRiFTjlqe1hp50xGYnSNTg++J5hpddt9
         a6AwhYZuR0CyFEKdiUDd20Rla2jX0gejwsbEwH+0U7iHZT8RtYZ3gz6sJzKyqaJUYO7j
         L1kVFwHYxrmLC64OkcwSXkgkjNls0a3KzGgQGZPmyNHzX6d1zvTZ+SUNS9OpXyjC4xMb
         NbLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790846966; x=1791451766; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HCpnUTDBQc5LkLCypwiLrWXTqJ0v8a+JvAdX+sHd2j4=;
        b=NY1cCaLuvPzoAwNmUZmOShYwrQBDtKgIcQwzEsv7pp9P8TLuD50u89/XpjOvIhsHGr
         8fkoq6Q7stfQ73q/g82gAO55Yeo/lhBXQzAMcHXdZfXXMxarqqQr79MPGq7Dwlju5/ve
         gb/6DzY4y5r9DZr98p/7fP2MvQ8iRZrsOp2bbBlF7fKXCwUkVb3Da/Gi8BGzBoqjbapB
         hTaj76Pz9CBCoFn+2973+UpYxK5rDgiwJq1o80EmHeT30Htfl8pr5W7LMTBHE/kuPQqO
         NOBbo/SWtnEgiYxtgsScSvxJnr4baQNrS5MREsrBRSLM0XC11nM+O5xuzK3awskQi7xe
         Piig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790846966; x=1791451766;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HCpnUTDBQc5LkLCypwiLrWXTqJ0v8a+JvAdX+sHd2j4=;
        b=aAvO6lqP9DWMVfYCzt3s4GGqpAiXxFTS0RjTcuQiCCgkAPLOmo/QdIP8vQh0Jan5bo
         FlIN0PF/eBsJ3kktFat8H6UJq7iSS3GBf14YeLmqQ1moav+iQ3xvzYx1zfVRHmjVgmi0
         U7XZr6OQOqhe+uOR7/ZowjbB+L7EvOSoItuT7mmv6YIlh4fskvk/rcxxIVk388R1Z28S
         7q8aPYKSkATlZGvKQfuuTSPhcSQnEpInqDLCsHVRLYzx+MUnmgrSYeZ+LDbpFQc84QMi
         W1gcl9nneDHRYGFwfX2lj4DhP8HBA0zskfYtatsOXY7ldzhDuVHogOt8ZcRCwfSUST5F
         BA6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxb7PcOth6souWjtx9iadVbMWfmfalCynX5Zlups5gwVPOYvM7zBnXCSSdIl7Bc3bZh98NkIdXJxZMk6ac=@vger.kernel.org
X-Gm-Message-State: AFq9FYKb0bTGmL069ajgRCB7TiRQICzfNDaDnA3t+CRg3o9Oz81dAuR4
	6WwFeHfu7+3RA94zLAcCujCZoBrngg53jpQlnLKMFavKQAW+rcVkCcBn3/4A4n5gwbg/5lAp2Kp
	/W52Aidn0Z5I3kTHHRhcL/BFqOWSxl/M=
X-Gm-Gg: AYBFou0s2wuEeNq2csOde3Fsd7D1vpJVCXjWP6TNrqDDmQjksjGOyaJWTAq+reHih5R
	zXKcXnU2LaaVi2E1pwcFS0t864vY31AqhvVAQHZO0s7yZgJsYA9vmkH6cPLJUJMt08L9u1BpUM4
	yI1OCvmB6EfOkfAhZPLgdKdJl5y+SbZbuDgf6UQi21YkdG0t3yNQv7Nal2Qv6VPVz37KlWgiWuC
	rOe+Yq3hrvR/BqZ+D0H6LXX3Zo5N2JBdxzOxe0dyS6zqwt0zvc6ipNH2miUu8q+RjNXiUtGTZt/
	M0cVIB9/lPIAQvHe+VD1+L61HPaTDRxH6/EGy2bBrDN1MqH6gH5DV175siGCdIkmHFDM
X-Received: by 2002:a05:6402:270d:b0:6a9:a5d6:622d with SMTP id
 4fb4d7f45d1cf-6ae19864d1bmr3251507a12.3.1790846965815; Thu, 01 Oct 2026
 02:29:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913185016.523376-1-jkoolstra@xs4all.nl> <20260913185016.523376-8-jkoolstra@xs4all.nl>
 <20260918-reklamieren-syndikat-gemildert-763b72008b46@brauner>
 <178972607557.207413.4312278359822083538@noble.neil.brown.name>
 <178977609418.207413.15011378414000392029@noble.neil.brown.name>
 <1010887891.582666.1790682845752@kpc.webmail.kpnmail.nl> <179072013439.37859.465558431050704411@noble.neil.brown.name>
 <CAOQ4uxis4tsea6fx+9iAffVX+qwBC9KzHg5GcP7ahthKd1T9KQ@mail.gmail.com> <1910540525.790746.1790806610320@kpc.webmail.kpnmail.nl>
In-Reply-To: <1910540525.790746.1790806610320@kpc.webmail.kpnmail.nl>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 1 Oct 2026 11:29:14 +0200
X-Gm-Features: AclHuK-KGaG7MdZslEeofy-MHWg6LFigaj5JnkX5PbgsR-pbCuTja2l09oqRNVI
Message-ID: <CAOQ4uxhYHf-gAkjdhs37vZREOcNds5a_6c3nBX0Lva3resofmw@mail.gmail.com>
Subject: Re: [PATCH v6 07/12] vfs: add O_CREAT|O_DIRECTORY to open*(2)
To: Jori Koolstra <jkoolstra@xs4all.nl>
Cc: NeilBrown <neil@brown.name>, Christian Brauner <brauner@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Aleksa Sarai <aleksa@amutable.com>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Theodore Tso <tytso@mit.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 12:16=E2=80=AFAM Jori Koolstra <jkoolstra@xs4all.nl>=
 wrote:
>
>
> > Op 30-09-2026 05:45 EDT schreef Amir Goldstein <amir73il@gmail.com>:
> >
> >
> > On Wed, Sep 30, 2026 at 12:15=E2=80=AFAM NeilBrown <neilb@ownmail.net> =
wrote:
> > >
...
> > > The problem with this approach is that open(.., O_CREAT|O_DIRECTORY)
> > > might create the directory, then return -EOPNOTSUPP.  This is weird a=
nd
> > > I'd rather it not be visible.
> > >
> > > Currently O_DIRECTORY|O_CREAT results in -EINVAL.  I would rather it
> > > remain a -EINVAL on any filesystem which doesn't completely support
> > > the functionality.
> > >
> >
> > Joining late to this party so apologies in advance if my questions
> > have already been addressed.
> >
> > I agree with Neil's statement above, but IMO, the atomic_open() fs
> > match the description of "doesn't completely support the functionality.=
"
> > Therefore, I think that rather than success if directory exists, they
> > should also return -EINVAL/-EOPNOTSUPP consistently (see below).
> >
>
> The issue with this is that if you want per fs atomic_open() opt-in (in
> contrast to either implementing all instances in one release or disabling
> all), you have the issue that your lookup now depends on the caching stat=
us
> of the directory dentry.
>
> If that dentry is in cache, and positive, d_lookup() earlier in lookup_op=
en()
> makes it return early:
>
>         if (dentry->d_inode) {
>                 /* Cached positive dentry: will open in do_open(). */
>                 goto out;
>         }
>
> So you get your lookup. But if the same dentry is not in cache, now you
> suddenly get -EINVAL. I thought that behavior was more unwanted then
> what I eventually settled on, namely to strip the O_CREAT bit.
>

Maybe I am missing something, but I think you misunderstand me.
What I mean is - if directory inode has a ->atomic_open() op,
bail early with -EINVAL/-EOPNOTSUPP, because this is a network
filesystem that does not support atomic O_CREATE|O_DIRECTORY
and in most likelihood never will support it.

This gating criteria is not dependent on cache state,
which is what we wanted.

The justification of using ->d_revalidate() as another opt-out
is that existence of ->d_revalidate() means that the state known
to dcache is only semi-reliable, so making atomic create/open
promises is problematic (O_EXCL for example).

The problem is that some fs (overlayfs/ext4/f2fs) register
a mostly-noop  ->d_revalidate() so I proposed how to deal with those.

Thanks,
Amir.
