Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1003B37A49D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790741541; cv=none; b=EV/C1LYV2pAtgnVsHHxkti6pU1j+233Ej6RkdlLD60E5bxTEuKwRRpPjVi1Xb/oBIzd9kudBL+cMjlfE6g7XK7nvIMRTB3W10IWIuUFA3N5Y1edEAujvstrng0tqoOdIu798Tvwwko+tK6oip7NZkdOlqQ+2d/5Txv4+BF01WR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790741541; c=relaxed/simple;
	bh=Wp1kvu8ig+V1YLF872Wz1BqEimyjpUIdi0Dh8iuUZY0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=p0ot5O6d4Z+VRTHzEvtcmrI/ftgKtGxOCLHpbnHrdUxy4pzzwC0t3MnhZEw/dtlCW1hBJMLgEO8hkVIarMgfKCrM21eejuhbxwVvaXYsIfgK2FRyEWn9PmPpnPOI+Vaw2OYstMTGI48UKIYY4n8Kb2kU0l6oBz6ldPAEvbR7cgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ovxJ+Cy1; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ovxJ+Cy1"
Received: by mail-pj2-f38.google.com with SMTP id d9443c01a7336-2e2d9fdf798so3071765ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790741539; x=1791346339; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XaAMebMDjZordO4zemF+dXSXfiyMj2MDwrgVhO9zTiI=;
        b=ovxJ+Cy13JIF0KOLe63RpufsLPdgneU+mG1xwXUHliQbK3icqdAbG2aH7L+vQ8EEtZ
         gdBjGKIn48X6vEqvlGH3gY0ZRLDZg3CkbrI8EXxBwKNvlbAWHlmBa+qZcCwhY4lykGXt
         1mNrQd6cH1tZzpstCpsH4X6ydMpk3h5j3bZaIkuKlybR4VpZjbffvZ7LZeI59TdDi9xK
         3ji1Z1gd6jic1tX1Ad/bmL9iSRLrPe/oHnPlFNpPzOlRysJJUuhSPo+4b4IMttF5NTso
         XT/UIZq8qDbTCxKla9Vz1nuHryq7Ct/CewL29+ylbaBgIuk8IQZ2xJdR/MBvGn3RIYyk
         2uEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790741539; x=1791346339;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XaAMebMDjZordO4zemF+dXSXfiyMj2MDwrgVhO9zTiI=;
        b=NTUFByjZpseaBozPd/M+gYVZ0u/lKfb9kmYK+L9gzLX/QW2P8wFF5r/SdIqgJpc4iW
         db0JLfc5NmGOQ8V867oJDlTlxduHZd2nkPQdfaDC5hy1JBneUg5Fj5MjtW75aDdQEQQA
         3z10uQ3blVfz4LFGDDWnvAlkj0hewwiWajz93yGPgVZRA1c9MD2oR2WKo00EZ7yNp9Pz
         5Jn8taHqOtmXfep3ZGtpZ86+QGrBHOlOcFqPfN9tWg5JbEyu8RL8Yxroqi3p7RaHId/+
         hEsAyGKecn8CQ659US+Uv8aq4KEAdG3BDecPhtgxn8Ve1ojITHPhHQSdHD0qSY+wItIG
         QYGw==
X-Forwarded-Encrypted: i=1; AKwUvBzjdxR+fSRFQfK/adjgEFZLIREcDS7kHZNk/Vc5kvSdMHFETD/JTdYCaWEJDSw5pokvHPOsv0uHQ/hrwhw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJr0a/MooAi55pafGke1b4Q0W3Yb5uS526JWcJbr1VBLGJgsZ7K
	turRt2vhJN2Gp+Fqq/5l/F3fr3aNj5/xC4ehXAcfN82o1HtIaIrNwn/2
X-Gm-Gg: AYBFou0hYUf48Q52T/GZa6xgQC9xbQMAagE7Dn8H7ymDc9HenA3xyZhAe/VMZgFMKyJ
	YdP+KGnwqmorgoe+i7gpWKwyDdYqHUV+D2nGjQN2+rdg313IQdBr6axCgTMnscSU+Ig0D+t1+B4
	wNLpEdPAa8GSwkXaMlANJ41g93hvDMC7fJ5UPcWG5u3U8kW1hcLtvHGlQoLXJXPVDWgAGN0yg5f
	OXa2k3HWu01FmPfDscrwv8sQf/EAdFAEvQboyNzTQxYeXbM4U8keaY/7NiJ5sN8nQmoHGJtMevP
	RdyHJVfI+dhDNneELNj7lv2+UIodFVFb0Cma/zcv5civPlvAA+g2YQKaAuQ3qF5iDP0K/IHAJdz
	MwtwUpNr/4SvROXT5ZD7m6323YS0DAj5RSOlFwdgT9KxjVj2o6OMhTPnT75jP6rcwXkSQr2fnYg
	cRw6aab0/rvv/naKjYNljx6I9xI5BfxMZ47MGg79YyBHcIwk3hb0HTAZP2z8Ja/tYsA/P+BmqFB
	/T5Am4gxnWwPCzjEL4qtsJ68opm4H/cxD+C/SygEJ0vf2tv6EoKa7NSyELSNDqYtmEbG/HIZuJn
	UOhmaqLhqdaiDRXy3Vuw
X-Received: by 2002:a17:902:cf4c:b0:2d8:de9f:9a44 with SMTP id d9443c01a7336-2e2e499dfe0mr1806435ad.19.1790741539055;
        Tue, 29 Sep 2026 21:12:19 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (25.187.82.34.bc.googleusercontent.com. [34.82.187.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2e5c4a240sm160065ad.81.2026.09.29.21.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 21:12:18 -0700 (PDT)
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
Subject: [PATCH v5 0/3] serial: fix IRQ chain race, baud fallback, and uartclk overflow
Date: Wed, 30 Sep 2026 04:12:13 +0000
Message-ID: <20260930041216.155911-1-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series fixes three bugs in the 8250 and serial core drivers:

1. Hold hash_mutex across IRQ chain lookup, linking, and error-path
   unlinking in serial_link_irq_chain() to prevent a use-after-free race
   with concurrent serial_unlink_irq_chain().
2. Allow a third loop iteration (try < 3) in uart_get_baud_rate() so that
   when both the requested and old baud rates are out of range and try == 1
   clips the rate into termios, the clipped baud rate is evaluated and
   returned on try == 2 instead of returning 0 and causing a divide-by-zero
   in uart_get_divisor().
3. Reject baud_base > UINT_MAX / 16 in uart_set_info() alongside the
   uartclk == 0 check so that multiplying baud_base by 16 cannot wrap
   around in 32-bit unsigned arithmetic to a small non-zero uartclk.

Changes in v5:
- Rebased cleanly and tested for applicability against tip of upstream
  mainline commit 62f4c998b297 ("Merge tag 'parisc-for-7.3-rc5' of
  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux").
- Dynamically verified all 3 issues in QEMU KVM with CONFIG_KASAN=y against
  unfixed vs fixed kernels, adding explicit test methods to commit bodies.
- Patch 1/3: Updated diff to align with upstream guard(mutex) refactoring.
- Patch 2/3: Trimmed kernel stack trace in commit message to 4 key lines,
  as suggested by Andy Shevchenko.
- Patch 3/3: Collected Reviewed-by from Ilpo Järvinen.
- Re-sending full series as a fresh standalone thread per Andy Shevchenko's
  feedback.

Changes in v4:
- Patch 3/3: Check new_info->baud_base > UINT_MAX / 16 before
  multiplying by 16, as suggested by Ilpo Järvinen.

Changes in v3:
- Patch 2/3: Collect Reviewed-by from Ilpo Järvinen.
- Patch 3/3: Add missing #include <linux/limits.h> for UINT_MAX and move
  the new_info->baud_base > UINT_MAX / 16 check to the uartclk == 0 check,
  as suggested by Ilpo Järvinen.

Changes in v2:
- Split the 8250_core.c and serial_core.c fixes into a 3-patch series,
  add Cc: stable@vger.kernel.org, and document how each patch was tested in
  QEMU, as requested by Greg Kroah-Hartman and John Ogness.

Hui Peng (3):
  serial: 8250: hold hash_mutex across IRQ chain linking in
    serial_link_irq_chain()
  serial: core: allow third iteration in uart_get_baud_rate() fallback
  serial: core: reject baud_base values that overflow port->uartclk in
    uart_set_info()

 drivers/tty/serial/8250/8250_core.c | 10 ++++------
 drivers/tty/serial/serial_core.c    |  5 +++--
 2 files changed, 7 insertions(+), 8 deletions(-)
