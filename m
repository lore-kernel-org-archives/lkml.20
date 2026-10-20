Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792517174;
	b=XzjURsYPWojgb3A+6E1g0gtHeP1/o/p8HoS8O6y3MxccWi3tkrGbORwYQYTkXt1U/iD+
	 0CMCoJVTmRNWuXn5m9UFzfU6ZRDsR947ZmPL6EdpiHHoDrSTNb9IAx+TuHjn6csiLeIFw
	 OkWOzBkcVYCBbm4Rf/9t+xFTktfaCVs/K24BbF4HXf3jbkkJC9YaBkrF1pK7PsWU0+muv
	 K+KOtJK0RoueiYpTiqpkbn09T2EM9jjyl/FHpABh3m6y9u/LhiV9z/JbPiA8qn1XJNj96
	 ByW4D1I0iaxLlGGu/3PgNMHLWUuN88EsmB/QU2W+JZoeCPYQoIjDWO7d/sCv8gy0Wbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792517174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UCrWbctlSHop+9cZ1ZCw41LJBn4yifLcSO91GaqF4lo=;
	b=tZk2rkNIXWxX5w/TthYCXiNeCLGZhsrY0QhQ2HXAB+FVbV2e6Yq0ReGK75zSv2EhBr1L
	 y+cxZBDjCsSnpWOkPBerzjnEHoPYMpqilXPIJZkHWUjsWCyNdYRsCePhm3/c9o0+9psdv
	 NY5X/WexQKs6z9p9Io5iShZ7tCEVTwwaOH+WqV/qdbzd0QShDlW9oAev8aXm1txtBV3uX
	 KTkod9h+89FzFSU7xVP1pO3suo7gImhkRwCQBwDzRtbleaXNkUKWaR9eZEhGWHiTKd32D
	 VZ0FTzsGeXRxSWKFe8FUOkq3VSDsybeyaqkYFCPqE/XZ43cKqsK+Y4pMnDoRfWq4Y3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="LFOl6I7/";
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A472606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:26:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A472606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LFOl6I7/
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ab9268d90eso2055722a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792517174; x=1793121974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UCrWbctlSHop+9cZ1ZCw41LJBn4yifLcSO91GaqF4lo=;
        b=LFOl6I7/+pBvIX7W7Bkhrq2rw3YeWsXAFjTrVLuAIfGlRxftiAitCngGsjR6pFPkrX
         kbJmvwVWR9Rc+M2PTyBI0wRiUJG1pWjp3IBeL1Dv/breLKsmjZlcIVCAOj2tLIWXOkih
         oYOK8UlPW3OK/EfaF5/DyBadM9fY/MU1kTsN3JqxKXZuEzUMCU7MER+1nOLa40P6jZB8
         ZOeehPHogzEgmtpHCmf9mZJ9nUtWGB/5unXHX+kZkM5gqU7RFiBpjI7EeOWjdsTXWGNS
         AQaKm67Me/rJ8wPokZXkmzuM4bFgdlG+2CUriu2DKLYkW46vkkbrWX8lliLTN67ecEeM
         fDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792517174; x=1793121974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UCrWbctlSHop+9cZ1ZCw41LJBn4yifLcSO91GaqF4lo=;
        b=NLwOqs9Udd2g5eYIl0YekKVQuA9JgvSBoyu5ulOSuofUgGGmArOVUPGXBokOPmrfZN
         pcMEDzyFfve134HRz5QUbuhNsqCzi6X7173AMN/SaFsgkJ+zCKovD3hAwGT9c/39Kk27
         1RMMDQSWC36Dus8QEBAvdUNjZ+Bq9IbYADp2dGrk0NjDbND8Ihsxgw0NSMPqoXcgLHJe
         m0OZU112HqEGNQgtZKPail0m6/qKq7l9Wl1ExS1ZHpS8e4k0vKJrUuUSzl2x8LxFA6dg
         C/sj4Olf+rRk5xMZErH+2i+BtxtoN5E3fNVGPXzqT/Ex/QjqbNJYl12LfpMtRM6MXwTm
         xl6g==
X-Forwarded-Encrypted: i=1; AKwUvBzhjdwISsm4o65mgxZc7rA0SuOMu9cAM/7PEsHRAhmWmovVO2tKr5xd970alzSPT1LRZCR4d6exoJx8+hc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKr/NFdIEHm5r9Y545Wi2Cn6Y8TQ0A0NYuALXiXk9zh3eWC+MDB
	wLvozy7fX/1cLFkrzJQqYUZgQICgPh6jR15d/i1enRN7dK6xSW72VP+7
X-Gm-Gg: AYBFou1vWGRKPYKyXZ3rCs5TUA2kVb/5k8mxz0ySBM4cfaPszObiuVhn1R5t2zOIHdc
	oWM1YAezW8QAtBonvxNwOBssAiSiUpg5kuhGK2wD2o6Y1aiYWbNfGIKpFvgZ//IEQ3wCoWV9kS3
	fKpjqvS3fffQHrooSjpsAj/Ez3sNS/00E//XiKf2y+bDp6Pb4qX0VK1OvEzEu0uqO0PdUqdycFr
	i5dji0FhbF25NUGKD3w6b1bDx+MH+/QVvZnQ88wHudsHQSU1H35I22M/ycEe/F6KjAnMaEdM9AK
	3DmgvMRfxdUSUR89lhpVgP+JNY8pGpnhp3GLwpsYhSCEi6tJlkiDlHL/1+xf/JTqHR2x5573Nq7
	BQ2IBynbQzJdMLJxlAc3opeZff4jB725WOlAcB02fWKPtvqCC/3Nrn14/KJPd/jTF2IIOB3CyqY
	LfAupaaLH6NmzfQVVz268QYWeMQmFXGqNJSt3Terq5PkyZzw+huwULMXjMGzTbkh9MYRzPW260U
	j831p1qZUyQdVA=
X-Received: by 2002:a17:90b:2b47:b0:3ab:c370:3684 with SMTP id 98e67ed59e1d1-3aceed9feb8mr9538989a91.30.1792517173733;
        Tue, 20 Oct 2026 10:26:13 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad80cbe295sm326600a91.5.2026.10.20.10.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:26:12 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: linusw@kernel.org,
	brgl@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pocj8ur4in@gmail.com
Subject: [PATCH] gpiolib: Propagate emulated drive errors when setting arrays
Date: Wed, 21 Oct 2026 02:26:01 +0900
Message-ID: <20261020172601.221861-1-pocj8ur4in@gmail.com>
X-Mailer: git-send-email 2.55.0
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

gpiod_set_array_value_complex() ignores errors from the open-drain and
open-source emulation helpers. If a direction change fails,
GPIO_V2_LINE_SET_VALUES_IOCTL still reports success, including when
updating a single line.

Return the first emulation error after freeing the temporary bitmaps.
Keep updates already made to earlier lines and stop processing the
remaining lines, as for errors from gpiochip_set_multiple().

Fixes: 8ce258f62f90 ("gpiolib: make value setters have return values")
Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
Tested under ARM64 QEMU through GPIO v2 ioctls and libgpiod with a test
GPIO provider. After a successful line request, an emulated direction
change failure is reported as success before the fix and as an error with
the fix. Tests cover single-line writes, both emulated drive modes,
active-low, mixed arrays, retries and partial updates. No physical GPIO
controller was tested.
 drivers/gpio/gpiolib.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 1438f97d0634..9decee5a95c7 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3945,9 +3945,13 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 			 * open drain and open source outputs are set individually
 			 */
 			if (test_bit(GPIOD_FLAG_OPEN_DRAIN, &desc->flags) && !raw) {
-				gpio_set_open_drain_value_commit(desc, value);
+				ret = gpio_set_open_drain_value_commit(desc, value);
+				if (ret)
+					goto cleanup_bitmap;
 			} else if (test_bit(GPIOD_FLAG_OPEN_SOURCE, &desc->flags) && !raw) {
-				gpio_set_open_source_value_commit(desc, value);
+				ret = gpio_set_open_source_value_commit(desc, value);
+				if (ret)
+					goto cleanup_bitmap;
 			} else {
 				__set_bit(hwgpio, mask);
 				__assign_bit(hwgpio, bits, value);

base-commit: a0fe269293509acdd93b9cfb3f46636f7b91b33a
-- 
2.55.0

