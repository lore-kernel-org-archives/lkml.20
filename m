Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794932715;
	b=I297R3k9rnCqkFrQ8EG14r9MjC13oL9Q/UKzEiYCbO1xJS/Ag65tApqKGtHm9UMOt8Lt
	 2Dwfv9O810lUni0fOVDTslS/6Pk2qElBbV5fpUUQv/LCa6eoyrFl1T8IA4HezbRorZc48
	 UyodtzQyAReK1fv2MyIQYRJq3Iz9xl4Q6o3f6Zoh6BMmBCCuQeyY9s6LX7Qd/pYYupNav
	 gd7VcmFdA/FUe8KH1/Bb7AfSQyvP5GU4sLipJKe9ayN6jsoYTdCxYghziKZNU1Xi/ghI2
	 BvUz7/9S2pNn0D4doFjHJGi/YUumQnif0Z81D7JRTBiujXE7wHjGa7P0ul3y64dKieA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=Dd6p+0A7CXQ7D4pD1qKu0NUg6AeEjjFPjcqnd1+TzWc=;
	b=FSAZo+avSZenq8el9MQahdth2I+OPcg2p6UUzmYoR/p6pC5mBxI5Ix0eUUBoNIYUJHLW
	 3nr4v7X+sHYzZrJlfWwy3lisYQ1iCOO667rk9O1PfBupONGK+4frZ5YCcoXJRLIbSVSHe
	 u3nbSOcg1GGkj03nMcAN7GQAs94mvwY5+hj54BSpi+me5ScMQ8TnTtB94XDjNXesOfNpa
	 AD62UftCbwsLfA2eK3S/8v6n79Dd1A5fVItImSpCZZGL5o7XgrZRp/Gy9z7HnnJX0wgLe
	 yelXL5G0KnSfUm8g4nu3Dv0Bk3hxaVQ44SxYL3IfUeri0mnMdkzN5aYpY9lZtKp2Gmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pWMr14In;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB6F606A331
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:25:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FB6F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pWMr14In
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso486165e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794932713; x=1795537513; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dd6p+0A7CXQ7D4pD1qKu0NUg6AeEjjFPjcqnd1+TzWc=;
        b=pWMr14InHp/ry5q1q4M2Z2hrY2exyyyvQboMDVnfcHsnc7TGelW58WnN/M/rwyfhmu
         W3TLuKQvdDP3DjJTVoTHFkRbJ6W6oR+/lo7IXZNNjOka6hSe7j94dTmrbzwvQ7BRvACf
         uJR0aTzUlMIirtKevj9jBoSNmmhx4rqA/2Ijw9CemK27Plz7z3FXzE26s3vzm17cBdAU
         0VR+qKjSRMps070wmRsWRsucCG7EK9V5q+dWpbrpcPWgoyIpFAGm8YHJIYuo+DkfJ3U2
         2nYHakazGSSPiZBsvKlCCAc/RLjppcYtzrH+DWqSGQ1dviQa1Sa2S2q2ph7AY7Gfl1I/
         cfKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794932713; x=1795537513;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Dd6p+0A7CXQ7D4pD1qKu0NUg6AeEjjFPjcqnd1+TzWc=;
        b=UxLgYf/myQPLF3emJOUZPCUoVqUROSpLlcJ+QjwfERq9Zwa2A3GPxnFwJbUq0JTjxD
         ND+wavPztUgMdpeYUCBejtqSFOhNkV0vFCs322QA0VsyW3ZRs/aEfy9lzU3ougP2HvcY
         X0Ba1l+k6Kd+/50ePQHCJYzpAe8NWWKaZkVsPerps3MEC58WSe8N8mjEWULLXATrTYZx
         yg++BJS8yOo2a5DP1DWTagwzFrmtzui2DDCMLZ6bVNAvtTliAKIIX2z91AvwbN100JsO
         4xz6ahoANYQVlMEEv9CEg+6PY3nwQbly16UWJ5pNhPUL0mnjfKX+bhoVJvYwdSG5tWg4
         fObQ==
X-Forwarded-Encrypted: i=1; AL+hErHOFbxNm/Yv+ISmv5Vtzq3UpPwTjj06h7JXDLVQJvdV/dnMk6y3fxQT+BaH9gWshBmWeleTA3dm40vYyPM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9t+fcqR/npOrZ7PtuU1HR2PpyaXx4se2sFsQSpkVgqtOX1v+2i
	gVs5kl9MzQRSnXCGv9EeCapynZLuAjCRXR9QVmGlT2G219EM+Mt3o4RM4MHvH8KMOg==
X-Gm-Gg: AYBFou1qws+G8xXGwFw8t57UBYbj1xPDsrI+3poXRb6OODL4ACWUrgOdgKxIVJ6+05G
	XEfeqfPaW9x82r+zUGBlOEWFFrMPOhVxXNUAnQ2VKl9RFTqLiAozQ8C2y7BlIoM1Vk5tZQhTWgV
	UMdkOIbplbSpwdUj+ZcJFlQXNcXhpu9OQL4FFbsDAQkR73sztE3tZMUQg08O3IDtbdX9quO4n2X
	vFvf0bFih6H2l6gfRqHvRxgQzghQuyDROReKt9hbmoGEkav81za8ix0zIKSzB2sFOYqD/ejVKli
	qee98XE2q1t88FHCnWI73E04Ix+9XlDrMmbcL46yC4nJp6czm8wjOKmB+CYHij5fFb0ydRR16cx
	Q+duxN7EU9S+jvFyqB+n9D4x5AAi+7x8RfsEMunBleaUZdSyIsc63QlECcy61/xW3EpdMmd2fW8
	LGsFgP0cD/9HeeYE437b6A0htWEYP1wet4JMhHOr2qlFf97hlEOdRWQy7rTqMEWcDEYqdzvuzc1
	JnmMQ8SHbiUFAc1/EMOIBb3Z/dd+TQJjOcCWobG/o3AYNKWtJJ9gwaT4eUxQ+Wq9QX2UY5TrtZd
	Tx4RrSwz3cbS8qUZ1G3dLOvFxWivmD/0r9hnXQUW5q/LkNkoKJRaQojaLHt+
X-Received: by 2002:a05:600c:8518:b0:4bb:5de1:e90f with SMTP id 5b1f17b1804b1-4bb5de1f1fdmr285335035e9.31.1794932712688;
        Tue, 17 Nov 2026 08:25:12 -0800 (PST)
Received: from google.com ([2a00:79e0:288a:8:12e4:4602:d8d8:3043])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783e9288sm79973145e9.15.2026.11.17.08.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:25:11 -0800 (PST)
Date: Tue, 17 Nov 2026 17:25:07 +0100
From: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>
To: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc: Ada Smith <adasmithgt@gmail.com>, Hungyu Lin <dennylin0707@gmail.com>,
	James Morris <jmorris@namei.org>,
	Josef Bacik <josef@toxicpanda.com>,
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <serge@hallyn.com>,
	Serge Hallyn <sergeh@kernel.org>, kernel-team@cloudflare.com,
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [PATCH v2 6/6] landlock: Fix capability restriction documentation
Message-ID: <avx_49eHcDPjyuDU@google.com>
References: <20261117101157.2520463-1-mic@digikod.net>
 <20261117101157.2520463-7-mic@digikod.net>
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
In-Reply-To: <20261117101157.2520463-7-mic@digikod.net>

On Tue, Nov 17, 2026 at 11:11:56AM +0100, Mickaël Salaün wrote:
> Some documented claims about LANDLOCK_PERMISSION_CAPABILITY_USE do not
> hold for every capability check.  Remove them instead of listing their
> exceptions, and call it a permission instead of a hook.
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
> https://patch.msgid.link/20261110202436.2408244-7-mic@digikod.net
> - Add Serge Hallyn's Acked-by.
> ---
>  Documentation/security/landlock.rst      | 8 ++++----
>  Documentation/userspace-api/landlock.rst | 8 ++++----
>  include/uapi/linux/landlock.h            | 6 +++---
>  3 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/security/landlock.rst b/Documentation/security/landlock.rst
> index d81f1c2cd236..98c2e7139e8d 100644
> --- a/Documentation/security/landlock.rst
> +++ b/Documentation/security/landlock.rst
> @@ -8,7 +8,7 @@ Landlock LSM: kernel documentation
>  ==================================
>  
>  :Author: Mickaël Salaün
> -:Date: October 2026
> +:Date: November 2026
>  
>  Landlock's goal is to create scoped access-control (i.e. sandboxing).  To
>  harden a whole system, this feature should be available to any process,
> @@ -359,9 +359,9 @@ framework in ``log.c``, compiled under ``CONFIG_SECURITY_LANDLOCK_LOG``
>  (automatically selected by ``CONFIG_AUDIT`` or ``CONFIG_TRACEPOINTS``).
>  
>  Audit records respect audit configuration, the domain's Landlock log
> -flags, and ``LANDLOCK_LOG_DISABLED``.  Tracepoints fire unconditionally,
> -independent of these settings.  The denial counter (``num_denials``) is
> -always incremented regardless of logging configuration.
> +flags, and ``LANDLOCK_LOG_DISABLED``.  Tracepoints fire independently of
> +these settings.  The denial counter (``num_denials``) is
> +incremented regardless of logging configuration.
>  
>  Each denial tracepoint carries a ``logged`` field reporting the
>  audit-logging verdict: whether the denial would be written to the audit
> diff --git a/Documentation/userspace-api/landlock.rst b/Documentation/userspace-api/landlock.rst
> index 3d45b956b640..d00e94d8ed37 100644
> --- a/Documentation/userspace-api/landlock.rst
> +++ b/Documentation/userspace-api/landlock.rst
> @@ -8,7 +8,7 @@ Landlock: unprivileged access control
>  =====================================
>  
>  :Author: Mickaël Salaün
> -:Date: October 2026
> +:Date: November 2026
>  
>  The goal of Landlock is to enable restriction of ambient rights (e.g. global
>  filesystem or network access) for a set of processes.  Because Landlock
> @@ -532,7 +532,7 @@ acquisition via :manpage:`open_tree(2)` / :manpage:`fsmount(2)`.  Namespaces
>  the process is already a member of when the domain is enforced are implicitly
>  allowed (the process could not continue running otherwise); rules describe
>  which new namespace types the process may acquire.
> -``LANDLOCK_PERMISSION_CAPABILITY_USE`` gates every exercise of a capability
> +``LANDLOCK_PERMISSION_CAPABILITY_USE`` gates the exercise of capabilities
>  after the domain is enforced, regardless
>  of how the capability was obtained (inherited credentials, ``CLONE_NEWUSER``
>  grant, ``setuid``/file-cap-bearing :manpage:`execve(2)`, etc.).  Configuring
> @@ -641,9 +641,9 @@ after a domain is enforced through user namespace entry or :manpage:`capset(2)`;
>  privileged sandboxes that did not set ``PR_SET_NO_NEW_PRIVS`` may also gain
>  capabilities through :manpage:`execve(2)` of binaries with file capabilities.
>  In all cases, :manpage:`capget(2)` will report the credential's capability sets,
> -but any denied capability will fail with ``EPERM`` when exercised.  Do not rely
> +but any denied capability will fail when exercised.  Do not rely
>  on :manpage:`capget(2)` to determine whether the policy permits a given
> -capability; only the actual operation will return ``EPERM`` upon denial.
> +capability.
>  
>  Truncating files
>  ----------------
> diff --git a/include/uapi/linux/landlock.h b/include/uapi/linux/landlock.h
> index 24510e5d8479..c9e4ce23778b 100644
> --- a/include/uapi/linux/landlock.h
> +++ b/include/uapi/linux/landlock.h
> @@ -622,9 +622,9 @@ struct landlock_capability_attr {
>   * - %LANDLOCK_PERMISSION_CAPABILITY_USE: Restrict the use of specific Linux
>   *   capabilities.  A process in a Landlock domain that handles this permission
>   *   is denied from exercising capabilities that are not explicitly allowed by a
> - *   %LANDLOCK_RULE_CAPABILITY rule.  This hook is purely restrictive: it can
> - *   deny capabilities that the kernel would otherwise grant, but it can never
> - *   grant capabilities that the kernel already denied.  Support added in
> + *   %LANDLOCK_RULE_CAPABILITY rule.  This permission is purely restrictive: it

"The permission is purely restrictive"... that sounds like an
oxymoron, similar for "[The permission] can deny capabilities..." in
the sentence below.

It is not complicated though; How about just shortening the sentences
"This hook is purely restrictive: it can deny ..., but it can never
grant capabilities that the kernel already denied" down to

  Landlock only reduces the capabilities that processes can use.  It
  does not let processes use capabilities that they don't already have
  without Landlock.

?

> + *   can deny capabilities that the kernel would otherwise grant, but it can
> + *   never grant capabilities that the kernel already denied.  Support added in
>   *   Landlock ABI version 12.
>   */
>  #define LANDLOCK_PERMISSION_NAMESPACE_USE			(1ULL << 0)
> -- 
> 2.56.0
> 

Reviewed-by: Günther Noack <gnoack@google.com>
