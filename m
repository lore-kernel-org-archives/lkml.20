Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794032916;
	b=OJWvSUzTLEfllbPwxfFxZWg9WBUY8DrJEgCE42twiIQYTQAcWunyhJ4yV901NTG4izOy
	 Td4uxFqN7+2sGkUCe4pSew5rBYUBZi66+eG9+3jufd82lXaicx5/jTmhz7zArYa5i6/g9
	 gaMJbzZQYBYas2S5f1MVUp4DdCaI7VvIG0ZM0Arurir+JY0NVR3SLtzcKtJGTw3VnFut/
	 vM8pzjlxa26V2WiyGaKbD/u7e/JfLHRVMGr18ZEHPv9aXs6HXOFL9zuhLoF548XDfvi/u
	 dEIxf4jKEYeQXtdWKE/BtD8NLDdhTVIDz0AZ9qMIeXEUwYTpmvAI0mC+03Kt1c3U19g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794032916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=y3fAM8CU6fD90S4RyczeRFzjWR9lUGI2XBHnFrKKF58=;
	b=OtqSeLJVeYu7DZ+kBS4otEXFmiDxWFYoyY66/6OYYV1qdtSrnjVC5JXgrgvLwt/aTK/y
	 UoxAiZf9uDIXfVORXtXH2l/L+wkBlI4zn6CbyADBrVVeuEel9IkbHRpIcoaR+6I5j45t7
	 LkLBIY+Gb9ww1EJDnz1O206TsWAlXEH53wbcT8Is/1PFGq88UaRGjFzSuDhDHU3jt5lH6
	 g8Xj84+AlTMVJazOYSJCWIxP4Kqm+NIffEEH2aBJ54VkfUMj1aYyZGxF/GJTPTTJNzuXa
	 /GsTDmAqtB5IhUPT7oLYoaOF7i5yHL4uAgFWdYCfWaEvS6JK3+9iK5op7+SasMQDRyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q7zAdbIM;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADD7606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 06:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BADD7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q7zAdbIM
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e95bd1c14cso12274815ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 22:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794032915; x=1794637715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y3fAM8CU6fD90S4RyczeRFzjWR9lUGI2XBHnFrKKF58=;
        b=q7zAdbIMkptkkFDlti+X0Wa3Z7jrU9yPPQq01Q6EArrGJ2FUruaEi2/1Hp2EAL3kxQ
         wlCSarsWFfQBdr+E/M1M2GuzcHs3bSNPxaVNvjVtR8liPd94qpR9QNhpXCPMp6f09303
         R1vvI+zoW1cfUaINREvos2TpRr/2Z7V1KU384BWTN06fRKzaHhyvoafscuu1BhDADMzV
         OpvtKi8Jp2w2059j2Y6IosLTQ/VNsRZBTzo+3IRLAl9f00RVaPEwifvmkr2GGinN7cBF
         xI+Am02u0eh/k+AL7FOB7AaXury6qLrh+eqASjK6cEYk/PrVXeZ1Hp1a2d6iB61RWoSW
         uH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794032915; x=1794637715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y3fAM8CU6fD90S4RyczeRFzjWR9lUGI2XBHnFrKKF58=;
        b=Iqy7TbLdTylOMWzry4weJMAqbw1xaYAWEPIuEmremoUeG/5JazDBvUaEqEgnNrxl9X
         0DEPF/wiE+KeyKiau80d84IkvJkWLhzitCQIEAEDCX5kT7Q7Jy4bZAoeKUVcrKq6iEJk
         oYgx/c+gCavNx6nu7s5zewrCzov+G0O7arn70eD9o6mAPTGrkp8dTcR7CB7DWCihpL+6
         oYncX6dI4XOalYPFVdQBrxK/aDR0I/vepNUau3APhy6AT/fJ7G8GVEIM5VbqFtNhVHIT
         7/b+cYvugzAMrRhaRUmU0qgPO2icnnNpKNVbJsRpnv9jV6dZokm4ujJdiOzsv52ceU4F
         lh8w==
X-Forwarded-Encrypted: i=1; AL+hErG2agOCcJhvjzOFNhn6qC3iPCmfsab5a3jkZzIi+BaSLpRgaZx5n4jITi67gxd5hUM+10jIfIxx3nrMdZc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hhx1u0dj/v0BqDzyGQyvgo92fUVzQjyeDsZX+gdoOLecBR+qB
	EWbuegFHst5S9oX4iBhXMawsSMwZWBeZ7QuM29TVVuVPPWbUaiZrvQPepT3JwQ==
X-Gm-Gg: AYBFou31GpIhR0Unty+cbkHmhAsXmyF/VHebw4LxQjC4iP5INx7rXfgRy4NTI5E5Hj5
	G6PJRZMwid9TVhfJqH/efBEEvVmWen69QhEGIK5ox+SNSuLtSO2xlJQv44wBK6CupHm4BjPuXco
	oTR2s5raKdJNNsVQ5JZ7vCMKfVwTUB4OtPDXQHAN40M2Uo1jqiLqBV46fvMTIKu4bN5cV6A+JC1
	KMKDn/z05RU9wMa8oV72S0xV8TMu7iDOgmgATSxb8nduecVvEOWwdf2NYaa22JUaqdQ8O8nvKLH
	u4ppUR22do8WyrJdXFM8suVmlUHfMXl1reJJFi0fUMqzou7RSyw0SeU/8HzGwjzVXGz7kduZY9I
	KV1Q1ISU8jK8EdAUwAA8c3oBgg3bS6Xt6JXNpLJuOf2mNf1GNLyx8uLNC37H5/AdZJGWKkDJr2J
	ooUdazLbC+iO6aT6GCcQC9qYcBAemAqw/MLNCZMtu271mdsc9WaqOGGSxBdGXl5lxk77q9tgxbz
	3uksf5tGGOrdqK17b4dhc2UUNBsi2OdF5JbMmJLw0mvXkWwQczp8t7GCtmYqfcaId8aLhkkkjN8
	jLUgZjndKblKY7kCdv506Sc2C4bApa+dYxzvlsKwReyy82w/55MYt7RPHtV/SNGgxgWX+Q==
X-Received: by 2002:a17:902:e80f:b0:2ed:3ca1:848d with SMTP id d9443c01a7336-2ed40c17e5emr56027075ad.25.1794032915018;
        Fri, 06 Nov 2026 22:28:35 -0800 (PST)
Received: from lipengfei28-ThinkStation-P368.mioffice.cn ([2408:8607:1b00:8:a1a:7bc2:20ba:a479])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47da3e33sm11176045ad.76.2026.11.06.22.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 22:28:34 -0800 (PST)
From: Li Pengfei <ljdlns1987@gmail.com>
X-Google-Original-From: Li Pengfei <lipengfei28@xiaomi.com>
To: sashiko-bot@kernel.org
Cc: rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	mark.rutland@arm.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhangbo56@xiaomi.com,
	lipengfei28@xiaomi.com
Subject: Re: [PATCH v8 3/5] tracing: Add stackmap statistics interface
Date: Sat,  7 Nov 2026 14:28:05 +0800
Message-Id: <20261107062805.3361142-1-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <sashiko-outbox-202646@kernel.org>
References: <20261107055139.3138633-1-lipengfei28@xiaomi.com> <20261107055139.3138633-4-lipengfei28@xiaomi.com> <sashiko-outbox-202646@kernel.org>
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

From: Pengfei Li <lipengfei28@xiaomi.com>

On Sat, 07 Nov 2026 06:04:59 +0000, sashiko-bot@kernel.org wrote:

> Can ftrace_stackmap_get_cookie() undercount smap->fallbacks when the
> element pool runs out during a concurrent insert?

Yes. The slot left without an element makes later lookups of that stack
take the "insert in progress" exit, so they are recorded in full but not
counted. It only happens once the pool is exhausted, when fallbacks is
already non-zero, so the counter still shows that the map is full; it
just reads low. The next version counts that case as a fallback.

Thanks,
Pengfei Li
