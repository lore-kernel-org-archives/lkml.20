Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1E03D9025
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790797776; cv=pass; b=XOF1c3M6Ev/0wnM9BSs5eGU/+/gMHgirltSJDzWUqYyi8T4ltAln/5oTvkEohXBykXADjNkeco8QkLSZ1qxprdlgI16XoYjEHsu4t9/kDgmSzAQZhTTKWmaaLQF6duXj1qlyyogt0tA2YizSArlwAaCjAv3Y/wODiXbhYVF+vjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790797776; c=relaxed/simple;
	bh=F3Dung+nzJVGL2YRHUmvwY+adZaiJpqAN9OQIrYPVJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dxtan3GlGBG9wrOU5XjWMY/vYm9Lxz0JqY98ezgotvozI7n/GMv6GS1c4r+rSULCckOvMC21SzHMXYR0Ke3lFVqCHdB2gZFf50qxy5DS3ayKotTSIB6O8V8MqcCnxo43IcrW4hlNyFMQlForPh3Y62JDh1GSweCsHr69leBg9OA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BceiKZYF; arc=pass smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BceiKZYF"
Received: by mail-pj2-f38.google.com with SMTP id 98e67ed59e1d1-3a4b4770191so1038782a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:49:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790797769; cv=none;
        d=google.com; s=arc-20260327;
        b=rl1seWMSl7DrmrYyaRXJVfkWv/PhNc7mZl6xlRvMg6C3LjDoEpMgtRs3iLHazV3fWU
         SZu8aoqWdnquxUUfvBpAHi+e3BK5PAjlwDx59hAkQPcDX3mWW+tH6oreof83oGyDL3w8
         tP7MMmeyVeMUG0qscZMV2oR0Pzupy6IEpvKrX9TkKonZ6lGNj7MIjgxdUq+FLWUuP+pA
         uv3KgRI14bVNB5jCF8H8ZhD5EquHP/Bhj6xHV15IS4jIPE21C0E7+cWTOGTPjdgHsW5E
         Q9ySOfjvl9WxcdknOIf2L7QVi5p4/8YG0bpzTvAlznC4Z/du12uOLiiQ9zyG9X7ml4YO
         y1yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vYuuNb8fsv3iPf0xhDXc4/1qYP3hZrQ9mcUnQuSOi8Q=;
        fh=5KRbW9KHBQnmZunaJchctVyXzQD5BPRB7bxWTla4YNw=;
        b=SiO65Rl9Hfcy2lBFVYKnDzMT2aQR+If0go1Imo4ne7lL2fgyO11oMpg8xv9zF6Dc7h
         aqekT6ch0dC35L/zOCCi54iKP420JEYw8d7ggyoPsJmP6848kzXTJHUudSkrBBy+xp8o
         /3XRcxvqqb5su7P99k+uI1ih9+bgcAqCgOWOu9zj2L9deDIdwOmJ3L+1XhaZ3iOOOKUm
         lplR2w3buSUHhRQEL5o0cySiYlz+8NCh8VDXw56dq048aVq7RN+58y9z5rdkuYfjKc8v
         pO4LcxeOMT5pks1lZo93DRJi/FAcwm55lrw8dkR+noOb2Pp93+LExjI1/uRF/6JbgoFB
         EpMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790797769; x=1791402569; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vYuuNb8fsv3iPf0xhDXc4/1qYP3hZrQ9mcUnQuSOi8Q=;
        b=BceiKZYFgwpTQCcc2uKOc7bQ46apJXS1p0mpIESAcLtLxFrCt+eTN33BGmgCHX8wCT
         s0076ZYulwaT2rsd9R6PjixhraJomGackH+U9vi5eHNhKUBCQnZqW+OnyzPOMYA1ODYd
         7Kb1PUFjT8JvHajh9T+AZtOHFHEJg55RSFJ/nsbMnB3X5TKPOpk5XzPDvOd3aj2OMWGD
         DxXsVcr8knz0w4pZ//xL0PCqg/lXHuSYLNKeF/wXw3l6FytSZeHIdu0tENrf+j3Kp746
         VXE2f4fvz6OP40Vjo8pHG1842NsIlMhngY/uKw/5zOIPnfsfx6jRS1FJiOf3ldzvOCht
         WZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790797769; x=1791402569;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vYuuNb8fsv3iPf0xhDXc4/1qYP3hZrQ9mcUnQuSOi8Q=;
        b=esOl0hi6J+PwOu7oDJt6917+EDSy0/AKW45NLwwhLna7g1AimA1x9umSUiO5XdxqsQ
         T+p8AcEftO/gV6oE4OD0xGhPISJetjlmlT36dSF4YUhWtXWei39tB1B1VjDUuW2aAujB
         0G7J7oswE5ShG+w9PnLgySYeDl8ZvpQyLmAO9iaVOE/UFGoIH1UIoL8v/vbERI60lI9L
         0nn3dSHn9I+X8rB9TETYp9/D82vP5v/qPm4sucWA6azZp+FUxQ3XLi07o4CfniD6Ci1M
         jJvat0+f1vRiYFjzDIaI4WVlYkiLH7WHQK0NGJikX4rilaBwPuOsZK+BNRy/2kvBCf7J
         7y3Q==
X-Forwarded-Encrypted: i=1; AKwUvByTh5kYtkC6RAUOA7nBojsBbYevD4xKwksNShLys4pkUQynhOsMjk4y7GvpxowXJUSQpe59lpiXVbpvr5g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2fGRibk7s1kU6hfIOziWcsGjS8JBWJjsb7je6+Nq12RvP7jX/
	M/6akdgncq47Snas4dmxxPwdJ9EcH94wBWmJBE8bDqKqkkWr5QAnj7M1aMk2HptVwebZTyJbXhF
	OgCB1Gs9MvLcs+RDwQn4SPZPia+ed4Jk=
X-Gm-Gg: AYBFou1kmo8H6tlcs4jbIe6zCZulc1KHyZLJIyzhHJep+HZ9o5GiOqbDOcUGFQ6Dyvz
	5aPdBtGUC2RH0jnE+uMX4L1Cgh+JCwcHqlSBuib69a0e57mPdWJm5M6pVwY3fx4qmq2XJt/3o0S
	F3OpsmIP8Hm0W8z7L56QaJMc8/PG7HVZRMkLuBYkJGh1UF6cXmx6gcwXtEz4mRP5TC8FG+wKrdE
	4w8y2POJEsDsWUzDxUJpPITLar8iYtThYidcqJprrhHlW3rsxOGUTXTJZG/OojOPApiLae2axJT
	Ifxi2wp19CjDjoKpG/iBOlyIVUBkcRHoUhs9geKde8IPB6EDGY6H+RM=
X-Received: by 2002:a17:90a:e7c9:b0:3a4:85c4:68fc with SMTP id
 98e67ed59e1d1-3a4d1545a03mr2271482a91.29.1790797769174; Wed, 30 Sep 2026
 12:49:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926-nsfs-prune-rfc-v2-0-53509260e4e7@gmail.com>
 <20260926-nsfs-prune-rfc-v2-1-53509260e4e7@gmail.com> <CANaxB-yj2QV183nk3UC-2PD6qh6hh-_iLRuryTdUsebd+RqxdA@mail.gmail.com>
In-Reply-To: <CANaxB-yj2QV183nk3UC-2PD6qh6hh-_iLRuryTdUsebd+RqxdA@mail.gmail.com>
From: Kirill Kolyshkin <kolyshkin@gmail.com>
Date: Wed, 30 Sep 2026 12:49:18 -0700
X-Gm-Features: AclHuK_hWd00XXCC76l8VVWW4Hx6PvZ0qFMn_sLHCwFO53Dqn518ibmeNSsj6yg
Message-ID: <CAGmPdrwOnNRHJqk1mZVB+tFCnJBr3ZTaSZqbiGu54kXPkMtRoQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mount: add OPEN_TREE_DROP_MNTNS_MOUNTS
To: Andrei Vagin <avagin@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Aleksa Sarai <cyphar@cyphar.com>, Jan Kara <jack@suse.cz>, Jeff Layton <jlayton@kernel.org>, 
	"Eric W . Biederman" <ebiederm@xmission.com>, David Howells <dhowells@redhat.com>, 
	Amir Goldstein <amir73il@gmail.com>, Andrei Vagin <avagin@google.com>, Shuah Khan <shuah@kernel.org>, 
	Giuseppe Scrivano <giuseppe@scrivano.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	containers@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 10:22=E2=80=AFAM Andrei Vagin <avagin@gmail.com> wr=
ote:
>
> On Sat, Sep 26, 2026 at 12:01=E2=80=AFAM Kir Kolyshkin <kolyshkin@gmail.c=
om> wrote:
> >
> > A recursive open_tree(OPEN_TREE_CLONE) copies the nsfs mounts of any
> > mount namespaces pinned below the source.  When the clone is attached
> > inside a mount namespace younger than a pinned one, move_mount(2) fails
> > with ELOOP from check_for_nsfs_mounts(), per the rule from commit
> > 8823c079ba71 ("vfs: Add setns support for the mount namespace") that
> > prevents mount namespace reference loops.
> >
> > This breaks container runtimes that use OPEN_TREE_NAMESPACE, such as
> > crun [1].  The new namespace is younger than everything else, so bind
> > mounting e.g. the host root fails on any host that pins a mount namespa=
ce
> > (snapd does, under /run/snapd/ns).  By the time it fails, setns() has
> > already run and userspace cannot recover: the host tree is out of reach=
,
> > and the offending mounts cannot be unmounted from the detached copy.
> >
> > copy_mnt_ns() and create_new_namespace() already leave these mounts
> > behind; only get_detached_copy() copies them.  Add an open_tree() flag =
to
> > drop them from the clone, as suggested by Aleksa [2].  Locked nsfs moun=
ts
> > are dropped the same way copy_mnt_ns() does it, so nothing new is expos=
ed.
> >
> > Keep it opt-in: open_tree(OPEN_TREE_CLONE) plus move_mount(2) is how
> > mount --rbind works through a file descriptor, and in the caller's own
> > or an older namespace such mounts remain usable.
> >
> > The flag requires OPEN_TREE_CLONE or OPEN_TREE_NAMESPACE.  With the
> > latter it is a no-op, so a runtime can pass it unconditionally.
> >
> > Link: https://github.com/containers/crun/issues/2262 [1]
> > Link: https://lore.kernel.org/all/2026-01-07-oldest-grim-captions-spill=
s-ywC2O3@cyphar.com/ [2]
> > Assisted-by: Claude:claude-opus-5
> > Signed-off-by: Kir Kolyshkin <kolyshkin@gmail.com>
> > ---
> >  fs/namespace.c             | 14 ++++++++++++--
> >  include/uapi/linux/mount.h |  1 +
> >  2 files changed, 13 insertions(+), 2 deletions(-)
> >
> > diff --git a/fs/namespace.c b/fs/namespace.c
> > index ae5dc64f8b45..a95173996a8f 100644
> > --- a/fs/namespace.c
> > +++ b/fs/namespace.c
> > @@ -3062,7 +3062,8 @@ static struct mnt_namespace *get_detached_copy(co=
nst struct path *path, unsigned
> >                         ns->seq_origin =3D src_mnt_ns->ns.ns_id;
> >         }
> >
> > -       mnt =3D __do_loopback(path, (flags & AT_RECURSIVE), CL_COPY_MNT=
_NS_FILE);
> > +       mnt =3D __do_loopback(path, (flags & AT_RECURSIVE),
> > +                           (flags & OPEN_TREE_DROP_MNTNS_MOUNTS) ? 0 :=
 CL_COPY_MNT_NS_FILE);
>
> Overall, the patch looks good. One small thing is that open_tree() with
> OPEN_TREE_DROP_MNTNS_MOUNTS doesn't fail on a mntns file if AT_RECURSIVE
> isn't set:
>
>   open_tree(AT_FDCWD, "/proc/self/ns/mnt",
>             OPEN_TREE_CLONE|OPEN_TREE_CLOEXEC|0x4) =3D 3
>
> With AT_RECURSIVE, __do_loopback() calls copy_tree(), which checks
> !(flag & CL_COPY_MNT_NS_FILE) && is_mnt_ns_file(dentry) and returns
> -EINVAL, but without AT_RECURSIVE it calls clone_mnt(), which doesn't
> have such check.

Thanks! A call with arguments like this does not make any sense*, as you're
asking to clone a pinned mount namespace while skipping it.

* except maybe to check if the path is indeed a pinned mount namespace,
but there are cheaper ways to do it.

That said, we can either keep things as is, or
1. require AT_RECURSIVE with OPEN_TREE_DROP_MNTNS_MOUNTS
    when checking valid flags; probably the easiest thing to do;
2. add a check to a non-recursive path in __do_loopback, something like:
    if (!(copy_flags & CL_COPY_MNT_NS_FILE) && is_mnt_ns_file(old_path->den=
try))
       return ERR_PTR(-EINVAL);

I'm going to implement either one in the next iteration (v3); do you have
a preference?

Kir.

>
> Thanks,
> Andrei
