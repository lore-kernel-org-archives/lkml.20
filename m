Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793383055;
	b=OBeYRugmcyXDgmyf7u9HLDhmoNQslvsykKuJM5rhrCU1Zkr8vhnIu1hpCrgepuYm5RAU
	 GMbl5CBu/bvCJeK3CIOYzoMwgKkZfU42cIlr42PNCGqUMdBf0OMyiWX91N8nG2Pi/SOHP
	 ra8DDj79cVU4KtbBAKDQRnJc+r1XTRbsPrRKnls2quudJTiiLzsifnivyt7M0HcLVhfN6
	 B1hiDMra/0PNiX4eFKOrsA/3cfEnFMpnzbZjvr7Uwaa/tD5iz+1lId/jpz35EEzK9Xo6p
	 b8qdlcZzGYySybzapNlhfFoFOALFf6yN31qFWoO2OFDCTn1Rgc8R9tp2oqNgtvXB9Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793383055;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CLpTpdtsg8iyrp7yCQ1ty082f2eTL981yqmWUegIT5Y=;
	b=TDm5FUYtnO6lL8tXBLKZ56qlis+duwXC96tXXZbl0/rd9HKuFZJl1hbQGDk/khJv+luB
	 n/sionec+Bgj4MrrW0ICndZwHDsYsc4nTvnfkh2aj6sgDgr2hBCmPGSqrRCHfJvzlEeS1
	 gsEspQH4MU2/MJs7I9pwIEJIulDNyLOI4YBptpjpMWTNaB/rDylLNIjWmr7ixrsxrpdQJ
	 +edwILJNLu13Y5cQlQohob8/2We3QzPLnixyzWYSniW0/aZApWwB+zrZA9sWngyPfI3GX
	 xOBSrxeRNaCVuUH65SNS5Ab64zwtMWwxUt7yzJhkzm1jxxjlfi96B66Hhss+MjUSSaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b="ThuHcXl/";
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B64606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:57:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97B64606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=ThuHcXl/
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1438d9363fbso801008c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793383054; x=1793987854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CLpTpdtsg8iyrp7yCQ1ty082f2eTL981yqmWUegIT5Y=;
        b=ThuHcXl/Hy+TMsfSaw+ZpOiTZkfkn22y8K5YDla4tNh82b5EQj+JqsXHk49TTCJN+G
         nEysmXzvrX59tNZT+t9lHV5geiAc3iaOKSYG8erMc7XVF9+47JBh5F6zmlifqewaiued
         M4Wu6kDqN0rZRgiUhtPNl0OxsKjH1V4Z1a97x9i5m4kGvjopzSQJrkw9FoQAofSa7z+H
         UzK79eWsLJXrTBh5N0RCQ5uhAHj25D6M+SD39Iu/IHJSFbdXNFCxUcDEc1cXhk4XPZIv
         uiSF77faDdzcu+e/liH1r0n3esBK9x0jXd9pQr/pR+HnabA2D/HqVgB6vjRki/l7sOJ5
         tNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793383054; x=1793987854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CLpTpdtsg8iyrp7yCQ1ty082f2eTL981yqmWUegIT5Y=;
        b=gKCtP1KSLP3upkWqUPGUdzjPiJzibRwL5Q5/qOaWmV/ewCWoT3kdFG2n0jcGxOogal
         GEL8nkinl1xvV65PdLT1Qjy1w/g2ke6Jjke9SGZXEHGqwhfKwAYWlPqtwND4vMc6UD9q
         1ctcGnGWyOgAi72VpsS2/IMFB3ZcQ6soCnA32S5L6Y7K+XAGO4qWxqWqr6YZhX+KSj5/
         TPjpJNFbMvNOSpZqRX6fynhKzOEd5dIFMAYuyXGxeuR28C6JCYS9ADpMJXjOgKuZW35X
         3l84POFrLYcv3c8nNv1GWWHKxk7TTJlR5W7WDNMGBAgXXIw8VR00Dady/mVaZQZfvQ8B
         P6kQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwxoPRbm1uUhe/rN2cjmRotVLculEX8ED4SZNhuTdk07jMqi59i+B5qtjFoGwv8VnkkZXgv9ZIIsDrHhI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNLNnwO2oklKC5PxoHRwe4lXuEZqYSTV45jK/n1DWKaidboMFW
	SbUVyJ5fLl48RlqOLrL0/OCKtVFNLYr5KJk5h79sBrP6anzMYTD6E/xfYANWEH6hqyI=
X-Gm-Gg: AYBFou1EK+LVB7nZREWJprLWVlefN3cz8qpYhWK8I+3QFoNwjvczmiv4Lr/MSVYHS4n
	qfbyKk25gQUqormIymd3UTcwtxO5JuGvgtwshimqo2yxJRPutyns6O7bZC5tZZFJHCAhOy8Ysg/
	NAYCSzFm7a0twbn9SS8b/qXTLuEli1fh50crorHVMkqcjhdBoilZWZcplqMpRQMY2A6WzPe2upJ
	OvATZxFdFeDJBHiOrea6KthaHqwIRxTZ3SceaBjvi7594dy1nP9L7nRPHdHWL5fGSB+z5CvOzEo
	Z2/s6sYzcp0mHhOn8ni++R4DjBz7X/sxPrtSt1r3hHNN0Il1DhV5FrwcyxDTU7gRxNqouPK/pZl
	TFjjH9yFlRFiWVlS5K7tCbkk/gzJgA0E+YhPRZV6n0nae/SFgzWuAuoBcOv9ok8W2i69xWUTtML
	lNeKJdyhAhUsGFJ8E1rakiw7P8WtAoNbLZ7feJtc5nJKCMqQ0IVAnLRAiLnPoND7a+j2u/Nzcka
	JidGmDEm16FO9gjy6XufgveK8kMcBGpFGfit7r0RjDpngIJGBqh0CmgM1TverFIBZKsjPv5xHSz
	7Y0HcpplF48Orhaqxf5nHy89m0VMAsIAVYpyNpzpkvxZ15QQIxpBXOj1aJOQUZc0XnbnewQM/zg
	141RZiOM1qPlFTePmrIfWqOnqIDwdPR+15PLqj959F1bfmSVOBX6wGIE4M2waOTIUUzXgO3rBi4
	SvTOqjEOz1q37Ynz+7Z4/dAb05J7DeUcDqcUOvTU5OfzMA2A==
X-Received: by 2002:a05:7022:1588:b0:1a3:d292:f696 with SMTP id a92af1059eb24-1a949f6c426mr8673287c88.16.1793383053445;
        Fri, 30 Oct 2026 10:57:33 -0700 (PDT)
Received: from brian--MacBookPro18.purestorage.com ([170.85.204.93])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4294419dsm8802701eec.18.2026.10.30.10.57.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 10:57:32 -0700 (PDT)
From: Brian Bunker <brian@purestorage.com>
To: linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Bart Van Assche <bvanassche@acm.org>,
	linux-kernel@vger.kernel.org,
	Brian Bunker <brian@purestorage.com>
Subject: [PATCH v2 1/1] scsi: core: Restart the queue when unblocking a device set running
Date: Fri, 30 Oct 2026 10:57:20 -0700
Message-ID: <20261030175721.24379-2-brian@purestorage.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030175721.24379-1-brian@purestorage.com>
References: <20261030175721.24379-1-brian@purestorage.com>
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

When the transport then unblocks the device,
scsi_internal_device_unblock_nowait() rejects a device in SDEV_RUNNING
with -EINVAL before it reaches scsi_start_queue(), so nothing ever
restarts the queue. The task that wrote "running" hangs forever holding
the device lock, and anything else that takes it hangs behind it. The
-EINVAL also makes scsi_host_unblock() stop at this device and leave the
rest of the host blocked, and keeps the device in SDEV_RUNNING when the
transport asked for SDEV_TRANSPORT_OFFLINE.

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

Handle this in scsi_internal_device_unblock_nowait(), which already
restarts the queue of an SDEV_OFFLINE device: accept an SDEV_RUNNING
device whose queue is still stopped, move it to the requested state and
restart the queue. A running device whose queue is not stopped was never
blocked and is still rejected.

Do not restart the queue from store_state_field() instead. The device is
still blocked by its transport at that point, and some transports and
drivers rely on the stopped queue to keep commands away while they
reconnect or reset the adapter.

Fixes: f0f82e2476f6 ("scsi: core: Fix capacity set to zero after offlinining device")
Signed-off-by: Brian Bunker <brian@purestorage.com>
---
 drivers/scsi/scsi_lib.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
index f695a6605815..b89407902430 100644
--- a/drivers/scsi/scsi_lib.c
+++ b/drivers/scsi/scsi_lib.c
@@ -3065,6 +3065,15 @@ int scsi_internal_device_unblock_nowait(struct scsi_device *sdev,
 		else
 			sdev->sdev_state = SDEV_CREATED;
 		break;
+	case SDEV_RUNNING:
+		/*
+		 * The device was set running through sysfs while it was
+		 * blocked, so its queue is still stopped. Finish the unblock.
+		 */
+		if (!sdev->queue_stopped)
+			return -EINVAL;
+		sdev->sdev_state = new_state;
+		break;
 	case SDEV_CANCEL:
 	case SDEV_OFFLINE:
 		break;
-- 
2.56.0

