Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098226;
	b=oz59LXTRrURml9If9Y3HQSrlKyC2Q7FPW4YApkz7M/NPKaeTrywN5TomJSMCq24M+fIX
	 JRZ9Vx/6ZK7fzGEB5IwJQ7uQUbZCA4+Z0vUt9P3Y8DwMeQie6e3/kVXuUnRss+AZnCeYa
	 zhvAFn09xHqunmcl0HeGmHVhm5L38D+scfPY0YYrc3d90XcCLiHxXWo6zf71Vvgu6OS/L
	 KJfFj4aru6FCiomAfs0m3Q/ENcdUZOlIuYBx0wy6qGskNksx68/s3ITDik5f9kcXfS4Sb
	 /235a97V9aK3YUmY+1LFwwiYw8nc1CroYwGDMg2Y+kKB1d3hQEIB4cmtoh9mKhqJX8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=3iU/9XOoXxjGXWV87AO2U5RNEIinC/W0NIsFEdFoIIo=;
	b=LqfKExt7qY87GJBmpkGYlLP7c+4wXZnyyjDk2WfcFWbl7BesvHP959eRE98WhmlOMWZ3
	 r4hlty2uAvWBnweifROJv9r5Yltzrg92p1PVAkiWLzHD0Q1tCkPbFrnU++Mt29b+pCkcx
	 SAwZxmBMkZuBiwm/uLbyuPLjXuAmEP1a/WdGH80Mb8e4j1K4WeqFcZ6091KXK/VrrzwEA
	 5T4DrNblJ761acqaG7/nCh5Wohf9NfQqImNCgfKzZu+B+VjvCvfyC6I8m8Mk4VIUJA6Fr
	 LMD1qmiP/TTvotqjSHEbHc06qys1++skEkPOcysBgi9ubDdoTfk4R0B59J2zTp29VVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="M/yRXoaJ";
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3FE60A3821
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:50:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D3FE60A3821
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=M/yRXoaJ
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso2494246f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793098224; x=1793703024; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3iU/9XOoXxjGXWV87AO2U5RNEIinC/W0NIsFEdFoIIo=;
        b=M/yRXoaJk4sp19a63En/CBYR/onHEWEbUZlPor8Idrvj253ISHc3rjbFZqUlrrENDF
         isSCGq8+o8V6oWKbgYVkE6wnJd7+DMwJcOnzthLC2UG/y9JoNqLyr1s2hTAZcrHVYvxO
         WGPfMEgGGqZrn8VFI/4TgdsY18xVZTW7NBvZRomMEacnuK0TIdOVvHRNWCFfSFPplsBT
         KD6DiTHSmUD6WIv8OErXLQarqcrUdzndxmW9IE1fkXB/6yehi3pG9a/4KG1slgRFIrdG
         pBaO7UJLLhUmZV7KTebwfo6e+yFrZp7DqRtNDGpNzbWD6jDMHE428pgZZrTrHTeu/jEs
         E96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098224; x=1793703024;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3iU/9XOoXxjGXWV87AO2U5RNEIinC/W0NIsFEdFoIIo=;
        b=ZalCQG+teBr05MEtLrkwn6Vuz+xGlmoG1hDSHGVSSaJS5LtxaH0gWoGwGfkXXk40Jr
         dHtmESA8PcjW5kOz5QukR2qihp0jCufZLIeZnd8KTNf1RWiAqCE7q0qEo19fVaFxnuCW
         JB/yGwbgZCyoRnknuiiGFXw02HTqjDHXeUB3+ZNDIbkH5w4owwNBn6KwYyITnZV2umGs
         J5jwua4bVbftE3gtLTEsdqAQETm9/S6szxoVjKFDOFh1iOXilnqU/xxsvlPJokwccb1K
         HtSllisaKUQQxMXahUTcS7lOoPZV4qcBEoklJoPkNvQw4QW8P7tsL1olmgo6NL1mayVF
         atZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjjqVXsMjxcZ8j1TlxkJ6eAQuNPtmRXLtfnbnnpveJ7lSfIGByeDD6ZrrgSUXMZMU5qaLEJmd26Mz9nhE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvuNhXwoJIw2clNrNiZkrJ4QUOeVz96LT6/7WGzGa3VSWccXyr
	8Y8bQQ63b4GLX29VqFmT3a4U2FzDUoq2kWBuDhtd78046dq9kEQ9QrRahtAfv850SJISG1v4UAa
	yKpeuEBc=
X-Gm-Gg: AYBFou3oVC8dv6Ma2aEfqNJ2SfxSWD/PAZVzyrUwgva9gxLXLlATrmXpuw4uJN/8EmP
	6xWKmRCx20SIDbXwzvsERMceCnLBRsG6Myp96Be69Mfk+WgIzteH4nTvjVYaZfqCBONdnUYFPID
	vZScQjlL13u+DldGMKsbxfYET79eO3hBs7FU36Swnbbldu9l8gDmdOgILSJj9VRK71maJLQ3Io2
	wSukJnGu6kQEdOvdR8ZsJJG4TMB0len+74v02fo19vgWeFRUIpvJqmnRKvZsuRjbYMMMq/dA3T4
	h0pfKDnzCGkSAjjJZvfioGA5uAKc8QVGMNNpUs3RccF8m4S5RKADTSPCg0SH2SRpTe440nNLQNd
	6N3Wd2fd7bY8hC7k+FHBI865iXdM1u0zwbPfJURzdUZ5aGXFTPTPveydnVQYWSObEnRNJPMaUZ6
	odvEYkLqmXTy234JjUP7XbU228ZM+6ntmDnJEqlkAGIVjQkzHBLA4MEcEexIEVgws1iA7uqLU68
	7g6LmAb1xYTkMFDF/dkghhwcRIbP1h/Y11Pj6kEpcYsxpimVoksvFm9bFou3jM8cttloUjI6LXo
	GR66TWp59k0Ls2o6KI9jwlK5FYUuIVaWlalozLKxfs8=
X-Received: by 2002:a5d:5e8a:0:b0:48d:f56d:be56 with SMTP id ffacd0b85a97d-48e3eb7642cmr18140835f8f.13.1793098224502;
        Tue, 27 Oct 2026 03:50:24 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ebd48fasm21905009f8f.31.2026.10.27.03.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:50:23 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 05/23] gpio: mmio: Drop unused assignment of platform_device_id driver data
Date: Tue, 27 Oct 2026 11:48:42 +0100
Message-ID:  <e5b01e7aa3f39b1dc4c794340f7463531e2fc37c.1793097104.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
References: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=874; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=6ijQYwjczGie5kQc8ROmUpQycONZ/hY8dLBsJPtE8rg=; b=owGbwMvMwMXY3/A7olbonx/jabUkhqwHjXPXlj4NCK7UsL8Y3dfSbdRZOKH0ROrzOim5y9I89 3L0d7/oZDRmYWDkYpAVU2Sxb1yTaVUlF9m59t9lmEGsTCBTGLg4BWAiV0M4GNZIf+WWPKrdce2y 1MP+X5z6ak8dZ82Zk9NVtXF7rsy1126fEnmfLahiXpO8/eafYNZfH3Q3RZuv9z0fJjnr5BW+8pu fNWNPvivlPOLiz/XnZ8y5fZxuoWHpPL1yOT/25e1rnGxWqdEVElP65teWjsC9OcsXz71dNKVr5/ Z5nx7JTzHmccwzd/jBXuqYE2wbbFzg+nuF5zT9wNrSiL7djkXnBfrXXD787O++9E0sLu16IoKq3 zuKlrG9qLrJebPeW7tmcXG97vJ/3fbzPqZtb2B18fJmV7TMlfl07+CpytO5N/kO+hzR6WYv0vSR f6vlKisZ6l793VSo81b1xjffny0Rv5mbJSN0+J2h8UYdAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver explicitly sets the .driver_data member of struct
platform_device_id to zero without relying on that value. Drop this
unused assignment.

This patch doesn't modify the compiled array, only its representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-mmio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 0709ffaab4de..ec7c2b73f2f6 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -870,8 +870,7 @@ static int gpio_mmio_pdev_probe(struct platform_device *pdev)
 
 static const struct platform_device_id gpio_mmio_id_table[] = {
 	{
-		.name		= "basic-mmio-gpio",
-		.driver_data	= 0,
+		.name = "basic-mmio-gpio",
 	},
 	{ }
 };
-- 
2.56.0.rc1

