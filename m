Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B210484889
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790716522; cv=pass; b=b3NU7VrO97yZYiKEQlU7pEDg6DEXmWnJ4D8Il2MPtqoHuNlajhxf6EY5EcNk22yOLd0sHZcLHlwe+EkIWfPiSF4KwhZ7HIaWff3COTO64wzNITYQ98PvZl9UqMnPyWzYzegMjVlgdEBhvfsJEcNomiZqX4DPxJLL46n6jG/0RV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790716522; c=relaxed/simple;
	bh=N0Dp988DA5FrqQKAGAPeuZua2WfO2cuDyzKra12FUPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LpLl5JvR0zVNO9s0+BOBiXHBmgMm2xNzHZ9zrX29DWWuSEQ512USUz5S768XO6K07L0i+GL+H6sNj7w4U5cN2BGDNO5U3yy/UvO8Gd49Br06h4N7RitjoLOVjWHXeQ2Wn94UecvoHQ/Pbnrn6pXa5VvpAsNbs82UIJPEqkdgoAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WxKTWzOa; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=e4HnSqW6; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WxKTWzOa";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="e4HnSqW6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790716516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2FSuhGLAGqzfcOIaBu8CiLsYRpspmlLc9U2mEqKrqN4=;
	b=WxKTWzOa72ufoGIZOIDJvl15a92bQErKPv/urMgGUY9kYSH7m/ZOlYRaw/Z49syviDlzUb
	zhoUl3/imcfpOTxHntO5ssnHVd9YGX3l2dfzSFUIRDaMoGL6kXKVeLXspYC4ojaxUR3f7o
	qiZZeBBZiI5Sc7f4+OXcPLf69oPLick=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-ZwOLZSHrNymYmZbcOF8U8w-1; Tue, 29 Sep 2026 17:15:14 -0400
X-MC-Unique: ZwOLZSHrNymYmZbcOF8U8w-1
X-Mimecast-MFC-AGG-ID: ZwOLZSHrNymYmZbcOF8U8w_1790716514
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8200c815489so70821777b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:15:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790716514; cv=none;
        d=google.com; s=arc-20260327;
        b=L+t3kUlkyBaOPDdxg3sNnP29awlrQe/SfofhJXpZTbbAuZDUGgWlOIP5UTjR864nJF
         aQFdNdPgXt2maijjcM+WoHKFTtwbkcAG+jLdgLcJmt4pCiUN51ymkOagoWIIoZUgWGsS
         bVjsIbQSf0e8MY4f5MePxC+T5jpvthPVIiZxWLbQo9MYsXsECn+QeePkxbXnF8I50gC+
         roDutvY8IYEFHu9uCD9CgVRHaDvBZIdZ12g+TlsFxfAsAJXmCOLmqzZJzt0IZE+L9C+e
         08+VqeuZpnCcbGrb/SPKUbORlhVziwP4wpYa+0CxNgSGsUkwmNhq8WaP/g29BYZZgF+S
         /tdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2FSuhGLAGqzfcOIaBu8CiLsYRpspmlLc9U2mEqKrqN4=;
        fh=PJyX3x/CfzqgoiIIYHaJl1UsRgtPgdfCNz8m2RjSy5g=;
        b=S0RPqhFBj5qz9rZkq1x6P1oXTm+StpIQ0Mxukqze+9SJatsdCKsSpE87KDDtBfzFhT
         3DhNra72JMbYlwFh04V8E5wKq53WLGDCamfoknHjYy0XOVqhWX2GRLl+wgkKhye02MBM
         g4laApjNvOVZMEfENpHA8hRn49Kc81bSSUMDqsPVey6iXuOcb7Kj3Ehajxan7/qjqXI2
         v4ei0FB9ye66+NJFMruptxrviDUEG50nNR1599BIjXdPD/DX/G9xObGTYH5gzxyp0cRe
         vHDheBGVHaNElMoZu+9KX6IORy7W7OghVtLoke5vlIDOOmtOUAfsVK5L1djJb40aw+/W
         0Q+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790716514; x=1791321314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2FSuhGLAGqzfcOIaBu8CiLsYRpspmlLc9U2mEqKrqN4=;
        b=e4HnSqW6orNhRpzA1tPsFNsaaDh2ZLjfDpLIgJPo5l41x7dmQgfG+T7l/nZdxpIEPI
         4t0O6iJexA92kVqw3L3AAjU6I5sYnSCi6sTZ6rAbImD8ux/JZrixJDQwhkHVUCDt6wvi
         zViehRS83+ySFxuX3SDC9gWfBd42vonKzsE/uwTVkyCHCpNc1kM3b3l1sRynpUQ7m81q
         Z48ZrLB489Hgm+gTaw4SK+tdraFHQvSJAsSUuJ01Q3DJEZXQCTskr/HQDCU6K6RMM4MK
         2gTtwe68jlFFPq5Z3fWcCuVUJ2drp5tCigu512tOOvDvlcJcKRBYA6aBJUCy1uPrLwe1
         i5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790716514; x=1791321314;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2FSuhGLAGqzfcOIaBu8CiLsYRpspmlLc9U2mEqKrqN4=;
        b=Ebyw6JwX9DzvC0+H9HZLndnN/Hbg1XVEGV1btBD2tg25gImg5vi4AFWnT76x9zY8jt
         vwAXqaW0s8DafAxg1QfhxtrFgjnB8xEe8AVubrb80WxwbzyTAG4Uf689kmyIdI8nQS9I
         wcT4JkjmeNeiS+8Z7GZB+OStWvj0luk4TuIvMwVQlTcsVKCl2h+kdOmwXm8AUf4fsGvt
         VJICqD307Bkf0+M0Lh7jF99bg4XpZvi2XOjPj2GzR4u23BtCH7yhdIS6hCxr+fRNd88I
         eR58sFsMFDMggC6hCigoc/3vSTaXkCQ1fd7S5Q+qn37VqYeMjppsG9gO1jMUcV1y9JfO
         5ylQ==
X-Forwarded-Encrypted: i=1; AKwUvBwubJlWAMeox03KHsy2O536rQjxPSLxdd02rWbaqVfp1UCJQZYJ4R2cq/L7Mx6+qwBD0yfuavLYspA0mXk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLK56H2GRM1dUqm95HG/IK+hPO0YHoopTOPBR/U+G3KG4cO8TcY
	wf2CrlkTJKvvzApseKTpMi1V/XITz2jcOM4R8LXYFbMP8mrS1cBd8daU82yi76OBGl1YZxvKltn
	5gUEbA05CgQgBi/0KkXYW0zCPzheJqhAbykQwL8P7YUpHdE2Yq53aGdIMA2TTwlKGHJ9qciBaFX
	wTJx4nr47a9vXoc98AvxFYlmq2shN/VS7HdC0isAcp
X-Gm-Gg: AYBFou2YzsUHfFFRzWPQLZghG4GX/ChA3a61Os5Q+KRXu+YWLU4QN48LuS0RjkNan7f
	9QZOodx+USnqyRu8VnNz5/MJ827Qpj/FvXXN+bR8+tcYpoF8I98+Cfvyo9m5fdREGw2/Z0lUf8l
	w57NT+kYmeBM2e5h13HpWCDGEDJ+1bvXwuJexGKncwfWhn4D/m9Y7mAJLY+QO7XCb3iwcFgqp5d
	rWII6mBaJC7U6J9MuII0Ta7c1/9vn52dYL3uotEFFZINA==
X-Received: by 2002:a53:c841:0:b0:675:3ad8:5725 with SMTP id 956f58d0204a3-67644063cc1mr146755d50.61.1790716513869;
        Tue, 29 Sep 2026 14:15:13 -0700 (PDT)
X-Received: by 2002:a53:c841:0:b0:675:3ad8:5725 with SMTP id
 956f58d0204a3-67644063cc1mr146746d50.61.1790716513294; Tue, 29 Sep 2026
 14:15:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921211712.1563575-1-agruenba@redhat.com> <rhj2uhowkjekxgi7tkxko5odxw3zikthtnlef5f5owrfjzrt3r@nul7b7ldcb2g>
 <CAHc6FU4Rf9-r8m8SSb=e0k0zyoFhQAdjupHMWvT6rStBshntug@mail.gmail.com> <v6c2tacifzt7e46fmlathfn5lgf54ae2qliq33ydhqkeudqnxc@r7dsaeww4yav>
In-Reply-To: <v6c2tacifzt7e46fmlathfn5lgf54ae2qliq33ydhqkeudqnxc@r7dsaeww4yav>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 29 Sep 2026 23:15:02 +0200
X-Gm-Features: AclHuK_m6BXsIjSqEKF55PqZUMBSueUTteabMNeQfNqLlUUx7SCdfvrnfRnhWCs
Message-ID: <CAHc6FU4X_2+J9R0rdBnuH5szyvJ0=Jm5U6-gTcU2-2ewnMO4uQ@mail.gmail.com>
Subject: Re: [PATCH] fs/gfs2: prevent premature evict in prune_icache_sb
To: Jan Kara <jack@suse.cz>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Christoph Hellwig <hch@infradead.org>, Matthew Wilcox <willy@infradead.org>, gfs2@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 11:53=E2=80=AFAM Jan Kara <jack@suse.cz> wrote:
> On Wed 23-09-26 23:01:52, Andreas Gruenbacher wrote:
> > On Tue, Sep 22, 2026 at 1:22=E2=80=AFPM Jan Kara <jack@suse.cz> wrote:
> > > Hello Andreas!
> > >
> > > On Mon 21-09-26 23:17:11, Andreas Gruenbacher wrote:
> > > > Introduce a new I_NOPRUNE i_state flag for preventing prune_icache_=
sb()
> > > > from pruning specific inodes.
> > > >
> > > > prune_icache_sb() prunes clean inodes under memory pressure ("direc=
t
> > > > reclaim").  An inode is considered clean when none of the i_state f=
lags
> > > > are set; the assumption is that evicting inodes that don't have any
> > > > i_state flags set will be fairly cheap.
> > > >
> > > > Unfortunately, on gfs2, inodes can be clean in the sense that they =
won't
> > > > require writing back to disk, but they may still have outstanding
> > > > revokes (as indicated by the GLF_LFLUSH inode glock flag).  To evic=
t one
> > > > of those inodes, those outstanding revokes need to be written out f=
irst.
> > > >
> > > > This requires flushing the log, which is already an expensive opera=
tion.
> > > > When in data=3Dordered mode, all the ordered data needs to be writt=
en out
> > > > before the log can be flushed, which makes things even worse.
> > > >
> > > > As previously discussed [*], we are currently also running into the
> > > > following warning in iomap_writepages() when flushing ordered data:
> > > >
> > > >     /*
> > > >      * Writeback from reclaim context should never happen except in=
 the case
> > > >      * of a VM regression so warn about it and refuse to write the =
data.
> > > >      */
> > > >     if (WARN_ON_ONCE((current->flags & (PF_MEMALLOC | PF_KSWAPD)) =
=3D=3D
> > > >                     PF_MEMALLOC))
> > > >             return -EIO;
> > > >
> > > > So we need to prevent prune_icache_sb() from evicting inodes that h=
ave
> > > > any outstanding revokes.  This patch achieves that by introducing a=
 new
> > > > I_NOPRUNE i_state flag.  When that new flag (or any other flag) is =
set,
> > > > prune_icache_sb() will skip those inodes.
> > > >
> > > > In the filesystem code, we set and clear the I_NOPRUNE flag in sync=
 with
> > > > the GLF_LFLUSH inode glock flag.
> > > >
> > > > An alternative approach might be to allow filesystems to refuse evi=
cting
> > > > inodes that prune_icache_sb() has already selected.  This could be
> > > > achieved by changing the ->evict_inode super operation to return a
> > > > lru_status code or similar.  prune_icache_sb() would then have to
> > > > resurrect inodes that were already marked I_FREEING and put them ba=
ck
> > > > onto the lru list.  This approach doesn't seem obviously better tha=
n
> > > > introducing I_NOPRUNE, so I haven't pursued this any further.
> > >
> > > So for situations like this I've written a patch set to allow filesys=
tem
> > > to mark inode for deferred reclaim (from a workqueue) [1]. Would that=
 work
> > > for you? It will definitely solve your problems with warnings in memo=
ry
> > > allocator.
> > >
> > > I don't want to have two different mechanisms for the same issue so i=
f my
> > > solution doesn't quite work for you, let's discuss how to make it bet=
ter
> > > :).
> >
> > thanks, this would solve some of my problems. In the gfs2 case, inodes
> > are only in "deferred reclaim" state for a while (while they have
> > outstanding revokes) before becoming directly reclaimable again. So
> > I'd also need a way to clear the I_DEFER_RECLAIM flag again.
>
> Well, that's kind of the case for other filesystems as well. But since
> deferred reclaim is relatively cheap my current thinking was that if
> somebody did something expensive to the inode like allocating blocks
> (that's what triggers this for ext4, not sure what exactly triggers the
> state for GFS2), then we can afford also the additional small cost of
> offloading the reclaim to a workqueue (regardless whether it is really
> needed at the time reclaim actually happens). We just don't want to
> unconditionally offload because if someone is just statting millions of
> inodes on some filesystem, he's basically bound by the speed of reclaim o=
n
> sufficiently fast storage and the additional delay of reclaim and the cos=
t
> of offloading would become visible.

Fair enough, let's see if we can get away without clearing I_DEFER_RECLAIM.

> > The I_DEFER_RECLAIM flag setting and clearing code would be racy and
> > ugly though, so I'm wondering if we can change the ->evict_inode()
> > super operation to return a DIRECT / DEFERRED status code instead. The
> > filesystem could then look at the filesystem-internal state and return
> > how to proceed with the inode. For example, fs2_evict_inode() would
> > probably request a DEFERED evict when GLF_LFLUSH is set, PF_MEMALLOC
> > is set, and PF_KSWAPD is not set.
>
> Right, but I really want filesystems to mess with process reclaim flags a=
s
> little as possible because that smells with layering violation and
> generally tends to be fragile. In some code paths such as iput_final()
> or evict_inodes() I really prefer to be sure that the filesystem just fre=
es
> the inode without having to check details of all the implementations maki=
ng
> sure they don't do something stupid and offload when they shouldn't.
>
> So if we do something like this, I'd probably prefer explicit flag to
> ->evict() telling that offloading is possible and in that case filesystem
> can return special value meaning it requests offloading and prune_icache(=
)
> would handle that.
>
> Another problem I see with this scheme is that VFS is completely obliviou=
s
> to the number of inodes for which reclaim will be deferred and so there's
> no chance for throttling places that create such inodes when the reclaim =
is
> getting overloaded.
>
> So overall I'd prefer we avoid all this complexity at least until we have=
 a
> real-world case where the performance impact of unnecessary offloading is
> visible.

Works for me.

Thanks,
Andreas

