Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B30A374E6C
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 17:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790442427; cv=none; b=rupbvLrLL8jL1FmBMEeZ/S4Wlapip5jPXXmd+ZyEleCIIgCsI4IGGNq9vVknS9flJPElbSwhwkFLPCYe2OiSFjy9+7cqnLxRyNuNsXc/aaorgiTenbFxGzwA+MMq1XAfGk4gmCqoB4NtQOafRvYlpA/MivenVENh2FVrLlUg7bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790442427; c=relaxed/simple;
	bh=zfp080Q5Qm/dOHYaKVJEgr59LwYdgOlPd4byHKHoi8U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kec1DcjYQEN/CwC7lyt9L1fEmrv6Q6avUM2SIwphRfTGl5iYMokbNm0C012U/RvNWSJcG+G0yIqG9j9/zYS73fELxsuu80R5DYfs0yhZN4iMBvgjiaU+/FxNtApNngj8A1AYcEaVcqC1wILqqV7RVB6jU8zIpRbtKgbb08R3pHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zztc9w0E; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zztc9w0E"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843378fb37so1053150f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 10:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790442424; x=1791047224; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rc7SH1+oiRz15YUA9wEx+QwM/I7YksifiQ55uUhZaVE=;
        b=Zztc9w0EfCda0j81EpJD7zA61N6tqk0DQB/8CaFtcyB4K0+RHetcD8tBWl6eVYA1cO
         n2daNERx9/on1PDD4Evm47b1NmXxoNVWUFF7XOeijlFpCcl1TvuH8I4qktJ9nieQtl/i
         UtgNXH18TUE+IrrW0RCPEhnwkMfXjBxmADMLvVY7g6IDtx+ER6MyIRVvjvZt2kTmWeft
         Wsj0dCIm1COwLOdEEoJgzFAzhOsw3xkhJvJWq5aHr0rNFL51i3TPCO0icj7nbpwJfMFH
         +fCP1dt5IOMWuKP8andFUjkWYXgtV/7j/8vcDXYl0VrqGCzvdatKaSbkkHSQ9ltfg5hW
         sLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790442424; x=1791047224;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rc7SH1+oiRz15YUA9wEx+QwM/I7YksifiQ55uUhZaVE=;
        b=cJo4jtbIoJ9J44J9hMmhnS9k8aSwjZ/TWzrq4DyowyvgxWnL7nVUSVcbdmVrKy1fhg
         S7CSdqY9JOh3TmY3crVok1wZX/zrKqkzoyJwwe9NqVAm6oJEvXobbHECz7FsBrFTAI5V
         eTygD/2cQiUG9zztGruwIgrVVkiOV0VMQVcyNACnW0Zsff1WNUGGSL4tnZbspxY/TKK9
         9dXUM0JNa2S3CkXmaXULCuPX3y6/cNQuDZYHj/yw7Sn6pAWXOrznCaNli6UWdDmwih2l
         fTI/diT9nhSSCOhDn9EpKkm6UBbStWzY8GPlk7oGU+LTX+BqB3gX4khLXMZ5RV1j8GwD
         E+6A==
X-Forwarded-Encrypted: i=1; AKwUvBwaKBPQEFAG3gkM/DOCa3YGyUf81JviGQytBIm/462/3JRso+QuDXC53g6WVEQ5TALugrJgQaWusube+Uk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZrry/R2yo1AvKY7bHzVepfMN7flvHuzAOgGSqYq3DPQ3O0+U1
	VmrbJFLQSn6OiYjxw1oZctJmvrAaOxSYHGimUiuBuOgT6/HkrDhvCSc=
X-Gm-Gg: AYBFou3WKS0k4P1YhAOU8KeKxqe/g0DNh0PHIpKcwKaRtyeUZRlhct5oXYJzPo2jDqT
	qHWpTNDVKODvncVV+MgH5u8uE7HQMOliReF4TFXm++1nwPaFOPbOri+GjvIH4twCsqsvm4Ljias
	PCc1E8DZ+Xx8zFVFSmI8oWJLq/Vn6CxKkYppW+QvJvrPkYj+rdLcSsXGqL2P2Yb0ycTUmS4nrQf
	HeRuMSIEZitWZWhHqeDeN8xTx6QUtRaWxTEY2pk+DEuvqCQ5oPWsU8vL1UhTFRsJo6LENLfE1lr
	2O8vTgTTOBCD34oeQyQ02cBOoNa/R2aChHnedwHXlPa5ZC1v+r/r4H/Kd5qxTCSgvh8j0lctRRh
	A21Cx4WvjB3oi9L+6SKAm5aBjUwJt8+Ozj+WKgo4dtIT9jPR9cWmwRQ7SFdGTh1ea+mgBGwBpba
	d7khCHzGu1pudF2BOdPdjHeipEfa5SP5nCtBtmI/qEdWBhmwJyNC9wA8MTT3QjA8NzthpQwAib6
	TYN/WxP6NH++Qhzhz9wqMRe2FeY2bXpxULDm+6pr2NcfnY=
X-Received: by 2002:a05:6000:4103:b0:488:7496:15b5 with SMTP id ffacd0b85a97d-48874961605mr12187402f8f.47.1790442424390;
        Sat, 26 Sep 2026 10:07:04 -0700 (PDT)
Received: from localhost.localdomain ([31.223.3.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64ed6esm16561651f8f.29.2026.09.26.10.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 10:07:03 -0700 (PDT)
From: "=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?=" <habilerenturker@gmail.com>
X-Google-Original-From: =?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
To: clemens@ladisch.de,
	corbet@lwn.net,
	tglx@kernel.org
Cc: skhan@linuxfoundation.org,
	anna-maria@linutronix.de,
	frederic@kernel.org,
	linux-doc@vger.kernel.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
Subject: [PATCH] docs: timers: hpet: Modernize file references and document userspace API
Date: Sat, 26 Sep 2026 20:06:49 +0300
Message-ID: <20260926170649.6346-1-habilerenturker@hotmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current HPET documentation contains outdated 'file:' prefixes for
source tree references, which breaks proper rendering and hyperlink
generation under the modern Sphinx-based documentation ecosystem.

Fix this by modernizing the paths using the standard literal backticks
formatting. Additionally, add a dedicated 'Userspace API and ioctl
Commands' section to clearly document the supported ioctl interfaces
extrapolated from include/uapi/linux/hpet.h and samples/timers/hpet_example.c,
including the layout of struct hpet_info.

Signed-off-by: Habil Eren Türker <habilerenturker@hotmail.com>
---
 Documentation/timers/hpet.rst | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/Documentation/timers/hpet.rst b/Documentation/timers/hpet.rst
index c9d05d3ca..e21a6185b 100644
--- a/Documentation/timers/hpet.rst
+++ b/Documentation/timers/hpet.rst
@@ -23,8 +23,35 @@ The driver supports detection of HPET driver allocation and initialization
 of the HPET before the driver module_init routine is called.  This enables
 platform code which uses timer 0 or 1 as the main timer to intercept HPET
 initialization.  An example of this initialization can be found in
-arch/x86/kernel/hpet.c.
+``arch/x86/kernel/hpet.c``.
 
 The driver provides a userspace API which resembles the API found in the
 RTC driver framework.  An example user space program is provided in
-file:samples/timers/hpet_example.c
+``samples/timers/hpet_example.c``
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
+  Enables or disables periodic interrupts. When activated, the timer triggers continuously at the specified frequency.
+
+* ``HPET_IRQFREQ``
+  Sets the interrupt frequency for the periodic timer. 
+  This request takes an unsigned long argument specifying the desired frequency in Hz.
-- 
2.47.3

