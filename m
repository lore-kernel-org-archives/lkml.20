Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792627312;
	b=yY2JRO6gPqiR+UMIGu5ZnPV21JOcRaaK2TfJhByMarT2GmT2rlRIwKqaKmsU4konNT/A
	 czMHABShv64tknZ3E1YxrcR4jMKv+8E7T21x/s/q3Fnk1B01B4oaGxA3VHyLCLBbzLbwF
	 TwM2kq953eMYhykweeigwfwRUKewdJDpQHUXoVVFIuPSz+4VryLLok7cE3iEuuQSgBGD8
	 uY6lZy3nsubRjCg1qfXAuuCmRIHR1zujiP2m99ATw2271sYSFtiyP5XH+rDwnN0d04hu9
	 lQTcP8ojL4pad0GLva3X/B83Ti6ZoYbZDhyUVKLmE4JAfq10KD+DGvczwVbMHBUgJfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792627312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=A2hj0UfttoWfWnVmfQgXmyBs/YW0e/AChXA2zyZLurE=;
	b=NUmAf3C88GrJb7UsIxIbNJte0kQxmLrQYQ1VuJ2abJ+JBEXavdPwEpX/v/5grqOcnryY
	 zlrX02ZRZmCRkdW8NMBZG06K34zcxm12aGMv8MNiasnQU43+TNRh/SDT1IWrbHMEKyA6m
	 HE6vcK5q78N0hu+hNRGELx03kkjIogGSFIwitINZsDfbz7ZyIA+O2jLQ8EMPrHSndDXtx
	 pTEjcFS24iJHOoD7QTkPmglZcqNaCVQW/10ZIpHY0YsdeQwm6zuWXJsFiVZ2YwWzsJgA3
	 m2EMRbdUd4ZPwgbSmJoFVAXwRGAQTTYiOMnuExiLHNYFWxwiElheISxQuwbDP2sSlTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=afzVRXlH;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53FE60A4AF5
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C53FE60A4AF5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=afzVRXlH
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-188406bb948so763740c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792627311; x=1793232111; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A2hj0UfttoWfWnVmfQgXmyBs/YW0e/AChXA2zyZLurE=;
        b=afzVRXlH7AyuOv6MQn72cix8RjgPhIb/LYyiVfbScV3+/W3r+nXIxRv7O+d96h6sDo
         6dtVNUUUkNbYBYO7WruxmW1s1NtFcoKPzex0Gr8p5sp9U/4RR2cKDpQrY9M8ibdCj/5S
         kF5x57ccX229im/onuXbSpaJR4+sgQuzDP6Ac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792627311; x=1793232111;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A2hj0UfttoWfWnVmfQgXmyBs/YW0e/AChXA2zyZLurE=;
        b=ewz154lggE528/PJT2Tf4KR4t91SBs4BCmZceQ06JXFqDxawmn5vGDZ0KZo1PgD5h4
         MzCF5LyLjx0suXoaQt2i+Qufo38SEUssV1QwdHdS3aUhJ/2r0ZWj1TQMHdwBrjZPnyTF
         NVY4h6vK3oajvKiDPZtR+uHcL82B1G3+pFNNRXD8s13eBe+xbsA5PsiPCbWRwDybSe/J
         UGhX0cf3SSwS6IhiVIFdVprBGIFmrV3QJImdByTZgNFw5dFIO9OyzzRigVslq7SjxKdL
         Tm829iNNLJ4i08FPl/x4rYmsYu/thbt4UBZnC64WnEYxJljSpn6vAHjOcpRWoPvAgl8G
         EItw==
X-Forwarded-Encrypted: i=1; AKwUvBy5dv8mSMmjMObnMa1XOsQi8hyGgeq7mgEbIsuSoTRDityD0A3m2BwaIhsPk5ElTGZkAi4hiBGobydty/w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxqVdDVOGjFWaLmavqQhpPR1N4UnGtjCxMtTnUa3a8dU/+nXbG
	7CCMwqrT4yD3yISgYamzFpM+l8j3V/dqvfqu+GO8wvPSXl1lCyniA8VZnCcZy1BC8Q==
X-Gm-Gg: AYBFou0+NJoZfoMNN+AlUhA1vPwzlmldAKRzJ24Av+k2r3Hjt/Zk0/2Dh+qpbv4EZpn
	0LGYdgzMTWsfXT+7qJZbb6a4/5zx0HJzcmvupVVspXICgTCk4pv1hEBq2/OoScQOg29uC4fgYqT
	rEascBF9JnjCq/1MVE0aAEt1b1Z170QZUCRMcAJ7I2Vjojw7vTb5+suX+vI28mTvsfGdqoocKul
	wL4FaG+d6hTZE7s1G47daIpBRnLo9mU95OLuTSqESaxVTONIbd2GsR1Wt+OzmSxx+MatfnJmWt8
	1QJDmTdsrCF0x7uNu1+cmQZkwGDonrfTuVWuZE4KNhEEmQAOI0SDbBtPNHdgHwa15ulTXuAvq8q
	tzp8Hw2O5a6CTISzHYqe7QvHb+5UWaFUQ8A+yDN0RCW7duBnA0DhPZ7dcPAaWlXJBP+eHzm/2l0
	H7FB8LEcoJCfq2Ev3nD14DhKE3dTOLFybxXuoiEja7zj1BIF90BLQ+Ml4eejeFdcet7gHRaU/JH
	6anPJhDON1T0/FGdF/5j7538Hq1hCC/JvYCxOPWKH+tUlkujAYvgdZpPxNFfxrlqoaTg1sCU9aD
	yCmRXyTveuSxdC5BHA3P+p+BFq0kszuObgwP2mLv
X-Received: by 2002:a05:701b:4248:20b0:16d:dd5c:4261 with SMTP id a92af1059eb24-190a7e0c294mr4435702c88.46.1792627310929;
        Wed, 21 Oct 2026 17:01:50 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:14ab:bfeb:ac88:458f])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1903a180ca2sm8704538c88.6.2026.10.21.17.01.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 17:01:50 -0700 (PDT)
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
Subject: [PATCH v2 16/17] iio: light: tsl2583: Discard pm_runtime_put_autosuspend() return values
Date: Wed, 21 Oct 2026 16:57:17 -0700
Message-ID: <20261021165858.v2.16.Ic3775fd68cac415d959c0456c4d4c36e9e5b95e5@changeid>
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

 drivers/iio/light/tsl2583.c | 27 ++++-----------------------
 1 file changed, 4 insertions(+), 23 deletions(-)

diff --git a/drivers/iio/light/tsl2583.c b/drivers/iio/light/tsl2583.c
index 2d041b7530e6..a5b2b7fb6dd9 100644
--- a/drivers/iio/light/tsl2583.c
+++ b/drivers/iio/light/tsl2583.c
@@ -647,7 +647,7 @@ static int tsl2583_read_raw(struct iio_dev *indio_dev,
 			    int *val, int *val2, long mask)
 {
 	struct tsl2583_chip *chip = iio_priv(indio_dev);
-	int ret, pm_ret;
+	int ret;
 
 	ret = pm_runtime_resume_and_get(&chip->client->dev);
 	if (ret < 0)
@@ -716,19 +716,7 @@ static int tsl2583_read_raw(struct iio_dev *indio_dev,
 read_done:
 	mutex_unlock(&chip->als_mutex);
 
-	if (ret < 0) {
-		pm_runtime_put_autosuspend(&chip->client->dev);
-		return ret;
-	}
-
-	/*
-	 * Preserve the ret variable if the call to
-	 * pm_runtime_put_autosuspend() is successful so the reading
-	 * (if applicable) is returned to user space.
-	 */
-	pm_ret = pm_runtime_put_autosuspend(&chip->client->dev);
-	if (pm_ret < 0)
-		return pm_ret;
+	pm_runtime_put_autosuspend(&chip->client->dev);
 
 	return ret;
 }
@@ -780,16 +768,9 @@ static int tsl2583_write_raw(struct iio_dev *indio_dev,
 
 	mutex_unlock(&chip->als_mutex);
 
-	if (ret < 0) {
-		pm_runtime_put_autosuspend(&chip->client->dev);
-		return ret;
-	}
+	pm_runtime_put_autosuspend(&chip->client->dev);
 
-	ret = pm_runtime_put_autosuspend(&chip->client->dev);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+	return ret;
 }
 
 static const struct iio_info tsl2583_info = {
-- 
2.56.0.218.g1ec904b173-goog

