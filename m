Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61103448D0E
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 22:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791411867; cv=pass; b=bLo1ZT+tLS3G1k1yYpoRSI+yMWyg69UnJGk6b3Z+vt7rf5qMU99suiZlhNDH1BSSiOUCgTW1EJ6ctPtAxPzVfLIqGOgQKhquj6DrR3v4vJgaSbHbh5XxOtJfLmDpgZxtLb5CfTsKEqFBFxI/WVZIWjJRzgzZF7l/jEagrtgoaiw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791411867; c=relaxed/simple;
	bh=j1hldUczhaCmA9pPT03tsjvi/psIdM+Fkc0aCRQs3iY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ELBI6dLAVUabGyd8V9SF8mu3q8crEO1KIHojYmpCD74aLNgDmd729lSGzmX/DulpcS905UZ6ICwi9FHD8fDfHMHOEoyE++5J+MCZIm6dVrXjUm5N4Nu8Z1CDxO16BYisabgnf+XZmEEFo8uMyBbzyYe4w+1Nquasu0iZjCHwJ+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/dl1cB6; arc=pass smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/dl1cB6"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7f84a55cc06so1833802a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 15:24:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791411865; cv=none;
        d=google.com; s=arc-20260327;
        b=mpUl+kqwaoNaPmznJHlghxeyOHBJr2O+hZ5YFHjXCYy5KHnLzXfKsZyBKpYA5vOO63
         k9rxjbx+IvmaVl7DK6dp6HNrVwbyQ/W8XyrjhNXyvwgLU0FJc6d9qm/PJZDi+QMF38rH
         D0LYeVHiFkJTly9CPugEvYZ60oAEehFQ30YIhC2NtUzvFkOH3qBOEikdG7ZDMysQctFC
         t3meqrnMfojaUSsuSTDYMGNWLEK4ArwZpnN1GyzO3cpJ4KQbQYikB5JiiuE0MUHejIiF
         +7pIZd+sxo5k93nDIa5fY5/Mwk48LDmazUubnNBafPQLdlEx3JeqmQcJULoIG6i0bN3u
         pL3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S2K8HbBhL2mL5g4N2SG5IxowUfPkOB88+AD/Ddc3DyM=;
        fh=0V4dD9Jro6IEhrJpiVBdnY2XNGqpHCeJrSwpF4IGBSk=;
        b=SZLAKMpA+cuGU/OeN37BUbmlgxLJtOagnIlFj4Ftlw39rR5PTiB4/e4aiBF/Xku28o
         cI+itDIroEUBqo6c7lRs38YKksU7mF2IEySyhAngfrUDJVBUa9rtPBCEYoTlMkq2b6zl
         /M4GKWvOZpR4Rvby0O3IfLafmzaZBViI6g/MlXXpIBJlT2/clzxIf3o3P2kufKdl4PGt
         b0raldmmDaCawqjFJtQjefghX/smxMl1hE8TZWyaKs1fYZr4rmwJgmSFyqmf7tyCU89n
         z6G/oU5pbrCIz9kwKfvu8PpoibzLrz6WlLjfmKFq29nTuYZ17J5zLTPDR2+UqBSbpN3o
         tq6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791411865; x=1792016665; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S2K8HbBhL2mL5g4N2SG5IxowUfPkOB88+AD/Ddc3DyM=;
        b=m/dl1cB6TDZfYKeGU5JcD6RqTzO6S/5Dj4fECxD8A8ae5TgjwrK4OPDt1Eruhh063a
         HWjqNvgBoYFSxGrE0p5SdHm5IPKitus9iZeKz0A3uB9qOFRDn5fJB+2sxXwQ9OxlbKvr
         KcBDRMjvt1CZ6DLtEalQltXc9Ubk2SKa87agg/slsfkzS586CvJKQR1vFM1m7gXkll7c
         UuQiAPrHx+uZ58E25DxFaU61Bxe8CVp2DgtQpDpCfrgxnsBx7BNwO4rzftkP533KhGmU
         V+GDgX6JbZepzmCa7zq6a4hvB468N/lcxA3YKJ5fP7bvubXUe85PQogt4QGUMRSzwwNH
         eg7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791411865; x=1792016665;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S2K8HbBhL2mL5g4N2SG5IxowUfPkOB88+AD/Ddc3DyM=;
        b=F36/RtqY+UOUrSb5Qto3V7BmQiWJlDKRR8T3TVReZrmvfU2y2IZqC147IrupLTEZ9T
         1hGBg+AQmuz1cy3fdkDaT+imLsIXu0ROJPMOFSkCIicLmXW/HwW4yqJrEPuvw7aDy/SA
         yzbq5M9Vew6DV3Qvs1Mgqhf352Ah0uHMVGm3u8kTL4D0JdqyBWekaM2DF+kW3eViVYY0
         me5/WAEPLVUHAA253PqtGKOvXNdeWs1oVQKDvHbQTX6KD0q0O7OAiLvnXMnzolduSoqu
         hdfoWRsuGQPuA3e3zKkq1qKE5239zkUd1n1QH7U55cvmGW/pv/iEZkoNkd8qBivTN9jt
         mmXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwG9+0nJ58qNoTmWXlM/FfQJmLSlgVskQRbewyKe6QGWa1mDm79xdDkpC4A8j1ETXiv2oiW10jI9jk5UJw=@vger.kernel.org
X-Gm-Message-State: AFuF++ltH/2AMmLl3863PYc3+OTcp5Ps/Irzi/Eu6yd6AzLFgY+6X8Kq
	fW2hi2zV7Vwkscu35p3rZXIprDGZj09jdOMF8PJNObN6KELdg2EAgpve+Td7IUY0uBKVhg9Njut
	maYZDSQKgl5ho3AHh47ZWmYopxVNjXSM=
X-Gm-Gg: AYBFou2xUKZ1lXy4xO3BrfLoMpTQc0f6civFby70mEdkCi77S2beA58FY7YppDu8twF
	Ap+aaUOysq3Ag+lPSB4UR3OYIIinErZwAjiT43l/h/TLmHUxkJg2cZ1YvPTDYUTwGVfkemOS8nu
	pUMJEkZfiSJ4KvescV4sxxCR6aOPsJfy/Io+lioHcjT25cOBmYEpTCZKyNWUfi3MemjYpSraaK+
	hBhBbtS0DeB8CxGjGSeOkdfEn55rG18TM1ZwWxDv8McyoWKMLf453c+TKQxS4omkAfAx/7eIOvE
	E1JoqERFoML85XTk4do6KtFEANHfcX5gz6428DG/jFjmQNPiSJdQRwydHEWVkQwCzQ==
X-Received: by 2002:a05:6808:c18f:b0:4f6:1336:cdf9 with SMTP id
 5614622812f47-4fc4677cbffmr3710852b6e.35.1791411864709; Wed, 07 Oct 2026
 15:24:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007-a3-arg-trusted-v4-v4-0-253ef3a1a69a@mails.tsinghua.edu.cn>
 <20261007-a3-arg-trusted-v4-v4-2-253ef3a1a69a@mails.tsinghua.edu.cn>
In-Reply-To: <20261007-a3-arg-trusted-v4-v4-2-253ef3a1a69a@mails.tsinghua.edu.cn>
From: Amery Hung <ameryhung@gmail.com>
Date: Wed, 7 Oct 2026 15:24:13 -0700
X-Gm-Features: AclHuK9gTsp7jsRrpHs1cx8Ph74rNFmBjbvSX0u-AULTjQs9ENLQ5IRNn8neVso
Message-ID: <CAMB2axPoPSJen57E2Suc1hFcwhHJjjEruC+8tthRA+-JhDA6Og@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 2/2] selftests/bpf: Cover trusted BTF ID
 argument provenance
To: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Brahmajit Das <listout@listout.xyz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 9:25=E2=80=AFAM Yiyang Chen
<chenyy23@mails.tsinghua.edu.cn> wrote:
>
> Extend verifier_global_ptr_args.c with calls that pass bare and
> RCU-protected task pointers to a global __arg_trusted parameter. Both
> calls must be rejected because neither pointer is referenced or trusted.
>
> Add paired test-module kfuncs that return and accept a nullable trusted
> task pointer. Passing the return value directly must succeed, covering
> PTR_TRUSTED | PTR_MAYBE_NULL handling in the common argument checker.
>
> Signed-off-by: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>

Reviewed-by: Amery Hung <ameryhung@gmail.com>

> ---
>  tools/testing/selftests/bpf/progs/iters_testmod.c  | 11 +++++++
>  .../selftests/bpf/progs/verifier_global_ptr_args.c | 35 ++++++++++++++++=
++++++
>  .../testing/selftests/bpf/test_kmods/bpf_testmod.c | 11 +++++++
>  .../selftests/bpf/test_kmods/bpf_testmod_kfunc.h   |  2 ++
>  4 files changed, 59 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/progs/iters_testmod.c b/tools/te=
sting/selftests/bpf/progs/iters_testmod.c
> index f65cc9766633e..145750bb64ef8 100644
> --- a/tools/testing/selftests/bpf/progs/iters_testmod.c
> +++ b/tools/testing/selftests/bpf/progs/iters_testmod.c
> @@ -46,6 +46,17 @@ int iter_next_trusted_or_null(const void *ctx)
>         return 0;
>  }
>
> +SEC("syscall")
> +__success
> +int trusted_nullable_kfunc(const void *ctx)
> +{
> +       struct task_struct *task;
> +
> +       task =3D bpf_kfunc_trusted_null_test();
> +       bpf_kfunc_trusted_nullable_test(task);
> +       return 0;
> +}
> +

nit: tools/testing/selftests/bpf/progs/test_kfunc_param_nullable.c
feels like a better place than iters_testmod.c for the test.
