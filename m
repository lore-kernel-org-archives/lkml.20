Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4DA3AF641
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370163; cv=none; b=XJW5avDtDA63vmdUNrUMYfHg0U2SuEGpn0ZTO+HTYqWonUl9MHKctk8W1k5TKRRcO8hFRvwb+Qnsy/IdNVa8gu0LH7Ko/CvtmCJpkVu1mWIuw2B9klGgCgsxxt4WEmuaIeeztirW9cBW8BE6QqH6zMfwub/vNMzCtC5C1vBwa/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370163; c=relaxed/simple;
	bh=jSb2Ftos2O4Cle3dQjevzii599zWf1wPdvUMiVakE/8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cGbhaZCAa+ZYYjPgcMj1Lz215Mv+ozHS2jtqSvwJyRYOmZnnMg9MIiElVJs0F0ja6YxKOA6dSP8SsndN9argjeCMfxBdZkxCjqLOfY8ACHh7u9Vp/QV52vK10axj/yqfJinN78l69A3nEnBmoyq2BUlt4VEI39aCCz7v6n3LrMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MLWcctoc; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MLWcctoc"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48434392b02so1375396f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370159; x=1789974959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g961FMFmva6MFSFgsk5zUmE0FV5DENfWVjlPpCRBaQ8=;
        b=MLWcctocCuqQ3tHi+lkoDhF0hjrZid4KO6JLHCIZuSEb29Kxkz92oKTk5W88E3vcmO
         tFVr728r4Y7lFKYaqcdVPmUvkZv3kjV49n9MghdTV5tqZ2yukRFilAlARWSy5FP48k7h
         LBGE04xxKBuHtF+TazldyoEjrO51XEK3FXTaUBgsBofXhAYpc3vWSNZlpX2rPvi7z+c8
         5Zid+ShKT5XPFlQRdTiw7No99Ha4kW8MACInXF+37q4awzdIy4rz+N8V/XTNZjYOahCU
         ZWZSz1LitpmsFxX0NvRh9b8CBSR51mFWbhopcrjcwMY10bt6K4W6Pcbgd3zSkDTfyP16
         Lfbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370159; x=1789974959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g961FMFmva6MFSFgsk5zUmE0FV5DENfWVjlPpCRBaQ8=;
        b=P4CdcVdAaR/bOsBbu+cQbGisAEZ9lzycEKcYFgHXXatHLPse4/7t/EItA84rvkCyM6
         waNi6oUajVmo56zG68fOWJVnZtd1RsfHG24DnlbulYrEGROYjrJxSBGfYvwcNmAXBfAd
         ct9XXtnhKfY/btqDagOArCwy+L2YCSk6Napkki3rf2OxCz5vwDnrz/rPOe20Kr18v/Bx
         tnBgYsunjXrfDUbEs6WvEdgsVVnFSMchzyqEgpaohFi9fGusJEUswqvG9JGnV3VML/lb
         Ak7SfE4FJP4AzaIx0wYXnft/IcurfcDWKYBHYVDYPj+DLknMaRXwtg748IvhbagXz4et
         t71w==
X-Forwarded-Encrypted: i=1; AKwUvByCo57JoURjHHFM/rfxOpLQ5oITJKaFRHxAyITNKUEpg9H6taWhXEH6+gb/9oLlHEJB4Ne9oWus0jk1itw=@vger.kernel.org
X-Gm-Message-State: AFuF++l4yXSz+nLZZ4//YIA8z+0lfPSLunDJml4hIakyCqeCWEHD887f
	1eAdrIh2lhH0+p51012FRVqHcnJ/zfTXjxsosbx/G7WxKQl+0xyznQ7YJMUzCmPY
X-Gm-Gg: AYBFou38LJpt6xcWzF/winy9xqDO28gd07IZxvvaDGrUIN0sV18AJfuZtu/jQTx3hbq
	poDNFWU4KyoMM/djABKGCQzqOVUMZMw6kJOzIa6x2emu70Kgvgr7gq23JorhxHTXGne2G6GpQ3P
	0RQWG2NBD1l0qM7dGQ/rLJwmsTuPTuL5m43FyGmhtTz+ifOPi9w4dKnZXO2tE5UXcCQnMtE8aEH
	4ZDdQkyHm36AJKiqkeJ2shgHLJZlIAFOwpaKlVgEyww4yTa3/M6gsxm+n/CwAP6PgwFMzfVdDfY
	nwePvBu14CJjueUf6QI4+V6bbv0NKikG8xDQlJP8hxK35yIPzV2C6/8xXM/43caxvk8D4b78/1B
	vFt5sABP9qGnXtah6C+US+PvhMfrF5WMj8mqp3GRXdAsgR7S2LIQaQLOSfgr9dCGWhhdaNC1g6v
	5jlfw9yatRF0l8VXpFdUlRdc+nPvndsFJei9LLXD2kbUaYQ1O88kKvaGE2dMGhTeKiOyhF7h/Kx
	96aswXGUGyyFHbKUCb7XbgXGRMWpWW/0xf77ZNFwGz4VZwXH2E=
X-Received: by 2002:a05:6000:25fd:b0:486:faa8:77f7 with SMTP id ffacd0b85a97d-48702ab91cbmr2670188f8f.9.1789370158955;
        Mon, 14 Sep 2026 00:15:58 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb357288sm25161082f8f.29.2026.09.14.00.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:15:57 -0700 (PDT)
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
Date: Mon, 14 Sep 2026 10:15:51 +0300
Message-ID: <20260914071555.11684-1-maimon.sagi@gmail.com>
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

