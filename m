Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347778;
	b=SP5WD2lYbnKfuZV2ljojiaCq/t3twXSdc5SVw5Puhhuzqf8goSWl4qPIaJV9rhjsIWzg
	 PmwReB0n7cJvKTbxLoHoKF+Xr8ZBWSgSWxmLVM54YnIxamxN9eAhUKKwrRp7XR5tRe/A3
	 uYG46yX0ZuS24aV1ds2v6ELJ4XH3IA5GCaZMzed5F83qBKiBMG1X0loNfK60/yZEvv+B0
	 mH7x6419JwAld48RttgiAq8zKipglPXpy/olnvf1KsN11I+MuF4VHhf3QYALVMosp0qV7
	 SXb5F6ahxDOhsw6ASFyv3bOML6WR62/NzYsGQy13dSftxcy/c6dgj8ouVva/sh4X+4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347778;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=STzANkY8nyx56+Y1zhCFIdRacjYJ7BNxETioSLE/rRQ=;
	b=EBAP/BrjM1vqVp4LDKES7HK9QGno+7pwkEYXacHLeLlyUEKS/xBoq1ix0dOR2qDWl9W/
	 5QmtTOdrbr5NxFZBWTcbKSRfJQbIxoY4usXlCqyFHPmCnZfuwGOENlVcpXmHFloyP48d3
	 6dOjX62J36AysWXSenUnTI9yypY0bYZktku4UmkXLAbFSorPDEXMpA45ITLKjCmv6+7T8
	 kmzonoGSpn7iq/FDt0IQhvw90J9/Koy3foXzYukqBNTC1Hv9uM57sfJfFBwxUYTKLyatU
	 Lhc1lHxCdqo1NYjTBgRx7N0QULRR5OczfoZMbkvjRk+Kl9oF0X/DyOWG3lgBmKKwSVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=H9sgZUYM;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965C160A3838
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 965C160A3838
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=H9sgZUYM
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-49412eb1474so1623882f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794347776; x=1794952576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=STzANkY8nyx56+Y1zhCFIdRacjYJ7BNxETioSLE/rRQ=;
        b=H9sgZUYMMFl9qYt5bGykTDy/gB9eIi1UZBgr5f5xMQ/farjkOwzud30mmjLmF2Pz35
         L6FJcKgAUo7HGdHMm1CrQZenT7991fJKVlhaexlLgrZ9zcBvwVOzQxTBDFJ1pBVckmAd
         hz5MGGTH4kt6IDZZqxLUuHywk8ol0lw0aB+48BfBOZwNho2C7Y2F9uXvv0rslFIj1ORU
         ddWEquM6L1CTLBmG7mc7sQ0jivBeKdyGuMszbKGVF5sTXhattHURv5ZLeBHNxLE5+aPu
         QKKrDRLEmFvaUASdbnyxs+jD/cUWUac/xKwWTw9E1p+VY/paJu9SiyhoOeJJXhitlf4J
         CBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347776; x=1794952576;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=STzANkY8nyx56+Y1zhCFIdRacjYJ7BNxETioSLE/rRQ=;
        b=z2vq/mNthwD1NwmNDY34JxkJ4UcgCwMgIEFTCQqf38bbe7dlneE2FYymTCsNQlxqzw
         jPYvaB0o3vmNIwGsh3/GeMB1D+0MWneCLsduzSrRlJTefn/r5eONm/nOXDS78JRKGoe0
         EGtmsxiMXe8uJ7uUXgXchjdYDMdLV/aSIhuFdzweRfkzumux/+yI8ih+2L432c6k99Bd
         ZpSvShxOZI1CTIIcyLuBiZrWbromkL+J77t5aComWmuIIVPi9e/t4oFYZDLGU0FhNL5c
         s8laE9kQVP5/po02be0/0wTfOHkdv06nP9wrtdsdDFSWyMLxQcGZ7m80Zc9yD/N2I2FW
         N1rw==
X-Forwarded-Encrypted: i=1; AL+hErHsnOyS+KXTV1rjFmndihfCQ9aZGsksYKnyDnqpHxJUN2YHVriIi5ctHFrrvcveqdyHqID3trZe17vcUXI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2EEh0LWqYI53y4NXlMFQhiEPIejSUZAwGH80PMLvDF/9zO1zs
	hVTfti6b4BqbcCo9fg+KN2KpVM9SNN55PXYSZtVI+6w1tpDsFtg+fHQ86MxspNNSKxwCOrofvDP
	ySjkG1DQ=
X-Gm-Gg: AYBFou2GxS8nng9D8KrxgKDnJiyuuotPy8AJvAzkcLVOBaGjV08ADTrS4nir4YO0oVt
	O7u3SlfuazfIx1vhnPtd4kaveGDGdD25E4UdSOWOorlGRi+1miUWgEfgY7nHud71Dmt8Tbh3M70
	uAQSyGU7mRa2K3f0C2sEF0WqDQEBfhA0HZrpVsJ37eNhZlkfv6/Y4SAj7z8FIZawRH+5EYXlHao
	eyM3dpfyWq+4zbHHBozkKwRfTo2qwa/hXO78Ry2UIAxobBCjCptVksRXO1pvXswdLVHQFKK/Ejl
	2pYT89PYrg1j2jQKL1HkmS/B98Ou+GC/I158OYnM6T5PNRcrpk26ncnSn+y9mnQL+PycPWluJke
	M6KH8nt5gVxLjqTt5c9k5x3KJNHN3aaXvGF8/Qd/2V8aZ4PNCldF6s2XZEPh2AZ2BfJFM44ITjY
	F3nA193+xWu9zm4/P+k/M1ONuLVng8M1X95nRvIsEp6M4gGx/u8CHPVJmbVZ5jqryexE4pKONld
	G7Q02fjhcyIfGIQq4GUPP3QMjLSQWyspfdvfBxLDvPctRpLv10ztngQxfiGf5HqiNQYaJPZOVFK
	sio83HrE0rpjYiU+S6iHFdxigbffn6cymbPFISzlHp/rL6OcPOSZ0vg=
X-Received: by 2002:a05:600c:3e87:b0:4b7:6a8b:9df2 with SMTP id 5b1f17b1804b1-4ba0936f37bmr5727395e9.25.1794347776190;
        Tue, 10 Nov 2026 13:56:16 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba01fdac9csm136881265e9.0.2026.11.10.13.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:56:14 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v4 11/20] mfd: intel-m10-bmc-pmci: Use named initializers for dfl_device_id array
Date: Tue, 10 Nov 2026 22:54:36 +0100
Message-ID:  <d8c4d54e73f0faf117b21c740b7145060ebd1549.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1289; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=40u3a+wWHwFBZ+Zs617rF+y97u+IzuxtZReM2gRtgpY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq85K733gLt6jT8hSJPuipPCXhqpEwDEQA6oNBl jJyfqhiuX6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavOSuwAKCRCPgPtYfRL+ Tnn5CACoJWIgVzcRqkgZcTr/Yt2EIkCzgbzZ1hnzkSfFO3KdoLCkaR94C5XTPKw89baz7d0Utjc 7iM4iu9HHO8/bJPM68/twcdxUQTQjen6Jj90fVQUH5MGDKu/VbH9gYpt+NICypdKQbT14x4v6PF rJ7oeVbVj97owsOQRb06aU5CD+4RrRJA9aWev2E5MT3m9nVtNTLMPfh2/5oL7x3jKs1XCHzHz6r TFnq0QGbilrxUWTSdBhBgJqjyRX7w7fXLVN3mjez1HQ3e1sDsVAia1LmWeLpRMRlo6hB2Dvz7w6 JrzWEpwBq3NTYfRF6o/5iper4wDN9C+u7zwJa9tp4bSASB5z
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
dfl_device_id that replaces .driver_data by an anonymous union.

This patch doesn't modify the compiled array, only its representation
in source form benefits.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/intel-m10-bmc-pmci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/intel-m10-bmc-pmci.c b/drivers/mfd/intel-m10-bmc-pmci.c
index d213c6ec04ba..f78309bbabfd 100644
--- a/drivers/mfd/intel-m10-bmc-pmci.c
+++ b/drivers/mfd/intel-m10-bmc-pmci.c
@@ -434,7 +434,7 @@ static void m10bmc_pmci_remove(struct dfl_device *ddev)
 #define FME_FEATURE_ID_M10BMC_PMCI	0x12
 
 static const struct dfl_device_id m10bmc_pmci_ids[] = {
-	{ FME_ID, FME_FEATURE_ID_M10BMC_PMCI },
+	{ .type = FME_ID, .feature_id = FME_FEATURE_ID_M10BMC_PMCI },
 	{ }
 };
 MODULE_DEVICE_TABLE(dfl, m10bmc_pmci_ids);
-- 
2.56.0.rc1

