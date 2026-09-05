Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497DE388E6E
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 14:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788616884; cv=pass; b=g3YpMMysNf284yuw1PjOGlEfcAh3DOXQZeuVTy4tHGkn3sObz4soQbQB7/Df6oosv6lAIIvXSPYYV6ti6XdliW7Mmqv2FVgmvrVf25fpQhGkHq2DtR02yNR70R6CtfLUSah5zxdEYkBkk3VAC2DX9XGCSHI/rv17R5lCIsfvt34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788616884; c=relaxed/simple;
	bh=M7fAdXtBDfEORDW145jXu6v4iUab4x+K54eSd0w9thQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ESqWGQjmxaThJieZCY0UkQmpV0HoId136pDz4cYOw7sIXLGS4x2g62UL9uPmR4UVFC2I3XrTChLHdIcjIm2gw8+Jz8ZwArU7FMT9nF5BBfxis1OtTqqqIaxVtb0BR21jurOlHgoP6UJ3vJhVQfl1gQs9YF02Ocq/m2l5dtZKcZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IEXpHs7A; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IEXpHs7A"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a7f27637d6so2162818a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 07:01:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788616870; cv=none;
        d=google.com; s=arc-20260327;
        b=Bcjl3SgT8H3aENfkPITR7+JiEuFIeFRhbYYsvOGXHKUWIhwkWY5igxNepteXlsYp7x
         fCIU5AbQpDgtUmGmF/T9E/E9VrTjrYwOYB1Ho+M6lReCbUu0Ahh8UZAE8f6T/zKrBrzj
         rXLo8iAJRNQxz8fa2B2k8TaWdhkA/zUn5/I9/90CN0l2F/8fh451AHc4sgB5ZExIkUAD
         /5yNRnv8nHtQ9bak5QQyOumSTGQSbXcKUc/psXV3hKzjpwawEmXY7/nFow9oKFHwifeo
         AU+cALSYG3SalAhQAWh7jJwTbm9F9ounSEy/jCyM3rXqWOqbus94lFunp7I1hMXmBC/q
         xkuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I+I8QUj3WVciHxoRXxP9OcDrC3AowirtGwOcl3KlFtc=;
        fh=MOuK29JE01WwnufiVKTjwivJYMvupozKUkNMvHi79ns=;
        b=EvOJfUDL659DmBoo+MsSlqZT4e7UyfF4rxmcfmgr+qwcNCvyj27VtZOp0lPLyKI4k9
         +ZTqqrxvr7+ZadLCt5oTxnp2OKve0MEa6hr8b9d3PfPopehDaktYzvErbdsSP0LHEbPN
         ujObi2MldH1vo5Y2mUqQkS3oGEwVB+EgyE9HBdkU4YAUh4nSquDH3K3q0pkPO9aVl6WA
         LWrIomxsTr6Zn+BaXQxT4ytTearPgftmF4hkqeCH1suZLa3lHMLntUT/B2bGrw+mPA/3
         0RhvvhUrWwnxB9Oz+71TmZJFrB7Op6XiR1eLioX06RZxfnoQTtnm5VDK1qp2eLGbdwGT
         cH2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788616870; x=1789221670; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I+I8QUj3WVciHxoRXxP9OcDrC3AowirtGwOcl3KlFtc=;
        b=IEXpHs7AZQC+p/V7N+rI4lfrDYHccP7qJKR7h2RUSxx1BlzQqzqvOm01VndKlKraBx
         ihEhA4VVCgtWG1VgSU7timB3t1XhuIJfi1dqIReAiVVtwa8H/U48iJl/DSXDdqyWAQtT
         N/a9lYFJehhlhfR4gXC8kox3Gp+js9wD/P6G30USh8TBAhmKGZLPhk8HbamsehVbZdJc
         An7hVEKJiTpH8uuFwJ2N10Pk1QDjzd6w361h38ATts9O4nJGgXEKmVCvt0vzvxEuznIa
         oradz+5ceD88bhbGCfSlQkbvfCElTEmfcwa+uWYjZvykubzUqT/6b15BzHhgpgVRWMMc
         YzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788616870; x=1789221670;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I+I8QUj3WVciHxoRXxP9OcDrC3AowirtGwOcl3KlFtc=;
        b=sjH4hdebU/pdzm59TloPbk0dETTfxljo3nLdO9W2609xw1UQpG9J6dRHWhQUJFZ29G
         12I+vg+EAUibMX96woyjXQQky/tODWRdnWbYxZ2UJiWe9UEhkmrYiMUiOeE+oUCY4mxA
         y1jB/0RCY1bUAH53Eo83vhLWvlTOYzdnEPUm1WR9Sw+tJiuUDrSjFp6A0o73ick5XOiH
         cxbt7js4uJI8Ky+3q1YE6XUvbThitiMMeRlqA6VFJXsAmyuhicHBTf/9nWxHVCRg9NB1
         rhz0AIY2NZ+u14Iw/GkdJgnpjqdEixTxFR3uWvlzoRKgpK33BvjsqDcCrKX4+Dfd3mvB
         WoWg==
X-Forwarded-Encrypted: i=1; AKwUvBzqQVldSNZfNG2SleJmaf3FrKCHLTHhvKXnl1S3EVKY+i/3UCwrCFwPhwd3ytMfrxJ/Jfziv+B9LBgZj7c=@vger.kernel.org
X-Gm-Message-State: AFuF++mZmUixS7wl+uFUsmUv4RzpPj0yYsTXGRo2PzzJXWrearJj0fWQ
	+s/FCNoBu1vDpwCiF+s+9QMMY03Y1VsXyVz2aCpbNGMIZ6uKIrFGgHDT8eEbXwR+7GpWByr+bc5
	b2AwbtNC4BS49z46eA54RlezHj5HRByo=
X-Gm-Gg: AYBFou3UY0fh43nANzhOpXfuZBejlRCqSG06BeHIt4DF68eqN1F3Z715xq/NT3fAvIP
	rfmM88gltPLHoIniDOLzdjIA3KihkCKejlMQeTtYfVFLiOY5sq126vQNqdAkSy5zRKYdMxqXJAa
	qgI+KjwQPTtumUNaivXueE/fzgtXYSvCsZmfsdKg0iDLLeXMya+vgq9tqkkPOqPhgNMdlTOvDeW
	hoofVKDKZTuPCyb7exmIEigCK2H1tVAzgG71xp4R/IfWlVFUzt0PQeBpcMz1MgI6KzPJQo73hZN
	P3XBx+5qX+Yg9WZKBYXlXdXfDDnLVm2hbpecglui6ZDYQQ==
X-Received: by 2002:a05:6402:3220:b0:6a6:3ee3:655a with SMTP id
 4fb4d7f45d1cf-6a7e8d368f2mr9247527a12.3.1788616869820; Sat, 05 Sep 2026
 07:01:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904103920.4471-1-luis@igalia.com> <20260904103920.4471-6-luis@igalia.com>
In-Reply-To: <20260904103920.4471-6-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 5 Sep 2026 16:00:58 +0200
X-Gm-Features: AcwNN1XVifAlKbq_jupyMk4YvbgYjZtTaM8XtGl9N8tec_dpEk5CYKJCab76ZDY
Message-ID: <CAOQ4uxjMvHdaZfwjkHK3tV6ChsapobpHE9mq8NJSvduOGruvMg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 5/8] selftests/fuse: use dynamically allocated
 memory to store ACLs
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
> Instead of directly using static arrays for the ACL value, allocate memor=
y
> for storing it.  This will make it easier to implement ACL tests that als=
o
> set the xattr dynamically.
>
> Signed-off-by: Luis Henriques <luis@igalia.com>

Reviewed-by: Amir Goldstein <amir73il@gmail.com>
> ---
>  .../filesystems/fuse/fuse_acl_cache_test.c    | 32 ++++++++++++++++---
>  1 file changed, 27 insertions(+), 5 deletions(-)
>
> diff --git a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test=
.c b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> index 12cbf9753d03..c2d6658ff7de 100644
> --- a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> +++ b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> @@ -80,7 +80,7 @@ static const uint8_t acl_b[] =3D {
>
>  struct daemon_state {
>         pthread_mutex_t lock;
> -       const uint8_t  *acl;
> +       uint8_t        *acl;
>         size_t          acl_size;
>         int             getxattr_count;
>  };
> @@ -142,15 +142,26 @@ static void fs_getattr(fuse_req_t req, fuse_ino_t i=
no,
>  static void fs_getxattr(fuse_req_t req, fuse_ino_t ino, const char *name=
,
>                         size_t size)
>  {
> +       uint8_t *acl =3D NULL;
> +       size_t acl_size;
> +
>         if (ino !=3D FILE_INO ||
>             strcmp(name, "system.posix_acl_access") !=3D 0) {
>                 fuse_reply_err(req, ENODATA);
>                 return;
>         }
>
> +       if (size) {
> +               acl =3D malloc(size);
> +               if (!acl) {
> +                       fuse_reply_err(req, ENOMEM);
> +                       return;
> +               }
> +       }
>         pthread_mutex_lock(&g_ds.lock);
> -       const uint8_t *acl      =3D g_ds.acl;
> -       size_t         acl_size =3D g_ds.acl_size;
> +       acl_size =3D g_ds.acl_size;
> +       if (acl && (size >=3D acl_size))
> +               memcpy(acl, g_ds.acl, acl_size);
>         g_ds.getxattr_count++;
>         pthread_mutex_unlock(&g_ds.lock);
>
> @@ -160,6 +171,8 @@ static void fs_getxattr(fuse_req_t req, fuse_ino_t in=
o, const char *name,
>                 fuse_reply_err(req, ERANGE);
>         else
>                 fuse_reply_buf(req, (const char *)acl, acl_size);
> +
> +       free(acl);
>  }
>
>  static const struct fuse_lowlevel_ops fs_ops =3D {
> @@ -181,8 +194,10 @@ FIXTURE_SETUP(acl_cache)
>  {
>         char err[MAX_ERR_MSG];
>
> -       g_ds.acl =3D acl_a;
>         g_ds.acl_size =3D sizeof(acl_a);
> +       g_ds.acl =3D malloc(g_ds.acl_size);
> +       ASSERT_NE(g_ds.acl, NULL);
> +       memcpy(g_ds.acl, acl_a, g_ds.acl_size);
>         g_ds.getxattr_count =3D 0;
>
>         if (fs_setup(&self->se, self->mountpoint, &fs_ops, &self->thread,=
 err))
> @@ -195,6 +210,7 @@ FIXTURE_SETUP(acl_cache)
>  FIXTURE_TEARDOWN(acl_cache)
>  {
>         fs_teardown(self->se, self->thread, self->mountpoint);
> +       free(g_ds.acl);
>  }
>
>  static int do_force_statx(const char *path)
> @@ -210,6 +226,7 @@ TEST_F(acl_cache, stale_after_force_sync)
>         char    buf[512];
>         ssize_t sz;
>         int     count;
> +       uint8_t *acl;
>
>         /*
>          * Step 1: two getxattr calls before any statx(FORCE_SYNC).
> @@ -270,8 +287,13 @@ TEST_F(acl_cache, stale_after_force_sync)
>          * !fc->posix_acl mounts (it skips forget_all_cached_acls in that=
 case).
>          * On a fixed kernel the ACL was never cached, so this is moot.
>          */
> +       acl =3D malloc(sizeof(acl_b));
> +       ASSERT_NE(acl, NULL);
> +       memcpy(acl, acl_b, sizeof(acl_b));
> +
>         pthread_mutex_lock(&g_ds.lock);
> -       g_ds.acl      =3D acl_b;
> +       free(g_ds.acl);
> +       g_ds.acl      =3D acl;
>         g_ds.acl_size =3D sizeof(acl_b);
>         pthread_mutex_unlock(&g_ds.lock);
>         TH_LOG("step 4: daemon switched to ACL_B (%zu bytes)", sizeof(acl=
_b));
