Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B15409637
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 17:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792343401; cv=none; b=SGsbVeX5YpfsXA0WUVnOStntlaqoZ/nQkJZareokOl0SG7Mhb/Q3E3Um6tHLk3zdH8aPF0hhkUaRQv//ul6wtXC0kHQk2uP2HFD3wrbdQVfDXIWGa69DSv3PWC9eUUmUqHV9LWacAaPJ2lJs3up44tULLKxjfCBMc/uLjmlC4uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792343401; c=relaxed/simple;
	bh=+WJ/hu/3Wga52spo7IQdSXB7WSieQhEpzGVW/oaXQhc=;
	h=From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Date:Message-ID; b=HGttIJeZhHsYCAJNm72fGpUqIhsfEQVGT1s4YWQ3rkjydr42SSs9B67UrFEALPrw/WUEsi+AD9pkp9OecuEFkyTrxIQWUTBcvRjoWgExSRAOIojBSzef80gFi2vGoxDccx5KdDlk4HWuAOr2I4Hyni8nhlsX97aZhIAK9oM0Zt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LHsk/YMk; arc=none smtp.client-ip=74.125.227.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LHsk/YMk"
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3ad211ad92bso233110a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792343399; x=1792948199; darn=vger.kernel.org;
        h=message-id:date:content-transfer-encoding:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+WJ/hu/3Wga52spo7IQdSXB7WSieQhEpzGVW/oaXQhc=;
        b=LHsk/YMkVAj/JDH0R9Cn2AaeSDuZT+CToHn+gDN5M+G0sg8uKEdpiaAGoV3JaYlaFN
         N+N9UTu/M1cL2Nor+whWrkcvv/4pOPJj6pkxgbpC/zIQ6IArcbcBkGM9sKdloaCfBvcz
         lQk6ci1aatKa6+vrdtMR1WMz1d2dFK7wK9/EsinGGDfMNLdVAqj+RaKDFJvw8nt03+/1
         8NEtxsNVHPgKODVIl2XJ1oRQoWbDaSdfADM+Yp9KWInDAR7l0pwcbDVVnZuCPp3ajVRO
         KezsJnW4GJd4bKF//TyfFSoFILOdqhqQ0fjnZTEjGtfwjurWkCvYA5CjU+VEBjdunlVB
         xuhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792343399; x=1792948199;
        h=message-id:date:content-transfer-encoding:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+WJ/hu/3Wga52spo7IQdSXB7WSieQhEpzGVW/oaXQhc=;
        b=Y2F76yu+EBkb540anBYanE8tyINM4OIuNJRRmNKC5Mc2lrWEyM56Lr0+P4mGKgnDFk
         VT9a2LNW4BwodhY7eqri9Q54T/uTNOqoov9eHdgT76ZPQGL8YPTvpEXAjbeRRXwaD+S9
         mYS4RLzhpFrep/n0d0pQT7MmUJ76iqy1WPXUh2YtEm3uuRdV+dTYgcJ8HI4Pf3bbryFd
         dYk0a0wJsBj1egI6PbHIzB4jsX6JnwVdiJuCYnwcw10x6o7qXFNkiJly/sfjbErLsKwX
         QAQb04IXJBJ1b37nWoErQi6zWFsy+pSZqibBAWgGI08jstCfiyTz/vfDA8wcBczrkh/d
         OKlA==
X-Forwarded-Encrypted: i=1; AKwUvBwVzdS4KYDyHt41cA8JcQ926F8gv2X5aqRsbrvA4PtZYozv6P6davIjPx6GyTYPI9DJTlT0KqFBRZmOof8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKWOYijTFnIwPTVHWMzh7faBRbm3pQpOewyDymts4LyAKCmDPl
	VNGT/3zBow2ot+TE/T+9Ift6efux1lMKXG0RH1ekCT6VVgAzTzKRMO9T
X-Gm-Gg: AYBFou3Wk9ZHwh2OdcUEYMg82yOdjvAMZyBsvHQ0pseemGfnk34zPxJSRlhj3AsO2WR
	rxYMPyc1VzaEWETpWSXVYoZPdXK7UAAjkzMVnANc18k12f0B811yEKEgrrRlDydj/PkSHaxLBJg
	J861OC2fKJSYUfMcMbLKPLt5zUlxMlz9QVL2inKk+RawS70YV/c6TXD7cb/TyLwOM1FLll5lb6Z
	mypi0KYKTBvsDq0r2g4RBYRmlUrBotmQSOMoiqNNNd1ImheVKb7ReehaQMa9f32PgqksM11qG7y
	mEJkygFdBuRDuS+gg8iRRYciMcXW+/xJrZ2VV+5Oh3uIbYgo/y4ISViQxzugsmHZZrziyCiDpfc
	8owANN/2b+P5qbZbYJ2J/hos3G5z0j9DF3FMpN0SBJTw13nuEr9OfBHlIwJanPvFF2ytoauxGu5
	D6wfroftAM83Rdd+JAeh/YTRhFR7BkJa1q3QCh8GDSw6K7GDiDd374jJ+NX8CBD+F6wF0KXa3I7
	QIUtJpjPEQdPIrAV7oJw0cNGP7bQ/VBbrPllpFGAW8ZZZwoS21Pd0pd+T25Y48TYWqBlYqjiJhd
	h44=
X-Received: by 2002:a17:90b:57c3:b0:3ac:8ee5:e007 with SMTP id 98e67ed59e1d1-3aceec24801mr4102774a91.20.1792343399360;
        Sun, 18 Oct 2026 10:09:59 -0700 (PDT)
Received: from [10.20.15.86] (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94798212sm17396301a91.14.2026.10.18.10.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:09:59 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
Cc: SJ Park <sj@kernel.org>, Shuah Khan <shuah@kernel.org>,
 damon@lists.linux.dev, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/damon/sysfs.py: stop obsolete_target shells
 hanging the test
In-Reply-To: <20261018020415.35567-1-jaeyeon.lee.dev@gmail.com>
References: <20261018020415.35567-1-jaeyeon.lee.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Date: Mon, 19 Oct 2026 01:09:02 +0800
Message-ID: <179234334286.2.7819752603607417566.damon-sysfs-tested@gmail.com>

Hi Jaeyeon,

> Fix this by passing stdin=subprocess.PIPE when spawning the processes.

Tested on x86-64 KVM, works fine.

Tested-by: Aveline Noir <jm5905938@gmail.com>

Thanks,
Aveline Noir
