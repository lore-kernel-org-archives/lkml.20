Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792425953;
	b=xffbAR1Vf4Lle8IoHDt6nf6RzMMtYfLC4a0Mw7CFj8IB15FB/3H4o1XHb/FA2vkEA1SS
	 C9BJmTkLqHv/iTQ4C3Ql2cz7MWduMShEgmjiMYfxnN4mjYc2qdjGvmsYjGauLAwOM0c1/
	 Xvf0WZuyLcdJyhtF79pjD8D5A5Ul/fkEL+rpDYPMzTlVMRq38QOzIUc7YnW0pMyiMpy2J
	 7o6v3ip+0neqG/ZaUUzW4LITexQ/ezTVhfa4HICo2jhbeG8dQEB9Y5+uLBwptyrlejrZV
	 PCptqpOq4u0weiLooPr1Hqz5Y/p/sm4I8v4XU/txdjMjhIWG7GDqhq72BgrEY/FqmHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792425953;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=rJCzmqkUyBuAMTS2sRPCTNp4WMacGY+Q2zZ1Nvd28kE=;
	b=xJs33+1EFQLx3jij1Zwm6tvH0f1RtEpBJG011OQxOizabuMS+XFloh6mw+XmIS+sl6AM
	 VYMKPuVwiYecWDZ7r9lzJvZXKioZj6wAHvs5QX/g2lDLqYgUSbgyoEfc7WKOVBBexo91k
	 QA3GgRxhjUR5DwwOKVj0HPe8YlBzXIIDI/dB4MdnPxwYnPe3ehtp47BtYBR4iQUZfZREz
	 Hto2fKlEDT94i19HeC+5wLMohOXPdzBorwX55/oijXsfbsk2hbKe0iLAZeZ/ypQv/mxvN
	 ngiP4tVXxUgUHlidb8L8BCr9zm1xg24+I+Bt1GPfYHfIeyK3Acg96/pjvz5nP43p0Zw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZhkZ589G;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=p7w3l47y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD7A606AFA4
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:05:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AD7A606AFA4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZhkZ589G;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=p7w3l47y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792425951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rJCzmqkUyBuAMTS2sRPCTNp4WMacGY+Q2zZ1Nvd28kE=;
	b=ZhkZ589GocQhHDLdvfJ1HLCmqw11GB9zFkInoNq/jcoSJwc2H8RgqRk1VW5zqszcyQmrWu
	GWyphpKCSzgHLZ32z/UTkjx8mhB4yvEjbn2+kCvNIKpWj9UwBNzlq6JKgLTu5jOZQ7f2xF
	Nx9hC3+qKx40htUfCHCbsFGylDCDyVA=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-CeIjVN7tMu6jKN3IHF4llw-1; Mon, 19 Oct 2026 16:05:43 +0000
X-MC-Unique: CeIjVN7tMu6jKN3IHF4llw-1
X-Mimecast-MFC-AGG-ID: CeIjVN7tMu6jKN3IHF4llw_1792425942
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc0418036bso170044137.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:05:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792425942; cv=none;
        d=google.com; s=arc-20260327;
        b=N6+VAao9XwYA+6b28N2MWwFvNviBNh/9u0KHqQ2GFmAFkS9GejKRhFEt7U7TSyDkYO
         iiyJo49oSvF5uAUb/Y+8V0NAKBm/mHALzUbyncl6ayuHegl34IyGMc4lYfouYu1EtSbA
         3IbAOfnAwftOiks6FVr12WqFTeEslOTP7/QPSNFmRIpW2Ntl8qP2bel0SZpIMdh/df9L
         /O1tLY7VNbtr241at530neaLUoswSK0hEgbe7I/DQ/JIqJGh4Q77l8lYuQl+O+8M41aj
         YscMIEGbm5KCtAWL1LzKPRF+FngAIYPKXlC80K2+CNcLO6nFz7O+tVRINfeUIhWwIOeK
         1Xsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rJCzmqkUyBuAMTS2sRPCTNp4WMacGY+Q2zZ1Nvd28kE=;
        fh=xHGJwASXBfmcwd7+Ak/DZKFbRrPtzyVLEi95EzKxkTo=;
        b=qNG7asQwAK7ducm2c+31/z3ZSHAhkG3K+CJQGmx1wEk/hJ78DAVha9xigovdF5jjI7
         OspbgxdFDr7levBHTGrMPw3RjxQFPjsPu992YsA4DkKVLwz6dD/LY/UruGSM8uaaHX+K
         W0CmM8w1hnkqSSbyw71YePIeKH5xv0pBGnFufcaQ6xbFQD9zVxp2OlpVkH7oP8j8hf9E
         4amQF1fD4eaYXigBRQ1wKSHjzJFgXwj5MN2YnBvLL2C5/xIGfT6xuUNrKUoeSoVy1ayc
         qSyVYdRge7L5SGQfgypMHfpBGvY/UczY5dnFFCBd7iki28IX8mMKisLWJq73NsqC1UVq
         y09w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792425942; x=1793030742; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rJCzmqkUyBuAMTS2sRPCTNp4WMacGY+Q2zZ1Nvd28kE=;
        b=p7w3l47yyRW55YfMqlNOH87cD1yw0iklbf5fRZyOnaET1x0v93WzI1df4OKEBnXjNF
         FEacgH0Cg2wcEtKtQd+AEjmxeFbhhOYRC+7imrucDnOy6zIcDOzyJkCj3o4urQHRF6WD
         NS30ZPMtVozwYFnzzIj4FFOYfGF/CPcML5ak3nuyjQx2fYZd/cvLWnVCvtTqJGwO4xJs
         3xeWbHxw+xwNgNNspLvG72RuMr0YTFqqoe3VyaQ5LfT12IE+ycZV9efI5111tl/lsF+i
         sLR5BQvvXCz29W1x4xupMxtQ1ozTyv1j4zQKEUA0jf/vzHQFPRVgh1PhdaNEhZA2+nCa
         6t5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792425942; x=1793030742;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rJCzmqkUyBuAMTS2sRPCTNp4WMacGY+Q2zZ1Nvd28kE=;
        b=D1aaI/9PW93ifZ67GfbljuoZwsvcEJ2Me6Q2pPiWZ6f0pjJmedmQZltRdtITMZgKfe
         +zo3LBjSIDXNO9jGebbQ0hJXO4bWJ3wfKezlou5VQ1yf5UMVEsLhRyZL6X/HrNgnEt2H
         /xJDlO9N5ObzQkKj2c79R05V1U9B1y92lVoEh7SZCl5o5TlrXRIDUdt/koZQLbo0YL3l
         rTnfIwHYUmkUG/+d1nrw+CF/kFUyNTFPLYNdda4T0ZMw0bfn88oyzLe4wDQh5MkqUlL6
         D5EvU9q2+cjl1D/FGpKaWH4jAR1W2vp83+Fv968uFd0A592SwYcAycU0dIh1LIU1WaXZ
         E+Aw==
X-Forwarded-Encrypted: i=1; AKwUvByNXrvZEg3hu/NsHqcVrb/UQPIWRqtTvGD7s824y93Taw/7nrZMa0aPTIXI0lPOxA6n4RhrEQ51wjMyQB4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK03NOD0PbbqaclOPclCVpxnaU5aIBsoH8ZKX2ZvIT1+0oDfbLl
	C5ZqPSac0C0u7sobGhV4RJObodgxfevDXsdiOqo6GM3+Gps4ggH79CEIVcauVQawyaZDNHVf1Aw
	hEU33955oPQ+DjXluQVlXvPb3tFw46Y/qofhkEw8olV+Kt4pFSJXeEcBQUFWutEzKQRhJtGXphj
	5F9HpclGqJ5KvTOhKvzzUwLSK3nvsnaHLpTwr8Vrm4
X-Gm-Gg: AYBFou071iohNHcAsqSY9I2L/8JtxMPx4UC0FrPq2fVHJw0Ui+EhVq+GkL4ThPQ5iVX
	t6n30EPn5okUnbCSpToD25TS+tyf/CPyMHpt6Xzex2CbRVi1HSafuIxEneHYLFUxbBrfJuh4VXy
	5wMMLCzfUMOCJTyTmkuoNyudICNHatuITxmTVGFHMmW6gb/4935UkqYPc1PC2OqSuqPqL629+AZ
	QfCm/+xiE9H41L7tSFg/7D/OnpQmf/LlkZPb8lzafMHBbkRE2gkt/GLJ8b7lhHn548SOFEO8rIR
	C2iAt3NDkvQvJ1scDHcQf44eMA==
X-Received: by 2002:a05:6102:5249:b0:7a7:19aa:f0d8 with SMTP id ada2fe7eead31-7cc36b48339mr1807108137.37.1792425942307;
        Mon, 19 Oct 2026 09:05:42 -0700 (PDT)
X-Received: by 2002:a05:6102:5249:b0:7a7:19aa:f0d8 with SMTP id
 ada2fe7eead31-7cc36b48339mr1807101137.37.1792425941758; Mon, 19 Oct 2026
 09:05:41 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <a01d0a297a3e174d21741a3ad586ce546327603e.1792081664.git.amarkuze@redhat.com>
 <20261015183548.GE2170687@google.com> <CAO8a2Sjr6XSizdgobZK1ZAO8PUd5tCDFKjdD-=3TXHwqOU6qfg@mail.gmail.com>
 <20261015193800.GH2170687@google.com> <CAO8a2SgiFTarbcg-qgTLgjk1RsOMLwHsjj9ko8HgT99F1DAYrg@mail.gmail.com>
 <CAOJNxR+zWN=UPKf5NcZDHDsTghu9XHuQuWDkTaHjA1j2rU_42w@mail.gmail.com>
In-Reply-To: <CAOJNxR+zWN=UPKf5NcZDHDsTghu9XHuQuWDkTaHjA1j2rU_42w@mail.gmail.com>
From: Alex Markuze <amarkuze@redhat.com>
Date: Mon, 19 Oct 2026 19:05:30 +0300
X-Gm-Features: AclHuK836x2QCsZgOmWJBCRabmDFLxRa7Rbm7icXR-nKnFjpLVPX_8WeuZ5WW8U
Message-ID: <CAO8a2Siubo8Dnj+RnQLf_AUxhJMuuE6d5JLu=OUjmnT0GJJcCg@mail.gmail.com>
Subject: Re: [PATCH] fscrypt: allow filesystems to disable symlink target caching
To: Xiubo Li <xiubo.li@clyso.com>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org, 
	"Theodore Y. Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, Ilya Dryomov <idryomov@gmail.com>, 
	Viacheslav Dubeyko <slava@dubeyko.com>, ceph-devel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I''ll resend a combined v4

On Mon, Oct 19, 2026 at 3:56=E2=80=AFPM Xiubo Li <xiubo.li@clyso.com> wrote=
:
>
> On Thu, Oct 15, 2026 at 05:46:24PM +0000, Alex Markuze wrote:
> > fscrypt stores decrypted symlink targets in inode->i_link. The VFS can
> > use this field without calling the filesystem's ->get_link() callback.
>
> Agree with Eric that this belongs in the quarantine series, with the
> ceph_fscrypt_ops hunk folded into the patch that adds the ->get_link()
> check.
>
> I tested it on top of quarantine v3 with a KASAN/lockdep kernel and a
> v2-policy encrypted directory.  With v3 alone, the only access to a
> cached encrypted symlink that still succeeds during quarantine is
> readlinkat() on an O_PATH fd opened before quarantine, with an empty
> path.  Path-based readlink/follow/lstat and readlinkat(dirfd, name) are
> already refused by the lookup checks.  With this patch the O_PATH case
> returns EACCES as well.  Please describe that case in the changelog,
> since it is what justifies disabling the cache.
>
> Only the two writers need gating (the kmemdup() in
> __fscrypt_encrypt_symlink() and the cmpxchg_release() in
> fscrypt_get_symlink()).  If i_link is never populated, the READ_ONCE()s
> in fscrypt_get_symlink() and fscrypt_symlink_getattr() already see
> NULL, and the VFS reads i_link without looking at the flag anyway.  A
> writer-only version behaved identically in the same tests.  Please also
> update the fscrypt_symlink_getattr() kernel-doc, which still says that
> targets are cached in ->i_link.
>
> The cost is one allocation plus one decryption on every readlink,
> follow and lstat of an encrypted symlink: a re-read link went from a
> single fscrypt_get_symlink() call to one per access.  That is probably
> acceptable, but the changelog should say so.
>
> Thanks,
> Xiubo
>
>
> On Thu, 15 Oct 2026 at 21:45, Alex Markuze <amarkuze@redhat.com> wrote:
> >
> > I didn't want to conflate fscrypt patches with Ceph features; arguably
> > two distinct patchsets.
> >
> > I will CC you folks when this is acked then.
> >
> > On Thu, Oct 15, 2026 at 10:38=E2=80=AFPM Eric Biggers <ebiggers@kernel.=
org> wrote:
> > >
> > > On Thu, Oct 15, 2026 at 09:52:11PM +0300, Alex Markuze wrote:
> > > > Hi Eric,
> > > >
> > > > This supports the concurrent CephFS subvolume quarantine series.
> > > > There=E2=80=99s no Fixes: tag since this isn't addressing an existi=
ng upstream
> > > > regression.
> > > >
> > > > The quarantine series adds checks to Ceph's ->get_link(). However, =
if
> > > > an encrypted symlink target was cached prior to quarantine, the VFS
> > > > bypasses that callback entirely when following or reading it. While
> > > > the target data is still valid, access now needs to be denied.
> > > >
> > > > This patch adds an opt-out for symlink caching and enables it for
> > > > Ceph, handling the encrypted-symlink case for the concurrent series
> > > > without affecting other filesystems.
> > > >
> > >
> > > That series wasn't sent to me.  Is it
> > > https://lore.kernel.org/r/cover.1792074165.git.amarkuze@redhat.com/ ?
> > > It would make more sense to add this patch to that series so that the=
y
> > > can be reviewed together.  I can potentially apply a prerequisite pat=
ch
> > > by itself, but we'd first need to know that the rest has been reviewe=
d
> > > and will be accepted too, otherwise it will be unused code.
> > >
> > > - Eric
> > >
> >
>

