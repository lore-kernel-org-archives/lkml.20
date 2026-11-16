Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794850190;
	b=dJ9B1bXo9CjghQs0JqF6qlcTG6pvNmXzlW+9FfTr23bEl0GC9J48xVzlT7zKB6Olgo/d
	 bgeLzT/kavLiR0NiHDuSBtFnhIo8yqpM0Ey3zft1YuyomZObcCNpURyw98q8RiO3mQGG0
	 IdzNWVxYaBuoM4ec47Nyi5gYn8VnXE5Irc6XYsFp8IQgp52pOQ1cvkA6kKMMbiRY6T2rK
	 eTuWK70nIg967elAC+ibehrctkYawRGw7QLynXzCG+3Q6WTie9E/SunXcqeH1HgZ+6T19
	 iiysC7Bnzj0KaeDce7IjOdQNBuP8Vf48zQvfHmKlX0APTYSV2odkflDMPOE8zEyMLxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794850190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=+SGNyo2gd+yAHxP5oh0Zgz170f3HEoeOAEryQ5ldO64=;
	b=xUhn8QaCrPpGBIkq9B9yGXJ/o/+dGSCBhjFmpYOsVkLeIJ+lBpV4xZQhESz3FL3EeghO
	 hC2zTcHlVZSB2fXNvL/TgvM6rVMY/7YBzf7XQTy3TCnym2W94v9SaRRo4qE2HIq4OHLcl
	 1xkcUiMlc4awOadC13rms3p42/LJEJiDll3js+ZY02p1LwrbpLMZ9k+P3Vs9em46Ffxh4
	 gGFbdS7xwp1EhCJi3Vn8J+a2lOSYLEJ8h+sCMKLQ0eVG3Qo5YyJ4Cd2f8FGaR4y9jtnYx
	 NfE62LQryoR4Hc3D9Buw4lLugAeWnKA9QKUoJ2II68zNz/6oREWLgKjiaFUfuLUTQog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Tp7Lgjfu;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7F9606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC7F9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Tp7Lgjfu
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b633ddfad6so5808030a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794850188; x=1795454988; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+SGNyo2gd+yAHxP5oh0Zgz170f3HEoeOAEryQ5ldO64=;
        b=Tp7Lgjfu2afXXII2fz8CrRyZetQFL+byRcgFW4rBwrrXWRgS5DF5W/M4JwspcHWFDQ
         03T0PO7JRVI8lcgefVEUr+tPjYCxijtl3VdDc7uu1vHj3I4h3iCCesOpMpas0ks7aLLB
         S8Z4TOxTsns3OrmM2nVAFDV+ucv8wg2qiHqNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794850188; x=1795454988;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+SGNyo2gd+yAHxP5oh0Zgz170f3HEoeOAEryQ5ldO64=;
        b=ZY2xNMQzQBWRmMQbIMnZjcvde+84dhehXcQyqnkDw/dSPFS5Nlat0Rui1CcJlPw56e
         +EPKurXsAv+A8hJPgWPhB3QjtpLBkIke+PFBSRY5SZrbqi/33DeDd40CbxeGErZL2kD4
         0gDg/MVQfqNdVJ7Fo0qz6QbGzTMb2KG88a25RH+eYN98eB8JEzDmJOEv5bIIEVIDjDF6
         PbiXAvzCVXx6xM5ReKTgwW7081WS8kIwVypGoChDd3I4ebTaiBTldGzgJd/y5tWM7H9n
         TErdt9vcJltAkPX4ms4zHiaxrobD811xMSVQyYbZe0S24ODkb2zhZ0mdAP/upAygX2YL
         REOw==
X-Forwarded-Encrypted: i=1; AL+hErEnGVUafKf/nF41q7RnocBRiuOFVdP5/uytGGFajYoSD9mWsdyF28hgHlfteTh1kqvhLQP4DbEc52N94w0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+y0X/jUMz8Wk+ljs1fKmXUFnp8JQMqX3mb/mddOsDMlyXi/pqx
	oRJV8wJe4wWxw2Z9ftpCd6Ww8LVzJbxa5N1nOrRFKBP5b4K5k+xh5fxO9eVdTDs1CnbtcFKZ+u7
	TKbG60j5vsA==
X-Gm-Gg: AYBFou0JUoCYlOaFRWxrgHG36DfGYDJzp1GTGhhHi/O9Dvdu2/QumQiNMBdigiVvOjQ
	TsBgtGcL492yg3z2aM+0y+SpxSHs/dzsXNYDPc2qtPlhHwg6oxyywenqYWwM1ytZwgcluZxw2mQ
	nRfoBNrSLeyHMjGpSZq1D9pHMTFpKvVYEnB6MgxsHnX//lJiWKxpxcDoZWJhg/XhgdomBQpC0Dh
	PqO6Xtz/ASjHJjNWsQHOC8a6zADCDct2VxPelDErbW6dFdJs8kUrA5e7eclUP0Fg+PFLhci2xd1
	8mRnMxJe8xqkbyQolfr4EP2FeJf66P0lvnykZtcfH5OSkYTFBkV1LkHmVWnGGmRNhmTAuPinVkq
	wRSLuvKp1ByhjnPLXhB3uLRhWt8FEPwtHy3jXXgJa7CIeX763KhoI/EAzIgNNuKy91OCt2LbYsw
	DrkvOJ898PxLog4wRib8Qz9A+iwxMyPXXuwqqp0jL6fSKFaEJ/XA3vaM0AGFMiEW9iszWesBM/l
	qnD9vwXlVjyna7tw9m7nn9cL+Av1Sc18HV5PDZuF5AUQPZgA7V3MVtUCDgNbVXLLdvMo3J5kCh5
	io64nntoTLX7xNZ3Z5yfEdPERjzSmhy4UBPinJ/CC0i23kF+AI523xSr4YzP+xqlYeRAshlcCyl
	iWMM=
X-Received: by 2002:a17:907:d40d:b0:c25:504a:1e25 with SMTP id a640c23a62f3a-c5096372189mr929868666b.13.1794850188085;
        Mon, 16 Nov 2026 09:29:48 -0800 (PST)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b5ad91sm452719566b.53.2026.11.16.09.29.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 09:29:47 -0800 (PST)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so357935366b.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:29:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF0x8thS0yCWHv8b3m2Sy/yI6LmwWYYwcVjMnsPQgmKi7GQ2TJwkx7VrGpg6ij/3HZ8Uv0IMA11/xcdAvg=@vger.kernel.org
X-Received: by 2002:a17:907:ea8e:b0:c46:ca3a:10d5 with SMTP id
 a640c23a62f3a-c509642379cmr926854066b.45.1794850187276; Mon, 16 Nov 2026
 09:29:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <fb224bad9baf5f44cf17e1d664776a4e@kernel.org> <CAHk-=wg4jAWZvxWo0OZ+fFTU=SBtQ7dnsUCV7hx+UAifkwPUwQ@mail.gmail.com>
 <avs4uWg9ch-Bqobj@slm.duckdns.org>
In-Reply-To: <avs4uWg9ch-Bqobj@slm.duckdns.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 16 Nov 2026 09:29:30 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg+MO19H7KVgA+SaZvvt5O+3Tp8AxHVhpN23JtaSq=G4g@mail.gmail.com>
X-Gm-Features: AclHuK-PN9pJrcukp_FJTVGo2b1ouLrx-Y9KKzsMDulkaVd30B5Xk2QwkoWpwC8
Message-ID: <CAHk-=wg+MO19H7KVgA+SaZvvt5O+3Tp8AxHVhpN23JtaSq=G4g@mail.gmail.com>
Subject: Re: [GIT PULL] workqueue: Fixes for v7.4-rc2
To: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 at 09:09, Tejun Heo <tj@kernel.org> wrote:
>
> Hmm... so, draining looks like this:
>
>         set DRAINING;
>         read seq;
>         flush wq:
>                 for each pwq:
>                         flush them;
>         for each pwq:
>                 lock and check whether empty;
>         if not drained or seq bumped, try again;
>
> and the queueing side tests DRAINING and incs the seq while the queueing
> work item is still in flight on its pwq. The chained insertion is under the
> pool lock.

So now I don't have the patch in my tree any more (I could fetch it
again, but I'm lazy), but from memory and my lkimited quoting the
queueing side only incremented the seq number *if* it saw DRAINING.

And that seemed to be the biggest issue.

If the queueing side did *not* see DRAINING, it also wouldn't
increment the sequence number, and it also didn't have any memory
barriers.

So it looked to me like the code basically fell back to the exact old
sequence that the patch claimed to fix: if the queuing side missed
seeing that "set DRAINING" part, all the changes in the commit became
no-ops. Yes, the draining side would re-read the sequence counter and
retry, but the sequence counter didn't actually change because the
queueing side wouldn't be updating it.

But I'll freely admit that I really only looked at the "shape" of the
code, and it all felt wrong to me. This was not some deep-dive
understanding, it was a "this doesn't feel right".

> I don't think it's broken but it is adhoc and difficult to get one's head
> around including my own. It'd be a lot simpler w/ seqcount. I'm traveling
> this week, so might be slower but will redo it.

Thanks.

The main problem with a seqcount might be performance - I'm assuming
you tried to avoid the write for the common cases. I assume *draining*
is the slow and uncommon case, and typically *that* side is where you
want to do the writer side of the seqcount, and then the fast and
common case is the one that wants to do the sequence number read.

So maybe the generic seqcount code isn't what you want, and maybe your
current code is the right thing, and my "it feels wrong" is the wrong
reaction.

Put another way: you should also just feel free to tell me that I was
wrong, and explain *why* it all works the way you did it. Use small
words and call me names.

             Linus
