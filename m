Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A463B6354
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790345893; cv=pass; b=KXmgqPdN6qenR3u6MJyZtKN7qPZW/mfbwqiRHtFxsn44Spt4N0TN8mzzDrMvsXuHIKkrTxOXcn8J22ngyQ4ygY//e+VgeKBuxQK/1Fb2Rb44hfwYLVnrnfis7UAIRAPGoIv4U8cIwRx2paVGSVNn3RGDZlk+/Kb3BKozMCk2h4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790345893; c=relaxed/simple;
	bh=HzRDzGxPdLFi5j4KurtnMU+p04zWtDF2RczOJoLxtX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sqSf5/EsPxksbdE7TP96L/qO42p6muor23h9BuNM/gK3gzjp+GupF3xpY+w91MHGCWtGHzP6NF0+mEdva3eR4dBZeJgPr9sMRVq6W5RumP0k/AR6HGMyfI8UVTQD9MEUJoXTaDqxkRURANTSBE6ogLBYMXm3pQcK72xLZCAG0Wg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yx0GhbgK; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yx0GhbgK"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aa1da63791so1494948a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:18:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790345890; cv=none;
        d=google.com; s=arc-20260327;
        b=dGLKfKtglkH6SwThn2AS4gjYBpRXtMw/l238ORMpZZPvIdbB89FhOqFObi29l+/Ihl
         sq/rX6zYjtoc8sTzcJtXZTtFtHE8uH+nRxILWPQZKYRCMtTmDfnyEQoQSu9PR2L+WjkO
         O/8dpltaliBUCfSRejJ9OuhSgAP9V8rTUi3BRZWQGI0MxXZ0O04OWwQpLPZTEoE0ZNY9
         rR1HCa6k6PqjUKSTrEtZXDF6B4RWbLdMpsbbl2dyu/4IDqDNyzyh9BxJ+3azq5oooEaj
         enopaJ2IlKf0Ot2O7oAVbCzxrRxORlvX4qF8C7hfJwABisub/QBOnXM1HEDsRZb7402r
         kYFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9lqdUBBVi5EVqQ9eVcAWulKAG76roFDwGZOPzKPPlr0=;
        fh=EYslKN5SXl0GJ4Jv6yZ6D/7LWsIOJNti+Kp+5wirWDY=;
        b=O7hq2sWqy0vtQOxVOsWcZ98TmrwuimczccdgicKOe403Prg4OqsT2gMnHmGmHfdkrQ
         zI8U/GsTsUGoeVxkpGISmhDmQ7CdG+KQZ7qbwWtEGPiBK6raPs/kndlUqmwPM2Isnvhu
         mxqFClofbbNa61xyn1GbVF6AnKerCivQlRvqralFqDitLrlo01CjaANkuXjzg/PF0U/v
         gzvdljK7EKP1FMHNZfLYwig+bfRd/5MRfCTOt1ag5REQFFTOVPTjMYJ9uJ+r5Q3g0qAl
         gjrCECHMkHLNjq9hvSyMM4BYrqyLcLpJMFOedfS098rbXxC81ECl/efskByzJ7deNpUy
         NCDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790345890; x=1790950690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9lqdUBBVi5EVqQ9eVcAWulKAG76roFDwGZOPzKPPlr0=;
        b=Yx0GhbgKwDii+NBsPcEpw3413wCeOsPKq2+Sc4B6YTFkdeM9LicPjxmjZkPYJ1hP7j
         GzqBD1LuUpYw0qMVtvd522tgMtFlnz07OnHgfw8czbC2qj0Rx3ljRzgd/W/pPgVe9GNi
         aTwtOkXPJMm7Vtmc/Et82b0HXGg9UhjSd5vHoveobMHgBDsMJr88iV3FKy9CDdRYIwkI
         p6vN8CMv/XVu5idCcuIPBFKdJXXyf1+jskOcpswaMhv0a5a5VFcpDNut9MoSJAY+T2ha
         zuPbDZUvy/Wx1alh0k04Y1Pqrwb/Cx/jUKjyTQxyTReHW824YXunw5warbtAbsXNW8KK
         IoeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790345890; x=1790950690;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9lqdUBBVi5EVqQ9eVcAWulKAG76roFDwGZOPzKPPlr0=;
        b=rguzh2J5HwJff6M0FvVYXRL3HhsBxQWZOCd9KcUfFaB7H+w+wmaCoy1f3b7xopqrOV
         PNdwmevUBlZDxVbjr9tXmbE3ImjBAlWCzRtdMCVO7zUG2IMXPJQHddyUFOdprouWt9Jf
         Qymky8IHj7+7KVWfO+opbzq53ALXo/c7NUQevF+kyFDPsD5jnjyOBsrTgGyFvsL9OhOw
         4/Sbf5CgEPw+ptTPtW6431VfD8QdNO8HbR3ATOGvyLfLjdAmjtpGGp4KQnh0AvrAb5lX
         zwL0+5dvDa9NY19VJ9d6HWxuEDVm8YsSFKVrDajXDES18IZihXQTcMBqUFWFgNbK/1bA
         WVTA==
X-Forwarded-Encrypted: i=1; AKwUvBypNNcZUyYoeasBLHgWAi9X50TfWhA97XGbIPR2oPXw1myrLBA/oJkZXO5VW+jv2liYmHxmr9uETbt+nzE=@vger.kernel.org
X-Gm-Message-State: AFuF++leJLJ2EFCscpjKMtfsWTymUOfrY0laj94R/MiwiZQbxt/mdN74
	jBv6cwyX53ej2SoeMCf3kkfQrwtv+QLpk/ixl7NHSUFGBAxCztFmkTbR47e0s9S41zMhqndAeZN
	Ke8VxoeU1TrWr5fkG1CwMWFDnVzRdiy3za1hc
X-Gm-Gg: AYBFou3t2x9idMFe1dc5kh2sSs1OLVdgsWZIuNqK8DEDvT8Jb+YyV8iAexSymBl7l8C
	B/7+i539yeLb6yBzPScZ7gHaNSgUXBwa4kd4JQG9hQXBsuEliQgtX0dGF++Jd/E1PHFoKXKHC8p
	fWZ0/8sAYtUzV8wAx7Y+XJXMGYzjR7PQMIReAx/cnJ6vooFfWnDlrciHzM71lcr5GbGcqlwARru
	isxNDB0/z+KEfxWlRQmSyj56gKL1so1q+JiXDCBFKrv6GU4/6tmgf0ymYKaokTMa8MqYIlBddio
	Dx/CME+2xUUeze8rYro8SohdIjLNheOSk65O/vrA89IYNOT7xzNMXENWFRHkWrdVxCU=
X-Received: by 2002:a05:6402:21d2:b0:6aa:b1b8:cf25 with SMTP id
 4fb4d7f45d1cf-6aac8f72c30mr4970341a12.29.1790345889236; Fri, 25 Sep 2026
 07:18:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920203239.2876221-2-Jeremy.Jean@oss.cyber.gouv.fr>
 <20260920203239.2876221-3-Jeremy.Jean@oss.cyber.gouv.fr> <CAOQ4uxhyc5x3LDzbJtRhQJ+JNQ-hES2k45jcxeGsfEWPB24TKA@mail.gmail.com>
 <20260925-server-hager-riskieren-06116eded213@brauner>
In-Reply-To: <20260925-server-hager-riskieren-06116eded213@brauner>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 25 Sep 2026 16:17:58 +0200
X-Gm-Features: AclHuK-IJUoX3UXBLkix4xrF2loPfjQs3Rtc7YqgEUoLWMaqcNXRbcRyYaVgVqg
Message-ID: <CAOQ4uxhdP4XeHfbKfOg+3XRF8oLhPMmbU9xHp7pV2w=snQk-+w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ovl: disable nfs_export for same-sb lower layers
 with different idmaps
To: Christian Brauner <brauner@kernel.org>
Cc: =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <Jeremy.Jean@oss.cyber.gouv.fr>, 
	miklos@szeredi.hu, linux-unionfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 3:51=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> On Mon, Sep 21, 2026 at 10:10:28AM +0200, Amir Goldstein wrote:
> > On Sun, Sep 20, 2026 at 10:33=E2=80=AFPM J=C3=A9r=C3=A9my Jean
> > <Jeremy.Jean@oss.cyber.gouv.fr> wrote:
> > >
> > > Overlay file handles identify a backing filesystem, but not the lower
> > > mount used to decode it. If lower layers share a superblock and use
> > > different idmaps, a file handle can decode through the wrong layer an=
d
> > > initialize the overlay inode with the wrong owner.
> > >
> > > Track the first lower idmap seen for each ovl_sb and disable nfs_expo=
rt
> > > when another lower layer on the same backing superblock uses a differ=
ent
> > > idmap. Keep index enabled: copy up starts from the overlay dentry sel=
ected
> > > by lookup and does not need to decode a lower file handle through ano=
ther
> > > layer.
> > >
> > > Fixes: bc70682a497c ("ovl: support idmapped layers")
> > > Assisted-by: Codex:gpt-5
> > > Signed-off-by: J=C3=A9r=C3=A9my Jean <Jeremy.Jean@oss.cyber.gouv.fr>
> > > ---
> > >  fs/overlayfs/ovl_entry.h |  2 ++
> > >  fs/overlayfs/super.c     | 28 +++++++++++++++++++++++++++-
> > >  2 files changed, 29 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/fs/overlayfs/ovl_entry.h b/fs/overlayfs/ovl_entry.h
> > > index 80cad4ea96a3..2a6e12a0d4dd 100644
> > > --- a/fs/overlayfs/ovl_entry.h
> > > +++ b/fs/overlayfs/ovl_entry.h
> > > @@ -24,6 +24,8 @@ struct ovl_config {
> > >  struct ovl_sb {
> > >         struct super_block *sb;
> > >         dev_t pseudo_dev;
> > > +       /* Idmap of the first lower layer on this fs */
> > > +       struct mnt_idmap *lower_idmap;
> > >         /* Unusable (conflicting) uuid */
> > >         bool bad_uuid;
> > >         /* Used as a lower layer (but maybe also as upper) */
> > > diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
> > > index bd0a3f9039d2..8e78da420b75 100644
> > > --- a/fs/overlayfs/super.c
> > > +++ b/fs/overlayfs/super.c
> > > @@ -944,6 +944,24 @@ static bool ovl_lower_uuid_ok(struct ovl_fs *ofs=
, const uuid_t *uuid)
> > >         return true;
> > >  }
> > >
> > > +/*
> > > + * Lower file handles identify a lower fs, but not the mount whose i=
dmap was
> > > + * used to decode them.  Remember the first lower idmap seen for eac=
h fs so
> > > + * decodable export handles can be disabled if another one appears.
>
> I find this behavior counterintuitive. Shouldn't we just fail the mount t=
hen?

I would love to fail the mount if you confirm that setting up an ovl
with several
lower layers some on the same fs with different idmap, is a non-feature.

I don't know can't /home/amir and /home/brauner be on the same fs with
different idmapping?

Could it ever make sense to compose an overlay from two such directories?
If not then I would gladly remove this setup from the test matrix.

Thanks,
Amir.
