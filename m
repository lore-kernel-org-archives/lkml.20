Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793047751;
	b=Jo3oQyT2vehnEznfYw+rl1fy6jdNSy/9DAoZpZ9nFXyLWu8bQ2YcaNak8bucQwjmbpt2
	 qUaxJ+8YMpVdEn4iKahuylwZu0Otmtwp8sXV1iK/bmDSCvl822YXloR7VZMgPaX4YxvzD
	 yq5K1YhYUoGUgdXjhWM7I4XaT8Al805I50BurinoA55PaBhyYYn+Ff7N8CLLXO+i9O2bh
	 M+PLiU8sYVNPtmfLD70lyEkKUFAkWuiihg5I7TBut1XOKYB60pJWuXn7iuiDADSuFfIW4
	 xFKQoB5g7EnW4arIN+3paxJS+pi0V/eDIvh7CEaunOTNz2YNRjW3T2t+0GiE5sGLpPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793047751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9TGlJH8mE9LBOMpy8hUBezrc3b+6uaVNZir08Qhj/4Y=;
	b=hcRpHMqeKdmH0kRRSo0GOkGSa1bSbMleDJG/O7NUji4kb65vTNnsGgXXxWgJOgcfnV8D
	 BJQmOcylMisq6zkMnPS14qdqd9Hnz4+vw9+tlnNQldGZQbuLttLfITbAo2EqmH05W3OFC
	 cIy38YQhzXLf1D1Vs8PRMkgsDn2bZqB4Pd3Jci+dZmCsMCy56Sj03f5aGfYuGW42PwI/q
	 R4MOAKlFLc2mly0U93DyBTlo0r3ToVLHfEtgu9Pu6JxJjjQ1lxr8igV6BIM/WZaqnvaz8
	 eFDOvM67umaTDrH0lu6uHvtmrNL5sXosmUSzHKINupkRE2nHnLeoO5VaJTIHUu63AtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=n4LXTAiT;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1CB606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B1CB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=n4LXTAiT
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-14394530ec6so4173113c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793047750; x=1793652550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9TGlJH8mE9LBOMpy8hUBezrc3b+6uaVNZir08Qhj/4Y=;
        b=n4LXTAiTiTGuyd3+2e5lsWMu8UQ99JNX5Jta2koR4OlN3EEsqjmoE743H8P9DiP5ls
         Pdt22tiAz4ntnvO+CahN5g48ngubMiFqSvWbswNGIwCy0lGdlyYSKS1jykFCkJGTLigy
         gzGr7oRl2jJBP4iZFqFq8i9Ss0s45J95vD++RZt25/9kEqPcZe0FQahoYB3cwdNJ326Z
         m8FCt7P+oPPFubt66n75aEdrv3sBlBCMFpUg3q1GM+F+4ertbWvJN+HI3gJJyzb8eTus
         RFQ1h5cT7RRu1LW5clr2d+eLWOBGEYZoGfxR1UkQxxCROz1GQyYbSftY4TZEG23c29ae
         BoHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793047750; x=1793652550;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9TGlJH8mE9LBOMpy8hUBezrc3b+6uaVNZir08Qhj/4Y=;
        b=P6aXwr/z3gcO27e5knqD4JHHmwbvE0qAsI6pQd7GKtXpMLjziLNms1tVshYJ2Ivo2p
         8wmN4FCRS3ZSmYmGwvsVUqnTGPNzl6m+uz/l18Z/hByl9sTu+SskUVLvB3OmA3xIsIWu
         EgjqCOJju79fzWMu+A/jsklS/R+yRWWGGIHdHsva6Z1NMdikrqu9rUhQxSldHBR7hcWV
         SqBGmOgQB8PqOP7M/S5vpQEMFaJeapxFcS7/z9xaVHlPHUkpek58YqRM5crmxyuakcqB
         jOjhFi2GvbTbFGiorV/A7iFjTXHDtVuWGiPs6siTSd0R5tBfIg5ryQknUOnax0n27Ksm
         x0MA==
X-Forwarded-Encrypted: i=1; AKwUvByUXp5c5UuDYJgoZ6fF7/llnXBneww49Edohf6SDvnV3LCKRPaQ2ywlM+aqqw48w+wxmvfLnXHgp+kgjGQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1vzdfOpY3ib22+qJcAidDHmspECjxD23i4S5Oqo0gTEj5P4yK
	YUDOgr+ZHjsRUmjHdKlx6xHTnS1yzv8+KAk3MGg9wuhIYv3uF0B1xBUc
X-Gm-Gg: AYBFou0QY9yDTGBEE+hN5b7dntffs6SVLhHjRoRjrqGuHYlPOO4B1fu/VEhNve+9Wyf
	+yQHs263luVTL/zUiKadzl0RqniFSqwN8UKcwNDaz0MaZtt0iorzPz60+np4Ts3/i6yA/ezbwf4
	3evvuAHQLD6u/9Kxh19OIE+17KI3MZQ0Ecu9E+yLnIkkda2QplHsRzAJEPwWEcL7d+J4vOwnXp2
	E2Jy9kt7zNDgmeqlBOga7lGWzJjsHtl2UG7S+KM+RZf2aKTngk1RHaLxeUrrk3bWSZxBvhWQ+ZQ
	pEC318w69uUFipepi/TqlOzvatu6c384rtWm3fb3Y9GlIzlmpnCJECIDCN1ScoCcZr0rnUYfpo7
	Z7aRS2XA/HvCJBHxQcd9Nj2FUUDp6aF1TFAn6KZXCbM+0gMK+m48k/ifyP07g4LSLiqMA4Ccbtz
	TneYA8mhhL3rfRKL2A3IvdgAaEvUj0yNEARvCGYpnBDL0BDZvC2UP9jjGlMfNHKNmFRUI15AsLl
	T1x6e3RX6R7TlMYePzI48xJOKltJ6ZyJtXO4bhxNQ81FMY+t1s96jcPcUh4sUS36I57/t1Ej/Fg
	XaWrhP+rgVzIIUIsKGrgsip5t0Sx+tGflfDaPO4kbgrD1GAsMecHCoT4u6NWWREd
X-Received: by 2002:a05:7022:ea5b:b0:1a0:e3e2:22a3 with SMTP id a92af1059eb24-1a0e3e22384mr5029745c88.31.1793047750376;
        Mon, 26 Oct 2026 13:49:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2a5937dsm26657068c88.20.2026.10.26.13.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:49:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 13:49:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vas Zayarskiy <contact@vasily.cc>
Cc: Aleksa Savic <savicaleksa83@gmail.com>, Jack Doan <me@jackdoan.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v5 4/5] hwmon: (aquacomputer_d5next) Skip unknown
 firmware version offsets
Message-ID: <ed3574e9-51d7-4996-bfaa-8eced16a49cf@roeck-us.net>
References: <20260927191316.4137752-1-contact@vasily.cc>
 <20260927191316.4137752-5-contact@vasily.cc>
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
In-Reply-To: <20260927191316.4137752-5-contact@vasily.cc>

On Sun, Sep 27, 2026 at 10:13:15PM +0300, Vas Zayarskiy wrote:
> Only decode the firmware version when its offset is known, matching the
> condition used to expose the firmware_version debugfs file. This lets a
> device leave the offset at zero without interpreting the report ID and
> following byte as a firmware version.
> 
> Assisted-by: LLM sparse
> Signed-off-by: Vas Zayarskiy <contact@vasily.cc>

Applied.

Thanks,
Guenter
