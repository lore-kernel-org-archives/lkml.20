Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479D337A846
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792232453; cv=none; b=lhLA5ViqmxyJYe9o20/t0JlLiDV5sw3vkM/AOSAkVA8V4yzqugM8bM0st2EJ4sjU1acLqWOBsEpmyv/hFHPUIeSg1kLFmkXs9h5jKtlwx4bHjl7bqJ4g4r+/qKejncD+luJW3LBGTT0w8Gux3haHBIhSWkXKfLLFEei1JmSOxe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792232453; c=relaxed/simple;
	bh=9FufBxS18S0dldWgNka4fjZzVhFxBqVzPaTUx6dFpcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ENcnCrDCfk2WMt9Ywr+J/SepdsXPnBbyd4G/r9QN7Gul889CbmxthGvo1NAfmoTy4gM9dLhSIldKxJ1nTbeP8BIcrTi4ky9WY0ANmabEnW+ITsB7I19wOGfl0Axd45W3rXe1zj5mTeuWnswwr0v7QeWhpAcnVLBPs99nNmukxx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RmH9KjLj; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RmH9KjLj"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so7555405e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792232450; x=1792837250; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F90DdJ/nHk53s3oA/K0TXq/qQno+kxaKM9BW1VR7338=;
        b=RmH9KjLjHdKCuQXt7ujzkZllp07gYV7EsaJcPBPEeQAqieLcLQA3ja0ymH2r/ZHGpE
         Y6pRGJ6ko3h4XldLt1+fo3VeBMoihEVkiVlZX9D+nO7JMW6cW1FAdSJblL5paDIeLYYi
         icL6lSfq1Q2WfZiT28KcD42ozT/a8hzNXIZlNHuyXgDHwe3LQJg71bKVWAzjHue0hLIr
         U7cUGVKf9qU+PMgSzkaeSHL6s4aHh0RlnYDKdyd+yRFFNl1n3wjCFvmsrSTU+mjgqjOq
         0uAI2GvTHW2bMN/8kmyIRnX81urBkMk0S0CzB3TjAo2fVumkQiwHYtXJkLTeA37O/jA4
         FB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792232450; x=1792837250;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F90DdJ/nHk53s3oA/K0TXq/qQno+kxaKM9BW1VR7338=;
        b=g3n4Gofo06kezIvAVdDg2gmZ8t2SLu0VUB0KDQbLmRz1Lpdh3nfp65iKenfzsBr+C1
         kDvYuLXj71jJKmQ9wBuyFYOrdtgxrgScQwtG/nQ3iOG+olTlCVtCU96rraabaV/DZy1s
         wsnrCjHR4oSAuO5u42mvYhfj9XOx2o73g6pjA7dw1oF+hnS+FWNAdJj14DLsE4vmrIZC
         gwwacxqowjd9jHIoN9YpvSd9QJ/GLQGrVhyfcPLnwAsJdmx7fKtWRwWLPrjaxs/39dSz
         ngnbY8M2Z3xprelOcQADCHlSUO7kDEQioJPrJkysnSVpTaiySo2lqWOifibuNP7Xi/7J
         6E8A==
X-Forwarded-Encrypted: i=1; AKwUvBwQeazmsAAjiT2vceI+67VcEoOSBmz9A0WajH08W0iozp+lkN95qvuEPxRUNKDYcsYUcY/q83wDzT1jMck=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmX+h4x/b91XYeomXQAKFpp9GNNGutVVj08XrSZ6cFvkhPb3ow
	iP8Viongs9YfnRBCCgXX0ZJdg5WAFMhN0FnQPe7+fQjbySHg37rkk0f9
X-Gm-Gg: AYBFou1zOUnlx5yn50SMATjkuVX2D8Qm/SUTtxjlWafw14S7ebztreGuL6xR2OlmERW
	egjZrlWekwP7Hf+uQxR17EE/53/jf41zFZkjrd7jTSb+Rsiznm4BwQY9dOAV7l/LQp/IkTv6U0+
	79fJ22wcFlwffy5hto41jDXFcpbU3AEZ4N4DrEo4VPs1+sQXk8PJwsTnNxr5TpM3I5VY5rzqC0C
	cavUP5o0hNEmky3siAePuhDDoGZ7lfO8WJykIXmOrTW/xyb188XeIjKb4aO8TG609hm4n5ogvgN
	FYDFabTOOpf2CvycZ0w4GxVVU4kbJ2VxlyrntMapjj+otEkNmd+6JORiLxZaLtkrHIEQjykS+DG
	32zNdoahZ34h8xgVu9fMFUSX+u3xKQ2NT8wRZlmCLWvJwHimTwqo0U6VV9QAXXWQx7y+Y//FxIc
	g3qPhZUH6QLiZqZaWiUVXH5hA6jb3f1Kw4rRFRirCWc4m607Rgnwd09Jc3s0z6avkLXfC0PA0YX
	fYo1FoK0cv1pBTxHKNlMu789o1kM9PxFQ==
X-Received: by 2002:a05:600c:4e45:b0:4a1:ac66:5f93 with SMTP id 5b1f17b1804b1-4a1d7607475mr50614295e9.8.1792232450432;
        Sat, 17 Oct 2026 03:20:50 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c9a6787bsm79353855e9.1.2026.10.17.03.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 03:20:48 -0700 (PDT)
Date: Sat, 17 Oct 2026 12:20:45 +0200
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: Christian Brauner <brauner@kernel.org>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	Paul Moore <paul@paul-moore.com>,
	"Serge E . Hallyn" <serge@hallyn.com>,
	Daniel Durning <danieldurning.work@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Justin Suess <utilityemal77@gmail.com>,
	Lennart Poettering <lennart@poettering.net>,
	Mikhail Ivanov <ivanov.mikhail1@huawei-partners.com>,
	Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>,
	Shervin Oloumi <enlightened@google.com>,
	Tingmao Wang <m@maowtm.org>, kernel-team@cloudflare.com,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: Re: [PATCH v6 1/8] landlock: Rename quiet_masks to quiet_access
Message-ID: <20261017.19431362edfa@gnoack.org>
References: <20261014082718.1435842-1-mic@digikod.net>
 <20261014082718.1435842-2-mic@digikod.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261014082718.1435842-2-mic@digikod.net>

On Wed, Oct 14, 2026 at 10:27:07AM +0200, Mickaël Salaün wrote:
> The base stores the fs/net/scope quiet bitmasks in a struct access_masks
> field named quiet_masks.  A following commit adds the sibling struct
> permission_masks field quiet_permission for capabilities and namespaces.
> quiet_masks drops the access category and keeps the type half ("masks"),
> while quiet_permission keeps the category and drops the type half, so
> the two read as an inconsistent pair.
> 
> Rename the base field to quiet_access, giving the symmetric,
> category-named pair quiet_access/quiet_permission that also matches the
> UAPI handled_access_*/quiet_access_* naming.  This is a
> no-functional-change rename.
> 
> Cc: Günther Noack <gnoack@google.com>
> Cc: Tingmao Wang <m@maowtm.org>
> Reviewed-by: Tingmao Wang <m@maowtm.org>
> Signed-off-by: Mickaël Salaün <mic@digikod.net>
> ---
> 
> Changes since v3:
> https://patch.msgid.link/20260726161400.3010511-5-mic@digikod.net
> - Adapt the rename to the split ruleset/domain and logging code.
> - Add Reviewed-by: Tingmao Wang.
> 
> Changes since v2:
> - New patch.
> ---
>  security/landlock/domain.c   |  2 +-
>  security/landlock/domain.h   |  4 ++--
>  security/landlock/log.c      |  6 +++---
>  security/landlock/ruleset.h  |  4 ++--
>  security/landlock/syscalls.c | 10 +++++-----
>  5 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/security/landlock/domain.c b/security/landlock/domain.c
> index 4031b581be07..c66663f8cd8b 100644
> --- a/security/landlock/domain.c
> +++ b/security/landlock/domain.c
> @@ -479,7 +479,7 @@ landlock_merge_ruleset(struct landlock_domain *const parent,
>  		return ERR_PTR(err);
>  
>  #ifdef CONFIG_SECURITY_LANDLOCK_LOG
> -	new_dom->hierarchy->quiet_masks = ruleset->quiet_masks;
> +	new_dom->hierarchy->quiet_access = ruleset->quiet_access;
>  #endif /* CONFIG_SECURITY_LANDLOCK_LOG */
>  
>  	return no_free_ptr(new_dom);
> diff --git a/security/landlock/domain.h b/security/landlock/domain.h
> index 428c1d9890db..61d89261e280 100644
> --- a/security/landlock/domain.h
> +++ b/security/landlock/domain.h
> @@ -130,10 +130,10 @@ struct landlock_hierarchy {
>  		 */
>  		log_new_exec : 1;
>  	/**
> -	 * @quiet_masks: Bitmasks of access that should be quieted (i.e. not
> +	 * @quiet_access: Bitmasks of access that should be quieted (i.e. not
>  	 * logged) if the related object is marked as quiet.
>  	 */
> -	struct access_masks quiet_masks;
> +	struct access_masks quiet_access;
>  #endif /* CONFIG_SECURITY_LANDLOCK_LOG */
>  };
>  
> diff --git a/security/landlock/log.c b/security/landlock/log.c
> index a8578a6f2ce9..3f9ae1bacb23 100644
> --- a/security/landlock/log.c
> +++ b/security/landlock/log.c
> @@ -436,7 +436,7 @@ is_denial_quieted(const struct landlock_request *const request,
>  	if (object_quiet_flag) {
>  		const access_mask_t quiet_mask =
>  			pick_access_mask_for_request_type(
> -				request->type, youngest_denied->quiet_masks);
> +				request->type, youngest_denied->quiet_access);
>  
>  		return (quiet_mask & missing) == missing;
>  	}
> @@ -447,10 +447,10 @@ is_denial_quieted(const struct landlock_request *const request,
>  	 */
>  	switch (request->type) {
>  	case LANDLOCK_REQUEST_SCOPE_SIGNAL:
> -		return !!(youngest_denied->quiet_masks.scope &
> +		return !!(youngest_denied->quiet_access.scope &
>  			  LANDLOCK_SCOPE_SIGNAL);
>  	case LANDLOCK_REQUEST_SCOPE_ABSTRACT_UNIX_SOCKET:
> -		return !!(youngest_denied->quiet_masks.scope &
> +		return !!(youngest_denied->quiet_access.scope &
>  			  LANDLOCK_SCOPE_ABSTRACT_UNIX_SOCKET);
>  	/*
>  	 * Leave LANDLOCK_REQUEST_PTRACE and LANDLOCK_REQUEST_FS_CHANGE_TOPOLOGY
> diff --git a/security/landlock/ruleset.h b/security/landlock/ruleset.h
> index cf77f1806a95..8ebdd4fa098f 100644
> --- a/security/landlock/ruleset.h
> +++ b/security/landlock/ruleset.h
> @@ -182,11 +182,11 @@ struct landlock_ruleset {
>  #endif /* CONFIG_TRACEPOINTS */
>  
>  	/**
> -	 * @quiet_masks: Stores the quiet flags for an unmerged ruleset.  For a
> +	 * @quiet_access: Stores the quiet flags for an unmerged ruleset.  For a
>  	 * merged domain, this is stored in each layer's struct
>  	 * landlock_hierarchy instead.
>  	 */
> -	struct access_masks quiet_masks;
> +	struct access_masks quiet_access;
>  	/**
>  	 * @handled_masks: Contains the subset of filesystem and network actions
>  	 * that are handled by this ruleset.
> diff --git a/security/landlock/syscalls.c b/security/landlock/syscalls.c
> index 1d02d57f4c48..17d8e9b7b0c6 100644
> --- a/security/landlock/syscalls.c
> +++ b/security/landlock/syscalls.c
> @@ -280,9 +280,9 @@ SYSCALL_DEFINE3(landlock_create_ruleset,
>  	if (IS_ERR(ruleset))
>  		return PTR_ERR(ruleset);
>  
> -	ruleset->quiet_masks.fs = ruleset_attr.quiet_access_fs;
> -	ruleset->quiet_masks.net = ruleset_attr.quiet_access_net;
> -	ruleset->quiet_masks.scope = ruleset_attr.quiet_scoped;
> +	ruleset->quiet_access.fs = ruleset_attr.quiet_access_fs;
> +	ruleset->quiet_access.net = ruleset_attr.quiet_access_net;
> +	ruleset->quiet_access.scope = ruleset_attr.quiet_scoped;
>  
>  	/*
>  	 * Emits before anon_inode_getfd() installs the file descriptor, while
> @@ -382,7 +382,7 @@ static int add_rule_path_beneath(struct landlock_ruleset *const ruleset,
>  		return -EINVAL;
>  
>  	/* Checks for useless quiet flag. */
> -	if (flags & LANDLOCK_ADD_RULE_QUIET && !ruleset->quiet_masks.fs)
> +	if (flags & LANDLOCK_ADD_RULE_QUIET && !ruleset->quiet_access.fs)
>  		return -EINVAL;
>  
>  	/* Gets and checks the new rule. */
> @@ -423,7 +423,7 @@ static int add_rule_net_port(struct landlock_ruleset *ruleset,
>  		return -EINVAL;
>  
>  	/* Checks for useless quiet flag. */
> -	if (flags & LANDLOCK_ADD_RULE_QUIET && !ruleset->quiet_masks.net)
> +	if (flags & LANDLOCK_ADD_RULE_QUIET && !ruleset->quiet_access.net)
>  		return -EINVAL;
>  
>  	/* Denies inserting a rule with port greater than 65535. */
> -- 
> 2.55.0
> 

Reviewed-by: Günther Noack <gnoack3000@gmail.com>
