Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E4E3793A5
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116932; cv=none; b=NgtxiKiC5zsOw5n1d7BOdJ98CJ3uBL4vLuWg79/OMpOCmJL9sXxYXcgsWYdCS427V5nNKGwYBSbn9X0RB1NsDtcKq0iqTN5tTGZVeqQB4rVks1eIPL3wTa0YQFB2XI3cWPNr6f4ZdoL3ncJiIBwv+Y73LutS7J1jhxAjoFZ2oYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116932; c=relaxed/simple;
	bh=5A1EK0N/gipYt9PjNBNWj0Ne+fz6KdYh5A1j+8IH04M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gHcZqFKzqpbE95CtaPxrRKzUOKanp7WrKbRun1LvdtsLjj/1GxgXEYwmVn9RGiUHq/T4jGaNlPhZ/4wwg7dJPIApkkyogcO0qaC9tlJNxID6mI7nPYRXD5BkALQ6q4Bwkr32ZX4jAIrid34uNP228NQXR66jSE4eR3jN/Llal3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Ak3oFlJT; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ak3oFlJT"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D07416A3;
	Fri, 11 Sep 2026 01:55:20 -0700 (PDT)
Received: from e142892.manchester.arm.com (e142892.arm.com [10.33.8.89])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B21853F7B4;
	Fri, 11 Sep 2026 01:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789116924; bh=5A1EK0N/gipYt9PjNBNWj0Ne+fz6KdYh5A1j+8IH04M=;
	h=From:To:Cc:Subject:Date:From;
	b=Ak3oFlJT7BAKSRtFvnsrvhIFCdk8FnLPWMbEf0Djn38wpRvsi3eMYQvrSTvD1XL2z
	 Gb6mECytE6CblXXQmhkYYlvsB3OsWEh9ceYjynvI7SYaI7q4WFZXTARI82KGDtja9z
	 yslo6dKZQTeBOiBFIWPws4cATdUH7g5rN8mPfyY8=
From: Mike Leach <mike.leach@arm.com>
To: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com,
	leo.yan@arm.com,
	james.clark@linaro.org,
	Mike Leach <mike.leach@arm.com>
Subject: [PATCH v4 0/1]  coresight: fix issue with insufficient claim tags
Date: Fri, 11 Sep 2026 09:55:19 +0100
Message-ID: <20260911085520.2201261-1-mike.leach@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All CoreSight compliant components have an implementation defined number
of 0 to 8 claim tag bits in the claim tag registers.

These are used to claim the CoreSight resources by system agents.

ARM recommends implementions have 4 claim tag bits, though a valid
implementation can have 0 claim tags bits.

The CoreSight drivers implement a 2 claim tag bit protocol to allow
self hosted and external debug agents to manage access to the hardware.

However, if there are less than 2 claim tags available the protocol
incorrectly returns an error on device claim, as no checks are made.

If insufficient claim tags are present in a component then the protocol
must return success on claim / disclaim to allow components to be used
normally.

Add initialisation to read the CLAIMSET bits to establish the number of
available claim tag bits, and adjust the claim returns accordingly.

Cache the claimtag protocol availablity in the coresight_device to reduce
reads for the main claim/disclaim api.

changes since v3:
1) removed unneeded bool casts (Leo)
2) rebased to kernel 7.2 on coresight/next

changes since v2:
1) consolidated API to remove the API calls using just cs_access, which were
used purely to clear down stale self claim tags, replace with a normal
coresight_device API for initialisation, to match the claim/disclaim API.
This does both the check on availability and the stale tag clearance.
Updated all drivers to use the new init functionality

2) Added option for drivers to skip claim tag checking completely for devices
with no-compliant hardware, that do not implement registers at the claim tag
location, or do not operate correctly to indicate the correct number of
claim tags for the device.

changes since v1:
1) Added claim tag availability cache into coresight_device when using the
main coresight_claim_device() / coresight_disclaim_device() API.

Applies to coresight/next

Mike Leach (1):
  coresight: fix issue where coresight component has no claimtags

 drivers/hwtracing/coresight/coresight-catu.c  |   6 +-
 drivers/hwtracing/coresight/coresight-core.c  | 139 ++++++++++++++++--
 .../hwtracing/coresight/coresight-cti-core.c  |   7 +-
 drivers/hwtracing/coresight/coresight-etb10.c |   9 +-
 .../coresight/coresight-etm3x-core.c          |   8 +-
 .../coresight/coresight-etm4x-core.c          |   8 +-
 .../hwtracing/coresight/coresight-funnel.c    |   7 +-
 drivers/hwtracing/coresight/coresight-priv.h  |   7 +
 .../coresight/coresight-replicator.c          |   9 +-
 .../hwtracing/coresight/coresight-tmc-core.c  |   7 +-
 include/linux/coresight.h                     |  23 ++-
 11 files changed, 205 insertions(+), 25 deletions(-)

-- 
2.43.0

