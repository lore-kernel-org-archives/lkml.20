Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794048626;
	b=0d4fuiBcaf1kcvfmEElYLglmrw/FS5Nkv5o77lRSZ/BQnYIdF5oMou3PBkiIbRs9T/XZ
	 p7r2+/wg205NRhwmIWSwTdz3pI+Owuokwj6e/4npiMNins1d0qD/5Ez0iGzD6riFg0zh1
	 puEU7REJioG8qErdG9DQB6OpLEjDm1FkUqUXzcWwsa2seXtdsHLSQy66MjL6EBVbTXmQI
	 0s+Gb2dYsYa1C+0SsGjpERidIxBdRZS7DjoOdgxDURkqbkh1PWiWTfK7P4t2UNik+6fFG
	 WSbCEaom/F0aOaMGZeAW2uIyaYV5Gae6NzdoDEMvoo3vC8QaSQf8THnez+qfwr6GrvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794048626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uZEeBH3cPO82lNtPrFEZgZR6riIHLqK/uU58y7M4AUg=;
	b=KQh9fq6cmNRoGrAGw6Mwpt0XetcCV0DBcAYiCy37tm/to0YrUmQKJmpNzOnH0ODpcjui
	 yMhBXqazHYYZ9a57Nyn4H3LHF5DDkEQIxbc1FC/C7kQhHRBQ6eQS8XbS5O2MAqxH7lItg
	 FxcfAu8UtsbP6uBYRMI1RCQNyenXFiRDlP4Mw9e364ugDJ6f+umL1CIgQCIX1SVSDGREj
	 +fYKT8RgyDFHmpz+D0Yg7qSjsn0gL4kKpeUPts7iiV6yzHUy813xbb+guvW4Shueu+ut3
	 iRKNp8IlhB9La9SKGOzG8qv6qcyo4mVp10T79XfuB/IU6vqkGb6tGKgGSSwxJ3Y9cgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uyLXrvTc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72523606A336
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:50:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72523606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uyLXrvTc
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b429f71dbeso1432459a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 02:50:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794048624; cv=none;
        d=google.com; s=arc-20260327;
        b=cfFLdgOkxo2Su9YoCOcvp71uwrvtIqQcQn9LeMwnZG5UxI9q4gffewNCUdWk/SM2xt
         Ccm+VGDu5NsEWBpIB0eYZ/lZ9t1UZIAklGBSja+dcXBp4k/+VxHrXNh0bj4FKQaKbEun
         SsP9NvjvBmvbJ4hdcxyy9qqirrjFFugSIUW+rqh1uevK6a0ZDVqxGemf+/Ppfty2xw+G
         zEq1UTjw82m15EuCAYUKhAU2OQ7jLDxka3o0Jh4YEvVznJJO0CSjy/fFSCR/kMoFnram
         dPtJ/d3yRNDU/mUCdsoDosomSPsiGfiOMa4yjzsH268R17o0eP+RVCbUjmYyPUBmPDGh
         Ylvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uZEeBH3cPO82lNtPrFEZgZR6riIHLqK/uU58y7M4AUg=;
        fh=Qko9YPWyR5S+MNZpzzAlGdO2Shy+FTOxOokUPbUcJRI=;
        b=nD50OXqbKFAmJ9esZffxDpKfELVrW+UVn0axYRGehZfO4aC5yTj2FXkwWx1xi6Yoxb
         hxtcK6+S8u0ltpgFON/wSRVs0gHcjDets/ln8xMYGNSu6s0W0AK0aSHi0gbsq7sZUqqa
         kAg63jCQ/PyQs33vk70p8CwMvyW6pIjOjLt8lWcfE/2Iv9PESWmGzm/9u88P1drAQAXp
         jRi4C3rhh+GH8OYR9IcCgwVd4PTvsspuDAEVIY5Y6rnl3ur5pe4T/WcEaVG3oK9VXI/T
         kJ4ewvg7youZru0BPzvv82Aj1DrI9XmCpmjOAOHyqyUENdJA7xgqqyjl2fNRkt+urT57
         DXKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794048624; x=1794653424; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uZEeBH3cPO82lNtPrFEZgZR6riIHLqK/uU58y7M4AUg=;
        b=uyLXrvTcnXlGMF4xHoIVZwtvjFB8F2h/zLHGfHi7tmHkHI0SX0Bhe5BQlIXtme5dso
         toor8SB4OufO4DTR0sh4uID6VtjVB+ZQa46GiV5RymVEZPpQdLqiZbXv7dnradhrBlsX
         E4Z1Esh7xd2cEVb0ldUSsGr2qFsZmFDbjdgEwl2xLBTZU2V+9wRSBuNodZZW3/2v+O96
         8Jfkwj2sGa4vN+zirC6oQNLLr2w1dvIq/ssxMgyRZZaxiJky5GOkad0uVqlWosNpWkOT
         HluawS3aZwuvW5MPHQmCFGMJtNzDHDdr6LF7MD1HkrUWlsR9i2c/Ai6V/V4hOM+OW1lo
         2Nvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794048624; x=1794653424;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uZEeBH3cPO82lNtPrFEZgZR6riIHLqK/uU58y7M4AUg=;
        b=17aMPrbwyriHkE/3J9YlZy0ls1dTOwouw3kseUyooWOSPjzwl6S0HCOIHsfs/5tSCr
         qDH2FdfJrfjX3wpi4l11keFkRhIrk5VIMcd2S50B91ts2IZr9uJ3ud5kOnGnLRLBVyZ9
         a8Ur4aH1wEg/m7hBpDuwLhhnM/IJewiTg/wUAkgGFwy7NlF0msbsqgy6x2v12TkQItPc
         6MM1kx00SbRpJH0w2iCXYStpCk2+vjbdtlC5zm8raQlQAndhUXwn2gBXwhgbTCwqezf3
         Mbq8R6wX7P2leoYb/zZkdoJKd1T+coU//vxvVuQ9uUh5P3rJV2QnF694l1N+IM+SHsNG
         655g==
X-Forwarded-Encrypted: i=1; AL+hErGYtVTZT7B8hub/GRe0dV30I4TRwrQ7jsjmSvD+gRo8uurelZUhfkSyPwUkBlcapv/e8tH7VJq5oLpIio0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pitms4Q6gOLPSwjAoEZEHvc/QCEAOS4PZw7Ar5Y/bvWv/fDpG
	wOVvRPDUf6AMvnUl4xxQ7D3B3kDbn6lXUnxcbCsW1dfhLbn3T5bn6ZuG2lGo96ESo8FSquBJBpg
	I2IYmCpliSMKxa1+fjgbvzeBmUhtpwbo=
X-Gm-Gg: AYBFou2wLYZm04txhP7arM6cPwB15NN3jjL9uH3Dob+is0TBc5KYzJPpNZ+jJkGrCNq
	GzkFuHxPuEbcFiRwajfYuTwTswXifN0AX5Tg0c7EjewHggu0svdnBjR7VGrNYz4yCZNIQQkOkA0
	QZNh5aGXCtVJf/I9ZhNeh/YNhUo6yvQ+9LjW3BQg9mTzgBW6W24zJkr2DXe/k8sKQ6weo7qgQ8Q
	69TzVICa98kFt5L5K0zr9wW1u6/zwY8ULOqDyQWP28wMnhiNuVkiT5SXG1j4mm9lYNc+eyusTxI
	xQa8y/TgnDV71cMPNWbfUbqo1zVVDMSENYPnSMS1an28CuEHnoxnpvXuEbtIgyrrhRRkXwTqvrg
	FSBXml/0BF1CttDJPZ+uYGXxDS7dzaBnN7MVMy4ggn/ak6V5AOVYwudp+0hdkfExlJib0NmhABi
	JxjVWYOSw43+RrJsY=
X-Received: by 2002:a05:6402:5d5:b0:6b1:d2ee:392f with SMTP id
 4fb4d7f45d1cf-6b5977e0f6amr3462312a12.25.1794048623497; Sat, 07 Nov 2026
 02:50:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106181459.4166343-1-den@openvz.org>
In-Reply-To: <20261106181459.4166343-1-den@openvz.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 7 Nov 2026 11:50:11 +0100
X-Gm-Features: AclHuK9oP7KQWFNTlKkk0yY835oIARMUfGhV4uGnUmqeGmnb5Kbt_bc3-VonTGM
Message-ID: <CAOQ4uxi=Ac=N03ZXJFV9tzxzLJVhiY7Ppv0H-YaV0_cCJiBcnQ@mail.gmail.com>
Subject: Re: [PATCH] ovl: release the upperdir/workdir in-use locks before the
 umount sync
To: "Denis V. Lunev" <den@openvz.org>
Cc: miklos@szeredi.hu, linux-unionfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 7:15=E2=80=AFPM Denis V. Lunev <den@openvz.org> wrot=
e:
>
> From: Denis V. Lunev <den@openvz.org>
>
> The in-use locks on upperdir and workdir are released by ovl_free_fs()
> from ->put_super(). generic_shutdown_super() calls sync_filesystem()
> before that, and ovl_sync_fs() syncs the whole upper filesystem, so the
> locks stay held across a journal commit and a cache flush of the upper
> fs after the overlay is gone. With index=3Don a new overlay that uses the
> same upperdir, or uses it as a lowerdir, fails to mount in that window:
>
>   overlayfs: upperdir is in-use as upperdir/workdir of another mount,
>   mount with '-o index=3Doff' to override exclusive upperdir protection.
>
> Userspace hits this when the last reference is not dropped by umount(2)
> itself. Docker with the containerd snapshotter mounts a snapshot on a
> thread with a private mount namespace for docker cp and for buildkit,
> and the superblock dies when that thread exits, after the reply to the
> client has gone out. The next request then gets EBUSY. The window grows
> with the flush latency of the upper fs and is there even if nothing was
> written through the overlay, as the mount itself dirties the upper.
>
> ->kill_sb() is called once s_active drops to zero, with no mount and no
> open file left. Release the locks there, before generic_shutdown_super()
> runs. What the dying superblock still does to the upper fs, the sync and
> dropping its references to upper dentries and inodes, does not touch the
> contents of upperdir or workdir. ovl_free_fs() still releases the locks
> for a failed mount, so clear the *_locked flags to keep it from
> unlocking a second time and dropping the lock of a newer mount.
>
> This takes the sync out of the window but does not close it: the final
> mntput of a dying mount namespace runs from task_work, after the exiting
> thread may have reported completion. Userspace that needs the
> directories free should umount(2) before saying the job is done.
>
> Fixes: 2cac0c00a6cd ("ovl: get exclusive ownership on upper/work dirs")
> Cc: Miklos Szeredi <miklos@szeredi.hu>
> Cc: Amir Goldstein <amir73il@gmail.com>
> Cc: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
> Signed-off-by: Denis V. Lunev <den@openvz.org>
> ---
> Tested on a 6.12-based distribution kernel, where this code is the
> same, with a reproducer built on unshare(1) and with docker cp and
> docker build in a container. Built and checked on master.

Applied to ovl-fixes with minor change (see below)

>
>  fs/overlayfs/overlayfs.h |  1 +
>  fs/overlayfs/params.c    |  5 +----
>  fs/overlayfs/super.c     | 12 +++++++++++-
>  fs/overlayfs/util.c      | 12 ++++++++++++
>  4 files changed, 25 insertions(+), 5 deletions(-)
>
> diff --git a/fs/overlayfs/overlayfs.h b/fs/overlayfs/overlayfs.h
> index 901335026a20..85e167a060f4 100644
> --- a/fs/overlayfs/overlayfs.h
> +++ b/fs/overlayfs/overlayfs.h
> @@ -583,6 +583,7 @@ static inline int ovl_set_impure_dir(struct dentry *d=
entry)
>  bool ovl_inuse_trylock(struct dentry *dentry);
>  void ovl_inuse_unlock(struct dentry *dentry);
>  bool ovl_is_inuse(struct dentry *dentry);
> +void ovl_inuse_unlock_all(struct ovl_fs *ofs);
>  bool ovl_need_index(struct dentry *dentry);
>  int ovl_nlink_start(struct dentry *dentry);
>  void ovl_nlink_end(struct dentry *dentry);
> diff --git a/fs/overlayfs/params.c b/fs/overlayfs/params.c
> index 5a15e5478a6b..82e270711dbc 100644
> --- a/fs/overlayfs/params.c
> +++ b/fs/overlayfs/params.c
> @@ -849,11 +849,8 @@ void ovl_free_fs(struct ovl_fs *ofs)
>         iput(ofs->workdir_trap);
>         dput(ofs->whiteout);
>         dput(ofs->workdir);
> -       if (ofs->workdir_locked)
> -               ovl_inuse_unlock(ofs->workbasedir);
> +       ovl_inuse_unlock_all(ofs);

I moved this up to the start of ovl_free_fs() to be consistent with order
in ovl_kill_super.

Thanks,
Amir.

>         dput(ofs->workbasedir);
> -       if (ofs->upperdir_locked)
> -               ovl_inuse_unlock(ovl_upper_mnt(ofs)->mnt_root);
>
>         /* Reuse ofs->config.lowerdirs as a vfsmount array before freeing=
 it */
>         mounts =3D (struct vfsmount **) ofs->config.lowerdirs;
> diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
> index d9174eaccce2..c7018dde1228 100644
> --- a/fs/overlayfs/super.c
> +++ b/fs/overlayfs/super.c
> @@ -1609,13 +1609,23 @@ int ovl_fill_super(struct super_block *sb, struct=
 fs_context *fc)
>         return err;
>  }
>
> +static void ovl_kill_sb(struct super_block *sb)
> +{
> +       struct ovl_fs *ofs =3D OVL_FS(sb);
> +
> +       /* Nothing can modify them now, do not hold them across the sync =
*/
> +       if (ofs)
> +               ovl_inuse_unlock_all(ofs);
> +       kill_anon_super(sb);
> +}
> +
>  struct file_system_type ovl_fs_type =3D {
>         .owner                  =3D THIS_MODULE,
>         .name                   =3D "overlay",
>         .init_fs_context        =3D ovl_init_fs_context,
>         .parameters             =3D ovl_parameter_spec,
>         .fs_flags               =3D FS_USERNS_MOUNT | FS_ALLOW_IDMAP,
> -       .kill_sb                =3D kill_anon_super,
> +       .kill_sb                =3D ovl_kill_sb,
>  };
>  MODULE_ALIAS_FS("overlay");
>
> diff --git a/fs/overlayfs/util.c b/fs/overlayfs/util.c
> index 521717209b2e..517d503fc557 100644
> --- a/fs/overlayfs/util.c
> +++ b/fs/overlayfs/util.c
> @@ -1050,6 +1050,18 @@ bool ovl_is_inuse(struct dentry *dentry)
>         return inuse;
>  }
>
> +void ovl_inuse_unlock_all(struct ovl_fs *ofs)
> +{
> +       if (ofs->workdir_locked) {
> +               ovl_inuse_unlock(ofs->workbasedir);
> +               ofs->workdir_locked =3D false;
> +       }
> +       if (ofs->upperdir_locked) {
> +               ovl_inuse_unlock(ovl_upper_mnt(ofs)->mnt_root);
> +               ofs->upperdir_locked =3D false;
> +       }
> +}
> +
>  /*
>   * Does this overlay dentry need to be indexed on copy up?
>   */
> --
> 2.53.0
>
