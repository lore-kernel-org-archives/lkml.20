Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793038398;
	b=2CAHC5YeU1BDZZM8leTlh8VpMFMPrVW/KxGHpYAWNVszXz1fGJZ19HOgxJvJMjVwaEEe
	 bfRGpv6Ww1g+jNhUHxve9u5iqanYXV0j7mF4T+nIACFe22eqQwe+0TdLby+1NjLyL4kWW
	 ypsZff5ZMy8RHBsL+4+HqjQ3Twn2ASN43YqPMdeWmKTMMdhUNvgiWo0nMY39SnRzGosb2
	 oW0Fm9HoCzviDa9q9aQg9CcGTx4hsTVGcN8rTVWr1ecx8jVY/peKfoZqjWSQQkCdjDW3G
	 02Qr/EEfJl3m+9/Z6lKLLN6QbbUgBRNk0QR/tsYE6RGXhgsTBH6Fl+hBgWWNpcuIu4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793038398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qAFL7hRrfh2T1p4el/pmqxH+76hF6+dSXVrIs9e4ngE=;
	b=eemThp/boWStwlrqss5+2sg9hKMGys65O6Vqp9gxVuRwrXXONMpBDDdecivZTY6iIsfl
	 4Y5w2adVdJhJztTPdDrfIKHa5fuIKw/oLF8Pa1XHacTh6hFLrZQF0aDZMtynfoQ+jdUnq
	 a/N63WVzvIlwqQmxSfEIg2TALjSnqpQCQ1DQd2cplyWx8flMGZW0O3Bod8c44THzvOer4
	 RRdIYpHqjRuXPe6jUwv+SIHS5zOE+Zk58NA5PApb6oJpCv31+jUnnfUNW/3WSj6yuvRIe
	 YvciLE5Yw78TN2B0QtpTgrcCkXxEP/dJeNx09moTfa7Fhwe4h2Z5rYQy1b29mOaQxUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lMZWSF+C;
	arc=none smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9334B606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:13:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9334B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lMZWSF+C
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-675676afc3cso3891863d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793038397; x=1793643197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qAFL7hRrfh2T1p4el/pmqxH+76hF6+dSXVrIs9e4ngE=;
        b=lMZWSF+C5IL2Rtf5sQGHhvwUnkGjzgAxu2Cfs+QpPvdHgT/S07RIoqkQ2n+1OgWE08
         rQBo9Fbd/BNIgP4+yJBXe6mhrrrEHPE9Ga8yOkXfNAF3ZNkSA5xtfECIysJEJTX7n3F7
         OvsLVuJufJQSlCu4mZjDixSMekvm+K4kY0/EZBcWVQx/fvH12I94gsA+ZbHvXgmy/lAy
         EDYDqAN64XzBVhcmOu40Iol4qjWLsRkQE8Xuvf5jtWf6VAW5moeENnwibUtp+KXgfV1t
         laSt1EqGhuDMrQDB8z4oJQMwDH0WIAQMTuxsv23lnPfyTS0NOpAllpzkQZUbzcm4Yz3Q
         Dkgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793038397; x=1793643197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qAFL7hRrfh2T1p4el/pmqxH+76hF6+dSXVrIs9e4ngE=;
        b=yn3t4IfnoEzCAf3vebY5JjksMKD1ikKrO9szTH/8CIC+ip6VYLt0MZNnPN6u5o3O1B
         njY93+r0Qlc4d2A8WnTmt2qmvDe4qbo0jsXQLcC96MzAC2ePDBMdjaSobktJ9nt93XFc
         wAjs0FaDwj2COhtRj9NdJN15M5UHUdSiz9iXTk9o8ijZM/OKTFKE9687erWtnL3cMyec
         K0zaujwXmROXptw0k/t4R3MplPU05KzTEVc2WijvtgOM3lF+7FBZ8NAYoHe4PvTOh+4Z
         NxpKVyYM6VyHcgw/l3/6GGK6UNWega5w+eJ7AFfqfkcq1F7R43uPi5eqNWyxRc9IxUMH
         97nw==
X-Forwarded-Encrypted: i=1; AKwUvBywA/70r0Za8ylycPJmR5mxh90g/LhuXegPPzYEQwka8VfQJ2yn5MJ+7pv0sU1wTn8YBMGylCj4SyYILYc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoS9cuKcRihzqEj6576aALPipgoE83Q0JhdmSZQ0CFROvzDHbj
	XbmwPJFdylfjxecVS7PQO202sdmJ0tZjb6FVuH8qhNnYKj8XD2BI5gOj
X-Gm-Gg: AYBFou2VQplH8tnJJt4NzkrOb71KS/7wobKfK0EU2xGL1aA+ZsCTY+oBGB6ZKQkcLFC
	BZSx2oksNO7zoXLTegMklDg6knmxiKkpIG8lvuPUaYFQffxosVZpIfRPGIFuYjdjVWrBEZY1Qw3
	HEDXG78+8csdCmu0Z/qSzQtt+mrLChsNnEKaCzX27y8vRqUMmN0UTPzFzRZTRMpLwmHl/oLlear
	9aGeLdTge4La0SSqkVIplfYWjv7ccD88pwBJZVVbDExeVRejEDp/jDOBN46elckfllHYz/Fkl1o
	5U/z4xHWGiz0AK0ZRbxGCyEMvVL3veUemYpfVPD7XLlmFkZB6sdq5Ottgngl6CEKJ5QJP4EM3KY
	jI6hYqVXoTFcPcRr7y/K+pYIGRt3jmz1ZS16cOT9ymbvzqcMC8fotfmr3BFmMqQmiBVRkSt/7mG
	7oVqi0m7vVU/NjhK2ucwNFhg0xfBxdNpzNqwA7UVvHYiVdXjEm2NvThLp3gscDWnyPWjZZ9DWUu
	KbaMI51yWe5ieHzzbTYKfWrgiC17xrqdQy2QW3oCNpUeBeUciVlOdMhyBWzCBtV6XWXDzmP1T5H
	1F6y8/AlA4w=
X-Received: by 2002:a05:690e:441c:b0:679:935e:3551 with SMTP id 956f58d0204a3-67a45460185mr4398920d50.68.1793038397593;
        Mon, 26 Oct 2026 11:13:17 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:58::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a461f0a4bsm3816964d50.11.2026.10.26.11.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:13:17 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: "Gregory Price (Meta)" <gourry@gourry.net>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ziy@nvidia.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	honggyu.kim@sk.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] mm/mempolicy: recompute automatic interleave weights on memory hotplug
Date: Mon, 26 Oct 2026 11:13:15 -0700
Message-ID: <20261026181315.3799696-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261024170415.4121901-1-gourry@gourry.net>
References: 
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

On Sat, 24 Oct 2026 13:04:15 -0400 "Gregory Price (Meta)" <gourry@gourry.net> wrote:

> In auto mode, weighted interleave derives each node's weight from its
> bandwidth, reduced over the nodes in N_MEMORY. HMAT and CXL report a
> node's bandwidth once, when the node first gains memory, and nothing
> else on the hotplug path recomputes the weights.
> 
> When a node loses its memory, the other nodes keep weights computed
> with its bandwidth until another node reports. If one does while the
> node is away, the reduction skips the node and resets its weight to 1,
> which it keeps once its memory returns.
> 
> With HMAT bandwidths of 100G for nodes 0-3, and 50G and 25G for kmem
> nodes 4 and 5, weighted_interleave/nodeN reads:
> 
>   event             node 0-3   node 4   node 5
>   node 4 online         7         3        -
>   node 4 removed        7         -        -
>   node 5 online         7         -        1
>   node 4 back           7         1        1
> 
> Toggling weighted_interleave/auto to 0 and back to 1 gives the correct
> 6, 3 and 1.
> 
> Recompute the weights from the recorded bandwidth whenever a node gains
> its first memory or loses its last.
> 
> mempolicy_set_node_perf() now only records the bandwidth and calls the
> same helper, so the bandwidth is kept even if allocating the new weights
> fails. wi_state_lock is dropped between the two steps, which should be
> safe because the helper reads node_bw_table and the mode under the lock,
> so a racing writer only makes it work from newer state.
> 
> With this patch, weighted_interleave/nodeN reads 6, 3 and 1 as soon as
> node 4 is back.

Ouch, thanks for finding this fix Gregory. In addition to making the
code correct, I think it's a nice simplification to
mempolicy_set_node_perf() since we no longer have the nested rollbacks.

> Fixes: e341f9c3c841 ("mm/mempolicy: Weighted Interleave Auto-tuning")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
> ---
>  mm/mempolicy.c | 66 +++++++++++++++++++++++++++++---------------------
>  1 file changed, 38 insertions(+), 28 deletions(-)
> 
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index 0884c629670d..ffb293a4cc56 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -238,27 +238,45 @@ static void reduce_interleave_weights(unsigned int *bw, u8 *new_iw)
>  		new_iw[nid] /= iw_gcd;
>  }
>  
> +/* Recompute the weights from node_bw_table, unless they were set manually */
> +static int wi_state_refresh(void)
> +{
> +	struct weighted_interleave_state *new_wi_state, *old_wi_state;
> +	int i;
> +
> +	new_wi_state = kmalloc_flex(*new_wi_state, iw_table, nr_node_ids);
> +	if (!new_wi_state)
> +		return -ENOMEM;
> +	new_wi_state->mode_auto = true;
> +	for (i = 0; i < nr_node_ids; i++)
> +		new_wi_state->iw_table[i] = 1;
> +
> +	mutex_lock(&wi_state_lock);
> +	old_wi_state = rcu_dereference_protected(wi_state,
> +					lockdep_is_held(&wi_state_lock));
> +	/* NULL wi_state assumes auto=true */
> +	if (!node_bw_table || (old_wi_state && !old_wi_state->mode_auto)) {

I was also a bit confused by this because at first I thought it was a
simple code move, but this seems to be a new condition.

I traced the path in mempolicy_set_node_perf because I think 
node_bw_table must actually always be non-NULL here......

Aha! But it can indeed be NULL at the new callsite.

Thanks! This looks good to me. With or without David's suggested
pr_warn_once(), I think the change looks good to me : -) so please feel
free to add:

Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>

Thanks a lot Gregory, have a great day!
Joshua

> +		mutex_unlock(&wi_state_lock);
> +		kfree(new_wi_state);
> +		return 0;
> +	}
> +	reduce_interleave_weights(node_bw_table, new_wi_state->iw_table);
> +	rcu_assign_pointer(wi_state, new_wi_state);
> +	mutex_unlock(&wi_state_lock);
> +	wi_state_retire(old_wi_state);
> +	return 0;
> +}
> +
>  int mempolicy_set_node_perf(unsigned int node, struct access_coordinate *coords)
>  {
> -	struct weighted_interleave_state *new_wi_state, *old_wi_state = NULL;
>  	unsigned int *old_bw, *new_bw;
>  	unsigned int bw_val;
> -	int i;
>  
>  	bw_val = min(coords->read_bandwidth, coords->write_bandwidth);
>  	new_bw = kcalloc(nr_node_ids, sizeof(unsigned int), GFP_KERNEL);
>  	if (!new_bw)
>  		return -ENOMEM;
>  
> -	new_wi_state = kmalloc_flex(*new_wi_state, iw_table, nr_node_ids);
> -	if (!new_wi_state) {
> -		kfree(new_bw);
> -		return -ENOMEM;
> -	}
> -	new_wi_state->mode_auto = true;
> -	for (i = 0; i < nr_node_ids; i++)
> -		new_wi_state->iw_table[i] = 1;
> -
>  	/*
>  	 * Update bandwidth info, even in manual mode. That way, when switching
>  	 * to auto mode in the future, iw_table can be overwritten using
> @@ -271,25 +289,10 @@ int mempolicy_set_node_perf(unsigned int node, struct access_coordinate *coords)
>  		memcpy(new_bw, old_bw, nr_node_ids * sizeof(*old_bw));
>  	new_bw[node] = bw_val;
>  	node_bw_table = new_bw;
> -
> -	old_wi_state = rcu_dereference_protected(wi_state,
> -					lockdep_is_held(&wi_state_lock));
> -	if (old_wi_state && !old_wi_state->mode_auto) {
> -		/* Manual mode; skip reducing weights and updating wi_state */
> -		mutex_unlock(&wi_state_lock);
> -		kfree(new_wi_state);
> -		goto out;
> -	}
> -
> -	/* NULL wi_state assumes auto=true; reduce weights and update wi_state*/
> -	reduce_interleave_weights(new_bw, new_wi_state->iw_table);
> -	rcu_assign_pointer(wi_state, new_wi_state);
> -
>  	mutex_unlock(&wi_state_lock);
> -	wi_state_retire(old_wi_state);
> -out:
> +
>  	kfree(old_bw);
> -	return 0;
> +	return wi_state_refresh();
>  }
>  
>  /**
> @@ -3900,8 +3903,15 @@ static int wi_node_notifier(struct notifier_block *nb,
>  	case NODE_REMOVED_LAST_MEMORY:
>  		sysfs_wi_node_delete(nid);
>  		break;
> +	default:
> +		return NOTIFY_OK;
>  	}
>  
> +	/*
> +	 * HMAT and CXL report a node's bandwidth only when it first gains
> +	 * memory, so recompute the weights whenever N_MEMORY changes.
> +	 */
> +	wi_state_refresh();
>  	return NOTIFY_OK;
>  }
>  
> -- 
> 2.56.0
