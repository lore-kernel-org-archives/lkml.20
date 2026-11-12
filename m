Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794450780;
	b=dnv9+cK/9iqfDIWyK2fpfzqCG1r79RAjhH+kzxMh39rPE57N/bA3nfscvmUdc5i2usYr
	 4jAhqkIltfTuDa76o55cwln/nEHgRMH5D/GQko89ucDv61p2+xxNusD6cvJC6jiJUQVCG
	 MVcmSoFbLoLtS+idM7HemAQulADveQiNE6+B994I/PjTE7/4HyclVe/17cjSM5u9m3rZg
	 kY5ruC6lMDP8Cfwt8jZWNlOVL+qtPUrqnakOrbcjHaxr49QodnLo+WUGiRTR5l6u2KkaB
	 t/7R2DPnFiQerCirKiZqxZ6riSuyRyOK8YabB++TYQfRqO/HZCOlBWN85YrZQTUlKxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794450780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+BRgZi/ru4kt6Z44lXsT8xtnCbwbkOnntJWrR5mZ6uk=;
	b=tF9Q3XmW3J9BTs6pdePqXr7ffti6bZjy54wDkn7rXwKdWT9dO+IV4Vnd7MJwnfOcwmmU
	 cN/HmfIPfHugXl2xi+rL0tm7put4/oRxgoLkZy8h2r/+bahw6ltxWYMqBQkvXgc4TttRT
	 dFsXsKTzXeTM1c+L05qg66gTg40YEu/zPJIleeTWftld5DWqh8+0cWXd0cD2PvkwyrH+J
	 GYyjD67HAGp1GeVhLSSQ/s5vyKw+7mN9jWTQxBkCiCamX6r0dOu7rfH1+4Mn2ci9+5C5w
	 KlRfS9bw4j8mA4pxtycn0qRjZM8fZCxFxHF3UejIODk55uDHc3tx+XxKFlG6bhZWz2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sf1ye8c0;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF2F606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EF2F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sf1ye8c0
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e96502e447so31095915ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794450780; x=1795055580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+BRgZi/ru4kt6Z44lXsT8xtnCbwbkOnntJWrR5mZ6uk=;
        b=sf1ye8c0sYH4D0xHSeFLJxtpIO8jYTtz8n+aCV9WLa2DhH7wECKLKrebKKCVoWtJN1
         XGDXn6GnRtwi0LFCkr5wcuX1LiSqzArhl5OwTuIsjrLsgEvzwPOpsSUmcAve7cyy6RWn
         n7b2ddRE5kWsPfU8zCVrQh4I4H2MYJf+a120kMCM1Q0eNu1zj3kSuJA0MGoEFAbndMfv
         /s1djguR280b44OTKyZ9pxBwsRBlDEey6tRTGXTNXUafQh2jyBFBo/3/YWktc+tZcBDC
         2In3z9t3Y88yQ8U5dBYtfgb4neN+C8mfjmz7hYjnzm4MMpAq8UFO4Y/IAZbhHjdyd+98
         BwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794450780; x=1795055580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+BRgZi/ru4kt6Z44lXsT8xtnCbwbkOnntJWrR5mZ6uk=;
        b=j+CVrD1n1/hFhFFzpfqhPSJCpklcwZp2Nma7mRmMUd0pLdtmhNBVScs1JvAMZccB42
         UKqWo9jjhPBfm7MWXoNqtz5A403sSnFfJlIyENbVpWM9O1EAZ4zLGn2YXUvmoJco13+4
         Yp59L8LM+eY4GnC5+xRUdVvjARKIHVr9EwNWKsTizs9lCsCBJ1Uau3r1P+0mLbEO+tLg
         TBj9n/JNooI3AL2gDpaHAUisYuZ99MIn40RnYCbBrc96AEf3bGnk3nCllmW/BOhAKmmi
         E77kb3AOf6sidYbFLUfLRmxMaDBuxrEQoWGVr5WW+nmA1BRCZ/w0/sop8j1AZ7z9vc68
         JDPw==
X-Forwarded-Encrypted: i=1; AL+hErEe08fNsxc9pKgfh2E3A9Nio3OoaATENi1URwKElIJYY+duvhlemv+nbj84Ts3q8UJuj0Fl4lBRQ4Aseos=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6lYGx5kMnPomUS2g5+iFN5Ii5oZuEVgFtdEiTy2/CRtcaX4m0
	BUuDspAyC5h19/neGGQWCsFfjsI4w9F4+o7XAq2No5C+n/SR06AFCDGd7TkC716we8w=
X-Gm-Gg: AYBFou3uJjHwMrrseo7tujPpIMC8lk0QOMzg4Ke7k2UYi6+rWpdr1na4LRMizIWA3T+
	mBDtUIvtM9fhEypZWP4uNGFmOdeDKSXhlKZbcCFF6RZJ/DZOb2iEJT/++syhIHleB4QuqavMTvJ
	dgCawmcze95r70th1yKjNhxrVolsFlwng13et0v1QoIfEqsSbKrD5KnO6rPPuvaGwTq3/07sGTt
	c9/1NWZr416tRbYCSamnQv7QqoEDTGGc7kwbjkpyhcSMNUHbOwHnMM6GzuYSH/aCfACY5E7YYa4
	tRGggXTZr06gTY1X9YpcWsX95/Q3v5Xl772uFITB19n4dhho0JqVwqANRB1eHX7q4/BIyk9bGEG
	T4iQcBp3dMoJrkc75+ftzs2rpIrcIq5preBaUsMiZHFUKHgVtnXdpqF35aGPfu7pmENs5WWQLa/
	qo9gwG1Xt4kaBnv3Z42MckA2pbf3nWePPyfdK4vYKpXnoQXLhiFroemICVeX3uFxiD8T+EIFeLC
	Wp//4ul+3j/DVN52Gis5dWHy7mMFLt9oPfqKgSP/ZBFQuXRkjJJ0lw0+8Pq8rSqA0OtL0gXeB6w
	zGZvGRcANC1/NdtIINUF1lFwzQ6AfDxvzGPFi/9RA9P94/k8
X-Received: by 2002:a17:903:32c6:b0:2e8:1910:e398 with SMTP id d9443c01a7336-2edd76d5e01mr46318665ad.9.1794450779567;
        Wed, 11 Nov 2026 18:32:59 -0800 (PST)
Received: from ubuntu24.vpn.host.chaitin.net ([124.77.124.144])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb68204d4sm26378855ad.0.2026.11.11.18.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 18:32:59 -0800 (PST)
From: Yuansheng Yang <0xbeac@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Ulf Hansson <ulfh@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [RFC PATCH] mmc: tmio: disable dma_issue work before releasing DMA
Date: Thu, 12 Nov 2026 10:32:53 +0800
Message-ID: <20261112023253.7607-1-0xbeac@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <avRXf6SJuXxslsbx@ninjato>
References: <20261101063739.89331-1-0xbeac@gmail.com> <avRXf6SJuXxslsbx@ninjato>
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

Hi Wolfram,

Apologies for the handle in the Signed-off-by.  I have resent the patch
with my real name, Yuansheng Yang, in From: and Signed-off-by:.  Only the
author identity changed; the code is identical to the RFC.

Thanks,
Yuansheng Yang
