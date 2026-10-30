Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793378565;
	b=i5JgR2jALHxvUF0HFHqLlX522mL8bQUd1+F0H+4rDheNEOc2QuTzCmI0ZMxR2O+CyLGS
	 VNWs/W5Y+McOq1d0klHGpwlFp4t9gwA8gpYTGUvJbwxFXNqaXFCz7fn4UtDB6rABXiDRJ
	 iYbi/Mr+dXHzszQRzVA2yOHZ9YGulYsjxtz6e854HS2hiChZ/e2PM5N1kqR/uqjiJovKa
	 +Z9uwmQ4wb+UzniiefmQroFTcrl2Oz7uSQ/I7MaWAfW3cHCAQpqsRx674krEGWI5t6iqG
	 Tq3agdCLuMhXf+GG0VfbWFWHLoyGHJYGqZ2Zn7feCIio4KkpMHSGwsBjuKJZZXbyJpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ok3D/afU2nVjQzmvIGoUXuLtqcy5MauRxmbOFQz2KJE=;
	b=iMHx+PwIBBXLDqxXzWGAuXFZCP46PoQdJWJj8r1xW/xr1XagaNTYu0qgPe7S9vgt+/Md
	 YSwHm42W894IIhi2xRmFXIVdn9DmWnEgOlKCRufp+9YFopO7aRjXQ8E0LKDr4PBJ0tL0G
	 p1rFfk6nGUH8UsW7LmZw8a11vbYPms/xZ6ZxUt8esqw5j0WiGr+MMQLwfjmw2yASg0aOQ
	 e+7N2z/b1X4RC+opqqWmkERVyqDWcXIy/oXjmlbli5EJs5/elFksYyn4fuLtmkprVx/JE
	 YcdY6bjTMns6UyQ2Nc6Fr7sUqeW7y4M7f6ILLN7FkTivr+C2ZlgWZtfq9cNx6jl/Diw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=aJ8BVuHe;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C0B606A325
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07C0B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=aJ8BVuHe
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35b2c599f43so2177629eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793378564; x=1793983364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ok3D/afU2nVjQzmvIGoUXuLtqcy5MauRxmbOFQz2KJE=;
        b=aJ8BVuHeldtz9OI9GB9aOqjNrb5jTwSxyQsjpBrtDdDfWvwKON98ioFrFFLwHC/zTV
         5UCa4e1UCpwRnFeRht1kk3Ola8k9SUZltnkmJ8aMrX7lZoyK0Q8Q1PV+z6ajn3HJd2Mv
         3+XdjTR/iv318Dwa2ApGvJO/LLMCCHNxFTADVaHKSLNT9p+wGG5EzVmx0N7qwkYrOHvz
         rYLXXLzhMc6YSXU+4zbaLEmniG4cpC5sQp+/jrn5ivppZQmhQCZ02MQTFaqscLJ9b4wN
         8o/9jNw/7ESKYnAfimPbIdRTnVHnDxiJ5gnq8zt7ArfvDyNm4iDF9Mst57zaqHrJhCzt
         ooXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378564; x=1793983364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ok3D/afU2nVjQzmvIGoUXuLtqcy5MauRxmbOFQz2KJE=;
        b=Vnmb290wr4lft52paVa9gUc1cdMiLi6T1tuJJAG2ErHxqXROufKRaeeNuEF28sc9Kb
         Rs5XD5Fme2Nd1PFezwgLbD0y95crg/3CbDdSj5HRbbllQ2a2wwpdFkN89WpUFXTJCW8D
         M2RGnnetq9bbRX3pZblJHwqUwUd1HevwQq6HSQNpl6nRsKxyHMb0VC+dQ/CKQf6JpKGm
         a5Cou5xvCJSahTM8weAdYWTM9n8Bj9JFJD6bTSLKjoEyCHMQ/32f70VXRAO8sWgiI22O
         q/X9OwPOBDggHZoA2J1E9++JiZG1ShliF0qdkDOrjyYLnBJbCxtkpsi4T8/rGc2A2Zin
         li8g==
X-Forwarded-Encrypted: i=1; AKwUvBzEZUR28XY9x9eL1Dz5T+Svqmv2Gzawe/00+GPi8Z7fnX2mMlGwLumQk2yXS2l+zfZkJAxBQ+aLhNsMs/k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIn8VgwFEdyqGGGEDEQnp3QMJH1wZap0yn9aeZ5ZqTMZ7bBZ4yH
	BvbpsjDiNx1hXGpjAPI2Vb69tYAYIqCGgEah8RZDyj9aYxhdck3ELJ8Q4tVqMZLgPjl0UzIc8rR
	1jhhi2i7C3/jWXheOHG+b35qOdGcLkbMMb2HWR/M6VVLjFKQsUWsBtOyL49dfBZtSm37DvcU9+X
	V+aHJ1DgOJO98v+c42DqpC1qsnrkPDUkrSRfA98jxtP0/wSrJoTJI81ym9GCP7v4iB31zOFyDHa
	w==
X-Gm-Gg: AYBFou3iUBx0D9hp0efvS4JreDIVTPWtDLux4qWjcuFCnxDY0aDyjpkdC5e/Ui7HVLx
	NehwKaP4CBimbhrtgTLxleh+DznshICfgWR5aAOJbggag/Tib0rwplNC48WeL3LI1/0S/snmJvr
	tkuMK603igZMmziFCdOGaj8+VCmjrGg97f+QBgDCs45X1a7dEfV8nTB55Q8HYxsxD1Fx6jrtijs
	4Ah9zae9KYxeki3PGlACKK/CE2AIj7YB5dTwAUyHniLEorBmGXxvbo0MS5g+uLIaPuRWfc5GUfV
	uUKqXn7cxG4grbhjjjUIAGCU7n2HwFVHz2VBiNeUVtGiAwSps0dPXczbESsBgIVreMEXLkZdjgE
	vR/Q8hQIKpob8RbYXClKJSH6vu5U8/t31zPweJsC8Ts6NVHskXLVLzFQT13t4WywJ10BvE7X5KX
	Ky6eVmtMS30/i26wpCmvUMTq4LAZ1nlhFWaJ9ONFDol8GH69/UqzKijxHIiP+oppKsA03M91KXT
	MY8bmofYYYdLI4TRJbuwdIrC1gcIhjxpIVAxcTmIlno9wTjm0i/ottSfATSazFnfEk0ddlyNfHG
	UjAhMZOfJwfo9pmH/qa4tJW4V0eAfk6Y9g1jDiUQWmy5+yevD90P43oR/UPp6rNxbaQkWNtbHqY
	SBLgHcje8xtSIY/PwOQQCRS51vctTgSvyFHAe3XjNF0BnIqjRDOY7uMzGfTscnPByyGj6TkVJTM
	cqCZqYhtxQQ19wmtLobUw=
X-Received: by 2002:a05:693c:8107:b0:351:6b27:d67d with SMTP id 5a478bee46e88-36a4241aa57mr3973297eec.30.1793378563798;
        Fri, 30 Oct 2026 09:42:43 -0700 (PDT)
Received: from brian--MacBookPro18.purestorage.com ([170.85.204.93])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4294419dsm8475040eec.18.2026.10.30.09.42.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 09:42:43 -0700 (PDT)
From: Brian Bunker <brian@purestorage.com>
To: linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: lijinlin <lijinlin3@huawei.com>,
	Wu Bo <wubo40@huawei.com>,
	Bart Van Assche <bvanassche@acm.org>,
	linux-kernel@vger.kernel.org,
	Brian Bunker <brian@purestorage.com>
Subject: [PATCH 1/1] scsi: core: Restart a stopped queue when sysfs sets a device running
Date: Fri, 30 Oct 2026 09:42:29 -0700
Message-ID: <20261030164229.10037-2-brian@purestorage.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030164229.10037-1-brian@purestorage.com>
References: <20261030164229.10037-1-brian@purestorage.com>
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

A device that its transport blocks has its queue stopped. If the SCSI
error handler then gives up on the device, it moves it from SDEV_BLOCK
to SDEV_OFFLINE and leaves the queue stopped. When userspace later
writes "running" to the device's state attribute, store_state_field()
moves it to SDEV_RUNNING, still with the queue stopped, and rescans it.
The rescan takes the device lock and waits for I/O that can never be
dispatched.

Nothing restarts the queue after that. When the transport later
unblocks the device, scsi_internal_device_unblock_nowait() rejects a
device that is already in SDEV_RUNNING and returns before
scsi_start_queue(), so the device is left running with its queue
stopped for good. The task that wrote "running" hangs forever holding
the device lock, and anything else that takes it hangs behind it.

This shows up with iSCSI when a session drops again just after
recovering. iscsid onlines the session's devices after a relogin by
writing "running" to every device it finds offline:

  1. The session is blocked, which blocks the device and stops its
     queue.
  2. The error handler cannot recover the device and moves it from
     SDEV_BLOCK to SDEV_OFFLINE. The queue stays stopped.
  3. iscsid writes "running": SDEV_OFFLINE -> SDEV_RUNNING with the
     queue still stopped, then the rescan sends an INQUIRY that sits
     unsent while holding the device lock.
  4. The session recovery timeout calls scsi_target_unblock(). The
     other devices go from SDEV_BLOCK to SDEV_TRANSPORT_OFFLINE and get
     their queues restarted, but this one is skipped because it is
     already running.

A vmcore from such a hang shows the device in SDEV_RUNNING with
queue_stopped set and the queue's quiesce_depth at 1, the rescan's
INQUIRY never started (MQ_RQ_IDLE, no start time or deadline), and
iscsid owning the device lock while other tasks wait for it.

Restart the queue in store_state_field() when it moves a device to
SDEV_RUNNING. scsi_start_queue() only unquiesces the queue when
queue_stopped is set, so this is a no-op for a device whose queue is
already running, and it keeps a later scsi_start_queue() from the
transport balanced. If the transport is still blocked, its own
readiness checks in queuecommand keep commands from reaching the wire,
as for any other running device.

Fixes: f0f82e2476f6 ("scsi: core: Fix capacity set to zero after offlinining device")
Signed-off-by: Brian Bunker <brian@purestorage.com>
---
 drivers/scsi/scsi_sysfs.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/scsi_sysfs.c b/drivers/scsi/scsi_sysfs.c
index fe54792ed69e..f5416a1548bd 100644
--- a/drivers/scsi/scsi_sysfs.c
+++ b/drivers/scsi/scsi_sysfs.c
@@ -811,8 +811,16 @@ store_state_field(struct device *dev, struct device_attribute *attr,
 		ret = 0;
 	} else {
 		ret = scsi_device_set_state(sdev, state);
-		if (ret == 0 && state == SDEV_RUNNING)
+		if (ret == 0 && state == SDEV_RUNNING) {
+			/*
+			 * The device may have been offlined while blocked by
+			 * its transport, so its queue can still be stopped.
+			 * The transport's unblock skips a running device and
+			 * would never restart it, so restart it here.
+			 */
+			scsi_start_queue(sdev);
 			rescan_dev = true;
+		}
 	}
 	mutex_unlock(&sdev->state_mutex);
 
-- 
2.56.0

