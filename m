Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283529;
	b=0NxN+EbxBbEOvo8RkqkoYnPiLeohCpMgOPtYXNCuekenA9+BnlPAGcBXeLIo3Sd/F64f
	 zuAaWpItKi8UpqMypOElOsAdVtLQl/syINF4NlsbfhSV66f4D1PNiwSjQW0UcA+lcajUS
	 fPMuSKp+nht4yGmuaVrb1jHNIOMJspxux7nW7wjQ18Ite8pOoSThi7HqBwD/r9HQaKujF
	 P0MpJTywxWEATx2PZ/p43de4WeOe8UApfGeWh2Aua3Em61Bj+iIDK2LX5IuywQU9s6Wbv
	 pKOY7NQAP2v/xOy024AauoXFW4fLiJDao8yo/VGQCX/q+iedT/kGUd3QFrSDLG4ZCOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9mhEjzlz7Jj16x4izypj1+gLbuZfUyq1nl602Q0+1VM=;
	b=FiOAtmGP2ZjL97pexJzVEHUFBtfQchVuhUJqBm055Y9eggP0RuowQUUaGwc5xUQYOotu
	 a1zQkbLp1Ytt55EL+o2ZP4CNj47b30Eoj4MVLPMtQU+PSIZuYJHouU89/YeBnG3SQ+OTZ
	 vVlKBz3rf3V1/0Xkr+T1bCXkkdxoBJcSqi/hHjIW1mhU1iS6KQnY0ualv6iPpS/yFKCUS
	 VISKCoCTcVyHwYoh0jSbJ0Jeqx8YGzGo2s2NlGGmXMXdaug6MQGaQ2Xsf6OEUvKHxP58w
	 24h5XZlbmeD4qh6qNiTktKAOna6GsGNlHM36DQ9k9tFLAuG0i0nhH0RcpbyS6hrDVEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=VuQ6YNnT;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C874560A383C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C874560A383C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=VuQ6YNnT
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so4480815e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793283527; x=1793888327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9mhEjzlz7Jj16x4izypj1+gLbuZfUyq1nl602Q0+1VM=;
        b=VuQ6YNnTgDGal7pGqxbb1jp22zdKuxq84mqOZgLbuQgfcCXAq7kjDq40hUZqQDU8+j
         jY1n2Spkc/iBS0mf2p2iS6jiCK0tW1iLr7zKQwh50pWvRu8O477NaP7KnfdXYX01vw+f
         mP0HcEmNQV/zTn62hJ9kvtSzZuC4BMYhlWlEsECmoKXpKUYNgHnQPpqU4NWsdtXtLBsW
         kekOnOsfI2DCSeoG1jhAvHw72xG1XLW6GOjnUaktvxYr/aNAHsYp0UQrMQosi2n3UQtx
         G0J5XbMLH+sRu2GlOXeqOKKEdQiLIELi24u+XSqEaL7AY0xPkBaR9s0e6EAoTk/BKYF6
         QXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283527; x=1793888327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9mhEjzlz7Jj16x4izypj1+gLbuZfUyq1nl602Q0+1VM=;
        b=c7oFyl8uxqHGCjmtilVwO41dQDW6wcfYLuyR+P92XXy4Gs51v4LRUugbBvF+igaNQn
         aKU1jkB3lcPKnJGH01VULxD497YgXQVrmTBqXQPYhhRiWepkJoP8aCdFQjpoe84VEpRZ
         ys5dwky4fPBeWfB7bSTGBXoEAtJQuJlpiD84p/buE1oWjsWaTvHoHrJav9EWdm++nl7F
         Zz4vGhqDigFa2iqth15HG03Dki3vzo6H+G9BUIPow5dgGRCwhH7a/NhhX8t61IYGyHuU
         E2DFy2oJSi3lMOIhpSKpZP6HS4h/IV/U7UGSH+kIMf80LmueA2V8rsS5nrLUpv+fytdK
         c9ew==
X-Forwarded-Encrypted: i=1; AKwUvBwxa7FI2M4onHxwWK96IdCuIsS4n5dkv0aLuEcPuqqT7FmTdnVcJWNefeQnvIAnU79S4quYKWx7b1dU9Xk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpWSdQZMxSvoE+F1dFdkDHeQpuxxinyqQW07mm8vDh+2ULPQau
	ZdEZxbUWCuMtCtQInTzEpvxQ+/IHRhrhpP/mNrsi5lAbhpGK7Hdkz7f16qLBfHROzIQ=
X-Gm-Gg: AYBFou2gygCqx2hLli1bsxADaSVldfw0S2q6y3A3fsJ0Jcxmou6RM+7ACcUFq48/brU
	JiudWRNgYpRQFvBo82H3dwD8FA+LGCv30MWuUtjdDk3eg+hIui825YNjxhQYAfk7UE/alu1j81t
	/hiM1Ect0mny2envz0oUNG5SeMbudw7jtq3eIFoVa5vrJDi8Vz6v9ZGUcQKJ+auUeETYfvCrWmt
	EHBvhB6M9rHcLm37ZJ1bmm07tFVX/wj2tcoU03FYFtaj0QtunqdUkf28LkCipVdPe3Ogmluabu/
	9CgEj/BhPUong7oeWQOMBQwRIRhR3ZOfV6hMBDQUs3mVWjH+GR3Hc/o/BHCQc5t3TY07sUzfgkd
	skCxtkR+cX34Y2rLSWJ4wH+SFD0UCKJOgnQddEDy8cOC2bpxz2C6FGhpu2jPQXqDCGq8JT4TBm2
	ygQx9ue66ezYppRlm3p8HHyarjjykQnEIWHbEd92IK+Yuh2jw7mnnp5O8esFepi+WDFcZG9caub
	BP9QJBOOoT9OzGC9W1x0mPCeI4sJ1XwX/UEDo8W93EHbEy/2+7ckpUz543Ty0LIsKjm9vVMEUzA
	ZvuLbZAFrfZo6GgRmqlRILUtnGoVEwk1hPlTBfOOUnAs9m6azOS99SG4j/6yQnPmj8K/IR7kQdw
	JnVEO
X-Received: by 2002:a05:600c:3144:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4aa8823df43mr66919615e9.16.1793283527182;
        Thu, 29 Oct 2026 07:18:47 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm66702755e9.11.2026.10.29.07.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:18:46 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:18:30 +0000
Subject: [PATCH v7 09/18] media: sony-starvis2: Use pm_runtime_autosuspend
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-media-starvis2-v7-9-b33a1332fdfc@raspberrypi.com>
References: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
In-Reply-To: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
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
 drivers/media/i2c/sony-starvis2.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 95da8a9e671e..27357cc293be 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -858,7 +858,7 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
@@ -1049,7 +1049,7 @@ static int starvis2_enable_streams(struct v4l2_subdev *sd,
 	return 0;
 
 err_rpm_put:
-	pm_runtime_put(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
@@ -1072,7 +1072,7 @@ static int starvis2_disable_streams(struct v4l2_subdev *sd,
 
 	__v4l2_ctrl_grab(starvis2->link_freq, false);
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
@@ -1447,7 +1447,10 @@ static int starvis2_probe(struct i2c_client *client)
 				 NULL);
 
 	pm_runtime_set_active(dev);
+	pm_runtime_get_noresume(dev);
 	pm_runtime_enable(dev);
+	pm_runtime_set_autosuspend_delay(dev, 1000);
+	pm_runtime_use_autosuspend(dev);
 
 	ret = starvis2_init_controls(starvis2);
 	if (ret)
@@ -1479,7 +1482,7 @@ static int starvis2_probe(struct i2c_client *client)
 		goto error_subdev_cleanup;
 	}
 
-	pm_runtime_idle(dev);
+	pm_runtime_put_autosuspend(dev);
 
 	return 0;
 
@@ -1494,7 +1497,8 @@ static int starvis2_probe(struct i2c_client *client)
 
 error_pm_runtime:
 	pm_runtime_disable(&client->dev);
-	pm_runtime_set_suspended(&client->dev);
+	pm_runtime_put_noidle(dev);
+	pm_runtime_dont_use_autosuspend(&client->dev);
 
 error_power_off:
 	starvis2_power_off(&client->dev);
@@ -1516,6 +1520,7 @@ static void starvis2_remove(struct i2c_client *client)
 	if (!pm_runtime_status_suspended(&client->dev))
 		starvis2_power_off(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
+	pm_runtime_dont_use_autosuspend(&client->dev);
 }
 
 static const struct dev_pm_ops starvis2_pm_ops = {

-- 
2.34.1

