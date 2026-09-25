Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4CB391E7B
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790348723; cv=pass; b=OA9WxiWaEVW4UjaIjUOdDm6TAmZ/U+b5B7b73oiy/fQZXEMakZuUEM1cVirUMSdPxOuFs2WEIPMQUhmhDIua4G/PDcRlkTRz3Nil5Q4nKMBb8pzn2YD2yGI2Wuqpy3b6RQEJvQLNBFjR3CmG25sUrEpJ53ySm2kNDaYd4zxZOTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790348723; c=relaxed/simple;
	bh=WAWqhJNmyo51Od5KW8SJ0vK6DSlgvw2LcK3VD7saVMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ELrD7I+aAEvfrjKPMOvMO+uwFEAh2JMCF/f6aknn+GdPy+jqtG3dr0QWOwCV6OFEYaYzGpBwN4MMI7BjuR4+26uDeMiTdYXOJxtzEfsz+6uh9Av4jqAagnYiSKKfkTSAY7q2MIWO8Eena52illc9XH7QBiTk27hvRzUmEbnUjPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EjQmcmay; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EjQmcmay"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a996c8adf3so1716296a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:05:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790348700; cv=none;
        d=google.com; s=arc-20260327;
        b=dkURUVKB0vVPh0DYLUbXORHwJSVJD8xkCDbNWF69eNRtbxcsowubVFM4qkI2x+E2KE
         szcaaPkekfWQWBpHFpDMtKd2qvUWuzyjaQYmJ5w6tYRpJ4WwsCBsoLV0x7VX3GDGQTTy
         V+C6/+7H2YMZJ1kSR2A9h2SbcEXvCadptkHj6yp7QLg6qz6lbaD2mtD76GlG/uJVGPgM
         Ap3vjW7P952yU8Dz3riry6Eg/LC6XWSI4vsJcAmu6rgGBk76xZB0nlc/hm4C0yon8yOL
         BCH3ivSy0yCKaidz+/7ayYYUBLCDXbHHXokEyHr1WCzoSFNYLuY7PI6OkmmC71Bd+0vd
         4L9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x6h1BVvc6NlZ/1f8ypPzy3ocqWyFlnaev/ls/pKUnb8=;
        fh=eyFQa+FNn6xrv4kJCfGU3FZkv/a8uZK+MI6rozIoFb0=;
        b=l4IrsqOpkm8tM/HLe3F01ck43tzW6xlIGG7fIYa7NLDNqAPHQ2AkO4LcH38/bBNSnq
         k+/RbN5wNCYrNy/ZrqxV5rESvaclq8wiutjA3E2B/v7RFpBTdupSf9JyWMxDXqwzjB3/
         Tjd2U3fVStVFEH5zcg+GlvrieMA9ZU7iFpTmz9GVNQC01xTkVZwC51dQwpEyKvOxwcv8
         1tpZYV9beqDErP75dyFGk0zbX8SbpQOGg2JRYxXZkS0+xyvHo1V+1S5EgtxPzvLB/6bY
         52CWpLz/0fFPLKq0xBBAA81PRvcSfC0VKA0xgFGHcBjHpHL3Jbl5+noIjXU1zS4jUCRg
         FAGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790348700; x=1790953500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x6h1BVvc6NlZ/1f8ypPzy3ocqWyFlnaev/ls/pKUnb8=;
        b=EjQmcmayCVkHHRheUxRBMKhMGxjjSG3w9P62Mo/R5MrPRDrQ7AtdMFociIibDGvO9Y
         lTB8UjLcG90to0VIOsJSOyoOgbWhm8Jbl+3FqPP9uTzEgkKEZYXB9omRzSLOh2VWnB4/
         qVgnSgh3i7vc7m5ApBRXVzyfjoPU3TyNN1n6FVxFwVvDlP2fuG/OrjI4av6aOZQjJtHn
         V+p8BP9VmGllwqsx5kUqGHzDNSdHR08aCI7+UrpTMTRPtFfA2v0nSFxeG4VcrcwVtdHv
         iW6tD0qxn+tsWfoGbU/gUPDrWnWDkUMFI17wxrWnFFU8M1RRzO0K+CINdoJpjohcIITP
         gG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790348700; x=1790953500;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x6h1BVvc6NlZ/1f8ypPzy3ocqWyFlnaev/ls/pKUnb8=;
        b=0taIu6YWQ1K6hMLZCYtvR4f6ADAr3Kt0JHDJz1oLJzvViubDmWWgDMAKy7XNwJ42H/
         EsEtsZum0K7ppUQjIiM2pHG89ew6UxaFCUbisLHfxILCfpLZcHt9vV+6ZPmbYrNAdkSW
         EKJ3dXQ+lHF5zMvG0QXpmsa3beF3Z5XTTWGrOZrFBXjqorFoF0b8MWLrGAkA1ij7nsJw
         ub9I6FVlnMapFIduIde7D0Yyl16JEtn2WTyBaPRy7ju7/Thr2eaMQ1bQQv7ijB4xcfRs
         Okzjw6M2JTIEaSvhG823D7THnVMVAzxdSCUv04eTvDomnbjToZCLAK4GMMmGwpxkVEXk
         EhsQ==
X-Forwarded-Encrypted: i=1; AKwUvByctvqvntEIDgHYgBxkX3kmw2sEbWRxS/Tx6reRYgkB73iiO4JSB4AV+1VFdGGiLwQgfzAPLIfqUStihFU=@vger.kernel.org
X-Gm-Message-State: AFuF++n58B51/fK1hMLqpSoSg1/udE2sN/5jRshLP3VjDaWG6YtVU3uq
	lQiHJwPAhaKLRIqDWVrZr/j4Aljm4ohjoDqeRsNdySRiQBu4G/aIJA5umsb45A7qRijkoylyi/j
	uQh6+bP6Tmzx1Q+3t3tZSIU8LNyQRzlA=
X-Gm-Gg: AYBFou3jcvgL95Kf1b6IDPtI4IbSYXvI6uMxwbKmYsCRDyyIVds7VGNx0xa0SeVz2x2
	1yDlizzNRblPA71y72nqkpPnuZa7DBvxYvNlhG/0sAppNmESvVzmgtja+DKW6BYBuIVxuwsZywu
	3AgLL7uixk0ulnZSlR9ZzmgUtZYJHegxpRz/lSg1r7Ctts1Jb5ctTLkbB5yuuRAhDkIQIN7XoU5
	EvnK0Os9ixAEzfsgbVVZuox9cjio56CUQOmlKzQxWvWpC6uC10CTyg147toeWhUarDnO297CC/q
	RA8s9fM7CDE4hTe6/t9FVw7heXJYU6dMKIzilmqcSwyPfruS0hTzC5pEiA==
X-Received: by 2002:a05:6402:304f:b0:698:c13e:179a with SMTP id
 4fb4d7f45d1cf-6aac8f0fb76mr4307366a12.10.1790348699463; Fri, 25 Sep 2026
 08:04:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924112858.51392-1-disgoel@linux.ibm.com>
In-Reply-To: <20260924112858.51392-1-disgoel@linux.ibm.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 25 Sep 2026 17:04:48 +0200
X-Gm-Features: AclHuK99bcpAkghS0fUG2lImCTNfTZaz5pVDj1Ros9PGZp_xBJVRQl4OTsgjcsA
Message-ID: <CAOQ4uxh+VbTTUTQxRZ6jxYCLyBedKEPOQAPEkrJwhbiL32eGPg@mail.gmail.com>
Subject: Re: [PATCH 1/2] ovl: fix mount setup failing when override_creds
 drops CAP_SYS_ADMIN
To: Disha Goel <disgoel@linux.ibm.com>, Christian Brauner <brauner@kernel.org>
Cc: miklos@szeredi.hu, viro@zeniv.linux.org.uk, jack@suse.cz, shuah@kernel.org, 
	linux-unionfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 1:29=E2=80=AFPM Disha Goel <disgoel@linux.ibm.com> =
wrote:
>
> When a process drops CAP_SYS_ADMIN and calls fsconfig(FSCONFIG_SET_FLAG,
> "override_creds"), overlayfs saves those restricted credentials in
> ofs->creator_cred.  ovl_fill_super() then wrapped the entire mount setup
> in with_ovl_creds(), switching to those restricted credentials for the
> duration.
>
> Mount setup calls clone_private_mount(), which checks CAP_SYS_ADMIN
> against current credentials.  With restricted credentials active, this
> check fails with -EPERM and the mount fails even though the calling
> process is fully privileged.
>
> Mount setup is a one-time privileged operation and must run under the
> caller's credentials.  with_ovl_creds() belongs only in post-mount I/O
> paths.  Remove it from ovl_fill_super().
>
> Fixes: 539a0879de47 ("ovl: allow to specify override credentials")
> Cc: stable@vger.kernel.org
> Signed-off-by: Disha Goel <disgoel@linux.ibm.com>
> ---

Hi Disha,

Thanks for the report!

>  fs/overlayfs/super.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
> index bd0a3f9039d2..29f9489b8242 100644
> --- a/fs/overlayfs/super.c
> +++ b/fs/overlayfs/super.c
> @@ -1557,8 +1557,12 @@ int ovl_fill_super(struct super_block *sb, struct =
fs_context *fc)
>                         goto out_err;
>         }
>
> -       with_ovl_creds(sb)
> -               err =3D ovl_fill_super_creds(fc, sb);
> +       /*
> +        * Mount setup must run under the caller's credentials, not
> +        * creator_cred: clone_private_mount() requires CAP_SYS_ADMIN,
> +        * which override_creds may have dropped.
> +        */
> +       err =3D ovl_fill_super_creds(fc, sb);

Without ovl creds, the name of this helper is a bit odd..

>
>  out_err:
>         if (err) {
> --
> 2.45.1
>

Chritian,

I see that selftests are failing on upstream:

#  RUN           set_layers_via_fds.set_override_creds_nomknod ...
[520332.680688] overlayfs: failed to clone upperpath
# set_layers_via_fds.c:516:set_override_creds_nomknod:Expected
sys_fsconfig(fd_context, FSCONFIG_CMD_CREATE, NULL, NULL, 0) (-1) =3D=3D 0
(0)
# set_override_creds_nomknod: Test terminated by assertion
#          FAIL  set_layers_via_fds.set_override_creds_nomknod

#  RUN           set_layers_via_fds.set_layers_via_detached_mount_fds ...
# set_layers_via_fds.c:711:set_layers_via_detached_mount_fds:Expected
layers_found[i] (0) =3D=3D true (1)
# set_layers_via_fds.c:39:set_layers_via_detached_mount_fds:Expected
rmdir("/set_layers_via_fds") (-1) =3D=3D 0 (0)
# set_layers_via_detached_mount_fds: Test terminated by assertion
#          FAIL  set_layers_via_fds.set_layers_via_detached_mount_fds
not ok 7 set_layers_via_fds.set_layers_via_detached_mount_fds

oops, I thought these were running in CI...

Apparently failing since v6.16-rc1
c28f922c9dcee ("clone_private_mnt(): make sure that caller has
CAP_SYS_ADMIN in the right userns")

The question is whether doing the guts of ovl_fill_super() with checks like

int ovl_can_decode_fh(struct super_block *sb)
{
        if (!capable(CAP_DAC_READ_SEARCH))

Without the user provided override_cred is the right thing to do.

Could lead to confusing state post mount.

Thoughts?

Thanks,
Amir.
