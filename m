Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B7F3CEB8D
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 12:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788611581; cv=pass; b=jtXOcIkELfywPdscIxiHuICsvlw1Kr3lgKVew/OHzZYwN3fEu1/n/C3xzNToEcZQqrMcRD/3DCYoW2Lj5C8EhCI2DbSZhfQjN3XZ0c7ejnDLopkHmhgPiNii1CLuUEjBu1jPSJDaWV42Ri3D2g4KQF267aPLamBSNyaILfNVby8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788611581; c=relaxed/simple;
	bh=x6U/123YgrqcVQf2CeHxg1MTANfKyOHf3TPTf0tKoqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oYlZ9T080rREq9Gu1wH2iEItsaZJYFFBXx3BeKBxuQSCBdYn1waNWT/xIckmjW5WaYJFyxkoFHGa0OAiKks1jsB9kQ1yl/lkw8nyv1FvkQEplUF94uH6dOxCD01QOnd39TY4964ct5uAs5J5O3XhqK6egDDr32bSqXZQUtDHn1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BE3S76qf; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BE3S76qf"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a7e0ff423dso4838552a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 05:32:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788611578; cv=none;
        d=google.com; s=arc-20260327;
        b=cmMxvQP5AUU4xRcUOLaoVeIxDsC3EIeuoY13HZcZ6VuIRLDqvDH7QyQEz20KiOCPcx
         iwcd63vpxaz/2k9Wdv8kpqcvMJWjZ6rsf+3AXyVRoadTyg5/Pc8BPnPyS+z+u3B0Ajun
         Gh7t4WkOQDihdsJC8S7EQfm2M9vRX0BLTIs7LP05GIQVyV3rw43RLwhd8nXqBvPyL20E
         KpxetNAi8ddnhWrPImcfYk4hI8O82AAFX2LBW69SPK77G4sdVVF4RQ5cUR3VWtmj6nl5
         PRtIiaF+Or3RaZSC/13WNQPmiPxz5EuDSl6puP3TexCJhFm//BBgkPMkyeb9jyxPGBqo
         bpkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+cwHsO0hV8YW9Z1e5+hyZhT9RVZSyOWleixXLzS40DI=;
        fh=tR1kZlBG+99zTFumJaIPwgRrjWZDV3fZNp7vUiSVLpU=;
        b=q2j5m4x7rFHUQ/j4ai1BtS/cwFVZe2XumM2cZCemqH5cdAUy5zIwHF+6F3mfm6OHuA
         9KUWZFPv6oqsP0JAmWa5/FA1IjKzvejFcR3397Om5jAt3gJ6Jxf1CbpfgoaTQ3913qu1
         fW5LvFmFZRsZND1F8eDfY5vE6TsUVLt7x7jcpLYmDST5FuJg1t0IVbMomc/8SCWF1lQm
         VRIz/8D0NtpPhZX7b57RXc8FFxPWISfKps9qi8KmlEv9xk+R/NLQ9bLbAsRHa8/O8J/D
         bYas5H/TSYHECVYbrRvcCGu7dbUTyi5HIpvbMpIakToLujrb8ezxaugzpEqLhf9UzTKo
         hJPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788611578; x=1789216378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+cwHsO0hV8YW9Z1e5+hyZhT9RVZSyOWleixXLzS40DI=;
        b=BE3S76qfzaOERBDuNPrsvZb618lyUQjT93PD5uUL5hU7UtMTL7ZmcOfyQ27NyWT2iv
         ALRJFpcXOEciwIHaDrui3TQjdBkqSvHQS8ko6wuTgmNzFLT1H12C37niBtoqmEakXz0/
         xQRtHOKjn3RfQ934//4EGLw9/XFDgneBiP6XRfos9ttVjWmeCuX1kYOQTDDwtUpyIgNJ
         CGpyrGjZizh8dcyema7S0H4Loo0tpq0smYWdJVKub6vWMzCbCQlR0/U6dR7BsKf0ZGBD
         WC5/mJFyCbaPXjJoRoyViZ8H7UwxnYVDlxWi/mhsmSJabbIwwKpT3V+JSSuF2mIUXZn1
         tJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788611578; x=1789216378;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+cwHsO0hV8YW9Z1e5+hyZhT9RVZSyOWleixXLzS40DI=;
        b=oWK3hHXB/p3PCmKNipOIuU6kojZWJRZZ2WoCWgogroFjG3RQrbEk3V6BMG9k/neIeY
         MNDrwNLvXKJSQ1yqvLLgcsVIAGEBaMyQKL2bPAV7fcl6VNcgeZudNHdj89I7JvMgQB3U
         4rDjrNNeycTKxody0cp8ehTkbp3HaghbPDvhjZ32LZkvo2DSh1HsOkLwrMKvN4zI7+Mr
         zNF9o4Y9IQUbR3mzWOJpNOg9FpmQoX9XWo5+4IObNwrZI+F0Pe5qWTacKJeZrYe6PbG9
         SMJze0s+z1U0MO3IU/mM7fWgjppsnRrbUSfEjUh66XP6WOwyNmx3xmXKVRt60RQhnEfH
         O9+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxX0cP+QV9aNrWL2rvnc4iO9K48XkgvRoI0baF8uNlfPvy7B4AHzX1tJgGW1gpb8oqicuX6CmbP8/PYDOA=@vger.kernel.org
X-Gm-Message-State: AFuF++mQFl2J1inStDoF9F0R0RpT8rIgpB29DKk3n3LO9mqgYHofVBnM
	B5PdcmpOZAAU/kqXeVwlFVBSvKyvFh7B6aOYg/jCLJhe/2kUjwxN/UEsGfBVIRFfvYs/PFyUFGr
	2CTFqHkYw7ZzNTib3VO4iy974qxPReEo=
X-Gm-Gg: AYBFou2AhYcatqkMSJSmIzQygbrc7gmBiFjVTTHYrjqK8jxLEcRfBEGvK0GdN9ZLcEE
	lnutDOdAQdzlEuI9eU5nFaao0f6u5C9jS8pxyBb+eQUTifOV0dnbMjG+6nQxUlT+30q3URv7Anr
	W7Pl5jLHGdqZ8Lroa1NkZLUk12JcNxpTGYCu5VdsVp+ghvSRXKGbz1UiiBdcspmjvBRTEgJ4YgG
	akTjWqhp9t+CuZp7upC8XqBWIE0D3krKCY2qzdrdo/c+vSskVEkwqqwVzmAdgoOOkEiBT8SahoY
	I3kLfA+yexslEIQx43AitbA11C0Ql+hoI/8qtxNNN/pj+Q==
X-Received: by 2002:a05:6402:2023:b0:6a7:ef6b:6c7 with SMTP id
 4fb4d7f45d1cf-6a7ef6b0b9emr2296122a12.1.1788611578044; Sat, 05 Sep 2026
 05:32:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904103920.4471-1-luis@igalia.com> <20260904103920.4471-8-luis@igalia.com>
In-Reply-To: <20260904103920.4471-8-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 5 Sep 2026 14:32:46 +0200
X-Gm-Features: AcwNN1X-4hUbgOK-AYX9YtX0eCMKTuoBNYsFddSvoCKtiEjWVnCUplIuLJuxzAE
Message-ID: <CAOQ4uxhFCKOLexyiP6DQ=a9t+8dhGn=tJLGyHg0NHPz=mPDkhw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 7/8] selftests/fuse: add fuse symlink caching test
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
> This patch adds a simple test that allows to verify that, when resolving =
a
> symlink, user-space is called only the first time when caching is enabled
> or, if caching is disabled, every time the symlink resolution is requeste=
d.
>
> Signed-off-by: Luis Henriques <luis@igalia.com>
> ---
>  .../selftests/filesystems/fuse/.gitignore     |   1 +
>  .../selftests/filesystems/fuse/Makefile       |   2 +
>  .../fuse/fuse_symlink_cache_test.c            | 167 ++++++++++++++++++
>  3 files changed, 170 insertions(+)
>  create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_symlink=
_cache_test.c
>
> diff --git a/tools/testing/selftests/filesystems/fuse/.gitignore b/tools/=
testing/selftests/filesystems/fuse/.gitignore
> index f7f3dd345a50..ebfe7133d811 100644
> --- a/tools/testing/selftests/filesystems/fuse/.gitignore
> +++ b/tools/testing/selftests/filesystems/fuse/.gitignore
> @@ -3,3 +3,4 @@ fuse_mnt
>  fusectl_test
>  write_extend_eof_test
>  fuse_acl_cache_test
> +fuse_symlink_cache_test
> diff --git a/tools/testing/selftests/filesystems/fuse/Makefile b/tools/te=
sting/selftests/filesystems/fuse/Makefile
> index 7744f796eb06..3a5a557dde7a 100644
> --- a/tools/testing/selftests/filesystems/fuse/Makefile
> +++ b/tools/testing/selftests/filesystems/fuse/Makefile
> @@ -5,6 +5,7 @@ CFLAGS +=3D -Wall -O2 -g $(KHDR_INCLUDES)
>  TEST_GEN_PROGS :=3D fusectl_test
>  TEST_GEN_PROGS +=3D write_extend_eof_test
>  TEST_GEN_PROGS +=3D fuse_acl_cache_test
> +TEST_GEN_PROGS +=3D fuse_symlink_cache_test
>  TEST_GEN_FILES :=3D fuse_mnt
>
>  include ../../lib.mk
> @@ -28,5 +29,6 @@ $(OUTPUT)/fuse_mnt: CFLAGS +=3D $(VAR_CFLAGS)
>  $(OUTPUT)/fuse_mnt: LDLIBS +=3D $(VAR_LDLIBS)
>
>  $(OUTPUT)/fuse_acl_cache_test: fuse_common.c fuse_acl_cache_test.c
> +$(OUTPUT)/fuse_symlink_cache_test: fuse_common.c fuse_symlink_cache_test=
.c
>
>  EXTRA_CLEAN :=3D fuse_common.o
> diff --git a/tools/testing/selftests/filesystems/fuse/fuse_symlink_cache_=
test.c b/tools/testing/selftests/filesystems/fuse/fuse_symlink_cache_test.c
> new file mode 100644
> index 000000000000..ca3c5cdaf578
> --- /dev/null
> +++ b/tools/testing/selftests/filesystems/fuse/fuse_symlink_cache_test.c
> @@ -0,0 +1,167 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Simple filesystem to test FUSE symlink cache
> + *
> + * This is a simple FUSE filesystem that contains two objects: a file na=
med
> + * 'file' and a symlink to that file named 'link'.  If symlink caching i=
s
> + * disabled (i.e. FUSE_CAP_CACHE_SYMLINKS is reset during FUSE_INIT), wh=
enever
> + * the ->readlink() is executed to resolve 'link' a counter will be incr=
emented.
> + *
> + * If symlink caching is enabled (i.e. FUSE_CAP_CACHE_SYMLINKS is set du=
ring
> + * FUSE_INIT), resolving a symlink will only call into user-space the fi=
rst
> + * time.
> + */
> +
> +#define FUSE_USE_VERSION 31
> +
> +#include <stdio.h>
> +#include <limits.h>
> +#include <fuse_lowlevel.h>
> +
> +#include "kselftest_harness.h"
> +
> +#include "fuse_common.h"
> +
> +#define FILENAME "file"
> +#define FILE_INO 42
> +
> +#define LINKNAME "link"
> +#define LINK_INO 43
> +
> +#define TIMEOUT        86400.0f
> +
> +struct test_state {
> +       pthread_mutex_t lock;
> +       bool cache;
> +       int readlink_counter;
> +} test_state =3D {
> +       .lock =3D PTHREAD_MUTEX_INITIALIZER,
> +};
> +
> +static void fs_init(void *userdata, struct fuse_conn_info *conn)
> +{
> +       pthread_mutex_lock(&test_state.lock);
> +       if (test_state.cache)
> +               fuse_set_feature_flag(conn, FUSE_CAP_CACHE_SYMLINKS);
> +       else
> +               fuse_unset_feature_flag(conn, FUSE_CAP_CACHE_SYMLINKS);
> +       pthread_mutex_unlock(&test_state.lock);
> +}
> +
> +static void fs_lookup(fuse_req_t req, fuse_ino_t parent, const char *nam=
e)
> +{
> +       struct fuse_entry_param e =3D {};
> +
> +       if (parent !=3D FUSE_ROOT_ID ||
> +           (!strcmp(name, FILENAME) && !(strcmp(name, LINKNAME))))

You probably meant strcmp() !=3D 0 ...
Did you miss this Sashiko comment?

Thanks,
Amir.
