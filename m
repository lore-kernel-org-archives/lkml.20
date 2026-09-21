Received: from mail-ej2-f23.google.com (mail-ej2-f23.google.com [74.125.228.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7218044C518
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.151
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789978746; cv=pass; b=AG4ErwktwK/yR+Hyo5jQAQaB4k3Heb98FGVgiHSS+WaYBAeBHx866wLUdPiAJu6pE5RVX373dz5pySVCRunaYRhQL9E3FBzC77Alak4gjqvWlpC/GavU5qKb2rPSCsU9Yk2ufdkJA7oXja9AnLAL8iTazBnGMDHgaKvh4BFGOFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789978746; c=relaxed/simple;
	bh=GvYhP394c77Ut6MdVvePKLF4OaMpg1dVWEEgs3+1G5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P6Z0e+b/W4NoMNcH+xeoWHlkuQ2iyehMVBiOAIWkCyxs7Zbjrr2/3GTaP+psYRBZblZ7MEoxVrJexYK9tVg/IvN6SYheS+ChukMTtnTzs3xy8uBLR+MFe95LLBDC4d2EQFhrWsP518a66i+CYL1VlSF6iCxGxUuVPaOVptDztYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pP/6Zwsg; arc=pass smtp.client-ip=74.125.228.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pP/6Zwsg"
Received: by mail-ej2-f23.google.com with SMTP id a640c23a62f3a-c25ef7a3ce9so312846366b.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 01:18:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789978732; cv=none;
        d=google.com; s=arc-20260327;
        b=ai2PmdZ39l1evGPHiH/XPksK/jlegRm41HI+OeDsgvFvSD8EmJnPX6wg7F/wYQ3OoJ
         3agyHbQFbXGxd+jeRLaHnoPp5vB1kfP8hudoFJ1mQKgQwEidSum6gjd+dl1IHF5h+MeT
         dgWTJn+8Ph5GoXTGhLyXK7zUw+U6RbWX8FAnpfsMOy/V0gIwpnpSLWnRCRlegdaZP/7q
         R+bpZ4N9t51PfkZQ9uQZLGMTq59t0oyzyuhMkcpVQ0npQLnS7NvTFPAnZqtuoxniAxN2
         NYxZ6siVwjdRRZLoy+HMJB8w+qcF7iV4qNdZZnQEFZsa3e5exsh6tzfMirneMvFYA6GI
         lKkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=19st/Yec1gLE3J88KstsEKV+9NC3IJ8lZ4oG8CuGVVg=;
        fh=1Z180bDtvdbOLihebzYm4euZhqzydW8+oAX/vP3+ylY=;
        b=QfY4TwXXfj0DO3y0i0MFrRvx7si2CiRY8xP32LNOjxxZelJHFw+ukn5Np3J2tU2PiM
         +XGbiPSDbYzNOpiiOQVD8QxVfnP48G9UFlQDOVvx+UYe6VH6fLRkaXKXizB58yqAHw0Q
         9Yw0XLe0ruZHHeUWlHJXHH5oceNVePmpArRT33PCXEt6NC5ubAoMqOegR/YSqZKODH6d
         iAPD5PjnnlTCyU5ZhF7Nm82TB1s0UYb5n3PBFN6ZMfLoEvm36We40gNXSYwYeofdJygQ
         hDvwAVczSiAJLeND1mnogAXdMJucbZKS7Wfsorz2gBSTCu/L5uCjaAPVXpPzgaSNchpi
         UvFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789978732; x=1790583532; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=19st/Yec1gLE3J88KstsEKV+9NC3IJ8lZ4oG8CuGVVg=;
        b=pP/6ZwsgnwEtKQHxXzWAeVQ6hYuvL/3ZSpOJ4U8Jc7h2htlnatWCimWwOdl6ZMGChZ
         MYR3LNwRD6m5aVmK5ceJTPTsC2XUnjpOGLy1KJIc4TZdGWoSXfg4oKLtJELNJfFoSxty
         w4D0zCkmdw5HJpXuhpUXvHMGL7TLV5ewGGrAQOPDoAylvNVkTVzX1nl679gEYOdeCdua
         9dJq0Ba1n4UEQadRzsNIhX4hs5AGfVDcGbd1OZYsJceJuS84jPEhkY6jXczwAXCbqwlW
         NQZyQmdAPBN1gVtXVAZd0jLBLneOHG2bWY9GsHUq6P/9uhUJMvd3dAs8B7XZf/BiERvo
         PSeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789978732; x=1790583532;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=19st/Yec1gLE3J88KstsEKV+9NC3IJ8lZ4oG8CuGVVg=;
        b=BRvANiiof2DQpDvD047VBf6bl1+/LpWCl1sGJ3KaQqu1Pee669CblrVUhvw+t6jWKp
         wviIIoPRUeTTJ58egMBwhryUjym5KGAyt0Bw6bRXFJmlZ8CclN2Rsq8+Cz9c9Ga6ybLp
         5Qaf5XKA+gtlOeGtEj/VByN1gt++F/0yyohGA8KwfWLKAosO19I1j5fGZPgnw+grqilr
         ASpMYbNxUcKoIKDCumznPOE3Ynt3ujQCo8hvuGrpRJncCSaqn8wVxMlLpmF+ZLaHOVI5
         rRXlvOquOAdeN7S7Ho0KXV7H0i687ZctDCsIeY+7vPAcgQ1ScZLJMC3K3EcjFuJQjZw1
         wBCw==
X-Forwarded-Encrypted: i=1; AKwUvBzwECL4GhCigP0aoj/zJKSFaEYEzluDXQ+vH7X0BbCQgTu4otEswCoYSxbsaFx/XAuEVCXj0lc77i3hiDg=@vger.kernel.org
X-Gm-Message-State: AFuF++makBdgwSnQmKW5kPnMU2touwduTw3X59UDKCuGjBF/Fdhbjnxb
	mSg721Iv/Ay3vzdRAkrb0Nq8ZWDNOFwX2AivDx7gvxOJiQk1Y/RSvAHZfmW/bNrdtFd8aUsBFZ0
	0YaKTWOZy2pVrJ+PwLOtVXy1tRSl9luY=
X-Gm-Gg: AYBFou0N3aiOFZCSTs8fNLaNrKd1wc8RdL7yfQrsyNJALO+EPN+Zig4WcU4nL3nCCVP
	z2M7Bvs/R5dm5gInUB57scReBjedu+Lx9KSa+4ngYmOofiVkUhtotyz6BxLHwv1BekdWNF0Adxs
	hmgqXWLkblY6D4EYnyJ1+Ln+SD2+wQulAonZ3T3Q8hk0V8AoLb7dm0h8FT0oEWuTx1vwtF6ZlXY
	G849UddCrMIyGbjl3Ty5QrZPnbqM7EZ/cJPvR/6bdFtEICzBQ+xYYywQ1osZhqWXvR8suvZwX80
	GcsR6/qMyTJ+7rtJVnzaKdcTqyYiEajYnr37hD9KcXQhbUEHOOkOwf1p
X-Received: by 2002:a17:906:c113:b0:c29:4415:2ec6 with SMTP id
 a640c23a62f3a-c2a157d8b58mr725032966b.12.1789978731612; Mon, 21 Sep 2026
 01:18:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920203239.2876221-2-Jeremy.Jean@oss.cyber.gouv.fr> <20260920203239.2876221-5-Jeremy.Jean@oss.cyber.gouv.fr>
In-Reply-To: <20260920203239.2876221-5-Jeremy.Jean@oss.cyber.gouv.fr>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 21 Sep 2026 10:18:41 +0200
X-Gm-Features: AcwNN1VwgrBl2ccVf6rNXeXgU9lenbvSiFwbNGMs9vX16ZwVYtqDauUDpgmmuWU
Message-ID: <CAOQ4uxiLpwc5HgQd0bc5fH2FABMbZPjyMgm+L-ohyFkyy7ENjA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] selftests: overlayfs: keep index copy up with
 mixed lower idmaps
To: =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <Jeremy.Jean@oss.cyber.gouv.fr>, 
	brauner@kernel.org
Cc: miklos@szeredi.hu, linux-unionfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 10:33=E2=80=AFPM J=C3=A9r=C3=A9my Jean
<Jeremy.Jean@oss.cyber.gouv.fr> wrote:
>
> Add a copy-up test for mixed-idmap lower layers with
> index=3Don,nfs_export=3Doff.
>
> Write through one hardlink alias and read through the other.
> Check that both aliases still point to the same copied-up inode.
> Check that the copied-up inode keeps the expected mapped owner.
>
> Signed-off-by: J=C3=A9r=C3=A9my Jean <Jeremy.Jean@oss.cyber.gouv.fr>
> ---
>  .../filesystems/overlayfs/idmapped_mounts.c   | 103 ++++++++++++++++++
>  1 file changed, 103 insertions(+)
>
> diff --git a/tools/testing/selftests/filesystems/overlayfs/idmapped_mount=
s.c b/tools/testing/selftests/filesystems/overlayfs/idmapped_mounts.c
> index 0e94bd464f1c..ae99698c280a 100644
> --- a/tools/testing/selftests/filesystems/overlayfs/idmapped_mounts.c
> +++ b/tools/testing/selftests/filesystems/overlayfs/idmapped_mounts.c
> @@ -219,6 +219,42 @@ static int setup_extra_layer(const char *base, const=
 char *name)
>         return 0;
>  }
>
> +static int write_path(const char *path, const char *buf)
> +{
> +       size_t len =3D strlen(buf);
> +       int fd;
> +
> +       fd =3D open(path, O_CREAT | O_TRUNC | O_WRONLY, 0644);
> +       if (fd < 0)
> +               return -1;
> +       if (write(fd, buf, len) !=3D len) {
> +               close(fd);
> +               return -1;
> +       }
> +       if (close(fd))
> +               return -1;
> +       return 0;
> +}
> +
> +static int read_fd_contents(int dirfd, const char *name, char *buf, size=
_t len)
> +{
> +       ssize_t n;
> +       int fd;
> +
> +       fd =3D openat(dirfd, name, O_RDONLY);
> +       if (fd < 0)
> +               return -1;
> +       n =3D read(fd, buf, len - 1);
> +       if (n < 0) {
> +               close(fd);
> +               return -1;
> +       }
> +       buf[n] =3D '\0';
> +       if (close(fd))
> +               return -1;
> +       return 0;
> +}
> +
>  /*
>   * Mount an overlay inside user namespace @u1 (so the overlay sb's s_use=
r_ns is
>   * not the initial namespace) and idmap that overlay mount with @u2.  Ru=
ns in a
> @@ -588,4 +624,71 @@ TEST_F(idmapped_overlay, nfs_export_same_sb_mixed_id=
maps)
>         EXPECT_EQ(close(ovl), 0);
>  }
>
> +/*
> + * index=3Don without nfs_export still preserves lower hardlinks on copy=
 up when
> + * same-superblock lower layers use different idmaps.  The copied-up ali=
as must
> + * keep the same contents, inode identity, and owner as the path-selecte=
d lower.
> + */
> +TEST_F(idmapped_overlay, index_copy_up_same_sb_mixed_idmaps)
> +{
> +       static const char lower_data[] =3D "lower\n";
> +       static const char upper_data[] =3D "upper\n";
> +       char lower1[PATH_MAX], lower2[PATH_MAX], upper[PATH_MAX], work[PA=
TH_MAX];
> +       char path[PATH_MAX], alias[PATH_MAX], buf[32];
> +       struct stat st_file, st_alias, st_upper;
> +       int fd_lower1, fd_lower2, ovl, fd;
> +
> +       if (!ovl_supported())
> +               SKIP(return, "overlayfs not supported");
> +
> +       snprintf(lower1, sizeof(lower1), "%s/l", self->base);
> +       snprintf(lower2, sizeof(lower2), "%s/l2", self->base);
> +       snprintf(upper, sizeof(upper), "%s/u", self->base);
> +       snprintf(work, sizeof(work), "%s/w", self->base);
> +       ASSERT_EQ(setup_extra_layer(self->base, "l2"), 0);
> +
> +       snprintf(path, sizeof(path), "%s/l2/file", self->base);
> +       snprintf(alias, sizeof(alias), "%s/l2/alias", self->base);
> +       ASSERT_EQ(write_path(path, lower_data), 0);
> +       ASSERT_EQ(chown(path, ID_HOST + 7, ID_HOST + 7), 0);
> +       ASSERT_EQ(link(path, alias), 0);
> +
> +       fd_lower1 =3D idmapped_layer_fd(lower1, ID_HOST, ID_NS, ID_RANGE)=
;
> +       ASSERT_GE(fd_lower1, 0);
> +       fd_lower2 =3D layer_fd(lower2);
> +       ASSERT_GE(fd_lower2, 0);
> +
> +       ovl =3D ovl_mount_lower_fds(upper, work, fd_lower1, fd_lower2, "o=
n", "off");
> +       ASSERT_GE(ovl, 0);
> +       EXPECT_EQ(close(fd_lower1), 0);
> +       EXPECT_EQ(close(fd_lower2), 0);
> +       ASSERT_EQ(ovl_idmap(ovl), 0);
> +
> +       fd =3D openat(ovl, "file", O_WRONLY | O_TRUNC);
> +       ASSERT_GE(fd, 0);
> +       ASSERT_EQ(write(fd, upper_data, sizeof(upper_data) - 1),
> +                 sizeof(upper_data) - 1);
> +       EXPECT_EQ(close(fd), 0);
> +
> +       ASSERT_EQ(read_fd_contents(ovl, "alias", buf, sizeof(buf)), 0);
> +       EXPECT_STREQ(upper_data, buf);
> +
> +       ASSERT_EQ(fstatat(ovl, "file", &st_file, 0), 0);
> +       ASSERT_EQ(fstatat(ovl, "alias", &st_alias, 0), 0);
> +       EXPECT_EQ(st_file.st_ino, st_alias.st_ino);
> +       EXPECT_EQ(st_file.st_nlink, 2);
> +       EXPECT_EQ(st_alias.st_nlink, 2);
> +       EXPECT_EQ(st_file.st_uid, ID_NS + 7);
> +       EXPECT_EQ(st_file.st_gid, ID_NS + 7);
> +       EXPECT_EQ(st_alias.st_uid, ID_NS + 7);
> +       EXPECT_EQ(st_alias.st_gid, ID_NS + 7);
> +
> +       snprintf(path, sizeof(path), "%s/u/file", self->base);
> +       ASSERT_EQ(stat(path, &st_upper), 0);
> +       EXPECT_EQ(st_upper.st_uid, ID_HOST + 7);
> +       EXPECT_EQ(st_upper.st_gid, ID_HOST + 7);
> +
> +       EXPECT_EQ(close(ovl), 0);
> +}
> +
>  TEST_HARNESS_MAIN
> --
> 2.47.3
>

If Christian says this is a legit setup you may add:

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

Otherwise, we do not need two tests and we do not need any opt-in mount
options, not index and not nfs_export, the mount should just fail.

Thanks,
Amir.
