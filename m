Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794625549;
	b=hCS8v2SC8sNfsVa+R7brj6FwerKYP3QSTURG7ODyaR28Qll5pnciFd+jiFcPp6mG/wKo
	 sUwTCrNKRkrieX9vwxoN8lSi+XkjQXPeyabbJ4fLzJfh2uUfIpuR+ryzT6gn4sIXs63LP
	 7MD5H8t/V3kjGsNjhrRTwe2TD+zrMkLYA+HvMUhKZLMIouORfc2/WZIMDw9v2aCvoZ3CN
	 r6C7wq4vi8NDD/DjR2tqykeTCCu8vQxzYZ+drKWozRiclWy4XkZFtl/mObS/eCtFTm05K
	 IbhVufAEJxeM6Mjxl3GjcQyC5033yRMQFGSaqnOZdDJEcssFoWK0cR5bc7GPMYO+JRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794625549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PvMZeZ9yIkVu9E9IiRAlrlgsMyWhf7ebHp83Lbe1/VQ=;
	b=UvRngRpV7M1MY09y4HhMj4B2AWFqAHAtTh0x0SM+S9HhWJ6rni8MOpsx5pEfdZvA69NF
	 jHVJTlafECku83fx0/CJiNoV1b1u0x005QEqrK5aUE8Xl8pFV99ZU6jh1igq3KqtQg8YS
	 M63eeMd0xoH4dW3f+W9yT7DOsgBiN/WbZu0wl4rlL45mv5iyQ/Wd2AoWA9I1xvijFMfVP
	 iD7pRkxY9ENrYuR0WwsNjVhTlERPPVcUHy0103oTJhwr8U8xBUsU0xm0wI71k8NX1n4Fg
	 CbCyAtJQWvObu9ZFOHoBQgNQy5MzzmNyR7yR8F682MCLSW6nI0GXgz+5LR0TJ+gNn7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b="asH1n7U/";
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2150606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:05:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2150606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=asH1n7U/
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1ae58d17cd9so1111530c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794625548; x=1795230348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PvMZeZ9yIkVu9E9IiRAlrlgsMyWhf7ebHp83Lbe1/VQ=;
        b=asH1n7U/vaF/xEuttB3zOKGnrwCnpLB3LM2aKSshEWntdBLcudy7yMvDA6atdXIheP
         jGV42gYJmxl+xvLVAR0nHTryTxIzWBPo+pcbmjUv/2oHx4/hpzazqAXjZQzGWoUU0eUF
         euWFO5YsYZdnsuY+WBrS2KMMqnbwhxqpGQUAYT2LJRZzEk3FkJzrde3eNRBXv/HYi6Uc
         qiC0gkJjPI8NxU6YH6MuguJIU2bZvoggXY/mWRSNeB3DNfct6mY6Z4Ea9R6L79UJi4jw
         1iGLjzZyAcUh5R0PERgmFJlVBG9NsZqSeeV55BAN59YX6wkAttFYgoPhn7AQTQVxGmHM
         VeJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794625548; x=1795230348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PvMZeZ9yIkVu9E9IiRAlrlgsMyWhf7ebHp83Lbe1/VQ=;
        b=faiekpz5RmWHlMctG22XY93H/g634qr6vPwqyXB1Cf+FQMNw6PJaUv7pHLyw/dhAKA
         8b5sSF5RSB+UPTSeQ5T7kB4rtMvjRY9yZPbP2Od9X6YDxUTBx1IjBTH57ODAAw6Nwa1o
         VgJkiOt+ZRtqpyNucIFXvtCvR+/mKkvV666L0iUV7BWe0r09hhndgNxIcH13iTtOy/D6
         YJSIDowxaWl0oygLOzS3p8ZdqfybK6UBi3/5K6y3BUXoTqxpWaop5BDgy+esSUmHOV52
         2Yd3rVRoZDh4fkUGXhBSG6swRs9kWZos0yujjmQYswgwWn1SU8uAfW4vBWHiNKa3S80/
         8KFQ==
X-Forwarded-Encrypted: i=1; AL+hErGcN9R1W471FlUDV3ifhJW3P2fPnzvzaLgXJrk1QSUBsWqYRdxKOPMD4OZ197Eu1Hswi+6GPmPZeCytL0g=@vger.kernel.org
X-Gm-Message-State: APuU4Z81Cgm5t77VRbHurHto42NVsC8xs8mFntd5GV4QHHr3JQ47lrCu
	BCxM8+1VL27mso0yodzGRjLfqQEHgp7idEFpIXj1vbmdy+v/HiPcby/QPZDPLpEJiWQ=
X-Gm-Gg: AYBFou1WkA9fyoxLLnEF8kyhYziolC3PE/XHc/DpIthQ+nqCd61B9pdxO6eavmJpGuX
	7inqVwNGOKhMiCyhLTbQfY3UlU4J/lK0P7ztysJR460wOk3S3t3wLIPHXnS1YRnD3I4GPZBGaAV
	Pa4QFyVt7ovHv6Q1Ceeka043Q7G3p9tBUlRjfcWZY+Nx3dWAHq2l3ZfDqFoF3GNqzJN7JDw4BL5
	EEkXfMdxJOl8lpL9G7McLxNBwTveqB/T45ZKmdXabccRnq8qRPFN6VOwXsUoQOWGv9BIoDu2QYW
	x7vqd3NT6lIXQ0RQHGSzeTA2FIAq1QCrj9eU+flcbbtHVnbzkKeiU7bIU6Y/Ur2/DIrrsH//32q
	hYkvzABX+NmH0RYDOvFgoaGP9zNwpS2PaZlKMUkglFkMzgmbpCBkN232p5vhbV1dvsEhx7/gucA
	Rd1vY3VflghjRjLwIIaGmcDK+NgFSIZcL4LjXRkRQwcCwnNV6eVt00kgus19d8UouZKDxDjUTvv
	7RuKXEoCLyanjdu+WQmLA2zvH8Yi6/x8Ss72oqsNHsx/3has+OZsQZmg1hZoWN/20qo5BUISJ68
	Vhg31lU3W9gn271bP/a8OmfJBU2LX4MP3tHxo20qGHdYMbG+Jvg7
X-Received: by 2002:a05:7022:5f11:b0:159:2c6d:fcc3 with SMTP id a92af1059eb24-1b5030e7803mr3656625c88.33.1794625547348;
        Fri, 13 Nov 2026 19:05:47 -0800 (PST)
Received: from apollo.purestorage.com ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1b50316e008sm10829382c88.6.2026.11.13.19.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:05:46 -0800 (PST)
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Justin Tee <justin.tee@broadcom.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>,
	Hannes Reinecke <hare@kernel.org>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	James Smart <jsmart833426@gmail.com>,
	Randy Jennings <randyj@purestorage.com>,
	Mohamed Khalfella <mkhalfella@purestorage.com>,
	Daniel Wagner <dwagner@suse.de>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 00/17] TP8028 Rapid Path Failure Recovery
Date: Fri, 13 Nov 2026 19:04:14 -0800
Message-ID: <20261114030454.2836543-1-mkhalfella@purestorage.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset adds support for TP8028 Rapid Path Failure Recovery for
both the nvme target and initiator. Rapid Path Failure Recovery brings
Cross-Controller Reset (CCR) functionality to nvme. This allows an nvme
host to send an nvme command to a source nvme controller to reset the
impacted nvme controller, provided that both source and impacted
controllers are in the same nvme subsystem.

The main use of CCR is when one path to the nvme subsystem fails.
Inflight IOs on the impacted nvme controller need to be terminated
first before they can be retried on another path. Otherwise, data
corruption may happen. CCR provides a quick way to terminate these IOs
on the unreachable nvme controller, allowing recovery to move quickly
and avoid unnecessary delays. In case CCR is not possible, inflight
requests are held for a duration defined by TP4129 KATO Corrections
and Clarifications before they are allowed to be retried.

On the target side:

* New struct members have been added to support CCR. struct
  nvme_id_ctrl has been updated with CIU (Controller Instance
  Uniquifier), CIRN (Controller Instance Random Number), and CQT
  (Command Quiesce Time). The combination of CIU, CNTLID, and CIRN is
  used to identify the impacted controller in the CCR command.

* The CCR nvme command implemented on the target causes the impacted
  controller to fail and drop its connections to the host.

* The CCR log page contains the status of pending CCR requests. An
  entry is added to the log page after a CCR request is validated.
  Completed CCR requests are removed from the log page when the
  controller becomes ready or when requested in the Get Log Page
  command.

* An AEN is sent when a CCR completes to let the host know that it is
  safe to retry inflight requests.

* CQT is a subsystem attribute in configfs, attr_cqt, and defaults
  to 0. Changing it disconnects the existing controllers of the
  subsystem so that hosts read the new value.

On the host side:

* CIU, CIRN, and CQT have been added to struct nvme_ctrl and exposed
  in sysfs. CIU and CIRN can be used to construct and manually send
  admin-passthru CCR commands.

* New controller states FENCING and FENCED have been added to make
  sure that inflight requests do not get canceled if they time out
  during the fencing process. FENCED exists so that the controller
  state machine does not have a transition from FENCING to RESETTING.
  Instead, FENCING -> FENCED -> RESETTING. This prevents a controller
  being fenced from getting reset. Only after fencing finishes is the
  impacted controller reset.

* Controller recovery in nvme_fence_ctrl() is invoked when a LIVE
  controller hits an error or when a request times out. CCR is
  attempted first to reset the impacted controller. If it fails,
  inflight requests are held until it is safe to retry them.

* Updated the nvme fabric transports nvme-tcp, nvme-rdma, and nvme-fc
  to use CCR recovery.

* A controller can be deleted while it is fencing. The transport's
  ->stop_ctrl flushes the fencing works, so the delete path waits for
  the fence without holding any transport lock.

Ideally, all inflight requests should be held during controller
recovery and only retried after recovery is done. However, there are
known situations where that is not the case in this implementation.
These gaps will be addressed in future patches:

* A manual controller reset from sysfs of a LIVE controller will
  result in the controller going to the RESETTING state and all
  inflight requests being canceled immediately, and they may be
  retried on another path. A reset issued during a fencing window is
  rejected by the state machine.

* A manual controller delete from sysfs of a LIVE controller will also
  result in all inflight requests being canceled immediately, and they
  may be retried on another path. A delete issued during a fencing
  window waits for the CCR attempt to finish, but ends time-based
  recovery early: inflight requests are released when the delete
  starts and may be retried on another path before CQT has expired.

* In nvme-fc, the nvme controller will be deleted if the remote port
  disappears with no timeout specified. For a LIVE controller this
  still results in immediate cancellation of requests that may be
  retried on another path. A controller that is already fencing is
  handled like the manual delete above.

* In nvme-rdma, if the HCA is removed, all nvme controllers will be
  deleted. Deleting LIVE controllers still cancels inflight IOs, and
  they may be retried on another path. Controllers in a fencing window
  are handled like the manual delete above.

* Resets started by the nvme core rather than the transport, on an
  ANATT timeout, a persistent AER error, or a keep-alive allocation
  failure, move a LIVE controller to RESETTING without fencing it.

Changes from v6:

- nvmet: Rapid Path Failure Recovery set controller identify fields
  - Never generate a CIRN of 0
  - Commit message fixes

- nvmet/debugfs: Export controller CIU and CIRN via debugfs
  - Explain in the commit message why the values are exported

- nvmet: Implement CCR nvme command
  - Document why nvmet_ctrl_find_get_ccr() takes ctrl->lock

- nvmet: Implement CCR logpage / nvmet: Send an AEN on CCR completion
  - Move clearing the CCR AEN bit from the log page patch to the AEN
    patch, and do it under ctrl->lock
  - Assert ctrl->lock in nvmet_add_async_event_locked()

- nvme: Rapid Path Failure Recovery read controller identify fields
  - Document the ciu and cirn sysfs attributes in
    Documentation/ABI/stable/sysfs-nvme
  - Move nvme_fence_timeout_ms() to "nvme: Implement cross-controller
    reset recovery", where it is first used
  - Commit message rewritten

- nvme: Introduce FENCING and FENCED controller states
  - Allow DELETING and DELETING_NOIO from FENCING and FENCED. This
    replaces v6 patch 18, see below
  - Document the new states in Documentation/ABI/stable/sysfs-nvme
  - Commit message rewritten
  - Dropped the Reviewed-by tags due to the above changes

- nvme: Implement cross-controller reset recovery
  - Describe nvme_fence_ctrl() in the commit message

- nvme: Implement cross-controller reset completion
  - Cancel ccr_work in nvme_uninit_ctrl() so it cannot run after the
    controller is freed

- nvme-tcp / nvme-rdma: Use CCR to recover controller that hits an error
  - Update the timeout handler comments for FENCING
  - Describe the timeout handling and controller deletion during
    fencing in the commit message

- nvme-fc: start error recovery instead of aborting timed out IOs
  - Count every abort in ctrl->iocnt, not only those issued during the
    association teardown, and do not reset the count when the teardown
    starts
  - Outside LIVE, abort the timed out command from the timeout handler
    and return BLK_EH_DONE instead of queueing ioerr_work. This replaces
    queueing ioerr_work in DELETING/DELETING_NOIO, which could queue
    the work after nvme_fc_delete_ctrl() cancelled it for the last time
  - nvme_fc_start_ioerr_recovery() queues ioerr_work only after a
    successful transition to RESETTING
  - Drop the nvme_fc_reset_ctrl_work() reordering, which is no longer
    needed now that timed out commands are aborted outside LIVE
  - Document in the commit message that recovery only runs once the
    next patch is applied
  - Dropped Hannes's Reviewed-by due to the above changes

- nvme-fc: perform error recovery directly from ioerr_work
  - Do the recovery in ioerr_work itself and remove
    nvme_fc_error_recovery(). The work no longer re-checks the
    controller state, since it is only queued after a successful
    transition to RESETTING

- nvme-fc: Use CCR to recover controller that hits an error
  - Rearm the timer for a request that times out while FENCING
  - Dropped Hannes's Reviewed-by due to the above change

- nvme-fc: Hold inflight requests while in FENCING state
  - Replace synchronize_rcu() with an explicit FCPOP_STATE_HELD op
    state. nvme_fc_fcpio_done() holds a request with
    cmpxchg(COMPLETE -> HELD) and the flush cancels it with
    cmpxchg(COMPLETE -> IDLE), so exactly one of them completes it
  - __nvme_fc_abort_op() uses cmpxchg(ACTIVE -> ABORTED)
  - Count an aborted op down only after it has been completed or held,
    and make ctrl->iocnt an atomic_t
  - Start recovery before deciding whether to hold a request, and hold
    it only if the controller is then FENCING. Holding while LIVE
    could leave a request held forever when a delete won the race for
    the controller state
  - Rewrote the commit message
  - Dropped Hannes's Reviewed-by due to the above changes

- nvmet: Add support for CQT to nvme target
  - Mention in the commit message that changing attr_cqt disconnects
    existing controllers

- nvme: Add support for CQT to nvme host
  - Document the cqt sysfs attribute in
    Documentation/ABI/stable/sysfs-nvme
  - Dropped the Reviewed-by tags. The v6 cover letter announced this,
    but the tags were left in the v6 patch by mistake

- Dropped "nvme: let controller deletion wait out a fencing window"
  - nvme_delete_ctrl_wait() is gone, and nvme_delete_ctrl_sync() no
    longer waits for a fence. Deleting a controller in FENCING or
    FENCED now works directly through the state machine, see
    "nvme: Introduce FENCING and FENCED controller states". The tcp
    and rdma module exit paths and rdma device removal use
    nvme_delete_ctrl() again

v6: https://lore.kernel.org/all/20260920182936.2317916-1-mkhalfella@purestorage.com/
v5: https://lore.kernel.org/all/20260712022437.3743117-1-mkhalfella@purestorage.com/

Mohamed Khalfella (17):
  nvmet: Rapid Path Failure Recovery set controller identify fields
  nvmet/debugfs: Export controller CIU and CIRN via debugfs
  nvmet: Implement CCR nvme command
  nvmet: Implement CCR logpage
  nvmet: Send an AEN on CCR completion
  nvme: Rapid Path Failure Recovery read controller identify fields
  nvme: Introduce FENCING and FENCED controller states
  nvme: Implement cross-controller reset recovery
  nvme: Implement cross-controller reset completion
  nvme-tcp: Use CCR to recover controller that hits an error
  nvme-rdma: Use CCR to recover controller that hits an error
  nvme-fc: start error recovery instead of aborting timed out IOs
  nvme-fc: perform error recovery directly from ioerr_work
  nvme-fc: Use CCR to recover controller that hits an error
  nvme-fc: Hold inflight requests while in FENCING state
  nvmet: Add support for CQT to nvme target
  nvme: Add support for CQT to nvme host

 Documentation/ABI/stable/sysfs-nvme |  26 +-
 drivers/nvme/host/constants.c       |   1 +
 drivers/nvme/host/core.c            | 237 +++++++++++++++++-
 drivers/nvme/host/fc.c              | 360 +++++++++++++++++++++-------
 drivers/nvme/host/multipath.c       |   2 +
 drivers/nvme/host/nvme.h            |  26 ++
 drivers/nvme/host/rdma.c            |  67 +++++-
 drivers/nvme/host/sysfs.c           |  27 +++
 drivers/nvme/host/tcp.c             |  67 +++++-
 drivers/nvme/target/admin-cmd.c     | 126 ++++++++++
 drivers/nvme/target/configfs.c      |  36 +++
 drivers/nvme/target/core.c          | 122 +++++++++-
 drivers/nvme/target/debugfs.c       |  22 ++
 drivers/nvme/target/nvmet.h         |  20 +-
 include/linux/nvme.h                |  70 +++++-
 15 files changed, 1106 insertions(+), 103 deletions(-)


base-commit: f33c8bc785401669b29229bcf3d0086ba9f5b87c
-- 
2.56.0

