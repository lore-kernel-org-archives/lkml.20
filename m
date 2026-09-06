Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9F63CB56C
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 13:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788700344; cv=none; b=SIOGUrF3Rikw+QsqszTXyfV53heACfqYVxLO6Yr9AaLUCQ4ceHU9xRAmaZeUm7x8q2lxzqp268WPXiVcS1QnaW0jS7C+J2yuL+EVcn21M1NBf84Q5/g8ly8zElkuvvSSA0egC+f0GtZMQ1cia6pjUhLWy2iw3dwZd3v+LSzhQsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788700344; c=relaxed/simple;
	bh=U/D74xfwjlQoi4TcPWdP4ton1ITDg58mY6Ce5H9y4kw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OfLiGFh6DcBNBpIljxt5p/YHn2JOAlCTid44of+JsSEc764eSLPok6lvFt0f310bflZhRtY/Ul3bDqW0qbakqt5HW5QcAKrYwJhC59EU1JbR8HCjhIwuSjiuudxQCZiKue+Smm0zXOVAnEclk5xWrXurU4SERaQRDtluSOUXTH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UHRZ6HTB; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UHRZ6HTB"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso26204515e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 06:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788700341; x=1789305141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+jOjUhdp/9Aa1j3qlkqbSJ4A0AmCxK8SeGVuNoBGBzQ=;
        b=UHRZ6HTBdy60QOVH8/yjMZnOS1/ZskwNUgpL7WW+swRJ0WNB7u6RxAwg+oQEYdr16/
         TIizC2UxBRSZClIJ9G2a4BuFqGA/xnPryZFZs7pmd0vYBe+diSR7EH3oN6RFSswP+aI7
         1/iLebcl2gunu0K9krOmWVvtdFHFVtcUlB6mDca9sNgEjie8iaGbwU2aGApQGJPJIh+J
         FcwaSCYKSEMtdFoJ29509QkxX83p4gvmKpFZh281gc4Og+P8e9NKeBZT5Yyw49VvZ8fM
         XCBOdib8sXUM15l+fK3NA2Mgi4F7rf2SWGZaSjGl9aDuHzaAYXAa2Aq///Y94LWa7394
         u21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788700341; x=1789305141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+jOjUhdp/9Aa1j3qlkqbSJ4A0AmCxK8SeGVuNoBGBzQ=;
        b=S5doIwnMfa33zfq42k+U5lUbUYA3TAyXHgKdtgCIFXqdJljlaZ6B7nuvjmLGRVtpCw
         62HVBLIFg58xDqbCubW+z9vUti0a8tB3sHEBpCMzGrtIKChUYwugowA757uzRn69ouoE
         X5gEPdB8JQoefMWJrCDlJojFJWX70a2lo3LuJ5K4nAKDItMKWXS/vRm9dv1kFYNgG4FK
         Cbt5beyNji6FQjn94tWzoJaqsKT+DLo3IEb6Y4NTeWEmLCiORI5J63PJXy8MgZpunvWD
         plfT0pbUd4Hx6n6I4WcVluiK/FDnLjEHv00P8Vn0Qa2jHEp4hDXjw+TUW3AMhNeh09os
         XCdg==
X-Forwarded-Encrypted: i=1; AKwUvBxDifPmBOD05JgN8YyJ4O5MAASSHK+5GAyVlk/tpaoX7rE36OvhqAcmcJN9Aeng1Ptfqhrsd4GzXrwYwEw=@vger.kernel.org
X-Gm-Message-State: AFuF++li4wk5pK3LF9FYQru4AUiLJlyrugXpMVHp7q5Y8vIHAtXVLcDE
	4gM1bS+E1WeVbbMGUtkyCtt1XoM/v5Febxniy8+MluSAgsrzVmB+AYjL
X-Gm-Gg: AYBFou1k1gNfkZhMuOW6YWqABRwnGb56HBHe365guCqo8ydQSpDco7M3QqbAGYb7V3F
	0oS/w6cIYwkqevCgC78mOugy2K3YGeYjBBtDgC5jiLoNHo2Sy0ieM9ZIra4X49A3aTvdgoTfgcX
	61v4KdT9/siEUJvAp1tuVA/A0/CK+fGXSV/nWGY/RVxwaOQJUp2BNCpt9LsUcuTp/58R91W1MxW
	I9oXOaIn/spzr7ABe+OnDDx/E9XYNIoMtChciLXQqWr5/6NOvRF9ugdmGVbjRFfXgiwAF+4rGQp
	XnUJykHWXuFt9ICwxUrwPy7CnyCXkTJZpw2sbGN18nZseGy4XA5PUR4KI8hyFQza6TzFviheaEp
	Sg1cotPATWBwK3op/oWff6wTvKe4WlD5vBUfAll9HtXpjdwKpA+dgKal/XY92CsRFc+JWSAgh3z
	5i/kZ43AP3fxRZWlss34779LBIWWqiBCEdzCyMjALiiIKRV7/drMjOcZhzjlvxtUzah9+XEqCay
	Xlrj2jxvXUMC9Uq47Ncn5Sp/Pn19zUFR5OuEYr2mo5KalIvAC1yuhvmsxUJVvrx2hT3PttKgnG/
	BghNRAx5bg==
X-Received: by 2002:a05:600c:8b8c:b0:49c:f13e:e52 with SMTP id 5b1f17b1804b1-49cf893b58bmr158874795e9.15.1788700340506;
        Sun, 06 Sep 2026 06:12:20 -0700 (PDT)
Received: from kdev ([81.56.8.150])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7740d44sm526300925e9.15.2026.09.06.06.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 06:12:19 -0700 (PDT)
From: Fabio Cesari <fabio.cesari@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] iio: light: isl29028: fix runtime PM reference leak on error paths
Date: Sun,  6 Sep 2026 15:11:40 +0200
Message-ID: <20260906131203.125407-1-fabio.cesari@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both isl29028_read_raw() and isl29028_write_raw() take a runtime PM
reference with pm_runtime_resume_and_get() and are supposed to drop it
again with pm_runtime_put_autosuspend() before returning. On their error
paths they return directly instead, leaking the reference.

The usage count is then never balanced, so the device stops entering
autosuspend for the rest of its lifetime. The effect accumulates: every
failed access leaks another reference.

In isl29028_write_raw() this is reachable from userspace with a single
rejected sysfs write, for example

  echo 200 > in_proximity_sampling_frequency

which is outside the accepted [1:100] range, or

  echo 999 > in_illuminance_scale

which is not one of the two accepted scales. Both return -EINVAL with
the reference still held. In isl29028_read_raw() the leak is reached
when the underlying regmap access fails.

Drop the reference before checking the error, reusing the pm_ret
pattern already present in isl29028_read_raw().

Found by auditing IIO drivers for runtime PM acquire/release imbalances
with a Coccinelle semantic patch that models pm_runtime_resume_and_get()
and pm_runtime_put_autosuspend() along the control flow graph, flagging
functions that take a reference and then reach a return without dropping
it.

Fixes: 2db5054ac28d ("staging: iio: isl29028: add runtime power management support")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5 coccinelle
Signed-off-by: Fabio Cesari <fabio.cesari@gmail.com>
---

Compile-tested only: arm64 (native) and x86_64 (cross), defconfig plus
CONFIG_SENSORS_ISL29028=m, with gcc 15.2.0, W=1 and sparse v0.6.5-rc1:
no warnings. I have no isl29028 hardware, so this is untested at
runtime.

I also have a version that takes the runtime PM reference only where it
is needed: isl29028_write_raw() validates its arguments first, and
isl29028_read_raw() acquires it only for the reads that reach the
hardware, the sampling frequency and lux scale being cached. It also
stops propagating the pm_runtime_put_autosuspend() return value to
userspace, which fixes a second problem: with CONFIG_PM=n that call
returns -ENOSYS, so every read and write fails today even when the
access itself succeeded.

I kept this patch to the one bug, since the rest changes what userspace
sees. Happy to send that version on top once this lands, or instead of
this one if you would rather have it that way.

 drivers/iio/light/isl29028.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/light/isl29028.c b/drivers/iio/light/isl29028.c
index 33deb1726689..c5146c1d9f39 100644
--- a/drivers/iio/light/isl29028.c
+++ b/drivers/iio/light/isl29028.c
@@ -340,7 +340,7 @@ static int isl29028_write_raw(struct iio_dev *indio_dev,
 {
 	struct isl29028_chip *chip = iio_priv(indio_dev);
 	struct device *dev = regmap_get_device(chip->regmap);
-	int ret;
+	int ret, pm_ret;
 
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0)
@@ -392,12 +392,11 @@ static int isl29028_write_raw(struct iio_dev *indio_dev,
 
 	mutex_unlock(&chip->lock);
 
+	pm_ret = pm_runtime_put_autosuspend(dev);
 	if (ret < 0)
 		return ret;
-
-	ret = pm_runtime_put_autosuspend(dev);
-	if (ret < 0)
-		return ret;
+	if (pm_ret < 0)
+		return pm_ret;
 
 	return 0;
 }
@@ -461,15 +460,14 @@ static int isl29028_read_raw(struct iio_dev *indio_dev,
 
 	mutex_unlock(&chip->lock);
 
-	if (ret < 0)
-		return ret;
-
 	/**
 	 * Preserve the ret variable if the call to
 	 * pm_runtime_put_autosuspend() is successful so the reading
 	 * (if applicable) is returned to user space.
 	 */
 	pm_ret = pm_runtime_put_autosuspend(dev);
+	if (ret < 0)
+		return ret;
 	if (pm_ret < 0)
 		return pm_ret;
 

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.53.0

