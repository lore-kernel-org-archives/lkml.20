Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794867264;
	b=rFeozxUbocIDLh3DN0Q6msikw6gk1wyeSISagbnulOgs7mXpOLVi1YKzupfoBWJPBzgM
	 0RLmIIN+YOv9IBY5TUiYpp4lfHWJSeGWkWXsS3l1aS0NxLGmmu5jFRqCtFOQSlYQcHRLx
	 XMb8Ua9tEDJwzJ7fxbbOlVkC/efmngc7bYXwQClUfvHNUri9j6ZO6j9DMDIJfGPTKr2+O
	 A3Tngu1534u0ga2XgtzZ0gW/CRwrqy+wWyiliTE+69tkqTvEONZbvmwpHEv5Mg+ylE/53
	 2rVpumHa1tp2G5tBI5lai7rBm1as6vDM1eyzg/TZsTllTMi0VVLAaw18F+BNTJLe+QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794867264;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=OHWSdKyMsFGERyYaZ5X8roMwAxwTPbXTa9d588Vrarc=;
	b=PVMDFB9/LR9UjcN2Ltsbnw7G9sZnWrrDSxSIv+q/eTL7bgN/gezAGm5bPOGx4V/8Vu4E
	 7Pmw0Z+YkAHoN+LU++amkT3qsNyxZykVBJO6D2nhO7VlJy7oRoB/O+sjEhFzShLGSVHeF
	 cDw8foD1Zm1RMfdLa9F/KY6PYdfav3vfEkl2iOrC7fgyH88FrUUIf6x4zhUqChH9LSKui
	 BK2r1zPwuDYa0EwWN88jGU4UFbPvOtgahs1aG+gtfckHYhEG/cnk/qmZLurwareTL+cGD
	 lWMjZT0T4ddoHTHLGesfqcdziBCYEoWFsYa8AlKHGlT2MXUsWGWPZpaYPQTbl5IYJXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bn7G40PT;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2573606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:14:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2573606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bn7G40PT
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so4216206f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794867262; x=1795472062; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OHWSdKyMsFGERyYaZ5X8roMwAxwTPbXTa9d588Vrarc=;
        b=bn7G40PTdP5DIuspwL8Lcuae/ZYiqiq4pdYaNcCLNaagZgRcXddlWADxHt1/1QXlaV
         +WTvgMec/FEttFruOqRpL+d/CrX+8QhznijNDikFz02S03PIaJq635CCfohMgC2A8uXL
         0CKRmCULq3hGkuIa5uN4ESSomXwcPqw7zrzsxVwehqxZ5OZ3dKZLvxN1400G6dl6Rg0Y
         /EE9mCYG6MIsUVqqrHqkKqzXDhYS/ohdRGjedmE6ouI8cAzK2CDw7uifWgg827yw5lq7
         eNioAXsnDR35ISAcdamY7xxqqTcHdn3pWeuou147ek3IZEKsZ0UJ4k8vVhbf4KcPYqEW
         tOVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794867262; x=1795472062;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OHWSdKyMsFGERyYaZ5X8roMwAxwTPbXTa9d588Vrarc=;
        b=PpY9Tau+03+BB+oUT9uCFgQ8NmpC8mXXD3D49Xjfsa7qY4FYq1G5lpResW0R4TnxhE
         1V/Nx1M/rR7E4zhyB4BT3hOmgOd09LIS9rr+VI91UzRi8kQEej9ZsMmRmrtprmUuQSja
         ZLY2iSpu7LeGQ1lIecQKh/ZOrqz/DrtcM4ttyR03KrgSRrCjoewQuPfu21ZFDM65ihyi
         /tRSFFENspFBYodBgsFx73LcrfyXx58Wmp6mCxFARJN5r4BwSBOnbiyP8ukM0PkH7Ilz
         BiXPQpUzzvSIwyL+IpF6rkAW26Hf6/eWg4oCCqNGxyIbb3yOEgRovQ+dk4b4XfLdlSAv
         rsww==
X-Forwarded-Encrypted: i=1; AL+hErGznEZh71m8lij85xGyUI9j3L//hVd2snn0HyFzhJOMSCB6h38/DYdBXIci12XjsqdyWFYiLqcaMwnKyIs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oZystEZq+KwHO6FfEmdvIRGEYYBoVecPYYUOq+qPJyhtW6aPb
	qsZ3KYTm5RvlZrsgetc8821/M3Fc3NWUDiNJaxDOCQDHpvL3iuGGaOtR
X-Gm-Gg: AZFdTZf4OibuLs2dIZSli+bC5+g+b7tg+5Y0wi18XLbiHgfCsKKlHcNekLejC0wHYM8
	S/Xdt4qnFJHM5NK8INP0KEKdYhkAZp6r9ijNdjJEF3b/IYS1s/VibtE6VTZ2zb4t2BM4aAnIY4x
	9KJ63usM8snaUqDx+o/nNz8/qe3ZOmRpjD0m4TaQhy5lu4kxOdctXvSGzsJxSipgupTn7/PY6nO
	bUbblIeGXllC6nygyw1/NDsPn4TzrQh/uk/TIqim84HifWu27s7TH2IgQJ7ySNDIUQgvHJvU7Xh
	GY2ZAP16H1ZbTF2msSlmf85+1FsHkuaWg+E/u5t9AZUYBr/caDAozJQvSbIjlZEk0KRTrBQUsmA
	ILXMvu2Mz8Tc3jcGihDkd+1NOX3w+OUn0N6x3+trClq/cU7ed4QpIaLHUInqWJItvxtPgZ1fnsK
	TDu0MbLP9oVUba5wMS7dS1xf6Qa6lSlAoYY0vjunxp4rELJSoNX9Vwaj75WWPPKRiRDlUa7ZYv7
	vnJ5Rt1LJk9vS0oGNdsIXnYxPj3AqV+CwxjPQgcai2NBnMtIa1SB9dnQENbcMpKgiXbq0xV0GTS
	7xeO8VV+mxuHEyYoDu9SLC2wep9lRIm7fBYr4jcHQY5oPMOUlkk8Dt8ddkUfzmFkOz0ywKuKldY
	GF2nLZrfVV+FO
X-Received: by 2002:a5d:5f09:0:b0:48d:f730:bda8 with SMTP id ffacd0b85a97d-49c733510e7mr23688407f8f.50.1794867262185;
        Mon, 16 Nov 2026 14:14:22 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c69406640sm24099098f8f.12.2026.11.16.14.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:14:21 -0800 (PST)
Date: Mon, 16 Nov 2026 22:14:20 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Miroslav Cimerman <mc@raidlab.org>, Song Liu <song@kernel.org>, Yu Kuai
 <yukuai@fygo.io>, Andrew Morton <akpm@linux-foundation.org>, Li Nan
 <magiclinan@didiglobal.com>, Xiao Ni <xiao@kernel.org>, Ard Biesheuvel
 <ardb@kernel.org>, linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] raid6: use normal stores in the x86 x4 xor_syndrome
 functions
Message-ID: <20261116221420.35ab3bcc@pumpkin>
In-Reply-To: <20261116210440.GE229817@google.com>
References: <20261109030805.25709-1-mc@raidlab.org>
	<20261116210440.GE229817@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 16 Nov 2026 21:04:40 +0000
Eric Biggers <ebiggers@kernel.org> wrote:

> On Mon, Nov 09, 2026 at 03:08:05AM +0000, Miroslav Cimerman wrote:
> > - The sfence at the end of the xor_syndrome() functions (x1, x2 versions
> >   since 2014, x4 with this patch) is no longer needed, as it no longer
> >   orders any non-temporal stores. Removing it made no measurable
> >   difference. I am happy to send a follow-up patch that removes it from
> >   all xor_syndrome() variants.  
> 
> Removing the 'asm volatile("sfence" : : : "memory");' too sounds good,
> but be careful: a lot of the inline asm statements in
> lib/raid/raid6/x86/avx512.c incorrectly list the memory operands as
> inputs only.  So, technically they rely on that "memory" clobber.  The
> constraints should be fixed accordingly.

Or, at least, put in a barrier() and a comment.

David

> Also, ideally the 'prefetchnta' on q in the x4 xor_syndrome() functions
> would become 'prefetcht0', to match the temporal stores.
> 
> If the scope of this patch is just replacing the store instructions
> though, it looks fine.
> 
> Reviewed-by: Eric Biggers <ebiggers@kernel.org>
> 
> - Eric
> 

