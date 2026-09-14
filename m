Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7464F3A9D94
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370140; cv=none; b=WXuUy9Luw2LIpycSymQTOSf+y5v+OzrQhCitfMUsTzt/snME995Z0urEZd44ikIy5oha2r4UT6olvURC8cgkFDT66TTXALNzxoubftEcTtqeWKQk36s6VPEH4AzYp2K0o4Y4b6hK0+3WyRw/7r7uRJjvKYkajrMjXyIvXmdHTsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370140; c=relaxed/simple;
	bh=jSb2Ftos2O4Cle3dQjevzii599zWf1wPdvUMiVakE/8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y0P9jTZfDtbloUSRxEKPjsc71XZCgkO8AnwCQi+QyA0WJ5vFzk5oZMl0lxcG7vxhEyAL+gNm/lyDwQLosrUBsym1cn0m056CpiCW5MxgOVEkfBx/y1oOZ9SlJD00+ReAtS8Tsb9OxH1Z8psIdgLTEgc/OIs6rRFBWijh5397Edg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hkSLEcF9; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hkSLEcF9"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dc83so1079952f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370136; x=1789974936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g961FMFmva6MFSFgsk5zUmE0FV5DENfWVjlPpCRBaQ8=;
        b=hkSLEcF9nYaoDuuhkyHzO5DrpGOvzS2Gy1Irgzv0aHj4mmHNdojX2vP+d9LsxtTDme
         MYS8/lbY6ijSqjrRX1nSBjkfbG4ZeYtwyvjjSuB3caz7XcwVLwzI0yuip6x46kipQj2E
         qkjdtgtyRmBbOB9j9kztVR5e7ClYrdCiCWaoMEeN+q6F/X1jBlGW+XghottGfyZx93Qf
         lr3sqoK9H/xInmKuH3nZo4TensBJi93CbEFiuNrZ2FKGcdYqhBD3wqs7Q4GaY8nKYSel
         J8MChB650d+xGBNxlGoJl8eZJdmKvSV0WTElbSAHWRgqBxQChyJnuohiwGi6hUpiROB4
         k31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370136; x=1789974936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g961FMFmva6MFSFgsk5zUmE0FV5DENfWVjlPpCRBaQ8=;
        b=q0sSlu+imm+KGDV1IK1Hd6WV9FTClCZ/MooOuQeVYIV0B7gxb/6r6g3bLdoFjgtnXy
         ilm+9xSIFQE2FAeVZOImPRTivTY2UJvGqe1PG8hWNURt2JxGRM+Oh2vM3S80XxBfHxn3
         HzwkOhkCC9le58k3jXp9Le8PV6c3r4woSYQ2sv9zxb/i9OPngHQN6giAOLrD44Xhb0MD
         oAIuSv4CX+5itGf/XA6LJPOI/Sz0L0p0sMpZEFBko+2mAK6mkfNw4kXBfZB0gp0R7Gwt
         eV75SkjtWUcCdfIRUfVkgGLTiMGhrDz0nUQarYkQC3yNHMgbOkVbmNXUuWZmiu5qTEzB
         6CvQ==
X-Forwarded-Encrypted: i=1; AKwUvBx30sunIOXuB33AoLPkEzoZxvaVpyVTNjskxIFODYHodKmjEoJmcszBPT62nbZP2kRhffjidznwX/jra/4=@vger.kernel.org
X-Gm-Message-State: AFuF++kUOGvdT0EKrzDAtkh7hPem9vSZXzGTU2cZU8m/FpwmpQWLA2ZB
	IbvQhRtys+QqhZcu/lQk59rP98VxtES6ysPBYU2WJHhLjLaMbiNoOSkg
X-Gm-Gg: AYBFou0mx7tBXgzcjuxzcU/30weZZYmbiXozB3VtQBIpOBJzCi64alDDt+HV35rW6JB
	Hsky4L+irpu9swR+9FVb3bXuGO0ezDjR3qvY+FNPP/Pvu0QWjG+eJ8hDszTktTPK7SGLs4D7zkQ
	fp/9cx4f0Gn2I9RCxZPA0UWmIfJCQNLqxqWVqzuGA3pCirqwJo6MU8g6vhF9eEDYYE7xUlm88+j
	aSoA+06bwgBc6w0catrFAms0vZvimU8PdPcbbLYDinSoA3prxPXry0oTD5gORUL8rqX0QQ6HY2X
	zzFJQ1MZBPEXVLySyS9QnNYs0Ct3+QnvAD6vwdkwWAGGKBz7yqf3UkvCXpjGBFo/CMUP0+TBe8+
	kzLGplPby/lj2cKYq4sUKzoSMCURy9OwTCTZbDJLzDOjEkdZi2YbB9VDrV19a6qlbzGsP2JO+KU
	eOzEJ+F2tvZR/xUNtoJrsCZD614Ucfm5apNWlCbB6Ko2VeP5c6xQYfVY/Z7fnq/ygnTeCOTvMIO
	88VOuX1xwfP8Fw9r8cW2H1ZJQZl0+w9tFjWqX3dzg==
X-Received: by 2002:a05:6000:98f:b0:486:fe85:ec9b with SMTP id ffacd0b85a97d-48702ac343emr1115649f8f.24.1789370135494;
        Mon, 14 Sep 2026 00:15:35 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e4b5sm24472558f8f.22.2026.09.14.00.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:15:34 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
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
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net-next v14 0/4] ptp: ocp: add TAP CPLD support for ADVA TimeCard X1
Date: Mon, 14 Sep 2026 10:15:27 +0300
Message-ID: <20260914071531.11640-1-maimon.sagi@gmail.com>
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
in the feature commit in v13; they are split out with Fixes: tags, as
requested.  Patch 1 is also a prerequisite: patch 3 adds a mutex that
ptp_ocp_detach() destroys, so devlink has to be unregistered first.
Patch 3 adds the bus arbitration and the read-only interfaces, patch 4
the flashing.

v13: https://lore.kernel.org/netdev/20260908122328.52641-1-maimon.sagi@gmail.com/T/#u

Changes since v13:

 - The CPLD is no longer flashed through the firmware-upload subsystem.
   It is a devlink flash component instead:

     devlink dev flash pci/0000:02:00.0 file cpld.bin component fw.cpld

   ->info_get() reports fw.cpld as a running version with
   DEVLINK_INFO_VERSION_TYPE_COMPONENT, carrying the USERCODE of the
   image in the part, which is also what makes the core accept the
   component name.  No component still means the card flash.  This
   removed fw_upload_ops, the adva-cpld.N node, the FW_LOADER/FW_UPLOAD
   selects and the cancellation state machine - and with it a race where
   a cancel arriving after one upload finished could abort the next.
   Patch 4.  (Jakub Kicinski)
 - cpld_status now contains the names of the flags that are set, space
   separated, and an empty line when none is, instead of
   "done=<0|1> busy=<0|1> failed=<0|1>".  Patch 3.  (Jakub Kicinski)
 - The commit was split; the two pre-existing fixes it contained are
   patches 1 and 2 with Fixes: tags.  (Jakub Kicinski)
 - The flash path now validates the state after REFRESH - DONE set, not
   busy, and no sysCONFIG error - and fails the devlink command rather
   than reporting success for an image that did not come back.  Patch 4.
 - adva_x1_mblaze_release() waits for the firmware to drop the grant
   instead of writing RELEASE and returning, and warns if it does not.
   Patch 3.
 - The i2c bus notifier only caches the adapter number for the card's
   own controller, not for an i2c-mux child registered on it.  The
   adapter is also resolved once from probe, because the notifier fires
   from inside platform_device_register() - before bp->i2c_ctrl is
   assigned - whenever the i2c controller driver is already loaded.
   Patch 3.
 - ptp_ocp_devlink_info_get() checks bp->has_cpld explicitly rather than
   relying on cpld_id being zero on boards without one.  Patch 3.
 - ptp_ocp_sync_work() no longer latches the one-shot ID read on -EBUSY,
   so a read that collided with a CPLD operation is retried.  Patch 3.
 - Documentation/networking/devlink/ptp_ocp.rst documents the flash
   components and states the accepted image format: a raw bitstream, a
   whole number of 16-byte pages; .jed and other containers are
   rejected.  Patch 4.

Tested on an ADVA TimeCard X1: a full erase/program/refresh cycle of a
6526-page image through "devlink dev flash ... component fw.cpld", the
CPLD reporting done afterwards and still done across a reboot, and both
rejection paths (a .jed image, and an unknown component name).


Sagi Maimon (4):
  ptp: ocp: unregister devlink before detach on probe error
  ptp: ocp: fix dpll cleanup on probe error
  ptp: ocp: add TAP CPLD access for ADVA TimeCard X1
  ptp: ocp: add TAP CPLD flashing via devlink

 Documentation/ABI/testing/sysfs-timecard     |  28 +
 Documentation/networking/devlink/index.rst   |   1 +
 Documentation/networking/devlink/ptp_ocp.rst |  70 ++
 MAINTAINERS                                  |   1 +
 drivers/ptp/ptp_ocp.c                        | 774 ++++++++++++++++++-
 5 files changed, 868 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/networking/devlink/ptp_ocp.rst


base-commit: 879e280b8486d4612ad1aa050d6fada2dd80cf1c
-- 
2.47.0

