Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792491769;
	b=qi/WDgwMsKbsYc0wRz/28P0f2nlOgERPjrC/R3xT7yH3zwM3OQWZ0sACAtK4miOcppWf
	 WNpkRWNttfiYsdAHvSEX5IW9dw9ZXGs4f8Dlu/Slcu3ydnwiQ2WJeJtTZNaa2hkPZx8DI
	 SrCcIYd8f2fyA81Cf7ByrYEKev/qrH06gOSULflo13jrU1rBOOIrptlKlJXXg4OGWNkxZ
	 Qr0+mZe5Z4BO8IGflLyQ42us4bYfbsEwR70gSuUuO0CgpQ4mJjMojQ1QC4Z85t5BZnvZ0
	 FGHkx/f258b4QKaGrVHvU5/lX/raKe7TByqucQqvxQWgWP2ZV5OTSOBRfMedVHmT/Nw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=S9TtwUeUO8Ss4JzAEBBTdeSudHe8tk94C0JNHQu/04g=;
	b=O6+mdqurMWUp9XxV/lbmw0APhchM+Bar6ZZ5oAukMoV6oAUzB/E5aMDbLOOL33ezrVIX
	 AmPhfIXpMefrdFYIp4U+uyoQZDUpIU9GyY4P8O7D91sOmuFRnupG/3yrNCk57qbi+5jU+
	 kfpnmc3e8Um4uBzCJEYKLItOHm9zOIRio6qgse58Yz6cr99NSXZ5/Tg20if+wPJa0dQwJ
	 AgaTLSKXIKyroole+ur0sFIeWqEDIUlY8h9pBiuJaavASDgVT+1TvRBY9tg6qgLuYpAlz
	 f/jHR7HTTg1qkbjv9UBo7x0CTEYUBvt4R309gBrvNd09woCjzU41xTF4fTL4ns84Qyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mAeXLhva;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EFE606A325
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:22:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44EFE606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mAeXLhva
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bcb1f1358aso2305759e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:22:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792491767; cv=none;
        d=google.com; s=arc-20260327;
        b=R74waZzoIqd+jE1dnzAPY99WGaADKG3BOknr84MXROjGesW1wzhqEWxqZCexzFA9eQ
         tBjhcEKUV2F48vtBqzkdf6vLIDC5NUKfYIcwv4oFnRM9sMLxY1dK2/rHNBvSGb9LVoun
         WFMfY4+n2D+xO+dtaYQAal1DVcfHqRKQLCRntq6YhsW7XD7oaTlLa4s6fjcIFFtZjzdr
         Pemgz+iX6bbBfAcVR8rlW0ST3Vs9AklUJfhcM/776REZPIs1BkFO/7w6v8hiPLfUO8G2
         YbKvhFmDJsAgahWXR+QSe51MV2AUGzpuk+cAKvFhoWV1a23btuDXWbslWZz4WuMR2nEw
         o1+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=S9TtwUeUO8Ss4JzAEBBTdeSudHe8tk94C0JNHQu/04g=;
        fh=0/L1MQhr1Qdp7AlL9ydhRN57qf4yNwlsLwF0CRxWim4=;
        b=WLdwHApxN2+x0G6DwOi4AA0/OQXkfGzi8dq/90xXSOtJI3s0iYEOVqhqK0Mpe4ulPe
         z2dfoEbzEgSsGEo9mXeZIv02+teOLyUxyNXI4ds9ufhoaHSf4w30fUgUKO8YJNpEpAjK
         TwUgmrJ2tQoAsnQPy9YAcCefzYriwIkymwCk1yX02rNRQHg6MO2fJrtUBUKZ6xHB9Zer
         Up/7e3Zk8rmrmeJF37GtXUz9RHAjxThF4VCPOc5atE9sMWOdQbN6ls/Ap5i9xWTFlSoX
         T9T8mCiDp/1XT2/qOfgEIY0h4fTi4VXxcc5u0y4Gv3e60RrwGLmUmuCK+hZ1H4oZZBLz
         2b5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792491767; x=1793096567; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S9TtwUeUO8Ss4JzAEBBTdeSudHe8tk94C0JNHQu/04g=;
        b=mAeXLhvanluEkjo1PmluJSdlXstt4qTX5kS5IyN69H8ESLCM0C7Pxty8hpRlpRnXnh
         zxeHwIv8Esb+BwfrRoTbcsWwm1Etpst+Ydbo8/xnUYBmplXhjqDcuALWUSAO7N51DJys
         AyzhaaO1KuNv3pjCLqNsGCU1jUY3U1ygEUEZ3bpIT2riyBOBtdi0QBkSZtm4x8vjxpgA
         dRxD5+Foy1UvYXzADUJkVEcbG3jKtRWlvN8Q4dEO7WaREbcuJssfS5MVYKXpnojR0ivg
         YCQxSQIcVHj4A38duEzGY55qQQvuZTDH11WNXolbWDWqrPtYQ/5Oglpu5UG3KINeNR9f
         nu3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792491767; x=1793096567;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S9TtwUeUO8Ss4JzAEBBTdeSudHe8tk94C0JNHQu/04g=;
        b=2Eup1rO4AQEY391tHNBMVV9T5XRHMXcXhT06yY1bROiWuw7uxB53HBRewsGkEd8uUX
         lki1XN6WiUyjYvVAGRennh6Sfc+wkNbhNC/+3bYx7JKcckTwk3tvBjTp0pVnMW3lxccs
         9LOlujfF9rvA8neSa3IYn8hriS/d0Z12/l8snagPlzpLNjY3OJfzXtNCEkX0EwSkhdF5
         Pq7c8IzQjA4JfFBYxHH0gid0he8UDwrtM0bfyZVTOIbP91WkPa/A97t7KslRT2G7cIxk
         udSj+U8fuv9v5NONAXvC/F6DlqGuWqeYiKUAxNvFz2qCpkJPPU6BdcUB8mwo1UVgERxh
         vfCA==
X-Forwarded-Encrypted: i=1; AKwUvBzgjVgQEBxDeXPvZACLwSb0mrND4SoC/c0DNDaUZvN1cGAO40qV3kq74JwpdAHRqYgFrjzCbgCYgG+5jjw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfIEyyxW9qHXEfMFFjzkmWjIJ2QHFY0SGVZMnNRVJ47soYyK6u
	LzqVoICPxIhn7VWIuC2W2z6twbcafXHQAvfAAw/PQb3rqeHwKG9Few72FXA4XAMm99cqRk0z/YJ
	xGmu2zVEdDpzbXBLKp7Rv/dGnHe+Um6I=
X-Gm-Gg: AYBFou1+oS4op3lx6ozGRRxxq3p+34LIBctEOe36bGSEYX9oBBZHyrJKj3UgOibZtNB
	nAgW30BiDg2UJqW36uu17wkbj5Fpg2a3KcGijShi+BueHhWt81sOeggJRL5dYU4s7qp572Az7h8
	2Jevsh/WPt0ZYdyfuFpMsG046HcqEe5F4m4vMx4XfkTuVXpkxBiccWu2yfRfGIsNhfZwSZmmSAF
	CIVZ0Q+bxnKrhhNAYkeRP3SRfWKd/ayTfjT9G0qDZ5Pol01TYTbbjnGKUzQxtkjrzyRZ1KPZV2d
	2kd49oWIC1S0Uj3nFvoYheFyM1VzZe6FT+4/+FdVp/yqcqnQaEBEM0gIFKcyqkWTi2YB8ejvcpD
	nQXEu1/Y7tUpyUwcbFOysSSlQT2I59w8xXxVkqD1Ytt4tX8BbRwcP2YE=
X-Received: by 2002:a05:6512:114a:b0:5bc:f280:e7ca with SMTP id
 2adb3069b0e04-5be509ef7d9mr3121213e87.7.1792491767173; Tue, 20 Oct 2026
 03:22:47 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012011707.3378-4-sigefriedhyy@gmail.com> <179185709988.434549.15422498299449004512@kernel.org>
 <CA+7S2v+LHUWXQMD-cYPEzT5-f3Qhw_vz+LEssQH_A_oqDKtnnA@mail.gmail.com>
 <8dcd9564-e9a3-4b00-93b8-3cb023d68047@redhat.com> <CA+7S2v+rWYvz9xKPEeM6=3HPz3o7TbX2uRfRKk95f9Y60HnEiA@mail.gmail.com>
 <976d815d-a9ec-4fa0-9b16-8e55695706c2@redhat.com>
In-Reply-To: <976d815d-a9ec-4fa0-9b16-8e55695706c2@redhat.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Tue, 20 Oct 2026 19:22:37 +0900
X-Gm-Features: AclHuK-kxJ7GesuN76pq16qYPFjVn7o8AWFRCTQQtoJTT6S63wPtOHkARgKHwik
Message-ID: <CA+7S2vLWvQd7GrnwB+B+DiqAgST8EjfWwBKzJXtjGRBPVgmOBg@mail.gmail.com>
Subject: Re: [PATCH net-next v11 3/6] net: add a generation counter for
 dev->mc changes
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev-bot+sashiko@kernel.org, ajay.kathat@microchip.com, 
	aleksandr.loktionov@intel.com, andrew+netdev@lunn.ch, 
	claudiu.beznea@tuxon.dev, davem@davemloft.net, dsahern@kernel.org, 
	donald.hunter@gmail.com, edumazet@google.com, idosch@nvidia.com, 
	jacob.e.keller@intel.com, kuba@kernel.org, johannes@sipsolutions.net, 
	kees@kernel.org, kory.maincent@bootlin.com, kuniyu@google.com, 
	nicolas.dichtel@6wind.com, nickgarlis@gmail.com, sd@queasysnail.net, 
	shuah@kernel.org, horms@kernel.org, sdf.kernel@gmail.com, 
	vadim.fedorenko@linux.dev, willemb@google.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> To clarify: every I mentioned in my previous email was about possible
> follow-ups - not to be included here.

Understood, I will send them as separate patches.

> My understanding is that there is sort of a pending/implicit question
> from Jakub on v9: why are you doing this? is does it solve some
> specific scaling problem or is 'nl is nicer" thing?

I think the motivation question was on the v5 thread, and I replied
there as well.

My original motivation is to simplify some userspace hardware offload
code I am working on, and to finish moving "ip maddr" to netlink.

RTM_GETMULTICAST already reports IPv4 and IPv6 group memberships with
IFA_MC_USERS. dev->mc is the only part of the multicast state still
available only from /proc/net/dev_mcast, so every consumer that needs
the full picture keeps two paths: netlink for L3 and procfs text
parsing for L2. The offload code above is one such consumer. iproute2
is another: "ip maddr show" already gets IPv4/IPv6 over netlink but
still parses procfs for its link-layer entries. The iproute2 change to
drop that is ready to follow this series.

Also, compared to procfs, the dump provides a nicer API: it supports
per-device filtering, other netns through IFA_TARGET_NETNSID, and
reports concurrent changes with NLM_F_DUMP_INTR.

Thanks,

Yuyang
