Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF641572E86
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420117; cv=none; b=BIpeOewIQAG38sJq7oXid3EuaaD17WMpMK6du/v7V0EKf95XcaFgwAEF1s9ajM2OfAZTEAr7vNMPaqRe22TQFmatbFx8A7NVRBJokPJuT9LjYG3crq4JNz/1ExI0acltAJb5Vc8ewt62RjHShUvZNDKJK0k2VUZ4xrGpu+l7f3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420117; c=relaxed/simple;
	bh=Dlp9dvCWyvLZX07fGEIkpoh4ovrZtz1G7eMIL8kOvVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e1eWUVhpJSLY5Sx9N55sROylky8onkIavifWUr86lq7/UJdXTbGc9n7rOMnyGl0hf2fG8XKIUu4IUNOBJ1RXzKTeerW/ImNfr2fz2OF1Q9WSyBZkDChjsPw7D4x75Kqi6Er5bcu4hdwnlTG+rBW/TxcQnqwJ0rYRZT4nHXXtJxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=dCgK8EAW; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="dCgK8EAW"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so2109205f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792420113; x=1793024913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=982z15BDKZb0isJxEAdL4PwLsO3TFCY/PrvmYCW7d78=;
        b=dCgK8EAW5WLK5QZBGNhvHjrUciwJWKp/RvJyzOH0Jnrdfs4MSxGYvivPt5P/rBve1I
         a1rKwaC5S6FQdRiv+fjZp9NuyCQrJIPpNuPvbtB9uleM9kScA5+RIllQ+/hwp96YK4Zr
         rj1nAVFcHdO/UCRF53uFFSSVvnKQz5ONEQ35OhlJjBAYYRvH/ir8MlmoVuxe+vqw6Y0u
         8ABGw8texoIHB0yOGPj/fdDiXoc3A0lwUZtIgd0Zu6IYt2kLzHaoGbQWCVp6eI3dDEhB
         M3lz8pBizC9sVFa5jk4z/LdTalD0fcpBSzwgGlvpCWGoCHsmribnrD3femyXHM5eACSr
         PLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420113; x=1793024913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=982z15BDKZb0isJxEAdL4PwLsO3TFCY/PrvmYCW7d78=;
        b=fCmL7w6K1gIo5woMg5l55NhwivYQQzFFeZMN0la4jG1uiiTbVGGOZGzmtqGTpiIS9A
         UYan1anvOqDDzWZfKAbuTyPxtlZ6vF+dEfC9++KBZ6kJ3p4p8ZRC3LZkDQxwsORqR/Hx
         jw/yNOXWb0VgdLJ9Jg1U6Kz5BOtBbzRArOlCXSKR4T5lIeB2SW+w+dk9xG9as6RztLHA
         r/t26vTaUv89K3GFTZ1l21RHaV8ck8M6A3WUhSHQpu0bHOz23rFJZaeeIawtfhS+NP7V
         xZyfR0NQpq93uqBZeBqI4BDXtXAUYWysFo8HP3mmVWTWA8cPOztoq80TARy9p4jy6Jr5
         iHAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxohsauXF6lgxo20JURbtPSdlm50tYObggovcGy+d/hFEbUcIoKH2UWszZpvUzCG3HEB7MMz1gbuN1KWxI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIc5oXdijMXYRPaLlmoitstU0yKEMdqUDn8omeFfPAZjSkUqHFn
	ddaGaaQ19cHiSY49gdsEtwkbNJBj5/ecNBuPz2iJ2KXcN7k12n3lVIsRtMr0x1W8z2U=
X-Gm-Gg: AYBFou2//hPHG4XGq5fx2moM4XIOcrljxMHL4IO5gjPTD02+n3lU1g/7lBWvIQOMnHH
	whODJXJce5U20jaLPCW+rHLL+8jE9bUsCqN34F/C+iXpnrJ6MDNkA+ofSZUukm/0kTPiamBKRYi
	rAaxy60JdwNSYHyMuaqoAuiIY+0Sq1PFd8+ujIVevEvyeRpUSpT0OfSGPQcDA0JGLqrQZd+e0AI
	i5mldqierr/PG0zWvlIlNWmuLyhxOuOk0SzcFtZmEhyPeD9GiviztGGuMzbpzBPbHVAGEQW5fY0
	5NF4EZzvYBeqQ7zyQUYBV+MStpLqccMjC/jaCPvRW6Xu6O0MgVoBPEhHbziAKlJg+uiQEf4SkUx
	yD01MeF44uBZdlvmfuj0AG4mWR0m8YsD4t9omHH6qOrW4fMY3C5KV78f1mZUhMVlTHLnBqI3pL0
	XnFgJZCxKn0Fif5iI0NtpnDjNAaCOKqbpZhCRKOLo01s+UMLlBSEOcCAk8K171lOJPOxh0CiZPv
	SCE09NrOuXt11GGIHDsfyLOWU4kA7Af02nCSFdWSPsdDpAiVXgUYdCe2qIj
X-Received: by 2002:adf:fe04:0:b0:48d:f1ab:faf9 with SMTP id ffacd0b85a97d-48e07bbe7cemr12107769f8f.16.1792420113202;
        Mon, 19 Oct 2026 07:28:33 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48dfd540bc4sm23854576f8f.2.2026.10.19.07.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:28:32 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 19 Oct 2026 15:28:16 +0100
Subject: [PATCH v5 09/16] media: sony-starvis2: Use pm_runtime_autosuspend
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-media-starvis2-v5-9-eef935347ce9@raspberrypi.com>
References: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
In-Reply-To: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

In order to reduce the time in stopping and restarting
streaming, use pm_runtime_autosuspend so the sensor
isn't powered down.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 2388105b6a30..bf14768dbf98 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -858,7 +858,7 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
@@ -1047,7 +1047,7 @@ static int starvis2_enable_streams(struct v4l2_subdev *sd,
 	return 0;
 
 err_rpm_put:
-	pm_runtime_put(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
@@ -1070,7 +1070,7 @@ static int starvis2_disable_streams(struct v4l2_subdev *sd,
 
 	__v4l2_ctrl_grab(starvis2->link_freq, false);
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
@@ -1448,6 +1448,8 @@ static int starvis2_probe(struct i2c_client *client)
 
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
+	pm_runtime_set_autosuspend_delay(dev, 1000);
+	pm_runtime_use_autosuspend(dev);
 
 	ret = starvis2_init_controls(starvis2);
 	if (ret)
@@ -1495,6 +1497,7 @@ static int starvis2_probe(struct i2c_client *client)
 error_pm_runtime:
 	pm_runtime_disable(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
+	pm_runtime_dont_use_autosuspend(&client->dev);
 
 error_power_off:
 	starvis2_power_off(&client->dev);
@@ -1516,6 +1519,7 @@ static void starvis2_remove(struct i2c_client *client)
 	if (!pm_runtime_status_suspended(&client->dev))
 		starvis2_power_off(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
+	pm_runtime_dont_use_autosuspend(&client->dev);
 }
 
 static const struct dev_pm_ops starvis2_pm_ops = {

-- 
2.34.1

