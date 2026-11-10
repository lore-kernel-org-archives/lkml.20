Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312174;
	b=qP4EGtdp9bPfWsBlHcodQvpFXoZHLkTE7iAs+D2G3LacMXOOcqHOYhA6NTF48humVIej
	 IS1sbY6CYEPdV13+FOSE0mtbzoXWHIqgFQzMqsL9XGyxTGizuWkeFgcN3z9S9blCQZlqM
	 idVvSnj8vXV42PF1LCI18MHfrhuXyyZ+lvkBJo+aj2qNDFhVDGUU+qyvpgqYGW7q0mwLA
	 gkVGuufDYSwf/y6om28NfFaB/r/zLqcFXjYU4ldEIe5Ri4EHuoNjgfnEVZGKSNOji0y8P
	 sbbS5/I7G/Xklfs+QFu5c8hJmcjcK/Prg/tDFaJhzXKL4iBWlL2J+A08o2fk39NRF8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0ZP0QwuWmQ0O/IufxQaXKe+ECU5VmX2aM2/ckpY7r/g=;
	b=xLob4lBHPEQdu72q3LqR2ONu7h9VGXTiVCABk6jkHB6xKtbRd+KT67B3QJg/IUGPQ8b0
	 DpCO71AyhvaM0OI/jCnmGLP963SYA2TLgfghCbvs9w3d56aaXOEt9DYbmDe1IkuiV1fAq
	 qpWJzF4GemruDT2MFYm2zKyRYnUR5+sdIsGO6tSj9felY/RvOneBQBX4UhhAdDGteW0tt
	 yYNwXVvNKlA08lHtYG0DsY1+4OfRfLUo8mIm+PP9yIcQEPpy75xYIfZy1ivZz2S5o0nw6
	 4+rcNi2c91K+iJW98idumMxCHEiYi0qIFYbRgzrU0aWjWG2kt0SMCe7ArvEv1jPl7Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jSDlQbfx;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6559606A338
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6559606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jSDlQbfx
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-372bdb942dbso2575122eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794312173; x=1794916973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ZP0QwuWmQ0O/IufxQaXKe+ECU5VmX2aM2/ckpY7r/g=;
        b=jSDlQbfx3w+kTQrgktf6wDUFty1SLh6ECHjfH836acX0MKF0FcRwXmKfLDWc/YH6WU
         F+AyTHmN2bvbrDYANH2na7AdjtN6sFOtW+yORrVemO9+MLHtbzSUeWyClojBl0glCvK4
         nknss2LXWxE6eiiv4sOekf5Ht4/jPuhnTuhkUYisl8UZrU5q6INzIEvcl1Nns9SsrzQ3
         QKWuvHb8HvCPSEpyfdiyxoVTbKUubufh9fzyFVuyfmQQflgTCt1d9PqXD01UN0FUkkBS
         WbGFyO0mY6XBg/9feDU3URVoSCvRvna7kXi13CLZ0iLvAsiohrQT50zbt+WOGfmJ7Z4e
         6a0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794312173; x=1794916973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0ZP0QwuWmQ0O/IufxQaXKe+ECU5VmX2aM2/ckpY7r/g=;
        b=g0c/oFE6A7jCpnhsi3Lp076S4J02E3tgjNjuOpdWquMuMckC6cXybBXAg7yB2fPNVH
         tMn23DsgqDL8fOAKHpuo8LeMMdiGsCf8wX283PL8e/iQkrxmkOovl/MogrLmQsoBg5it
         4sp5rPLwHttMC1E2f2RqhqQd52hTurMbEUncJkGQl0JGO3RaZ/fhP8OLfTqOnozx109q
         iM7sIKg77w7ReIC95tRhbLqqvpH59tlUCGMPkGEkTUxzpMEMwjdAG2nA8r/i1Tx/bddU
         jYtxqrnlZYktbXXjFXBU9/sc2K1ZgWBmFBI5BHmV4znbsSdW/ziWsVA+IyADOuMl3dL7
         bn3g==
X-Forwarded-Encrypted: i=1; AL+hErFLwScxlU5Wg+9OZcmFleTAxMTxNZf0bh3phfx9a59dMl+C4e9mn8b/LcpMBnGTqqy9l4dbjcFKV2m+Xlo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/O8DExgZtfUy1HVCRF7uxqFnRkLE81F9X2R7hBhA36FxDxiFHU
	fPOS4aJ/3UZx9mMqcQvRJeD9pUIifI/oLJ8Xk5bAEEDRpsx6LJs+1k6q
X-Gm-Gg: AYBFou0e5Z/1SI9yxAO4HxYoAaZ6htVOKa1I1rg2CEMjKmvTAcFXBWH10VnjBvRrdOr
	QP8opNZNs5l+5P2fCFDkvvXKi2Ddhn92n5U1BHDSxPJJq+rEEz6LFqoPkrdXaueQGmoloZTq1Hc
	v78H/6t4VsYn52e6EWt3JS/CdLRpWi6+sXnL1IZdRV+VJC1PkT0snq57tkiGlJk3jSFre7sJTBf
	6O7/nllj0Ia0hPEgc80pMlBjgY2rYjCo+i07AwIxwL77Ik55PohEIVRbBZLZU3vfcKZvW3HaMcf
	xPVnOnRtplGlukDtJ+mHzU8AMPLoxSU/aC0MhdvPm2SIv7sDx7V/wNwhqTw4K5EMUfj1fbo0u+A
	TgKzYNq2Po347ZoGS8KYxQjf1l0AU2sMB0IPmlK2vvpA7APgOxq1Tw8DPRkTk6U5Q9Ix1xMXCr2
	XIUsXBGfcRvRk9AnXXpfGUeybx5G87L4ZKkI93N41P93W4I48ecswHqLNlc9DNmJogWhXEIxWyr
	xe+dIzzTNb6UqlOTm3Nj+MAZOZ1IN0uBAk7BMZAhGUizBQ3NTlb3SYdC6r/WIDHXDF9PhUeAVX3
	TTEoEebaMkgZeDCkHFx20vZoqL6SlgXmk4X5LBwwVYJtPvf/
X-Received: by 2002:a05:7301:fd03:b0:36f:f3b7:6dee with SMTP id 5a478bee46e88-3751ee7c2c9mr2880533eec.7.1794312172706;
        Tue, 10 Nov 2026 04:02:52 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751ad6f11csm5931001eec.0.2026.11.10.04.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:02:52 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Roland Stigge <stigge@antcom.de>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH v2] usb: gadget: lpc32xx_udc: drain the pullup work on removal
Date: Tue, 10 Nov 2026 21:02:43 +0900
Message-ID: <20261110120243.2540098-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110114351.2524921-1-hj351016@gmail.com>
References: <20261110114351.2524921-1-hj351016@gmail.com>
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

isp1301_pullup_enable() schedules udc->pullup_job to perform the slow
isp1301 i2c pull-up access from process context. The work handler
(pullup_work) dereferences udc and touches the isp1301 i2c client.

udc is allocated with devm_kmemdup(), so devres frees it after
lpc32xx_udc_remove() returns. remove() calls pullup(udc, 0) -- which
queues pullup_job to clear the D+ pull-up -- but never drains it, so the
work can run after udc has been freed (and the isp1301 client put),
dereferencing freed memory -- a use-after-free.

Flush pullup_job in lpc32xx_udc_remove() after the final pullup(udc, 0).
flush_work() (rather than cancel_work_sync()) lets the queued pull-up
disable actually complete before the udc and its isp1301 client are
released, so the transceiver is left with D+ deasserted.

Found by static analysis; not runtime-reproduced (needs LPC32xx USB
gadget hardware with the isp1301 transceiver).

Fixes: 24a28e428351 ("USB: gadget driver for LPC32xx")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
v2: flush_work() instead of cancel_work_sync(), so the pull-up disable
    queued by pullup(udc, 0) completes rather than being dropped
    (OTG1_DP_PULLUP would otherwise stay asserted after unbind) -- per
    Sashiko review of v1.

 drivers/usb/gadget/udc/lpc32xx_udc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
index 94355d3d930f..b98faf5b71e5 100644
--- a/drivers/usb/gadget/udc/lpc32xx_udc.c
+++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
@@ -3187,6 +3187,13 @@ static void lpc32xx_udc_remove(struct platform_device *pdev)
 	udc_disable(udc);
 	pullup(udc, 0);

+	/*
+	 * pullup(udc, 0) queues pullup_job to clear the D+ pull-up over i2c;
+	 * flush it so that disable completes and no work can run after the
+	 * devm-allocated udc (and its isp1301 i2c client) are released.
+	 */
+	flush_work(&udc->pullup_job);
+
 	device_init_wakeup(&pdev->dev, 0);
 	remove_debug_file(udc);

--
2.43.0
