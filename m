Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E090D4CC267
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788536422; cv=none; b=mcW8h1NgaYvoKL+gaLhRUyzdA6W3b+DXpDqmWX2nUV6S4H6YlVi04aZzwKaKf9Kw5OoNe1CTVqYzNMR8Mcgk6kVkdNvQTu6M/f4b9FKLBOYsrEkvQT4FL+5u7w/DWIuJ0r17QI65iLIaell/9NpPWHVY4S43oeCc6e73l1lgkS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788536422; c=relaxed/simple;
	bh=xYbMXCPMe3RZhKbJlqvChWoA1kbaI/iPWzSCLbwYl38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KAJVAm05aTU+fzyg6NTwfPvkw1gpWIolln3cA3gx/wCF0MPKCK62Dv0gYO8V6fwYd0lWQpA70Nf902ug7+TSEEO8CWTLHMv4kMwIR2XA5P9fOh/X4lp8qzYbMAE+yvnOuU/7i86gs4AIOFyXLPWVfXzxjk0Su0np6UqpkfkJwTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=a1vAo1AH; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="a1vAo1AH"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ca80d708489so884948a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788536417; x=1789141217; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X7yoqQc8UwggaDf9anfhPF7JJf+lXFeKNKD/poq+AfI=;
        b=a1vAo1AHiFbWwDgNxV+sOJ9hz5URW4Sfe0sBaiPUThaJ6Q4CdCpzn9n4rBmYIZU8F6
         bMAeh7YyZ1C4UoabQMl3BdD9wcsZiXYocwprZNI2bvc9V5KSCUOhaxp9LgPFL4YT2D8z
         WNcOD5l5h5e+Y4KXgQPy6ATcl+uZv8bSY/1iM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788536417; x=1789141217;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X7yoqQc8UwggaDf9anfhPF7JJf+lXFeKNKD/poq+AfI=;
        b=OXg3vJF3eNaAGlB09sw374GXUGlIv244JZNea8uguQXGRBQ41oWvDaXVFp1bwW8twd
         FEonGomeOKW/RG+h7Xp/hj7nsi0EpYPRVEwMyL1mYncAeVQ3EVtRk0M10viyc2ZU321H
         YncymqPlozlrJzDqFSDQ7NP25OYm4QrwS5MlsLYL3e8BaugemD0ufalYtAW6/SaIwEMp
         zGWEjUJyfzVUeNpoQSkqPsnW5VdAN8VdLsZ0DE/mDU5aSzvxJbqEoM+8Vj7/f6eOMO+M
         AT8Ylbs3HT7+ax8psWNFLtceFRUTO14R58J1Qj+y8EaxGqco/+u0xeBgz30mhZyB63Ax
         goDg==
X-Forwarded-Encrypted: i=1; AKwUvBwrejtG3aYEppbN4UyNOz8Ukv7b63/kHNU4iuM4L3DJAtmtLWU5SUxYvZ0MXuOfunRDHbgdkS2NUpAPlUA=@vger.kernel.org
X-Gm-Message-State: AFuF++kwXj8ZQONVw8KdZkIrB48ISEFL6pqQ/Sl0uSmLRlbydTuvxr78
	CPcAdLWaBEIqwNuqxtpqjU5TYqS3Ogtz47tpFe3OEntLFcIrbRigfY6zNnQFq5GcJvSQBL+1tA9
	oqXriiYg=
X-Gm-Gg: AYBFou2JDf6IZRfAJVZc0vROdSQJmhHdNDyak5vUDNG/2uErYvW0DB0du9+lISXP/wt
	O1IRdqmNb/n3MnMs5B0UTdFe6zTU+L2ddA2pkXA+LucNV7QDDaPuUz1drkToSPDKvAg+zbiGIsZ
	3H6Oz9he609RwKxlA3W0adjpsV+dOzR52hjb6Ly37EfAvsqe+DHn47mbXCTai53vCwZGOm3l71u
	jlv5kqaZLEsJMucKFRiPVbzNszvhYV1oEgtctV7gqBBOG9x0rXPhmOVDBZ152BJgUwVxaejOmrD
	wxcDH+OnKXfjfYCfP241ccODbtQPvd0QGql0hZGm9Y1wSQMvflnJr+GV2A+Usd5N3Fy35aDENWz
	rsaIi4C3tVZodv1db+WfsH0BMYpNq2W92Ny3Nw/JHxiOUXwiWyHcFiDllq8rde0WBQ20k1HPETH
	izNb6f7pNN7mUKVyJa3iVbV2wO4vU7kAKQ+/UTrD5VHheJz7eU+ab4VtkIZlCl0Ne6glMKsgmiv
	x+ItbzkjVk4MS3waP4Z8A52jeqQ68S0si2a6Ee7Wg==
X-Received: by 2002:a17:90b:1d4c:b0:38e:6d55:b1a6 with SMTP id 98e67ed59e1d1-39b27c121dcmr4941474a91.3.1788536416672;
        Fri, 04 Sep 2026 08:40:16 -0700 (PDT)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com. [209.85.214.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae8ccdecdsm4834548a91.2.2026.09.04.08.40.16
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:40:16 -0700 (PDT)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cf452def93so21470785ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:40:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzbwabuZqVR3M24SI5h+EDAV9D+rbcZQeUb2Wt/ygyuisihShu6ukA9+2ctUkSSbSDK+FpbhBLxzexnY5c=@vger.kernel.org
X-Received: by 2002:a17:903:234b:b0:2cf:b9f9:18bb with SMTP id
 d9443c01a7336-2db1598ef68mr51898325ad.4.1788536414847; Fri, 04 Sep 2026
 08:40:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904082741.578048-1-ubizjak@gmail.com> <20260904082741.578048-3-ubizjak@gmail.com>
 <CAHk-=wiKvgXTJAXveUoWq0+Wn=E5255-Uc5ZzhXDgk31iXEZgw@mail.gmail.com> <CAFULd4aynHJZ3hUbXk5WuyreNDE5D0RppiZFsGrYmQgiaqvVAw@mail.gmail.com>
In-Reply-To: <CAFULd4aynHJZ3hUbXk5WuyreNDE5D0RppiZFsGrYmQgiaqvVAw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 4 Sep 2026 08:39:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=whYAZQXQ4X2kDjigwhE5W7qwYWR3pHnP-67ceYChqJzvw@mail.gmail.com>
X-Gm-Features: AcwNN1WGSRPzlFtuVdh8tpxh7EWsz-5lovSPjmYQCaWK3SEtK_VBpnwo5ZJNqgY
Message-ID: <CAHk-=whYAZQXQ4X2kDjigwhE5W7qwYWR3pHnP-67ceYChqJzvw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] compiler-gcc: Remove obsolete RELOC_HIDE() macro
To: Uros Bizjak <ubizjak@gmail.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 08:30, Uros Bizjak <ubizjak@gmail.com> wrote:
>
> The cast to (unsigned long) should remove all compiler's knowledge
> about the pointer and force the compiler to use integer arithmetic
> instead of pointer arithmetic. This is what the generic version does
> without inline asm.

Yes. The question here is that word "should".

It's not clear that it always does, and historically hasn't.

To clarify: I'm not against this patch. But it is potentially
dangerous and could expose things. See for example:

        /* RELOC_HIDE to prevent gcc from warning about short alloc */
        ptr1 = RELOC_HIDE(kmalloc(sizeof(*ptr1) - 3, GFP_KERNEL), 0);
        KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr1);

where RELOC_HIDE() is used to make sure gcc doesn't do certain optimizations.

Is that code pretty or valid? No. But it's an existing example of
people using RELOC_HIDE to hide things from the compiler.

               Linus
