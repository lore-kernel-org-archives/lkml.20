Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793384881;
	b=xLUImMUcOqakFfAKJ/g6hKcj76+CbFXvGNG0sh6uCUv7IU/Q1+M7HDlw3r8MD5qR/21w
	 G6dGGEaTUjFFP2NxUl5rZ/uBmSsgLSg/LV95z44hLJwa+szaOudLVc4U6KfQkrFZ1Hsa1
	 SgVvs4B4w+GVO8EHsEXQpukP7z1WYXJDR8MscK2ZMvwlpKadYXA3nptojntNE/XPoggGw
	 YKGuU1PKSZsh1DhkGBeDUPUfIMhwWHVwhgM2jrDLypmObLjMPdKC/ixlFmx8LJzZuBO6K
	 hl4fEf1/OkHy+xHllk+yLfr/Tdo9NlN1RBDrTDs/Q5bPsCoTpS38grzOr00BGM0ZKeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793384881;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=yXZ3QNZbPs7glkJ4yH5pl4fnldsOoVguypIOmbZ2coQ=;
	b=oxbmu4Qq1cpGH3zdBIhHKSikZv7dqryKGMApKqdcaAeKfh2UhIQAS/OBmHK8sQc+EQuG
	 P5G3V+4JemoV3cGOwFA/wy/qS3k2cg5uklWtXOO/uAyqFZYyNi8d0SgCC1dYoFWkwC00W
	 nN4Nh0GuRRZsfTa75xZVhlH9fCpIN8cgwZrbfVYLOdEmRX9/lN3O2JVNXyoZ4h+dbDst8
	 BvgZnnAmOokff2wn5WYvgGv9L0hrVpvMQbQUerMTDDwHxozz9VM3keuChA2AOnhmzYlNP
	 wKOPD89rWczEARx9Bj2qD2Qr9rWxu5R2fzJfjZzfBlCLe98RbWXXf3MJmue7CODZ7aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b7H+9f06;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF1B606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DF1B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b7H+9f06
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso723876a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793384879; x=1793989679; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yXZ3QNZbPs7glkJ4yH5pl4fnldsOoVguypIOmbZ2coQ=;
        b=b7H+9f06pwRUzYSGWS60atfV/e2WB+6N0etMptiWqMNLfpMVRFYE6xz7+tLnOlMJ8m
         l4SIv9aREVkp9842Fr1v5LoazVZcq8MgefUZbqskNwwGqnYVQwPLb5cgXDdLqh3lVJmz
         yeD/vwqZl9NDQ8dVdkwY4Jc4AE/13giiNIZKdQQSdtDMzMEE1MTZy2RPGU7BUM41kGQq
         zA9eR5lCiYp99ytaJePKv/0xmGTXy8yWZKLg3CFozTDmRiy5HXQb3+AnPLpPebPS72A/
         NkIMJMgAvgZJamlhMaxVr8jlLQpMD1vYxfwJLnxVRMgrfas8J05N4GhpDhWvaVtrFslC
         yR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793384879; x=1793989679;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yXZ3QNZbPs7glkJ4yH5pl4fnldsOoVguypIOmbZ2coQ=;
        b=DzigSYfTzN0SxZGTBxWcYp64xMDb06cl++qVBUpX9nhi0b9ZSGMp2NSpWPHHmVDjgx
         8ue/kd3W07pYASblTe6pDmWZVfRHFCNGS6gTXEBLeyl0MzuzC/SsUgEfg+JQmYWRgpdw
         d0mYPb9cgN99kb85fbzWylXizcF2Y4E7Csg0+Pm0Rcop8qUUhyJRP7yw5wX5753iEFm0
         lGpw8ADCqeQx5ArsXLTK+aaMPcCAclektFcW7zPaqcFkkurkcWedb3SofGOfHexNss6q
         3+rUBC5oE13FDwFi4gG6HtUOCzEVg9DCs8z8tbrZ5R3I8WNt5Nf7rq7eASPkYkBi7l4H
         xUmg==
X-Forwarded-Encrypted: i=1; AKwUvBzbC4gJm1pml39AI87jEUZaRkow5Uhx8/h18D925eS5i5BVUl8Cb9hlZc/DuV2X24QJoOSUGeyWsPQ5/M8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrZ1UvNoolDXsbFyGaQHVkQga/TevORtGY2yzod2ndFrt44zcP
	BiJpib5+qiwgamlMwRI2DSJ71iSKJozDgM4YgSB1209YyTWrKF05ocN1
X-Gm-Gg: AYBFou1hMEWkNij7GdZAESGl8TBFvgCR7cSHL+VWkRtDOFb5TMTqeEqOrn2TO2BJusU
	DQG6s10yH7feGtJP65HWOB55h67mUti1DMmBQRKZLs+LqC9sCTXHatMi2ZJubf4uX1kS5zK4pnr
	wHvfdDj1q4Q4MWhfcvYxcHGOUbw/hSKMgYFHcqPBSO3VRKQBjG68DdHXAEQQm9RN3HOnFPCv1oW
	Q7zLy60BHwnZ03C9E7i4US+22FiUUKaohwahyucBrRaxFB328Sqt2g6mwPaNht9BYslaYcVio8N
	lqBp/ecaZ2FRMmOzajtirDz6EZ7AgQjxJneqdgwyzB4CL9H4a+7BAawn7oX5Ru1qCshN2ki+WZD
	yuajKtM9NVPY4Pmy2lol9kyNU7eDqdp7RhUsd1WfpHEKfQC2ZVDVIKc0mG3f1R6wyWAXLkIB7Lc
	vvqWfahQpj4ZRLuj9T9kdFkklXw2UgLtd67/41J3FrWtYVRCuzt/9kxsha9FpeADqvckELMK8qE
	ABPH/MY0V3rnnxs/X2xSPyJu+5+MLwOqXsJSzSl6K/Cwz4oQd5LpnTxYq/57DtlG/6LedMBUFnk
	vOR8lQ4aOzhqCaOD3bOeI2S44nIJOBQL5pIg+t03I3DZa2e7y13ITZis7d5VuByqAoP1hGfPQqa
	5xYwmp/FzUAw=
X-Received: by 2002:a17:90b:5485:b0:3ab:be66:ddb6 with SMTP id 98e67ed59e1d1-3ae897763fdmr2169146a91.20.1793384879377;
        Fri, 30 Oct 2026 11:27:59 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:5d10:1794:f0d8:db5b? ([2620:10d:c090:500::4:1201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845984absm5186356a91.10.2026.10.30.11.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 11:27:59 -0700 (PDT)
Message-ID: <34b76ef03fb2b7385de32647f21441c6ff267c6a.camel@gmail.com>
Subject: Re: [PATCH bpf-next v3 09/12] bpf: Track low-32 scalar equality
 across narrowing stack fills
From: Eduard Zingerman <eddyz87@gmail.com>
To: Vineet Gupta <vineet.gupta@linux.dev>, ast@kernel.org,
 daniel@iogearbox.net, 	andrii@kernel.org, memxor@gmail.com
Cc: martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	john.fastabend@gmail.com, shuah@kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Fri, 30 Oct 2026 11:27:56 -0700
In-Reply-To: <20261020161907.2115379-10-vineet.gupta@linux.dev>
References: <20261020161907.2115379-1-vineet.gupta@linux.dev>
	 <20261020161907.2115379-10-vineet.gupta@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-10-20 at 09:19 -0700, Vineet Gupta wrote:
> A 32-bit fill from a wider spilled scalar has the same shape as a 32-bit
> mov from a wider source, and the relation was dropped rather than
> recorded:
>=20
>   r6 =3D ...                  /* full 64-bit unknown */
>   *(u64 *)(r10 - 8) =3D r6;   /* slot linked to r6 */
>   r2 =3D *(u32 *)(r10 - 8);   /* narrowing fill */
>   if w6 !=3D 0 goto ...       /* not taken: r6's low 32 bits are 0 */
>   if r2 =3D=3D 0 goto ...       /* not deduced today */
>=20
> Record a low-32 link as the mov arm does. Stack slots are already
> first-class members of an ->id set, so sync_linked_regs() and the
> reconstruction helpers apply unchanged. A fill narrower than 32 bits has
> no expressible relation and still drops it.
>=20
> Which extension rebuilds the high half depends on the load, so
> check_stack_read() takes is_ldsx and sets BPF_REG_LINK_SEXT where that
> is known. check_mem_access() then keeps a sign-extending link across a
> 4-byte sign-extending load only: BPF_REG_LINK_SEXT means (s32)(base +
> delta) specifically, so an 8- or 16-bit ldsx is a relation the kind
> cannot express, the same way the ALU arm's subreg_link is gated on
> (insn->off >> 3) =3D=3D 4.
>=20
> Costs. A bisect lands one clang regression here -- big_alloc2 2956 -> 309=
5
> insns, 157 -> 165 states -- but it is not this patch alone: it takes both
> this and the preceding reverse-direction patch, and neither moves
> big_alloc2 by itself. The external corpus does move for this patch alone,
> no verdict changes, six programs verifying in more instructions:
>=20
>   +1812    2470 ->  4282  test_file_open    bpfjailer-lib-tests open
>   +1765   59556 -> 61321  twfw_connect4     tupperware-agent twfw_sock
>   +1765   59556 -> 61321  twfw_sendmsg4     same object
>    +752    5874 ->  6626  layered_enqueue   scx_layered 1.0.11.1
>    +252    2512 ->  2764  bpfj_exec_execve  exec_enforce
>    +252    2512 ->  2764  bpfj_exec_execveat  same object
>=20
> +6598 over 25.2M, or +0.026%, and +218 states. The shape is the familiar
> one: a more precise recorded state has a smaller equivalence class and
> prunes against fewer predecessors.
>=20
> Signed-off-by: Vineet Gupta <vineet.gupta@linux.dev>
> ---

Please de-claude the comments.

...

> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c

...

> @@ -4258,22 +4259,52 @@ static int check_stack_read_fixed_off(struct bpf_=
verifier_env *env,
> =20
>  			if (size <=3D spill_size &&
>  			    bpf_stack_narrow_access_ok(off, size, spill_size)) {
> +				bool narrowing =3D get_reg_width(reg) > size * BITS_PER_BYTE;
> +				/*
> +				 * A narrowing fill keeps only the slot's low 32 bits,
> +				 * so record a low-32 link rather than dropping the
> +				 * relation, as a 32-bit mov from a wide source does.
> +				 * Which link kind depends on how the load fills the high
> +				 * half, hence is_ldsx.
> +				 */
> +				bool subreg_link =3D narrowing && size =3D=3D 4;
> +
>  				if (dst_regno < 0)
>  					return 0;
> =20
> -				if (env->bpf_capable && size =3D=3D 4 && spill_size =3D=3D 4 &&
> -				    get_reg_width(reg) <=3D 32)
> +				if (env->bpf_capable && size =3D=3D 4 &&
> +				    (subreg_link || (spill_size =3D=3D 4 && !narrowing)))

This check can be simplified to 'env->bpf_capable && size =3D=3D 4'.

>  					/* Ensure stack slot has an ID to build a relation
>  					 * with the destination register on fill.
>  					 */
>  					assign_scalar_id_before_mov(env, reg);

...

> @@ -7392,13 +7423,20 @@ static int check_mem_access(struct bpf_verifier_e=
nv *env, int insn_idx, struct b
>  			 * Sign-extension can change the register value relative
>  			 * to a scalar it is linked with by id (e.g. a zero-
>  			 * extending fill of the same spilled stack slot), thus
> -			 * drop the shared id in that case.
> +			 * drop the shared id in that case. Only a 4-byte
> +			 * BPF_REG_LINK_SEXT link survives: it says the high
> +			 * half is this very sign-extension. BPF_REG_LINK_ZEXT
> +			 * says the opposite and would be a lie about the value
> +			 * just produced, and an 8- or 16-bit sign extension is
> +			 * a relation BPF_REG_LINK_SEXT cannot express at all --
> +			 * it means (s32)(base + delta) specifically.
>  			 */
>  			bool no_sext =3D reg_umax(&regs[value_regno]) <
>  					(1ULL << (size * BITS_PER_BYTE - 1));
> =20
>  			coerce_reg_to_size_sx(&regs[value_regno], size);
> -			if (!no_sext)
> +			if (!no_sext &&
> +			    !(size =3D=3D 4 && regs[value_regno].link_kind =3D=3D BPF_REG_LIN=
K_SEXT))

Please make this:

  bool sext =3D reg_umax(&regs[value_regno]) >=3D (1ULL << (size * BITS_PER=
_BYTE - 1));
  bool sext32_link =3D ...;

  if (sext && !sext32_link)
    bpf_clear_scalar_id(&regs[value_regno]);

=3D> no giant comment necessary.

>  				bpf_clear_scalar_id(&regs[value_regno]);
>  		}
>  	}
