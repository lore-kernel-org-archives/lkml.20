Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988581;
	b=mJ9uC/U7g4FSYL6GWOKPAnFXpXkw4QYXH1Nl2C917mAf8LZiknzOL5xSRNpaeY4YIkK8
	 JmzECUG29UnHVMEzec1+kjZQGEyOCgCqHTvoQYh9x9ewXXElX0ElNfKcLDYc31z8/MS3D
	 xNMpEWs4fkMvHRsDivQ1s4RLaT587dCFlInw8W+fLylnxFSWK3aN1aQsy2CQHfov69+rO
	 DjPL2pX0nqq3y5PkncGKUNhtsDp7+KX1yiUXSAdgxjp0iNIvcKe8NTYEA3miLhuJQg9FJ
	 qrzR1zJ2Y0MgruTWBurw4WvdL57LT55MiNH7Hhcz0WgEDgVeGp25VJEF6yQqIA0+tpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=XHoNbOiS3kAZn5XDBJFLkRMPTYji5N9SX6DLNdEprPY=;
	b=3BsT3VAV5J3pRxRm9TnY5AZWZoVkMrzsaE276em69LGiDLqP1ODImF81pNNH9iVDVvwa
	 zCe4iPmikv+79eD+OtBZUd2tf3YJC/v06LdRZMapKLWThnt0M+Yp35moAIndfeA+cqlOr
	 kdNlw6q/V452gVKFRzYMYxVdfh3RsRBI+YD9sN+kEu+WI1BLVObu8CUp1PfV+bDgKq6Sn
	 ktWE770QJZJrRm6xM+dMtluOMU0ABjwjaXEM0MkpNGiTwmoH3T90qGwpQe1n9DHtXenqS
	 XfZRAZwats2E7p2mHeLlDL9NCZG9q0ugsaSp6eliyCPyoJtPPSaoqhI3jT5yyjzMofw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="itsVLWh/";
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3210606A333
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3210606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=itsVLWh/
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-15ea896ddc8so1672662c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793988580; x=1794593380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XHoNbOiS3kAZn5XDBJFLkRMPTYji5N9SX6DLNdEprPY=;
        b=itsVLWh/Udvqv6vleyslRD9ztK0SrnvDCpr4/4N4AlEiOccupSUuKeJV7x8i6E9RLY
         5FlrDSdTqQZ8taMwCsIyTYJDiYHOBvcPyYuN/8J6raWLl+xxqavsF7L4dEGBjO9xDDFd
         A4sKOPNzr+dXB6tXwybXrrx88cSkCZHc/KlW2xDqyTwvEzFqsoByNTmzWHWTUYfogt2P
         VAwjBLZA3O7vYoaiWOO7VMzmPvK2cTZ2qvJUmtfjzTk/gmHJ3f8PA8tVA3s3FOU478FD
         fcGoDqrA0pGbbUncJLP/ITl9hueaN8gWTdy8LDWQbOM6hGVuK/UMh5onxRF9jp3Orotg
         pnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988580; x=1794593380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XHoNbOiS3kAZn5XDBJFLkRMPTYji5N9SX6DLNdEprPY=;
        b=u24yAmsnUwNpiSBiKCGU+k/bV6WKzF7alc5VWD72ixrhF7IbZRb0rQPX/G0hlUEjTH
         HF/sEmdQ3GBywEYKq7kKHopZHf9hnfBYM03NYdYF+RBKDSfBSZ/wrOsD6h+W7TLsmGij
         sNL4p2dFWW+QbCgNt2sb71Xs8jK+I/WKiQyuupyt5B+D9arL2YrdfH+IHMKblazdSiuw
         1X069orcJoi8V1SS7287jKAINZJUkupG8rGYTdW8qIWHWQP6kFkhdFyLerlYLXmhmQ/Z
         2fqoX4ir3HInaKq+U5R6/AYVSkdtCzeYSwP+94aAZGFYRBzLbdmHJdEO17ZZukc2x4Ej
         VgzA==
X-Gm-Message-State: APuU4Z/WzH6MdNJjexFx1SDXbO9uJEr+UeeEcj/wZFXfRQiqZpQPL4TG
	9e7YEa5WKzcFV1ccvuR165bwi1cKICQR0O3ktjbHEJyH72y9Ip8FC0xX
X-Gm-Gg: AYBFou0tAMhMxJDQtrA1/JSBns0G4QGeS+7ArSVVpEdgGF895nJT18zXEjybJcIaxR6
	UNzZzzQ8aeyvREjXdMDt5d9BN31hPSTfrzHrRK1uAV1p8M2WwztpqrweRn2l9v+dFzgkZdTmHOj
	UORy6hrrTd02xA7W+wPHVGfWhknvO/Yra+l5pJYggn0vIjz/Ov5rfkLPiAirifz/wODvD8NLFyC
	TbQxj41z54iSXO4MnAFHaXGKfaPgId02M1a++vk1dFKvXviecPHGHFs36o3JTgxP+Ri/BI4b8A2
	5Rj3CseVBS4Hiz70aKmIFURjWOiVXZUGf8q6zwwpYhJ4mBMiZDan7LtHfrry+6CjezurJtOVvB1
	5OuWcLwMnvRNYubFrT17KL4fuBA7JQVtf0YsH7n6sQ/PXxhak+UMmDbsCTeikDZdVeYfr7kggj/
	lFvqW9FiWakUjCiSd3m1N8qtfOHy2GxcNEoardiJHII4qOSnhr19KVIVkiNdDxpedu5K9URw/+q
	go5Z2TiO83lv2iaPmLi3BespZuXVX1ymIzu9VQXxVIK4xF8/DKwD7n0Xfxqofna94gPYrdMdxEw
	Q1KSUnWcWIsnQ04MsqEB/HyPlC2NL56Eb4p3YAsCa9Qv6+2sONn0
X-Received: by 2002:a05:7023:a4c:b0:143:7001:7645 with SMTP id a92af1059eb24-1b25d34f9a8mr3634838c88.47.1793988579696;
        Fri, 06 Nov 2026 10:09:39 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.113])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4a5628sm8366464c88.10.2026.11.06.10.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:09:39 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: control: Synchronize LED mode accesses
Date: Fri,  6 Nov 2026 18:08:12 +0000
Message-ID: <20261106180812.5097-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
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

mode_store() updates led->mode while holding
snd_ctl_led_mutex.

However, snd_ctl_led_set_state() and mode_show() read this
field without holding the same mutex.

This can cause a data race when userspace changes the mode
while another path reads it.

Read the mode under snd_ctl_led_mutex in
snd_ctl_led_set_state() and use the local value after
releasing the mutex.

Also protect the mode read in mode_show() with the mutex.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/core/control_led.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index 501387287ae6..044430b2f1a2 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -140,6 +140,7 @@ static void snd_ctl_led_set_state(struct snd_card *card, unsigned int access,
 {
 	struct snd_ctl_led *led;
 	struct snd_ctl_led_ctl *lctl;
+	enum snd_ctl_led_mode mode;
 	int route;
 	bool found;
 
@@ -168,8 +169,9 @@ static void snd_ctl_led_set_state(struct snd_card *card, unsigned int access,
 				UPDATE_ROUTE(route, snd_ctl_led_get(lctl));
 			}
 		}
+		mode = led->mode;
 	}
-	switch (led->mode) {
+	switch (mode) {
 	case MODE_OFF:		route = 1; break;
 	case MODE_ON:		route = 0; break;
 	case MODE_FOLLOW_ROUTE:	if (route >= 0) route ^= 1; break;
@@ -382,6 +384,8 @@ static ssize_t mode_show(struct device *dev,
 	struct snd_ctl_led *led = container_of(dev, struct snd_ctl_led, dev);
 	const char *str = NULL;
 
+	guard(mutex)(&snd_ctl_led_mutex);
+
 	switch (led->mode) {
 	case MODE_FOLLOW_MUTE:	str = "follow-mute"; break;
 	case MODE_FOLLOW_ROUTE:	str = "follow-route"; break;
-- 
2.55.0

