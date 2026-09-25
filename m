Received: from mail-wr2-f10.google.com (mail-wr2-f10.google.com [74.125.225.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B696736A35C
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790302998; cv=none; b=QL1ceczr417b5cI2y0fGN4fyekL3scpN8hDQYDzzRrvanhNiip44ar5TRoX8XLlEEDHKCHa6PwWqJLsi2PTaOU21QjOIJE7L8HV1++aj0oy+oV1CP+BptbRF67HN45QTEWpkH8KBCYckbokmdQF/iQFOME5fzH7bm41334WIPbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790302998; c=relaxed/simple;
	bh=vXiV3jy5w3qgVUXsQsxmgz4IfEb5vnFHR8U9u0Wdco4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=B7f5GnGQD7SN0IAJcwe2RrtUetzT+C+uUfMBRVR5rROBp+Ymqswqq765lDNyr7OgxuRoPejAljUZjjwCsAc4tSDT8FU2qOIUO67FPbft29BsFJy5W4RLnmhzqmtcsc9zUaFEKsx94ZbTWwj2D488nU02/sKx4AiXuAyXGj5KJ6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B+2CwgoZ; arc=none smtp.client-ip=74.125.225.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+2CwgoZ"
Received: by mail-wr2-f10.google.com with SMTP id ffacd0b85a97d-484372811e5so86598f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790302992; x=1790907792; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f+WONXoagrhEGdtvUED0BFMEGh9z3VNJUJWpE5LwVkc=;
        b=B+2CwgoZiAgy2IV0sF8aYGhFpeoEOvXzYF0JhucT8dN0vap7OMCkVpdiX+7yHkHH2S
         zqkRxW3gK34CbrJEbNZRlbZFI0be9DK2r4S3YMSQpkFG1DXEJH+hy3/qqVKwdLanP4yL
         +LP46nezdAZ5roOqEUtz1pBWpSMg1R3y2x4rGcJ8vnMIHlRlz+KTC/CkMA9zRvX46cyT
         t4DLcWsevd7gy99ivCkGfVe1BwNGa914r9hk9/N7T1ieye2nIp4cnLIDyhkO+kTtd4vV
         2ZQMwSR6ABJU40eFFPCvKln2J9TvjtWo3PlCA5gbd9pvfswx5fLUyLHsYKnJ5oAmRkFu
         Uwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790302992; x=1790907792;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f+WONXoagrhEGdtvUED0BFMEGh9z3VNJUJWpE5LwVkc=;
        b=H+Kh0HL86aBfg3D9vWVpWfoSgcVnk5qip2RJ23Z8TQTxxxofvgBGNuBS1kGiUjFpzC
         6v4uGCZfJWjapO3dTR12bB1fofp6Acej+c1OOUdNZ/DlR+2znG03YcC9RjmNrsY0LxzD
         VPzjDQkkhJsVCfixHLje8suCJIsSkoREFvuwgmPymtYMfIALiu16365xqhgDIJSZ2vYe
         qvV3K+aBcLFlI3dpZsptiIADukiEX3PGpClNgXQ0g0/wACQmFFFlp/zGkWDDFL8LDiDn
         3OJwtsDpA9ftlMiJP1ySSKtajSZvCAUR+TtQFvPg/SJsbC0quKG0Vtz/Bd83kY29X9+y
         MUrA==
X-Forwarded-Encrypted: i=1; AKwUvBzWme4VPEDX4xnVYKRa3Tj6OIg8FS8jAAc1+iUtCcC7A/6SjRyDUprk9z1ecFKFQPOYWgdfclu6qEEWLOY=@vger.kernel.org
X-Gm-Message-State: AFuF++kkzkXdBQ69HDWtfziU3vyZSS7xVvHlbEZpV4X9OfDwfEgNYBtu
	AIDvH6o2S6YvHPRYKAH8NxvWfL6HlWUTQxroMZu3+ckmzkkMF3UbzLUu
X-Gm-Gg: AYBFou1kvOxi9IhSMK2A0FpvvMCPMhxun9aLTjTEtaP+d7yrN5ftAHvE/KavEUv+oZ/
	7L2Klrx14u7pZGShEoXMswjG5LKkKYe8Q5R6BqCETRjCDpi4krz4DOTfjmhpUycNuyykib4/yZ5
	qiZVP85z5YSEoiJczKZWSYv5VyDxGlcu0PDV19LrpPXYqcRjw6SqMVosM51ooo7TOYKSyGWljE7
	v/cdVvwE6VJDpldexvirucavPbjKyo7Z+21cG8zXzBnmJZggd7eODDAq9WoX0uH8lNfLRq9R9Ww
	4nSq7cQPcZ5/XOfiRj1mjGA8R6xMDY40SMwFFLA5bB+bvyH5/F5O3tWJ5KjzlJCf7Rvvh9ThviQ
	K3k+M0OAF7dLm91Kp9MQyWgLAQYZR9ojA9dfHHgFhEK4ptLCXWmuzWsTiWM13myiiDIE2kt/mp4
	gqcNL4Gu1aT3w+9q6aZfkNurdRZ+3DbzgKIW93twNTmKDpzK+h0DtoVs30WD4zyg3B87gkttT7j
	+zc90n3/qA+gb7Xj+Puz8JDBAMjPE/hHAW3QYrFM52xNH3MmmPWjOWYe9coPswq0psoMsbchbSz
	lNnhPppYv6f2xbJgLeGaP/w5FKtmgI+VBAKFKw==
X-Received: by 2002:a05:6000:992:b0:487:8ef:2fcf with SMTP id ffacd0b85a97d-48871759745mr7494860f8f.38.1790302991951;
        Thu, 24 Sep 2026 19:23:11 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30c43asm3421648f8f.3.2026.09.24.19.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 19:23:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Sep 2026 04:23:10 +0200
Message-Id: <DLO1FZU14J3C.1SLTCMVTS8DD5@gmail.com>
Cc: <ast@kernel.org>, <daniel@iogearbox.net>, <andrii@kernel.org>,
 <eddyz87@gmail.com>, <john.fastabend@gmail.com>, <martin.lau@linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] bpf: Fix uninit read for non-fetch atomics on
 partially spilled slots
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Hao Sun" <sunhao.th@gmail.com>, <bpf@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260924131342.934290-1-sunhao.th@gmail.com>
In-Reply-To: <20260924131342.934290-1-sunhao.th@gmail.com>

On Thu Sep 24, 2026 at 3:13 PM CEST, Hao Sun wrote:
> check_stack_read_fixed_off() skips partial spill checks for non-fetch
> atomics; the following prog can be loaded:
>
> 0: (b7) r1 =3D 1                        ; R1=3D1
> 1: (63) *(u32 *)(r10 -8) =3D r1         ; R1=3D1 R10=3Dfp0 fp-8=3D????1
> 2: (db) lock *(u64 *)(r10 -8) +=3D r1   ; R1=3D1 R10=3Dfp0 fp-8=3Dmmmmmmm=
m
> 3: (79) r0 =3D *(u64 *)(r10 -8)         ; R0=3Dscalar() R10=3Dfp0 fp-8=3D=
mmmmmmmm
> 4: (77) r0 >>=3D 32                     ; R0=3Dscalar(smin=3D0,smax=3Duma=
x=3D0xffffffff,var_off=3D(0x0; 0xffffffff))
> 5: (95) exit
>
> When test run:
> 	retval=3D4294967295
>
> Note fp-8 is ????1 at #1, yet it becomes fp-8=3Dmmmmmmmm after the
> non-fetching atomic add at #2; hence the high 32 bits are leaked.
>
> Fix by applying the partial load check; after the patch, the
> prog is rejected:
>
> Verification failed: Memory Safety: Uninitialized stack read
>
> Reason:
>   This rejected read uses 8 bytes at stack offset -8, but byte 4 in that =
range is uninitialized on
>   this path. Programs loaded with CAP_PERFMON can be allowed to read unin=
itialized stack bytes, but
>   this program is being rejected without that allowance.
>
> At:
>   ...
>       0 | (b7) r1 =3D 1
>       1 | (63) *(u32 *)(r10 -8) =3D r1
>   >>> 2 | (db) lock *(u64 *)(r10 -8) +=3D r1
>       3 | (79) r0 =3D *(u64 *)(r10 -8)
>       4 | (77) r0 >>=3D 32
>
> This affects CAP_BPF only.
>
> Fixes: 354e8f1970f8 ("bpf: Support <8-byte scalar spill and refill")
> Signed-off-by: Hao Sun <sunhao.th@gmail.com>
>
> ---

The same root cause is also reachable through check_stack_range_initialized=
().
It takes the spilled register path for every byte of a slot holding a spill=
ed
scalar, without looking at the byte's own slot_type, so a helper or kfunc m=
emory
argument spanning a narrow spill still reads the uninitialized half without
CAP_PERFMON:

  r1 =3D 1;
  *(u32 *)(r10 - 8) =3D r1;
  r1 =3D map_ringbuf ll;
  r2 =3D r10;
  r2 +=3D -8;
  r3 =3D 8;
  r4 =3D 0;
  call bpf_ringbuf_output;

loads with CAP_BPF alone and copies four uninitialized bytes of kernel stac=
k to
user space. The fix is to only take that path when *stype =3D=3D STACK_SPIL=
L, so the
rest of the slot goes through the usual MISC/ZERO/INVALID checks like any o=
ther
slot. Could you add that to v2 with a matching test (same Fixes: tag), sinc=
e
it's the same bug on the helper path?

Locally I tried something like this and it addressed the problem.

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 200ec0f71617..9166dccef95a 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -7481,7 +7481,12 @@ static int check_stack_range_initialized(
                        goto mark;
                }

-               if (bpf_is_spilled_reg(ss) &&
+               /*
+                * Only the bytes marked STACK_SPILL hold the spilled regis=
ter.
+                * The rest of a narrowly spilled slot keeps its previous t=
ype
+                * and must be initialized on its own.
+                */
+               if (*stype =3D=3D STACK_SPILL &&
                    (ss->spilled_ptr.type =3D=3D SCALAR_VALUE ||
                     env->allow_ptr_leaks)) {
                        if (clobber) {

Please also target bpf-next in next revision.

pw-bot: cr
