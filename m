Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41084468C1A
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 22:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791759452; cv=none; b=RPKAGCqcgFLpljTeA7hz2ZBGk+zDSZtCLg3ernTPJb7qZJMSgzf89jqV7xoN/n/aT3u29SWtD8RKnoc2kEBzEl6hqv9MOiEURZba9m0/ClKg/CdmU4vQ+EXEH1K7r5n3vTlN2KuwG5yBMSje/tidvw01qKGmLT2m7asrxZoT7Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791759452; c=relaxed/simple;
	bh=RZwb0v8NRa8WincdU5oM8nIaW/9Wl4Cz5GrnIGcpkbc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ErLFZi6Kw7AYDBIQALrVLAQfR0qRaJOdyD5CKofjSyIvh9Snh02J5i+cHagHMJYw53i3mgwbKC7qWnsOnm9q0u9vf2Ydemy2tvkMXBjFjVS4gjnMbdH3zcT3DbJuuu1J6V4Vn4bSB7bX05urSSBBJt9GxRNfxlQ1y0jg5S/DTFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fy00jf1i; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fy00jf1i"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-533930955a4so14111621cf.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 15:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791759449; x=1792364249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aJ3lYqdP3s7nQxccxtgd7lYQQBm6qlupyIbypzuH9WU=;
        b=Fy00jf1iliuAYDJkv+MbxZKP7D2f1txnfVnmTGUiDG34L6K2mEV0lRuFKHo012+/N2
         dn7B7lKQ9iYQcrQzypRuuE5rxq9I2Cx7gOLc454E+HKkkKEhaJHHiHWMQwsa9MtVnXoi
         mpCRR/rBvdZMJo4ElVVasRVOThxg05zCh6tMY3RNQXPUMu6PhcvotICdGYXuFyble5MR
         13Z7LdvCHYUAdEzmPoOLPAmD+RGeVXXbh3fDtBdjvF5Y0zjZ1NDAC5TXiI9WTVj+9dP0
         z+ky+NhwwdGM7dmpMJoykBF9M62OjDxQIr+4YekK0Ij33hII2YpDjBBwzYFaCIo6No08
         GLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791759449; x=1792364249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aJ3lYqdP3s7nQxccxtgd7lYQQBm6qlupyIbypzuH9WU=;
        b=lfwl9A4Kfq7zubJQm+yFyi5RH+VGK9gbhPRsZPFlSaa575aJPGh+TIw0UhnClKTsip
         ooMDNk9HI2WD7jM40Xoh21q10N77vhEbGdqyCHWIY9oYTPNFKeUYtEWe14kU45p8+L94
         cB6Bo8/ClOfnniDcs3d7sJPrEWtDS0ICXzsB+hFhtFJzsbo5oR+hnCk169FCdIHqheHk
         hRTWiPVmByejdOynk9X0MYkghMFtJ32isx5fgb/7fAFJejKeE1ZdX4HY+wODteil9ew2
         Z3apOoo9rfcKIeTuT+oeEVpCo8PPxv+pZhUJICFQn1pWSc4JXDF6StZXOT37+joLqOlS
         pSsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwiJS0wDl9aPoVW46+gOS40HQ1ehi2FU8HhdI1B5gNFAb01kJkMuZGZglEDXO1Ft3tm3BKMuBLHk6B576g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJY6vQU2CZjoPpmPrSEPHN9Nio6FDVlCLXLPsGuTt37E4hhV30m
	bMuchJAaIVjUSElHqwXJoo6Ch3zn0CgiXRMZoJBl6JZm09ghuBgR8QqU6TSmmWp9Jv80
X-Gm-Gg: AYBFou10xv6uXUdlScI7rBHlXX5Fo+/g+D+Ux6/uEGCViIruoXxbUfpxyys53ADjbC9
	dLxmFiharF1f/h7dE/mXtUJyNP77cKvruFS53n8caxV7Usi/glFj4W94savX4krncDluUHkrr/c
	QugAIy9G7ZtX4tyqd/4eXDShJScUUO+xPtOtt2WB16Zv+sgkUgRVtMQF4rifELx5fy2n8wvcYPU
	05KkJ9NPhE3LSRUPzhMhRQsXG01c64gtOW0O0zwLkGcPEQZR7oO/Cse5ZIoyaScaHHxvJ+6WyHV
	CupgUjyswIw3FFQe5BFVbsoTQZpKvIVpgrxR1+uprvS8IX2iTFB9/SEczNyYBthPptnbEkmvgZe
	s3jlDVP9USZaYBXXgJQZyAPeiUX7HAWATN6sT+yEb1LrvViUPzc+F43sjnkxx+HTMcRJNlIxixR
	XFb/wEM/T2LQ/a4wH5rFyoK1is0GQZI8oRIeUZX7oupuqTNqcNIRfn/sOetsrN4reFRfpM8k7E0
	CPmJIuBqBqrznu6mZnkGTSJjcjhIRQej2s3hX2Hz1yuIN3RkY4g/INTMrsxezT/dmZs1t6pNm1s
	hjyzfHP4KfXRJwoze0+K/EAKT/j3
X-Received: by 2002:a05:620a:450a:b0:93c:b10:7243 with SMTP id af79cd13be357-93ebd0cbfe0mr1420548485a.5.1791759449127;
        Sun, 11 Oct 2026 15:57:29 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98cd599sm723647985a.39.2026.10.11.15.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 15:57:27 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH 0/2] rtc: renesas-rtca3: Fix IRQ initialization and teardown ordering
Date: Sun, 11 Oct 2026 18:57:23 -0400
Message-ID: <20261011225657.rtca3-irq-ordering.0@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RTCA3 alarm handler passes priv->rtc_dev to rtc_update_irq().
Registering managed IRQs before allocating the managed RTC lets devres
drop the RTC allocation reference before freeing and synchronizing the
IRQs. Masking the hardware sources in remove also does not wait for an
interrupt handler that has already entered.

Initialize the RTC before requesting IRQs so its allocation remains
valid until managed IRQ teardown on removal and probe failure. Then
stop both interrupt sources and synchronously disable both Linux IRQs
in remove, before managed RTC unregistration. Serialize removal with
RTC operations and reject later alarm enable or setup requests.

Compile-tested with Clang 22.1.2, W=1 (arm64). No runtime testing.
One existing FIELD_GET comparison warning also occurs when compiling
the unmodified driver with the same flags. No new compiler warnings.

Myeonghun Pak (2):
  rtc: renesas-rtca3: Initialize the RTC before requesting interrupts
  rtc: renesas-rtca3: Join interrupt handlers before unregistering the RTC

 drivers/rtc/rtc-renesas-rtca3.c | 40 ++++++++++++++++++++++++++++------------
 1 file changed, 28 insertions(+), 12 deletions(-)
