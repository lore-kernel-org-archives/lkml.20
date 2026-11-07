Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794060141;
	b=NV9CJ5ON1C/A2L755HrdQp9FbZ525+m3ktS6WUs3i3fJ3gBbw/caRfYJnMGpmrJ+J70A
	 15t6XfG4CuNgOJM9O7Si44FHhjBuJhEVyzz76R26QOB/2n+H83qpPu6IniYB3QiCYcgy0
	 ay6lyasISvnnABgU0bSrxJG7VMTrLcRVoBXHXwo/j60D3L38/+t8+vqRm8SVCEJov2145
	 ROI8NNzBdy3PnCboVs1OfC78fBTyZ8YmgGjXc7Mektlc0CVYfEqiK4hj6Hq2vVUETX02r
	 d8YNZG2YULSpVyxpHBA+Rc1FdmnynXaxoJ5Cx2CFbg4jAegH9pNxNgjmyLYE5aYm4Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=jeBVTeWsp7XQ0SurPamFA2f1NhhOVbJgVg3z2VQmbcY=;
	b=cHi+5TgOaCXPxsgUj9egT0jbWS/bpLlD7+NEtIfX9uncCwouVc2QlVCQTWVqi/aKjgbC
	 eiXDem1b+LElmFI9IZNpOr5qTdLM7a0a6ZI2I6s8mh3OJrFQBOXwPUq0vuyfFQ5o0pXHG
	 oygmweq8mhQ7w2XQOL2WgQFRw1foBDP9BdwwW/RuzEhvokluZNHn2ZoI1bvFq7eVnALTm
	 ylfqLWRX+iwD2MdDp2v0oIaJ4FJBSJx1r8jXHzmpsxNxbMxMaiUJ73VbEw/TL2pU5YDNS
	 QGPclE0PZyco01VIXcj3xpFt9I/w9ocjmU3qLMIUnvfz62s/DygCbgmHHUCfpEbpjag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jzk4l6NG;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D432606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 14:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D432606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jzk4l6NG
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso9982835e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 06:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794060140; x=1794664940; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jeBVTeWsp7XQ0SurPamFA2f1NhhOVbJgVg3z2VQmbcY=;
        b=Jzk4l6NGiX+HqnSZ15BN+hLDZCao5gt3EsidYlulPs2AUjGEDiGyZWmwm8GmKHSpz7
         iojUe+nL1sffGrls1EUSz35B+L2zLMAWzn3KRUoxu3AB3ZRHqz38t+xAu5DP7CAmJiWe
         EUttTOAPYVEQ4Ocb2noeI2H4/PpcrlISqFg5v2u8vqoWbU+QuZHnJ1QhMU1ZI1DqjF6p
         oWHIXNW9fcG9yLHwYrFWx9+BM55KroP/iJ6Gkol1afqzYAE/n97WMEdQgmfsdIbRS4Ow
         UfN7mEd7pXEXIDUHJUhKpe4u2Jl3vfSxM3ISoBAlP1KVx1NoOmcMePRrTxtmfgi/KlbG
         UCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794060140; x=1794664940;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jeBVTeWsp7XQ0SurPamFA2f1NhhOVbJgVg3z2VQmbcY=;
        b=MmQC5M3OI1Wv5zvyG8J8fnA1nYt4Jpt7YTpg/b4I5Zuj++4eIiBCDMJcM/QT8H7xAY
         iDAqWM2ZKbc9NwMGKZ3JenbPTM5fAiSCu1c7lYrFB+QPjE5IlbdgJ6WdjwsoUZbKb3dc
         tINCSUDTOg6bvyKSxPTIYF0Opj4bZ3hjdw3Q9LZfE1ipzkZco6WFHV4XGj3K7eJaeIvn
         4Uf/u4Z8YdGMAog+2r5ostAzMuTuJU4OpLa6k/0vg+k4CzI8RQP+A/uTlRo2c7tGwxhk
         g3Q3+vzD56ExDX7dg2pNcHDyHbI/qQSsImh3yBKszQwdTvH9puDnkgD6WrCB27sO9DJk
         xtuw==
X-Forwarded-Encrypted: i=1; AKwUvBxb4M59WqD+LkUu8H5ZTMxfNtkiVuYv0FmBiT54dfzkl68x6bYNcTQ6sZaSMv/BiF3S5NwCvssD5Q2HBAo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8M9oCFSM82Im/BzzqFOO/uFtel9V0D1opqjXkB3sq+ZiDqif3Z
	xgk8JsD/fnbgO5iMlEq9QrQaaw1o0CmhmQf13NMGWw3jLIbtquygktdv
X-Gm-Gg: AYBFou02m0lULdIil9rzr2i67e5zH7z98IEeXFS+DZK+d5/3VNYG10jNoj7nsVbgEAY
	Flp3hzCphxwDYph8a6PebxyTpQcbdZHMJNcC2e9ybSp2IxhhUYPVCZEeZtVszp6Px7Y0gHmOZXy
	8mx9kopYu+ueqalLAwI2lj4IZZbq+zWQT6MMTcfnx9Pv4WtpIz3uVXO826VcAvHIyTjcT7WwasE
	oqJAluQ5+wXbS8jAMF5GZEIbh6ouyYN0tQCmyMfyZfwHs6jK4gbgfS1kRzQDQS5MNpkOBg8/Kvi
	pC+Wl/QzgK3acjZPYH1qXxlCkvxqtX8rtz7g4P6mMeMovvMaai7sXkEfO67M2jWsDiWv0QGws5J
	gyDYmhsrCUUsmlWjyOJlEghhOnhdQMzT4C7W3BWjHHrQjHvMI4ZTz2QgR0Fg8k3WgRaokIlJeyH
	R8Ft4t0vlY/cF+MhOsR32KuuUelQCAbpF1tMIGrw8yqMSjqHCQGDpeKzjbujzu+jciOdrSF3Nmc
	6fG4lK3iw9rISjONpF1eoIw4Bw0qQhJ0Y5RQA9sJj4JhDDCLuTPBFZQySMjnwcsEpEqJ9BP1lS+
	xk1Eoi66y9/uAWdUTw/PmdaiBczsiiG0k2WGkUNdGXYBdKP4HrTf
X-Received: by 2002:a05:600c:34ce:b0:4a3:59ee:86b with SMTP id 5b1f17b1804b1-4b6dc400256mr107335175e9.4.1794060139414;
        Sat, 07 Nov 2026 06:02:19 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1547fsm122148745e9.11.2026.11.07.06.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 06:02:18 -0800 (PST)
Date: Sat, 7 Nov 2026 15:02:13 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Christopher Lusk <clusk@northecho.dev>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] docs: landlock: clarify TTY signal scoping
Message-ID: <20261107.7c3abf9dfa59@gnoack.org>
References: <20260923163321.79770-1-clusk@northecho.dev>
 <20260923163321.79770-2-clusk@northecho.dev>
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
In-Reply-To: <20260923163321.79770-2-clusk@northecho.dev>

On Wed, Sep 23, 2026 at 12:33:20PM -0400, Christopher Lusk wrote:
> LANDLOCK_SCOPE_SIGNAL limits signals sent to arbitrary processes outside
> a domain.  A PTY master differs because its holder controls attached
> processes through input and signal injection.
> 
> Clarify this boundary in the userspace guide and narrow the UAPI
> description to arbitrary target processes.
> 
> Built the userspace-api docs; no new warnings.
> 
> Link: https://lore.kernel.org/r/20260916152336.1589383-1-clusk@northecho.dev
> Suggested-by: Günther Noack <gnoack@google.com>
> Suggested-by: Mickaël Salaün <mic@digikod.net>
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Christopher Lusk <clusk@northecho.dev>
> ---
>  Documentation/userspace-api/landlock.rst | 6 ++++++
>  include/uapi/linux/landlock.h            | 2 +-
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/landlock.rst b/Documentation/userspace-api/landlock.rst
> index 84cb7bf6b3ed..4d9fb1f1588c 100644
> --- a/Documentation/userspace-api/landlock.rst
> +++ b/Documentation/userspace-api/landlock.rst
> @@ -430,6 +430,12 @@ The operations which can be scoped are:
>      This limits the sending of signals to target processes which run within the
>      same or a nested Landlock domain.
>  
> +    Holding a PTY master FD grants control over the processes running under that
> +    terminal, including the ability to inject input and signals.  A process able
> +    to write to the master should therefore be considered as privileged as those
> +    processes, and this capability is not restricted by
> +    ``LANDLOCK_SCOPE_SIGNAL``.
> +
>  ``LANDLOCK_SCOPE_ABSTRACT_UNIX_SOCKET``
>      This limits the set of abstract :manpage:`unix(7)` sockets to which we can
>      :manpage:`connect(2)` to socket addresses which were created by a process in
> diff --git a/include/uapi/linux/landlock.h b/include/uapi/linux/landlock.h
> index cceda3b3b961..ad7b1ebd62ed 100644
> --- a/include/uapi/linux/landlock.h
> +++ b/include/uapi/linux/landlock.h
> @@ -500,7 +500,7 @@ struct landlock_net_port_attr {
>   *   connecting to an abstract UNIX socket created by a process outside the
>   *   related Landlock domain (e.g., a parent domain or a non-sandboxed process).
>   * - %LANDLOCK_SCOPE_SIGNAL: Restrict a sandboxed process from sending a signal
> - *   to another process outside the domain.
> + *   to an arbitrary process outside the domain.
>   */
>  /* clang-format off */
>  #define LANDLOCK_SCOPE_ABSTRACT_UNIX_SOCKET		(1ULL << 0)
> -- 
> 2.55.0
> 

Apologies for dropping the ball on this, I'm only realizing it now.

Reviewed-by: Günther Noack <gnoack3000@gmail.com>

A related documenation patch was brought up in [1] as well.

–Günther

[1] https://lore.kernel.org/all/tencent_1D938EDA50BCDB080CFADC6A@qq.com/
