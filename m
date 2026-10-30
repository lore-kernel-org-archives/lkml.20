Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353547;
	b=aVagXPl/43j4JO8x+cCd6pZLxf5jKLvIdgmlqK2/T2SdcJB1rls2k3+2LfzJyL7seeuP
	 Ie5vg1ot2dep8PqStdUHt9Crt+75xC/PrVdlb8r/GfwepHfQmz6k6chR4S1tYSBdMs/ZI
	 MVJQvIkQuKGVUkiaMpLMMqN8V/K/uBg7IWJnbcFeuiUfyQZKZ/fGETN3auIUZoT5g+b5P
	 oactMekpttklJ+ZRiF/WTuTo0gQwBiMxsPJfYJYlKGOA8zJT/8ze7PBLO74W6NBEzu5cl
	 7yIe1yeUd1dzN+D+sfnf7CxXhJr69UWjirh6sokvwAjToUGHV3zT2cTN+wVG7Gh0E7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353547;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=UvOO6JqfZMd+v5QBaFPCO17vd6AxfiDuRyj9QuuRkjg=;
	b=gMUUKXhFmu9kLxSEtFR6HePeS2Xvg+PLzL3Z2qbLzM2wI9VibOaKRobE1NTdavAxcG2M
	 ZA7MoSHalP0poicjfT7PjMIjkOQmfdhfiX1OMSPgpIwFgru5VF7FUFemiKalHd9yfVDx1
	 9Z5PvnUAJ+8CmRidU9i+KfvQHsXXaq3sKrnf5SfldByND9LiyiL7jkPSEELEiZoUrDEQk
	 DtZ1DKB5Ot+z0M3xh4jprD1e1YPaRXQGIKVOeFtuAiAldA1XGTIDfHH+znguofHik7gPD
	 Cv789O7A4ilnFwA0Fp3tjLq4k8ThnALIKc4l3zPqzIGv4DRhzzGoaGbwHCXK5clzdVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A34606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:45:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01A34606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93e55db58cfso47722785a.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:45:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353546; x=1793958346;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UvOO6JqfZMd+v5QBaFPCO17vd6AxfiDuRyj9QuuRkjg=;
        b=QO4I1WwOC70hlt0B/dGxyHagfEmiBiL5RlFgzdaZkiOTx/l1p9aWJ6jIud+btSkg+m
         q1/QJ2zpveSR2KHacurWUGG09vHqJIrwAIZu6rtxs4miAhWGPIruplkn2QjyKXqeJOI3
         MARUoQ6eLGmRYMgfh27DIrgQhuP/ggbME3/pobIVpqiDpWmhXqvUP8gwhwHU74OlRTml
         o7ejsLZhEkOHf3+rxTqvdeUyq9yoVcDNrqyOkgIm3HnDEYZcuu1+RHe+MWD4TEGy4tmf
         vB0AXrmwiQcp9kvsk+o92Q/qG4XrIGt6IeZUEv0u3jKptowaKOXxd+giu/o1UAJc7Sji
         2UxA==
X-Forwarded-Encrypted: i=1; AKwUvByKF5Q0uWB5H1imel9sWhKxKR2NFJY1/Nmm9zaB7APrXFMEmAYO3f4fZzlSg6FJvT3hSgZNUmElP0e+lm4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKC/Q5HknPmqigRvXMKlpQ/SnVS5NkYIo20J5yIckzlMfQ+8byd
	mL1kZMyQYZ2t/r/ZgeO5RIKfNjcK5R6TBH99/jJVD4bnlqGveQei45UpS5nXH6q/
X-Gm-Gg: AYBFou1lIirSWbfK0UKA7FompUxbl8IKJ02Dao7G1wXz00RLrKffZ+BI4paPiKj43yh
	/my2zDD5XEA8bRtWH2paMRBahYINpwSyrUF2q/uUG6VRBwwJKiL9w/1mVn67Yp5UR3fpREkDIQ5
	IKJrTaFUzJK6zhjKzMtkdZZhtDOL5x4JCuZqEHNwDCxlolXJSSm5EGkrWF4I4GYTyzCoAIriPyH
	fmmKodHJgvdmXczLDpLk9VjX3A8iISdG3ckBcHqFWyyuZkKttOmTWrhdSVJJmseto9U2dZN2YCG
	aiJVsT5fCnnbRIHCCS0AnW/2uAVlML5noXda3jqJTMGMy16+pQaAVdK2qyje5GVVNEl+n2eOof4
	gWcUrsE0cABBh1CNy+i+h2E2HPzXiihHeX1i1gzecCeGyPi5DCgBJAiYwka8QsgnVfwL/w/zCQp
	LXnq6mkjg3qdI+M/jWoVNQ+iGYuA04wd4UtLiLXIoofdceel7LFhxj0MJejYm9jZv9pg0hYru0Q
	RIiCwCiZBcjNSsUoSNFuPfzgQmIdQdWqZLpOULLFi76xhJ0KOYwdmf3ANjFOUVzJFQMklMl1Kz7
	njg8QOTrM/YMT2VOk1mvPjkFetYOl1ePBTHVuiGdjwKhqRnBE5c0Lpi//Ko1GSPDMjn9ts0aWJ6
	Pjwbfu3EfP2kr
X-Received: by 2002:a05:620a:450f:b0:93b:be6d:4f3e with SMTP id af79cd13be357-9442171a2admr290234185a.25.1793353545802;
        Fri, 30 Oct 2026 02:45:45 -0700 (PDT)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com. [209.85.219.43])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9442581daa2sm99630185a.12.2026.10.30.02.45.45
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 02:45:45 -0700 (PDT)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91c905d7b6bso5593756d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:45:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxrBqsNmHMw70hzY0bNaopQ8WFokTLQQI4eEHSGOCeanhhEYWPmobwyc3nWlPNQVyo6rjw7aeiD3mdGrYI=@vger.kernel.org
X-Received: by 2002:a05:6102:14a3:b0:7c3:1395:a090 with SMTP id
 ada2fe7eead31-7d0726152famr950274137.6.1793353170421; Fri, 30 Oct 2026
 02:39:30 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030083800.599152-1-songmuchun@bytedance.com> <20261030083800.599152-3-songmuchun@bytedance.com>
In-Reply-To: <20261030083800.599152-3-songmuchun@bytedance.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Oct 2026 10:39:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVYbJOGCd82fNm8dD5kXTWQvRnymkx3w2PFH-dKnH7G8g@mail.gmail.com>
X-Gm-Features: AclHuK8vFqi3dqWRxr6f8_rNGo4Y5wLrZ0prryPEwyIfD0-s59WP5msq_iDtOig
Message-ID: <CAMuHMdVYbJOGCd82fNm8dD5kXTWQvRnymkx3w2PFH-dKnH7G8g@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm: remove redundant pagetable_dtor() calls
To: Muchun Song <songmuchun@bytedance.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Oscar Salvador <osalvador@suse.de>, Alistair Popple <apopple@nvidia.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S . Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Muchun Song <muchun.song@linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 Oct 2026 at 09:38, Muchun Song <songmuchun@bytedance.com> wrote:
> pagetable_free() now runs pagetable_dtor() for constructed page
> tables. Calling the destructor immediately before freeing the page table
> therefore duplicates the lifecycle handling at each caller.
>
> Remove the redundant calls and let pagetable_free() handle the
> destructor. No functional change is intended.
>
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>  arch/m68k/include/asm/mcf_pgalloc.h    | 1 -

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
