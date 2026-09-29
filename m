Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7827452ED5E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790689610; cv=none; b=Rnj7V60WJxGCvlDdeI0VQfZpt+9FZlUKeC6RDAYkYYj6ay582TCYVfJslJbNyrtzbHsBG6wA41j+FkTYdUWbiHlVDsyR0sfqFEodQcp67a9l0d663OXVrUabWYX/wPnO9S4D5fPrH+CkZP1E7HkNSHssb8RX43g/YYs89YP3bbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790689610; c=relaxed/simple;
	bh=Za+HJYK1E43xDzddYmqVfuv17VQb25vK3pN9AzFy5xk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ThVc+B98T4XbMQ8+sw9fPsnoumwnvyqEHsQgZLSDBq5+HXiORm5HJw1PS6cx1iSGAa8ug5Hx+Z7s0DLFvtkZ2/tj6g7DAg2dBzN/Nunl3jq0BnzmYRrZ8fBwmpQTg52f7g8CMT3PFdd1QyswRJzcNPwbv5aYShvGZ2ktvJXjjOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nlxgCQg0; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nlxgCQg0"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc750a1482fso2305516a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790689608; x=1791294408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Bj68ooP5wtxyCAiyK2LzTDyYvhmr7H1ma3tEIFx6GY=;
        b=nlxgCQg0Cs0LOYIgHdrJ2DMlCo8TER35eSbQSlCkitLWZnYxbkc1A/jk7ICGq9wQh9
         unS2mtLw7hVJwaGc8kEblJs4KZx2gq0qi1MQtFQsb5IDtandgSBksvDItWC6Hf1adCYo
         VCXXgWJKPZk8OSgtCOTBrfKl0G1NZCfZVUG2V/zzs6Md9hLrzEb4kLUNFFiqJt3IRe1h
         Hg4U9LetEaGbNtS32mepKX4yBZ97IWL+KRBeiscL5fzVRNM8IunobVNpM9cWvahiI+aL
         n3+zOKVBnfTQlbjqm6pS1TdTceWGnc9skjPYQqzrNhd5xYQutwVnuZSWeEKsJi3kaAxF
         YM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790689608; x=1791294408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Bj68ooP5wtxyCAiyK2LzTDyYvhmr7H1ma3tEIFx6GY=;
        b=oeFLOTx1n8+PX/3wfHk06RERC7l1Euthj7mamEM+bzIeZZNLDYTTPmQPndOT46RQq6
         U1B8hc3QnY0uS4xa9+6wT/cQlxs7ifGlbBp7ayYGpJ1Oa1uMw/zkwn7mzijM1I/rBX2Q
         yNSjkLW0wkaQZHC2GhKHIPQHNtPGoZxaZ939mYo0C8zg4tXhKAqbZR1TsViv5aclcx5D
         aTQNmTNv09dEqKtA0hmJ1CXim8pBOBMZBi7LA6pcbV3Qxv0nbuaus+Iz0s7C39/PouDh
         Dvn0BxuP6/V9bmn9vboYi38CJALKaGY4Uzp3OKK8NV+b7/n+1oZzX2sReuUoFX4dzap1
         Eh3w==
X-Gm-Message-State: AFq9FYIoz5Trj7uyXucbI4WN5QS1HEUiqqk9uTb9Kp95CcWp2pRuEIhq
	Nw7WDZY5ab1h/K+uvIZUbCXLDA0WJv3cgUrJDlyfllWw80jb2GxKHB4oV1qLbONo
X-Gm-Gg: AYBFou3A25db6xQ5/g8/54ad1ME2OyFr32OOpWcJztGSAeO7qIgIPRoZKn6gmgwddM+
	KFapK9Jt+Wd+wFM2ZuENX7gaJdvgBpJg6yRltxKpJyuHtpXeneCwIlwnSytYbRJgtP5gkCdJ9B4
	uesJv9Uv7KI2iN3AiDEssviD83pDir0awddaNRrstTEf/j1sMiBPkT58BsasQ8fpB46UJB8T83p
	ysMp3tGpVic790UdGttrNvPlWDjK4SP87L6yt3qlX/OJxh6U1a3rJxq0oXP3dc46F5ARJpTetcC
	q00ObiFqWs9UoQqSuhReb4tuQn+8MNBIW+2c32zM/IepqiINB0qS1/Hxzo2agUpMZU8HzJwUJ54
	MaysW5XfTmhb3+sza4mdP6lT/zjWkrNaqyErRd1jULXkvFfgoU1XXn2oYJYlzPNrDrq4ZenSTct
	jAOFKlLyBW7tOEplc5nlj8fCSethwCpseE23sHEMSDJECCYYw3QuoftzJTzOnsB1aGXRDxJ9bKf
	ttqrJ21d20zBvzAK0Cig3I=
X-Received: by 2002:a17:90b:4b12:b0:3a0:8050:2ed1 with SMTP id 98e67ed59e1d1-3a0bb6596e8mr11498284a91.63.1790689607720;
        Tue, 29 Sep 2026 06:46:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a497d9b117sm6092957a91.3.2026.09.29.06.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:46:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 7/8] watchdog: core: Fix unbalanced module_put() in watchdog_open()
Date: Tue, 29 Sep 2026 06:46:34 -0700
Message-ID: <20260929134635.2567137-8-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260929134635.2567137-1-linux@roeck-us.net>
References: <20260929134635.2567137-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the hardware watchdog is running (hw_running is true), try_module_get()
is skipped. However, if watchdog_start() then fails, the code jumps to
out_mod and unconditionally calls module_put().

This can cause a premature driver module unload while hardware timers or
interrupts are active by dropping a reference that was never acquired.

Only call module_put() if the hardware watchdog is not running to fix the
problem.

Fixes: ee142889e32f ("watchdog: Introduce WDOG_HW_RUNNING flag")
Assisted-by: LLM
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/watchdog_dev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 31567ffbfc23..24488c20539a 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -937,7 +937,8 @@ static int watchdog_open(struct inode *inode, struct file *file)
 	return stream_open(inode, file);
 
 out_mod:
-	module_put(wd_data->wdd->ops->owner);
+	if (!hw_running)
+		module_put(wd_data->wdd->ops->owner);
 out_clear:
 	clear_bit(_WDOG_DEV_OPEN, &wd_data->status);
 	mutex_unlock(&wd_data->lock);
-- 
2.45.2

