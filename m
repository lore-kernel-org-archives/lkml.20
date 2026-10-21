Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792609340;
	b=qHrr9Lpg9rJgxi3TgYY0tmmDZlX9C1xVdbJwTYQa5sh59/b9DPDBW4ZDLTyDNMiKGhhg
	 ChE9ySZxNfS5JuxuuvWrdO4ux6h2CNugVez2vpRStnYVtry63+mWEEfFFjS4t454l3+Pc
	 EAdB07Ee6q4vMr79A/7KBuyU7ESZ48Hn5mHTx1YEjO8MMGtu7HsqbPOu9NPwzr6qTdGq/
	 fCI+kLj9DhNIs53e2YQtt9iNoCfxN+twXbacsFt+c3b1L/Zog5ROwlS2zLhI7FX+SiJcR
	 VzrznWGXGgh1qz4I5rukAjJeMMvQuLShnBT+4WikeIh0W5JGRORwYgvlt1hlbz+vYuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792609340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Vt73uT3Bmf6mr9x/h/RM+J+bhPhlELsIoqUJLcGw4sk=;
	b=yNzHd4ovegSvdYsYn4aebz2stvlUeV8KPKEC+giBHzCk6cSdXzDuzQCXR7Lx23Dh0e4K
	 BGV+utCmG974WfFEUVpFLUKUIQFbrY2T+dJiIDUWxV1l8m1SkzLIUOeWC0l9uK7+ahkG7
	 U9HwhtyWsfWS/eYn9gQs7GEgH8ibQaMbityx5MyzUS4LxYiTncYY5UXIWed2QanGCgyK/
	 +PGnkxEX2NR9M7EE7yBCAu5DC6/Ntxp27C4lIRXxvhS5it7tdFnxvOE1psSSe0TxMOG6z
	 paT8XnYLiT6Z7R+5+AX/nOkqPSrjvd9DfaAhZM81yvisnbPMJUqGiTTzxw9LwzWWPCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=neUQSqME;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF7B606A326
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AF7B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=neUQSqME
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35c76e9614aso1933423eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792609340; x=1793214140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vt73uT3Bmf6mr9x/h/RM+J+bhPhlELsIoqUJLcGw4sk=;
        b=neUQSqMEncysnP1DEjJKWKDDqp8UaR3Ojoo072jz8wzpDvU1NMJDoEokIWctqnLu68
         fFuwfaKWg09Z4MrxtqQhxNCgJpqMSoamVnDHXQr9mbdd2is9k7lDH3dlx2M7Ebfl0YsY
         E7WKIiBCFG1NFlJA7qnekG+YRZ/ylsNY6NcLxXFfSSAN6WI3RimB7CFPBDLDutcuRNME
         cb044b9pbFkAaEU7qyePmCzSOkCused/dSXY86edLoV+lu7bSkLQdPF6W6K0aYm6w2bY
         ux19wje0MxZm73ih+rQA/MN+RHxxj4snNNfkrY75zEBFfPl0lC5L+yyQwP+0L0jKeT66
         CBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792609340; x=1793214140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vt73uT3Bmf6mr9x/h/RM+J+bhPhlELsIoqUJLcGw4sk=;
        b=jzOmSM3KdpoYnkhBFqNIrNCsIcCAuJE7WL4qe2voMfrtGKqqYjeyYdTvENqaYrSQQW
         KpXb3woYs4AHmAUqXS+j1hCkb807U/S4r3GBPwXcrY7a7pWXUi8xq5nY1VaLd/VAS2kE
         ww8/yzh/cDki1zTIEGbuGSWJ5Hoctko3UFDjrXptwoxdF+f5x4yeVdl/8kIAy6bQ5u5H
         xsVwQPVGzcnhcbkw3knO0DsjdLJMvuG03/uD59ePAxn/3rc//KV46Cp3arD+5Ot+MJAp
         tE9SUsT51D1x3NZKHpJoQt5pVcmKcJzpJ5oUw2u8QQTde7ga1tbR3O1D4LHi/ZuyAlN4
         /uPA==
X-Forwarded-Encrypted: i=1; AKwUvBy+HVXTb0CJTX6dZTDSrys0O3YZqT5a9zat0qCLNYXcKdUsbotPedRDY+ohB2+KiZRe04m78r8i99ni7U8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIH0c4Qcq/ug2+SQamrRg6GAUm9mGTn2gFEAC523GaJpHW3A7in
	XIoBBwTZVv3Ohee/ae/yACMcXPqPBqEp6SJ5cDdBCtscmqoZ17Ocojit
X-Gm-Gg: AYBFou3i+higYO3a18zdYGER4JqJvYPYmQkQRHX1nDbNFj7ED+pQkiMVUmZXGMPjRtE
	//PZCNxrtg6X0GVYbI7EgkcOqQAoLLNSuWt/QXfSlnliAk6FHc1O21m9C7E0vzbV+hq5sGZXdDo
	bSVnd7hbpk4aH4eodPoZ2AcILUxP1cvL4IpukNdLAX3YZ4JkZz1HMwbza3vKCRyVu6xWuuBqLuN
	jZ/BZ58lxupIJy5z7EfRGFrWxGIGvvSHKR2YTo7h+aNdz0oLbCZtCkNfb9DzAV/azg4NrMLEAh0
	YPWq6wxE4Gzn+pBETKCRb5dvZWRpzGUhFMyDwBBbk7Vp1/myFYuBE0E2AlOwLFo1BJQx6AS+Anu
	0IYiwuZVah7Tma9t1gHh+oRTOLVBP1daGUvbq1YOX4lHJmIOnMxxPH6v8vm1rAgRn3b1PDK0XmI
	tc73bkTupZBrn+DNIk4mKJToVQYZ6l5zLuGl+S+5kAWfksmpumE6zk0KJAEF2FHPFp83ZxEhzd+
	aawv6ZDiGqLq36JnlX15aXmM+yFsZDv/crUxlqnQ2E1jME32J3PRnSU4biCCV2gvkdUhOqyIqf8
	/Pwrj9yiM5m3KUFcS9uSi+aa/wQ7P2LQwdQHN09lWYg4xWh7vaeBBKx3MaLG80LX1g==
X-Received: by 2002:a05:693c:8641:10b0:351:68e8:4646 with SMTP id 5a478bee46e88-3674f11647cmr4384980eec.37.1792609339106;
        Wed, 21 Oct 2026 12:02:19 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:1761:399a:3c8c:31ba])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e153519sm9500604eec.3.2026.10.21.12.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 12:02:18 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] gpiolib: fix fast-path cancellation in gpiod_get_array()
Date: Wed, 21 Oct 2026 12:02:07 -0700
Message-ID: <20261021190212.2237804-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
In-Reply-To: <20261021190212.2237804-1-dmitry.torokhov@gmail.com>
References: <20261021190212.2237804-1-dmitry.torokhov@gmail.com>
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

In gpiod_get_array(), when a pin on the same chip is not in hardware
order and the preceding pins form a contiguous block, the fast path is
cancelled by setting array_info to NULL. However, descs->info was
already populated with the array_info pointer during the first
iteration, leaving descs->info pointing to the aborted array_info.
Consequently, subsequent array operations still use the fast path with
remaining bits set in the masks and wrong hardware pin numbers.

Clear descs->info alongside array_info when cancelling the fast path so
callers do not erroneously use the aborted array_info.

Fixes: c4c958aa64f3 ("gpiolib: Fix array members of same chip processed separately")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 21c9cea71c68..144a63e6692c 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -5270,6 +5270,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 			 * hardware number is different from its array index.
 			 */
 			if (bitmap_full(array_info->get_mask, i)) {
+				descs->info = NULL;
 				array_info = NULL;
 			} else {
 				__clear_bit(i, array_info->get_mask);
-- 
2.56.0.307.g5fe7bd680c-goog

