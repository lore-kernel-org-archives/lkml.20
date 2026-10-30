Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793385354;
	b=uIQsmyJ74HuNToImF1IDmAaZMfiBbbmE3qV2G+xmf5rx9GUYjwJcSL8hxxaq7Hh5xKgb
	 SJ8ZFmnWUVaJpGlLGTMec3LH4Ujgu0sjLkOwjbAv7aThSUjS4Tgl6UMaDsi5pCsQJ2FZI
	 v7qmZWwBbcRALrbLIK5XsKBZIjTRNS5/gchK/YldRzFSYL3wJT/P4/5Emt65Oyi/yYhEN
	 eF1WiUhbLuL4/+WQ9xMpX7yYWC9qn0jdv4BAjb19pSSVQDkX+nzw7PI2OUQnL35NYoOmS
	 Pn6PZ0Yf4Z77fyrvFiZBs1fKAsyvMKOW3k6IF2l2/zz1BZ5cUkaU3wTzrR9fyPVLiBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793385354;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VCrSy/ZuuMPWgt5tPyrPzSqsMBbI257M3gbzDa1WLh8=;
	b=cyKOHxYrtly74lI18Xc2v+GvTXkFVOdcyynGKXKmyE9s1OFu0ZwPGOAJy9pAsxFSTllI
	 eF9XKQ5z0szaPBkhcYORGvrONlkS2HD8Sa2fDew+ZuHPA8jh8sCj1Mk8z1cBV/LMjsyd+
	 bn2TO823OB6pjBeVzQicCr2FnaVCczB/Gdg184npfxBHao3ku+xkflmdXOoRBhMYj+BXL
	 FQxgkI+wCtb/ufwA//BgGWw3bAEwIKXvx/OfCSJEwpjxVaVrj8IEwMZbBBKfEhNe4fu8n
	 +BTshavODDypgwzBGoNxWqHkcDoz+A6QjKJMqdzvyx3YdQWD1sxokPmDw6YsIdTaqNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aOnOGARL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D683606A326
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:35:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D683606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aOnOGARL
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso639554a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:35:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793385353; cv=none;
        d=google.com; s=arc-20260327;
        b=C/6eR3XHcMlw7PLaKADX8ip4HkTlosIBLmy0Hag0GNXyHJ7erGqRuudtLqevc6PHFk
         oyADd4+dRH+twdvfkwshlhJuZz4ywDTYJQ844u7OZ+OoGd2EskESmMMnW1jzbDpWza6s
         6rQP4vtCaiFbt2zMUnC77uZPR5KG4Pw/9nyn9vLPFbCmcSbic0qu5uaQag6IYrYMhVgS
         CaFY4c74i6kNtpfUC9bD6SoPcM5XkaLEyrj+d9OljeXwmEYU+0VpORXwhZsaST794+hq
         pVgrlMlBgRjHsXQVkTXaUu5ON65a4wdhC9JMDv0NtieIMiA0CtrpJJT2AqpUc9UVSEZq
         6/Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VCrSy/ZuuMPWgt5tPyrPzSqsMBbI257M3gbzDa1WLh8=;
        fh=Pqcl0UaqQg/MloL5N6bT0/C5dIFKtP1gkQs88JxjTtk=;
        b=eE+NE53m/ub5RqxPIpNsbbc45VgFfAD7apE7HDEKMGsOstcdVpKNWpcRratslbwTSi
         Et8SRoXxAxzNJnO1354mqONy3+/7BxuGvMiIj08LAFwJQIQCzqGVABUvuvi15TGelw9w
         ef9cSwyBI3pFDaRqGrAzff2JNk62/AXACc0npR8PkQhZIKwEj57EDuTWwu7XjKb1kuf+
         zWnngADIQbnFx7I0ox0+yhZnz2QobGOI4BOfl9Az03fKANFgQIcpn7iSHCmIGAKJ6doH
         hBLZUa+s1KRxFSxzRDyof7MMvSbgByIqe8yC9ooeZ6DVMoRTwEeZPfJQOgR/mMSGJ6ia
         yQ7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793385353; x=1793990153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VCrSy/ZuuMPWgt5tPyrPzSqsMBbI257M3gbzDa1WLh8=;
        b=aOnOGARLAq3+vS3+AUAPyMDEM0nVkyJNKoWKe1zBx9m4Ld6GSVIyxuBOaQ3UWb3jFq
         lKxLW7kPynGs+3LpOSvm520sBcekrqRSz96tcQ84lBgloV+yvgMCAzMa5u0twtKKwnJN
         dK6rh1c4jZz3yV/7uszUoYNY1jKh5ZF00RHaOiB3baCOd6i611tMdmidenXyi9PaDQoR
         XHqhK+Tj+iJSzZsPXDs+fqIPuIcCVpeA6Yt9Xgq5CqPtieDLghs7tLs/66sIMMks50qZ
         OjfNQyLtLTkebbTfQEVo86i/SKSKpWDfJRE3Mb9+EtfHLwhJDq6Y8/2NeKEeFfCV9zLb
         TkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793385353; x=1793990153;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VCrSy/ZuuMPWgt5tPyrPzSqsMBbI257M3gbzDa1WLh8=;
        b=j4yoMnQkgXwACw2Xd+c02J7AsRJVdDrRWSur7aBPK0DpyHdaQxbeYYBVwBCq+e3+q6
         CkKH/P+Z0+eX1z+N8aY+ZS/XBX76DwmsuBrgRR1obACCCnvBE5MDa7ZANf+8M+pCeUrx
         3WGXdIOltul6P8M2T5OQfiIcI54NxwJp5NLsZZWpOvcmSKD3pZBfezAunjSb8jcceM1w
         dZUEEId+PiX1iUrruVSIhBOqarOPAroJaFMW+LyTdmC5+aXm1i9+LKJnapaJfgE8pSg9
         veq8LWSKFMQ+d5uu+WBTPuxPe16yafYpEkI5gbvxkZvPm8no2bVPmA04mAicTJNGVZ2F
         3Sig==
X-Forwarded-Encrypted: i=1; AKwUvBx18cjF/XZDFq5APq7jctJLzijAdAlKTFcCkjb9d50OGhig9GyuX8mGs1iwU41/NSYu/XTdiT8i+4Jr11k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIYmP1YoRzmIRSQ/2H/F358ZAzs8jE+saW+3nMonbCcKpWKkgh
	rjxL37FG464dtxxmR3rZo3ifWEwilRe00E4raChMMA5wg0mpZHaJq8gULEaLB5cLY4wbJa+XIly
	56fM/lQ4dP8HXG0/lKsipyP1gdROpGOQ=
X-Gm-Gg: AYBFou25EEpCzpILZ1z8F8oZcaBnlUlWCbNqr+L1rVO/4V8+BIw2LecP0J9i5eMf65g
	LMiukLuHU4u/m+/YXOtCLpEtXmLE/fxADwWVJKHMcAMFSlGHTylTAaRQjXCzcyUiiuQuekopORA
	cmOu7kMyWvVaaa1wl3phpFAkL2RDoo82v7F1KoBl/EIHm2sAt1GckI6BiK4D/Znz7QmwH0fKEEj
	T986CEUE/LEJF06kV1t7hUVjSgpt1GSqmH57Z+ev6mKVup8hX58YyDMaJ0xvuTrI+mKCeQphXAI
	Z6Y9uBb1LlWwI3tEqlikAg4RjqEfnvMylJFlZa1SsKCtekUnUYVJcZGSFTS2BjljQ2OnwJliuK9
	1+ea1L8ZFVRpoTulOA84ixW+Zt5di2/0AHfWNHQU/YUjasENRHaoFEweDNPj3xLzQaC3MOIrzTf
	vR7OlLcp9nkoY5Cv2xc+uQxh5tY+wCq5Lk2w==
X-Received: by 2002:a17:90b:1811:b0:3ac:9176:e836 with SMTP id
 98e67ed59e1d1-3ae897ccb04mr2554974a91.21.1793385353016; Fri, 30 Oct 2026
 11:35:53 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030092248.7388-1-mahe.tardy@gmail.com>
In-Reply-To: <20261030092248.7388-1-mahe.tardy@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 30 Oct 2026 11:35:41 -0700
X-Gm-Features: AclHuK_HU1GMC63pOJOmbeN9dxKnqqj0KjBqnZHrkyWTnS7x8iHm_3dMKvMKKEQ
Message-ID: <CAEf4BzaUg_KPB+k14ntDTaqU-3hEUQ8o5E2hSeUkaw4xwFwi9A@mail.gmail.com>
Subject: Re: [PATCH bpf] libbpf: Enforce program limit only for loaded programs
To: Mahe Tardy <mahe.tardy@gmail.com>
Cc: bpf@vger.kernel.org, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, linux-kernel@vger.kernel.org, 
	John Fastabend <john.fastabend@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 2:23=E2=80=AFAM Mahe Tardy <mahe.tardy@gmail.com> w=
rote:
>
> As explained in commit '259172bb6514 ("libbpf: Fix gen_loader assumption
> on number of programs.")', nr_progs which is obj->nr_programs at this
> stage is including subprogs and autoload=3Dfalse progs which are filtered
> later during the generation.
>
> Quoting Alexei, previous patch 'aac5ba0a4d52 ("libbpf: Reject excessive

we had a rebase, git sha changed, updated it here and in Fixes below.
because of that patchworks bot might not send confirmation, but this
landed in bpf-next, thanks

> program counts in generated loaders")' does move rejection at gen time
> instead of load time, but some programs are still wrongfully rejected:
>
>   Two objects with obj->nr_programs =3D=3D 33:
>
>     object               before aac5ba0a  after aac5ba0a should be
>     -------------------  ---------------  -------------  -------------
>     33 progs             -EACCES at load  -E2BIG at gen  -E2BIG at gen
>     1 prog, 32 subprogs  -EACCES at load  -E2BIG at gen  loads
>
>   The second object fails today because of the cleanup loop in
>   bpf_gen__init(). It closes nr_progs slots of prog_fd[], and
>   prog_fd[32] is at r10 + 0:
>
>     r1 =3D *(u32 *)(r10 +0)
>     invalid read from stack R10 off=3D0 size=3D4
>
> We now clamp the loop generating the cleanups, which may still be more
> numerous than necessary and do the actual E2BIG check just before
> writing the actual prog_fd into the stack for the cleanups, after
> bpf_object__load_progs() has been doing the filtering on progs.
>
> Fixes: aac5ba0a4d52 ("libbpf: Reject excessive program counts in generate=
d loaders")
> Suggested-by: Alexei Starovoitov <ast@kernel.org>
> Signed-off-by: Mahe Tardy <mahe.tardy@gmail.com>
> ---
>  tools/lib/bpf/gen_loader.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/tools/lib/bpf/gen_loader.c b/tools/lib/bpf/gen_loader.c
> index 80a6b5306183..555d4757a898 100644
> --- a/tools/lib/bpf/gen_loader.c
> +++ b/tools/lib/bpf/gen_loader.c
> @@ -122,11 +122,6 @@ void bpf_gen__init(struct bpf_gen *gen, int log_leve=
l, int nr_progs, int nr_maps
>         gen->log_level =3D log_level;
>         gen->nr_obj_maps =3D nr_maps;
>         gen->max_func_ptr_maps =3D max_func_ptr_maps;
> -       if (nr_progs > MAX_USED_PROGS) {
> -               pr_warn("Total programs exceeds %d\n", MAX_USED_PROGS);
> -               gen->error =3D -E2BIG;
> -               return;
> -       }
>         if (nr_maps + max_func_ptr_maps > MAX_USED_MAPS) {
>                 pr_warn("Total maps exceeds %d\n", MAX_USED_MAPS);
>                 gen->error =3D -E2BIG;
> @@ -144,6 +139,8 @@ void bpf_gen__init(struct bpf_gen *gen, int log_level=
, int nr_progs, int nr_maps
>         emit(gen, BPF_MOV64_IMM(BPF_REG_3, 0));
>         emit(gen, BPF_EMIT_CALL(BPF_FUNC_probe_read_kernel));
>
> +       /* nr_progs includes subprogs and progs that are not loaded */
> +       nr_progs =3D min(nr_progs, MAX_USED_PROGS);
>         /* amount of stack actually used, only used to calculate iteratio=
ns, not stack offset */
>         nr_progs_sz =3D offsetof(struct loader_stack, prog_fd[nr_progs]);
>         /* jump over cleanup code */
> @@ -1139,6 +1136,11 @@ void bpf_gen__prog_load(struct bpf_gen *gen,
>                 gen->attach_kind =3D 0;
>         }
>         emit_check_err(gen);
> +       if (gen->nr_progs =3D=3D MAX_USED_PROGS) {
> +               pr_warn("Total programs exceeds %d\n", MAX_USED_PROGS);
> +               gen->error =3D -E2BIG;
> +               return;
> +       }
>         /* remember prog_fd in the stack, if successful */
>         emit(gen, BPF_STX_MEM(BPF_W, BPF_REG_10, BPF_REG_7,
>                               stack_off(prog_fd[gen->nr_progs])));
> --
> 2.43.0
>
