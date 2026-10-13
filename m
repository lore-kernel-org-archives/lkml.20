Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D105172DB
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904540; cv=none; b=rGlWSnjRVTRCnuz031JuDm4thRahIwW4k17OS/Usq37qvWaSGi0KhuayDhw9kLHTHHK/zhKO6gbX3vZPWwDJyrBJTVG3cnxFsTKrYdB8sNacQhXGbcW/9+IKuh4tJ0A6aOnyFLh7q1iNZXldvbH1CMV3xE5qTaEDcJ9tdjsVEjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904540; c=relaxed/simple;
	bh=wOidxVLM17lR1bDj1xmePaeabjfnEZRB6ayeFW+JFtY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZERww6bLGRttnwMhAm74ehilYdL5+6roaSgJ/AXgJdZyu9IihXGOoO1NrI12+7jePoMiQbdcJyi5IpksKBPrFbzKJG9cDN7NpSO5syCsVLTMyuXGBoBBJJaqGpHz/0iNDKPIarB0ud1KUG02gYeu5E/4FMf60JckoZYXoe/8rvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=JZl4nVXf; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="JZl4nVXf"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso864734eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1791904538; x=1792509338; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6cn15OBuDdPhmTCMVKwa2oTSO6nmWiZTOYVWRAj9v6k=;
        b=JZl4nVXfWyLreGgAKG5f8rmt13tT/2Da7dVI1m4gc0CPLbctV4e7lp/Xf00kLrG0oL
         3yp6LYS9nulGLIX+bGAPEOPdFs5yBb7nHfGfqKFyT0fcIacIdZ9G+jVtK/uQ3C9UiFjV
         2WdtyXEOcccAav+Fb52cxCeSoKZcX/HEteinyrjWIFQzHp1P7AhVFQ8qMdjNLGkwzgoc
         Nu4T8dktLrukUTllFQJBUUWq0y0l7UMy+4qLPlTQyxR039sSPUd0jOawAllErbe8ZD0q
         AlpFUAMlX0Ulm0CZUnxu5XMzaqWpSomCEcfVDImI1H5iXOLB99Rn6AtBFcotjFxDZmFr
         aqaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904538; x=1792509338;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6cn15OBuDdPhmTCMVKwa2oTSO6nmWiZTOYVWRAj9v6k=;
        b=MKrsE5xS97Jth6E9DxtHmtCBWrJIyGJ0snErekWpo6hTAqtAfKUdVuRZ0bxD67FkpB
         RZGNLsidG74I6LW/lQQ4EZMi+m/udrqhtqJ63WvuPZsWBxHBWEScM8loKSFxg5dLxYWy
         fKxj/ZaV1wJYsm/nD+dLDz/E5beF0ppgjlcCkS4p/c74zBJ2jMpmwRUNl6zORMBT1QWk
         QFRrWvAHV8qLv6TDtmx1Qkdh9/AlwEfbe//Omet4dHV+r/+FcxDnEhH0ogguM00A45jL
         lzNbGUvLYbugOeWJGlLL1ot9jL+VFbwfZlTmPR3/Rsb+00VJpyIQfariIvm/AuIGKZ+D
         ujow==
X-Forwarded-Encrypted: i=1; AKwUvByjjSrYmWwSvjErC7qzW/n5joadQqf+z7KJlQXF3XZLiOW63SQ2JmduKWmLk4TXci33Iss+MMmiN1be0b8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcCzJeDqYsviDEdFN0qvpiQZ/MRrfwDVNFPgan0ixjjzaCpSl7
	q5+nDuMFGvBvTTuvSpNAToB1kphBMqTtYgSSOhNxGA6ZCm+nGfCEvSxvl0lOVhZkL+m0p8c22Ab
	WiFeLQbg=
X-Gm-Gg: AYBFou3jakulYEFfpLRHTe1xOIrFQPA4rHy9nAI2UkT1qrHae8bq8W3BMHQxzm5YlSS
	NLsi/WvDxXIYZDqKoNn69NW+0/iaKxGoCa+igSgZ7jbhtcmgUyBu3ykk6nQZ3UibnbngWIRwdm0
	TpZFW4ksjmaMCg0Pvq0hX/UGBHZI1/Hr5CWOyKa3/QgMwrQnlOLVjrm8q4lsKUhB3LiCXlvLPZJ
	1IIqbAlgpJ6O8s48zz/GZ3JuHvwVQCQ35DnMkhOH22iyXF7qpb4WjqlX4t1Yt1zC9+EhpR9AMMC
	vaLRz2cxt9HLJQNKTte6xuDw0pcCKZGMMI7th+dDYyktU2wTt+F6nstN10wW/XNRcqewNgP9B5T
	YyNYNtKs3+7k4HNqh8aLg1ZIibDRhxic9LG0R5jpe4XNj3tTlZWLkU5Od/k8Q6uOn7NcJPiMXsB
	GzbGTZvpWEtZDLJJ3mu3JwcRu6rzJi43/KBrDMwKCjYsPt3MQpOnuMDeRtLlgkjpdKhWCicmwCG
	k7Rjxb9a8xMuHM=
X-Received: by 2002:a05:693c:4159:20b0:34c:8c69:529d with SMTP id 5a478bee46e88-3537e0a9695mr19398687eec.26.1791904536420;
        Tue, 13 Oct 2026 08:15:36 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:49b8:4c98:b3d1:72aa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358de54fe47sm30691751eec.31.2026.10.13.08.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:15:34 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Subject: [PATCH 0/4] Input: use designated initializers for acpi_device_id
Date: Tue, 13 Oct 2026 16:15:21 +0100
Message-Id: <20261013-acpi-input-v1-0-53ad09ba82b7@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqAIBBA4avErBPUJKKrRIvSqaaFiT8RSHfPa
 vkt3ssQ0BMG6KsMHk8KdNgCUVegt8muyMgUg+SyFVw0bNKOGFmXIpNopDJdq5TgUALncaHrmw3
 j75DmHXV8D3DfD3ssq+ZuAAAA
X-Change-ID: 20261013-acpi-input-2ed24d864410
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Nick Dyer <nick@shmanahar.org>, Hans de Goede <hansg@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791904532; l=3150;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=wOidxVLM17lR1bDj1xmePaeabjfnEZRB6ayeFW+JFtY=;
 b=3nBJ7LuFCwN0BxizqOoBp4bXcaIg1JOxRLLNOjgImEEFpTUGRJj9GgEbTgxtJDNlq8bnneSjj
 d99NFSj62JuCotFSi+uU6I3ZgrlwgwKTTqUE5MdgnHyI2NX9zANx80j
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

This series is converting lists that contain the acpi_device_id struct,
which is defined in the include/linux/device-id/acpi.h to make use of named
initializers (which they do not use currently). This work is part of the on
going effort in the kernel associated with device-ids [1]

The plan is to convert acpi_device_id::driver_data to have an anonymous
union, similarly to what was introduced for PCI and I2C device ID tables.
The goal is to increase type-safety (most of the existing casts are gone),
to improve readability and to make use intent a bit more clear:

```
union {
	kernel_ulong_t driver_data;
	const void *driver_data_ptr;
}
```

But for that to work all lists containing the structs need to use named
initializers first to avoid triggering -Wmissing-braces. I already have
patches that implement this and touching a lot of kernel subsystmes that
use the acpi_device_id struct and that list keeps on growing. Therefore,
I have decided to split the series per every subsystem into:
- pre-clean-ups that convert the lists to use named initializers
  (which is this series)
- actual implementations that make some of the modules use the new
  driver_data_ptr member

That way the task can be fragmented into manageable and independent chunks
of work and makes this effort easier to review.

Tested builds on x86-64 and a64 in Yocto using 7.3-rc7.

[1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
Pawel Zalewski (4):
      Input: keyboard: use named initializers for acpi_device_id
      Input: misc: use named initializers for acpi_device_id
      Input: mouse: cyapa: use named initializers for acpi_device_id
      Input: touchscreen: use named initializers for acpi_device_id

 drivers/input/keyboard/applespi.c           |  2 +-
 drivers/input/keyboard/cros_ec_keyb.c       |  2 +-
 drivers/input/keyboard/goldfish_events.c    |  4 ++--
 drivers/input/misc/atlas_btns.c             |  4 ++--
 drivers/input/misc/drv260x.c                |  2 +-
 drivers/input/misc/soc_button_array.c       | 12 ++++++------
 drivers/input/mouse/cyapa.c                 |  6 +++---
 drivers/input/touchscreen/atmel_mxt_ts.c    |  4 ++--
 drivers/input/touchscreen/chipone_icn8505.c |  2 +-
 drivers/input/touchscreen/elants_i2c.c      |  8 ++++----
 drivers/input/touchscreen/exc3000.c         |  2 +-
 drivers/input/touchscreen/goodix.c          |  8 ++++----
 drivers/input/touchscreen/hideep.c          |  2 +-
 drivers/input/touchscreen/ilitek_ts_i2c.c   |  4 ++--
 drivers/input/touchscreen/melfas_mip4.c     |  4 ++--
 drivers/input/touchscreen/raydium_i2c_ts.c  |  4 ++--
 drivers/input/touchscreen/silead.c          | 18 +++++++++---------
 drivers/input/touchscreen/surface3_spi.c    |  2 +-
 drivers/input/touchscreen/wdt87xx_i2c.c     |  2 +-
 19 files changed, 46 insertions(+), 46 deletions(-)
---
base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
change-id: 20261013-acpi-input-2ed24d864410

Best regards,
--  
Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

