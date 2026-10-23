Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792759542;
	b=idVi8WguPybzrdkT8xUBbwLgarmQQcKcqOYbM7lQEa1yoNtZQBr65RgqDXEead0fWRKc
	 waXnozdEFDVUq34sNAVJvW1NxvyQy0UtfFUY8kQBX/Yru2LNyR6VzjJe9Kr0fCNv9jBjD
	 krbhNQltGdpf3epvBcKixh3TC8YKt55aQ5YEU9OiJ4oADn+nFly9cVR80frc1XrTD8isQ
	 O3qsfGK7o+EDwEhcnlPYt0V6BIg758cXmAFCe+JqqDiOX71TxNaBfQuWZY5zNowne9QZK
	 zUFX1N95mFFt3RPlgEwFQbc4Cv50P5MJ/3i2XIASkxBfOloTyDYwnIci3t3E/Fjw5vA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792759542;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=Dw7ixUsZNlBi2ggGvaFZwX+nWP7PGBtWcR/4kzMhp/c=;
	b=VRgQ7FfctNap2viivYwSMgbJ2RKIb7fyosVEtxY6/E0gk8g5+69dh0O1bx5sD8xn26p7
	 nluPwW5BCVoI1XJ1lNsUph18iGxpDw2jU3nyQF7TfGgaAZArNM/sPZgK810NPVzA0UdXf
	 WedFow+J6R/A+Bdlx8rd7rvI1ekUf2Rl/v3oclcDG2XWj3K3hGig8hvz6purd7M/IRwt3
	 lKWRIZ/TUISgGYXxrLXameypfXtckY81d+Qqso5ynimjWbfFt6L5gYRxKItkBbdZNZx5e
	 fBe/V3ZmEtkRgaYLmjQ73JnKCK/jQN7woSoVFjcsRtPKkh6sZhWAmOcts6uKBmHK7GA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HMqYc8W+;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kvNnk1JJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7667B606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7667B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HMqYc8W+;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kvNnk1JJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792759540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dw7ixUsZNlBi2ggGvaFZwX+nWP7PGBtWcR/4kzMhp/c=;
	b=HMqYc8W+fjXYuoeU0deohfy5BjhJjLWC+ARnQHn1fjyPD//jxOKKRuH9DQMYR6V1qkQzjZ
	5TSK3qgF+nphUNqAih5iWmoJe5pTMltxyhtRYun1OXReg8Bfv6GjGwaTYm9dohrknjPc/7
	ZRCv1tsqN2nhjo84uFslVuZURLH9gPI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-4h8moVNpNbuUmyhldPpKrQ-1; Fri, 23 Oct 2026 08:45:33 -0400
X-MC-Unique: 4h8moVNpNbuUmyhldPpKrQ-1
X-Mimecast-MFC-AGG-ID: 4h8moVNpNbuUmyhldPpKrQ_1792759532
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c40285df2a0so47869866b.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:45:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792759532; cv=none;
        d=google.com; s=arc-20260327;
        b=Uk8ZY47ETKomdUJFcK5XVdcF9uR5pTPl0dZdFgDtWV/CMjJjuE3wXMD2SCXXuJrjdg
         W6EosKnmwq9huo8g45fqFImwJRIua+RsdSuT5rIuzDJO7H3upXWFHutRuxG7iXpbicRE
         R8Y3BHvBHQ0gT6PjfrGIscRP6qegjUck+Q5B4bgZbBfqkV3HH58q2AbK+pONx91JcJIt
         xZuIQH+roeymFvpOdAVEYdgiOAGXRjgLFC8Nt9nyEhD13SgRWyVG6eTJC8XFgQGU2i1a
         1slnCDL+9W8zlRXhOffVyHdT5YKzshGD+q+f7zZ+HReWy9p2QSPLt+xVamDfO09pgugH
         k8uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dw7ixUsZNlBi2ggGvaFZwX+nWP7PGBtWcR/4kzMhp/c=;
        fh=4Qiy5/VqZaBbzXgeSCqjbfrBaDQzGcV0RSm812IvOkg=;
        b=PNo/DODRimH3YWc2nrCB30LHBovVyzlk6HB7B4iT0WI/v/dC8KhabxSGerX/lOxZWx
         51iQnH+SO90VZf51FgXRgKGtOTILjrgae5glsZV6cScFLdLUwpYdtTtfp0FcTcssUppX
         0+Kc3Nl8kNATskFym3JgbvTMFZf8BQIPCNEGa4EfOih5bPGHg+sdeNCwHaeO6xzbyVOo
         abOYTAvSWkL716uggjSWcivw2gsSo6ptlrlnWXKQAo+mKWbazMkEH55yeHTZOA8NCTgM
         nLBcJ6HswblQQXx/z8dxsZNlB3bRox1QDstio4YwdYkCr8HIEvZirLyWZLkoFK8tRy8Q
         Ywpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792759532; x=1793364332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dw7ixUsZNlBi2ggGvaFZwX+nWP7PGBtWcR/4kzMhp/c=;
        b=kvNnk1JJq5fdRFGdNebQGgC7q5Z0qxP3L9LUL3H41Yth6fk3qBq/vZiBoiFYGjpoaa
         n0dKED8PrTcleCQwOwv7EZPUJSb5pjlDuNEjMabYepgzXz7C3LDzgy4bYbztjIZyxLVm
         9Xqzkh+s/Df+49IhCw6cb1qC+ZGFZ4Nq2c4DcUiiFr5dQqfAvw2NN8GjnWhsaGKkKTYY
         KzF7Id+sGWe/yi/p3xtqj3XYUidB030oWuXhAmSpJVfUlD5svLFMDnkRZ4hFBW84cWXH
         J5am/hwQZPE6DkBBvdYxtO+xDbckJ1JouoT4CQ4/tz5aQZvy3bGe6vJgFqQzFd7jFxWj
         dG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792759532; x=1793364332;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dw7ixUsZNlBi2ggGvaFZwX+nWP7PGBtWcR/4kzMhp/c=;
        b=Ko62UUFRmnuOBPDw5uyxYp+cR8xaxbdaa7OmYdIFkb0GDVkqQ63yEv8tPuJ+qAyIla
         xK1ObvDyCS2p3MeTN4MtL58zxmK56DvDMRioze6LH7FlhqLzpPXqBJlc0GoFGdQSrPAg
         2Dlp3PfvNZe9vCMDfY/R+bo2hZaBl2XHKzV48M6X3aLhhS5sX/mwLe/t6LMsYLWmKno6
         U6bX/O5EEPNb+bHPLeXkfbMi1waEt+ejq3Zx0lSCbcdVR38Dd/QOsirgFGEAyvuIllcO
         x1hVL6UL5KkWt6BNlHoa3wM6oUlXf+QWfFpdjpGWUAEhXu3XWTiy4EZq7PDSM4gJOwd2
         sdGw==
X-Forwarded-Encrypted: i=1; AKwUvBwyxY4MoPxX54m86PTkOA2yx1MWJ0oqSHt5BMcX1ZPwKi663EpcfAYQdXd80wSsBh0OAcGXcPKXjEUqfSo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIa40xALmlOwsrjYE4oCxNWzHAbId/zhR/Lh7ynIkbjLY3z+l6N
	Ri8y//4YKY8D61RGlEZNQTy8PfqNy2CuFrf0H9IJlcXlsQ8gO1p+ukdAemuiTtxbVCQ/DoQyNxb
	4SUZm6kORw9hStsGzNvtlY3mKJVnJHGfUUfLnKAiFm0ecUjEHL0ks5fSPpz/yTu54Ujt28DHdwv
	ye/lJiUZGsRC0tOMkNR87dTqsknGf611ENMEkFNaPa
X-Gm-Gg: AYBFou1UUwZIzI07ByqytUefWFhG+cQkMFTw+ol38YGHEr677ugbIxMh/4b14veGhxG
	mLNrYx7vUPbtLYj/8PzfS5AnRAT7Wui2U4Dl5/2mGJBZl7rKi0pOfpswzJvOIrRaqPltaRVccBy
	aC+lDXq0xHDi65BC0Et32PZ5DBSX+IT5r1EzCZ+LnBlQaZzz2UjJIEu7dc5EwTQqHnzUdsc3rV0
	89Jrtp7eYP0FJjW0xhEXUH2wFjIDlNSNnjZwa+uR5xK5+QYfk12FiZWW6OnWzc5
X-Received: by 2002:a17:907:fd8a:b0:c2e:46d0:b802 with SMTP id a640c23a62f3a-c46a92ae6c0mr328357766b.40.1792759531910;
        Fri, 23 Oct 2026 05:45:31 -0700 (PDT)
X-Received: by 2002:a17:907:fd8a:b0:c2e:46d0:b802 with SMTP id
 a640c23a62f3a-c46a92ae6c0mr328354266b.40.1792759531460; Fri, 23 Oct 2026
 05:45:31 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1790088067.git.rrobaina@redhat.com> <CAHC9VhQ=FFYVNmQdiMsqg+5KDDrSC3SZS+H2=r_GkhfwQox8tg@mail.gmail.com>
 <CAABTaaBL=TScs8Qqu3b8F6KZPGMyvwy6cBC3teDaBL6MGMucNg@mail.gmail.com> <CAHC9VhROsmzbm+AP63Sm7mqCokgEy6Zu0AVMY0gxp8qY75Pqiw@mail.gmail.com>
In-Reply-To: <CAHC9VhROsmzbm+AP63Sm7mqCokgEy6Zu0AVMY0gxp8qY75Pqiw@mail.gmail.com>
From: Ricardo Robaina <rrobaina@redhat.com>
Date: Fri, 23 Oct 2026 09:45:20 -0300
X-Gm-Features: AclHuK-AKUESe6iHVc-VzwOYib6sgRKlK0BCnAtM6wg5S60Ozyo0oOLLHvDr8CI
Message-ID: <CAABTaaBOrPknzdxc5S6L9hGu7hbFu2e1RZG=Sxjb_B1Cs4Sixw@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] audit: log all six syscall arguments in the
 SYSCALL record
To: Paul Moore <paul@paul-moore.com>
Cc: audit@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, bpf@vger.kernel.org, eparis@redhat.com, 
	sgrubb@redhat.com, oleg@redhat.com, richard.henderson@linaro.org, 
	mattst88@gmail.com, linmag7@gmail.com, linux@armlinux.org.uk, 
	catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, monstr@monstr.eu, 
	tsbogend@alpha.franken.de, jonas@southpole.se, 
	stefan.kristiansson@saunalahti.fi, shorne@gmail.com, 
	James.Bottomley@hansenpartnership.com, deller@gmx.de, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, richard@nod.at, 
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, chris@zankel.net, 
	jcmvbkbc@gmail.com, tglx@kernel.org, peterz@infradead.org, luto@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 1:39=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
>
> On Tue, Oct 13, 2026 at 8:36=E2=80=AFAM Ricardo Robaina <rrobaina@redhat.=
com> wrote:
> > On Thu, Oct 1, 2026 at 6:06=E2=80=AFPM Paul Moore <paul@paul-moore.com>=
 wrote:
> > > On Tue, Sep 22, 2026 at 3:21=E2=80=AFPM Ricardo Robaina <rrobaina@red=
hat.com> wrote:
>
> ...
>
> > > * As pointed out by Sashiko, when you were converting all of the
> > > arches, it looks like you missed alpha.  I took a quick look and it
> > > appears that it should be a pretty straightforward conversion like
> > > most of the others.
> >
> > I've actually dropped the alpha patch as per Magnus's request [1].
> >
> > [1] https://lore.kernel.org/audit/CA+=3DFv5T4826T2sd0Gbh-nfZsqcWK_phdBK=
y4BLWOvDTt92t5Eg@mail.gmail.com/
>
> The problem is that as things stand, this patchset breaks the build on
> Alpha.  Perhaps this gets resolved during the current merge window,
> but as you know we can't break the kernel build ...
>
> https://lore.kernel.org/oe-kbuild-all/202610041836.6TatRQSm-lkp@intel.com

Of course, you're absolutely right that we can't break the build. I
was afraid that this dependency might cause trouble.

I noticed Magnus posted a pull request a few days ago containing the
"alpha: enable GENERIC_ENTRY" series [1]. It seems this will get
resolved during the current merge window.

For future reference, what's the best way to handle dependencies on
other subsystem changes like this?

[1] https://lore.kernel.org/linux-alpha/ataJlL6L7TrS3gWs@z440.darklands.se/

>
> --
> paul-moore.com
>

-Ricardo

