Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793710711;
	b=poPCG+9wjL9IYyLLji6esdHHhrkNXwXWYvPjdtAtsP+AVJ7l3RKtZeJBfNk19cZJ2/TT
	 y+eR544ufQjHFORt3BHoSUZXIkBMy3n6allG80kUHFWxHj2oi84PI3faAaItRvUyFKyon
	 R3OUAGkVY7OPxsmoL5nBZ8k8OGrB+pAUNA4tDoCeDSMuhpeFxSEIXXFka2PDiW3wlhtAO
	 vCuiK0+/HdkMB6lEzaAPXZH2w38PO/UCw9V9Ble91Wzxa/DJ2g8S5M21QK/OZaD47PjV+
	 AkITJaG/tlpZx/HRI2kiBWH6uV6rbYvJC2HlC8r7L+VWa1ePRNgejGB0UXi3N6PZP1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793710711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=13BR70RLyJfPpHnpQCP+Zr7de3wwxMOidYdoAlvzUic=;
	b=R+GjKpilJ3DYG5j1LiFJmHv8qPkqGNbrYrcqMib3CSzw4srmSVMNsSTrRGccJoU9VpfU
	 6vBkHT20GSutG8aubzL9U+U4e+IWE+DGASuLvL+3xASsG+qSV/q0Ag4etJWhdhgoCZjTm
	 Xo4Khdo/7CXtDyATPvJ9wzlAhsDY6YMLlr3Br5rQ/0t3zvobLvbfULnYSeG8reqFJQ7AC
	 hytV+K/M3w7zcgqjlXotOOQ6wvwuVuVQhfek2kKjeLqA7UmUL2hDAt2f5ntO4Fv29B9yC
	 NKyWEqa57YFhmhz10V0tKsHbJ8eidXgXbz/2ef5pSl1tN0hxTiqTI84YPzF3p1Jj61A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=POCUpo87;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8611E606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:58:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8611E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=POCUpo87
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so25420665e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793710710; x=1794315510; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=13BR70RLyJfPpHnpQCP+Zr7de3wwxMOidYdoAlvzUic=;
        b=POCUpo87byv8L1NDetWuu9VNrb6AQX/aqJJPu+apl0almvTmLgT1wColOQB6ZRKt5e
         X9wHqKUyHEDL3yBGrpmojq2YH8GltvroDpAksnkBK5x5RURfEu4je4OtbDYsfpcixyYe
         nCzadW5y8ikdP4ZdB5BhFfGGuaHlbK0bIF+WevBJnJbOPfCAJ0sdNzYx6JYqhYQd3FdZ
         ArO1u70Kn/HOxfLeQnL3PYQIArohc+BJPPlWiZyYBqjlCYaAi0UwAfvRTg/VM2MHLObw
         bJ9Lp9HTj7c/ZFzY6eSNeAHgMN4DxUL7DwpxQvYinyDz0ziPXOec4lHrvhJRjPoK6FS+
         J8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793710710; x=1794315510;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=13BR70RLyJfPpHnpQCP+Zr7de3wwxMOidYdoAlvzUic=;
        b=oveL4m6H1gU29Z8VIGCcBDS5G2+mdiN3VTBN26JOLzGo+0PDB6QOUXGgCxf5FBy6gT
         zrInbRdP7HxHmbooThD9fiUvZmdxbpU8/Z2SS70DzF3TG2kKjF9AC4wI2QoaIKwC5wjo
         VnMTLSWStkhsVLQvv3XdSvivbIKXdN5kX3ADnIBsXIDoqd6XVML4zIR0p5XVv6cTXlCx
         JhdC+Abw+7VqrWAA8thObjL/Iu5TLwllD9G8IdYSNreHuVlX/DBGMz+/hcNovSAQAfYK
         3+5FS5d1Q0gaTDzmOF01QbWDrapA33xL7RQk7RddANcatvbxsojNIvCA22u2eOzogMvA
         9S4A==
X-Forwarded-Encrypted: i=1; AKwUvBzf2DSqvNJY9QWXNhzpY4oKzzbWUknjtqk45RY8wXOZuOyEkMtOH04DZWN8sA0FYUvh9Ps9vyrxahqZ9Rs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nEGM1XEKpLplhAdgDG4eiXXAKZxthPV/6E13LsoLl3xmFRQ7N
	Z20bxAWxEbCVFUYWNKTt8E7/GCUZnRamHfwbfOtdktqlzt3rBT56MKO3
X-Gm-Gg: AYBFou1UfbkDyVQvqqEY6FsGhrMO7lLv5y/KG80Gq0+rlm1ozjKaWggEsKTj2x8MM55
	kO4tYYjwm2Bktc23dpHwpYOJYupmhWS5BfiDKik2NL0rqHq937XuYjT9ytvo5EnDGb5gE/4gCgv
	DyLXZJ+0J0DRSIsRNy9CT84uQ/PsMPZItsftDgnuIUgoetGdKDaGCqI4rT707U8T/Eu9EW8/OwQ
	ZoSVkJhhfUXUON47uOUF500vgvFI9i2e9d2UPGfQSptRMTLl5KkKqWgkbQkNcPoLmmEq2t8iQ2N
	W9o42s1GCBfz3HyaAzTdbfLdPxj2qJTi3EMuTL6mEWhZMCrgJKHtPLFvzswIvTsuGfQFIuFNss8
	jAr97uwkFT1SsKAD4JBEQxnJ5a7mGHJ249s6vDUMT1YCVpiYQK0aZOd9F/5uT1lztV6hUB1ZEob
	3hbo+qAQavHJu8SrXGPu3HDkbcSCc0qteATp9I8oFNZK00WbPXVU7DBzkyIy1aklKMMv3iMDCd/
	TLCKTnIY+oDg6JNeYkRl0BhUmQPr7AeXy7B7Y46y2IItiFVid53aozfWVnT2a8nKstCgMgJM6Et
	qsSjZwqmHhb3zMYC+YUQ6z+j4t58YZKyd5X2ZXmz6tXQYk10YbZBvzaFeO8YUV7nBI8U4Cxq/uw
	moha146/1yFCNjqSFb/t+et4Dmj4RXZT5HvL87a4CWzBsL/DmKlSmgzpmrt4t7MHh2w==
X-Received: by 2002:a05:600c:1f87:b0:4a1:f68a:9736 with SMTP id 5b1f17b1804b1-4ac17b2be08mr296749285e9.26.1793710709724;
        Tue, 03 Nov 2026 04:58:29 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7706516sm223581045e9.0.2026.11.03.04.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:58:28 -0800 (PST)
Date: Tue, 3 Nov 2026 15:58:25 +0300
From: Dan Carpenter <error27@gmail.com>
To: Kang Chen <k.chen@smail.nju.edu.cn>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Raushan Kumar <mitramaurya80@gmail.com>,
	Chelsy Ratnawat <chelsyratnawat2001@gmail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: atomisp: reject short _DSM packages
Message-ID: <aunacczneVpPd3mM@stanley.mountain>
References: <20261103114121.74901-1-k.chen@smail.nju.edu.cn>
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
In-Reply-To: <20261103114121.74901-1-k.chen@smail.nju.edu.cn>

On Tue, Nov 03, 2026 at 07:41:21PM +0800, Kang Chen wrote:
> gmin_get_config_dsm_var() walks the package returned by the atomisp
> _DSM function, but it does not reject packages with fewer than two
> elements.  count is unsigned, so an empty package makes count - 1
> evaluate to UINT_MAX and the loop walks far past the end of the
> elements array, reading unrelated memory.
> 
> Require at least two elements before scanning the key/value pairs.
> 
> Fixes: 387041cda44e ("media: atomisp: improve sensor detection code to use _DSM table")
> Signed-off-by: Kang Chen <k.chen@smail.nju.edu.cn>
> ---

Surely, the infromation from ACPI is trusted?

regards,
dan carpenter

