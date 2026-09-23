Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063E1233949
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790122488; cv=none; b=UUrx7HvwYKadLYntdg9o4MBCvAQV4TnlmYxx/DFH72m3dnYxqMTL2mWfxCeSPoDt4NLXOVsUUsSvRRyWisSXCB/t3XLrawuRSCrHsNhIc0zpAM32B5doFbN+fqnYWCbv8V+CSmex+7TxUud2tNwI67REXDY39uOisLbhVOt2z6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790122488; c=relaxed/simple;
	bh=aeNMuhZLVd8auv5KzMsrPSW1MpK+eJ8bpu5C3Os+nhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hQudHDOEgdyL0qclwRzAT9eHOT8Adc5+xfF+hhq9hDsc8DNNW44u3w8Hp11/xmlaponHRKkU/LyaxshgcsPW8xrkj/BzDc3XAS92KwiLBADoA5VnBJsDKVPcPQahWF45kcwysGP7Ad4QxkBTLd6H977tIZOkqf6TmG6hFqdg2b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=anN9cKE3; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="anN9cKE3"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so1458775e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790122482; x=1790727282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LMLRsg30TTBsYgaLuhHOpTrYOv4xBwe4rnv3RttCS9s=;
        b=anN9cKE32WSzpwxUvaLWx9EkH/FZrakZ29xdlcif4GYW/hk5ij/REmvUxK69LaD9mH
         kS6mSclXnjFgPtCQ8vGZZSbM90av8ubZKvoL9NP6KcLXx5ClIZmMt4QMMLv04rUfGR0a
         eh2IogPt3qcb6/uOAyCmcmaTaP69/90DJTPLTZ4Bzu+bHatAU4ZJ9Yy4zX327YBRynzh
         PvxhDJT1N9qmJHXIKrQ5MzJWAenA8Qa60bt9aCF2IC08qpHC7E6je14swG4cLKtMjE68
         W1hIWRtM9cCyOw2Sb16ZMNsEtmEtHyZ7biuyQKosyo9Calm0YVKGahARYms70ed/VGdn
         HKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790122482; x=1790727282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LMLRsg30TTBsYgaLuhHOpTrYOv4xBwe4rnv3RttCS9s=;
        b=rafWXItOr6DF/1+LajljCEQrH6hj0MT4Mn/aAy6QtakVLG6Bm8Ld0kScF2OoouXCkW
         onuv8UuC0q+n2QpnKCXi45Yl6xLTNjTqWvKN7lFvG5YU5Vn/LajSXUdwHZ4zWAADyof1
         Sr0Cor0sWc42btuckMiBPSxo0uwoEXQu3gF/f4Sbw7DGq6TokBUUwcEn6MgQTSZSHIGY
         AnqH6C5BQlf2v0ps7Y8102j8T05qob/gPG9fR6/w6w7RT56sfUQDg5SE0x3/RYoPb62+
         PFoR28WvPtWHTmTfoyZeGXsk4MZJhXOIjszmge+bJeqiyn9b3HHz71uqlulwNDNxOIyp
         v04w==
X-Forwarded-Encrypted: i=1; AKwUvBy5b0pwz0895Ir7c76acNTzadn1rPKJXATEnSv4qRJ/fIpAnlktI1op0riGRJyDV4JhunbcsyHMeqUR29I=@vger.kernel.org
X-Gm-Message-State: AFuF++mUpdoNFOB1cIXyKGDTXx8aDrFnZP5ZP6FNlLHkjIDVQPXvrF7K
	1i3NRACyiIIMXZZyG8UNDKJunwQ0oBpwp9r+veMUGc+PJyvL+54dcBRR
X-Gm-Gg: AYBFou2D+TuCrtPtIGXK+YFXEu721FCBZOrh7TTiI7sa/H5671okwPUaJCe/GGmsEtH
	DU1kXBw8hA2TMlt2vUb4wk60NjHFk3snbkoWdS51BbhXQujRT8fEV4d6pB+UH6aj24H5DnS1ZY1
	ZGb+f9Qytx5VSA/VGcwtRvnU1ES72zq7LIwsoBS6As1AHPNWAIFfXv9BfL7p1PlNskMVulA1ySc
	8sML29ChAjefvlXkstOlK1S23S3fjTkTFNxrFIKV9rXr+FyDdLodc0ZSdJaxJZsXtrAFZyftVLG
	+TnFpMMaGfdwsRt2Lm/emuZKDu6pS2FPDWts0aJ2G/6biLc+RTr5ZhvTukyYP8nB6aHzW26vruE
	EGHue7bLCXdigLOZPTY3YG9IjWzz8Q+TfkJ52oc9HUGl1ytHnvRRzkagUjduC4VVB+djk5j+GMK
	0QSnXgJ7BQ1X7mv7Ce58iPt9Ea0URlJKLeXD3OXV2XVMguB5WTyv9Wl09gBxUXxgkYIyihd9xyq
	XCjEEiRVe9sMYyUmOmT+rrgWsQQ0LnnXObIB1/2A3ycpfZTbSbNmTdgF87R2wERCBZM/mNlW/N0
	a7nbda1OKqXONonLtfJdLsORMSOJlVanydzudEmGvNwV3NQ8TXpuIeUFCyHScBFWJ9J3W5YEK5h
	6MsaMJjinuEVbBXmIg80kKA==
X-Received: by 2002:a05:600c:8a09:10b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-49fde36ffc6mr8931375e9.5.1790122482178;
        Tue, 22 Sep 2026 17:14:42 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-c000-0ddf-8c68-4a09-6ad6-6324.ipv6.o2.cz. [2a00:1028:c000:ddf:8c68:4a09:6ad6:6324])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde180a39sm34612165e9.1.2026.09.22.17.14.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 17:14:40 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunwoo Kim <v4bel@theori.io>,
	Josef Schlehofer <pepe.schlehofer@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 5/6] media: dvb-core: dmxdev: wake up readers on release
Date: Wed, 23 Sep 2026 02:14:09 +0200
Message-ID: <20260923001410.30297-6-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260923001410.30297-1-pepe.schlehofer@gmail.com>
References: <20260923001410.30297-1-pepe.schlehofer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dvb_dmxdev_release() sets dmxdev->exit and waits for open demux and DVR
files to close, but readers blocked in dvb_dmxdev_buffer_read() wait
only for data or buffer->error. Setting exit therefore does not wake a
blocked read or epoll wait. The release, for example on a USB
disconnect, then waits forever.

Set -ENODEV on the DVR buffer and open filter buffers, wake their wait
queues, and return -ENODEV from dvb_demux_read() once exit is set. Do
not flush buffers when consuming -ENODEV so all readers see the error.

Blocking DMX_DQBUF waiters are not covered.

Fixes: 57861b432bda ("V4L/DVB (5511): Fix 2/3 for bug 7819: demux and dvr")
Cc: stable@vger.kernel.org
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 drivers/media/dvb-core/dmxdev.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/dmxdev.c
index 6a825d9bae43..5f872bc89345 100644
--- a/drivers/media/dvb-core/dmxdev.c
+++ b/drivers/media/dvb-core/dmxdev.c
@@ -63,7 +63,9 @@ static ssize_t dvb_dmxdev_buffer_read(struct dvb_ringbuffer *src,
 
 	if (src->error) {
 		ret = src->error;
-		dvb_ringbuffer_flush(src);
+		/* -ENODEV: the demux is gone for good, keep it for all readers */
+		if (ret != -ENODEV)
+			dvb_ringbuffer_flush(src);
 		return ret;
 	}
 
@@ -81,7 +83,8 @@ static ssize_t dvb_dmxdev_buffer_read(struct dvb_ringbuffer *src,
 
 		if (src->error) {
 			ret = src->error;
-			dvb_ringbuffer_flush(src);
+			if (ret != -ENODEV)
+				dvb_ringbuffer_flush(src);
 			break;
 		}
 
@@ -1035,6 +1038,9 @@ dvb_demux_read(struct file *file, char __user *buf, size_t count,
 	struct dmxdev_filter *dmxdevfilter = file->private_data;
 	int ret;
 
+	if (dmxdevfilter->dev->exit)
+		return -ENODEV;
+
 	if (mutex_lock_interruptible(&dmxdevfilter->mutex))
 		return -ERESTARTSYS;
 
@@ -1457,8 +1463,29 @@ EXPORT_SYMBOL(dvb_dmxdev_init);
 
 void dvb_dmxdev_release(struct dmxdev *dmxdev)
 {
+	int i;
+
 	mutex_lock(&dmxdev->mutex);
 	dmxdev->exit = 1;
+
+	/*
+	 * Wake up everyone blocked in read() or poll() on the demux and dvr
+	 * devices, so that they see the error, close their file handles and
+	 * let the waits below finish.
+	 */
+	spin_lock_irq(&dmxdev->lock);
+	dmxdev->dvr_buffer.error = -ENODEV;
+	for (i = 0; i < dmxdev->filternum; i++) {
+		if (dmxdev->filter[i].state >= DMXDEV_STATE_ALLOCATED)
+			dmxdev->filter[i].buffer.error = -ENODEV;
+	}
+	spin_unlock_irq(&dmxdev->lock);
+
+	wake_up_all(&dmxdev->dvr_buffer.queue);
+	for (i = 0; i < dmxdev->filternum; i++) {
+		if (dmxdev->filter[i].state >= DMXDEV_STATE_ALLOCATED)
+			wake_up_all(&dmxdev->filter[i].buffer.queue);
+	}
 	mutex_unlock(&dmxdev->mutex);
 
 	if (dmxdev->dvbdev->users > 1) {
-- 
2.54.0 (Apple Git-157)

