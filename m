Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792490383;
	b=FbOArgY4kxcY3D4ohUMrYeDg3WNVe818sgIqfIYuQ2Yi8G1c/nitORnL+wrZSNiziyTF
	 wy+GCPJbHO4ZQE3VKft8Y6xXa6U15fKSx2igOZlV3h37FjjLmTPxvW6OZzW8JUcMxa5LG
	 kSD5e0JgWPZRwl7WTGGvgnth5M5xgQ3T5lG/AS0oWo3VO5b9dHJeTFe9NOzgYMCujEkIC
	 1C6fR2Vt6jv6seUpS2hEz5000WHe0bc1BLzJL0FOOP78JvX79DKCQIlad6vamGz1H8MB3
	 JWFt36WE46NR501hnhoa2qYSimOgVJyc6IGOrhHzSaw+Qfh4cUUeyCaIDdMrYbfjbCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792490383;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-AI-Review-Draft;
	bh=wegGHguPpjDXqOighrktidC2a/mLT1H0KSiQtmKA+LE=;
	b=36CYgsclZKKtnI6DLxikFpjqI6U+4ASTYOHy0RujQXkTnaIp9wJkl3fDco3sMBwIvM7M
	 KoDoF6lqB8/+NUcSueRr7VLpz5gF0/k3jXyxnpK1SnY1T+sbt3BGE6GQhjh50O1FlDV9p
	 4YGQoo9+Qs8IWWuhbxjdps1jc8Xg5PxSA8cloX9qBHnki8R9sEfhlKUZgoJwozYxdqKKK
	 lCwld7E7CEkmZewjmVoQ+uit9MjSVnDzK+lyVngYw3ZJVFOTYgqDCa9y1gAKjo6GIgML4
	 mwhd3jtUprxXEWLnv0rXTWMgfxsQ29acR9lDCSMZyC7RZW1x2ii6kjTwPOYt03FWNAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cqm7XafU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAA4606A31A;
	Tue, 20 Oct 2026 09:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cqm7XafU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BAD91F000C4;
	Tue, 20 Oct 2026 09:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792490383;
	bh=wegGHguPpjDXqOighrktidC2a/mLT1H0KSiQtmKA+LE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Cqm7XafU+k6yGCSr85lg9e40wayyPXMe2oBsPWL3PUgaa0nvfbifBVjvdh5e1etqv
	 t2AlUmNCTzer+DWX34HuMiIAvcBtfWObNTgQaCWA0yLB51lgFnka/iMFL9LwrlaWaU
	 NyWUUY9Vo0ZNQ/G2PyV4inAUNtKGFkOEm9g34T6NcxTyNBMxFlr7CfaYmc8dRd+4lk
	 5l9D7GOO53DzTg7wQMSHkU/oLUqiCTnbSlphtH87ZfCG4RQoUCnAPFDhNieSdGSeCO
	 C3+Qn4kjGNYwEuzfEzRZVtdcnWyrmeWOrZopp1vYE6/zqy5JhQV1sBxCCd+1CMT4P6
	 3/gbLK6Wsc2jw==
Date: Tue, 20 Oct 2026 10:59:39 +0100
From: Lee Jones <lee@kernel.org>
To: Riccardo Oliva <oliva.scorza@gmail.com>
Cc: linux-kernel@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH] mfd: dln2: Fix use-after-free risk in list iterator
Message-ID: <179198398105.839288.1873130512029656566@kernel.org>
References: <20261012234230.17966-1-oliva.scorza@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012234230.17966-1-oliva.scorza@gmail.com>
X-AI-Review-Draft: <20261012234230.17966-1-oliva.scorza@gmail.com>

On Mon, 12 Oct 2026, Riccardo Oliva wrote:

> In dln2_unregister_event_cb(), the iterator variable 'i' is used after
> the list_for_each_entry() loop terminates to free memory.

How is this a use-after-free risk?  'i' is only ever used after the loop
if 'found' is true, which means we broke out of the loop early while 'i'
still points to a valid entry.

Is this an actual bug or are we just silencing a static checker false
positive?

>
> Fix this by introducing a dedicated 'target' pointer to hold the entry,
> isolating the iterator to the loop scope and removing the 'found' bool.
>
> Assisted-by: coccinelle sparse
> Signed-off-by: Riccardo Oliva <oliva.scorza@gmail.com>
> ---
>  drivers/mfd/dln2.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mfd/dln2.c b/drivers/mfd/dln2.c
> index 0b1e7fd7f..7cd64aad1 100644
> --- a/drivers/mfd/dln2.c
> +++ b/drivers/mfd/dln2.c
> @@ -157,25 +157,24 @@ EXPORT_SYMBOL(dln2_register_event_cb);
>  void dln2_unregister_event_cb(struct platform_device *pdev, u16 id)
>  {
>  	struct dln2_dev *dln2 = dev_get_drvdata(pdev->dev.parent);
> -	struct dln2_event_cb_entry *i;
> +	struct dln2_event_cb_entry *i, *target = NULL;

If we do keep this change as a cleanup, does it make sense to use
'entry' instead of 'target' to match 'dln2_register_event_cb()' above?

>  	unsigned long flags;
> -	bool found = false;
>
>  	spin_lock_irqsave(&dln2->event_cb_lock, flags);
>
>  	list_for_each_entry(i, &dln2->event_cb_list, list) {
>  		if (i->id == id) {
>  			list_del_rcu(&i->list);
> -			found = true;
> +			target = i;
>  			break;
>  		}
>  	}
>
>  	spin_unlock_irqrestore(&dln2->event_cb_lock, flags);
>
> -	if (found) {
> +	if (target) {
>  		synchronize_rcu();
> -		kfree(i);
> +		kfree(target);
>  	}
>  }
>  EXPORT_SYMBOL(dln2_unregister_event_cb);
> -- 
> 2.43.0
>

-- 
Lee Jones
