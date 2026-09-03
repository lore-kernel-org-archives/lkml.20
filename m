Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0465372B27
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 21:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788471858; cv=none; b=gDyDIuZgjpvVR5zwzTCjA+BPx9hrwGL0slUdP9ytY2xuWKb2l/rk0s5v6D/uz11kffyFpc7yNso04s4r+ektmFy8J4MTGd5xlxCr33Gr55Y4kQWv7Y0lwbu3EBIkqoSfvsMqkkv4SPTLf7lDlHRzj4r8OOkWXoZQsMl/dXrhzkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788471858; c=relaxed/simple;
	bh=Hueze08T5W2Ew3KvtbFUwllkqFG9iBBmCN0tN3fMiF4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JxBrf9fvUys9IsZFwI8U3uUR73JBUdBKSeP2NJd+U1/CBUPrtLzkvLtD65j7p7dCmkGfoCPDohTWnRBkE2Z0flamwizbnih7oyKdeU0nQO3NCmV0YyE+NzjG+mT4Annv7rrOSIryhsKx6teYMBOc2m9woJQu4YtDWQO8S+IM394=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nWyNQFWH; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nWyNQFWH"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso6326295e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 14:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788471855; x=1789076655; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6xH2vpFd7/KJDLnoGJY2uG70zopl/sgcsHz1QS01L2Y=;
        b=nWyNQFWHYRomINWyzEpz4daStstzjj7USzRBX7OZhdsPvEnwkqew7wjBrZUgNphI4q
         clONN6W2nK3Hkaeslp6Y9iquNxo1sIikUyDiSJ6vlZWq4EijTW9KpsuQD+QlHjdNIJFp
         kRcSKykak6ao6yejYHhDygJ6XUfnEUrOkDvHHUNksQ9eSP9zdvMCp5ZBpth2CsteffAg
         BaA9iCMcvpHVhFfGWmbMxjhD4ZSscm666aBNVSKUI1xUSUI70lc9VDx3WpZGkDIDXxj6
         0xuInNOtC6jDrB2ZEuyeHqm6ywIUzvOImkcSe7fjmt0hlun53eL5LaMROYegBcNHaw84
         a5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788471855; x=1789076655;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6xH2vpFd7/KJDLnoGJY2uG70zopl/sgcsHz1QS01L2Y=;
        b=eRJfbWIiG/D+O4MeOwvXPSbFWyjHonMPFTuyMK/2Eoee2SdgMGjeUqMx92rY6Mb7F8
         T9mt9Lc1XRmkbgdtVfj6QKpqYHjokv56S6olytZiN3vB1pjldoAIKsWZ3+2gByxpOd1p
         EHhp59YCncbWDgDpQ8gxKWJiT/epEQsP8UKbZMnRemH2U4LJQCFCKUZlEeLHYcSevUbV
         LrWjwMfPKBANvIfE1ZnkiUDe18s2e+gumO/bG7iWmUvRhKkUrxN1qEaGABZT9dQUPpA6
         YFrOnwjTqH50WB/U+N7GEkjnrNx5fylsrleyYMxq5ZuLZjxwffLnWNM5C5NxSEBS7K4x
         NWRA==
X-Forwarded-Encrypted: i=1; AKwUvBzdCybK2G6n+547pIoDTy1+jrZUckqdoNy95sWLa1G+M6ghJkyB3giH1/9bfFLqWGtINBV4lS5j7HgoICc=@vger.kernel.org
X-Gm-Message-State: AFuF++mKga2AqTHigiM3Yp2Mywoir3EiT91XxHnIN/Kx/nAg+4MCrDqW
	9vMXAe8COEVlVa00RWbTIAEBTlfqo2na0PFeXC+BGc92X0kuMSjE9dIq
X-Gm-Gg: AYBFou23npf5b4uk1QLNdeVBPibAMJ1EmrkllcZgacetdjRqWkMj3DkZF4oE9UkLMs/
	ulF/hG5Liu/pj5O6X1gIvMij3iqkpnfXUfAkM59Gms6osrhsOSIpsu//LcvhhJVtFYf0QJeb38w
	LgnIZlt+gmPguX1glh7pZkQ7q6CQt4xNYKblSIYrbarmqXnpLI8nvXktu8u79aGXhx9+A5ZsbLQ
	zwTyoENlDg2XANhv/X5VyN9xuDbkbV1Q/Rn+OyzCpt9VlpRl83qHct34lRr4cJTT3BlQEcsk4Jq
	zdNWc5MBHMb5tbyWpqrO5Z2QkM5UDZrFd91XROYrHbRlxA/ZcoafH13Vxp3zCu2I1EXNrCIVhfy
	NcaW0FI0f0LNKbGLfQIfrVY9YJwot9Ynlkzk+yKnP98fPauNcXIlRFTw5/zBk4Bpn/5G6CLycdH
	owThxFeoGSLVOCGgaZU2V0Do7CC/RU4ACqFwMG0U+W83OD91V6L4O4f0CjcAj0dnClw2SBcv2Sz
	DuXxi35TuJrhmqT9e7hyABRGg==
X-Received: by 2002:a05:600c:5251:b0:499:9eb8:a1d7 with SMTP id 5b1f17b1804b1-49cf825c45emr14362655e9.9.1788471854969;
        Thu, 03 Sep 2026 14:44:14 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee60d9c6sm104115335e9.11.2026.09.03.14.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 14:44:14 -0700 (PDT)
Date: Thu, 3 Sep 2026 22:44:12 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ajith P V <ajithpv.linux@gmail.com>
Cc: tung.quang.nguyen@est.tech, jmaloy@redhat.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 netdev@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v4] tipc: replace deprecated strcpy with
 strscpy in tipc_bearer_get_name()
Message-ID: <20260903224412.179c87a1@pumpkin>
In-Reply-To: <20260902053043.1483895-1-ajithpv.linux@gmail.com>
References: <20260902053043.1483895-1-ajithpv.linux@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  2 Sep 2026 05:30:43 +0000
Ajith P V <ajithpv.linux@gmail.com> wrote:

> The `strcpy()` function is deprecated and moving towards code-tree
> elimination. Replacing it with `strscpy()` fixes potential buffer
> overflow vectors by ensuring safe NULL-termination based on the
> destination buffer size limit [1][2].
> 
> To make the interface safer and more robust for future callers, refactor
> `tipc_bearer_get_name()` to accept a destination buffer length parameter.
> Replace `strcpy()` with `strscpy()` and pass through any potential
> `-E2BIG` truncation error code up to the caller. Update the existing
> caller in `net/tipc/monitor.c` to pass its array size.

For real safety embed the char[TIPC_MAX_BEARER_NAME] in a struct and
pass the struct through.
Then you can use sizeof() in the function itself.

	David

> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy [1]
> Link: https://github.com/KSPP/linux/issues/88 [2]
> 
> Signed-off-by: Ajith P V <ajithpv.linux@gmail.com>
> ---
> v4:
>   - Avoid hard-coding TIPC_MAX_BEARER_NAME in the function body.
>   - Pass size_t len from the caller down to strscpy().
>   - Forward strscpy()'s -E2BIG error up through the existing int return type.
>   - Updated function documentation comment block.
> v3:
>   - Fix patch title as suggested by Tung Quang Nguyen.
>   - No code changes from v2.
> v2:
>   - Target net-next tree instead of standard net tree as requested by Tung Quang Nguyen.
>   - No code changes from v1.
> 
>  net/tipc/bearer.c  | 8 ++++++--
>  net/tipc/bearer.h  | 2 +-
>  net/tipc/monitor.c | 2 +-
>  3 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/net/tipc/bearer.c b/net/tipc/bearer.c
> index 05dcd2f9e887..abd90e6bde09 100644
> --- a/net/tipc/bearer.c
> +++ b/net/tipc/bearer.c
> @@ -195,12 +195,14 @@ struct tipc_bearer *tipc_bearer_find(struct net *net, const char *name)
>  /*     tipc_bearer_get_name - get the bearer name from its id.
>   *     @net: network namespace
>   *     @name: a pointer to the buffer where the name will be stored.
> + *     @len: size of the destination buffer
>   *     @bearer_id: the id to get the name from.
>   */
> -int tipc_bearer_get_name(struct net *net, char *name, u32 bearer_id)
> +int tipc_bearer_get_name(struct net *net, char *name, size_t len, u32 bearer_id)
>  {
>  	struct tipc_net *tn = tipc_net(net);
>  	struct tipc_bearer *b;
> +	int ret;
>  
>  	if (bearer_id >= MAX_BEARERS)
>  		return -EINVAL;
> @@ -209,7 +211,9 @@ int tipc_bearer_get_name(struct net *net, char *name, u32 bearer_id)
>  	if (!b)
>  		return -EINVAL;
>  
> -	strcpy(name, b->name);
> +	ret = strscpy(name, b->name, len);
> +	if (ret < 0)
> +		return ret; /* Returns -E2BIG if destination buffer is too small */
>  	return 0;
>  }
>  
> diff --git a/net/tipc/bearer.h b/net/tipc/bearer.h
> index 41eac1ee0c09..12a322642de1 100644
> --- a/net/tipc/bearer.h
> +++ b/net/tipc/bearer.h
> @@ -226,7 +226,7 @@ int tipc_l2_send_msg(struct net *net, struct sk_buff *buf,
>  void tipc_bearer_add_dest(struct net *net, u32 bearer_id, u32 dest);
>  void tipc_bearer_remove_dest(struct net *net, u32 bearer_id, u32 dest);
>  struct tipc_bearer *tipc_bearer_find(struct net *net, const char *name);
> -int tipc_bearer_get_name(struct net *net, char *name, u32 bearer_id);
> +int tipc_bearer_get_name(struct net *net, char *name, size_t len, u32 bearer_id);
>  struct tipc_media *tipc_media_find(const char *name);
>  int tipc_bearer_setup(void);
>  void tipc_bearer_cleanup(void);
> diff --git a/net/tipc/monitor.c b/net/tipc/monitor.c
> index a94b9b36a700..8af49000a07c 100644
> --- a/net/tipc/monitor.c
> +++ b/net/tipc/monitor.c
> @@ -833,7 +833,7 @@ int __tipc_nl_add_monitor(struct net *net, struct tipc_nl_msg *msg,
>  	void *hdr;
>  	int ret;
>  
> -	ret = tipc_bearer_get_name(net, bearer_name, bearer_id);
> +	ret = tipc_bearer_get_name(net, bearer_name, sizeof(bearer_name), bearer_id);
>  	if (ret || !mon)
>  		return 0;
>  

