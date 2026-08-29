Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C95F33DEFE
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 05:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787982254; cv=none; b=dBN/I3Bh982nlJ/X1FGQUSlapuXKjZz2eoAeVZ4PeGMNLPGG0GgNXT40VyNJF4M9vnC+UiR1DQWRPVRhTGYcXiUhog7jMyTo+bZso8iznxLMH6dr/SRqUWwV+Mzy9rFqqhs3UzsIdrFgZIQqJGa3Me6YvXAhHB/aCDUoB3/pUZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787982254; c=relaxed/simple;
	bh=s7x+XT7twofG9og2w8jGk32dMAfwXH64F6W98A9Ibps=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YGvM8+PocOP4EkLrZOtUVzte5nGvLljnvySUy7WWwGhrvmcVC06BnUZcb6lfwGBYa6UwzTKbWFUnuFK6DCFYnJT3fSTpvJIsJHcvBVcPKEUcjvVyHY8KMOpGPK8e9Ml7ZylBCcfWUhEpqhs8jvHcnG4imuOEJq4GR2HH6o4LkOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j/ldP9QW; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/ldP9QW"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b5e1340faeso1537541e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 22:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787982251; x=1788587051; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vI59kp9i40CaL7KCdZsgpeCu/2XK4NogoAP3+LqdgNI=;
        b=j/ldP9QWZZe8VdQzYaF+PZdECiTOL0U31DOw4sOjI3sdMe6KOBZBdU3vZdcuDaT8wz
         /XkbXKsjXnrN+1dFbNuFOStw9mIAo3h5K2i7UY8mk4Nie1zBQl/238V33J9EMobEMB5N
         2Xh905EKeQU9E8wJf1C/At7GCZ2DIrzwBLREkIm18cxK9oyilQCY10ob2D15PjBdqS4e
         UTKXlnO7XykAV4C3q1lpUvtlxKDyUDz+wjP7+Z6rZnIHOe4cHtrO3k3jch9b3weWUmFa
         x+kdbMJNjmLstruQgegw5r9QAARVHuQ4pg+jAGgQq1iafcpz+jZq/Apt6UK5PiZmVqxP
         Fw2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787982251; x=1788587051;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vI59kp9i40CaL7KCdZsgpeCu/2XK4NogoAP3+LqdgNI=;
        b=O8pGTOBMDv20WPUXQMQ2gMBkEbUz7OLNAckVlvRCrKDNBug01qzIG4rs8H9ulo2NXc
         7lj5nR/9WzC/M7als3lr2S5zr2O6VE0airHzvD3URUCpIPcjDhaZ6Z4MBZ6V5hH9sY1Q
         GcjVzk94nX0s8aNEoAuTsRci57hbYMJssMqI3ccILKZUdZuAE5iPo05Ls+lPafsisB8E
         EFsvhMs+8KLimyNzCz3hejC4KFX4TV2SeMPl5hgX+0XDo+q8zvjJ/rrH6POkQkLr8xAE
         bAQUoYK7gk+5ll34QIaAPU00r6rx2TxGItVX9GF+ChDIAylsammT9gLNf23Q9F+zmIC0
         3OJQ==
X-Gm-Message-State: AFuF++ksQ/0IGyvr+RAFr9Jd5snMSkESq4rHYihXgYtLr6r+rmR60V1c
	oUy5foeh7NwIufrps/ZIBYaN9wQmUs9NEm2zdM/UV1tbj2szvODTB6s=
X-Gm-Gg: AYBFou2LeM6EnNZR9jhahfg2WUGM9s2qJBkHc1LjMkOvPNVdISdcxS2kjLbYqQ74jpm
	+z3l3N4JxybUf2CUFlEs7jFjHlz675RDQkcfbFwdGDSu9w/nZfXuOqld5D4x5mMapCqDBiP72xb
	wh0C0GjVhmEbK/eYRV+fqM17ZFZiE0b9qv5IVt90DF66Kn5vCwfMcGG7jDN5F9iGGYPawIEPlGw
	xQRYhTjYl+hDb+N9HVZXwas3drJrHrkxegaIL8A9+1pAMXYlZ6+Ty1d3eF5sA8gxeSEcNl53WYt
	pK5/HLMph6Wxo6RtAhPki+zBI7niHHM1uvt8H7Z8A3fhutGZZJV+yBnajCKP20pTqwlcyLYezw6
	IFixg9oykBnG04Eh+mw9kyhfnaqSB2QlKCnwUC4FUo9Za1RvcNvUzrbjrkTGQ1pIkarKhMqtlPz
	BSn1UWWjm9f5es2gG4v61Ieyj2QWjk9DlcGebzZ1VW7P3rc1vr08q1eUiThlytw+TqobX1LtlxX
	MSjsCyr6OHkTXD/OEaOtbnfJIsVQsCgj0fN5KXPnCFy0i64+g9zHTlBjo9N1QzlcNAFF+HCWUmh
	0Uh1kis4w+p3bFY=
X-Received: by 2002:a05:6512:1248:b0:5ae:ba27:ee63 with SMTP id 2adb3069b0e04-5b5e68b7b83mr3566744e87.7.1787982250393;
        Fri, 28 Aug 2026 22:44:10 -0700 (PDT)
Received: from nn ([2001:1ab8:1003:0:5454:f357:ba89:4e22])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e89c5b86sm803040e87.12.2026.08.28.22.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 22:44:08 -0700 (PDT)
Sender: N B <gen.benner@gmail.com>
From: =?UTF-8?q?Nerijus=20Bend=C5=BEi=C5=ABnas?= <nerijus.bendziunas@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] wifi: ath9k: cut USB round trips on channel changes
Date: Sat, 29 Aug 2026 08:43:57 +0300
Message-ID: <20260829054401.1198574-1-nerijus.bendziunas@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Every register access on the ath9k_htc devices is a synchronous WMI round
trip, so a channel change that is nearly free on PCI costs tens of
milliseconds over USB. These four patches take round trips out of that
path without changing what the hardware is asked to do.

Patch 1 writes down the eight-register limit on REG_READ_MULTI() that
ath9k_multi_regread() has always had and never stated, so patch 2 can
rely on it. Patch 2 replaces the ten-queue ath9k_hw_numtxpending() poll
in ath9k_hw_channel_change() with two multi-reads. Patch 3 wraps the
read-modify-write runs in ar5008_hw_set_delta_slope() and
ath9k_hw_start_nfcal() in the RMW buffer. Patch 4 drops the departing
channel's noise-floor readout on a fast channel change over USB.

Patches 2 and 3 sit in code that PCI runs too, but there the multi-read
is a loop of ordinary reads and the RMW buffer callbacks are not
installed, so the register traffic is unchanged. Patch 4 is gated on
ATH_USB.

Measured on an AR9271 (0cf3:9271), counting WMI commands with a debug
counter added locally around the driver's channel change:

  full reset, unpatched            182 commands   ~92 ms
  channel change with 1-4           44 commands   ~31 ms

The queue poll alone was around twenty reads per change, and the two
read-modify-write runs another ten commands.

The second row also needs two changes that are not in this series:
taking the fast channel-change path on same-band retunes, which mainline
does only for off-channel scan hops, and a mac80211 fix so a monitor
retune performs one driver channel change instead of two. Both are
separate, and I am not asking for them here. What this series
contributes on its own is the round-trip reduction that those then
benefit from; mainline as it stands sees it on scan hops.

One note on how this was checked, because it changed the series. Two
further patches that also cut round trips, skipping the PCU
re-initialisation and the WMI_SET_MODE on a fast change, measured about
twice as fast again on a channel-switch latency benchmark. They also left
the receiver dead: ath9k_host_rx_init() is what clears AR_DIAG_RX_DIS and
AR_DIAG_RX_ABORT, and without it the radio retunes correctly and hears
nothing. The latency benchmark could not see that, since it only timed
the tuning. What caught it was two AR9271s coupled over coax, one
injecting raw frames and the other capturing. Those two patches are
therefore not here. With patches 1-4 in place, the fast path delivered
90-97% of injected frames on the standard 2.4 GHz channels across
repeated runs, against 95-97% for a full reset on the same build. The
spread is the rig, not the patches: the same binary can read differently
minutes apart, and the fast path shows that drift first because it does
not recalibrate, which is the reason mainline limits it to scan hops.
Those numbers are from cards on root ports. With the receiving card two
USB hub tiers deep, fast-path reception was unreliable with and without
these patches while full resets were unaffected, so that is a property
of the fast path on this hardware rather than of the series.

Nerijus Bendžiūnas (4):
  wifi: ath9k: name the register multi-read limit
  wifi: ath9k: check all tx queues with one multi-read
  wifi: ath9k: batch the read-modify-writes of a channel change
  wifi: ath9k: skip the departing channel's noise floor on USB fast
    changes

 drivers/net/wireless/ath/ath9k/ar5008_phy.c   |  2 ++
 drivers/net/wireless/ath/ath9k/calib.c        |  2 ++
 drivers/net/wireless/ath/ath9k/htc_drv_init.c |  7 ++--
 drivers/net/wireless/ath/ath9k/hw.c           | 21 ++++++-----
 drivers/net/wireless/ath/ath9k/hw.h           |  7 ++++
 drivers/net/wireless/ath/ath9k/mac.c          | 36 +++++++++++++++++++
 drivers/net/wireless/ath/ath9k/mac.h          |  1 +
 7 files changed, 66 insertions(+), 10 deletions(-)


base-commit: ca800a9302764c445de0da0e84d2252400a770ee
-- 
2.55.0

