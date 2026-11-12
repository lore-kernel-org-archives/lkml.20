Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794472306;
	b=Min3NqCef1QKDf/HxZVQm0pENm0NnJL6iF1gHuJJPwtEhZEHxi/BjJSC/9AQ5c5ex3Kj
	 9v/Yk7SqoJidKqi0DioWPlZySm1zgx3sIdDPevVdFtFcNKq1c1Zj0Lhikim6NV7zvjcqe
	 M070x/gwgBV0wYgKFUXufo+FVmRPw5WRcVVT39ONxI/ImDCOWuJcCEHezd9BWFnjnPlL4
	 Ht+71qkCBugZfZ4yMrh+5pBEvbu5G5+d2GacH1C5HwbUhJ4WLZocgMVGFAtOVctP1uaJm
	 2b4W46eFLNP5QqfSWKXxdW1HPp5V7O00Bpe7TMrij972v0ULB2QxtmPc7AF23jT/yLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=dDoN/lAt0XISVjDE3JROfi6pDhcTMzVIBmoJNktRod0=;
	b=xiFHcSCJudiEQSB2zk9+xgkObzL6+jVd8FNjt/51iqRD59eqnUZuOEmqjj7kEI7hQSnz
	 bbG9kIUEu6x8qnG6w11IPnB9Ie6Tm9nRAOT1yrDxWyd+wpDp0oAmKUSSoVtFj8NbJODOe
	 P0wS/cUrWEfO7+zkgN9XyoBRSrdlB5PhQrc8pGag5Go1Rj9VHBJmXl/3VRRfOY7wlwdcd
	 6oA/gRm5flaX9a+lO/bPNs4M8e4gQ0O6ZuY1LDe3bWfMGzM4dnLLxHJkKED44p0CD9Kx3
	 Z+8ReilKJcvt3N9CktsrKV75Pw32/tePghnXiZThAg9lBH0OA02I4eQUWmV5/yTz9pw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MBSDcAF7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B430606A332
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:31:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B430606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MBSDcAF7
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-677d35fd1d2so4723457d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:31:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794472305; cv=none;
        d=google.com; s=arc-20260327;
        b=BCi8P7kJnIq6ru1OZmuaFuiiAE42OnC057YnGKBSjtTXYeoLa4N5HMUyEOAoG9dUXL
         oYQGXf1cf7rWOi/FzF8oBapV42CShwF/TfpL93x7+p8aaf9UKyQhOq9vNW4ysyiFg+yd
         Ds7sMHNjHrRO8wVrNrkzgOodQOkeXjtYknxGK69BV6O5PuZtYVEofYwR6bViX1pDFWoD
         kFeX9AZ1LGcd9J7FDi73z7ZBDEBvQyYHNhGBuoeuFmgJPCU/Blh8l6/Xh3LoCgXevWQc
         Y9jG5YQF0Rlixj/ZzkY6qzHV9GaUJlv+R9P1uh+TMrYmjmHNa+o/Nav93dyH0ck/dCk+
         oepQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dDoN/lAt0XISVjDE3JROfi6pDhcTMzVIBmoJNktRod0=;
        fh=hWTbJMoZCcOSZv7g8q1+yMNZ95TSHRUg2WLAgkxJ2C0=;
        b=hcPkh1/kfruYvFLEeprf1Sm37+irL/MOe1H5X7IF+W5c6WX1zhSOX9mxG5xt7wfFhH
         gMkVqNiBtgZ55I6IBY0cbYlAzBdLh5ll7Mn+tprt3QD9MUSdsuDLF1qpOFQbdL8Fr22c
         5zUZ20TAN0TrgZRVIb4Hq0yI5dyBbyxWKyLoW8KFfajiYb35M6DNQDPu5BiPqqBbBV9T
         QolDudCUMPlqY8xvrQxEFeENdvIN/pbbJKw2HT480PHfYkAweJ67kCvGpJOsppNiZBg1
         L8sQQupmx8uv1fAs/UgYYeJCG4ZXI/LQNaxjx/VBnarEw0Hqz8ySQz/KEppljm/AYiZ+
         icqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794472305; x=1795077105; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dDoN/lAt0XISVjDE3JROfi6pDhcTMzVIBmoJNktRod0=;
        b=MBSDcAF7MGx0xsa6fDSfFCfQgy7gg36BMR5jEYGr/pKXDJaKawo3rC7hN7kcgjeL9i
         UrkQ8uH5HeVJhkBfSAeA+9vbIbuS5hM6As4TQ8ZOu2MkChUuMVduHx6p4bVAvk8OhbbX
         V3rAKt0LeQJsiCxOdonCSIOeSOuuzSiOKSLJRvGKbyJJd+Hi6fJFoL343Lxw2W77KL8I
         M1S9fsd9e8z28NMC2dJlVDsVVGIgnyLs+pd0YI4m0fPt531BJVkFAv0Ogld54hM2wsPf
         124FWa8DtiDjklT4guuLfOYJs8JB+LeCjOFqFvZ/MlapFe0lq6nobUBaymHeRhGjJBQi
         T1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472305; x=1795077105;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dDoN/lAt0XISVjDE3JROfi6pDhcTMzVIBmoJNktRod0=;
        b=hho4w8DlDjeuh/DzhSR0aNlh3by3VJF9S7yBbhYZVRqfWzmXodyRuBUzeLvZQuVm0S
         GxiaBKEeUamNd7Bs0eOKokgr9fMWWf2UFJTjz5p+7dp8u2XFjLjyG+Xd3dqeWCjMlsfe
         3Ug5yK7zQRH2RVponDEo4d94hdwKRdDdXv7ifKQBYCDe41opqs9l5zzyyQAoMIQPAlTm
         CTxjXv7nhHKnEjTf9C93L+qQq9HZkNnMRL840Og7g1N1UoEy3ZCzX9MKZ11G4RgdA203
         0YUmuU5Ix/NClFLaMWavOKl9fyzdNJxtw/mLzsLHXKuKiGvAva/rrEOiqaDlshtlMXYq
         Y40g==
X-Forwarded-Encrypted: i=1; AL+hErHaunTszaum80mASJ0KpNFoAK66qylLrdli1s7yoWMBJWN3i7DB7QD78mEi0Xbbjoho7BQ3AYq0rqASJAY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hZ94UKVOF+US1w+0dRTXCqW5hV9oXkWYptnuoYTrtAEM4v5WF
	0HqvrIkFfSED4nHaLH7Zwvumq6TMvvjnn8kRlnczLjhHeFvB3GYLUEZoA5jVzv7OZeaS9NqF+OD
	0nOxtgAX7auNxwftqHPqOPa2PLIBWjIcGmehRs+KxTg==
X-Gm-Gg: AYBFou3ZOJO5O02ZAmsIEp6FAZisPao/VHouCcGNDpMIZ5Kp2lEI9miJ3EP1x+qvLvP
	VaFPv8N0oh9Kelpml1e1Eew6zcvHXpjgrwm8AV9x5zs0mRytlcl9ft7hMR2fuMg65ygWMAyCYtt
	ueKfFWNnGwWQfP58EGD4B2Mf3RugH2X2cNtZY0iIHHsgQojnnwG506Y4UiLCS1HII4BVGX0SmCN
	GNn6rJqZHP1TEAJmK8vj3zKcifVjgWhNLOwFEDr6r3ZOpZkfFh223ATesZxuDSAohA4wcl9sReq
	67K+sSy6eP4KWjlcwoavfZUwmzjedtthUgqIFTu9k4t3d1ztS9SRw6MJINE7j+Ocbae6lol1brl
	cyEDXOPNthmijWMRGEBF9IoSQg6JEajMEVOp/s7BKsQ==
X-Received: by 2002:a05:690e:4854:10b0:67a:3a11:cf1e with SMTP id
 956f58d0204a3-67c67dd23a6mr2010175d50.7.1794472305113; Thu, 12 Nov 2026
 00:31:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-cwb-upstream-v1-0-a6a88d928aa4@linaro.org>
In-Reply-To: <20261112-cwb-upstream-v1-0-a6a88d928aa4@linaro.org>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 12 Nov 2026 16:31:33 +0800
X-Gm-Features: AclHuK_yCgsU2Q3_YXqrKmP99Rsllhkisqq8LiDMqSYcA-wB-d8VrImq6J8CDlA
Message-ID: <CABymUCNmJa+9tvTtnJ1jP8=_sFYKJ33ZkowjMwmLUYOsG4GKdg@mail.gmail.com>
Subject: Re: [PATCH 0/8] drm/msm/dpu: Support dual writeback for quad-pipe case
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Missed to add:

This patch set is prepared based on quad-pipe patch set:
https://www.mail-archive.com/freedreno@lists.freedesktop.org/msg47513.html
