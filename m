Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974927;
	b=KjtFBleWOcC8QaXbF0OiAN5NErmLv2tvMyDU9wzzAWsdus5Q3pBOr0jWmdMp6xXyZang
	 5JgNAzSjt/x2RWOSQdNL4DrTEc2XkFLrtBagaUOC2fATRIC0cmKWogDUEzg7l1zuq0apW
	 /XU7764hNZGL4EriA4AZ+3EFAXeZ0sLnWc+Wklc+cNHCtwZK1bFs//sh8OljZOiYhv8dZ
	 HYKsKkUPuyYNsokW8aZWWzViwwE5E+KODwKaqo/dXE2wsl+haDMJnDWzUFsKniDyn6X4Z
	 oOTsYG3JOBBfdzs1WUFJ+LWVBQD86wR+2J2E+mm1NeZgetwzMT128b2AKuZQfTfAsqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=biikjnXgtnu7sMIPqSuPM5THtJpQ0Ac/8rE+B20J8oQ=;
	b=l+KLe+iy2ieQIacShqcGUuPjoKlvl/75gIbsDFcMmPsz0J5Ik4FlXWeLolQERCpKNS64
	 dsxWRpR0IOzSNPBqtqxLzOjnpUS6x6Rr6HBQm9M/5KvoW6KFMPmJZiOQ+r4yudcLf6lUX
	 G4DxUHagR8fLDJrAPiOSfOAsYsGaiiCVywl+5k+FSm2rTG3FwLzHPSZTQTXpaYy3w3IYU
	 qjbF3f4FSB4TkDWggJ2VqFYwTiqCR5IlEkn3iJuULZgBCMTTENOGAr/IaolYw+0zdpqXH
	 3tG3PysCJ9juimX/WjkUyYEMBSO4x65Ces/DT+n1zfK+KY7Oy3nPUHhXNos6R+Hi0pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=njplM3md;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B42606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5B42606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=njplM3md
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso1327127a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792974926; x=1793579726; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=biikjnXgtnu7sMIPqSuPM5THtJpQ0Ac/8rE+B20J8oQ=;
        b=njplM3mdJURiFtDubYKaOfdLnMma8l3vjNmOEFUeg+E2dIDMxZdZS5gPlHPm7CT2LI
         xac35vlTXGv7kMrt2tYHiDLx24Bl6NaLQixMgWAjjjxZ2WyKjtcHlyLQZBBFTL+cu67g
         HWYPLXAxjlJUxwQkeUtVknDJjLmJULxEarhr37O18hYhSaSf3RcaehcOjXX0ovgVFQo1
         nGXhgTYRz7CBuL29RtbxRaaSUPHynQSGs7KBfnZ/a1K1n9kP9ugkfNb9iphT2mj9G2wH
         KVr1QTQGiIi2GiYvm/b5+MXp2LJP/gHn+XJoXzzNNyNTfMMB0WMqLOXAISbxmNvFlqEr
         kEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792974926; x=1793579726;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=biikjnXgtnu7sMIPqSuPM5THtJpQ0Ac/8rE+B20J8oQ=;
        b=aKeUNVLlkiAcQEBJV88FpKiG2Qs6q/89KPXPa+Z2CdfTyLzj5ayyOg96tUP7BYdrqR
         AGiFh8uv8qguZWriyoca7Xo/SaZwi40wC9e7ErVjBJSeapB5XaCZIm/Borwld+mpEqlK
         Qu2C6Y6At9+UUCkb0SgGo9ax5GNmAuirwhpuJnlODbTY2WZw9ZFtAw+VXdhAlnhUbcln
         W09ki4CogWnYTEyQcO9AT3L/Xm37/x1Rh2qCU83zbJ2w2G+q3bVi3RqCkwaEKKzAFMSV
         kmqTLnhYZ0xzfrvs+iH1gzNe2ViEsXsPzkZ8Sx3lBJy8GAUN09S3AfGU/E+AsmRKDgR0
         i1PA==
X-Forwarded-Encrypted: i=1; AKwUvBzlyb3ip0dIDObgmmOGpIR33fBlUK+er/ElfX5w2CNGkniLvwU9XDyvwzd9xLtMsqcvpu97tAc87Um9gFE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7SesOQgGydf3xQJnAR+0RvoPrugAeUcFXyxR934IvirCvqL7w
	rcyps3YyADenMP/BFJH1E65htE9XE/eOvzg6P/7F167FEV+stlRT7RJA
X-Gm-Gg: AYBFou1RdfeYkZqeGOX03C8Y76ySLjb6nsVyJB624lmvSUqUlgUWl8sLerA00n0WDN+
	UJDZ6LVzzEvUQPFbz4gf3vvQY64ItgP08k03lCR6LZtrDLYKYheqVHRXwzBUkYyVGyQwuNa3tsQ
	B8sKX65BsyNLki75RWuIjJSlSrK+WluU5naSDeqgCDe/sDANKeuJUaQrbwIMlGcfJIGUrNvlKVa
	+ud29o/WWOR/EXzeh9FZBQ1IbBq6bWRJBuS+2ExCXfSeAgxXLzJCVPAz8e0fW8VdTwP+BMGVrES
	pNLppNzCaI31n7FIqyDmT4KhKBzb6wNN6zd7GP96bxninKYBT3DitGTy5yM31VXOsF1hvZelOkZ
	mSnItG7hZx2uJhwZqNcgpM7wRKWoxx+T/78Fk0d0lcMo7M9rzUOM128X9H6I/7D7fyRBsYsNUBn
	TLwLYXXEqQSdjeGpIMIuXvvddU5FubwZMsvQObfsPx+Z2ZkkDw7LD8A1Vh5SStqrYiq1Ddgnho6
	C6VXxt4ksE8G/i/brUW0iLFrhi+GXuRxoR7Kr4eNdgcXTVJ6mDMuTJQrThwqRfo2IYzPOAbfsSq
	1B2/dyTZRES6sR0=
X-Received: by 2002:a17:90a:e18c:b0:3ad:13fe:41ba with SMTP id 98e67ed59e1d1-3adeb11f8f5mr4322887a91.52.1792974926204;
        Sun, 25 Oct 2026 17:35:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe8f0a7sm6187626a91.9.2026.10.25.17.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:35:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:35:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Lars Petter Mostad <lars.petter.mostad@appear.net>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: vendor-prefixes: Add TDK Corporation
Message-ID: <083d8718-bcda-47d8-83f6-6090b40689b6@roeck-us.net>
References: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v4-1-27ece4e43d04@nexthop.ai>
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
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v4-1-27ece4e43d04@nexthop.ai>

On Tue, Oct 20, 2026 at 08:02:05PM -0700, Abdurrahman Hussain wrote:
> Add the vendor prefix for TDK Corporation, the maker of the FS1412
> point-of-load regulator.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Applied.

Thanks,
Guenter
