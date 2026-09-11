Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FC542668E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789109808; cv=none; b=nOJC7wSuhKQIx0V0cGNMsDM3sOTmpa5Toia0RADnp6EFcBor9wS2DBkxi/jQ2nB/qe7EaKrs3u34YaD9bTVaILYoxrYkojAq2m5uKoJeuajWfp4wyWPElPTqsuUxUoPXP3uajifUcqYpMLk1alpzhbZgxJ9uWLINk0+FH+BEiFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789109808; c=relaxed/simple;
	bh=04gYQ/Q6cKI4Gw/4prD2FkOC3Due0nfCMjSQbtgnJvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cpRbcAQ228/9guTS/fp1rHdzaUOkO/XyyzaUjd0iubjlF2yUFJA3jdiPMgsuUL4Xeq0roIAWPK0BDe1aDoakf6dxugRYTnRG8CtORy9SL7lIYiLHhWPR9yc4h8GdMuC1PwJ8eQdxAR3N3RlY6B1GErZaO4XQkH4iBNCXaOtdbb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cv8nTb4E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cv8nTb4E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 229EA1F008A2
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789109798;
	bh=8vc/xDWnQFzx1CI8QRvR+U52l8TSGE5NUTd3IlCDLPQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Cv8nTb4EWYG0Cl1WjvfZKsufMAVlP0Gedoscwr8lkqfY8YWphAh94m714SYfuAXMA
	 FU6s5uyGiPWuh1AHy4gNO91mJOkrxBTzcL9mzDSHtZ5/GqJjWa7DJhJn7h6ZwfKz4r
	 xqjy+WPmqxjFnypKCpvDPiJxiqr+SEnvzLwwxl6LXGrAFtlvs2I0rs6/rYn/lsVVh0
	 euC7i5kH6jCSrSUfYES4tvHyofZFzfVMiEW1CN7OvDt3ney8cFwZrieBb56LdIuWD/
	 zYllR1ZGr51eFpG6TJU9OMZZs5xdpSZ46NtS6AJtCXjOt1Ore8Z89sYTmYu2ICI6aH
	 10AZmmLDC9gWA==
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356256so136328f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:56:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzZz5SlmVEoeMERKXQbh8nMvX7ZRUveB5G+2gUW5HiVs4B1pol/jVOu7adLo3+dQDJYtUitfJrduZTlFrc=@vger.kernel.org
X-Gm-Message-State: AFuF++k8LaRgUS5SLW9/N+qUnHFI4Wp6W2kgdRDhaO4eUZcJTUjq3ATa
	+h2V/SJpAza46yikQu3c3fIfXZjUt9RzCWs07nt/NTlwcvxXwlywBZcapoiYh1jMN6iCMLPGQNq
	6x4LhnZiTFOqOCBzaN5/g9EYEDa5FBfI=
X-Received: by 2002:a05:6000:2404:b0:486:ec88:95ca with SMTP id
 ffacd0b85a97d-486ec889612mr3706963f8f.12.1789109796605; Thu, 10 Sep 2026
 23:56:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-riscv-vector-asm-fix-v1-1-147f314efb2b@linux.dev>
In-Reply-To: <20260908-riscv-vector-asm-fix-v1-1-147f314efb2b@linux.dev>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 11 Sep 2026 14:56:24 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRn4keG=peEKkncgdsu=RLP3N0Ev6cO7mzXg-J48R+bEg@mail.gmail.com>
X-Gm-Features: AcwNN1W7oAcQyKXUOitVQI1nGzO90U5LsLKofTdxYWn-2h9HJHlgkOexcvKkbvw
Message-ID: <CAJF2gTRn4keG=peEKkncgdsu=RLP3N0Ev6cO7mzXg-J48R+bEg@mail.gmail.com>
Subject: Re: [PATCH] riscv: vector: Fix data pointer constraints in context save/restore
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andy Chiu <andybnac@gmail.com>, 
	Vincent Chen <vincent.chen@sifive.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
	Greentime Hu <greentime.hu@sifive.com>, Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Kevin Zhang <zhangmeng.kevin@linux.spacemit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 9:03=E2=80=AFPM Troy Mitchell <troy.mitchell@linux.d=
ev> wrote:
>
> The standard vector save/restore asm advances datap but declares it as
> input-only. An inlined caller reusing the original pointer may therefore
> use the advanced address instead.
>
> Declare datap as read-write so the compiler can preserve the original
> pointer when needed.
>
> Fixes: 03c3fcd9941a ("riscv: Introduce struct/helpers to save/restore per=
-task Vector state")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
> ---
>  arch/riscv/include/asm/vector.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vec=
tor.h
> index fffe72a772080..c7fd6d50a7a47 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -230,7 +230,7 @@ static inline void __riscv_v_vstate_save(struct __ris=
cv_v_ext_state *save_to,
>                         "add            %1, %1, %0\n\t"
Yes, %1 is modified. Good catch!

Reviewed-by: GUO Ren (XuanTie) <guoren@kernel.org>

PS:
Don't forget "if (has_xtheadvector()) {" part, thx :)

>                         "vse8.v         v24, (%1)\n\t"
>                         ".option pop\n\t"
> -                       : "=3D&r" (vl) : "r" (datap) : "memory");
> +                       : "=3D&r" (vl), "+r" (datap) : : "memory");
>         }
>         riscv_v_disable();
>  }
> @@ -266,7 +266,7 @@ static inline void __riscv_v_vstate_restore(struct __=
riscv_v_ext_state *restore_
>                         "add            %1, %1, %0\n\t"
>                         "vle8.v         v24, (%1)\n\t"
>                         ".option pop\n\t"
> -                       : "=3D&r" (vl) : "r" (datap) : "memory");
> +                       : "=3D&r" (vl), "+r" (datap) : : "memory");
>         }
>         __vstate_csr_restore(restore_from);
>         riscv_v_disable();
>
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260908-riscv-vector-asm-fix-27ed36623934
>
> Best regards,
> --
> Troy Mitchell <troy.mitchell@linux.dev>
>


--=20
Best Regards
 Guo Ren
