Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008985;
	b=wPssBKw+3h6+VhKPEx+5i6yII9YGXX+CT7nq5vLWe4qmKIGg4T4g2lPF6v1JvxGmR45z
	 ufEb0E8mE6AyrFFmsWlE4vh/cwKjCdigErzOUwuaMf+0NW1JYBI8LpdIZPxedOCBEKzVx
	 6q8d832tSvxpS9iVFQr6wC6X0obf4chNnXLZ+/BPLot33fScJtpJzORVOiKwtOQMLKsq9
	 aLsD++NxNgxa0+22rvHKfVB3dqzyAZ+4SrxiJRE0s53nafAXs9BK4cIUL92yM9EahwAkZ
	 K7qE0cMkJ88OKVGQ3i9OTqYIe7br0kiLkR6masOC7wZMr9c2g1CG42yFt2AzcXwrLvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DXpJqO2ckp/EX7hz6QTsLqnm/+vAUv9IUn8k0FN2zk0=;
	b=CTiRD3Sbb9rxVreh7m6j3Vs6sPsk9x01EyJcdXFs2x9Zgk+yBQOdLQk3LPgajMF6s1GO
	 PMLKZ7J1s0DTZAWDWrKc8mHem3Vp1N8KYpi3/xRHB1k++oziMEsoyUwWgS5qbjScelIib
	 ZH/mj7kHWR4NTV2E6AkPuSvIOSE5EaY88GJs4/zTSJxLnogLZ5GYfFdCfc+d/KAmK//3d
	 RFryYEkXxV4bhQI7IDt+mJiiO7RS9wrzIxfYq5rhlh7JewWQ6ZsEOjlHli/nh9i7B3aTK
	 uBKmsqnUSzNB4xmn1pMFnrlVpWKMerQQu3/PD0FogN64ytznjOPzGygE46VIBYt+PVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Th5kBiS7;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF88A606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF88A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Th5kBiS7
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a06454116eso1106708b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008984; x=1793613784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DXpJqO2ckp/EX7hz6QTsLqnm/+vAUv9IUn8k0FN2zk0=;
        b=Th5kBiS7rQtx+ZPtW/XI5NlYv6ndEQ3BLDezHD8vkN20oXlVNQYo0W6lygaeZTsa41
         K2mBJfF+KE+C5HfJCuCdnedjJYJ23bbgYoOBwQ2+3tpdRi66VCh1eKlWxr+VuyVfhmXQ
         vsn+J4+QTkHXgZf72WHT2VcW+Y7pMKcz1FAceJ3erRT03CkcjYZBCJIbDElB3mf/F6F+
         ua1i4df6eyognp+CJWF9IDzGAIX9GKjVnl4dCU7dIl9cnYlwGook7MHredWDCY2g0IVp
         jxQCzf8804PZ+thtHYb5wAMGGOY+AFej6GxUSOwRf+72IR+49AQhfcC3Ohqc2ZtbTn9D
         HNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008984; x=1793613784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DXpJqO2ckp/EX7hz6QTsLqnm/+vAUv9IUn8k0FN2zk0=;
        b=N04WLFNdE+fQtDXPPKz65x4kW+/Ps67fuyxb3S7I/8n4e9Gx5ynt8snUlNl8e1U0eK
         3Zq6VLEFjIVKcesfeQ9frakM8ur/EOpRKiFDU/LETSJqbCG2MnMEKtcF5jV4xJroPJyt
         +2M+2xrbt56W2vR/MBao3qgqXtwcXtg1CEbQy4bv0nSxbXJD8b2xMDujCAp1jtaJCVTp
         KsHzARngDrn3sbC/2ozsA4Nzsx5okyhSBAgd7mP43f1goXe6t4KY0ef1vcDTehRu0r61
         zi7Oqb+eiLIHuwa9m1AhfLmq0mJrMhKKNZQNqEw1Q9fnXirjcirgl6QOmOym3+xk1zr5
         dSdA==
X-Forwarded-Encrypted: i=1; AKwUvBwo6OOOepk7O16GicUYk74562bxc+rsTUgRLUBQxJ1ysFE+3Z9AnJbkFumXc3vmmVkg3xcXx/n5Cpj2AUU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXraHFGogp/0owx60QMC0hHgy6zwOcFlZGC7alrwEpwgm5K5Ws
	gs22VAUfiiOH0JLfiFZWIwhot5gqIJrztUevC3TIIORoTWCHFK/JXk8+
X-Gm-Gg: AYBFou330ocSVJSFEFRL8icd+FzrKRm8D6/Tp+xn1Cf6NVkWr3tr0EC28dk5qfM5170
	wkNBr1hG93oQ5hVRCg9QNwXkDo0KhTBgrT2WJuWlCecCK/4uUWXl0kLGDP6GGYwtROo6gUe8SPg
	dIq5Fse+FKJ04EuVJxBVU4iaF3twkxG+/2vBeqTPwny/Xm+HuXRBA78MMOMDlAxeMiTtxpk/aXB
	ZhiarD9kJNIsT4U2aC0s84A4lp7KVZPfMeucKtlTi+eWJFVI3subqLA6P1BaPQqFeEbaYuj3p1G
	KmXoSy1ncepaC4khP/6JUdtjPkj+JsITstaiNYpdUShJlSa40sKq9xnNq0XKeauVy9cqXk0QfcD
	vyuMXgJjJEydIWlh5+0CdL8fmHaJBLFGefyBs4boA3cLVICciZRWFCoGpRoOnyRsN3PhCafmVEp
	QA3AXQNdg27OHMQYvuhzGE8ytrzuFH7eJ2wvFpZtgCHaFHTN8UZ0nkiAvzW6n+mpYfDYEz6HZiM
	EbGljHffx+BQ5rXTnpMttnr0KLVsTKaD9URWSN8QX6WDF8tm4LtJw+c6i9X1Em/etajTb3BwBK7
	hpKSjA+ZdhVgt3cvNeL24BlDjrv9eDv0BC9olCxrqVXlukR1sKpgE5MkBhmPJqngPzbjnQqcUMH
	IPon4QgHJ16LdyHpO5NtdNt8FaBa7
X-Received: by 2002:a05:6a20:6a22:b0:3e2:8c30:2e4f with SMTP id adf61e73a8af0-3e7cd4f5d8fmr4700592637.66.1793008984058;
        Mon, 26 Oct 2026 03:03:04 -0700 (PDT)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccccf37esm1425204a12.27.2026.10.26.03.02.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 03:03:03 -0700 (PDT)
From: Yu Zhang <yuz08559@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Yu Zhang <yuz08559@gmail.com>
Subject: [PATCH] iio: trigger: fix use-after-free in current_trigger_store() on concurrent writers
Date: Mon, 26 Oct 2026 20:02:46 +1000
Message-ID: <20261026100246.68005-1-yuz08559@gmail.com>
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

current_trigger_store() holds iio_dev_opaque->mlock only around the
INDIO_BUFFER_TRIGGERED / trig_readonly checks and then drops it. The rest
runs unlocked: it reads the current trigger into oldtrig, acquires the new
one by name, stores it into indio_dev->trig, and drops the old trigger's
reference with iio_trigger_put().

sysfs does not serialize writes to the same attribute issued through
different open file descriptors (each open has its own kernfs_open_file),
so two threads can run current_trigger_store() on the same
.../trigger/current_trigger concurrently. Both read the same oldtrig, both
overwrite indio_dev->trig, and both call iio_trigger_put(oldtrig). The
extra put drops the trigger's refcount to zero while it is still in use,
frees it, and a concurrent writer then dereferences the freed trigger.

With two sets of writers hammering current_trigger between two software
triggers on an iio_dummy device, KASAN reports:

  refcount_t: addition on 0; use-after-free.
  WARNING: CPU: 3 PID: 3467 at refcount_warn_saturate+0xbb/0xe0
   kobject_get+0xf6/0x100
   current_trigger_store+0x15c/0x4b0
  ...
  BUG: KASAN: slab-use-after-free in current_trigger_store+0x168/0x4b0
  Freed by task 3468:
   kobject_put+0x125/0x220
   current_trigger_store+0x2cc/0x4b0
  Allocated by task 3454:
   __iio_trigger_alloc+0xc7/0x100
  ...
  Oops: general protection fault
   __module_get+0x27/0xd0
   current_trigger_store+0x192/0x4b0

Hold mlock across the whole operation so that reading oldtrig, swapping
indio_dev->trig and dropping the reference are atomic with respect to
other writers (and to buffer enable, which the -EBUSY check guards).
Acquiring the new trigger with iio_trigger_acquire_by_name() under mlock
is safe: it only takes iio_trigger_list_lock, and the buffer path already
calls iio_trigger_{attach,detach}_poll_func() with mlock held.

Cc: stable@vger.kernel.org
Signed-off-by: Yu Zhang <yuz08559@gmail.com>
---
 drivers/iio/industrialio-trigger.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/industrialio-trigger.c b/drivers/iio/industrialio-trigger.c
index 76926fe..9241cd6 100644
--- a/drivers/iio/industrialio-trigger.c
+++ b/drivers/iio/industrialio-trigger.c
@@ -441,17 +441,18 @@ static ssize_t current_trigger_store(struct device *dev,
 {
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct iio_dev_opaque *iio_dev_opaque = to_iio_dev_opaque(indio_dev);
-	struct iio_trigger *oldtrig = indio_dev->trig;
+	struct iio_trigger *oldtrig;
 	struct iio_trigger *trig;
 	int ret;
 
-	scoped_guard(mutex, &iio_dev_opaque->mlock) {
-		if (iio_dev_opaque->currentmode == INDIO_BUFFER_TRIGGERED)
-			return -EBUSY;
-		if (iio_dev_opaque->trig_readonly)
-			return -EPERM;
-	}
+	guard(mutex)(&iio_dev_opaque->mlock);
+
+	if (iio_dev_opaque->currentmode == INDIO_BUFFER_TRIGGERED)
+		return -EBUSY;
+	if (iio_dev_opaque->trig_readonly)
+		return -EPERM;
 
+	oldtrig = indio_dev->trig;
 	trig = iio_trigger_acquire_by_name(buf);
 	if (oldtrig == trig) {
 		ret = len;
-- 
2.43.0

