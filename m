Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B245B3655DA
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790303507; cv=none; b=aJQs67OIOge8o19IaPNSZMr0/Q6gTyCUiSD24QSroylbIsiZJDencBM+1eZJbaBbXBh+pueqbJmupocBjrlApK466qtSMq7t08flwEprELo4aBgzespYACaFWP167oDhcLMXXPVWppUzdxksIgIf4XB4oSm7dN95s4vzdUCc8/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790303507; c=relaxed/simple;
	bh=SljNfVNJ5pizY7LCpaJ1sASBVfsjmcSyc0vmMRCo2ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A9QRBgyqVXnD10bjBxFQNHn3eq6aE+3/+93EdM69z68U2Al2q1ht6dJdchHvmE7r6G/kZ5HIejRlthuPkyMLgI1/RiwC3uwPgkRgZGMS8FzUkwTmtDECW2QUHZKbpfypi7LX8lzCG8Itr+tn1eek9b3NHW2cHjQLAXpTUQ50l+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DrEhTZAA; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DrEhTZAA"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-398a147688bso341185a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790303505; x=1790908305; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JRq4tbgSbpk+Qz2v2yaVUAKjhgwydGTRkhc54QDxkrU=;
        b=DrEhTZAAOSR2hs3ZHHSKiSpI2Li6WRS3zn479yagnQOOdK7Zei+PuZuesjfaxsZxU5
         CwWV4jHMSKOkqND+mCUjt9EpXsjML99fW6MXq0wcTEARpB1KERKK9nUuDaSYRxQWSNJ3
         KZRpZPxZsKLYxTUvPnhSNqulUfH1GelZOJDSqF3pE52YAaoTuT7eRaRQ7pwgZPVTpxBF
         UDgDz6uZbm5u1EMhn4xIJAOQA3bR88f6Hl/l055AmYzrG9Xj/5GnZB95tLQJuB1OtmNx
         olL+i0h0NFFaS3ZY9X8FyKXtk9TqskjNELykAxNxDS4Hq3vdeoScI3/sw6c0PFQ0qNTx
         uwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790303505; x=1790908305;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JRq4tbgSbpk+Qz2v2yaVUAKjhgwydGTRkhc54QDxkrU=;
        b=KIHRYwXxq+s+mPSarqfRE68HpUqptMkZO0mJa7ynMTQfzlMJ4bP25DjrqGX9tEYw/w
         hyeDRtws66kKeyXt3YYnr6d5rTTEGJyDv5zTPudyX+ibLGW5nAfxthiHz+Ea3xFIiFeC
         KLsWo7A0lu3NSRuhoOOvqYf92FP3/G9IrFrLld+wrA2wyVvzlEZkE1jZoTK0jx3TeA1e
         5iUl6T7ZPQNJwvoP80K+l2H0TD9tyfOThxXC4Pxe4uOSbEwXLebX7Qw7/ICmpaUjDybh
         f662CfacXnImeXdae4PBi5dYsGngH6eA2smfQPtSkirM5QiLlNP7tgkBZBOThO9EibCg
         7zrg==
X-Forwarded-Encrypted: i=1; AKwUvByRtcg0E8SQqXkxCRjlvV/66/rLSkeMgeg79ElenCwyxoFuO8rF8U0lUV+RdcqkYFQJ2CGrn2pbF0LAV98=@vger.kernel.org
X-Gm-Message-State: AFuF++luHoTD3Tm/r4H8K9/AaxvuKr+ZOoq2JaA10sJtBA7WPy77R6he
	aEVPMEppeK55XDJAayiA0DMg+M8wKu+DNXlWKHOaMziMtxai1bt4bOQG
X-Gm-Gg: AYBFou0VBUdKyK79CcvF2E+sZ6ZlFFPE54RBVVKyKvRvt1/fjbvX0c1Z7rgaCh/wGW3
	dyRjW286/FX3h4b8DTu9W5cX94wtvg1l2SPFQqqtJ/B/lhpeIZ9KQxZtX/czha/w9f0qx/J9Avz
	tEjHjS83rCClwEzShbXjp7GbOV4P+9nj2xjnfpRUG2Axo/FJqKa2wiFCE1A09unfLN/V991T729
	g+C3lMogBo6gjo9PLcrKXuVfRrNe0TrNMYxsicDjZGxNv6pmEt+jgOBLN5k1txl8k/jGKqzB49N
	rFYmXtCTnqk5PS25KDmJAaLSVqHHZFybdIO5O4koQXoUYM/A/sEnZVy2PuSZN+O56l9ZNpjXlxu
	uefcfuS3f5EvJooKOAOl1xJH6GgbXqWzWIhLJPTh8nGNXlhZiotYZP5+kV1AdqWU9HXbLMJl0SF
	caAptoq4xHC0Uap8WVI9h44qrfe5DnVfeeBVCHIN7U1C/rdZgFw7ukVJyKFB6iJ1mQz6wv/2VD2
	1H1TcfEZ90y
X-Received: by 2002:a17:90b:4d09:b0:39e:5cd8:2140 with SMTP id 98e67ed59e1d1-3a098d9609amr3542345a91.20.1790303504863;
        Thu, 24 Sep 2026 19:31:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9355e49sm1470015a91.4.2026.09.24.19.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 19:31:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 24 Sep 2026 19:31:43 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: rostedt@goodmis.org, mhiramat@kernel.org,
	linux-trace-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com,
	kernel-team@android.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] tracing: Fix simple_ring_buffer undef check on
 sparc64
Message-ID: <d1994ad3-473c-4157-902b-89b0ae3fcc6d@roeck-us.net>
References: <20260923074213.3077182-1-vdonnefort@google.com>
 <20260923074213.3077182-4-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923074213.3077182-4-vdonnefort@google.com>

On Wed, Sep 23, 2026 at 08:42:13AM +0100, Vincent Donnefort wrote:
> simple_ring_buffer relies on headers that end up including
> <asm/thread_info.h>. On sparc64, this emits the undefined symbol
> current_thread_info_reg. Allow this symbol.
> 
> Fixes: 1211907ac0b5 ("tracing: Generate undef symbols allowlist for simple_ring_buffer")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Closes: https://lore.kernel.org/all/5574c9e6-9ed2-4ee6-a2b2-fb6ee81e83a1@roeck-us.net/
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  kernel/trace/Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
> index 0e1846f7dda3..3860bc53a4be 100644
> --- a/kernel/trace/Makefile
> +++ b/kernel/trace/Makefile
> @@ -146,6 +146,7 @@ KASAN_SANITIZE_undefsyms_base.o := y
>  
>  UNDEFINED_ALLOWLIST = __asan __gcov __kasan __kcsan __hwasan __sancov __sanitizer __tsan __ubsan __msan \
>  		      __aeabi_unwind_cpp __s390_indirect_jump __x86_indirect_thunk simple_ring_buffer \
> +		      current_thread_info_reg \
>  		      $(shell $(NM) -u $(obj)/undefsyms_base.o 2>/dev/null | awk '$$2 {print $$2}')
>  
>  quiet_cmd_check_undefined = NM      $<
> -- 
> 2.55.0.1082.g2b9226bbc0-goog
> 
