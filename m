Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A444B41A549
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 22:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791412250; cv=pass; b=FnOJ8SvjKyXn876ndhpVKrXsR6V19GccEkQ+RQ+1Dh4/dh+muwpGcCI50ia0JqOtBbucxmLbaRb0Gw5VkQ2Ng+vc9EhewoB1CffRQV45ESgqF+XAeqWHy3o9piuC75SkXaPh/m5eUwImDpRJ+LheR1qNvppJKuw8kXFli/ewdUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791412250; c=relaxed/simple;
	bh=Lzrn3mTs/XtnEQyVE60M0pIis479rPYQCw9kscVpK0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T0Y9xyrO+C4GdfvayIrwYNDXKFCHKqvmApndFpqLychykERNVBOifbJwLcOain5xnoJanVFsRB2LT4suD9rYszZU3k+HsvihfsJSRTlLsr5jvcyv10LdUpW8T6C8+9cZPnddmniV52iFzKfSBQbp+Sb1tJ9lk9GwdxSnTg3Cj1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XLf+9oiw; arc=pass smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLf+9oiw"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4f59e61f295so1588152b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 15:30:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791412247; cv=none;
        d=google.com; s=arc-20260327;
        b=CLDxRa7JbqUGtZDxqC4f+46qt9qvgto4HtcrX/F2XcDZlSz6XjzBewdln50wiRj165
         CL7/5NJv7brS9eRR9fVCSYAZ2NNFlCd7F6UX+ZwJPeFUaGGVL7HS5wojVoGXovdz3573
         Ye6OjkWeqLMvtRQcGulUssj7ZharxvTQL1Aed15zlDqN2hFj06dZKXXgToRIK4wNKFhl
         FzgVk9gOFJYLOvHUP97K5+jLEnZjLtabeoYF1vZ1HcfbYNO5ujN2WlCJJac8H8yH48Mp
         iCH0rx2CCX3rGjQCZnS36Pnrlos4vvhes9t3JwfbrQvtdLMzCDmA81V+4KRTR0coywN5
         7D0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3clTQCTCnnpY8hOc1jAjkF4nhO8A4cLiGYdk2Z3wF6s=;
        fh=MrGc5uHnxr2qqJUdiB4HITOQPYrc09jElmeD6w34crw=;
        b=N6lPh6BnqDLaLAdckBr/Iiuc245ICp3+yB1RbkYxNs4rCkTY6X6YrMOYv007TzP4gw
         /DJpvqlnzOB1mP4EK2UhIrUg8fsmxbDSLLnyGBCGJVyC2sVHac165L4jls7cjic1Ml1v
         lEVG8H/sOA7wMNttHw8uq4I3al9PSUnerCqYdcdniYGThBYBwNWEcssDSZ/DcDjX4Y98
         svL0UxkWjBOUB5NQXaZysx+C2tlQA+a6+or5teBUAc0yqNMkkyOU1zm01oR12C8R4/yQ
         T9sc7fDOhmZL61rXPnQJp75HKj+j7TkNthduyMOvmKXDV0XjHVcxhAZBtTmv17ka/2pK
         cONw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791412247; x=1792017047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3clTQCTCnnpY8hOc1jAjkF4nhO8A4cLiGYdk2Z3wF6s=;
        b=XLf+9oiwblmiuAOVnOBfF0+S+cYq2AJsaW58B+uuT8R9/oaIaD+5ntKnKpWuBndhrQ
         FdgYZYbEf4mkvFT8hyXIUfAIMtv7aLHcLTwtzG1+1W2xj08Hu+DnroZQJBHzABCZPrnu
         Nw0sHdMgUaX0xvJkjLXMaq0cDHr8Q+XBSUgQBA9I2embkKJqsCi33gLvc5vF2r8by8ps
         4jJouGL6vv0t7/NM64NAS9+trnmvFz7i6hPKKuZf+uhDMUZreN8xanrlRaEDEZzdYQUy
         qT+5lBxXLMqRk+sy3PegRBUmEf3JpRFOEw4xKRydFu0QKJXpfFrqIkeJAl9Em5765cBd
         UtRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791412247; x=1792017047;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3clTQCTCnnpY8hOc1jAjkF4nhO8A4cLiGYdk2Z3wF6s=;
        b=CVQg99QcglQyPmD50z4j0oIZWtH5zLsR4otAEBW1sOMQjUOYp7mqsUbr2gQmNkyuEM
         lmz/LCrRFDDzAL21gPWD2VA0ToVPK4n4/GcNLCESkbH4iF2rE7Yjcb5TVJlv5+TEw10K
         P+fIzK9SkYD+tHxvJxm47yg3TbFWOJRbLGipFGYdKPDDy+PfOKDzk/m3X+XAYueikUVN
         InsVdpHkdkynb2dEYUBA7/FrzyxyI7e36K/d/+FUJ+t54KdKylFRKF12f3MF8CRaMXLl
         pc1WG5+HCgQhMGnmk6+I5oWoIRXWS3QDZKaT9C9v9Iy0ITn1rDWLfarIrdR0W8RwhcyT
         Ne0w==
X-Forwarded-Encrypted: i=1; AKwUvBx35Ykcsx8eHetBfRL99Igf3IQfZl6VXoq6bL6Z7bcPNrhuchrglwTKT7ToM0F1FcsPGX2lQW/Q0x24gVg=@vger.kernel.org
X-Gm-Message-State: AFuF++lHJo3VbOLCXiDk8jygAGsihkOHgYmaeiGlb9etCWfVDGPOvCqi
	iqWZuGFTNDeCQh22oGbHmLdGkR8Zy5BxrYfrennH3lhgztL6hZnzekEH6LJqC6WkYfp3kqgnVBy
	ELQ/fHgmJqiRJE05WqbExo5jIk4XzP/I=
X-Gm-Gg: AYBFou1Mp/GuQcGrNDjsKIHMRBxYH2K27pJcHS8VyuVYDsNtyN6Rn5ytbCISMpIbPyq
	lNymoey8AfCIQxk3YiNdeNrhYoacvDgHDYZQO038JDEvisP7uYY29eyea81CPfdwveyKSeoYwnM
	TTm42fq/NHs4V2whLtfh4yu88FdnmMpKhDc1jz2nUWGrN5khAIZ9zgVH6D+LotJU7yOT7iJeE0d
	+hYB+Lf2ikxS1qlbesbNrnRa5xFerHmyAzqzAhQs/wT0qZkcN+sJ7u65G/EgjcpAmw5SFpIQwVD
	XpYPW9nZsn3YYLR8HXnzbqiM14x9l8cJs+he+nEE0PIQDGJE9JqZzXw=
X-Received: by 2002:a05:6808:1388:b0:4f5:59e4:a8b with SMTP id
 5614622812f47-4fc47abd3b1mr3579325b6e.58.1791412247204; Wed, 07 Oct 2026
 15:30:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007-a3-arg-trusted-v4-v4-0-253ef3a1a69a@mails.tsinghua.edu.cn>
 <20261007-a3-arg-trusted-v4-v4-1-253ef3a1a69a@mails.tsinghua.edu.cn>
In-Reply-To: <20261007-a3-arg-trusted-v4-v4-1-253ef3a1a69a@mails.tsinghua.edu.cn>
From: Amery Hung <ameryhung@gmail.com>
Date: Wed, 7 Oct 2026 15:30:34 -0700
X-Gm-Features: AclHuK-f8-ePnMdo-O27CR238KSTeSYc0f2p8oscdyi9_ZwyWmVUlf-VlzP_ZyY
Message-ID: <CAMB2axPOBx+AuQ4X=rG9cikfcVaNb1Bd2o1dHKP3RNDn2=ftmg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 1/2] bpf: Enforce trusted BTF ID argument provenance
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
> A global subprogram parameter tagged __arg_trusted is verified with
> PTR_TRUSTED, but the common call-site type check accepts bare PTR_TO_BTF_=
ID
> and MEM_RCU registers. The callee can consequently pass a pointer with
> weaker provenance to a kfunc that does not accept RCU-protected pointers.
>
> RCU protection only guarantees that the object remains allocated through =
a
> grace period. It does not guarantee that an object's refcount is nonzero,
> so an RCU-protected pointer cannot satisfy the trusted-pointer contract.
> For example, an RCU-protected bpf_cpumask loaded from a map may have a
> zero refcount. Passing it through __arg_trusted lets the callee pass it
> to bpf_cpumask_acquire(), whose plain refcount_inc() can retain an object
> that will be freed after the grace period.
>
> Make the existing provenance check contract-driven. Mark generated BTF ID
> kfunc argument types with PTR_TRUSTED, and add MEM_RCU only for KF_RCU
> kfuncs. Normalize PTR_MAYBE_NULL when the argument contract permits it.
> Then use the argument flags to require trusted or referenced provenance
> and allow MEM_RCU only when the contract says so.
>
> Split is_trusted_reg() so the normalized type is used for type and modifi=
er
> checks while reference lookup still uses the original register. Conversio=
n
> of scalar-struct BTF ID arguments to fixed-size memory continues to
> construct a new ARG_PTR_TO_MEM type without PTR_TRUSTED.
>
> Fixes: e2b3c4ff5d18 ("bpf: add __arg_trusted global func arg tag")
> Suggested-by: Amery Hung <ameryhung@gmail.com>
> Signed-off-by: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>
> ---
>  kernel/bpf/verifier.c | 27 ++++++++++++++++++++-------
>  1 file changed, 20 insertions(+), 7 deletions(-)
>
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index 353bde9ae2274..a0ab793f041d8 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -5327,15 +5327,17 @@ static u32 *reg2btf_ids[__BPF_REG_TYPE_MAX] =3D {
>         [CONST_PTR_TO_MAP] =3D btf_bpf_map_id,
>  };
>
> -static bool is_trusted_reg(struct bpf_verifier_env *env, const struct bp=
f_reg_state *reg)
> +static bool is_trusted_reg_type(struct bpf_verifier_env *env,
> +                               const struct bpf_reg_state *reg,
> +                               enum bpf_reg_type type)

You might want to teach your agent that the line limit is 100 columns.
There are several unnecessary line wrapping.

The fix looks good to me. Sashiko=E2=80=99s finding is real but pre-existin=
g,
so it does not need to block this patch. If you respin, consider
fixing it in a separate patch with a PTR_UNTRUSTED | MEM_RCU KF_RCU
regression test.

Reviewed-by: Amery Hung <ameryhung@gmail.com>
