Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C6A57F73D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176956; cv=pass; b=kxz16+jydbOwbA9pOn98gPptKkpuGnEmo8x+pmZ/gBZvkouxI8IEvnbkTHjORtTkMY5fFeb6QBUFELbkZJs7LleksCKn5qQUI83dhYemBupCMKphfIrgy0D+Wnh3R0h04Yb0eCWYuw5d4BbNeROgAa99SIqd3uUHfnBiff+Yn4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176956; c=relaxed/simple;
	bh=k52FAz1VeVA/rpXiXnrdLNg/c0mGxAcxoMRWsw09e38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BwZKULBD6eiI+Dpd+NrGxxMRz+Kzf9fyiKhBQ0lEZ3j1Kgun9KenWBDlIYS3+nRQvT170ybmYxhgcMy6OBPexPytJKl/6l37yf/xTYOFEaVm2ynaTQoGCmow6r7C5Z2uSOFzj/0hXfInRF/mYo8Ep5lCJmSYToBfB9aLFzmhk0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com; spf=none smtp.mailfrom=anyfinetworks.com; dkim=pass (2048-bit key) header.d=anyfinetworks-com.20251104.gappssmtp.com header.i=@anyfinetworks-com.20251104.gappssmtp.com header.b=yfU6/ylX; arc=pass smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=anyfinetworks-com.20251104.gappssmtp.com header.i=@anyfinetworks-com.20251104.gappssmtp.com header.b="yfU6/ylX"
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-7856441f7d9so424117137.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:22:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790176954; cv=none;
        d=google.com; s=arc-20260327;
        b=MQiQeiwmdm47eYFUO6P0b+OfVnNJHqNlfY6RL3ziQYymmjlaukB3MZSxmEF1Rov8mz
         QVvpGEYQb4tD2MzBrq+fOiQtsStiJCjsDo+bBEC4QKg8vfTpr0TEkI5H9yEIbRHEriJ3
         YRBQsxwYnQ0s7b9p6y88S+wUXoUEfIraDKvQRkfxu0oemHT2b4J3eROO7t/gVwXiZSDA
         6YZXjVV09ndH7zVG3pgvo9rtPb8QiabJ6ASm4EvRsHvcgZahSa3z0R95uZ70ngOi4Q0Z
         /guTimCM0QhjTn6bsiF2Bsg3C6uOf6YgMZZVmy25rwk+qsJetYn6Zy6YbHvyir6Tvnoo
         61lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iZ8RpPQpWuomiLvwjk3uovF6+uc5LQwN2VY4ctUFEBc=;
        fh=2BRcIset3gzdoqbhQQTd1W2vnCXlS4Oep1RkzrO45qY=;
        b=p529VMf5/vleZHO8rOcnNXkYzT8Wu5MDrnFJ1zXPwJ1Nr4Wbzu5ji/a73OmhjY/eRB
         3aySzjxB7MJ1pnt4p52FfG5oOppoTxxUgcUyy6FituD6OsZ9XojSOrM5DL+LIOAn3r1M
         7VkfgmsC6bOZeMm9ZVMdy36YR9GqvOQoyZbG46JtQjJDOq4wxrn7AqWkLYCwMcQRKOIB
         lOpBrYrk4DPOLe0xiFMcqRJlXV8UNr/LmvVeiJ7dB+12uY1uapKkPNwivcJDfWIxmUrO
         3y0mK4eq+tW+/QTQM2ztOKlTIA4d6GB+jK3VkIIXZU7QNDsQhanZn2gkOh9i+5lSzF5R
         EJ6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anyfinetworks-com.20251104.gappssmtp.com; s=20251104; t=1790176954; x=1790781754; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iZ8RpPQpWuomiLvwjk3uovF6+uc5LQwN2VY4ctUFEBc=;
        b=yfU6/ylXO3OdTM0k+QgkBxEUvb/719Dq7FSFJCATdd9ylvzQK6MF+5QiYAjSf87ez+
         Pu0it2eiPmz9yWhxZ+/XBYeiydwciL+5NkOzKk554o7gTaM8d9m8OLZ5IWtKQD8g0Hl9
         9u+l+S/NcgC/gbvRgg430bI4WZHwTLGtJqi7j3iuhUuECnWRPcgbGxEa6auMhZxvgfsT
         BXOvlmjNQKI3cHfTnU0DOPtTPyWc0mrix5zIjCqNy4NBhepMJmfNvCNasEqGh9uOFmXw
         1x6V4OVHwnMpknOPg3AMg0FMSpEKorVpKinmfl2O+fzWNx3Ai1XbiIgEVFABPJhzXDlT
         PpVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176954; x=1790781754;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iZ8RpPQpWuomiLvwjk3uovF6+uc5LQwN2VY4ctUFEBc=;
        b=JGuP6F/MdqjpvuJLv8ao3ypxQSkXk5Umt6UBlyeoOJ3k1HgQFWnteuZ+M18KvzpP+N
         k/FldoI7eFHNV9QsdmIF9DsCVpvECg3ZLBy5mdycJFA56+6/vx4Z46hC0dQP/GyZWUSJ
         bHdD/I0gEy2LSrz7g5cI6kpfKWIericrP3lyDqHyWI8t4PpVLN/8I+ClaqgkqW51RCLm
         4yP/foNIbRSyqINnJWjRzxWUfXEPocjFeiMsoH0XzBSBt0APzCK7m4miyxzPfa/CKOIv
         v7FhxiGkdTm1pxRkCtMkYnscyrDlDpP8Qn8gNyTAy2vlmPiDJSDUmtb7xwQtTbsiqOMk
         BD7g==
X-Forwarded-Encrypted: i=1; AKwUvBxJNxwTxoPNxM7JV7Tdg3hAcwPJR/zlA634ADd+gsbL4qg/StNlsXIm5horlbdqARZwe+kypeGGrNdF9uI=@vger.kernel.org
X-Gm-Message-State: AFuF++k7yvqQ6Y3lAZU5y2G6x5SgzdIVhVdJVVZgUlqF2qD19WbYa1T3
	Zjg3z6yau+4J76fTugvTNEKlFrZ+P6WUw2934C1Ux7L2JSLO7UFuaNuAd+NDMYbh1HkRqbrWGuw
	qr/vCeiaoVBm6mxEIFclV6dNLdcuK8VF44LSPqx90Sw==
X-Gm-Gg: AYBFou0HSfOq3ud+5TNdugtgWALoH0nIdaeiWlkQoSD+1rezaqeOXCYjKopmriZ90ui
	K35KaSq9NJwRJhVdqZBW7v0Auf6BtUo79PsgUn7UECFcr3mA0pKFglRKtvlquS/JjDUyxLFFNnm
	Bl402a9K2lWHvb2RqHAC4gtcAdIaLivcI3m+v2fnzy27TsEGgre+qwp/FVHUCAeBj2Kpqy+aFKb
	VfWpAboSTz3C3YQSqI7YEjPcjbWmyz2pf1vkO/ISrF31vaLSsn/HTtlq8p3GwBRzcL3/K2k2N4S
	o1lXPySljseJM289rSSslPvoL0DZ1VI9rrwuAcIEjXzLJJymt8a4RGE=
X-Received: by 2002:a05:6102:14a1:b0:7a7:7d3c:248c with SMTP id
 ada2fe7eead31-7ac1b9284c2mr2783278137.11.1790176953250; Wed, 23 Sep 2026
 08:22:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912041220.444715-1-main.kalliope@gmail.com> <20260912041220.444715-3-main.kalliope@gmail.com>
In-Reply-To: <20260912041220.444715-3-main.kalliope@gmail.com>
From: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Date: Wed, 23 Sep 2026 17:22:22 +0200
X-Gm-Features: AclHuK9RzOpNJXNF7_8ky-O5PRlAZRO1N6Z9BojyMo80dP_J3h_DY_FPoZ03fvM
Message-ID: <CAM1=_QTjcyMtMLawSFnCt2c5wJJ-if40GSfo+o-CoZqcgx5wYQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 2/2] bpf, mips: Add support for BPF_MOVSX in
 the JITs
To: Nicholas Dudar <main.kalliope@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, paulburton@kernel.org, tsbogend@alpha.franken.de, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	bpf@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Nicholas,

Thanks for the v3 series. Looks good, with one minor comment below.

I have applied all three of your patch series together, along with the
two fixes I just submitted, on top of the base commit 15972a29ac91.

Nicholas Dudar (6):
  bpf, mips: Factor out div/mod emission helpers
  MIPS: uasm: Add signed div/mod and sign-extension emitters
  bpf, mips: Add support for BPF_SDIV and BPF_SMOD
  bpf, mips: Factor register moves into helpers
  bpf, mips: Add support for BPF_MOVSX in the JITs
  bpf, mips: Add BPF_MEMSX support to the JITs

Johan Almbladh (2):
  bpf, mips: Fix immediate JMP JEQ/JNE on MIPS32
  bpf, mips: Fix BSWAP 32 and 16 on MIPS64

I ran test_bpf on QEMU targets, with the following results. All tests
pass on all 12 targets tested.

MIPS32r1/r2/r6, big and little endian:
test_bpf: Summary: 1062 PASSED, 0 FAILED, [1041/1050 JIT'ed]

MIPS64r1/r2/r6, big and little endian:
test_bpf: Summary: 1061 PASSED, 0 FAILED, [1040/1049 JIT'ed]

> +/* Register move operation (32-bit), optionally with sign extension */
>  static void emit_mov_r32(struct jit_context *ctx, const u8 dst[],
> -                        const u8 src[])
> +                        const u8 src[], s16 off)
>  {
> -       emit_mov_r(ctx, lo(dst), lo(src));
> +       switch (off) {
> +       case 8:
> +       case 16:
> +               emit_movsx_r(ctx, lo(dst), lo(src), off);
> +               break;
> +       default:
> +               /* off == 0 is MOV; the verifier rejects other offsets. */
> +               emit_mov_r(ctx, lo(dst), lo(src));
> +               break;
> +       }
> +       clobber_reg(ctx, lo(dst));
>         emit_zext_ver(ctx, dst);
>  }

The naming is a bit confusing. The name "mov" means two different
things here: 1) an instruction with opcode BPF_MOV, 2) a MOV
instruction (as opposed to MOVSX). I would suggest the following name
changes, applied to both 32-bit and 64-bit JIT variants. This would
make it consistent with the rest of the JIT and solve the MOV naming
ambiguity.

emit_mov_r32 -> emit_mov_movsx_r
emit_mov_r64 -> emit_mov_movsx_r64

I would also put the clobber_reg call last, after all emitter calls.

For the series:
Tested-by: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Acked-by: Johan Almbladh <johan.almbladh@anyfinetworks.com>

Thanks,
Johan
