Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793383053;
	b=XqCcKDuVmM4AGnO5NlMqrJ0YLDHwEiVaJHBTKEREHwh49bwz3Qcr2QPvZGj+t5yrdBJB
	 /WGYmLnJfWswZ2hhISC5VPKfJajVF96whz5Z8lqOCJAKK9d1SOV//NLTRs7WlnFs+5VU3
	 PyVFUwkSmCIotmamoIfwQkZUg0AbAO+jNM16EthhCCnXX3mBd+ldJq2Ojw9AdP5SJLYj3
	 TMIA0rKXH6Oz7iepkDJPibOloKGCTwVzMgbXpLjTwe5s93Nfovd8KtWjelq47LgzGog9q
	 4YpZCYFrwOTbtrTxbfGIUbg3RGFpTUKEtuwb5Xk52RDo+/WZZMO3tZQZTKfDSjc8kuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793383053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=d7QGFJF0OYQfK+5MKMnuj3ltpU1FCEC4gVUFK4+5bus=;
	b=GDclvGHc1aGPDcf35r2bL9PbdQ8v1hwkbjcazfScXAPyOYk2aXgmb2lbjDSfIom0x6iH
	 J0AqkWt2yTJBd8WOraghSDrQmUPpwpS5oJY5oiPZlIDawbvmwfC8hrsXASmefDVigNCsJ
	 l7DNREKb0UJQoYCkhxuhqVxDzWJ4Qse/lRddlCs5MVicFJrO0H4UlORN60412dQBltkwy
	 F0Ew/8zb0UGVRRVGrw4O1+qvCxx7LHObSYoW42rRvu5LVidAmNm643QJiqGlzYLLzRZEw
	 cvdJtW+FoQSgnDA5764BX1KnktzCBdUVZ0mmwjWTJJ4YUQ0a3Ke3B8VWm+wWofBZH4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=BsCQXlN6;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B173C606A327
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:57:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B173C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=BsCQXlN6
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso1742996eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793383052; x=1793987852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d7QGFJF0OYQfK+5MKMnuj3ltpU1FCEC4gVUFK4+5bus=;
        b=BsCQXlN68PYAvBk3gN1U5g+YwA1wlJ4iTZw+InVMNNhvTWmqI+dfoVU5DypO50CTat
         Xhp3SKoaUoc5Y375LcfmszWo7BvIv3gq9LFaNPVXcVpApDXpJFh4+Q/FyUqIxnfIRqFm
         TVDahshDt5O4OQN9YmbB2x/wZeNaIZwaPQbtBfErpAPuMAgoNWARFQyHkizR3sgBrPoU
         HzzGN7ukz4wU76R7sqS3+3H6r3LUhdOw8ZugLvoVXrZut6+reDnMbD9EAYkpJ1EJG0kj
         k88zqKsjyVDabwoDTqK4LQi/+gsQK0pl6pcF8q3/Tgg7EYpvVjWve63/lo3sgco5STBP
         bPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793383052; x=1793987852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d7QGFJF0OYQfK+5MKMnuj3ltpU1FCEC4gVUFK4+5bus=;
        b=wDPD7bu/uYlXH6lPaErXvyNJ4R1oHBAta3u6VbQvC1U5oh5Rv6603TtawINoExYxAZ
         Y2L/YoQGwSL+GBnmv9oElHmgxr+Le0RFJdx9fqjJUtXbyRcAhDk92hHpotxP3scJ07a3
         40qoP3HUZ5R4hMlclze4kpZ1hd+KsSiTvut/B+Oghu48sm+lOocXzullrdvirZudtZ9V
         kRAkf8U70o4A5cmjX3lyuYFYCa3iwZBVU0NhgqmSg1R/JPHc4N+Xi6u+kMnxZpAwppK4
         dC0U/EtW7dQxxpUu40swC52rDT0+oQgScuXKMNbQuUAp6msuBmer6/3eyhL0yaKTUhIr
         hzkA==
X-Forwarded-Encrypted: i=1; AKwUvBxCoahHC5Ch1IV1zQx2bljiAOzhWixrGZIwZE+4NIC6wXXMSxJr16A1uCIsRWjbP1GnEnI5V3NSr8UBfbw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBFlaQPYiUzUYaiJSDAvIn9GexvuRyxRnRZ7ReGyC1dbxlqPFy
	FJCAFT6nCnFkBJmH66tpwPmOPUEswZyWSPXtgGdEme84nH1U+PeOm1NhPIBfe01VSjU=
X-Gm-Gg: AYBFou2nm9t6HfYVcFEzLhOFHO3wAaNrV6LETT+ydwKNGHnQCHGtsixdsl0GKsqbyJ3
	tYTrtsnuRSANXD0PeNV6iPWel5CSlRwJakGhEl8KeWXA6XRe/ijFHx58/uCan9zkBMHpMbeOEpK
	Bq1w+GaiTod8QzVwSYruvsE5kXG63F8/+lkaa5Zo5qf53wok6niGRhE4Dc3Nc9xF9WlcY9awbs9
	PlGG7C9xx3se8Y6XpkTw/waCRT9mOIdOhF2DU+0E/OvB5t2oWdWHg66VLHUh709sByzXZ/HK4Ml
	dDpTZZ6gbK4RPGuulbdCNCeyhn0QGdMg7BFwyJuQlVT8Owx/knCCTpuiDt9WqZ7KL/qU/gTlkTY
	n7uqH5cPqGF87wTd5agvHMFdnL/XvU92DG+9mPFieVQQlPdKBnK89/G7c9DuDOlXEQ4Kj5QelCV
	vSZ4oRDvG8L0jTCWgWKvSV1QA9LAUX8XcHJUEu3soAqoyNZMfjBiRuGTIrv0mdbvGECtTkZtO2i
	DAXMNgfj9+1yXBp2yEG+XbQdI1fxCZxFZ59dgsOxNuIXBVw7qKbBuebI9qrnN4kitSnOpRU+XEt
	QBjfxcXHuuKQ/v6ak2LGQGWyQL/bNtL2txxSiI/wfoc+qVhYhguTEiYyQ0P/D2PBqsdJkP/QNR6
	hDxuC3P2gWh0zpDXO1YCtg1tYrBIa5FpRycv4Ebqnh2STBZ/L/aZ49RJyFKQpCUWgT4hdduVfRm
	TfhztbR+NK7wk97TyqvoRkCoBb
X-Received: by 2002:a05:693c:69d2:b0:36a:1294:59e0 with SMTP id 5a478bee46e88-36a4241eda9mr4638475eec.24.1793383051379;
        Fri, 30 Oct 2026 10:57:31 -0700 (PDT)
Received: from brian--MacBookPro18.purestorage.com ([170.85.204.93])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4294419dsm8802701eec.18.2026.10.30.10.57.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 10:57:30 -0700 (PDT)
From: Brian Bunker <brian@purestorage.com>
To: linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Bart Van Assche <bvanassche@acm.org>,
	linux-kernel@vger.kernel.org,
	Brian Bunker <brian@purestorage.com>
Subject: [PATCH v2 0/1] scsi: core: Restart the queue when unblocking a device set running
Date: Fri, 30 Oct 2026 10:57:19 -0700
Message-ID: <20261030175721.24379-1-brian@purestorage.com>
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

A SCSI device can be left in SDEV_RUNNING with its request queue stopped
for good. The task that put it there hangs holding the device lock, and
anything else that takes the lock hangs behind it.

This was seen with iSCSI when a session drops again just after
recovering. The error handler offlines a device while its transport has
it blocked, which leaves the queue stopped. iscsid then writes "running"
to the device's state attribute and store_state_field() moves it to
SDEV_RUNNING without restarting the queue. The rescan it starts sends an
INQUIRY that can never be dispatched. When the transport later unblocks
the device, scsi_internal_device_unblock_nowait() rejects it with
-EINVAL because it is already running, so nothing restarts the queue.

Changes in v2:
 - v1 restarted the queue in store_state_field(). Sashiko pointed out
   that this unquiesces a device its transport still has blocked, which
   transports such as SRP and drivers such as aacraid rely on while they
   reconnect or reset the adapter. Drop that.
 - Instead, let scsi_internal_device_unblock_nowait() finish the unblock
   of a device that is SDEV_RUNNING with its queue still stopped. The
   transport now decides when the queue restarts, and the device moves
   to the state the transport asked for. This also stops
   scsi_host_unblock() from bailing out at such a device.
 - The cost is that the writer of "running" stays stuck holding the
   device lock until the transport unblocks, instead of for good.
 v1: https://lore.kernel.org/r/20261030164229.10037-1-brian@purestorage.com

Evidence from a vmcore of a hung initiator (a RHEL 9.6 5.14 kernel; the
code involved is the same in mainline). The device is sd 0:0:0:1, and
iscsid is the task that wrote "running" to it:

  PID: 12087  TASK: ffff9635c9c80000  COMMAND: "iscsid"
   #5 blk_execute_rq
   #6 scsi_execute_cmd
   #7 scsi_vpd_inquiry
  #10 scsi_attach_vpd
  #11 scsi_rescan_device_rh
  #12 store_state_field
  #13 kernfs_fop_write_iter

  sdev_state                   = SDEV_RUNNING
  queue_stopped                = 1
  request_queue->quiesce_depth = 1
  sdev_gendev.mutex.owner      = 0xffff9635c9c80001 (iscsid, plus a flag bit)

The INQUIRY iscsid is waiting on belongs to that device's queue and was
never dispatched:

  state = MQ_RQ_IDLE, start_time_ns = 0, deadline = 0

The other LUNs of the same session were unblocked by the transport and
had their queues restarted:

  lun 1: SDEV_RUNNING            queue_stopped = 1
  lun 2: SDEV_TRANSPORT_OFFLINE  queue_stopped = 0
  ...
  lun 9: SDEV_TRANSPORT_OFFLINE  queue_stopped = 0

(scsi_rescan_device_rh is this distro kernel's name for
scsi_rescan_device().)

The kernel log of the same crash shows the sequence for the stuck device
(sd 0:0:0:1) and its siblings:

  [50958.843822]  connection9:0: detected conn error (1021)
  [50968.259428]  connection9:0: detected conn error (1020)
  [50968.259456] sd 0:0:0:1: Device offlined - not ready after error recovery
  [50978.298947]  session9: session recovery timed out after 10 secs
  [50978.298977] sd 0:0:0:2: rejecting I/O to offline device

The other LUNs are unblocked by the recovery timeout at 50978. The
offlined device is not: by then it had already been written back to
running.

Questions for review:

 - The new case only runs for a device that is SDEV_RUNNING with
   queue_stopped set. As far as I can tell that only happens when
   something sets the device running while it is blocked, as the sysfs
   write does here. Is there any caller that relies on -EINVAL for that
   combination?
 - scsi_internal_device_unblock_nowait() can be called without
   state_mutex by some drivers. Could a concurrent unblock see the
   transient SDEV_RUNNING-with-stopped-queue state between the state
   assignment and scsi_start_queue() and apply a different new_state?

I do not have a deterministic reproducer. The analysis comes from the
vmcore, and initiators running the v1 change have not hit the hang
again, but with a race this narrow that is not proof. Review of the
state transitions is welcome.

Brian Bunker (1):
  scsi: core: Restart the queue when unblocking a device set running

 drivers/scsi/scsi_lib.c | 9 +++++++++
 1 file changed, 9 insertions(+)

-- 
2.56.0

