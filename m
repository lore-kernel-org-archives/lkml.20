Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562664;
	b=Pc6amLJtyAIZAR7vX70t6dWChtqU6khoS2u6D7vfc9kdwrVPuNf+ISMTZiENGal0a63+
	 GLQOSHPdT8R0BedXIDFFxdMuKrxzwVaYJiRThxNse+Chmz62BMwL0FUfCdRzyrwAn4wv/
	 bgu0CxdfRy2tEtI0Ny54SvvJCLNgtLrNGioZALH4bnODYwTz0RdQVx7mCwEjQpRD8DjBn
	 j7khEBcE8ZgtBC+H0ClrHb+Fp6J+0ersfjPBmj8xiqPRlCUzIE86W/KerOGJjSC511MV0
	 7pxHxSuFjYy5JOSqxh/mZunmKpDzjiXHw+8Tx8gTxNezDyQupO366pm+nAw460/hoKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9eZU8moXQGAcGHZP9eqMMJfUyCPJT8Jq29uwh/HfL1g=;
	b=lkWTRWi4QsxvfTRSZDl2tpxN99Oa8G6R06EsiEKQI2KQZCIzh5j0/rLsUMbkfAodSlZm
	 lnkfGE/kWjtpbCURqrV7nRlA3k5mHNNWuegsLkJ3kiq8huknFhIJPy/Qma6OWWCZFAEVS
	 ngSbcM/42/9C4+kUabmhGPEeyjmx0HHl9oOc0FwyWFshV8eTPyiJzM8MVCuxZj7ADAiSW
	 3X1K6IpsPjofYxtmeAVTD8tKXeeTJ0doxA8bEMFdaDdykeLmrN+CBplid+VGw1vSvK6Ke
	 6fvbGG+JIlWthwqBNLgHqLmveN8kOdTeB8c4yB8qIqeuny6IFV3gyYpzmL/7/sywoHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=djD2CotE;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF70606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:04:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BF70606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=djD2CotE
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1fe9efc0eso2021335e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792562662; x=1793167462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9eZU8moXQGAcGHZP9eqMMJfUyCPJT8Jq29uwh/HfL1g=;
        b=djD2CotE4XEa4SJ7/FrQPW88N/TWE4+ZTM4ugmt1XfiT1+nuH6cLzCnnfBmj3EFfJf
         FipjElBNnPYAuNgly8b3qfU0Q7gjJdaU3vkdBwyiRi5e3KLiMF0lTxbxqFvI9nlznYjh
         FPMTLIKMVDD661TEbtUgbXqvzuBD1An1/b8hMLtcokUdxwODjNFfZrGaPDNLr38aD+BS
         g+t+odHOzQi0a/8d9XQDCFbv5AKWVZcZywCn9QbRXEEPYsMuNkrFgI09u0yWXrCGeyGV
         8QybQV7y2YotSxMA+iRJi+DtEuPJDs6XbfdeUA6iGkikbUe6ywswiHyV6dUOpD6YHPen
         X2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562662; x=1793167462;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9eZU8moXQGAcGHZP9eqMMJfUyCPJT8Jq29uwh/HfL1g=;
        b=2yiRPfDKhX+DDYo7jd5D83PSEoOdVb/j8m3QS7kMzrwevydjjn3qnYrUwQIDt+cVfT
         32shmdoeOnqNb9HEIXEuJmPsJDlinXL0i3LoyJ12QwDUPO9ErOUFgr+PHvxPTA82uNHM
         tXzmLdNXgAow9vjGVuoS9BVUoC8MCy6GtRLLdTFCPzUDo8wWb8E/Z1W7xSfd5U+kE1hb
         +VgpXiN7UFjrRZqDqi9w25kp/SDprVBgJLE41kmmy3Mzo4gnckpeRvuzoh7PBOHeoirS
         DDNrEyuYhNryKsIo3oo6fo3Uo5PmH4UzJOqAxTAt/kzSFlYJA23tdmDeO8xiPMpMSdLK
         DuSw==
X-Forwarded-Encrypted: i=1; AKwUvByhHeFQgYloletwXsYonQC3vWLYja9zGCWAUGduwBwy97u3BaYRkgVuKmC6uGKRfqpQusB7FeCNbcEO9rA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9JHpzEGgSYOoTFaN0F0/iYmREMmI5PYtlB1eAO3Xl3OxTn+lm
	o/fxlY2Jg5ohp9b4ciqlLXrxv9LtUJyly801EBfCPXqTePy7C/m4duZUn39QEwCA5VuPSx10
X-Gm-Gg: AYBFou0TD5LNUKep2sPaUEVzsnROaKOyZ5U2jzWCwg1+UXn9OPIIpuKshl4m0vyCGj/
	MlCgnbdBP+C3J6QqjHYAYGWYyWZkAkqiEtQdi7aps1cMuTybZUOHdYjp+CapxsfI1FVSwFIC6mD
	Z7VHhJXgk9/Qn3e3vfJ3MwdR8XUF7ce56Ta0tTCmkMXZOBf7PT9oSVsbP6UiZXaOhiIBKBrrqcC
	cuIMSdWO002Sw3bJ8wj/TvtYTRu+bS4SI5XJh3U4b7j6gWYDWDsYpik66ej6bklR1575lfS6Uob
	BZ1Yi3zqUUpWMCo607FEe3MVUN5Uunkwbs8m2W2/lTkTNJY9/dM7AIe9vnfePCRk3+YmEoAzqLf
	hdFGiRIvW+bN2hU3Z2CDOUb2Izy1n5GDXnopOetqn+JTrku+kolYDvDCCP2pz5iyd56L1CbWEkS
	alFRJTDWshtHYhAPejocEC4KyCOTp6+Go2UiSHp306vQtRrAJShkxKcTbAGMlxZlzakPX1/vd2s
	IK3OfoHuBiQYUoR/NVGUSbNfqM/75lE7QuV532NE3tqd5oBJ+FZ
X-Received: by 2002:a05:600d:82ea:b0:4a0:a34:6e7d with SMTP id 5b1f17b1804b1-4a1fdb0ab43mr18170835e9.18.1792562662120;
        Tue, 20 Oct 2026 23:04:22 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd2eff9sm28339855e9.4.2026.10.20.23.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:04:21 -0700 (PDT)
Date: Wed, 21 Oct 2026 09:04:18 +0300
From: Dan Carpenter <error27@gmail.com>
To: LiuJunyuan <2058432396@qq.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: handle zero image size in read/write
Message-ID: <athV4vUa3aZDDlAX@stanley.mountain>
References: <tencent_FE0C25ACDF20A06CBFD0651E7C4ECD7E5009@qq.com>
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
In-Reply-To: <tencent_FE0C25ACDF20A06CBFD0651E7C4ECD7E5009@qq.com>

We removed the requirement that AI patches need to a special tag.

Generally, staging is just for practice writing code so it doesn't
make sense to use AI, but I was asking Greg to merge AI security fixes
like this so we'll see how persuasive I was.  :)  The vme_user code is
full of way more serious security issues and probably we should just
delete it.

regards,
dan carpenter

