Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD7E40F726
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787760487; cv=pass; b=pjfd66H40Criy/ktVLrzlw1TtPwvZu8ppmyVfKlGnRJJu9zHXCFN4RsS207/HgQ/Fusl5wXv1OUl0HxSp7/czVW3Co7wOOtJ/8VeI3BAZynUxPhCQ/6tHpRYc5LDwuCKSohxUjwZxPPbXu4BYWDGJnI9l77D/bEomIW5cOxH5+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787760487; c=relaxed/simple;
	bh=GIDnncHf3gt4skXsPSSthAQ8/5s/Uha2JwXUjEqzB9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NTVujQ1+UBQFLbUTAoRkRrstLdHsG1KuqsNUrPCSCXEbgvUHNg4Hm29oKrCoL4zBCfSUbn8Fngfb8y4HglJfTfRUyhlyG2xA1FimJHmEQzdsQA5UeN9IRVzGbND+iQgeIJUQuFr1Bt61SmOjkdXqDH5OLAE8L7NSZNGIrA+karI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WUejBtrG; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WUejBtrG"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b4aff8e8c4so20106e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:08:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787760484; cv=none;
        d=google.com; s=arc-20260327;
        b=o3otMskuFdYfab8CbYxF3ANXGzR/i5tCT1ArfYJbaaJckn1kADDkFSvBU4VVqBID1E
         vgE81DtRn5zYgFNpSezFSoAeDPV7vRhDb7WWTNGQ9aOZXMecPPRRFNK+Mc7MPjHOnV8A
         mtY+LCbEWGcApSASphTjoKUN8NKD7MEEkZ5MlJEjvLyUBdamgpVM4Z5xI1icMFgo3O4D
         7jIgIKLfpuU5ggvwtIdv1v2XIxTC/ljeQt5bJvOMwrBnNxY8OzBXWBRSuEcSojqa4dCU
         Zz+gmdvnAqvE/B8fAQkhC2bimjZbrpM08d31M2bhzM1A95/n/WzRrHC86FP5bgXGrHhn
         XjaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6TL6o2qDUSSET4kTZDIBsppDmS2qokjwR9B3c5mQR8U=;
        fh=oLqpsVizTQ6Ub7KVzOHTNaU1IJ0xVSF76ewnN9OlvDc=;
        b=TrKWV9JKFB+ohK1Y8UIr7pJRfNgcrwQ9ejV86OE+N5yOjaByZOhVuKir8t1tjcThA6
         Zp3OONF3xjYen1IjQeRMPiqEWxtjYHk/P5G1g4wuvfkonTr5jfBclCF6cm+3XvQunoHH
         jJapPEfsbEnKxWJ5bjxxVD4+ROR+/x2pGY0L6EM/1z9KyspQZklKb3b4hR1gQmi9dNTb
         l67vgZLzbb0uJZwCAL3Fz0XhjOQvFG54wwBSnxg38drXC3xrpK8LtF7992x/ouX4SlbM
         vLHM2980MNMrsa7T7N5T+F/S8PZXrrSHP/FVUR8AcSInSFs2EEUcNRRlHxoujRmMrGmQ
         Rl+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787760484; x=1788365284; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6TL6o2qDUSSET4kTZDIBsppDmS2qokjwR9B3c5mQR8U=;
        b=WUejBtrGAiIVK7cxZeJJdhY8cYkpmApOQBoN3TNoVbGsm+/M/VqkmhGNczfoVxd5lf
         q5mxYfc2WzbDNaK+ElI+UdL6iKk4TlBMk7BTGeavHGPm8IjWLd3zU8f1tdoT476Z517w
         llpGv/XfcW9ukhbF86PCClRwP3iPe56EHUzI5VAxU+cbOe2syK5TN4sGxpYGUiN9lbpB
         Q7ncoFQuO4hB1bTLjw+bAJDWUR8VC0X4jUGXrf/4r3YMwx6TBZaIdJK9bHmL3shZWioD
         Bxm6N1bY1AJuwc+KKUVIKQr+kRqy+w1GRBDHBxUmjlvCXLywTft2EoG3Zfdcc6kVPwnH
         1wRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787760484; x=1788365284;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6TL6o2qDUSSET4kTZDIBsppDmS2qokjwR9B3c5mQR8U=;
        b=n3K3JcHIoUT6tXOnPviueUlf2N9IfRKr1xKasonCP8XOOFs727ZO+gVNAflcLdo1Zl
         nxEJwrlk6XlK+cmLsKKfBqHw7wNtzAWdorBNjoT56HRGsJ5fcMBiRP4awITcUncC4DF0
         HY7WAVmagXTyANH19zpJra/JmNE0e822KLJou1ALXbfL8PnyCS2/sUcY5aTbO1g+t5ci
         UxcgFybtJ1i9W0b/409SiS2zcz2bYPzVw2vTDIQEhDpPvNEbvGrMZttJWRRKis8rwm0W
         U+Raf7EZ9gZmIV2TiDrhDWi8dTuXW0qdz4EOO4Gi2CjvWP9uMU00uq+fd3MdW47/DkHn
         jKnw==
X-Forwarded-Encrypted: i=1; AHgh+RotMVP/3hbxfruJZuy6oTkz6ngmfYaIKG06vTgliAcUXQ6JjzYozelHlXFyglGMASOq4Qs+27zwQ7BjVeQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mtahK1uqRvh4GpiJT0CJFMKWOZupRlx3YnlmtMecfWOXv+X/ZI
	9a6AEjVtkU/0frAcBr9dGwiMrjE03W2bYnPYfKplgnn7TnmsNWptqi1OnGbUAbRKgT8ZHXQP5vA
	KZ1jTGu8thYkBmNNLYssqeyLUAUFzLKE=
X-Gm-Gg: AR+sD11kjVdGNdCnq3++fsLVJPsp17lpVBDeRbErsnt0yhkslBIQc1nw8jscBrYEc7G
	Vi3z8TwetWoVq/42ZhdFjUta5FJ7c/4qqor/WFygdQKn4eNvS6vFWk6f9Wi+RWDup0DiQl/qIy2
	efeibrbcAXAs+yS1lpGbAYtZAGf4i1zR3t6JG/n1lJ0Hzh004CeYkZjtUACbRhCGcQ5G5pV9J3W
	s9YwRmqF7ws3BZXVYQo/kMj1hXvhQKpoqr79LZxp5OgEOkSihJ8EDpMalPUtKUaUqiQUFUVWAN0
	WDwffGw1Rh7INgP19ijaWGt5JiWbtIAOo7YJTIfjYgCUHlk1dLpyKddhf4FslZJWJ9zz3Bpk31I
	=
X-Received: by 2002:a05:6512:38c7:b0:5ae:b998:9134 with SMTP id
 2adb3069b0e04-5b4a9006427mr2044785e87.1.1787760483740; Wed, 26 Aug 2026
 09:08:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260815-shrink_zswap_entry_0815_v2-v3-0-0171bd86a667@gmail.com>
 <20260815-shrink_zswap_entry_0815_v2-v3-2-0171bd86a667@gmail.com> <CAO9r8zNFYM1bry0DwDRNtpnEL9yyXQ3h=1wcLbGsO1sFtGgvjg@mail.gmail.com>
In-Reply-To: <CAO9r8zNFYM1bry0DwDRNtpnEL9yyXQ3h=1wcLbGsO1sFtGgvjg@mail.gmail.com>
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Thu, 27 Aug 2026 00:07:51 +0800
X-Gm-Features: AcwNN1Xa_upYQ8xLBB-nlAO59uqKGOulAkiKGtTDN8aKq4iOOwa5PXp7uoaS_Ik
Message-ID: <CAJxJ_jgihBLy2mbPAN-uqup2mGq+hurKkH=W4RGo4Ad0Eki5sQ@mail.gmail.com>
Subject: Re: [PATCH RFC v3 2/3] mm/zswap: replace the zswap_pools list with a
 fixed pools array
To: Yosry Ahmed <yosry@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Chris Li <chrisl@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks for the detailed review.

> I think the reservation logic is self-explaining, the comment here is
> not warranted. Especially the idx part, I believe we only set
> pool->idx here to keep track of the reserved index, not really to do
> it before publishing as publishing happens later. If anything, maybe
> replace this with a smaller comment to the reader that we reserve the
> slot at pool creation but only assign it when we make it the current
> pool, with a small explanation of why that is needed (the actually
> issue Sashiko pointed out)?

Agreed.  The important part is the race from the v2 review, where
zswap_pool_find_get() could observe a pool before it was committed as
current.  I will shorten the comment to only explain the placeholder:
claim the slot at creation time, publish the real pool only when it becomes
current.

> I think we can drop the assertion since we already have the lockdep
> check below, especially because it uses BUG_ON().

Agreed, I will drop it.

> Hmm let's read this into a variable first then compare it to
> ZSWAP_SLOT_RESERVED instead? It's not very readable.

Agreed, I will read the slot into a local variable first.

> I think this comment is unnecessary.

Agreed, I will drop it.

> Let's drop the assertion here as well since we're adding a lockdep check below.

Agreed, I will drop this one too.

> I would align the second parameter with the first one if it stays
> below 100 characters.

Sure, I will fix the alignment.

> This doesn't really explain why. Also, does ordering really matter
> with the lock held?

Yes, the ordering matters because zswap_pools_lock only serializes the
writers.  zswap_current_pool can be observed by RCU readers without that
lock.  Publishing the current pointer first would let a reader observe the
new current pool while its array slot is still ZSWAP_SLOT_RESERVED.

I will reword the comment to explain that the slot must be published before
the current-pool pointer.

> Is this a pre-existing bug, or why do we need to hold the lock here now?

No, this was not a pre-existing bug.  The old list_add() ran during setup,
before any RCU readers or runtime compressor updates existed.

I added the lock only because zswap_setup() reused zswap_pool_publish_slot(),
and that helper expects zswap_pools_lock to be held.  The setup path does not
need that locking itself, so I will publish both zswap_pools[pool->idx] and
zswap_current_pool directly there instead.

Best regards,
Jianyue
