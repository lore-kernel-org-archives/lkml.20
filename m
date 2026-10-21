Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792578032;
	b=FelH1i5vFJU1DqSJnMSAZiG/VcqgXrL/7C/H4xjdgyJjC82kzatyfQJnCn7qdqAcIdt7
	 wMS91azg7r/mSwucNk410HL9B6jpe6oJ1HDwIEKVmsAsjNgS79xy7VVNz9E+OKKwURobv
	 69a3aGU0q49NRk3r/3XGBo1Qxj1CPO9if/IQiO+ureNuG6xpa3HGU0tofMBO6KaqbGwMP
	 StglUzXYuaV07VXQ/c5VTpW3ktFlkt1zZ+4xERsLv+16Uhkr90/Goe9C8R4P77NqH/xS9
	 fFrFUCz2jmaHvt/g4QvU87juNUeGrhD84soE25lpZAKYrjedDZwt0NTUuIMHzNbPKKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578032;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=0O8KxR/u4jNMtz6RpoxRSfPGCbbGOO4Hji6U7RyM5SY=;
	b=Qia1MLsDdhbsrhb4tEN6kvJoHIkvvIiHUZPlR+HVf0mOqsv1IlY+wMzeHJMZOZPd4ZTg
	 4FcQjAsIfc8uX3k4B14ueBGzyi+xj22z+fHtntk2nztkKRtH6l4oDIxp0VuQP3XL1Gg5t
	 rD67hRoFg97lpl6xuPbkebkmTDCoU5+nBOIAE+EZdis+2K7IQSD2BQy84jWu58ipLudpi
	 oel1SSkGCCyO9R7Blq3a8sr/4QyE+AToNRUELIX/UC4LhVJGmTnNqMcH7oMH/72BBSzlD
	 DP1irQfcRsR0ek3Nf8eW4CfwrZ/ePD9EBzWBA2S5drM3HzgueWNHdbKd1eKLdIfKPzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Pbn+akcx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1613A606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:20:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1613A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Pbn+akcx
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b1aa27963eso2279434a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:20:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792578030; cv=none;
        d=google.com; s=arc-20260327;
        b=U8BhgVsM0rQBq39NJjIfxjfd/Y5/qG9g8Awd0GhSYyCpoTMAnb+6XjhKQkk9cpOhMv
         jEpdfUEXjNzc43KYtwhBhW5nZiz9lFWTCc6QuFG/uNAAd8SFokU0CQjbbwN3PeN+OP5B
         cJ/HOJZDuuI+cjsFfX6/n19FHO4iONRuc4S9U3MqP55cRn4vGEvA73mQlvUcOxjrzqU1
         1NabwidJEM0YHCz363TRbiQC6AQ9rIaUAD0kqlylklRO5xMOr5+UnaMnzY5lY9LRNlLk
         qz4p1DOYihWHwZwglUOC8MKZvn/vLgU/mrJ9Lb/C9aw5iLikw+TG7zwZad2mfUbHS8jy
         Hbeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0O8KxR/u4jNMtz6RpoxRSfPGCbbGOO4Hji6U7RyM5SY=;
        fh=kf33vUqL4mhRptA9YYa1QTY8pi83dqMKclic0h1XtMk=;
        b=iBXVzE8J45BeCmpLz6yYBjM10Jr9H4XUartMzkmDYsDIKFc6DTLJsVmkOoMHxM4ChA
         c4VyAXLRNwQIieACwLM4RSp/TuvI9ixQZIQfewLTNKkDPEaa6BKuU4LYNiwTC0S31YKX
         aJ5A4xqkOMJHIUlfKYx/UziXLKyAv1f//4kt+s9VsuiQ3NMJslFvmWemSWGiAKVrgb5u
         WAacew/bfXgarktHuiTLmp6lk7id1yuzjo4n1VE/TdaInOjfzvvz0K6NPcmyvs+T1t8W
         lDzVR1frn4nIWet84PGdSGMmqNBTa2DkKHwBAJOfFM4Z8OqM7BhLQMW01obH1HER7EOq
         NuqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792578030; x=1793182830; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0O8KxR/u4jNMtz6RpoxRSfPGCbbGOO4Hji6U7RyM5SY=;
        b=Pbn+akcxlX1w/E1KDARRHcSQyL418wKFzrO93mqcy4+kMnnDgAXmhIhKPjmGu3APn3
         v5Ob6na9EMP4nzh+b0dofPFq+i46JRmPIvA6kuevLjmxSsIRL5DHxRromr7+C7q21ZWu
         NTVbudeC5ZGLF8HfqhWoE2JwZZG2/kIHL6pQdsv7C9Ex3sMQ49e5GQAzkICiB/6UVi66
         zRsVlzPjFbzMqmoORpLJJctXP89y1cNzkVyjjVLGuI4c8UkTjAoRbSLxnQvvBa4Lsnsz
         617alJ7E4HM7tGnIA+xHIEyvbtysnyw4/F/TI8K5KHTCUre1jNzViVE2BEAQN+l9l+fX
         q/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792578030; x=1793182830;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0O8KxR/u4jNMtz6RpoxRSfPGCbbGOO4Hji6U7RyM5SY=;
        b=PU6qR9tsffyhghe0lHb+LZ5/xwkTt1TbaDf+YC2eod+KbexNmDmPCjN8algw3QTu9T
         stg9BBmBn20sXbcSrrM5xTFhUq5fcALhrOZK8+XSzy0V4Z9//zESqdg2tMEtKgFYfas8
         MkgMgcxuOMxT6plFZAXmAxkbB4Gixc0yU7TVCuZDn3TneX3UWEqpZbURbjQyaKLJwEc7
         6RU5kztJgzu6MPyYLeJg+LkwU3j6TF1l3rVFcqAm44U8HvqK/9dIJqkKS9wkkZyyMKwi
         UrKjForEs0O2IVQJyuxxHd1NyAYLWlt7y30a4JQDptN2SzuJD+V0+AMP6CrSzp5KR1p4
         BDXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYdpiQPQyLLTkG0LTdsXf4IXt7qejLzusydW8YPwyWHwllqGfNxpVoqNyKHTgXmZ4kCTojQ4bwQDqd7j4=@vger.kernel.org
X-Gm-Message-State: AFq9FYITbSqAqohNxLHgmr+FUeRsApZekIvnfB7f83r7yQgh0EN/JpxC
	l0N4aM2kp7K1I7IY0J8AbxfrJjWl83VgYzId7eSgKKSZ+bWLJRnutGvT1xXjCDj0gJvSgNqMYND
	g1TTuNc6dCgz9oSSr+VTnH470MzJGq3o=
X-Gm-Gg: AYBFou1dYjyHjHsSLrghRaTEONoB9z4NkRPor3oQFs6V9SErGGXFeddluP4h50/2oA6
	7sRe7GZJ/lXuJ5ZCHQKNsv4GIYmAweMJaSgahKvRVKUYAmyTWgk3WDvZbbG9CLRVbpBoD8EsFW4
	sbgK+QBEtEMaZSjBxZHBO40imtnxfaoxpEfSwrdxQCvhC/+TV+q3sIhlW7NCKSp1pgTFLXnChot
	xmCfj0pd64fnLQUqwdD9RPoiUTHxl5l1wrRPlLr46ql122D04xdu/JNFahe28Ib3edVQIVJdEKr
	WYphxs4WJRlpri8ZkdZs37FrOlR/BF80o2vD47sPyIUganBsnQFMtN+RQmn0Zv+azy8dqZIniLt
	qlFj0/YI41x3wK7bRedc1uAVTt4PexfujzFgI
X-Received: by 2002:a05:6402:1ed6:b0:6b3:afe6:4fc1 with SMTP id
 4fb4d7f45d1cf-6b408dc32e0mr1130962a12.2.1792578030234; Wed, 21 Oct 2026
 03:20:30 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260921102522.1640072-4-akkun11.open@gmail.com> <20261021094542.59417-1-l.scorcia@gmail.com>
In-Reply-To: <20261021094542.59417-1-l.scorcia@gmail.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Wed, 21 Oct 2026 12:20:18 +0200
X-Gm-Features: AclHuK_9WSUvbl7lxj9ijaAvYmNx-kmxqZkezsuL4zt-K3i_hWfIEDEOQ1AATPQ
Message-ID: <CAORyz2JODezexX2ZGwDk8LcBbFA+Jm0hRBAamJ7Nmk7Q+a4R1A@mail.gmail.com>
Subject: Re: [PATCH 3/6] clk: mediatek: Reserve missing MT8167 clock ID
To: akkun11.open@gmail.com
Cc: angelogioacchino.delregno@collabora.com, bhelgaas@google.com, 
	bmasney+clk@redhat.com, dakr@kernel.org, jbrunet+clk@baylibre.com, 
	laura.nao@collabora.com, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, 
	nicolas.frattaroli@collabora.com, o-takashi@sakamocchi.jp, sboyd@kernel.org, 
	sjoerd@collabora.com, u.kleine-koenig@baylibre.com, wenst@chromium.org
Content-Type: text/plain; charset="UTF-8"

I apologize, I just noticed that your patch adds the "_dummy" suffix
to the clock name. I had originally applied your change manually using
the DTS clock name "hdmtx_dig_cts", that's why I experienced that
error, but when using the name as you sent it it actually works fine;
the additional dummy clock does not interfere with the one provided by
the HDMI PHY.
I apologize for the confusion, but at least I can provide a tested tag :-)

Tested-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
