Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D2C44C66D
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 15:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788622108; cv=none; b=h5gDNNyYnLjlua1uE/s8e+pqZoihYTtC08f5EAJZuYkOJAeeGapRUg+fe5EavP+2VgyqpqspK/mRh0zmA+6cY0UOCBPZAPhzIzcZ99a2l7iC3K0Cib9uFo9uaTrYm1q6nMskY64NU4XYXSJ8UBZ2lpNDmjJYnbumi8nWI9Gl1fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788622108; c=relaxed/simple;
	bh=KQd873RNQL8TwMFhKNNTiITCU8dPIomQJwfEe5ZQlVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kZlbnMWT05ioqB8zK/F+yjWSb7odMKCqsXhtQN0aQRK7i9TxrYEuI9dZGW8bWWKxbFFseEPx/yrqTFuOQVw1hzCOpKGDY6uuh12w2m0d0F5llzCCuGJVsdrGU2Di/R7D0rEQuB8JWmZi7/CBr07z8WU9SzWI2bkw725u8rbQlkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qxKFNaJJ; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qxKFNaJJ"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48583cb7d44so112501f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 08:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788622105; x=1789226905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bby5XNssOK47IVbU90Y61XfgVLTccI/hRlNdabb9YVk=;
        b=qxKFNaJJWi0CuP92dMuq1qeiUfchGeeypcdP7NYpbAgXiqvHvGh8I6qps2cyhtQZuc
         WDtoJJhX+IbkczjUtc9UZGoqoGe2B4J7mwPhrNgUjOxhlEV1RZkDmppu2ZNgz1gKbBWu
         6He+sychvVLNX9Rlf8/COA+uFcpBRfiYRX5SYUbQ2y3sRhDFU7+hFFBOYkywwIiUCgAR
         V6oI8bFuhQ8xjTOXwuCaGvCYgW5Q7TmtPzfeX+YHQKo5MgV+q382pC9TqQrKQHxOYUHt
         WVOBr/pW42PFk6dnLhyXnEKXmllZ8iPHVmOk38kM24FoJP4FqT5S1pV5ELbuLZc/9kTV
         xAJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788622105; x=1789226905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bby5XNssOK47IVbU90Y61XfgVLTccI/hRlNdabb9YVk=;
        b=GBgWhOD4IcJZuL3t1Frl6DdRvkAtT4uexzTO7irtfvRtBs3gBk0IVg8JPVRt3HPIR5
         aHryO5dxioAJ5a0STrkQF7XMcDceOQjS5y7vRN1SkaI2kvHNChAhKy06Xr3antJ3tOS0
         +7Zod8Ju8wKaRdGjrbUYU2cUeMGS+WtrSZ9olOWfZK8FwTDxAVz6qe6XE/QyPihBka7J
         kcr9zi2hYQnqqWdrf7J7YU2O9JajrrrwGVDKks7UK8Av9VW+Spdz0AlOaH2EuEg91XwF
         lKGqDkjUj84CBvCBG2p19flgHTKbv8QyGQ1++AjAEIp3umnmVYYPu5SCSTMbO09X+S7r
         PgQg==
X-Forwarded-Encrypted: i=1; AKwUvBxP4j9+2BbfA4tL5Bbj7hjkluw0qAOwUQukDNyXbUCPAPlvHnG+yO3cncSRPf5y1MHNMdxJXQvBN9nP+rM=@vger.kernel.org
X-Gm-Message-State: AFuF++ldKhleoZ9r9Cg+mHuFGTx6CthG1zbs6yj7cXH6ggEPJl+afBDQ
	ksGW5iMo7ChDYMSVueSeeRzwXJejjxLb5leGlMA0RL+wa/Gd6w8fo5dr
X-Gm-Gg: AYBFou2aqdXRtaRNK+n4WaPB6s+bru++ncfysAKrfz6CGwofCEVtdQsTGpBk6T6e5DY
	icuLPqX6Cyi3m6tzQKA7DC1wY7gEiYsJZiK8vbrZSrjcTmQH1eRq/P4UP7ZzP4v0d0FtOckcsix
	bgaFZc9MUI5VYrLXIXbphx8NjpFr5iZLuwJ8UhNMSVrUwa8h4Te4t2U6HjvYgQf5vpJtZqGFtfH
	nWQQUxtNVK/P3sunvbSsWPNsIfzXe076qea2kK9KOHmYbhJtV0dAdezFQ495CVUkvqND6YSEJUe
	gwa5v/hm1LMP1UTWIXXqCHHskCUxzsLY3t/puJb/MuKySouHwQH+WU8UMA1sohOxbpYlysOLaoe
	LPmVA+4Oc2c4PhFfYxp6Ev+mQjrfmqKG34k9r7TFJ/KhG8fiSQbP9MzeK/MdQvuzadXao76uw17
	77KvG1onBJZxnH0ZjtDqvE7W/njy0b47ClbBXtrtizz+h2czbceykWLvNn7PbkcweWi7doUD2Ut
	qXO7zj2biUAlYuzLQ6JlBT2WBSa899sagn53oCOVcmhxkaVzMBAkyeZH9CAPRP10Q==
X-Received: by 2002:a05:600c:3b25:b0:49b:910c:76fb with SMTP id 5b1f17b1804b1-49d01dd415bmr45799875e9.2.1788622104748;
        Sat, 05 Sep 2026 08:28:24 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B950E0061C002CD703C2CBB.dsl.pool.telekom.hu. [2001:4c4e:1b95:e00:61c0:2cd:703c:2cbb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce831af89sm178425195e9.1.2026.09.05.08.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:28:24 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: sashiko-bot@kernel.org
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Heiko Stuebner <heiko@sntech.de>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] accel/rocket: search every core slot when looking up a scheduler
Date: Sat,  5 Sep 2026 17:27:59 +0200
Message-ID: <20260905152804.9822-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260905151815.3BE7F1F00A3A@smtp.kernel.org>
References: <20260905150432.7477-1-royalnet026@gmail.com> <20260905151815.3BE7F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> - [Critical] The patch introduces a compilation failure by referencing an
>   undefined struct member `max_cores` in `struct rocket_device`.

Correct on its own, and my fault for leaving it to a trailer.

max_cores is added by "accel/rocket: search every core slot when a core is
removed", still on the list:

  https://lore.kernel.org/dri-devel/20260904125936.26234-1-royalnet026@gmail.com/

This patch declares that dependency as prerequisite-patch-id, and the id in
it matches git patch-id of that patch exactly. On top of it the build is
clean with W=1. On its own it does not build, as you say - it should have
said so in plain text below the --- as well, not only in the trailer. I
will do that on any patch of mine that depends on a pending one.

The pre-existing issues are useful, and two of them are already in hand: the
global rdev left holding an ERR_PTR, and the devm allocations on drm_dev->dev
that are never freed. The reset work cancelled after drm_sched_fini, and the
iommu_group reference taken in the IRQ handler, I had not seen. I will not
send patches for them until I have reproduced them on hardware - the two bugs
I did send this week both looked different once a KASAN kernel had printed
the trace.

Igor
