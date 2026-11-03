Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696699;
	b=Mo4tphn1uOUEnHnOTxdb+vuDpbWeVAWajGon1rd6TLZlwqu1hMy1fJY/hrjXriA7vIX2
	 /qYURJ0sMAkg2S1A+9a0dvAEZBFiu/vrqT9BrUCQesSOYZYs582IOcrJT1C4+nM3P/2Iw
	 u85zl5iwyucWpY+MevImgmBc2H5nOPlYchbXyx+vePz21Ryk4HglxcdgLh121YiDnX4Vi
	 zjF9cdbAeO/FX3w7TCbExnUN0ViPdaXbFm4B7poVCTxDiFETB/RqDBflsQWCWSdDEKT/o
	 RpRQ+TFgWRe3hS7GUPCU0kRLr/kks+BvjRBL/Zt/BlomPeKxhjszzoxwLXFhhQl/f0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696699;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Uep79D5kNu//RXYzDoGxNrhrfRbJ7gQ1uroX53oA1Z0=;
	b=khMf8vKk5dhRjeyzeUnJfXAiQEr0sSoukWEJcPxxsKHRG4WGfspDV6Btxb/kLc2m9dyN
	 GJ/ewjny/+D9x5v+6qQzn8fP9aHGO5AJoIHN4fzFvM2eRy5nKkICKtgOYsWiwRqP5JNPi
	 xyZwM/7sgREpIKSDYRZbO0gwRt5qOuWWHApo/ouqgA1t6IFZlsJIKoo+/0ZOPjT9rIqUi
	 bzuShz+aPv+BY2PaOSfBMtY+r6TEZLieyrukAufYdcyAPflev38XBH+f2dZplFXTGeM3c
	 t/Zs00kLkbp22BlnY4nbGS9tl+fAmQZq+ZPaeT00HKFOtCKQ/bc+6jrv2r9QjBQmrfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bJ73DKS4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74222606A324;
	Tue,  3 Nov 2026 09:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bJ73DKS4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BB4D1F000C1;
	Tue,  3 Nov 2026 09:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793696699;
	bh=Uep79D5kNu//RXYzDoGxNrhrfRbJ7gQ1uroX53oA1Z0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bJ73DKS46ek+WdVFC8HFQgWqOccMsMHIYBl2WpUEm3NjUjVZbtKQQnKxFOm5I94R+
	 XgsOfL/w5rzD8CTDxAP9svSzXstINCm4Yk0/ew4N76DiKXGQ+Mta4s8zZszj8Wbuv/
	 nAbYSVDSSqqk8pFdPOGYDWiZpm6k2WjEUXWyObHrOGFDvxMDY4TKGPVbpVW8xjxtJl
	 IK7CY4sEGlPQuQngKhY53e6Tse3++LmaGHOBEs7v6LMC9STowQ9jBkyYBts+PygrdG
	 Zl9XkUtHQTxU1tBdMLcknVOefjQzMiq1ORqY5z+4agoQtWJ/CgZWsLf9AY7JnPgCt8
	 U0C4QQwVeJs/A==
Received: from johan by xi.lan with local (Exim 4.100.1)
	(envelope-from <johan@kernel.org>)
	id 1xOARs-00000006HFD-2BgC;
	Tue, 03 Nov 2026 10:04:56 +0100
Date: Tue, 3 Nov 2026 10:04:56 +0100
From: Johan Hovold <johan@kernel.org>
To: Maritu Hone <marehone12@gmail.com>
Cc: Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: uart: fix heap buffer overflow in
 gb_tty->buffer
Message-ID: <aumjuGK9yakMjsDd@hovoldconsulting.com>
References: <20261102195332.19860-1-marehone12@gmail.com>
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
In-Reply-To: <20261102195332.19860-1-marehone12@gmail.com>

On Mon, Nov 02, 2026 at 10:53:32PM +0300, Maritu Hone wrote:
> gb_tty->buffer is allocated once in gb_uart_probe() and reused for
> every outgoing chunk as the backing store for a
> struct gb_uart_send_data_request:
> 
> 	struct gb_uart_send_data_request {
> 		__le16	size;
> 		__u8	data[];
> 	} __packed;
> 
> In gb_uart_tx_write_work():
> 
> 	request = gb_tty->buffer;
> 	...
> 	send_size = gb_tty->buffer_payload_max;
> 	if (send_size > gb_tty->credits)
> 		send_size = gb_tty->credits;
> 	send_size = kfifo_out_peek(&gb_tty->write_fifo,
> 				   &request->data[0], send_size);
> 
> request->data starts 2 bytes (sizeof(request->size)) into
> gb_tty->buffer, and up to buffer_payload_max bytes are written there
> whenever enough data is queued and credits allow it. That needs
> buffer_payload_max + sizeof(struct gb_uart_send_data_request) bytes
> of backing storage, i.e. max_payload bytes.
> 
> gb_tty->buffer is allocated with only buffer_payload_max bytes:
> 
> 	gb_tty->buffer_payload_max = max_payload -
> 			sizeof(struct gb_uart_send_data_request);
> 	gb_tty->buffer = kzalloc(gb_tty->buffer_payload_max, GFP_KERNEL);
> 
> so a full-size write overruns the allocation by exactly
> sizeof(struct gb_uart_send_data_request) (2) bytes, corrupting
> whatever follows it on the heap.
> 
> Allocate max_payload bytes instead, which is exactly
> sizeof(struct gb_uart_send_data_request) + buffer_payload_max, so the
> buffer is large enough for the header and the full data payload it is
> used to hold.

I think the above is clear enough.

> Fixes: dd1c64ede97f ("greybus: uart: kmalloc for send_data once only")

This should also go to stable:

Cc: stable@vger.kernel.org

> Signed-off-by: Maritu Hone <marehone12@gmail.com>
> ---
>  drivers/staging/greybus/uart.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
> index e1b73db6a17c..7bbac2603726 100644
> --- a/drivers/staging/greybus/uart.c
> +++ b/drivers/staging/greybus/uart.c
> @@ -842,7 +842,15 @@ static int gb_uart_probe(struct gbphy_device *gbphy_dev,
>  	gb_tty->buffer_payload_max = max_payload -
>  			sizeof(struct gb_uart_send_data_request);
>  
> -	gb_tty->buffer = kzalloc(gb_tty->buffer_payload_max, GFP_KERNEL);
> +	/*
> +	 * gb_tty->buffer is reused in gb_uart_tx_write_work() as the
> +	 * backing store for a struct gb_uart_send_data_request, whose
> +	 * variable-length data[] field holds up to buffer_payload_max
> +	 * bytes starting right after the struct's header. The allocation
> +	 * therefore needs room for the header plus buffer_payload_max
> +	 * bytes of data, i.e. max_payload bytes, not buffer_payload_max.
> +	 */

LLMs like to add comments like this, but please remove it in a v2.

> +	gb_tty->buffer = kzalloc(max_payload, GFP_KERNEL);
>  	if (!gb_tty->buffer) {
>  		retval = -ENOMEM;
>  		goto exit_put_port;

Johan
