Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649A83E5598
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787912349; cv=pass; b=gpWawWJVO93GiEBkr5b2oYg+n31pkyYMVZtuYKTHYYWyrigO2ylNYZZ1nhayciMSdTLU8XSTBGdqiYltSQPYcSdQcTrpoOlErJiEDzTkV4z8PJJ+USzMzIg/6yk8Rdcsxpbk6834lC2mhMeA7uMAfhqvdKkhVoxHYEbuEZGZTMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787912349; c=relaxed/simple;
	bh=xPSovF27zR1ygx9YQZCEuX/Hht8b3O0ju3f9ZTUK1G4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WlfTxVAK+zWFnDyWiPragppK6PyflsIijmMSgNN74KD42DQYxFMYAUjnnKIwofzsJkpCCLbz0i8rP6H0gUjNpt+6vqCaQj8hprww3bO1I+ecHX5RSme+fPObRD/3a/29qmegyigVgcnQ1hsnaQi+HWxrGUsppxX4vVcCzukAsfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pppTIpyL; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pppTIpyL"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a611ba5130so634373a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:19:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787912345; cv=none;
        d=google.com; s=arc-20260327;
        b=n0uZuQq3i5Hv/4DvKaU9/Ns/kgLjy6RXs6DcIuA2WaPcHQgyrnbsUrswWQvNdrVXNO
         mXSUjwiNMHVVIrf4cUbtxApDz6rn/m27w3ipNudzdODDHhslZ8aC23GUOHEjab+H11Tn
         7aasybn/bu/JfUc+w+65pXP3+4v8OhsUgywZtaUtUM0DjAbTrtnGcoLWQRlkd+2pmr/i
         wktqPpBAp2sdcmDy5r1xrQs266oc2or3UTMOzXZ0dXMdgw/1qK8yjMXLf67Xt/qdz89Z
         dzAULX3XrOViXn44eb85YO9mhU+ygMUqPwpyqpFmnzSFjQAvkJFwu3iDj7ptOJDP9trf
         cJpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G94/g0rpxrLTiPX43qTFT7KbB2uJFdvGtG9HayUlus0=;
        fh=Z92zIeqV3KM1rNx1YXZGVzwQAG0Vj5bIapJdsOle/PY=;
        b=MoEJk/cGp8YVxO3yzdeY2BX8E4A1yYQ+lnv6vZIqq+a8uIDItbtK/XqWFmfaQEzLgu
         9p8OFIls22Xjj75swH3GRM6euFF4yh4VK5uFp2ClWdz8TuRNeGguzDnfVJV+d1E5XVZa
         gBdW67v6/cDf1VSGURuGygvBkmGpLEGBriipQWPaLCjoqPRgWEjXyH51+5JNIprpFlvG
         akffbw3DmkXLxBsl/qU/lk8AkTdWvZuArEL5GaPmgV1tpBtd/1axAiH4e4PC1zLNGQMt
         4GQDvQDWqgYFCe6hJo69DboG1a/if7RCR577pYKa/bDzbu/676HkVJth8uYBln64PD43
         Xjqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787912345; x=1788517145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G94/g0rpxrLTiPX43qTFT7KbB2uJFdvGtG9HayUlus0=;
        b=pppTIpyL19ki0ekal1ycwimN1FzZpAFQgD/wPg6MjPrvKOLrYUqRlDH1zSk14oA6Vt
         +kxBMmRUNCnuyIH1HVLtxl+UJpEu5pm+RNRceC8++SLhvzKl0L6ccq4Z4lvMv5JbwPBV
         66eblMAjpEMMSOv2BWz7ZzYyDiajSS6puXLbnwH1oe2cC+GjVcIm5arFg8YjJJf8kCkD
         fZkkK4vtk3psmVpXgCmM9DWXw6EE31Dz+jxNaQru1BsTs/0k3GywfspMGMBR9OxBK8ee
         Oc2TuMUNrSFGluU6o2dzaMhtrgLj1wkX/WYNsTcX6RB2qmSavCJOdU8CubPxNtFd877b
         ijnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787912345; x=1788517145;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G94/g0rpxrLTiPX43qTFT7KbB2uJFdvGtG9HayUlus0=;
        b=OK3WQSwPMkgPtriSlBK12E3ISvMeCBRmlkhFIKiOdwZ6QBJ4eXzdggqmCq+FnRnbRD
         X5Rf2T/n7VeQQE4PgOfbe0s55LtXgqStI1Pz1TetxhdGGPgj6fkyVXcGGdrzqmyBiXtE
         7xQQ4s47lRQF1vMEIst9wvpUih7gqENz7XUfbIqj6t0xNvz3URPsmxilkhH/Mq/8FBg2
         Qh6vXnEA+FlmAQOdb01KLn2i9qKpgJbjWiBvAnSe0eF0BRL3p7DTT6R357Ss3mH0qGfB
         f6L1V0zToNXx/Qcfp/lDKx+60kaMI8E/oGgWZ4NMyzUUozWmnxxv2Y0Ki3TgXU08tFkw
         ITPg==
X-Forwarded-Encrypted: i=1; AHgh+RrGWpsOD8EaFY41XW9V5mQjZJ3/BuaI3QwkcOR9oFz2HoZ797vbw6+t3m1iIxwNV0pRjTdHd7Mm3did8RE=@vger.kernel.org
X-Gm-Message-State: AFuF++k8gddczhfSLkVkBCFNGRlka4mhrKoNfbS4IHBji/Qzpm5JLMXq
	wflzPcoWxUYR3wdB5awkKxmy/J3M4BUjCsif0NSERh2CuZzleI8gn7ZAZOrUliXHkt+c1vUJhem
	DZHsellDE9TT1zwBGmoTbr0ccIlMiXks=
X-Gm-Gg: AR+sD12uMSiZ5DYVlSFNRLcPlHKbe/glgm/6CZuTsrTkP5qIp8uOav9/NHGW3rPxLYB
	+tTsO8ejo52XaKog5E09+nKsag7szocts4Ph6lKVVpe7jC+48zv+nf/j5ErwDUWeQhLx63TpQwh
	CQhZ09dLBgw11OJoq3yIqxVvzmG9/58um3hcinbXaOCl/gBQvJ7vakmffYj79MqyMWQm2aPM+N8
	U/9yOatXrMaHdBQoXehGSpg6oiB+D1JjaxQBmOKAaDQQHsGM7DsF4n/VQzL42kYPit9gJjlsPtV
	UIkOGFLsDZKw+8oIlurU0H22PJ06w2UtoDTb8Gk5D/3Iqg==
X-Received: by 2002:a05:6402:a214:20b0:6a6:1c0b:72cd with SMTP id
 4fb4d7f45d1cf-6a61c0b73b1mr124271a12.13.1787912345042; Fri, 28 Aug 2026
 03:19:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827045007.3831259-1-4ncienth@gmail.com> <yjfqzckumtd32dgqidi5sndvth2t67mjwah4kt4jiahlx2a5uf@if55sinfv5o7>
 <20260828042421.964822-1-4ncienth@gmail.com> <ptco7s5x7tjzp42dzlsitibdigpwucl2whwrq37tknjpo7x2lc@b7q27ldlorak>
In-Reply-To: <ptco7s5x7tjzp42dzlsitibdigpwucl2whwrq37tknjpo7x2lc@b7q27ldlorak>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 28 Aug 2026 12:18:52 +0200
X-Gm-Features: AcwNN1Wswmvr4jf3jw-aoY5R0HAHlqDLIpRVY4i-uiy8R8EZM3DFgLb4bzUry_k
Message-ID: <CAOQ4uxgB9anyJcWem04w65VCJdxbbb2cQDZ_u8qMusw3xpB9Gw@mail.gmail.com>
Subject: Re: [BUG] fanotify: destroy/add race leaves a mark on a detached connector
To: Jan Kara <jack@suse.cz>
Cc: Daehyeon Ko <4ncienth@gmail.com>, Miklos Szeredi <mszeredi@redhat.com>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 11:05=E2=80=AFAM Jan Kara <jack@suse.cz> wrote:
>
> Hi!
>
> On Fri 28-08-26 13:24:19, Daehyeon Ko wrote:
> > You are right that an fd-held dentry cannot satisfy the count =3D=3D 1 =
check. I
> > was imprecise in the report: the fd and the final unlink refer to two
> > different hard-link dentries for the same inode.
> >
> > The setup is:
> >
> >   1. create A/x and link it as B/y;
> >   2. open B/y, add the old-group inode mark through that fd, then unlin=
k
> >      B/y, leaving i_nlink =3D=3D 1 while the fd retains the B/y dentry;
> >   3. race these two calls:
> >
> >        unlink("A/x")
> >
> >        fanotify_mark(racer_group, FAN_MARK_ADD, FAN_MODIFY,
> >                      victim_fd, NULL)
> >
> >      where victim_fd still refers to the already unlinked B/y dentry.
> >
> > So the A/x dentry checked by d_delete() is not held by the fd and can h=
ave
> > d_lockref.count =3D=3D 1. Its unlink drops the inode's last link and re=
aches
> > dentry_unlink_inode() -> fsnotify_inoderemove(). At the same time,
> > fanotify_find_path() gets the same inode through the fd-held B/y dentry=
 and
> > adds the racer mark.
>
> Thanks for explanation of the reproducer. Now it makes sense. The
> conclusion from this is that fsnotify_inoderemove() can indeed be called
> for still fully alive open inodes which should be (think of permission /
> pre-content events) still generating events. That could be actually
> breaking some assumptions of userspace although I don't think it's a
> serious issue in practice because users of permission / pre-content watch=
es
> tend to use filesystem / mount watches.
>
> Also I think we could generate FS_DELETE_SELF twice for the inode - once =
it
> will we generated as a result of d_delete("A/x"), and finish_dput() ->
> dentry_kill() -> dentry_unlink_inode() will generate it for the second ti=
me
> on the last close of the open through "B/y". That should be mostly harmle=
ss
> but still it's an oddity to keep in mind and preferably avoid if we can.
>

I don't know. This sounds like a fundamental behavior change.
In current upstream FAN_DELETE_SELF is a dying breath of an
inode and no more events on this inode are expected IIUC.

Applications could be relying on this.
In fact I have an application that almost relies on this, but IIRC
it does one last open_by_handle_at() to make sure before calling
the inode dead. Other applications could be less strict.

Changing behavior so events could happen after FAN_DELETE_SELF
sounds risky.

> Now there's the question about the best fix for the problem. I've realize=
d
> we cannot just remove the call to fsnotify_inode_delete() from the place
> where fsnotify_inoderemove() is called (and rely on the call from
> __destroy_inode()) because the connector holds inode reference and so
> __destroy_inode() would never get called. Hrm, this is a hairy issue and =
so
> far I don't see a good place to reliably trigger detaching of connector
> from the inode. One reliable place would be iput() but that's really ugly
> and would slow down every iput() user. The cleanest solution I can
> currently see is to stop holding inode reference from a connector as I've
> proposed in the past. Then we can reliably perform the cleanup in
> __destroy_inode(). But that will be a rather non-trivial undertaking. Ami=
r,
> do you see some other option?
>

What about the option I proposed to live with the orphan marks
Is it so bad? I mean it's confusing and removing the assertion could
hide real bugs/races, but maybe it's worth not complicating the code
until we move forward to re-attachable marks.

One way to think about it is that if we do the re-attachable marks,
we would need to store ino/st_dev and maybe fid in the mark and
then show_fdinfo wont need to get the inode reference at all.

So in a way, allowing an orphan mark on the connector is a step in
the direction of allowing re-attachable marks on the connector.

Maybe...

Thanks,
Amir.
