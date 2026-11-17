Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930104;
	b=iNmD5zM5yDHKUq+H9QoSwCAsYtDL2k+VnEw2FjIIW0PxTBQ4qPthqCSk9EPuYRl7NixJ
	 Elr/Vh4zMnkdjL0ePV/mFXhm9cXLTdcBevotaKSn2n50/h1oVqBc8dPcQnOgQvsZSNyG9
	 2T3i8F2zJ41W4sUYYU0MEB+Tg3HY4Ascu4DRo5uW9Y9it7lT/v5jxnlbnJS0qwqowM6de
	 bHj4V4Om1WI4l/7dQndMo6DTc8jCZThHfKdbytFYs1eY5jVQXUv9BbAHt0rjKDronq1u+
	 r6xjvS7MjZ9baUT9HlfeGxeK7QPL/wmZsYeHNA1A9e0IIAY9PRVHwUjrWZBfsSiOKAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=ynmtGThVfV9scNtYae6gYp9hmDX80T21RdywDg1Mt7U=;
	b=Lq1LqWS3QJzA+ohyNI9bTHFPM568NM83nul9ZAgyKSbNci0hlP+WKjiF8BfUrMj/ifYY
	 DYe+WatoWFqn5z7+Ps4P4ESTos2DxIeucKSdFXrCalQscVlxZhY4UPtPs2qVO07SVct2X
	 aRIYQAfYC2tZoc/Gg1hjjUxBgdnrndmK/F8L5LcuG01trLj0BHWwLUJWj+OvgV9NJCNHW
	 UwJqaPJ7vLLHePOYPU6ZuX9OJuHIUEvEoEchgvzwSL2zuB1OH/9Hl3BVJdHdLuG+w4YMs
	 NmLcZG3PVQem9XSewDKxR1kLW+wWk1Uyv6Z5mkxZqLWSWt+0PpoggQ+eVbFTh7ojVbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aaCtm8ia;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D226F606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:41:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D226F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aaCtm8ia
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso41375e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794930102; x=1795534902; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ynmtGThVfV9scNtYae6gYp9hmDX80T21RdywDg1Mt7U=;
        b=aaCtm8ia+vd7c0FVYlhQx82mtgp3Hnah+Qlm/51wHfJaqZeaLCO6yRn5d3tS3Odnpl
         dru0X3i5WADXm9cp1dVN4yzqaHNTAEGLY+0DEGf58Xhs+agh81pYOIcSJKda3d+NAT6Q
         OAarUle2akT2RBwVLnb18ibddaonrWd3TCkctbcQaSBIpbFTJKBgdJVYdUqKfuCWyHSh
         5Vpl163Jq3IyIMa3qQunmkyZmt/WGye+nTN5FxcYGC+k0OPgXxlWLHWctNOtD4c9jjhg
         N0rjsJYkYbniKEpCuTeygv5wTjh0vM+kG2Pb+9HSf3GbcQ0M+x/5FPnUEyT/e4IXoXCu
         pE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794930102; x=1795534902;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ynmtGThVfV9scNtYae6gYp9hmDX80T21RdywDg1Mt7U=;
        b=HVwkSQa1u0WS7Y6PG2elYpPxVm+jzc0pr4AH5i5nbYffEnWUhDNaJLrw9S9EYaEoh/
         BURC7wCc4xzjtQSJ8fqCaLQe6E1jml7+VmvSv1q90fNLgyW7uNDPYQDImqVaQS5q5nkv
         A0HqjQPetv75pFkbk3XcQzVkGlNEoOZ0Swn5narl4ps0ykqi5dR/E6cENMJEyVi23Ctp
         GtMwnZ4CzCDVC06pyspwFpZBZlRYFPcYnXM+SpiKwBqHLAfC0W/DfLOp6K7btmYWgq8z
         MTY4y36uWJty73VpxjL7dDJrS9NJYwdXRwk9X5DsWSdWvxsVn0mTYaAbSejo1NB7nidT
         FFEg==
X-Forwarded-Encrypted: i=1; AL+hErE2GIaEEmuc0ahrac1mkiR5M1UZLBMrp5dDLRaquyDGkoD3vVcmTbG9z7knAEq8CtzE6gZw6qxyLCBs0cg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FX/AE9YJCqzTm2djhXfzt8Gf/bnmV7mMv4KtgSBJZMmqGsDpC
	EYe42W8YeAIl8pNJnPGqodEvGiN0Q0z7XfeWeDMjJ8RDOHZsL+l7W6TJ/yqeyrHqDg==
X-Gm-Gg: AYBFou1xFcn5vlyVd5IP2FpRIBCAFIJFh1nLulD6/04VR62d9btGnw6f4A+rG1GN8lr
	U4u5LHj/3qAS5fKE/7ek6Hv9K+4+3CqfoYokdiI8P7s0jAV8Ry4Kb1k1gqXIDqAqrMhXaep6SjB
	07sp9KC666Zyawp/L82M/wOBRd1dfp2HeFIo6WE/w9CHjkSIXNGNf1IR4og/0PYcqIPC8e9IT8z
	gZXaS/Yaf2R5etNQLjJjr6/lPcv6xaVqvRaPrmafgro1EaeTzpaqD5/LgdT/262AUd3i9wTnvVt
	VD4reofj305shJUVX5rHCqFdyP87hItOHvJIA2KH7jN4krfhatgXwkFLUIgQ5MIZv+5CwrD3zGV
	aW+uYdYQyPFSLiCdKlhBtEBm6gQpqDPBO0Gn3V30yAHp3LK/cXfLm/Omgw9CjDwq0Vcyp/jpngA
	megbjVVr/gpEZwW9Vbl1cik07uVBFgGsuypVe+UkFz1sCw1DqIfudi8k6XExSzQjPc4CgNsS6wa
	u5gUIfqLGeA99r3JkonmBdu1PlO6Tb9si3gOY1ZXepBbNPp6RgfzAwoVJXEAdu5K9riOKRJwa8q
	n+DVCQdSIRhlyRGtnv8dkS5578kCNkqerI+MvvlejmSv2iMomH/r2C0SnqMr
X-Received: by 2002:a05:600c:1d0e:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4bb55a7f5f3mr304992945e9.32.1794930101543;
        Tue, 17 Nov 2026 07:41:41 -0800 (PST)
Received: from google.com ([2a00:79e0:288a:8:12e4:4602:d8d8:3043])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad9430asm46423145e9.15.2026.11.17.07.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:41:41 -0800 (PST)
Date: Tue, 17 Nov 2026 16:41:35 +0100
From: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>
To: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc: Ada Smith <adasmithgt@gmail.com>, Hungyu Lin <dennylin0707@gmail.com>,
	James Morris <jmorris@namei.org>,
	Josef Bacik <josef@toxicpanda.com>,
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <serge@hallyn.com>,
	Serge Hallyn <sergeh@kernel.org>, kernel-team@cloudflare.com,
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [PATCH v2 3/6] landlock: Mediate CAP_SETPCAP for inheritable
 capabilities
Message-ID: <avx1r36MHsxhAzSf@google.com>
References: <20261117101157.2520463-1-mic@digikod.net>
 <20261117101157.2520463-4-mic@digikod.net>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261117101157.2520463-4-mic@digikod.net>

On Tue, Nov 17, 2026 at 11:11:53AM +0100, Mickaël Salaün wrote:
> A process in a domain that denies CAP_SETPCAP could still add
> capabilities outside of its permitted set to its inheritable set with
> capset(2), if it held CAP_SETPCAP.  cap_capset() checks CAP_SETPCAP with
> cap_capable() in cap_inh_is_capped(), so the check never reaches
> hook_capable().  Through file inheritable capabilities, such a set can
> grant new permitted capabilities on execve() when no_new_privs is not
> set, which is possible for a domain enforced by a task holding
> CAP_SYS_ADMIN.
> 
> Add a Landlock capset hook that checks CAP_SETPCAP against the domain
> under the same condition as cap_capset().  As with the mmap_addr hook,
> LSMs implement their own policy in this hook: SELinux checks capset with
> its own permission.
> 
> Cc: Günther Noack <gnoack@google.com>
> Cc: Paul Moore <paul@paul-moore.com>
> Cc: Serge Hallyn <serge@hallyn.com>
> Acked-by: Serge Hallyn (AMD) <sergeh@kernel.org>
> Fixes: 97c8386f1d74 ("landlock: Enforce capability restrictions")
> Signed-off-by: Mickaël Salaün <mic@digikod.net>
> ---
> 
> Changes since v1:
> https://patch.msgid.link/20261110202436.2408244-4-mic@digikod.net
> - Add Serge Hallyn's Acked-by.
> ---
>  security/landlock/cap.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/security/landlock/cap.c b/security/landlock/cap.c
> index 10e1ca772b9c..c89e8d76db8c 100644
> --- a/security/landlock/cap.c
> +++ b/security/landlock/cap.c
> @@ -91,6 +91,35 @@ static int hook_capable(const struct cred *cred, struct user_namespace *ns,
>  	return check_cap(cred, cap, opts);
>  }
>  
> +/**
> + * hook_capset - Restrict inheritable capability changes
> + *
> + * @new: New credentials (unused).
> + * @old: Current credentials.
> + * @effective: New effective set (unused).
> + * @inheritable: New inheritable set.
> + * @permitted: New permitted set (unused).
> + *
> + * cap_capset() requires CAP_SETPCAP to add inheritable capabilities that are
> + * not in the old permitted set, but calls cap_capable() directly, which skips
> + * hook_capable().

It has taken me a bit of time to wrap my head around this one.

cap_capset() starts with:

	if (cap_inh_is_capped() &&
	    !cap_issubset(*inheritable,
			  cap_combine(old->cap_inheritable,
				      old->cap_permitted)))
		/* incapable of using this inheritable set */
		return -EPERM;

where cap_inh_is_capped() returns true if it does *not* have CAP_SETPCAP.

So when this Landlock hooks gets called, cap_capset() has already
checked that we either have CAP_SETPCAP or inheritable ⊆
(old->inheritable ⋃ old->permitted).  So the Landlock hook can check
for the cap_issubset(...) condition to see whether CAP_SETPCAP had to
be "used".

Maybe it would be easier to phrase it like that?


(A more specific nit about this comment, "calls cap_capable()
*directly*" has confused me a bit, since cap_capset() calls
cap_capable() only *indirectly* through cap_inh_is_capped().  Maybe
"promptly", or "immediately" would be better?)

> Check the same condition against the domain.  commoncap runs
> + * first, so this only sees requests that commoncap allowed.  capset(2) discards
> + * @new if this hook fails, so nothing is committed.
> + *
> + * Return: 0 if allowed, -EPERM if CAP_SETPCAP use is denied.
> + */
> +static int hook_capset(struct cred *new, const struct cred *old,
> +		       const kernel_cap_t *effective,
> +		       const kernel_cap_t *inheritable,
> +		       const kernel_cap_t *permitted)
> +{
> +	if (cap_issubset(*inheritable,
> +			 cap_combine(old->cap_inheritable, old->cap_permitted)))
> +		return 0;
> +
> +	return check_cap(old, CAP_SETPCAP, CAP_OPT_NONE);
> +}
> +
>  /**
>   * hook_mmap_addr - Restrict mappings below dac_mmap_min_addr
>   *
> @@ -113,6 +142,7 @@ static int hook_mmap_addr(unsigned long addr)
>  
>  static struct security_hook_list landlock_hooks[] __ro_after_init = {
>  	LSM_HOOK_INIT(capable, hook_capable),
> +	LSM_HOOK_INIT(capset, hook_capset),
>  	LSM_HOOK_INIT(mmap_addr, hook_mmap_addr),
>  };
>  
> -- 
> 2.56.0
> 

Reviewed-by: Günther Noack <gnoack@google.com>

Code checks out, only minor comments about the documentation.  It has
taken me a bit to understand how the Landlock hook's logic matches the
one in cap_capset().

—Günther
