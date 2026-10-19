Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4952635C1B1
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792414602; cv=pass; b=ewowKj23l/rh1gwm8et2pWzaUTG65OU4kXT68c9J46oElO/3jJMi8bQuaKr/0XeNvSVnf7n89wMkSqPw4FPN/i9z5dKWxNeW+a5k8hysPQXef1FMGISTykLrOKyg2iAHC9HGC3uN2fT3IM8BJ9so0NTmFS2y8UXbb5Ljsoh+nvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792414602; c=relaxed/simple;
	bh=vAgzI0iplg/XqWWtYAni1GCNMLi7Ggs/EbUO3M+2rBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CGA+Ez+hvZbkCeKiq9JEeaOqrmmdmnefLo6qtylcUaXTWxw9jTDamSMEUGh7cTYyFMIj7iSg7blU7RDs2ynruAPIbPwvmo0oVXmtH39rmm1HFw2bDdSlQ0MxJ5n3iJ8b1Ru0Jol03+r/fbmq1DB5j1DBOMOEG6MXxUhFx8KwGyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=clyso.com; spf=pass smtp.mailfrom=clyso.com; dkim=pass (2048-bit key) header.d=clyso.com header.i=@clyso.com header.b=FGxWxned; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=clyso.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=clyso.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=clyso.com header.i=@clyso.com header.b="FGxWxned"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6af9a9451daso2976562a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:56:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792414598; cv=none;
        d=google.com; s=arc-20260327;
        b=WEaD1UYgFGT/ORShdL4QhyDegLX3PVbjkT/gnggjiI66qrLG32RfoIzPdITQkhZtkt
         gmKEHhF2X8ThYn+sNn0wYXMB/d+59mIroKjn1pe7t79HJgx1RMKUv02NhAKw74yNUBaV
         Hr8crYF+obGbfsDzSHrLbkRFI8KgkOwPgxXT81UOlSEIaPCK64GxDhPHnmUy/LvVrsbo
         PCMUuKdIMgr3Wweqd07fwBOqUivLEDAF2bYpPG9vmvD3kmTO5ftJ5mNs5Nv6hE4vEPkB
         tlb5DpJ/mDWwC9mHe7NX2oItPUkRTpLRSsNfdNeaR7x+6i0Suqb2aCT21tLq5n2OdQHQ
         tUCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n3JjqP3LoG50YyWAVsfXppKDfSv9tlf4tiMRRF9oVbo=;
        fh=625ocqbO7LkbJ9iwkKc+55HUsKvUHTUKZJ+gR0/igk8=;
        b=KPJgjVT2iQvhaxoDEtmkcktyJxrVXdkK5rSN48TxOihK94aq2wch8+NrBjpZUwRtkP
         jm6kyVzYZAGJHz4g94Ic3683ZXsCf/b6lHIO9jB/ogN96P6COJQyUbWfEBus3IC77fPG
         t9dPGe/CrynkS3hARA9e/73Sv/TGppUcgvgckyTNkBfyrA6wysDsRNfwtLpOZxIed+Gp
         79IiIXvWKP1uBFR2vK2SOeAlVgdjj7MDRV2mnJR6bC0CKuXJF6hetdFbZv5gd/4qi9Rx
         MEjmgfs8cp11r5b3/it855jwOkdekR9kbQV14/Nlx3/WeFCs1eJTv7XRF9NSwJ+s/lf+
         Apgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=clyso.com; s=google; t=1792414598; x=1793019398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n3JjqP3LoG50YyWAVsfXppKDfSv9tlf4tiMRRF9oVbo=;
        b=FGxWxnedQmSunTw4KGa5ev1tC6I2tf/aO2ewREPVFI7t0anxDLKgOdp+zcXGs9prvL
         MdbGUW8JW0sIp3K3Y2rrRQC/8oN2rY9aLGmFNjrFEAOixoNxvzPIr9VyXnoOZz0Rrx3n
         C3Km/pV1rW9xqT0lcNRHPeijjei5L1tKpTExszOOOA/wN9h0bw8i4KC+kHiL90OFsmvZ
         eiT2oQdHk9prCC+OpgK5N0tmxLz2B1A3KwQg431aOnSQFVFUAkDdONG3EPbGCmZy/wpe
         KP3YTzZ6BFyhEno6w7oNjWPgLh5oEYBKioqvTdAbCeu6NMXgmLNz0t9D3PqaK9/YgpNN
         iRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792414598; x=1793019398;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n3JjqP3LoG50YyWAVsfXppKDfSv9tlf4tiMRRF9oVbo=;
        b=MYhUcx5WcgGuo8PF6oDjvQUYc7F4f+qaqontM4mxy4PARyxq2T2SYkEoUPaxY8wHbF
         gXYhBqCLUrfyb9Sp4wH/WZ6w1c3L+zMqGTVaTCdel2Fope1cDP6kcBrvguxhU+DP0vuf
         8vxjeRzGx2OaiDVcoUoIHNKf4J3T0elQ8+xrHsjsw21Lkh98btc8iXbYJQYwVLHT86l7
         N+sQ0qrudV+E9Ks9JH1lGXhnJ7Z2VEgmRWgiqEMKEN/czZ2RCIux8C9E8vONW3AHl/NI
         RmaJHd6zV4L6KurLy4PMD4kffVVmrAsTOy68Tzr534WDG582IxawS1QJ7rVYeGwQsBG/
         tifg==
X-Forwarded-Encrypted: i=1; AKwUvBwizk4SBB0jBosfWDPd2ZAcJA+JdQ0ztjjYEWd+0yQ3/v6pgMBZlRLYpk5JGz6v+nmic1sLs+7+nYzsWeY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqJei350swxlnsF5yQ3SE87T9H0uBjrwa8oxH2ycNVtHkDVZkh
	+PbuB+LWE57QvxLQk423yn8S3HKCoxvvIvrn6m/QY16ZNyBPWCMzSy/XeQCsLH0Nb+Hc+RVwZ1G
	F/tpiqCexDW+qi6i566qKQrEeOdwiM7SWeyyyR3smhA==
X-Gm-Gg: AYBFou0VpVukV9VcNDzDP70U+lkW43MNGwD7AKXIe8c53/CYg7HeEfakAq4YhLQO1OL
	VZSpFHf4oaLhskxsGlZUzfJiGCrI/3f9k9nw/+PCyzYVReKs1ys65GB8cHg+pWkhW2bVE7gxWVx
	TljkxZti0o0TGiKNVjw/1hZBtiqmZZrnXesITXTMJbt7gTKHbLPZJmKRf1BEKTW8Di/pp2MEgBx
	bXhptdYo0+qe1GqozOluwuXcSwkb6UyV9u9m9wO3oa3unCl3pNMDkOpZojSydYHAPUkh3llmc98
	DMmm0wyZ7UgNWBxLT7ScBi0dtDtPr3ipBdwZNZrVZePbcaQv03g7wOrWuA==
X-Received: by 2002:a17:907:9613:b0:c2e:5efe:f1cb with SMTP id
 a640c23a62f3a-c419d05e727mr580195966b.8.1792414598397; Mon, 19 Oct 2026
 05:56:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a01d0a297a3e174d21741a3ad586ce546327603e.1792081664.git.amarkuze@redhat.com>
 <20261015183548.GE2170687@google.com> <CAO8a2Sjr6XSizdgobZK1ZAO8PUd5tCDFKjdD-=3TXHwqOU6qfg@mail.gmail.com>
 <20261015193800.GH2170687@google.com> <CAO8a2SgiFTarbcg-qgTLgjk1RsOMLwHsjj9ko8HgT99F1DAYrg@mail.gmail.com>
In-Reply-To: <CAO8a2SgiFTarbcg-qgTLgjk1RsOMLwHsjj9ko8HgT99F1DAYrg@mail.gmail.com>
From: Xiubo Li <xiubo.li@clyso.com>
Date: Mon, 19 Oct 2026 14:56:25 +0200
X-Gm-Features: AclHuK-F8mSSChjPrw3xtMipa7gc_SbaF2GeoOUl_trF5qnqBrun_SW2oyz5b9k
Message-ID: <CAOJNxR+zWN=UPKf5NcZDHDsTghu9XHuQuWDkTaHjA1j2rU_42w@mail.gmail.com>
Subject: Re: [PATCH] fscrypt: allow filesystems to disable symlink target caching
To: Alex Markuze <amarkuze@redhat.com>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org, 
	"Theodore Y. Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, Ilya Dryomov <idryomov@gmail.com>, 
	Viacheslav Dubeyko <slava@dubeyko.com>, ceph-devel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 05:46:24PM +0000, Alex Markuze wrote:
> fscrypt stores decrypted symlink targets in inode->i_link. The VFS can
> use this field without calling the filesystem's ->get_link() callback.

Agree with Eric that this belongs in the quarantine series, with the
ceph_fscrypt_ops hunk folded into the patch that adds the ->get_link()
check.

I tested it on top of quarantine v3 with a KASAN/lockdep kernel and a
v2-policy encrypted directory.  With v3 alone, the only access to a
cached encrypted symlink that still succeeds during quarantine is
readlinkat() on an O_PATH fd opened before quarantine, with an empty
path.  Path-based readlink/follow/lstat and readlinkat(dirfd, name) are
already refused by the lookup checks.  With this patch the O_PATH case
returns EACCES as well.  Please describe that case in the changelog,
since it is what justifies disabling the cache.

Only the two writers need gating (the kmemdup() in
__fscrypt_encrypt_symlink() and the cmpxchg_release() in
fscrypt_get_symlink()).  If i_link is never populated, the READ_ONCE()s
in fscrypt_get_symlink() and fscrypt_symlink_getattr() already see
NULL, and the VFS reads i_link without looking at the flag anyway.  A
writer-only version behaved identically in the same tests.  Please also
update the fscrypt_symlink_getattr() kernel-doc, which still says that
targets are cached in ->i_link.

The cost is one allocation plus one decryption on every readlink,
follow and lstat of an encrypted symlink: a re-read link went from a
single fscrypt_get_symlink() call to one per access.  That is probably
acceptable, but the changelog should say so.

Thanks,
Xiubo


On Thu, 15 Oct 2026 at 21:45, Alex Markuze <amarkuze@redhat.com> wrote:
>
> I didn't want to conflate fscrypt patches with Ceph features; arguably
> two distinct patchsets.
>
> I will CC you folks when this is acked then.
>
> On Thu, Oct 15, 2026 at 10:38=E2=80=AFPM Eric Biggers <ebiggers@kernel.or=
g> wrote:
> >
> > On Thu, Oct 15, 2026 at 09:52:11PM +0300, Alex Markuze wrote:
> > > Hi Eric,
> > >
> > > This supports the concurrent CephFS subvolume quarantine series.
> > > There=E2=80=99s no Fixes: tag since this isn't addressing an existing=
 upstream
> > > regression.
> > >
> > > The quarantine series adds checks to Ceph's ->get_link(). However, if
> > > an encrypted symlink target was cached prior to quarantine, the VFS
> > > bypasses that callback entirely when following or reading it. While
> > > the target data is still valid, access now needs to be denied.
> > >
> > > This patch adds an opt-out for symlink caching and enables it for
> > > Ceph, handling the encrypted-symlink case for the concurrent series
> > > without affecting other filesystems.
> > >
> >
> > That series wasn't sent to me.  Is it
> > https://lore.kernel.org/r/cover.1792074165.git.amarkuze@redhat.com/ ?
> > It would make more sense to add this patch to that series so that they
> > can be reviewed together.  I can potentially apply a prerequisite patch
> > by itself, but we'd first need to know that the rest has been reviewed
> > and will be accepted too, otherwise it will be unused code.
> >
> > - Eric
> >
>
