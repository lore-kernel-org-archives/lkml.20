Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D98739D6DD
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188111; cv=pass; b=Ex6hzGhHtFr8Pj8fj+GxPHQbhZLlb0PsUUN/9j8HwpRC93PLVowzpNvo92yF1tY+QqgFkQ+TY2Se5xQAeYB9YynVoIlITldMe70AcjgxIoDyS8YWM8i87b7StOElqzud31EI34KJHDPU4T00KiOy7Yw8Ge+3qgSqsA3I/pIBXts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188111; c=relaxed/simple;
	bh=xY7PzJAuFl926gP7M2esENWf67rjFL/VYhM4pp0oYZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OC3ED9qjfh5i8b69kK0Ae4wwCjdPG/0AypNZZppYE1vWX5IDgQhrFdXwHgGc2TVBJgFD9H/UECXGQbprODlhXGKimzo+d9IaCM/42cv/11DkSwH6Ypd7TrrMvUk3p0mmUYbuWPPkwPyXbISVc/a8t1VWacuelBu6Mg0FIk38PxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M3qLFVy4; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M3qLFVy4"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso4604559a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:55:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788188107; cv=none;
        d=google.com; s=arc-20260327;
        b=KPJ73QCTgUE8V1wIjBRb9Wk9ajKpUXiLXdVYwOe/tQFr/dh+WZ52l67F4sGlxbtJ4u
         XSDnMVpLOTdm97bv2np+F77DUbGXBBp2NjfOFcWRXUKQkBwxCMOTVWvKKV0KO5fuETjE
         pLCwpDV1ooVVHpEH3k0/Xuzm25OuqmEAs3BIwDujTm5mJTAOEyThtLjRx6YFxgK09Mck
         wqRVo3QIJcIAHUF/dbUa+itVdCgfGAfo8jHeXsWibSibADfCTst1nUIgmpbgzPUuHdd7
         YJxQOBjwCiYsW1B7Ng105iIgD3c54IZuYylfW6NQGaUoSzTNR/ultz23fF9gACd9tj2X
         KBEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o8pw78oMi9uY1RnWmqztihIod3VWCHkHOIfZPGYQtiA=;
        fh=/PKyPABmlgcPAcqjByh0u40TVS1Jfwc1u//I7dGtLok=;
        b=sI0S0/tLaISL5HvUBpTl/0TIDZ0fnuT5C+NoXloTWwgDOIJGDbG4IQIpoGSwVxTSDh
         WO4A4VPNpJE1ouiX8zA3ITZeldzl3ND8swhIcICyWjP0AqcFB4rGq+9GNq5p5aidRDMa
         TYDOAqLCSjza6/4aULj6YSrhy98UEEg76Qr9goguJI9Shd0ic0z37aB145Aun6eB9nmr
         soaEPkXlpZ5T6eTBVl/iFvJf3YynfBHge1cJeT4HjaALHyTqiicDsK/CQ0aSKB0jk72G
         IQO9Z0Ydkht9YiQcavWyDG4F7B4feb6alwBdkpgSvLk1c/tye4QIUDRqu3bnNM6DOkgU
         JINg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788188107; x=1788792907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o8pw78oMi9uY1RnWmqztihIod3VWCHkHOIfZPGYQtiA=;
        b=M3qLFVy4uPXuP55qv4JPXLBrGKvUHbq3bqWz+SC9PY+jbA4k08d/DfMLOEOjqotBOk
         v844+/fS8Ln1x8XiJYtqHtTgnCJ7kCeaAG6Kns+hm0lwkWiNFRVEXTRQBPMQXAGMLGDP
         qbFymvrWMRuXRnkvrt0nkxxYIXUvabBhfuR88bMDCHoV+4Cj9bRURtxzapkGaGBrZxK/
         xafe8WUvyKWw0XnBNzlnCbB0N+S0r3gKPp+PvotPKeKJogFCmCkhCdKeEqUCyIFbEVL3
         ObgK3xrzKWX38sPp/Hk243YZuJnqofUOcP/h9smsEMOaarrEUKxQGIDRSrA/KM7b99XX
         k4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188107; x=1788792907;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o8pw78oMi9uY1RnWmqztihIod3VWCHkHOIfZPGYQtiA=;
        b=MPnKDAIKgE6fPMcx7lnPmX0RRPo1RQAD3R/WdmcP5wtEOGxlyLrUkdqIbMgQRojd41
         CvCfVe4FVbVaqSDixXeP/Si65AQ848dHm7EItCY9a9ZlYqoZkS/CpgOYV7j1c1gavcPf
         m3Dkh30Gzps0bH8OOOy2roVdUdJy/usdz21+hyoKdZrbrBd70QXMohGqB8AzKG1JNxRC
         iy1ABzRvYC2OwhyN6J2pqO6rZ8so1nBbPwsVCEmUQhLPwtaqFLlUhd09Whiwd90vxv1b
         k5dXDv2bzJitB9JkAbiCPdprNG7IRhXrM5C7zmj23nMIZ+IpnsZbBpzd+rNiH/UlHdgk
         Jrfg==
X-Forwarded-Encrypted: i=1; AKwUvBzrwjoKr+O5Fc3TIQ4TEvLeaTgi7aKr8ZV4TYyI5UIwoZhu96htgM30o1DUM8TwjqG8Oh03s0zBy+u+6NQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kjhd3mwRaCxJIIBYqyHg6c1E/i4GYuoCk83SvZPWW1EeS3H+EG
	RNAEIivE8ypjZiHtHHLj9C02P4nF3ha+tb0SOdpy8VQY6h4p/QW5QGEwP1bHcSZ5e66g39b/zgV
	e4mOqwjnBaGhFARThlSM0fsdiauYxtl8=
X-Gm-Gg: AYBFou0lp5K9nXqA7y8pS+AANcAZ6n0izN2rrKDaTVonC/wmH+S2H233xv1twaTinU+
	hgf+sIiIduk9kHxm9bFyIZQZgPa3wisSlNRgFfhgomMNk4SuP4uJAFek4CwVI1MIs79oZnXy2gz
	1nTsvux3SobApsJ6ViWSpstAzU5LuC6RYUn/Aq9smff89YkcqhNO5dMIXtnlZr7F0xxiz7dS9GW
	Zvb4FLWDJaOvQICFU0sCSB6DCLwbcahI/cHj//7kKZ3WhN+YLUZEe5899eVE2jZwfia3OQwvoLv
	8qf2nSlHo1E+b7/xUTFEGnxEjzKg8Qzp9Y78V5ulz2i3eYH/eR2q0lER
X-Received: by 2002:a05:6402:4586:b0:6a5:d907:7703 with SMTP id
 4fb4d7f45d1cf-6a60d3d5a52mr16807888a12.14.1788188107151; Mon, 31 Aug 2026
 07:55:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827045007.3831259-1-4ncienth@gmail.com> <yjfqzckumtd32dgqidi5sndvth2t67mjwah4kt4jiahlx2a5uf@if55sinfv5o7>
 <20260828042421.964822-1-4ncienth@gmail.com> <ptco7s5x7tjzp42dzlsitibdigpwucl2whwrq37tknjpo7x2lc@b7q27ldlorak>
 <CAOQ4uxgB9anyJcWem04w65VCJdxbbb2cQDZ_u8qMusw3xpB9Gw@mail.gmail.com>
 <63aj7jbfaoamdmcurlge2c2kqpliaifgq4vbythrrxpfyr5vtm@z64myom426zd>
 <CAOQ4uxh-NZ76hEFoNNGjyhodr9U=dvZuGVmYHVPGZ_=jRxCAsA@mail.gmail.com> <67hq7zqnvp6onwwjp24axucgxbzsko2dphielupdfzmfyk6x57@bdeef7fjkqfa>
In-Reply-To: <67hq7zqnvp6onwwjp24axucgxbzsko2dphielupdfzmfyk6x57@bdeef7fjkqfa>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 31 Aug 2026 16:54:55 +0200
X-Gm-Features: AcwNN1VUPugjGbqI4B0wT9HaChvwtiMplXNGta4vMaUOc8DwPfjODDDmdmwDO_I
Message-ID: <CAOQ4uxiQF4M_YSBMW3h8VCKR15GV6g_K5nf=2odtYetEwKHm9A@mail.gmail.com>
Subject: Re: [BUG] fanotify: destroy/add race leaves a mark on a detached connector
To: Jan Kara <jack@suse.cz>
Cc: Daehyeon Ko <4ncienth@gmail.com>, Miklos Szeredi <mszeredi@redhat.com>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 1:39=E2=80=AFPM Jan Kara <jack@suse.cz> wrote:
>
> On Sat 29-08-26 17:04:19, Amir Goldstein wrote:
> > On Fri, Aug 28, 2026 at 7:36=E2=80=AFPM Jan Kara <jack@suse.cz> wrote:
> > > > > Now there's the question about the best fix for the problem. I've=
 realized
> > > > > we cannot just remove the call to fsnotify_inode_delete() from th=
e place
> > > > > where fsnotify_inoderemove() is called (and rely on the call from
> > > > > __destroy_inode()) because the connector holds inode reference an=
d so
> > > > > __destroy_inode() would never get called. Hrm, this is a hairy is=
sue and so
> > > > > far I don't see a good place to reliably trigger detaching of con=
nector
> > > > > from the inode. One reliable place would be iput() but that's rea=
lly ugly
> > > > > and would slow down every iput() user. The cleanest solution I ca=
n
> > > > > currently see is to stop holding inode reference from a connector=
 as I've
> > > > > proposed in the past. Then we can reliably perform the cleanup in
> > > > > __destroy_inode(). But that will be a rather non-trivial undertak=
ing. Amir,
> > > > > do you see some other option?
> > > >
> > > > What about the option I proposed to live with the orphan marks
> > > > Is it so bad? I mean it's confusing and removing the assertion coul=
d
> > > > hide real bugs/races, but maybe it's worth not complicating the cod=
e
> > > > until we move forward to re-attachable marks.
> > >
> > > I'm not so much worried about the case when placing of the mark races=
 with
> > > unlink. There I agree we can somehow paper over the problem for now. =
What
> > > I'm more worried about is the case where someone places a precontent =
/
> > > permission mark on the inode and a malicious user does hardlink + ope=
n +
> > > unlink trick and after unlinking the original link to the inode, he h=
as an
> > > open fd to the inode stripped of any notification marks which I'd say
> > > violates the promise of precontent / permission marks.
> >
> > I see. so we need a point where there are no more hardlinks and no more
> > dentry aliases to the inode.
> >
> > How about we check for this condition?
> >
> > --- a/fs/dcache.c
> > +++ b/fs/dcache.c
> > @@ -471,7 +471,7 @@ static void dentry_unlink_inode(struct dentry * den=
try)
> >         raw_write_seqcount_end(&dentry->d_seq);
> >         spin_unlock(&dentry->d_lock);
> >         spin_unlock(&inode->i_lock);
> > -       if (!inode->i_nlink)
> > +       if (!inode->i_nlink && hlist_empty(&inode->i_dentry))
> >                 fsnotify_inoderemove(inode);
>
> This looks like an intriguing idea. But I think it still has a hole. Unti=
l
> the last inode reference is put, open_by_handle() can still get you a new
> dentry and an open file pointing to that inode.

Maybe we can close this hole, because whether open_by_handle()
should or should not succeed in this case is not well defined,
We can make it defined.
Something like this?
NFS should have a sillyrenamed link to avoid undefined behavior
around unlinked open files.

Thanks,
Amir.

--- a/fs/dcache.c
+++ b/fs/dcache.c
@@ -459,6 +459,7 @@ static void dentry_unlink_inode(struct dentry * dentry)
        __releases(dentry->d_inode->i_lock)
 {
        struct inode *inode =3D dentry->d_inode;
+       bool dead;

        raw_write_seqcount_begin(&dentry->d_seq);
        __d_clear_type_and_inode(dentry);
@@ -469,9 +470,12 @@ static void dentry_unlink_inode(struct dentry * dentry=
)
         */
        dentry->waiters =3D NULL;
        raw_write_seqcount_end(&dentry->d_seq);
+       dead =3D !inode->i_nlink && hlist_empty(&inode->i_dentry);
+       if (dead)
+               inode->i_state |=3D I_ZOMBIE;
        spin_unlock(&dentry->d_lock);
        spin_unlock(&inode->i_lock);
-       if (!inode->i_nlink)
+       if (dead)
                fsnotify_inoderemove(inode);
        if (dentry->d_op && dentry->d_op->d_iput)
                dentry->d_op->d_iput(dentry, inode);
@@ -2244,6 +2248,12 @@ static struct dentry *__d_obtain_alias(struct
inode *inode, bool disconnected)

        security_d_instantiate(new, inode);
        spin_lock(&inode->i_lock);
+       if (inode->i_state & I_ZOMBIE) {
+               spin_unlock(&inode->i_lock);
+               dput(new);
+               iput(inode);
+               return ERR_PTR(-ESTALE);
+       }
        res =3D __d_find_any_alias(inode); /* recheck under lock */
        if (likely(!res)) { /* still no alias, attach a disconnected dentry=
 */
                unsigned add_flags =3D d_flags_for_inode(inode);
