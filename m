Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793926320;
	b=dLis/M02ytUMOxoEnaVb6Tls+DeG+r6UW2lKawYlw2HopRgTKdKh0QZXnclvj928+i1k
	 r+TTdoMBl5V58EXOEGxxRpBK1krVzBrqTh/qgVsnwVUBhiNDmTeOQ0apBdxUPX69lJTSe
	 0PfExVPxwBgQG8B7gIaxjhG4q99iIkNFgX164l7C5fJlMs2Jmh3FJMM9DAS2j7ZgKGrzh
	 VU9DmCynNfV9Iruq3E82jvNIICIMw+F+F2xqQbdw8KNFmo+q+9mqU+kGoflqXnMj/dzkY
	 25pE2TgvyPEu/jvEngq8i2a323x0np9CPqMoKCp3Utt/Opk1sXvMJPMphHC0TzP9Fxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793926320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HccsFfIxC59BPG4TmRkbnO73oNEkb5neUzsA3x6hj1I=;
	b=oP8y4lfQHVRZDStL+YOSk/0bfntMkCqI9uxuRvjZJXrIj5/kY0vyMfYkge96WS2y0jxL
	 xo6BDVNYgpjv4t0v0F+o6Ctp7Fj+nm3SjWLLHxK1dF811uCArFoqrPWiBGhHeX9HB9k+8
	 FrFNYvAcYGbtoyCewNwX5EnbaC9EjfBSXqwm4FPfPr52d+YRhZ0xnowDwg8UpjSrQjIxw
	 +5m4epUuAQcBSP2zE9U6qhwrE1HDOh8uNUOeRL1vFjwnCPl/UOANd1GSmNazl7gbKCm7y
	 /TCSNb1Gvxq6+pr1XD+kRkHMNREsBDUOD8hmGA1f+zFNEhL0Cl4mGsIJszH8cW9n18A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sha1kl7D;
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613D5606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 00:52:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 613D5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sha1kl7D
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91c7a0c1617so1411176d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793926319; x=1794531119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HccsFfIxC59BPG4TmRkbnO73oNEkb5neUzsA3x6hj1I=;
        b=Sha1kl7DPVGpimiEW646Uqquan0LoglFIWNy+1rkgdhuF44v9lVp1F564USTSObVul
         z3G39GjrbdQ1WKxhuuTyf6IiuzX9x8SBqssTv+pTi6DjxEWZP5JHefsPC9qFhD1y6nRR
         cymRzMrCZCSaLgyelG4rMWPVbn/gropQwsFgERalpZjrul7X8Dg4rITqa4vm7NWeleMj
         CTlf2uoEmd1tAiFZOU8LPw+k2BydeQ0t1Bn8vJ3NRqCqsHlUsvlfrUOSCj2YxyRTk9YN
         /URpmZU0zkQ7iQ1nJdIupuvhgB2kqw4RZ/h6Mv+IjZIazGKzp2XQrzgmQEY3b/8qVYEo
         Iafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793926319; x=1794531119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HccsFfIxC59BPG4TmRkbnO73oNEkb5neUzsA3x6hj1I=;
        b=AlOhvRJk2gHtvBVFXO+XSMqUamLUx9ZpUYsmcYfXgqQMB+khnMzQVjwO2Xnv4ju64O
         IwB/3AQSpHTvmUnRlXARdXkdAZ/okNxxCQ3KOHQK+8j4Q9TGvC6kDmJZBZCA+kbY6jTm
         PwqFCOBd4DqYeTFYMx67AY8u2GmvOo1AgYwYtEh3rch4PYUeaZ+m44iZXeeK+2RycJ3H
         bLvQbXYtyfKMhwaRGRjh5QMrY4GHmx7Q6S22nkkSkpL50aRqvzgkVWtycpVJtAFekZGy
         VKLsaxkCAteQ1WZXUA2lmoFj0Xr8x9AqFdgamI3F65JU5tTKybpqWaLaRr3Ghy35PBlz
         Izkw==
X-Forwarded-Encrypted: i=1; AKwUvBya7lEEVBk8wa/oFtTxRq2ncKPIq3B5aJa8ffJJqg5yE0KweMw0/8VxUvscbVxvG4sdirf5CM5vCdSa+ew=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6zu0kuwJrjDJCvok2Mkj7eE5srh6UNc3AMRqrnt4WYKFAk53o
	5BlXk9Ykv1VuLUTbAq5pBRCSkd3TgG+6nm0WSVPO/4b5XYL2nA3iUP/AGqUz/arY
X-Gm-Gg: AYBFou1gLMWOI8O6lBJVaeaucTGEnvviSlUYclCqYZy8uIlXc/VxsRNN2eYkLManj0p
	BX340mqYJlPh/aKixk1EKTeP++H2juETh322Q0kOT0cfirH1/Xr25vEq1Btg2upysTF6r0lAeia
	sgR22H8bhMdrExPrXVcy17JvcK3HN1hn2kFk2ZcW9EkmxxgiudRQCCU7Cnt7uHe2c881ot+YUSM
	fXB+QSo9MLGd2GxKeSvsmfBFHtmZ0KXEwLxH5/2CoOeN2y2zGwMaszatOSpyFziwVropvTmBz1g
	b5PKvBtg2qQYMigF/bjrRTeabsfolUc0HQgUVLvbjQ/VS7JFDw4FjqWXCNhHAwTHx8fNN6aQPUS
	aHOzU/E/pem7AJ1+vHULUU0NhRUnR/O4n4Of0hYqF5x42Gsi8ZXwFZXV3dwPL34z7i0ZzDsCbJ5
	MOVuSrU14XHACOkmeFN+nvZvpxnYi91MUv1s8nbv2IgkiyXbSD07yJh5wYcnpwtKVN0RkJ0U1zN
	Qa/JAx7za2KTAcv4Igzk1c/VerDwT9PmQF4Iy6vFbe/IGGLYaMyFOy6VTreSzEImFqZlqdX2gPW
	yyZEqNcrfGIStZnXjw==
X-Received: by 2002:a05:6214:3f91:b0:91e:771d:20be with SMTP id 6a1803df08f44-91ea984a3a6mr11628486d6.32.1793926319103;
        Thu, 05 Nov 2026 16:51:59 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6acebb0sm7929016d6.45.2026.11.05.16.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 16:51:58 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH] dmaengine: Free channel and device IDs correctly
Date: Thu,  5 Nov 2026 19:51:54 -0500
Message-ID: <20261106005154.1669214-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Commit 0821009445a8 ("dmaengine: fix channel index enumeration") added
device->chan_ida and moved freeing device->dev_id from chan_dev_release()
to dma_async_device_unregister(). Since then, two paths handle these IDs
incorrectly.

__dma_async_device_channel_unregister() frees chan->chan_id before
device_unregister() removes the channel's sysfs entry. A channel
registered on the same device in that window can get the same ID, and
its device_register() fails:

  sysfs: cannot create duplicate filename '/devices/platform/...
  kobject: kobject_add_internal failed for dma0chan0 with -EEXIST, ...

idxd can hit this when one wq is unbound while another wq of the same
device is bound, because it holds only the per-wq lock.

When dma_async_device_register() fails after registering at least one
channel, its err_out path unregisters the channel devices but frees
neither the channel IDs nor device->dev_id. The next DMA device then
gets the next "dma<N>" number, skipping the leaked one.

In __dma_async_device_channel_unregister(), free chan_id after
device_unregister(). In the err_out path, add the missing frees: each
chan_id after device_unregister(), and dev_id after the loop.

Fixes: 0821009445a8 ("dmaengine: fix channel index enumeration")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---

Notes:
    Found with a static analysis tool we are developing.
    
    Tested in QEMU (x86_64) with two test modules:
    
    - Unregister one channel and register another on the same dma_device
      from a second thread. A class_interface remove_dev() callback on the
      dma class starts the second thread while device_del() of the first
      channel is in progress, to make the window deterministic. Without
      this patch the new channel gets ID 0 and fails with -EEXIST. With it,
      the new channel gets ID 1 and is registered.
    
    - Register a dma_device whose second channel fails to register (both
      channels request the same static channel ID). Without this patch
      chan_ida is not empty afterwards and the next dma_device gets dev_id
      1. With it, chan_ida is empty and dev_id 0 is reused.
    
    Not tested on idxd hardware.

 drivers/dma/dmaengine.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index 34be53487a21..6f9dcc735af5 100644
--- a/drivers/dma/dmaengine.c
+++ b/drivers/dma/dmaengine.c
@@ -1171,8 +1171,8 @@ static void __dma_async_device_channel_unregister(struct dma_device *device,
 	device->chancnt--;
 	chan->chan_dev->chan = NULL;
 	mutex_unlock(&dma_list_mutex);
-	ida_free(&device->chan_ida, chan->chan_id);
 	device_unregister(dmaengine_chan_dev(chan));
+	ida_free(&device->chan_ida, chan->chan_id);
 	free_percpu(chan->local);
 }
 
@@ -1307,8 +1307,10 @@ int dma_async_device_register(struct dma_device *device)
 		chan->chan_dev->chan = NULL;
 		mutex_unlock(&dma_list_mutex);
 		device_unregister(dmaengine_chan_dev(chan));
+		ida_free(&device->chan_ida, chan->chan_id);
 		free_percpu(chan->local);
 	}
+	ida_free(&dma_ida, device->dev_id);
 	return rc;
 }
 EXPORT_SYMBOL(dma_async_device_register);

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

