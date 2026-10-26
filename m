Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793036358;
	b=ZlstVpcJsy9I4NbZpT4iyrR4kXvK9SLQ0rSUliw48E1q55S9a9+av7VSQivPiiWPtwaA
	 XFiwHT+tV9yFnI9yxpulSbI2Pg9740dtjSH0BamAgg+gGnwC+r386okk2lQr4RHAqnFHi
	 mzLDxGefZWwFcgrjpukwv+vhxw2MR2vs94nTBVzMqV6N5laHus7eimInMYoibZau8oMjv
	 oHk7mdwpaKDs2hRfH4zfcMhe/znyt1GWKhZPE1RfEKMeD8tjjt4prdB3IhYUqkEzuop3W
	 8IpGNrjVvCYAbMJhsQzxU4UMHPwP6sfa7EVpOhRY6nvcpujGsjYBxOvYW863RCVtDCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793036358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PnSIBEinvI0aWOXfbfSxdS14sk+hrl90vzujOjLWDnE=;
	b=SM/9hXhNF5iyWjCIV/LjO9K8WRynwAcXnkAfovcM21KZ297/dEVw41xAOwcU/EXf7yAr
	 X+9nVB0K5RnGo/tH3XLmOV/SsqmY5Ai8O3usFxK1kJ3QAbGjwrfd4yGfsjQWd2NMBd9yz
	 9ZlBVUQge4d1n41GzfBjLyOVT6RH6At54HoZaPvDWBbamxnCc/sJLY2+qFvs16GRcCHcl
	 Tu1+qkUvsh91aDkkSiH5x1G82pzTnB1oNk6ASvdz17AW+PvLcGMsHwzMylt/1Vk9ly5eA
	 EgRM8zvFuymHSbBd67p+DFhMaVif8WuxMuDBOwBVuVkT5BY6CqHzFL0B64JgUUKRljA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KWNTyjiS;
	arc=none smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8F3606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:39:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB8F3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KWNTyjiS
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a49a022221so23362511fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793036356; x=1793641156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PnSIBEinvI0aWOXfbfSxdS14sk+hrl90vzujOjLWDnE=;
        b=KWNTyjiSseh8CRmBtZ2wrSmoout5WMIyNVt4NfUzr7M4iL6TvFU4puGMODBpTeXLjc
         KdwxAfOs3VOMlLGb/XiRW30VSo82DUb5vdDcZ4xFHAFAXFrHjJ6tlPjYs0CjuTOIv3ux
         HrDTjiVgs8bWoKoUT5px1oVEBL9dBP0uBhSomaaF94k0MkMe7ygEGLb4XyVFkQe5xCS4
         y9DMI4KAZolgfSwuZuX8Zvy2yEd/cizD6XPGDxOxOLGy0Z/C9+J7rF/UN9RPEX4bX9SJ
         B8BVl/hfCRyhHL8j7PR00Y1MFK3Gas/14IeU5PjShFWvSJmWi9BwPrLWZ6lZssF9IR/h
         N9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793036356; x=1793641156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PnSIBEinvI0aWOXfbfSxdS14sk+hrl90vzujOjLWDnE=;
        b=ZYDfyru1+5Kufd6R4b3YE/Gsd7ss3kTbwNr6G4VcRKS2sPknp0YhatNX7a0tEENI36
         w9otgiRcN31J7Bevjm7CsZQxzh8V+6xsKnVHc5ZDYin4RUti6c2v9JX0j7sFq408Oj+a
         jPNMP0rTxSEt0kKDAh9JHWjcWqSA4uKM9z8qSr0u6PG/g30UsFtCRXeK43pYk8FgXoYE
         KZoAPxCsoKxCnIJcz4nPQkvInwQhH84nsu0Dg29cJg1uqf8xSOrFvu2rHqNpymHj7ZJZ
         88rJBjtS71cTBu8b6kmVKvMBPlYTqH4eRkarHA6i75XHnqRY7kCrE5x2XpUB1o+bVF6h
         jANg==
X-Forwarded-Encrypted: i=1; AKwUvBx+G4MJRJjBRqEYbuqtxO70RySEg4NnGKl1sEO5coAOg+hJkFnNiNW+eY//igxay7S98DkkhNv6w8CKQC4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkjePsduQ+egC8YWBw/z9KqGiM//9ZOETVCAga/0EeTzl3pEgY
	dA2iMxqeJu1ItwQqy9jo4XftcX4bVmfUDLyv1WE1JCgrAkErnCS+i5+R
X-Gm-Gg: AYBFou1Ql1sHs1bujsU2VJeW2qxVKWDpuNi79wjVeL4hi0B2TqWsCNLGfPx3JihDZvx
	GOLCShc7YXP0A/nG6Toko+tDfkdxvOapi701uLWShQef4/kI9ROkkw6X6M5CHA4AGH9iH5UZL62
	pdWF8714XwawM6n8qCBNU02T+WgbSxpxOcxhEjsNMUwz25NqVAC2L/YnOqp/GhMOwmcscNJN0sQ
	wOEY+vftzJPeWSNCEkPzV4trfV6GsJfVg+p6tEHLGNHH4LqkMWew4nup89TG3wQYmyFuE3oiDRl
	JDgYEqTQFOpuZBGIz8fVPu4jpHPQPcVKF8kuFLF+VFW3TJyLfB73LdgO5qgz7Fe3qmH5kXXye9n
	wmejyPuEfIvnmDETg/vlkbEDGEzBzvJAD3fE0POcfHrrDE5u9NEH+IbDI67DtkuE6OghG1rg4WH
	NiFVX3M2aUzJC4ZBTOB1N2G7I5BQ0cWEcFWn/N1WWvfwQyBH9T5U3kNGbaGb3gbgiMHKTjEkjmd
	rsJj2ylulruRV2tT/RVNqBYhUErtke6oUj4vgFrepo2Tk50W1dg7JmNjuxxlkky3RAVYW6Qd9xM
	s3CfNZh1m85OIqEiyD44jna5XGYvDEx+fhtSKoAI6bguoC9ytYLhLcsz/3f3abQ0
X-Received: by 2002:a05:6512:b8c:b0:5be:4386:806d with SMTP id 2adb3069b0e04-5bfb71eeac7mr2553829e87.53.1793036355836;
        Mon, 26 Oct 2026 10:39:15 -0700 (PDT)
Received: from yantra.. (nekmmqua92iezg7lpcf-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:9332:cc42:ba9d:ca8f])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950b9sm1685199e87.63.2026.10.26.10.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 10:39:15 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: andriy.shevchenko@intel.com
Cc: Jonathan Cameron <jic23@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] iio: pressure: dps310: wait for a new sample after a ratio change
Date: Mon, 26 Oct 2026 19:39:10 +0200
Message-ID: <20261026173910.23788-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <at8X810dwa98w9iL@ashevche-desk.local>
References: <20261019153328.80739-1-zoone.rupert@gmail.com> <atZqSXI14WojGso5@ashevche-desk.local> <20261026024605.3286702f@jic23-hlaptop> <at8X810dwa98w9iL@ashevche-desk.local>
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

On Mon, Oct 26, 2026 at 11:05:55AM +0200, Andy Shevchenko wrote:
> If Rupesh is going to add the patch to clean up that (before or after this patch)
> I wouldn't be triggered.

It's ready. It turns the 30000 into 30 * USEC_PER_MSEC and does the same
for the other sleeps in the driver. It is in a small cleanup series that
I'll send once the dps310 patches already in flight have landed.
