Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793806262;
	b=UN4quTk9UXh8QmZAg3aA8lirFsPOJHRaU/MQ6MsrLC9ddjebXN0zhGXuXb+zczt5Nkt7
	 Ht/rffWnu0sFOzOlQMH6fKvYleOQjW1yDqczf2+YU3yvVQ7ISzOka0Fp0u8HbrVT1gMR1
	 AQFWYeqVsmn/0p4XEIkqaw2gEQEuKWgNmst3BGoooHJWJNYgQxFoiDZbtKxoD9LhDn1KF
	 e0vq1xDXX8Is2KumaUZhf/TOGh9q4ISRYabBFs733aIBw2qrMKl2uGSaw+9ZHsqlT3yCW
	 ZIlJPZTbZ3b7mxBQ1FWFQ/3u5knAijMPNOHBYzZXpKwZZdGPjYmIoygb5BbGGQVijQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806262;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=xOsBO93hajnWNY2Hf6kly8jqaYUdftjDsXMR8RGD+WE=;
	b=EbCwacCcjz2jQumQ/0v6gMD0tqBBlyhHdqMv4io2ZXDnAcuWGjp9YlQz50/e6CxC7ccZ
	 fw3dRv8WosJCDB1KFngABQpwwntP1tTZHQtnaAr2U1aOzyPr7csRG0c0OwpA53+ee4IMf
	 J+LaI+RJzpyQkmm9yUBSa4rj2R3mB+727dskyKRuQYOlmFHa5HQuDo0INyiCwPtsLuum7
	 uTuLKuUN+vBXdOtm+F1fZ5N2pezFqNE91TpNgz3pMaeR/lL6J2fHrs67x3djNfm/QMe3K
	 8ZMb+w0v+u+vvk3lJ969ZtnKEgwQoirhF8jWKKsadDSriKv+idkm/WvYuYiXTRj7UNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=he2Y6aJV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A6A606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=he2Y6aJV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99B741F00A02;
	Wed,  4 Nov 2026 15:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793806261;
	bh=xOsBO93hajnWNY2Hf6kly8jqaYUdftjDsXMR8RGD+WE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=he2Y6aJVK4TJGRxByYTxTEKkmjtPPXVEDxrVpXoSEgqw9bxGUi9dy6hnAm+7k2GNl
	 63QGb3oU3hXogSqrTZRSiK3z/Tr8SvLi7G11nSgKehqyA1aFQi7TXoZgZyEGKXAV1r
	 4icL8Cz0i/PGNEgR7n+H3Ak+J75RUcp2kkAjmCORwpnV3y/13iR36jqOUyIsOsE9cl
	 HsswmXa3eHoDdn2yZHU1miNOAQmzJW74xpbvCzI0GuUeiYabBtebTzRpFs3557P8IF
	 Psz/rXJRuFadQwUdZyl5VOQSrxtQfvomsijILRKP5S7RLBVoKI23wfQ3MOyOFnaW7p
	 z1AjIwvn/eJSw==
Date: Wed, 4 Nov 2026 15:30:58 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mailbox: Only reset txdone_method to POLL if controller
 supports polling
Message-ID: <20261104-amazing-azure-malamute-a82ab3@sudeepholla>
References: <20261103164235.1.Ica21c7a396cf407fca02b7c0fb3a16150feaab90@changeid>
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
In-Reply-To: <20261103164235.1.Ica21c7a396cf407fca02b7c0fb3a16150feaab90@changeid>

On Tue, Nov 03, 2026 at 04:42:36PM -0800, Douglas Anderson wrote:
> In mbox_controller_register(), a mailbox controller's default
> txdone_method is initialized to MBOX_TXDONE_BY_IRQ if mbox->txdone_irq
> is set, MBOX_TXDONE_BY_POLL if mbox->txdone_poll is set, or
> MBOX_TXDONE_BY_ACK if neither is set. Only controllers with
> mbox->txdone_poll set initialize mbox->poll_hrt and require
> mbox->ops->last_tx_done to be implemented.
> 
> When a client with cl->knows_txdone = true binds to a channel whose
> controller uses MBOX_TXDONE_BY_POLL, __mbox_bind_client() overrides
> chan->txdone_method to MBOX_TXDONE_BY_ACK. Commit 33cd7123ac0b
> ("mailbox: reset txdone_method TXDONE_BY_POLL if client knows_txdone")
> attempted to restore chan->txdone_method to MBOX_TXDONE_BY_POLL when
> the channel is released, but did so unconditionally whenever
> chan->txdone_method == MBOX_TXDONE_BY_ACK:
> 
>   if (chan->txdone_method == MBOX_TXDONE_BY_ACK)
>           chan->txdone_method = MBOX_TXDONE_BY_POLL;
> 
> For controllers whose native txdone_method is MBOX_TXDONE_BY_ACK
> (!txdone_irq && !txdone_poll), releasing a channel (or failing in the
> controller's startup() callback) corrupts chan->txdone_method to
> MBOX_TXDONE_BY_POLL even though the controller does not support
> polling and has not initialized poll_hrt or ops->last_tx_done.
> 
> Check chan->mbox->txdone_poll before resetting chan->txdone_method to
> MBOX_TXDONE_BY_POLL in mbox_clean_and_put_channel().
>

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>

> Fixes: 33cd7123ac0b ("mailbox: reset txdone_method TXDONE_BY_POLL if client knows_txdone")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> Found by code inspection and only compile-tested.
> 
>  drivers/mailbox/mailbox.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> index efacd24a085d..cfc49cfb057c 100644
> --- a/drivers/mailbox/mailbox.c
> +++ b/drivers/mailbox/mailbox.c
> @@ -343,7 +343,7 @@ static void mbox_clean_and_put_channel(struct mbox_chan *chan)
>  	scoped_guard(spinlock_irqsave, &chan->lock) {
>  		chan->cl = NULL;
>  		chan->active_req = MBOX_NO_MSG;
> -		if (chan->txdone_method == MBOX_TXDONE_BY_ACK)
> +		if (chan->txdone_method == MBOX_TXDONE_BY_ACK && chan->mbox->txdone_poll)
>  			chan->txdone_method = MBOX_TXDONE_BY_POLL;
>  	}
>  
> -- 
> 2.56.0.385.gac671c819a-goog
> 

-- 
Regards,
Sudeep
