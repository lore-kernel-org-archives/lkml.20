Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C536384232
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792041730; cv=pass; b=hl7JE8XCYpo25FS9MXflzmIGwxUtz7Uqsn+xu1sl7g1M+OalsdiekTtd4vZ0ZH2+TVWGXxmVWQ9qVryDHLlQJ3kTc5SW5lrNVdIeT8/wktZd0EHDzH0Q2voTfg3iCrN5u34le06qQYaLFJqHQi/cEzIpxmjK/3Zo0uW/tCONxHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792041730; c=relaxed/simple;
	bh=LCA5ygrhxhhkIA05plaRNBxJfo5PazKMU7keUhXUWVQ=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fPK05CYcjOrTCg7NkPqNzUfipg31IQ/xuAtS4IHOSp7aK56SlxAb9vWnwvAQRkmi81kxl0+mY8ywv3E83l5oBNFEvIgu6+8AxEGgqgT8AG2EV9WFxd0YxL9Dw/KbNfWtf2yMX2eEFaJtJ9bnQ41tXNfAW9fzBatIsScv/w7yY7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trukhin.com; spf=pass smtp.mailfrom=trukhin.com; dkim=fail (0-bit key) header.d=trukhin.com header.i=@trukhin.com header.b=AgD0ODUC reason="key not found in DNS"; arc=pass smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trukhin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trukhin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=trukhin.com header.i=@trukhin.com header.b="AgD0ODUC"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-4932b13c4ccso713584fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:22:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792041728; cv=none;
        d=google.com; s=arc-20260327;
        b=JYq8X2HInZH+45ye+Nqlt6ni8OpK//sXfbVs1UHF/E75p4tRq4okIrrlX1CI8mmphx
         2GXHo2JKvLt5zAakkz2zTIpxwGuTqDc+ahvRZsUE1UPOxUKGEeGPsQcOiBZKflXfs5zQ
         D+jpoEz2Mk9VFTD7EdoO1bCS7qJbk01ubOZnGzJiJwtNX95d/V3mNhKzSuqE/eJZ4fi8
         83thnHoyFQkzbXTUDL0gaW4RgRe9jpNkRRAiGoPLpzwPhLHcw/o/5wZNjkQee84OQ0iW
         DHiWeV2SwSp/VUz00SedpyFppgQVL5VJg/3dGAOLRTYmWxOCd/pwcri2+PrI35rB2iG2
         rzxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=LCA5ygrhxhhkIA05plaRNBxJfo5PazKMU7keUhXUWVQ=;
        fh=q77w7CZhYRKzkP/6OGCfUn6qkTXiODcGolxowh1p18I=;
        b=rpHe2hqZxpOg5vuJlTbU1SpCxS6fYHVCGs1flZQKfHSeEdGy/3grAjemaNDXrMHsK+
         PLKIEy4uYbUCHPi2lGHZSN/Gafbc2DZhRCgEuR60Tw75x5dS7+MLu5lN/L/6j40ymm5B
         TTDmyCibRuz6dwBeghcMoPAim+6zZ1aeS2E854g29iaC+v95dg9ZwMn3YnJi5SjU3pkx
         +CByp0NnqgkPD/PEhFJwj6PmPigZqBRWSrM9pDyXun9SVfu/32HRMlXZOZnbXyVjp2Wv
         Iy3lkxA+nCLB/p3+mzd5jjdOrnyJ3mFo9ksaP+20V1swdER3Q5ONziYdE0qWxa0joYys
         A2Ig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trukhin.com; s=google; t=1792041728; x=1792646528; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LCA5ygrhxhhkIA05plaRNBxJfo5PazKMU7keUhXUWVQ=;
        b=AgD0ODUClZW46Cgwt9+DDfkEeVu66OdbfsP4U6ib6YAn8jyX5x1u8yKqQg620Vy8AI
         h3PZZKAddnwGDsWQ0pIS4jkr7y40oKykDK2wpR0g5u0s3gXqIxmd+SddxgxUP2dq6Wec
         043jCUd7rrREoInBlP5nzXfP1k0/7yAZ84eE22dKuDjRCtzHgCFvF4kC1ZcoyBfnGszR
         nU8/B74my+KsIxhbOie2kzwCV0YKslyw7ShE+WvIHgHJ/kN7vG3o6nFqMZX4952PfUdu
         dwD5gJZUNM9SKv5S75yRcEgDE8LnLDUk+M3erz6IxLCqu0GQHpMJy6piZchVAHBK2Yu+
         84nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792041728; x=1792646528;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LCA5ygrhxhhkIA05plaRNBxJfo5PazKMU7keUhXUWVQ=;
        b=yCL9VOA6w2lJaG+y0HJian3yNgmdd36RLYVZdEmMa/nTk6uEZ4MQDBX1tqUPSUWlKt
         +pIKe/RWbc65U0Ws4hbWp556IJsH+W3wRKOHXxMgqkJGySJMHrgKKs/cJQO6g9U4U6Tc
         8vQPB2syFlwNM3DZiaymdIL+HcWT9142jLM3S24eAsDio3HvjHW2k1aGeNlCoyL6Y/6s
         JVuiSHRPs8EmxDzAwYK4608aBatq7qmiwlcwFCMHMMop9yroSy/WIScYamAfZwWFFMel
         hYG26f7THQgtm6LipKkYHa2mRo7daO18BmQrAbjNhrOkAi4+49W+keDCNTkBLC1FyT8o
         K4iw==
X-Forwarded-Encrypted: i=1; AKwUvBwQGalAJ3KJMxNlNESLF6LzW3hl/sq0Oy8+KsJOotzlS3pLQgkA9iWlfrnG0gwLjvn61m60Fg8l+C8K2XI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIybKO96U1pZraswajzNzS2VsMoxxrWYoJdC9hGKIqeyWAP9JpB
	CBwp+A+kycEEf3OBfbMfSbDMuvv6y7HPV6HmZ+i99X7B8mkSoMwm4qfa8R35AwgEaBDf5//2lPe
	k15NSyjiGRUZhZjm5f3F9oHcu5cl4FFIyv/P/ddE0gQ==
X-Gm-Gg: AYBFou07znev6r/pmP6s7Wpfr404PFD/AbP57F/3Erob2dWPXkRwG6n15QU8WB/YWNG
	NddN0W79FLYX6FZD6I2lbUbU1zM0KxHGJp7B0g2BcshN63guH2dbOFM0LWY9iFgeQJDcTbgnp8D
	rtZCCJjtiCrsd32n+XtnYTfDFOgz2casSFU8UMbHQ+kUcNIwZGCjibcVNQr1PWgq1/gqDvM4rkQ
	vGiwudHYLISROyXXyyB4VqDT2JHMCFqCzTXu6XM1U1o2qzqMpV3Ot6rpHA5Jg60KqUyhni56Cvv
	N2NE1pcNIv+S2KSHagCJ+MF8s7D1Lmp3CZ1NJ6vLd2Q5dqEWfHVkrFKxZzKRnlnxe7K/dfPMRs9
	IZvYtrRqQlNek67WY7hzedIA=
X-Received: by 2002:a05:6808:50a3:b0:4e6:a21a:8c38 with SMTP id
 5614622812f47-50c53c90338mr16422275b6e.39.1792041727716; Wed, 14 Oct 2026
 22:22:07 -0700 (PDT)
Received: from 121308794542 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 22:22:07 -0700
Received: from 121308794542 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 22:22:07 -0700
From: Iurii Trukhin <yuri@trukhin.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <x4iu6sii7fsxksdfur3wcpu4kb63eubsp5d6pzklxuhta7xtj7@rskyoy7ajncj>
References: <CAOx7e9Jm0N9O_ndL1UApMPrXUN=P4RiptSNibdDP+9prUsNPOw@mail.gmail.com>
 <x4iu6sii7fsxksdfur3wcpu4kb63eubsp5d6pzklxuhta7xtj7@rskyoy7ajncj>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 14 Oct 2026 22:22:07 -0700
X-Gm-Features: AclHuK_bFzbfGIRxfiHxQRAWNh28jgXvMZCZ8XCr7vR2oiT7mhNNzw5OJD91xM8
Message-ID: <CAOx7e9LcNFVS8K4bBngeYEpJTXFwADA+xgw6f8r6Lh2ms-3u=A@mail.gmail.com>
Subject: Re: [PATCH] arm64: raise default ARCH_MMAP_RND_BITS for 48-bit and
 52-bit VA
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Kees Cook <kees@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Iurii Trukhin <yuri@trukhin.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 15, 2026 at 10:25:49AM +0530, Anshuman Khandual wrote:
> ARCH_MMAP_RND_BITS_MIN still gets used when VA_BITS != 48 or 52. But this seems
> like a subtle detail. Just wondering - should a comment explaining this default
> random bits fallback sequence be added here as well ?

Agreed, since arch/Kconfig includes arch/$(SRCARCH)/Kconfig before
defining the generic config ARCH_MMAP_RND_BITS entry, the fallback to
default ARCH_MMAP_RND_BITS_MIN in arch/Kconfig is not obvious when
reading arch/arm64/Kconfig on its own.

I will send a v2 adding a comment right above config ARCH_MMAP_RND_BITS
to make that fallback sequence explicit.

Thanks,
Iurii
