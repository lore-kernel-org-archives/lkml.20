Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793026119;
	b=CDhKquBRBRodzixZegsloa9Xz1TAEapgrjd9YDYuuHt2FXgCVuPscoSSsQ5Y06N4qmXF
	 Byt2aO1XkE5qFnEiZtBVZP8sBboeJ0Hm23eeQAcHop5E7Xhu4O3rbjZ61xssE3tuIwIwO
	 dPK3CkewgzrtkTkuZJXk2Mfh1FV9+nMFRGkBmNLIq7cVVZCjN6WCM8dcJoT8l0nTu7v1O
	 NMfv4PqpnMBYXMNCGHflcDZ7S0jzGLVLBqwT8ePrVFmepVshLozHd2ErCFESmwOlaV+Jq
	 uTCI3txXPDIwF+Mqpb26/iKkOYiAXVW+n1bZm/p3eeibjiOrMAP9UQ7uPfBTQDktIqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793026119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=spNLFkIiBg3oaNt35or7WqJajlW3RrC8IJj+CFVZH9E=;
	b=1ENQcxbZkL9Qt4ILn2S4mP1z/TWL8oqROsxlWzKL4zpWe+srVA6ICtXHPTmzQoWhh0SM
	 5O30xQ/cbROlkW675Pm6NRKtyF48KOheIK7+MqldQVxna67GTycd8V+ffAZghKH7Gazlv
	 eyn75HvH68UgjWKbOG8HXLz1KF6axOHJMpjsJYwOtNBn0q07tv+U32DKnsrIkGJQEVyJY
	 DAi95/p/SV+gFrjTRGFD5ByJrMLXd/HgHpuEkw046wBz7CZv9nMLJ9tG2VMgDj7QfmWN+
	 A9k1uBt21S2zFEVVK1HTT4BdkTp1R7IFbSVLjFf9AKgUVLbE1/nV/trUu/pgcUyNlGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Cw0oH7Rz;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51386606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51386606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Cw0oH7Rz
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a78ec32fadso579525e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793026118; x=1793630918; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=spNLFkIiBg3oaNt35or7WqJajlW3RrC8IJj+CFVZH9E=;
        b=Cw0oH7RzlEQh8MUZNTNu0YiEw41ItI6SZTEvS2l2OOYbZfsGZAaDrJ5HvhgCA87KhT
         WwVdFhI1BGuSKBKRntbkhbGPTYzKuhAhuKLkWXdIWKxKegHbxDMgm6Ni1ZqMwJD0HW3M
         j40rxqv+zcUvJDCMrowDb/st8VtmyWP+dBuP/rQ4dFersW7ECWlHx+tuo7uPqfGoJcGn
         b1ftWBfkZowU2LoaGhny29F81+NLHx8QSLc4DZRligDjP0SwbCEvkGSmp5cF9Bob5ezV
         nnN+5hyd06gClIJkjmMbmn8pRnaUp+Qsu8N/Pmfi2boulpM1FaTAFsNTpoJEcb2Y/Mjc
         l7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793026118; x=1793630918;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=spNLFkIiBg3oaNt35or7WqJajlW3RrC8IJj+CFVZH9E=;
        b=Kd2lmfX1f3V/kvRrUkm/7CW+oJHhIhRPJCnrhwI/pxdIyIxyR2NV7+oe0vbtSbUU0c
         Jm4GB+1nhR+J2NcAt3B/7PSD4Egjb3KMmXQRZK5MwtharMwNral62cxyMtTG93petE4Y
         jYAt5el2v/sqeU0igmskiBlSmDm7w31Uc0DRNzL/wv/AktD9Q/eFP3K9+bXdSvyJmwEL
         /UGIjYnlhvq4g2NUV1HM//5mA1oZIGF3tQa9tkYrPksWoU8UOASUwox0bfOa1FKb4JSZ
         bFj4ZEcZ3lIDNHcRtREaR7GrEugNM8Q9Apx/6WTU6ns3GBtwGQDT59pAum7mNLld6vGv
         ZGsw==
X-Forwarded-Encrypted: i=1; AKwUvBw8RjlO16uBsNhhHS4Hu67GzSrS6eMwlpQ0jqZk2Ncrwin/Am7D7G0M4cd/lr36U+ueZCU7JEWl9aNcwes=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzOb4uVSInEjIrsjjC8aNapWyFKwIfyxgPNR/t43S3QokYvqar
	1+FIC3DeKdZ9kwfU5pyiarqb+q0Pbkgc8Vzl9gHcyHeWmqW5ZBwaTVDF
X-Gm-Gg: AYBFou3gkfj5Mhc8Gb7+2NcGLlw5oIPDEcwUfU3E52Fu4DaaaFXflHvl2FUp+ScuvID
	37OrzlH+1qFFkuJfrpiBvKBvFFvFHgSfwv7FjFQzJ65ra6hf0V6RvkI0tnUDicKcUqPn27xFdln
	lcUv4SCUEJHKPoFthroIP0W0lIXJaRhmOAh0WXp/qgBTGxZQqASG/57Wv6DHnc7vWry0w5hCwm5
	xz+DsDLckZQSAYJz7KArbplOeNIlmFg0R2AKc6RVk8JPufR6zumyU/b7RKBrSm+U8pOtzUcEfr5
	cThjp7TKrlmsT7kY+wwSoOmzy++FUl0T0r+hj52gqPbAMZh13NHDmOZ4I10xPrITSUe4Y1M504a
	u9fJFJ/dH6vL/++nKUbLSIARKlnx6Qg3GYziZOdGO7DrJ3HjuY8xVeqVxqBLflUg5o4gvvfRjEu
	k3DTQBgfPHOtzO+/q76u955AEVgfWw+M2bq4v4V0hl0eKDq859VwkECUvjpSsB3kd2TiVa4he2B
	psB0p7apC8sRNjY0Cmas3mZE0XzVrJP4zD3xCs3jeIUIZgwZOknz2HbAejTJZk7kc7Ip9AZ82uH
	/g==
X-Received: by 2002:a05:600c:6206:b0:4a2:6ef:d1dc with SMTP id 5b1f17b1804b1-4a35ac6fe89mr124545605e9.1.1793026117491;
        Mon, 26 Oct 2026 07:48:37 -0700 (PDT)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm527826115e9.1.2026.10.26.07.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 07:48:36 -0700 (PDT)
Date: Mon, 26 Oct 2026 17:48:33 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: albin_yang@163.com
Cc: albinwyang@tencent.com, bsegall@google.com, chen.yu@linux.dev, 
	dietmar.eggemann@arm.com, jstultz@google.com, juri.lelli@redhat.com, 
	kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, mgorman@suse.de, mingo@redhat.com, 
	peterz@infradead.org, rostedt@goodmis.org, vincent.guittot@linaro.org, 
	vschneid@redhat.com
Subject: Re: [PATCH] sched/stats: Fix run_delay over-count for proxy-migrated
 blocked donors
Message-ID: <at9jBHbIlxA6Amcu@scheduler.schedules>
References: <at5JrmlnEXPQftDe@scheduler.schedules>
 <20261026135352.4120064-1-albin_yang@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261026135352.4120064-1-albin_yang@163.com>

On Mon, Oct 26, 2026 at 09:53:51PM +0800, albin_yang@163.com wrote:
> Hi Kayra,
> 
> Thanks for your review.
> 
> > ... sched_info_dequeue() ... Or Am I missing something?
> 
> No, you're right: the fake enqueue starts the counter at migration time, and
> the bill is settled later in sched_info_dequeue() on the proxy_needs_return()
> path (dequeue_block_task() with TASK_WAKING). The ~167 ms I measured is that
> delta. I had written sched_info_arrive() charging it directly, which is wrong -
> I'll fix the description.
> 
> > This should be a series instead of separate patches if this goes above.
> 
> Agreed - I'll resend as [PATCH v5 1/2] (DELAY_DEQUEUE fix) + [PATCH v5 2/2]
> (this one).
> 
> > ... when B gets a kill signal B need to enqueue separately from A, so it
> > starts to wait. But blocked_on is set, so B's counter never starts.
> 
> A case I hadn't considered, and my sanity check does not cover it: I only
> verified that a donor waking normally and then contending for the CPU still
> accumulates run_delay. A waiter enqueuing separately from its owner does
> genuinely start waiting for a CPU.
> 
> So let me ask first: in that path, is blocked_on really still set when B is
> enqueued separately? If yes, !task_is_blocked() would under-count B, and the
> options as I see them are:

AFAICT from the code, yes. BTW, I thought about this and I think a
separate fix would be better clearing blocked_on in this case. Since
the task is really waiting for CPU time. Separate from its owner.

Or am I missing something and this accually does not works?

> 
>   a) a predicate that is also cleared on that path,
>   b) clear blocked_on there (proxy-exec territory - for you/John/Peter),
>   c) hold this patch until John's series lands and re-evaluate then,
>   d) fix it at the source instead: give proxy_migrate_task() DEQUEUE_SAVE /
>      ENQUEUE_RESTORE so the migration never touches sched_info at all. That
>      sidesteps the blocked_on question entirely, but it also affects psi, rt,
>      dl and sched_ext, so I'd want your/John's input first.
> 
> Do you know whether blocked_on is still set there? If it is, I'd still prefer
> to take this now, since the under-count only shows up once John's series is in,
> and revisit (or adjust) then - unless you'd rather wait.

It's up to Peter to take it or not so... IDK.

Thanks,

Kayra
