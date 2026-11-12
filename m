Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794479838;
	b=OcY3ec8s+R0wdTF3jgmIyE1Gli2TcoM1IlIhKFZSJmJyIM+ZsIV+wZ8vCm78+sLi6e6J
	 L8oYr+ABgiIHMLNgqWNPaNrhyrbG+i/BjSeldl8b/1fgorLW9kgpNpj760w9/wnV1r0Z1
	 4uaYXK4OfYcHvgx5K0ZO5JysiWNhrH+N00Cb6JxZYoay0Qp6nbGvrs8NCQSY6hau0Qyl0
	 Jk48aLI7nOAUPdMp0QBd3qDfizF/Ged7aS2rKJiyOSw+1kNJEjUasUdF3gachU4qwPKVR
	 yISxIn1bGjBeZL51D2B3bvffThtriwvghSzJvf8SVG3HH2USVM02varLs8MPSBZA7Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794479838;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=gxc0bY2Mev3IKBzfWXBLxoMe9HLI99Q+ENcxEL4JSZU=;
	b=K6ohl6jeDRAlMU9llIXae7jPnpP/m3Zh/uFJrOKNuPsC9ipy0DZvM4dyDmAyiX0yPq5y
	 bjc4fwq42rgnSseF4C2jBbYSQMKwrDc6uTpmGYCEN1wOgIKemPOSP+OrBuEmMOWkuqt6C
	 ZweRinDQkn2bF0bA5RgfGi73QvQPvlMDkEfwO36Ib2zzRxrC9e1P33JF9hYDJh5HUHOWh
	 Sa3f92QwEStbtrSuXW3Z5JOa6/DPKj4iQCq6Ru3tlGdjCgbjrHwf30Wn0btbgueH3kGf0
	 W9+j3psr6vyaNqiwCTUxiewtuJvX0W6ov3KWVaCyN/WXDstfDQKgPURZCpVmZqXrBhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=pereq.eu;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78957606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:37:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78957606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so24113215e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:37:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794479837; x=1795084637;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gxc0bY2Mev3IKBzfWXBLxoMe9HLI99Q+ENcxEL4JSZU=;
        b=zhiDDGpcp7dfzejAAOzDJoUx9hW1nZLMWb9bRzvQZaHyTIH9SChpi0TQcDzG6tpefc
         dH+oxmfNusNr5MrpyoEEHt10ycc8GOwKZLyoatgTMB6Su5yY3Uj2KIblRrWU1gWzhXou
         qvXf57l30TD4BLjAaVte1Bq28KyjjeDNlhDY92/VEjaSfJAVICwLOyMb9ghWy/4AdYF2
         SklZ4EHQwr28Rc/Q/pPagjLPOmEBcr/k/LN58DI742S9VjzG58fp7DsZgAy5zTXelzLJ
         d+AUKpLMhFofd6Qe77SOBSPR4WiTd2crQxL8MbCszBLnLWDYCQoTS0miwouPX1Bp9ez9
         EyXg==
X-Forwarded-Encrypted: i=1; AL+hErFknEU2QLyI/5/1YWETTPTKEbYYqgG7/p+8UAJAoAT9Rh9rSmorXnS3lRntc0NlH90+N9w1IyNgrDa+0cA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pSUQZzIP8TEIuTR8/J9R7rQtv8xC9UAHCrjc8IMNtzWzSxs7k
	rxKleaX0q9mwYxWdeshkY1ZKi/3sa0/dgI7yCyagv5FMiZRoXUaeJqXj
X-Gm-Gg: AYBFou2mbb61KDiF6zthJ0WJBfF7flULzX5pducnPY7j5Fp5c9rEijAt6n0p5AuAur0
	AVhQIsos/uWix509STS65oIvJF2DWvY+Q8LbCFx8MnLPCpjTETv+ZvtUZ17Fbqt2KQys74H7fBb
	ccy8DGQ9YMdVj/WkGk81vuvrPMFjVKJy6nE1iKKry9f6RHpS+Kjf+TlvwBEvR56/h/S577xXH4S
	FW5Wp8KEENJRMD6mhn+m3BEa+H2wFO0vFI4kp5d/dNI0OyVqk+X5JEWSbuZjQi6GIrWlUpQvKrn
	uCCddkYKziwnhxJ/GU/CkjetfFo+9b5pIImC/6Zoc+JuJGa+hE6459mD6qTYXH01UZ2f9AB0bgU
	4vrV0SJZVy++Xpa89nwXvxEsUHY5ura95jzqU4M7jT7vcHepU0Jkvwgy7GNHo0aLAeEsUAstsMp
	YEHhgj8PizfWdt1MyZ9LMD5HVFirIQEO7Yi9wL/evcUkWolNRpEcFntuKcTUBzK9H09053YdaI1
	D1SjBRzbQndoYFmjBl9bSld5KfMgSFVpjAZJ7G80w5/hAjc7mUsAk89zIypwSNYlqPK6Ttu4liY
	Xi6pSXDq9zHjgyxWNCkjJ0ufUEseju52A7NtW/ICRXl976XfbUv2X7ALxBRORslpMiP+fnA9TLe
	aD0NApy7vNfxE06GLx9T/y0zdDD2n6S+ouLZ9nyggt3MhSaQjMzzji39bXsXW
X-Received: by 2002:a05:600c:4f14:b0:4a6:44b:2593 with SMTP id 5b1f17b1804b1-4ba093b5ec4mr114306505e9.29.1794479836861;
        Thu, 12 Nov 2026 02:37:16 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0950f3casm78894975e9.3.2026.11.12.02.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:37:16 -0800 (PST)
Date: Thu, 12 Nov 2026 13:37:12 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Shunbo Shi <shishunbo@cmss.chinamobile.com>
Cc: johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org,
	syzbot+0b456664585fa81a47f6@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] greybus: verify the received message size covers the
 message header
Message-ID: <avWW2GyYe5_cUXDF@stanley.mountain>
References: <20261112071228.33017-1-shishunbo@cmss.chinamobile.com>
 <20261112093823.37567-1-shishunbo@cmss.chinamobile.com>
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
In-Reply-To: <20261112093823.37567-1-shishunbo@cmss.chinamobile.com>

On Thu, Nov 12, 2026 at 09:38:23AM +0000, Shunbo Shi wrote:
> In gb_connection_recv(), the size of the received data is checked
> against sizeof(struct gb_operation_msg_hdr) and against the message
> size encoded in the header (msg_size), but msg_size itself is never
> checked against the header size.
> 
> If a peer sends a message whose header claims a size smaller than
> the header itself (e.g. header.size == 3), the two existing checks
> both pass (size >= sizeof(header) and size >= msg_size), and the
> message is dispatched with the undersized msg_size.
> 
> In gb_operation_create_incoming(), this leads to an unsigned
> integer underflow in:
> 
> 	request_size = size - sizeof(struct gb_operation_msg_hdr);
> 
> The underflowed request_size then wraps back around in
> gb_operation_message_alloc():
> 
> 	message_size = payload_size + sizeof(*header);
> 
> causing kzalloc() to allocate a buffer that is too small to hold
> the message header.  When the response is later prepared in
> gb_operation_response_alloc(), reading
> request_header->operation_id reads past the end of the undersized
> allocation, triggering a KASAN slab-out-of-bounds report.  When
> header.size is zero, kzalloc(0) returns ZERO_SIZE_PTR and the
> same read dereferences an invalid address.

Remove the last sentence.  0 is just another example of too small and
not an interesting one.

> 
> Combine the two existing checks into one that also verifies
> msg_size >= sizeof(header), so that the "Caller has made sure we
> at least have a message header" assumption in
> gb_operation_create_incoming() actually holds.

This paragraph is unnecessary.  Trivial.  Also calling them "existing"
is wrong.

> 
> Suggested-by: Dan Carpenter <dan@pereq.eu>

No need for this when it's a response to review comments.  Only
original suggestions count.

> Link: https://lore.kernel.org/all/sashiko-outbox-210716@kernel.org/T/
> Fixes: d90c25b0a279 ("greybus: let operation layer examine incoming data")
> Reported-by: syzbot+0b456664585fa81a47f6@syzkaller.appspotmail.com
> Closes: https://syzbot.org/bug?extid=0b456664585fa81a47f6
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>
> ---
>  drivers/greybus/operation.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
> index 7e12ffb2dd60..dcb38dc29cff 100644
> --- a/drivers/greybus/operation.c
> +++ b/drivers/greybus/operation.c
> @@ -1047,9 +1047,9 @@ void gb_connection_recv(struct gb_connection *connection,
>  	/* Use memcpy as data may be unaligned */
>  	memcpy(&header, data, sizeof(header));
>  	msg_size = le16_to_cpu(header.size);
> -	if (size < msg_size) {
> +	if (msg_size < sizeof(header) || msg_size > size) {
>  		dev_err_ratelimited(dev,
> -				    "%s: incomplete message 0x%04x of type 0x%02x received (%zu < %zu)\n",
> +				    "%s: incomplete or invalid message 0x%04x of type 0x%02x received (%zu < %zu)\n",


incomplete is a subset of invalid.  Just say invalid.  Or leave it as
incomplete if you want.

Please wait 24 hours between resends.

regards,
dan carpenter

