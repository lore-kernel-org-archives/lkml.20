Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794632500;
	b=dWbiHbVQSMmGA3PJjOVmv3vUGV4Eu7DFF0PNxQwRWp+d8s9S1w2DWnsrbJQDPmmHKuqd
	 7iZIDdYJQK+vB6bxpy6vRY3Ki8HTU49JHIXCc0jR2CwehlLkZ80WImBVDzp5Rz+pHrCms
	 lREoZrc2kuTk02vEygZzrI+fzaAZvuoKly/3dh9UZ2H5sq73PIwcmpf030AAj0yL1YaGh
	 EPOU85xNIRdzMtlHGx6FPE/a4SNflH18pfYYn7QtTJh5iqflWfUFW3PHtdo7l9Qt0ENYi
	 SVSCDZwtjsJgs9M//2DAJ8IxzX4HU0eLDprIilsCSJRoU+UrLSvG2cyhAFWbzYozC9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794632500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=XsyBqFQpB4uqfmK/Q9kt69A4CrjPtbiX6wa6hMkSoPo=;
	b=kz+XYk7uNt/WQlT977y3fH/n7q2TlO+MKPalzsvsgqtdBXTUcWfGuKEGEIAsyIAwHRH+
	 wiJ05WM8VRnSyEVDm8KER8mOdcC36oPr1zzZnnarQCwzq9GIt5rPgcrUQFWn7A/WjJImj
	 tvBHW2LikWc7FX/sMYEyb7jFCa9wEnpTt0VkZBibzBp7GsFqDZau08N3IUvOaYyGhoHPD
	 4+bJWK4l48CDKmQCDGamap7G7CitDf9n2rvh2w+bEfL2xQ9NjpFDmHjwXGKCJcDfdnZ6p
	 EiHYRzc20CRIkdNc/WxINkwJM0TOCtFcjbDX8ntYctAdJaXSsU46wapm191o2XdzKkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JoOiROaT;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2379606A89B
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 05:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2379606A89B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JoOiROaT
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb6057b03fso2944245e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794632494; x=1795237294; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XsyBqFQpB4uqfmK/Q9kt69A4CrjPtbiX6wa6hMkSoPo=;
        b=JoOiROaTWElWJE/9OqmMcTcIEuBaZ9LFk+zZjR+KV3E2MgEALRFAz8g9l44oWgTpKW
         qclPPYr9pwJp8ludq/OulNKENxbDXJdVjUDL09hiEt6S4Y/X21V1+cUKZizLzoQx7Asd
         klCu4PjDeXbR6e511SzOwQ2lngjkAjWv1/vuNQBEHmGQP86DbbsqHK7q8jwWg3pEyFCc
         RvDxhUgfx+Q3sCp6ZYd6kpIZWXhCS5Jhvz1z6mnydrf2BWaj8ZXV7BBbCEe/DqAx3pDp
         BdpRZ7NqcVFMXKNUCRmxuXNKatZHpxvdb7cbakINnm7zFC41L2EBYnAVeS3vSHnGZMBq
         T1PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794632494; x=1795237294;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XsyBqFQpB4uqfmK/Q9kt69A4CrjPtbiX6wa6hMkSoPo=;
        b=S+ftKkT0c5m269PHN+zSoFRnzSiQABaUcteCTVSriQf6J8n4PdFHi5HO5DGxWMrrOS
         bZ2Cy01CG9xcx4T3PYcMi+s4YFULjLrb1+L7HkEzvPkrVSmmbud2A33wL0J8pPom1bka
         YjB5K6fGEb3dhmm6JYXFsqUQos8e+NKfJzeLccn2t4v3HquezP+vsMsSOpQwhjwsYGBz
         IXC9MXrX3UXyXA/lSHnvMUuspCgGEdF9MCaI3spZJ/MA8cw38KKoGtlyb57JlM9OTOjO
         jrUBd/9pgU1zHk9USC3S8KxQjU3CWNBj+Q615qg7M7ZP5SP1M7ugbwnLfihzWSe6EkXr
         HI2w==
X-Forwarded-Encrypted: i=1; AL+hErFlQzRQY2nVQ05bD75pItZt/yyxb+iOcta3/CMT5VvWXz4aViystl8QeP629JD2Zo1RcqBmLOTQai8JXRE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wNey7RC5Ljj7a9iXiZAo1RQCxCzW30chwvpV6JVm1+j0kTt7i
	UTAXIBmjt1TunDmNQJdobI8cc/H84ljuUn86rUG6WnfxZca8wx2tzJOf
X-Gm-Gg: AYBFou2LsW5nwa02T3PPnw+e1622sBar/2mv8y+P3PY8+2nZot0YbfGmX1jmwgo75Ef
	p+QLWko7GUepYLN8xzVpcUs0s17QVRrBbkGzEUU6IpepHf1adlE9mkqxKOvxDb2DbMRB1qYTGgQ
	vS8rEckQHfB1jIJRqarWkjoZBdTsMQokb2JzxJQzA2+T+hvJP93mVDVB8Xboq7zZR/STYarzq3s
	KeQL739/S4fWz/sdK6nkgpFePjt4lydxlKtbX1vDygmw5VU5rNgfJibAw6YGyc/W2NDwAkA5CNS
	JMAdnpFZHDwWOLqswefcYbLDbsUd29gZDEqxuaHou9QHNNla1shQiDclodn5r6AIcgNgKlFiFNs
	Z/9v8HE8daUV8Cna/GykIWgO6RoYlhdpDXEVn64OQl/HBwuEVtv5KPXvS/KYPSF0/N2RSgCq+GQ
	pxvZJb5GTOnk790Oh+5kiV9/s14E2PTyPhK2VwFK04io24MQxZL3sEAE3R/Cpg6e9PwgAQ+Txt+
	rRlfEjegLF5B8rRZgxqn2pHvr0kBQs66xXWIB7fYj9xwKF+96WOjQ2CoySEmVB+TSZy0sd6VWmi
	988lbEaCSwWFKzfXKIBzVJyalisarAzDiv1+Y54lNfbCW1f0CzIPYA8mvMLQ1vkXZbZIjKqdRQH
	+OJGMPsiruEsxWoTQD50yUVsnv6hVMlYzdNEHAznQvnPxB3Qnjjsg1IxTIt4JYiyXql4=
X-Received: by 2002:a05:600c:1913:b0:4b1:2026:6b41 with SMTP id 5b1f17b1804b1-4bb55ab021bmr98950275e9.30.1794632493836;
        Fri, 13 Nov 2026 21:01:33 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5671059bsm65540875e9.1.2026.11.13.21.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 21:01:33 -0800 (PST)
Date: Sat, 14 Nov 2026 08:01:29 +0300
From: Dan Carpenter <error27@gmail.com>
To: Shunbo Shi <shishunbo@cmss.chinamobile.com>
Cc: dan@pereq.eu, elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, johan@kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org,
	syzbot+0b456664585fa81a47f6@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH v3] greybus: verify the received message size covers the
 message header
Message-ID: <avfrKSBbpEp7vQyO@stanley.mountain>
References: <avV8I97uZJgX8Osk@stanley.mountain>
 <20261113234739.1432-1-shishunbo@cmss.chinamobile.com>
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
In-Reply-To: <20261113234739.1432-1-shishunbo@cmss.chinamobile.com>

On Fri, Nov 13, 2026 at 11:47:39PM +0000, Shunbo Shi wrote:
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
> ---
> Changes in v3:
> - combine the two separate conditions and unify the error message
>  as suggested by dan. Thanks!

Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

