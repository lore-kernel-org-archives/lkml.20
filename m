Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C29B3B1ED7
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789572779; cv=none; b=YG1rraEZTtnN6uxtbUHDQN9LFrfynpSLedhm2M0FUmq/hqSGNaJUeDn3Ih9yOgR0XVI+9AjpUKARMW80Iuc5mGMy3067EA3wWUDP++08OePOaGSOJi41VbCJ8xLhVEdloNKhdLv/Xbj0gxLZ6Ii2qD6Ri9MSJT6L/dKdNkwHKGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789572779; c=relaxed/simple;
	bh=IYbKAjC+XevLLWnemG/24PPnEt0MwC4w6sWShDEwVYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BY5NhI/XIvyKC5Mj9IaCAcguY9QsvZB/eXcm6HCnrNC3bfAiK/yhlYzIrKnq5oDyTpuFfv1MiV5tI6Z/1uej0F03dSFhoZd0j6GHcnQmPyGx0ztDZlC/upzwfUbnd7HcOQAbvpdnf8y2H9fHbcC7IY0DFpac7Cbt9WQakqAhFRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n3ZWlDED; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n3ZWlDED"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a64c7cdb46so1786670a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789572767; x=1790177567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GjeAcrb3abMYrxj+wNTR8SKdBQQ+y/3bUnZvlyyWVjA=;
        b=n3ZWlDEDHJKHjO9GkZ0wq9y3HKkO587B52SoRmnq1tQgE6QKevVWtIuUcBHZOQize5
         OZLOjFzmgJ44mHEtYJa9na3pO4FrwLMD/jtXQ32trDCOKJUslVUkawl+owAogUfjIjiz
         NPJn/KNfXP8k1v3+jaSll6AdVQLtPWm3g65lY4zGzZc85jv7TVhWUXNW6xkqtwBQY4zT
         rqjfLolPn3ikMaNaPKGuWN7g5xEN2mO32Aw5vmsX7xI+Nk8T6U8HHg8Bo59dOald7D62
         0RMlvVs4Eg7XLS1LvSv1hw4vMKBjWe50N+s3ZF64qk+gBByRH+HsE41oOAdAG3v3VWl4
         Jp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789572767; x=1790177567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GjeAcrb3abMYrxj+wNTR8SKdBQQ+y/3bUnZvlyyWVjA=;
        b=ODohmd7NK7QTcm5KQoEbjl5XBnKIAnbu9B4yLkTQ3ETMIj3mJhS2k6YfBBu9JPNzJD
         IcM7IdnrdIpbR3INHAqRiAf+NuLKPxTjl0zr5VxZHKawsvIWupq5kMFWYWKW1O0Bo5YZ
         +D1fcQirbKxEsAE2tJKpagCnrY8AwIG2jpT5kSucSc9JD2B9IqkrytxVJsVeUBs0kmCt
         ta9pq0AVZTyENbGX+34pVjt8XzR+lTBTxLCLVzQh7hBY7fpgo8Ln3nwkr7+zZ5eaOxz7
         6n3GMbQNVLs3i97JNWvbWn/y297om+Q78QqsAtfAwXZCtY0qUOvx8RfPp7lfWoaEo4rT
         TIxg==
X-Forwarded-Encrypted: i=1; AKwUvByq+VWh063TyaXdb66wCORZZt2CaVc/IKjr3qe48tPJuFwrPcZbiDczWhmduPIbXsdiXBnwTaRFrv6Mf54=@vger.kernel.org
X-Gm-Message-State: AFuF++mqBsXIo48bRcPyAfovGpu2yKeLA2bhPyyBQSeEZAXLMMI2OC/1
	OLSPQp5I9/FfH6kFG3o5gSZgP676swEELXox29Sfua1DNn4mJqB+OgJ3c72sUKM5
X-Gm-Gg: AYBFou1KTMiwL16pS+tqOM9b9HLVmRMNfUSagNSoO+uM5YyaO6zREy4LPWzXqAp3UUa
	TJHTCIpki1M0WBYia6yHGFDd3/Q//1jKk2jdh+JbBV6WA+BDbM3KsYCejZLzd1CVxTGpxYmJeFO
	eHgItCRpmM6BA0hJL6VlzeV9cqMnZrJuvjhySKkPIlaO8VsHrYkELG066EU9uEq2t6wSaqczCG6
	5wPupRal6rcgXVz75AImZzt9NG6UmjMGfygsGVc1VUqlX0zQWvWEYmsGunAIMCmcUhskf1tVLFw
	meVQR7+7k/mmWIsG2USudzehKBRyQOFyfss0ijpt7uOrw4x+FBFoGjPqB0v+0qAc8ub4TEBiklt
	VWCc0AEHvlbyo7Z/C0Ye6KXxfcnsRtorE2mw0scNEX9ycnQy538YNO58svmitL3WbELbv+N0O3z
	ma7kGx5NOAJFRIxLddyZm/M4d26Hy7RPVOCEnpWJntKulyitAUWEMx0f7SzWVcKgXVkyS0A+plZ
	LcH2cNSr2hfvoJ7PdSpLRckmBhmEZcQg8sQB+iFYcbWzcG9yci/
X-Received: by 2002:a05:6402:5d1:b0:6a6:5cc9:4063 with SMTP id 4fb4d7f45d1cf-6aa2224c348mr2312039a12.2.1789572766643;
        Wed, 16 Sep 2026 08:32:46 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1cfe0562sm2067081a12.3.2026.09.16.08.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:32:46 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
X-Google-Original-From: Sagi Maimon <sagi.maimon@adtran.com>
To: Richard Cochran <richardcochran@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	netdev@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sagi Maimon <sagi.maimon@adtran.com>
Subject: [PATCH net-next v15 0/4] ptp: ocp: add TAP CPLD support for ADVA TimeCard X1
Date: Wed, 16 Sep 2026 18:32:38 +0300
Message-ID: <20260916153242.157171-1-sagi.maimon@adtran.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ADVA TimeCard X1 (PCI device 0x0410) carries a Lattice MachXO3 CPLD
on the TMC I2C bus.  This series adds access to it and an update path
through devlink flash.

The card has two I2C controllers.  Linux registers only the one at
0x00150000, normally routed to the config EEPROMs; the one at 0x00120000
belongs to the on-card MicroBlaze and is routed to the TMC or M.2 bus as
its firmware selects.  A request/grant handshake re-routes the host
controller onto the TMC bus, where the PCA9548 and the CPLD behind its
channel 0 live.  Everything here is built on that handshake.

Patches 1 and 2 are pre-existing probe-error-path bugs that were buried
in the feature commit in v13; they are split out with Fixes: tags.  Patch
1 is also a prerequisite: patch 3 adds a mutex that ptp_ocp_detach()
destroys, so devlink has to be unregistered first.  Patch 3 adds the bus
arbitration and the read-only interfaces, patch 4 the flashing.

v14: https://lore.kernel.org/netdev/20260914071531.11640-1-maimon.sagi@gmail.com/T/#u

Changes since v14 - all from the automated review of v14:

 - The hand-back never waited.  MBLAZE_GRANTED contains the host's own
   request bits, which the release write clears first, so the poll could
   not iterate and the adapter was unlocked while the controller was
   still on the TMC bus.  It now tests the firmware-owned grant field.
   Measured on the card: the register reads 0x00000012 once the segment
   is handed back, ~670 ms after the release write - so the wait is real
   and a "read 0" test would never have exited.  Patch 3.
 - adva_x1_mblaze_release() and adva_x1_bus_release() return the failure
   instead of only logging it, so an operation over a bus that may still
   be mis-routed fails rather than reporting success.  The adapter is
   still unlocked, since holding the root lock would stall every other
   user with no way out.  Patch 3.
 - fw.cpld is reported for every board that has the part, not only once
   its USERCODE has been read.  devlink resolves the component name from
   ->info_get(), so gating it on the cached identity made a part holding
   a bad image - which answers neither read - impossible to reflash.  The
   value is "unknown" until the read succeeds.  Patch 4.
 - The cached identity is dropped right after ERASE completes rather than
   only after every later check passed, so a failure part-way through no
   longer leaves the pre-flash cpld.id and fw.cpld published.  Patch 4.
 - The one-shot ID bookkeeping moved inside adva_x1_cpld_read_id(), under
   cpld_lock, where a flash that resets it cannot have it overwritten by
   the worker afterwards.  Patch 3.
 - A failing USERCODE read no longer discards the device ID that was just
   read, and the value/validity pair is published with
   smp_store_release()/smp_load_acquire() rather than bare WRITE_ONCE().
   Patch 4.
 - The flash now confirms the part actually entered configuration mode
   (status ENAB) after EN_CFG_TP.  An enable frame that does not latch
   leaves an idle part reporting neither BUSY nor FAILED, the erase and
   page writes are ignored and DONE is still set from the old image, so
   every later check passed and the update was reported successful with
   the flash untouched.  Patch 4.
 - adva_x1_cpld_exit_config() gates the flag on the wait it was already
   doing and retries, instead of recording an exit that may not have
   happened; the flash also retries the exit on entry, so a part left
   latched by an earlier failure is recovered.  Patch 4.
 - An upper bound on the image and a fatal-signal check in the page loop:
   both cpld_lock and the i2c root lock are held for the whole image, so
   the duration was caller-chosen and uninterruptible.  Patch 4.
 - cpld_i2c_adap_nr is serialised against the i2c bus notifier, and the
   lookup runs from the worker rather than once from probe: device_add()
   notifies before linking the device to its parent, so with asynchronous
   probing both writers could miss the same adapter.  A number that fails
   the parent check in adva_x1_bus_claim() is now forgotten so the lookup
   runs again.  Patch 3.
 - A mux channel select reported as failed may still have been ACKed, so
   the deselect runs on that path too rather than handing the mux back
   with a channel possibly open; a failed deselect is no longer silently
   dropped.  Patches 3 and 4.
 - The CPLD component reports a terminal "Flash complete"/"Flash error"
   status like the SPI path, and the pre-refresh DONE check logs and sets
   extack like the post-refresh one.  Patch 4.
 - linux/iopoll.h and linux/firmware.h moved to patch 4, where their
   first users are.  Comments no longer describe an upload path that only
   exists in the later patch, and the documentation no longer claims .jed
   containers are rejected - only the page-multiple length is checked.
 - Documentation no longer says the identification read happens once: a
   successful update re-arms it.

Tested on an ADVA TimeCard X1: a full erase/program/refresh cycle of a
6526-page image through "devlink dev flash ... component fw.cpld",
cpld_status reading done afterwards and across a reboot, and the
rejection paths for a .jed image and an unknown component name.


Sagi Maimon (4):
  ptp: ocp: unregister devlink before detach on probe error
  ptp: ocp: fix dpll cleanup on probe error
  ptp: ocp: add TAP CPLD access for ADVA TimeCard X1
  ptp: ocp: add TAP CPLD flashing via devlink

 Documentation/ABI/testing/sysfs-timecard     |  29 +
 Documentation/networking/devlink/index.rst   |   1 +
 Documentation/networking/devlink/ptp_ocp.rst |  75 ++
 MAINTAINERS                                  |   1 +
 drivers/ptp/ptp_ocp.c                        | 939 ++++++++++++++++++-
 5 files changed, 1039 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/networking/devlink/ptp_ocp.rst


base-commit: 87b80c2f6b05cad9f0ff9136709c62a0f59923e3
-- 
2.47.0

