Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792668419;
	b=M9tG7P8qxLDiyEokeWHnNQ/VA0Dl1EDAFq4KVCrakW6wGVLSpyyNxI1mGoAKh6UvWLMF
	 9K98fC7xsI2VEPyClScXHaiDfaQFdb1TOc2cdhfGuT7NG3802kyIrn/cAc/QgF+RdmW0X
	 avMsV75vIljwoRCby487qX84u1oP1zl3uu3i70wdqFF1MMxnMmpQS+Rmq1XejkaARm45Q
	 CfD+ihMbZCsZIcavmHRjbUYBggNjYrTPDfosomCwF+SVrx8KpJArz1dhK7wmNMStG7e/d
	 MoAuBF2iiQjv9v4WRlo0e4e08OdRXc5JKTiXT1UBkYIPk1SgdZgk82Y9j0HzCFuipfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792668419;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=m2XW18vNW4o1eqMkNJZgcsexX3BdEqPbWYsFQmtVUt8=;
	b=laSIT4SqM3CVn71OD9otOvnVxVJZzfdVEfAgit5vECw5XOWUJW0orTBN1tKe5PeG91AW
	 9KYhl0cwDLt26hbFX/dcQViHbTK/No0lJ6eUj84dnt7ZWQ8uQLXRM9zjm64M+1epLbzwB
	 UG/91d+MoO1yvJBR4Er0X9d7nhcS7ti9/xQDGZzYTB0NCEjOmxBMa7g7ZPGa9+VPOu67w
	 O00z7uuDzqPDUOBil0hX+MJPc9xvvD4ggIab6YYohUJ23h1RB+XZ45SDD8ag+5hD3TEgf
	 KfSjUwjxoDVng+BvidMEUGj6znZ+yik4uemt5Jvsnp1odufLz1dDMiMbQFV8hOACyuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PN3uGCdJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0DC606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PN3uGCdJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C0D01F000CC
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792668418;
	bh=m2XW18vNW4o1eqMkNJZgcsexX3BdEqPbWYsFQmtVUt8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PN3uGCdJxdI7P19DHlNpW+xffMvvBjssKle0WuOyYYL/cJJdoJ9TbEmwSRlCMyOB0
	 J7VnHtiGw29voyaEhFmjar/xxfwqgbQXDKFZjWr7QQsCosBB2syyTyM4teDufVZS1Q
	 TxjJj2mnSylQWvIoC9n03gWbyu/E3WBQJf5uhI+zy5InWLcSnfy0U/OIPPtXCgTmC1
	 BL4DipFoeD0YW4tyIXAGWGxN5iSDJVvD2gJjChBfVD+1Kh0eGSsUO73B3UT9ru52pf
	 KMdBFcvRtSb552vdLFGXD1tqtqEHHYXDy42HKj6DW03H1yTJZduH5qWCjbxF84OXtd
	 GdxviGglTCt2Q==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso1429900a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:26:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxpsGof9WjdLX9FveMX6FZMCVv3vMnL0ksfGL0ibUDVDP3NvZYCh2MNJL2F9F9dfPDw31UFTLFdTSBSH2g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZu9FJLYOPvofk8pWAG5nn6lCJvulYbTlzxThhuObalRIoxfLA
	hPZuVmTV/VE4hROLUuOqq9X3swGPE6pbrLf9DjRJg79ZnAuxc62cPy5iH4hsc/1P6aW4g8P1Dya
	d+lx+m/O0p2/6Mabxjc+R/8HD+VxOivI=
X-Received: by 2002:a17:907:6e87:b0:c29:4b57:503e with SMTP id
 a640c23a62f3a-c468d5dafdbmr240442766b.1.1792668417000; Thu, 22 Oct 2026
 04:26:57 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260928012812.2890035-1-neilb@ownmail.net> <20261021-sodbrennen-ausdruck-kurven-72d0b7cc7db9@brauner>
 <655e5d4f-7890-4956-88d2-cb571be218d6@talpey.com>
In-Reply-To: <655e5d4f-7890-4956-88d2-cb571be218d6@talpey.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 22 Oct 2026 20:26:43 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-_WQTr_5zNLjrp3Q1+zBtRNTFYkvMpC6RpDEjY0xi=zg@mail.gmail.com>
X-Gm-Features: AclHuK8zNS3wgHEO5R7ujwkr3nixmETTfEc_4BRtiMijOW7Jer_U3sEFhzfjwKY
Message-ID: <CAKYAXd-_WQTr_5zNLjrp3Q1+zBtRNTFYkvMpC6RpDEjY0xi=zg@mail.gmail.com>
Subject: Re: [PATCH 0/3] smb/client(cifs): prepare for locking changes.
To: Tom Talpey <tom@talpey.com>
Cc: Christian Brauner <brauner@kernel.org>, NeilBrown <neil@brown.name>, 
	Paulo Alcantara <pc@manguebit.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jeff Layton <jlayton@kernel.org>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, 
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 12:32=E2=80=AFAM Tom Talpey <tom@talpey.com> wrote:
>
> On 10/21/2026 5:55 AM, Christian Brauner wrote:
> > On Mon, Sep 28, 2026 at 11:25:01AM +1000, NeilBrown wrote:
> >> I am working on changes to directory locking.  The medium term goal is
> >> to lift d_alloc_parallel() locking above i_rwsem, so d_alloc_paralle()
> >> can be run unlocked, and consequently cannot be called when ->i_rwsem =
is
> >> held.
> >>
> >> The requires:
> >>   1/ that d_alloc_parallel() not be called while i_rwsem is held.  cif=
s
> >>      does this in a couple of places.  A new interface d_alloc_trylock=
()
> >>      is now available and can be used instead.
> >>
> >>   2/ a dentry must not be d_drop()ed while an operation is ongoing, as=
 an
> >>      unlocked d_alloc_parallel() would then be able to create a new
> >>      dentry with the same name.  In particular d_rehash() must be phas=
ed
> >>      out as it won't be safe.  This particularly affects the mechanism=
 to
> >>      block lookups/revalidates while an unlink/rename is happening.  T=
he
> >>      mechanism is changed to use one similar to how NFS addresses this
> >>      needed, though using the new LOOKUP_PRIVATE flag.
> >>
> >> The patches depend on patches recently added to the vfs tree.  I would
> >> prefer these land in that tree too with an Acked-by or similar from ci=
fs
> >> maintainers.
> >
Hi Christian,
> > Can do, will need an Ack.
> I will defer to Paulo for the Ack, but for the series, modulo my nit
> on DCACHE_BLOCKED:
>
> Reviewed-by: Tom Talpey <tom@talpey.com>
There is a v2 patch series. Please make sure not to pick up the older
v1 patches.

https://lore.kernel.org/linux-fsdevel/20260929024352.1433257-1-neilb@ownmai=
l.net/

Thanks.
