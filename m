Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793793647;
	b=5WxqPmEKTz2QpwCOXUD4EGSbknYsnZjWaBqqKY96xGEiPchSDAMGS1lk/TzFWJkMP+tq
	 uK3wZQzxCOSkhNh8eVWwkFEJd3hqoKNTFBhDArb3XJ4cA+aKpO6GD7ZDCXuUJ9mQ8Pm/3
	 8ig42kG8Rfx2PARB/X3vZIlHaR1V7NAq/w72Vn78jy1Kp85+uuHHutK3BuQE/gE9K27MW
	 CsoaY2x83vhP5JO+kHLz1tjcXcXqks0e+M/+yRsZuEXBvHqnRdMZn25dyV1m6ZDMAJSGt
	 AQlD2kYN6RTfOAIQKJhjpN2YJWCXvGfBRS4E0IdCaaxt9jwMTZmp/4E+zwGH+mtsqtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793793647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lYYdYQNG26JelqH/bO6Y/sAG4udZyz280WGQYCnp+Vc=;
	b=ydzCkPNs5W5dJCfYj72bj8qWznsBOgOc6Y7tzd/AIhr7KxI8WAIvyNb0YFnO0pZDdOgF
	 ek1166j+xkcXJpb0qr6ddhBKmtnwvxXpPQfyV1ssVaqGdpOUlwQ6vMLkUs6tJ2A0vE5Ev
	 4ItR0lRIuzU+dcOS8K9wqJ0K0V9V8mIOz69iXNG8k4qo/XKMZOmRsoMckPnATV0N+YSR4
	 gr71dwne18jeaJsVnF7GpC/r1pk7zUSTIMU0mQLgsblCT6qdrVaUcmT5N3uWIzdxTRwx1
	 sQx8iBheEzIqokD2DJNeK5dEOtjR9Eod0Tpq5g3TJmw2YB1atalOeI/W5jWYcFEyrWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AKUHUBtH;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B42606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20B42606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AKUHUBtH
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b0a0d19a60so183187a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793793646; x=1794398446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lYYdYQNG26JelqH/bO6Y/sAG4udZyz280WGQYCnp+Vc=;
        b=AKUHUBtH85nY3akuWzBH8BuPtiStxO7YT1wCf4YVWnoiPfDWaTKlYY1j03Kwhvsz2J
         sxPU5w+fob1R3WZxoO1jF3fZ6kIejrWVsxnfByxAoDY8DFybSkTujK1+nnNeAGzmc0tn
         KbnZ15RSlect9z9WRTC9jS88QLjdM6TKz4ERZ7Rq1t4mkzhf/xw228U3VTmhDffm09US
         dhldbNPR0/USy38y3clZD8oViTAIcgi5NXne8x50+Df3ac18cVywNumHqDZx/5wmTvnt
         m3XPlT1u/DqkphyAcHGJdIMH7Uft9RMZ1g9A3jse737GCXNlI18CdgtrBkogh4IQLkvc
         zj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793793646; x=1794398446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lYYdYQNG26JelqH/bO6Y/sAG4udZyz280WGQYCnp+Vc=;
        b=InTOF0ObNbvLNYgyyFo5ER+d88EwDK5e/Y8Uu82xEnnmHcYD73IU3IOWtGCuMU6zbi
         p1OkFB8Wz1JHKVL4hAf1FuhQhg+rk5k3IzZBC57nvFrvkGYFVsnQGtxceOgwQiPGN0zI
         mVgGognqTFX1PEo1jFqOIzr8Cdc28BeoNeLw3bfH5orB3UntxeFExTq/17OhyZEkylGL
         6/wvuga5EtN+Y7tsu/T0TWyu4rAXyZoKvp6+6V+Vd0hgAThZ8ZeblwMvNKgbODRcKORi
         CyxmbySFvDfSbLerNWx/rI6RDoVaHtQrZvK80SFbrr7UGesdVKYBGpCMm9VQeD2HcIax
         C4xQ==
X-Forwarded-Encrypted: i=1; AKwUvBxguswMObXlUzO8uQoc8VKZFeLqYPhqeunc/qmH/P/2+5ehX4wxzbBzYvq8Ig1d59EqCqSk3ufn1yGKaE0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KEPHqL0Pggue2tfNeuBR3fBQzLJmNs993BaVhE68rIVceYXKA
	aYVYVShh6SmNxEbcT7tp7YXRlGonFCg9X0e44mvevWCbZcCJdGYO8LIg4G6dcAHG3tE=
X-Gm-Gg: AYBFou0g8/gl1Bee+zeuMFHY/U634JyS0hPc6AHxorJED8qIiV1M7tcJbQ70YIGbVTc
	EMdAOdAthuruaI8CP4+KfDTNIWQp0qt7jR/HhoK3ccAp2E6DkX70u6AxuegW0GRVQPGzu/Q3K8e
	TueVHeReJTVW1fb41mlp1T3373IZvNi7hR17Uu1tP2EM4xEINSsHJSLOj9a7D5h14udhcTzcaeh
	qGly7STg7LHgimWimcqX0CPTKexsl+8xjVNV60re1Ad9tC2vtF1qN8hUTVDSVlef04MIiicI554
	+UA8x969yXOcICxyL9AZ2iGSikoo69avbXcwsuOsg3sTXpg4U6ZIy03oZURBVA1kbmdfCL0697n
	Shn7eREKYdchCfvMh2kjcIWDEb+6oHJrbEYRTM+GOuqkMJDGJYbjwufQsLrEGqKQ8EukcIYVVdD
	9mJIWt/9e9/31B5+XkCVsgLM0MdEHr8Wu418uBibm0niAC3u7WMfSfnSRr+1evTXGSeebIF61Xc
	NjROMmzIiAi6FKCkcvYcrosJMfmNsCam+MW+8klBcOsvMzFOWU8QgaGcsgo+zfuk30jvqaDf+au
	9YmK3539wPlNS9eJGfbc3VnoXShEcfnCAftYV2uzLPtC3+irugGboZ+SxHpKCO/CoC0PZxzANzf
	NhzoDDqQeKzK3Fk4PxU7/fKweEk4xTn0DiWMxt8lR+c729GNMU3IjfPSco1jkl9oZL/62ddzFpB
	8=
X-Received: by 2002:a17:90b:4a83:b0:3ac:8af9:4a73 with SMTP id 98e67ed59e1d1-3ae89747a06mr12116049a91.28.1793793645910;
        Wed, 04 Nov 2026 04:00:45 -0800 (PST)
Received: from localhost.localdomain ([58.224.60.243])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b093d481a3sm3835932a91.1.2026.11.04.04.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:00:45 -0800 (PST)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: brgl@kernel.org
Cc: linusw@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] gpiolib: reset lookup flags for each hogged line
Date: Wed,  4 Nov 2026 20:59:38 +0900
Message-ID: <20261104115938.226-1-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.42.0.windows.2
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

gpiochip_add_hog() initializes lflags once before iterating over the GPIO
specifiers. In the non-OF path, an active-low line sets GPIO_ACTIVE_LOW,
but a later active-high line does not clear it. A single firmware hog
with mixed polarities therefore configures later active-high lines as
active-low, including inverting their initial output value.

Initialize the lookup flags for each line before translating its flags.
The OF helper already overwrites the flags for each specifier; the
non-OF path must also start with a fresh value.

Codex assisted with identifying the issue and developing the fix.

Fixes: 802c51a83e9a ("gpiolib: fix hogs with multiple lines")
Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
Changes in v2:
- Split the functional fix from its KUnit regression test as requested.
- Keep only the lookup-flag reset in gpiolib.c for gpio/for-current.
- Move build/runtime details out of the permanent commit message.

Target: brgl/linux gpio/for-current at c2d0710318b8cd57d0ef6088d0ee4bbc1e827fd3.
The KUnit test is sent separately for the v7.5 development cycle.

Testing on this target: actual UML/KUnit, before 8 pass / 1 fail;
after 9 pass / 0 fail, with the same config and test source.
GCC W=1 and Clang W=1/private Sparse C=2 builds completed.
No physical GPIO or runtime OF hardware validation was performed.

Previous version: https://lore.kernel.org/linux-gpio/20261103224339.1180-1-kimjinseob88@gmail.com/
Review: https://lore.kernel.org/linux-gpio/qboynvhfmvltsuopwotpf3sqdwho3qobxmw5qldooedjqodfgy@x4l6hscj5unx/

 drivers/gpio/gpiolib.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index fbdeda2f2..db613770d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -975,7 +975,6 @@ int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
 	 */
 	u32 cells = 2;
 
-	lflags = GPIO_LOOKUP_FLAGS_DEFAULT;
 	dflags = GPIOD_ASIS;
 	name = NULL;
 
@@ -1014,6 +1013,8 @@ int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
 	fwnode_property_read_string(fwnode, "line-name", &name);
 
 	for (unsigned int i = 0; i < num_hogs; i++) {
+		lflags = GPIO_LOOKUP_FLAGS_DEFAULT;
+
 		if (is_of_node(fwnode)) {
 			/*
 			 * OF-nodes need some additional special handling for

base-commit: c2d0710318b8cd57d0ef6088d0ee4bbc1e827fd3
