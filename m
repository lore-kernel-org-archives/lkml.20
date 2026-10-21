Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792627308;
	b=jeRflHB88IfvAfEyHRbGg1nDR9vlCfqwROGR73khjZzWlD4arJ5IU2olzBPIK7Y/27Eb
	 P1ZurlCBdkXyMcgJK90w/C0As+KBidHl9Nrk/9yvYaJ3kMyNevtB+dOYBiU7fZlgADwYS
	 MmeJrUBpBqGswS80tCUN5HfgJAbYRJjkGeSHDLf56W29XLz1F0SqHBuJFuQRJ3I3XLBvm
	 yZwhW8EC3DH3u15BB1tocwHTQDmVabHCnZl0Y0HljotayHf6Z10dbqmd+G35ezIDHjDUy
	 6f3sGpQSLqptltf7jflsCS3yHtwczboTIEdGweSq0ZtrTsH8l7lj2CLGi9BBy+ikJ4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792627308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=blXYgQJJBizz/bz/KIQMetOyL/YCHKq3pY30hwAK25M=;
	b=sZAZzNNoxTIIsyX2/vrwg05G/gSE51Eotcl599x3Seu3SSfg21RuYfq6hyMKcgt6/IWR
	 bK4h+oyv0akFuV5WFVdJBJExNFKCN9BaciEHryE6taDlaFwfOZO8JjaEc6AwZgruAr1r2
	 uC+1xFyoUfmflx1Rt/aqAw5ptKZKLnoUn4v4nkodwV6OcsGr5X2/P3YUcEOilZi7DcVxc
	 axo54yWDPOO/kBE7iOv3t359pkGpggwTfhIKa0sLgdQEtpr/ldKoAszGibdfeu+kxER5N
	 iwL6lFQhB7C8F/vL9K+kNnAosiUDsAiKFLTomjLfD43m3HbZxeIy0cXQUgfBYdSW4jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NelsS96C;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F6F606A333
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51F6F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NelsS96C
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35f1f76ea84so1851522eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792627307; x=1793232107; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=blXYgQJJBizz/bz/KIQMetOyL/YCHKq3pY30hwAK25M=;
        b=NelsS96C6bj2mZywfkxDxSnUjkXtFur6XMZuZtSmnKGE9qGz208ajyJZwN/WEP8Obs
         anrHJKyf7UmvRRRzyIo46WLiZPaea20IsdzILDfOpEAFyprvGcC7Yyr7ub5QupGdFQN/
         Yrzx/SaJtWDcDapVW1fZIa+/KRsnLYGwgvRj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792627307; x=1793232107;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=blXYgQJJBizz/bz/KIQMetOyL/YCHKq3pY30hwAK25M=;
        b=v44/P5YBhYSHQht8jR9YJzr7wWPc7pOAM1QeTAOEa/vi1SgDwa8IsrsXNRjME1tih3
         njUk4ycOOyth28WVZQmjkjSYFYJl50v93Pb6uG/nMtlkrYAUFOVaLyBh0VBwRy770Arm
         8sbWZ//POBZdPeiU5qQ10UYX6zE56TI9syfuw2BY7xNA4C4vhbQvMGsyjOz1V5qD7KE+
         q75USgzJlrix99GeLkMmJKvrz8cT99EvhBympGGEbHv9IjfXgaB3Z4/m+GknxllfCKya
         vcrKmITwVPOt+jDRr9r5+ZznplI2/N/yhMEvMJZHLPi4gXDwFtsQH3VCoL9/onfnLfL7
         4YPA==
X-Forwarded-Encrypted: i=1; AKwUvBxe03W7F+xeHKduaIf0BexD1dUAiQBVreqYpHWvT94YyrK7oXmYbFbI9WD7RL/xjRYeKc+gZ47iP06nf0Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5dke4QU56lcxuWKqgoEGJEH6jmI58jblXiaCmuDZUfQrUtB58
	DSIfuYhZEcetYOMJtl354RNDjO5SVUnwiOzzoZktOH5mRAXL7Y0fPYPCmyjy77SzJA==
X-Gm-Gg: AYBFou38ydI813LFDX9iCvp1XbhQGG1xWWNKdBQLUd3ZMHDn71KMKHVrSPZtDZkrwc6
	DhaWIL4O6PbIS5WUMofJIUXs8hffupaXgm31t0NgYwxaoX/tXMAgBXL920Z+27+gO8UVleokkNU
	coX+uToTia6YLztbv9Fyx+5PafOP6FWsxYubSL2c7msfLaVQdjNY5tA0+jRcIagi8QYz7PLX25/
	EzHBCCECQH2igFfgYAtKRKM24czC6G5q8FGUNgYQNt0ktVy2VIfa52qjWBtxFrURITxsz0Ebt5p
	PJI6um3Ja7+bzTVBhEEurJU4KlziB088KGdMDG1ROsGmw4q33nuTAbmWzVP4OXUxIbBBy3Baokl
	YBscggW7bRzRpOTqhAaAAYXhOr4IKf3VxOXwHGCwDfiLRyCBM/KmdNE+gUHTWEZDm2OrE5q3aZ4
	TA5/5ttsUuzXdB42R6DrJUogLN8vcHj6evxCs44/mehgaEyw5iu1e9Fy8foY+44xmsoeeT3vSDg
	PXmYmysleEpnY3tvOen6xGNjlNpkLUgek3//dOWejCHi6EWxIAbbIBm0AJM0flhEDWvDzOGYnnC
	EpdJ2vNn6W7gzBu6VJw=
X-Received: by 2002:a05:7301:e2e:b0:368:8d1d:2a81 with SMTP id 5a478bee46e88-3688d1d2d90mr1563701eec.24.1792627307305;
        Wed, 21 Oct 2026 17:01:47 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:14ab:bfeb:ac88:458f])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-36740cc848fsm10851892eec.13.2026.10.21.17.01.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 17:01:46 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-pm@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	linux-iio@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 15/17] iio: light: rpr0521: Discard pm_runtime_put_autosuspend() return values
Date: Wed, 21 Oct 2026 16:57:16 -0700
Message-ID: <20261021165858.v2.15.I31ffc98637199185bab952631d880c1d38d64b7c@changeid>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
In-Reply-To: <20261021235818.3059519-1-briannorris@chromium.org>
References: <20261021235818.3059519-1-briannorris@chromium.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This driver propagates the return value of pm_runtime_put_autosuspend(),
which is not particularly useful.

Returning an error code from pm_runtime_put_autosuspend() merely means
that it has not queued up a timer or work item to check whether or not
the device can be suspended and there are many perfectly valid
situations in which that can happen, like after writing "on" to the
device's runtime PM "control" attribute in sysfs for one example.

For this reason, modify this driver to simply discard the
pm_runtime_put_autosuspend() return value.

This will facilitate a planned change of the
pm_runtime_put_autosuspend() return type to void in the future, similar
to commit 3afd8df02433 ("PM: runtime: Change pm_runtime_put() return
type to void").

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v2:
 * Split iio patch into per-driver patches
 * Simplify some conditional logic

 drivers/iio/light/rpr0521.c | 57 ++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 33 deletions(-)

diff --git a/drivers/iio/light/rpr0521.c b/drivers/iio/light/rpr0521.c
index 7d82efc31f3a..6305d7a9c282 100644
--- a/drivers/iio/light/rpr0521.c
+++ b/drivers/iio/light/rpr0521.c
@@ -357,32 +357,31 @@ static int rpr0521_set_power_state(struct rpr0521_data *data, bool on,
 	 * Note: If either measurement is re-enabled before _suspend(),
 	 * both stay enabled until _suspend().
 	 */
-	if (on)
-		ret = pm_runtime_resume_and_get(&data->client->dev);
-	else
-		ret = pm_runtime_put_autosuspend(&data->client->dev);
+	if (!on) {
+		pm_runtime_put_autosuspend(&data->client->dev);
+
+		return 0;
+	}
+
+	ret = pm_runtime_resume_and_get(&data->client->dev);
 	if (ret < 0) {
-		dev_err(&data->client->dev,
-			"Failed: rpr0521_set_power_state for %d, ret %d\n",
-			on, ret);
+		dev_err(&data->client->dev, "Failed to resume: %d\n", ret);
 		return ret;
 	}
 
-	if (on) {
-		/* If _resume() was not called, enable measurement now. */
-		if (data->als_ps_need_en) {
-			ret = rpr0521_als_enable(data, RPR0521_MODE_ALS_ENABLE);
-			if (ret)
-				return ret;
-			data->als_ps_need_en = false;
-		}
+	/* If _resume() was not called, enable measurement now. */
+	if (data->als_ps_need_en) {
+		ret = rpr0521_als_enable(data, RPR0521_MODE_ALS_ENABLE);
+		if (ret)
+			return ret;
+		data->als_ps_need_en = false;
+	}
 
-		if (data->pxs_ps_need_en) {
-			ret = rpr0521_pxs_enable(data, RPR0521_MODE_PXS_ENABLE);
-			if (ret)
-				return ret;
-			data->pxs_ps_need_en = false;
-		}
+	if (data->pxs_ps_need_en) {
+		ret = rpr0521_pxs_enable(data, RPR0521_MODE_PXS_ENABLE);
+		if (ret)
+			return ret;
+		data->pxs_ps_need_en = false;
 	}
 #endif
 	return 0;
@@ -545,17 +544,14 @@ static int rpr0521_buffer_preenable(struct iio_dev *indio_dev)
 
 static int rpr0521_buffer_postdisable(struct iio_dev *indio_dev)
 {
-	int err;
 	struct rpr0521_data *data = iio_priv(indio_dev);
 
 	mutex_lock(&data->lock);
-	err = rpr0521_set_power_state(data, false,
-		(RPR0521_MODE_PXS_MASK | RPR0521_MODE_ALS_MASK));
+	rpr0521_set_power_state(data, false,
+				RPR0521_MODE_PXS_MASK | RPR0521_MODE_ALS_MASK);
 	mutex_unlock(&data->lock);
-	if (err)
-		dev_err(&data->client->dev, "_buffer_postdisable fail\n");
 
-	return err;
+	return 0;
 }
 
 static const struct iio_buffer_setup_ops rpr0521_buffer_setup_ops = {
@@ -718,12 +714,7 @@ static int rpr0521_read_info_raw(struct rpr0521_data *data,
 	ret = regmap_bulk_read(data->regmap,
 			       rpr0521_data_reg[chan->address].address,
 			       &raw_data, sizeof(raw_data));
-	if (ret < 0) {
-		rpr0521_set_power_state(data, false, device_mask);
-		return ret;
-	}
-
-	ret = rpr0521_set_power_state(data, false, device_mask);
+	rpr0521_set_power_state(data, false, device_mask);
 	if (ret < 0)
 		return ret;
 
-- 
2.56.0.218.g1ec904b173-goog

