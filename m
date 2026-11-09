Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794257729;
	b=xmV6n05Ll7zGGrt2gi0xQxKgIv9g1Of1+VDXFLlWehgQ9e/KkXchLmOvcxJAu0ubG1vn
	 /H3g+kzw/hmKcKgvJ4/9T8+axbEnus/vct2m3p2I+WCxI4btu3MXEOD8vfz/F3B8DBuJO
	 F80gmQDnuZVuZhHzsYZRhcDzZaMq7ziO8x7Y9fNivK7RSTwzjATJ83RQ/qwG0Hpe7+XPI
	 GElyhqHwrUB1xQkqVxcyWvs27kt3rwLp/3Vu9gISngjxmQap59e69fv9EjESh/nSr8EQZ
	 mYJryAaVHaRfX9alRkMnhldrnyU/JsVbqJXfYIiYeRSVozc60uMH7ZNpbCHy9JbOZmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794257729;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=vujv7FqdLR1EjILFPAaMdbnVnZNpLko+vttukT6h6N0=;
	b=4JiWZ6JPJ/BQ5knt/dlK+LDLQldMs0Hc68OQfAPhwo7tLaIJxVOMwvPt3+BYDmkWv8Sm
	 leq/NbwP84ojn/Awbc9PmkG5VzBG+VNYPCVIufeORFxuUhAKryJcRkzFnESgj9AanS0hz
	 eImY5ncOfzsrN/GGfKAcSYftF84Dk7orc+wIn9dWFMtYT+MtBkxWyQM2j3/PMKtfh8ld1
	 kmPROe6vd1fo1lTZxGD+eMQYvgEaFSqoP0jy0htS+KcOFRA3pCL9hkr74cfBuS6LPRX9a
	 aO+xU2fUX+4mqR1Mv0Usf83xfChKZc3cpLvjCTuLgVp0I3LMDOB+oj/8hGn5HwbLQEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=boZPhSqu;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D9F606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 20:55:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0D9F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=boZPhSqu
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36f1e7d9d4dso2620435eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 12:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794257728; x=1794862528; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vujv7FqdLR1EjILFPAaMdbnVnZNpLko+vttukT6h6N0=;
        b=boZPhSqu/blrBMW3/GJ/QNOiIIW7JkxddAefzNkyWy82X/u+FNNa9A8f6jcHoX+eVB
         FySBUHkQRzDc+n7GMQ3kt03V151jljdADX36EpfwWpolRdrXgTbk9QfXzr1bnEArr8EZ
         ctOjsqFZXCbOCuwk5eQ/mcfTLljsMr40Zf7dpX/9QR/a1oLIn9pD0hhHRmvNgx8s2kXs
         H1w4NPqjfadiZDRikpLpi51CoN7shKjma/8JeIqcihoB5qU9rqrBqMKT1alX6GBVofCK
         B+lf2dfmNec6t16HmgRh4XatSJhY5vVuV9H3YtGq1JwrVZBLTGc2YM06BgZbXoW1mv8o
         HjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794257728; x=1794862528;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vujv7FqdLR1EjILFPAaMdbnVnZNpLko+vttukT6h6N0=;
        b=R3ky4Dt6Gjusq3ZJVIVdhhar+PFg2V9Ac3m9rgxQOAn4PZVNZ43L1Q3OU2mmGhxyLy
         E9P5W7ClhhISYHV2dLUqZpAGTPIh5BZx1iKT514emDJR0uFR2x92vxVCBwc9lSLEvwYw
         sHAi5Rrksqq2h9rI0MCO1Wq1Yik8CpyD2mEfRgwDJy+Gilqy0LOasdI4/0Bsk6fd9nxM
         yKouJ30N7S689dX9vpwoHqMlOKoO7tNHlt+uW99IekZ/9n7Aqra0QRWHZwigYCXAedY4
         F2Xm7J7iblrNNBxNUte6V4ywByZ4aBN7uJvKEAx2fLWyRpV4jEOG0kv9H38bTXceNQkR
         KIeg==
X-Forwarded-Encrypted: i=1; AL+hErFZAsf+4hkfPeA7Y+yuAfUIhi2ze1HK2SPo67crvP3SI6lrmhBwvF6hCm3rYyn0xZHvEZ922ot74/MHQB4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kfDZTt/GgJWMa1Z4awcUirF2h7CDPgZkM47ZrSYZZPktIydWx
	/QhmDhjB6r4ft2bBC85Y8iqH/RQURUNraUJqBW/8+ioquhpR2CEoEqWxlSYXOMiaqOVT9CCI3Z5
	ZXaPtSHrZrnhIKeUwbTWzNV+eIZP4tQ==
X-Received: from dyckg24.prod.google.com ([2002:a05:7301:d198:b0:370:f640:2508])
 (user=chriswiseman job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:87cc:10b0:36e:dd5:fb08 with SMTP id 5a478bee46e88-375214da6d1mr573704eec.40.1794257727724;
 Mon, 09 Nov 2026 12:55:27 -0800 (PST)
Date: Mon, 09 Nov 2026 20:55:27 GMT
In-Reply-To: <avIiCpJ3ctbQaExK@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <18e61a85b0d13e9c.3137322e32332e3235332e313736.9c152.0000sendgmr@google.com>
 <18e61a8cb2ff887c.3137322e32332e3235332e313736.9d011.0000sendgmr@google.com> <avIiCpJ3ctbQaExK@google.com>
Message-ID: <18e67be5a0307330.3137322e32332e3235332e313736.d28ac.0000sendgmr@google.com>
Subject: Re: [PATCH 2/2] rust_binder: account for deferred work size in Thread::read()
From: Chris Wiseman <chriswiseman@google.com>
To: Carlos Llamas <cmllamas@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Chris Wiseman <chriswiseman@google.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 09, 2026 at 07:42:02PM +0000, Carlos Llamas wrote:
> ok, so if userspace is setting TF_DEFER_COMPLETE, the read buffer size
> should reflect the possiblity of a BR_TRANSACTION_COMPLETE no? I'm not
> sure this is a driver issue. Maybe I'm missing something?
>
> I guess we are trying to match the behavior we have without the
> TF_DEFER_COMPLETE and using a smaller read buffer e.g. 65-bytes. I
> suppose this makes sense.

Right, the goal is to match non-TF_DEFER_COMPLETE behavior for smaller
read buffers (and when deferred BR_INCREFS/BR_ACQUIRE node items are
queued via push_work_deferred()) so Thread::read() drains the local
deferred items first instead of pulling a new transaction from the
process queue that will not fit behind them.

> It seems sashiko has found a legit issue, see:
> https://sashiko.dev/#/patchset/18e61a85b0d13e9c.3137322e32332e3235332e313736.9c152.0000sendgmr%40google.com

And yes, the Sashiko report is spot on: putting deferred_size in the
while condition caused Thread::read() to skip the loop and return only
BR_NOOP when writer.len() could fit the deferred items on their own
(76 <= writer.len() < 76 + deferred_size).

In v2, I will move the initial BR_NOOP reservation ahead of the queue
check and keep the while condition at 76 bytes.  When
inner.should_use_process_work_queue() is true and writer.len() < 76 +
deferred_size, setting inner.process_work_list =
!inner.work_list.is_empty() switches Thread::read() to
Self::get_work_local so the loop drains the deferred items immediately
without waiting on the process queue or busy-looping on BR_NOOP.

Thanks,
Chris
