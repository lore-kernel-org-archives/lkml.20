Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792627315;
	b=QEGUgLeWLEVBQnq2coxPUczsipFqrOcUMmb/Bp9hHJVyo50PSrxBOXn1asthn3eRjTUC
	 izcl2b9mkBwajiC3w2UEOcmr8VYsoHdCcNm78svegPfQl5qFUFgvKkNca56CO9vlxS5Jg
	 N6dAh3JNxqOTvfjxwdHCnrMeemw7l2AsCj3Ka9V0/O/GI1eJ+jeE0IZjUANziEErim5Vy
	 Z4bk/B9phS+0su9yzxHUzdz6q0ria/+xrphL4jVDvBerpn2MHeGTrxtI/bAtAaydIiNO1
	 kojc+0s5WzV6NEUx3RcMg6jG2nVSrSGI7gon0VeZ4xPtl75jg7fNMiopurxa4cM0JXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792627315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=n3xDMUCpAKA+W1udgKw6gUi4Aniek2eVFJ0ny2jPCSQ=;
	b=TB1DQnytF+DUhBqF5WQr7k7YaYEc0piQ7mnEAomMgrSEVp2iylbPf2aRCFw/1Zl/zSIB
	 JzybW3ImM/L48OKMZCto3xeCAYuIUdr2/5Ob6fbQwt7L586YFIi5IODA/slxp+tZ+6xm6
	 oNB6VHFEM+wGzuGcpQ2KiTdTevA8lgOWiMrLDg43rLG+e/8qB3DsF76kB+w11odVStZgi
	 AM8oTlgOqjWgZFXWPxU5VPGCBRAZyPkCWolnGmr1cap58OuK+0/RU0sdz3tu/q4Re9iP8
	 gbavp18X285vTaBofRDHSL3NlowGN9XVTg70WnySs9y9OAtOmPhk5E4pOQgWWAqyfxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kvIRrwjF;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B5760A5BC7
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:01:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8B5760A5BC7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kvIRrwjF
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-156cbe59524so897867c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792627314; x=1793232114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n3xDMUCpAKA+W1udgKw6gUi4Aniek2eVFJ0ny2jPCSQ=;
        b=kvIRrwjFl/SmlvjoHbZEubwmV1VUTKswii2wq2ZZEjoyn9z+qojvyG+qmSgXdXNLPQ
         07CFtQMCqOO1ZmBsLY8ITCgQvab7T6BG59XbmrP2u9l2tvkPuelMWZBZ/o1evdAlIgPf
         IqygWD7HfNf8t1a35mOslK+V/a6f6Ijkih2Vs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792627314; x=1793232114;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n3xDMUCpAKA+W1udgKw6gUi4Aniek2eVFJ0ny2jPCSQ=;
        b=WF7oNxnnlZIMH2BrgJm/a4UmvljuYp9Qvi3if1gEOtW2FFTzBsUu56B01b5ZQ4tNST
         9FYXw5+gbVEGh8d9+Hnfnwdi6GsZ9KleoQy4jnUT2LjuaWikqw6djXbases+rgi4giyB
         izzgOUUGC2UVxIRzbIrwAd1SWDvYfLzWNg1+7ZPDsPc2qbC2RgN2UEW9aN/TaPgpMaGM
         vxInpUbt97XquDB7yaQCGc0FKzaHQYFPKS4noMNPDC84LVkkJYCOqp4nmR1nbrkBi07I
         I2MD4H+RLEuzvalirnZllMtaGVLXvKbqkbM8qXbVDJX4/I01DPp0tl96mmAUSavIhdUJ
         z14Q==
X-Forwarded-Encrypted: i=1; AKwUvBzjpg3a3uC1DK5xP3s1XdAcXEKhD3ak1Do7Y26QqwUYpPoxZa8P/jhC1uv2v3LOGIDj+u5taOl3ZlmpxlI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8HyEYXmTytiDskMnweZUbT86lobmAVLd2ay2tLsUZ4BoZbxdS
	ypNX/qhdcx5bg/cLdOC4PVFaZqhqefzmn/mYhR759kxdnpOBMCnBW2Qsnns6/jUMBQ==
X-Gm-Gg: AYBFou34je9krc11F3NsgRovSvd1ZmzawEKDFs/XRYsV/FY1r0sy/ev34Ts9cwqAY+3
	Ed0rM48o73xOOylAm9YoQoZzc1oVoyNcsAUlWdIZjepcftHJgPVucGhaf9JXcEN+RrEX5tg1x49
	EcULWBpNqITffLF9qUYEmbPdP/Putx3kefh3ZBHweaMh454JtByiN24HuxH2GLo/HCoKiCyJ6Dw
	vEP7gLoCGIN1nPhsOK3xofJbNhtfnefPvMwCwc5ZeR/m1Qrf0Ghqv28g04a0xDELuyDoQx3+B+G
	II95SCsxEjBHjXq6uJ95y73stMOBJ33RgGbekXchjaBGSw1zqrWntXzWJxh+TqM/KL+OLEvIC2c
	ffQkG6/3ghUaZLW1YdB7s5LbJBwq4omGe47g88D0yZJ1HNx1BbBlp1Y7+OPXy+HOWoYyv+Nh7ve
	CZIIldI2A6qIrnbP1M3qgfesCFMAzE3QghHvMNbn9wzjCVNDQWiUlkMciCgGqm06piCHB4X2ktY
	pgV2XbvOjKeMK3zIULPKmXf9oH49vxet14uQLJMd8s2jg53mSNrkAF2hq4h66d0HS0ZhjOd2EdZ
	pmPCDhlZScmXxdca2aI=
X-Received: by 2002:a05:701b:4194:10b0:15b:7f7a:730d with SMTP id a92af1059eb24-190a632f93fmr4268943c88.28.1792627313833;
        Wed, 21 Oct 2026 17:01:53 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:14ab:bfeb:ac88:458f])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1903d87ab1bsm10000732c88.21.2026.10.21.17.01.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 17:01:52 -0700 (PDT)
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
Subject: [PATCH v2 17/17] iio: light: us5182d: Discard pm_runtime_put_autosuspend() return values
Date: Wed, 21 Oct 2026 16:57:18 -0700
Message-ID: <20261021165858.v2.17.I2a58d2ac56600e492fd431e173bd0d67f180c6a3@changeid>
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

 drivers/iio/light/us5182d.c | 32 ++++++++++----------------------
 1 file changed, 10 insertions(+), 22 deletions(-)

diff --git a/drivers/iio/light/us5182d.c b/drivers/iio/light/us5182d.c
index ab518311fd79..98279bd1ab25 100644
--- a/drivers/iio/light/us5182d.c
+++ b/drivers/iio/light/us5182d.c
@@ -366,45 +366,36 @@ static int us5182d_set_power_state(struct us5182d_data *data, bool on)
 	if (on)
 		return pm_runtime_resume_and_get(&data->client->dev);
 
-	return pm_runtime_put_autosuspend(&data->client->dev);
+	pm_runtime_put_autosuspend(&data->client->dev);
+
+	return 0;
 }
 
 static int us5182d_read_value(struct us5182d_data *data,
 			      struct iio_chan_spec const *chan)
 {
-	int ret, value;
+	int ret;
 
 	mutex_lock(&data->lock);
 
 	if (data->power_mode == US5182D_ONESHOT) {
 		ret = us5182d_oneshot_en(data);
 		if (ret < 0)
-			goto out_err;
+			goto out;
 	}
 
 	ret = us5182d_set_power_state(data, true);
 	if (ret < 0)
-		goto out_err;
+		goto out;
 
 	if (chan->type == IIO_LIGHT)
 		ret = us5182d_get_als(data);
 	else
 		ret = us5182d_get_px(data);
-	if (ret < 0)
-		goto out_poweroff;
-
-	value = ret;
 
-	ret = us5182d_set_power_state(data, false);
-	if (ret < 0)
-		goto out_err;
-
-	mutex_unlock(&data->lock);
-	return value;
-
-out_poweroff:
 	us5182d_set_power_state(data, false);
-out_err:
+
+out:
 	mutex_unlock(&data->lock);
 	return ret;
 }
@@ -676,11 +667,8 @@ static int us5182d_write_event_config(struct iio_dev *indio_dev,
 		goto err;
 	}
 
-	if (!state) {
-		ret = us5182d_set_power_state(data, false);
-		if (ret < 0)
-			goto err;
-	}
+	if (!state)
+		us5182d_set_power_state(data, false);
 
 	if (!data->falling_en && !data->rising_en && !data->default_continuous)
 		data->power_mode = US5182D_ONESHOT;
-- 
2.56.0.218.g1ec904b173-goog

