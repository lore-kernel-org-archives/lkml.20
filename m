Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530143;
	b=So8ZxnvnzSsbLMrDEMVb/dlL660yAia3JHaY3T2JXDebxwudjTYyeIGSIU8v+m2eXBlY
	 QwLf4K2p56OGlkZL+q5uxLsv1d0hh+vl23aRGM6jQ6+kPV4YTkQyCbZgdasquB4FoU/Ul
	 /+ao+vvqfKxxEnG7/hrDNPyvB+b7pwHmFZ1KhXHxsokwIyZpX+xcIWoIJa0KTYuHqfJ3O
	 buwTISkpVXmTajzcPdyT7KYnUqDrepoC2XBYP3viSyAW1RMknUDA8pWw5lFwBSnFBbCZp
	 RrixuMS0ZZ5QFMMI3kuAsV9B7dl3f9yC3Tjj2KWn2ewK7lxVkMHfnF0SjbyRRmdos+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=FXNL5WQI5c02nExDW7bQODazz59dETjZrgoxn+webag=;
	b=KqV/FahI+2ljkloIW3GmssvJhsdPjJaayL0Z3R/n3JzGknGE8v7+Ox3OtYYxZxODqPxq
	 BGvmnhTxH/bAFBdbn8+RDZruydfErfwqMO3Xy5/Vh5MfevYM9XIvH6jv3qg1u9RUZQImV
	 rPJ2XiNc2uyDtFEcSxwjUFL6RxxBoLW5T03aR2eMGCEYmh3TV4NkIFN8sAOa7OEThDkgu
	 AqQWfxUflU0yxw2pAVqZiGMzM8WU9tdKWCPacu6eSV9bqU1k6Jb5VjHBHNUBLcMy4EeVm
	 3AHUbs1CRHiBqjLT5t2sQPpB+wqyt+gMpt/tmO19MmL/1zlFxavfoe4DsObRkilaEUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sarthakkukreti.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OrwtgJrv;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59779606A334
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59779606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sarthakkukreti.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OrwtgJrv
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b29df78132so125254c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794530142; x=1795134942; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FXNL5WQI5c02nExDW7bQODazz59dETjZrgoxn+webag=;
        b=OrwtgJrv0GSp75zK9qepCyORCRFMOaz0QBAwUAaVzAZA6CBYYqy8bb7W5v18PaBBKx
         mnewPJjFrMNlMEGhJmBzcynp6qWFBTzp0lkRKDkvyuckZOGUu4diiSdPHnvX3Nw87Jt+
         dt2FbRpEJfrIoAws88U2YU6hGLjaF2VDQ6DXAPeP/tczWy2Cm96bq7bOOwF0Gyu1EcC+
         emIufjAOryps7LvSVbPJZvZ6x8o13iw4QiP0Ssp6sUmEQvb/XnGRAF4jATZdQHQO8b2w
         as6l/bKML0hCH2l4bf39MbStNTFkZr5mNiulsnLWfCEWtpahwwDpKqJIRR6+t0VhAx2z
         8g6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530142; x=1795134942;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FXNL5WQI5c02nExDW7bQODazz59dETjZrgoxn+webag=;
        b=IxLwr2ItPkeptB9M0eWddjGZ1srRanW2E8wKOeced0riV1NmnkMTxYzutCyo/CIqJ+
         9vIn2mF9ZSSlXWIqEK0e08rYe5Uz8EK7mD/Cn2kIJDIDDdaKYmTI2Qeymt4w+T7BrqjO
         KOra68cxxtVsyVk/TXOQb2arLYuCkKitwETbA2xSzQLsuJVMVi6JZLO7FVYnmKmpivg7
         gYRrEh71ePDNof9x/74de/6REWtJm7qT0EXAD40/Gln7BFpeJ67n8bV2S7mnQhnEyFr+
         xxz0qZX0TfWnyp9jRKCcbBqre7RGFK6zmQYEuAhXRajrhKsqGpsw9mXYo2qzt2dYFOWu
         aQOw==
X-Forwarded-Encrypted: i=1; AL+hErFZbrvzinJwHBUQjBnRcIWHWA1w4GWDWonQAH+Rsx3Z1tG6Rhu1BAmjSjT9iicunO8Ill/fGiJFvI95L+0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eoVzluoAK1l9offqZEIOqgR7NvPEKsMA71/82Tj8w44vdMOnz
	GCCyv3W9gZIYP94U3LeV9GUUEZHGJmtvXZAjuFhVRrmS93lBWKacKJmzcVpl366BpYeENsr3t+g
	EqdsmmQLJLlJduWnfs5Eay/OZj6P8HYQ56HQjFA==
X-Received: from dloo10.prod.google.com ([2002:a05:7023:a4a:b0:163:a42e:b837])
 (user=sarthakkukreti job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7023:a41:b0:164:4e36:f956 with SMTP id a92af1059eb24-1b5030d494cmr970998c88.16.1794530142096;
 Thu, 12 Nov 2026 16:35:42 -0800 (PST)
Date: Thu, 12 Nov 2026 16:35:33 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261113003536.3622755-1-sarthakkukreti@google.com>
Subject: [PATCH 0/3] usb: uas / scsi: fail inflight and queued commands on
 dead links
From: Sarthak Kukreti <sarthakkukreti@google.com>
To: Oliver Neukum <oneukum@suse.com>, Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K . Petersen" <mkp@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sarthak Kukreti <sarthakkukreti@google.com>
Content-Type: text/plain; charset="UTF-8"

Unplugging a UAS device during system suspend after hub_wq is frozen
defers usb_disconnect() until hub_wq thaws. When sd_suspend_system()
issues SYNCHRONIZE_CACHE to the disconnected target:

1. If the HCD accepts the URBs, the status URB fails in uas_stat_cmplt()
   without completing inflight commands, stranding SYNCHRONIZE_CACHE for
   the 60s SCSI timeout and triggering the 25s DPM watchdog. Patch 1
   completes inflight commands with DID_NO_CONNECT on non-unlink status
   URB errors, unlinks inflight data URBs, and preserves non-DID_OK host
   bytes in uas_data_cmplt().
2. If usb_submit_urb() fails with -ESHUTDOWN, -ENOENT, or -EHOSTUNREACH,
   uas_queuecommand_lck() requeues the command instead of failing it,
   and leaks unsubmitted URBs if status URB submission succeeded first.
   Patch 2 fails the command with DID_NO_CONNECT and frees unsubmitted
   URBs.
3. When the command completes with DID_NO_CONNECT,
   scsi_check_passthrough() matches SCMD_FAILURE_RESULT_ANY and retries
   it against the disconnected target. Patch 3 skips retries on
   DID_NO_CONNECT, DID_BAD_TARGET, and DID_TRANSPORT_FAILFAST.

Tested using a USB/IP (vhci_hcd) UAS target emulator that freezes
hub_wq, injects -EPROTO on the status URB during inflight
SYNCHRONIZE_CACHE and READ(10) commands, and verifies immediate
DID_NO_CONNECT completion without retries or DPM watchdog timeouts,
along with the scsi_lib KUnit test suite.

Sarthak Kukreti (3):
  usb: uas: complete inflight commands on status URB error
  usb: uas: fail command submission on fatal USB errors
  scsi: core: do not retry passthrough requests on disconnected targets

 drivers/scsi/scsi_lib.c      |  5 ++++
 drivers/scsi/scsi_lib_test.c |  9 ++++++-
 drivers/usb/storage/uas.c    | 51 +++++++++++++++++++++++++++++++++---
 3 files changed, 60 insertions(+), 5 deletions(-)

-- 
2.56.0.611.g1030f0b940-goog

