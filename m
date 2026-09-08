Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D6C549364
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872660; cv=none; b=eVut8e06eR8ZyWchwy7CfddyJUA4IeeOyJmOQ3cORU7e/INvQrRf2hwo42K1Vri5XZgXhS7ibmLCCNscMeXin9NIAOS8QGHSMD3Mcsz366ASPzTNhGm2jCebJTFG3pBqCiGoJCsf06xPxrIFPLBcqX1eSpvR24cYw/ON5/CCt7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872660; c=relaxed/simple;
	bh=/aCr8hgeVMYJ3KiqUNQsu2gK8nS3HDQMoxXqYTGMnYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IuiKWuZBbM0i5LvlFmbNcBKGYJmal+R8/mJy84mXg2kBy+++BNHMijcc3ABqbB02SX8nzXr125G29v9OfhE1M2xHrcRWJCX7eOMVqRjJ45svvyOqdcafqZmCz4luNCfq+8n9fY6ddAgyD+/U2ZXX+HDCn4D9URW1SpAiTAPvyEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jGWAbDew; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jGWAbDew"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-853c947bfefso3307819b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788872653; x=1789477453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vu62D3vv0YYC5WBDVTSBuHunsO24noZas55Sfn0ORyc=;
        b=jGWAbDew/9C4ntzHTKiEA4Jfgy5TZI9/+w2iobKSmsiBuYPy7ArgOHQYUQ7dty7e+m
         1SNSU2cC1lGG8h3nFVCPA6v3iZe8mNBc1gumwRATZwg1PYcXI2SqZBlbXF0GL5cjijeX
         qBig2Zc9j5Ya1hzjC0svme++z19I3/l8+K5yNy3d3kFobVRRWakNLOfngmMef8u2zwPS
         Y5m/qUqFP2Mn5eGFzlD54aUR0+/BAKg+bNAXJxc5ZRmh1yV75XFBlbZ7pgnolaONCtUE
         Kx4uB4uWeEGcB8GI7N5KmSkFWBMI4C05oHKtN3gKetSCYoxN7mmXoUEoD3+hkfI9cnK/
         CqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872653; x=1789477453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vu62D3vv0YYC5WBDVTSBuHunsO24noZas55Sfn0ORyc=;
        b=R1RJz/00+iLrP+dS6Ya7Bok30mE5RC5ZUz9pUG09sNRu56n2Ue4QeRCMm9W4VAjtgA
         LqaqoEXSiDULKEfg1CWiBv9VRTkVfCtMs3ZXZMJgOpBUEDIF4cr7WrjzcohZxHi9gYXB
         k28XuIPePBwZ9jo6NoG4l1xoKUz1PExMI4focFytr/pGCR404UQEp18KM6wxhzCLMq2N
         wLb2hLbLO1Mv31wEcRkw+5BNcdggETBGHuthSbtWgbKAM9KWdZ3d1TMT67Jys8vDDja4
         0/JS4r/uEV1V5spGtVVWzMESPnvhTnyTTFVeIe5yuEYOrS3ZylTj8sWIutSJatf+GS8s
         l1Ow==
X-Forwarded-Encrypted: i=1; AKwUvBxxxdC/xGiYpG/aElow/zIx/rRictTNQmMLC0Zqn4XYQeghLjAFRrz81NKbE+ifHtwGDUJ539vtCCvUSEY=@vger.kernel.org
X-Gm-Message-State: AFuF++kPxXFKL96a9iIwE0OTJ1RkMzLY03reWJXJFzN3oemfE8aG09FI
	XWz87ndajnFM967NVqFPtgTeOZAd8VEpB7DNH/ozLMqJwhhw8jLnlqjH
X-Gm-Gg: AYBFou3kRjdsBsrcDVkG79gtLJdMZrJZyYdWTARXr8mNtHw8zFEKjEILaXjm6UYZ87y
	YObi/6JB1VlIR50q4NAo/M/jTWIgleZhBvK3Z4DI9IvVE3myZMU8FPMb0XZZdNgu64FgQDLwFiT
	2TLdYVKJaxMeOuJ/rBmYSdmZZoOdhoRG3mEesAA85SaN/jx2aLCG1qAD4kRh3tmWxFdSHcvsels
	cb97jSgOIi6+mDhv1fZC32ja9EZXvghLDv958vVfTjFcpV5EqOruKzsF9fxL5kUoat8xNl8aOzw
	jJ4XQFmjJCo/3YZUdpV22oNVUhwI8hXwDfy+RX3OC2N/d7k5nOL2gSNCsvmZ3/4dUK1Qr7UWwlF
	+FgnHvrG04pJHNwe23cKqxrXs8ltRpZETTitVUNvujnS96yFqCJJalTG9c9kYz0V3/MXNnGGRx1
	lYRtJzflb9mjzzH6rWqlyxKoZuw/OD1JPzSFyKHKFZJhj5/de5dCf0n8Oi2Ot5IXXijk3KozInr
	L7BXfGY32iWkqaFOTIA6p9aDyUlOg==
X-Received: by 2002:a05:6a00:987:b0:857:73c3:446c with SMTP id d2e1a72fcca58-85fff3c461fmr31073167b3a.27.1788872652526;
        Tue, 08 Sep 2026 06:04:12 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8614f874e9csm5652398b3a.8.2026.09.08.06.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:04:12 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Tue, 08 Sep 2026 21:01:32 +0800
Subject: [PATCH v2 2/2] net/ncsi: fix use-after-free in
 ncsi_unregister_dev()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-ncsi-over-usb-v2-2-92dd78272fbd@gmail.com>
References: <20260908-ncsi-over-usb-v2-0-92dd78272fbd@gmail.com>
In-Reply-To: <20260908-ncsi-over-usb-v2-0-92dd78272fbd@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Oliver Neukum <oliver@neukum.org>, 
 Samuel Mendoza-Jonas <sam@mendozajonas.com>, 
 Paul Fertser <fercerpav@gmail.com>, Simon Horman <horms@kernel.org>
Cc: Potin Lai <potin.lai.pt@gmail.com>, linux-usb@vger.kernel.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Mik Lin <Mik.Lin@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Adrian Ambrozewicz <aambrozewicz@nvidia.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788872639; l=3964;
 i=potin.lai.pt@gmail.com; s=20260522; h=from:subject:message-id;
 bh=bKp+fXghJ6cQJaZb9/dKdTBINAk3RYvGYETZo/GwPjY=;
 b=zdJASea/GkvdKgFd9ycSXVpHjAiOck4Qf6FmC5wriN7PkcPVxeK0Of7uZPoxbxIv9lDiuHaMb
 bpOB7UgUOsMBEZNJ8JbUC7iTw3mBtga44fuYe9Mf5IH7tK/XUP9JmwV
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=

From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>

ncsi_unregister_dev() frees the ncsi_dev_priv structure while timers
and workqueue may still be accessing it, causing use-after-free.

The problem involves two async mechanisms:
1. Request timers (ncsi_request_timeout) - fire when NCSI responses
   are not received in time
2. Workqueue (ncsi_dev_work) - processes NCSI state machine

These can cascade: timer handlers call ncsi_free_request() which may
call schedule_work(), and work can send commands that arm new timers.

The fix adds proper synchronization before kfree():

  dev_remove_pack()         - stop packet reception
  timer_delete_sync() x 256 - cancel all request timers
  cancel_work_sync()        - wait for workqueue to complete
  kfree(ndp)

Order matters: timers must be cancelled before work because timer
handlers may schedule new work via ncsi_free_request().

Note: ncsi_dev_work() is non-blocking - it sends a command, arms a
timer, and returns immediately. It does not wait for timer completion.
The timer firing later triggers schedule_work() for the next state.
So cancel_work_sync() will not hang waiting for cancelled timers.

This relies on ncsi_stop_dev() being called first (guaranteed by the
network device lifecycle). ncsi_stop_dev() sets state to
ncsi_dev_state_functional, which causes ncsi_dev_work() to exit
immediately without sending commands or arming timers. This breaks
the timer<->work cycle and ensures the synchronization terminates.

Timeline showing the race (without fix):

  CPU 0 (unregister)            CPU 1 (async)
  ------------------            -------------
  ncsi_unregister_dev()
    dev_remove_pack()
                                ncsi_request_timeout()
                                  ncsi_free_request()
                                    schedule_work()
    kfree(ndp)
                                ncsi_dev_work()
                                  ndp->...         <- UAF!

With fix:

  CPU 0 (unregister)            CPU 1 (async)
  ------------------            -------------
  ncsi_unregister_dev()
    dev_remove_pack()
    timer_delete_sync() x 256   <- waits for timer handlers
                                ncsi_request_timeout()
                                  ncsi_free_request()
                                    schedule_work()
    cancel_work_sync()          <- waits for work
                                ncsi_dev_work()
                                  state=0x100, exits immediately
    kfree(ndp)                  <- safe

Signed-off-by: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 net/ncsi/ncsi-manage.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 54d0df0a9efe..15d7e4cabf4f 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -1957,9 +1957,28 @@ void ncsi_unregister_dev(struct ncsi_dev *nd)
 	struct ncsi_dev_priv *ndp = TO_NCSI_DEV_PRIV(nd);
 	struct ncsi_package *np, *tmp;
 	unsigned long flags;
+	int i;
 
 	dev_remove_pack(&ndp->ptype);
 
+	/*
+	 * Synchronize with async operations before freeing ndp.
+	 *
+	 * Note: The caller must have called ncsi_stop_dev() first, which
+	 * sets nd->state to ncsi_dev_state_functional (0x100). This causes
+	 * any running or scheduled ncsi_dev_work() to exit immediately
+	 * without sending commands or arming new timers, breaking the
+	 * potential cycle of: work -> arm timer -> timer -> schedule work.
+	 *
+	 * Order matters:
+	 * 1. timer_delete_sync() - cancel timers, handlers may schedule work
+	 * 2. cancel_work_sync() - cancel work scheduled by timer handlers
+	 */
+	for (i = 0; i < ARRAY_SIZE(ndp->requests); i++)
+		timer_delete_sync(&ndp->requests[i].timer);
+
+	cancel_work_sync(&ndp->work);
+
 	list_for_each_entry_safe(np, tmp, &ndp->packages, node)
 		ncsi_remove_package(np);
 

-- 
2.52.0

