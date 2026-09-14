Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FC23C2BBE
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789384068; cv=none; b=s3ithvFct3Yc/vQD/WQv6ik7hJCEDFpDL+oARKkZgvG4NyoWARkUa8wCiytNuX0AXCMi5WGo7f+DK0wsBnoSESNRxqi/FakJzvq5XnteLeK7jHW2YvIjXVKyLSEj+suQ/d2Ky+FCg8Q//PpAPF/dOC8Hl31QLuzj/rpsvL1a12k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789384068; c=relaxed/simple;
	bh=YIudiDYLGNoj4A9NVU9BgVrqbtIsGKctNV+f7EjqLi8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JP4FY0JRMYWDaY/nO9okt4uL90HmierDZaBuCkzl9XlpouzW5RohQxMVVKD/u0HZ1a/jRxrG5j+dAId0l2DRo12g3mMajxHbu4NWxbFMH72SuBgaaCSKipPa0zly1FFmcBtIatiy4pBGVwcqKGLdU5liyPWcmTY8WABlE9xCHt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7uz9Dfk; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q7uz9Dfk"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso32688125ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789384066; x=1789988866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7GG9giMI29wn3x6W3uRNMni+msBraAtSxPD+uXArV1c=;
        b=Q7uz9Dfk5UuW+4gSJf0nEBBfxuQE8I5bI2X83L4XfI8CTrwiDuBfa+aiWZbx3/Qsmc
         UzQPAaA82g0jJXKlR2IAYfGNmjZMRd8ovtaYFHdBV4GUMxziJAxh4avsQd4nSuMx/BS6
         TLJEjnv6mNBraiNIo6lkT8rfGpnP8D1sgK0eB4Udjgn7Y8zNDNsPZ3nxrt+awhvkhzVD
         22WXky3fU1/XHyJ4pamaZpzDpuGvEhwsnjM+wk49q+kstTDgZ+bT15+oDGEgFBqXxZz6
         ZpX6T1bX5i1YTLUrEx9ivqdqCyL7zwRTrhR6X7aGXZ1r4RwiaRfwRmPcPv1Ud9dwjNUC
         SLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789384066; x=1789988866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7GG9giMI29wn3x6W3uRNMni+msBraAtSxPD+uXArV1c=;
        b=o6PcuO1SFOW+NgB4juL/vrSe6ICr9tRCvjClzp6dYI2j38oRN9MeLmHGypLWJQvAQL
         YqFYXp9UgAO/sW1Flx4kuPi4fZyDUT9rhues/e2TAGkA2w4yvV+bZh8CvzwXyXXim9NG
         m35Uaqs3NgeUY1qE5NuxJAbbBJ0IF/lv5cP3FzXmPAKxWLSxdq2NWXR6w8EdeyGgB1sb
         viclaZ5KjiCR2IAK4OW9kUnYHlTfWtPdHzjD7ofdPgLIdPKnsBmq8s071yeqb3xynxer
         ueF0rBZEux8klNsAFvhkYVKuFTBk9V2VS28m9wEhTNjyz1Nq/35tuxI+I4pRDytQXYxL
         rHuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAjgiTqHZwYehNeOAal2r8BW2/hwwo77WCBgT91BLiR1kSwqj+Bpx1cRoAifhXVAFQTZMdZ+TV/z0EfGk=@vger.kernel.org
X-Gm-Message-State: AFuF++lZzacGGkmH//zlxSGS5OqdbDG53Zq6cGas7FR3Zq2ohbCUDLiz
	A45B4l8yGPn0YPJ30LBX1n3xfv90+ipBmObTPPJH+yiE2rjnJkWnFaUL
X-Gm-Gg: AYBFou0i7CqJ4cRLbnRdjkqVvCx7+WmQuWwL4wopGnBBIwHkzyUAaZJHaYnH5xTsXXZ
	MUCj06GA0ZbMKnI3OLqZoODx7xBmIZ+FdMfgqUdlKsTktUEgnNuTC/wQqOrrazXRXXzjLIDCYGD
	JvyvdGEAaMD0c930fHFeer9Nyw17U/KLD4dAf4JqrzTaQ+vZNgH+eSjB8U7pagzOP+KtxLaLizP
	s5lIdiURx1LMpqIs5nG4H4Gfmr6Uy9oxVc3yHOjaq5GTVn485DfwARna2t/BGeeDLY5k2SM7tyk
	zY9qs8PdZccaOVsryFpzSxm2xnGNJas65WkX/K598AQwEjn2nBbjMkp+mpVqGRMEoIBniqa97q/
	MpBYMp+BColXnRzEU/Z70JvqmXu6TvIMjwlFL8eKiE/ZYCUUBGfDrI0R5XmH7WazDOthHcnzic9
	HU9eIhBNOgtdooaUUMsCQEv7uKotj1dy2CVWIUg/KYpBATunRc8tr71Nk38yt8YMj43YD9N0kZn
	dmgkxpjxMakIqTHrchDmjyAQDVqFLOuTuJLrm5nNqFegg4t6h1hRKM+oPP6
X-Received: by 2002:a17:90b:288a:b0:39d:e43c:5a0d with SMTP id 98e67ed59e1d1-39debfc0f51mr4690532a91.8.1789384066403;
        Mon, 14 Sep 2026 04:07:46 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9540fd76sm22996627a91.9.2026.09.14.04.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 04:07:45 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH v6 0/2] pwm: Add Nuvoton MA35D1 PWM controller support
Date: Mon, 14 Sep 2026 19:07:37 +0800
Message-Id: <20260914110739.203479-1-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chi-Wen Weng <cwweng@nuvoton.com>

This series adds the device tree binding and PWM framework driver for the
Nuvoton MA35D1 EPWM controller.

The MA35D1 EPWM controller provides 6 PWM channels. The hardware supports
up, down and up-down counter types, auto-reload and one-shot modes, and
independent and complementary output modes.

The initial driver supports independent output mode only and configures a
channel for up-counting and auto-reload operation when an explicit .apply()
request is made. The waveform generator drives the output high at the zero
point and low at the compare-up point.

In up-counting mode, the counter counts from 0 to PERIOD inclusive. With
the selected waveform actions, CMPDAT = 0 generates a 0% duty cycle and
CMPDAT > PERIOD generates a 100% duty cycle. The driver keeps PERIOD one
count below the 16-bit field maximum so that CMPDAT can be programmed
greater than PERIOD for the full-duty case.

PERIOD and CMPDAT use the hardware period-loading buffers. Since the two
registers are written separately, if a period boundary occurs between the
writes, one transitional cycle can use the new PERIOD value with the
previous CMPDAT value. The following period then uses both new values.

The driver selects period loading mode by clearing IMMLDENn, WINLDENn and
CTRLDn. When a PWM is disabled, POENn and CNTENn are cleared. Clearing
POENn disables the output driver and puts the output pin into high
impedance.

The driver does not modify the PWM controller during probe. This preserves
PWM outputs that may have been configured and enabled by firmware, such as
a display backlight. The counter and waveform configuration is changed
only for the channel passed to .apply().

Since the independent/complementary mode selection is shared by each pair
of channels, the driver refuses to change an active complementary pair to
independent mode when the paired channel is active.

Changes in v6:
- Document that clearing POENn disables the output driver and puts the
  output pin into high impedance.
- Document that a period boundary between the PERIOD and CMPDAT writes can
  result in one transitional cycle using the new period with the previous
  duty cycle.
- No functional changes.

Changes in v5:
- Remove the probe-time controller initialization to preserve PWM outputs
  configured by firmware.
- Configure the counter and waveform settings only for the channel passed to
  .apply().
- Keep the disable path limited to clearing POENn and CNTENn.
- Check for an active paired channel before changing a complementary pair to
  independent mode.
- Return -EBUSY when changing the shared output mode would disturb an active
  paired channel.
- Document that the initial driver supports independent output mode only.
- Remove the unnecessary <linux/mod_devicetable.h> include.
- Simplify the WGCTL action field handling and remove the associated static
  inline mask helpers.
- Rename the PWM field and period limits to clarify their different
  semantics.
- Configure period loading mode explicitly in .apply().
- Preserve the pair-shared clock prescaler and account for it in period and
  duty-cycle calculations.
- Limit the period to 0xffff counter cycles while reserving CMPDAT = 0xffff
  for the full-duty case.

Changes in v4:
- Add a Limitations section to describe the hardware capabilities and driver
  limitations.
- Add a link to the MA35D1 reference manual.
- Replace register address macros containing the base pointer with register
  offset macros.
- Add readl/writel/rmw helper functions.
- Rename TOTAL_CHANNELS to NUM_CHANNELS.
- Use unsigned long for the cached clock rate.
- Use devm_clk_rate_exclusive_get().
- Configure polarity before enabling the counter and output.
- Add controller initialization for up-counting, auto-reload and independent
  output mode.
- Configure the waveform generator for zero-point-high and compare-up-low
  output.
- Fix the period conversion because the hardware period is PERIOD + 1 cycles.
- Limit the maximum PERIOD value to 0xfffe so that CMPDAT = 0xffff can be used
  to generate 100% duty cycle.
- Use CNTEN and POEN bits to report the enabled state in .get_state().
- Disable the PWM by clearing POENn and CNTENn.
- Fix error message capitalization and trailing newlines.
- Fix coding style issues reported by review/checkpatch-style tools.

Changes in v3:
- Update nuvoton,ma35d1-pwm.yaml:
  - Add maintainers entry.
  - Increase "#pwm-cells" to 3.
- Update the MA35D1 PWM driver:
  - Organize include headers and macro definitions.
  - Rename REG_PWM_XXXX macros to MA35D1_REG_PWM_XXXX.
  - Add register address macros.

v2 resend:
- Remove incorrect Reviewed-by tags.

Changes in v2:
- Update nuvoton,ma35d1-pwm.yaml:
  - Fix maxItems of reg to 1.
  - Remove unused label.
- Update the MA35D1 PWM driver:
  - Remove MODULE_ALIAS().
  - Add chip->atomic = true.

Chi-Wen Weng (2):
  dt-bindings: pwm: Add Nuvoton MA35D1 PWM controller
  pwm: Add Nuvoton MA35D1 PWM controller support

 Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml |  45 +++
 drivers/pwm/Kconfig                                            |  10 +
 drivers/pwm/Makefile                                           |   1 +
 drivers/pwm/pwm-ma35d1.c                                       | 387 +++++++++++++++++++++
 4 files changed, 443 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-ma35d1.c

-- 
2.25.1
