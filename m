Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0F2481AAC;
	Thu, 27 Aug 2026 14:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787842369; cv=none; b=isMbquVFhkcxyGUUMwwK0Fhu6GgRzWvi1UkEypPwdHNx2EQuYhtmM5KMIhsiwVTrbNTYmAQ4pm18I7T5LFNKnkB3KW9cLfj52i9kqusZXIda/ea1bPv2ajAlR8QQsOcA5wmRthhL0DwKcuaEoOrxLR3FGnOvtJUCFh7o3QxmQ4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787842369; c=relaxed/simple;
	bh=TOwwUCm3aMU3KaYZSXThW3DCIQz1ArqP+11cnzza8rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GJhl9c/gzL87Z0pm2avMR51VlfUoHoLeYENvUDoCug7wrjVPV6iczoodh34two7Uo378WoRyIGZLTJFKUAL2v/fSc6kFsxxKPcA/0hso3lZW1mxtXMVd65XbH1dhaB1U1gnN1PgnmVJJ1TI38e6C1pCaHs91p/xRedD4wMXrVDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W/Wrgi1c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W/Wrgi1c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8BF71F000E9;
	Thu, 27 Aug 2026 14:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787842359;
	bh=j6K2IwFpe5CIehfsd9uWcWn+lN920C2qwKtqbLQ7Ggk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W/Wrgi1cgPXGQr7nZnU2yykJLHlcAqRYK5r781zx3+yA+pCBpNZGLISHJr7oQ9FU8
	 yS3dYforbQCQWwRWGC/w/BkvlZg3qAp9Y+I8HID2xb3dFamTJ45UmIBJtDD3nf8NSg
	 hY6yZKwGj6SylM0ZXmoqhpJWO2pwXIYA3Wjngnuv6xXyG7JUwD1eHcRlqhheVvGxIz
	 LFB5vxQ0jPAAr4IfdDeME4Sb2rKFSsSliwOUa6ZXz4kQItQHJGXphr2XuXrywMWij7
	 4pEw7VQaeRVg5eHJz9O/On7XF0Jyum/ftLq7NpoErdje9XHs7R+m9OO0UXc6/tI7x8
	 FpIIMPG7gXjzA==
Date: Thu, 27 Aug 2026 09:52:37 -0500
From: Rob Herring <robh@kernel.org>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Saravana Kannan <saravanak@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Shawn Guo <shawn.guo@linaro.org>,
	Grant Likely <grant.likely@secretlab.ca>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 02/10] of: hold a reference on of_aliases during alias
 path resolution
Message-ID: <20260827145237.GA3212208-robh@kernel.org>
References: <20260805-nh-of-alias-overlay-v6-0-74f21d440819@nexthop.ai>
 <20260805-nh-of-alias-overlay-v6-2-74f21d440819@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805-nh-of-alias-overlay-v6-2-74f21d440819@nexthop.ai>

On Wed, Aug 05, 2026 at 01:31:01PM -0700, Abdurrahman Hussain wrote:
> of_find_node_opts_by_path() walks the property list of of_aliases
> without taking a reference on the node and passes pp->value straight
> to of_find_node_by_path().
> 
> Take a reference across the walk. The walk itself stays lock-free
> like every other property iteration: it can race property surgery and
> see a stale view (a removed property's ->next is repointed at the
> deadprops list), but nothing it can reach is freed while the node
> reference is held. devtree_lock covers only the pointer load,
> pairing it with a later patch in this series that clears of_aliases
> and drops its reference when the node is detached at runtime.
> 
> Validate the value before resolving it. of_alias_value_ok() requires
> a non-empty, NUL-terminated, absolute path:
> 
>   - an empty property has a NULL value and crashes in strchr()
>   - a value without a NUL inside the property is read past its end
>   - a relative value naming another alias (loop = "loop") recurses
>     through of_find_node_by_path() until the stack is exhausted
> 
> All three are reachable with a malformed boot FDT today.
> 
> The name comparison loses its redundant strlen() pass while here.
> 
> Assisted-by: Claude:claude-fable-5 [Claude Code]
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> ---
>  drivers/of/base.c       | 20 +++++++++++++++-----
>  drivers/of/of_private.h |  8 ++++++++
>  2 files changed, 23 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 477017ed6f49..eca1f55eee87 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -995,6 +995,8 @@ struct device_node *of_find_node_opts_by_path(const char *path, const char **opt
>  
>  	/* The path could begin with an alias */
>  	if (*path != '/') {
> +		struct device_node *aliases;
> +		const char *value = NULL;
>  		int len;
>  		const char *p = strchrnul(path, '/');
>  
> @@ -1002,16 +1004,24 @@ struct device_node *of_find_node_opts_by_path(const char *path, const char **opt
>  			p = separator;
>  		len = p - path;
>  
> -		/* of_aliases must not be NULL */
> -		if (!of_aliases)
> +		/* the load pairs with writers that retire the node */
> +		raw_spin_lock_irqsave(&devtree_lock, flags);
> +		aliases = of_node_get(of_aliases);
> +		raw_spin_unlock_irqrestore(&devtree_lock, flags);

There's no need to take the spinlock for just a get. Furthermore, as 
long as the of_aliases pointer is exposed to the rest of the kernel, a 
reference should always be held. Not that you should rely on that 
here...

Rob
