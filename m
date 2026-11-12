Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466283;
	b=LKAYzT6OZub0pkyw4OqomiHcWnzqAm1FbEZOjs/HMX1FjiB3TLYFcLg/APBquTv7g/Am
	 KgbbgrQBqOpert6fzXcRb5mAc7qM3c7BBo37N6HTP/n/JF97MQV+2Ry5fYG96QEbRis0S
	 DRf9njjJo/XDTFL/Xg53p3QBxFcS9W2RW1+7KZ4bfU1TGrTyCL348XmoKXbihjW5yuoGF
	 IpDBSBSw/eMT1EHzrngyRZFNYyG6essalBpAeecW2CnAtbdW1aUqDASJPentspx8401on
	 bYOcw5YV6RNl5XvVqPLykMsDigwSwMXPCf+5zsSYdNTaG+rBp/IU3/gWvwRncbwsX9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=S6vHQHJISvLttOPVGmxf1RIVPLKenvgKFyjyMf1hrow=;
	b=FIDYQKLIzi/8ZCLoZehDEfor4stb37iTpKFjO0PoiGb5g4sBQgnhGEhUH+TcjaXKApur
	 yzI45A8fZXwo5E1mNIDFpHCqR38CCeL3qrnNxOxmFP3B7kZnZy+XCGBo0OxvvC/JcVQB+
	 qbhKOO33yNpXnEeStotzwh6jj4NuKHxk7cX7I5+g94B+wehAkhqKig1orJUdnvn0U7/m8
	 YJutIDNiXWK/ObU3eEykx5Kqxg0nBYUKb3gstz9+4POHYcU4MddszNErNOqjzQbo+RFHH
	 U6Lnz50u3ba2hdobZg8UnkWOx8mnoIGLsxacBAFKiZq+ifwSSjwdi6QnDgUQ3p//niQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="L9o/XV7a";
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E523C60A3839
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:51:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E523C60A3839
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L9o/XV7a
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3720addb068so7040909eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466282; x=1795071082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S6vHQHJISvLttOPVGmxf1RIVPLKenvgKFyjyMf1hrow=;
        b=L9o/XV7aP/sRDlIO4NymG0vbdEhk/qY2z2okt0Ybn/kuQZmIuPEC9cPaGxuM7HxnQO
         +48CPWG5n8OcpG/7GHR5YehtxW0eNIW5qbSGB6FMOeQXR1yTDaUAFguyFrFBi1/FiBzA
         QMhYd+Yl9ZAekrl0p9qELxxnYpy05qnq+uWwK2gBAxJ9j4kiXSAYxy+Wo07v9J2p2Nwn
         iNBBvygKSVV2Ej7iHNou9RLIgELFxA6a3feApnhZMBfFa/Vas0G3TnGtj+4Be3HdoR1/
         WYX+q8kUUjit5Mlt5iLML0bT+WQt7bqCsiNGGGEluImYbtUtoCtVDKREy/tAfJq8jqIW
         V9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466282; x=1795071082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S6vHQHJISvLttOPVGmxf1RIVPLKenvgKFyjyMf1hrow=;
        b=DVopeMLWUvtyNGZ+a2wmTPBvTS8Wlo42SDcQixZREdXiQGWj+U4OK+0pi1FqT5wpO7
         2Dkt6rjMiFzN92L1F201pFJXyobLKU8/Laj6qT8ZnY0WqiLBJALjd/mZkMykDTwTecSY
         AB7+6L1O8QBq2pdBXRbzdbG69jPaQF7jEzllR9OM87JISLhjsqIeWFZZsjI8PJrm2hnY
         8U3ReN9gKHqffFN05VC5ZgZq+wlXSENmYSZyVH30+wQucfbVD6AYHnWBE0lmS/FbjCzb
         BR6myn07dRFADDLP12txJIIKr3NOnKlxBfFGUoqwWr4SS3JDBl67dooNI2khcEa4eIWx
         o2zw==
X-Forwarded-Encrypted: i=1; AL+hErHWsl25W2k1SvSXcsrwuWkc74DpbpFFFwMruFgTDQ3w0f50+JWG7MnipoPrSVy3bNUVzeSEVKJZRniBx+I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kuWNF75yOhVconc32KeOHoYJHMUjhJkU/CEjuRv3yGUfVsF0b
	GnutoScTnBFQ3EE6hmcqvSOMXxx4T66Ahq+QhSoKep67hOmwEIRHTexj
X-Gm-Gg: AYBFou3OOBARSretTHfqNU71WHZTHO8OH3+Hks3vjSI+Ne6jhHLEcR5UAWkAmI6NAuV
	9iSTJedvzEg5gZttvcIu0LLPmo963urNvIn3fGj7HvJMRJkHG32d0oLxSsCi+b+7tcz27GM22xL
	o8oE4quqMGu1tfbey9OPAsuKjgqfBjit2TfEDwxi8mKPkNo7sED0yndjXUUY0QJSm8oRQTk98bS
	IN2Y7G0uP6i/Jtc6IbIJD3ko+djgcpl4wBS9K44hvCx5Urc2WT5Nq6UYt4Q9FIvzHy1ZF1flrOU
	8T+76wnMqyFYNZ2siYboujIFzQp8Kd7fzLMCN3uZ2/DSETAFE2OGdkT/WCsWWLEsD3ZCfMSgrNG
	6c4lWHX3YEmz6DlLd2ApqEeSxjygEdjq/viCVGXHwc/s5vcg7oR/rgBQ0BZE3m3SDPBXLdzeBSJ
	Xdt0QAeoczcTKwp7sZsbba5kJzDcXcAozwnEUCMjHZKLPQ/8yH+YmMRpzoGuEdcKKIfcwK59Yv4
	y0Rw4WaxutOXQOf9CBawNHJtM56PfK8PFRjpPotKHEaOlyLMhuniZQYxtkUecbhy38f/nHMNlxu
	1C0rviw5wtPQL6GsCjCSIydQ7Cahm1xuN1Hbdgkrvw4pqPIYedZPZF2+hK+A73KfgNvh6W4GmTu
	kQIq3FIlbURz2RS56
X-Received: by 2002:a05:7301:d810:b0:376:5b99:a7e3 with SMTP id 5a478bee46e88-3768327e817mr4203057eec.3.1794466281758;
        Wed, 11 Nov 2026 22:51:21 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:182d:659:ffce:39a4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375215d8889sm24547205eec.27.2026.11.11.22.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:51:21 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jaewon Kim <jaewon02.kim@samsung.com>,
	Hyunhee Kim <hyunhee.kim@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Pankaj Dubey <pankaj.dubey@samsung.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] Input: regulator-haptic - fix coding style issues
Date: Wed, 11 Nov 2026 22:51:15 -0800
Message-ID: <20261112065115.1803973-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <20261112065115.1803973-1-dmitry.torokhov@gmail.com>
References: <20261112065115.1803973-1-dmitry.torokhov@gmail.com>
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

Fix minor coding style issues across the driver: add a comment
explaining mutex purpose, drop an unnecessary blank line after an open
brace, align function arguments with the open parenthesis, fix
whitespace in conditional checks, and use a space instead of a tab in
a return statement.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/misc/regulator-haptic.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/input/misc/regulator-haptic.c b/drivers/input/misc/regulator-haptic.c
index d99f716ef44b..4ede90195366 100644
--- a/drivers/input/misc/regulator-haptic.c
+++ b/drivers/input/misc/regulator-haptic.c
@@ -23,7 +23,7 @@ struct regulator_haptic {
 	struct regulator *regulator;
 
 	struct work_struct work;
-	struct mutex mutex;
+	struct mutex mutex; /* serializes voltage updates and suspend/resume */
 
 	bool active;
 	bool suspended;
@@ -38,7 +38,6 @@ static int regulator_haptic_toggle(struct regulator_haptic *haptic, bool on)
 	int error;
 
 	if (haptic->active != on) {
-
 		error = on ? regulator_enable(haptic->regulator) :
 			     regulator_disable(haptic->regulator);
 		if (error) {
@@ -55,7 +54,7 @@ static int regulator_haptic_toggle(struct regulator_haptic *haptic, bool on)
 }
 
 static int regulator_haptic_set_voltage(struct regulator_haptic *haptic,
-					 unsigned int magnitude)
+					unsigned int magnitude)
 {
 	u64 volt_mag_multi;
 	unsigned int intensity;
@@ -118,7 +117,7 @@ static int regulator_haptic_parse_dt(struct device *dev,
 	int error;
 
 	node = dev->of_node;
-	if(!node) {
+	if (!node) {
 		dev_err(dev, "Missing device tree data\n");
 		return -EINVAL;
 	}
@@ -165,7 +164,7 @@ static int regulator_haptic_probe(struct platform_device *pdev)
 
 	input_dev = devm_input_allocate_device(&pdev->dev);
 	if (!input_dev)
-		return	-ENOMEM;
+		return -ENOMEM;
 
 	haptic->input_dev = input_dev;
 	haptic->input_dev->name = "regulator-haptic";
-- 
2.56.0.567.gdb80ae8cd5-goog

