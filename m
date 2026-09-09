Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB8B56C64A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967752; cv=pass; b=fQdevMKHGhAZNolvX4e9sCyo+K1luon2eAbxIs4aG+AfR8oHVuWW1ghfNuL633hRNepl4t+vsauDoQ1BIrZBn6dMg3OXRknzosFrVV4e02+jz6gUBb8IKCOe7Ysq8M+svfPAB/Q0VYBFlZKKj2N2NnXA5pULrdrFNumGkZcC//k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967752; c=relaxed/simple;
	bh=xw814y87t87quBntQJcxdp2+tqIAOOAp3DWlfXczkJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eNYV5IMMLlKZUbBIqPejDRxnu0fkyr1Pe84T58Ayl4PutlA18TETwhbBLu6vyn+TSrorsf7TJYQ2ntU17SI4ww6lyxNTd1HxaBvEFwz8hxW8LnM3+vhraozzqefDVdGhgtj8dIKDRj0HKiW9y5qg2TesTLCHSIvbFvffYwfxw8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=MesJ4WCX; arc=pass smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="MesJ4WCX"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-47c0b98b49bso65630fac.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:29:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788967748; cv=none;
        d=google.com; s=arc-20260327;
        b=DYoMRTEK56/giAEeQKqFdZwYQgB8Da3aVVcbA9lctBYbHqX9frqZbZx3hiFcPIC9+x
         TteOqqFEO9Tqk/ksfOIeXzbXzg7TmThfrQ+6gTQiuL+1NDB6HTSHOzFTaswLWSf/ldtx
         iN3BvKA4HFl/cpUrXKg8Lx093c1GfozI4cA1BoEkzSglPGE7hANTnv1ProfD3i+Am7Nc
         vhqOVQ9phWKftWzoMlTJMuO43pLRinwkN+8eI9z8c8nOdkLAHtCdKn62tVB1hrdXVOpd
         ILLWGvqgPO5Ajy3ruja/8P/xa5gJ9jDx5tuzMpECEnns5tPmoobVe49sDRYU0UyeNSbN
         532g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VF0OQubi00GE96JsDJZGKD+Lng8NQh8xjco2BGsiNA4=;
        fh=7uZiz+LPR+cvefVnEti3gnnixFE3S7SusTZYCuZVqTA=;
        b=LSvbhczqo+agE8Z01dOstbROuEamlkunIKZrcp3L+usLDt/zDqffwxqqH9R2v0Cfnl
         XjcEzduDWxr6zT1+pyavJyR3KXzxEZnBjUDHeM4kk9Q0bAOUHZGQWk5SgLSYPezXpX0R
         oZiiNIgU9kW2fuMQabzINnv1lerMXUd/1YAfbk29wYkuRFtbNqpXCMl/Q6ubSXhUA8Cl
         6kSImSdtSRXPKaL+ugCKsr0xgdKXIcL+uS1slem1HN0+OruMGXAxylCrzYay1Uf2wAM+
         OUABYVsoB3Zg1ubDD5VZvK3hSuvyv5IPa1w7rqC8YvkgRYsF/9GD5Zt2+mgxuVdx2xQL
         OhIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1788967748; x=1789572548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VF0OQubi00GE96JsDJZGKD+Lng8NQh8xjco2BGsiNA4=;
        b=MesJ4WCXa2NT4ezY0jTvkShOcaZ9Ppjb6I9FdvfcXOHJaI340qM0TgKvslkPsvzetG
         1LFYRTCsnxFliHIA8vTibp74KSDKq/PB5QjXsxKTUjHi4C/ZJ7mDOfVW2iQT1IDDF8YY
         M4n8HRFkOL3ULfyNvzv3bt52aG9ZQWYhBXSxWID/MGKQ0dFBHJfdXLv0Wh/JZdynjEHb
         9WZ6MYct32b19IZpBcSrqG+lS++xuFc9vo7PSIB2qkkZ9jO099MNkgsnbThfTVOXQ3x3
         vk5q8Pf9csSt/1YE7RJHStqpnqFGzQNCrg6YsOnwg+G+IsBvjkE5DLYCVAkf206A32I+
         3Spg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967748; x=1789572548;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VF0OQubi00GE96JsDJZGKD+Lng8NQh8xjco2BGsiNA4=;
        b=QbsIOaXLnt2ckSK4WxfdsM3wJ/RsdbkZMQm8DIieuZh2f1baUbPOiibiDAzXRGDETX
         nKA+2A4djo8Pfhr3IC0fs2pp4jaLO+9qnhnrLSUeUWxQA0euz9svp5lw3pl7bu9XRAK7
         mIY6rxBh2Ja/wxtInmqZhKQpjFahxL5i7j5xzzpb7nGLNdmnCYsvipMOqGhrRUqrzlOb
         BgwfIZ1iiO1tb8IU95o+4m6jwFMqC9Iqvwlpl87GEm0ME0HY6RBMZ36giKQg4Hy6ItGk
         HAC5/VFCbrL8MZGB3C/jD+8yINgFfMEy12IKUQyE2ykXlck9d7623MVaXZJbvUPXUrJU
         fnWA==
X-Forwarded-Encrypted: i=1; AKwUvBzGsaNMG+l+yqtq4rEzuy3pc8qteJDYmphYAQGAnnfodqpHzRP/KYHulWIcVmMdi0r0bI3Z6fPj01Abyj0=@vger.kernel.org
X-Gm-Message-State: AFuF++lpHoQrHaR5Pl693X934xCUfaSIyH5eIHwy9kA44TOcWODr2d58
	xJRxIbOgOZXnnbI3MiOohuvURjwWW3jzTqjlC34bsVoK22c8E+hC75QdSefGUnLpmTMR9x6pGh6
	+o3OYCyu/DdXD206RDiI4ZS1x/tcqnspx25rr4+hzIY4/Hkl46ORKQPI=
X-Gm-Gg: AYBFou0HkhecrzOW+zj17REzfAl0njA58XQNyEgyg4kQS0HrY7GC5/Mlukj0TJlY/3g
	3A77x0bXAOYtf9XQ4OteZhe8lWR5Sm3CZNWZ2AABgc2XXq8go8Hf5nBEzTtQepg/7yKyDJ4LzjK
	8dwiOpXZMhO9ZOXKjov5G7AdpanBXH7c6PIGqfl0LV96JSQoFoV1HyrdX+CfMe4uSju5cSK5yko
	vG3dQH527BKH9XtsJZH+5QXORgSbwDZGJJnIxnp2XWyg5uK6xHSXD4d56zzHzGxLyc3cW81wAQC
	V3MIr4DvxMTvzQa4E1c2kEYoWWR9s40QmiGmqDnwg3wgZT2BP+JoYNE=
X-Received: by 2002:a05:6870:56a9:b0:448:70ac:44aa with SMTP id
 586e51a60fabf-47694bce4d1mr16666049fac.2.1788967747907; Wed, 09 Sep 2026
 08:29:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909132412.8965-1-ruben@scstudios.tech>
In-Reply-To: <20260909132412.8965-1-ruben@scstudios.tech>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Wed, 9 Sep 2026 08:28:56 -0700
X-Gm-Features: AcwNN1XeVWtY4QT4IUSZDerLCC2KE5DhMESR2cfJmiq1YwTKtThhqVs4_2s5bgY
Message-ID: <CADUfDZqb+Tcxqd2GxX+0baFSsEv=+GH-adYQomcwPLzwABv4=Q@mail.gmail.com>
Subject: Re: [PATCH] selftests: ublk: Reject excess backing files
To: Ruben Sutton <ruben@scstudios.tech>
Cc: Ming Lei <tom.leiming@gmail.com>, Shuah Khan <shuah@kernel.org>, linux-block@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 7:17=E2=80=AFAM Ruben Sutton <ruben@scstudios.tech> =
wrote:
>
> kublk stores at most MAX_BACK_FILES backing file arguments. The
> argument parser currently stops collecting paths when that limit is
> reached and silently ignores any remaining paths.
>
> Reject the command instead so that a test cannot accidentally run with
> fewer backing files than requested. Add a regression test that exercises
> the error without requiring a ublk device.

There are already plenty of ways to break kublk (try kublk add
--unrecognized_long_opt). It's a test helper, not a hardened
production-ready ublk server.

>
> Fixes: 6aecda00b7d1 ("selftests: ublk: add kernel selftests for ublk")

Definitely don't think a Fixes tag is warranted.

Best,
Caleb

> Assisted-by: LLM
> Signed-off-by: Ruben Sutton <ruben@scstudios.tech>
> ---
>  tools/testing/selftests/ublk/Makefile       |  4 +++-
>  tools/testing/selftests/ublk/kublk.c        |  5 +++++
>  tools/testing/selftests/ublk/test_cli_01.sh | 15 +++++++++++++++
>  3 files changed, 23 insertions(+), 1 deletion(-)
>  create mode 100755 tools/testing/selftests/ublk/test_cli_01.sh
>
> diff --git a/tools/testing/selftests/ublk/Makefile b/tools/testing/selfte=
sts/ublk/Makefile
> index 5daf36c6c3..28ce542d4e 100644
> --- a/tools/testing/selftests/ublk/Makefile
> +++ b/tools/testing/selftests/ublk/Makefile
> @@ -7,7 +7,9 @@ endif
>
>  LDLIBS +=3D -lpthread -lm -luring
>
> -TEST_PROGS :=3D test_generic_02.sh
> +TEST_PROGS :=3D test_cli_01.sh
> +
> +TEST_PROGS +=3D test_generic_02.sh
>  TEST_PROGS +=3D test_generic_03.sh
>  TEST_PROGS +=3D test_generic_06.sh
>  TEST_PROGS +=3D test_generic_07.sh
> diff --git a/tools/testing/selftests/ublk/kublk.c b/tools/testing/selftes=
ts/ublk/kublk.c
> index 2400b46157..3af2f10ca8 100644
> --- a/tools/testing/selftests/ublk/kublk.c
> +++ b/tools/testing/selftests/ublk/kublk.c
> @@ -2525,6 +2525,11 @@ int main(int argc, char *argv[])
>         while (i < argc && ctx.nr_files < MAX_BACK_FILES) {
>                 ctx.files[ctx.nr_files++] =3D argv[i++];
>         }
> +       if (i < argc) {
> +               fprintf(stderr, "too many backing files (maximum is %d)\n=
",
> +                       MAX_BACK_FILES);
> +               return -EINVAL;
> +       }
>
>         ops =3D ublk_find_tgt(ctx.tgt_type);
>         if (ops && ops->parse_cmd_line) {
> diff --git a/tools/testing/selftests/ublk/test_cli_01.sh b/tools/testing/=
selftests/ublk/test_cli_01.sh
> new file mode 100755
> index 0000000000..e937b8e20b
> --- /dev/null
> +++ b/tools/testing/selftests/ublk/test_cli_01.sh
> @@ -0,0 +1,15 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +
> +UBLK_PROG=3D"$(dirname "$0")/kublk"
> +expected=3D"too many backing files (maximum is 4)"
> +
> +if output=3D$("${UBLK_PROG}" add -t stripe a b c d e 2>&1); then
> +       echo "kublk accepted more than four backing files"
> +       exit 1
> +fi
> +
> +if [ "${output}" !=3D "${expected}" ]; then
> +       echo "unexpected error: ${output}"
> +       exit 1
> +fi
>
> base-commit: 893e11787f78e43b534e252249ac3fff4d1333f8
> --
> 2.54.0 (Apple Git-157)
>
>
