Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DC749EC61
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 18:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788288330; cv=none; b=hxXzDbZt2dqzwy9GMU5NBYCLg0ISMvefMvLiyl7v1JIkxKpUQffxVJ8iWOoITMan7SOQFO7r73GfMw3NtEcIzRb+xpmD+I5GUe1gyTwD2RS83OjtegUAORKwUCrR2kj0uCl6FG05BF2crs4058e+GQXrhMVE3Utv96Z4wMV0xMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788288330; c=relaxed/simple;
	bh=zAHaElghv/mnyrIi5H17yyQjP6+TuWg+fvk44KIvNRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mBZLaw9zYKYSnPsD2t4o+ZNOs8iv+f4iLPNkoGp6W3OXQLVgbI02cjypqvm+oOAF4qgVgwlmbJZwS5BlbrkMaGtogOVZi3x8i+JyF8ftPS15X/1GLrVvjPtFTrN6dTSXdOIvavzZmFNwF1BLtMY31yp8B8A6/tx0SfjLNApdjrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=aqNJbqgm; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="aqNJbqgm"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2530cabcf4so16068766b.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 11:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788288326; x=1788893126; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5dVe/hyBem5i0vsuJzgKNH257Em0xb2/4208x6fmj1w=;
        b=aqNJbqgm7AZoEEuQ3SDsqOnlqP+pIzJIR3chySb/h5WsMfVm/hb0kVymWAnVRjV0hF
         KRIoEQ9eTSsCJUpkOQgLUhUNUNR0+3DTfeMKBAONXr7OB7+xiW+2gwJLJJgSQ8rLZW/E
         UxcbyEQ+cGBvYVbccizVbo7O8ciC+9zygU80I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788288326; x=1788893126;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5dVe/hyBem5i0vsuJzgKNH257Em0xb2/4208x6fmj1w=;
        b=Rt/f1mE+pIpLiF8myiEYns5Y/dmE0wwcIBUVe3QG/oEOmED031uZgW1KNJ/rjfdjcB
         sxUQ7E1lCjmgHM+ViFrlsdjmGoq/99B6UWKNmbdsdOxfvv50wdwR9O2yezW4cz5awSaW
         djvrqo4mu/Jof3GzVVZ6tozXGQOul/DXjUb/h+PNK5gUxBA/8LUQNKH0nso56L7Atcce
         KKyUSwPYt4LCxXN1+paWyaNBZm+YskdN/wWxIkrzgYZ0/nvPdQS3hnhoBqLuaccqpVs4
         aNpbka6E3jSII4KKpuPRAcNDDpBmvWTvcqIFNdC2emZbMk4VTSvU2dRmHz0vHq7pDxLg
         tbfg==
X-Forwarded-Encrypted: i=1; AHgh+Rp8nUxRLazuQ+4fFQtQKxUNWqic4uyPRdGQ0+jGyXwDbMsOrbxCg8m9pEYMwaYBuRC2u88uTeA4q6w9WtY=@vger.kernel.org
X-Gm-Message-State: AFuF++m3yAHMs/Y5Lri7mFuUFVbzVlTjL64r0DV8vW6Qsv8HcXgirNOO
	4IFc6WMH835O+oVsg2zBy0AvDGhW5sI62X8ZPNtO/32WNo3eIMM9hAmu8Z+IGWDk3yFdrD6VDus
	6v0zmvCk=
X-Gm-Gg: AYBFou3ds4GCPfzY9aDbWc10bmB1Dyr90MKaOuF1ih1kPC84tcFFfhoXU5klRapMCpw
	3s2hGK1FCmYSnzkj7Jrmg6H3z4Eo/zHpZonGlMh58ElvTZLLSq2b2mY4RIWTOn8GZDnBH32Ebsh
	25DVMi4xCyb7i+V5EFAfCx65mtw9HZRrDjRSAEDfvZ+vDUyb/Xz7U1XacEG9iazBMWMMg1zWRii
	3786UD0/xE6pMPC6WhqJAxFyvJSj0aocuIQ5JltbO7WekvmYzbCzJfBCICy7BxpAc8AS47uONUK
	mZoL0ORnJiYRMp2EE7+vuq4VoTdkYBmvyz/sEJr+WKpGWPO9kBtWwBswPweOOvGMepppKVa5C45
	sFoBv2HkkIxaO93godxoRz9KPWD4+jpz25ANAJGBUXGQncJ5Eft0I6t6yOEks8DAcrq4cZK9Ai0
	lMpYHwMo8eDQzB3ME6Rxay6h1g1fXjHfejwb84TLF08pbPuS0ApTX1ZGt5N2MjbsCx4pkaNYSKz
	VGqFQbl6mdcMB+AWfDJ/D6pCKJ+cZqN04IyTS2Z06sEDkbL
X-Received: by 2002:a17:906:4ed4:b0:c25:6c9a:88bc with SMTP id a640c23a62f3a-c25b3d8a1d8mr588446866b.19.1788288326562;
        Tue, 01 Sep 2026 11:45:26 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d039d75fsm9783166b.30.2026.09.01.11.45.25
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 11:45:25 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a6108734d5so264266a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 11:45:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwwUVlXqPiQTQ7Q+Hc0PXNaHi+7+33SqDlo/MsCWUvvDBLJTJrzFDFkkX7KGt1k2pTu+olq+a6A+wqcup8=@vger.kernel.org
X-Received: by 2002:a05:6402:11cb:b0:6a1:f8ad:6c0c with SMTP id
 4fb4d7f45d1cf-6a663af2866mr7125814a12.16.1788288325506; Tue, 01 Sep 2026
 11:45:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bde573c1a758505339239f08be28788a34dfcb73.1786121949.git.bvanassche@acm.org>
 <20260831214437.15d6ad34@pumpkin> <a771af57-40ee-433a-be84-9b7c3e6965c5@acm.org>
 <20260901092043.7feaf5d7@pumpkin> <dca931ff-5995-444c-9f89-6d6cca4e71f3@acm.org>
In-Reply-To: <dca931ff-5995-444c-9f89-6d6cca4e71f3@acm.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 1 Sep 2026 11:45:08 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgFEG7ZVaFAbo=bWWfsSh_weA4cOh6BV-xHWNSn6SwNBQ@mail.gmail.com>
X-Gm-Features: AcwNN1VS2I5TtUh6BFinstrSuU-SDbdW0tJLCMMzGkLGpQ9MSd7fkCNj4OyupXU
Message-ID: <CAHk-=wgFEG7ZVaFAbo=bWWfsSh_weA4cOh6BV-xHWNSn6SwNBQ@mail.gmail.com>
Subject: Re: [PATCH v2] tracing: Make is_signed_type() compatible with sparse
To: Bart Van Assche <bvanassche@acm.org>
Cc: David Laight <david.laight.linux@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Chris Li <sparse@chrisli.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Sept 2026 at 11:05, Bart Van Assche <bvanassche@acm.org> wrote:
>
> How about the changes shown below (should be split into two patches)?

This really is too ugly.

I think we should fix this in sparse, not in the kernel.

There is no reason for "is this a signed type" to be that complicated,
and add that kind of nasty code in a header that is this fundamental
to the kernel and gets included in every single file that gets
compiled.

Basic rule: sparse should never make the kernel worse.

            Linus
