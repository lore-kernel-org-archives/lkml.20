Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197275;
	b=z/0sNsaJZgHWG7SBrNIS/r6sz/59rTpiXtEaXC08D678tp4dWt2ci9nk1101srYW2hsZ
	 h1uyioP2dVN8A9uyYGKGQuiW0E5TG7tkl7TBnJtv45+C70MIyXoU/JD2/pw6wiK4zl7R/
	 sbaJ8ODbPg/16+GU/4x9Af8B8lPjOeWjjdtVvKV7mmEXV2DxiYvfH/fgC6Gn9CCoazQQA
	 PpCDhcj7NhjLadPmGPDdGY9poRg36Cs6PCGy4oHIGIV1w3crtDDpRMCAP8DDgdQ15eZc7
	 fQVJBVnMFf3czj2SsGDf2HqdD7zvyaIfHFRKFf6QM6nUOse3JF9AhGjpy30wOOz/hyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197275;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=X/GPT3ZRi1oIBhHTumY1f/yu9iHeKcY3ZDJ/rlFukao=;
	b=w51jJtm6PkxAhCnUARP1IgOPvh1RVUUtaOQbixrgnzHXkjcAd8BUwF6g0p9xmx2T7AnJ
	 IglN6oWc6WeLtusLfePpIjn0e04akqZ3eZXF3XhdZWtWZNvg6RmgzOXWpGJH0D6fFp6h5
	 nn4EYcbTyfbTjy4D8YMWPjMCPVWZKkskr/sh02Ll/lt+q/eY2+hnQ7IwNfa2a/QtU7dBd
	 dByRuQfWcs/zNJM9J8hoBkOP3Cal7irg7Y7dnlA/eiJTG+uhgwHAG4uI0ZNhGPuaWz2f5
	 smzreD+W4xpZAvhkBPYy1dlrBVSqIKeigzEbzjPiOZ8CsEHf9Sztpf7zMqqkoR18B9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YkmSha1q;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=i7mElj7p;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5A9606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:21:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A5A9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YkmSha1q;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=i7mElj7p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793197274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X/GPT3ZRi1oIBhHTumY1f/yu9iHeKcY3ZDJ/rlFukao=;
	b=YkmSha1qCKFPxFPsLGcq2Bwyt7YSCk+NCqQf1PgY9DTW01GAEEUm2mONTf1pCXyqWlNhoR
	c91oDeaWOSbfhsSQQUggCycfu2z7mhAxU26ggkKS/YRM+ejr/H+tflfelM0usYfQfIpMVH
	q/ickuGidXKaiSEjy7/rlkVqkuk2z0Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-KGBg2VizOpWATaRw92EE7g-1; Wed, 28 Oct 2026 10:21:12 -0400
X-MC-Unique: KGBg2VizOpWATaRw92EE7g-1
X-Mimecast-MFC-AGG-ID: KGBg2VizOpWATaRw92EE7g_1793197271
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a359b714f8so10056335e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793197271; x=1793802071; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X/GPT3ZRi1oIBhHTumY1f/yu9iHeKcY3ZDJ/rlFukao=;
        b=i7mElj7p9ES2Y5k24rCRBYGtlAyh3GVi22/PH5sEO7IhbUAO4R9hY0SH29hk50GnN0
         sA6ZFTxg9/n07CmCk2xv6OC+mXZYu/W+lwgXLK3L0cM6G6PEz6ALoEFPtyXJeldp9YrJ
         6qCy4+PRKiOjlbTOpPORVomxSjJI5tNWA4IaW9vSMI+BpQWYwB9cSIZpsJ5TYGS46T6U
         /v22CUZ7EwpycopNgbpvxzEwj88S0CX4xsNlUpTMDg3CRJ83yQZVJ7gJqkZVcxgDDC/e
         5m5qR8NLHgtuH2FQ9+KQRAEPrwyjVnDuhCLIa8Yuq3dS5PKU3L5567VRhZFNlwnjKm+U
         Fz5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197271; x=1793802071;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X/GPT3ZRi1oIBhHTumY1f/yu9iHeKcY3ZDJ/rlFukao=;
        b=uc7TKI26dKX1yH+UWH6ltZ7r4Q0ugKXYm76RslD5YSbet03CnPk+LXWmzUKame8ld5
         gveKGP9c+JsdjAlbLgnwgFB85wxQg0D8KI7VU2sZCZBwTihFYewjos1vxuURuZjVjvXZ
         L68Nw+5+4hRJ4SYbnQGsSzDsOE56rDsYDoimc5J0owzsU49RuMAvFgUikpTIsqkuaYXX
         xZSPodxDpUU/m50KhMaBrs82eCjSBhcaFWxhGJjaRoheLUEy2W6kK0Qb9RpgDIcWnFDg
         42HuRDCY6QUpTpkgb24A+At9mOySlLq7F2yGMubKayUf3YCKUYCnL3Nf2Vwk80OB18dZ
         NTew==
X-Forwarded-Encrypted: i=1; AKwUvBzoZq2PM/PWBf30xhgMhr00NY3UnsotTzYo6QPM4lrfSsuapRAxp+UqyRRj4fJBndQ8zncbZEcMAN4R4jE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVuirHXLtMy5ezWh9SPI5cvwmG6apQKYHnX5I0O8dc3HX2Ye8q
	8EVKjphRfV2Z+4Kkx28DHt4ZK/+ryrueC6LNUwBqVieQdpLl2YoQNiOZou6tF6v6TZ8frk6wMjS
	8SIdw+RTay8hSv3tVZEWG5MP9TA5EGFI8qbaivouiJrrSgt0L3Fwblrvq2Y+8cev6NA==
X-Gm-Gg: AYBFou0SEk0QWTIcV74jRmOQRyVTid6FgLKIUftD8B0Wwxm7l9RZx4TupSn1hmoxrrj
	160BweuiCAS3BSwiOL19YGd6X3KolWfQvbe3zpChjfN0r/S7O2zWTzD7kV5SbkLK5VVoGIXeNX9
	+e2LKiBekJkzn801OISPZNQ5ijK+ixN90V44LyOex4lQqkZPjW+BDCP94gToFC/b1Fo5PgN5pHN
	Nv2Ja8WbqBl0dGihWC92Si+vwpq27UMPRm7R9m/tZ0WpeYhlwMI6HeJIpBjO/UOt98IKlSG+9NS
	+fkF+jAOw6QHjWwVCWQtGXALusT7AUs3SVqUmQAMWs2fvvKj/FQx240NR/PCOyNSzwoaoEd13BF
	QKpkfhgD9ZQwnIWPXXTGnGWdGwJRhW3w88LzrfJn9/K3pNw4=
X-Received: by 2002:a05:600c:1f87:b0:4a5:1cf1:b7bd with SMTP id 5b1f17b1804b1-4a966a563ebmr53082025e9.16.1793197271151;
        Wed, 28 Oct 2026 07:21:11 -0700 (PDT)
X-Received: by 2002:a05:600c:1f87:b0:4a5:1cf1:b7bd with SMTP id 5b1f17b1804b1-4a966a563ebmr53081565e9.16.1793197270639;
        Wed, 28 Oct 2026 07:21:10 -0700 (PDT)
Received: from localhost ([2a01:e11:1007:ea0:60e2:dbb5:afaa:94da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97d38c583sm46318375e9.15.2026.10.28.07.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:21:09 -0700 (PDT)
Date: Wed, 28 Oct 2026 15:21:08 +0100
From: Davide Caratti <dcaratti@redhat.com>
To: Vlad Poenaru <vlad.wing@gmail.com>
Cc: Boqun Feng <boqun@kernel.org>, Bart Van Assche <bvanassche@acm.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Eric Dumazet <edumazet@kernel.org>,
	Breno Leitao <leitao@debian.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] lockdep: Keep dynamic key hash nodes in
 lockdep-owned storage
Message-ID: <auIE1OXQi8HMx8Dn@dcaratti-thinkpadx1nanogen2.milan.csb>
References: <at9eq_3YUIL1ACEK@tardis.local>
 <20261028114449.161185-1-vlad.wing@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028114449.161185-1-vlad.wing@gmail.com>

On Wed, Oct 28, 2026 at 04:44:49AM -0700, Vlad Poenaru wrote:
> On Mon, Oct 26, 2026 at 07:07:39AM -0700, Boqun Feng wrote: > Yeah, I

> If the qdisc case should be narrowed anyway, net/sched could skip the
> key for pfifo_fast, the only qdisc with TCQ_F_NOLOCK in its
> static_flags, as it already does for ingress, clsact and noqueue. 

I was tempted to do ^^ this in the past, but then I gave up because 
TCQ_F_NOLOCK can theoretically flip [1]. So I was afraid there was one
(remote, but still possible) situation where pfifo would use the qdisc
lock with no lockdep annotation.

> takes q.lock only around its requeue lists (gso_skb, skb_bad_txq) and in
> control paths, never across a nested transmit, so I don't think that
> brings back the mirred false positive from af0cb3fa3f9e, but netdev
> would have to agree.

maybe this doesn't happen for real, because only non-root pfifos would
have TCQ_F_NOLOCK bit cleared. But I wasn't 100% sure, and also afraid
of causing troubles on qdisc dismantle - so I decided to settle with a
better though sub-optimal allocation of dynamic keys for pfifo. If we are
sure that pfifos never use their qdisc root lock, I'm ok for a patch that
avoids registering dynamic keys like it happens for clsact.

-- 
davide

[1] https://elixir.bootlin.com/linux/v7.3/source/net/sched/sch_api.c#L1198

 

