Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460248;
	b=smaYgS7aLrq/YFBbDGvHa64lmKcxbJxh9pjxViL4eYIOGQKrztr7WKXPxrbTXGQ3Cj0q
	 B7wCEL8E2eqBBNALAZH3bHrWPtNZ5iPwFduRqQUgpS04/sQCgNj1CiBqsLC1WfcFJWT0M
	 0pL1Wmw4Qhy+72MXpwC4zF0jr8QvXlOsrzBMES5SwyCZ41xZgV6HZxsu2hJZqzG2VDejR
	 WQjnanTOvMvGW6OXNyrG7KA4jwLh6Ux70Z4NXMjwKhwzEYs+5FqyQc/WRVR+8CaUhFwrw
	 BQxik1BeJ/Eihg1Gw3VN5vtAUa09KDhR37bxglbNH7tEWXF9ckB5dPZI5SotrtMzU0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460248;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=TcJGBZQnqhTqIvez5VyLtXAFQZOBgnnr6VaSTFruo8k=;
	b=qpQHaVQ+QVXipgUGw3Y6MxuoBRrgNFBdEdAF3pFnb+VL5R4WhDUhLivv8Wg8dKiOKRMs
	 Ly8rdyyp3EP7EbH1Po11+uoSXuz9rOZczcf31GJBlreDNjjQ4ZjbCwKcvx+R9GlJaNyIv
	 KAeb7DSfSQRGjX7qFOI5GE8u7Q1/a4n6WJO2mpa5Qi1QAwNhd5XZloPHE1nlLuY+zPbWD
	 buDQQVNPTSzOxpqLTAt+0uQ5d0Jmmwh9nHy86eAwShjxybqcwnmCblESIaotP/9fVtML9
	 Km7+ZJ8AQy03A16Xnf1HLBNr1twLw2ve7YiBijBSNM+EGueXPyrSx9D+h673JT3/c+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ecmXx3NR;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F282F606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:37:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F282F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ecmXx3NR
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-170135e43c7so954978c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460247; x=1793065047; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TcJGBZQnqhTqIvez5VyLtXAFQZOBgnnr6VaSTFruo8k=;
        b=ecmXx3NRtnKBb0bx3OKSgxIGlOywd+JyxPJp60E/ketB3hMnkmpLkH8L4kcdJeA6Jl
         EMv31nRk4M5/ktlcZJcz0TUpYNZrDTjGmjF1tedEYBM7w+6xPr+Lrn+qPR8G3QZ6JbhG
         NESF27cdh0velfvj+2DrkT1yLnB/vDSgAZOY4mATGCWkyZKYKXVEe9SoJOmfeDb++d4E
         LsU8MtxwGj6M2KGicp3ue91OsgkOef1ZKEnqKl5cto1+sEfHdlu/c4CauXWRFZ7L2FpB
         5HAi4OaYB6E5btRgmlcTXLc2QOcDGhYjgeNwmoMugrTDSGeJXWNPju0Z3o0fQLnWuN15
         jnrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460247; x=1793065047;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TcJGBZQnqhTqIvez5VyLtXAFQZOBgnnr6VaSTFruo8k=;
        b=HFNeUb2xOOKCyvT90+zFBy34BaUrC6sBTTakEi2QvojBGHgYbDMCgEphyztoCtibD5
         uMg4/uqSitu/B/yIzUe2yws6uEMtNEwi89rNGJ5MD4C3rmxp1VGiLnYLgz8rnMk5yFN0
         5wnaVTyiU5ZjEh7IZPext2PV8llyac2IJAUg10+UgKVEWnYL76Zm+0Nx3pND+G34lUJ4
         OfzDfS8t1MgAyuzKnjTJOQEKmNz2WK62XFxMpzA6V4qKjLbjaVDPpaqOClbohfRCH+ql
         KbpketyLRHm5MEtk0ZKkFHRvspWiVKsH1sNLFB+bcdyPv1FUFvuOrkx7J+X+PXjEuVvT
         /Q7w==
X-Forwarded-Encrypted: i=1; AKwUvBx2Iop3Aho9JQ/JnLIZp+u0Sfz8h0bfWEx0DmbTlQ3XUs89a+eLaAVcbQATPxCwkfwt1qipHwZcQDD2u1w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLoN+6+08K7UF2lbzjSrescWDR/eI0WQS77LYx8pYxZ2znLvrpT
	BxJxAIIK90pfgsypyuuyox/C242nDp+AqOI99fX7AAXk+gyisZFLcgm4
X-Gm-Gg: AYBFou0qC6iJQOa2ELc9gXYxn7p4lfmJq4rTN549h0GMh8Nq1uAJ7N/4hgefcZB6d0a
	nDfNK80soEGPoDHzHESjF++yhFQZTbv47WbrV9jk7owisSDJo9rlgxaJexl6mULnFfDN8mqdPpx
	tUiAEmAMEmiH26S2ZJRvlaQpGQeEfjO1PMvSKfsVseI699+UAJ+vfb36KqKVNLszW+6rG5c8Oou
	9nUzf3alFy4ZzzLTW85YtXY9aMprf+INSdua/Z3zno96bItnNBm/dA3nbnCRAAKX4t0DmPf9ZEx
	biGmYjiO2AgQYHTTB3mxOJDKI+F7OS29yHJCVSKD/lLKRL4JuAyO+GULnOz/dXxWY0Yx2z5Zlqw
	sO3YB8Jd4nAIqLTpOyY6a3Gr/KmDprkrhf2v3vAZZA183yhy3u+HKjYGapuB15U0AFopaVV68u5
	405HPVtKgtFV4SHGj1fyljxInEDtTqWe+9AoLUFW3SNf9Rxw3HD9M38+ZCp8mAJV9/Yko7br/Jy
	64CJ62kjKZs
X-Received: by 2002:a05:7022:120a:b0:171:a066:938e with SMTP id a92af1059eb24-18512c384b3mr12193156c88.21.1792460246891;
        Mon, 19 Oct 2026 18:37:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1830f213ba7sm37626819c88.0.2026.10.19.18.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:37:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:37:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Linus Walleij <linusw@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Andi Shyti <andi.shyti@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 01/10] dt-bindings: watchdog: apple,wdt: Add t6041
 compatible
Message-ID: <1a720dcf-9f67-423d-b998-d0db73f82899@roeck-us.net>
References: <20261014-apple-m4-pro-max-initial-devicetrees-v2-0-961edd8d661b@cyberchaos.dev>
 <20261014-apple-m4-pro-max-initial-devicetrees-v2-1-961edd8d661b@cyberchaos.dev>
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
In-Reply-To: <20261014-apple-m4-pro-max-initial-devicetrees-v2-1-961edd8d661b@cyberchaos.dev>

On Wed, Oct 14, 2026 at 08:56:08AM +0200, Yureka Lilian wrote:
> The watchdog on the Apple t604x (M4 Pro/Max) SoCs is compatible with the
> M1-M4 SoCs. Add "apple,t6041-wdt" as SoC specific compatible.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
