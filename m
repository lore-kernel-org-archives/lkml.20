Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62324DC551
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286426; cv=none; b=pHDnXVhjbh6oYtJa2ANnbeAhCsOdGAHlVaqdvta56lLtqoKg+86CO3aSHC5Sr/Sj+y0A/US3uN4nlb7gCnVeOkLUvpuQLgDb1Pg9vcwd26oNjp/1ZvSaRFs05MrBb6n3oOfYsIWmR83z8TsxEI3CSP8LnbOsYodTDce0TGtZ9nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286426; c=relaxed/simple;
	bh=sJB8a2Uid+eUS/2yZz14rm+h24VJn2Vq54W8G0uPAe4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LRwXfbFuoy2E5lnxbX3bJY3bemy961yHJZGH0v9o+Vi8I+b/kvs+KInwyI7CfuYttCF9T+1Is5B8UhVcaWLCqe6R8zS7tX9AZTc21wwfL5MYxIYt/8g/Gt5stP1uNkGUN4KYkMrVMDo41agVFVHnSwqbakeX8Ayl1Q8Ayf0Drz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qh2UR+x5; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qh2UR+x5"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-1450541ab50so140280c88.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790286424; x=1790891224; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vmbHwdbLykki4BBoXNNKdYpZGlaAV7d37IywwLOJY5w=;
        b=Qh2UR+x5m/X4zSjGTGkjLEAzXh7blP+yv5NC8iaE59/fOuLmKYAj50+YCa5mWeghAW
         Y9lQV3xNhbJk0iW5A6clsA7/ePLmPnepinKo8Z9vWJ+2vq7QRMPlmwsRYGIdqPxD4SQj
         Fnn25jwqDCN/vn8I91wUeMYr6JMhxIRlnVPzQ0plLWjzg7Kp9dKSj4MHY9+4TYCfDeQg
         o8Y7kD1/CP3+kaNPljiZflKCF1JBDGpHaIxFZgkDwVjg8dlOYq3IsLJ25XGPo+GHZUqf
         SupBVE+aq1/+BJte3J65BDBcEA3lhwXvOd+nXevBvvajhla55/RruF3U/tOVv0X0jHuN
         g6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790286424; x=1790891224;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vmbHwdbLykki4BBoXNNKdYpZGlaAV7d37IywwLOJY5w=;
        b=Cya0NgSDVC5W7Ubb79fGhsvvqm1GwOQpV26CMqZUvwbBhw16XpJUlQIHrJtBVeCBwc
         IWE2fIGjuGTBuMN1e2T07+uBPG8Yq1WWEyQ/Yhsi8Hk4NsuMF4Wxv0zpTIcT2qJ6BnKf
         o0TKv3oeTJG/ZGN35sjkNys7lsg4PS8kXqa1LINM/d6FifNBNmKme9kF1DR55eGdbHSZ
         ERqPEZ+8BN22e/VdsvBK9J9eVOfBzLqMdR7OgE5usied2vp1RKY29Q1wkhJQZkXm1+Hw
         np6e/78cpibWOBXauIDhiaMtDtNzsXPQB8ngWMFYl+DffBVodIaWWtnPJ3PY9qLBtGWr
         2crw==
X-Forwarded-Encrypted: i=1; AKwUvBwBKSj6PN7z4SN0rY8OHx4iaXDabhyAd9Cm+Om9x4nefTVRYtIBSynl3QiRhAwC79up8dMlH9zr+h+rupE=@vger.kernel.org
X-Gm-Message-State: AFuF++k1GtdlSyz37DxkifQc41juXjZU481OW+EKrV97R1fKL9rDQ3ya
	Oriy5CYYZdv5M0qr13q0zo9NFrGetuXkTPmmG+mZqDaFWjzisTrTu7I=
X-Gm-Gg: AYBFou3G07LNDEj5KTW1bxXVHQ83Rx3MxZM5SjZ0fB7cLtlhqcvKvM8j6AE7sIj3mB7
	KBfdQ1n2ee6eYD32akgUw7ABps00yBrVoZOWB79JrZ+jXI+jvnUHghePIq3syCK98U0ZsSjjVjT
	8V+WLFiUM5wJNbGxDqAnQDkuHzalkb1j0Z+5M4hik9WL/hVxgdD7F53lglSLjDacavrKu3NBgIK
	ZtkiaU6D5FtydblYCn3CgpMsqOzg7tnBrwH4pG2YtGDpqPfACjq0If1THtuG59ztA9TndI03VmU
	T/RfqMBd4PtyvOgwwp9R1WtDEVZnBgqCqkR6cUsZGK8wFBS2/SYjrdJzHyxsLyPSpzgQzI2hhdG
	V4SKi0TpI7uzRLSXatkZhgqYc79KWx+5T6OWby4RvE01lb72IpQlg/hUxTlqOa1wVR3h8c3JS5R
	IE4FIP35246JeZH6+j10OVFJriI51lKKOYKzKNYciWhGfQzZEdZo6xZ7lFe5U/dnTAVAbUJ8jeU
	a48cC15Ob1EkOyCVRtLmqa+jhtS5DgSLKEULOFMRY7vEqjy0g==
X-Received: by 2002:a05:7022:3b0c:b0:143:761a:863e with SMTP id a92af1059eb24-145040d406amr4150298c88.44.1790286423822;
        Thu, 24 Sep 2026 14:47:03 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc45f03sm1171577c88.7.2026.09.24.14.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 14:47:03 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: nico.antinori.7@gmail.com,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: christophe.jaillet@wanadoo.fr,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	jkoolstra@xs4all.nl,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	skhan@linuxfoundation.org
Subject: [PATCH] fixup: remove uninitialized variable bl
Date: Thu, 24 Sep 2026 18:45:57 -0300
Message-ID: <20260924214640.6149-1-nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <29b7f9786f08989c8f941ab85a76c62d1f5ee43b.1790200427.git.nico.antinori.7@gmail.com>
References: <29b7f9786f08989c8f941ab85a76c62d1f5ee43b.1790200427.git.nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove the uninitialized variable bl and fix the IS_ERR check.

Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
Small follow-up patch that fixes usage of unintialized variable.

Apologies for this oversight!

 drivers/gpu/drm/tiny/ch1115-i2c.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tiny/ch1115-i2c.c b/drivers/gpu/drm/tiny/ch1115-i2c.c
index cb6198a8e55b..631dd25e7dcc 100644
--- a/drivers/gpu/drm/tiny/ch1115-i2c.c
+++ b/drivers/gpu/drm/tiny/ch1115-i2c.c
@@ -751,7 +751,6 @@ static int ch1115_probe(struct i2c_client *client)
 {
 	struct ch1115_device *ch1115;
 	struct device *dev;
-	struct backlight_device *bl;
 	int ret;

 	dev = &client->dev;
@@ -802,8 +801,8 @@ static int ch1115_probe(struct i2c_client *client)

 	ch1115->bl_dev = devm_backlight_device_register(dev, dev_name(dev), dev, ch1115,
 							&ch1115_bl_ops, &bl_props);
-	if (IS_ERR(bl))
-		return dev_err_probe(dev, PTR_ERR(bl),
+	if (IS_ERR(ch1115->bl_dev))
+		return dev_err_probe(dev, PTR_ERR(ch1115->bl_dev),
 				     "Unable to register backlight device\n");

 	// DRM
--
2.47.3

