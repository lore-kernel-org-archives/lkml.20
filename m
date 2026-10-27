Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793060963;
	b=MnGUvOCDfvuR6Qw54z+QzJQwSKgTTFnekKbiDVZBrQEI+jLfzCiZeOVowb9TPo1F4zfv
	 tkJh+EwQlR2CwUsRWNL1TB+Fre9X8ERbw5gF0FHQNg4KWTTDZHNZncYVP5QAbKb/2YWpD
	 CraZCMg5Vqrq3qYeiKFIkG2g24SLC6JObVEif9qDaQTQLyJ6mh/e+Akc25b2XM77XtLxo
	 x+mza2BSPPEYwi5nP/Fz2sYSY9h2J/Abf9lFH8yPMzf2llMmG0gC/MClkPaZA+N4X6Qo4
	 qM+ZG/SvrjS+H0f1gRT6eAH+9S7Ynj3Qu959SKOt67pPfxZJLvtkzfsAw59JifRkKxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793060963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oxACkjXTSKzxgM0GX6iNXbhJe3SlZ06HmpJL0C117t0=;
	b=ek0Cqke0iVPawPD9chGn15sv1awZW5M3tRx8HjsmvyfCfkfVtPx0leut3KZmXyXyvt/P
	 YnothZnG58o0dgxaKn/IALZJlojqMbR+lUFvhYKYXEg8gFrB6rI0yUH2FcQ4RahogeEpt
	 R2MxV5b3V3mWGqVnr+RntusGgQ/toYmoaBGWNRuw1LHr/piPPUAP3YYAE6d3jvDelZKgE
	 7oblahGj1l5Cmkt4wpjod0zvjNGQDo4sqYi5lyIbef8mYhEpH2OdL1h8IejAOf61CoOnk
	 wmdHH20QeFEkOzgFU9Wck1wPT3tqXB6H6T+JAmQhlr7+vB64aBclW8937mJ/qQxhuww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jTETyL7V;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF60606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECF60606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jTETyL7V
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so17371055e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793060961; x=1793665761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oxACkjXTSKzxgM0GX6iNXbhJe3SlZ06HmpJL0C117t0=;
        b=jTETyL7VabdKXBRrEOFKN/ABp39W/K4e3YSrvrX9Y98eVsLdhDCj6It754zG1fRdF0
         lN0YNCGtXd7I3CQF7Z/Ugf3OGrmSMBhBVnZn5+51Lo9NiXlM6nIq2+e2JVSm2thzsF7n
         Uk7VOumLDxDYHnRdsuIjGTpCR3yRnhlMjndJUa0gRe6KaIZko28EeWLYWhFd30hwNsZe
         VDlCXhrIbzESnd+u4atAWQQc0K5CIfCAWOc4dTF4U0suvdJPnoceQlddPwpC8i5xiaTy
         4sEUuL4crUFjqpzu5GQSkdJLaxJMfRsmCLuyoailhFwkwEZhZHGqsmJaSLmO8iy6a1LI
         DdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793060961; x=1793665761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oxACkjXTSKzxgM0GX6iNXbhJe3SlZ06HmpJL0C117t0=;
        b=H7VZTDE5i/upUarV/95Wontn88yV5X6XOQPS8iyxeQggbUWP0VCNvj4Rd9pBPpEi7G
         o9fjTrtx/+qLvjnmuoOKWJjSSYibqSXKooJo4aYDKio/RhIV4lYgvsjeJNjKQOyfK2ss
         WxKMIFGQ6qIXTwuFlCSafkVOstxCesjLkNKsh1+0oishFAG41C5Jg0VmHd9oiIY7F7Nx
         mJXjrCsVSofBoU6BrdRrjhbylKS50E8PGGTo2J2UC5lJhlF5Cl5kFFY6pT3PrF8P7BGK
         2lmHsxaQcetnK0FMsEev64sM1sGT48HmHsxGiH8VS3bfhguYhB17QQgvCwliEhjnKPjk
         Qrfw==
X-Forwarded-Encrypted: i=1; AKwUvBxjQZWEvYV5cax2s27mhECMGWXkxf76TC0t2hgs6v3yQYge6KjlQ7FbY4XJSW69YLHpSARU1ppSbcqwKZI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEeCGm3MebEJjNTvoU0h+klTgnk4miHDeKugxni7Nhzwg0KmRc
	wMzKwXjaW+qYHzdYAt3UuMULtoecI052Vmo5Cikx03UVs6zEB8gFX8E=
X-Gm-Gg: AYBFou0rhTBavN3TkmO+7568Y07MtK7ge1VdMeb4Lb+azIcqE/1t54oDGdtve2IoFDa
	P8nvX2QEMTKdowoWQ7d4o+AVSRbLOC+aEojUqlpcweNf+GpKoOsmZDJnIPdTEeK96HkBram9swr
	wAFdgAIKhzdkbPWilMA/g2UaElJ18EFn0SIAFDRouAmDMiD6aSfM9QlIztP2miOZvy8Gard8mHP
	4VzpKnZfAxE6bcBybfdpakD9pWIqmAOL5unk3CG1qqEL4KHDK8J7HTF/SgRgI8rzQob679QxrD+
	I9Y1Ow0oeNv4q6PcTDNlBhZJYKs+Il5cn67rMlgcjSX0HPpH5hjCRYbDE1nWHo8m1Jsp+smWT9Y
	sOgQflE56/sKuoXkjBs6CjuLDuV19HtpeeO7XZJ9mT+O1FSsZ7w0z7TZyXcI6T6z/AhYB2KO+v/
	VQzAGzFNWmGsD3AFuVZz+JndKpZAyj/jrabfUgZyVfvNoPm16x5YRZunyztys379p+qGxBluxFp
	qsbfB6eSyfoNs8Z3JfNTcZMLCLvuZ8QSpzU2Q==
X-Received: by 2002:a05:600c:8488:b0:4a1:e0d5:293e with SMTP id 5b1f17b1804b1-4a35aca1366mr145088605e9.21.1793060961143;
        Mon, 26 Oct 2026 17:29:21 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a5ea0df763sm142804565e9.3.2026.10.26.17.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 17:29:20 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	tristan@talencesecurity.com
Subject: [PATCH] Input: applespi - validate ACPI property buffer length
Date: Tue, 27 Oct 2026 00:29:19 +0000
Message-ID: <20261027002919.3589149-1-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
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

applespi_get_spi_settings() reads three ACPI _DSD properties
(spiCSDelay, resetA2RUsec, resetRecUsec) as u64 values from their
buffer pointers without verifying that the buffer is at least 8
bytes long.  If a firmware implementation provides a shorter buffer,
the u64 dereference reads beyond the allocated object.

Add buffer length checks before each u64 dereference.

Fixes: 038b1a05eae6 ("Input: add Apple SPI keyboard and trackpad driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/input/keyboard/applespi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/input/keyboard/applespi.c b/drivers/input/keyboard/applespi.c
index b5ff71cd5a701..25910786a6c45 100644
--- a/drivers/input/keyboard/applespi.c
+++ b/drivers/input/keyboard/applespi.c
@@ -642,19 +642,22 @@ static int applespi_get_spi_settings(struct applespi_data *applespi)
 	const union acpi_object *o;
 	struct spi_settings *settings = &applespi->spi_settings;
 
-	if (!acpi_dev_get_property(adev, "spiCSDelay", ACPI_TYPE_BUFFER, &o))
+	if (!acpi_dev_get_property(adev, "spiCSDelay", ACPI_TYPE_BUFFER, &o) &&
+	    o->buffer.length >= sizeof(u64))
 		settings->spi_cs_delay = *(u64 *)o->buffer.pointer;
 	else
 		dev_warn(&applespi->spi->dev,
 			 "Property spiCSDelay not found\n");
 
-	if (!acpi_dev_get_property(adev, "resetA2RUsec", ACPI_TYPE_BUFFER, &o))
+	if (!acpi_dev_get_property(adev, "resetA2RUsec", ACPI_TYPE_BUFFER, &o) &&
+	    o->buffer.length >= sizeof(u64))
 		settings->reset_a2r_usec = *(u64 *)o->buffer.pointer;
 	else
 		dev_warn(&applespi->spi->dev,
 			 "Property resetA2RUsec not found\n");
 
-	if (!acpi_dev_get_property(adev, "resetRecUsec", ACPI_TYPE_BUFFER, &o))
+	if (!acpi_dev_get_property(adev, "resetRecUsec", ACPI_TYPE_BUFFER, &o) &&
+	    o->buffer.length >= sizeof(u64))
 		settings->reset_rec_usec = *(u64 *)o->buffer.pointer;
 	else
 		dev_warn(&applespi->spi->dev,
-- 
2.47.3

