Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A74849E5E9
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 12:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788611918; cv=pass; b=n8A+i2/o7c09w7kXf0rUicpaxVSKk9AxEwDggEQUZK+9E87vqm5R0M7Ap53Y4chm7pc1EVO6g/0YAA4DfAJNztrw0LOLC8EP+Urr3TpEBhVKE7DUART5jsLqdwmYOXHUzJTSAXtJLt4ic7JwZzTQJlh6YgLuKHDa4Wp1Oe5/DLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788611918; c=relaxed/simple;
	bh=/VB8kPsUuiESUyZLNaK7eoeQNFH/O0TKNtSOgdqA5sU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l8PXXAb2P4ZWDHyZsEGmogOaN2C3CJP2O52PZAy+BaGrtAp2zYwdRbzq+fNvVtlo9jVVgyNvOAgDVx99to8DU+QnaJ4XOIP7rxzwx/QOeJBFyFHzY6A6cXV0VVN7i1zsVaVHoJaPUOpNqSTgXhAOzSJOsuuKzae3kUp2pfjgDqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JF8Ow5yj; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JF8Ow5yj"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2637dd37c1so16256966b.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 05:38:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788611915; cv=none;
        d=google.com; s=arc-20260327;
        b=qspOaykawEld5fZI0OoG54BEv/z0yTW5yajajF5HtDDGe7ph6PpapCVtNq5Nk7l+4F
         2N6FTfrdNswT2C1deR511HF25mjamPTOD5DkL5pW97rcCNZ4EUFhMQrMZMHd4o7kTj2J
         rzNJ+rWyPm578pmdbUAOV4evNlLy4sQvydpwqQLK2J2BI5BzvWBkL5d0WPhIr+g5QKWz
         VY3C36fHh99qjhiLJUBWg9WY8ksej982eJE1VpUrCIhdv8AIx+re96SmVQEO1dOJCsyE
         R5GUYG0ZuC30k1ofVuVpU5UG83HKcanCva1eF7t/ycZYQKmIweaig1is/+QovAXWKuXN
         5JuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qLG7RD9iU+aimxs8BsGNQGssNd0C+fRBfMsrZlcG8GU=;
        fh=+3G2XfTWyvzdjGC8+29t7SSqoOprIWPQoo5LogU3aEU=;
        b=rZPj+tLanxx/a1/fKdR4yZwCcV67atdFgpgh3uNHxvsnzPP3sOibpMcTQ9iSHrmMoD
         YYhsvd1vPLv6W+k9PNGz3zSWC62ayDgV6FhOC4LhLfYPA0MRA1bBappgyuQsDJ6fzdXu
         RWpgV+S3XS6NxW+T1sSxTUGyRN39tyFPfVBWLaNzl+ELNAyzEzxRNwroCY+8dwYswbEo
         q1slORPPi5dMZ3lthvlh2A60kOFyTzir15R37GBaU4VdusGAe0E1k8lK2TRkF5QXtw9o
         XBHs0VZkfQAZqCeUZhf2pDeMm9RjMVS998jpwixoY5zxGy7MjWbWlFvcoiZALGFrH8Z2
         mKyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788611915; x=1789216715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qLG7RD9iU+aimxs8BsGNQGssNd0C+fRBfMsrZlcG8GU=;
        b=JF8Ow5yjVzTuPuze9HoWLFTO+kwO83VGjNQ3U3U2Q72U76G4cwcwEoLv3lMoAg/M3e
         fVEnIAkzCTiVsrksI5rZbsB++LKXIfKXAFI7c/tfI+ErdLktA8Kh6A8r+zWLvF9nY94J
         DGigDsFRZFmswyRTeaJwSg0nXNET1jqrhC4oXui2FgiwOyMM0ntUGPOtyfsLKsd7eQkA
         A8TqPlwMIBq5wR6zAiW3rHCmMX5t4GNd6w+BUCK2Rz5RevPjUF6yh5qHQDH4/YhRCGwx
         atNP92SUXMie2kgOkCRDWPhOHjT0ngYd2w5+gorA71Zrz24WXxXGiRJWn3RAL1eaM1hU
         gXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788611915; x=1789216715;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qLG7RD9iU+aimxs8BsGNQGssNd0C+fRBfMsrZlcG8GU=;
        b=Lwo3JeFsYZ6FSbVew/kEGZe4WxJYvDc2IzR5M2NUnBpruUnEjCoDN13U/HiUwErE5l
         2bPbFluek7sivWp34qFkLxV0h2xmJRPx0J/D/5l+RbjpMSKWtBlMIL+uT04VBKkLbDqw
         vA6Mh7LfFadXYy64k+x479Db3HRITfrRAZ/CO07fH4cVQpEXSMkWBamE51pNZUHpFBhm
         PRYmCAogXlUPbNAyfALP+x3BNFBZMzG8H1WXLr8iIdgZFxQlxMKnAl505rKAHS2bDATZ
         6FkQTyrWHWzS5tkX8kOpvscs3DsAUChn4WrCjSSCthjumLLFkIEm5mofQWzFOBFz5DrC
         YLsA==
X-Forwarded-Encrypted: i=1; AKwUvBxctq12vB5r+jUUEzpzjE+PoZgkeL6emBc8buMJlfgajTcff9fCpz11k19A0YlovWOCwIv4dRoof+aFQmA=@vger.kernel.org
X-Gm-Message-State: AFuF++mJzmVUnYA25/n8FpRtgrYDC1NI8jFZpCQ+046JMJjsAFYJ0llB
	EISUbJMstUZej0I0zLJKcLcyh5NheTAfaNwWHFh3RySqop4jMUMCKIW6xV6FT6t9Ssnr0RQ23u0
	x21F+jNpsYIHF3/2cb03HAOxgfXpzfFE=
X-Gm-Gg: AYBFou1RLgYWiR2CoW9tp0+Q8hncZupzIsdFvyOotFtHteB7Apr60YXWlkGPuFH+pae
	RdZH/RkQejoOXcYYWL5jShvTsvHlSJYoVAaik/5AgMLD+jPNHp6WN3ST/lnhccsnLUrOgOrqAtA
	J07KZqbpGHgwLrSlyaJUdCmxdSiJg4sMZfzyBqTeOJj9in9jKspGE86VZ+WlBGlCUq5H1QpGw7t
	Pi+JvBrdAKaXbYkDTTNZVmVAfc6CA4ebDn7lkBcfd/SE8qzEIiZedmc9sFB+RYeNyPLgcxmrp4W
	VWwlZzWeBh9UBmYf2H2sTpCT1gPfEum6I4yzzYYuAMK8Gw4kJO+dNTlm
X-Received: by 2002:a17:907:da4:b0:c26:1649:47af with SMTP id
 a640c23a62f3a-c26164955fcmr405970966b.37.1788611915386; Sat, 05 Sep 2026
 05:38:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904103920.4471-1-luis@igalia.com> <20260904103920.4471-7-luis@igalia.com>
In-Reply-To: <20260904103920.4471-7-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 5 Sep 2026 14:38:24 +0200
X-Gm-Features: AcwNN1WjNoiriBKtkS17brUNdc8C7v-N5CE5oPlkC6f9qSJ0JKBzPQ3mpwZvTEM
Message-ID: <CAOQ4uxhF6qaAxLFt0UP8nBbZTWVVYf_Y7zgL8Lu9xEnJzg=GiA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 6/8] selftests/fuse: add some extra ACL caching tests
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Chen Linxuan <me@black-desk.cn>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Matt Harvey <mharvey@jumptrading.com>, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 12:38=E2=80=AFPM Luis Henriques <luis@igalia.com> wr=
ote:
>
> This adds some extra tests to ACL caching:
> - Verify that reading ACLs results in the expected number of requests
>   being sent user-space, depending on whether cache is enabled or disable=
d
> - Verify caching behaviour on some caching invalidation scenarios
>
> While there, add test binary to .gitignore.
>
> Signed-off-by: Luis Henriques <luis@igalia.com>
> ---
>  .../selftests/filesystems/fuse/.gitignore     |   1 +
>  .../filesystems/fuse/fuse_acl_cache_test.c    | 179 ++++++++++++++++++
>  2 files changed, 180 insertions(+)
>
> diff --git a/tools/testing/selftests/filesystems/fuse/.gitignore b/tools/=
testing/selftests/filesystems/fuse/.gitignore
> index fb51603fe419..f7f3dd345a50 100644
> --- a/tools/testing/selftests/filesystems/fuse/.gitignore
> +++ b/tools/testing/selftests/filesystems/fuse/.gitignore
> @@ -2,3 +2,4 @@
>  fuse_mnt
>  fusectl_test
>  write_extend_eof_test
> +fuse_acl_cache_test
> diff --git a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test=
.c b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> index c2d6658ff7de..9608a0adb967 100644
> --- a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> +++ b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> @@ -83,6 +83,7 @@ struct daemon_state {
>         uint8_t        *acl;
>         size_t          acl_size;
>         int             getxattr_count;
> +       bool            cache;
>  };
>
>  /*
> @@ -91,9 +92,17 @@ struct daemon_state {
>   */
>  static struct daemon_state g_ds =3D {
>         .lock =3D PTHREAD_MUTEX_INITIALIZER,
> +       .cache =3D false,
>  };
>
>  /* ---- FUSE lowlevel callbacks ----------------------------------------=
---- */
> +static void fs_init(void *userdata, struct fuse_conn_info *conn)
> +{
> +       pthread_mutex_lock(&g_ds.lock);
> +       if (g_ds.cache)
> +               fuse_set_feature_flag(conn, FUSE_CAP_POSIX_ACL);
> +       pthread_mutex_unlock(&g_ds.lock);
> +}
>
>  static void fs_lookup(fuse_req_t req, fuse_ino_t parent, const char *nam=
e)
>  {
> @@ -115,6 +124,8 @@ static void fs_lookup(fuse_req_t req, fuse_ino_t pare=
nt, const char *name)
>         e.attr.st_ino     =3D FILE_INO;
>         e.attr.st_mode    =3D S_IFREG | 0644;
>         e.attr.st_nlink   =3D 1;
> +       e.attr.st_uid =3D getuid();
> +       e.attr.st_gid =3D getgid();
>         fuse_reply_entry(req, &e);
>  }
>
> @@ -175,10 +186,38 @@ static void fs_getxattr(fuse_req_t req, fuse_ino_t =
ino, const char *name,
>         free(acl);
>  }
>
> +static void fs_setxattr(fuse_req_t req, fuse_ino_t ino, const char *name=
,
> +                           const char *value, size_t size, int flags)
> +{
> +       int ret =3D 0;
> +       uint8_t *acl;
> +
> +       if (ino !=3D FILE_INO)
> +               ret =3D ENOENT;
> +       else if (!strcmp(name, "system.posix_acl_access")) {
> +               acl =3D malloc(size);
> +               if (acl) {
> +                       memcpy(acl, value, size);
> +                       pthread_mutex_lock(&g_ds.lock);
> +                       if (g_ds.acl)
> +                               free(g_ds.acl);
> +                       g_ds.acl =3D acl;
> +                       g_ds.acl_size =3D size;
> +                       pthread_mutex_unlock(&g_ds.lock);
> +               } else
> +                       ret =3D ENOMEM;
> +       } else
> +               ret =3D ENOTSUP;
> +

I am allergic to mismatching {} in if/else statements.
I personally think that code will be cleaner with a goto error
without all these multi nesting levels.

Thanks,
Amir.
