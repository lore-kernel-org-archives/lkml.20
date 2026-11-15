Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794754571;
	b=e/W1vwahQQnPO2vDS5d6BOck029csRmvSwJKP1RvicGo0URR41aKT6u3VWeeKpxdJSuu
	 zF0lrSmn/PGNi+/1tvm802bkKqBM2YPeQsSUnd8W01jK1nwZSGAAQ4CTdM58WMKvE4N1n
	 jraGgpj3HqSsIfZttWgVRDMDOhl3cJTCRBMXmNfPi8dwKEUTcBM4+6AfNI5OWPhJyDHgp
	 RUkbVJ5kqStQQfiC8vweULN2ChNQfpgpqnVihOJm8M4M3P/LB0UQtVBBgvNZVtQbEaS4Q
	 L6CCXl7VJT18tVSV9lDIBx24P2S9OjFGKWyaOGY305KfNHejeiVT1fi9GUe5D/atl7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794754571;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=66KrluPErA73yZ5oWO4/Se+YF4oLxRzv02FOs2NcGy0=;
	b=aoPj+wcR7x6gZa73NaH+TTiFQJcS1icLHvUrXb360HYHL9m06yIE1LHm9gXmL/XtDiSg
	 brAyv3o47l8PAx07uye0hiI49GRAmVSECOuTB6kq1QDAQWW62gNNsZAvH4XxBemR6ew5f
	 zMtYB65MVFSZogshFkYhL1OiZkC5byGSvb+kq95rKzibyPdIi/X2M4rV2+KKy5o7pBdZd
	 0VmAWDst0+cCly8KlplpnezE2hIvQoW5/ZzCBMyxW+XUM3bp1DV2dwb6SYdt54L5fOury
	 aq2u/Cjv2z/6v5Z4Bmk2fVixilVk634Wlcxg7kt7YvXo//Z97yGwF5Skzmfhi/XI+lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=MdjyCQDg;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB757606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB757606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=MdjyCQDg
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-86210f31496so2290685a34.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1794754568; x=1795359368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=66KrluPErA73yZ5oWO4/Se+YF4oLxRzv02FOs2NcGy0=;
        b=MdjyCQDgymuxq21YTzEo9I02h9xhfqBitfXT2rvxDMXO7aai4bGGI7wS9F9l9TXhuh
         tsSff63SYcMwrTPUqLh3CZM8wcRXZNZabZ7uKKHRXyd7W0T6ypagmMWJOJYMZoGWVRd8
         xeKYKWZxNvg+IGCJo+FCvsYm7x0fFgFGH6RDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794754568; x=1795359368;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=66KrluPErA73yZ5oWO4/Se+YF4oLxRzv02FOs2NcGy0=;
        b=G1AQU4pr+I+9I4YsqVSXeJezpPcivRZvvEYWniRf7ws8KLoYX6mBut5y6A/Os50SgG
         N1z3MGlchsLxAfbhiTyM6W023ND9Mz5NDeqx1QULLQhBbEniLThkNad4I3A7cBmgUzD8
         Wlv6V/n37hzliLbUvcVPzmVA8apdqLVXxvnPCmFoIfMgnYsUR3qTshtysABkBqaNN8L2
         1OgCpKCpWsNeHWMx7/1I/IclbhOdD/v5oGqW7ggvFakhz6ZEXtG1cgaX1HDUF0tu6yKg
         7QeOnrVzxOoXsxaxrLoprRuOz6x0H6r8Ir9+CF14hu9QiQnRkXdkLpjkBstlnW2c7yZJ
         0JsQ==
X-Forwarded-Encrypted: i=1; AL+hErFBSVcTm1lUcG8fVegBlHysk7WxUeG8Rykezgol3VqeKMYA4Z7VbORs5QbtMEMizaAS2gnk6EV7McE8dHw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UYNt0kKcARu7BVsIWdPF3/R/0SLDy5YzEQGbQelI+lMR83nCC
	rE0zD5bdpRWZpgswSjnwHYqtwBBLwBUuGws8i6sxaTrrFX8sJcX4LC7T0cemb642aw==
X-Gm-Gg: AYBFou2IxwksUlVA05Pui3GZafX78fUnc2D/nWHOkX3Ww/DBjjjGvd6wyWRZPIhrssk
	BrW+7i5y+IuVMdogHVTtE1vm6Fj50/fPSIRjMCSkQqgob7DuISzqNXeQp/nN1S7Ma7scK8GoFT2
	x2ahBD+j3mKrVq/cwVah5uhXDnKGLt9fL98IDLxk7EjiGqzsqPym94WI8A3+wK4HBwp9BBIsxKK
	l6WC12diyUvCaldyIM5EEjnhE6Dcr/WNu/Ky7WdTFuwtROZWX9D9u0vtj3fHZwSVOmZkylD/pKy
	lQSi2gYfJUyV/d6SSLdMOOlB8c5qvoU5b7uBwKjO4d3bT6S4VvPo+nOCV7ed0Colo+fS8DNjhRJ
	q7bkIK0lBQkCd35qebV+nBKsxQWkNL7Jl7rtzg6nFCr4/MPzihiYCXFU2tm2BXylPYbJCjtwcyy
	I8FJhUQPujXZ6DRf7Tu0bz1pf0+cb9qkiwCLSM+Skz+NwnQRvGWxTTE8lBUzTbQzf1yWj75BSSk
	ujDS7JpFb5baIQ9T7Sgm7M87+vopnsbbiz1fpWmUIsgTt1FqMMNw1ysowQgFpPQ5mtQTk7IkVOB
	DR1DdFKq07KQF15tP9NUOMEJ
X-Received: by 2002:a05:6830:3495:b0:85f:31f:7643 with SMTP id 46e09a7af769-8628981ad1emr8483076a34.7.1794754568555;
        Sun, 15 Nov 2026 06:56:08 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-8628812e44esm8317981a34.15.2026.11.15.06.56.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 06:56:04 -0800 (PST)
Message-ID: <b304a5dd-f6b9-4cd8-9d2a-8ca398119a41@ieee.org>
Date: Sun, 15 Nov 2026 08:56:01 -0600
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
Subject: Re: [PATCH v3] greybus: verify the received message size covers the
 message header
To: Shunbo Shi <shishunbo@cmss.chinamobile.com>, dan@pereq.eu
Cc: elder@kernel.org, gregkh@linuxfoundation.org,
 greybus-dev@lists.linaro.org, johan@kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-usb@vger.kernel.org,
 syzbot+0b456664585fa81a47f6@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com
References: <avV8I97uZJgX8Osk@stanley.mountain>
 <20261113234739.1432-1-shishunbo@cmss.chinamobile.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261113234739.1432-1-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 5:47 PM, Shunbo Shi wrote:
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
> allocation, triggering a KASAN slab-out-of-bounds report.
> 
> Link: https://lore.kernel.org/all/sashiko-outbox-210716@kernel.org/T/
> Fixes: d90c25b0a279 ("greybus: let operation layer examine incoming data")
> Reported-by: syzbot+0b456664585fa81a47f6@syzkaller.appspotmail.com
> Closes: https://syzbot.org/bug?extid=0b456664585fa81a47f6
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>

Looks good!

Reviewed-by: Alex Elder <elder@riscstar.com>
> ---
> Changes in v3:
> - combine the two separate conditions and unify the error message
>   as suggested by dan. Thanks!
> 
>   drivers/greybus/operation.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
> index 7e12ffb2dd60..74429f3745bb 100644
> --- a/drivers/greybus/operation.c
> +++ b/drivers/greybus/operation.c
> @@ -1047,9 +1047,9 @@ void gb_connection_recv(struct gb_connection *connection,
>   	/* Use memcpy as data may be unaligned */
>   	memcpy(&header, data, sizeof(header));
>   	msg_size = le16_to_cpu(header.size);
> -	if (size < msg_size) {
> +	if (msg_size < sizeof(header) || msg_size > size) {
>   		dev_err_ratelimited(dev,
> -				    "%s: incomplete message 0x%04x of type 0x%02x received (%zu < %zu)\n",
> +				    "%s: invalid message 0x%04x of type 0x%02x received (%zu < %zu)\n",
>   				    connection->name,
>   				    le16_to_cpu(header.operation_id),
>   				    header.type, size, msg_size);

