Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCFE4FECDD
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790783707; cv=pass; b=W1x5rI4I7W8GwzBeNR+GCihd/ZC71TBKi8oxlAs229elTQlq5VL50EpzlaIviHvzmfQTcv765MVvVbl10cUdWA/bPcyq0BycCdaLdUr47maqqt+whcl5Z5aaezx2xk7sZ1bfZGuHKkHHTE+JBcG04KyZt+OopZHZQlSeWdamz3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790783707; c=relaxed/simple;
	bh=R4Q9kST2fKyPZcf28pPVfrlZhTiZCMyaGq+/7TCxRsM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m5vABi9+RqM5hvZ3lhzvgc0g4b7hZ/up7qc5wQr7wsPWZuLiG8/dzJ1XpZU9/RgIPg861xyUs0jjdB7OYrZhNPq61fptl0oJhZ/inmocwUMZopJKMz3iTYW0r8JLDys5V8SNt4xeYCmg+fII9mEFelZ3uIad6DitzAhwPLvlH4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FMbLnN97; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FMbLnN97"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2db18fe433fso25610965ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:55:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790783701; cv=none;
        d=google.com; s=arc-20260327;
        b=Wv7HXnsY6RorGjPyOQZNbAsKh+fJ+5NX2emWYgl3yJUytRC1EP0HuwvoM23K0NkYNa
         44rWOWjwNJ4kaB5BZL10Lm0hWNQFGNxbs37pkZyq/YLtk6pkq1Mn8ZX70vDAl6zbnIU8
         MhKy3XHwWG1fok15xR14AxFUgvqXpZMMgnqS1A4ZjPH6HzfJKqreR7BviicXCIgC2qAb
         Jww4wMgyxjI7NABwQcxk0pV1EPxqVOPbIIXU64g87cr2UQIV1Jy6jGk0Y8QbxfhD93zj
         lvab86wUGdULpYjKGyPKi9LxN9qh9huy+Q6nezSwk30jFxm1G4cMD+SkxizzAN12fa70
         kNEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AzYpaD+uTPvrogD/aZ+s9EWcQbyRUEaKyQXD8umEsLo=;
        fh=L5q82ReU7mwxPrPnsrS/JjS4nvCkRi6GCRt8U1ADbM4=;
        b=OgDnCvokxBDtxn3Vql3FPInWFfUWS9niHn2GxGucPF4aQy8d5u11giOB2CijG+sif/
         UUGAgnxQI7PNK8CtKH1K2JNRC502j+k/92qYQBpTq0dIKDm2T4rZmXwWfZpC4dwgj4B7
         b77b+F0hwf+looWe9OYk/uVUwxbmi0HuAouo1Gs7vkW0gHle/jY++nZuULTPn4iOkRrR
         0Igf8R51xqHkG6WF6LIkMXJxHIMprIW18qDEOk144NT+G19x6mbgZ3fDdvqwxI4TJGL6
         A8LVgE3axV1GdTuO/m+ZmhS3eeg2XB9+bPyhfVD3Yib0kWka67pdWiJMfsCsnBgd4eJk
         QlIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790783701; x=1791388501; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AzYpaD+uTPvrogD/aZ+s9EWcQbyRUEaKyQXD8umEsLo=;
        b=FMbLnN97rof8pVyql3pYRF0Gnvk3EwNSzNWGM8bjHAtz48AKR1UWxjdTun8ocpEc96
         NbLDnKFHjYzcGithV5oWS7/bvGcsf8X2JexhWzw3siJRhK3Z6Evi/vMgCHcY8s3Fb9Rn
         hfxUz5tYIVkpAL14eRKXdUisTTjxIblU7JjhYC2/A0ZieSyvcqGSkQgioqKDD7mY7e/G
         Mr8lOw6m/mbtSAHq5HeKP0Xmg9hraZHkKiZuNGhpowqb9mUa7SdF3ihUcNV+FqzZ0JBY
         jPN/llR4kAkvQ3ai6NNCbbbeKY2BKVxmhq5ZI/TfEvchAzUlF3i9NxzUF/1zHrhFbS3m
         HgRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790783701; x=1791388501;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AzYpaD+uTPvrogD/aZ+s9EWcQbyRUEaKyQXD8umEsLo=;
        b=Djxo2qwQQFNUNL0MK0ENggjy+dC8zFK0QdDdLpqUcOWylX1DzC4ef6NxpOccYZsMNa
         dVsRGnjPDMmUemwU5Gz+FS9NOhPl1pQWTd5EKfwcA0F1bM7xaSpa5+vqB1LD6jcaH2Hz
         +UZk3LLmz6Qnxdjbbz24IqUYNBLhAJB5DwVpEHAq1fU3p7Zr7HZojAyFYSHqKrV9TWYH
         qa8IAmZCX8MeYjPKpdfZAcYhs4f0psFd0GmZXL+FSjbcSrbxvFOvGiRQTKXNx/5S/gQx
         xtcidgGjIoKiWQclqTcKcwc5LMN5hFKd9CME9FgEQGv/1M9zLDKiqQGL0AhCagd6kjf0
         h+0w==
X-Forwarded-Encrypted: i=1; AKwUvBwolpUHAR7q2By2bm80vAgIgCxHv9Prg1/gX8P4SPKxRlkA4UE++3LCrvPq0DUwj+nmOlaqrZyCA+78MN4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbDLfqGGgQAIwSPYfQwTtRYzNAXBf/buQl57vFZewaxDdsMQB6
	3xDHT+0sjOiuzFzOKxCY6cFcM5EAvIIv9zQUNEXSG6csoMEkExR+7ihskxYK1j0XoD+yyNb/UGu
	/HAT+1r8K0n6i/uZDSv07h40iaD+srq4=
X-Gm-Gg: AYBFou0SDlVj0J7MNnubwef+TMSvDvQdUbnkktxO/4PoWgRNQWVwClwrXRcSXrjJhXR
	xDoc3jQpJAq+CcvRdWqzdz4qKan+YLnXXRzI5SgihWcvWPQhCWozDL7DN1QaFcRLjqzGpFAFYLL
	s1/Hb2vY/UGMsjwRLha/YoOFIgoRP2D2OwQpOl/XbYjzPmUBkK9tvLomVzs/BmrUa5KfXojPFMb
	ZSmUGJcX4px7sgpzERfCoWMi1oW1QC0PF1yTsiPPGJYk7NuDyANbBs3kBA1SUc2EDEdVYh/d2rD
	bwMcn54DpRY70sURCgN79gfoTDxTFC/Zj2isbfMNrP1JRA5D+N3BpaUgdEwBYLBImNlHqlsr62j
	zkCsHC+4wMWo2ZJ4L8mw278716fMLrYMOHJQp80UWCp8B+g==
X-Received: by 2002:a17:902:f691:b0:2dd:c100:b2c8 with SMTP id
 d9443c01a7336-2e2e4b8b0b2mr15413965ad.51.1790783700945; Wed, 30 Sep 2026
 08:55:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-libbpf-btf-enodata-fix-v1-1-56dae4cab778@gmail.com>
In-Reply-To: <20260928-libbpf-btf-enodata-fix-v1-1-56dae4cab778@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 30 Sep 2026 08:54:48 -0700
X-Gm-Features: AclHuK91g6yBjzv5Wydmwd7HcTJSbYJJfGMPfHuF7wf05VbALjgbejhsjOtOctA
Message-ID: <CAEf4BzZDFm-RH+wj=Lf_7MQ6wVnYuNEyiEMGgpLm6uyqPEt0nw@mail.gmail.com>
Subject: Re: [PATCH bpf-next] libbpf: Fix struct and union zero detection in
 BTF dumper
To: Luis Vieira <luisflavieira@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 4:47=E2=80=AFAM Luis Vieira <luisflavieira@gmail.co=
m> wrote:
>
> btf_dump_type_data_check_zero() uses -ENODATA to indicate that a value
> is zero. The array path handles this sentinel correctly, but the struct
> and union path compares the return value against positive ENODATA.
>
> As a result, the member loop returns after examining its first member.
> A nested struct or union whose first member is zero can therefore be
> treated as entirely zero even when a later member is non-zero.
>
> Compare against -ENODATA so zero members are skipped while looking for
> a non-zero member. Add a regression test with a nested struct whose
> first member is zero and second member is non-zero.
>
> Signed-off-by: Luis Vieira <luisflavieira@gmail.com>
> ---
>  tools/lib/bpf/btf_dump.c                          | 2 +-
>  tools/testing/selftests/bpf/prog_tests/btf_dump.c | 5 +++++
>  2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/tools/lib/bpf/btf_dump.c b/tools/lib/bpf/btf_dump.c
> index fa995c02a170..dbf9f17e4b37 100644
> --- a/tools/lib/bpf/btf_dump.c
> +++ b/tools/lib/bpf/btf_dump.c
> @@ -2474,7 +2474,7 @@ static int btf_dump_type_data_check_zero(struct btf=
_dump *d,
>                         bit_sz =3D btf_member_bitfield_size(t, i);
>                         err =3D btf_dump_type_data_check_zero(d, mtype, m=
->type, data + moffset / 8,
>                                                             moffset % 8, =
bit_sz);
> -                       if (err !=3D ENODATA)
> +                       if (err !=3D -ENODATA)
>                                 return err;
>                 }
>                 return -ENODATA;
> diff --git a/tools/testing/selftests/bpf/prog_tests/btf_dump.c b/tools/te=
sting/selftests/bpf/prog_tests/btf_dump.c
> index fe04a955d46c..dd1241fcdb01 100644
> --- a/tools/testing/selftests/bpf/prog_tests/btf_dump.c
> +++ b/tools/testing/selftests/bpf/prog_tests/btf_dump.c
> @@ -886,6 +886,11 @@ static void test_btf_dump_struct_data(struct btf *bt=
f, struct btf_dump *d,
>                            "(union bpf_iter_link_info){.map =3D (struct){=
.map_fd =3D (__u32)1,},.cgroup =3D (struct){.order =3D (enum bpf_cgroup_ite=
r_order)BPF_CGROUP_ITER_SELF_ONLY,.cgroup_fd =3D (__u32)1,},.task =3D (stru=
ct){.tid =3D (__u32)1,.pid =3D (__u32)1,},}",
>                            { .cgroup =3D { .order =3D 1, .cgroup_fd =3D 1=
, }});
>
> +       /* nested structs with zero first member and non-zero second memb=
er */
> +       TEST_BTF_DUMP_DATA(btf, d, "union", str, union bpf_iter_link_info=
, BTF_F_COMPACT,
> +                          "(union bpf_iter_link_info){.cgroup =3D (struc=
t){.cgroup_fd =3D (__u32)1,},.task =3D (struct){.pid =3D (__u32)1,},}",
> +                          { .cgroup =3D { .cgroup_fd =3D 1 }});
> +

can you please split selftest into a separate patch and send as v2?
the fix makes sense, that missing - is definitely a typo we missed

pw-bot: cr

>         /* struct skb with nested structs/unions; because type output is =
so
>          * complex, we don't do a string comparison, just verify we retur=
n
>          * the type size as the amount of data displayed.
>
> ---
> base-commit: ea9358e1270ab2c3ba6f36bd9bdda68617665516
> change-id: 20260928-libbpf-btf-enodata-fix-ac6381645ab8
>
> Best regards,
> --
> Luis Vieira <luisflavieira@gmail.com>
>
