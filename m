Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962B938330A
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 14:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788617518; cv=pass; b=QfoCfJYEJKT7fxyoKFUp66Y1Jq9yb/F+MeXC4ZXF27IzHq7Iv6Eo/3SaHO/RJMzBv5aBsw3Wp1xFmRuVWiavlUhzevEAzpN5idWyBo90I7oVLXWRcMPSRlUVWNvN3qIjzEDOcdo0zmy5Clo5PzhIdA/zSwP118C8HLtPBrgtvDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788617518; c=relaxed/simple;
	bh=lvUK/fKlC/5odo3hYQRDDPopCyKykRxFDlQPs6Wbxvo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tvtmUepupN92eVDf27RSI0egAofJUh9IUqfv+OysvSzKNq4I1smxd4kaHoQ954KDlISvIwqsFKvhxi8Q7Rt8wQ6HkpbCbAq1aTMwl7spkclhrP81RVG3aNlTQiZEqqixICK0H+MjlGO8VbsIxm8266flmm3/FEmkgYHKDZQJ9mc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sdFi4gtn; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sdFi4gtn"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so17814785e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 07:11:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788617515; cv=none;
        d=google.com; s=arc-20260327;
        b=SDQEnXRDhLd4gjLhUScOYxUNy6WHTkc1YBq/M+9bpheHNkYq4797GX4h7sfz4a2dOe
         1WVk+f0QXqaOCJK6U9EnBkB3L+RlMmqTyZDKUDrsXSQ4EvwIfZ6SWvyGhK2LLVuyfSia
         9YOEeeocipOVg0P+dHzoLj0GuRo+q/pkDZLDQYVIpAPci9GSR4L7PauZCQVcsfNVOzMQ
         67hQCmqeOFaGIW5Jz6xiX70ZoSTX/FSc+RH3Z78nvvAeOLd3/GKp09//vrrmw86dMZH/
         NLi3Ug/trJ4byC2cGInsL/lFnrD0I81BuD0w/XH7PiKEE9lyIhkIgWtmmzSshJW3nohZ
         u0rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8dOwFXHyy7nBbryAA1ywk4yLaVEXFLRRnv/TLBt1Mfg=;
        fh=JdM7NOx9+zSRGP+QOo5s4etz5hX8WfzvPAWMC+GZkDk=;
        b=QB/P9FSof0oztFLxKLB5b5519Bd6lvth+BBsXRqSuYZV73BeSUHYZx8jUnnC4nJc43
         nyJBQsgdHhBt+3vV5YQK3f7fvH9FMRCeFC5lkwfbVO/2Xij7MN1swwWmvsgm9sQ1Q6P5
         8qpu9uyyThkx89SNXnxxJ1da+sdc89JqyDKET4y2PLPjxQZZaU3pUoG4ec+KUBsNbf4W
         kwSXgUj20gC9sg2Kg61kr6LIzBvzNoebOKOrHcQfAIZKOLxu2lV+YCdTTACxsR6dBuT5
         QNIURYBwPnXR53Ibx5e1h6px7mGjO26KyjQangSeKCWa74gkRetIq9SoQj75Aw7jc65E
         Cb+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788617515; x=1789222315; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8dOwFXHyy7nBbryAA1ywk4yLaVEXFLRRnv/TLBt1Mfg=;
        b=sdFi4gtnm3vqb2IMbbh1gg4iH20uWG/sFyQeqRlbvMFGd2lbS2HfadoTgdZTcMlifk
         9hkH6Qv2W2tKX6Z5D4UVI/WcJHzez2rRaQ+ZR4HzFB1HPDb91N8kQC0kkp14PWAvw/lB
         QLDB8T6bz0nrZoph/kRbOXfxTxCLTILAZOoEjGMu1uIi0kr/LaAzpXFHdMtWLjiN5Ltc
         s3VKhjIgC8xBRCxlH3qppzkZyK7XuP9nA4qYxVyfKHVqG/mlBVF3SnJNcasXXoKTowct
         KLNn5y2KShlObKU+VLBzDvSADBefVU0AX9GOR96Ffh51RWX2Qu9NAMAgnLBIJNnolR8N
         Zvbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788617515; x=1789222315;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8dOwFXHyy7nBbryAA1ywk4yLaVEXFLRRnv/TLBt1Mfg=;
        b=F85bRQrtMFEJODO+Rb1r78oILrNGDOx3jiEtodMbPwfoGWra7CKfLg8SpyX7GZ6QR/
         iq+H6cQoN2wBhUg5gev/aD6SGbqUmeW0lU0cqeTfg/vp4Lg/27kWoCrI9sPqEINDdwsS
         QAnQQdAp1MUAXYf2W6b+yEoOsijFvFLe0/CbEZcTdQrBvYREowxWTCJjKJhDnsFazcM+
         CHA65bgtPh0sVuojWFvnbC26LWZy6XqCGo7mUK1aQP6x4GgJVfFpUpx1H5Z/NxLuD0MJ
         CrWJ/IkmhMdMhR3c8IxNH9dL/SQYDhdexlVEddNF/djo4O/ir1juoYxaMrHGbkZPb207
         Tq3w==
X-Forwarded-Encrypted: i=1; AKwUvBxAYBGwe8AHAWgHcdGRPwP7ZRwHjHkNd8WUZtpSLEHOhwjG8VB/yujexpC9OA7tkkQJ/J5d3Hf0b6ZOtO0=@vger.kernel.org
X-Gm-Message-State: AFuF++nBRXCI1APB3Zxm2bIc2KvMEK6vJ/noiGk3xw0SlLwIEwm9sF9n
	Ka7/RiMNZyWY2gOopbtCUZwgJIQFnFIVYHgJdu64NaQWAtRKFVZGiruJ8Fo6zzRQM/sUq8vL9tH
	5BQK1igMNFIuBEMOBJSgZtyoBs7+oQYg=
X-Gm-Gg: AYBFou2Oq2kcy2+Y7woKLHmBkaMMaV87zF+RnB1zqLgwIE0cQmK+0V50FcC/U9Vfe+k
	3CnIHhcc/KnL53Gjiff8MFRsCFqyRWPAhrTKpJjmegV68DzYfbgimWaRZXAvGfw4OSFfydQz+sN
	Wf6n6UtujiCHPEX9uBk+z2RF+2GQmRoNTmx4UrfUFoFlwVpZ859r4NJW6Ur1prBDH86Z4WRMBWA
	99jJtZBr2taaIUAAZlgKD0NyE5yOnuYda7Qv6D570rO3jD122LoUEW4frTb253lgokavc7dk32N
	jdP6S2YT2iQxKwuSalL3m3VZHAcR7nmzcI+PpnBeJe+zsw==
X-Received: by 2002:a05:600c:1991:b0:49b:2796:be30 with SMTP id
 5b1f17b1804b1-49cf824f7damr117762365e9.11.1788617514483; Sat, 05 Sep 2026
 07:11:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904103920.4471-1-luis@igalia.com> <20260904103920.4471-9-luis@igalia.com>
In-Reply-To: <20260904103920.4471-9-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 5 Sep 2026 16:11:43 +0200
X-Gm-Features: AcwNN1UdXGZXZ6wH3FV9f5IAIXIptSPvwpDev9NoyEDWmtBTRnq0S2p7ZwVozxY
Message-ID: <CAOQ4uxh+rKuR39ruJO6PxoUCCdP_U0M=ecn-dayv+7-jKgrDNg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 8/8] selftests/fuse: add fuse readdir caching test
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
> This new test will check the caching behaviour using combinations of two
> opendir flags: FOPEN_KEEP_CACHE and FOPEN_CACHE_DIR.
>
> Signed-off-by: Luis Henriques <luis@igalia.com>
> ---
>  .../selftests/filesystems/fuse/.gitignore     |   1 +
>  .../selftests/filesystems/fuse/Makefile       |   2 +
>  .../fuse/fuse_readdir_cache_test.c            | 274 ++++++++++++++++++
>  3 files changed, 277 insertions(+)
>  create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_readdir=
_cache_test.c
>
> diff --git a/tools/testing/selftests/filesystems/fuse/.gitignore b/tools/=
testing/selftests/filesystems/fuse/.gitignore
> index ebfe7133d811..ffa356f23e8c 100644
> --- a/tools/testing/selftests/filesystems/fuse/.gitignore
> +++ b/tools/testing/selftests/filesystems/fuse/.gitignore
> @@ -4,3 +4,4 @@ fusectl_test
>  write_extend_eof_test
>  fuse_acl_cache_test
>  fuse_symlink_cache_test
> +fuse_readdir_cache_test
> diff --git a/tools/testing/selftests/filesystems/fuse/Makefile b/tools/te=
sting/selftests/filesystems/fuse/Makefile
> index 3a5a557dde7a..570ced181168 100644
> --- a/tools/testing/selftests/filesystems/fuse/Makefile
> +++ b/tools/testing/selftests/filesystems/fuse/Makefile
> @@ -6,6 +6,7 @@ TEST_GEN_PROGS :=3D fusectl_test
>  TEST_GEN_PROGS +=3D write_extend_eof_test
>  TEST_GEN_PROGS +=3D fuse_acl_cache_test
>  TEST_GEN_PROGS +=3D fuse_symlink_cache_test
> +TEST_GEN_PROGS +=3D fuse_readdir_cache_test
>  TEST_GEN_FILES :=3D fuse_mnt
>
>  include ../../lib.mk
> @@ -30,5 +31,6 @@ $(OUTPUT)/fuse_mnt: LDLIBS +=3D $(VAR_LDLIBS)
>
>  $(OUTPUT)/fuse_acl_cache_test: fuse_common.c fuse_acl_cache_test.c
>  $(OUTPUT)/fuse_symlink_cache_test: fuse_common.c fuse_symlink_cache_test=
.c
> +$(OUTPUT)/fuse_readdir_cache_test: fuse_common.c fuse_readdir_cache_test=
.c
>
>  EXTRA_CLEAN :=3D fuse_common.o
> diff --git a/tools/testing/selftests/filesystems/fuse/fuse_readdir_cache_=
test.c b/tools/testing/selftests/filesystems/fuse/fuse_readdir_cache_test.c
> new file mode 100644
> index 000000000000..7c49cc6a23e3
> --- /dev/null
> +++ b/tools/testing/selftests/filesystems/fuse/fuse_readdir_cache_test.c
> @@ -0,0 +1,274 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Simple filesystem to test FUSE readdir cache
> + *
> + * It will simply perform readdir operations on a directory checking how=
 many
> + * times a request is sent to user-space using all the possible caching
> + * combination setting (FOPEN_KEEP_CACHE and FOPEN_CACHE_DIR flags).
> + */
> +
> +#include <stdio.h>
> +#include <limits.h>
> +#include <dirent.h>
> +
> +#include "kselftest_harness.h"
> +
> +#include "fuse_common.h"
> +
> +#define DIRNAME "mydir"
> +#define FILENAME "myfile"
> +
> +#define DIR_INO 42
> +#define FILE_INO 43
> +#define DOT_INO 40
> +#define DOTDOT_INO 41
> +
> +#define TIMEOUT        86400.0f
> +
> +struct test_state {
> +       pthread_mutex_t lock;
> +       bool cache_readdir;
> +       bool keep_cache;
> +       int readdir_counter;
> +} test_state =3D {
> +       .lock =3D PTHREAD_MUTEX_INITIALIZER,
> +};
> +
> +static void fs_lookup(fuse_req_t req, fuse_ino_t parent, const char *nam=
e)
> +{
> +       struct fuse_entry_param e =3D {};
> +
> +       if (parent !=3D FUSE_ROOT_ID || strcmp(name, DIRNAME) !=3D 0)
> +               fuse_reply_err(req, ENOENT);

Again: allergic to non matching {} and can just return here no need
for all this nesting

> +       else {
> +               if (!strcmp(name, DIRNAME)) {

This condition is already guaranteed when we get here

> +                       e.ino =3D DIR_INO;
> +                       e.attr.st_mode =3D S_IFDIR | 0755;
> +                       e.attr.st_nlink =3D 1;
> +               } else {
> +                       e.ino =3D FUSE_ROOT_ID;
> +                       e.attr.st_mode =3D S_IFDIR | 0755;
> +                       e.attr.st_nlink =3D 2;
> +               }
> +               e.attr.st_mtime =3D time(NULL);
> +               e.attr_timeout =3D TIMEOUT;
> +               e.entry_timeout =3D TIMEOUT;
> +               fuse_reply_entry(req, &e);
> +       }
> +}
> +
> +static int fill_stat(fuse_ino_t ino, struct stat *st)
> +{
> +       int ret =3D 0;
> +
> +       st->st_ino =3D ino;
> +       st->st_mtime =3D time(NULL);

Doesn't this need to be a const value?
to make sure that it does not change from here to lookup time?

Thanks,
Amir.

> +
> +       switch (ino) {
> +       case FUSE_ROOT_ID:
> +               st->st_mode =3D S_IFDIR | 0755;
> +               st->st_nlink =3D 2;
> +               break;
> +       case DOT_INO:
> +       case DOTDOT_INO:
> +       case DIR_INO:
> +               st->st_mode =3D S_IFDIR | 0755;
> +               st->st_nlink =3D 1;
> +               break;
> +       case FILE_INO:
> +               st->st_mode =3D S_IFREG | 0444;
> +               st->st_nlink =3D 1;
> +               break;
> +       default:
> +               ret =3D -1;
> +               break;
> +       }
> +
> +       return ret;
> +}
> +
> +static void fs_getattr(fuse_req_t req, fuse_ino_t ino,
> +                      struct fuse_file_info *fi)
> +{
> +       struct stat st =3D {};
> +
> +       if (fill_stat(ino, &st) < 0)
> +               fuse_reply_err(req, ENOENT);
> +       else
> +               fuse_reply_attr(req, &st, TIMEOUT);
> +}
> +
> +static void fs_opendir(fuse_req_t req, fuse_ino_t ino,
> +                      struct fuse_file_info *fi)
> +{
> +       pthread_mutex_lock(&test_state.lock);
> +       fi->keep_cache =3D test_state.keep_cache;
> +       fi->cache_readdir =3D test_state.cache_readdir;
> +       pthread_mutex_unlock(&test_state.lock);
> +       fuse_reply_open(req, fi);
> +}
> +
> +static void fs_readdir(fuse_req_t req, fuse_ino_t ino, size_t size,
> +                      off_t offset, struct fuse_file_info *fi)
> +{
> +       struct stat st =3D {};
> +       char buf[1024];
> +       char *pbuf;
> +       size_t rem =3D size;
> +       size_t sz;
> +       int nextoff =3D 0;
> +
> +       if (ino !=3D DIR_INO) {
> +               fuse_reply_err(req, ENOTDIR);
> +               return;
> +       }
> +       if (offset) {
> +               fuse_reply_buf(req, NULL, 0);
> +               return;
> +       }
> +       pbuf =3D buf;
> +       fill_stat(DOT_INO, &st);
> +       sz =3D fuse_add_direntry(req, pbuf, rem, ".", &st, nextoff++);
> +       rem -=3D sz;
> +       pbuf +=3D sz;
> +       fill_stat(DOTDOT_INO, &st);
> +       sz =3D fuse_add_direntry(req, pbuf, rem, "..", &st, nextoff++);
> +       rem -=3D sz;
> +       pbuf +=3D sz;
> +       fill_stat(FILE_INO, &st);
> +       sz =3D fuse_add_direntry(req, pbuf, rem, FILENAME, &st, nextoff++=
);
> +       rem -=3D sz;
> +
> +       fuse_reply_buf(req, buf, size - rem);
> +
> +       pthread_mutex_lock(&test_state.lock);
> +       test_state.readdir_counter++;
> +       pthread_mutex_unlock(&test_state.lock);
> +}
> +
> +static const struct fuse_lowlevel_ops fs_ops =3D {
> +       .lookup         =3D fs_lookup,
> +       .getattr        =3D fs_getattr,
> +       .opendir        =3D fs_opendir,
> +       .readdir        =3D fs_readdir,
> +};
> +
> +FIXTURE(readdir_cache)
> +{
> +       struct fuse_session *se;
> +       char mountpoint[MOUNTPOINT_SZ];
> +       pthread_t thread;
> +};
> +
> +FIXTURE_VARIANT(readdir_cache)
> +{
> +       bool cache_readdir;
> +       bool keep_cache;
> +};
> +FIXTURE_VARIANT_ADD(readdir_cache, nocache)
> +{
> +       .cache_readdir =3D false,
> +       .keep_cache =3D false,
> +};
> +FIXTURE_VARIANT_ADD(readdir_cache, cache_readdir)
> +{
> +       .cache_readdir =3D true,
> +       .keep_cache =3D false,
> +};
> +FIXTURE_VARIANT_ADD(readdir_cache, keep_cache)
> +{
> +       .cache_readdir =3D false,
> +       .keep_cache =3D true,
> +};
> +FIXTURE_VARIANT_ADD(readdir_cache, cache)
> +{
> +       .cache_readdir =3D true,
> +       .keep_cache =3D true,
> +};
> +
> +FIXTURE_SETUP(readdir_cache)
> +{
> +       char err[MAX_ERR_MSG];
> +
> +       pthread_mutex_lock(&test_state.lock);
> +       test_state.readdir_counter =3D 0;
> +       test_state.cache_readdir =3D variant->cache_readdir;
> +       test_state.keep_cache =3D variant->keep_cache;
> +       pthread_mutex_unlock(&test_state.lock);
> +
> +       if (fs_setup(&self->se, self->mountpoint, &fs_ops, &self->thread,=
 err))
> +               SKIP(return, err);
> +}
> +
> +FIXTURE_TEARDOWN(readdir_cache)
> +{
> +       fs_teardown(self->se, self->thread, self->mountpoint);
> +}
> +
> +TEST_F(readdir_cache, test_readdir_cache)
> +{
> +       struct dirent *dentry;
> +       DIR *dir;
> +       char pathname[PATH_MAX];
> +       int total_counter, rewind_counter;
> +       int dentrycount;
> +
> +       sprintf(pathname, "%s/%s", self->mountpoint, DIRNAME);
> +
> +       dir =3D opendir(pathname);
> +       if (dir =3D=3D NULL)
> +               TH_LOG("opendir(): %s", strerror(errno));
> +       ASSERT_NE(dir, NULL);
> +
> +       errno =3D 0;
> +       dentrycount =3D 0;
> +       while ((dentry =3D readdir(dir)))
> +               dentrycount++;
> +       ASSERT_EQ(errno, 0);
> +       ASSERT_EQ(dentrycount, 3);
> +
> +       rewinddir(dir);
> +       errno =3D 0;
> +       dentrycount =3D 0;
> +       while ((dentry =3D readdir(dir)))
> +               dentrycount++;
> +       ASSERT_EQ(errno, 0);
> +       ASSERT_EQ(dentrycount, 3);
> +
> +       ASSERT_EQ(closedir(dir), 0);
> +
> +       pthread_mutex_lock(&test_state.lock);
> +       rewind_counter =3D test_state.readdir_counter;
> +       pthread_mutex_unlock(&test_state.lock);
> +
> +       dir =3D opendir(pathname);
> +       if (dir =3D=3D NULL)
> +               TH_LOG("opendir(): %s", strerror(errno));
> +       ASSERT_NE(dir, NULL);
> +
> +       errno =3D 0;
> +       dentrycount =3D 0;
> +       while ((dentry =3D readdir(dir)))
> +               dentrycount++;
> +       ASSERT_EQ(errno, 0);
> +       ASSERT_EQ(dentrycount, 3);
> +
> +       ASSERT_EQ(closedir(dir), 0);
> +
> +       pthread_mutex_lock(&test_state.lock);
> +       total_counter =3D test_state.readdir_counter;
> +       pthread_mutex_unlock(&test_state.lock);
> +
> +       if (!variant->cache_readdir) {
> +               ASSERT_EQ(rewind_counter, 2);
> +               ASSERT_EQ(total_counter, 3);
> +       } else if (!variant->keep_cache) {
> +               ASSERT_EQ(rewind_counter, 1);
> +               ASSERT_EQ(total_counter, 2);
> +       } else {
> +               ASSERT_EQ(rewind_counter, 1);
> +               ASSERT_EQ(total_counter, 1);
> +       }
> +}
> +
> +TEST_HARNESS_MAIN
