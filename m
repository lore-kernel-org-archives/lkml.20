Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481793A5E67
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790204638; cv=none; b=H2R9UGFwWWl0V9q1LwbA6BH9Qirf/YDV9iDLNnmmsZpJiO65rkuwLAECJAePCCGZcitNbjBPogK/qgy37rLam7F/R2IEA4NbLdJuzKAbjGQAXaHcJOi5nsySOQBMQVpAEubErsKWl2DcAYmfLSc6y7rmu5pDylLmDiAcU7R7aZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790204638; c=relaxed/simple;
	bh=XgOV2jzBNHsZI4frAsR9/oTXm9YIxk7KkNVPLd2XZuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DDkgZvpefv7m5hAZhtkfsjoXPnkQJ9Ziq7mETkOwt5AmUX+brYBFLxQAzBUhsPctgAn59pA4Pzf9CgtHdCJMwR+j8UA+qUUc8O94Wtb7YIfNdHRdc1aM0b7ldLb757Xv6GrML7TwuEK1DnWszNQ66mQ/S/O3G5x+vizzPLen3BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGxG7Nis; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGxG7Nis"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccead2aecso6623025e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790204635; x=1790809435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IT+kPykiDUVKChmVTT4JFPPqjHccYovstoU8+/L1N6I=;
        b=nGxG7NisWXunfPiFK8quYvmY07Ac8TihcLTrIVnzFCdxOYLJKq/3oWnqEbrX0Bl1yd
         sWe2SzmrBeIGQ2eyjws6d0WNVg4U0oapFIpL4bQS0DaMehOHsBFrcZnL1JpR4TmamB63
         hwG3s+Cp8LNXqbigFwVafkplA9XiaBkMuidAb+0nnvyTGBla6sLBvvjVcrySvC+AE5NX
         4mS2zn+Id9vF2VJVNPOZHuE3cmpKTMwg3BXlXLaIe3Wunh3icpRC6Y/jbxfz+/GGg65z
         RFUgcFc29aZM+lTXVR0UYk/HhE/5GyFWRenj89nwUWzOMlTCQdYG/yeNWbAcxPI3o56Q
         1wSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790204635; x=1790809435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IT+kPykiDUVKChmVTT4JFPPqjHccYovstoU8+/L1N6I=;
        b=MLlLOtOxZwGP9ZDGqje5qJ7nTCn9onMI9TIvvqJEE217/IY42XTQgt3Ne2MiecPWOC
         Rx0VIH8Ph1L5kX664s+7MCz10hnAg6sipVtL9bp1pCUVqipHegLCO2+Hgc5NdEf8sG2h
         S+98T585jdPZA3P1TDR3R3t3zuQlBnezqwjYfBl23DSShifWSo1YSHVeZFG2OjcFADCt
         S4bi1ybfokmJFVpC2SSIPZ7sqg2bmN0S85KBjtKHbyBp6Mbo1BDrQ1MfHRRSbE/mHxwq
         Ur5pkfevzIlQXUNvEp9X1XIkYK7bQUOAe8VXZMjL4cVzPQu2bhD3lQiTXKcqxcfkz4Gp
         8Jnw==
X-Forwarded-Encrypted: i=1; AKwUvByntqyhcYihRxkRPRLJg+MfLABZn4WMI3uUoTYvBVlHa8lF7R9tkn5grEsKMWnmXLTt+1GU7icWLD+l0OM=@vger.kernel.org
X-Gm-Message-State: AFuF++lpBWxszn8PFxdL6YEbns3RBbE6F5gNcaPZ37gJqD4sEwOUaWDD
	WZEJQOfTwoz3YCA3DCQYHMalv0fkT66WBixxIXBk0gwVvz1JL4E17cbg
X-Gm-Gg: AYBFou3guOU31UysTGyTx1cKo8CcSIqEYddZuCiP7pRW5/+Y+ynedjYHdM0jK+64KxN
	8CNmo6VmEKJmDg0/fXQin5HesEYMNF89cf1nNgPd7GnBzu1L++1J2t5shrDg4mzTooPZtpVx0y7
	G5sVbEVA7Mm3OPlvQygKlsYT+3mpFGFfmrbxqzgo74weRVI0BlnLQyJRwLv97JY3HeSIDaRl/Wh
	kt+Vh16v7mtjObZdnge/WfWpJjzhWoJQNyH2UBZYzlutxM3L55cmIOfr5gsUEdb8ASmWFV2B0zw
	hw2jL0g7f3LSHLL8B3aR6u8w/a/quPplgb7017NXcDxfoj3j97+zACRbgxUvyQO4/cwjUawC4Ya
	7U1/e0oIZZlIJ9gyU7tRsuQOEwAnWxPe6AdwqsGlYW5BRe810PPsLdNwDYASDW8o6GkxHo/pH7L
	gYQjdDHPfaCRUQWMayu25N3ZrmhiZ2Wwpc6sNbOb9D50fvZqgfDLrxvIngip0MLSRwnhALjiQ3d
	Y9+YJkeGrBYYcRfFNabGhKd/CJ9S40YwXVJ4/AWBkTN88MCXU6Vhc7XeudQkDDTd7nxGryL
X-Received: by 2002:a05:600c:530e:b0:49f:cc2a:f73a with SMTP id 5b1f17b1804b1-49fe66fbeb9mr10115395e9.25.1790204635318;
        Wed, 23 Sep 2026 16:03:55 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dfa6a7sm31259815e9.12.2026.09.23.16.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 16:03:54 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Dave Hansen <dave.hansen@intel.com>,
	Pedro Falcato <pfalcato@suse.de>
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
Date: Thu, 24 Sep 2026 04:03:50 +0500
Message-ID: <20260923230350.365304-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <e11449f0-d9ad-4d1b-ab21-2be7d71fe335@intel.com>
References: <e11449f0-d9ad-4d1b-ab21-2be7d71fe335@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 9/23/26 15:53, Dave Hansen wrote:
> I think that means we can do something like the completely untested
> attached patch.
>
> Looks like Mikhail came to basically the same conclusion.

Yes - v2 does the same thing, and also drops the now-stale NOTE about
the page allocation.  It went out about 20 minutes before your mail:

  https://lore.kernel.org/all/20260923223116.20090-1-mikhail.v.gavrilov@gmail.com/

It was tested on a box that reaches this path at boot without any
instrumentation (from amdgpu_ttm_init()), plus the TTM shrinker
reproducer; the details are below the scissors there.

Two things in the attached sketch, in case it gets picked up as is:

 - The first hunk prepends the patch name to the SPDX line
   ("pud_free_pmd_page-simplify// SPDX-License-Identifier: ..."),
   which will not build.

 - Making it return void conflicts with the prototype in
   include/linux/pgtable.h, and vmap_try_huge_pud() still does
   "if (!pud_free_pmd_page(pud, addr))".  The arm64, riscv and powerpc
   versions also always return 1, so dropping the return value looks
   like a reasonable follow-up across architectures, but I kept v2
   x86-only and returning int so that it stays small for stable.

Your comment above the flush explains it better than the "INVLPG to
clear all paging-structure caches" one-liner.  If you prefer it, I can
send a v3 with it, or feel free to fold it in when applying.
