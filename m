Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E06E4A13A6
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781127; cv=pass; b=cGDU4F5mXBwjGpjLtyDQz3uAmGdadglUENVWVrEKPZ3pVdqheVLr6l58aMWVRsFVmSo5iQTQX89NhrBRtvkUDUDgdDa9FEqDgb91/mUgA+W9cPJ3RscN1LbdBKWIwPbSqoKDtUJfZOvid9eN3At2Aj0rP3Mzktm7IMr3p/5Ix6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781127; c=relaxed/simple;
	bh=VVL02GMYWb/u6hDJI/5bikv4BicjcyQC43KoC26CTf8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mA9McbVfv4J6fMCG6AdgGabfWlbytEpg63SfsqaPMK9qFKO4/dntrxW6K2HegZDtn9QuBVjC+dI+hsuHHyl6M+iWupJPz9QvcUHHH2/vZng5gwavRULRftUMmNxDB0U2Iebmvr7ReZts51JNvUz265QC0O9Qz58dUQ8yHoN5ibY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jLKnNSEV; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jLKnNSEV"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2637dd37c1so201176066b.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:38:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788781124; cv=none;
        d=google.com; s=arc-20260327;
        b=Dnx37oGaeL8vc/6oaUl3o0jN5N9ZPYe9SIDTYqZP6gvRItIu8ao67+oc+QJuyGd+CT
         52Pjr9cEFZIflYWqhc4Nz2VAEA610nAg8+7j9J5LPYLC6S8uzS26M7GBenQuVsWHPV3v
         9QPMaLkQPn9M1Itl+i1Xatwnc1NrD0ZErkc8klfsyME27iMn80jmkUvqj7jA7aAMUmAB
         aQOuxUMC4PU1Gc0JXuvb4C0I5xkiFDZ3+nUOfwPW8A5jAttV2S8vXn2bpI/BZBVd9s3M
         i6dqTk9T5wom0YXQJ5l4RjgQP9IPxHWC18mdwjMIIVh/kf+qlAo0Cr40cDgFSFEKJP6n
         UBYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zsumuHn7FPHHPCQh2IOcR/Revkm68pLy+fSdVwAPQkQ=;
        fh=dTGW2hFdc0khVoqY2SJ8jyw+0FFU6iYWO6mtWxeuBZc=;
        b=rdydbJ+/+8rg5wAONffPz5uXf7pn62zP/mRiobeIRYyVcMZMfbIOGAWRO8eyTOUTZb
         HvKrZokOSSFRp03a/TIwJ1MeIO454qxuWAcoFrMyDoUsnqDj4QelI15Y6JA95VXkHRTS
         P2wR5vzCYsm1KDh2JZPTYQjxAO/BccZcMcAhozByWNTqHVFThdWIs+F6d5wQ3FAWgf4l
         3Fypd2YmqLHulFZZuNQqdlqcXDJjAUoqt/dncuA165y4FW9Mg2nHocKELhN87CkpTEDd
         E4Oj18FqX8crlsKLz+joEB0VfVRh8SwYol/lCvlnkDUjOw2rKK0fbHCzIi9IASdb4apO
         OGxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788781124; x=1789385924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zsumuHn7FPHHPCQh2IOcR/Revkm68pLy+fSdVwAPQkQ=;
        b=jLKnNSEVETgXbG4tt89OsJpvO9IS+oa1tI7Q/JJCP36p5HbDUTMD5Pnv+wG4Qupz78
         8xIKXq4P5fkwDLKrTv7HV8NntXrIxFDmCP6MotXHn/7KznBpLZy5Cxkkt6c0Vc+JmPzF
         LDDQZ1uWKKOynMpLEbeZiLse7yaSmISd4WxkxjoG3pE8yt8izUGWaNI1ZWCBSN/1RrNj
         m+hngsCMhx4dvKQwksggAh/ZB/Ayn4Tmd0wN4tZ8v3DFyIpuSKN7LzQ8E1AxDfylVTrn
         2L5q86POweCVN8QD3ULIKid6aeYxO6FCHx2D1+FVUJt5dkVKjTOM7OIw6Nf1soMcZZ4U
         qL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781124; x=1789385924;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zsumuHn7FPHHPCQh2IOcR/Revkm68pLy+fSdVwAPQkQ=;
        b=sN5C5+HsVYoZWHEtMS8nvI+HRj0TW3Bw8mksJWI0fVn3SY4Da3REpX7XQn3i1PvlZ1
         ojmQXiah6t1sO8xySobfhVv3xoO1+7D1mZnGzU/WsrpoPJaGNtnWw20kP/ndpv97g7Kz
         JEvpA859/mI+pLpSdpb4xW4BT3aPeUofYa5U4ijh1JE2lYuU4nU9OSbxsLpa1Xs6dm/9
         TPKxzx5FqRPGprUaM2FOqkOAcqXHh+NzzD4ISSxmGbMeWE02uKlNAEywEgeK+7+Q1b3d
         J3tRSFw5QAw6gFU+iEcn5frMcs0KvhlWhOG0k0TF2s8XsjrjEnvca5onM0R25NylwLWc
         5/gA==
X-Forwarded-Encrypted: i=1; AKwUvByGBuRhBIeEqu9x06/VB7FdJI8yAkonY+pa9cFOin56fjFZfmvcknUG9Of85mEGj6su6wmkDRt4JuPiFys=@vger.kernel.org
X-Gm-Message-State: AFuF++n3+sJ7sRKP8QcxXnUFu9l7qMR/4ErdXRWoWSL7ZO5U36vpSIHC
	WLuHgeGV5H3Blmhy441jPWgYGIcgy5LZuvZNX8eKOIyYYCSqj1875cyGSMpBQu4sPqoUjneOlA1
	iSd3U0KT/bQ6ICyInquofDX/9pcIENlU=
X-Gm-Gg: AYBFou1xYpW+003KKT+UKxzkPgkOuWm/ZIYqqoBwDAvcNSZPJgUdnyJByoONRHHOc+9
	hrVruqJli7bIrTkMEydyuyD0TjVbwJplE9YWPdbM9DLAeh+Jv+/42eJZ767WS+T8YYiQB1w1jIS
	kBU32wm93WYs7wYyG0c6m3VWns+JnYLJ4r07zXJzYKF8w7XXSIMgogmoXEtAxZnoqH0PvXfMU50
	qy17E8A6ol6yXlLmU/1T4i2aqJ9TlCjs6rOArHYlFMok6a1GTQRp7bvmJPROr2182EBdd3X4Gsl
	7IaCXlwbE4HSZUFnglSdb8WejqpVG6jpkZHm1tW/mC7rzHZFr3hf9JLa
X-Received: by 2002:a17:907:6092:b0:c26:3478:fbb0 with SMTP id
 a640c23a62f3a-c263478fce6mr388269066b.11.1788781123926; Mon, 07 Sep 2026
 04:38:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904103920.4471-1-luis@igalia.com> <20260904103920.4471-5-luis@igalia.com>
 <CAOQ4uxgR8v6H=8fHMmLjChsuXUn8560nzda55t8pCNA1ocvg_A@mail.gmail.com> <87pkypfihg.fsf@wotan.olymp>
In-Reply-To: <87pkypfihg.fsf@wotan.olymp>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 7 Sep 2026 13:38:31 +0200
X-Gm-Features: AcwNN1VBg_-Nh0xqgh5QGpERcqSlw7P_XDXd6wO9zSOlVqLVhQ7X3lt_FZWaIoE
Message-ID: <CAOQ4uxjtuwyXrckor8pu+ShvOJWO8rG1=o-DfbWhwQ+vbHTnTg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 4/8] selftests/fuse: factor-out test fixture setup/teardown
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Chen Linxuan <me@black-desk.cn>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Matt Harvey <mharvey@jumptrading.com>, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 12:44=E2=80=AFPM Luis Henriques <luis@igalia.com> wr=
ote:
>
> On Sat, Sep 05 2026, Amir Goldstein wrote:
>
> > On Fri, Sep 4, 2026 at 12:38=E2=80=AFPM Luis Henriques <luis@igalia.com=
> wrote:
> >>
> >> In order to reduce new tests setup/teardown code duplication, factor-o=
ut
> >> these functions from the existing acl_cache test into a new fuse_commo=
n.c
> >> file that can be reused in other tests.
> >>
> >> Signed-off-by: Luis Henriques <luis@igalia.com>
> >> ---
> >>  .../selftests/filesystems/fuse/Makefile       |  8 ++-
> >>  .../filesystems/fuse/fuse_acl_cache_test.c    | 62 +++---------------=
-
> >>  .../selftests/filesystems/fuse/fuse_common.c  | 60 ++++++++++++++++++
> >>  .../selftests/filesystems/fuse/fuse_common.h  | 25 ++++++++
> >>  4 files changed, 100 insertions(+), 55 deletions(-)
> >>  create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_comm=
on.c
> >>  create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_comm=
on.h
> >>
> >> diff --git a/tools/testing/selftests/filesystems/fuse/Makefile b/tools=
/testing/selftests/filesystems/fuse/Makefile
> >> index a3ee9b3a2f5d..7744f796eb06 100644
> >> --- a/tools/testing/selftests/filesystems/fuse/Makefile
> >> +++ b/tools/testing/selftests/filesystems/fuse/Makefile
> >> @@ -21,8 +21,12 @@ ifeq ($(VAR_LDLIBS),)
> >>  VAR_LDLIBS :=3D -lfuse3 -pthread
> >>  endif
> >>
> >> +CFLAGS +=3D $(VAR_CFLAGS)
> >> +LDLIBS +=3D $(VAR_LDLIBS)
> >> +
> >>  $(OUTPUT)/fuse_mnt: CFLAGS +=3D $(VAR_CFLAGS)
> >>  $(OUTPUT)/fuse_mnt: LDLIBS +=3D $(VAR_LDLIBS)
> >>
> >> -$(OUTPUT)/fuse_acl_cache_test: CFLAGS +=3D $(VAR_CFLAGS)
> >> -$(OUTPUT)/fuse_acl_cache_test: LDLIBS +=3D $(VAR_LDLIBS)
> >> +$(OUTPUT)/fuse_acl_cache_test: fuse_common.c fuse_acl_cache_test.c
> >> +
> >> +EXTRA_CLEAN :=3D fuse_common.o
> >> diff --git a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_t=
est.c b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> >> index 2411a6e285f1..12cbf9753d03 100644
> >> --- a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> >> +++ b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> >> @@ -33,23 +33,15 @@
> >>   */
> >>
> >>  #define _GNU_SOURCE
> >> -#include <errno.h>
> >>  #include <fcntl.h>
> >>  #include <linux/limits.h>
> >> -#include <pthread.h>
> >>  #include <stdint.h>
> >> -#include <stdio.h>
> >> -#include <stdlib.h>
> >> -#include <string.h>
> >> -#include <sys/stat.h>
> >>  #include <sys/xattr.h>
> >> -#include <unistd.h>
> >> -
> >> -#define FUSE_USE_VERSION 31
> >> -#include <fuse_lowlevel.h>
> >>
> >>  #include "kselftest_harness.h"
> >>
> >> +#include "fuse_common.h"
> >> +
> >>  /* ---- ACL binary encoding -----------------------------------------=
------- */
> >>  /*
> >>   * POSIX ACL v2 xattr format (little-endian):
> >> @@ -176,69 +168,33 @@ static const struct fuse_lowlevel_ops fs_ops =3D=
 {
> >>         .getxattr =3D fs_getxattr,
> >>  };
> >>
> >> -/* ---- Daemon thread -----------------------------------------------=
-------- */
> >> -
> >> -static void *run_daemon(void *arg)
> >> -{
> >> -       fuse_session_loop((struct fuse_session *)arg);
> >> -       return NULL;
> >> -}
> >> -
> >>  /* ---- kselftest harness -------------------------------------------=
-------- */
> >>
> >>  FIXTURE(acl_cache) {
> >>         struct fuse_session *se;
> >> -       char                 mountpoint[PATH_MAX];
> >> +       char                 mountpoint[MOUNTPOINT_SZ];
> >>         char                 file_path[PATH_MAX];
> >>         pthread_t            thread;
> >>  };
> >
> > Nice!
> > I think it would be even nicer to have struct fuse_common_ctx
> > with the common members embedded in the per test state,
> > but I'll let you decide if you want to do that or not.
>
> Thanks for the suggestion.  It may make sense indeed to have that common
> struct, although it would probably only include the spinlock and a bool
> for enabling/disabling the cache.  I'll have a closer look and see if it
> makes sense.

I meant that it should include:
         struct fuse_session *se;
         char                 mountpoint[PATH_MAX];
         pthread_t            thread;

instead of passing them by reference individually to fs_setup/teardown()
not a big deal, just a bit nicer IMO.

Thanks,
Amir.
