Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1871223336
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790122491; cv=none; b=fM7THRdLsLwbxo4aeKyu3Xksu3JMiBZ0SBVC7PvKwVIRwxCC25gRZS/vns8ek2OvzjZlzXlrPMVpR9MX8RIsCvAibPpgK2pbFXjaf6GZ7J0Vrl7/19ch+hI+HDo1DP/XOIHALLnFSk8qf5D6BRIbt0Sa4doUZbrA1cqzNlSZh6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790122491; c=relaxed/simple;
	bh=cbGo4TQAahnvid5BzTcvwPcvLNuaLGXSG1MBAuo5OY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z77D/oJlE0gJbsJrK4hgqQPSDvAzB66OFfj05qLq2lnAsXI/3AU/Hl8khxQ2++YK0j998M8ssj7st5gxoxY/6s41Q2v+W8qqMWOsUa/3xduU3KkFpmcM0BPYGfEIUln0J8Ae2dVhoTYIylQ/QY5gNDzt+mCCBKaLKOUOrVK0bvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CysKucRj; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CysKucRj"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so1497795e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790122484; x=1790727284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k9P3MjJHm5LPq6fNgfWUG9o64JUvZTiy872DYV+9qyA=;
        b=CysKucRjAeHbUCuu1hB8404+eSBj109byUFUwmhFgg4L6sF5S6GeXDOPDlsORn1+8T
         6DrC4GKo+nudfefJU5qot6RNuLEsmccusGn6Z+INVHw8vfjscnZwPyjaJjjlIo0ez1dm
         K/0eSpxxAkzNrrizfR3s4RKnxwKrRSCNZO9Ngcw6XAsLzUTKIv8AYySR7Qbbt6XG+QsC
         xBjh1c9kg6hY2t/MhC92GeIJGIU4exBrx5ff0pDMg4pyIQtI0kE7JZsdBTaiEkO1Now0
         vYP0fPmAR4sxRCwLc3PLgZ+OXMPWdg5ApzPmtIY8LQMqg+tp/1XvIzUp2+GreNnfuba9
         IqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790122484; x=1790727284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k9P3MjJHm5LPq6fNgfWUG9o64JUvZTiy872DYV+9qyA=;
        b=K/VQtAMF3HUbtWpSLaW4bM+evdkJtxI6QQeorCgolKYgKnrP7zGci9YPxldwmrYJBS
         I4NxFiycwwi7yU5CSs2TEBmmTLrmZpWcHuWCFh7YhiaGBTKiR9LIOOpMYi5GrGZ4AVkn
         0L+ipkq01sWcrqN9sgczzYmXrr9XbTXXJiVF7Obg9JTKWWAgYi7HSVLNGwJIMGf7sSQa
         WsAVkH58WkVg+hT2rKGD/hUDtwV9gAhr+2XGBmE7s4F6zC7vClvcVldPc5f+U871dDLw
         v1ri0RqGc8kkgHLh5pymoXtA5XUTQmzGQwK38q1oHu84oo4fXSXJk06PlP766jqqPs7V
         qVgQ==
X-Forwarded-Encrypted: i=1; AKwUvBw3crNb+ty9SLki1yXLvR2l848IYU3KCJgQONqbLTbYObDnKiJ5BY9t/cZxACML2K2Aphf3GtL1Dy2QtYA=@vger.kernel.org
X-Gm-Message-State: AFuF++nS29CfwVOjTAQ9y2vWGUzSaVseLKJiuOuRPG5IX4xWIQiA6r1G
	eC4TFgFpdRLnqADNhDVIgS2ooZBTZhglqY18EGvoS1MZF3aFmySdNgJR
X-Gm-Gg: AYBFou2j2uliLSZhA/gTcRc5xn3w3eIqRV4vfUkaOad6fiOZYQTD0BpOYSJfbiX1ehX
	h1PVuBDCA/ftQ519LDqp2XCdEKwcr/s05/rnlEHLVelyTlVOOYXU81gc/eC+TjfzAw1IspVM5md
	XgWMva44PB2bRu2+6BVVo+UNvMTFUTbE0nSdvV/OL0uUe0Ylpw81rh/N50OayKE44dQAqyCMjla
	JkBsW8u4G75A3yFHvuy2vXWKN1Ao+uG2oFG7KuGwRtpjTs8xR2F5pPluto7Apd119VMHdrB9ZWo
	EfQU7J7kvx8XMJJlXrxZCX0iokVsbrs3JO9juyC3POwgRs7mgd+KTfijy6fWtRPcwqiGW4/262k
	j/FGwRHA7LWdVbros2Yk0gra4nFl8Q8zJ1E7hTeRJYX7PW3pwo9JEER3p9e7nng/KgHN6vhZZks
	5h7KYnZyGkoHZxR/WRD1WT8JkcyZJ6XFR24iheCv1nAG9R9YyTMg+QtKiEa8ATkVvVhay7zfabB
	kULzH7Vyvy/GR1/hYfvK3yOt442RPASmaGeqk+U4kdnzJ4w5CVlJxbYapwfgxAhtL/SwMRxSbSP
	UcCnyp4r89+FYY+ONzZXhq3BzKcAV9KFWkHmQL6kutvztfV6SROE7dsg9uAUd6q4mgcUgu+4epa
	ZJbVeZx5yf+nKDyK6Ku4A+A==
X-Received: by 2002:a05:600c:8b83:b0:49c:fea3:8633 with SMTP id 5b1f17b1804b1-49fdf14578dmr9080065e9.24.1790122484156;
        Tue, 22 Sep 2026 17:14:44 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-c000-0ddf-8c68-4a09-6ad6-6324.ipv6.o2.cz. [2a00:1028:c000:ddf:8c68:4a09:6ad6:6324])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde180a39sm34612165e9.1.2026.09.22.17.14.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 17:14:42 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunwoo Kim <v4bel@theori.io>,
	Josef Schlehofer <pepe.schlehofer@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 6/6] media: dvb-core: wake up CA users on release
Date: Wed, 23 Sep 2026 02:14:10 +0200
Message-ID: <20260923001410.30297-7-pepe.schlehofer@gmail.com>
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

dvb_ca_en50221_release() sets ca->exit and waits for open users to close
the CA device, but read, write, poll and ioctl can continue and blocked
readers and pollers are not woken.

Return -ENODEV from CA read, write and ioctl operations and EPOLLERR
from poll after ca->exit is set, and wake the corresponding wait queues.
Keep the release wait so the existing lifetime protection remains in
place.

tvheadend keeps the CA device open and waits for it with epoll, so it
needs to observe the disconnect before it can close the device.

Fixes: 280a8ab81733 ("media: dvb-core: Fix use-after-free due to race condition at dvb_ca_en50221")
Cc: stable@vger.kernel.org
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 drivers/media/dvb-core/dvb_ca_en50221.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/media/dvb-core/dvb_ca_en50221.c b/drivers/media/dvb-core/dvb_ca_en50221.c
index 1b91ebb8f667..d478f995d5a9 100644
--- a/drivers/media/dvb-core/dvb_ca_en50221.c
+++ b/drivers/media/dvb-core/dvb_ca_en50221.c
@@ -1353,6 +1353,9 @@ static int dvb_ca_en50221_io_do_ioctl(struct file *file,
 
 	dprintk("%s\n", __func__);
 
+	if (ca->exit)
+		return -ENODEV;
+
 	if (mutex_lock_interruptible(&ca->ioctl_mutex))
 		return -ERESTARTSYS;
 
@@ -1460,6 +1463,9 @@ static ssize_t dvb_ca_en50221_io_write(struct file *file,
 
 	dprintk("%s\n", __func__);
 
+	if (ca->exit)
+		return -ENODEV;
+
 	/*
 	 * Incoming packet has a 2 byte header.
 	 * hdr[0] = slot_id, hdr[1] = connection_id
@@ -1618,6 +1624,9 @@ static ssize_t dvb_ca_en50221_io_read(struct file *file, char __user *buf,
 
 	dprintk("%s\n", __func__);
 
+	if (ca->exit)
+		return -ENODEV;
+
 	/*
 	 * Outgoing packet has a 2 byte header.
 	 * hdr[0] = slot_id, hdr[1] = connection_id
@@ -1635,8 +1644,11 @@ static ssize_t dvb_ca_en50221_io_read(struct file *file, char __user *buf,
 		/* wait for some data */
 		status = wait_event_interruptible(ca->wait_queue,
 						  dvb_ca_en50221_io_read_condition
-						  (ca, &result, &slot));
+						  (ca, &result, &slot) ||
+						  ca->exit);
 	}
+	if (ca->exit)
+		return -ENODEV;
 	if ((status < 0) || (result < 0)) {
 		if (result)
 			return result;
@@ -1819,6 +1831,9 @@ static __poll_t dvb_ca_en50221_io_poll(struct file *file, poll_table *wait)
 
 	poll_wait(file, &ca->wait_queue, wait);
 
+	if (ca->exit)
+		return EPOLLERR;
+
 	if (dvb_ca_en50221_io_read_condition(ca, &result, &slot) == 1)
 		mask |= EPOLLIN;
 
@@ -1965,6 +1980,13 @@ void dvb_ca_en50221_release(struct dvb_ca_en50221 *pubca)
 	ca->exit = 1;
 	mutex_unlock(&ca->remove_mutex);
 
+	/*
+	 * Wake up everyone blocked in read() or poll() on the CA device, so
+	 * that they see the error and close it. The wait below cannot finish
+	 * before the last user has closed the device.
+	 */
+	wake_up_interruptible_all(&ca->wait_queue);
+
 	if (ca->dvbdev->users < 1)
 		wait_event(ca->dvbdev->wait_queue,
 				ca->dvbdev->users == 1);
-- 
2.54.0 (Apple Git-157)

