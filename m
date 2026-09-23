Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8591B3CB8FF
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790202411; cv=none; b=hS3G3C8WLhuHxlcUxFpX4UoZ1NBDamNqz1dxFe3u5IkzoYWSCZK/O8nGbeC3aM2vmyLx/lsVVVb6v45TU//vhDUKj1hbrM24bYSRA8oH58DBFqMbxP1+SRiZ6+nK0m5bSBoGJLm1BLj+WVly8hMQjLeBhLO5Gqk/i5wE6nyOCeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790202411; c=relaxed/simple;
	bh=9Bev4jjvUbnc7XlkbVqojQsi0GBxp0vU5PjLSj6H1Nc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cMa8bdVLrKqPXNGVIbh1SHwP/BXbq8GpRVZzybqaKOPkS2jqYy9VCiPr7woBTOUmc+Gl/t8TJfepwBw/mbzCCjHI9U3Bcn6sEQa/cnQ2Nw6hHH9L6/8ZmqPVfIWZQ2zIFadRUj3W0riTjHonwG8jENbiHM5LvvpV1IszrWQIG2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jWxH1Pjd; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jWxH1Pjd"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e83a388f8so8780395e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790202408; x=1790807208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5bBPD/fgdc2g+Epb2XIUlms+kxdY9UZmRZAc6Exgfw=;
        b=jWxH1PjdKgwnuFaWHgq1jiFdJYzyhWDdnuIJoYCZ8mxiLvH+aZpEJRLL+slHJBms7E
         5ACN7qXGRZABfO5ZiyZvoR0IQLgojW9cHzTRCZ7ZMQpO0qw8Z9uzIV9+I27sYY8/L+0F
         tsK2bipu+8LkzMer3S9ua4P/XpfP/ZNFSJRp1nVy5fxZW4+goKSiZ88HmyUB1Ib8zyUG
         Ln03O3UvegeeHhxosRMJkSMwt+vI9JQ85vjn0qaOBu/czfevYvoyYQAgtLPeu8kzpmDO
         0F5tCAywoi0iJPmlGoocqBfImTpfDTr+XchctTwSU1jJyY9qO9X5XR2RTLJ51TFc2MMU
         YtUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790202408; x=1790807208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z5bBPD/fgdc2g+Epb2XIUlms+kxdY9UZmRZAc6Exgfw=;
        b=ll+gELxxSWrSok2d7SNas8oVLsyWAUn4xO64UGPyLtKTBOlkXLu52wmd15b2zw7rbM
         QyrjUXrta+uTlXTl1Duog/QrGAnzsQhkaGSkU8jobOvCZa39uHSygXfLbbO71tM33tZ6
         SL/IKRE2zYyVlzaaMoM7EcWNyofmCLzDIFNMRZKn3QnyKjCddOObwCHq2ry+1UYCIFx4
         OA482phxXC2+hg5YhTZD8ka+qweHF7iAKIkjGUuPkn5kk7OCapNfe+Fy+HvwPgOPLTQc
         Ln7RpUkXT+tH0L100qnB/78iaeFDHzzB7JGhHgmv6UjII10V/2umbIRIfP2MhH7iJaab
         ebaA==
X-Forwarded-Encrypted: i=1; AKwUvBwd3dVnHbrF0y3qIaXuyLLcUsqhcWLWiVnXtggm9Ea4guv9WCP3OTZ1F6gzZt56OpgNl3ffiQGif7Z2Y2Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lrZbO6Y5tctVckhVFnyKGpE7fD8sMG7iDCmrE0FH5Dj7prEX/F
	FsSoCMKmS3X1k4cn2+sHNvfYvSmrBF8HByTbCwmOteRI6hRYrAhtG5tB
X-Gm-Gg: AYBFou04uuxmijI207mAaqqKbbI4OHTLh9b64hCqxFSrzUna1yFMpd158amAjWU45A2
	B1pEVqY+D5VuLJwqy5uafeMkmSmOYTpHQ+6qV1vsPlAtRGpOh1hJceLlJaLjU1zjTwL0Lomp8WP
	/V/m6eMaR4nK7of3KGq/H+quh5Gw/inSCcCQrQZhK0uh4Wt/vxx4Qc2QTry39zlATiYXieI48m8
	fp1ZmUjqCtFTTSrSdl35DS9DXnPHb8mq453XB6nm8VHlLFsdrESizqHHKii12EUM/a+biUgF4oC
	XV0YUmZPdXEql9WTebwN6N+Fj6NBoQErmgi+Gq4LP+qAs6T9quwGxpNKZVEtIMeCAcl1mxBRyeF
	/NFJganrR96bT9eZ1j1jExc+nHAsD4LV2irhmP9UtcRiUdjhu43Qbx4jDpWgla0K/swCteB34yp
	qEiK5uo00QPATpYptH3+ffD1KaF/FgwEm7t6qPbeVKNYlpgNHflSg40aT+FhiuY8J+bHE6EZCLD
	9qXkAUiDL2edm6p0FkAkpnoqRbQxRmSxlbUHUo/aqU2OZiHvCGX4cPz/fX8hR028WxhDu1kYxho
	K/mbyg==
X-Received: by 2002:a05:600c:8b8b:b0:49c:f512:2361 with SMTP id 5b1f17b1804b1-49fe66d470emr9604715e9.14.1790202407439;
        Wed, 23 Sep 2026 15:26:47 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5ba0444sm18212535e9.2.2026.09.23.15.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:26:46 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Pedro Falcato <pfalcato@suse.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Toshi Kani <toshi.kani@hpe.com>,
	linux-mm@kvack.org,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/mm: avoid a reclaiming allocation in pud_free_pmd_page()
Date: Thu, 24 Sep 2026 03:26:43 +0500
Message-ID: <20260923222643.19010-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <arQbFrGiilXn7ABD@pedro-suse.lan>
References: <arQbFrGiilXn7ABD@pedro-suse.lan>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Sep 23, 2026 at 07:38:55PM +0100, Pedro Falcato wrote:
> So, the question is: why the heck do we need a copy? PMD is still allocated
> by the time we flush the TLB. Why doesn't a simple pud_clear() + flush_tlb +
> free over the pmd Just Work? Am I missing something? The git log isn't
> clueing me in.

I don't see anything you are missing.  The copy came with 5e0fb5df2ee8
("x86/mm: Add TLB purge to free pmd/pte page interfaces").  Its changelog
explains the flush but not the copy, and the only discussion of the copy
in that thread was Joerg objecting to the allocation and suggesting a
list_head on the stack instead:

  https://lore.kernel.org/all/20180529144438.GM18595@8bytes.org/

The existing code already frees the PMD table itself after pud_clear()
and that flush, so it already relies on the table being out of reach of
the page walker at that point.  If it is safe to free it then, it is
safe to read it then; clearing the PMD entries up front buys nothing,
because nothing is freed before the flush.  Nobody else writes to the
table either: vmap_try_huge_pud() only gets here for a range covering
the whole PUD, and ptdump is kept out by the init_mm lock the caller
holds.

> All-in-all, I would much prefer not having a copy of the PMD at all. Perhaps,
> if this isn't workable, then a linked list of PTEs would work. But I would rather
> not have tricky logic at all.

Agreed.  It also removes the allocation instead of weakening it, so no
fallback path is left behind.  I'll send a v2 that does pud_clear(), the
flush, and then frees the PTE tables straight from the detached PMD
table - the same order pmd_free_pte_page() already uses one level down.

Thanks for looking at it.

-- 
Thanks,
Mikhail
