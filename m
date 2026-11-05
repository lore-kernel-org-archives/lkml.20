Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793868085;
	b=js7i3173qWaMO88OSkXX2DVx9nJ1C39ktyHJj8s1b1UOYIqQrkVvrbDdL2sRJh7DaqMJ
	 aDcqp07lkPRDRlcr1M36l6UUGOKqsZjVSq4drqpE+2/o2v3cj5L7RwDNXASo6Sb/vX8F2
	 8g7/0X9ivyA15ljh5cUYNi28GTslyA5wrFDsCejd+Cs0dHaW8EGbVrDGeefucs61h3G00
	 zduKn/B1ASKnzGETSD9JoB1mUm2sN32KjZnpNPHtxk5zAqa6wZaTryauJeGJWO/pTsTzX
	 rQUFMDnS/oJ0dqH6JkUblX1/fwKKJbp1c6cw2aNVRf1zx8qchSvMUzFe7ZtQdpNOTUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=93jv87Iwyy3JRzOhRq5Cce/h8tGYeWiXhCqgOwKlqf8=;
	b=FFsO78GNetubmoJVZLr8U7MJwgjEIywo6Z7X1s3SINvY2aQNoGUF4x0cBD7hoDfWZCfE
	 adPfyrbeIRtDS3z1b7/WpBqnmnEf/cDCmHLl5PP2EV3q3g99vuyNzTUNjMPvLwhnXGwY/
	 sualIhzBozkCdElixxWwMGpctBrLNvBPGqCoLsZtffkCc1PQeYIbzZ3SjExstZ4M8hOi9
	 lhZVqTzRcBVpnv63Q4XHZ/GkACN1UayRtG97lUYb2EF2tqCTU1noUlrJyen2Lngxop2SA
	 p5w7RC+XumMcZIeuj+Ofd7L97MhZ3fMEhsE6SZk36WDLNDGZhAsQvGLsUmC7/DNQ9mA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TL9xyeax;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C54606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69C54606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TL9xyeax
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91c75267b0fso16951396d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:41:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793868084; cv=none;
        d=google.com; s=arc-20260327;
        b=FerZxRpGnufacp52ObVcfeRZIeIu6pW55IOTbpLeNq/LYNCDcoqwNJsfbMf2n8zXep
         SRQE0cZuRHVkUUBObrFj+ZEWxlCT9DLsOSqI/9CuQk0gLwH0J9eDaX2RsaKz0oeSMhp3
         k1md8Ow/2Fkq9geMBMifkanWvf4NMJQzU06Zx+SrGPDsPq/nrQoN4EdRXUHqKRarTgix
         7E6D15zhISPUsJs0bZ5McBatj51vPMi81aXQ7R1SrbBehvmjMf2ZN5YxrQkdqf3I5Ev0
         eNa2yIkxWKLA0F/5/EaPpekFHw6BSo9qTv5MyYM6k4/cvmHFqx0/Ke4VtMAqi4KQ2KWs
         gHuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=93jv87Iwyy3JRzOhRq5Cce/h8tGYeWiXhCqgOwKlqf8=;
        fh=mKK9NKM+oMmxbMaEhJifebPD6Rj/nn4y3IMt7oVnZ9o=;
        b=Ueo7TFSSeAJafAZxdX4eVZbE+mgkb8JuOzs6U4rk8UStukm0CBY/rn3ri89VWEgb31
         nDIi+NWZct1RuXe7+3tTdF1qkzORNo4PETl0SaPLWhcEdzdV99ipv2ymELpR5fntEaGU
         eVQoeukY8FOAQRivHZEvw5+n3hB38PgAEOH0A88MyVdDej2VZLFQO9Spz9ziQOC17z7o
         FwyZG4jIKS1W2SsGnIKS11GzlAGxahOAxVvTrSAZd+I7ma+lJlAqSh5ps05FRdF/c1uy
         vmxtOCvZHMnMPhdQKR8MPIeiatYVjm55iXgpPnb5qhxss4nZsMXs0+TdBqMm8CZYVmqb
         TnTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793868084; x=1794472884; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=93jv87Iwyy3JRzOhRq5Cce/h8tGYeWiXhCqgOwKlqf8=;
        b=TL9xyeax+1FAjH3Eo2+1TVVSspDAnVAbEh8JS5BmkGC/8ybmCf6fqFprH4TC1r+IQJ
         mmoJwUCiwTDiZ/Ugf8OM5lxr8Eox9S0IpUC+Hi6pheICYakL2v1sP4Tuc7jbHBoCAbiD
         qgqkupgtmoVIPhIqz6oGjGe3h9wRmHWwB15pAUKucZoIt5QFzs0wcR0YwyrV+xn9SzgC
         SXDBS2g2GSqa7fuRqKbWmT5Jxh9pvw3+qYTXsUVN+l/L+YXtLs6S7KC0fZyZwFil1/nU
         1Wl2XdrBe4c8Kjxqlkg746cHiLFBlYIG6ONAE4zg4m2tJT4EakZhuQaM1gXjDrogXoi1
         zqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868084; x=1794472884;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=93jv87Iwyy3JRzOhRq5Cce/h8tGYeWiXhCqgOwKlqf8=;
        b=hXV8XMVh26xiY6ABqxVwaiX9sOXxhMEDmjvZYa1i8kmm9fIMFB0wlNGb/mq/cCBYQq
         AL+nXtm6tgGjKUWwuSvZsssFP55qGbiuh+qnv6F+Xdgf6g0t8UxCZIEj3C/kaH2atH/p
         J+l/PpQNc4cZfRuqkhTddzJmHE7l4N21zf3/ElOOavjLYpyc/6yOKm2c7vixJTNSTIr3
         O8qWAIoy1G7MhTmBNBxaIVky92KKVCnvozS2rrae0AeewUwqsCLRoEMhfXa37EMzDClc
         dSzjS5UeRLGMYRr3Qk392uiOKVMjMrX34VcwIfrnyo/3hwUGzt7LiCGuG09CoFqdUMQN
         BfFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxer/tIMyP3tZqUP+u9DbjjcEqD+EpclTa7pr4jLW33BIyj82nRoazR6f18BmKO/fXGp2XrUzqKINurMXQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QIDvrQStmHMewidYxx8ybAAITDvXj6mmiBPNpItAqK3HbNJGC
	hoZJLxE4ieNMZwzKZLrM5S/pPMR8ZKZH5uzvk3ZFdQlh/KRhuxv32pIEyGOw3Qn9Vw9xrCF/V/K
	jUNH04SwR62bxYXZkpKf5hBaTbjrVoaw=
X-Gm-Gg: AYBFou1Vyxl9aq4WJ3wDvGQxv48W5MipN9cKdOMFMFt7xl7ouRFwHleHrHiwZgbGOTX
	j0LP4sLLqG5vKD4+Ja/IEvETJ8XCOuzuSLjCZYV01Q/kh1W3R8yiZczzJCFvPPhXva+YWQDbK5a
	diCpr+21SXR4otgzvhZ++vq7sNPFWgVXUqQbN8iQeRyQ0gAgqGtxuBufPUp6yEzq+9Wu6cxuSz5
	STa9vlJgiXaiqH6UM7Cse7rB28D26met59zQWy8+HsQSlc9hZLucMVSfzpmeyxiF9R2oK6jwRBB
	JshuH3duNaZGvU5DWBZU/b45fUe5pruDnGFsFW/6jpv3GHQgB2UcHsycCMbw8UVoLKwQyWHw+5a
	43m6hlT5XW117hfDBf6OeFJ4Aj8kpTo4BodrjYNIrfNQdf8i2ApI2IL0YuUP2lf/d+mxZZ+Kr5a
	FAVDAP7ebngD6KCbDOmo1sSIyKWv0B4vjlZmAxEN/m+iw=
X-Received: by 2002:a05:6214:2f93:b0:91e:97f7:c7a2 with SMTP id
 6a1803df08f44-91e97f7cacemr17909686d6.11.1793868084037; Thu, 05 Nov 2026
 00:41:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103221529.585436-1-rosenp@gmail.com>
In-Reply-To: <20261103221529.585436-1-rosenp@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 5 Nov 2026 18:41:11 +1000
X-Gm-Features: AclHuK_Xgyxbeq-Ri9AU0jIyOpkBmLy-X-m-DhPanCxRRFlqIAlhliusmaAXcBU
Message-ID: <CAPM=9tyLS7z5BF573bjRsFPjh3+nmE+nqF_6Rwr+qCF4JZgSwg@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/fifo: map Kepler video engine contexts non-privileged
To: Rosen Penev <rosenp@gmail.com>
Cc: nouveau@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Simona Vetter <simona@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>, 
	"open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Nov 2026 at 08:15, Rosen Penev <rosenp@gmail.com> wrote:
>
> Since the engine context rework, gk104_ectx_ctor() maps every engine
> context into the channel's VMM as a privileged page.  The MSVLD,
> MSPDEC and MSPPP falcons on Kepler fetch their context with
> non-privileged requests, so the first method sent to any of them
> faults and the channel is killed:
>
>   fifo: fault 00 [READ] at 0000000001050000 engine 10 [MSVLD] client 0d [HUB/MSVLD] reason 05 [PRIV_VIOLATION] on channel 9
>   fifo: fault 00 [READ] at 0000000001051000 engine 14 [MSPDEC] client 0b [HUB/MSPDEC] reason 05 [PRIV_VIOLATION] on channel 10
>   fifo: fault 00 [READ] at 0000000001052000 engine 11 [MSPPP] client 0c [HUB/MSPPP] reason 05 [PRIV_VIOLATION] on channel 11
>
> Before the rework, gk104_fifo_gpfifo_engine_ctor() mapped engine
> contexts without the privileged bit.  Restore that for the three video
> engines, and keep the privileged mapping for everything else.
>
> Fixes: 8ab849d6dd4c ("drm/nouveau/fifo: add new engine context handling")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Appled to drm-misc-fixes

Thanks,
Dave.
