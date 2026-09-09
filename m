Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D05E35C6A0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788974389; cv=none; b=g1N6XmDUK/MSbFce1O3Q3BpxCZPPcL+EIab7/5edppMKKiRJHPgE9OpHtmL/2vWpHRF7C8xD4AvfQjFPq6a+OnEHUVOhP5MOdGmu7Of0FXJfU799v7LIIOdNk8x/lsIIz9Qmw8J0jjCL/OEO1lYKkjgcUO/mPHlg9NyRxKq3OPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788974389; c=relaxed/simple;
	bh=IlcZ7axc1icPaRsnATE3TTEkSRdrgKhV9fd+K+TYx+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dt5oRUK6T6M/NoTVLwmhQaPN3tDhWvpe/cRHXg1PcPrW2aICvPmNBVIHNyrsn3Hg6qns2WbJyybJsyfIJZXy7d9QuJ5O2o/ds4lCoTZMqmOAMsvwjQPhNhV8D05HCdy842ZsO19J4R8ERJClzMOwq+dY/tk1OpdRXAYKpwIS4Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=beBJrA5e; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="beBJrA5e"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38759bcd877so6601495a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 10:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788974387; x=1789579187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DMRip1Y+oPvNX5PgfN0DgCOA+dU2bWxzbPCzDRfdUU4=;
        b=beBJrA5eoszoD1Nr2DYlaVj/yst75vyw+Z496KCAbew9i5HU9CcTjRGW4fKSsLUJPw
         taOO6sMcucm1LxBBEe74A0r3mILSmmYimM0e48pS67e1EXmry6jz4OcfthboF623VRpi
         7RRBBo/HWsNjQHHYK99vYifyQjVaZauCIm/yUbw8bhiG9LkKQYttuKKHWadafhKOxeVI
         WFj4DjENZZJzgz904S/hErs88NFU3BTgtXaiLQjgoasz6X5x4YNlaZT3ayLtDoPAF7Eq
         z4l2ab1VKyaxDWMtSXF40OdhG0HPv14pXTDlyh3LkxtrwiLLuBR+urTVyi87i3l2q9UQ
         vQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788974387; x=1789579187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DMRip1Y+oPvNX5PgfN0DgCOA+dU2bWxzbPCzDRfdUU4=;
        b=P+9+zt/KCHMZirwo6dcbgOnokRw/IAL/e+oG8jizc8l9sFuBxVmuzfE8MoM6R1Q1Nf
         fizc97EHIp+CmdU3XvaufXZ6PNKROcrv+VnpQYX7MTlE8KOvdnT1OnxP/Ydr/y5AbDd+
         62qag5HAS/kb0X09pfkxZYlKAX6iFRhXshKRhUpmef8aKfoz61n6Bq/TI70zA58H/0M3
         tarTgYXa98bta1ZO24aQ3gxSBXFTb2NZkXE56IHNdLmrzGINiHZWlJQP5gs6y3aeO7cs
         FpHMZKNFw8aLX6dF96SW4ypPN21Yq14HlZAbGXyJkjJXtliyQ3HrCJ8ByVhfCHFZn0zR
         WbsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDPCcDCdDSIATzAJmadQKT5XouCxOWnnBfK42rsMnolWV1O3w0sYekXy0JGAcYMqjWe0HfJW3wDrgJ/Xs=@vger.kernel.org
X-Gm-Message-State: AFuF++nuoR4JK4vsvt8Qtx0DLDbwQscG7/O1kWZ15H+ixXRiLeIC3D8P
	/vJxKisYGeMTCfuRpZouyLVY+zsC7pAt60U3KscLDBXxTIvH+WbZff29c6cKBA==
X-Gm-Gg: AYBFou0rgpDdk72P1AZUyz0Xr+9rD5kbwNq3C2EGauYcJbz6/e2dXQEoz/AOVwCzLNs
	f06h0dChDopZWWRqhsFHeGNFX2cY91NjccXXDrHkcy/QCIPhQbxoAjG14Qnky9wmdAgKKpkW90G
	QCOm2OpaYzJJLIeFKERXVC6RqfQwynnoem5+W8U+bP0D/JFjK9JCxRSUg0qaFv8CXA+2ahiZci3
	H4xqhJ1ImHV0A9LmieCiQVissyZXLdhyL0taJvRGe4L9yTRZAK1qRAqHdAH+bnKF7PHfHempY8D
	9Pj6HVCj0fWAjs1EWe5hd01CXBOfyXZbUBkp/AF11g8LCUjTZIGRUxECbCYDyaLap1QUmqz1vvy
	mreleg3xTfnq8u50lLsXDPc3wxQiGZ3ExxftfeXPEPjn2o7MAvFTH1/RN/Q79n7DuBtT79F1LrQ
	L8lc7H/vf/gwu+UKaeaWreNF9Xv32NWcQ8iRkOd3krIqxnPBHatVmABtdSCsPQS0uQRJhu8Ek94
	DD0KmYVhAfQh5dHIEg=
X-Received: by 2002:a17:90b:3c48:b0:398:e436:384 with SMTP id 98e67ed59e1d1-39b260d335dmr55306923a91.1.1788974387271;
        Wed, 09 Sep 2026 10:19:47 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d38:5c70:24ba:44ee:a9ec:98f1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d770e3bf4sm388181a91.7.2026.09.09.10.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:19:32 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: stern@rowland.harvard.edu
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	syzbot+356ae236154297f0d60d@syzkaller.appspotmail.com,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Subject: [PATCH v2] usb: storage: ene_ub6250: set transport_reset to avoid NULL deref
Date: Thu, 10 Sep 2026 00:19:26 +0700
Message-ID: <20260909171926.54111-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909171736.53927-1-ngocthang2710.1999@gmail.com>
References: <20260909171736.53927-1-ngocthang2710.1999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ene_ub6250_probe() sets us->transport but never sets
us->transport_reset. get_transport() only fills in transport_reset
for the standard USB_PR_CB/CBI/BULK protocols; since this driver
matches on VID/PID alone, a device can report any bInterfaceProtocol
value and still bind, leaving transport_reset NULL.

When the transport then reports an error, usb_stor_invoke_transport()
calls us->transport_reset(us) in its Handle_Errors path, dereferencing
a NULL function pointer:

  BUG: kernel NULL pointer dereference, address: 0000000000000000
  RIP: 0010:0x0
  Call Trace:
   usb_stor_invoke_transport+0x55a/0x1a40 drivers/usb/storage/transport.c:926
   usb_stor_control_thread+0x44c/0x8f0 drivers/usb/storage/usb.c:462
   kthread+0x38b/0x480 kernel/kthread.c:436

Set transport_reset to usb_stor_Bulk_reset: ene_send_scsi_cmd()
already frames its command/status packets with the shared
struct bulk_cb_wrap/bulk_cs_wrap from include/linux/usb/storage.h
and only ever transfers over us->send_bulk_pipe/recv_bulk_pipe, i.e.
this device speaks the Bulk-Only Transport wire protocol underneath
its own SCSI translation layer, so the Bulk-Only reset is the correct
recovery action for it, matching the pattern already used by the
other subdrivers with a custom transport function (alauda, datafab,
jumpshot, karma).

Also harden usb_stor_probe2()'s existing sanity check to require
transport_reset alongside transport and proto_handler, so a future
subdriver making the same mistake fails to probe instead of crashing
on the first error recovery.

Reported-by: syzbot+356ae236154297f0d60d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=356ae236154297f0d60d
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
v2: per Alan Stern's review, justify why usb_stor_Bulk_reset is the
    correct choice for ene_ub6250, and additionally harden
    usb_stor_probe2()'s NULL check to cover transport_reset so other
    subdrivers can't hit the same bug.

 drivers/usb/storage/ene_ub6250.c | 2 ++
 drivers/usb/storage/usb.c        | 6 ++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/storage/ene_ub6250.c b/drivers/usb/storage/ene_ub6250.c
index ed49a3bc859c..3137c2cdd021 100644
--- a/drivers/usb/storage/ene_ub6250.c
+++ b/drivers/usb/storage/ene_ub6250.c
@@ -2350,6 +2350,8 @@ static int ene_ub6250_probe(struct usb_interface *intf,

 	us->transport_name = "ene_ub6250";
 	us->transport = ene_transport;
+	/* get_transport() only sets this for the standard USB_PR_* protocols */
+	us->transport_reset = usb_stor_Bulk_reset;
 	us->max_lun = 0;

 	result = usb_stor_probe2(us);
diff --git a/drivers/usb/storage/usb.c b/drivers/usb/storage/usb.c
index 064c7fc8e368..823a4b2e9033 100644
--- a/drivers/usb/storage/usb.c
+++ b/drivers/usb/storage/usb.c
@@ -1100,8 +1100,10 @@ int usb_stor_probe2(struct us_data *us)
 	int result;
 	struct device *dev = &us->pusb_intf->dev;

-	/* Make sure the transport and protocol have both been set */
-	if (!us->transport || !us->proto_handler) {
+	/* Make sure the transport, its reset method, and the protocol
+	 * have all been set
+	 */
+	if (!us->transport || !us->transport_reset || !us->proto_handler) {
 		result = -ENXIO;
 		goto BadDevice;
 	}
--
2.43.0
