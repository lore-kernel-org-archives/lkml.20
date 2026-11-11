Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386111;
	b=oZSanFaA+pbqOSsMVt+2wQTj2KIBfwahRzUQFHLQvVW7ny70ulQP4KVmJ6ijhickw+oR
	 dfDMBI+WgglwgcmvLb74m+DhI0bT9PLqVuxQKe2ScrXzMxVY2q59FSoJa4hv2AINL6dzg
	 zmDpgnu0luLMi9LE327eqAEb3HTbzMOP7p69Dc/CdSDp/uFfg+iEJywAns8RhAiykSUD5
	 EXnjAuPMmfQwYCrhdm8c3Q/Gf4lmzPWUNp3luDKJ7rhbf9W6I/xtbPny4wFbdwta56au/
	 yOarRJO9mYd1wLsIjX1q77B09sWwQNrRi7ymhUktRp0vQVkGU3eSzchhtXxEywctqoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=sSx1r6YADSLNod2etVKoZeGoyw4STJkD6JZ9QURsIZg=;
	b=ms02gG7FvEcjUa9Jgg2mGTNapJhTleXoLfq9girw61Xnfuv2CWy5r7AYorx0sDsE5Vbp
	 puOJ/MjgUy4uuiuOSbToL9bed2TihQFN3g3nlfCMLWWPdxKRlfb91nrcTVxVjem72EP9f
	 aWdk0ZNkcSu2SxxhzmhYRrq0y6mfOyh370cLM+TRiUqhm6V6lLPYiXBOSNf/fJ3voWOxW
	 tFvBdyhsdUA8y7w+dbPjV9s7FBIS81q4fkORwKOZHJiDXVlVXeR/a7C+aU6rvldV9JJxU
	 1Q6UtOtgE+TQhZZ7LeNNqbhYeaH3Ad6MkFYXzmOcMO4uh1R9rSImlbGXSHx4hBeCyYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linbit.com;
	spf=pass smtp.mailfrom=linbit.com;
	dkim=pass header.d=linbit.com header.i=@linbit.com header.a=rsa-sha256 header.s=google header.b=CNY0UGY3;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE8A606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:35:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CE8A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit.com header.i=@linbit.com header.a=rsa-sha256 header.s=google header.b=CNY0UGY3
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so1925466f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit.com; s=google; t=1794386108; x=1794990908; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sSx1r6YADSLNod2etVKoZeGoyw4STJkD6JZ9QURsIZg=;
        b=CNY0UGY3JRglswd07ZR9yUlhfd6OS9ERgZHYqKmGeAKBh88Ya4ND0QgAMYg7CKm3hj
         g3n3tCczndcFCr0g5MO7TRSKXJX7zBkXydsA1pcFf0bX0WX4wb1rS7KYIhBTC6wXx+n3
         J9575TilovYVqDp8ecz7Vmt6nHh10/dFxuYdAYzDy1VCd3C+RJ/FT10RmiHEpYQVPVL2
         6romSk0CaluUQyLNSRrBLgqy7rmyrF2Rb97nppmave/fiEBO1Ulvb8Jxd6RJDx96TlSN
         lEGSDew+YIS/a3hl3MhqyvxBKCuo1RfboigthRFXZsHFrWNhcilbOCEWOWx0O3l6S+Oq
         5y8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794386108; x=1794990908;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sSx1r6YADSLNod2etVKoZeGoyw4STJkD6JZ9QURsIZg=;
        b=CQuaxCZOTBuAp0B/0SQdKyOI9xigR0kXNlRtlgNaWusLJpCviNZqoG29EgMkBIBr2/
         AmecApYqmC1+Hz88bcGBIMGtvwfwg4NmTkM18votr+uIL2OSa2JPpE2i1Y7e4RkOrPJ2
         XxxsQrdrrIBeuKWpdW3swC43D0E8uwZT3ovntKaF5zrGcMHnRGJogc16ZopUO/52LWgj
         QZ4b1HcJ7WRoOIp4YNcvXJTd/DN/4tWZFEGj4rYEFb6TAW/+IrSPCewUir+2u5jte1Xg
         uW92BImvQ+8/T344Ch+F6QNnLhxws4LZK/vRab8+JRSoYCYuJLaImrC1PdKtKgOIQISP
         OiXg==
X-Forwarded-Encrypted: i=1; AL+hErEaBFFDSuAng57jaPbzWCKDIk8+SGHrVSh9DrVTcsMZxY4J7YbhB9LXtplXc54p3GuD1VIeUv+0gFTyvpU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4pbYAshekpPYTM9WvT79L7hCc88Dg/YXIX5t9vrtDxSqiIxjB
	mNgMpXGf2uKgoBAhbdy4MLaR+EfyPZstq7fi8AZ/efnvR8aIbhbmGMtgErM0Olvmhcw=
X-Gm-Gg: AYBFou3RswgfGr6WMPMFiLqdM5rb5zb+WGyHitik2rejewaZWjXguqCfMT5vN8nyso6
	HNwHGDRRJifZKZAIXO1fulZAB6SO/4KZwraJkr4G1Jyxx/pteIqtcI893nYop4WaFoVMi71UfG1
	4Fblxc4DdeL9oJXcbf3If3SYFg/CrD7+XealTiU1c7kZuSsuvfeYlWPvRv2wh3bAuJhJRtTry3Z
	YsT0Nu1exXyhZcdyZyO/GPQGO8OoUrD/k7EtOsko+npLdzya8toi7xk6Ut/7xHYCsnaI2zDJIus
	IgMS7pzVUBBaiN27lznl78HvM1A5dw5c55+g/r62Zs4jyCBkNNEd17C+8JBVojZInxsnVitWG1p
	E47OfdGrlzSeE3UJK0NvWPl1OnbYxjX3OEfo9k4mVSyc51cektczT7euSq2THBwVn2BIj15Sr/Z
	DgfdAFPgtxnlnyvRfxtRLYxbzc1YSeI0rdXx9PlZgFCxMqlcsVDyxsC0dgyKUgdpAMhXZE0eSzy
	ubcuzmeQD49bwL/zRn+l/PEq7sQQpdpkNCwfMYgFL/g1BORaFnki7LsOL9HtPUXixzl0NYOBce4
	P79AxvFrEnX9t67kSVpdp/81xTX0UzHhQV+Hrqv3j5xiurohQhgeo8wM+8EydmzNfzJGQOU4MQ=
	=
X-Received: by 2002:a05:600d:82e5:b0:4a1:faa1:3813 with SMTP id 5b1f17b1804b1-4ba0939c32dmr32175315e9.27.1794386108056;
        Wed, 11 Nov 2026 00:35:08 -0800 (PST)
Received: from linbit.com (h082218129081.host.wavenet.at. [82.218.129.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835c37bdfsm9689492f8f.22.2026.11.11.00.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:35:07 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: drbd-dev@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Subject: [PATCH] drbd: select CRYPTO and CRYPTO_HASH
Date: Wed, 11 Nov 2026 09:35:05 +0100
Message-ID: <20261111083505.3998706-1-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.56.0
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
Content-Transfer-Encoding: 8bit

DRBD uses the shash API for the data integrity, online verify and
checksum-based resync algorithms and for peer authentication, but
BLK_DEV_DRBD does not select the crypto core. With CRYPTO=n, a kernel
with DRBD built in does not link:

  ld: drbd_sender.c:(.text+0x137f): undefined reference to `crypto_shash_finup'
  ld: drbd_receiver.c:(.text+0x58f): undefined reference to `crypto_alloc_shash'

Select CRYPTO and CRYPTO_HASH.

Fixes: b411b3637fa7 ("The DRBD driver")
Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/block/drbd/Kconfig b/drivers/block/drbd/Kconfig
index 495a72da04c6..d707187d2cec 100644
--- a/drivers/block/drbd/Kconfig
+++ b/drivers/block/drbd/Kconfig
@@ -11,6 +11,8 @@ config BLK_DEV_DRBD
 	depends on PROC_FS && INET
 	select LRU_CACHE
 	select CRC32
+	select CRYPTO
+	select CRYPTO_HASH
 	help
 
 	  NOTE: In order to authenticate connections you have to select

base-commit: aa7014f8d7565cfea117eac36a5de0a05eba65a4
-- 
2.56.0

