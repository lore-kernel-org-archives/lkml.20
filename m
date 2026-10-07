Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3C548E0CC
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791364467; cv=none; b=WSEPlAHFFN9iLEN+9uBFy3QUMkGFvQa1qeJc0Z1lXIN6TWmEZ/oEt8DAY+1GcaVbaQJfUenUjzhKpHvW1iOER4erP/bSZGE0La2U95/pok08HuZXWxqLEYjME/XgZ9H9A/K8UpYWd6LEuiBhXgVWT17AB9KgY5dQ32nhXJUcVBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791364467; c=relaxed/simple;
	bh=1haQIVkT36yMZQ2LPONfTmKFM5Rpi4SAvxl9vaFUBdw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hMDFyn8aXtEj5iEAbRXGiHyvez5/YdTtx+no8v+RxQU7VWcdZStwaU44H/OuqzqbhmZxrW1S95UM4zVOVxKv7jGDsN0JxYuCyD5d93EZaVGYoPkrxlD9L2DAal50UHE/DPCugDlBRDtc7VJmJyJG84hTWmdcJRgG/RU1vBYHvf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mztPi0rP; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mztPi0rP"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso34627315e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791364366; x=1791969166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oBG4Nfac7OkzhOS50O/7A/RERsw5p2FWRxDEx4wKLw0=;
        b=mztPi0rPLSNoUmEWphbzUQqN3CkColUusFjtUgbnCx574akM0vjCgv+FfO/u0PijSm
         U4dQCbGpH0Je0roRR9AnzvCvLVQOflKZZbPpgcJ6pZB05v4ldKlBXllpYJzW6TWMDbY7
         9QkguUwWERbLDXneRhorSHIXDlXamBF7A9exhLILH6di4gvL0Km5eud3JaKT3j3VZKAt
         HibqDIoqGV4ffFkPFqEriSt1mcCX95dagIZrljrLinQ+mkpQVmeB7zV2Expb39Pp6Lvc
         WHjg6w2b6gbxMQ6fmZvvKt0Hm1pxeHhidEUn+iX3AiAHYJl9a3gZTo2nMqkQFpd+bcO5
         VgyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791364366; x=1791969166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oBG4Nfac7OkzhOS50O/7A/RERsw5p2FWRxDEx4wKLw0=;
        b=0PyoMG4TK0T8D15QZGosJvRq2YB00pESHNTZswwuFVFKWlIjAxzmhJpmjXMZHPqpxH
         4+g/l9EJgmdBLAwpLxia9S683jktBb6O0FyJhK6SA80IgnXoueBAn9wntS0PHVnebpn2
         +X47h7NxUY6CeW1P9t9QG6P1qbLrZcae15Pki1bPrH0r4pb6Edv9UJ7rr/DMUArJX+al
         p9v3TQjmQT/IZ05WhuHvnWSkASbsJ2mmLytq0rdP6mWmrZe0kEo1q6FqGLBtbR59r1xb
         1UCpDtuB1tmnCgYmdHwB6iluGFnTB32hjE3VynOAX8wwP8kbOkX6IG9+LNhCcgFn7/El
         yQDQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpAwhX0A25a8iyGP9J2vK2S3iC+nw7xxAbHw15Paa/stcJ6FPA38sAEGkQ8PoHlGn0Ka7hU96vfGvgeN4=@vger.kernel.org
X-Gm-Message-State: AFuF++lkok4mhNp7zJoupWfJWkG+MqX02mUqF9w66FUVgzcmvbdPLoW6
	BFPydh5+V2EIHRnN67Ji8ITAX4Cg3NHvnnwLWWt1deshf50m8BhVpiC5
X-Gm-Gg: AYBFou2TjTKkt1pQpDu6uV2WJvcyJeV9fIedyYbMFeZjBtPxWkPz+Glh6L8sA+gGYLF
	hFcuF2X48kGXhmNlxzrKnhWZL8Ylw6DLVDVpVxdDfSuTcozCUNQ1fpy09Cc7xU1Lkw250QBGJ+K
	uxtSSG6MWeidE1cmE98ZWmEEYpipC0S6z0kmdklOwAxDYix1BMUQX+clXuvHnp10PFi9/aTL1FA
	B2obVcZpL9p2WElCwbhQL2S0bqtjMihQIz2zTS9VwnWPZKwL+tw8cD7afdT+prGQT0UEwvyl37a
	MW8ZJ0HNJFtrZeJpqYbrnDe20D2JdMlzmz6dlO/y0l9J9GtHj1ZqPsEyzGuW+ihHDhccdocRR/g
	9mX1Ea0RZxYPBYrT2cNfMTfXnlhNikvHDY7N94yqSgBdJu8342Msz0MId0mB0/MnShtNsTj1IVN
	mCgNmoMWVVLFrH5yDfDZM8JbN8rRWLhwcyEM1AYrOQwZKOSZnsCJuUOVcLYNVlkStaQSZ3yVo3M
	8Y=
X-Received: by 2002:a05:600c:3155:b0:4a1:7ecc:b23c with SMTP id 5b1f17b1804b1-4a18041ad89mr18602825e9.6.1791364365598;
        Wed, 07 Oct 2026 02:12:45 -0700 (PDT)
Received: from PC ([176.229.9.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1822af9d5sm17617555e9.15.2026.10.07.02.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:12:36 -0700 (PDT)
From: Jeremy Fareau <jeremy.fareau@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalle Valo <kvalo@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Jeremy Fareau <jeremy.fareau@gmail.com>
Subject: [PATCH wireless 0/2] wifi: rtw88: channel and control frame filter lost on interface restart
Date: Wed,  7 Oct 2026 12:12:23 +0300
Message-ID: <20261007091225.413-1-jeremy.fareau@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two fixes for rtw88, both with the same root cause: after an interface
stop/start cycle the chip is reset by power_off()/power_on(), but
mac80211 only calls config() and configure_filter() when its own state
changes. After the cycle nothing has changed from mac80211's point of
view, so neither the radio channel nor the control frame filter is
reprogrammed.

The user-visible effect is that iw reports the configured channel while
the adapter listens elsewhere, with no error anywhere. This makes an
RTL8814AU look like broken hardware in monitor mode.

Patch 1 programs the channel in rtw_ops_start(). The IPS resume path
already does this in rtw_ips_pwr_up(); only the ieee80211_ops::start()
path was missing it. It is deliberately not placed in rtw_core_start()
so that the IPS path, and its rtw_coex_ips_notify(COEX_IPS_LEAVE)
ordering, is left untouched.

Patch 2 restores REG_RXFLTMAP1 in rtw_core_start(), next to the RCR
restore that exists for the same reason. It applies on top of
ed51a86b787f ("wifi: rtw88: Enable receiving control frames in monitor
mode"), which enables the filter but does not restore it after the chip
is powered back on.

Test setup
==========

Raspberry Pi 4B, aarch64, Ubuntu 26.04.1, kernel 7.0.0-1020-raspi,
in-kernel rtw88 with ed51a86b787f backported. Two adapters on the same
host, both in monitor mode on channel 6, captured in parallel:

  - ALFA AWUS1900     RTL8814AU   rtw88_8814au
  - Linksys WUSB6300  RTL8812AU   rtw88_8812au

Isolating the channel defect. Six runs, full USB unbind/rebind between
each, 25 s captures:

  run  sequence after "ip link up"          frames
   1   set channel 6                             3
   2   set channel 6 again                       0
   3   set channel 6 twice in a row              3
   4   no set channel at all                     3
   5   set channel 11 - a real change          431
   6   WUSB6300 control, same as run 1        2438

Only an actual channel change reaches the hardware.

Both patches applied, five consecutive down/up cycles, 25 s captures,
total frames and control frames:

  cycle   AWUS1900            WUSB6300
    1     6639 / 4556         2274 / 1506
    2     9622 / 7754         2937 / 2214
    3     6847 / 4985         2166 / 1475
    4     7420 / 5542         2493 / 1789
    5     7703 / 5250         2440 / 1625

Without the patches the control counts are 0 on both adapters, and the
AWUS1900 total drops to 0-4 from the first cycle on.

Also verified
=============

  - rtw_set_channel() takes no lock and every caller already holds
    rtwdev->mutex, so the added call in rtw_ops_start() is correctly
    serialised.
  - Station mode unaffected: scans return 28 then 34 BSS (AWUS1900),
    10 then 11 (WUSB6300).
  - Three rmmod/insmod cycles, clean.
  - dmesg: no WARNING, BUG, Oops or call trace.
  - checkpatch.pl --strict: 0 errors, 0 warnings, 0 checks.
  - Build: no code warnings.

NOT verified
============

  - PCI and SDIO paths. Patch 2 touches rtw_core_start(), shared by all
    bus types. Only USB was exercised; no PCI or SDIO hardware was
    available.
  - lockdep. CONFIG_PROVE_LOCKING is not enabled on the test kernel, so
    the absence of a deadlock rests on code review and on use, not on
    instrumentation.
  - Other chips. Only RTL8814AU and RTL8812AU were exercised. Patch 2
    also concerns RTL8723D, RTL8703B and RTL8821A by construction.
  - Bisection. The Fixes: tag on patch 1 was derived by reading the
    history, not by bisecting.

The series is based on mainline 69f80fef3153 (v7.3-rc7). Happy to rebase
onto wireless/main if that is preferred.

Tooling disclosure
==================

Per Documentation/process/generated-content.rst: the diagnosis, the code
and the commit messages in this series were produced by an AI coding
assistant over an interactive session. I was investigating why an
RTL8814AU adapter captured nothing in monitor mode while an RTL8812AU on
the same host captured normally; the assistant proposed and discarded
two incorrect hypotheses (USB power, then a first-configuration-only
effect) before the measurement table above isolated the real mechanism.
It then wrote the fixes, built them, and ran the tests listed here on
the hardware described. All numbers quoted are from that hardware, not
from the model.

I have read and understood both changes and I am taking responsibility
for them; the Signed-off-by tags below are mine. Both patches also carry
Assisted-by: LLM per Documentation/process/coding-assistants.rst.

The patches, the raw measurements and this summary are also at
https://github.com/jeremyfa55/rtw88-monitor-fixes

Jeremy Fareau (2):
  wifi: rtw88: program the channel when the device is started
  wifi: rtw88: restore the control frame filter when the device is
    started

 drivers/net/wireless/realtek/rtw88/mac80211.c | 16 ++++++++++++++--
 drivers/net/wireless/realtek/rtw88/main.c     |  8 ++++++++
 drivers/net/wireless/realtek/rtw88/main.h     |  1 +
 3 files changed, 23 insertions(+), 2 deletions(-)

-- 
2.51.0

