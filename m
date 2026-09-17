Received: from mail-ed2-f19.google.com (mail-ed2-f19.google.com [74.125.228.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEA34B44B5
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658506; cv=pass; b=LS/aVc3ht63QnJLxnVOyc7os2+PpKPOx/yoOOD985O0e5RJN3Lb1EqUzFrGGZJ2u46M2HHciBAYCcjnQnqh7QLYu4OHhFm0cfnOK9+r/uD30b15trxK1Kdl1po8eJ0Rpft/QPYvc/rRMM6AqjJFTs0TxBrSSZE7bYPJ9c/UtMHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658506; c=relaxed/simple;
	bh=9FMDsPvWFuaAQkxmti4fhgAl1YH9QRCR8rYM6KPLS7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kY9W20E87hKkXy0hpC2XK9HwOZf5k6BBxqLtusDOZLIT6tasvoTkVgy5NnR36fs34OQwKZI+n+lkSsuBAxi+ZqLJznKYwLe9j8QKMURIrkr/d4EUPBJFYqzwNXK9N6MF0SoM0zO5h2mkLl9DVHnP/KT2a0co0urha1KFL5SNWRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o9P3s4/O; arc=pass smtp.client-ip=74.125.228.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o9P3s4/O"
Received: by mail-ed2-f19.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae52so1801742a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:21:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789658491; cv=none;
        d=google.com; s=arc-20260327;
        b=CBgVv26EzFc8SIhgAABJy3neQLD/xKYHbzoy1fSCzt1KPkXNFaPUAf1/F6gU0dg3mO
         EFzQH+WY+HwQxC5dD9HjKD/4RG7gI1LKM9Q1k2aysKkGJTrGXNv4dghB8SbajMkrDpUd
         0w8pyDBBW03OTUseqIDXd4/f9I7L98XZbHqfHWB4RQoick3P2dshr1JK0lyMdavj6FRP
         D0496HKwJjPDFAxvxb2/PNJ6EKL0XGw/jpSzjmRkX4hj8MZbdKcurBIUI+PSH9+5j7XM
         K3D/D8v6QN8YIfqjqUruWvgSE9bfz8X8LJuru3QkZI623on0IB7O3MMADt66mCR4Tgst
         bT/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NAwClXXmqNprsBD+FWNB/mej+9Qh0o9RwyNuH9u1Nto=;
        fh=QsLg/bgO92210QdjlfpbUpmUc6Q3KUNrDHuGCKbBTXo=;
        b=RqKcPwnNL85nXL39vp/PhFdaMBDm5iHWr1dUrItKK0oH718BjOxqk9g6DKaaA8By4s
         uFhi+aSGnqyT0B7ZDzXd8/U46ysLPXoyD4YWO0j4+V+fut0nkz13PlQiA6l05ppx8/dC
         1ordOqCDWmKCYMNYpKAjbmtaDoYCx4h4Q663a7EOO6v2XoGbbfz97OpKLg9Jy7tYjn2g
         h9MBfEypEd1ny2raDxHSfRBenxmQqovBa00cW72Z0yNp94ahnNIJB2JrMhqb89scJyVF
         rv7qBADZrKX7iBK40/q0S20TUnG+DNVwLCV1k+iKOg5XU2AKy7//tj5q+VaMYk+lmfxM
         aZ5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789658491; x=1790263291; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NAwClXXmqNprsBD+FWNB/mej+9Qh0o9RwyNuH9u1Nto=;
        b=o9P3s4/Oc6pnc+2yY3YQJORWVZXVmFhSYqC5DImOjxXB4yeTvQcqSmk12GvcPGLg0X
         6k9teb8K+1jW4sRK09/HpB4VxJB3JTYbM4RfrxNwqX6NHgVL6PrDcC/ZTun0lYaolNCo
         EFIIDSuNRj5DTmgV2jQ1ozo2foJQWWhbKP9+YVgBJ8NwpHp/g9+5f1AYdXb/Pqel4Wlc
         uXGvJXnXobtFiYbbb/F5ropmz8Ixr1KSea6HFf5DT6b1w4JycPszbBHnqdCxXzo6dcZD
         vN1o/X8KdaIPvluKTU1aV5S32fkQzKJjFsbp5nIj7E/jll/Wh1PR5F1lcumFYu2OSgjT
         EOtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658491; x=1790263291;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NAwClXXmqNprsBD+FWNB/mej+9Qh0o9RwyNuH9u1Nto=;
        b=G/3bguLLLNzgdkB7Kf/beNFMgCJ1hBEvB00bUd9PGg3ZH/RiUKFZ/xKHGd9CKMVEBl
         ZHTYuztFdCfPXE+msN5r3BM+tFW6xLqLFA9bOybwtWmZQSjOfhMhTXSaAxWnXNiYcGHK
         KrBFsd31XKCBMN3v4j2HtxBAIfuxx0yEmbNrugVlP9dyEMG3CZcPs2DaeyQmviKx0KBH
         k0iuKVIqEN0flkUc87ziMneoOzvWz8Vj18fXtwaAVs92u2KzC92PmVnG7rSYQpz2gKt6
         7ktwt2WKwA8Ns2XOCDeqKxHlD39KPAvSOArfyjlbplnfrNtjyzjMDF8dApfJUMGqtF/2
         AjRw==
X-Forwarded-Encrypted: i=1; AKwUvBzmA9pVHrEMuDxY9MRtmWsflUzmmXaFxFJ/JUAa6Bvs9pqw+2gW0KECP4PRbBDH+R0vNj02UvWvPB2Ic0w=@vger.kernel.org
X-Gm-Message-State: AFuF++kHKY8614lqqKw1M2mAMb1ODRp/jyEY7WCu3zkoRnEYpX75oICg
	+jRj81C1n7Vcs//YlmAeQj7d0IdaC80gqcA4SjZW72pT291R6S43hQHuPsWtIYFl/4/4zjmzaMK
	AnN4FVoCpXNkdAKtwyuDVKCCLixy0t78=
X-Gm-Gg: AYBFou2DaNxy6rWe38tgDnRXJ85F66tFCSmUY/yDJAKYxSGv/oxpmCdFCmJjHXBtRFS
	BNVe2wLMokAKWbRYuQe/bptFr9x76ANCySbsRDkpbrt9q7VMBo7HVW6FRaklxCRBYNK8hbZN7yY
	yFtZoqzPviDqO5MwxyhIMGP47Y+zIkaAp1Uhod3fFKO4KwR9xoxT6kwESqNHzJkI0eKYVLwtnlO
	1s2NEzusQhiHdVmMYDiL/d1EFOMrdfTG+T/pi4N/CwyygRIFXkFpm0qX+lD13qp8OxaxJsQLT6S
	YmqteT1uxPctRQCh7cPdjX6lwxRNsB5oKHj1BM+iisvMiTmVFzlc95ww
X-Received: by 2002:a05:6402:42c4:b0:6a9:c0ec:417a with SMTP id
 4fb4d7f45d1cf-6aa2241bf59mr10245245a12.18.1789658490477; Thu, 17 Sep 2026
 08:21:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916155629.32421-1-luis@igalia.com> <20260916155629.32421-9-luis@igalia.com>
In-Reply-To: <20260916155629.32421-9-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 17 Sep 2026 17:21:17 +0200
X-Gm-Features: AcwNN1URwt29tlBxEkB9KVLT9efpa4yicFwd1VKtlhlpwfUBFhqmHoQc4ZfkvOU
Message-ID: <CAOQ4uxiEm5njmBUX6XEv9049RLgdEoj53vbhtmtxrpRBYS+R-Q@mail.gmail.com>
Subject: Re: [RFC PATCH v4 8/8] selftests/fuse: add fuse readdir caching test
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Chen Linxuan <me@black-desk.cn>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Matt Harvey <mharvey@jumptrading.com>, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 5:55=E2=80=AFPM Luis Henriques <luis@igalia.com> wr=
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
> index 000000000000..1fdf422cf75b
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
> +       struct fuse_common_ctx ctx;
> +       time_t mtime;
> +       int readdir_counter;
> +       bool cache_readdir;
> +       bool keep_cache;
> +} test_state =3D {
> +       .lock =3D PTHREAD_MUTEX_INITIALIZER,
> +};
> +
> +static void fs_lookup(fuse_req_t req, fuse_ino_t parent, const char *nam=
e)
> +{
> +       struct fuse_entry_param e =3D {};
> +
> +       if (parent !=3D FUSE_ROOT_ID || strcmp(name, DIRNAME) !=3D 0) {
> +               fuse_reply_err(req, ENOENT);
> +               return;
> +       }
> +
> +       e.ino =3D DIR_INO;
> +       e.attr.st_mode =3D S_IFDIR | 0755;
> +       e.attr.st_nlink =3D 1;
> +       pthread_mutex_lock(&test_state.lock);
> +       e.attr.st_mtime =3D test_state.mtime;
> +       pthread_mutex_unlock(&test_state.lock);
> +       e.attr_timeout =3D TIMEOUT;
> +       e.entry_timeout =3D TIMEOUT;
> +
> +       fuse_reply_entry(req, &e);
> +}
> +
> +static int fill_stat(fuse_ino_t ino, struct stat *st)
> +{
> +       int ret =3D 0;
> +
> +       st->st_ino =3D ino;
> +       pthread_mutex_lock(&test_state.lock);
> +       st->st_mtime =3D test_state.mtime;
> +       pthread_mutex_unlock(&test_state.lock);
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
> +FIXTURE(readdir_cache) {};
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
> +       test_state.mtime =3D time(NULL);
> +       test_state.readdir_counter =3D 0;
> +       test_state.cache_readdir =3D variant->cache_readdir;
> +       test_state.keep_cache =3D variant->keep_cache;
> +
> +       if (fs_setup(&fs_ops, &test_state.ctx, err))
> +               SKIP(goto out, err);
> +out:
> +       pthread_mutex_unlock(&test_state.lock);
> +}
> +
> +FIXTURE_TEARDOWN(readdir_cache)
> +{
> +       pthread_mutex_lock(&test_state.lock);
> +       fs_teardown(&test_state.ctx);
> +       pthread_mutex_unlock(&test_state.lock);
> +}
> +


With ctx moved to fixture, feel free to add

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

Thanks,
Amir.

> +TEST_F(readdir_cache, test_readdir_cache)
> +{
> +       struct dirent *dentry;
> +       DIR *dir;
> +       char pathname[PATH_MAX];
> +       int total_counter, rewind_counter;
> +       int dentrycount;
> +
> +       sprintf(pathname, "%s/%s", test_state.ctx.mountpoint, DIRNAME);
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
