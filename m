Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792757991;
	b=iTtAJ5QO412TjLnZ3z3NjF9bCRjNpjsssz9zKtoN4TSs6zPKiV4K+syWSpe9ODu1XoDx
	 CLMxpkP/PuHlAKAT98T8h7qfRqwnqe80UJgVOVjQZd/NlOoNnSl778PoAo4+K3wYP7MrN
	 jSIAS7KwS9xPJk/q/kkROtNLcMq3F0718jp0IKdXBCc0Exbjc7N1IU6h7fCRacY8HWKzi
	 0j7a2Nhf9BAtCbEQ5aMTzt3XlR4TGsBGUs+4XWmBo1uqj+e4CBxCq6LvR1E/DW9VDer1E
	 0/sJTHYDENcOLhQIuTeTUSC2dp1F5rOUhrKtJgo+1hYhylF2h2KQAMAxoazcBZgy2OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792757991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=b+XymWLVoX8vB68R5CvHr4Z7XFy3vIesV9wzBrMjA78=;
	b=h3/6eeCm0vkLHtCKveMYtJNrk0A+LJvHhH+fWQg1nBx1f1L51o+mQ6eGTKwurBdzoIUa
	 HYxOYk5lhqaEozNvZ+dxg0S4HgA+7drUS0cnjC0hl9YUHSHNAszIqZDdlSv1RLzStLH7P
	 APDIzeEeBHpuKPRjr0bNOOuzJRBjd9ALZzM4ddr4riRQ1Y/wGTLgbN2ZUSEMaTrerLaxl
	 Zmt/AgND/YW340EsAX7h2zO5CWNqqBhV8faMuPMCbalsu5YTXxpq53Nbh9hpVZR8ZzRlu
	 LiTT8HZSSwvFqI8qLUEmcT8pAlej1m2sT3NgW+XjhCkm5old7QcBbPreAZ9lPtdh0xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D4Ww5XBc;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67005606A322
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:19:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67005606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D4Ww5XBc
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c46822eefb6so103682566b.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792757990; x=1793362790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b+XymWLVoX8vB68R5CvHr4Z7XFy3vIesV9wzBrMjA78=;
        b=D4Ww5XBc5qWGwgQdAAf7AJ+qkyPmCuu7N4V1KBARpvyAOtW6Fv9EZMduH3qQ4f/fei
         jxbu71Ig6rhKDGbzs0II4n1OJ2sBivQKFJRcxJpBIWJXGU8b/acm4CxDOkUZDT8LpYJ/
         Ry+Pgd/w0UTxfRZmg4N5IAezNG0b45gZCPFR1oLfcrWcIRRv0Fnh2ODC26oCLn2j2fNE
         w0duXd0C7Brjb0hQO+3rGqbZz2ocmA/CVt5mWLWQtqClzx80xzOUEYr97cK73CeazsHN
         QtEAtckUqVTUlba7I9JaYS9/n/ngyIO1b+Jp5Q/aPlaT3HvvJCt8ywWZXZOwCKmxhN96
         KHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792757990; x=1793362790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b+XymWLVoX8vB68R5CvHr4Z7XFy3vIesV9wzBrMjA78=;
        b=2MDbxZOw9pF/zEmdYsZQ9EYrDJW2V71x27ocCeL8lN9XsGVEJ2y0pjQqLu0TsOG4bj
         DVHpcSZ6p38ssglIQYq9PQ+u+jeoS0uEpuQ+DwHLDJ6gP7JcbM8QYs6nPomnvwJMrrUk
         cq2QOYoiXnlw6clCxjKAzCciNlxDf2YfS5gsH1CArgc7+WjdySDTIAVvKlh75lIXwaei
         Yd5Wti8Vs+d+scCqFC3pYCCfed5CA3P84lMxuYL0aPHZzah3oDLsq2scyFwkgvAFuyqy
         dGX1iZSJpi8jVRy4vdgzaC5n9/oQ+7CVYFX8df52JTtT+K7jtzZrDH0zygbGziXwP6dI
         0JNg==
X-Forwarded-Encrypted: i=1; AKwUvBxSmQ68C3ZIEcXea2u1YmJkxxZNjWW2OtGjFhBc940FmeUCS2e8vkGVpSa0SHOXeT5MdyzkxkGJZD2588I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyg1zx4dlPAh4qGBAn2DYwsEPl8H5qAFaz+Uz3TjxaQ/9v0STB
	pVi+RLFvYtFnMw0Zdn00+pmmzbHq+R9xpByIJQWQtcdb6Z5Z2n6G7MlxXA5ou99vswiSMA==
X-Gm-Gg: AYBFou1ZiU6/aQ2ONOJ+sIPsJHOYCJPuJzzJEyf1+0xsOC8jkujxtEGF+gDPWrJguj+
	3+PWJmEU2J6UaejVa8pllfT0KMj1gBk5yaluDAwLqEjfZ4YKyS3DpUeINu3hq+Qt30e0ZeWLLRR
	5spRtvWcpcCNQih5yF2isNBXDp3mridsVW+Jcv9bKUgEoVL792+GuZknDw3DyM/pVkLw0BDlW+V
	FVj/gzdAhDHUB9BysLCaMcoVin0LWocfm06G1c2Q1R5MlzzaXp/K0mIgjjXMPK3b9dX2PDN0Fvf
	kDxsbF1drdhcJqRuxiEHvLXSLZlOaA/gx3mxDlWgz0NnziFtdM6OW2fOEvjV/7SgR713igz214D
	tqzgqqk6YM4ATvrIkRUeW2l9cs7UtGW3uxHn8vCD3zdHKkYCjoK/bHevtbyyDV0iPSfwO09Q5Lv
	pm+bY6YVAV+s/A57cSTEbtW6kg9yQ7ZF4VBUOoMYkh3mxtd+ueNfraRdhbiWkULMLLKrE2grScP
	nOY6X0trw9FZFc95e2kCzIorGW3156NxwzXt9e1PyKn0DOT5w==
X-Received: by 2002:a17:907:7b8a:b0:c2b:f3d5:2090 with SMTP id a640c23a62f3a-c46a9039cadmr303485366b.27.1792757989570;
        Fri, 23 Oct 2026 05:19:49 -0700 (PDT)
Received: from localhost ([2a03:2880:32ff:73::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5cb7fd2sm96847166b.61.2026.10.23.05.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 05:19:48 -0700 (PDT)
From: Vlad Poenaru <vlad.wing@gmail.com>
To: Bart Van Assche <bvanassche@acm.org>,
	Boqun Feng <boqun@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Eric Dumazet <edumazet@kernel.org>,
	Davide Caratti <dcaratti@redhat.com>,
	Breno Leitao <leitao@debian.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] lockdep: Keep dynamic key hash nodes in lockdep-owned storage
Date: Fri, 23 Oct 2026 05:19:46 -0700
Message-ID: <20261023121946.2260882-1-vlad.wing@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ef57e0ab-f0b4-46d6-a2f8-f6c97fec8d8e@acm.org>
References: <ef57e0ab-f0b4-46d6-a2f8-f6c97fec8d8e@acm.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 10/21/26 8:01 PM, Bart Van Assche wrote:
> This patch introduces a new hard upper limit on the number of dynamic
> lockdep keys. That's unfortunate but I assume it's not possible to
> eliminate this hard upper bound if the key storage is owned by
> lockdep?

It isn't inherent; it comes from preallocating the nodes the way lockdep
does for its other tables. Two ways to lift it:

1. Fall back to the embedded node when the pool is full. Keys
   registered after that are linked through their own hash_entry, as
   today, and only those wait for a grace period when they are
   unregistered. The key stays at 16 bytes and there is a second lookup
   path, but running out becomes a slowdown instead of lockdep turning
   itself off.

2. Grow the pool in chunks allocated outside the graph lock in
   lockdep_register_key(). That removes the bound without a fallback,
   but it is the allocation Boqun preferred to avoid.

For what it's worth, keys whose locks are ever taken already count
against MAX_LOCKDEP_KEYS (8K classes), and the default pool is 16K, so
what the cap adds is a limit on keys that never get a class.

Boqun, would you prefer (1), so that the cap can never turn lockdep off?

Thanks,
Vlad
