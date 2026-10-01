Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57C3521221
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 17:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790877203; cv=pass; b=Pvq/ulAgMcsrrWs7t1dBcXpz1Gjq1CPtCfyF7csERii+/ZRSsjPM5HP68c1Pujsqle76KoXl5qZe0daplUrIxwBBSLaPVV+yPVqIxpoTqUCN++bRcuYaCx8gQXYEtyt962H1VaSmO1YlryMziOywwgJ/+MA6rJJG2vgFiDcwb5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790877203; c=relaxed/simple;
	bh=cco+5oXzl9OcKLeS1epBbONJTaKK6GrymQgbT7xYtAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JcZlrs32qXxwUG8G3SZlgKmshOXjc+9e3j/sPxgKen/goor1GuZRq4rio7CObrh/GprYfT0UJ7p13H8iBm/DLJelOsrgnEEy1N7VOLYuVTksVYzO//THlohz5edj9uBfQZCfhlGn42WKKXY4dniRcqbHoEQ6rLhpg1VMow+h7UE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rfkpvHrJ; arc=pass smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rfkpvHrJ"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e0f2c945eso347107366b.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 10:53:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790877194; cv=none;
        d=google.com; s=arc-20260327;
        b=WypZr3LQaMTd4cxEHBuLzZmDfH1fyk6BT+0ELr2qplnv67UFuamPbRm9jdPHPCd2kM
         0O8WPj6L7iHWkbATz78GjtZbYz1BZUS+9BrJtmFRAbJtgDoLILqDiImHNz002Bq/mRzO
         jSEXeMB2H0ZDOjvGbuenno39Q85r/vdGIXKDJqLlfifiRi5Og0ptNuo6OORkRJGz1cne
         lT5Q6LdPivX4ZwmFiKBzwM7cQi4APMiycYI4jphhGC0Y9vy4XSvKL85rMjusahFRwpzs
         Kq6sQCcNyYPHU+2aW0SNws1vJ2LcK81coIz6p1k/2YJ7OOktgmRl3dB7EjD235PgvByl
         k+PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5FPwXskimTV5Cm3JlZNRWRS1UDu2MkqsLKRMDAqBuMc=;
        fh=b/RE7B4ysVwHNbz8Y662yW4EFi99Frh3Ks7dGAV/k+Q=;
        b=NEr0+wOVZxdWW60gKkkFbDqC5FwqEA97nd4F7JZRX3HLR0+Qh20PHFd0YeyA5HyMIn
         9R2lRq79cIhkEE1kXQMOW+AyMudXn0uBqnCxrF2Ptna96cFuYUMjn/owwI24XAXRIQNq
         fX+He7DiPqrWNGutjk7MVPKyZzanswK50OogILMDXi+siNyIF8xCOaVGkqpQLQAXOFVr
         hfjAXZgwUXpMRfKf4GTP4DJqoMrTGDbVdpPtUXI7qAjGW1FGMWxUmN2DN997ebrlFDl9
         kwAptFQ55Wn4him7RRdQ+YdPK5Os36TKhwD6Qix6whyvLMiKDsNoHNRq6EDPKYLS1AXH
         PFrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790877194; x=1791481994; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5FPwXskimTV5Cm3JlZNRWRS1UDu2MkqsLKRMDAqBuMc=;
        b=rfkpvHrJyQuLfNvHC5aC0YHh/881B3p/r8WTUOCn2CLIo+epVr9lqd1Ae3uVQGb44m
         gR1w2PbvWWhG9IMd3dAyhC4sc+CfwYG+Mh3eOWbvXvNksnA6ZrDXcIBjgZMZYyYHBZ4d
         CntSibIGjFuERrk3yzM+C5E7ijWTlawGH/bK/RKcBmYlVSpydYixha6vqi7Pb2PrYZtz
         4iB7ZD8pqJ5qUSEGcREeygJ4nE6OzTSKhPk0UUB9wBvrBmAiJnec/TyweVX4npJPgPhS
         p1N6xbq3h2gKmcjGktLXvpr61LxQYB4yEQAIdTm7eY3zlXwOqwUIMShZhFNCHFZ+GBAO
         uz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790877194; x=1791481994;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5FPwXskimTV5Cm3JlZNRWRS1UDu2MkqsLKRMDAqBuMc=;
        b=H/qmtpNwgvig4h7kVVcZrNB17obqHNgginw9F1XG18QxmhmLOvkqxI8cxOe3tbqgsl
         xJmshExyvfqNXyVJPRzhNhKoNI+xhMzdzujW8nJYCHKBOiLuk/iUpRNF50RX7pbPWLUX
         M/goXaRat2ojDZuTvWcM3EJzGr/lXgwciXr3duYhiQbKgUoSpQ4A9zXVhzzAbqeOwKb1
         bdARhzd/yydU9+dBh7fdYPEW9UYax9KhNIvb2t85k5H87fl2rdyFA7f1dBOk/P3qAesJ
         iQPOzFwVAzDEb3cACksilmHxctF/73YdTKg/43o5cIb4pUtAW09SKRNILrhfcDbDzfYb
         g7TA==
X-Forwarded-Encrypted: i=1; AKwUvBxcLbcbzM7vyDi+GM3h6D3k5BJxalarecGBxR8U/bQo337UO96Ns164ccoBzrX7OxyPc221Ca67eNtPSDM=@vger.kernel.org
X-Gm-Message-State: AFuF++lKheugpJ9aA+sjggONO+smVFELQd35baNXGJKYN5A+3/CR9uvH
	5k1A04/3d2/NyJfLizsEUR3xQH9QRgHZu3vuSPZcsKmPnXTCTrg1bjaVc+ksB7YELQqt5cUMo6r
	B5xY1rIkLa7TpIGJL93GtnF4WoWSKNaU=
X-Gm-Gg: AYBFou0ke1PVUXvoUQ+AQTjCk2fohAVrVsG7VaMq2lldqiGCyZrgNtiArzeq2qmFQjV
	SR14P/GMt0W74HgNqSyExEm7v/Nc4vSnUXlYPTEoVAM2AsXJtMRwF+/qqSdt8R0fZPzRf0mHBdT
	WVRPKYuc0pI7ok0Kk1QFw/YqxWyRHqK0VHjyMPo/TatLmaC8bUoOBmjxeXfxUuI+ZB94QZE0Zh3
	ftHEqdEtbf/zKu0X1NhMW4oIgFYVrM3HaNAedixdwc29qFyIyg3625DC36gmtUVrTAw2aRT4Yae
	HzWmto57WJEngp+deosSNU2Z4qdGOwZob7O2ytlHWia6migiJXbnJj9xIaiSTaBznII=
X-Received: by 2002:a17:907:2d8f:b0:c29:5d41:dfe8 with SMTP id
 a640c23a62f3a-c2e4b443e7emr30126866b.43.1790877193384; Thu, 01 Oct 2026
 10:53:13 -0700 (PDT)
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
 <CAOQ4uxis4tsea6fx+9iAffVX+qwBC9KzHg5GcP7ahthKd1T9KQ@mail.gmail.com>
 <1910540525.790746.1790806610320@kpc.webmail.kpnmail.nl> <CAOQ4uxhYHf-gAkjdhs37vZREOcNds5a_6c3nBX0Lva3resofmw@mail.gmail.com>
 <1000409963.929534.1790869356300@kpc.webmail.kpnmail.nl> <CAOQ4uxism8-zwCDgGjO4Rxz6DqOkZJeZOeYKHf3QaBDFZHpcFg@mail.gmail.com>
 <563229463.934215.1790871823693@kpc.webmail.kpnmail.nl>
In-Reply-To: <563229463.934215.1790871823693@kpc.webmail.kpnmail.nl>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 1 Oct 2026 19:53:01 +0200
X-Gm-Features: AclHuK_pfqjYtJsEEhZFVwP00mJld4bjVtzKfR6264nsENJOPN0vxrbfYWt5b0I
Message-ID: <CAOQ4uxiZBgg6WNRCNifsMRkuhX0176oef10TyhzdmTvqkEVnUw@mail.gmail.com>
Subject: Re: [PATCH v6 07/12] vfs: add O_CREAT|O_DIRECTORY to open*(2)
To: Jori Koolstra <jkoolstra@xs4all.nl>
Cc: NeilBrown <neil@brown.name>, Christian Brauner <brauner@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Aleksa Sarai <aleksa@amutable.com>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Theodore Tso <tytso@mit.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 6:23=E2=80=AFPM Jori Koolstra <jkoolstra@xs4all.nl> =
wrote:
>
>
> > Op 01-10-2026 17:59 CEST schreef Amir Goldstein <amir73il@gmail.com>:
> >
> >
> > > > Maybe I am missing something, but I think you misunderstand me.
> > > > What I mean is - if directory inode has a ->atomic_open() op,
> > > > bail early with -EINVAL/-EOPNOTSUPP, because this is a network
> > > > filesystem that does not support atomic O_CREATE|O_DIRECTORY
> > > > and in most likelihood never will support it.
> > > >
> > > > This gating criteria is not dependent on cache state,
> > > > which is what we wanted.
> > > >
> > >
> > > No in that case I think I've understood you (or maybe still not?) My
> > > point is that we can't do that if we want to be able to individually
> > > support O_CREAT|O_DIRECTORY for some ->atomic_open fs. If we bail ear=
ly
> > > the how can say only NFS support it at some point? You get into the
> > > situation where everybody needs to have support or no one.
> > >
> > > Does that make sense, or do I still misunderstand you point?
> > >
> >
> > If we gate on an existing criteria now like ->atomic_open()
> > and/or ->d_revalidate(), we keep semantics simple and it
> > does not limit us to change the criteria in the future.
> >
> > But I don't insist on this criteria - it's just a suggestion.
> >
>
> Oh no, I don't think it's a bad idea.

It probably is though..

> I was just trying to understand.
> And like I mentioned, I don't understand the detail of ->d_revalidate()
> usage.
>
> What do you think about Neil's suggestion to keep ->atomic_open out
> of directory creation for the time being with:
>
> 1. use ->atomic_open(O_DIRECTORY) for lookup, no O_CREAT bit passed in.
> 2. if positive then done, otherwise (on -ENOENT from atomic_open()) we
>    call ->mkdir
> 3. open that dentry in the regular way, WARN_ON negative dentry return
>

I don't know enough about network filesystems to say, but it sounds fishy.
I think we want consistent defined behavior for O_CREAT|O_DIRECTORY
for filesystems that support it and my understanding is that this
suggestion is not going in that direction?

> But I don't know if the kind of atomicity I care about is affected by
> ->d_revalidate() filesystems.

It is not directly related. It is circumstantially related.
->d_revalidate() *could* mean, in the worst case, that holding the ref
on the dentry gives no guarantee on keeping the object behind it alive.
In the worst case, maybe a new object with same inode number could
be created in the same name.

I am not sure this can happen in many filesystems for real, but I
am pretty sure that it can happen with FUSE.

> With O_CREAT|O_DIRECTORY we just want provide
> the mechanism to ensure that the process actually did the create you get
> the fd for.

Yes. And I don't know if you can get this guarantee from all network
filesystems. Requires an audit.

Thanks,
Amir.
