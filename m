Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5771735C190
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 17:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787938003; cv=none; b=mQFtiROpKwhf3ZRX89sa4iZS1nCVwmWt2VGEw39s0dTH8hftZXJ6ra+/JLSMh3HdguBykwGF9kcpyZS0UZdd5o6QUI4j8nn+10YOe053GRLJajJVKaBRlBuAqe/MzlMS5gTfQG7UEvLQENx254kx4sELBZxZDmvhzoUkSpyuGxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787938003; c=relaxed/simple;
	bh=O7aH7jNv5XACVYwfexRjkMyDCwV8m7wDLIeuqLxSpIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=taPZaGM/XJ5fvvmrn/ru1d3nExPeXpuflrQBOEOq1PkBZiR6BBhnEMScCyMOTRbPcfB+WkfLwGly4jLMduQNiYzJ/VUqGwoT3WdbDECL0xtuP80Wumk455Kof+kUbz5fskAthC8aFDxuiIQJVDZAe6CXAUSpPubjwQLlSBkSMfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=cSV7CU91; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cSV7CU91"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c1c52d920b8so156685666b.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1787937999; x=1788542799; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y1RgJgjYZ6layd6nj/pPqRD5/ufb+nrNE0c26oBEfgY=;
        b=cSV7CU91q1uz6bCJxQdUQyfmo0P708kv1h4re5DSpHj8yhjKitwokYcdKAw3Agz7P6
         7a3CHQHj46yIKSKzw6RyqzNByQBcaoRyUAaEvW/hvnrNPPVUFDvzdI9ehYFkFi0OYFgz
         OYBSvY3DIWCQ0guUq+gN3/y8yUF2T7UlZN5X8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787937999; x=1788542799;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y1RgJgjYZ6layd6nj/pPqRD5/ufb+nrNE0c26oBEfgY=;
        b=WYeDU/0f6ZdZK3BT+OlmbGmvLPslChG6cshsh1fa/RdG58f8E2S1Ooylzk4WVaFQbc
         TKk9Xrr01U19j/tLgFKexs0cin2H/nxaOYTydj0Cabi9O2bVYhQe2pC7xcpBvUBQyBlT
         t4XLTWcZOVTBCL4DvWand4FbLYvPUGGD5Bb1JD9HJhFaxls4cMuQi9FT3cNfy2idmc6D
         5JwwT+6cNevoDIxR1avSb5HWHBPA6HanIQdvS8zfSo6oMt4D8P16YD1OthHygJ5fvn0K
         weyS8nuuwgmHYwpf0rxgBysKUnXD3vg4msWl7KC0s9NiNBbnLPMgmaWDoFnadYvn396S
         ntsw==
X-Gm-Message-State: AFuF++lchkf4K9f/WIumyUMjp7cxWuTq0edBEATcYdzySZlFQSxbaAZl
	Hw/Lbb6FPzxQS5jcgBKGpId7XTv8Ujv+1upaau7b750qj8NrAK7akvmxzYNTYUK2bXVmI+TL5GW
	aWuD++Jw=
X-Gm-Gg: AR+sD10OqpHiuRquH4Xq8AD20IVmiYQlfTP2Q0lgg+qIXk5xt9cE9Jy2NBCW7Fg95Gh
	73TvgppVvBkBl3FbpuptgH1EIXrRXHXnO0LBDcDZsymkHeOCkBG9+S/+r0lKpVA+Sd4+4AP/NoD
	UH1z+WkWVLn1d6mgBeqrB6hS5ZWm9wSuweUkddzR1+zpCx2SEGd0k3sNmSgnaPjchDMwNMzY5ED
	xkjNtNY0KiUQEcO0k7cpG0UtY5CEcUPSIXvppnQs8FyNErfwh0ByOpk8mMQjAAGIuougQ5UANAf
	4YIKgSUG/udPXDPj/DANH+80x2BZHvWRtInI2FZ1mXLC3POZDnMzilEg+s2M8/paJ9n2hAuCMo1
	GFJNOD/xhDuHzjrEjEzymvuqzy1A9IF8a3HI6R2U3vZbgVBAfxsljASC4kVu5S/gPKSPLldmCcJ
	pqLYCILv3PPR7qrs5rDuKcjy6MNrFu5uK/onJypROYzrRpxIxk/IjAr2fMyC5jJlYll2RTsyq9K
	J3WZQy0VqJleRzKaoLNGOC3TSu/X2FT/JmUTw==
X-Received: by 2002:a17:907:6d13:b0:c1f:e9d9:64d4 with SMTP id a640c23a62f3a-c25571275f4mr643608666b.11.1787937999529;
        Fri, 28 Aug 2026 10:26:39 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee09eb6sm111576266b.10.2026.08.28.10.26.38
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 10:26:38 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a20319d030so1601045a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:26:38 -0700 (PDT)
X-Received: by 2002:a17:907:cd0e:b0:c25:2fb9:b897 with SMTP id
 a640c23a62f3a-c2557164d7fmr623783166b.18.1787937998688; Fri, 28 Aug 2026
 10:26:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <apG8g-5krNRUFUuD@casper.infradead.org> <CAHk-=wiY22BnQkAMMc8-h6xaRksvVAbASpg=pj+=kVaXXQYo6w@mail.gmail.com>
 <apHC_mHJ3wsJPEgy@casper.infradead.org>
In-Reply-To: <apHC_mHJ3wsJPEgy@casper.infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 28 Aug 2026 10:26:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wimz+APb9hGEry+vHDLB5D7WZvNGWU89HjGw7wH15KGHg@mail.gmail.com>
X-Gm-Features: AcwNN1W_Djqrb4dbrNf2FnJjSle4SvoCwveEoSjB4FMfvcDCroxNv-63LlnlaaQ
Message-ID: <CAHk-=wimz+APb9hGEry+vHDLB5D7WZvNGWU89HjGw7wH15KGHg@mail.gmail.com>
Subject: Re: [GIT PULL] Remove dependencies on pagemap.h
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Aug 2026 at 10:18, Matthew Wilcox <willy@infradead.org> wrote:
>
> OK.  I thought you liked this kind of churn stuff at the end of the window,
> rather than having it create random unnecesary conflicts throughout the
> development cycle.  Have you changed your mind on that?

I like things like automated churn at the end - IF I HAVE BEEN TOLD
ABOUT AHEAD OF TIME and know to expect it, and people have said "this
is scripted stuff that can cause conflicts, so I'd suggest we do it
just after rc1 when all the big stuff is merged".

But I absolutely do *NOT* want to see a random pull that is broken in
other ways popping up on the Friday before the merge window closes
that has never been in linux-next and has never been explicitly talked
about with me beforehand.

One is planned. The other is just rushed garbage and badly executed.

See the difference?  You should - because it's not a very subtle one.

                   Linus
