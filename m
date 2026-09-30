Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16EA3B3BF2
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790798007; cv=pass; b=HUdirgXVGabSXfPLEjFjtLdSe0DVLiMohS62FmK04yVT9tdCWExvDDdhw/dqTz+nr4QS59byYFaMO5v8SOVttq0lphgmC7Dhfv0oIGm7tCBgu/TE9VSMnPTR1OdR0YMTOwv22cpAF3ELueDG2qcFE7GY0w6Atl1NhA+Jfqx3w/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790798007; c=relaxed/simple;
	bh=jEjOJJgnQ8TLl1NXrjU0PSvQC15w6bG/fD+IpOaPESg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U0zAN4CnGJ2UgCWR1IxOi5bIE5dfjo7tuxXtJoUoMtv3v9Fg94c9lAeLYTiqFU+SiyFPiziagA2aijWYpWNdiPh6tD1E9EQ/dl9O7RSCfhWLvqvBcIJ+88Wz9aUstPgNrdmSGbAbYHyIIVDKRxvPnl4I7pDFIYD4aj76f1YcUgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LNThRzfZ; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LNThRzfZ"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5337c7b9937so63551cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:53:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790798003; cv=none;
        d=google.com; s=arc-20260327;
        b=U6HnkUmPaasmYigz31mZuYgeqJ8IDo2oCd1syyNuhSzpguk0e/GSpNVVA9Rto4tfN0
         i7bmc9pgXrcLHssnasLoZmjA9pVcIBamrPco+cX0N1vV3xMRoS2/GLT+TVxGYKnWkQyk
         nWR7vCcFZ9ygdjrqUNzYWrj7lrGraLHL9E5/QoeG0GjVce+ZtMD1UsPyxITitFhk9cc+
         L4XbFghLyxtWYs+Dl7DXdFS4880pXzEHGPoEEjzRQQB5ToX8uYFk7YzkrSew8ZCErpll
         tGpaIW6hmFlFSvpxtqecCGIgIq250en7DHsVV7cuGPn77vTUetHgzOXfqQUYwh+dwr+Y
         XXIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0eIq1qnomZnnsUKsF5xFhZ0yFWtEcE3Qo/pF8vzCbBI=;
        fh=UPc2esRCumh+OI92cEA0Dn1zec3+xRMgQuH+j+WCfJg=;
        b=nGoqWf7HqGkrRDoTRjbYVbA4qeCq9w6WjrPprwyxG1aTneRtsEJbEAGNot71Y/Bd19
         EfqGGmMw/Dafbc8wC8qTKlkXcpTlbP1iF1g7FhbinTSa39QlOnxht4/w7wbtxjsdD+zp
         rpPLJ0dFR8UJOVQI44KhsCwqqADWT4bhJY0u2f3So1KSSbOLmhXNjhuePJeipbT/ym7u
         YbipbPHU8ZBhQah+EQ9VQkIUtjer5IW3PfCMf8Xdjm1E2hSilHV75GlIJijAUUiNVAxw
         8k/GCyO+prVx7JZ0vW/F+QVFj2FM4WvnHiH+6cETDziWTU42SDsJqrw8jd8MgFoCCkgR
         eSNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790798003; x=1791402803; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0eIq1qnomZnnsUKsF5xFhZ0yFWtEcE3Qo/pF8vzCbBI=;
        b=LNThRzfZxyghISoHjbKesH0mtqWbAY+JNadXmCvZDfwiQAQTYg37VupAsToagdf8ZZ
         3R0iXfmdnaQTeRi0Hxcp/Qu7BAjWkYrQqR+w+SHZ9XW+okr8TCYPf1wktVth8b9yUrKo
         mmXTmLmxp1jOYV74tQS4/9/QGLzBx3Tst56IofuSoxysS1pt9nijBxFyIYZNGgnrf6qM
         hR7PGdsNYv2ADwfrcHw+VqsKlI2wqvNGYSOMxJYrjWBk/V10++LpA+iN3hk7ZOIwdMt2
         /g6riwK8bIzz8voSw26HWpTbwoMRsb4hQeF5sdRxMc6TptrT94Eii9wbiXBxFEFZCym7
         tHuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790798003; x=1791402803;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0eIq1qnomZnnsUKsF5xFhZ0yFWtEcE3Qo/pF8vzCbBI=;
        b=J36gsM2CoQo85s6L3ZTdIWxyVTD/R2kNBpQPAWEvvHxqnPVnOkX9DgO/rXtD+B6LUL
         5/i3zkxKFgzNg5+0kuuK8h3RYRn3bhUfDzcxkrAWX3PTJhba/lMdVYxIZSxUlsjumgO1
         YJLuzm7VOSRK9ryn/cvSClUmGz6PWk2y0KnOcFKH49z/Ssm+okcIT4HdTadrig872UXQ
         IcWQodCLV9EBPYmPvLkvwRtiphicl+1i7EjCOGYVvSD7x2k9GcYGoXc4k6H3Un2SpbE8
         P51h1feLSmYZ32jpKWEHQvtqXkJ0Dmx8R4HH0xN1uU1dJytWKv4LddSSDiDkNM9RSrvP
         wo7g==
X-Forwarded-Encrypted: i=1; AKwUvBz1KNjvAedsayqq2E8jfDeyHFDvcpBxdFo6tY3yY8UYSLDbsRDbNqFRplsG/mP/ZoLc54OZqIASgKE12G0=@vger.kernel.org
X-Gm-Message-State: AFuF++k/ryb47xwS/++xuvuB3rRBdCzDnGZaDz+LJXpq+LEjvrNrEr+J
	B4fif9+cZz6ZDcEK/r6lVlJiYkxqXqKA/6666i9MUYRrQ0ei4jqq9t+49LAPcVSrxvfdnFsJLyF
	KRKb5qo/lRoWBvcDGNjhG/JAjYRNbFW+IqHErptFr
X-Gm-Gg: AYBFou3khed0ZONGQ/G5/7YAonIGM6l4P+ZsR682//lFtTlC7LE8aMgt/Q6UF785R0e
	tRxXtIxT9onaFtCVvac6Tq/fUOvIeIt4ktNcDCQYTcQOT15yBtkmfpGzcLdWQtSSL6p6+0z8Nys
	MPa8ZNRhps84rd1+otBt+ASKOv51qtfEqRau/ygSVzglfPVX/FWhEJKWyPYPn7+zMJwg1/zsI47
	X3q1msMtIjnohFcEBlpjyrQ+7qbjeLY14/hI0m+rfuSncp0bRfv6niJajDzMq15tJbY5UFp+r3a
	nxfqzm4IFkZYB3uBhb66ocepq/5pqkBZAxxdpbDH9ggnyvDalFLx/Q==
X-Received: by 2002:a05:622a:610:b0:531:6de:6028 with SMTP id
 d75a77b69052e-53386815ca8mr222861cf.13.1790798002634; Wed, 30 Sep 2026
 12:53:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926-nsfs-prune-rfc-v2-0-53509260e4e7@gmail.com>
 <20260926-nsfs-prune-rfc-v2-1-53509260e4e7@gmail.com> <CANaxB-yj2QV183nk3UC-2PD6qh6hh-_iLRuryTdUsebd+RqxdA@mail.gmail.com>
 <CAGmPdrwOnNRHJqk1mZVB+tFCnJBr3ZTaSZqbiGu54kXPkMtRoQ@mail.gmail.com>
In-Reply-To: <CAGmPdrwOnNRHJqk1mZVB+tFCnJBr3ZTaSZqbiGu54kXPkMtRoQ@mail.gmail.com>
From: Andrei Vagin <avagin@google.com>
Date: Wed, 30 Sep 2026 12:53:11 -0700
X-Gm-Features: AclHuK9MG__TVWG37WqPhPUQdYK5bsOXfsAt-eoCDlcKjWQdQUjwS0-jBycCRa0
Message-ID: <CAEWA0a5OjmjE-CVhiUcLXqrpE4xSd3-L5OszDd41DFDqUgcp1g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mount: add OPEN_TREE_DROP_MNTNS_MOUNTS
To: Kirill Kolyshkin <kolyshkin@gmail.com>
Cc: Andrei Vagin <avagin@gmail.com>, Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Aleksa Sarai <cyphar@cyphar.com>, Jan Kara <jack@suse.cz>, 
	Jeff Layton <jlayton@kernel.org>, "Eric W . Biederman" <ebiederm@xmission.com>, 
	David Howells <dhowells@redhat.com>, Amir Goldstein <amir73il@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Giuseppe Scrivano <giuseppe@scrivano.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	containers@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 12:49=E2=80=AFPM Kirill Kolyshkin <kolyshkin@gmail.=
com> wrote:
>
> On Wed, Sep 30, 2026 at 10:22=E2=80=AFAM Andrei Vagin <avagin@gmail.com> =
wrote:
> >
> > On Sat, Sep 26, 2026 at 12:01=E2=80=AFAM Kir Kolyshkin <kolyshkin@gmail=
.com> wrote:
> > >
> > > A recursive open_tree(OPEN_TREE_CLONE) copies the nsfs mounts of any
> > > mount namespaces pinned below the source.  When the clone is attached
> > > inside a mount namespace younger than a pinned one, move_mount(2) fai=
ls
> > > with ELOOP from check_for_nsfs_mounts(), per the rule from commit
> > > 8823c079ba71 ("vfs: Add setns support for the mount namespace") that
> > > prevents mount namespace reference loops.
> > >
> > > This breaks container runtimes that use OPEN_TREE_NAMESPACE, such as
> > > crun [1].  The new namespace is younger than everything else, so bind
> > > mounting e.g. the host root fails on any host that pins a mount names=
pace
> > > (snapd does, under /run/snapd/ns).  By the time it fails, setns() has
> > > already run and userspace cannot recover: the host tree is out of rea=
ch,
> > > and the offending mounts cannot be unmounted from the detached copy.
> > >
> > > copy_mnt_ns() and create_new_namespace() already leave these mounts
> > > behind; only get_detached_copy() copies them.  Add an open_tree() fla=
g to
> > > drop them from the clone, as suggested by Aleksa [2].  Locked nsfs mo=
unts
> > > are dropped the same way copy_mnt_ns() does it, so nothing new is exp=
osed.
> > >
> > > Keep it opt-in: open_tree(OPEN_TREE_CLONE) plus move_mount(2) is how
> > > mount --rbind works through a file descriptor, and in the caller's ow=
n
> > > or an older namespace such mounts remain usable.
> > >
> > > The flag requires OPEN_TREE_CLONE or OPEN_TREE_NAMESPACE.  With the
> > > latter it is a no-op, so a runtime can pass it unconditionally.
> > >
> > > Link: https://github.com/containers/crun/issues/2262 [1]
> > > Link: https://lore.kernel.org/all/2026-01-07-oldest-grim-captions-spi=
lls-ywC2O3@cyphar.com/ [2]
> > > Assisted-by: Claude:claude-opus-5
> > > Signed-off-by: Kir Kolyshkin <kolyshkin@gmail.com>
> > > ---
> > >  fs/namespace.c             | 14 ++++++++++++--
> > >  include/uapi/linux/mount.h |  1 +
> > >  2 files changed, 13 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/fs/namespace.c b/fs/namespace.c
> > > index ae5dc64f8b45..a95173996a8f 100644
> > > --- a/fs/namespace.c
> > > +++ b/fs/namespace.c
> > > @@ -3062,7 +3062,8 @@ static struct mnt_namespace *get_detached_copy(=
const struct path *path, unsigned
> > >                         ns->seq_origin =3D src_mnt_ns->ns.ns_id;
> > >         }
> > >
> > > -       mnt =3D __do_loopback(path, (flags & AT_RECURSIVE), CL_COPY_M=
NT_NS_FILE);
> > > +       mnt =3D __do_loopback(path, (flags & AT_RECURSIVE),
> > > +                           (flags & OPEN_TREE_DROP_MNTNS_MOUNTS) ? 0=
 : CL_COPY_MNT_NS_FILE);
> >
> > Overall, the patch looks good. One small thing is that open_tree() with
> > OPEN_TREE_DROP_MNTNS_MOUNTS doesn't fail on a mntns file if AT_RECURSIV=
E
> > isn't set:
> >
> >   open_tree(AT_FDCWD, "/proc/self/ns/mnt",
> >             OPEN_TREE_CLONE|OPEN_TREE_CLOEXEC|0x4) =3D 3
> >
> > With AT_RECURSIVE, __do_loopback() calls copy_tree(), which checks
> > !(flag & CL_COPY_MNT_NS_FILE) && is_mnt_ns_file(dentry) and returns
> > -EINVAL, but without AT_RECURSIVE it calls clone_mnt(), which doesn't
> > have such check.
>
> Thanks! A call with arguments like this does not make any sense*, as you'=
re
> asking to clone a pinned mount namespace while skipping it.
>
> * except maybe to check if the path is indeed a pinned mount namespace,
> but there are cheaper ways to do it.
>
> That said, we can either keep things as is, or
> 1. require AT_RECURSIVE with OPEN_TREE_DROP_MNTNS_MOUNTS
>     when checking valid flags; probably the easiest thing to do;
> 2. add a check to a non-recursive path in __do_loopback, something like:
>     if (!(copy_flags & CL_COPY_MNT_NS_FILE) && is_mnt_ns_file(old_path->d=
entry))
>        return ERR_PTR(-EINVAL);
>
> I'm going to implement either one in the next iteration (v3); do you have
> a preference?

I prefer the first option.

Thanks,
Andrei
