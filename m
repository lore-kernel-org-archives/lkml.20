Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793378564;
	b=gfkYte6Ix7fTq01Th8SfVBarnw9RMq14iUUl7ykRQAv4BECEsNdL1ugz2MrnbovrN0X0
	 wFKZ/Sk1TGsIunacVU5D5/vAceqAbprmWv3SUb/SFW0BPmTs0BsWQg46Swcc3XpqYgw2r
	 ycr8T9cGKi8/gppD+G2tk/UoqGwnX7jcEzqEP8Niks9uIvGP5CG3bDcdZI3eEF7X9EYnC
	 lEh9lNapbXEa4+4NmR8FzPrq+TX+MWLhRTBOVIDLCka0IGvMFvRPsNYZnfzMbcPHRGzJe
	 q8cECyP+dOxqaCmgum+8S8fJSRMqO73CWSY9pykYt1Sr8JT5QtkIxqWEe7KuJzLX6pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aAccZoMJEsplah6L3JydDrUjSPOSkdX8e1SPOAKO6Bo=;
	b=wZF5kpOuUVbox7SV80VU2nLi8vZdc12+zrEBhOIXGH25qF5ae8YILEt+w5z/fvhf5XmR
	 RiT/jzJCp9toN+RLTOr8CrBw2EIRWAc7oYJNDxPARNv37O/C29dEXv2KTaU23hnWB3+iu
	 4asydXfMXxFByx0SfqrTfGwy1a+dqdflxlySG9loYAQefSu78BQjFZ1wN48/Y75COdxbg
	 /4fLmvsGK/hc2hYIg1uoKDGqKAcWJ+jY26ak3ReJZwUc2+A1MYFRaWDi4kk3sfIrNq16P
	 FA90RO1JXCp3SQZx7MI765jTvXHddmvvHBS/tviwv0u76C15qnqd3NmePgrNcMEt9mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=fOOQI2sD;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF9D606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:42:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDF9D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=fOOQI2sD
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36a1947498bso240256eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793378562; x=1793983362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aAccZoMJEsplah6L3JydDrUjSPOSkdX8e1SPOAKO6Bo=;
        b=fOOQI2sD1kQOz7BdV6DnuNb/+senZa6K3B1yYyrmt2HoSX7L4IVAWfLet9n9JbCKy3
         aKE/GN9N736JEASCXk70x6H2s9sgjostR5q6fqMWmqBtuWqp851AUZXF07DKCUNHIIyB
         mCgsEBXUYE0xDlBHQ4xoO7PJp9pMyr12K5cRrd73IPm0esCSBVq9UlXcMtXBVY5aRqW2
         PV1k3gmYMhfnvtObunJyVxgI8xqDb9xIK1bOkX4xqJzp6ZZAfcoJFcNg5M+fm0aG/sE/
         ayVgPR1TludH+1wQsZ4VSRxFxB111M7Tz0FJi7Frivl3G9FbebBB1nl+qBSEc3swqHAF
         319g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378562; x=1793983362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aAccZoMJEsplah6L3JydDrUjSPOSkdX8e1SPOAKO6Bo=;
        b=NJmVPoabDW2udoMlfDtk/20mQHYbAG3TD6tNAs8O/cqf5M00vH5dsL8qpNDTkmavhp
         7I4EF97+vzTr3sPVMbOcY+6VR0lND/HsBEKKClKkxHKXRh8RdzmX7rNPj8Vu6cEauY4h
         YAPhoEyqaiw8b2V7C5w7CYLWH5f7hQ1tIMyXOSDqutqF8DQrjjBhFaCVoQeBSrWZnp+o
         24s7yvp5xDimhDX7VP/D5dXnrpkW4JD2aWkzdhPOyIICvB974c8Ouf816adQu87dAgOd
         I93gpoTknj0PWmcZww6tToNHH+bRCpRnUBnUhhbGrWAK7p97bUbr7sjM7P35iyuy/eEd
         SqWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqRHSST6JjSIpqtRS07rPhdfqvpuouY47/sgXMcb6xsgAfBGSwKQ8kaFj9baNQ1x22t+TR1FfEVlSaFBg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9PgAA9zFmNzQkuebim70DqpM+IcB3FpHk/Zo5vmTUpcLQLyq0
	oVuqNRX4CTOmySi8pCP9IY77TYYqPlHzUuJo3oKf+O9l5lxgUrVm29GWupaZTP2vWIcSHN2vPkM
	Bf3VfXLELCFcac4hoQffdHqDC3buvWsDtcPbR3ALdXbBQtF6tGLA/j+nup2UI2ZAe2qX1Ts0X0q
	GopkR5e5ka/zHXffDNfa214/MtxCL0EMZajHgvniHo1bQZchYvBDGKo638lw==
X-Gm-Gg: AYBFou2YA6TtmA0nsQaSyiw35JrWQ5icrr2urutwNOOCjhlOy5RiBhHXAHlm4W5hijS
	dI9qDnch78+U2nPXsYX3eCyRjaf8INnEF5/bD0qK1Def87DcqqnzfoEoJJhryhbCO7lxs9rej0Y
	JhFkbjkeCsttYtZFHZWSxL9GoqxsL5fV4KGnyPKGNJ+QXxLhWI4keVZdnlFH5lOfYvk0LDatTvd
	3BHf8yDOscvALpdPoIwmrZpx5t9HgB8GWrvCMt5LvSME6IqQUSKphy8rxs0mdtOUuWzNbE+sKCb
	Hc4UziwWH2drQWn4GFTkpohG5vhPgR4ZYKXl4ApIs7ph+oEx4KQmi2n5y7JgI1gipIwRdtst96V
	kPg2F/vBSLxbdLGSc9PRqWKUUScCjqaEwWHKpB3nDt00pFNNZPR9XEXWMWHSvj7fwPp9suVVF36
	R+eNzWWHXLiPD7Di+FUkVo25Flh6LJPRwgknamfGtPQrMVjDGve3M6B/MlUInlkuugFpTLjzp69
	TWfTSjmgpRau1Rx6tBAbKLcpYmgn7YJN/TEgvsRJ4mK62Sk53+9axNiqjIALUIArXtthiA67K/U
	9iq1oeKEbfuG6WYpj2PHaLjR7CYmU1vs0Kl/8MnP30UM5jwCZUL248ReO+Xljwep1/3LSqziJNW
	VTa9VNYzWjw/KXofV4DG4ElGRgH511sHvFpRD1z32O5h1EaJzoZfmHN2+1D6P4RBTZW4f50svoQ
	wx1AGYfOFoWTVSsSwL/8o=
X-Received: by 2002:a05:7300:cb0b:b0:36a:1c97:26e5 with SMTP id 5a478bee46e88-36a4232f2bdmr5566292eec.12.1793378561529;
        Fri, 30 Oct 2026 09:42:41 -0700 (PDT)
Received: from brian--MacBookPro18.purestorage.com ([170.85.204.93])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4294419dsm8475040eec.18.2026.10.30.09.42.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 09:42:40 -0700 (PDT)
From: Brian Bunker <brian@purestorage.com>
To: linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: lijinlin <lijinlin3@huawei.com>,
	Wu Bo <wubo40@huawei.com>,
	Bart Van Assche <bvanassche@acm.org>,
	linux-kernel@vger.kernel.org,
	Brian Bunker <brian@purestorage.com>
Subject: [PATCH 0/1] scsi: core: Restart a stopped queue when sysfs sets a device running
Date: Fri, 30 Oct 2026 09:42:28 -0700
Message-ID: <20261030164229.10037-1-brian@purestorage.com>
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
the device, scsi_internal_device_unblock_nowait() skips it because it is
already running, so nothing restarts the queue.

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

Only a device that the error handler offlined while it was blocked can
end up like this. A device that the transport unblocks normally has its
queue restarted, and sysfs only accepts "running" for a device that is
running or offline.

So in the case above, the error handler offlined the device, iscsid
wrote "running" to it, and only then did the recovery timeout unblock
the session. All three happened within about ten seconds, which is why
this is rare.

The fix restarts the queue in store_state_field() when it moves a device
to SDEV_RUNNING. scsi_start_queue() is a no-op when the queue is not
stopped, so this is harmless for devices that were never blocked.

I do not have a deterministic reproducer. The analysis above comes from
the vmcore, and initiators running with this patch have not hit the hang
again, but with a race this narrow that is not proof the patch fixes it.
Review of the state transitions is welcome.

Brian Bunker (1):
  scsi: core: Restart a stopped queue when sysfs sets a device running

 drivers/scsi/scsi_sysfs.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

-- 
2.56.0

