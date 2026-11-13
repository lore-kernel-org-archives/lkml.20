Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794550972;
	b=Cuhw0CaMdt6DF0HF1XeW/qbhsXBLjAzajSaLS2o619OJ4M/1g6Q1SgQUHTnXAmNRh0ed
	 wFTpUp7Pvh7hGfBK3gIrydy0jz8gxflJHWxeYulSGtJ8hbrMKb8oBpMcWhHQKfxr+YYiC
	 vUMZbJ6qGZpb0oJ6rEek1+HER6C7Eib9F5P/LzZr0fhiOrMUoJZwl6cWOrWY0RQf8KH8g
	 jMLtex3QmDEfH3SdbQJMxVeZ7LjLTOB2wWPQ5UyTPeacPvF3Etkvk557Xte1hmaHtnaSe
	 /SoYcZMbN1J50fs+BD6TZMlR2cil7kaOx8qEYqddNPv4LrgAJ8SNw7np2rvkEyBSccw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794550972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kaz5hFFXdMAGt/u8uH63i3Sm8RKg80iivRox1D7f/QA=;
	b=iKT2yGQghEYVYDvK1lOFlWZ2h+B/2H6B7efCPNTIlT5AxEA/U1FhcKHUkPng5sapbqD7
	 nHpV7BDwrzcamo4OssZmvmw699DZUOrad//QZfs6VjTlrQ1vjauAB+YgGxoxREAN/F+H+
	 G9ktZr/gscccYjLdFC39yVjnqkjFMrgf6UWzRqKHRSN1Io4P+QORSYglMB18NqC49o0ku
	 FqhnN4cUwVM4kKbxyvfhwJbBvweZZeeAazMNBdVp0Yu9Xx/MvOcSVqg3uqBQDhVYywx8y
	 2GeD9oKjBzZwEi9+icmkPlthoXGamj1dfFg9GBfp64WrFWkgoMpcf5HExFfn8Yb6cww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=BZ7XEh1O;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9FA606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C9FA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=BZ7XEh1O
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ae2fb3fe2fso2738601fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:22:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794550969; cv=none;
        d=google.com; s=arc-20260327;
        b=ZlkhwUFE/2WxdRynoYnf2fL4A1LoTlEemkksZX1ZC1pCr0mHj+0Ygrbn7bw6c37Jml
         fGAxchsU/56VwHHMyfsDNjlih9qzDtzIzLh87Fhde4t0N2MlVA6S9afmmNztl76c+pIO
         nafdaAaDlz3wbuUoF9uDFEP8hW4aZvp563iMphTFSfGKTE4NG/sySySjb1px3nzXaW3w
         vWGF2wGz6P281NfYdZ12jd0LwD5q2dgRC7OVLPdxqfvDiFBSRF73VTjQ4jq/Zjxug+Zx
         /h6btSLlGB6d3k04XyTu/Iayb+v6T6KbV0IHCzRvx1sTtCaRrr0YV6RDq0CqdGGfZpS6
         B9xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kaz5hFFXdMAGt/u8uH63i3Sm8RKg80iivRox1D7f/QA=;
        fh=6nkyGXyejZNXvRA85b71RLdmyZzTxbium/zrB3MpIDc=;
        b=BlckHGOoP/W9yupgwxRjPG9N9WIPWNjjh1csIiDV2hMDHAlZpN+z8oTzuFlcVwtC/p
         GBEYqSXtXn4Lq2p2UmdM5X5ICarGjKc8/30E3z1EzcXToPUgEZlESpgV8ZunDXkrm/Ey
         2UwqWSR5cHp/eixSjLvaBjipq9VGI0ThhJ+zRTbrmdza5/SFTk6PX0iME3tUisrIHFwX
         HocD5P2OV+E5So6TJg1D3TMDh1m7wW7UnXm++zcaqFET46LdYqKrR+OFiRvgiFyGlY6P
         hm41hRZpAA8u90JcdeOmTDm/uRTzRs7mczOAg6d36V8mtVMxZel3S2eSSHAlbaHxfrEy
         UBPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794550969; x=1795155769; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kaz5hFFXdMAGt/u8uH63i3Sm8RKg80iivRox1D7f/QA=;
        b=BZ7XEh1OUBU7AaigZZVIo7uWM6BGc7GFHVDN4uZTK8vSsBEo8lK90GCKY0GZTyfG71
         OzckKGZj5wCmtUZ8AAiLG+RkEgGbQk0MJg97uAjvABrNj8wLZBy2OhxvAXGJBGF7VkVY
         p7v5LVqRZIy0jILUFM7mituBmVZWCTbShH6m5ofC/gWKFtFpBNTAPnZiwZIh6/Ka4qxQ
         BEK19g/F4IOwjLrhFNrbeJhJqRUTUNx09f+37KXIGDlYUc+au7YObthQcCOdU3EvjcuW
         1arUwwt1SphY0qCfiBGtUmegDu0GbzNr7IprfbigT/yROyajzZEEkPTcWE7oQfcleKz8
         X2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794550969; x=1795155769;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kaz5hFFXdMAGt/u8uH63i3Sm8RKg80iivRox1D7f/QA=;
        b=IhHaHtRUFZNAjA5E71IaNNmDxcDlJpkTZCdRZNU9yEH4OIlWUu0YziK/0sGhFZJWOi
         fA7Udo5IteRSFGgIMqIkN5LuS0bocnmOIae05oTnbAA8bS6m2FmdUg8d1L6+pO2IqYqL
         xGist2kvLqNsJxilNV5JNUdq72CivJBJK8MjX6F8WvKw2bZ7nqr/z2F3ribRaWEqmYOn
         zXGFSgq/c2P9IzChxwwaOXzVy07PgUnTmz7b8FLzef8GWYAonpFV/ys1UB8xJZUYKLT+
         8EJ+B4NqjI1XR70AvP7v3DW3hz6v2l9g3Aq59s6tfcLKNXh/OOvqDusJl1zdVOyYrWe2
         JNmA==
X-Forwarded-Encrypted: i=1; AL+hErGwC/Z7ZFpoJVDFF+wD2QJr0BFOH6BT1jqjsM4sb0KTI9uuUskRYp24mv3GRAMOeh768l9OCSm2PNZlDrs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kbP+jb2Kl3OSIafxNvWjUz9tvL/tWn4LEknxIsIh5BXqDQ+7S
	xjI0VG7+zIvmlpfCfxawtNOSPVRdk8ioNjtoAeNe6AtCp30inxVU1NhAj2GMiVsVs8y98qkZv22
	jBRfM+Sj+0bm+TTiYDA6fmKI8LtPbSqVGUV7w56m3yA==
X-Gm-Gg: AYBFou2Dt1+xgFj+17KX9l7jzqtNyvctTq1eIt8uh7qPCuNs5Jss1LAebF+enki7jvK
	KyTjD6wDRvovn2As+/Vl/D7mVaqLiteBnP8DubzfbitiJFTbzTqMNBtOqHFCBSvNgJx8k+aEHxC
	7CtarXQQh0bYV9t+BHNVD6BebEAT7/67EvfHXReueu07e/ORhMogmah15a5FdRnnSBxcHQy+g5m
	O3wkfRBvwOx5ePsGcyg1Oaf5JyVLSsiCYkX7dXYzAYmH1VXIcljnCZ4YXSEPJXXzdSDDU7iLhH9
	1tT7Il6ueKyoCrPWTNjYooZW/JgeaYGgLJUS9yOXhOE57Ji7U51g9OWoXDZgv/meLmtC9Bw9tTM
	RIEjZ8uEc5EME28OyN6qhqSD1O/dLxGXcOhONs6sFIVP3/zEgtrwgx7WIwEkMfrpsJYPgCFzl9S
	JA70RZCE8xbrLHqy7PHeaLdscTZLmqy7zI4UsJOk1jYW8la2R8aqkeI6pTecltG9gdDmXb430BZ
	1ySEw==
X-Received: by 2002:a05:651c:984:b0:3ae:25db:778e with SMTP id
 38308e7fff4ca-3ae2b4f8c44mr5983811fa.25.1794550969373; Thu, 12 Nov 2026
 22:22:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <OSQPR01MB6326DDE9C2F390EA3F0F444EC2662@OSQPR01MB6326.apcprd01.prod.exchangelabs.com>
In-Reply-To: <OSQPR01MB6326DDE9C2F390EA3F0F444EC2662@OSQPR01MB6326.apcprd01.prod.exchangelabs.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 13 Nov 2026 11:52:37 +0530
X-Gm-Features: AclHuK8kJEX4JlRXb2KsetLnyCm5PUC-HVvhCYSR9hJmTyId-OXBRfW2YskwCEk
Message-ID: <CAAhSdy1vRrD17+a2-QLAqDiJd=S=H08n66x9hW+-NFQEKdU01g@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix builds without CONFIG_RISCV_ISA_V
To: slack up <yxcnew@outlook.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andy Chiu <tchiu@tenstorrent.com>, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 11:02=E2=80=AFPM slack up <yxcnew@outlook.com> wrot=
e:
>
> From: Xiaochun Yu <yxcnew@outlook.com>
>
> Commit b5060a4aa33d ("RISC-V: KVM: fix vcpu vector context
> handling for kernel-mode vector") made the KVM vCPU load and put paths
> call get_cpu_vector_context() and put_cpu_vector_context()
> unconditionally.  It also added an unconditional call to
> __kvm_riscv_vector_restore() on the guest entry path.
>
> The no-op definitions of the first two helpers live in <asm/vector.h>,
> but <asm/kvm_vcpu_vector.h> includes that header only when
> CONFIG_RISCV_ISA_V is enabled.  The KVM header also does not provide a
> no-op __kvm_riscv_vector_restore() in its disabled branch.  As a result,
> a KVM build without CONFIG_RISCV_ISA_V fails with missing helper
> declarations.
>
> Include <asm/vector.h> unconditionally to reuse its existing no-op
> helpers, and provide the missing KVM restore stub when Vector support is
> disabled.  This does not change the Vector-enabled path.
>
> Fixes: b5060a4aa33d ("RISC-V: KVM: fix vcpu vector context handling for k=
ernel-mode vector")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xiaochun Yu <yxcnew@outlook.com>

A similar fix from Zhanpeng Zhang is already merged.
https://lore.kernel.org/r/20260922021823.44251-2-zhangzhanpeng.jasper@byted=
ance.com

Regards,
Anup

> ---
> This single patch fixes a build regression when KVM is enabled without th=
e
> RISC-V Vector extension.
>
> Tested on base a804c5742bff (Torvalds master):
>
> - CONFIG_RISCV_ISA_V=3Dn, CONFIG_KVM=3Dm: full Image modules build passed=
.
> - CONFIG_RISCV_ISA_V=3Dy, CONFIG_KVM=3Dm: vcpu.o and vcpu_vector.o rebuil=
t.
> ---
>  arch/riscv/include/asm/kvm_vcpu_vector.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/kvm_vcpu_vector.h b/arch/riscv/includ=
e/asm/kvm_vcpu_vector.h
> index 6371d5ea5392..ebc619ed67dd 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_vector.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_vector.h
> @@ -11,9 +11,9 @@
>  #define __KVM_VCPU_RISCV_VECTOR_H
>
>  #include <linux/types.h>
> +#include <asm/vector.h>
>
>  #ifdef CONFIG_RISCV_ISA_V
> -#include <asm/vector.h>
>  #include <asm/kvm_host.h>
>
>  static __always_inline void __kvm_riscv_vector_save(struct kvm_cpu_conte=
xt *context)
> @@ -55,6 +55,10 @@ static inline void kvm_riscv_v_exit(void)
>
>  struct kvm_cpu_context;
>
> +static inline void __kvm_riscv_vector_restore(struct kvm_cpu_context *co=
ntext)
> +{
> +}
> +
>  static inline void kvm_riscv_vcpu_vector_reset(struct kvm_vcpu *vcpu)
>  {
>  }
>
> ---
> base-commit: a804c5742bff224d4cb4d25dd383554d598be32b
> change-id: 20261021-ospp-c1-b4-submit-e22dc09faf5a
>
> Best regards,
> --
> slack up <yxcnew@outlook.com>
>
