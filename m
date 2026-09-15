Received: from mail-pz2-f28.google.com (mail-pz2-f28.google.com [74.125.228.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D999545A2B4
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789460563; cv=none; b=n33V6KQ0smpURWYuakQfpKTFAEYfwavOM1f8/QlwtUbCMrDIhzy5rUabGSJNhJpfe/6J5j/tJfnppapsvvBl8wmzpKW99dbQ7+2oBEWUE3B0lmbZBnTg1cC1I6UMwVBf+9T2V82gOhVBq0AhYpUw6FYLZnW0vS72jVkGaLtNoz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789460563; c=relaxed/simple;
	bh=C9KYtPlI7ZMCyFQ9z0YFTlmCZFRzUMM33buNbWt5z4U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p03Q2V0gkkj/mRIDSvA+Kh8m3xxXVJ8zTaOuB5TmivBqHXQdoaq0tu8gpvlVIK4Vf1QOUVeusyG0fUpJNsyHxIp60RuOxNi6YoFUudRZId96WT4UpynVprTTJM5JF/d9nrU0aV7Jr1EezLKXXy5pgWo5X6JG0LFah2agCc9fCsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ELK0ebjI; arc=none smtp.client-ip=74.125.228.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ELK0ebjI"
Received: by mail-pz2-f28.google.com with SMTP id 41be03b00d2f7-cc4ab4fe290so713379a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789460561; x=1790065361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vnJp0gFL0rnbjTXBsTtZtrnRTdihrTDqa0f0ZnMfF0M=;
        b=ELK0ebjIerWSvbTWmvxCOMc++ii+a61Ul0rJ1Z8Arju0vBNDUk3FS1CD2LKG8PvkRq
         f3qFcDs8GnIk+DSQJW38UXFMyE3euIlVR0E8/BWBjTAzmHV1DJCDyV6YoxWquL69hL2c
         218vBGhDlb8jEgAG12xuGkUWuVwtrtOdTN8xBNMJgou9ke2V3dvBzjM+VIzEbgyOpj0o
         lfmh1QGBkgSsca0VyrDiGAvpqI62mKsyICApKjxTp+UJSg0bqx9xXqxAfZQUbZ3T0uiB
         juBwC+NUuKqEODdkVxBM8HLHAiVn4T8XJTjyp4vvbuqG7CcEdULzDoYJdtvpU25Ji1To
         FpEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789460561; x=1790065361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vnJp0gFL0rnbjTXBsTtZtrnRTdihrTDqa0f0ZnMfF0M=;
        b=FM84wdJ3itYxerxH7Zcr0D0zKwgNV9dBrBLxlUaKzk4FMoBdv6+fcCpIILfl69wHl/
         9aWqRMwtq6Tb1lmoQLeYg4YFKJKlteUdfg7rEA1heLs0a2sX85VHKx+ZqTTRUr3mvKBa
         44BxG59jnV1xFxRsRIS5CrYPWNU3/w8fiMfKTp9lyFKYi4lXYIyK82F//xQXyeTHxvzD
         njHW6CjEg54ptLQar8OwZxO1HLISI0q0kxP1EMTBiaGEpcMhyl13DT+iX0+TkO0hyRMN
         6NRjp+YCuHrq872pUdgjvEDnqh+FvA05mjNY+zkXeEnRIUR/0dLGl4uTKlElAYjfoJ/B
         mSSg==
X-Forwarded-Encrypted: i=1; AKwUvBygEZmtnEgAIdI6dh/uYC6ioeib9BbbnWbRapiSjMuliAObUY3YZi7zstgEDmiU5/xMaficqQfreNTpZME=@vger.kernel.org
X-Gm-Message-State: AFuF++nPruk2JOmMaIjtw36FPNJyrUXcgKxgEUv9d985ZipKtRz9neUx
	8iZ98YDou308Op6bpc3aCPwJFBz8FqTOq9gAANwCM2E6lgHn274G8RNe
X-Gm-Gg: AYBFou0pTxYF6FjylT9rcvOHOD7a9uKJF3MIxZ0sqkFGaThJLREWu0goGVpy4W72S4X
	6BC1GWM9EDoczpjNrIi86IR+QSav+eLAlSVxqL6JL2pfzLfHphsJHoSC07zro8zMEfZui+92TJU
	S1NvAMElHVmlWaxV3ieOhj5l0zhnoP9gtru3yYIRySIJfg6CRX1Mg1LS1oJwiuY3KSStQdxNbfo
	U6VJEFXUMeWD0n9ZSaABwMCHBSsznz9wtPFEm0esJTvBSaELGggk99dxL2QubGRBpzMUEzWrgD6
	tD5smq2Wo+dUZBv8k28j2VUHVJ1sg9bS4ySuARVnzU54aihRlINieSeHkyICm0O7rwOgLoCA3di
	/RP1ZSxTYBLneCxpsl0aCCUOZx5Cx4zKFmoXaQCnPqGWDikrUoZSZ55P768uCnFDM4ds01WiJqW
	ld+hc9n0y+Z5aYDBNaN3cmJHQLDKA6ql9mHvJjcfD7eXaQZ+9R6V80CQ==
X-Received: by 2002:a17:902:ebd1:b0:2db:2c05:5d92 with SMTP id d9443c01a7336-2dd764ea0abmr38594445ad.8.1789460561120;
        Tue, 15 Sep 2026 01:22:41 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cca26cdsm63466485ad.7.2026.09.15.01.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:22:40 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Benjamin Bara <benjamin.bara@skidata.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: i2c: imx290: fix runtime PM reference handling on probe errors
Date: Tue, 15 Sep 2026 16:22:29 +0800
Message-ID: <20260915082229.2235439-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx290_probe() takes an initial runtime PM reference with
pm_runtime_get_noresume(). Historically, the probe error path balanced
that reference with pm_runtime_put_noidle().

The change that moved the successful-path pm_runtime_put_autosuspend()
into imx290_subdev_init() made the initial runtime PM reference get
dropped once imx290_subdev_init() is called.

The longest probe error path, however, still falls through to err_pm
and calls pm_runtime_put_noidle(). Failures from imx290_subdev_init()
or v4l2_async_register_subdev() therefore decrement the runtime PM
usage count a second time.

Move pm_runtime_put_noidle() to the imx290_stop_streaming() failure
path, which is the only error path taken before imx290_subdev_init()
drops the initial runtime PM reference.

This issue was found by manual code inspection.

Fixes: a92651b8e288 ("media: i2c: imx290: Avoid communication during probe()")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/i2c/imx290.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 21cbc81cb2ed..c2cdb1557dea 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -1634,6 +1634,7 @@ static int imx290_probe(struct i2c_client *client)
 	ret = imx290_stop_streaming(imx290);
 	if (ret) {
 		ret = dev_err_probe(dev, ret, "Could not initialize device\n");
+		pm_runtime_put_noidle(dev);
 		goto err_pm;
 	}
 
@@ -1662,7 +1663,6 @@ static int imx290_probe(struct i2c_client *client)
 	imx290_subdev_cleanup(imx290);
 err_pm:
 	pm_runtime_disable(dev);
-	pm_runtime_put_noidle(dev);
 	imx290_power_off(imx290);
 	return ret;
 }
-- 
2.43.0

