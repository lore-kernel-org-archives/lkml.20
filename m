Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F0F4F6485
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792100224; cv=none; b=Xvcr344RMFTnPBJrhlwdNt7j9tktKP2aNbnk1HOUX17XB95nd3pFp3Kb3hHjxfhcRaVZVVsrQT+iZh5F8Eg32vvmTmSGEIzdeD+4YcknXErZFLmkqHrqCIugZ7LyTINsPTvMfb0hKFnfIALO2+ocZy7J7uVKdOARVo0Asa6D4w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792100224; c=relaxed/simple;
	bh=UlbqX9WXSoK354kqo1a8NtdRc0VTqh95EAURqNFg/L0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pqj3EDVUbQDzRIlZxbK9W6XFzg77eAA/FlbF35JGN70vQoQbh9heAV/wZS33mvVGuOEX90H36PEUELhf/qx1tj5awMVzKnwMSixtfzpcAPiYOl71yn569+8hcWwbC9gMR97a5LzeQY03TZxB2W2lY77ejSkRw8bmRzZG1ckPRdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KteikVZF; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KteikVZF"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a0213948d3so36013485e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792100219; x=1792705019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=khX/kyg1Fdhhactu6tDSNm+0C0qyulKzKWkAhiCcNiY=;
        b=KteikVZFq7+5gjnQ8aczNjQoCKDVDZL3gNapw96JERi2iHila3cTsEz2SNFRV1Kvf8
         pyCc70INZ3kAsoO/pWsNe+++Qer8XKbbjZoakBL5JdBM2qAQra4pINrjxzWCnB3rZYfh
         u9TaT33Ois3/KUrsh/oFgvwm992FUcDitY1huy58zt0qUOV91fYhu1k8AROJ38jDfLhX
         YE0updcu0zC3/t6gOSdbC+lmVWnXmtf6VpQ1igc/CCuu5qBOfOTgTHd50NmeOdvTL5Hr
         agZyX7GLPJRuOy3VMpTK7++kaaEMQhjMu0Plr9A1+lqZMfpP2oex7FF+ExcWicK/0iG/
         1M0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792100219; x=1792705019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khX/kyg1Fdhhactu6tDSNm+0C0qyulKzKWkAhiCcNiY=;
        b=MHzkRW1KI3zE9DsmtN5Ten1VUNTAsv15WkzgQZCni6HtLIXjJ7i4piObQ2GYqRdBCV
         +kjE7hs66v5JMmHGiAXVCBgO7Q6fcmkRR2mDWZ57jsQu64BnVN6WvTYEcTidZU2vZlvv
         cFYnBNi19F5yOpEE6Y+83YuKRrn1rW3wapvArxQnFMEpLYjheD/1caUjBjUIszkeGDqu
         LaJRRRQUpMsXCsQx5pP0koYFTtRHxSVf7JuQi9q1Bsr6Qcybcsn7NdH4V1ZpHvhrist3
         qlqZ+GMDYwumNfOYFFgH5lIjrCwliDIjzI6O6UPogucQzmUisB2dLrGEGbfrtFZmxPG1
         9LiA==
X-Forwarded-Encrypted: i=1; AKwUvBxNuviOmeVBuVBkxTdXEWP2NDdAe04T3UYzPH5vFVONLQ1Fv1aZTfDWByVYraDmbOk7DrCMm2FNbRqLmp0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsdlTWLa9AyppMLNVfALQOTvwp0Yejg3TirsK85kWMMwJjq0Ot
	K375J7Ch4NtidkNHI3ohbkbJFKFjfcl6cwp6zBvUbmRKRY+x/SjyeqUj
X-Gm-Gg: AYBFou20rUlKV+jkCAijDZPMrvjdV1QC+5GiPX33z/0eDIWrAvhMgGIKMEhGFv+NLXr
	9gRSaZAHSmYed+FQ/+NGZn9gzMsD3KVjK1h9tqqS7yHj/S9YNpLlVIAQf8FFt+Q7wnqKghm5aYN
	4pxYS1RYC7I8jKDR5ue8UdVHzQnmaGnsrM2fM53aWEuup7dekr1hvwlyYih32J1FSSYjTbqdUaH
	ks7hXaRnKVnlnIww7LlA//IzM/kLgu10gcL2gpFkQFoK2h86O7h/+mMNit9FSUTwnC2Um8Zm0Hb
	mlsNPTIGLS6vgsLue9UtNx0P9IOjeygfaTSekDPT8caVh05cV8f0dxwxrnw/f6Hq0096rN/UmpL
	/8IuC9Qgy/8P8MM/yMHhh2EzY2uhTxh4yMpvZaeKkGlkMzifCpaRMFR5+AOzPAvLPQ7yYO0y9t5
	VNhnsZtPInCzwQmC5S2+spFNbA4YKdbu2E92ETfnFOIvAiba+yDc0lZEW8RwylpPglApye2OeFO
	HTPiVfm7CJeKoD870Gx0eUKUsBUEP/Ff6tnvIx8KEOxeCHPWz+MZoeF6XoIBxhFRqP8vQcBt5Gv
	0ZcSBHeAss2Ry6v6rYYAcgfrkx4EfOBP6dHHHz3djjVY/j+qgnkcKEBiAVsI4c5B4N18Y5GgaKA
	=
X-Received: by 2002:a05:600c:4e55:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a18e49c008mr371304445e9.12.1792100219249;
        Thu, 15 Oct 2026 14:36:59 -0700 (PDT)
Received: from localhost.localdomain ([102.88.167.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8d1esm650746f8f.39.2026.10.15.14.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 14:36:58 -0700 (PDT)
From: Okhuomon Ajayi <okhuomonajayi54@gmail.com>
To: outreachy@lists.linux.dev
Cc: David Lin <dtwlin@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Okhuomon Ajayi <okhuomonajayi54@gmail.com>
Subject: [PATCH] staging: greybus: uart: fix argument alignment
Date: Thu, 15 Oct 2026 22:35:42 +0100
Message-ID: <20261015213542.68994-1-okhuomonajayi54@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align the msecs_to_jiffies() argument with the opening
parenthesis of wait_for_completion_timeout() to address
the checkpatch alignment warning.

Signed-off-by: Okhuomon Ajayi <okhuomonajayi54@gmail.com>
---
 drivers/staging/greybus/uart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index d47f00751e7a..2448fc9098d6 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -317,7 +317,7 @@ static int gb_uart_wait_for_all_credits(struct gb_tty *gb_tty)
 		return 0;
 
 	ret = wait_for_completion_timeout(&gb_tty->credits_complete,
-			msecs_to_jiffies(GB_UART_CREDIT_WAIT_TIMEOUT_MSEC));
+					  msecs_to_jiffies(GB_UART_CREDIT_WAIT_TIMEOUT_MSEC));
 	if (!ret) {
 		dev_err(&gb_tty->gbphy_dev->dev,
 			"time out waiting for credits\n");
-- 
2.43.0

