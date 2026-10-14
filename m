Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF5E55D86C
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791996846; cv=pass; b=DLb0moFz9t6PoxxSR/4dEctAugbYPns+tG74TyCxsvBPiCCaFE7ObM331MwxJ+isVgfBI2F3OEMwNvSQ9q9Jt4kc4q531FtpOAkdYBX+5JGepQeIkPBqj7nVPcjhohKZJD+oK6WCXg/T0XSP1+ImxqS9tL2bmgB5hDl7TcF+2D4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791996846; c=relaxed/simple;
	bh=I3Y0U9d+Nkll0pfd537lAkdCtWdZSZn60epcX76cqCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IJP/tkMTho/FpVxOp9EyA1Ds8V4XkTVkY7wBCdc/0SdlDLBqyH/kRC9ZSu6Zi4y7/z+8nb4z/qWJVGignB5RO6anm/tLie/pNXxvpacMUAwu61JAK9sdplzSX48HYKgKuzLfXndcGi5guyxVZJCQTSbCtqBd7Jg3OugmrjPZu9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NnkqZ8CP; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NnkqZ8CP"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6afa651700eso6263567a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:54:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791996843; cv=none;
        d=google.com; s=arc-20260327;
        b=Ex9Q91X/8jByQkOjrNs8NMl9b11mA+IaO6Wo8ksUOs3H/wxZ6QBVFMWwHl/vbvZq+k
         6Jca+XGoivhqkZX/yX0rlB566PgMSDk9g8GhAbUzlyPenZAgUrrRKNMyjPb8vrhSicGN
         tkE4f4yvRAu+ftUnaWYilV5g5GulTtFnCtsj4pQIcSn0+IYJiPCfKQcdWLuPh5q+whwB
         fVmCxWSBpBqG0/yUqw6gfN1+iwHvwfBdllfmr2Mlt6bZjfJwOPhS+5sXhwOsYlT3WhF9
         gXn2Wq/KOzGzw1T4KIk+bdvao8DHokGDAkt1vL8Dc7SXr83MCiI/p556KPbyfwzan8bh
         Cr7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+F9IeTlxRgN2/qbGE0mzkiygL5YNuqfvZdlqx/Or3SM=;
        fh=kM0Bbpe192RykXDS9UyOB4ZpZ9J537guMAFsWHDNYP0=;
        b=AcoWyGEPFDx2xxgU0nS+ESF20XvuWelIsDDLmLguF5/HBV2JRcaxcuJbfT04M0PsSl
         cERR0+Ma76SqIgm9MFDGZoKUWMcxW0dU0BUHpc+6LEnBUsinLuvzWedjNrfMl9jJyJdB
         +W8qdMGvxIUmwt8ZogpzZepeBsT4TRX9PucRYKgBle7snwwYRCTlkqcWBALGImad8Ib5
         mowCEab5Lh+yd6aHP0LdbnH7eWr2CqYEIYkl5rFkXaftKQo/JTZe+3yZGHmlli8q00rR
         BX/y1cULp/V4EtLxmFCEMkiQjLzY6EZwWy/ZPX7fxS0qjdGvtRt5nc2ebBBo30llYJUM
         PEJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791996843; x=1792601643; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+F9IeTlxRgN2/qbGE0mzkiygL5YNuqfvZdlqx/Or3SM=;
        b=NnkqZ8CPRKC/gCdLyimCqQ2LsXu0eiw4g1AZwN7w2ECrHGgJXgu88ZoxdzUAr+GP+j
         ngza+ahxsJtMTd3Gsck8NqFaQMvbMVVr2HYLxiAFi7FeOkec0/KHhIRBhUp3XEyTjrhZ
         XgfsXFzRxJkSmaM/KUFqumgZ+6gtrSBxEyLwijtypz9GEke2j63j6CyXQASOY8E/gOcU
         P8Fk71t278565XIRCsfDkotxrf45EAvHGVbjI/gpKm0eFmjNggAHpbU5GFOyrmxfEznH
         XKLX11CbNofwLJA0euKCGt79oNtTznYeKeF3ZVFM3Ep/iAUHHbtxoNRNX3RB91sRrMAD
         Mq5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996843; x=1792601643;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+F9IeTlxRgN2/qbGE0mzkiygL5YNuqfvZdlqx/Or3SM=;
        b=nQuBWJCsZInCf/E5Z//87S4s9n/7a5ICEVAiqMlVk4Vl6wRuaHuHMFAU0W1BywyMif
         ftazC307lGRjKaeFWx9OD1KkTNl9KIuy0kZtkjDwKaB5WckZnBfl0VMFGmuB9xqfijnC
         +BihgBm56WhsaAeKNF/7Fvl9NEjkFxjzj+SSQR9KBk5NV8l3GIYnRU5Zf6hsYRBDUeQm
         /uyTSAfmL3nAtIXvgfygJ0wjmXfnnF/yhEn1xoUPYWhV4CVVvIqRT+TIINCTZglvODbG
         u+KdZM0XyrXnp03bp7I1nyv8iTG4efyVChR1LwcVea8/Y6EA6jS/dnmDuReOBUGmnbgZ
         i7Gw==
X-Forwarded-Encrypted: i=1; AKwUvBzRur4JwUHwYmu/Gs9JLB+TTtN9AAGiBak4d0soa2GOrvticAz3H+AvEal0KZfxjpF7OBVUhjOTKM22qsA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLGsSzIDc6PISzT1krKS0PWaleHn92YV1FjuITSJzZ28cqBdSk
	OIG/ua+VXf8Xxkh18jGROlhsDQSe6ah2zJ3c6IJ4ND4kroqrY/W97G32y+UqFXlut7NW+QrQ4tS
	I69dq+weRDj2PjFMowoC5oFnVZySt7kA=
X-Gm-Gg: AYBFou200ppYg1Ol50xJDzcyD9yWIWipE8wHbXB+rcpUAXmM7fhFc/sJI2huLTz23H+
	9HqYg4ckxRib6IN/qJZoTUT98XuBZEYnGvVoFwm49J390gBtSg1XQxq/ld2dnYc/vI8RZxcoclW
	yWWUxB4WHqyviGCq0rmhbi0YL8dxwqytpEfwq7WYbacoeScmx/SyiyrN+G70CFS4W8AfoN5TXIl
	rFSOA0XEZlOABi7nYoRa2fGNbKf9cQ2qWQumyy5obvoQd366dxCC3CNuZ+rRbwVRShRBD+5PnJc
	qdDwNw5LtxO3dxmk0lJxpJNQ1z72coQa6rv1dCduEROBVYg7t6FmPiLXiJS2KDr1LUhKEjL18Nz
	diPlrSTZebhOZcuuVfNXxZkxDiwf+Th3Z7PuFO5h6uA==
X-Received: by 2002:a05:6402:4486:b0:6aa:f630:f846 with SMTP id
 4fb4d7f45d1cf-6b17c26a90fmr13938672a12.31.1791996843244; Wed, 14 Oct 2026
 09:54:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014133431.8003-1-ludwig.rydberg@gaisler.com>
In-Reply-To: <20261014133431.8003-1-ludwig.rydberg@gaisler.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 14 Oct 2026 18:53:52 +0200
X-Gm-Features: AclHuK9TLvgiu8pYEXVwGaLOF66o-uRXsc9jGTrvXgaMGrNaXMoKMLMJO_l4JHs
Message-ID: <CA+=Fv5Q_xcnwq0jjJ1RMw8DniNG9jwAuhODTGSPcpaw7G9SSng@mail.gmail.com>
Subject: Re: [PATCH] sparc32: Fix pgd lookup in vmalloc fault handling
To: Ludwig Rydberg <ludwig.rydberg@gaisler.com>
Cc: Andreas Larsson <andreas@gaisler.com>, "David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org, 
	Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ludwig,

On Wed, Oct 14, 2026 at 3:40=E2=80=AFPM Ludwig Rydberg
<ludwig.rydberg@gaisler.com> wrote:
>
> Check and synchronize the level-1 entry with the PUD accessors instead
> of the PGD ones. SPARC32 folds the P4D and PUD levels into the PGD and
> pgd_present() always returns 1. The PGD accessors therefore skipped the
> synchronization and the handler dereferenced a PMD pointer derived from
> the missing entry (seen in this kernel panic running v5.10.194):
>
>   Unable to handle kernel paging request at virtual address ff780000
>   PC: <do_sparc_fault+0x20c/0x3c8>
>   Caller[f0007ed4]: srmmu_fault+0x60/0x70
>
>   do_sparc_fault+0x20c/0x3c8:
>     pmd_present at arch/sparc/include/asm/pgtable_32.h:193
>     (inlined by) do_sparc_fault at arch/sparc/mm/fault_32.c:358
>
> Fixes: 7235db268a27 ("sparc32: use pgtable-nopud instead of 4level-fixup"=
)
> Signed-off-by: Ludwig Rydberg <ludwig.rydberg@gaisler.com>
> ---
>  arch/sparc/mm/fault_32.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/sparc/mm/fault_32.c b/arch/sparc/mm/fault_32.c
> index 86a831ebd8c8..f9befdbb3e72 100644
> --- a/arch/sparc/mm/fault_32.c
> +++ b/arch/sparc/mm/fault_32.c
> @@ -276,21 +276,21 @@ asmlinkage void do_sparc_fault(struct pt_regs *regs=
, int text_fault, int write,
>                 pmd_t *pmd, *pmd_k;
>
>                 pgd =3D tsk->active_mm->pgd + offset;
> +               p4d =3D p4d_offset(pgd, address);
> +               pud =3D pud_offset(p4d, address);
> +
>                 pgd_k =3D init_mm.pgd + offset;
> +               p4d_k =3D p4d_offset(pgd_k, address);
> +               pud_k =3D pud_offset(p4d_k, address);
>
> -               if (!pgd_present(*pgd)) {
> -                       if (!pgd_present(*pgd_k))
> +               if (!pud_present(*pud)) {
> +                       if (!pud_present(*pud_k))
>                                 goto bad_area_nosemaphore;
> -                       pgd_val(*pgd) =3D pgd_val(*pgd_k);
> +                       pud_val(*pud) =3D pud_val(*pud_k);
>                         return;
>                 }
>
> -               p4d =3D p4d_offset(pgd, address);
> -               pud =3D pud_offset(p4d, address);
>                 pmd =3D pmd_offset(pud, address);
> -
> -               p4d_k =3D p4d_offset(pgd_k, address);
> -               pud_k =3D pud_offset(p4d_k, address);
>                 pmd_k =3D pmd_offset(pud_k, address);
>
>                 if (pmd_present(*pmd) || !pmd_present(*pmd_k))
>
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> --
> 2.35.3
>
>

Hi Ludwig,

Tested with one and two CPUs under QEMU: a test-only helper cleared
a vmalloc level-1 entry in the calling process's page table, flushed
the TLBs and accessed the allocation. With your fix, the mapping was
restored correctly and data verification passed. Reverting only
your patch caused a fatal trap in both configurations.

A non-injecting regression test also passed on a dual-CPU HyperSPARC
SPARCstation 20: four processes completed 128 vmalloc/fill/verify/free
cycles in total, with no new kernel errors.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
