Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892329;
	b=ied34kZTgxJwOQ033gae47+qqvVgQ8kV0PXo4YqsUmQ5i3RNOfzC6B1D6dnA9JrgFVte
	 YIrV4fHPUpoX1X5WQ+Yw4xRL436gErZuzree8djLOnfau2ME3aJA0OiEGY1m/Ayl6W+Ai
	 KUMOYuGyuoI6Bmwq5ZAe8W9fKnkAnPI/WTQqINaH6qv80EnjWXZ2Cs5neajcE5GR1Cgnu
	 K2SVNwb3Mo0DZmtoMM6XgcxelBc9GuflHRt3GR8bjcjQeKeio+g1alGNH5fBmfijhu5tH
	 dcnFXgpnd1d7UksfjNeuY0xXYibcBP/waB6ENPhEH97LKTC+sWEyU8hF6G1R8JMBaxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fUq2fGxSb2/NcTlvV1YtV3DNYmmgnliEIRSPS9wFg44=;
	b=3MgFvenjm4Gkjmo6T4XyiYqbNJpY9BaBFZ4t+0LXi0+igK/z8ztdSjZK5/gn32FKRt56
	 674OtivNHprfCAq64sdJMjYBqzFrc/yOMtLZtBBJndTquUWq6HJ8j6+vlmr4ucW5rfjWc
	 oDrnYfQGP+O2d4sdDGZwK+w4GtSkxZqFYoho2lVMF3CYGJ0j5hPGFV66HoQTkafEMoScZ
	 2bObfy2gLXrPAKVO+zgQhCkkbh+BWKHNJaiUM7balqbJk6q0bUBuTL4Ohv9HLUhGYK05U
	 WJ+UdS5d5EWUWE592rr7CKLYcs1IOoN9k+oXx7xaQ2973ESgmsM5D+gOAUm5GCvGrSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GP2KUT6M;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFD5606EE8F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:25:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DFD5606EE8F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GP2KUT6M
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso5436500eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793892328; x=1794497128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fUq2fGxSb2/NcTlvV1YtV3DNYmmgnliEIRSPS9wFg44=;
        b=GP2KUT6MsP7T3/vueJSUrlsUC+/pP1+6gW92y1bHRTMgGwFp+ejgG0yxuVQYb/34UM
         qzM/osPFXnbFuukm6fsHppR20ql074UtnqkLFeaoUVll0xPN5gmwtP0ODQitw2n1mpNf
         swrxEqpZrCkLkkoWA2M5GKq8MjodxrTyl+rmZ5fTxI/PD8gXn5mTaaewNQnlKuys77DD
         7Du39FifP28/vLw+emEJ7NNm4M/+StJQFwf24R5H5ElzPo5j1gvOnXy9o06g5cKcyC55
         BOhFS7ylvmmtv3b3Wq/3HWGMdfzaYz2wM5yFK5Cz7gkZQCf9D5+KaY1r9Gxwlbftpf7u
         t9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892328; x=1794497128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fUq2fGxSb2/NcTlvV1YtV3DNYmmgnliEIRSPS9wFg44=;
        b=uZSujYeSOf9AID1OFVuueZ6SlThQI6BrY0k3qslY4qLv7dvMMm2/cJPHIZr7pmZfCZ
         x1+Xg8L9asrR2NW5k7ssbMFaEeD18fdoShhTlzccmJpUZM01laiv+ppZaNITH9Rk5eQH
         EtnzK/DiHHwVLH0xDqfBme81sKjZterLrXTJ0sBn90LBSq5HyVTlMXcgsxXxt05tcOFO
         n6cRcyh7Z5m+Cb/sstTlnwRdIazEI2/z/JkXfDItKFZj3aEJOAwcTEb33MJ3AK/Z28AF
         LcPh6TrHSp5A/8rI8vnkl9IUDOMUD18XxbqBKEM6EEt7dGB1c6y5Mrnd3V+CVof5itx0
         fbzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxDDgqKBEHlajPfsrg6ZpU4CJhIZdOcuX6j8OU2gEomm0Cxq9aBqdOZsU4m4okyCiFtNYO3p8Y8+ihGiw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vgmcg5ljnAqGRK1oNN9PXQ6lcThDTRrIhJB94ymkbHWtaSwqp
	hs1xVBPbMAW7eVBn1jQ0mx5BHp+1K1I8e/vKwKLa523cR5vGmGxt+tH+
X-Gm-Gg: AYBFou36998N+7RCryzyQe7qJV3xw1FXl9zGFvBHkFz1TkCRvgG6iykVQ5w1yz84VIL
	RwL2DVXKsRe48+NzZ+BmreDSj7mviOMkbCX42BAFHFUzYq5jcyaeFbERTGU/qBijCAqeGM//0zk
	p+ShksGevStJA+R4E9fig9h61gW/KWbXy/fk3u0zTkscOmYWmUS7M4tLcOpDN78OEryRi925zRK
	6MhXLMS6xstWa8NokGFUtagFZYgXc6NF7Hvh8Xn3TxVFnFWkhm6FFjXKGQgbTfOMziUUUMhQbC8
	wTuGklj3q7atxXToZXPRtG2M3us62sJxXSDMme4RwPvBeVEWrPnYuwrw107dOe+b/LvivIdUNcB
	T1NZv6bccBXobsX3AyWanUGVT/LARaFwReAU3hJNT4sf2H10VmEXh/srd0weuOHZI04GCMiU0vb
	00Pf8WkYEz7N/hZBOgJFixNaDmBC6hiQw6wpDktIxK49qMWyNGssOQlOCYbd7sEFY/FWGztE3tz
	B/yHJcb9ZDQo2xAcoP/tEFJZcQcAWCbpsDJ2ZZZYzpCOpAAktDKtv+k2YEatVueawyBhijBbmAd
	yWrFuEwaup00XNnvfFIV7vBErgBXmvOjFEm7IwOcYysXvp4gGStMet8=
X-Received: by 2002:a05:701b:4182:20b0:1a5:52f6:db9a with SMTP id a92af1059eb24-1ac5ca23c29mr30743988c88.22.1793892327393;
        Thu, 05 Nov 2026 07:25:27 -0800 (PST)
Received: from Anonymous.localdomain ([223.181.63.167])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm17432491c88.8.2026.11.05.07.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:25:26 -0800 (PST)
From: Hussain Sitamouwala <husainsitamuwala21@gmail.com>
To: outreachy@lists.linux.dev
Cc: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	Hussain Sitamouwala <husainsitamuwala21@gmail.com>
Subject: [PATCH v2] staging: most: video: document lock fields
Date: Thu,  5 Nov 2026 15:25:14 +0000
Message-ID: <20261105152514.11704-1-husainsitamuwala21@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Fix checkpatch.pl checks:

CHECK: spinlock_t definition without comment
CHECK: struct mutex definition without comment

Document what each lock in struct most_video_dev serializes, based on
how they are used. list_lock serializes changes to pending_mbos and the
mute check in comp_rx_data(). lock is set as vdev->lock and is held by
video_ioctl2() around the ioctl handlers.

No functional change.

Signed-off-by: Hussain Sitamouwala <husainsitamuwala21@gmail.com>
---
Changes in v2:
 - Replaced the short comments with ones based on an audit of how each
   lock is used, as Dan Carpenter asked.

Audit notes:
 - list_lock: comp_rx_data() takes it to check mute and add to
   pending_mbos. comp_vdev_close() takes it to set mute and empty the
   list, and comp_vdev_read() takes it around list_del().
 - data_ready() and get_top_mbo() read pending_mbos without the lock
   in read() and poll(). Only one client can open the device
   (access_ref), so this looks benign, but I did not change it.
 - mute is cleared in comp_vdev_close() without the lock, after
   most_stop_channel(). I assumed the core delivers no more buffers
   after that call. Please correct me if that is wrong.
 - lock is set as vdev->lock, so video_ioctl2() holds it around the
   ioctl handlers, which covers ctrl_input.

 drivers/staging/most/video/video.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 3a0445ff62f4..94f1dc994217 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -33,6 +33,10 @@ struct most_video_dev {
 	bool mute;
 
 	struct list_head pending_mbos;
+	/*
+	 * Serializes additions to and removals from pending_mbos, and the
+	 * mute check in comp_rx_data(), which runs in MOST core context.
+	 */
 	spinlock_t list_lock;
 
 	struct v4l2_device v4l2_dev;
@@ -40,6 +44,7 @@ struct most_video_dev {
 	struct video_device *vdev;
 	unsigned int ctrl_input;
 
+	/* Set as vdev->lock: held by video_ioctl2() while it calls the ioctl handlers */
 	struct mutex lock;
 
 	wait_queue_head_t wait_data;
-- 
2.53.0

