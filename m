Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794473002;
	b=WwVpNvICQWMKvtny44Lq1CvzSMSu5TlHSw0impqDxOmYn7U58JtGbqn70qexONwoJp+y
	 HxsTdXv7w8awz+FQQM9K6mjeuDlvxIvgpx+EHx5W2dj6YxWdH+SxH0CkZtTRX9mYXvBbh
	 nNEaoT+mYDZ1vE13xrZ4ZKJCIgPczskd6rbvWX/kqghYCu+NUxGQy9HxhwSxW6VNfx0IR
	 SziWvk1Nd5BcjSvs/Wf2cMVx/s1GwPTo39J5ZAPX4s4d8AQPT8Glg/uVXQNp5Z9BSX4Vu
	 Mhwgq1G77Rxp+q8cL3fGRwdAt46FfYdezQS0f/ha/6etwFzq3csYiFcpNOzHHAD6nfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794473002;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Ccrg0Ah5/raiZe23O01HRQmfIbLS9+N0hKSJNBgmJXY=;
	b=IQtYjkz/+bv6DukkIhw9VeGeBPtej974LXioPaqNZv4fHUjLPVpfKY3usz0LkyM7uB/+
	 ndrxFZiXuZ+9SD7NAnBFum+j9YNmgCu4LNCI367ZizD7F4rnFJWtzCqhpgfiSUEzzkyAe
	 5JKrDv4tHfS9abssfjtUgKdHq+xZD0c4qsQKDjehJDnuuf2X8GBw6aNd8biNDlJ6LHdGj
	 CiwYRrbhUdWUs6/I8WDGaEjDocDSb9gVu6fAjSde9vpEFoHwxMhQxY+FnZigexZwZdNHe
	 9jI/XoIXvxov6C+K/2KxyaypL+25ff48JfMspGDhEPlGC6ZClfoWLobccUP0x4Q6C2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=pereq.eu;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BCE606B247
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44BCE606B247
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso25601555e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:43:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794473000; x=1795077800;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ccrg0Ah5/raiZe23O01HRQmfIbLS9+N0hKSJNBgmJXY=;
        b=A4EaYZhgmkSbcLZvgj56cyXORZk5zjC6tSsyhqnkUJjk5zI++IpNp+kk6LXHFFiAhx
         8gUFitmNikekkq0D4lv1DrF/BC1+PXk2w1Wpjcv4x0WgoLZ5+2a/RjtOs1sMHJ9hxorP
         4Wei1KKNsyMSFMahjsqUVGFPUxgUzHzLRqAWOGKHv0jvtoBNAbMbTvQpY5zlgZQnwk3O
         nFySliYuJSDy1MpFlxbQNpWoqI6oaWqwrKlObltSUurpqkPsqjjTUKaymM51NRRM3iFh
         JMFlIMFaZrq69/lBGetsyQSjb4VNVZGE9u2rbjC15OlAa8gHx4rIStoHz4XRxzChvQNk
         Kgrw==
X-Forwarded-Encrypted: i=1; AL+hErHcDwfj4mwqpasZkPUktrYJpvUkCTsUqvWOoqD73NxmEY2DlrziIjX0L1E6MVrp59YwFEV10mUzKNT28Wg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/95bHdJjzz+GQyrtuJG01o01og+krRO506N/LrXxIt+uQzwVHM
	lkpFSmk28OlJ6QQZjmilyZCH/GzCHrU7GUNQUL4a8aN0j/KG9nT85Rzf
X-Gm-Gg: AYBFou15616uTDgEIZ9sRT8zZLZS62oOxFOPoI8Wok3lgbtpKHyLz1OKUyP9ru91pPj
	FttSVVA30OJEUY1d4tW3+CrZvWEKOkSfq+QRfjXReBaOzKhsaM6SMib1FTKuCtZwxlitOUlUdl5
	qQ7bvVaTg606vIqpx1R5RYeb8qFAnGQHHlzfuvb3ZFGmqtohW4uqmu6SIXOvIQBz5KmJ6k4TS4Z
	36EJaEJZ90M0PbRfICZFgfVfUiepCb55qHwU54gr38njfwLv18cxyB+FHrZujFaddzxiR7cswtY
	mVONeR6GhlM5pLIAUSRnvyQXHJ3orYyIRQBtn0eQMaxz+TTEzcHCm2CMZPJ2Zy/NsZz0iq4WqCt
	LQFOTYYiyayaA2z/ctC+Emw9YFplzCIg2MucFyFSPvGX4W68l0FvdZ1GLZyvcBMHk7qJRP+geTE
	VSz69IhrC58fxWLgT0V0JTuiqX7IAbZcVyIE7gqtMtnYUYUoYV1DBX+6zNGy0ma7Q2uNMwRxtd0
	DZVnFXipXWPQd+xohQUyh5a5qIw4yMVWsuxLif5IUYa+qAbFoC3pJRm4hNpnWwFeL9vh8EA68Cj
	iZvsRThgFxypv8rrhdv+gNg3kxz1VQ7VWJxjkz6slHSi6c8RRosZFP+E0YEPnPiXyCTmgXWmCEB
	BUT8n2VJYI5zFq+HNvhitKy9fir5VkQ2F8aatNacy1bVzriWcmPAQFgWaXlyNCeHczNMCfpcoAt
	+jDQV6mw==
X-Received: by 2002:a05:600c:470d:b0:4b1:4017:c4f4 with SMTP id 5b1f17b1804b1-4ba093805b3mr88234605e9.20.1794472999607;
        Thu, 12 Nov 2026 00:43:19 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e258e8dsm82532545e9.4.2026.11.12.00.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:43:18 -0800 (PST)
Date: Thu, 12 Nov 2026 11:43:15 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Shunbo Shi <shishunbo@cmss.chinamobile.com>
Cc: syzbot+0b456664585fa81a47f6@syzkaller.appspotmail.com, elder@kernel.org,
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	johan@kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] greybus: verify the received message size covers the
 message header
Message-ID: <avV8I97uZJgX8Osk@stanley.mountain>
References: <6af55517.a0c627da.5d811.0010.GAE@google.com>
 <20261112082230.33584-1-shishunbo@cmss.chinamobile.com>
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
In-Reply-To: <20261112082230.33584-1-shishunbo@cmss.chinamobile.com>

On Thu, Nov 12, 2026 at 08:22:29AM +0000, Shunbo Shi wrote:
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
> 
> Verify msg_size >= sizeof(header) in gb_connection_recv() so that
> the "Caller has made sure we at least have a message header"
> assumption in gb_operation_create_incoming() actually holds.
> 
> Fixes: d90c25b0a279 ("greybus: let operation layer examine incoming data")
> Reported-by: syzbot+0b456664585fa81a47f6@syzkaller.appspotmail.com
> Closes: https://syzbot.org/bug?extid=0b456664585fa81a47f6
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>
> ---
>  drivers/greybus/operation.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
> index 7e12ffb2dd60..da53c0e026f0 100644
> --- a/drivers/greybus/operation.c
> +++ b/drivers/greybus/operation.c
> @@ -1047,6 +1047,13 @@ void gb_connection_recv(struct gb_connection *connection,
>  	/* Use memcpy as data may be unaligned */
>  	memcpy(&header, data, sizeof(header));
>  	msg_size = le16_to_cpu(header.size);
> +	if (msg_size < sizeof(header)) {
> +		dev_err_ratelimited(dev,
> +				    "%s: invalid message header size (%zu < %zu)\n",
> +				    connection->name, msg_size,
> +				    sizeof(header));
> +		return;
> +	}
>  	if (size < msg_size) {

Combine the conditions:

	if (msg_size < sizeof(header) || msg_size > size) {

regards,
dan carpenter

>  		dev_err_ratelimited(dev,
>  				    "%s: incomplete message 0x%04x of type 0x%02x received (%zu < %zu)\n",
> -- 
> 2.53.0
> 
> 
> 
