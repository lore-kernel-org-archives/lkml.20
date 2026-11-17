Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935209;
	b=eqwh97EQu59aDTEWgzMDjj/czP4bjmz7SsNwGb0+WA33kx9wonsW2pr/caKXPNvjrhgj
	 BzN1IU1cePWURV/tcfniL1gSQD3Ad2oTKJv4qR01PVT7L8cdnoJykvbGvt7gI5CMgUwwJ
	 lnTsJEXIa4PfsvR5PqMgBcgXoLolTWm+Er95K9kIOoSRrwLsBBTGqGCi4p93hNCdS8EzV
	 zpYRkM6SbLgY4A+vk9RKPQUX1E4mzbMNbvuMimEbRGrr9jWdbY65YbMRhitRjYxrhcc3X
	 tjYJt9MZMCMXrWxP5YtFY9leBPzkw4o7mAylNr0GjE2+ZwDd3EmN6Lfq6vIdQ+5icwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935209;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3ME3t5U6QQS8bFqFY2d4WF1ZByoJFwpBVCnuAtXv7MY=;
	b=MNkO+aaMb6BiDisnJ/FopmoB4iW2Mnxg5lEpyBAfZPKFhyF26JPLrwH0euDUiWnC1Q3j
	 IsjEPdAZr5xb/MC+P69wvoQq3gDHMH7tPHfP4qpZlM8WOiQXg3uZrk9r0IbluMGgFYpzF
	 SSXSk0DRYeXcW/mV0+wfAghAAs1+9z92ZGWrHwkaMP+wAhrd7DXx74XXvrNEBnRFJdPbo
	 9SdWqzlcDkIMLPJOZrt4tgu9pTKiNmzM77HwvlJmkHQRwwKOQeEAf7KAvZkkRpL3BC1v+
	 sCTUPb9tPjLZH2QL238hr4dgRtzuW+8iTZktgXw1Yrbfe7hwgUChIsHHRr0YsNaQOjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z7QYDXEz;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B98606A330
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14B98606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z7QYDXEz
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so62461c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794935208; x=1795540008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ME3t5U6QQS8bFqFY2d4WF1ZByoJFwpBVCnuAtXv7MY=;
        b=Z7QYDXEzNPwdmJcy5nk6DKavIMUoPGA+F0D6BVbWGkNmuIkmSkcCmSzdJbltm01XkV
         iXsT3T/np+MZiB2Y4arHY3T5sfx0Th/gceMfzYdEyNPBwxbroXaQPaM9fiZwIwRNiUY+
         J/nxU2pKAVz/pT+o9XMCNFetm7sCAJUeEPhoIkrHYHEWyHCnHpmjF339O1DUtGSZjrpJ
         Q2VOEfEp30uS4nNS/mV+pxTdfjp3vVdJXrDz94YAFo6mj/wpdxm1rUTAr8vXMH3y3CHz
         GhDuVTKcpDLvDgOlEB4tQJAz+uH+yD9g+VfsWc78htoR0c4edt2pOI9kqa9Q61l6LF2h
         GVow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794935208; x=1795540008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ME3t5U6QQS8bFqFY2d4WF1ZByoJFwpBVCnuAtXv7MY=;
        b=L/4BqjCis61Cp/1DrWOefQjic33VUnAUKJQpZuwc8L0vqW5XYiuf9bzqHMR5geGoJl
         FvlIyTpE0bM7HMRIhYurbelUsBmbuYZBK9E++Z10Njd006XmY0S9R/R9rlZw4Rbp4Z22
         F87mkh5bqUfQslt8WgY9vUxdOT+W2pFkLKl/E3x9M32PB/VuNHzMmBFl9lEWz9+/u3hT
         xUJQ/Ndch36t7413492wad6VpQF/ukNePPco0nurFBQ8QBQeKrbolJi6T2nqfytK3/L9
         iQh05/Chekllc6pCqfaRLnkpqBdsMzj/HK64P9fmGlPhUSVe9SDmcZY8CuA1YTA6ipQh
         87qA==
X-Forwarded-Encrypted: i=1; AL+hErGLJIAoQleANcrYvIRrFrc+n9EnB5BVZFBEbCo38WpPM1idm+JBO3gEPJDSSCmV+SLe1HZMiqKg9T930gI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iHw+wo4awZifQp9xjKsPiVDgviy2hmwEe53a1pppNHZeBMejU
	925keCdl338lRGLrDTsgI7h+VJI9x2j+nNmPIgE7S/6lPlqN8BtzBA5X
X-Gm-Gg: AYBFou1SXwuOEZ1k7plk5I+tlz8CQU0knqoBFhlwQ4WilPYTK/UFFe/czgPLcMMJpBH
	2BLrRUAaySaeim6j0GGImKRk1Lu+6A+Akx1xiFMGpTYxdjz32bjlNS948BX6eZ81EJz4PBDG4UK
	WJxLqCbfwy9dx/7859QdMKuvZTssNhrmtSh4tQkWJxq0prwQuWalfozCuLJuoWRvkY6yVVVYiLa
	nKTZS4HcgwuDpOKm1zKp9lajz8BicCbABu/JB3KDZX7AQJ8aQb9BM3AB5swS04k1ghGkgdXTd0c
	nQ7NAI+a3XefcAEEleeO7DyPFAw/gByunmSFEE3t76THrLYUAdPiq3f5lhyCi+pFsx28f6AdK3G
	DFROnfpSKOXiDXWBEK2vwR4fBnOJVv8R0AvxRflmmp2Bg533YTqz3bCwECAmXcFbXsTzmLP7qJf
	8I0MAMZdOmbrmGVhTSyBrgmoIVkKEcnQj1nn0ZzJ87ilS7lb69tQy7kphPSrvKbzb16Je5TuX12
	8jJYCEVD9dJb4POgBx74fUTXzTFrowzMCCzDRS/hrc5GqSUKsEjbD8+CTJtx5x1/FWIZLUBeeZu
	z47LoHYAAGeyh2yREwt5xoZcGWGZ5KzgqThbR0G34slK4fxlcsdPlljWZRSB/DVZTEtVHkBiW4A
	np1M7RMujF9qLvOZ4CjJplW2UR2nGExFgMfRGdr14Zl0zBg==
X-Received: by 2002:a05:701b:42c5:20b0:144:fd7c:84fe with SMTP id a92af1059eb24-1b543d48dcamr163814c88.35.1794935208052;
        Tue, 17 Nov 2026 09:06:48 -0800 (PST)
Received: from localhost.localdomain ([203.92.58.30])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319e381sm42046436c88.12.2026.11.17.09.06.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 09:06:47 -0800 (PST)
From: Shivani Patel <patelshivani2283@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Shivani Patel <patelshivani2283@gmail.com>
Subject: [PATCH v3 1/2] staging: most: video: Protect pending_mbos and mute with list_lock
Date: Tue, 17 Nov 2026 22:35:57 +0530
Message-ID: <20261117170558.33844-1-patelshivani2283@gmail.com>
X-Mailer: git-send-email 2.50.1
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

data_ready() and get_top_mbo() read mdev->pending_mbos without holding
mdev->list_lock, racing with comp_rx_data() which modifies the list
under mdev->list_lock. Also, comp_vdev_close() clears mdev->mute without
holding mdev->list_lock.

Acquire mdev->list_lock in data_ready(), get_top_mbo(), and when
clearing mdev->mute in comp_vdev_close(). Use list_first_entry_or_null()
in get_top_mbo() so comp_vdev_read() can drop the redundant data_ready()
check inside the read loop.

Signed-off-by: Shivani Patel <patelshivani2283@gmail.com>
---
v3:
 - New patch added after inspecting list_lock usage per Dan Carpenter's
   review of v2.

 drivers/staging/most/video/video.c | 34 ++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 3a0445ff6..92d5fbc9a 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -60,14 +60,27 @@ static inline struct comp_fh *to_comp_fh(struct file *filp)
 static LIST_HEAD(video_devices);
 static DEFINE_SPINLOCK(list_lock);
 
-static inline bool data_ready(struct most_video_dev *mdev)
+static bool data_ready(struct most_video_dev *mdev)
 {
-	return !list_empty(&mdev->pending_mbos);
+	unsigned long flags;
+	bool ready;
+
+	spin_lock_irqsave(&mdev->list_lock, flags);
+	ready = !list_empty(&mdev->pending_mbos);
+	spin_unlock_irqrestore(&mdev->list_lock, flags);
+
+	return ready;
 }
 
-static inline struct mbo *get_top_mbo(struct most_video_dev *mdev)
+static struct mbo *get_top_mbo(struct most_video_dev *mdev)
 {
-	return list_first_entry(&mdev->pending_mbos, struct mbo, list);
+	struct mbo *mbo;
+
+	spin_lock_irq(&mdev->list_lock);
+	mbo = list_first_entry_or_null(&mdev->pending_mbos, struct mbo, list);
+	spin_unlock_irq(&mdev->list_lock);
+
+	return mbo;
 }
 
 static int comp_vdev_open(struct file *filp)
@@ -143,7 +156,9 @@ static int comp_vdev_close(struct file *filp)
 	}
 
 	most_stop_channel(mdev->iface, mdev->ch_idx, &comp);
+	spin_lock_irq(&mdev->list_lock);
 	mdev->mute = false;
+	spin_unlock_irq(&mdev->list_lock);
 
 	v4l2_fh_del(&fh->fh, filp);
 	v4l2_fh_exit(&fh->fh);
@@ -175,10 +190,15 @@ static ssize_t comp_vdev_read(struct file *filp, char __user *buf,
 	if (!data_ready(mdev))
 		return -EAGAIN;
 
-	while (count > 0 && data_ready(mdev)) {
+	while (count > 0) {
 		struct mbo *const mbo = get_top_mbo(mdev);
-		int const rem = mbo->processed_length - fh->offs;
-		int const cnt = rem < count ? rem : count;
+		int rem, cnt;
+
+		if (!mbo)
+			break;
+
+		rem = mbo->processed_length - fh->offs;
+		cnt = rem < count ? rem : count;
 
 		if (copy_to_user(buf, mbo->virt_address + fh->offs, cnt)) {
 			v4l2_err(&mdev->v4l2_dev, "read: copy_to_user failed\n");
-- 
2.50.1 (Apple Git-155)

