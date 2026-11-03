Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695502;
	b=qI8LjHcCusE/Cl3qENObnAJYaOCqcqW0ZA3WJJ0dZeJvg6oKn1QhrcB6ia3Upxf+3LVr
	 50/a8JcYx6ISZmKZChKDW3XPPm3MjcOd0w6hNNi8CDRoCPLPTzW8sbd+QahEZR2ZRWhPf
	 CdGFpFx+a16KJmSiPShZdW+TiS+/worb4NDj6RGoM3IqY4uI6cq0OpUQmDM1GM1oAcD8B
	 v+fHfhMY1UdJ9+MK+G2/grEXIXC6iFozddEPn5Cnvy3BiVJl0Ll9awoK5E+Td/jiqdgcq
	 UDydO2yuObGKCSJTkTg2WSD/xxO5i5jVtxuGeVDZX1y27wygth1ke18yuUJNz0CUpvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+jpPh4m+peQuQ9WA8cXHA/qOhK6T9NmnutAIkA0W11I=;
	b=lpZE7KY+if4MmV7yR8DNPu2fGFNdEzNxSsFLWEkB0fRHz5MYM9sfd0WhOLzISyaJBn0R
	 1Yp5l4Fo/WgQEFYQQbyz7ej23V0SIiMb8ZL6jwRpbWbBaG/Xuu0YVbZoxfK+zKHie+1Iv
	 1tZL9sU//EICzM/W3H3twJSFB+fWKZjonS8rs0UvWsIYaEc7E8tMbovDsLLFp8sEFsWC3
	 AdYACQuvMcFUSqPLkdmOfo+Q+KaoBo31xRHc4HzwiGBpSI9dJvcm5bfs9ekMqsGD6RkyA
	 bbVojPia7qOIDZqqPc7De1ynSYi29GiOeXbFT2TUZJR8QvG/SlkQoIVKpTKfLumXliw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ETXBEAF9;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E92D606B6F2
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E92D606B6F2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ETXBEAF9
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so40397585e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793695500; x=1794300300; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+jpPh4m+peQuQ9WA8cXHA/qOhK6T9NmnutAIkA0W11I=;
        b=ETXBEAF9FTHf76WhBpbzKpamTtfjH1SrqQqtwsoAg3cqiERUsPmm1sqC64mpizPeB6
         xQ9MVMR3eomgZY1DP1BdziRIx0GmRIrWEBY3dgNGQDtG59kbUdeXCmB/CRKUO4kdFl8n
         5te4XYowJJF8KB/1yV0vW3QIkoOkSSg3BzELqkAgP3VIX2NRSdND2TCh6muRhG5WhI6k
         1+8kYWbUBnCfQjIDLwb9L+mRiyjq1F6iZ+cKpYirpmFjn7MST1jkz8YggwYoLAUvUEXk
         9OTnrQhSsWaI2v5E+jDd0YVV/CfShrYC6a41I8/6lO+gMTP80JkxfITWreiKZXh4zc+K
         KfCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695500; x=1794300300;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+jpPh4m+peQuQ9WA8cXHA/qOhK6T9NmnutAIkA0W11I=;
        b=xDhsyAHLF91Os/R0dtBtb/DeOlHf/VjQ6BnBXOPKld61/+sFTBE+W4FnwvDqEWufYS
         GdgQcUD+gVo7LLfvO5m1iyzq6KaPs8cwd67gTzjGMr7+9zOBiKLonYZXE2X2zwGBCY74
         vhTT/EQSFwVudezEtS5YoEaONEo8fa5HbqK3PdQCO3EOWYMtTxOIDYYBlTe1Pf0B3bW5
         4BPNWqOnI31wFAaZ56GVqv+AplhopKcPqPRxs8rK9kHr8J+V+HP6oKrplyCteeTQwr80
         0VhrPe8z6kYwSJLmbQRye0wtqHFLwK8baiP981YrScCMSZI96LdzJnEXMdZhlzbOElGw
         Hk3A==
X-Forwarded-Encrypted: i=1; AKwUvBxjWalaOLmyaq2FV2BVRsFTxyWGwwofnrHVcN1Q/CDSBoQt7rOzBBDSL7QLwft+mkcPXaHHZCVR3xlPPKE=@vger.kernel.org
X-Gm-Message-State: APuU4Z96bemq3xNI5Qx8sG9TlWw/SlW7KvOGwAg6CRZE9nUK3ARyq21/
	1BMepIIRyRU3rXTyQ/AMhglrf2oz297Cke0+AeNmjWRJ5wdf9477puMj
X-Gm-Gg: AYBFou1FrHgsvpD2xjtbBhVsFBBgChF6O013b/LE7RDJWx8NRWmv9lu4KLW9aCjdmj2
	AfnCdwPsx4iWytfQAD1X4UtgEiO/Qtoky9a8h2ZyekyEcHkkvsdQ3f4v3uGHuvvj1NOFFDJvZjQ
	EA5WBUVs8kLOzfYrRjc/74EHpw4DkTux0AkAPkOuzakBcZrQldQTX72RFyv5YULiV3yBFIf5ytI
	FPeWc5CoTRe3HczTn4RpOb77zNwqSq/5OzGgfVe/W2lXVaZZfiV11x/g/iRNwGXXdx5Jx4J45cF
	8+AOBK3lOwxva4H62xrngmsImb6guVHi7WFSqJyfDu+ofl4/Ul0YNn9Kif3Ak/CR+ZCmQPh/we1
	0BxHae5yEWLtIH8Saq6/edhLZ3qiolcg+1iCSJpaRUvHitF0GVavlVQaWlbXCm8Mt45Jc9uo255
	NQ4+ta7zKyccvXWbq6Ctgu3vjlQnEDzL9eCXNqdpA3Ue9lh+jivesy6pUqwjsUpUsHBDw90/357
	X/fzGDK00+85GR2CZx55gam/wDX5jV3RZnW4eFdJ2q+hE1M6hTLs+Nr6o34g3ctYNxEz6nGTGZc
	kSvE9EOCxDi/4e2UYRbGBhoXdBXfsCtQMyJV9ynBbKuUlbd+MyqfqKgrYPPpjGqqsD6+HaK7sQ5
	pRDs85YsMDLfY/hAq1b7tgsi4A9YQjN0l99zycKZm3CgBdfwSV84b1pQsxavE/kwOI+A=
X-Received: by 2002:a05:600c:3554:b0:4a1:e7ce:107b with SMTP id 5b1f17b1804b1-4ac150b20eamr297842715e9.2.1793695499792;
        Tue, 03 Nov 2026 00:44:59 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78c10sm23373364f8f.25.2026.11.03.00.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:44:59 -0800 (PST)
Date: Tue, 3 Nov 2026 11:44:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alex Elder <elder@ieee.org>
Cc: Maritu Hone <marehone12@gmail.com>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bryan O'Donoghue <bod@kernel.org>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: uart: fix heap buffer overflow in
 gb_tty->buffer
Message-ID: <aumfB5MLWIQuTYY3@stanley.mountain>
References: <20261102195332.19860-1-marehone12@gmail.com>
 <f3848ac6-a105-4581-8f17-fc9d3f748b74@ieee.org>
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
In-Reply-To: <f3848ac6-a105-4581-8f17-fc9d3f748b74@ieee.org>

On Mon, Nov 02, 2026 at 03:33:58PM -0600, Alex Elder wrote:
> On 11/2/26 1:53 PM, Maritu Hone wrote:
> > gb_tty->buffer is allocated once in gb_uart_probe() and reused for
> > every outgoing chunk as the backing store for a
> > struct gb_uart_send_data_request:
> > 
> > 	struct gb_uart_send_data_request {
> > 		__le16	size;
> > 		__u8	data[];
> > 	} __packed;
> > 
> > In gb_uart_tx_write_work():
> > 
> > 	request = gb_tty->buffer;
> > 	...
> > 	send_size = gb_tty->buffer_payload_max;
> > 	if (send_size > gb_tty->credits)
> > 		send_size = gb_tty->credits;
> > 	send_size = kfifo_out_peek(&gb_tty->write_fifo,
> > 				   &request->data[0], send_size);
> > 
> > request->data starts 2 bytes (sizeof(request->size)) into
> > gb_tty->buffer, and up to buffer_payload_max bytes are written there
> > whenever enough data is queued and credits allow it. That needs
> > buffer_payload_max + sizeof(struct gb_uart_send_data_request) bytes
> > of backing storage, i.e. max_payload bytes.
> > 
> > gb_tty->buffer is allocated with only buffer_payload_max bytes:
> > 
> > 	gb_tty->buffer_payload_max = max_payload -
> > 			sizeof(struct gb_uart_send_data_request);
> > 	gb_tty->buffer = kzalloc(gb_tty->buffer_payload_max, GFP_KERNEL);
> > 
> > so a full-size write overruns the allocation by exactly
> > sizeof(struct gb_uart_send_data_request) (2) bytes, corrupting
> > whatever follows it on the heap.
> > 
> > Allocate max_payload bytes instead, which is exactly
> > sizeof(struct gb_uart_send_data_request) + buffer_payload_max, so the
> > buffer is large enough for the header and the full data payload it is
> > used to hold.
> > 
> > Fixes: dd1c64ede97f ("greybus: uart: kmalloc for send_data once only")
> > Signed-off-by: Maritu Hone <marehone12@gmail.com>
> 
> I think I understand what you're saying, but it took a bit
> for me to follow it.  I try explaining it in my own words;
> please make sure it aligns with what you mean.  I think it's
> also helpful to explain how this issue was found (by a tool,
> or by inspection, or through examining the corruption that
> was produced as a result of this).
> 
> 
> The UART Greybus driver allocates a single buffer to be used
> for all send_data operations on a connection.  It allocates it
> in gb_uart_connection_init(), with a size allocated to be as
> big as possible for the connection, but the size used is wrong.

gb_uart_connection_init() was renamed to gb_uart_probe() ten
and a half years ago...  :P

> 
> The error is in gb_uart_connection_init(), where the buffer
> size is computed and the buffer is allocated.  There, the size
> of the buffer is computed to be the maximum size of the data
> portion of a gb_uart_send_data_request structure (*without*
> the size field).
> 
> The problem occurs in gb_uart_tx_write_work(), where the buffer
> is cast to be a gb_uart_send_data_request structure.  That means
> the buffer contains a *full* gb_uart_send_data_request structure,
> not just that structure's data portion.
> 
> You're saying that the buffer size calculated in gb_uart_probe()
> should be max_payload (the maximum operation message payload
> size), not the calculated buffer_payload_max value.

Wow..  Heh...  I have read both the original message and your
message and I still have no idea which function contains the
actual memcpy() overflow.  :P

There are two sizes:
1.  The size of the whole struct from
    gb_operation_get_payload_size_max(connection).
2.  The size of the variable length array stored in
    gb_tty->buffer_payload_max.

I have reviewed gb_uart_tx_write_work() and it uses
send_size (which is the size of the variable length array)
consistently and correctly so far as I can see.

I didn't follow through each function to see if there was a math
error somewhere else.  I'm not going to do that because either
way the commit message needs to be more clear where the actual
corruption occurs.

regards,
dan carpenter

