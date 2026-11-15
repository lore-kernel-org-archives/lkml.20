Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733538;
	b=wTseRllQzyXtNr7/aourF473XLuzE0gC7r0WHIc39VySLN7+8TvfoJmIdiHdjyZg2Agq
	 7Zssj7SCzNEquAps6x8vxnfeoerPHgUt1pGInCI/WQ43a4Y4Yo81+0+aHguNDXJgo8gkj
	 Uu2C91klWmo8dC1/oYcyQw5HE9urD7gRKwR+t0zJNsVaPbcMxehsJrP/ocGJ5vohZYnU5
	 ZnoyIh22SyF1CJjj5eXEY2TW3zxSpn36l34CbXSDHGujUZzWc+AnGc9pwZ1ND5PvPqwVE
	 ZeL2ZWM0sH0FskaHPnyaboanEZQdnFJ1GF7t9JQoot+sclGAZOk4EzlXy+XO/si4Dhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3VGERR6jVyCku7AFWTdZ88nDE2sfH6pB8YTCSrSJIH0=;
	b=e+xuQsKuasAN2CWKPyLkYlMXcDV511FzYe8tKDI0Aib6nDZoUi7+6DhuWNQT92lPisSa
	 CVl72gTd6dA2Gnr1SQbUug7Uz8Ryc8Jxh8JGwsrXcWx7PJU9kwR/pd7rgNvKYZiTExQ5f
	 9W6aFy37qoZAKAaN9ub1kzNl2O+B5cTMAmKx6aMFtK2Ll55OvBHj+tcV+405eJcTJx8GJ
	 04e4Mz7zQAv8XJXHjOblsla5frJh3yPAwmi3LpNoHkJn+akUMx1qZm84Zy7xXyKWc+VYS
	 z1rW6SGKavr2lXwylTOQV3hiHXQRflQs78fqiZZ5cuJ/6lFQfnERNH1IISreU/SGs6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n+VIalj0;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88ED606A8A7
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B88ED606A8A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n+VIalj0
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4d473cfff6so343106766b.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733536; x=1795338336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3VGERR6jVyCku7AFWTdZ88nDE2sfH6pB8YTCSrSJIH0=;
        b=n+VIalj0TasjhIfTTf5UY2D+tyfAVqLrVCiWdkKqppita1mkmg/p5t7LxJc1e4ehdN
         Ls3s9M69wPhAeB9pqo1RvAEflRLqORiTs4xlj4z6AX9I3Ompp77/hm0e+tof/H4Qt1dh
         aumUrir8j8VfgnZiMfGY9n9+/jZuL90k0flDnv+UgD2uF4OHYkKg+265ZibJ6QZiprkC
         FhGFfdgMFJ6U46rbjUqhj0JyLEOda5rmqwmhO7IjSGvKJX8hZGTrXuD94Eo/zdxg1OxA
         OhAcHAo/eBd1UHq96f6W8tA28A0bs+WFfve8QxaznXc0CHXY2uomeAT0Upahrqu7uQZo
         H6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733536; x=1795338336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3VGERR6jVyCku7AFWTdZ88nDE2sfH6pB8YTCSrSJIH0=;
        b=oIxiEkX4En8yvUJVRa1ZepWvJiUlj/I1Fx0iyYBxE1tUpawoHvpn+wMhLculIXopoV
         roEmL807jNIqH+q4M5BRXCyUgg1y1lJkRe2k/5QUGGGrCr0ld7wUFZOjNJ33zvW4vhMg
         We8QR1yvno/s69YNZdLQQIxwfYqrxGhg1G2J1PzUQJQlcewfjln5CaiNEid40udeZYMx
         a2IpluUBhsZJXy2jCMa++Kbu0hmpLJHNo9HG0oRJyTE24Sfs5IC2EX2LXC14+NAf/yqE
         3nQHNlS6RMl+72DSvX9cxmB0LqApeGYO6w8eCZBvgi4nNNGrPQhBBSd+XJCZkDH7SOKz
         SP1w==
X-Gm-Message-State: APuU4Z9EbQptdc5ZXQCKxr382+UyudzdgnpYt7Co267tHPdYJADTcxn3
	gcO2dl6zOZjFMH5iHaLK02R7K04cW4T1XTUvjTbPnh7Ab4/W2Q2OgWlP
X-Gm-Gg: AYBFou3BODfXi+TW2EVpeS+p/8OtSBpABDj2qvR68rck/jCN6wS1TBjg0q9zOLsktzw
	GP/sUpG2OI6m+AUcx728xiMnvwusZcg5mQxwAgpp1BtIxyT4iCh0AqI5XpmqaUSvW+u81JuIVax
	vk4X5HhByn5usXCkDBYSrXLg82edsCNDFyX5eRbVurFSxVbMCFmV7qKF7gUQJ2G/Kj0MEvAgTje
	S+kZooMJvHSrfth//ZY5Yh6yFXJAF87w1Tu1aVzpBj+6nvFDcOjuXgWwh0FS05bl3bhfi6jnYix
	/EtHDyLCiH+0TTkhXzJcaU0/hBBhcxQ/pOqF+Sfj6q/NftFG2k6oVIaYik2G4ZNqlrhciKhcH4S
	RgaVYFQQ0+9x4VLwSkhOVGEDDZu+qTk3m/j6q0jocgvXlBwYRnbNhL+7LtR9MS+oKF9axSgtODs
	5e4LMV0WC1R+YcFJLUNEnag9pngdCv7nCL15saszkxfYG/0Ukni+Vo4bpnDqNLMOAUjWcskJt+o
	i9ehG0OZBfew58ymUQE6OslZd7b8Oh2BN3wBIz6iIXB57ljSXA9nOU54Ok7qvJlPZMbG1MqMV8a
	WV5Z50T9kYFK83133sbdnbGB7yx3RVrRJqUk3602MKmWnW8h6Xnvec215+14mayEpvnaZSi821S
	ZPHzyEqvOvg==
X-Received: by 2002:a17:907:6d02:b0:c46:9ca9:f524 with SMTP id a640c23a62f3a-c50963b6917mr589522666b.32.1794733536111;
        Sun, 15 Nov 2026 01:05:36 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm288103466b.1.2026.11.15.01.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:05:35 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v6 3/3] mfd: max8907: Add LED cell
Date: Sun, 15 Nov 2026 11:05:20 +0200
Message-ID: <20261115090520.102216-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115090520.102216-1-clamor95@gmail.com>
References: <20261115090520.102216-1-clamor95@gmail.com>
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

Add the LED cell name to the list of MAX8907 cells.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index b57c497334ea6..f492ade8e4cf1 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -20,6 +20,7 @@
 #include <linux/slab.h>
 
 static const struct mfd_cell max8907_cells[] = {
+	{ .name = "max8907-leds", },
 	{ .name = "max8907-regulator", },
 	{ .name = "max8907-rtc", },
 };
-- 
2.53.0

