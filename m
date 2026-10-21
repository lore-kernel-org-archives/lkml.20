Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792627292;
	b=2/xuMFwIdW2/xYJucKzXq6mQmTan+NVPSzkU05p0qWPMp7U9lw2PRhv9MtEuvDpbn92N
	 hxOEqfV/wf9/kOkAdzzw3YhklCayHs7vECLM1uS3BCyaUmhcWbbcfiZGOvbbfOUDkn6Pn
	 4V7P/x6aLpoqvRnp71C0MBAeYXgd9mi68QtL6kGUAuOszp8Xmq0/PiVr2iS5TShz/9gkO
	 JjQYJHc4CKXQlHhnIVdIuL3OTbwlvRHILCuf1aNKy82LtJh4sqdfSaLDhyzggOgcMmwlu
	 uQH+3anDmQpqGLkdDZX0NtPBTdRupr4DRbSYA9dATlRhDRg/8mSdeg3VLi1LRBXUGxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792627292;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=x/XHFLeuklX28g57VcXmkzvZarjLghDnz4MbxZ3DLl8=;
	b=YWGhEVJRZeJHfF4Ct7fZhKL1sIwyhYOq/JYx2cOlduDEFeuxLvKabN4FCfeMzgOzrCwS
	 nONYtHycwJKYjvWDYTzZsJVeVhZDpyR4xVXAkgGRBU5r8xBEqUySN8PCddZ1qqiJmIK4V
	 DTPHMKHK87V1VsdsCH7lsZGcpz5w4JuJv9Bu31D3FoiN5MkP4Nl/EcLm24q7n+1uBzrqt
	 I8AFAYd/6ddDgxuFF7Naq7nTYoxuS+vNEC6ESYg6SWli8saKdHRSUu95Yb8w2ecqZWDog
	 jGarPfJOPy9YW8ZDcVEsNI1wts1yIEoF6hog4PxapRrZXqCU9EIq5zsGv/UPvnGqLqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=F+55gpLc;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E86360A3813
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E86360A3813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=F+55gpLc
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-16079d54c17so2378288c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792627291; x=1793232091; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x/XHFLeuklX28g57VcXmkzvZarjLghDnz4MbxZ3DLl8=;
        b=F+55gpLcgKIi59jDG/3y17J2mxJwaqdwqcW86tiRBV2JAs/BaAbfIOeFgAGyLUYzKH
         LIFB0gfg+W+YxjLa8c3aGFpPveB7TcYCc2z+T0FySZsflkSLkcIH4kmtcB1mbU+JbBIt
         tjJsT9HgE/HsItHIeujqomYP5BMBYSz5vhReA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792627291; x=1793232091;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x/XHFLeuklX28g57VcXmkzvZarjLghDnz4MbxZ3DLl8=;
        b=miUiyeSKg5wEaIvdKbb5NwDCqiq/pme5ZpOZ/V91bTjkVphGOCB3zzMQB2+UNnoeIB
         OptwEhCiV2tJbhHbBxfJ65JbcR1y8BOwzC8ihw7y35xkOQnGDV546Dtden+7s9yo8gAY
         T5QSx8QSrdsORuRG7JdYkNLZGypkTR2saP+AeIXRVccjwm2EJ/MnzHdYYix7eH7EdCPg
         dHn1urLu7MG07JpCqpiTEj/dwImCiuSVud+jDsDa6fg3I6nTK3f99mjgvlOSvjwlrsB3
         MqmparEnSEcaUOMYtAqk479fwZ0HOYTewboXGJi+Am3BeiGzk17t7kI0asdgqSbcqsk5
         eWtg==
X-Forwarded-Encrypted: i=1; AKwUvBwBqBntPdsD0guY59pHLlHAmVrVLdWZiIcMNC6fbpzI9LCQfOI1oxYCPpdKwy2ahQR50xAIEgL0pKIC+io=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7dnvlpe9Ojmek9DM4xskh84MBUhPmlvd3ucv6z5bzbKfbEyZD
	6pS7+VetUlRkUx0Qn6Jow/x1AWD+ejiEGyqOq0ff5/k2KpVT5/y6p9BbCeER64LmGw==
X-Gm-Gg: AYBFou2hxAUPN6k6Km/HBfpyH+AhQHqedEA7Ob1cd/PcFlVoSN//MYDR8zMB/ZU7R9U
	gzXeDyaH8xxxxzd80J8C7jgr6o1m+gZpOOKyD72K8pwJw5NxzGoojInlHAcUwSeSoTz/jDa4UTe
	ZvR3qcLuJKwTev8w+kSTKz8tbIPNmgqwR/vjtBReK4M/tdG8gFAgEJm0QpYzsNtvKM5ANJp7YBD
	3XI9jgKx+PBuZCeaqoensAVTGF8k3YXmi5Ve+sVCYTH+r5RU52ozIvvpj1gGfRkFNDpzkIDunS4
	22HTcmnLhtxGA62Eaz78RVss6OvCHBvWzG6kfma0kaD2PUGjq38F6zw9dC99O23UkqyDzxB4VFq
	5QFnrvirqaDSF6Sr2kpglzumA6+6mFyWNdjPOh21QvoRTYHrDfKNsncTlfln3VgtIr2iJ79pOAy
	tiaK2avVJDxZEH1pe0tZRMWGReWYZrGek99Z2qwVJne1qZu3e7FjSdp2U9JDeidKyM5AqBrEZCu
	xJBj3Y45yHD7HBD31/qe4CBGPstdrRKXu585iWWpPrFjoezrantgSXhqw9iZQBNvjEyEMZFT2vd
	qkwlnKsI4CMOJsm1SuY=
X-Received: by 2002:a05:701b:4518:20b0:143:3617:c5ae with SMTP id a92af1059eb24-1909f5c8459mr4538483c88.2.1792627291054;
        Wed, 21 Oct 2026 17:01:31 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:14ab:bfeb:ac88:458f])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1903a275026sm14432191c88.5.2026.10.21.17.01.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 17:01:30 -0700 (PDT)
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
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/17] iio: hid-sensors: Discard pm_runtime_put_autosuspend() return values
Date: Wed, 21 Oct 2026 16:57:10 -0700
Message-ID: <20261021165858.v2.9.Idbac8a0f9ecdd345191130e256e8d881d991bfc7@changeid>
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

The hid-sensors driver propagates the return value of
pm_runtime_put_autosuspend(), which is not particularly useful.

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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---

Changes in v2:
 * Split iio patch into per-driver patches

 .../iio/common/hid-sensors/hid-sensor-trigger.c    | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/iio/common/hid-sensors/hid-sensor-trigger.c b/drivers/iio/common/hid-sensors/hid-sensor-trigger.c
index 60808e2430ca..d76a6d9f04f6 100644
--- a/drivers/iio/common/hid-sensors/hid-sensor-trigger.c
+++ b/drivers/iio/common/hid-sensors/hid-sensor-trigger.c
@@ -154,21 +154,17 @@ int hid_sensor_power_state(struct hid_sensor_common *st, bool state)
 {
 
 #ifdef CONFIG_PM
-	int ret;
-
 	if (atomic_add_unless(&st->runtime_pm_enable, 1, 1))
 		pm_runtime_enable(&st->pdev->dev);
 
 	if (state) {
 		atomic_inc(&st->user_requested_state);
-		ret = pm_runtime_resume_and_get(&st->pdev->dev);
-	} else {
-		atomic_dec(&st->user_requested_state);
-		pm_runtime_use_autosuspend(&st->pdev->dev);
-		ret = pm_runtime_put_autosuspend(&st->pdev->dev);
+		return pm_runtime_resume_and_get(&st->pdev->dev);
 	}
-	if (ret < 0)
-		return ret;
+
+	atomic_dec(&st->user_requested_state);
+	pm_runtime_use_autosuspend(&st->pdev->dev);
+	pm_runtime_put_autosuspend(&st->pdev->dev);
 
 	return 0;
 #else
-- 
2.56.0.218.g1ec904b173-goog

