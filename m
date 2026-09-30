Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B073630BA
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790760671; cv=none; b=KI4uYQT+0TmtlTQwkY/HK6NJsKIpKZw9E6d+JZAwHJpkGREZMgL5D77uTNZ0Lx+rceLY6WF9/Gyp+UkG9sfq2Uhz3yFZBTnudKz6UYIF3fwgxPspeZg1tckVTiQwXSCbgFPnnCdk9fGcbl9b1A6R5jxXgX017OEVoPbVJT7Bq2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790760671; c=relaxed/simple;
	bh=6Su4lZZpY0nOgn117FUsZJQSa4VYYR2bGqp/+4Ew1Kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N0ZBMrMtihtgevIB6WDCHRfkWiOZlAR/Dz/upC4+/GpeUvwGvbCmddKHHiEKpgdt/fUlEmOWOV2hLpprbndtR7xBaVRwMjAdE2gZmjC3PDRWkmIoTJ3v0dh6u/0CyolmiDPusYF/bRKrME+bcPOerfP6xwHXdm2yW1t3shgb/iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q8Fy4Txs; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q8Fy4Txs"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f635552aso3977663f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790760668; x=1791365468; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xgtcnl4WXcrgn3Aln9NYMl8B1C4EpatLEtDCvkQ8/Kg=;
        b=q8Fy4TxsAtJ1h0ERAItDZo+x5yxqYfAWDoTZQV6QORjMTaBAtoK1mUSb5m0cuW3Vcg
         UqzFlVxWRK1mVnGbZQQTW42hUwbk39AKi2lfEeEbnuAmPn/Ep0w9MVuPfC/iztxZRHvW
         9kIstIL+if8eZHjnlbLcfDi2LX3/AUAoF1u7ATtIE9zMqnJXshi43oe4qDltrTWerJ/U
         6JEDYoi/iFYToWM9a53A4qLNfM9s8jaTQ0xWl9QuvfxgQsXsMRDuqzQ32ZrPlXs4o+Ev
         PslOjzwaT8/Lt9sKt2O5baO7SYAFVhPupXBoB4gaWgtrwqcPzILxSeWiwWkkoOemsnbZ
         5GDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790760668; x=1791365468;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xgtcnl4WXcrgn3Aln9NYMl8B1C4EpatLEtDCvkQ8/Kg=;
        b=Trr+vpQYCVJd+Ow3SqwQ7XzkPLEsNDX0mkNTNf7B5ThzdiJdV1qgOCYptTOgUOYeFE
         /HMUH38J9FztWeIIq2GZ1JTrxnK3FTuy6Tjl5MecPUJ5j4lKpa9F5lPNQSk7nWukasBg
         eX49VveS3X+5oz+PbEwzOTGY2YASJWq64HKqPJzMMS4D88XFrJA/MI2h98AvM+Vyd/Dd
         AQAhCpnRcGFWr+YpsQ7JDYKRm0cMSlFtOCscekgV1R6f0vlYMKEf1n+nWM4uQPUdUPuK
         DdnrUjmcuTK1cWHgEjY4GJkT9XQqnd5oP0ST5UTUkRaMK7wylwvM53qQHh5b3r19Zky0
         Gfsw==
X-Forwarded-Encrypted: i=1; AKwUvByMvEeICYoJIH1rE/gG3eim7ac1QeUwf99uBiK3ewEPaWJBskjgmDGIOs+66878ElYAA8Ex6Uy8fE5raaI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqIVQ/EF9K13gduurpvEkU+67OvFCGgGBE0aJr30QEJ+ZC5oHz
	JZgH832pBRoA6QNS28lWggq3knTMYNiUwdcGn6qL0Ei5Jf9OOF01VZcN
X-Gm-Gg: AYBFou12Cf6G/LdIQj9ReGTOVIhuoI5jFO6cBfT83DLk9anwwqXkOZELG4bH0xu+DNx
	z1PdbBPwqzMr/nf22B8HQDMh1U44Zb1S/ATTnaqTFSYXaWWPXWIAS8wlL8xb5ZxJQkozt3C68Of
	7PpB9ramYI8UXx4tJbZK5em9b7jlz83h4GW3lt5TMcRz4Bhy3Pp5HcPvfNUvMZpXLx1im05eh45
	iAQvgJF9YoJZnMHJtmf/uambZ4K1RtbRfdYSzPKRdWE/nZMV1SFtADssmTLrrNGsYfo+YP5/2mX
	s938eZ0c9d9qbva+TG8OaaJWnOaeObViOsjFucNTI5GrJfXVpYzYbNn/tiS1nCSHgByh+RDRMSE
	E85m7AANyZRWyrXQicoOBrSoMwLHkce/xm6BKqyX68ie0sF659FKWpqesesPH+H0Nrev/4mdFD1
	cVrJ8Vd7pKwLnsHKVEUkbl4hceBiWE9xyNk+7hCCT7tr1J6ka3CJIayP4yOE4=
X-Received: by 2002:a05:6000:1788:b0:488:8ad2:e169 with SMTP id ffacd0b85a97d-48b0255cce1mr1561308f8f.56.1790760667532;
        Wed, 30 Sep 2026 02:31:07 -0700 (PDT)
Received: from gmail.com ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029edea4sm2197049f8f.22.2026.09.30.02.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 02:31:07 -0700 (PDT)
Date: Wed, 30 Sep 2026 11:31:04 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Li Zhe <lizhe.67@bytedance.com>
Cc: akpm@linux-foundation.org, muchun.song@linux.dev, osalvador@suse.de, 
	david@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/hugetlb: avoid recursive i_mmap_rwsem in PMD sharing
Message-ID: <arzVaC2IYkqSb0_U@gmail.com>
References: <20260930064308.58159-1-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930064308.58159-1-lizhe.67@bytedance.com>

On Wed, Sep 30, 2026 at 02:43:08PM +0800, Li Zhe wrote:
> huge_pmd_share() always takes i_mmap_rwsem for read before looking for a
> shareable PMD page table.
>
> That is unsafe for callers that already hold the same mapping lock for
> write.  In particular, move_hugetlb_page_tables() takes i_mmap_rwsem for
> write to prevent truncation races, then calls huge_pte_alloc() for the
> destination address.  If the destination PUD is empty and PMD sharing is
> possible, huge_pte_alloc() can call huge_pmd_share(), which then tries to
> take the same rwsem for read and can deadlock on itself.
>
> PMD sharing is only an optimization.  If the read side of i_mmap_rwsem
> cannot be acquired immediately, fall back to allocating a private PMD
> table instead of blocking in the sharing path.
>
> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
> ---
>  mm/hugetlb.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index cea25773a6c95..75631101a6807 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -6995,7 +6995,15 @@ pte_t *huge_pmd_share(struct mm_struct *mm, struct vm_area_struct *vma,
>  	pte_t *spte = NULL;
>  	pte_t *pte;
>
> -	i_mmap_lock_read(mapping);
> +	/*
> +	 * Some callers already hold i_mmap_rwsem for write, for example
> +	 * move_hugetlb_page_tables(). PMD sharing is only an optimization, so
> +	 * fall back to a private PMD table instead of blocking on the same
> +	 * rwsem in read mode.
> +	 */
> +	if (!i_mmap_trylock_read(mapping))
> +		goto alloc;

try deadlock is not a fallback here. both callers already hold the write
lock, and that is enough for the walk, so sharing is never attempted on
these paths.

hugetlb_change_protection() does thr same thing on the uffd-wp path and
is not in the changelog.

and no Fixes tag either. does this want Cc: stable?

>  	mapping_rmap_tree_foreach(svma, mapping, idx, idx) {
>  		if (svma == vma)
>  			continue;
> @@ -7024,8 +7032,10 @@ pte_t *huge_pmd_share(struct mm_struct *mm, struct vm_area_struct *vma,
>  	}
>  	spin_unlock(&mm->page_table_lock);
>  out:
> -	pte = (pte_t *)pmd_alloc(mm, pud, addr);
>  	i_mmap_unlock_read(mapping);
> +
> +alloc:
> +	pte = (pte_t *)pmd_alloc(mm, pud, addr);
>  	return pte;
>  }
>
> --
> 2.20.1
>

--
cheers,
jose a. p-a
