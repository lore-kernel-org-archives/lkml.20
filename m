Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1664E3DD87F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787819052; cv=none; b=YxYCYrJ+jn9vH5iz1ZFxLNsdR2QwHDLnXzNPQbDtogf41IssBin5WTmZw0V+1UvAGWNrobsQPPoG/2Zii2TIvF09U1hSw3weDMAAIMSlaLIJgv2763a8Tmp3tOaqhu062fxu095d+QDTJFBuffhT4bDlypTU3qMCUUx63Nrfx6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787819052; c=relaxed/simple;
	bh=pkGSAMDXspEu3J7iLyllPLKHDKuo8B5U1HH9oT1LPhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=szC9k5u1FGzN2fLr818I1+jAd4pvjiq9LR7qc722sBckBTLiqfo0JBJCbnSXgZ6H0ZdOuugIJ6jH0hErGzGaUbcQ58Zc2OzvMFNfrtbOJmwHPY4TnX0f7KmWetDWOVHm0r+olr3QJrikEkssgBiITPcprYNVCJK1eNnokZ2QXLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sl4rSaq6; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sl4rSaq6"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so10040255ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787819050; x=1788423850; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=53SA5jsB14fklHtRYEmUAlSS2YNOxZbTqVCbUtQsPlw=;
        b=sl4rSaq60uYgwUyZTtrgDZdST54j99noz6an88k0fyH+geKFkfuTBDBsBmLq2BKAMJ
         d85qoEZo91yX8bZM4llnhASQCw0PhCuxn0Yj7P00nEoiDcgf+8lT9By0lcmckw8nWAOT
         3jElD3R/NL+D4KNsyZ6IhjSA/j5fbokPBHNL8zfa688+g2bqVm14R+zID7sbj4sIJmf/
         mcAUDQOxbasNQ4kEdKeNqHvKcrhUjVLSSyMEsWpt9RkXLpfSDc7WQo+z1NITIDRUuBvs
         iw5b4aAz4pDmvCufcblZU4ihi+DdBX34ZN3NiNzwRTCZDmMmbg0mnq8nHvr/EX06I6fD
         GlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787819050; x=1788423850;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=53SA5jsB14fklHtRYEmUAlSS2YNOxZbTqVCbUtQsPlw=;
        b=qF2M3Ct5i0TO+OTuKhDBFzS0C+G1TEq12bVIZZInsUf57UjUbHu6UunIk7fXbk7gru
         9IrWGrQ7tB02Yg0WC6+tWocmy0POfsJvp1UujqyIWi75megrKYz3/b+KEfhihIQP+nPG
         R/odAaRxjnjcKQNRCYR2ctvttLwIXsHUKYDFUtMWPGCFWVu7LPqYAkRP0FETx/r8DxNR
         3dfN4sFJn922uTAnSz+1dvJfOvkre2aSLyb7dbkk7lmbGEHFyvZdc+EvxrXFj8b6Ji9L
         GQK6EsMLIycRaUm4VpBokNJ3W+tbD4IOZ1m+ZYG20W/jq/HiO7tdojjNG6aWQTUS3Po7
         b3TA==
X-Forwarded-Encrypted: i=1; AHgh+RqYMKufvgc+lFiBe/04dUSG7AWc4w7mti/eeuG7bXO8pv82x8lbcb2VEwkCPCjqOfAgGNnKr/pPjh+4Eqw=@vger.kernel.org
X-Gm-Message-State: AFuF++luvYzO0D7bhWnfCaWQ1IZzH4Ps2WeeOIvji0xT1cIsIn/3AQOt
	o9deX+2KFH034Bnhpac/Nrv2uTUBBATevep1Zb7X9JC0TqE2JnyCDTSJ
X-Gm-Gg: AR+sD11dGW+h2HMLQ7/4q1dV131HnlbluK/z3Pf5Csa+fZ7spAoqRHMF4j8La/SjoYc
	sOM0hVKxZ7i9JiijI7/Zn6wdrQMdcfxQjf5/bCfg1u/FvIV/ohvlWwqobcYTQybBQkZdKYTE8co
	WquSuyDtSmp7M+Y2AWIRtk9NQTaQYsxuliLMRwoiA6u1rRVjWEn92LdR4grb6jTucaSzbpuWpOF
	ubQ5MFfeIco2U/n0J5vjAID/JDemx1osU11m6rYOz4n011sdVI/8x+ioiHdw5BN+A4hbts43ZgM
	KA1S9YBSm+0Wosk0dsQb7/LSFKaKtQ+v6p/Q8HV2BFONlgad0eR46dDGXarSoG5OWHoG/cXXyg7
	CyDuE56HcKcCO6YaqeLfF6Wm7qc9lFA0+hx/8SQongcvmTfH89m42sIR3AwjG/jnZld8WjwISa6
	2kPSdqZWU0QG1nVj+/69ki9IlTC2HELC/9c8ypgmkcpxscKTXkVmWKw5DOiNiOFkr4ndDPihDJN
	/PJWk/aaw==
X-Received: by 2002:a17:903:19eb:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2d707bc0823mr263048885ad.14.1787819050220;
        Thu, 27 Aug 2026 01:24:10 -0700 (PDT)
Received: from localhost.localdomain ([142.91.101.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d70498d74asm14491125ad.29.2026.08.27.01.24.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 27 Aug 2026 01:24:09 -0700 (PDT)
From: "Lian Wang (ProcessMission)" <lianux.mm@gmail.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] MAINTAINERS: remove myself as THP co-maintainer
Date: Thu, 27 Aug 2026 16:23:27 +0800
Message-ID: <20260827082352.26769-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <ao7Nr_FALfP7cTY5@gremlin>
References: <20260826-drop-thp-maintainership-v1-1-3d102748fa17@kernel.org> <ao7Nr_FALfP7cTY5@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 26 Aug 2026 12:31:09 +0100 "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:

> Since it's 2026 :) I asked Claude to look at my time as THP co-maintainer:
>
> 	~107,000 words of review across 948 emails (in 279 distinct
> 	threads), counting only prose you actually wrote — quoted text,
> 	signatures and attribution lines stripped. That's a full novel's
> 	worth of review commentary.
>
> 	Along the way you handed out 194 Reviewed-by and 15 Acked-by tags,
> 	and your longest single review was 2,404 words (mTHP collapse
> 	support, v12 — the khugepaged/mTHP collapse saga accounts for most
> 	of your top-10 longest reviews).
>
> 	Estimated review time: roughly 300–500 hours, centred around ~400
> 	(i.e. ~7 hours/week for 14 months).
>
> 	1,615 THP-related emails in the window: 948 reviews of others'
> 	work, 278 replies on your own THP-touching series threads (~31k
> 	more words responding to review), 382 patch emails, and a handful
> 	of MAINTAINERS bits. Busiest months: March 2026 (131 review
> 	emails), June 2026 (113), August 2026 (111); quietest was December
> 	2025 (5).
>
> Think I can be happy with that!
>
> --
> Cheers, Lorenzo

You certainly can.  Thank you very much for everything you have done for
THP and for all the people whose work you have reviewed.

You and David were among the first people to review the first patch I
sent.  Later, SJ, Zi Yan, Mark Brown, and many others also began helping
me.  Although I kept making mistakes, I genuinely wanted to learn enough
to share some of the review and maintenance load that you have been
carrying.

I still have a great deal to learn, but I have started to slow down, think
more carefully, and improve both the technical quality of my work and the
way I submit it.  The help I have received from the community means a lot
to me, and your patience and reviews were an important part of that.

I know none of this changes the workload that led you to step down, but
reading this made me realize again how much time and care you gave to all
of us.  I will be at LPC this year, and I hope I can thank you in person.

I will also be more disciplined about patch preparation, testing evidence,
email formatting, revision history, and the overall submission and review
workflow.  I hope that, over time, I can take on a useful share of the work
rather than add to it.

Thank you again, Lorenzo.  I will miss having you as a THP co-maintainer,
though I am very glad that you will still be around.

Thanks,
Lian
