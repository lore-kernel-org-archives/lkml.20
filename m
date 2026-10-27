Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117321;
	b=dYbE3Z4WwlKp6BGB3Q93B+bM9fcp1klfYm+lSEV/7BUBC9V+ESmNp1MH6zOwLUQiDNiD
	 238d7mtMt9UoaNaWcpWXHFtavWY+xM7VKIUycTUygj+DoZjkOoLYP09wZy/j2QKjKIBFo
	 X5ZAePaNcGmGEgczFCEVsqhEovSh72Wx3bjp6zhiLPB+7LFINqH2itLow1gmT7Fz9HyRG
	 Z5NoVns/SGubI1I5bzwoaWBtj7RTksw7XgEFeh+wDJtjgWS2ReulBABENsbnmAYG/ALJH
	 CAAfuVVWGZwnspkWJIoqUG2Iv6dcAAvOoyl+kBHaq+28c9o0En6k5cQeSkqX3WS7ztw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=meYMluchLM94txKJXWt+qZDyf5+PbHP4r+z7ZzwQ43Q=;
	b=heqf0kbD86LXultlRvIzuE85PB5GrxH0eb2shUhoXWgEgZS4jPwIDBDTGZ+zerD+ullI
	 uwrjcKk+emne+TqABk6Vz66PjwmCUIS0K/HKQi7VEM2wYtO+pT+KwrMBBwmbt10r8dAcx
	 DS5UySgNN+ekf7vRs28WYU+jHdYJx9U6/bXEZ5+Su7lZ7xfWj/EQPZ7H55M06TgvSWsHe
	 Vt7QOluPMXCED6VyHWF2efQTeFGr9RAM5XbOacqj2CopZEmLKHwQ5c+N23S01f7vwFkFP
	 A8qvmWkQfcNxWgwCMM6T3HwphpjyGKrZNfX+2VSTqRuFMziiKgl9wWAzJJWSxHEoDlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SjUyCblg;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847A5606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 847A5606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SjUyCblg
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-14fc585291cso2387494c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793117321; x=1793722121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=meYMluchLM94txKJXWt+qZDyf5+PbHP4r+z7ZzwQ43Q=;
        b=SjUyCblgG/1Djb+mwOz6qpkcGEHvUZm761hbIBVwebRU2BtXt9bKxMPzQ431rjzBKU
         UPOpNNSq9qUS/tJ+CxoWTR9MJh/Dw91pQUYIBCvInoxzmhdX5JTLhh1TiWF8ho5m+t9g
         gI7iPBg/PZc9ErLuq4YX9Q/jtjxWfTy6X/Wms8ar8hU3bo41YqtTZISuqAE0eTbQBuhd
         5rl9v4ndVonZRYWAf9qtnDOAjbvOSecQFkUWIJTyuTQRuV0dFtklfZ+Ts8wV25CAJ2LF
         9F25CDdP4REWEOnXLLVQzYQLQXuQJwILPjIXMhFTIAWbH9GB3ezf7pAsz+cQ0xgPdMCD
         kK8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793117321; x=1793722121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=meYMluchLM94txKJXWt+qZDyf5+PbHP4r+z7ZzwQ43Q=;
        b=RRXpIOMMMV/1uAwKHhjp3OZ7uC5VGhSqUBfhfxDGsi9Nmw2PdNQhzyZgANEpzkqPgu
         a1O1ddl/rWRH674hxI3q3+Ttw0pQ555ZtGlfSBOiOB9oSsNjyW52ONIgBawWum37Vukz
         v1CBXp3Eku+3FcGIl5W45kP4PaI3D/8GwkMuEq2Cq1gRGcQpcctJf+Pjnniu1Z3MGl9R
         JpSqAZ/nS2eQsmoEEX2hVOptpl1yX6inXgADLZFmZLGcCiR+PttApIlPPHUnDuDp0dG8
         W6Z43Q9FGnVxkivCaqfDXwbNmLblAWz+veKVUxbINIycKsOw+rtXchhmewQj6h9T5UaZ
         gVhw==
X-Forwarded-Encrypted: i=1; AKwUvBxbkY95eiK69A0+M5xLDeb/kjhl4AxliSpek6Q0BgCCe0XhuYL1VphjD9gfNWZn/mk/k+hC13a64UQOchk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJF9B4HOKq1E02Oy+gEk6A/4R3oUJNKN8DCayspAeNr0QY2Oo+L
	rp+kWgay8n6GJiG7wt6O5Y/QWEyIg/7AAJxrCIWIjqhN9uXu1w6ANd3Y
X-Gm-Gg: AYBFou1V1lIX4NHD+nqPlouD6nQgtJKmeDHZ0Ob00G69O57TTnx2H6xU8xRkOIemy4A
	0LKNSvb9FCuUTt61BiZtZZtpZvaJ9Oxr9Zy5K7Do5latBtBi4NzAUaWVmyUZwVzZSxeQYBYq2Hr
	i0jp2wdkdUM1+2bUv9Q9pnDZRT77cqxvcYXcvD/myiH1sBPPuSMRj1dOswEvqUUxGjBV0jm7WXK
	bFKTAQCQvpOc1f0j0aYvRLxaKdCX+oB0u8Fmw9zuDnHy5fCJ2H/4x1dsN1pMJlUTsAdzEfBJIVO
	eQpgmN9F649ykN/EMrCC4m/dpQxXg4ukD4Mlqhg756zvX4Hv8d6GYvgRskWL7GHF/Sbq+ZPVYAn
	6I7Lgm7YQ8l6DHZ47VmfzLGCAOliES4JSmxb6dkJP8KR3I1LTopbcEeZ+kkwIQMz4feGZbhw3jQ
	xfvMN/PuA4JAqaungFmQAIRSlpgW27uTaIHzGxdIJ6pU7BRWFYmT5rWpmulZwCaXPeamDfm1RIY
	UOpVghJfwmpZ/rUpYx9NaC3MCbPWV9lfDeA4uFIMDnio3C6WQ8OmbqWXo3oSxZMc6wp/02/q84c
	C/HlYcIz/r+rCDvn/tlPsjdzJg==
X-Received: by 2002:a05:701b:230e:b0:1a0:b650:5c93 with SMTP id a92af1059eb24-1a0b6505d9dmr7245819c88.41.1793117320361;
        Tue, 27 Oct 2026 09:08:40 -0700 (PDT)
Received: from NithishVelan.localdomain ([152.57.85.197])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0e8d700sm40053759c88.10.2026.10.27.09.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 09:08:39 -0700 (PDT)
From: Nithishvelan M <mnithishvelan@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nuno Sa <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nithishvelan M <mnithishvelan@gmail.com>
Subject: [PATCH] staging: iio: impedance-analyzer: ad5933: use devm_mutex_init()
Date: Tue, 27 Oct 2026 16:08:29 +0000
Message-ID: <20261027160829.1731-1-mnithishvelan@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Replace mutex_init() with devm_mutex_init() in ad5933_probe() and
check its return value. The driver already uses devm_* helpers for its
other resources and has no remove() callback, so this ensures the
mutex is destroyed automatically on teardown when mutex debugging is
enabled.

No functional change intended. Compile-tested only.

Signed-off-by: Nithishvelan M <mnithishvelan@gmail.com>
---
 drivers/staging/iio/impedance-analyzer/ad5933.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/staging/iio/impedance-analyzer/ad5933.c
index c05a5f4b4..51d73c5ab 100644
--- a/drivers/staging/iio/impedance-analyzer/ad5933.c
+++ b/drivers/staging/iio/impedance-analyzer/ad5933.c
@@ -672,7 +672,9 @@ static int ad5933_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, indio_dev);
 	st->client = client;
 
-	mutex_init(&st->lock);
+	ret = devm_mutex_init(&client->dev, &st->lock);
+	if (ret)
+		return ret;
 
 	ret = devm_regulator_get_enable_read_voltage(&client->dev, "vdd");
 	if (ret < 0)
-- 
2.53.0

