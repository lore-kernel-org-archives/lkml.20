Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACDC38886A
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 17:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791394317; cv=pass; b=GmCja01F4h2/UuSG4wiTb16Fn8D3FftcPy+tcid2bPlGGfDfSi/YprbiZgBCeTaEl45qRXhxn4zoWzhmSbCkHDp9sNwJxJbYGFW/JrElKDihcj40/tN16HaZ/EWnMCu9WQFAXDYCMf1jlM1WGf3AVIMTKUV1I1z5oLqjDJzkcS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791394317; c=relaxed/simple;
	bh=hEFs0Dw56zPPRQdsZEk2+a+v4IXYQPajTOT07U85lwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jC44YrxSKLzrCgnv3afBiJ8ms9hIl9Hd/h6v2DKraSf806to9bZZMiOERXvcwYKmdnj1FCVrp6//UdlwkYgiknVn7g+2GJBan4HLLH+Lm68mZ97jRfWy5EfHLf+nV+VG26s9T2F09npfVJNnNPrnLY6eW2UWmdiUBd3EeNWoj0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W3JAV2M3; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W3JAV2M3"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6acbdbc1725so6188345a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 10:31:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791394313; cv=none;
        d=google.com; s=arc-20260327;
        b=PUdaPnuNpYasOavcoYwNu0AUieWRYS/9N7lo6bZeO6QOBqkGW2vrlM5oXbajj1zLpj
         qBvwg6IJHucQeISy5kmwMUvjhu+krpxWuNXPSLZIU5mw5gy4/9zPaMNxBS8vy0MZ4ajJ
         ha+Gp6sdE5Vc2ssLidwzsnfNoXR6R9JN7IhgWDpAZXqsX1mR0JuIXwjJHw0VxQd52u4y
         jamNOJRhVtZVxoD4/y0oojRikXwrOLlrfC0R49alFbnNg0LukY0h4agV5aqWvbhT4L4O
         DhCvjIICpwMQZvG2mbyFe6ReTrKmvj5nRny/s4i8FWym0FsX6Sl6wgz1H2pTfbJfdLBG
         ia4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lYmfqkWmWKlcMC5OV6H0RMT0NW6kLXjPokM74C3xA64=;
        fh=qCW68ne698qrf+uQxS3HwmPVadLwzr5pMswgU/LSPlY=;
        b=CU2gl1LdTZl/IywdPSay8I1bq0ZD33+yC0GMFpNhStLzGQ0JZsRA+nKfTyVW1MqKN6
         dNtvmfYaxTi5KiHGZxgBZsQW2Ge2RqdJUgUC0eF18xaytZ0uwVfWER2g/c5O9lUN7BX+
         AJ4aNB7Ut/kmr3B3LyHEN+eIqyY1mzF5jCFPFf03+qf1LloTzeJzhLqNfelqpk5zZdgG
         +W7Udwzb7FCLAaPE3+XLDm21gsxmTzFVllGzbpYU7XlG83+EjQUgcheSS0/Sj0e/wKIA
         5OfpSSvMiOouNJcgb5WoakDl7nJtPlDyfJNcREGxu0bjSyhzFHjyvC2NjgE1Xdd2jb9e
         s6Xg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791394313; x=1791999113; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lYmfqkWmWKlcMC5OV6H0RMT0NW6kLXjPokM74C3xA64=;
        b=W3JAV2M3iBhtUy+65ZgmdF7rioTXgTGZ+w0OpcPVNQO6ttTO4GTGBWESBj/9SutmHQ
         psXG4ryL2evLjrOxbw2H8217bAgVuWsxTEgSaeVG66YM10CFUNF7bF/l23vYfk4dI5e6
         QPuUPgQKaFZrMLILKYWbIz3LXOSvXb+AHy4DpEw97/iEgLvM6ZwP9oIsByKpcenwSD28
         UZ4XLOV36SUSCLXOdcXfRssV3Zgo+1ZAnGY0FCxGKKTXlmqaCNH8cPGX1qw8BDEf7upf
         4hvVV6q+kedFAfrusBpK4syJHxKPzP+jPzWfhR5q5KdW4R1jCyqL4eaAoRrD2hiaSJ6W
         suHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791394313; x=1791999113;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lYmfqkWmWKlcMC5OV6H0RMT0NW6kLXjPokM74C3xA64=;
        b=vRn5l9sw/MhtSvRlOlR3wOkYo/Qu9W20p35GAbLK96srzDtwVFcjMxiF6z0e/HDA6h
         +3Po5kJ0JtodgFGy4mNstE5X/FuxCYac8jOR8jHdHRysL/dPxYA0gS2iZjTkMhoiVAVQ
         CezrUBnLK1cYfVomVh7j/BFwbBlwwjuuTus2Td4IZLX6hNbhAwpkk5+uCzUa4aGY7pg7
         iuL3qjPZlcLicY45r+rjB3EHEoSUjmP+md26kxRINVIuC+2K/69U+jLk31UVggy0oVLJ
         dPRsRI626vHCZag/jqOGkWsUJc6UIR3erowBLtZWvr6sMszbKXogh7Aa4I05FgypYt9K
         h/sQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7Un2j6t7lEp4wadJrPQHoYfif+qAhCEKWcxhupLo+8ShWZAVnZ8IcXlkxADMTBH63EgbCaAm7Odqxa9g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSiLn5uxRVbBIjUWEVHQ6QOmSbBUEE4Cqsnk8DPPRhw7S2nBSU
	LmGAWe003ju1RA0NnhHG7lx3t34wVQ6PKCVUvOz2yEeXCIuY2S6wW3vvRpqSeakA3b4ZNXMk0Ws
	4/jDTZZBe7zPVaspz+wQhGT0xIsNQWwY=
X-Gm-Gg: AYBFou333rAFjrayawxnCxr0X0bQxUfRQHEo92hsfjeCZqthMUk4HzIkYZofS6HK3Jw
	Gkglm0QNKwQ3QuBSu1aDBREjkIpgXHUPgtBSUjiLnA1G33pIZJCno2fYUbiMd6G/SGH1PPP5jqS
	9Ui5Wug7Np+rrAHynOGusDhH6b0kLwWdy2C/5X+oeKD/YOFB54oJuL4MD+eBmj+Id3ZYB6No6gi
	Xb2fXQBbSvLllwW4fo0a6NT/AHL1bVWNW5AAiLTT9MZ5ctPMOxxcCUPJnFLaK9g+97zkBmp6Pwp
	czpYYCVjzOlBmJY/UEJVWVkelYuzzyIoH+I4eVp1aXPzrT6vH8ZN+Pysd70pEvpOqeXeSt4Yaue
	mNig3gI5yNveXhNokROYHumi8IoaR9+qQw3puGNzcBw==
X-Received: by 2002:a05:6402:5112:b0:6ae:16f5:5bf0 with SMTP id
 4fb4d7f45d1cf-6aff3901a70mr2828026a12.29.1791394313288; Wed, 07 Oct 2026
 10:31:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-alpha-hugepages-v1-0-a673a18aaa70@gmail.com> <20261006-alpha-hugepages-v1-1-a673a18aaa70@gmail.com>
In-Reply-To: <20261006-alpha-hugepages-v1-1-a673a18aaa70@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 7 Oct 2026 19:31:41 +0200
X-Gm-Features: AclHuK_xVEaI7ZERJacz1HIbeacaTan5r5Wv6mnxZ57dQ_8Emz8kC0MqviECPEA
Message-ID: <CA+=Fv5R+6mvrHSrGBAtX-BfxMyt3e-aD=Su6huF0VdDno35P-g@mail.gmail.com>
Subject: Re: [PATCH 1/6] alpha: add missing page_table_check_pte_clear() to ptep_get_and_clear()
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Oct 6, 2026 at 4:04=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Alpha's CONFIG_COMPACTION-gated ptep_get_and_clear() overrides the
> generic version in include/linux/pgtable.h but omits its
> page_table_check_pte_clear() call. With CONFIG_PAGE_TABLE_CHECK=3Dy the
> map count taken by set_ptes() is therefore never dropped when a PTE is
> cleared through this path.
>
> Add the missing call, and drop the now-duplicate one in
> ptep_clear_flush(), which already goes through ptep_get_and_clear().
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/pgtable.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pg=
table.h
> index 6ebdd90f3035..8a175e0c2b42 100644
> --- a/arch/alpha/include/asm/pgtable.h
> +++ b/arch/alpha/include/asm/pgtable.h
> @@ -305,6 +305,7 @@ static inline pte_t ptep_get_and_clear(struct mm_stru=
ct *mm,
>         pte_t pte =3D READ_ONCE(*ptep);
>
>         pte_clear(mm, address, ptep);
> +       page_table_check_pte_clear(mm, address, pte);
>         return pte;
>  }
>
> @@ -316,7 +317,6 @@ static inline pte_t ptep_clear_flush(struct vm_area_s=
truct *vma,
>         struct mm_struct *mm =3D vma->vm_mm;
>         pte_t pte =3D ptep_get_and_clear(mm, addr, ptep);
>
> -       page_table_check_pte_clear(mm, addr, pte);
>         migrate_flush_tlb_page(vma, addr);
>         return pte;
>  }
>
> --
> 2.54.0
>

The misplaced call is mine (dd5712f3379c), but it only became reachable
once page table check is enabled for alpha.

The consequence is worth a line too: with page table check enabled, the
first page freed after zap_pte_range() hits the BUG_ON() in
__page_table_check_zero() (mm/page_table_check.c). My test kernels
have COMPACTION=3Dy and PAGE_TABLE_CHECK_ENFORCED=3Dy and run
clean with this applied.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
