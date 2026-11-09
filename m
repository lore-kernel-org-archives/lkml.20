Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234031;
	b=nC3JMEogxOIvYF6ymLa/KSSgDk51DjciYg4KXyrIb+RnAZdyjRNgnw/tfY9iEYWK0HcV
	 I4EA0l/zFzVyyYdZQ5WD7XktpwJR24nef2tHZbL6GQN4n0obkUA5jzx01/xS6rhZz4pS8
	 0teqkMGvHzIRKoxLwD/MIhchIj9wIH4UmDJpZ0a11v2KomcEae01Nh1GZxuPTGzJC0X46
	 Fu2r6f3BrO2BVAdfh3OsfCDkEPpWLiZXkUBxXj3NYri4SDkjv12NHgwc0EwCyEPirhXGg
	 MTwXerUEm40hq7FdqEsILDzK8zUSHTuWgB8/LrEm2NWT2/M4KXnPO9gXqg41ABgDnOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234031;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=hubSjltHAXR5uDS+bxrzSwe1dA3n5xgryNb6ZUfKWAw=;
	b=Ms4Cc2DP57aG5yl5Scfjl0iQfg1CM7P/2YSoT2RiPK4W37BdrSKQPuDsnvFvU2Dr/5aI
	 PUrlx4x/0V/x/mPQKWLtgB7PgD7UwEecKuBRieOW81NZ2WTz0vjhzoZ424AlH9WTSRB57
	 qLnkIMle+xhIr34S1sKWaZwBWOu+WO8vOEHc7u5oE/nxl1jk5IUsCYBUDyFSoDjLRXnBt
	 8TNE58syH5EkbFYtZ6h+79xzeUnacyQ9ifvu+59GtrVvaOldH8+RkAWIONZdPQQpaX5KN
	 lZ3VsMOwJS3MkHPzz8yTmitBDb9t3X/wLvFp12ga/MUarNTUIN8JYN9TNGk5xzSB1Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=MMjHrPYp;
	arc=none smtp.remote-ip=209.85.167.180
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63BF606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:20:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A63BF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=MMjHrPYp
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4c5d8c7f326so331130b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1794234029; x=1794838829; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hubSjltHAXR5uDS+bxrzSwe1dA3n5xgryNb6ZUfKWAw=;
        b=MMjHrPYpfPhWZk8ZjaRup0ksZgMPr1lrBm/bRST8pphRDxk50GNa5QPB71s0C5+061
         FROeJMg5DKbJt28fMuADNYE5mDZ63pt6Fx4ZKkzGY0wZE9xGbRsHVn1nCbxAdbon5Ghk
         RW2vhIUuWnYsu9he9zupLcrk/dfjr4tJgi2DI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234029; x=1794838829;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hubSjltHAXR5uDS+bxrzSwe1dA3n5xgryNb6ZUfKWAw=;
        b=RYmoRALsCwBDZI16MndBVSeHvRmXM3FKaOhQLvk9lIT0H1UbkfAMWHPTCoSTq8iZ7X
         t/jhEqMmoiXlft/4Oyoq26jSWs8Q07kg8ELkpIVFWLLYYLnEIituEyA25HTHMJnAEh4b
         UfEHnK/UE3RzzWDHzxhfxszl5TKcZcD59fRMTXJjhBKuAc01CD6k+J97CDPfuWP4i61F
         nz3eduHt9pYn4lokoUDJbaLVa84nWn5YPhSrWdDaUS71QbApeW86ne0TsOS1dJ3dGuuN
         oQjU9cV1b7eLMRuIT6+s4eY6PCduwZMe2kZ5WAihAjwJH6NavVk1fjZCY3iXEMnMoVQ2
         d9FA==
X-Forwarded-Encrypted: i=1; AL+hErE3Yej8yzNWY7M+3HXBv+QvKYTYEF/TgyBSKTSzgx9upWHRKP9Y/DHzNHqyd5EE8pA48m4+16+bzGIWxao=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yOKksxVUqg8mxXbdAbl+dfFMLL0CGN9URPkD3mVn5QNnKM2ai
	8SyreaKMx0+SlypKeuSTCBRFNZcMdynzc/g0wOxLUDwBtlR0zTcxyajv9NakWNoJpg==
X-Gm-Gg: AYBFou18gXo6WlP7Kab8+6ITCSvlHb3kIOE4hOWkMorVlXJ+SFpgVZLfYTAi1AtVm6Q
	IiosPBPYkdXCFO/Jrf4olustAFmqncD8alN2VfAJGt++v9R7yOsjwaah1H2HxrlACafXZ0gE4nx
	aF7bojkTIZ8KtaHdSsNnqCI6JpE4ubuFoee/PUmXuxLfa8doDCtYaPcYte5yg2syvhxCwDeBVp2
	9esUw8H5RggI68zqfMNKMU+8L7/ip5R0LM/AkwvMUeq6045jD/peWWS5eII045vwcOo4fXJwOyP
	giQH52yBPTxAJq5r1HJMHJpec80GXr6e2uuhO0JLZ/qVH2ukNnfnVnO1R4gQ2i+xoa4HV6tH1d5
	H2uIHA6gmtBLz9L3luSamlmqDThDx4lKwqSV3cf6snRejBxDETXGgKs/ZNUnTODN9ATsvJm89MN
	hijIJMRvKZ2+Mw2/gQZbgTOuwmYWm2fb8+kIbfAZZYNcg0DD5zEw5CcsX/Hl+1/DGZxUJHzeRFK
	yHdlN0sCjXFvJSAzmDYRUGzLjPM1shvQ1Tam/tqUlfL1exE9De2Z2DR/SVb63Kp/ikdnKop5ZVE
	TFKCNrousySULeyHMgBMs64=
X-Received: by 2002:a05:6808:1691:b0:4cb:b6dd:2fe2 with SMTP id 5614622812f47-568143aa037mr2688600b6e.4.1794234029567;
        Mon, 09 Nov 2026 06:20:29 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-56813c71bd0sm4503398b6e.4.2026.11.09.06.20.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:20:26 -0800 (PST)
Message-ID: <f27cb885-76bb-4d2b-b863-437c78029f8b@ieee.org>
Date: Mon, 9 Nov 2026 08:20:24 -0600
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
Subject: Re: [PATCH] greybus: reject messages with claimed size smaller than
 header
To: Zhao Feng <zhaofeng2@cmss.chinamobile.com>, greybus-dev@lists.linaro.org
Cc: johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 syzbot+693652ded53d3eb9cb91@syzkaller.appspotmail.com, stable@vger.kernel.org
References: <20261109013336.1122-1-zhaofeng2@cmss.chinamobile.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261109013336.1122-1-zhaofeng2@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/8/26 7:33 PM, Zhao Feng wrote:
> gb_connection_recv() performs two sanity checks on received
> messages: the receive buffer must hold at least a full message
> header, and it must hold at least the message size claimed in the
> header.  Neither check verifies that the claimed message size
> covers the header itself.
> 
> A message claiming a size smaller than sizeof(struct
> gb_operation_msg_hdr) (e.g. 7) passes both checks when 8 or more
> bytes were received, and the claimed size is then used as the
> message size:
> 
> - gb_operation_create_incoming() computes
>    request_size = msg_size - sizeof(header), which underflows to
>    SIZE_MAX.  The request handler then reads payload from a message
>    whose payload size is SIZE_MAX; syzbot reported this as a KASAN
>    global-buffer-overflow read in gb_svc_request_handler().
> - gb_connection_recv_response() similarly computes
>    payload_size = size - sizeof(*header) for accepted short
>    responses, which underflows the same way.
> 
> Reject such messages up front in gb_connection_recv().  A claimed
> size equal to the header size is valid (header only, no payload),
> so the comparison must be strict.

So the problem occurs when a message arrives that has a bogus
header.  We know we received enough bytes to hold a

> 
> Reported-by: syzbot+693652ded53d3eb9cb91@syzkaller.appspotmail.com
> Closes: https://syzbot.org/bug?extid=693652ded53d3eb9cb91
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
> ---
> No Fixes tag: the missing validation dates back to the original
> greybus import; the introducing commit could not be verified with
> the trees available to me.
> 
> Not runtime-tested (no greybus hardware).  The affected function is
> identical in current upstream master, so the patch applies there
> as-is.
> 
> This also answers the question raised on the syzbot thread about
> whether the underflow is reachable: it is, because the existing
> checks compare the *received* size against the claimed size, never
> the claimed size against the header size.
> 
>   drivers/greybus/operation.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
> index 8459e9bc07..83b16c78f7 100644
> --- a/drivers/greybus/operation.c
> +++ b/drivers/greybus/operation.c
> @@ -1046,6 +1046,12 @@ void gb_connection_recv(struct gb_connection *connection,
>   	/* Use memcpy as data may be unaligned */
>   	memcpy(&header, data, sizeof(header));
>   	msg_size = le16_to_cpu(header.size);
> +	if (msg_size < sizeof(header)) {
> +		dev_err_ratelimited(dev,
> +				    "%s: malformed message received (%zu < %zu)\n",
> +				    connection->name, msg_size, sizeof(header));
> +		return;
> +	}
>   	if (size < msg_size) {
>   		dev_err_ratelimited(dev,
>   				    "%s: incomplete message 0x%04x of type 0x%02x received (%zu < %zu)\n",

