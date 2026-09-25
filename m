Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED27536403D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790303484; cv=none; b=jFQJVb0Q6twW3C/fJyJapl37pbNbXvl7qtkzsMJmemfo6zRR7vkO4xtOgnY79TautklTKu4ZgHuBGvhfWOZufKLUPffPjuaTySNspQWJ2S7gWToic1R42iYJXQI1ozJpmsUyj94tUmHqdEdGDXbDTKTT5B/ScJ8inmJDdMH2OAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790303484; c=relaxed/simple;
	bh=XXqqfvuuz044nX/aEKeET9DgPsS/vggZM8IWukabHXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z6XMXjlON4oZhZw0342oWLSvkFrlE5LDlpzSLctRFIy4a5YLec2OvbziSegfIj4uky62QDoq3YsZYjzwxKokJ4EnXGaZ66ctzXw4WKFBsZl9ieJZwu4R0iNHa0bFChN9+bhqZvEEUc4hhzOUHMTjRUMEcFlC//LEhc3AnfGS4Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lXfm3+ZQ; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lXfm3+ZQ"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed9866so2778555ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790303482; x=1790908282; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s1QRu+lGJsmT+0vXomkywkgzh7zQTksmtyo4pAVpxeg=;
        b=lXfm3+ZQIzqzFssRwsi4aaRGcIKocP5Y8oEmPh4t+Il2/+jY5bPod0LhGukGJn6TRu
         nGAaxRsZ1XGsj9XYWLgx/elBUGg2gxipP0UAUOzDVLpba/UpAhU+wXbA8JOuhoRnzNfQ
         kaGyN+15i2zfDq8GHP4tGw3DEyCNQ4x+BvRX4yj6HZXfE1EfPwtqXceREDZ/bdxbQWZW
         fromew1d4B+2pg5UvcZInUf6PSIJYma+VG8ICZtNqIkVHbr0FSvGHqyDQRIx1ly1SPbF
         RDXdVT/MNc67N+mMKBMJkPueTO61PFcQCpYltreYkqI30lxJLkK/4ewtWyLc+1LWzBrl
         MjHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790303482; x=1790908282;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s1QRu+lGJsmT+0vXomkywkgzh7zQTksmtyo4pAVpxeg=;
        b=E7QCJi0FU56JIdMCrUXONDDrFb0Ied5J25pCfIaEl3BjXKzesganWzVJLcC7BCdv/J
         KQ3REYG0AjCjXIaxGA9rb1k3pm24/Rud0bEE+yIvUqBO0FST8Z0ZEdGHrZaQ+RV+I0H5
         QRFQV817WK9VZAQtDTQowwzYnxtz/qXwingHEHW/ccBToJPVcFkGJJnWKKLqzCkg/c6O
         OnWQurct42SDHQpNNylkkp6J3qF9tVJrlva5fnb62liy0H9Rq7ZmDy15PhHyqRQBpdCn
         Z6LaTGgYWC70kJVIj/he6zF0N3STeAjJ4HXLYrBXrmVkdUhscokaQFaYpxqV8WlybhZa
         oJrg==
X-Forwarded-Encrypted: i=1; AKwUvBxbbMJHJP83ysXm4rrH+gQyBk7ys55dCXh1s71X0yBpEIQHh+M4rfuwIbYNC94QF0eEzdiq2A/Z+T3dx/w=@vger.kernel.org
X-Gm-Message-State: AFuF++nn4s+y4aY13W+d/r6RFnUwkW+OXOT1DNL0hW7hDPJPzCxwF8IB
	wz1K0MjnFXd6bE3GmHN05ybgp0jLJDLRUwNsECUt7wLKzvX6iv+CyaKZ
X-Gm-Gg: AYBFou2Q1CmPUHofedvbdVbJ10flb2sCyivQnRqhix3GCFyjF2kCpbtqg3a/K41pqTG
	1bVaw22zWCoF6B3rY3Xj1CUSepF1WfELoYf6HxkQEQ7en+/CifRAeLJ3mgq/pxODg8h/eQ9/QIH
	kxbkoCtD38IpDmhOBrtkmwGYOmKTwzvLq+35BJeCpQWsnvZxPbrJ9LdJSxxC2mu05TtJsaRARF7
	+PhPg6flliiz0yJ9LEQXpDUA/QXY8NQLHAhIxQCS4AZap7bVomx/XoAk5nHxObkyoPcfQZsohXH
	Pj9/eJV5jhd3U+Kx40ZUW4jvnX+RzfJkClMfOsHluiSKimizYVXyTdbN8hWcxEm3cV+T+bMoUJz
	OngBf76BTHYeKogjtW0e4TGx8M/xwZvY+QXlxFnh4vGPB7MU8AwwA94REpzdvo5xVuqDQC+de6U
	orYk4ZX+rLIjTu9vGXONFaRakjiTRHSCxkRma2KzAZM4WeEqeYeHL8KoKWNnzCzKDvZngFIjoCv
	9tT2+znoHR3
X-Received: by 2002:a17:90b:2745:b0:393:19a3:4f1 with SMTP id 98e67ed59e1d1-3a098ae7053mr3838065a91.6.1790303482142;
        Thu, 24 Sep 2026 19:31:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b99e5711sm1386356a91.17.2026.09.24.19.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 19:31:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 24 Sep 2026 19:31:20 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: rostedt@goodmis.org, mhiramat@kernel.org,
	linux-trace-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com,
	kernel-team@android.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] tracing: Fix empty symbol names in
 simple_ring_buffer undef check
Message-ID: <157373a2-171a-4682-bccb-de4e17577e10@roeck-us.net>
References: <20260923074213.3077182-1-vdonnefort@google.com>
 <20260923074213.3077182-2-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923074213.3077182-2-vdonnefort@google.com>

On Wed, Sep 23, 2026 at 08:42:11AM +0100, Vincent Donnefort wrote:
> Sparc64 emits empty symmbol names. Skips them when establishing the
> allowlist and when extracing undefined symbols.
> 
> Fixes: 1211907ac0b5 ("tracing: Generate undef symbols allowlist for simple_ring_buffer")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Closes: https://lore.kernel.org/all/5574c9e6-9ed2-4ee6-a2b2-fb6ee81e83a1@roeck-us.net/
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  kernel/trace/Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
> index f934ff586bd4..0e1846f7dda3 100644
> --- a/kernel/trace/Makefile
> +++ b/kernel/trace/Makefile
> @@ -146,11 +146,11 @@ KASAN_SANITIZE_undefsyms_base.o := y
>  
>  UNDEFINED_ALLOWLIST = __asan __gcov __kasan __kcsan __hwasan __sancov __sanitizer __tsan __ubsan __msan \
>  		      __aeabi_unwind_cpp __s390_indirect_jump __x86_indirect_thunk simple_ring_buffer \
> -		      $(shell $(NM) -u $(obj)/undefsyms_base.o 2>/dev/null | awk '{print $$2}')
> +		      $(shell $(NM) -u $(obj)/undefsyms_base.o 2>/dev/null | awk '$$2 {print $$2}')
>  
>  quiet_cmd_check_undefined = NM      $<
>        cmd_check_undefined = \
> -          undefsyms=$$($(NM) -u $< | grep -v $(addprefix -e , $(UNDEFINED_ALLOWLIST)) || true); \
> +          undefsyms=$$($(NM) -u $< | awk '$$2 {print $$2}' | grep -v $(addprefix -e , $(UNDEFINED_ALLOWLIST)) || true); \
>            if [ -n "$$undefsyms" ]; then \
>                echo "Unexpected symbols in $<:" >&2; \
>                echo "$$undefsyms" >&2; \
> -- 
> 2.55.0.1082.g2b9226bbc0-goog
> 
