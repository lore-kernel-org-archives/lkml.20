Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793561048;
	b=hmyTNhCw2gonbI8Kn13Hb95qSx6yDOwUQjCTOwtdwcp/PGSIoV37NRB0jPcQOTO5d5xf
	 AeQdDpl5eB6beBVjSU0qtjuyt98rbEyM1xjh78vuxhGyjgfh8Vbl4I3IWYQlLQyFoLB5T
	 Nwm/6PKNmpOPGM3GAIJAOaX3iwBD738Aby+c16Jj6Ipe3bVbwF5Jz2FxirkXLQWa2P221
	 BHeJTx2Jowjl8gzwsi6+gY+dy6W/k6dISVeGQ2SmZGmi8a7EHeX4nobqPtZXEKzF12oCl
	 V0UfsUWGs7jJGj5NbhdNHrHh9sPY9+vkPlEX4DiH95JzXVD8AGBmmFPYfxdkemHEPLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793561048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5dla/eqbb2IMG2xm59fzp+ARiaZoRPt3t8rJalIczyY=;
	b=lY/Ae0Y3ggbrYYLyUcaRxm/YSEgQvZ46oXlPHq+esZf15lMBuCgR6YwsIN2NaHDV/Fdx
	 OBP/qnninmJTEGAaHRvijXvPCNYiCcgTlL6Zng+e6nTFMoY9eRPg1Pm4eUpNolZMF2Emu
	 An/wspMtWFfrU/FFZ532xnKjLBvbcPGnQHRV1BaWwd+V5sXuaUcMc7Qw7TNyuQL7Nfgaz
	 nUj35iSlimTOI7Jbk7YtJrfnIXdomRE0AazhyGY9RWOw9+YYcb1885JopwhCLTfxWzTaq
	 CD2HbMC7CwQI1qiWAPX4M3ld+Fw03OmEVcpHkXjXOy30Ckh8XD6wefGRUjv9RxHBIDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qfyPa/pj";
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641A1606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 19:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 641A1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qfyPa/pj
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48bbb06e746so963584f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 11:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793561047; x=1794165847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5dla/eqbb2IMG2xm59fzp+ARiaZoRPt3t8rJalIczyY=;
        b=qfyPa/pjNiiI17EcvqcCi73zZWgmWmB3QzpqBqTnaRIlduYwe8C9lU+XL8jQfh+osm
         M/7qmbi3I89oJA6HKKihS6oU/Eh3WCScTvkDTE4Zu/h3E705kesenk88j1SqDi/kL5h2
         77//GaIRpCmF3+fkTNCmDxPb0m6S/mpJ2W6WDOM4l0qp/fXxQkO/RgfzKtPX2MMK8uPn
         kOk+XSmTMJQY2pnEfLp9D6XgZ/49HqALtaObDjBj6UKgn/0LxVaZG3Qy2uClTbvxx9h0
         +4oHY1ulR7F5SBlZgQRYQsKlJyH9pO7aBicAPVhOXtZ+v6GXb4v2JF9RpxBkhgjY3vyF
         9lNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793561047; x=1794165847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5dla/eqbb2IMG2xm59fzp+ARiaZoRPt3t8rJalIczyY=;
        b=J9EUsG1B4lamCvF6Xx38gfc9wP6R4+sB00OAA5Rxuw/y5GYuJVpynbVAYyktUa7brU
         jGLbGyZkyxgaXqpXSLebxL9aoXTXwCezQhWz85sd8erR1zo480zFQ5T96R4sWXr+nicR
         yvegO0masH9U6eDkREw06fmphECBtS0HwtMrY9rLN3nd6OirgFRcgAv0AasOU4F3iwuW
         /yMihF7Uohh4P5NQak4L9KYYEojaaNlMmW2IMeLU3ZnEl9hLKTbU6vt0/JX647Mlfm+J
         ILbYUAfqlmR64l0DqlWqX3wPhbAJh6DANq+mMnj+v0V1gXSXuVamJsgf+JOBMz/ckb2g
         9xkw==
X-Forwarded-Encrypted: i=1; AKwUvBxtbVwHdMbGmM/ao7kyEuZuB9GXyQfGSmYYmGHIegu8RLWHBw3Bb+Ravb6FjL1EsNaHxFph+vCoiQnKXXQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OvNHO425KfD2BMnPLTShtPcb28WI6xbMp3xPkPNLdvdi3hLc8
	PCPikIFdcoxJA5rEzcdGZwArmczIWWUw/0XtBnwMEmVmZ9lkTUwy2gRL
X-Gm-Gg: AYBFou2ItF467yx2zF7+q/W03FJSdmY563xlawwngyos3YBspAOiIcv2NlgHIf7MYgQ
	RN/w51m0nDx64HgvS2saP36LugONQKzTfnMchN4xxbkdUQbmU/eYKbCt/bL2Kn3uSqa3nMzr4IB
	mNxqmgoJdn4tgo6/zDJaK7apiAb4Qgx7bz4THJeGYoxA4z+xYiR98ePPqhinUBUDQ9dAnycRkVy
	s/8hjN1PIPQ+Y5fGBLp9CL+YkhXO/y2s0eFIEEeMb5Q6sEiLmtpTjF5x12ZOoSCKjTi9GA/mrTC
	OU2nHG48+8cQ+P04cBf/MurBrrIlSLWj8JkcPs/QCLf2ZobwjCbfrfkg+MfVeCDzAbY6WwZtozu
	KYH4D+OrNwZaCU70rJ/EFsub1p1PB/kG9FJbumrh/gANqPITJSsIB+wy6ZGU9iY56pr4cPKqTXB
	sQNZm5PUqqlnDNhGvv4qgPKOXLMOTLHhl3FSQAZNOXBTDDdW4MwIdf//b9YLlvOx30qjcYMAu7f
	xV3j2drv651WuW2vN//cRLHCQoSaKVWDyx6UXwN2QguljCObf1xuk39YvTa17Oc0vYgeCzYidLB
	GQIWI8+t+2cpkl0GkxcFMo5aayqF6PPNBhe7ZA==
X-Received: by 2002:a5d:4c8e:0:b0:48e:1c2:55a1 with SMTP id ffacd0b85a97d-48e6e500505mr14645535f8f.52.1793561046625;
        Sun, 01 Nov 2026 11:24:06 -0800 (PST)
Received: from LAPTOP-AVI.lan ([2a06:c701:4773:6f00:1cfb:88cc:8567:d293])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba7168sm17032738f8f.55.2026.11.01.11.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:24:05 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: jstultz@google.com,
	tglx@kernel.org
Cc: sboyd@kernel.org,
	mlichvar@redhat.com,
	frederic@kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] alarmtimer: Trace the requested expiry when starting an alarm
Date: Sun,  1 Nov 2026 21:24:02 +0200
Message-ID: <20261101192401.858702-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

alarm_start_timer() traces alarm->node.expires before updating it,
so alarmtimer_start reports the previous deadline on rearm.

Move the tracepoint after assigning the new expiry.

Fixes: 183d00b72713 ("alarmtimer: Provide alarm_start_timer()")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 kernel/time/alarmtimer.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/time/alarmtimer.c b/kernel/time/alarmtimer.c
index ea5be5870e515..f6d2183aa4e3c 100644
--- a/kernel/time/alarmtimer.c
+++ b/kernel/time/alarmtimer.c
@@ -351,10 +351,9 @@ bool alarm_start_timer(struct alarm *alarm, ktime_t expires, bool relative)
 	if (relative)
 		expires = ktime_add_safe(expires, base->get_ktime());
 
-	trace_alarmtimer_start(alarm, base->get_ktime());
-
 	guard(spinlock_irqsave)(&base->lock);
 	alarm->node.expires = expires;
+	trace_alarmtimer_start(alarm, base->get_ktime());
 	alarmtimer_enqueue(base, alarm);
 	if (!hrtimer_start_range_ns_user(&alarm->timer, expires, 0, HRTIMER_MODE_ABS)) {
 		alarmtimer_dequeue(base, alarm);

base-commit: cbbddb6b08cc9900a87cccaa9b22bbe06aa4f50a
-- 
2.43.0

