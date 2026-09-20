Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FEB47207E
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789929018; cv=none; b=kTGfwK+u9iQD8qTsQIUTp3eSXIWRcxMz4zeS5CqNUPqYvF8sXyg6FxKJFKdE2USRr36SC8l3DJKYSg/41KUYenYN2oALOKP5LcQn4KuHuDPd7SwrKSWI40BiqeC2cDsmdLscvId+9hWBlNJoTAkqhaso8JZSQeqgz0tAZOjiQ5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789929018; c=relaxed/simple;
	bh=HPEcge+NuUfTcnF6XlfcUGivxdkMsLmlOJtkoYLaEn8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PPJ2uUbEKq2vuTK1xsVnsWWzBqyCgEc7CB50W8DfEmK2/+J+UGBiil5Nt/c5UfEFpLN1LfITgGPirBIX2D9cphTbI9uHLv/z2CUuldHjqWvO2AIaTMPt7UiT+yl1LxCRCjVXu4tqeeqKGgJZMTQ0mtUMFfzFDIVQbD+5Zp+L6BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=YT/ltzbq; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="YT/ltzbq"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cebad4adso1591712a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789929015; x=1790533815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TYNF+NiiGURy/x7g9ewiCLCi8QgyEs2bm8h4Tj0kgik=;
        b=YT/ltzbqheTfcLaji3zN/yd9PePShqI9piNVS1BqN3Qn708DOMYyVM7aHJbyAZrxJK
         9KoSzwhbeO48u9xqYnSqBIpOj9t9Ug9ePWxv3nougmmrKjr80b+TGNJ8fKX7bsFV1GCQ
         KfDXgZeybZt36fOdnEXQ2fB784IvetbQqe2BKn6yx/q3NLcTGva995SKApg6xiB5U8Fx
         TaYWoQ4h0etjjcMhQtMdGiMPsREsP60ns6D4YOhBSI0H8Cio/CCI+mq9H2l+K4FG7yRd
         705qoNDqNFWozqYeMtTChfo+6nUu6vD8KkTqovCmj/Dim2sx3ucD/D+i6Ylk2nNKl0wk
         NxXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789929015; x=1790533815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TYNF+NiiGURy/x7g9ewiCLCi8QgyEs2bm8h4Tj0kgik=;
        b=Ms5CnWQ0LOwhxyCjn9T4I6GELb+mRGzbOF0RseL9+323tX88CywAygxpTglMjNI+8t
         ktmXpLdA14UlGsTaaexu8xY0jW1H5euxoixczUPpc5Un/guzV1GoZrJX7OCo/tt1QMcn
         XlyvVk8h5fWX1WbxwWqwnC4faIQOdOWuqrh/Fw5cn3sQJGBKY4l191PLh+MGlpQusViA
         VfAtlwDsxH4fObfuwpsitkvvcejN8e+4YbkHTGyujbx70GFJAzO1EReb2Z47DWviAgaV
         4qA8Y5/kOvbfQ+dI9qjInPEFXh3Q50AYLYrfOkDQnUzysh6xSRC1Ss81hNKZKc2+gTY1
         CzzA==
X-Forwarded-Encrypted: i=1; AKwUvBwW8k22dURTe3XtBhLNeHsA8Y1oTGy5tuunnWXAw5WZPUkz+qudkM9iRsuS2Ge34CzyDyQsodc7sKz9icc=@vger.kernel.org
X-Gm-Message-State: AFuF++l9SmuwEyZlIz8DqTT76JFdCKRSRPWp66HCwIyx/b7hDLBYvkPK
	prNBXe4dKtuNgOOWb58BHewPR0Wt5510NzMPFIuLnWQcsY48n3R3GVqluNAatogtKpc=
X-Gm-Gg: AYBFou0yoUFFP/0xS2bUsWJkfPZur03SbLP6LrzTHC14uyj1/jceu5/+2BgqE/C6SCJ
	U54WsCB8UWxrAHHpjZoREinbnmPOM7X2eWdxQgmVb21VvBBg14oBlaOVm9RGbrp4pUVlxXTtaEV
	ObOYTz5N/C/YYXqo+nPRgjxUhqrIk0o7buutUI46h3pDh1DpwZy3mLzKpJcXrWNwz1fhuEwh0rJ
	mf9zpqxhSuM0LKN1BMUUpGesdROQrqlJtywtruzInlWO2jnMmqTQqvLMedW/7t2Pa3jyQKDlCwh
	IkKGuzH/fpEY+e2ZVG5AbSThbGmJgfS00ecME5XZalfChr13c15aF9+VD09OMF8vP319kK5J46z
	lSkDyLVE19mBzwlBqLj+CxWSdr+3+SN/Z8q+DImCFaWbLo5VTwL20wC+66OcL0k9r4+U7xasvnk
	8d+krnyvUgqcYPZENem3xI9TG8uIyPKJwzlBMda6J/P4Fbzg9m/tZT5INQ
X-Received: by 2002:a05:6a21:3998:b0:3d1:5c01:e6c0 with SMTP id adf61e73a8af0-3dd8c425bf7mr13779495637.11.1789929014904;
        Sun, 20 Sep 2026 11:30:14 -0700 (PDT)
Received: from ceto ([2607:fb90:9c20:5ac0::1d8c])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-144da432647sm20924589c88.5.2026.09.20.11.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 11:30:11 -0700 (PDT)
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
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 00/18] TP8028 Rapid Path Failure Recovery
Date: Sun, 20 Sep 2026 11:27:58 -0700
Message-ID: <20260920182936.2317916-1-mkhalfella@purestorage.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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

On the host side:

* CIU, CIRN, and CQT have been added to struct nvme_ctrl. CIU and CIRN
  have been added to sysfs to make the values visible to the user. CIU
  and CIRN can be used to construct and manually send admin-passthru
  CCR commands.

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

* Controller deletion now waits for an active fencing window to end
  instead of failing, so a sysfs disconnect, rdma device removal, or
  module unload during fencing no longer drops the deletion or leaks
  the controller.

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
  window now waits for fencing to end instead of being dropped.

* In nvme-fc, the nvme controller will be deleted if the remote port
  disappears with no timeout specified. For a LIVE controller this
  still results in immediate cancellation of requests that may be
  retried on another path. If the controller is already fencing, the
  association is torn down without completing the held requests and
  they are only allowed to fail over once fencing ends.

* In nvme-rdma, if the HCA is removed, all nvme controllers will be
  deleted. Deleting LIVE controllers still cancels inflight IOs, and
  they may be retried on another path. Controllers in a fencing window
  are now deleted only after fencing ends.

Changes from v5:

- nvme: Introduce FENCING and FENCED controller states
  - Treat FENCING/FENCED controllers as available paths in
    nvme_available_path() so a multipath head does not fail all IO
    while its last path is being fenced

- nvme-fc: Refactor IO error recovery
  - Split into two patches, "nvme-fc: start error recovery instead of
    aborting timed out IOs" and "nvme-fc: perform error recovery
    directly from ioerr_work"
  - nvme_fc_start_ioerr_recovery() queues ioerr_work directly in
    DELETING/DELETING_NOIO so that a dead target does not hang
    controller deletion
  - nvme_fc_ctrl_ioerr_work() claims RESETTING before tearing the
    association down and skips recovery when another state owns it
  - nvme_fc_reset_ctrl_work() tears the association down before
    nvme_stop_ctrl() so that flushing ana_work or fw_act_work does not
    get stuck waiting on IOs that never complete

- nvme-fc: Use CCR to recover controller that hits an error
  - Tear the association down at the start of fencing_work, releasing
    all LLDD resources as soon as the controller enters FENCING. This
    fixes a use-after-free followed by a panic when the LLDD is
    unloaded or shut down (e.g. lpfc during kexec) while a fencing
    window is running: the LLDD's bounded unload waits expire before
    the fence does, its resources are freed, and the post-fence
    remoteport_delete upcall lands on freed memory
  - Stop keep-alive and cancel async_event_work before the teardown.
    AER submission bypasses blk-mq and must not reach the LLDD after
    the hw queues are deleted. cancel_work_sync() is used instead of
    flush_work() because fencing_work runs on nvme_wq, the same
    rescuer-equipped workqueue async_event_work is queued on

- nvme-fc: Hold inflight requests while in FENCING state
  - Split nvme_fc_delete_association() into
    __nvme_fc_teardown_association() and
    nvme_fc_flush_held_requests(). fencing_work now runs only the
    teardown at fence start and the held requests are completed on the
    FENCING -> FENCED transition, so they can fail over only after CCR
    succeeds or time-based recovery ends
  - Complete the held requests while still in FENCING, before moving
    to FENCED, so an io timeout cannot claim FENCED -> RESETTING and
    start reconnecting while the flush is running

- nvme: Add support for CQT to nvme host
  - nvme-fc: complete the held requests in fenced_work when time-based
    recovery finishes, matching fencing_work
  - Dropped the Reviewed-by tags due to the above change

- New patch "nvme: let controller deletion wait out a fencing window"
  - DELETING is not reachable from FENCING or FENCED, so during a
    fencing window nvme_delete_ctrl() fails with -EBUSY and its
    callers silently lose the deletion: a sysfs disconnect is dropped,
    rdma device removal returns early, and module unload leaks live
    controllers. Add nvme_delete_ctrl_wait(), use it in the tcp/rdma
    module exit paths and rdma device removal, and make
    nvme_delete_ctrl_sync() wait the same way

v5: https://lore.kernel.org/all/20260712022437.3743117-1-mkhalfella@purestorage.com/

Mohamed Khalfella (18):
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
  nvme: let controller deletion wait out a fencing window

 drivers/nvme/host/constants.c   |   1 +
 drivers/nvme/host/core.c        | 275 +++++++++++++++++++++++++-
 drivers/nvme/host/fc.c          | 333 +++++++++++++++++++++++++-------
 drivers/nvme/host/multipath.c   |   2 +
 drivers/nvme/host/nvme.h        |  27 +++
 drivers/nvme/host/rdma.c        |  61 +++++-
 drivers/nvme/host/sysfs.c       |  27 +++
 drivers/nvme/host/tcp.c         |  59 +++++-
 drivers/nvme/target/admin-cmd.c | 126 ++++++++++++
 drivers/nvme/target/configfs.c  |  36 ++++
 drivers/nvme/target/core.c      | 115 ++++++++++-
 drivers/nvme/target/debugfs.c   |  21 ++
 drivers/nvme/target/nvmet.h     |  20 +-
 include/linux/nvme.h            |  70 ++++++-
 14 files changed, 1083 insertions(+), 90 deletions(-)


base-commit: fd9beb8870736e1c6a0b2351d88a161aaeb2b326
-- 
2.55.0

