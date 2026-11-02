Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793655243;
	b=271dKHOjV8rG1AMlVIKTflwhQZkvEt6UGmUnLfiuAE6u7lx9/bVvYcH4Cg3EgNFnSMPn
	 dLPKBCeQeyZxlMr0eTucl/UGZ6D2MhV9BDcYQCH+eOxMWggAecz7Z+rKss6BKf++mhGgB
	 QY61j6N4ZHelQ9qXd47eEzSihTmbEbHRQU0f4WRA2sUzIMeSztUM+v28pWdbqfQ/8Qq7h
	 2LievtMLZdNi/Tle/FpvewQeC5mTqZ0Pcl6W6r6shnDJsQVVPIrZjowg8X+bsFDhBwvu3
	 Fd5RgsQNu8dn5fzXMcrXFm3tVC0oOIylwvUwO0MvJzkqR3YK76G6o0xLjW51fQMGijg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793655243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=t/Msy0dXqNw0HhDTL8dZmKlbwkYbGOrBXfiz4h4optI=;
	b=g0UB9r78KQzYAc5ZojJd9KZwst53Y8kFEgTN+/b4JBHGPfAzmrgQE11n0CwGLF7hv4Qu
	 aVLQwEx/GnT3j6DL4CUXnqur96XlKbWVNILJSBXuMGCTSh0pjIHXXGYkpIgjRAWBIgE3x
	 Lfn+X6YVO+k37gkilc3++jlUPpU8E2GmZrCCl/USVUCaD8GD+chScRlXAXFIdR0+joWUc
	 6M5gpZo6XNN+vXZqaineFvLZKqkTMs+q8vzZ0svf2kH1vw+Y4kO68bT7yKANoGAoFpXg4
	 dIsq0z4vgsAMSohCZ8lL471fHgA3ZSw3tGqjFrTRhIMVHs/LShrXTQsRAHR9OR+UMkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=PnR4l7i1;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73193606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73193606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=PnR4l7i1
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6aa9606ddadso2728757eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1793655240; x=1794260040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t/Msy0dXqNw0HhDTL8dZmKlbwkYbGOrBXfiz4h4optI=;
        b=PnR4l7i1je7leOD1vtQumL07T3Qf8I9Xl7i4ClS4u9lqNNYsWf8qfS7nqwDed4uQKt
         lhnf+MjkT3ZGGDWTfJCltgIxHvBIhr4SV9zQ7pnoIx/Jf5Ht6hw/GPnu9a7LFn0sFjt7
         d0J3exgcH+GUaB3kU5GGYnihyKrwd7d3taefw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793655240; x=1794260040;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t/Msy0dXqNw0HhDTL8dZmKlbwkYbGOrBXfiz4h4optI=;
        b=kH1+advF3XNB9yLDYeOJc1OGkZlTGe93rjxeQndJM7cdghBsafSVA2N66eSt5pm6HE
         fzgCcjCvl7Utf3+lc3y9/rNVNrsaQmXrXmKJXo8LcZrpwCgJ2J883z3NiFHamQQ60HaI
         2LWHnRrdOCN/moJV2ioS3QW1TLSKuOsScWgPQFh5l25oLEyhq2IVLf2D90EgIaqLJKOA
         7bLVUdrEA7Ht+2pvtgZPPMSQ1a44uP6qi/y2/bJpPdgv6wYuoav/c6ss1wJ7qvyPR5kN
         6Gl8GJ/tBtJOS1HoXCReaMcjPf4auZ7MaR9nUMK8Qq67FZEldFkbyACL+cm0I/pZHDxZ
         KduQ==
X-Forwarded-Encrypted: i=1; AKwUvBxuAgz8UrCqg5nkzpF1Tvkoah9iOXO38U3KQDBOeMFkGKlRFenX/1BQmlOI8ka2xk5oHtCU719ne17CKLg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhQWR/Evw9WTP2mrvnNPvLW02dfw22dmK/cc22c+nSxIhG/vkd
	J4mVkQH11O2cjrsTE7wvPY94B/Nsp4ksWzM/dzXfG9fSOCZtb0/s8ir/r90vNQJOMA==
X-Gm-Gg: AYBFou0t7frMNmXUFhk5077q2ByClcQZyWk2fkaSn6voof2qY+xK/JVzyZUgrEOT89I
	5VjZ/u79VbLulR/BFUpMDbIZEHkW4MpY4cDf9TGi6TY1f35jdGNzDO7vURJfCfNhzeU2cqOJvXl
	Ll+lmX3hdeU11hqoVR1+kHvcAWtEyg4xDSj+x8pXN97KgOqTNgWgX0WNPNHtyp3aj8li3J1R4Q3
	Qs7z+VZRgCMdNHVliFWi0POuV821QbdPdjra2njWxz/62nUY+QRRHSElfD0zk1GONW9Uqh/F/WZ
	d6d59kfe4v8f1y3ELiZdsnzI5Ile+YeGKBkIoFlxq9E95wKdGXlEQ1V/Wxz0tFkD3eb8+EMnT0B
	WizpRD30zfUmQzR13BaLthHumXlrMHTesOPDq7S5kxKdEYsBkJqkjQxhlK8lEJzRTQVnEeOe6XH
	hxXDtYTMWyXVN+LzmF1unF58CZDbqFCZAsuAfyXaD2Evj/h/PJaPZw72MXlC3hAqfSxNCkIhCwo
	qONuLiXaCst8WjFfpNTlcB4qCVEcFCHvXGnYtOSHOOlCCvn2BBlQ9tUIzXa8Ozem7RiObN5atMu
	x7S982Usl6oEQ4NDo5q7fDU=
X-Received: by 2002:a05:6820:603:b0:714:b1a7:fc04 with SMTP id 006d021491bc7-714f2afa5a2mr5661602eaf.86.1793655240332;
        Mon, 02 Nov 2026 13:34:00 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-85d351e841fsm10996149a34.1.2026.11.02.13.33.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 13:33:59 -0800 (PST)
Message-ID: <f3848ac6-a105-4581-8f17-fc9d3f748b74@ieee.org>
Date: Mon, 2 Nov 2026 15:33:58 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: uart: fix heap buffer overflow in
 gb_tty->buffer
To: Maritu Hone <marehone12@gmail.com>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bryan O'Donoghue <bod@kernel.org>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
References: <20261102195332.19860-1-marehone12@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261102195332.19860-1-marehone12@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 1:53 PM, Maritu Hone wrote:
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
> 
> Fixes: dd1c64ede97f ("greybus: uart: kmalloc for send_data once only")
> Signed-off-by: Maritu Hone <marehone12@gmail.com>

I think I understand what you're saying, but it took a bit
for me to follow it.  I try explaining it in my own words;
please make sure it aligns with what you mean.  I think it's
also helpful to explain how this issue was found (by a tool,
or by inspection, or through examining the corruption that
was produced as a result of this).


The UART Greybus driver allocates a single buffer to be used
for all send_data operations on a connection.  It allocates it
in gb_uart_connection_init(), with a size allocated to be as
big as possible for the connection, but the size used is wrong.

The error is in gb_uart_connection_init(), where the buffer
size is computed and the buffer is allocated.  There, the size
of the buffer is computed to be the maximum size of the data
portion of a gb_uart_send_data_request structure (*without*
the size field).

The problem occurs in gb_uart_tx_write_work(), where the buffer
is cast to be a gb_uart_send_data_request structure.  That means
the buffer contains a *full* gb_uart_send_data_request structure,
not just that structure's data portion.

You're saying that the buffer size calculated in gb_uart_probe()
should be max_payload (the maximum operation message payload
size), not the calculated buffer_payload_max value.


I think I agree, but Bryan should confirm.




I will comment that sizeof(struct gb_uart_send_data_request)
should never be used, because it contains a flexible array
element.  Instead, flex_array_size() should be used, for
example:

     struct gb_uart_send_data_request *request;
     size_t send_data_min_payload;

     send_data_min_payload = flex_array_size(request, data, 0);
     buffer_payload_max = max_payload - send_data_min_payload;

I'm not sure flex_array_size() was available when this was written.

					-Alex

> ---
>   drivers/staging/greybus/uart.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
> index e1b73db6a17c..7bbac2603726 100644
> --- a/drivers/staging/greybus/uart.c
> +++ b/drivers/staging/greybus/uart.c
> @@ -842,7 +842,15 @@ static int gb_uart_probe(struct gbphy_device *gbphy_dev,
>   	gb_tty->buffer_payload_max = max_payload -
>   			sizeof(struct gb_uart_send_data_request);
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
> +	gb_tty->buffer = kzalloc(max_payload, GFP_KERNEL);
>   	if (!gb_tty->buffer) {
>   		retval = -ENOMEM;
>   		goto exit_put_port;

