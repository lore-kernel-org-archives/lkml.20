Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2C64E80D2
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 20:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791232117; cv=none; b=UeU+I41AaNJAmmKGad1UzjruNX3DIgx0R0n+kZBcP8uPrbUyQFl1hqQS6ibf6LqYhGFRqPXfiEjHcNrDklyO2akUcUM3s5nDHFsfUcfmEtVfRM36HK8QI435VLGu5TdZccJ44PuTWJEJo0aHQwv64SDhN12M/DvTkGubAIe2Kko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791232117; c=relaxed/simple;
	bh=t5uHcWG2fEqeLYYeHJcY17uSk+4BZ4G6OSSXFcdnRnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VUsT+O8XM9SKCHNh72CJ+dUCfMNJcnp6e3Y6qzbwZl5WyKUWFfgt+7VuP02ow+IGlxUHcQxgsk0yIUd0PaxrI2S8vTNdQaKErUw3mDt1GPCq4DpByUApldkAl6badGKRIgLcxiv41VFwmo/pS/8YTV5FxrqKrx7btrNWuqbVmDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oOxo0BQq; arc=none smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oOxo0BQq"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6afbfed31d1so2505814a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 13:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791232099; x=1791836899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2lAdfxofOjXBbqsp0/iF1q0AKoAn+osrW0QUEeXjGUM=;
        b=oOxo0BQqDtZIVCW6SDp8y+oibA9DEK5ggW6SAT7pGmuwMObyPeLE1rxHxx4guo48iE
         PHgXbfJOY8s8A+3rwUGtOoYVOQG7xkqPEg1PRNZ6WqNsT14ggPrBbxit/9nR4X/fnMLV
         sY7UMvdooJwH5t7ICDPDyDzdVo5LpmTB9WtsljX5ycHQGxwr3RS/8HwXBM7VBVtqH8FE
         BF14XzfFt2gonrvaEzh1Z8tRGleZIcgyr9UPKeYeEHgSB0o27NEGZs9GZmHVuWv+WjyR
         +ZynH/0Du2gi2exiCUApf4waj1JG3NcOsnzfIFOQsvLqOsm/X4P8PXwUHQ0sr4/Fm5ru
         BCoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791232099; x=1791836899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2lAdfxofOjXBbqsp0/iF1q0AKoAn+osrW0QUEeXjGUM=;
        b=n09yHAPrgS3ud6sFs2vepEFzmtk3zZJsXrV7211457Rrf1bhJMSWl8F3pPOmC6/jvy
         g72McCbW+y7Tqzk+u0qKSQhxd40W6Z9mLZssIQ4CA6PePVebgzrFIhh5MvOyvzf5NVmB
         JmvDfkBvojW2sr6xRh4ZrE882McV4OHvTIY8mDhunpZk2AsUOGoGFrz5gZ+IDgDKcRBb
         pQ3FSWC0lNhB6BrRW4zJxSZnu2xPGlnK1aFN78RsRZmxlY5HG8JOJs5d8Wrkc9jxdiF4
         W4p+rFKhoIBTuruQA+xfa6HrqFhPdhY1tBPil6M54A6yH/G5c5KYbBNUqh6bC4x8b+93
         6+OA==
X-Forwarded-Encrypted: i=1; AKwUvBy/Z3CAZ8pyOOJAmT4iAchtWaU1S/R0HiL2ZdWf1Q0/t0bUY0EfpFJmqrssE4SyLY1CWguuoht4w5dVX+4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwDLVUgRN6rTZgl4+KL3LaGGAJiNuRM5EpCo5cbtqaYVE7LdSO
	wfbyyOsaXkQeQfofqjpM7bc+ajqBzh92JUQ2yXnp6hyIDudOHOqjGlIs
X-Gm-Gg: AYBFou3kmBxEpfyVgxblwBMmXiJBt2SaWfmEZAim8++TU1TY+JYRPUrEys3p0p6kWW6
	PYnRsKEr3caTKacHpUYrIO82UrMXKhB0bGznDy1xHdsgFS9TwhK/UgAYNLb1bi+C/Vbo2uU5qMd
	0ZtRrnkAGaAWgq8J2y07woeeHnyRW+P0giCNhQhGgcFq8kFPv0uWnRLcvdE6FgYpLmzHZGlwFL1
	9F11PIpFh2C13yWqFVsijKvtyMZ0RqmEQBjKVHqbrscut3PPue2p39rD4qhZEMXPQM5lsVMHG64
	MOWJ4EhXVeUd81pi/EflW1NZD5MJQ7P+AV94470KmIQKVXePoXz2vgmLrMD9xeSuvDWM9kq2Jm4
	U8pTculLtWOJ9gEghkEC2BC1f/HTqyXoKePo2aN65ZDD3PTEgRUJ3q+sCOQ/IEnrOmXafALTO5m
	sUtaWN21Yyz6FWJSNTQ88EcuaoR7sqPdyJ8th7TImWUaX8WrMXXTtw9hD3n6M3CySoz+k1eQyvT
	2SzS58gnxYZnwKKRn1m4/9VyA0p/QVW6A==
X-Received: by 2002:a05:6402:3905:b0:6ac:73f8:2e5a with SMTP id 4fb4d7f45d1cf-6af9e3002b7mr10742942a12.41.1791232099075;
        Mon, 05 Oct 2026 13:28:19 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e572asm3801024a12.13.2026.10.05.13.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:28:18 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 06/11] rtc: sun6i: add Allwinner B288 compatible
Date: Mon,  5 Oct 2026 21:27:26 +0100
Message-ID: <20261005202731.153971-7-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005202731.153971-1-pmazzini@gmail.com>
References: <20261005202731.153971-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver only uses one alarm interrupt, so no functional change.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/rtc/rtc-sun6i.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index 7fc60880e409..cd6ac5bb20cd 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -859,6 +859,7 @@ static int sun6i_rtc_probe(struct platform_device *pdev)
 static const struct of_device_id sun6i_rtc_dt_ids[] = {
 	{ .compatible = "allwinner,sun6i-a31-rtc" },
 	{ .compatible = "allwinner,sun8i-a23-rtc" },
+	{ .compatible = "allwinner,sun8i-b288-rtc" },
 	{ .compatible = "allwinner,sun8i-h3-rtc" },
 	{ .compatible = "allwinner,sun8i-r40-rtc" },
 	{ .compatible = "allwinner,sun8i-v3-rtc" },
-- 
2.52.0

