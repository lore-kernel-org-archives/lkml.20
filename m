Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794780173;
	b=q7jo96vw/VjaBgto7knsJJWa2oI744y1BDnIzoOMTVnIKk/y6Iy2MYOpa6SpDhOE7avF
	 gXGQHZQQz3zSyIhBjUWpEaF8GumkctOY4+fuvt9nRjHgZxFeyvAtrszhkMxUvWuM30A1q
	 HZoF+fXC8O9r6XTrdl0I4krMCouv21FDm1EvnSyM/MIy+BEtInZihHVVoYovP+J3Vberp
	 k9QSafldsR//FEyU4/E4dLJ+J7YveVjgVNAP8B4urICkOOXcAZ60Wkpi5CpCaHCxrC3R7
	 hBEHOK2MpBRKcFHUxoZ13C8PTxATaQCSraFIS9WnFWbSbdVIe9Ec1E+cdfOCkUq1OHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794780173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=44GH0xmAnqDy7eYWEVRDMZZHirfXjJwNhusMFmtNtQ4=;
	b=mTHznwi8kZWlfw+BCz9WMoHUmXWFsDjc+a5xyc5UnfA3i6wxR6hApatQKbEGw8KWadmZ
	 eEt3r2NW4YvOKdfn879WcIqBTSpZH73rFWoJz/Hm0zAhqFsH+LThIK22HUDf9G3c+t/FZ
	 9MoRt7pk5NkERiVJbnstzoefZDrFlZhZIN4YZf7aRO9ADpjBOcROs5ELHulQFwyTbLuh8
	 j7ztpVE7ULv6szfitp0ItyivpLO9FYaEzJUqd6xl+e3ydJDVB5d1cWTh2W2OwnpQIerLM
	 FnWFyNnOTIFvbVB5FeUv5iXcAL8x/alJ94Goifys7no8pEh+JeVS9HnoII1r2Liqn0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hMa6qxkq;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B174606A329
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B174606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hMa6qxkq
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4946589267bso344406f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794780172; x=1795384972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=44GH0xmAnqDy7eYWEVRDMZZHirfXjJwNhusMFmtNtQ4=;
        b=hMa6qxkquxLiBeveT81zF68GYb6CJxnvwU7kp66SYWYPigJcJHz6TmqT8tw5C24616
         bubH74AOXFvkcsGJXAFfX+ArBiWMUTVrjwhG77MzAp//sMX8SaJWiVMX8xbugTLpX139
         ZD3e/ooXqnWaj4k3pqkQZ7Ft7ethobWskQqXiWlTzPS6FzQTbXTCs9YNkLUKd2FIgb6A
         i9BZFyb0uuNX+i/i8CL3owRjg6mEGQGAjW5xHEdX0acwezoshJsS98dWmUMYOXQwW5HQ
         H24EeRiAZMJWVXcOJLOP3bGlk34c+aIjKvF4zN+3LAEJCNcrZVfT3bqNH8kene/rRrWM
         7VaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794780172; x=1795384972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=44GH0xmAnqDy7eYWEVRDMZZHirfXjJwNhusMFmtNtQ4=;
        b=NhUVPzHnXxu7I4UztAX2gbOCxGrKEs80cZpFYr3+wT5kjl1IpEePwprDKs/5SP3Ro3
         ThCMIavQhrlHtlhz51dYcYAGf6ES+YsrHVX3o5zsVI5J/YdJ4w/p1CJ+Y9g8meWxMmmN
         cyWotaB/7e6iLbcXZHE0hBSkjzprGaICI/py2pK/9EVcgno/1WbfVR9Ph3KedyQQxRJN
         vHrbI/YhGlWo1KbqzYKbr5/sbH4+a/iRj3iT0bJNW7VuG8kdNT3IsIrhiXOTY2m1DNYO
         D2GKjAvNgQ/Wv7ULj2jpQlnn55gE3lFYiYydtJssuiw1Y8R0ljRwqIezLrNa648Sl2yL
         ao+g==
X-Forwarded-Encrypted: i=1; AL+hErGxkDeUrKxRCkEvtoPHkVDcmaXl9KKQUyOUF6X7TvhqcbDvx7M8EwwPuJ5cz4itvPiQL5EZCZrdpuNB3Jg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PeCz3XZ+icciOX7Ty5z8hgEI0g27ASYUNvMXNDes+zvaXdwYH
	EoQSsHGFHsiHMt/9PWsRmwjuuWGpBHv1iltFjTGkNwXplGYa1/MgR4ry
X-Gm-Gg: AYBFou1UEzFqIMn4czAwlAW7JSXNbFQL600yT0fWe5jNyh/z0FC+QZ6AgOa5pRZKQKm
	Ig6tj1IoGAm0PKiOYKE6z3eyi70ymR97CdkVOxcIgbQR44KLVRjFngD5UqLiEJYGLjBrhSfdBxk
	81lAMO1wC8S0qcHWVGHCUff/fQkGFBkiSxGkGi53VgOqtPvTwxaAoKkwNKgOe24zpnLH13uTP8D
	uDgisikN1qHOYqwhcnoRCts87INVpyCPhlwRhSjsCKU0G0YCdXVMCem018duNpethoY3NBhrud8
	9BWsJnJD4KqQ24BuQ0gP2ScC37DbsRBwVMN63ZFsFvt+z+DBlDN6qzg0OCxKE1kOb8hSZRUvrDu
	c3fAg6G4YJP9dFDKEIS/wQLefyaahw4dy2lVUYwullYzz6cYiF29wh70SZOcLpe+jhaeQdFQ1CH
	49jXPXW+teLM8o5rZaL7Pc1X/qJa66nkh+Mxbh4sluXunsIonNM8KNSFh16U3HJLc3QudMIFPU6
	AiXgiRN10NH5BT2g9vUTho7nzo4wXDFqoeOBmrwaxt0e3+/ViFTyO9M0V+4XxPNMjd+iTTLomYc
	HTKKiGUoV8c5JgnNLDQGAQ2x+pJFSSKZY7ewQjo4GTQNYe3D8XTvrhh6CYpBK1NR07/LCrooZ+l
	vyrZtHlxACI7mQ4FkYpw=
X-Received: by 2002:a05:600c:8b74:b0:4bb:6a02:d42e with SMTP id 5b1f17b1804b1-4bb6a02d56cmr58017955e9.1.1794780171572;
        Sun, 15 Nov 2026 14:02:51 -0800 (PST)
Received: from Nuel20.localdomain ([105.112.221.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb734b9f44sm9320665e9.1.2026.11.15.14.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 14:02:51 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: tianyi@cloudflare.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	kuba@kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: Re: [PATCH] selftests: net: veth: propagate channel-check failures to exit status
Date: Sun, 15 Nov 2026 23:02:40 +0100
Message-ID: <20261115220240.51713-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAG4wq-exUYFvw4i=gQZhwC8fF3tnhmOMtv+NceYTBEx_TO+F7w@mail.gmail.com>
References: <CAG4wq-exUYFvw4i=gQZhwC8fF3tnhmOMtv+NceYTBEx_TO+F7w@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 15 Nov 2026 21:34:29 +0000 Tianyi Gao wrote:
> The Fixes tag should point to the commit that added chk_channels():
>
> Fixes: 1ec2230fc721 ("selftests: net: veth: add tests for set_channel")
>
> c017800af5c7 did not change this helper. The bug is present since
> v5.15.

Thank you for confirming. v2 already carries the corrected tag:

https://lore.kernel.org/all/20261115214702.50817-1-emmaonana18@gmail.com/
