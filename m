Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794235401;
	b=DVaq3rySh3D2vGjENP/jOKYVvMOwyY+fcgdV2TdRCPhMuTpwDG9RbPSMTf32MEwqmVHU
	 IYhyndkPHc3i0i+D80MtIyKmRCKqaij2TD4Btd7XdFjeumea2DKr7s6Qn1s3onqIxm6S0
	 IXhmNtX2Ynrb/iFBRSLzbDZ1P0ejk0BcC2ayXR3KZm7wvXAiu/RmRil2jQ8zuKLv545qo
	 UqVSdS+f328P9MQRVw0qtj7afv7D3RwheRCumhDzWCbQnZIam9uuBzLUFn98ZmxL+MWKG
	 KbiipsPLOKpyPfP+TZumN7b1yC0405VGoVZ4uhSfyG/vRF+HzbBwr97CBH4SJb+Bq/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794235401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=eab7x+/IWkDtBF2+kKHfms5l8bMxSW46Z6JtuZvSMn4=;
	b=YQ3auv78VZNN/iaiU0uJrJwpDgZWm+OcWHBHKI7E/7YbngIgXjp8SQeLjep87+M92FYW
	 OIY7hAFgipsfyXE8M4DRqg06TYFCmgN5qH80tXVM4ypW+37RsQ971LcQPzwU5DCZV2YKC
	 /BAkkj+vYY0W+X4PoTwD9cj8W2XKZxOF32OIRISqQ8JIiGJrUjM98I+eCE73c/2aTKsu+
	 K+cUXu6oJV0kPn2qSsEaWL/3LAbwX8GPHh44Tb+ixHNQ7R4PC50+MRwm5SrcSdhEvafQw
	 NnofgQ6pJ7tiHoBlYpEMVAzrL2zu49KrnY1FiKeeWRzRfU2G2lehURByB0rw6RAY2ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=WnvVtmaf;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE13606D827
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BE13606D827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=WnvVtmaf
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-714d57774d8so558804eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1794235399; x=1794840199; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eab7x+/IWkDtBF2+kKHfms5l8bMxSW46Z6JtuZvSMn4=;
        b=WnvVtmafzpOEtLJCghvPAp1Yk2EkRfKAcTofbdAd/PD9dKkk0NkVsGGRDUJB8qdxb6
         7QWgZBEOxNuBvdbPrDDUAw6ycTOABv0xkgQrd3XhWAI8RAbsJyg8ZISzYDUdjc8ygzKx
         gw9p47qYVFfInjin6l8dseThpuz2KMOIvJuSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794235399; x=1794840199;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eab7x+/IWkDtBF2+kKHfms5l8bMxSW46Z6JtuZvSMn4=;
        b=jsofmvk7hvEmbRXlQbPxLsWFEFqJvrQDbQRw3w4VQ+qlTssWgKFNc+0glPWK1SbmET
         GpLHfrTjHrb6FUwEJtU39Hmi8AiWi49DzyyT8SvX+clDdq7KDiN7nOSycvQ0KB/hNXal
         zijueh5eYiz9G7h/lcB1aiG/UKTYspRgiA36Xv/DI3Fa6xP8prrKOjiZVoV2tmgCnYvs
         nnrmL5EFwxohwcpyHPDVL+tZZeQWRqelkhvpIYkeKWthYv4deLOmhtQO5ZikUT3aXEh4
         s8vCv41kkX97w1OfZ7jv0U6pkNrH94jwmHfH8oRBtt9gfSfmUizIf+ttC+gexh6J3cfC
         Zotw==
X-Forwarded-Encrypted: i=1; AL+hErH11nvFti1NLIfH5EbLKrx+1jAth3pQjjJvkQSMEB76edmo/sKUAcCEOSyBsweUXI0XAiq3I1O7OXiwe8g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YP7LNWv2fQmVjzCdc0OhOzZbiddr2O8ww7bW9pq+PRO+JMEwb
	7x2JmvHFmP3SYjUvB4qEvpb3+dB8RM21EYuxNbUTTGOwvu2AbQlu55sT/JS4L95klj/INqAnnOA
	vM4/umg==
X-Gm-Gg: AYBFou1VonFc/hstzrqFPt+hSB0Zkxx/wZnqeDPT9VEUAsELGfRR8B8vdqk63TQvsXt
	Q9UDQREc1PI5ETwTIa1IBBpidI6Kusg0DKmSI0r+9qQA/tBvrR2GXHrU4gOworoUxX+oGfwdr0l
	oQBlsOrw9Q6NubS4z67hKO08YaPu7Si/axpfRfi0TasDK1KaYzffYVg0OsDLAk5wIJ2zXkex5Zo
	YT/NYw6tIbp/cnK+zg99xEGmZSEj8+wnS3Df1NvHeG4ghJseFZZcVa8W1z7qP5ERdoUHqJlvVyv
	Tk/GFdG5EAa8HT6KHv1mgdAZqXg71YYcx+ULiGybDzRhujdbg10FlG6VfygsIJzuVXylob9XW3g
	pcKq/B2ZACDSstmQvBjL9QomTbCX9qjLwvgeiwQn8942Fdgo8GqLP4IT1uMyo9ph3X4d2VO62db
	0PpcKIy7rStwuZqyahWUi8uMfXuSmzbRpUsePx0ntYijzWzxjZS7rT/dz6ybRgduj39ctPhSzJG
	oo98BdCTvwKIRDH88wjzlFEusIZqJMZ9EJGxoRGBNzeRx2+LQikWt18Y2Eq6R+0YHtFusz347l9
	Z2WYhujuF+ixPAPgZ2bqvp8=
X-Received: by 2002:a05:6820:1c8a:b0:716:db9f:682c with SMTP id 006d021491bc7-7170f34476fmr2344540eaf.69.1794235399476;
        Mon, 09 Nov 2026 06:43:19 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-85f4fbce9cdsm3779583a34.20.2026.11.09.06.43.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:43:18 -0800 (PST)
Message-ID: <ff30d76b-a58c-41d9-a4ab-1fdb7f931f46@ieee.org>
Date: Mon, 9 Nov 2026 08:43:17 -0600
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
header.  We verify that the bytes received are enough to hold a
gb_operation_msg_hdr structure.  But the 2-byte size field within
that structure lies at the beginning, and there was previously
no check that its value made sense.

A valid header->size must be at least sizeof(header) (for a
zero-byte payload).  It looks like gb_connection_recv_response()
might handle a header whose size field is too small, but
gb_connection_recv_request() does not.

In any case, I think this fix looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

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

