Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279925;
	b=gzsq3O1WnS+ilcTgk2GI20z7UodDsUEv/NTjIliU9HblkPlFs1K58j63f8vPA6hvZP+Q
	 IJRt4Z9USIOkALUEbSAa6/bd1ebBI/SvwDyXEGqLRj5nsuT6QpD5yRpz1jqvEs0fR1Uj6
	 iIXOI8UgZ2RV12Gsi24vhERE1dhHQxPDgd5mi/zLpb/Sz4UHt2ZNJlLqlyRMUhycehA4i
	 xO+euq+uU6hJRj4kN1bfg1hgFibIM468J3/gK6Rc/eIUgE6EKxBSJ8BwHOT0tPPRKWWBy
	 leJwVYIafU7lcFN4A2Xlh8FCxRml5gYqO8SkOHQU6eMxVof48F2hhIDpTt8sVvGBRfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279925;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/6BHI52ERTPfI4/6NKaL9AW/hxZtgzX02Qh7eA7Qxj0=;
	b=tqo0hQ5rS8y5gBQGTkt4N1KLMVPDX/xMy0r9zaHdNMw71wdSiOG+P90dM5CjyJWdOqQs
	 l3lt8ad2or6t9nL0PEWyM4GcrWo4GU8w6fmYySSgwQYHQZQLSq1ovCCP9QNeZ8YHytqQl
	 tYq8y2T744m/qPGsK5fGUhwynbOAQA3Dxu16BzR7jch8faJD+xOB7POrcG9VhrW6vlOUQ
	 4RtiHyu/0sg1DzsGHdPcwCAOWW5Bs65sOOqeZNNsX/FN/mB+8qkscQNTJGJId+urNES0Z
	 LZXx9O7VUy4z8YTNv5fPidJViTXw2TyJQM35FtjTrC7t6rmHHThQQlRP2mrQNHUJM0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nya8mIpR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BD8606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nya8mIpR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E688D1F008A5
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794279924;
	bh=/6BHI52ERTPfI4/6NKaL9AW/hxZtgzX02Qh7eA7Qxj0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nya8mIpRrn+ztEKdEwyDZiWPELNzvOi83hG7jczhRjnJeid8jbiUvZpHjuSnMxQZM
	 CZ/gGkr3Yp6lxM81PxHK6XrOiTj2WcMFdPWRrlCA6L5BxbMzBYowZbSaiU/CrSzyW9
	 KaQvzLZ+0nV5AYDbjdnHtHdeDdUNpr8OLwL5FY8PJYe5cuBD4atSWuCXvifmlRPqBA
	 Xxuu62z8whV7T9dFlJnHZKaREa0ej7RC3G5HPhPArZ7wjuIJusEaQSjQUTQevhLuAa
	 Q0dIhJnx4DMb+zRfmV0zP7JG0m+R7JWOKG+CE/GVQ8CEiAo1lu3dQ0qIJ48y9A/8j2
	 r9DZRU+jhufqQ==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c14f7768acso1174825e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:05:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFL8cFC46531GSwuNE1Kls0IrhXuzL0v0vqG8NZsUrXADWDPCAobjXSCDA9DAYTzxOCXsBsfdY/LOy3qfY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sYY4FBq5lpIXnj/8ihGrqMx4ujyZc+3jMv9BqsYiC5QzrEd87
	eah47Gko0myKlUSYrBw4yg80OLHYv7qqEFxtcCAt1J0kJybR8GqId++J2l/RdZwOfKTIFHHJtL0
	wIPYDgQ69FAwWPqVz47DK+1xXBPb6hzw=
X-Received: by 2002:a05:6512:2342:b0:5b0:c95:cdb9 with SMTP id
 2adb3069b0e04-5c156e7eccdmr331630e87.23.1794279923598; Mon, 09 Nov 2026
 19:05:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <1794274310.6AF27406.001.4jNpzB4CVLzch9@fangwg01>
In-Reply-To: <1794274310.6AF27406.001.4jNpzB4CVLzch9@fangwg01>
From: Xiubo Li <xiubli@kernel.org>
Date: Tue, 10 Nov 2026 04:05:11 +0100
X-Gmail-Original-Message-ID: <CAOuZWzy9ro0r4RhYqKEBVPLnjNueQGCAV9bTGpN_PtArbY6soA@mail.gmail.com>
X-Gm-Features: AclHuK98pgQWvgrz-2fuLZ-hDjU0FUEf9dCbLSOqbk8mNjaT65KUEvCFdnB2c6o
Message-ID: <CAOuZWzy9ro0r4RhYqKEBVPLnjNueQGCAV9bTGpN_PtArbY6soA@mail.gmail.com>
Subject: Re: [PATCH] ceph: drop stale dentry when ceph_unlink() gets -ENOENT
To: zhangdaolong <dlzhangak@isoftstone.com>
Cc: Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, 
	Viacheslav Dubeyko <slava@dubeyko.com>, ceph-devel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 zhangdaolong <dlzhangak@isoftstone.com> wrote:
> When a synchronous unlink, rmdir, or rmsnap request in ceph_unlink()
> fails with -ENOENT ...

Hi Daolong,

Thanks for your patch.

The change looks fine to me, and it matches what ceph_async_unlink_cb()
already does on failure. But I think the commit message should be
narrowed down.

I tested it with two kernel clients against a vstart cluster, with A and
B removing the same 2000 files (and 2000 dirs) at the same time. The MDS
returned -ENOENT to about 2000 of the requests, but even without this
patch A was left with no stale dentry: stat returns ENOENT, readdir is
empty and every name can be created again. B's unlink revokes A's
dentry lease and the parent's Fs caps before it completes, so A looks
the name up again anyway.

The case that really leaves a stale dentry is .snap: there is no lease
there, so after a failed RMSNAP "stat .snap/s2" still finds the
snapshot and "mkdir .snap/s2" fails with -EEXIST. Your patch fixes that.
With the d_revalidate change from the other patch the RMSNAP is not
even sent any more, so what is left is the window between d_revalidate
and the RMSNAP. Please describe this case in the commit message, and
call the regular-file part hardening rather than a bug fix.

Feel free to add:

Tested-by: Xiubo Li <xiubo.li@clyso.com>
Reviewed-by: Xiubo Li <xiubo.li@clyso.com>

Thanks,
- Xiubo

zhangdaolong <dlzhangak@isoftstone.com> =E4=BA=8E2026=E5=B9=B411=E6=9C=8810=
=E6=97=A5=E5=91=A8=E4=BA=8C 02:31=E5=86=99=E9=81=93=EF=BC=9A
>
> When a synchronous unlink, rmdir, or rmsnap request in ceph_unlink()
> fails with -ENOENT (for example, because the target was already removed
> on the MDS by another client or a snapshot was already purged before
> the request reached the MDS), the MDS replies without a dentry trace.
>
> Currently, ceph_fill_trace() only invalidates the parent directory when
> result =3D=3D 0, and neither ceph_unlink() nor the VFS layer unhashes the
> dentry on error. As a result, the stale positive dentry remains hashed
> in the dcache and the parent directory may retain CEPH_I_COMPLETE.
>
> Fix this by clearing the parent directory's completeness and calling
> d_drop(dentry) when ceph_mdsc_do_request() returns -ENOENT in
> ceph_unlink().
>
> Suggested-by: Xiubo Li <xiubli@kernel.org>
> Signed-off-by: zhangdaolong <dlzhangak@isoftstone.com>
> ---
>  fs/ceph/dir.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/fs/ceph/dir.c b/fs/ceph/dir.c
> index 6eb5b1cb039b..f4c0521f3bcc 100644
> --- a/fs/ceph/dir.c
> +++ b/fs/ceph/dir.c
> @@ -1473,8 +1473,12 @@ static int ceph_unlink(struct inode *dir, struct d=
entry *dentry)
>         } else {
>                 set_bit(CEPH_MDS_R_PARENT_LOCKED, &req->r_req_flags);
>                 err =3D ceph_mdsc_do_request(mdsc, dir, req);
> -               if (!err && !req->r_reply_info.head->is_dentry)
> +               if (!err && !req->r_reply_info.head->is_dentry) {
>                         d_delete(dentry);
> +               } else if (err =3D=3D -ENOENT) {
> +                       ceph_dir_clear_complete(dir);
> +                       d_drop(dentry);
> +               }
>         }
>
>         ceph_mdsc_put_request(req);
> --
> 2.48.1
>
