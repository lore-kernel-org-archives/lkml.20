Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793653277;
	b=at0dN6xKziQ0bh4GfdhhphhAtjStMWMXPr2udzzaM1LawlXh7brpdOHFgjsOGCiQz3lm
	 TWGeDx7OZG7JsDIrQdYADmClFtoS95wsXNFIua/pcNxl047YhTbC8cH99+oA3kcOlvMBt
	 r0r5+cJHP7+vgzYrTD6lNRf/6KRUM7wLYvLPOl36k/qN6DPGVWpbIvw2cSdl7ikDSDl6d
	 ClgGt+OPd0+QBj7R3WfpBjAww4Y7U2BC1TFbouwaqVZLYdPVKJPfwvYj72MnbX9AKxMCp
	 cElikhr0yFCDeefhUzNGgchmXeh6Hi9W1Zgl43Ins3SR2nmz+1prTAYb03i+s+Hg/QQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793653277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AzGy7urIpGHew7dVJqO61fkpD1EwpGhPhtimR7hndxE=;
	b=eOJn9ItrZ8PQn0KnlbM1FMPYynKxzHSUtvCV4Uz2RoXEI2b1DuejEwpbsruGz1/83LSQ
	 ESjI+WEkNoiVaDfeIUmDFHgSiNWJWuVuVfRIF0PH64So/RqVWInUP2d1x+8OY6cP2NUID
	 Y1kblH1KrxB3q5IizjeIzbkvZvuWpSdFMtyJwc965aCDp7u9vDCHW81n91zHX1eQKg1in
	 i+Cjl7mfFscvbL/nC3e4Cxl/fOoXYfbLzCIaw9jHyKwyOhS+byoXkohtjEEMSxBqH5ww+
	 RjeS4qLnGJ7+lewsJhvilMScCWOG3cRG+HyFlb7jWPuiv2xFt/bXIZ1is/IoIu+6o9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="IY+K5/MB";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.49
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E49606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74E49606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IY+K5/MB
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7c03a445cb8so2430352137.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:01:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793653276; cv=none;
        d=google.com; s=arc-20260327;
        b=EVcgMfbrE6PKYSZwuqABqg82EMpKAceYRQI+NSK1OJl0R1cmCANR8gL/GHzAvLcvnZ
         PTN4MY/Ac6rIDaf3fCojMPMYAtAo1y9bcCjwVMHoFk7u+SzLVXUZLqxfSZoT3X8Vox6v
         +b5GLoAUMeHAGxg04VRAVXISyw6rDs4zY1VmXYUwr6ghBxB8005BSlOlJiBw6mDWmL/L
         dqcM0OQND+xQ2N6Groxd73urLR6Al4MCkOshQjUgS0siqhHVQjnhJ9oyz8BJi9v4GCbb
         0OeoaHm12/7Ry05bUk/9VaArOB1EAclYOMXhcZVpWRnSCLLoUGMhq8fOypuI9lp9LaPU
         Xoog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AzGy7urIpGHew7dVJqO61fkpD1EwpGhPhtimR7hndxE=;
        fh=a/sTS3cMDDv2+OliztRxc1cmfTPWThn2Igr2nSmYnM8=;
        b=cSVunawyQIJazhG6xy3HHDsTHA5d8Px9WGhVOQN7J4NSULIgDDyfsLdi2gxDJ2/5i8
         xe4+pXuhGiNZnceJ1AehgfM3U8TXJYXh3Zoki/IdkmxLLZAPkrZvXt5e33NbM/N627up
         klOLIN0j1T98JuAYPcugLk3D+EOoe1yXkRu6Kelkf6ZFKZjh0izzyi1F0e16HKPypb4r
         2CWrKNN3cOTi9mTLvGozKUBOHJdM4WV8P3HpJe84MPrSo/V9wTLV/CmXZsd/lowpi5YR
         uqyJKIr7fCUIx3MOdvKEDCKPPXlJ3uN2savFnJQGxGrpU4k3ZQ6/sZEhZlQ+bCpulgQS
         pfCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793653276; x=1794258076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AzGy7urIpGHew7dVJqO61fkpD1EwpGhPhtimR7hndxE=;
        b=IY+K5/MByhAcoYjByg//SwKjCLd7vCyBUD5AVnFYpbtetV6vtXkD4sgYdXY8Wftbfk
         pKtw1qnW+SQ2farNcqPSdjuclT1D1/IAsjncvY15A462e1+/tPCnqNhRsBemKwY+Duvb
         z3vle4ycsu6NzurclTI8thxVBhz6OOWt7cxXd7RdUTonNDCZ8bbj33Z0iDOJgQxE5sgL
         YjP4MtBbY/0WF6rq80r2NIfm8XOJlmu8Jc09xpwIrWmI8DHRfhV/7xx+pCnrJVjpRsdI
         G7pnyiTzNIJLCItK78PpopvclpqMsppDovbdzrPdD1oUIsE0p1mXQS7hA9yqXlu3ipNg
         L74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793653276; x=1794258076;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AzGy7urIpGHew7dVJqO61fkpD1EwpGhPhtimR7hndxE=;
        b=umUtbJIrNBB8GRTA+C5YsusOUYekf3etabCW21bd1Kuh4hKLLAq9ZKId0uZjFe0SZH
         UQRSlagYwKgw5NXo34zokF8LujA/WPl4G21pL1aRgoFdGq4N0VLB2W8xgjvqFIRbQoav
         pO/e+U7KHuAu3nxbW4g6JqSidrekBGf3Mted+nmZ5SYisgIKbvk9jJGT/J8FXSofV2PL
         4r5X46V6I05XLPULcxm04PstW9ePcxRqOJuXmco8qMzum8Vr7/R8LvcPZhGaWzENCH7E
         SfzERmbJ5O3d6VCeeeO9tL6YJLSeeew/Ohq02kfkSnrNZrQBKheBumw5vJUERLv6+Yt3
         ShhA==
X-Forwarded-Encrypted: i=1; AKwUvBxlzu0e2xYm9Rsx7b0PMwCgTR/L+iarfXYYAOBMqk2dQ9uzeSKToF5WsL+1DktKenS5tX5XiyKLmUlgxA8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KovMdHC8iaEKRu2pstgndLPEseCull892lYL6ckZZBuXVOwHN
	nejFIBiWAvoe5V55J56MLpysI+dQNSNX61jAoWMKgjJ/Xvg6MYh8ncQSccn9icEEwwB+h/Uwo3d
	wR+4E+kvHQU5r3+Dwy3dARpjYM3eVmgw=
X-Gm-Gg: AYBFou0pZK8V6fNApOxMphd+W4jnRk4XAloE29jyRyUuBwZM+GKiSAt4ijXZIBLAYCL
	hzyuecVO+2mr0R1Ndmwuvl9Q2RXfcPM7xc5P+iU0fGBjIlZJHY/JUDlfKfqnDxW/OHe44Sk7q5h
	VjuYsBqNlS7psUuEhIJYeOZOnjFN4EVoXk5u4ojkHH+FnzjsSaCsAOvCM73x7BV+iOAojDY0m5S
	XGTqQQa74HkU/s5yqiZz7w6VHMMirpugZBQXwroEIAILdf6TDPihBPtlBJcK7IdKiEpi0noZpfl
	4mvzJxEDgu5AfMAGw135DywYbq2aN2ldkxLDXO1q2bWVvEdnQuZtbf0uRRTxgFnjhS+vQNe1slY
	C99HcDglKL4MocyoDTN6UlvgLDDM403c94Zowb0mYrVg34qw+RajL7BfJKjIB94s6vP0KEpg=
X-Received: by 2002:a05:6102:5811:b0:7c3:b15:a981 with SMTP id
 ada2fe7eead31-7d072c305d3mr5019729137.15.1793653276174; Mon, 02 Nov 2026
 13:01:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260902124026.1774575-1-max.kellermann@ionos.com> <CAOJNxRJ9rUZ4JRwcqEtOPu97D3NNsjwV1mniM6LdNytRYiA54w@mail.gmail.com>
In-Reply-To: <CAOJNxRJ9rUZ4JRwcqEtOPu97D3NNsjwV1mniM6LdNytRYiA54w@mail.gmail.com>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Mon, 2 Nov 2026 22:01:04 +0100
X-Gm-Features: AclHuK_u-vaHTlw45n1B7ztDg1G2EXvymWObtejqyMF3Kk8CGrlA6DuBbpPPY8o
Message-ID: <CAOi1vP-yKSeBwA=269uACaXmmfX+Bpjwk_x_uJNOtRtohH=ybQ@mail.gmail.com>
Subject: Re: [PATCH] ceph: acquire caps for read_folio requests without an rw context
To: Xiubo Li <xiubo.li@clyso.com>
Cc: Max Kellermann <max.kellermann@ionos.com>, amarkuze@redhat.com, 
	ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 6:55=E2=80=AFAM Xiubo Li <xiubo.li@clyso.com> wrote:
>
> Hi Max,
>
> The fix mechanism looks right: a NETFS_READPAGE request issued via
> read_mapping_folio() with no rw context should acquire caps, blocking,
> before hitting the OSD, so it can't race a writer that hasn't flushed
> yet. Two things though:
>
> There is one existing Ceph-internal caller that now lands in the new
> blocking branch: ceph_uninline_data() calls
> read_mapping_folio(inode->i_mapping, 0, file) from ceph_init_file_info()
> (fs/ceph/file.c:262) at open() time, with no rw context. On an
> O_WRONLY open of an inline-data file with no recent readers, RD isn't
> part of the file's wanted caps (__ceph_caps_file_wanted() derives them
> from the used fmode), so __ceph_get_caps(RD) takes the -EUCLEAN path
> into ceph_renew_caps(), which raises the wanted set via
> __ceph_touch_fmode() and issues a synchronous MDS open request. Such an
> open now pays an extra sync MDS round-trip, and open() can newly fail on
> MDS errors. This read also doesn't need caps: the OSD object is not
> created until the uninline CREATE, and this path intentionally relies
> on the -ENOENT -> zero-fill behavior. Could you handle this internal
> caller explicitly (e.g. have ceph_uninline_data()'s read bypass the caps
> check), rather than making every cap-less READPAGE unconditionally
> block?
>
> The blocking acquisition now happens with the folio locked
> (read_folio contract), inverting the usual caps-before-folio-lock order
> of ceph_read_iter()/ceph_filemap_fault(). I checked the obvious cycles
> and didn't find one: a folio that reaches read_folio is clean (dirty =3D>
> uptodate =3D> read_folio is never called, and netfs_read_folio() diverts
> dirty folios to netfs_read_gaps() before the request is allocated), so
> the Fb-revoke flush/writeback never needs to lock it, and the truncate
> path uses folio_trylock. But please document that invariant in a
> comment, since it's what makes waiting for caps under the folio lock
> safe.
>
> Minor: the new branch hardcodes want =3D CEPH_CAP_FILE_CACHE, while the
> other read paths add CEPH_CAP_FILE_LAZYIO for lazyio files
> (ceph_filemap_fault(), ceph_splice_read()); it may also be worth
> aligning.
>
> It might also help stable reviewers if the commit message notes that
> current mainline erofs fileio reads via vfs_iocb_iter_read() ->
> ceph_read_iter(), so the trigger is gone there and the patch mainly
> matters for stable kernels and future direct read_mapping_folio()
> callers.

Hi Max,

Did you get a chance to follow up on Xiubo's comments?  Particularly on
whether the data corruption aspect is indeed gone with EROFS switching
away from read_mapping_folio() in the upcoming release:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3De587a984d332b76ab89fab546f1594f61f73d5f6

If so, I don't think the Fixes tag applies anymore (although it was
questionable to begin with as this patch is fixing an oversight in
CephFS, not in EROFS).

Thanks,

                Ilya
