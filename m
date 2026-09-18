Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086ED3F39E4
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789701230; cv=none; b=okvbNZ7Z5ywjnee1WyUn8F3XoQXX+6d0lSK+FVJCDhH8yPnQ6cV0jH9qgbffU1xOaRVkoOohQCfGksfEfPw8e2C4YtVN4fLHWzgrpSUVOyoio2STF7eij1u4lSWlt3zXMiJwEpxArFmqsOlL/QBuUmiVWFoqg9bC9sF7R3edU58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789701230; c=relaxed/simple;
	bh=3pUyyD39CAfpY6VKEgAB8JHfqZlwYOv9LPCjxeEJFT4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NzQMmvmpT6BCsvSDvGHWzdR1uy8hM/UQP7Ps0Uih/zK7ODd057zKfijOgNqxXH0KA45g6jRb4tuR81k6lxY9ibgQQPwb9No9v+bqiMHRSdk382BwGl7CXSFxbFvKw9HbkzV8a/nX3r70BCRDFWzu3Zy8QLJzVVnhzk7s/aOEaEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=Mu1a+vCK; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="Mu1a+vCK"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso1724715e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1789701218; x=1790306018; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UB4p6nqgB9EJz4EKrWNfvZJy1eYlyCEmUs8uOozwbt8=;
        b=Mu1a+vCKr5NQT7bgRoC6SbdeJAPB+NIB58JLHjmO+iipHVB9/DsiIRBhvLlyHXXYQ9
         mUYXwJaTGIad5TO2zpb1J+Wec0FqAhEKliCNIbJEch0yVKo9ww/1JJhegG0BBWsZcELO
         Hf4XRUjRG1pIASaa8NLLJJ4hGorcnrhAEKgsHt8qd5fhPlyswncsEjrVNBqRCasHr9ld
         xT+N0kxLPeeS+ni8PbUjjkqT+HzTMZeXVUC3W4rKpVlXINrOkx7VWZfXIdjcpenc7wbh
         rxui1//v6fr4Tb3bFzmYkk630uuwaMT7ElF+WXYiXpF8eZlvf3YEkXVkVfYnvRDmfNoB
         pR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789701218; x=1790306018;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UB4p6nqgB9EJz4EKrWNfvZJy1eYlyCEmUs8uOozwbt8=;
        b=g5k6TMH2uuqpvx3tAcqkrtXz4uUIhc8+fO8rzaqx11rkER8yBmH0YFrgsg7QH7p3Bl
         KE93C1+gr3U9goWZ6m3eBUrA2KeeLWVT78sqEGlrGymg0ZTejbL+9hfAqdr++bZq7MQH
         un+z/ENKoBexoieu8u7ed0RZAkQ1YxFrRMe6tVO0tsmJgIrWp0Cez4NBVkwAUH8HwBfQ
         FbH8DsxJk7qNRWujiP0HKFjU32ZJhqRzcjDwXKKsXKjgNfQZCBK1rxAvwOHtMawcedxt
         FKScPjAT9+mIBKK00UWe6K7LNiElH5LnMaflZb6+6gEhxWcCDmwByN9rO1/NuNUZhxsU
         Ejdw==
X-Forwarded-Encrypted: i=1; AKwUvBwzoORX3R+je9aUkVHMM7Zfo7kpg/pgjUc+fkhT8B9Bzk5HA9s8VpAoWp55Ac6L761IF8q0XRqHKtXtmxo=@vger.kernel.org
X-Gm-Message-State: AFuF++ljmjFLbzxBPhMP4KKsRhc6vGQEaPXe6FXQsu4E2rCSOkdLPCjF
	ePcJVkIYIQPGhcDiJJlz3Nz2ELwvsnVBBh9iIfp4GtlkqJGjBTWWaNQdFVUhv7Zbz14=
X-Gm-Gg: AYBFou2eyRUvdQsHy+4KcdgnTZiXHg9PJXoiJQMDzUEoHFUoFrjUo6BIANqV557u9Ch
	FqELEQn54BQTfIWmmXDyWORF7l0iI0c6nG7J1739Dr9lXCgceUTbWyzJVtJQQVukpvflwRket/Q
	FXVnuuv2m3zs9SmDiYd+Ss3ynUnQdAO1k9MCiwMY5v22/aOiex0DRKWH3NFH1sS7Cr5x/BrU/du
	0Cg5CcF1pQNLDIWRV9pq5FD9vZKdS5L+DIzGwffbRaFtg/EqgBmda/Ww408BFqX/n8NMb57JoOP
	iLGXWcMcZRBqyDYvc3m0n0bgXqJBS1M4uKT79fcVArHI/SYoKXQQV4Wl+ED0BfE9FxhgyqI1y22
	O1GMhNKO7kvIDZ0zQo7ZLrW+IhBWuyZZWV4S8dj8MikNnP6vi8IaUN+tVHxbkC1rXxutjX9yI7t
	D39kTO2UveqGFKYEnfCDqdN4XO0DxBWW2srZhNxDVZrx4/VcrqBCVXGg/CFgykQB/3moH9DpWzS
	rUrzzaxdyAYYA==
X-Received: by 2002:a05:600c:5487:b0:49f:bd3c:bc1e with SMTP id 5b1f17b1804b1-49fc573a0damr10486565e9.25.1789701217944;
        Thu, 17 Sep 2026 20:13:37 -0700 (PDT)
Received: from Behemoth.triland.local ([178.135.16.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc79bdc35sm14533685e9.0.2026.09.17.20.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:13:37 -0700 (PDT)
From: Karl Asseily <karl@asseily.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Asseily <karl@asseily.com>
Subject: [PATCH v3 4/4] MAINTAINERS: add entry for the ES9039Q2M codec driver
Date: Fri, 18 Sep 2026 06:13:26 +0300
Message-Id: <20260918031326.68542-5-karl@asseily.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260918031326.68542-1-karl@asseily.com>
References: <20260918031326.68542-1-karl@asseily.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add myself as maintainer of the ES9039Q2M codec driver and its binding.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Karl Asseily <karl@asseily.com>
---

Notes:
    v2: follow the binding rename

 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 20d67cc0e7a..1095476c1d9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9699,6 +9699,13 @@ S:	Maintained
 F:	include/linux/errseq.h
 F:	lib/errseq.c
 
+ES9039Q2M AUDIO CODEC DRIVER
+M:	Karl Asseily <karl@asseily.com>
+L:	linux-sound@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/sound/esstech,es9039q2m.yaml
+F:	sound/soc/codecs/es9039q2m.c
+
 ESD CAN NETWORK DRIVERS
 M:	Stefan Mätje <stefan.maetje@esd.eu>
 R:	socketcan@esd.eu
-- 
2.34.1

