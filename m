Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A21847F3CA
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792230417; cv=none; b=jZChE2YjbyusWhVRAv+9h1VkVR/ZZgJM54OWGZIPAXZeJYepIq5MxrF0vosVbgS9SMTFMS3NEv1sQyDs7pq2eWC60PHfBqnGkczNdy2Pyco/dDjj4IwjDSiZNBxI7FzRoTQxKFGpdHJIQlIzkYKzb6AkFTell1defZl211/qh+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792230417; c=relaxed/simple;
	bh=+VI8/d3lnZDa+xcOD2YfuTIpLOKrWMyzcnSDAv9p91s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WXq8psnxhuP6F8s4HxZY/2wudv0tW/k5Vqa3G44KbPrPm51i6OgzFxmpnt89fbR37KWgjbkrmiicweNnp6dmIzrqlPsrs5PfHCOkyuCbBo4j4H5mMd7YtKu9F+n2SmncBNbSzYDzwFfWbt319RJ8EPceUluhQ34d1HTaeda1CgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H6618hkp; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H6618hkp"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3550c917fd3so765271eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 02:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792230415; x=1792835215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=38+wpYROyyabUyi5vQ70P++iJLb+AS+U91iM8zmq47c=;
        b=H6618hkptIPTgqXllU/WGnT3/Gesj0+IOUoJVHPKJtqldmtnhQ+cng9oY/1JLxcOLi
         yGR22r9rQuZDWSxK0XMLM5/3oYTVnvLqp81IKPBo2q5J5OvJ2x4jOP2cdA9Bh7Ef59Fw
         IMYHYQJq/Oi7YQv7TSLHKOuoX38BZOsXrwLjG+woKF3Q+RttKdLD3KXpv1WQVazB6+U+
         P+DmIwjBd0NNzF6tc2bGK13M8n7SpntC+nWGc3w1awH90V2nuQ0Usz6YLCCZnZtgz0w+
         PUpVNigHzxSZW7idyXQmBDW1GvpN1GGZPr5sUnh1WBMlvWDaJ1MqiZRn62imSPyNZGC4
         oy2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792230415; x=1792835215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=38+wpYROyyabUyi5vQ70P++iJLb+AS+U91iM8zmq47c=;
        b=Ft7VFftV/+02ITe3DGedPxuzWZ9jXgQY0T1VHvwtoNYUdG50cPmHbqxbR3DIIQmUmR
         /dXuW2VFdYBajXemrcPIg5xnEkEEAEY1y91axGqrF3c27yJzjoEP6gnVsinA5cwCS1BU
         4lpXXu0Lu5tz27gkhAiiW3QZrVjZou5IzRb+A0JInAfZusyr25S2JMgb4/wgCb1ANd2r
         oLztZJVIrrhSrQjrElqY38qpPxLbuN5wqlZnBPsrZA+8917eaaC9AY7cm6FUmAMK9lI+
         Dno7Z22VJ2KRAEvNDOFOf20ZD3J3SnNhdQpM3AEwvxf3Sw9SU9Gy477eTAK0mjIcazg/
         oSHg==
X-Forwarded-Encrypted: i=1; AKwUvBzMZs3q3m0Ufj+iiGvu38vAKxFutkmgPK09EmB5ua3AWeQu60v1iqDfoX4TWsmaa2bFKWpt6j4KCORq9+g=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4WW8o4pIbEmiU4WION2YscIuvaIvj5Cs+MNWfj35FuluA3j7a
	e8dQpcGyMmjAS7dWnirHObGOuLX0MxBuwbB8RNw/TT4lq0iwcbz8Z7E=
X-Gm-Gg: AYBFou3wRUbgjV1ZlV0iwbAXPnCnwsfmeatoGLwCxIcXUsK5TkiyvZB05pEwVqOynXe
	YxDZjTv65ezz2ao/HoFX/hrXX0s/nwjMJ1ZXr3du5YuTqh42nUBcc3qraYWtTUzOiVJoI7lKQVV
	TTrG3f0fCMJCnI4mOAQ5vLJiSjGlT8OJmR2l0SeUly7Va996MyfEkMmf41l35YQ02CBGbbC4+5x
	W0611sVRcRQ3jfbXQbp4Sxkth+DvCWO9ax/6pDMvuWo5ggo7ThWWX9aw66LJBMQfpp/DTKp5CRj
	FtjW4AhBL7UC0HywOz9es66TpxTwXPsnh0RaGR4AEpsbvcVjjxstFidWhwwnfWAL8Yq5lE2mZxM
	2t8esRvrGy47wQuf3Y1Lp3bDqD9qfKX94qDarDCBYJjK8cKtc4uHEEEqkpdNFufLWvTsurSGndC
	mva6WH7C4e3RNfRS/0qikaknAXxnXC6lIam3lpNnUm32TD2CWeDYH0dK8u4xMX17jEvmA4xWQH7
	A6GAjmoVuLGPwFuw8Aoa+kKmjE3k+wFgMFkeA==
X-Received: by 2002:a05:7301:271f:b0:359:bdc8:c9d5 with SMTP id 5a478bee46e88-361a195b1c7mr3854306eec.21.1792230415068;
        Sat, 17 Oct 2026 02:46:55 -0700 (PDT)
Received: from localhost.localdomain ([45.127.46.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081bafa7asm13475852eec.14.2026.10.17.02.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 02:46:53 -0700 (PDT)
From: Nikhil Gautam <nikhilgtr@gmail.com>
To: anshulusr@gmail.com
Cc: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nikhil Gautam <nikhilgtr@gmail.com>
Subject: [PATCH v2] iio: chemical: ags02ma: Check for short I2C reads
Date: Sat, 17 Oct 2026 15:16:39 +0530
Message-Id: <20261017094639.3002-1-nikhilgtr@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check that the I2C receive operation transfers the expected number
of bytes before accessing the received data.

Return -EIO if the transfer is incomplete.

Fixes: d58013f39b30 ("iio: chemical: add support for Aosong AGS02MA")
Signed-off-by: Nikhil Gautam <nikhilgtr@gmail.com>
---
 drivers/iio/chemical/ags02ma.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/iio/chemical/ags02ma.c b/drivers/iio/chemical/ags02ma.c
index 151178d4e8f4..2219965d044f 100644
--- a/drivers/iio/chemical/ags02ma.c
+++ b/drivers/iio/chemical/ags02ma.c
@@ -61,6 +61,12 @@ static int ags02ma_register_read(struct i2c_client *client, u8 reg, u16 delay,
 		return ret;
 	}
 
+	if (ret != sizeof(read_buffer)) {
+		dev_err(&client->dev,
+			"Short read from register 0x%x\n", reg);
+		return -EIO;
+	}
+
 	crc = crc8(ags02ma_crc8_table, (u8 *)&read_buffer.data,
 		   sizeof(read_buffer.data), AGS02MA_CRC8_INIT);
 	if (crc != read_buffer.crc) {
-- 
2.39.5

