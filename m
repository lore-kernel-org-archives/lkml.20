Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793681239;
	b=XCh3iqT4L1DKECUadKehb0XNFtvdKLAtFXyWt3kCGFj+rKTNHntUknkxIb8svXqDkmIy
	 VYe1TBxFw8i0v2uMVup58zkrqgHGiEJiofKIRzd9eRKTexJbMbgFiNFlZPnLENyoWxczL
	 lWJSTcltb5HZUVd1pGvlj0j3xd3bgC4RIPRY1lpd6fUA9bgIseyxALhV0sQChylwJmALc
	 vy7r3XP7Kh+GSl0AucFopuoJHEyPkqtwbNQT9MfEneQ+8bhYVeEWyN4i0hVVyQIT06V0o
	 +jyw20dzbxI6YNkpJatw92KBjGu5N9OTnwvAJN1Pvf0SCpT4/zFFm6Q3aKMFAdE8w0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793681239;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wLXXZycCt3p1k/CBuHJtwLDAq2dYHgMI6sCWUancyIk=;
	b=Lb31UL+GzKm0n/dX2CiYJD+x/QjnA0ICTAFkMkUbjLaTWjJOpN1CZhxdMohJwkwFeVTF
	 IneME9nYGXxyxYBLMki9Dse0pXB6xImyz2DgoexG8Oo6CyU+Gq13UvVaK+SdWTFT/6+u/
	 hOxKI5zqETvce5W9k3go7bWsTyjfLQXKRiPvszlJuJV/ljWXqHKHI+TkTHUEOtBtMyHhL
	 GXRGYxnhk8j5x/TDIRwaDpiUDYo6IEwX0FvGCp173hlpblimK2h9McZP7ugOLxUeDeVcY
	 sRbEIK8a23tV5QqHtTvVsjd38hGt7YwsFxKaNlLLQp8Jkbz/17+NkfCgL/VCL+rLy1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZOWGSWfA;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE29606A333
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AE29606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZOWGSWfA
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15943c9c005so2315855c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 20:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793681238; x=1794286038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wLXXZycCt3p1k/CBuHJtwLDAq2dYHgMI6sCWUancyIk=;
        b=ZOWGSWfAclSa8zINRI3U3lDJk40HHbzkmar0Yp9slLEkySRr4M9aMpRJ2dLP6J/hsD
         aEBozoTX+O7/9+y+XVzMqa8xBIxom0bQ5yN7T22FMD42i/zSWbzG9ZDQ9QWuE1DK0NQ1
         x3hllPuB+GFNHP9M2UJtuyW2jYLkr24GvUcrfIEWhaiEoFjhRE417rFkVp7RnCsy54fA
         cg64q6nW9K7AqiOewOjrRFAr4VKU6NcAxGndrcrRGcvaUpqBxTZwg1DjxcgyUFisZ9zC
         l8QtuzWQV9zdqdxo/jEkHAGs5ukBATHZ309rT7Y8+xHa7IwukyedOhH4+ngx61scAWi2
         6GCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793681238; x=1794286038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wLXXZycCt3p1k/CBuHJtwLDAq2dYHgMI6sCWUancyIk=;
        b=r8mzsmQ85ycCBg54381EMBlBScWf5d2oue2lvUejWwWdfB67qYHjXdzDq+PrZPiPaS
         SPR5Hn9D1lTqiBtDDcXkJbdFDxZ6EZczZNJBMcdF3Z2hLUrutXC/Cd5n8DsXwIYhy3TF
         xpDWPViV7+I20KyCH/dCedzqPSJI+eapNL4J5oTC90f/Ldv9kWPCCLKGr0VED9broJPX
         IpfwXEK7y1+2ecrYTA7IjW2D/il5b729/e6PCL/HR8ddcc+Xh3gDBwfdFBFVAKpc4mp8
         PNRiWKXnEdBnxGmUL0JRxpLgxzOPoBjNM9623DkCd/+ygnrnJKpVm6xciGtWpV5F5Iog
         IMOA==
X-Forwarded-Encrypted: i=1; AKwUvBzI+eF5grq7YvMHt1zrBcYB0WhR+0ssQa0gLsJxb3WXFv/6zt9ABkAlFEFvvdvGusqpv4krBdIb+0fai5s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEA9X8o1gho2hIhCr0uq5TRW818rfBUb074lQrd2BFtCULe+8l
	DZ8Vd7yWVDQZl/Ik02CrjlLyRBFeX06G9V08QLtPjKs+yvp83OaHjaD4
X-Gm-Gg: AYBFou3YnGt4AqYFBu8zd8ee8HnfqoknalIfov+TSmmqQvdT6IMcrS/utupuJI149ok
	4gDd6jUS9eUD5p+IMD/TWA0/Q5lzI24PMfT9JfHUNjxdZghu621Y65WOPSJROI0KiwPmhyKON7P
	mxXWVc273Wf3n15fFcjlGM762uNsnoyfbaB9VTcc1FiVt61TPy5J1PbJIv7SxHBHBOpUSDZjeEY
	5sp59o5ROhVJrTSNhv+FBadut+YpnebCedWqFYPeEUq3gJ1gCmvwf8Syzy0eruhNYf4Id4KeyUX
	IlG8R2esXlFv2BR8K8Jz8uZ09c89t/MIw5e93Xup1dWgHcX7ZIXbMx0UvjEwVL6OfkCPUi7ON1z
	ooAk/1Ri2OhjHgILQQsViJLf9C5jbvUlEwtq3mRKjqIN9gt0LLPetnuFepC+NEjq6SM/KXqdYYr
	8TaMaglaN7GGK1qv+ZJy//0YCqiC7JbquTylHF6UOxnCbIjOXgIIpKu8sbs/nrkfuuTHScG0lQl
	pvw+9J4FYTTVObv/ui8VuspGge01jgowWLotlO3oF1bdtQCmnl/sRzhJfM7cUkaHTQeADE05XwB
	ti1MJGQ6rUAzTfwkb4ixraWBh/NBldZQWrmKWpvHpT0drTyTeusNUtyzVs6O3EZLzecbsx8NXaC
	4Nou+p8H3kKPe1vJb
X-Received: by 2002:a05:701b:4208:10b0:1a3:116:848a with SMTP id a92af1059eb24-1ac5de5424dmr17866007c88.35.1793681237912;
        Mon, 02 Nov 2026 20:47:17 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:98f:6bcd:858b:7a64])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42902649sm48385807eec.11.2026.11.02.20.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:47:17 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Val Packett <val@packett.cool>,
	Hendrik Noack <hendrik-noack@gmx.de>,
	Ferass El Hafidi <funderscore@postmarketos.org>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-input@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] Input: goodix-berlin - set default resolution before parsing properties
Date: Mon,  2 Nov 2026 20:47:06 -0800
Message-ID: <20261103044708.2461481-4-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103044708.2461481-1-dmitry.torokhov@gmail.com>
References: <20261103044708.2461481-1-dmitry.torokhov@gmail.com>
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

goodix_berlin_input_dev_config() currently configures the default
10 units/mm resolution on ABS_MT_POSITION_X and ABS_MT_POSITION_Y after
calling touchscreen_parse_properties(). This unconditionally overwrites
any axis resolution calculated by touchscreen_parse_properties() from
touchscreen-x-mm and touchscreen-y-mm device properties.

Set the default resolution before calling touchscreen_parse_properties()
so the default resolution remains in place when physical dimensions are
not specified, while allowing touchscreen-x-mm and touchscreen-y-mm to
override it when present.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/goodix_berlin_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/goodix_berlin_core.c b/drivers/input/touchscreen/goodix_berlin_core.c
index b0938a4f3fec..5cf453427eeb 100644
--- a/drivers/input/touchscreen/goodix_berlin_core.c
+++ b/drivers/input/touchscreen/goodix_berlin_core.c
@@ -626,8 +626,6 @@ static int goodix_berlin_input_dev_config(struct goodix_berlin_core *cd,
 			     0, SZ_64K - 1, 0, 0);
 	input_set_abs_params(cd->input_dev, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
 
-	touchscreen_parse_properties(cd->input_dev, true, &cd->props);
-
 	/*
 	 * The resolution of these touchscreens is about 10 units/mm, the actual
 	 * resolution does not matter much since we set INPUT_PROP_DIRECT.
@@ -636,6 +634,8 @@ static int goodix_berlin_input_dev_config(struct goodix_berlin_core *cd,
 	input_abs_set_res(cd->input_dev, ABS_MT_POSITION_X, 10);
 	input_abs_set_res(cd->input_dev, ABS_MT_POSITION_Y, 10);
 
+	touchscreen_parse_properties(cd->input_dev, true, &cd->props);
+
 	error = input_mt_init_slots(cd->input_dev, GOODIX_BERLIN_MAX_TOUCH,
 				    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
 	if (error)
-- 
2.56.0.385.gac671c819a-goog

