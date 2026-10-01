Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6D833ADB9
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859382; cv=none; b=FU890yUpNOF1sD2RibE95X/ZKko6sQBJGrzYIBD7tG1sCYm1aYRUIxdoiP+vCpsGIBpPufcqaqVXeR0KTrwfSWlEl0o5QACb5V6ZLV8jxk6G2Akr3xwQ/lpIcjam9GRxZyGgsTr8qB/GoWhfV1xYJZFqx4xEeXR99K1mho5MlyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859382; c=relaxed/simple;
	bh=FpEbfQyIZj1rInHqPNAUF8GXeB3XCWuWfhWQVrUfd0E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Kir9R/3negZZSWA2v3eJ2W+uKUelHjab3HLr/+jLUn90QWFy19VjQNhZNur9YW1i4FHwnwqkUYDaUbGUARrMnYwwRjJkMYUucOFgQcZfyxKY3DdVhmQryzxiAsEuZ4mNaLjTLEh61ZKIcYaHCtR5lc+XJU4gUDZnZGm4K92qXec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fVmncF52; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fVmncF52"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a00713639cso34249495e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790859378; x=1791464178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K+YxthDTsyK1OC9mSBJQAq26traS5e0O0cZBRIdwebI=;
        b=fVmncF520zsogH3LFVFniWtrKwAfp7nMPPppEuhnArb30i6H29HMHqPMSuWGnvCViR
         KQ4/UomDDTueofVIqQLdx3I6z7AnqsfkxZDMVE7cDF+/MGlKsRfNbKFfNwJnA+G4s3Zr
         aLX+BJKol96XobiK23TrlYYgog5tOgBLWiZojfa/fGL04RMdIsSc2nwcPiNN6ZSReeoo
         S0Kupcy76sLXj8tOHOpf7J4ChVlde9GPK0zK/3fIesGo4Y71bYm9ybXpwgUDgI0Ci/u2
         IJbSeV+bqJXtcvBedbQjFTnE80ucmTpG93/5dS6bkwwlgIKH72K7sKWfAZSTUVZK5q90
         k4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790859378; x=1791464178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K+YxthDTsyK1OC9mSBJQAq26traS5e0O0cZBRIdwebI=;
        b=XYJfULExUQZ5Hq+zO8IVgakUkkA4OIvOWLP8J+Iju0YsKgIc1QN/94jCyJWKTjmpBb
         +O2Bq/KffOki2ZEsYGXE49wPxVGIXPTyqoqh8XB6igvTo127dgEg1RNa3EetDNCJA6lK
         XwgxuDgFpVM+ll5iL2uUKKpX/fJrgcFGjRsD1Ac0EsTPzKaIC36Va5RWkfSi5S6jNFr1
         oGxa4NVQGQOpVCL+f4C64Ub4WdVp67eO1PLDRcD/sFAx/BfNoM0ydhqxN051dK/VJzMm
         XAZqSDweHdA62FZW02KHeupdKCfNhCm5gar1GO83mFOHsJ9AyXAgGvpdaG1wB0RzSiXJ
         czVw==
X-Forwarded-Encrypted: i=1; AKwUvBwFl4hBHuu7utWnoS2wwT1Uu6vMMEh+9nYFdI8UCx86u/tqImkUje3RaLvhA1wGG0SXW2BFLIaT6fblUEs=@vger.kernel.org
X-Gm-Message-State: AFuF++kThvyq9JFQ0D2v2J0y/kBY+vp/rYNNAlyYWvJHlCmZJ3tCeaVd
	0eWLtTs80Xw7qa2SF561mmfWdkEaAIj7dOqRWE1hbq0c5i92IhCdaG3h
X-Gm-Gg: AYBFou1rWiNwmD/NMpiTBf5qXZUJ6Hd0FCMFiATlhytAMsnNQq9ckUKEHdPX2ngeX4m
	4lZCwb/JEFQoTiGOqkUlsScw0K30Nka9bOBxbfQg5puC5CiPAvxeyYm9+PfpYxsS6vRIJsjurVU
	kVz5KUd5Gbv8Y1xRYETyPh4SNl3WlWkdz5x3+m6YGWlc6LcCt+0CMmFY1NIovt5Xzd2zNUz1XXz
	cSDoo2uFeTTgjiQ6XRBwim6Rzs2r/xKX+3GbHGNu+XopWtL/eKrE8g0o3TsiTajLQ5x6hKO2T4q
	8uGdnWpMiTfSGnKsdYgA57cENREt/11WrPtVeMfnuelth8tWCOlMukSQIKo5oXHpDAgHYqN2Ojy
	kxLzQGuT8SEt8kWtLgR7r9w6GbsK5lMNfzDj7doCpFBNUKXX/CjBzhk41EUVvmlbEMiDlLIq7+h
	XeZL4zQU22fu6kdNE0OMlBPFqcTn2D7FCLzNEcJ5LIzVT3tgFWK5qpJPPgSFJ4g9rjckduFUNeQ
	M+HcoVjMCymzsRXrDv+2bicman3RL7T1HIL/8S/e/eFAzM=
X-Received: by 2002:a05:600d:82c8:b0:4a0:b6:4619 with SMTP id 5b1f17b1804b1-4a01ab4ea39mr86969215e9.0.1790859377704;
        Thu, 01 Oct 2026 05:56:17 -0700 (PDT)
Received: from env.. (dynamic-176-003-078-112.176.3.pool.telefonica.de. [176.3.78.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f9a7650sm68298735e9.15.2026.10.01.05.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:56:17 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: song@kernel.org,
	yukuai@fygo.io,
	chengzhihao1@huawei.com,
	magiclinan@didiglobal.com,
	xiao@kernel.org
Cc: linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
Subject: [RFC PATCH v2 0/4] md: add a control device for array management
Date: Thu,  1 Oct 2026 12:56:07 +0000
Message-ID: <20261001125611.943731-1-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series adds a new /dev/md-control misc character device for
managing md arrays without opening the corresponding md block device.

Currently, md management ioctls are issued on the md block device
itself, which requires the caller to hold the array open while
configuring or stopping it.

This is a problem for STOP_ARRAY and STOP_ARRAY_RO. Before the array is
stopped, the page cache must be flushed, and no other task may have the
device open or be writing to it. The issue arises when several tasks
share the same file descriptor table, as they count as a single opener.
Consequently, one task may still be writing while another task flushes
the page cache and stops the array. A write within this window can race
with the stop operation.

The new control device is not tied to any md array. Each request
identifies the target array by name, UUID, or device number, and
carries a flags field. Unknown flags are rejected with -ENOTTY. The new
commands mirror the existing md block-device ioctls, with STOP_ARRAY_RO
represented by MD_STOP_ARRAY with MD_RO_FLAG set.

New 64-bit structures, including mdu_ioctl, are introduced
(mdu_array_info64, mdu_disk_info64, mdu_param64, mdu_bitmap_file64,
and mdu_version64) to resolve padding and overflow issues in fields
such as size, ctime, and utime.

The existing md block-device ioctl interface remains unchanged.
A warning is emitted when it is used to recommend upgrading mdadm to
use the new control interface.

The mdadm has been modified correspondingly:
Link: https://lore.kernel.org/linux-raid/20260928211849.3602414-1-abd.masalkhi@gmail.com

This is an RFC because the new UAPI (struct mdu_ioctl, mdu_array_info64,
mdu_disk_info64, mdu_param64, mdu_bitmap_file64, and mdu_version64 and
the new command set). I am thinking about adding a new command
MD_NEW_ARRAY or MD_CREATE_ARRAY to create a new array. Feedback on the
interface is welcome.

I am aslo considering adding a command to create a new array
MD_NEW_ARRAY/MD_CREATE_ARRAY.

I am thinking of adding a new command MD_NEW_ARRAY or MD_CREATE_ARRAY
to create a new array.

Changes in v2:
 - Move the code from md-ctl.c into md.c and remove md-ctl.c.
 - Handle the new commands directly in mdctl_ioctl() instead of
   converting them to the old ioctls.
 - Use a dynamic misc minor number for /dev/md-control.
 - Drop the devname module alias, which only works with a fixed minor.
 - Fix the issues reported by sashiko-bot.
 - Take disks_mutex around the lookups, so that they never see an
   mddev that md_alloc() has not finished.
 - Clear hold_active only when a command succeeds.
 - Link-v1: https://lore.kernel.org/linux-raid/20260928201224.3602262-1-abd.masalkhi@gmail.com

Abd-Alrhman Masalkhi

Abd-Alrhman Masalkhi (4):
  md: add uapi definitions for the md control device
  md: pass struct mdu_disk_info64 to md_add_new_disk()
  md: use struct mdu_array_info64 for SET_ARRAY_INFO
  md: add a control device for array management

 drivers/md/md-autodetect.c     |   4 +-
 drivers/md/md.c                | 700 ++++++++++++++++++++++++++++++++-
 drivers/md/md.h                |  17 +-
 include/uapi/linux/raid/md_u.h | 119 ++++++
 4 files changed, 820 insertions(+), 20 deletions(-)


base-commit: 5c2f4115051d064ad79b0b4edac70a2b62528d9d
-- 
2.43.0

