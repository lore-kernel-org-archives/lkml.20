Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A41A541478
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079892; cv=none; b=UeIRZAtxb6J38+QyJvcLoEkl331GkVs115WzN/Us6z26UvPeUyHiZ0rlOdiM/08jFy7uDzsX1dBWIEMqr6L4kNLh/cqWwkEP47+w37xBxJ00pKiW329baWVjKul4IKhr9W6yuhyFmX5E8CyT1SoEzOsJFi2hBC4Rul0x49P5il0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079892; c=relaxed/simple;
	bh=WzSHl5a/H3/js9LTMTbl8ld/1JpeiIURXE0YgudYnNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KC05ZvGA73lNXuanIx0xW3sGEFi0wTwhBxgbVfhzEBiPoy/ZmPhEDbWcdfLgRXtO+LmMHp6wA45fNo/se2oameBJNKk22Raokn0Gum/3/aimsEHa+FHSRSW8Y0UWkZbTSY4ZJGahbra85vwLvY8xMPJVWMDRdCP7B8BGkm0f6Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=VaQxSVfC; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="VaQxSVfC"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c4d870d54so3515827f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792079866; x=1792684666; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RO/skbJbno3lgmcwBPXIqDfSZdYNz13tL9r2MUMGxaE=;
        b=VaQxSVfC+jeB28fPXmVh9hg35errO3WnOqdKN8MejbqmlPGohBikitpINRHnI6oTVG
         yOJui5wzENkF3E5Y+qvjcF4lMhPAJFZ8tJ89Q54t0CvbdnG/BRryUJDTxac4gvcaoXcy
         UwoQmNEX8x6rO1xYduXu4BHExyffAJwcrUwsIHYoQgNOWVPFJS7j03iOfDEKP3nD8Kga
         DEVBE1W4Tr5lqK64QCzBDt5VmDfUuquqqQgtvi94du8mZwe9LMc3BlysnAoybELPhWPd
         p9yanZTq15M4sd2WU1PLLTOr6EOWoPbEI9ijxxvQ+CtyeBIj63Jf9WdfyinmGh7SimQ8
         IlKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792079866; x=1792684666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RO/skbJbno3lgmcwBPXIqDfSZdYNz13tL9r2MUMGxaE=;
        b=w+DS9i80O++RaSpzAH6aXMtY7oofpkCR+UaLR+rHzVwERZJHZ0WvQe8yiKXmUsDBgG
         D+6aTUOr0LM5lkL1V7ALa3qzBsXHE9c9hGaQRJRzrusOZoT+tXsRUEtaOwNp4/mvwngL
         +4UJdvjJYpdc8JmuOs42bzqWUIFQIPrtwqAExH/1DrRMK/OSaH5g1ExHRlNhgDIozwTf
         P6FZ6Fr5lN2lIxd5em73Kd4EhNiBWA3wVi/cMd2e6WB84TprGEEAgKwV8o9SGLM0r3hg
         zCIGynyEfegYBeaw+2DhnQC9ngHLjLBMnhxxgbGkWKVXCW/yPsDdVEcVEc0/BRPGvAZK
         o0bw==
X-Forwarded-Encrypted: i=1; AKwUvBxg15shm8sUGE83oPGVlLGWpAy7/32bMrnEi5uQMtVSDeeLYkhqMqHFPp9n3vodICgfNtwilBkdpo4E6B4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0dza8kWMl9wepUXSLv3LuFB5i27wycRFJbm/vgx5O3AX3/MDk
	hvlXgxSqZJUpitlcA4CdG+QCh7n7frvFWiKHe1vMNDQpupg8nAkdRglk5OxqcBRoEd8=
X-Gm-Gg: AYBFou3e5jpKYwaxrdg6Hwoyy2vUO+CXKOCsleFlXg7FAQLf1fPhjpdPSUn1/yCoZGs
	oF6hAEbvoXgBn83RB9sdJPBhfYJ9YtvVTWbTOs46nU3v/YdOcvbtvur107qIk1uKkV83PAlrVWk
	s8PFBJt9lbis7haKmHFWBtbJ6bE+jkj6CGf97EK4UG5eZKJ2joqnuQEX5bvsRco0SN59zleUumT
	tl6g/NwnPzShk15LRt7CKg3ffHcn1cpDWY2UFPSosRINakT9L8JZKFvHpGRnbZ/IfelH8A/qXrJ
	raidx6BY6G42cXBssMvGTZQZs0ZmfjZEnTUcLo1SHGqvXU0dRUpp8lmQWf4sMP33tOuHrTcfYEr
	3wfPUHp9Dwxlr/5PjKLAFsy9xrdNAOLVDe/VMJ6afPm6fTleyAW4qwPKDAXIElP6xGZVAo52z+r
	LE9jSB8GzATdDBBnfFe0edOX/GYzHBXlEUtLMMpT5A4n5E3Tl3s3xQ0SciKxeJ58eUb8Snz/wCw
	t3CwXUAKC0qdgHE5lGks4jdWm326wz9A83RxRXy0TP8T4ZkLQ==
X-Received: by 2002:a05:6000:2610:b0:48b:60a:760c with SMTP id ffacd0b85a97d-48dbacdbca4mr39528635f8f.31.1792079866485;
        Thu, 15 Oct 2026 08:57:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaaaebsm19877251f8f.14.2026.10.15.08.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:57:45 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 15 Oct 2026 16:57:35 +0100
Subject: [PATCH v4 09/16] media: sony-starvis2: Use pm_runtime_autosuspend
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-media-starvis2-v4-9-75fcdb4163f3@raspberrypi.com>
References: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
In-Reply-To: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
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
index 49dcbda9ecdd..dce150304dc6 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -858,7 +858,7 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
@@ -1046,7 +1046,7 @@ static int starvis2_enable_streams(struct v4l2_subdev *sd,
 	return 0;
 
 err_rpm_put:
-	pm_runtime_put(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
@@ -1069,7 +1069,7 @@ static int starvis2_disable_streams(struct v4l2_subdev *sd,
 
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

