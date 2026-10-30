Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793324387;
	b=LtBOvKGsw8Wt4uyAhxNacfCHL93CNA7FhCT3Kr0cXzZco4ZSUJ3ljcC/Kh/C6r9G1sFI
	 VbDGKUeihsRvPM2aRlSkdpl03eOcsdBk7kLw3NHKppFaf7DiV+xK/YmkP4jJMqogWEDk+
	 P7qh1VSc99jogAss3Bj2E29CLAvFh5deUZ2dGyGlqYCPsaR7Y1AVZ5bKRdQtOJGvza4PI
	 /3ofd13Pgjz8Da5XJxDwe7fusYS+b0dSFE5RKwClhaRJNu7Jg5s+87R3kzTqLhq7rWrwQ
	 /Ua7Zm0Id/UlFyymiOpmweB9TrwCAaNM93bwkXK2pZiuu454S0zsrnpz24m32eLc1/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793324387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=skxcpPsBeTV6ryw50kturftxInkxS+Kf6PxuE2pqHOk=;
	b=kZieo3QhEve1161fFgtDoVxnHmn9V2KfiF/k+VOR7btRDJdi3hHDxGRmC5BVvxopt0dz
	 52Og/uOhxuAuSR4BZAFVRfH9LgVN6OWpz0uv6PPJJCyomGkFMzUMnZvuija1lX9vZGbYl
	 O0xTZ2yffiqDZM52kcZ1W5TLJhDWinChvPGriLWdglcZtFy7wwtlkzpKgumuCrw1890CA
	 ByvUG3gCTGCswjShRoRStV0vdX9uHGuK4h6JFE2SZhXt/5aVFEmKEEXkxPvg4mB8oBNba
	 u1DY0fhfezL6XDs98h7++ti02g/PcwS/U3HIvN5p4+IV0j4A6+7kJ7fEhbvqirtT1kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xweoJmGd;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FABB606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:39:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FABB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xweoJmGd
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3514b90bb89so478951eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793324386; x=1793929186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=skxcpPsBeTV6ryw50kturftxInkxS+Kf6PxuE2pqHOk=;
        b=xweoJmGdu90CB8eP6J3RyMpLDHXOxQgOqBakF0y8/Ha12qCltrdngB1kBhfDF5NSn+
         L10eMX+fQGaoFfl/4ZJN4rNl6Tcu2XG6c1im60xqkiuqRXuhWK0y6cxWu5Oxa1hxlIqj
         A4OEkOlhVYmpttwuorY0ugQ3oqQn/jEMRhp+huXvc/dI9YXAOn7DE+eGvOtyVx2eGOe2
         3LTl1CqQMAi/tcYL7Ve3x2yKtkfMZELh8zxxN379aSlmGO0D8huQoGsUfBACf8EP6sG8
         //0MCKLOk+AL/+LU4GDlIkCMXKPa1cHE6AIPHZ7G3n+IpkXJ90cYFggEGcs8LpBKGQ9w
         A8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793324386; x=1793929186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=skxcpPsBeTV6ryw50kturftxInkxS+Kf6PxuE2pqHOk=;
        b=zVniToP4GQsA3aifiR5j/1gYz3SSI3epcqMcroaDbMQgzVSb+GPQGXQ05j14xzoFbR
         VUF2ZtUlqOZe/zhwGM3NVf0kF34k8Bs0B1JN5ja3mQhJnh/nIyL6zG8lqUq+hB8FJqG9
         ZaCj65ZzWGwFiE3AnW2yFbn9tp9dbtTlrVVzVOTtSP9B4bQQKX0Z++8yRQrKEEoHPrfZ
         He6Kfb2AdO/yaW9sIPe0LFEEggbN6oVhyWh3oJgrcYdLjAExMUseYn3iuSwICw1iaqYY
         EFfO9G3vUiU7K1vRhBFSA7rRaTlUY9ysPammiFbcUUf1BxpvejUi2tCXXzWtHzkVEb0y
         LCGA==
X-Forwarded-Encrypted: i=1; AKwUvBwS19wIlXJuXoFjKhyDG4WEr805feOG/1RjJf4p9MyOfBD5D4zhw3nafIoM22yR/SPCnHBpeaZF+it9Jk8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYcqurlPN2/Ms4LlTPmZja/I2qu9FkCTNBeOe+8XJJvsWTQQGP
	xUkmqoSdLisIZtVNiykXe0hUupb6mm5IaOgdtS5GSWzpn6wjOMZUVxkF7zDx8Qk=
X-Gm-Gg: AYBFou1ZzlepXhOnh2cNtTKJ5j7KlIx1jNQvFRLaUVd1OCQQYxU5wV/u72ToFVG1AKV
	yErdOyf+pn7ye8AQgbyNrpzesQ1BqOeVQ+hlVWxonv1PWui5f4Zn77cejzJXhsqDS/HwOv3zoQr
	/btln0AAHlgPOqfJR+RXvPLJsPYWsp/OliTEos8BL+1fEBKtpawq7bqiRThswKcjIXIyabpEeFR
	DAICkRQcok39QZouv/8nadroDQMUsZLddD9FUFVvgO1OKIW7WoSGfwCEvAvEZzwYEbLZ6rwdXJX
	fR2e6Q1tGEjnLlSkbzbMR2ciWUdaZd2Q/y4SmdRD44KDwpk0XLCs3vExJWhLeOz1ny1pqBwv9u2
	Ndu2lRJlu8Lj/OaSFI8uv8U3/HZWpLZoZ2Mda2vEYPBij8EbyCaSjF6P319zQwJf7EcvN+3SXvo
	Z/Uxnmtjwr1XHk3f8FV5mEgVMWQ6exEvm66b+vHesoD5GQMb/fHRyzMMluxWXY/shg+lycgXVP3
	2tcT6IVICkfTMWhbj5LIWWFwwyqZ8ePI7jXDoLs5w4lYdSClUTCrzuzzILcLxcafTf1WVYPCEY+
	E+sVTcdfJ3/nFEWBZMxSmN+bP/hLBwgw3eNKzIUwBWOs6VZatvU/G+C4U3eJa4OxtmKH
X-Received: by 2002:a05:7022:b05a:b0:19c:c396:37aa with SMTP id a92af1059eb24-1ac5d1d058amr1084996c88.22.1793324384575;
        Thu, 29 Oct 2026 18:39:44 -0700 (PDT)
Received: from localhost.localdomain ([2406:3003:2002:639c:61c8:985e:fbe6:4d1e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4b08bsm2860630c88.16.2026.10.29.18.39.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 18:39:44 -0700 (PDT)
From: Yige Jiang <yigejiang86@gmail.com>
To: linux-leds@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] leds: pwm-multicolor: manage the multi-led node reference
Date: Fri, 30 Oct 2026 09:39:37 +0800
Message-ID: <rc-review-20261029-ai27-27-2c77ed65cec2@gmail.com>
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

led_pwm_mc_probe() leaks the multi-led node reference on successful
probe and if the final PWM update fails. LED registration borrows
the node, so it must remain valid until the LED is unregistered.

Register a managed put action before LED registration. Reverse devres
order then unregisters the LED before releasing the node on unbind
or probe failure. Remove the explicit error-path put to avoid
releasing the reference twice.

Fixes: 9fa2762110dd ("leds: Add PWM multicolor driver")
Assisted-by: LLM
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261016 (2efb7a11f1aa).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_OF_DYNAMIC=y.
COMPILE_TEST=y.
The object was built from this exact base with the patch applied.
No full kernel or module-link, hardware or runtime test was performed.

 drivers/leds/rgb/leds-pwm-multicolor.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/rgb/leds-pwm-multicolor.c b/drivers/leds/rgb/leds-pwm-multicolor.c
index 6365459ec27f17187804153cde6cb1805eca33e9..0ccf6839bc65f282f7c821e9fe7a50f431cc0d71 100644
--- a/drivers/leds/rgb/leds-pwm-multicolor.c
+++ b/drivers/leds/rgb/leds-pwm-multicolor.c
@@ -106,6 +106,11 @@ release_fwnode:
 	return ret;
 }
 
+static void led_pwm_mc_put_node(void *data)
+{
+	fwnode_handle_put(data);
+}
+
 static int led_pwm_mc_probe(struct platform_device *pdev)
 {
 	struct fwnode_handle *mcnode;
@@ -121,6 +126,10 @@ static int led_pwm_mc_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, -ENODEV,
 				     "expected multi-led node\n");
 
+	ret = devm_add_action_or_reset(&pdev->dev, led_pwm_mc_put_node, mcnode);
+	if (ret)
+		return ret;
+
 	/* count the nodes inside the multi-led node */
 	count = fwnode_get_child_node_count(mcnode);
 
@@ -174,7 +183,6 @@ static int led_pwm_mc_probe(struct platform_device *pdev)
 	return 0;
 
 release_mcnode:
-	fwnode_handle_put(mcnode);
 	return ret;
 }
 

base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
