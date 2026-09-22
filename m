Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8398E3F9F44
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790058937; cv=none; b=fBFikLud+2Sxl6/lHLj4qfNEA/6FzvHPzvdngmGS/EWDKYnMWKEbarEDZjFr7W49ALch9TQEVzi4vRI2T2xPbuuHfptQO/PYkdRPhRSHYTmC54b+85r2ynniRWJUuABLTQX3y6YkQHotGvoo1fGD57YcYa50Y8vXHDaxUG4LAfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790058937; c=relaxed/simple;
	bh=Vu+R/47nvA6CsyN0t24dTNOwXGk/oELWg6WxHC1bXbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uxglRYRBF0LebwGQqwGCeTe1g4mr+fZQ22XVSI+rWVxpdQC2xwxNf01sthg9PhuuHqJ+ZudBm08xlPrIFFerGmvdv+OQtD7OqOJvOphvhjMPfBleWA6qy2Mr9EYA9PByACfsPTFXJQO/yLBpxUgMff4rMG0O7S+tBclSXIqG7Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BVPLMb4u; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BVPLMb4u"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3920so25490525e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790058930; x=1790663730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sKab2b7lNX+8P0jbeNZOEIpA84gtvKGXxFn+uJOJkUg=;
        b=BVPLMb4ujhxO1Wcj3jVFcOgHrsyMCSPRKR8XXr+7CpJ3CnZSritiDShWuBD8VUYSWW
         3vk9XFdC4gBLjN+MewcW/K/Dt/0xsaZQexVZfcEK1f+OqhWmzted8Xv30ucWHPXs+JrY
         CGNE1+CP3VDj3eEPP9CZGxrCov7LcdvcfupjkFYo80DGMk04hHcHPqX74i7IcfOabIxq
         TJiBvybnKhPSDw2taf0sHRfPDNerrRI/091eSpT76KIbYcTPrX9e0O2QG4jX/xHJI6gi
         aVjJ4BvlTifQuG9ouq1ACLVlMQeNfNYBFPdcnNeK1UNMxMDvPa2HE40FaRoeYkpfi7H2
         y3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790058930; x=1790663730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sKab2b7lNX+8P0jbeNZOEIpA84gtvKGXxFn+uJOJkUg=;
        b=WrwrABRqQM8wO/9Au8mhCc3h79/AWWnHx4PWWPUsWrGv6zrQ36VvGoReI+LD7jZekm
         ObZ/6KhYfMazrxSw8DIIWSDFWn9awoptBHzcE772FzFv0isRRjD8mWdkxCu9Ev1B6Cbd
         JQ/jc/3c33lo3cEqOIN7JkBsNMt+VZDKJg6X6uF2aLjOVLeeIlJAXOAc2jJPs0h62BaL
         ExbGrIOf8v+kUt6vwHro5jFT+ClKwAjkM0IxcFOvPQhULtgqg8yf1+5j2KRjpJo6GjVb
         0q/iZJUbM9EVUMORO227DEZDcwPc2g4qD2Oyo2PNa915W1uo4yni7cAlCICPOwZxG+F9
         OHCA==
X-Forwarded-Encrypted: i=1; AKwUvBzjYnAQ1vrW0U5pdzicoBSsqxmS2bzGsOFrvv2/AMojUj5qofw+vAxopv5SlzJul8nFt7IqfInfeASiO3w=@vger.kernel.org
X-Gm-Message-State: AFuF++lQKlTin69CJudPOphHhIuby12RqQe6LgmSdM9/Qlg4t7ee/ggr
	gEC4ARzDgWZUgNBsABmH5mqFGs+j5Iynfyaj5FDLdzqKXy46UWSLGPhK
X-Gm-Gg: AYBFou1o2TfjGv1DTEmsnu5GRo/tJ6eIvHvUuW1GQIGyPEEmNdFSo/S+6xtjox91wT9
	rWAjX/WsCAhhcV+hl/KwGHW2XYE61TWmCFuaCAX7nLrRtoq1rDi11L2HokJDMvUc8FNlmUMR05S
	/Uf8hQkaF6q3DPZ/RfmJXAsO+BvX5YeHeA4XuKT/oTJtiGBVvIIiS3X5ujg3ZDJa40/Zboh2g2P
	RV3Z0TYVMrQd4G0574f0bY+VJV1+HgCTqBGIXinsYiMboCDS6RXysOp17Ih3fq/jcnTqagOw6gg
	V/5B7v0H++gTHwKVFCJc0dKQ5Pk5fdMA8bBgWICytsHDOIJ0K3B8nNpUrK7JUBD71LLBUEirTOZ
	3O0Y0ZRXwaeS20xNOKAWZl4FVQo2YI6DLZoifA1q8GUYvwxEM8x8UCUoFwZokYYlOeMuBuOM7gc
	Guxch0WM9SX1Ni7i0V12AR3zzf0TTSanNv3o9G8fO9Nyf8U/CE7r7hit/dKZMuOVynv+ZCFpRuX
	4Aa44xvi7yTm7hQ4lV7lEYebkR+YcsHe1oow6w=
X-Received: by 2002:a05:600c:3ba4:b0:49c:fc6c:be15 with SMTP id 5b1f17b1804b1-49fc57414c4mr230924765e9.27.1790058929804;
        Mon, 21 Sep 2026 23:35:29 -0700 (PDT)
Received: from TMOROL-MAD.sanjose.local ([192.67.141.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdad3669fsm28551575e9.8.2026.09.21.23.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:35:29 -0700 (PDT)
From: Tomas Moro <tmorolias@gmail.com>
To: calliarifelipe@gmail.com
Cc: bod@kernel.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	Mars-Wave <tmorolias@gmail.com>
Subject: Re: [PATCH 3/3] media: ov02c10: Accept a 26 MHz external clock
Date: Tue, 22 Sep 2026 08:35:07 +0200
Message-ID: <20260922063507.690-1-tmorolias@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
In-Reply-To: <20260905030732.39196-3-calliarifelipe@gmail.com>
References: <20260905030732.39196-3-calliarifelipe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Felipe,

First of all, thank you for the good work on this. 
I tested this series (v1, all three patches) on a Samsung Galaxy Book3
Pro, whose board feeds the sensor 26 MHz. Without the series the sensor
does not probe:

  ov02c10 i2c-OVTI02C1:00: error -EINVAL: external clock 26000000 is not supported
  ov02c10 i2c-OVTI02C1:00: probe with driver ov02c10 failed with error -22

Hardware
  DMI: SAMSUNG ELECTRONICS CO., LTD. / 960XFG / NP960XFG-KC2IT
  BIOS P07RGU.330.240529.ZQ, i7-1360P, IPU6 [8086:a75d]
  sensor ACPI HID OVTI02C1, clock 26 MHz (clk_summary)

Software
  7.2.6 (linux-cachyos, clang + ThinLTO). ov02c10.c there is identical
  to v7.2.6 stable, the three patches applied. Only ov02c10
  was rebuilt (out of tree). In-tree intel_ipu6 + intel_ipu6_isys.
  libcamera 0.7.2, simple pipeline, GPU soft ISP.

Results
  probe            OK
  controls         link_frequency 541666667, pixel_rate 216666666,
                   2 lanes; get_selection bounds 1928x1092,
                   crop 1920x1080
  streaming        1920x1092 at 40.70 fps, steady, no drops over
                   several 400-frame runs. That is ~35 % above 30 fps,
                   which matches the link frequency. Raw SGRBG10 1928x1092 capture works too.
  stream start     one "csi2-0 error: Frame sync error" every time
  first buffer     the first dequeued buffer is always empty
  orientation      image is rotated 180 degrees. This model is not in
                   the ipu-bridge upside-down DMI list; strings above.
  s2idle           7 cycles (rtcwake -m freeze), idle and right after
                   streaming: all resumed, sensor still bound, capture
                   works.
  s2idle while     refused by isys, not a hang becuse the running stream is
  streaming        wedged afterwards, a new open works:

  intel_ipu6_isys.isys intel_ipu6.isys.40: PM: dpm_run_callback(): isys_suspend [intel_ipu6_isys] returns -16
  intel_ipu6_isys.isys intel_ipu6.isys.40: PM: failed to suspend: error -16
  PM: Some devices failed to suspend, or early wake event detected
  PM: suspend exit
  intel_ipu6_isys.isys intel_ipu6.isys.40: stream stop time out
  intel_ipu6_isys.isys intel_ipu6.isys.40: stream close time out

Same tests with out-of-tree intel-ipu6-psys loaded and bound
(intel/ipu6-drivers 71bddb5, built unmodified against this kernel):
identical results, 4 more s2idle cycles all resumed. The s2idle hang from
intel/ipu6-drivers#381 does not reproduce here on 7.2.6.

Footnote, unrelated to this series: I saw one hard lockup (no trace) on
the first stream after rmmod of intel-ipu6-psys. I think that taking it out 
might have given me a corrupt state, had to reboot. 

Happy to test v2.

Tested-by: Mars-Wave <tmorolias@gmail.com> # Samsung Galaxy Book3 Pro NP960XFG (github.com/MarsWave)
