Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333208;
	b=fcpmqX3nSSnYUGSBU4rpYBDi/qh6OJFuRlekpVB2ARXnpNu9LY0xVWqCMiM7UNE/2j7r
	 OQGvCZAVmhSm2SLN7DUr78aYaI5/cVylRL2MHv0Nc8RUATPzmpG8HhqPwv7m/otqcuWPC
	 D6zeqBzLZ7+jNEF/wJoju1vsLr+1bfNWtLvtBVwIz72vkBQdxImgqUGtSrkj8VX9vDa4m
	 XJ/PFzZIlfIOLSZmqCy9ct+n7LrUgNkqsBoUm2DodtgJsLtfy8J8rX9yVTzRFdfvnWmkm
	 sd8oTZlXzdxkbO2VR+5BwX3I+Hdin1WTB0y3P+0KZEWnRkWjKwEKduoNX7cAEHkFfkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=OD5cDY/EEXuw4DM9TicOzIzvxJs10BmzW2QNwQhu1nQ=;
	b=ypzxs5KrzjmBdpsIhOgGrKY/lIRFk0AyDZBStWkrbZgi51EM9b7FbCmk5PFTX+7vrH6u
	 9kQKCpzeLxJdkNWVnkqsKrwQKAMXUXanpFza8SXFjzjPUImWnU5Qwg+n6DOJ8HGOcEzTY
	 KitWPZrLhmGsWYep9qZZO4MXPJS/SO7rtjWji0ZHWTVNSAJLIOlYqBCLgsyXFEpgUu1u0
	 9qsDjyRSuW1RIMVSX6TakFSwlYQbQg5vfDz9sFEwcQNwUqISpK15SIzuHnj/G1gUlTYuh
	 Xb1blFFNG/rTO4kmnePFx7Ovkg1BUbzK9eJ4DG2rxnTjPHqCuVsCgh78VWv3hdgD1KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=QO67sRQc;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8494A60A2627
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8494A60A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=QO67sRQc
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c506094fd93so67070766b.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794333205; x=1794938005; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OD5cDY/EEXuw4DM9TicOzIzvxJs10BmzW2QNwQhu1nQ=;
        b=QO67sRQc/F9GOOubFNOTdhUY0L7rrjJn9TvOFMFau9bZ6JyLa36MvY/4WJZlPVNh8L
         FO3lTQBbwVQsQNdcOM/ISpiSdubGSK852XTvnAaUXLT5lkBPIxkjSiXav6EpoW7oA2rv
         pqAmumELeKgVQK0j3Vk5Y4Jz+eKPD6BxsyCmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333205; x=1794938005;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OD5cDY/EEXuw4DM9TicOzIzvxJs10BmzW2QNwQhu1nQ=;
        b=LV7Nhp5I5GIim+e3DgdpbZLvLcxOoJraKhQEUhmu9zr/bBjvsElADKKw69nDqvdOY8
         8SwboCmj1HhERZ9/jMkllAUFn5vNqrFW4lyzfU6bAKnLSy3F7XcXZ5FVmWxMo+JrzMM8
         F8MO8Ri+jT3xmotCAJjxYrpaazmHmV+Zz+1mQcibnzJDRyhoCsmEwbXPc9uyh5sFGeGD
         AECJumdevNuicN3hUzRm42UJJuVWRhIg2590LyKfWr2im59FO5JDy3M8pi9Y4tXpOwl/
         myQFGHUgJeZ5TO/TEH8gz4ExVywILvbwTTIiOSusHKFv2G8rX1QGIlyJOwbzKx7xycz6
         WJAw==
X-Forwarded-Encrypted: i=1; AL+hErH+ubKckxfiDFqxFddhlsO/xFvdooartf3CkXM8bL+mtXGqyCz2Ajw/aK/r5k7PJDPro6VxNr0tP/blaXw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FYvigA4gEYX/ajipGhgygMo8vhkpGPN07XMl1U3g71FYL9OG3
	NlNS6u+dxVzMg0pPK4jv8QP8cREXlKu4lvS92XE9b+J1k1BnqwuBeFMqcHf7+yFP67kcuQ4UeSW
	TOCln5OA=
X-Gm-Gg: AYBFou0ZmDAnTyU/c0CvNop/AjV+jFgd3emiNfo8sWMHCz8A9Y2dj+GU0TZCfi+n5Ol
	s9JKCgXt0lnE6ZAFe2fvBYQswg9JOv+abhamOFD612T5qCZEUQhLo52ztw0FGCAdkkTcClnvqU8
	IxuggbREMCbjgioTNIUWo5k3G9wJ2OUR3+3Ht5UWaKnvMCy9OBn9hyT5LGsDxmo44cvZ7SxK8K4
	uq0dv7PAhhZic0FzUJA9XLGBLuUfdjFXkcGYsNwNyaOAej0DRNf1M1PhXCsbm7SVoelMhXIdLLx
	pbVPBLqNzduwX4RVKrn1EpIiBu7ASS1XxB9yNyfW9qWT3z0dLzEY+TQqU7l9PK65LRigBrr+HfK
	yzIkcXwdyCEmI6skfwJ8YJwMoIjwkfoRlFOJrLsYHRX7g5VRLw74vyyuYzwGR1DZ4dRtr5IoS5j
	HMzPDgswcb8HAmlHxwE1P3y6WYaUq/pdLGn8eEO8ZsK02vFMfKxKlv/rKyVcEvBobqlLb52XREN
	oLLv3VDge26IifN2aByvdplOJ+2nayFFWJcLj/KplBQMoJGAeycOkL/058xsmyezvNZVnh1grEo
	B4Mc5kE8mwXAL9IRdqKi/UXsPVEB15fd6BlxnQYbgi53eOzg87qCwQyQnatIy4LPau+XFLlsNTH
	NZ00=
X-Received: by 2002:a17:907:f448:b0:c3f:84aa:af0d with SMTP id a640c23a62f3a-c50495703femr282601166b.18.1794333204687;
        Tue, 10 Nov 2026 09:53:24 -0800 (PST)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a64f888sm139223966b.66.2026.11.10.09.53.23
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 09:53:23 -0800 (PST)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso363176366b.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:53:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF3sVxcd19t074aIvsgC29mdPP+Ks/qRWXKYLA7SWJWkBYjO6JIV1N1eI7CDBjnmPpVDGdYn8JoXCbI8js=@vger.kernel.org
X-Received: by 2002:a17:906:eec7:b0:c24:4128:c19f with SMTP id
 a640c23a62f3a-c50495452d4mr284411166b.11.1794333203501; Tue, 10 Nov 2026
 09:53:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104222806.1826508-1-usama.arif@linux.dev>
In-Reply-To: <20261104222806.1826508-1-usama.arif@linux.dev>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 10 Nov 2026 09:53:07 -0800
X-Gmail-Original-Message-ID: <CAHk-=whPF8CD9zC960jPUi2rMrJ_pq9ytdSYqWoef-R6AHsfXg@mail.gmail.com>
X-Gm-Features: AclHuK_YBuVUu8dldYSH0xy9GHb-ZW0uFjYPGcJH1YUucefKxO_Kk8UxiibHCPE
Message-ID: <CAHk-=whPF8CD9zC960jPUi2rMrJ_pq9ytdSYqWoef-R6AHsfXg@mail.gmail.com>
Subject: Re: [PATCH v2] x86/lib: Use REP MOVSB for large memcpy() on ERMS CPUs
 without FSRM
To: Usama Arif <usama.arif@linux.dev>
Cc: david.laight.linux@gmail.com, bp@alien8.de, dave.hansen@linux.intel.com, 
	dsterba@suse.com, hpa@zytor.com, linux-kernel@vger.kernel.org, 
	mingo@redhat.com, terrelln@fb.com, tglx@kernel.org, x86@kernel.org, 
	kas@kernel.org, hannes@cmpxchg.org, riel@surriel.com, shakeel.butt@linux.dev, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Nov 2026 at 14:28, Usama Arif <usama.arif@linux.dev> wrote:
>
> +       ALTERNATIVE __stringify(cmpq $0x20, %rcx; jb .Lhandle_tail), \
> +                   __stringify(rep movsb; RET), X86_FEATURE_FSRM

Let's not do that.

Putting magic things like RET in alternatives is just a bad bad idea.

               Linus
