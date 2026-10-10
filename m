Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009F44BB27D
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 19:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791661144; cv=none; b=lix9jZlfUMPoYYp8Rwvc5kB4E3nV+BHw3VeHjNbhVlHy1uWsSAnUYqpvV0BebXN3y46vWgZyy8CTOhkQB4/NqImXwAypm9IHKlYA1Nru+0kdRjeCqNDAM0VfJl7FPxpt8MREzcWkZt4R3VWau0feO/BGpXRKGbIedb6HOBayNQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791661144; c=relaxed/simple;
	bh=OUtfSIkkGgQjaN26hrQZj38jSK5FxxSgBi0/gGt+mJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OEbiRUKo457EDOR69UzRhVYX7zoqnykRJ6SR2krfAyjG2Fb0SiGVA8G51alrx5FMEnSv8MXuBgrurU2BvRW8DgOzDFJznfY0JpfTpzSSIushegkvcfHy8tOdXIfkNnlce6WrVViCYw8hbRmLLTudj0BeVPu6hMqt/v30l4l7YrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U7edwQeh; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U7edwQeh"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so7229265e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 12:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791661140; x=1792265940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BUMpjdK4jS9gtVb1V1R5qKUt2mxSNbNvfXMFgIuSSog=;
        b=U7edwQeh0PuPwuGoeIMWLrUf9RiK+w8NWV10ZdFsmJ7ZJ6vhrHClkHpvFJ9+hvgodg
         t8d+1tI1SpabUMzBODzyNSFpwTWf72QMl8CdAd5YYg4+vk9xd7ILoUsdZwg2r1u7niXf
         q2g0/If4KTQXfaLPc6tp/3yqx37eUuDi3u8rcnt7awYpmpLmXeuVfQgHvjfrMTaTVYpA
         bIH5JgFnZfDSznfHwKSUp1aeocBqxDyjNPdFm0MtcBcNfb797YM7ygU9apcD8dSAs11n
         ux0fAe4nDlmLzNuqwik/VDh2ZBxSMwVHGy3NqBtfNddJUGaBsodyyoaV56ZCX8SBnCeY
         mHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791661140; x=1792265940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BUMpjdK4jS9gtVb1V1R5qKUt2mxSNbNvfXMFgIuSSog=;
        b=hLwfZnQ3pXbUxNGNQXZcxQBzl1NKyrf5gScGBAuqE5GOEKWTvYQQdICcRkjGMGOzFt
         bKGYlXb9Jai6maqZ3/C+8X4gY90oixC5eqH5v2486bZVGPvskUnxRR5ASnp6QLlFJ/QI
         7eANYfCdAUQ7rzyrG36LxtLK8b7Wd4IWSky0BxD1/H5TDhSoAaLhy+TGkBGGEmp0XSPX
         nA2eucmxJBuf5fcAmdXBZlorPAZIGXflSCTgcddZ5XcYQfFlaqNrvfx8DKyDIYX4/klA
         lHXVpUH5c7HzKOJiNZQTKDLRRinczfEor5iVBxPXzxhgYS8kUvTnforfT1PlsgSPlYnZ
         lZEA==
X-Forwarded-Encrypted: i=1; AKwUvBzxp1BPPTiuHoLQ0Y5hQzvL/qzetfGqk68smrXG8jC6pGdFNrHWexfWH5CieOjkx0CB5BeaaHdXuBtU1E0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKnYwHrgfX8u1JYIvD68d1HFY7vCk1W8gPHjQ5yNgqde6Tgesyu
	NI8BGACDdDDgbcGyp2Z3OxKloyUevz+DzuOTdeSFuJhEXVmLKWJko7aA
X-Gm-Gg: AYBFou1jDIGJLB9O5IkNKOMWWncBosGWStWPoJohiJ2KGp8YQP30yl7iImjie906GV2
	8Fkbk47VeCie70g6TKgIOTPZO/HUJw1+xum0LZEhsIC/GOD5De3h+c9kLvkBCA7W1WiHQavrz7P
	vQkqX5hC0WgJndTsmOVhrL0fxMx4HQnLlDqiO9J6ASsQRXmm6okntgNKMloj9QwspnBMT8mXxL+
	b69FNEB7w5+T5QPGJxLx3Y2ggusJjsiEa7igURJM7aGzHc+C7qRKmgsqfALssnG5PWxweHg1wxW
	Te1bMoQuIicHwuMx2/iqOG+thSRNX8RxmUUNSW0lVPfqHUBPBkgpcaUZP/vAfZjNIQvgQdoOmku
	JjnpU0iYoecp9LqhyuH/rIwi8kDvak3QbBsvKqOfpAqnsD3+FQInWniHAYcXKZY+aZLt5BpfGLe
	5sC/n5zYOxVOsKuqfNv7J/K2T4sPs2N4QbfOLYOb9ES0OM9SyQqh1wCnWlft5VAxhv6ZAdNyJvG
	1K5lmEZ0dnXUeb6TsA2VXICS4ixLZLd
X-Received: by 2002:a05:600c:a00c:b0:49f:fe90:de63 with SMTP id 5b1f17b1804b1-4a18e4e0a3emr109134025e9.28.1791661139935;
        Sat, 10 Oct 2026 12:38:59 -0700 (PDT)
Received: from localhost.localdomain ([67.209.128.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e3519sm11123224f8f.16.2026.10.10.12.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 12:38:59 -0700 (PDT)
From: "Pavel Kossenko (kotekompotek)" <kotekompotek@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Pavel Kossenko (kotekompotek)" <kotekompotek@gmail.com>
Subject: [PATCH 1/2] platform/x86: asus-laptop: Unregister the wimax rfkill on exit
Date: Sun, 11 Oct 2026 00:38:36 +0500
Message-ID: <20261010193837.1120-2-kotekompotek@gmail.com>
X-Mailer: git-send-email 2.47.0.windows.2
In-Reply-To: <20261010193837.1120-1-kotekompotek@gmail.com>
References: <20261010193837.1120-1-kotekompotek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

asus_rfkill_init() registers an "asus-wimax" rfkill switch on machines
that implement WM_RSTS, but asus_rfkill_exit() never unregisters it.
The rfkill device is leaked when the driver is removed, and also when
probe fails after asus_rfkill_init() has succeeded.

Add the missing asus_rfkill_terminate() call. It is a no-op when the
switch was never registered.

Fixes: 3c8671ffd334 ("asus-laptop: add rfkill interfaces for wlan and wwan")
Assisted-by: Claude Opus 5.5
Signed-off-by: Pavel Kossenko (kotekompotek) <kotekompotek@gmail.com>
---
 drivers/platform/x86/asus-laptop.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index de607ed..8e69f02 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -1332,6 +1332,7 @@ static void asus_rfkill_terminate(struct asus_rfkill *rfk)
 
 static void asus_rfkill_exit(struct asus_laptop *asus)
 {
+	asus_rfkill_terminate(&asus->wimax);
 	asus_rfkill_terminate(&asus->wwan);
 	asus_rfkill_terminate(&asus->bluetooth);
 	asus_rfkill_terminate(&asus->wlan);
-- 
2.47.0.windows.2

