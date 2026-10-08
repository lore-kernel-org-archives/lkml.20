Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6E34A64EE
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 14:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791468854; cv=none; b=BGuYzkjTnRsS9qm0iTVCtmQ2A/8+LHDKyXd2ptC6B6zJJJWuOf/KJ3TOhsv/pmqF8ONfZszaiBHG6VTumU5aMXjVFqPoElRvuQxLIF4sBbFDr1W76mrjMHCdgkNkwBg5zAlPt+saqOteoX5jYZqUtQa10q/KGRglFQPWtVjit1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791468854; c=relaxed/simple;
	bh=IKGJFsl+ouxZoB4hsBrY/FY1FThn/xF+7mTvkzBaUr8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZRGrPrKp3qKHLh1ocpJbf+YxFzdFnqA2yg/9BFy4NcCUmu69sufhaXXB38hHKskqrRRK04Nfw1oZFoRYkCG7nGjoS39VujezJ5cplaK6yfkoUra6xs9+MKDUnU9d+a1C00tYRDsB6qWWR6aRE7b6gUrOOgX3EbHfrQ4B0LN4mNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=US32GsVO; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="US32GsVO"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so54780665e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 07:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1791468851; x=1792073651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iY/xzhTxB/DcicIj0alQZwLmGEwIgigA+J+BWOz3Za8=;
        b=US32GsVOdusQGmpi6mreH/BUuEbQNqNuvLmhEKnKRpuUBV+zO0oPOe8HFqjzqN4UJJ
         fXmZDqc6sWbCkgClwD0d82ArVte6tJBwYdtodx/aewi8qFNOsvzBFCqBwUsxZ7/1xZgL
         oh4YPeBvrKAtK+DDvc187nTfscwUTw4rKD8itwN6eHdHzqvmlWDGO2cnOsoME0AQDDPS
         zUmRXlpvcLml3in+37lZ/xbe0yRpLhpXLBJE688osqbYjDyUj2AZmxfFUFSKW94R/SB7
         uqmWiV8tcSK7R0CRpCAGkKf3Tu7nrpqAPej8Mxk2haxrIDJe2ZhLsBT6Lz4wDuFSX/Aw
         4Gcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791468851; x=1792073651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iY/xzhTxB/DcicIj0alQZwLmGEwIgigA+J+BWOz3Za8=;
        b=tIzLq+n9RvfvIHlNbBh2dBJXAP1zZ2tIPXaYbis7MdEmJ2waKDhsk81cG59Dj/KKfj
         w9RWyEabjKWPlCt7krarskeem/ybzVkH04LuWGPs+vRuaZjIs52N1ALANzTnydrkT0+n
         MLzHFd0uvDe2xv5tAEJ7FwlWskWcmi9GJYGV+yN7y7m6z+SDO6wpcwll0A1QNX4dOoSp
         AyctQYiihfsmRVZC9VqloDail9Q9nNuqEn5vgb5Y2cIL5P29uXdnxWyIleheDN5GQCh+
         jIp+H5lvjmLRECJgRDLUGdvFbkFenvV9ejAJE2mzW0/3U7U6JhuaRxotZDGWVtwY/YPe
         7XoQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1AxfuMZ9L4/6zu0L928EisLmlq1TDzRilbINGbfoOUARvWyQG4JlHrnSmB55gm+uDrZ8cItW/W7GIoPU=@vger.kernel.org
X-Gm-Message-State: AFuF++nlMdo8nmqcx1nYA+nXFCrZAkI65uWD/Qt5avQKt02Xr0ybBmQW
	FV23zpLOhQoTnejQMVrAw7EfxInvnrbjtRDCsUoCLkGFZxCVkeza3/t7JbZDyMDa5/k=
X-Gm-Gg: AYBFou0QLHSQ6iPfve2YlEtVkcgXRq8yH3NLk7CXZJShexS9481Eat4QXwPIMVmKBX5
	2F8yqpWjkkQSWDeMRmJyV2+LEOtJs57A/wj/zqp36hCQNW5Ans+HHb1WMgx2dXmfW3zWLU8csLF
	AhWDo18IlqHuJEiiZy6VdLvj5KTEQx5Ey+zKnAJ0sjed3khWFru1o0Qw1fwYZM2TS9R4BgS503J
	faitxjIesOOUTTx9KJloH+s7ER/cBV0PBuuRf8JKomecmGFVTFSBlTicvNjemvV1fb1fLEHAywV
	KScWlWePy0twXo+qwD9j2wySjpxz85yM3pWuYeIbeQ4/0tUxaLsUMJvvv2A3cEtmVovkE29kpUa
	+aOFmVJhD4/ErV6Nwuy/j1oK+40aDgfgbZlRYnlKDdsK8vFpNtCQnl+6K4L0EUE+jqqQ0ZvdHqT
	RW8wYIZiQABdir9fQZRFZKDG/R3H8ktjNQIOm2HQKBMV4QZL0jqVt81YjVBgQ71D0NqVYod3L+v
	0FoJ6QxPhFQl6e5ZRHvyBiSMtyaRBjKX74=
X-Received: by 2002:a05:600c:1c21:b0:4a1:6425:be69 with SMTP id 5b1f17b1804b1-4a1804234d9mr120595225e9.17.1791468850603;
        Thu, 08 Oct 2026 07:14:10 -0700 (PDT)
Received: from MBP-Krishna-Iyer.civet-hops.ts.net ([80.95.100.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a185d914fdsm113358935e9.7.2026.10.08.07.14.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 07:14:09 -0700 (PDT)
From: Krishna Iyer <kiyer@crusoe.ai>
To: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nilay@linux.ibm.com,
	hare@suse.de,
	saravanand@crusoe.ai,
	sjpark@crusoe.ai,
	Krishna Iyer <kiyer@crusoe.ai>
Subject: [PATCH v5 0/2] nvme-multipath: fail I/O when no usable path exists
Date: Thu,  8 Oct 2026 07:14:05 -0700
Message-ID: <20261008141407.22992-1-kiyer@crusoe.ai>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On virtualization hosts we run NVMe/TCP targets with ctrl_loss_tmo=-1.
During a long fabric outage, I/O on a multipath namespace is queued
until a path returns, so a SIGKILLed VM process cannot exit while it
drains I/O to an unreachable target and is stuck in D state.

Patch 1 fixes nvme_available_path() so it stops queueing I/O that should
be failed, by default and without any flag:
 - respect fast_io_fail_tmo: when a path exists but its failfast timer
   has expired, fail instead of falling through to queue_if_no_path
 - a LIVE path whose ANA state is inaccessible or persistent-loss no
   longer counts as available (ANA change stays transient and queues)
 - kick the requeue work from nvme_update_ns_ana_state() so parked I/O
   is re-evaluated when an ANA transition leaves a namespace inaccessible

Patch 2 adds the fail_on_ctrl_loss attribute, an opt-in per-namespace
policy that fails parked and newly arriving I/O instead of queueing it
when no usable path exists. It is the namespace-scoped counterpart to
the controller-scoped fast_io_fail_tmo, needed because sibling
namespaces behind the same controllers must keep queueing while one
namespace whose consumer is gone releases its parked I/O. It sits
alongside delayed_removal_secs as a per-namespace policy in
nvme-multipath sysfs. Controller state is untouched and reconnects
continue.

The intent is exactly per namespace differentiation, some namespaces
stop waiting while others keep waiting for the same controllers to
reconnect. Patch 1 fails the conditions the kernel can detect, an
expired failfast timer or an inaccessible ANA state. It cannot detect
that the consumer of a namespace has exited while its paths are still
connecting, so that case still queues by default and only an explicit
per namespace opt in can release it.

Changes since v4 [4]:
 - Rename the attribute from fail_if_no_path to fail_on_ctrl_loss, and
   the flag to NVME_NSHEAD_FAIL_ON_CTRL_LOSS. fail_if_no_path read as
   the inverse of queue_if_no_path when it is not; the new name reflects
   that the policy stops waiting for a controller that is gone or
   reconnecting (Hannes, Nilay). No functional change.
 - Add Reviewed-by tags on patch 1 (Hannes, Nilay).

Changes since v3 [3]:
 - Split the single v3 patch into a two-patch series: the
   default-behavior fixes first, the opt-in attribute on top (Hannes,
   Keith).
 - The ANA inaccessible and persistent-loss handling is now the default
   and no longer gated behind the flag (Keith).
 - New: respect fast_io_fail_tmo. When a path is present but its failfast
   timer has expired, nvme_available_path() now fails instead of falling
   through to the queue_if_no_path window (Keith).
 - New: kick the requeue work from nvme_update_ns_ana_state() so parked
   I/O is re-evaluated when an ANA transition leaves a namespace
   inaccessible (Keith).
 - Patch 2 now carries only the attribute, rebased on patch 1's
   corrected defaults: it gates the CONNECTING case and overrides
   delayed_removal_secs, taking precedence over queue_if_no_path when
   both are set.
 - Document the fail_on_ctrl_loss vs delayed_removal_secs
   (queue-if-no-path) interaction in the ABI entry (Hannes).

Changes since v2 [2]:
 - Use the nvme_state_is_live() helper for the ANA state check, keeping
   the explicit NVME_ANA_CHANGE carve-out so transient ANA transitions
   still queue (Nilay).
 - Return early when the stored value matches the current setting,
   skipping synchronize_srcu() and the requeue kick (Nilay).

Changes since v1 [1]:
 - Rename the attribute from fail_io_now to fail_if_no_path (Nilay).
 - Make the policy persistent instead of self-clearing. Drop the clear
   in nvme_mpath_set_live() so it stays set until userspace clears it.
 - Enforce it inside nvme_available_path() by controller state. A
   CONNECTING controller and a LIVE controller whose path ANA state is
   inaccessible or persistent-loss stop counting as available. RESETTING
   and ANA change keep queueing. With no controllers left it overrides
   the delayed_removal_secs window.

Validated on hardware with a 6.17 backport of this series: parked I/O on
a SIGKILLed VM process failed within a second of enabling the policy and
the process was reaped, new I/O failed fast during the outage, the
policy persisted across path recovery, and disabling it restored
queueing.

[1] v1: https://lore.kernel.org/linux-nvme/20260904032605.65758-1-kiyer@crusoe.ai/
[2] v2: https://lore.kernel.org/linux-nvme/20260917231647.79956-1-kiyer@crusoe.ai/
[3] v3: https://lore.kernel.org/linux-nvme/20260923004959.88440-1-kiyer@crusoe.ai/
[4] v4: https://lore.kernel.org/linux-nvme/20261001094857.74567-1-kiyer@crusoe.ai/

Krishna Iyer (2):
  nvme-multipath: fix path state evaluation for failfast and ANA
  nvme-multipath: add fail_on_ctrl_loss sysfs attribute

 Documentation/ABI/stable/sysfs-nvme | 16 +++++++
 drivers/nvme/host/multipath.c       | 74 +++++++++++++++++++++++++----
 drivers/nvme/host/nvme.h            |  2 +
 drivers/nvme/host/sysfs.c           |  4 +-
 4 files changed, 87 insertions(+), 9 deletions(-)


base-commit: 2ee54f01f07c0307deaf90ca8691a4643ae0357b
-- 
2.54.0

