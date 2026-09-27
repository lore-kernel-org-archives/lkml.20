Received: from mail-wr2-f24.google.com (mail-wr2-f24.google.com [74.125.225.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4987A3BB102
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790493890; cv=none; b=s+ZBk/takzRwN8pzw+WN4ews0h4Dm38LnCr3VaR2/a1wY7QIZ9dPwRK9HYctHotKRYwlUGZUseV6Jr24VUDZSRA77nJKzKh/6/ZE4UcF83KvMMPUqWdQATQPIQUQgbuW2LQAN35t5Lr/FO/IcKmhgHT3kTfpu0UtpLXfFRX3tg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790493890; c=relaxed/simple;
	bh=xW52c19N5B0HvZg2cdXK0xUYydDV2eqSHfBDqEmAAMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iEeJH8KSrhroKKlS+VQpCUwv63ktOVwCqeye7HTrdNmR/3eefviZOOreXc16n/Ac2rNOjvPg2hSSPUK2TCUnegRRFDeJu2NoZjepqh4uhPym7+/eLSA7jIWJogkYDobV8nDdZMpBEZVWuw7irYuUh5olotlNIl8wp2JPbvw+Ipo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BQ55nWSK; arc=none smtp.client-ip=74.125.225.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BQ55nWSK"
Received: by mail-wr2-f24.google.com with SMTP id ffacd0b85a97d-482f63546c3so1648196f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 00:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790493887; x=1791098687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wPh+dtt+m4rUtWUI4XkAPhzEPZyJ9dGfUwWmb4GXO8Y=;
        b=BQ55nWSKrpTHmUm0z1gVVbtsBydrsfEvgK/o8R8bIbln5o09Tlu2GaHL4VXYaaUvIM
         6iZmTztkrytjpnGxjvL3YbyzGuj97FrVPAwJjz5wvL0k0h6BzGIG16+N8dq228IijuZ4
         dZMfOX6T47i9g9DDqN3HDUYePe3sbu3//Orx7oG7MAmXT4kAkOYRGDhYJGKAIEa6DX4/
         QmPvBimoCLyQFosA3IZ02Z1Pc+EJGQlpPxFod7/5MW+XLPz1moNpS+PY8Kd0fGsxgd8x
         uUjLz3EtPo0mMWqB54glEFxh+ZNEUzPfa7+xVnZccmYMw3whaBDiKGK3sT9QqC7OIYNn
         gbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790493887; x=1791098687;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wPh+dtt+m4rUtWUI4XkAPhzEPZyJ9dGfUwWmb4GXO8Y=;
        b=rz3YWjJpJEAoDSFhZkuWvujNszJuo6thuPrnivH6N8hUmqPZi/zWjBZf7zUR21yKh6
         13QvV0fgf+kvR1YwgXhTVCOobEMAVRSPhEHD8rkB7kFY+Yq4c9Ij227Jx3Reispl5B+1
         vQOFdky8lZ3A8wRhqMnWlYUEgTwd8Bmd1EUd0CXhJke3HoJdpsI523K31G8IIBqU+WBI
         xVVyYxaOGU40nl+iNhjcpqH9O84uNRrMmnFQynjiDV++f0HI8eipr2rO3K6J29neYtAq
         OCMBqSmVVb7rEr6aXd8bhQoXmQGpHAqEQXlcXDLpjJ1Kg3xPCtqK74F1a4Jp3rtjL16O
         4bRQ==
X-Forwarded-Encrypted: i=1; AKwUvByjlpd/oPL4yT5fW/BIWQHpr3V/U1iqXFnBOZB2o1yOTpdUL3RmHjdb8rb7MzC0NRrlkcj3CqA5i0rIAZo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIj8lcMEzHxJ9ITZjmNxkRiD4T77+eXyakAPhHlrpbocc63HYXu
	whkQFC8IyLnmO9HYG4M2/J9Iet/HZQsUDFmlabCkIsOyevewz6kz1DA=
X-Gm-Gg: AYBFou1Hvf/iGA3Ua+UygFjV6drRAWCglFuVZyC//hTXQcP0ix3O3POrS41UoV96Plj
	8xwQATnq2A1ugS0boOEWq6TCsG0ff1NFXXWisUHeKMWbjXYs7gAvDhyiM7FrJrYLMw3dLCE+w/2
	vC/wznGPC8apZeeDeNJbYU+jUFdDGvL2mLDeXxZcPsNvopPGA2ZZH498wibrXc3BRNdCxEegtct
	rXs5pbh6hArfbi+kStMgAJdWXvPOxcZAkI+zU5CraxZZARL2eq1A7cQkTHg2UXBJYSIME5pzYCW
	6MwUcvpTiw6Alg2hNT6k4oGjqCX974Vd/O1x5b7Q+WNr88D5Nt/vDwDuDoj34TH8weFqIFms8zV
	QH3B7giOf++9JSeJk1J0sw/tnZVszknc1TlDLe6p/JVMrXeMWOTlPx56yCAzPSXzLeZ5tSQfgI4
	gwKOBTV4Pfzlqgw8pRb1zWsIfSkefSffzEbif9bLhG510bVg+tsB9X9MIBOg0HM00YxM8N+ztcT
	VzLAInSDPWoURnbr3ShjMjPJ8+exsJMEMQMJ7Cs9iNb96Y=
X-Received: by 2002:a05:6000:60b:b0:487:c99:8bec with SMTP id ffacd0b85a97d-488717147f1mr17887685f8f.3.1790493887392;
        Sun, 27 Sep 2026 00:24:47 -0700 (PDT)
Received: from localhost.localdomain ([31.223.3.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a74538asm18263754f8f.34.2026.09.27.00.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:24:47 -0700 (PDT)
From: "=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?=" <habilerenturker@gmail.com>
X-Google-Original-From: =?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
To: corbet@lwn.net,
	clemens@ladisch.de,
	tglx@kernel.org
Cc: anna-maria@linutronix.de,
	frederic@kernel.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
Subject: [PATCH v3 2/2] docs: timers: hpet: Document userspace API and ioctl commands
Date: Sun, 27 Sep 2026 10:23:16 +0300
Message-ID: <20260927072425.7892-3-habilerenturker@hotmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927072425.7892-1-habilerenturker@hotmail.com>
References: <87jyo74rbv.fsf@trenco.lwn.net>
 <20260927072425.7892-1-habilerenturker@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a dedicated 'Userspace API and ioctl Commands' section to clearly
document the supported ioctl interfaces extrapolated from
include/uapi/linux/hpet.h, including the layout of struct hpet_info.

Assisted-by: Google Gemini
Signed-off-by: Habil Eren Türker <habilerenturker@hotmail.com>
---
 Documentation/timers/hpet.rst | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/timers/hpet.rst b/Documentation/timers/hpet.rst
index 8bb51d971..007e906ae 100644
--- a/Documentation/timers/hpet.rst
+++ b/Documentation/timers/hpet.rst
@@ -28,3 +28,32 @@ initialization.  An example of this initialization can be found in
 The driver provides a userspace API which resembles the API found in the
 RTC driver framework.  An example user space program is provided in
 ``samples/timers/hpet_example.c``
+
+Userspace API and ioctl Commands
+================================
+
+* ``HPET_IE_ON`` / ``HPET_IE_OFF``
+  Enables or disables the interrupt generation for the timer channel.
+
+* ``HPET_INFO``
+  It is used to query the capabilities and current status of the HPET. 
+  When the ioctl call is made, the kernel populates the ``struct hpet_info`` 
+  structure and returns it to userspace:
+
+  .. code-block:: c
+
+     struct hpet_info {
+         unsigned long hi_ireqfreq;	/* Hz */
+         unsigned long hi_flags;	/* information */
+         unsigned short hi_hpet;
+         unsigned short hi_timer;
+     };
+
+* ``HPET_EPI`` / ``HPET_DPI``
+  Enables or disables periodic interrupts. When activated, the timer 
+  triggers continuously at the specified frequency.
+
+* ``HPET_IRQFREQ``
+  Sets the interrupt frequency for the periodic timer. This request 
+  takes an unsigned long argument specifying the desired frequency in Hz.
+
-- 
2.47.3

