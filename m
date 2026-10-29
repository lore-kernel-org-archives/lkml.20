Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793281827;
	b=CKKpX0nWPL9VrJ0CARChlV2GhD5MHQMMkNDZY2I+axIuXvThQZf3/02s5SKeUDRl01Or
	 FUYpDZabTOMFPjtYSIgXx+GWsffmieWjTmUMmjg4Lu7DRMTeXUPKarnBfakJ1UVbvjTKN
	 d+k/BcHMiBrGiyCHpSdn1IXdz1t7iehcXSWR7m11FbfCUr1T0SHPkPUzpLo0YxXCCBfO4
	 fMawG85zdA84DX9FNvL+h4bs8V48GgqjI2ncf/hX1TxWxvJ+VEhETZLQ4SjwVOD18lkmd
	 I8MZnHf89VivznFIuShoquftGFQBiB7VahOqunH9DavJeDwpT48MAqG/U2LP/DIhmWA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281827;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=K4ilaixi7PzQ3jyW2MqZwExvQII83Z2kevqQDSBbKdo=;
	b=iNlgvu2V8ibjogCmTRkDGwX2/ZY+612uFUvBOkltEV5aNiO3BpciVvcLDdpr/b7DDQUv
	 B9eXPDbuezwiwTyV5/dni4wkC9E6IFiAEnZSXdBNE+Q65GkmI6Ttvz8T9wE/kAHbb+IOD
	 BtXZo1JBsQyDjchxM/u7bZsfhQ01Dn2Uf1/FJCStdVI9GQq5G6kHFsjO+ira4W3lPHRss
	 lfqdjTMnwNhGKaXi2zBUxv4cSmEiQ0Xj6xxyDNk8ENYAWRdzDYeA20VscBjF36HZVZX2d
	 IhkTpi7jFD66qMPb6IT9NdgLcfYWb8Xir/jjgHsINsynbHw7Cm+l4KA2Zy61SiuTWiw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WwM5QhL5;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=dDsbtHRb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9A5606A321
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:50:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA9A5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WwM5QhL5;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=dDsbtHRb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793281825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K4ilaixi7PzQ3jyW2MqZwExvQII83Z2kevqQDSBbKdo=;
	b=WwM5QhL5G1knhAtFz34NAkXaDKGKc5vcCtqtlNXFZWju6VI55zQ2fP3NK+wPaRBLTM3nYI
	RGHgxxNrdFYtydKzm1JY7/Z1q1T7PEd6gSprvsY1J0bZ6QOV1aL8h/kW5wiJnhiH8oK3UE
	3ZlLFug2HgC73k/h7RLvD6dRf+h3a94=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-5FwoEMK2MhiP-nmjoVKqSg-1; Thu, 29 Oct 2026 09:50:21 -0400
X-MC-Unique: 5FwoEMK2MhiP-nmjoVKqSg-1
X-Mimecast-MFC-AGG-ID: 5FwoEMK2MhiP-nmjoVKqSg_1793281820
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-679b96a1e29so3555316d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:50:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793281820; cv=none;
        d=google.com; s=arc-20260327;
        b=cTbsSGRxc0rV3+N+J4F9qwpnalcYf8Ws+tQm48Z+a/WqHgh7cFIzk7iRf3dsQhhWWv
         mYwgTpLlbg4SUyMdiQD+Mdf+Y3+7JEjPGdaNZ7fefaoNZtlld+6A8xTqNo3o46XkP7C+
         wrQ8h4AAKMx6tqJ3LsZzGS09WWRXwpaVQQQKB3i3yAa915h1CjzVSxoxkG6K0j5Qp6rV
         N8tozjQGd4696atm11/DmMvPw4sI6xxzrfHn4lmZK11GM4fgEttoj+h8evL9lQC+Owf0
         ZkTpJJpQRrXzdt7HmPrYUaI+dSuyBZMHacH64swr7oSTSPglsKaftzSADNTON1lxhgKy
         HcMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K4ilaixi7PzQ3jyW2MqZwExvQII83Z2kevqQDSBbKdo=;
        fh=769goaatJVVbMcoM8aZta5mv/oZfxp0JTKxiYJhREkY=;
        b=pJJLU4883p4mUywGhHzBPtyPAMuewXAYDGwqPT6AdmDnEZiOn3CD4xlzm7e3xAsqGs
         unkI7Kd9qcFzBLrJVRbnyD31/1/h1V1aTBS9k6/nMxWFPjb128MgUX5R9fA78h3QZ6tY
         0LNLrHOhO5XrfSTLAIAi3LFA0C4wBttyDTat1iT4vU985u4R6NFkyTLEF779tdKYhvGm
         MhAAVHRteEjKp/vxXKJSFT3qUDbQrayfWsTvyJtUlGojkXWwWE0yxM52wd3I6Mvv2WYw
         iZUdVpNuS9gg8AmsuG/Ok1ImxyydblJ2Fi/p3Dc/FviZGG802Ef+0Tg7SOmBE1PxCtii
         f2fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793281820; x=1793886620; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K4ilaixi7PzQ3jyW2MqZwExvQII83Z2kevqQDSBbKdo=;
        b=dDsbtHRbfeNFJREACYLUVAPG3QyBRzqbzues7l2mwFGXYra00VVWSpcEXKhIsQt9Lt
         n4dNUER9uCptqVRLI0xM53MM4SG9PmruKF8nKjS7sQwZlFK4iLiSUxMmD964JQ0BAIRX
         DEu4JW1fAe4/O0HCOwdWh7+XdpJJhi6Ricx7tw5ReEzj5Etgem+oRMNYl6LW7uozbj6q
         fYoYzTQcEK1LvZDhgZ4UYWzD29BTn8EMXzrarIX0lFsvsoF/XHYmguyEZyux5DvxlkFA
         557RZQ0FhOgN4qMupuEUnjaDhrmTTep6YF9Gv7khln48IP7yexRjznNnHQwEbUszV8ZD
         5E6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281820; x=1793886620;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K4ilaixi7PzQ3jyW2MqZwExvQII83Z2kevqQDSBbKdo=;
        b=ap1Rae2vDucml1yJBj7n8TL6elgN+M5m0a7y9zCzKI3QsFAmfFy2T5OwJTIrT9O9DK
         /GneumcgQ5unzOOhdjYtz9vWflyiGaTynZfQSlIbOcJDQIMPhIYMjCBKirZZlkWxXvAH
         5cuO8fXIl8KxKxjIzXGonBYpXJKfp21h0PkgzGfIeoXWd/acWVtqqwLSgln/gHmtpzCQ
         TQioFbF3KHVUkljW2Kwe4eHkKS4LktILODhq5Tl+nHX8pUWWXORqnWDagSJwPMQ1/8Sm
         /ALylHAbsSROv8xyVeSMUFedta8QRBe+O0fyMGlVAnZDlKjYb5mHT6oFRrx9suKXIQ2F
         mzSA==
X-Forwarded-Encrypted: i=1; AKwUvBxSW2wGQJD6DPYvJs9n7DW26TeJPdj3bTm7oYn7Kb/CjchgXMFaseF1E5mGsbsr7KeyJ0Ef9CBK7rzMCCQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKyguKv99O4mk0C1fB9mC8Nr4cXRxyt2m8e33xpFSxIfbffJvmu
	jJhDoV3iL7PnCSWpb6akSvDn2adg6i9ktd19sYq6i4RdI+RZeoJs928EQmAGtC5YhGe6XSwyP7F
	k0M8IsI+rZljJOt9+gNa9nxlcu4DktqpoTPxPlJv2yCKSczPTzUpty5RXHJimzq783joKnRLCG2
	NdCrqPky88sMhGiwTwOP8FmzIWnnNy7KtYq1XtrknP
X-Gm-Gg: AYBFou3TN0bQ59cpkvXCeHS90E8zQGfnPncxATY+6/lOhXGgGCi73hf5YZx5pm7rpso
	U55Zce9TUUqOefxuDH2dbIzfaq+tWxzYR3LG+QvWIuaO4o1BCBcpG9XdLYnJbUu4NQBSYwFaw+U
	VeqEH9ZEk8AXtnklOqgHRyGVHYOyJohUG2xMPCXU+rWJk9N6dHcg8JltAvBiZjhldtcWA9c15GL
	0AA7yGD2/Xx6PGhMoOafjIcbtgoMu8vmczEUfTjjxZ7sA==
X-Received: by 2002:a05:690e:43c6:b0:679:943f:b192 with SMTP id 956f58d0204a3-67a7bd34f4bmr3441794d50.76.1793281819671;
        Thu, 29 Oct 2026 06:50:19 -0700 (PDT)
X-Received: by 2002:a05:690e:43c6:b0:679:943f:b192 with SMTP id
 956f58d0204a3-67a7bd34f4bmr3441771d50.76.1793281818946; Thu, 29 Oct 2026
 06:50:18 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023101830.139094-1-hackerowskiy@gmail.com>
In-Reply-To: <20261023101830.139094-1-hackerowskiy@gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 29 Oct 2026 14:50:07 +0100
X-Gm-Features: AclHuK-JLcGWRfpdOvPnvmGXH13NO45FtGdQUfg0yCXNZWHwDHDohNE_RnQ41sc
Message-ID: <CAHc6FU6Pmu6MfJKNRZ+WhE2y9viU23HsKx9wCbumShCxU45avA@mail.gmail.com>
Subject: Re: [PATCH] gfs2: keep glocks alive while AIL entries exist
To: Eduard Zateev <hackerowskiy@gmail.com>
Cc: gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzbot+ab91b239b20ae188b9cb@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Eduard,

On Fri, Oct 23, 2026 at 12:19=E2=80=AFPM Eduard Zateev <hackerowskiy@gmail.=
com> wrote:
> A buffer on a glock AIL list can outlive the glock reference held by its
> inode. During withdrawal, gfs2_ail_drain() later removes the buffer from
> gl_ail_list, which dereferences the freed glock.
>
> Hold one glock reference while its AIL count is nonzero. Acquire the
> reference for the first AIL entry and release it asynchronously when the
> last entry is removed, since AIL removal runs under sd_ail_lock.
>
> Build-tested: x86-64 GFS2 objects with W=3D1; arm64 GFS2 objects
> also compile.
> The syzbot report has no usable reproducer on current HEAD, so a runtime
> test was not possible.

thank you for this patch. I agree with the solution, but I'll merge it
with a better description.

> Fixes: 864174f97647 ("gfs2: Don't cache unreferenced glocks")
> Reported-by: syzbot+ab91b239b20ae188b9cb@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3Dab91b239b20ae188b9cb
> Assisted-by: LLM

Nit: Assisted-by tags are now discouraged.

> Signed-off-by: Eduard Zateev <hackerowskiy@gmail.com>
> ---
>  fs/gfs2/log.c  | 5 ++++-
>  fs/gfs2/lops.c | 3 ++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
> index b55daf1e638..aa5f2a9a94f 100644
> --- a/fs/gfs2/log.c
> +++ b/fs/gfs2/log.c
> @@ -74,10 +74,13 @@ unsigned int gfs2_struct2blk(struct gfs2_sbd *sdp, un=
signed int nstruct)
>
>  static void gfs2_remove_from_ail(struct gfs2_bufdata *bd)
>  {
> +       struct gfs2_glock *gl =3D bd->bd_gl;
> +
>         bd->bd_tr =3D NULL;
>         list_del_init(&bd->bd_ail_st_list);
>         list_del_init(&bd->bd_ail_gl_list);
> -       atomic_dec(&bd->bd_gl->gl_ail_count);
> +       if (atomic_dec_and_test(&gl->gl_ail_count))
> +               gfs2_glock_put_async(gl);
>         brelse(bd->bd_bh);
>  }
>
> diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
> index 341f5bb844b..c4e63fb375b 100644
> --- a/fs/gfs2/lops.c
> +++ b/fs/gfs2/lops.c
> @@ -120,8 +120,9 @@ static void gfs2_unpin(struct gfs2_sbd *sdp, struct b=
uffer_head *bh,
>                 brelse(bh);
>         } else {
>                 struct gfs2_glock *gl =3D bd->bd_gl;
> +               if (atomic_inc_return(&gl->gl_ail_count) =3D=3D 1)
> +                       gfs2_glock_hold(gl);
>                 list_add(&bd->bd_ail_gl_list, &gl->gl_ail_list);
> -               atomic_inc(&gl->gl_ail_count);
>         }
>         bd->bd_tr =3D tr;
>         list_add(&bd->bd_ail_st_list, &tr->tr_ail1_list);
> --
> 2.55.0
>

