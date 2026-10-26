Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792975974;
	b=tvEA3jwfz1h7WxLsCidCbbVSftqkDaEtMxqe68hGAn6sZ4IRd4Exzkgnm3LICDTNgp0O
	 17D/ZUSFRqoZDKR3LZrgCVjcljM8ZcUUleVsBpigjboBbw80v2apMNh4hJRdLqm5lUUWO
	 n1N5gl7AxVqz+DlLDMRwV9v75nE09PKfq05tudwKqq4fxN+u02Mr/3OXifETfv1K7NuII
	 JIQ4qGEoqqQp7poh9RQssYdZ3hiszCkv9vWWTO6/jZDpR1f9hILbUgDeEVH7SGGvizp/P
	 lA+Vfxi+cUPAOycZ1aP0wd2TwntTsnDxwXJaB9hWT+zmkJH7H7RtO45Myky9Dw7EdQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792975974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=glkk7tgvazLr/tUU7eD0+4ZS7tPlrvqsxMIspd2af9k=;
	b=Ab4n9ong4hzRWszMnvi5jvcXIDESCM8D/qp0Ya6RAz+lCEA2jA+oFOCoci4kE0tdYxcG
	 KaFRZ6kZTzZNhAXKWB4zbY5y2sKeM4EyFSwIy2Ac+t1B/Z9k9O/EQyBorAxDkbITr0drp
	 b4STKGvNbUP0HRvbcZqYRPEZqkRxTbU+N81XlPulRqToafYBN5MIEX1+i6oyYjgH88Taf
	 znFXI8EWY3Km2fmLLrzeWsmvEmJv6v2AmSFVfsdrjCMys9FqbmaVhUo5p3PIbvIBuOhqw
	 JoumVPtna48bhH4PpxqlCA8kNR01PVxovGrJZpzK0G+1VQ1l12L2uLRdTHWbDmBbmfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MkHbqy8s;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86A2606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:52:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B86A2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MkHbqy8s
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso1223530a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792975968; x=1793580768; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=glkk7tgvazLr/tUU7eD0+4ZS7tPlrvqsxMIspd2af9k=;
        b=MkHbqy8ssdThe7DKCoLn8P6lc91zHrZsr7Ge3O/vM8SeToRJST/JRbW6gnKpe6LceB
         GCUXA/TVzSJh27cXkQgF15GpWuDi9CKve51wh2agtFAywfYLHaCB9BFeNJrTd1u5In3r
         nqhp3TlNticI2uUUAR27O1Qqza41/2dA9fd/Tf0frtDPBMgs0wehFbyrpqt3LroeCm1G
         Q9vT7A8j636uFAfD31LXGwnD2GrmDUpw24+3mMCz95WayN167qlag7ijmKn2unuaeouw
         80472E7c5kQJXb2yw9lcr/f7pJR+gqM9FJG433rlBpwzHf3IDVeOBRzo7+5ERQnfZ4OQ
         z5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792975968; x=1793580768;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=glkk7tgvazLr/tUU7eD0+4ZS7tPlrvqsxMIspd2af9k=;
        b=xJ5HiB5vFgiAzzKdz9Z2weEZlPnNXB/Q8aBHgX4zGT0BvGZ8/31plqHD4Z9LJj1+1p
         vHmqbyaKTeJPfQUdh6A6hXfHQnhFgvpkBSKZY6w7xl9uFUHhms3EK1pMDP5t0ZD4XOHD
         I375uDP2SQoW0ofP3HIGFe4/JZzfi78OPmiYc5ceU6i/1Ia6FJ2/xbbkyNvnbUSb+KMe
         uMGtp90tUNOC1pN399VUvVX/xaeQ9mRSfZ+vzGV5XvXkrDnYUZYss7nfdVT4Y+oahgEp
         tiNn8Mli7e8RaiDfncDPyevZrhUrUuuHpo0E+MJGsWXQujZ//mSvKdJi3ZY0xNvgVAru
         gq9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxxNCy6Wp0zOGjRjsUC4jWJlZOegWS44ZlXhZtM8BkHAuLtMZCVcIVdA7yK3/HCTCDDl7/Gym1DhxvLvfI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHHRpNh+tQUYRw9Aq/W6n2iPrBKi8mbzASU2gmuVvWzLmW80OT
	86lP3RilDaqncL45+WMbo03PK7BCxPxgxTqee3dWLEMp5oaRdU9Kf2t7
X-Gm-Gg: AYBFou0MMzHMWIaD7rTw/4XwVV5eJ8Hvgnm6jyc75sXhFpy6kkb8YRe5l120xAhmhmT
	FMnelUsBTZ0uHDLvT5m3WL5QfmMEiYbM8HrkNVAJZoFcH0LvdX2aVMv0q6rk6HnUsR/wsg8JjnW
	8+KwY2EdN2z/NEM0zjK9pKJFGUhG+OTnbPC4yqHmfm2tTL8d1nk+YA7ecZtdvkA8VZLpUtvSBZX
	btvLrlZq7H9meaW6SA42cy7WdejAE+ipiwrUw3G+9Z+oDey26WR8z0X3w3vz4/K+wdEzjqQspOo
	L08LxI2GZvFujZYozri/QG2rNq+EXUmVLMwX8eeLao/TvUMTzyQIpMV1QLP6RaBEzAxo+Onf5q/
	jNlMlh+PKQZwP8DP9EldWXhMwuHMzqPya248XoE0zg3Fi/5gB59W5mBlMy2N/KGI/c/H6ojR3I8
	0K7cJPBLwoWsE9aNhmfIlQApfLATx5ec3wi0h/NzySEnYFWg8lZ+fxPiXx6jy8f/0+rgY50jQwJ
	OVOpGkkT/qYkgt1FM2m+32NbfIql8IP2RtLuvAPZ8elOwt5YDThdgC2K0h8FL4ir8UCDw==
X-Received: by 2002:a17:90b:3141:b0:3ac:9a54:e3ce with SMTP id 98e67ed59e1d1-3adeafb073fmr4419328a91.63.1792975967971;
        Sun, 25 Oct 2026 17:52:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb29031sm4738469a91.4.2026.10.25.17.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:52:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:52:46 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Zain Aboobacker <zainaboobacker33@gmail.com>
Cc: Wensheng Wang <wenswang@yeah.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/mp2985) fix typos in comments
Message-ID: <334aa1bb-649b-49e8-9e60-c43de836b096@roeck-us.net>
References: <20260926162539.25432-1-zainaboobacker33@gmail.com>
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
In-Reply-To: <20260926162539.25432-1-zainaboobacker33@gmail.com>

On Sat, Sep 26, 2026 at 12:25:39PM -0400, Zain Aboobacker wrote:
> Fix various spelling mistakes in comments found by codespell.
> 
> Assisted-by: Claude:claude-opus-5-5 codespell
> Signed-off-by: Zain Aboobacker <zainaboobacker33@gmail.com>

Applied.

Thanks,
Guenter
