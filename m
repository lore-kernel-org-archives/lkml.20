Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822200;
	b=LIyNpUPN2RA2ueWvyeb8zE3678xu4LMXUDPoI8TUmTwqXOQQsJmyM8IOUrFKP2reelBg
	 Q0CJ6BxM5ofOh3i3DOAsTyNQJ7wfbUrFnreWvzkwYcmND4XbQ+HcsZT41E00GM/8JW4Lg
	 bG2vZc9XHe18rLpdDmpuVUMzWYFXzfqIpLDskzld6DpqKtSeIpuq/sdSVBt56WXEm6x3s
	 QqHPxKGrnEfQ7DWb7u8xwFr39qryr+C5mzvFRXnoLaHtiuwRV/UulDz2krfQw5+VMg1KL
	 RASwaFBhvziWxtiNRW+3Ai60XVIXnpAI9GMXPYAWDPBxEUSo4plOEXnDI/vhT1LZlHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6kpL4kjKXO5+zpcv/2EB9Ui2OiV7DWWpQ4VPKolISpI=;
	b=xrk6JuXvKlkEQntaKoeiDFAtVLQZcA9CQzA/0Tev2duFSVjPvqfxLHeTv1jfvZxrsLoR
	 /cLs5clXUgihK2/gsJ0NqWP9V4luXILEK35sSSnHztBQe/StEj2UBt3HDqHcYhO0yl2SA
	 qf5et/8Rl8kPKmn7uo2dzFaCNDBbEVZWJ4ZNvanluDWdqmrs16e9zcsa5S4huxaFCXzqi
	 egPsNSm2A7j+fKChM6qTNffyz1pQTy3SDjqr7igKabAlsUC9NgdsnqUQFlPWScfQMjrRT
	 rMtrfJdzPkMvc5cYCBH6FUTph61PjthZyHdv6Y+nRKeOiKNIWK7KFh7DxJ660pdvT0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=is.s.u-tokyo.ac.jp;
	spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp;
	dkim=pass header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=U6zV6xcw;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EF7609D0B6
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:56:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5EF7609D0B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=U6zV6xcw
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36dbde64409so532998eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=is.s.u-tokyo.ac.jp; s=google; t=1793822199; x=1794426999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6kpL4kjKXO5+zpcv/2EB9Ui2OiV7DWWpQ4VPKolISpI=;
        b=U6zV6xcwHj+Ax1U+kmYYDq1jY6NvN5hhUkbJvszowRriybXgXLwACwvbvkPqlDfu2b
         8GC9h+JirXzYbhj0gNfFxBPLgAgwOYxHYEHQv4Apns+QEoiHcGE9wYDoEQXe9SQRdqfZ
         3xbQWrcltPSc1dgqb2q9JPCZVJXWfu1Lz20ZZtzxDidI57lisI2a7rVlQriDzRoWlsG0
         xDp0AgA2/UZy481hsx+WW2GSTWAQe/l27LSoVypdKpy0mJHesnQOlR+9/WhtPuNcWN0m
         0uSz78X20X57tMIazycsN8widOYGBeRTYvGKbqe3W5KVjW8sfHY6UnAld+tBJchOWNcq
         PjWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793822199; x=1794426999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6kpL4kjKXO5+zpcv/2EB9Ui2OiV7DWWpQ4VPKolISpI=;
        b=PS258oI3U3YsxX+0EEHVme7e8CKz3rq0BW4TIti8mUDtLzwKzVm6fRc3VYJnJqxKge
         7DRLdXueLrQp5vSmAsJD7Ga8ZKFoFk0nYQmDXYmWxTvbLqy/7bBQTb5+QkAskOv1+/k3
         0HMZxbzCdT8+rDyZ92Li5gWvNAHjMo0dV9MG1rtdR/KYuB+9YO1KMcCL5TEqnMDReZCd
         xFuNWyuc49nZmcJgXdXaEJ6Fgg9nD3HaITHiNjNrV0XHAJhiGiUCkd0SNjSttPSLewqZ
         dh7LGMEOP5TUhh6IcBP2LGhZ4+26onLzOS3AcX11zSnTx3oQc//x/L37Lx4Dz2WrSAOr
         6rlg==
X-Forwarded-Encrypted: i=1; AKwUvBy9Tq+98ZqpKxanUSrHa/aJ2+T+GLr2zGLkwqmBzX2wD80d4fH9NwoYYrS2bGYCDUTtYCA5ReVIPoXSdg4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BHqolQuUmsuRlsOxhvtGCinmGiQV1jPiHKqWRvW+575KdgbPp
	UpwHGsZFey+4a3065LUBpVs4lYFGnwmOLZJ6yCmKcJ1pPP0u2opZP7/jL0HkfjzyVA==
X-Gm-Gg: AYBFou3a7NqnmWQ0avUCuDA4124T5PP9HklntEqhtSgIGVP25WmmktYhpIDc83I6/Tt
	Skd/IcsnKMx5i+tbRjD2avjKeHONkNc4MLPlxjOMUJ2jO94TDLJpbLQib07AmaCG+jjzmIxnFfh
	zBWxy61KHoapdM1OzacEYeaZAES3yxuLthgeWCLtPkttSeUGKD4E5zzIgJ1Ttno/q6iNzJGOGyK
	cuO+fIHdQ74K9Lx7lEf4NnK+AxMxDd7ZQEnoIjmywdHYrQD1sG0K4PqAoGiVXpLPXRlIVigoNKH
	OYXHSyI87UGdjuYBq2enCdJrztAn7imlZVVlNjUUfBxtUgUYBTt23O/C2lWpwYtxUPj3I05f5zd
	pf9vcjkDK+0T/ct9dCrZviW5a7SE2w+R+fYnLSt8WHfqPiFdlKlATRdWNRz3DlbkqwTRmlOLzcQ
	t+U/s6SfXasw8PKr+8pal5P9vT7kIIM+XDt+W/ab2c/7CWTTcAut0APWl3AEPN222t7HQnp6Mxu
	fok3KH8IT/PBEQOdnvVrphLT4iTpB+I+A0x33GBN6o73Kau04yVsGyu+lCdQ+h9OhioRlkaM0Yw
	UjJKD9jmmFk2QgOO01470kdUxkp+VJsXxkGidw==
X-Received: by 2002:a05:7300:e9cd:10b0:36a:ac68:c745 with SMTP id 5a478bee46e88-36aac68c84amr10067389eec.25.1793822198657;
        Wed, 04 Nov 2026 11:56:38 -0800 (PST)
Received: from wang0.localdomain ([133.11.33.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38f53a6sm8941712eec.15.2026.11.04.11.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:56:38 -0800 (PST)
From: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>,
	Viresh Kumar <vireshk@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>,
	linux-gpio@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Takahiro Shinagawa <shina@is.s.u-tokyo.ac.jp>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] gpio: virtio: compute the line names size in a size_t
Date: Thu,  5 Nov 2026 04:56:32 +0900
Message-ID: <20261104195632.1702765-2-lian@is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104195632.1702765-1-lian@is.s.u-tokyo.ac.jp>
References: <20261104195632.1702765-1-lian@is.s.u-tokyo.ac.jp>
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

virtio_gpio_get_names() computes the size of the GET_LINE_NAMES response
as sizeof(*res) + gpio_names_size in an int, where gpio_names_size is a
u32 from the config space. A gpio_names_size of 0xffffffff makes the
size 0, devm_kzalloc() returns ZERO_SIZE_PTR, and reading the status
byte of the response through it oopses:

  Oops: general protection fault, probably for non-canonical address 0xdffffc0000000002: 0000 [#1] SMP KASAN PTI
  KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
  RIP: 0010:_virtio_gpio_req+0x2b8/0x550
  Call Trace:
   virtio_gpio_probe+0xc2a/0xfc0
   virtio_dev_probe+0xa7a/0xc50

Compute the size with struct_size() into a size_t.

This patch is assisted by Claude Opus 5.5.

Fixes: 3a29355a22c0 ("gpio: Add virtio-gpio driver")
Cc: stable@vger.kernel.org
Signed-off-by: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
---
 drivers/gpio/gpio-virtio.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
index 32326d91f33d6..fb7b40eff37dd 100644
--- a/drivers/gpio/gpio-virtio.c
+++ b/drivers/gpio/gpio-virtio.c
@@ -494,12 +494,13 @@ static const char **virtio_gpio_get_names(struct virtio_gpio *vgpio,
 	struct device *dev = &vgpio->vdev->dev;
 	u8 *gpio_names, *str;
 	const char **names;
-	int i, ret, len;
+	size_t len;
+	int i, ret;
 
 	if (!gpio_names_size)
 		return NULL;
 
-	len = sizeof(*res) + gpio_names_size;
+	len = struct_size(res, value, gpio_names_size);
 	res = devm_kzalloc(dev, len, GFP_KERNEL);
 	if (!res)
 		return NULL;
-- 
2.56.0

