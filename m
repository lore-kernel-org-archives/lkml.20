Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6D619D065
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 00:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788566838; cv=pass; b=DEqLdF7D906KWKoTFUfoMcHzTNEMlr2zh78CECGaxi9wCq/mwCL2UTBHa0nyRUFK9i52Gb77ffjlLdvn3sfrf85r9y3xeUToKG8QHoejHMyOEpBXgsc79l8EjxkoVTVXZlM7V8vTr0cNQVz342IFtV1KmDs+e9iKEES1/iZiUGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788566838; c=relaxed/simple;
	bh=6invxGq45BfjlUUrgPrcmaU+Va2qzk3Qq7Se2XD8ceE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SvNJpKwMAkZCI6gD0HVq6tgGIOG8uWu0t2kOOF+IDUVBVth+eEox1f5hF2/MN5ngMiCm6RaVaD3iiJH+DJeQP2VXLpEY9ude6bhrWj+KJCXGzDDRttxDgcd+N5O4rd2f7JKB09nkKkH/X/tbYLHeQ7HzkmwgMMxVOEI7Sv/TpQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=owPd5DT0; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="owPd5DT0"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-66c7127a73dso2348132d50.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 17:07:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788566836; cv=none;
        d=google.com; s=arc-20260327;
        b=rseVcliQ/4t+/MXgzXT2kh03vuVE0dspKOgCEpGKcEElOYIcWWKt3TDPUTUnyinV1j
         DoEnPOFhtpM9iNRv1hwf2Zpk2z1eBZKyVJN9+/ArzJM4UmWGoZaxeOzqXrQ3UAZe420x
         2L9uk+XOiuGT66AwIV0MTsNViHubQCMVaL5UNgJ4vJpeuyY/a+JFPgsoLdvNCJ6IrnNj
         du6egU95VGe/nT9WgjtnQkx7lcyBwgjq6g2GWT+O15b2a2VsE7jdesm/Dqx3LKNM2u2l
         TYa65ZhhtBf5YorVIaXvNLL3faC3NwO01UYFbwoj08qAxploUIXfbtOYpbpQZ0eGr++j
         8Q6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3ei9uO3GSaCXYN7d6SFTWTyT25jHIYnylKB63RpHXgQ=;
        fh=r1sGzHtTshhglYrvJrHvwfOPbGexvF85EZ2nIRpn4+M=;
        b=OD7bVWFp1BI2OSHG0h7uPfTVopqCkrqMViuuu94qHEYSbQFBr313kN5ZqeNf5LsBEH
         aloTadfy18t6p+NYD3RHmGMhCt4HIpn1RnWa0rQzwgOWsLLX2nmxznaxu/8Dr/8QqU/E
         bHJsG/U9JwyErzrXnXRwgSPyK4+TfbVXIVgWOKQ+8Jm6lJY2Tvah91L1JCrNIKo3kQVW
         +1AVhN/4yeuNIiKubGSP1B4yQ+T68Lt7tgoUhvBkkVPpP8PaHCzdArWWylC4WotneS5O
         zmJ60w3/j2D/UTUul35EEaLYr+DTlg3cM/YksjytdnjocxV57N0E9dv390DqZV29Ybpm
         Z32Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1788566836; x=1789171636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3ei9uO3GSaCXYN7d6SFTWTyT25jHIYnylKB63RpHXgQ=;
        b=owPd5DT0Q0ZfqWBJ1d/cMQYkpkPzNEYiGhz++L9cO9cXDHesltWLZD16RZdMTfb8Sk
         jfwjEbQbwGNn7f4qVw9GfCNgKT/Scduzsc+/EuJB4csPHVpvEW0rOMtJNvcUPYinbHKw
         4wfkOq2zo/Xbdo4Lg93ciRgVJQpZUkeTWCSh9J8nSN+iiBApyULcAoslUuACK6+3Bv5P
         J8ecEDIGMQHJ74wtHP1fZH/Wxe/8IXpYMxUECv8o0hZ/DOmbQO6syoSLOF7Bao0nQbxt
         giUFsmGiJFuqTt/IyqTjON6goLYLp3ykINr2fHb3aEaVxIZ8EziDYs/0/LRt5tGIz/Bw
         LC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788566836; x=1789171636;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ei9uO3GSaCXYN7d6SFTWTyT25jHIYnylKB63RpHXgQ=;
        b=hK1zuru+1cVUn4mSf7JF9gup8fIfxBP8+sfatuhtvm17XHAApdQaXRkkS5hznVYX33
         Zj4DNfhQo3hXBv1tWe/2ri1dgvK0ivo2tsXPEZ0F7N6kYYBuEprYhcA91uWdkx2mQEi0
         GILyRJ2gRiUPUeRdJmtDTm1+MRL4dhuC5HDZIS3tqPbr+w0Onoy3+c9BPY7Q/kFL/xqR
         vEWGhWw/c07RcpjHAS57X1s00Z9+vZxSJxss2/IyNCTc2klEQUPY5GTq2zW1/QtFQLCx
         pAEX1UOcwjPLG5A3r8kbhjyYxuiqt0PAnTCgBawvM6t6R+nWT+kk78i5i2Nqost4JpSi
         K8EA==
X-Forwarded-Encrypted: i=1; AKwUvBzhPc8OitINHjVUsOFnc/iXAWiJmc5erP71VwKQvHLhEDrzLcjFDU7UE8q3VYzIHzzDCazaqK+5LSaIDa4=@vger.kernel.org
X-Gm-Message-State: AFuF++nhgTOeWI7ByQa/yKPTQll1EzeXm4YqAhP9B1kVOTpuv48Xd50h
	GBNEBzCfX6cOh96R2vAZ0gZvoqRXcrevJIlOqaq9JgEnfL99jZA6HJBqCb7MHnfb5BRRl3Q1zo8
	IGWXlfjXYb0Pgmw4/1gLNV2kiYBez+J6PhaHdwxjdJQ==
X-Gm-Gg: AYBFou1WAQBonla6MNi3tIzdgHW7gBFwfLwcNEG64NM1lXr1JYvYP2Nc1lK1jJQ2T1K
	FYEGNBo9HlT03eN+e3Sptu/PDNcocQFLGajM1/XcFHAmGhEGxLiXObnx8iRqsLV14JzmN/CAxtc
	jDPdy37P81DfboxFYcxUXBJZ9KunIOA7xVXrlMi8Q7AS8CWhoZSUJ+ZFRD2/lw61ZuyF70FguK2
	OE4JrVhGOwRq95F2X/N/Wco8gHNROJ1jPcLEsEnPPHs0flG91VnWzS3E9AztyYzOF3lh5j1jXK1
	HDVkHu6lqmiNBM/zDxpC2kMfvJtnDIe0lGxbFT6YVPltMdHA9qXPjDyNE1Com7OZvrI6Bg+Iog=
	=
X-Received: by 2002:a53:df46:0:b0:66d:13ac:e9d8 with SMTP id
 956f58d0204a3-66fb5a29fe2mr2847711d50.26.1788566836124; Fri, 04 Sep 2026
 17:07:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901014829.3504342-2-sanghyun.park.cnu@gmail.com>
In-Reply-To: <20260901014829.3504342-2-sanghyun.park.cnu@gmail.com>
From: Emil Tsalapatis <emil@etsalapatis.com>
Date: Fri, 4 Sep 2026 20:07:04 -0400
X-Gm-Features: AcwNN1Xp7B5KDmWx5xBMbQWhC_olmcuGliCqh-GT1hjD7H_XCbb0j7_t1sXv6ok
Message-ID: <CABFh=a5u-jbYdLRwexCXt_e2gR9QkT+ndrA+920x9vS2-sJZkA@mail.gmail.com>
Subject: Re: [PATCH bpf] bpf: Fix program BTF use-after-free in sleepable programs
To: Sanghyun Park <sanghyun.park.cnu@gmail.com>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 9:48=E2=80=AFPM Sanghyun Park
<sanghyun.park.cnu@gmail.com> wrote:
>
> Object kfunc calls embed metadata owned by the program BTF. A sleepable
> program can remain active under Tasks Trace RCU after its last reference =
is
> dropped, while program teardown releases the BTF through ordinary RCU. Th=
e
> invocation can then dereference freed metadata in bpf_obj_new().
>
> Move btf_put() into __bpf_prog_put_rcu(), the callback that frees the
> program. When teardown is deferred, that callback runs after the program'=
s
> own grace period (Tasks Trace RCU for sleepable programs and ordinary RCU
> otherwise), so the BTF outlives every active invocation. The non-deferred
> path invokes the callback synchronously, so load-error cleanup stays dire=
ct.
>
> Fixes: 958cf2e273f0 ("bpf: Introduce bpf_obj_new")
> Signed-off-by: Sanghyun Park <sanghyun.park.cnu@gmail.com>

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

> ---
>  kernel/bpf/syscall.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> index 6db306d23b479f..3b6cf93c43c4d6 100644
> --- a/kernel/bpf/syscall.c
> +++ b/kernel/bpf/syscall.c
> @@ -2438,6 +2438,7 @@ static void __bpf_prog_put_rcu(struct rcu_head *rcu=
)
>  {
>         struct bpf_prog_aux *aux =3D container_of(rcu, struct bpf_prog_au=
x, rcu);
>
> +       btf_put(aux->btf);
>         kvfree(aux->func_info);
>         kfree(aux->func_info_aux);
>         free_uid(aux->user);
> @@ -2448,7 +2449,6 @@ static void __bpf_prog_put_rcu(struct rcu_head *rcu=
)
>  static void __bpf_prog_put_noref(struct bpf_prog *prog, bool deferred)
>  {
>         bpf_prog_kallsyms_del_all(prog);
> -       btf_put(prog->aux->btf);
>         module_put(prog->aux->mod);
>         kvfree(prog->aux->jited_linfo);
>         kvfree(prog->aux->linfo);
> --
> 2.48.1
