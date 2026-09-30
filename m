Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410244483BE
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790754536; cv=none; b=oz86IEDAsPBj3RMwD+cT8AYh1G1qXDkyVsLvoqJJ/62Bb1Q232ZZ1FjfYIeGyZnNzzWSGHsm/d95/KM1wzaYXWJ6ccQZhWJeOcalfzMbYMNpjrzLesJSIyRVCZOHIWpXsnK4UQckc2/Ef3Byxba9j7l2s37xPkmDf10w1a24z4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790754536; c=relaxed/simple;
	bh=eXAaGtfQqZtfHlLvEQ5eAyQ46SAkAH073bIT8yM0wlY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TbH+2rzj0u9ldCtXS6oRY2nkQAv/AKxiq8nKYWnendGATgJc/MGeE37bFeFulp7FTAObWqboGi5Jre/bZG4HmOoKUb+A+DrKPElPtUK+C/mwWZ/AOnjeMqLQHnOw1DpOvcLT6aqkw/e7PS8mgDG/YID6e/mxChx52C9xqXu9Ar0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I89WJoAd; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I89WJoAd"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4bdf8abaaso3044143a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790754533; x=1791359333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9U104falSUzknxY8qwLcjJ2uwnfV+Zs6GVzKWFFHPQ8=;
        b=I89WJoAd59z6mSk3ACk7YCNOtw+T1zdDt7nmpwI216pz4E0hbWajrtBs3TmV937WJU
         0BxAEKh+HT2LhxLgM1QwbgudxKE0wrtYaEJNzSPgt21Q+CdCLgx/QqceQy3bRI5Gpdn1
         ws3XkKDC7uw0+toxmqq/XcYy5lve96KzIZsMnuA0zDHkIqKlgxasN9gzSd+rmWmkdEBF
         DyRAJW6a4uWmra81XqqxRRN4Vz4TpqoNULpv8Am4PEVx4CUL6Wm4oXV+rjFYOZWxCr+w
         13lBKt66vzzF1wsRkUydOWe7Cy1ur+1cYfWCwZiON8J4lBp3NPtS5iGCENc8km55eEpt
         b2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790754533; x=1791359333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9U104falSUzknxY8qwLcjJ2uwnfV+Zs6GVzKWFFHPQ8=;
        b=jeM1t5dXSfwJSlIcrXyG+6LpIpQRK232082ybZeHvRVGg7wwvzLcm2uuGZ/4raHNXX
         UY952PxrLhq7af9fjZN4w+iGxWuxVKQpO4ahsk8dpWYJUSi058H1ltg2Q6k3DouSiLQa
         EusNSxLDpI+Ydz+wp80mBTi+dAemmNu1NWUDmzBtQyZeh2K+EpOZQIeHXF/StnZ3Q7Mf
         iGmg5HPw3iYhxkozgirCHvuVPJ9WO9DXk38WfmgPTNIHK7GNBt61rzvC9VJRaUaenE5B
         pLXIMQBXVrcr/5p8pN6Y+Jmro/69O12r03Pjalosl2OFvQZvvQYVfCaJMVgOxwSiLD29
         ilIQ==
X-Forwarded-Encrypted: i=1; AKwUvByz0QiGZI9vhYMIc9AvCVJBf3mhD3bfRgvv584BaN4B9M19TCqsXxsQSy5Y4DuZI21TlI2Od7vGg+QYcKs=@vger.kernel.org
X-Gm-Message-State: AFuF++lgq9Lx0UammIfEbxtKaCt+nOIa90aOxgmsOlVdbahfMD13GUo1
	pl+i22yoQAdwwdrA5vqo6xeoukRfw6vwEgvQ7rlcC1hkqK7x1S75QreQN+rLtRk3
X-Gm-Gg: AYBFou3wIjj+1f+HiFiSOp5wbAW6i0AGaA3+UDsLpVCRK1UH/Bzlgw3ELgVvDx+ZqQ0
	afNvHS47cjEynjXp3mjKV4dsyN9gjIZf9/WN49FGq6UdQnbeDZoGDRGFkaofY7fvyDgf6r4u0kf
	pYBvGWmTYeNocWuWDEPfaJU/xiGKyXH/M+Dt8C8sy91m+ArjzSFBbANiR9rtNnfgnq1UouDMhW3
	51BWlpN9JUinkCh7ntL/jr5bFAX9FikvlN/J1Iwj1lBpoqUj5/+hHgkL6yj9BjHCe1tugwxkmk3
	GpNsXeoqgayHJHrcgsmXet2BZGU/DGMwHCb0WN9eDl/ZcNSHgeWL5rONoKCvECK24W/Txh8ze4p
	C2MUxYgneRe4I9z6K4XTfL3bQkm+602CBqufKhjOIqZqqXE3uP2Ti9Zg2WXT9vrgzHtlcZKLNjy
	BC91cEyNrrGhqPzRPyl6CCvq1XjvuyrI/2FPAO5BYdIUjpwAfV/BNbaZHODHtIxs29N/f+5ycjh
	vsyqSGOeGfUich4ZuZVNtvd4HMzRrMCDsD4Qn4BgtJXDLnQzUotsq+rfdUP2vYJh9gsQXz0RSWs
	CrXjADOPShxaJ9HnoWRy
X-Received: by 2002:a05:6a20:734f:b0:3dd:a196:53a8 with SMTP id adf61e73a8af0-3de9e8cf9c8mr532280637.74.1790754533381;
        Wed, 30 Sep 2026 00:48:53 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (25.187.82.34.bc.googleusercontent.com. [34.82.187.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88725881fa6sm376732b3a.27.2026.09.30.00.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:48:52 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v6 0/3] serial: fix IRQ chain race, baud fallback, and uartclk overflow
Date: Wed, 30 Sep 2026 07:48:47 +0000
Message-ID: <20260930074850.465003-1-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses three concurrency and integer overflow issues in the
serial driver core and 8250 driver:

1. Fix a mutex vs spinlock deadlock in serial8250_register_ports() during
   IRQ chain setup.
2. Fix baud rate fallback in uart_get_baud_rate() when custom divisor is
   in use.
3. Replace manual baud_base overflow check in uart_set_info() with
   check_mul_overflow(new_info->baud_base, 16, &uartclk), preventing
   32-bit unsigned arithmetic wraparound.

All 3 patches have been ported to the latest tip of mainline (551c722f4080)
and dynamically verified in QEMU KVM with CONFIG_KASAN=y.

Changes in v6:
- Use check_mul_overflow() in patch 3/3 as suggested by Jiri Slaby.

Hui Peng (3):
  serial: 8250: fix deadlock in serial8250_register_ports()
  serial: core: fix baud rate fallback in uart_get_baud_rate()
  serial: core: reject baud_base values that overflow port->uartclk in
    uart_set_info()

 drivers/tty/serial/8250/8250_core.c |  4 ++--
 drivers/tty/serial/serial_core.c    | 12 +++++++++---
 2 files changed, 11 insertions(+), 5 deletions(-)

-- 
2.47.3
