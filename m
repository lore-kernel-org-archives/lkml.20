Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794780901;
	b=B9cU2+z0ECEaZRCe9Szo6noo27YSzO2nrDEm5LcmHsuSZjnjEYFpl6VqqD67oFRZJNhC
	 X7QMLKYL+jed57/iAqyyhOQaV6aPsdryF7VTEXmHMq+2ZhPKc2Q8vsMU2IKYB/2qwSJ1W
	 nw17QDbolH+3gP7s5i401IJJnzQEKs8pSaqHnPde1b1x78GaVO6J75dOrl7U9Q2rFL4N3
	 D5pMGi3Rj+pf9APZAbMskupA+UymZosR1/bo2BjXBdDnLk6YctY+E52jedyuwz/gNP6Ko
	 FmBHxq5LF5WDuJyrUrCktmNj5vBrjSRjUsJheWeEd/WoEj4y1rqW5u0E4fyoyHO+kZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794780901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=0pjD6yTOOqO6S5Xi8Aicg1saMdbdOw8JPDtY8uBR1uc=;
	b=NuAmf+CzifEOZg8WQ4/ACoI10VeayTYIFxle2bW5LRWMSbqpjdPz7ahq4mVgPeHgEPqL
	 kVjp4V6fGvAD1RufNl3x5Lhfskq+PLlhIgMedNgTQ2tG90FdCtDaLNV9y1QVS9DdDcqmz
	 /bHKOblUmkk+2LoIo77YAU3oQOTTX51Nz0iMtn3X+x2mJnGh2owz9nlb7vVdtLBHSMo0J
	 oHz/nYOsKTHOSSngaN11sqbztqFcuKXhe8ypqzILuJztsopkpG+b03vbNcMRV5njfOYYu
	 h/ib/vSUihmjkBfVW12a0LySo5Ye+mey6DfizrEzmvPmjVudh/oFFVjE9+dyztmvrKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=ELf7e+7z;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A975606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A975606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=ELf7e+7z
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b571979178so4476358a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794780898; x=1795385698; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0pjD6yTOOqO6S5Xi8Aicg1saMdbdOw8JPDtY8uBR1uc=;
        b=ELf7e+7zHUUJttearjZszOFnQowWEQdOD+xr5n5FbDod/lHSudvSiva8nXBUYx9NFW
         U4qvqcDly2cxhTE9ClLxskuSJGF6Beh2lR+MZL2loLur/RrxWGPnoFWugLtmYhJTFgp+
         nMdfg8h5mZaTFYzTIi6jxPVfjRqfrAhvlI6Pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794780898; x=1795385698;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0pjD6yTOOqO6S5Xi8Aicg1saMdbdOw8JPDtY8uBR1uc=;
        b=oXqJJXKgQvwr3RW3oGRnE6+V1mGSCPZhpdK+wS6+77kv6JlUFX7WQwJM0SW/ZzmsKA
         hcOikyn/7y2xxofjM1V3KKKX0XznTZM6Exd61hxfGZjAWXWqJd9btHdDC5QvnsFMBfAd
         UcVeSjzxBLOradmgVlSk+L55TbpzEf2i1IwdJHD6YWZUkv8mgkx+yiCLfJPnwmfSYdSf
         8Qy+r1hz0J2eIy3v5ymLe56aOB7uq8PQ/KbjJKj5uaTQG467BIDQ3psFhFCSdBjdys2a
         hVjAoBUwet/A+8DMrZ8+eNcrLK9xqaeoQC/OffWhHhisp63gnV5s3ZAJ5RfwYasUyFQK
         oH3A==
X-Forwarded-Encrypted: i=1; AL+hErHNo7sxqcFTeUUJ8ktTLOTwGWMN1c/YtBkZVAsc8l/y62WSpkPY2oYv0lDWxGI2ut0M+jO02DjOhyI12YM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yV0M6nrW1UcfTYiBA0R/CEJi9icY1l1z43ttUJCIEjDDCOVC5
	ObvndRilKdMJlwPvSdfwRUnpOA+KF0X98zIIXAxb2Rohiz+FsMJQXusafY5z5d0bwnZvGdK1iX+
	627CuXmhAyg==
X-Gm-Gg: AYBFou0KWXNlcWvOFM01ZivJKrIRNvDQwXQK+JpBJ6tlXbaOyh+4XpRwIPc0M/P3eSU
	Ag/3VWjTOMRdqziu+J+G/Lg09gWquw99ywXsXulMcm1xScsMwrNzldtCwStd8lZSrvu70npGJjc
	lf2VX/ytBRHWtyBrNevRnwCSdiaUnw8l8gj7ZzhmhIcFp6eLy74nBvsX1SYkzigglHKamrfRaUi
	cVn5/JkFKkTbAgOuUbML/eEkkSjdbpAaLQvzqCJSkhgexw4TmPbqULnQ+mK7vYZHZsMFQlcSUFK
	6i2TMKqN1jDdHHIi9iVP5XMDdyeTQ8O43/nMgVch4pLxBp7JZYtr4UJesLjRKPo6Zv4Uh/4pTFV
	oC/FCTJQSpmYCJDBj0G2X55r9V3S60l11lBck7sXTY9TVbFoSeLEZ/hy6PqOV4y1QEYsNNCkswN
	vfXquZHOmuylBebxY2oCCoSwMA6X9jw5vYBVqnVQjCIjPcYAbRezbnuxcmkuOnig8UOTBIxYdQg
	37fHhMmthnKE83Vza9e9rP8gOC1NYHzAe2i7QPQxGbhPYWdpqbRY++TkhLFEyScE7ux+xj5q8Mr
	3w7wV70ZgdniluMGDdXqD48X7ocQqN0y0eXOZlCutv14svIAjFNCFal29xcaLAWpT86aE+5AZbp
	ID+Y=
X-Received: by 2002:a17:906:d553:b0:c4d:5820:325e with SMTP id a640c23a62f3a-c5096328869mr697271266b.13.1794780898537;
        Sun, 15 Nov 2026 14:14:58 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5b93csm337284966b.5.2026.11.15.14.14.58
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 14:14:58 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c505186727fso496299566b.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:14:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEdHlP3i3Zi8b0ZZ/+VBWorsiK9R1e2Y+lo0x+gpuXHJsQ2NevyEGUpeXBPsLYlFaIVRTOE1dHXN5CfUh8=@vger.kernel.org
X-Received: by 2002:a17:906:f59c:b0:c42:102f:15f0 with SMTP id
 a640c23a62f3a-c509614d4c1mr660568766b.3.1794780897882; Sun, 15 Nov 2026
 14:14:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <fb224bad9baf5f44cf17e1d664776a4e@kernel.org>
In-Reply-To: <fb224bad9baf5f44cf17e1d664776a4e@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 15 Nov 2026 14:14:41 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg4jAWZvxWo0OZ+fFTU=SBtQ7dnsUCV7hx+UAifkwPUwQ@mail.gmail.com>
X-Gm-Features: AclHuK_LGhq7nDj4NuCBVcN_vX9hS2upSOJLuckybdfHcTfd7WWSNt-k3LZOEh8
Message-ID: <CAHk-=wg4jAWZvxWo0OZ+fFTU=SBtQ7dnsUCV7hx+UAifkwPUwQ@mail.gmail.com>
Subject: Re: [GIT PULL] workqueue: Fixes for v7.4-rc2
To: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 15 Nov 2026 at 12:45, Tejun Heo <tj@kernel.org> wrote:
>
> - Draining a workqueue could return while a work item queued by another work
>   item was still pending, making workqueue destruction warn and leak the
>   workqueue.

Why is this re-creating - badly - the existing sequence counter code?

Not only does it do the memory barriers by hand - possibly getting
them wrong, but it seems actively broken.

There's a reason proper sequence counters have that "odd/even" rule,
and a writer increments the sequence counter *twice* - once when it
starts the modification and once when it is done.

As far as I can tell, your "fix" is still broken:

  drain_workqueue:

        mutex_lock(&wq->mutex);
        if (!wq->nr_drainers++)
                wq->flags |= __WQ_DRAINING;
        mutex_unlock(&wq->mutex);

        seq = atomic_read(&wq->drain_seq);


__queue_work:

        if (unlikely(wq->flags & (__WQ_DESTROYING | __WQ_DRAINING))) {
   ...
                smp_mb__before_atomic();
                atomic_inc(&wq->drain_seq);
                smp_mb__after_atomic();

but what if __queue_work() was called before __WQ_DRAINING was set and
is running concurrently and never incremented the sequence number?

Of even if it *did* increment the sequence number, what keeps it from
doing that *before* the atomic_read() in drain_workqueue() and then

Either way drain_workqueue() never sees that drain_seq change, and
thinks everythings is fine, even though __queue_work added an entry?

Is there some other serialization that I'm missing?

Anyway, sequence numbers almost never work with a single write,
exactly beause the single write is itself then not ordered with the
changes that the writer does (ie the sequence point update happens
before them or after them, but either way the reader might miss the
sequence number update, becuase it's not atomic wrt the actual change
it is supposed to be about.

The actual 8real* sequence numbers we have do that two-step change
exactly because of these issues. The writer increments once before it
starts writing, and increments it again after it is done. That way the
reader actually can check whether something changed (an odd value
means that change is happening and needs retrying regardless - which
is why read_seqcount_begin(() will loop on odd numbers)

It is possible that I'm missing something that makes your ad-hoc
version ok, but this really does look just plain broken.

I pulled it and then unpulled it, waiting for explanations.

             Linus
